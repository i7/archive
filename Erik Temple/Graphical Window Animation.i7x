Version 3 of Graphical Window Animation (for Glulx only) by Erik Temple begins here.

"Allows the author to define frames of an animation and show them in a graphics window at a specified frame rate, either once or in a loop."

Include Version 6 of Simple Graphical Window by Emily Short.

Section 1 - Definitions

Include (- 
Global animation = 0;
Global loop = 0;
Global repeat_frame = 0;
-) before "Glulx.i6t". 

Include (-
Global start_frame = 0;
Global end_frame = 0;
-)

A glulx timed activity rule (this is the graphics update rule):
	perform graphics update. [This hooks into the HandleGlkEvent routine as provided by Glulx Entry Points.]

To perform graphics update:
	(- GraphicsUpdate(); -)

The current reel is a list of figure-names that varies. The current reel is {}.

To empty the/-- current reel:
	now the current reel is {}.

The current frame is a number that varies. The current frame is 0.

To wait for the/-- animation to end:
	(- AnimEscDelay(); -) 


Section 2 - I6 Animation Routines

Include (-
[ GraphicsUpdate;
if (animation == 0) rtrue;
	 if ((+ current frame +) > end_frame) { ! Final frame of animation reached
		switch (loop) {
		0: ! We're not looping through the animation, so end it
			InterruptAnimation();
		1: ! We're looping, so reset the current frame
			(+ current frame +) = repeat_frame;
		}
	  }
        else {
           (+ current graphics drawing rule +)();
           (+ current frame +)++;
         }
];

[ AnimateFigures L fps loop_op;
	start_frame = 1;
	end_frame = BlkValueRead(L, LIST_LENGTH_F);
	animation = 1;
	loop = loop_op;
	(+ current frame +) = start_frame;
	repeat_frame = start_frame;
	glk_request_timer_events(1000/fps);
];

[ InterruptAnimation ;
	animation = 0;
	loop = 0;
	glk_request_timer_events(0);
];

[ AnimEscDelay key ix;
	if (loop) rtrue;
	while (animation) {
		glk_request_char_event(gg_mainwin);
		glk_select(gg_event); 
		ix = HandleGlkEvent(gg_event, 1, gg_arguments); 
		if (ix >= 0 && gg_event-->0 == 2) { 
			key = gg_event-->2;
			if (key == $fffffff8) {
				InterruptAnimation();
			}
		} 
	}
	glk_cancel_char_event(gg_mainwin);  
];

-)


Section 3 - Animation Commands and Rules

A glulx picture selection rule when animation occurs (this is the animation frame selection rule):
	internally select a frame from the current reel;
	rule succeeds;

To decide whether animation occurs:
	(- animation -)

To internally select a frame from the current reel:
	now the internally selected picture is entry current frame of the current reel.

To animate (L - a list of figure-names) at (fps - a number) fps, looping:
	(- AnimateFigures({L}, {fps}, {phrase options}); -)

To loop animation from frame (RF - a number):
	(- repeat_frame = {RF}; -)

	
Section 4 - Commands to Alter Running Animations

To stop looping animation:
	(- loop = 0; -) [The stop looping animation command allows a *currently playing* looped animation to continue to the end of the loop, then stops it and displays the currently shown picture.]
		
To loop animation:
	(- loop = 1; -) [The loop animation command is probably of limited utility, but is provided for completeness. It can be used to transform a *currently playing* simple animation into a looped animation. The command must be triggered while the animation is still playing, which would be very difficult to control.]

To change the animation speed to (new_fps - a number) fps:
	(- glk_request_timer_events(1000/{new_fps}); -)
	
Carry out going (this is the stop animation when going rule): 
	Interrupt animation.

Carry out looking (this is the stop animation when looking rule):
	Interrupt animation.

To interrupt animation:
	(- InterruptAnimation(); -)

Graphical Window Animation ends here.


---- Documentation ----

Graphical Window Animation allows an author to animate images in a Glulx graphics window created and defined using Emily Short's Simple Graphical Window extension. Building on the hack described by Adam Cadre in his Gull documentation (http://adamcadre.ac/gull/), it uses Glulx's real-time capabilities to manage the display of individual images, producing an animated sequence. By default, the extension is set up to display animations in response to triggered events within a single room (such as button pushes, characters speaking, and so on), but can easily be configured to display animations while moving between rooms, or to play an image sequence associated with a room.

Graphical Window Animation version 3 was designed to work with Inform build 5Z71 and requires both Emily Short's Simple Graphical Window (version 6) as well as her Glulx Entry Points extension. The images used in the example below are available for download at http://www.sendspace.com/file/wcsqei. Two other example games, including source text and image files, illustrate more advanced applications and can be downloaded from http://www.sendspace.com/file/lzlaro. 


Section: Setting Up an Animation

Graphical Window Animation uses "reels" to organize and play animations. A reel is simply a list of figure-names (see Chapter 20 of the Inform manual for information on lists), and the author defines them as follows:

	The example reel is a list of figure-names that varies. The example reel is {Figure of Rider 01, Figure of Rider 02, Figure of Rider 03, Figure of Rider 04, Figure of Rider 05}.

When the animation is played (see below), the figures in the reel will be shown one after the other, in list order. Each entry in the list is thus a frame of the animation. Note that images must be declared elsewhere in the source to be used as part of an animation reel (see Chapter 21 of the Inform manual). Once defined, a reel can be manipulated using all of the capabilities Inform provides for lists. Any number of reels may be defined.


Section: Playing an Animation

An animation shows each of the figures that we have defined in sequence, at a specified rate of speed, given in frames per second (fps). Animations always play from a reel called "the current reel" which the author should set before invoking the animation:

	now the current reel is (name of the reel);
	animate the current reel at (number) fps

The "animate..." phrase shows each of the images defined in the current reel, in order, at the given frame rate (a number that specifies the frames per second). For example:

	now the current reel is the example reel;
	animate the current reel at 5 fps

will display each of the five frames defined in the example reel in sequence, ideally for 1/5 of a second each. 

We can also loop through the animation without end (until interrupted; see below). We do this by adding "looping" to the end of the phrase:

	animate the current reel at 12 fps, looping

When the final frame of the reel is reached, we begin again with the first frame. 


Section: Altering Currently Playing Animations

Graphical Window Animation provides a number of phrases which alter animations that are currently in progress. Under normal circumstances, these will be useful only for looped animations.

If we do not want to loop through the entire animation but only the latter portion of it, we can follow the "animate" command with this instruction:

	loop animation from frame (a number)

For example:

	animate the current reel at 5 fps, looping;
	loop animation from frame 3

This would play the animation in full once, then loop continuously through the final three frames. (The frame number is simply the position of the desired entry in the reel's list of figure-names, with the first figure enumerated as 1.)

The phrase

	interrupt animation

immediately halts an animation already in progress. By default, any animation in progress is stopped when the player looks or moves from room to room. The extension defines two rules which the author can use to control the default behavior, the stop animation when going rule and the stop animation when looking rule, and authors can interfere with these rules as needed to obtain the desired effect.

If we want to bring a looping animation to a smooth end, we can use the phrase:

	stop looping animation

This will allow the animation to continue to the final frame (as defined in the "animate" phrase), and will then halt it. For completeness, a "loop animation" phrase is provided. This causes an originally unlooped animation to begin looping once it reaches the final frame; this is unlikely to be useful, however, because under normal circumstances we can't be sure that an unlooped animation will receive the command before it ends; once an animation has ended, it cannot be altered by further commands.

The author may want to change the speed of a looped animation while it is still playing. This can be done with the phrase: 

	change the animation speed to (number) fps

Any currently running animation will speed up or slow down to the new frame-rate (in frames per second) defined in this phrase.


Section: Some Details and Fine Points

Animations are drawn using the current graphics drawing rule (see the Simple Graphical Window extension). When an animation ends, it returns control of the window to the currently shown picture as defined in the source. (If you are also using Emily Short's Location Images extension, this will be the current room illustration.) If the currently shown picture is undefined, the behavior of the window will depend on which rule is defined (the default rule fills the window with black). We can, of course, set any image to display on termination of the animation by placing the following line in the source directly after the "animate" phrase:

	now the currently shown picture is (the chosen image)

This might be useful if, for example, we want to ensure that the last frame of the animation persists on screen until any other screen-drawing rules are invoked (for example, by moving between rooms or by looking).
 
It is important to emphasize that animations, once triggered, are advanced independently of most rules that do not affect the Glulx timer (the glulx timed activity rules defined by Emily Short's Glulx Entry Points extension, on which Graphical Window Animation depends). Thus, we should not expect that this code block

	now the current reel is the sleigh bells reel;
	animate the current reel at 10 fps;
	now the current reel is the slay bells reel;
	animate the current reel at 10 fps.

will display the two animations, one after the other. Rather, the second animation is triggered immediately after the first, and thus supersedes it. The commands that alter running animations are thus really only of use on looping animations, because we can write our code to be sure that these are called while the animation is still running.

If we want to ensure that the player sees the full animation before the game continues, we can pause all input and output with the phrase

	wait for animation to end

This will pause the game until the animation ends, or until the player presses the ESC key. This phrase will have no effect when used with looping animations.

Finally, the author can test conditions surround the animation in progress using the following descriptions:

	when animation occurs
	the current reel
	the current frame

"When animation occurs" is used to inquire whether an animation is currently ongoing. We can also ask what reel is the current reel (e.g., "if the current reel is the reel of destruction"), and what frame is the current frame ("if the current frame is 7"). The latter could be used, for example, to trigger another event (such as a playing a sound) when a given frame is reached. For the most part, these should be used in the course of rules in the glulx timed activities and glulx picture selection rulebooks (defined in Emily Short's Glulx Entry Points).


Section: A Note on Frame Rates and Performance

While Simple Graphical Window strives to produce the absolute frame rate defined by the author, the actual frame rate of an animation will depend on many factors, including the size of the images, the processing power of the computer, the interpreter's handling of images, and so on. You will probably want to test actual performance on different interpreters and platforms to verify performance. As of January 2009, the extension has been tested with Zoom and Spatterlight on OS X, and on Git and Windows Glulxe on Windows. Zoom and Git seem to perform best, with Windows Glulxe a close second, and Spatterlight rather slower.


Section: Change Log

Version 3: Altered the "wait for animation to end" phrase so that it does not function in conjunction with looped animations. Changed the "interrupt animation" phrase so that it no longer triggers a redraw. Fixed examples to work properly with the Gluxle and Git interpreters (thanks to David Kinder). Incorporated Ghostly Rider example.

Version 2: Updated for compatibility with Inform build 5U92. Extension rewritten to incorporate Inform's then-new list manipulation capabilities, introducing the more flexible "reels" as the basis for building animation. Added the "wait for animation to end" command. Released 12/17/2008.

Version 1: Released 5/15/2007.


Example: ** Ghostly Rider - A simple animation sequence that fires when we enter a particular location. 

This example provides a sample of the kind of event-based animations that the Graphical Window Animation extension provides by default. Each room has its own illustration, displayed in the graphics window using a modified version of the code from Emily Short's Location Images extension. The animation shows a simple sequence of images built on one of the location illustrations; when the animation ends, the graphics window reverts automatically to the location illustration. While the images depict a figure moving over the room background, the animation is not sprite-based; the background is included in each frame of the animation. The images used in this example, which are modified from Cyril Pedrosa's excellent graphic novel Three Shadows, can be downloaded from http://www.sendspace.com/file/wcsqei. More complex animation examples that use sprites and pseudo-sprites can be downloaded from http://www.sendspace.com/file/lzlaro.

	*: "Ghostly Rider"

	Include Graphical Window Animation by Erik Temple.

	Rule for starting the virtual machine:
		now the current graphics drawing rule is the standard placement rule.

	The stop animation when looking rule is listed first in the carry out looking rulebook.

	A room has a figure-name called room-illustration.
	
	The image-setting rule is listed in the carry out looking rules. 

	This is the image-setting rule:
		change currently shown picture to the room-illustration of the location;
		follow the current graphics drawing rule.

	Figure of Dark Street is the file "Street.png". Figure of Bright Street is the file "Bright Street.png". Figure of Rider 01 is the file "Rider 01.png". Figure of Rider 02 is the file "Rider 02.png". Figure of Rider 03 is the file "Rider 03.png". Figure of Rider 04 is the file "Rider 04.png". Figure of Rider 05 is the file "Rider 05.png". Figure of Rider 06 is the file "Rider 06.png". Figure of Rider 07 is the file "Rider 07.png". Figure of Rider 08 is the file "Rider 08.png". Figure of Rider 09 is the file "Rider 09.png". Figure of Rider 10 is the file "Rider 10.png". Figure of Rider 11 is the file "Rider 11.png". Figure of Rider 12 is the file "Rider 12.png". Figure of Rider 13 is the file "Rider 13.png". Figure of Rider 14 is the file "Rider 14.png". Figure of Rider 15 is the file "Rider 15.png". Figure of Rider 16 is the file "Rider 16.png". Figure of Rider 17 is the file "Rider 17.png". Figure of Rider 18 is the file "Rider 18.png". Figure of Rider 19 is the file "Rider 19.png". Figure of Rider 20 is the file "Rider 20.png". Figure of Rider 21 is the file "Rider 21.png". 

	The Ghostly Rider reel is a list of figure-names that varies. The ghostly rider reel is {Figure of Rider 01, Figure of Rider 02, Figure of Rider 03, Figure of Rider 04, Figure of Rider 05, Figure of Rider 06, Figure of Rider 07, Figure of Rider 08, Figure of Rider 09, Figure of Rider 10, Figure of Rider 11, Figure of Rider 12, Figure of Rider 13, Figure of Rider 14, Figure of Rider 15, Figure of Rider 16, Figure of Rider 17, Figure of Rider 18, Figure of Rider 19, Figure of Rider 20, Figure of Rider 21}.

	Quiet Street is a room. "The street is silent. [if unvisited]Stucco glows in the moonlight. The street passes through a portico to the south.[otherwise if Silent Street is visited]There is no sign of the rider." The room-illustration is Figure of Bright Street.

	Silent Street is south of Quiet Street. "The only sound is your footfall on the gravel street. [if unvisited]A ghostly rider approaches from the south. It glides north, passing you noiselessly.[otherwise]There is a chill in the air. The rider is gone." The room-illustration is Figure of Dark Street.

	Carry out looking when the player is in Silent Street and Silent Street is unvisited:
		Now the current reel is the ghostly rider reel;
		Animate the current reel at 6 fps;
		Wait for animation to end.


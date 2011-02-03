Version 1 of Graphical Window Sprites (for Glulx only) by Erik Temple begins here.

"Graphical Window Sprites provides a framework for displaying 'sprites,' discrete programming objects that allow multiple images to be easily organized, individually scaled, and drawn in composite to a Glulx graphical window. The extension should be useful for many applications, including the construction of dynamic maps, visual puzzles, games such as poker or tic-tac-toe, visual scenes and narratives, and graphical user interfaces."

Include Simple Graphical Window by Emily Short.
Include Fixed Point Maths by Michael Callaghan.

Use preloaded sprites translates as (- Constant PRELOAD_SPRITES; -).


Part 1 - Sprite Definition

A sprite is a kind of thing. A sprite can be display-active or display-inactive. A sprite is usually display-inactive.

A sprite has a figure-name called sprite-identity. 

A sprite has a list of numbers called the sprite-coordinates. The sprite-coordinates are usually {0, 0}.

A sprite has a real number called the sprite-scaling factor. The sprite-scaling factor of a sprite is usually 1.0000.

A sprite has a number called the display-layer. The display-layer of a sprite is usually 1.

A sprite has a number called the sprite-width. The sprite-width is usually 0. A sprite has a number called the sprite-height. The sprite-height is usually 0.

A sprite can be graphlink-active or graphlink-inactive. A sprite is usually graphlink-inactive.

A sprite has some text called the linked replacement-command. The linked replacement-command is usually "".


Part 2 - Backgrounds and Scaling

Grid-background is a truth state that varies. Grid-background is usually false. The grid-x is a number that varies. The grid-y is a number that varies. Grid-x is 0. Grid-y is 0.

The window x-scaling factor is a real number that varies. The window y-scaling factor is a real number that varies. The window-scaling factor is a real number that varies. The window-scaling factor is 1.0000.

The window x-offset is a number that varies. The window y-offset is a number that varies.

Background-width is a number that varies. Background-height is a number that varies.

To determine the scaling and offset factors:
	let x-win be current graphics window width [defined by Simple Graphical Window] as a fixed point number;
	let y-win be current graphics window height [defined by Simple Graphical Window] as a fixed point number;
	if grid-background is false:
		change grid-x to the image-width of the currently shown picture;
		change grid-y to the image-height of the currently shown picture;
	let x-bkgd be grid-x;
	let y-bkgd be grid-y;
	if x-bkgd < 1:
		say "***Debug msg: No background defined.";
		rule fails;
	change the window x-scaling factor to x-win real divided by x-bkgd;
	change the window y-scaling factor to y-win real divided by y-bkgd;
	if the window x-scaling factor is real greater than the window y-scaling factor:
		change the window-scaling factor to the window y-scaling factor;
	otherwise:
		change the window-scaling factor to the window x-scaling factor;
	change background-width to the window-scaling factor real times the x-bkgd as an integer;
	change background-height to the window-scaling factor real times the y-bkgd as an integer;
	change window x-offset to the current graphics window width minus background-width divided by 2;
	change window y-offset to the current graphics window height minus background-height divided by 2.

To determine the offset factor:
	if grid-background is false:
		change grid-x to the image-width of the currently shown picture;
		change grid-y to the image-height of the currently shown picture;
	change background-width to grid-x;
	change background-height to grid-y;
	if background-width < 1:
		say "***Debug msg: No background defined.";
		rule fails;
	change window x-offset to the current graphics window width minus background-width divided by 2;
	change window y-offset to the current graphics window height minus background-height divided by 2.
	
To decide which real number is (N - a number) scaled by (R - a real number):
	Let temp be N as a fixed point number;
	let temp be temp real times R;
	decide on temp.
	
To decide which real number is (N - a real number) scaled by (R - a real number):
	Let temp be N real times R;
	decide on temp.

To decide what number is the image-width of (img - a figure-name):
	(- FindImageWidth({img}); -)
	
To decide what number is the image-height of (img - a figure-name):
	(- FindImageHeight({img}); -)
	

Part 3 - Drawing Rules

The sprite-background drawing rules are a rulebook.

A sprite-background drawing rule (this is the sprite-background scaled-centered display rule):
	unless glulx graphics is supported, rule fails;
	determine the scaling and offset factors;
	blank window to graphics background color;
	draw the background;
	draw active sprites.

A sprite-background drawing rule (this is the sprite-background centered display rule):
	unless glulx graphics is supported, rule fails;
	determine the offset factor;
	blank window to graphics background color;
	draw the background;
	draw active sprites.
	
To draw the/-- background:
	(- DrawBackground(); -)
	
To draw the/-- sprite (ID - a figure-name) at coordinates (off_x - a number) and (off_y - a number) with dimensions (image_x - a number) and (image_y - a number):
	(- DrawSprite({ID}, {off_x}, {off_y}, {image_x}, {image_y}); -)


Include (-

[ FindImageWidth  img result img_width;
	result = glk_image_get_info(img, gg_arguments, gg_arguments+WORDSIZE);
             		img_width  = gg_arguments-->0;
	return img_width;
];

[ FindImageHeight  img result img_height;
	result = glk_image_get_info(img, gg_arguments, gg_arguments+WORDSIZE);
             		img_height  = gg_arguments-->1;
	return img_height;
];

[ DrawBackground cur_pic;
	if (FollowRulebook( (+glulx picture selection rules+) ) ) { cur_pic = (+ internally selected picture +); }   
	if (cur_pic == 0) rtrue;
	if (+ grid-background +) rtrue;
	if (gg_picwin) { 
	
		glk_image_draw_scaled(gg_picwin, cur_pic, (+ window x-offset +), (+ window y-offset +), (+ background-width +), (+ background-height +)); 
	}
];

[DrawSprite ID off_x off_y image_x image_y ;
	if (gg_picwin) {  
		glk_image_draw_scaled(gg_picwin, ID, off_x, off_y, image_x, image_y); 
	}
]; 

-)


Part 3a - Sprite Drawing and Hyperlink Management (for use with Graphic Links by Jeff Sheets)
	
To draw the/-- active sprites:
	Let L be the list of display-active sprites;
	sort L in display-layer order;
	zero the link-table;
	repeat with current-sprite running through L:
		let cur-sprite be sprite-identity of current-sprite;
		let x-temp be entry 1 of the sprite-coordinates of the current-sprite scaled by the window-scaling factor;
		let y-temp be entry 2 of the sprite-coordinates of the current-sprite scaled by the window-scaling factor;
		let x-coord be x-temp real plus window x-offset as an integer;
		let y-coord be y-temp real plus window y-offset as an integer;
		unless using the preloaded sprites option:
			let temp be the image-width of cur-sprite;
			change the sprite-width of the current-sprite to temp;
			let temp be the image-height of cur-sprite;
			change the sprite-height of the current-sprite to temp;
		let x-temp be the sprite-width of current-sprite as a fixed point number;
		let y-temp be the sprite-height of current-sprite as a fixed point number;
		let x-int be x-temp real times the window-scaling factor real times the sprite-scaling factor of the current-sprite as an integer;
		let y-int be y-temp real times the window-scaling factor real times the sprite-scaling factor of the current-sprite as an integer;
		draw sprite cur-sprite at coordinates x-coord and y-coord with dimensions x-int and y-int;
		if current-sprite is graphlink-active:
			set a graphlink identified as current-sprite from x-coord by y-coord to (x-coord + x-int) by (y-coord + y-int) as the linked replacement-command of current-sprite.

To zero the/-- link-table:
	repeat through the Table of Graphlink Glulx Replacement Commands:
		blank out the whole row.


Part 3b - Sprite Drawing (for use without Graphic Links by Jeff Sheets)

To draw the/-- active sprites:
	Let L be the list of display-active sprites;
	sort L in display-layer order;
	repeat with current-sprite running through L:
		let cur-sprite be sprite-identity of current-sprite;
		let x-temp be entry 1 of the sprite-coordinates of the current-sprite scaled by the window-scaling factor;
		let y-temp be entry 2 of the sprite-coordinates of the current-sprite scaled by the window-scaling factor;
		let x-coord be x-temp real plus window x-offset as an integer;
		let y-coord be y-temp real plus window y-offset as an integer;
		unless using the preloaded sprites option:
			let temp be the image-width of cur-sprite;
			change the sprite-width of the current-sprite to temp;
			let temp be the image-height of cur-sprite;
			change the sprite-height of the current-sprite to temp;
		let x-temp be the sprite-width of current-sprite as a fixed point number;
		let y-temp be the sprite-height of current-sprite as a fixed point number;
		let x-int be x-temp real times the window-scaling factor real times the sprite-scaling factor of the current-sprite as an integer;
		let y-int be y-temp real times the window-scaling factor real times the sprite-scaling factor of the current-sprite as an integer;
		draw sprite cur-sprite at coordinates x-coord and y-coord with dimensions x-int and y-int;


Part 4 - Preload sprite sizes

When play begins:
	If using the preloaded sprites option:
		follow the preload sprites rule.

This is the preload sprites rule:
	Let L be the list of sprites;
	repeat with current-sprite running through L:
		let cur-sprite be sprite-identity of current-sprite;
		let temp be the image-width of cur-sprite;
		change the sprite-width of the current-sprite to temp;
		let temp be the image-height of cur-sprite;
		change the sprite-height of the current-sprite to temp.


Part 5 - Coordinate Manipulation

To decide which list of numbers is the (warp - a list of numbers) offset by (weft - a list of numbers):
	if the number of entries of warp is not 2:
		say "***Debug msg:  [warp] is not a pair of coordinates.[line break]";
	if the number of entries of weft is not 2:
		say "***Debug msg: [weft] is not a pair of coordinates.[line break]";
	let result1 be entry 1 of warp + entry 1 of weft;
	let result2 be entry	2 of warp + entry 2 of weft;
	let L be a list of numbers;
	Add result1 to L;
	Add result2 to L;
	decide on L.


Part 6 - Silent Replacement Commands

[The following code revises (and replaces) the print text to the input prompt rule from Glulx Entry Points so that it checks for the $- prefix that indicates a silent command; i.e., one that we don't want to appear in the transcript. On locating it, the new rule deletes the prefix while rerouting around the code that writes the command to the input prompt.]

Silent-replacement is a truth state that varies. Silent-replacement is false.

The print text to the input prompt rule is not listed in any rulebook.

A command-showing rule (this is the select text for printing to the input prompt rule):
	if glulx replacement command matches the regular expression "^\$-":
		replace the text "\$-" in glulx replacement command with "";
		now silent-replacement is true;
		rule succeeds;
	otherwise:
		say input-style-for-glulx;
		say glulx replacement command;
		say roman type.

[The following paragraphs are a hack that works around the built-in behavior of the system to ensure that the command line displays correctly when silent commands are issued. Basically, it suppresses the command prompt from printing again after a silent command has been issued. To use a custom command prompt throughout a game, include a "when play begins" rule that changes the command prompt; no other customizations should be necessary. If you wish to change the command prompt in mid-game, however, the safest thing is to change both the buffered command-prompt and the command prompt variables to the new prompt. ]

Buffered command-prompt is some text that varies.

The last when play begins rule:
	Change buffered command-prompt to the command prompt.

After reading a command  (this is the silent-replacement command-prompt rule):
	if the command prompt is "":
		change the command prompt to the buffered command-prompt;
	if silent-replacement is true:
		change the buffered command-prompt to the command prompt;
		change the command prompt to "";
	now silent-replacement is false.


Part 7 - Debugging commands (for use with Permanent Debugging by Erik Temple)

Debugging sprites is an action out of world. Understand "sprite tracing" and "sprites" and "sprite-tracing" as debugging sprites. Sprite-trace is a truth state that varies. Sprite-trace is false.

Check debugging sprites:
	If sprite-trace is false:
		now sprite-trace is true;
	otherwise:
		now sprite-trace is false;
	say "Sprite tracing now [if sprite-trace is true]on. All images are currently scaled at [window-scaling factor] to fit in the window[otherwise]off[end if].[line break]";
	if sprite-trace is true, follow the sprite tracing rule.

Every turn when sprite-trace is true (this is the sprite tracing rule):
	let L be the list of display-active sprites;
	sort L in reverse display-layer order;
	let last layer be the display-layer of entry 1 of L;
	say "LAYER [last layer]:[line break]";
	repeat with current-sprite running through L:
		if display-layer of current-sprite is not last layer:
			say "LAYER [display-layer of current-sprite]:[line break]";
			now last layer is the display-layer of current-sprite;
		let x-temp be entry 1 of the sprite-coordinates of the current-sprite scaled by the window-scaling factor;
		let y-temp be entry 2 of the sprite-coordinates of the current-sprite scaled by the window-scaling factor;
		let x-coord be x-temp real plus window x-offset as an integer;
		let y-coord be y-temp real plus window y-offset as an integer;
		say "    [current-sprite] ([sprite-identity of current-sprite]: [sprite-width of current-sprite] x [sprite-height of current-sprite] pixels): ([entry 1 of sprite-coordinates of current-sprite],[entry 2 of sprite-coordinates of current-sprite]); local scaling ratio [sprite-scaling factor of current-sprite][if current-sprite is graphlink-active]; graphlinked[end if].";
	if grid-background is false:
		say "BACKGROUND IMAGE:[line break]    [currently shown picture], currently presented at [background-width] x [background-height] pixels (ratio of [window-scaling factor]).";
	otherwise:
		say "GRID-BACKGROUND:[line break]    [grid-x] x [grid-y], currently presented at [background-width] x [background-height] pixels (ratio of [window-scaling factor]).";
	say "CURRENTLY SHOWN PICTURE / INTERNALLY SELECTED PICTURE (see Simple Graphical Window):[line break]    [currently shown picture] / [internally selected picture].".


Section 7.1 - Debugging Graphlinks (for use with Graphic Links by Jeff Sheets)

Debugging graphlinks is an action out of world. Understand "graphlinks" as debugging graphlinks. 

Check debugging graphlinks:
	say "[line break][bold type]Table of Graphlink Glulx Replacement Commands[roman type] (presented in reverse order)[line break]";
	repeat through the Table of Graphlink Glulx Replacement Commands in reverse order:
		say "[linkid entry]: ([p-top entry],[p-bottom entry]) - ([p-left entry],[p-right entry]): [replacement entry][line break]".

Showing clicked coordinates is an action out of world. Understand "coordinates" as showing clicked coordinates. Coordinate-trace is a truth state that varies. Coordinate-trace is false.

Check showing clicked coordinates:
	If coordinate-trace is false:
		now coordinate-trace is true;
	otherwise:
		now coordinate-trace is false;
	say "Coordinate reporting now [if coordinate-trace is true]on[otherwise]off[end if].[line break]".

A clicking graphlink rule (this is the report coordinates rule):
	if coordinate-trace is true:
		let graph-x be current graphlink x as a fixed point number;
		let graph-y be current graphlink y as a fixed point number;
		say "Screen coordinates of mouse input: ([current graphlink x],[current graphlink y])[line break]Approximate background grid coordinates: ([(graph-x real minus window x-offset) real divided by the window-scaling factor as an integer],[(graph-y real minus window y-offset) real divided by the window-scaling factor as an integer])[line break]";
	follow the default command replacement by graphlinks rule.

The report coordinates rule is listed before the default command replacement by graphlinks rule in the clicking graphlink rules.


Part 8 - Debugging commands (for use without Permanent Debugging by Erik Temple)

Chapter 8.1 - Debugging Sprites (not for release)

Debugging sprites is an action out of world. Understand "sprite tracing" and "sprites" and "sprite-tracing" as debugging sprites. Sprite-trace is a truth state that varies. Sprite-trace is false.

Check debugging sprites:
	If sprite-trace is false:
		now sprite-trace is true;
	otherwise:
		now sprite-trace is false;
	say "Sprite tracing now [if sprite-trace is true]on. All images are currently scaled at [window-scaling factor] to fit in the window[otherwise]off[end if].[line break]";
	if sprite-trace is true, follow the sprite tracing rule.

Every turn when sprite-trace is true (this is the sprite tracing rule):
	let L be the list of display-active sprites;
	sort L in reverse display-layer order;
	let last layer be the display-layer of entry 1 of L;
	say "LAYER [last layer]:[line break]";
	repeat with current-sprite running through L:
		if display-layer of current-sprite is not last layer:
			say "LAYER [display-layer of current-sprite]:[line break]";
			now last layer is the display-layer of current-sprite;
		let x-temp be entry 1 of the sprite-coordinates of the current-sprite scaled by the window-scaling factor;
		let y-temp be entry 2 of the sprite-coordinates of the current-sprite scaled by the window-scaling factor;
		let x-coord be x-temp real plus window x-offset as an integer;
		let y-coord be y-temp real plus window y-offset as an integer;
		say "    [current-sprite] ([sprite-identity of current-sprite]: [sprite-width of current-sprite] x [sprite-height of current-sprite] pixels): ([entry 1 of sprite-coordinates of current-sprite],[entry 2 of sprite-coordinates of current-sprite]); local scaling ratio [sprite-scaling factor of current-sprite][if current-sprite is graphlink-active]; graphlinked[end if].";
	if grid-background is false:
		say "BACKGROUND IMAGE:[line break]    [currently shown picture], currently presented at [background-width] x [background-height] pixels (ratio of [window-scaling factor]).";
	otherwise:
		say "GRID-BACKGROUND:[line break]    [grid-x] x [grid-y], currently presented at [background-width] x [background-height] pixels (ratio of [window-scaling factor]).";
	say "CURRENTLY SHOWN PICTURE / INTERNALLY SELECTED PICTURE (see Simple Graphical Window):[line break]    [currently shown picture] / [internally selected picture]."

Chapter 8.2 - Debugging Graphlinks (for use with Graphic Links by Jeff Sheets)

Section 8.2.1 - Debugging Graphlinks (not for release)

Debugging graphlinks is an action out of world. Understand "graphlinks" as debugging graphlinks. 

Check debugging graphlinks:
	say "[line break][bold type]Table of Graphlink Glulx Replacement Commands[roman type] (presented in reverse order)[line break]";
	repeat through the Table of Graphlink Glulx Replacement Commands in reverse order:
		say "[linkid entry]: ([p-top entry],[p-bottom entry]) - ([p-left entry],[p-right entry]): [replacement entry][line break]".

Showing clicked coordinates is an action out of world. Understand "coordinates" as showing clicked coordinates. Coordinate-trace is a truth state that varies. Coordinate-trace is false.

Check showing clicked coordinates:
	If coordinate-trace is false:
		now coordinate-trace is true;
	otherwise:
		now coordinate-trace is false;
	say "Coordinate reporting now [if coordinate-trace is true]on[otherwise]off[end if].[line break]".

A clicking graphlink rule (this is the report coordinates rule):
	if coordinate-trace is true:
		let graph-x be current graphlink x as a fixed point number;
		let graph-y be current graphlink y as a fixed point number;
		say "Screen coordinates of mouse input: ([current graphlink x],[current graphlink y])[line break]Approximate background grid coordinates: ([(graph-x real minus window x-offset) real divided by the window-scaling factor as an integer],[(graph-y real minus window y-offset) real divided by the window-scaling factor as an integer])[line break]";
	follow the default command replacement by graphlinks rule.

The report coordinates rule is listed before the default command replacement by graphlinks rule in the clicking graphlink rules.


Part 9 - Workaround for handling empty windows

[Currently, if a figure-name variable is not explicitly defined, Inform substitutes the cover art (resource ID #1). Practically, this means that it is impossible to test for an undefined figure-name, and thus it is also impossible to call an image-drawing rule without it drawing something. This workaround allows us to explicitly define a figure-name as referring to no-figure. We should explicitly say that the currently shown picture is no-picture if we do not wish to have a background image.

 Replace this section in your source text if it becomes unnecessary or redundant through changes to Inform or Simple Graphical Window]

To decide which figure-name is no-picture: (- 0 -). 


Part 10 - Timer-based drawing

The current timer-based drawing rule is a rule that varies. The current timer-based drawing rule is the standard placement rule.

A sprite-background drawing rule (this is the redirect drawing to timer rule):
	activate the timer.

To activate the/-- timer:
	(- glk_request_timer_events(1); -)

To deactivate the/-- timer:
	(- glk_request_timer_events(0); -)

A glulx timed activity rule (this is the redirect drawing from timer rule):
	deactivate timer;
	follow the current timer-based drawing rule.


Part 11 - Control over quitting the game

[This rule is provided to allow the author to include a "when play begins" rule that stops the game if the interpreter does not support graphics. Borrowed from Michael Bacon's Interactive Poetry extension.]

The immediately quit the game rule translates into I6 as "IMMEDIATELY_QUIT_R". 


Graphical Window Sprites ends here.

---- DOCUMENTATION ---- 

Graphical Window Sprites provides a framework for displaying "sprites," discrete programming objects that allow multiple images to be easily organized, individually scaled, and drawn in composite to a Glulx graphical window. When used in conjunction with Jeff Sheets' Graphic Links extension, sprites can also be hyperlinked to respond independently when the player clicks on them in the window. The extension should be useful for many applications, including the construction of gradually revealed or otherwise dynamic maps, visual puzzles, games such as poker or tic-tac-toe, visual scenes and narratives, and graphical user interfaces.  

Graphical Window Sprites was designed to work with Inform build 5Z71. It requires both Emily Short's Simple Graphical Window and Glulx Entry Points, as well as Michael Callaghan's Fixed Point Maths extension. Fixed Point Maths is used to provide the ability to express image scale as a simple ratio with a precision of four decimal digits (in other words, a sprite can be scaled to 85% of its original size by specifying a ratio of 0.8500). Mouse input (hyperlinked sprites) requires version 2 or later of Jeff Sheets' Graphic Links extension. 

Image files to be used with the examples below, as well as another example with source and images, can be found at http://www.sendspace.com/file/fowqkq.


Section: Concepts: Sprites and "the Background"

Graphical Window Sprites is based on the concept of the "sprite." In common graphics usage, a sprite is simply an independent bitmap image that comprises part of a larger scene, most commonly a two-dimensional image such as the moving characters in a video game. For the purposes of this extension, a sprite is a programmatic object that associates a given image with a number of attributes related to the way it should be displayed in Glulx graphical window. By defining sprite objects and giving Inform some rules about when to display them, we can simplify the construction of complex scenes that are made up of many discrete pieces. (For information about producing image files to use as sprites, see the Producing Images section below).

The "background" is also an important concept. The background provides the coordinate system to which the sprites will be related. It can be defined using either an image (called the "background image") or by specifying a set of dimensions. Before sprites are drawn to the screen, Graphical Window Sprites checks to see how the background's dimensions compare to the size of the window itself, and scales and/or offsets the background so that it fits and is centered within the window. The same scaling and centering factors are then applied to each of the sprites. In this way, the coordinates we set for the display of a sprite are given according to the coordinate system of the background: If our background image measures 240 x 100 pixels, a sprite placed at (120,50) will sit approximately in the center of the background, even if the entire scene (i.e., background plus sprites) has been rescaled by 50% to fit in the window. Thus, in selecting the coordinates for our sprites, we need to relate them to the coordinate system of the background.

To use Graphical Window Sprites, then, we define the background that our sprites will be superimposed on, then define the sprites themselves by indicating what image file each will display, the coordinates it be will be drawn at, and--if we like--how our sprite will be "layered" onscreen in relation to other sprites. We then write rules in our source text that will turn sprites "on" and "off" in appropriate situations (we can of course change a sprite's location or display size whenever we like). When we tell Inform to update to the graphics window, the extension will automatically locate the sprites we've turned on, arrange them in the layers we've specified, and draw them to the screen. If we wish, we can even identify a hyperlink command that will be invoked on the player's behalf when she clicks on a particular sprite in the graphical window.


Section: Defining the Background

We can select from one of two types of background. The default is the image background, which we define simply by specifying the "currently shown picture" (see the Simple Graphical Window documentation):

	Now the currently shown picture is Figure of Background

The background image can be freely changed during the course of the game, but we need to remember that, because the background image defines the coordinate system for our sprites, sprites may scale differently with background images of different sizes. If all background images to be used with a set of sprites have the same pixel dimensions, there will be no change in sprite display when the background is changed.

Our other option is simply to specify the dimensions of our coordinate system. To use this option, we first need to set the "grid-background" truth state to true:

	Now grid-background is true
	
...and now we can define the background size by specifying it directly using the grid-x and grid-y variables:

	Change grid-x to 250. Change grid-y to 200.

The currently shown picture will not be drawn when we use the grid-background option. If we want an image to act as our backdrop, we need to define it as a sprite.

If at any point we wish to change to using an image-based background, we reset the truth state to its default value:

	Now grid-background is false
	
In this case, we do not need to make any change to the grid-x and grid-y variables; these are automatically updated when a background image is used. However, should we wish to return to using a grid background, we need to change the grid-x and grid-y variables as before when we do so. 


Section: Defining Sprites

Sprites are subclasses of the "thing" kind in Inform. We define them like so:

	Mario is a sprite. The sprite-identity is Figure of Mario. The sprite coordinates are {58, 45}. Mario is display-active. The display-layer is 4. The sprite-scaling factor is 0.7500.

This defines a sprite named Mario that will display an image (Figure of Mario) at the coordinates (58,45). The coordinates refer to the coordinates of the background (not the window--see the Concepts section above) where the upper-left corner of the sprite image will be placed. All sprites will also be automatically adjusted by the active drawing rule; depending on which of the built-in drawing rules are used (see below), sprites will follow the scaling and centering of the background. The coordinates can be changed at any time:

	Now the sprite-coordinates of Mario are {12, 17}.

However, the change will not be reflected on-screen until the graphics window is updated (see below).

The adjective "display-active" tells Inform that Mario should be drawn to the graphics window the next time it is updated. By default, sprites are display-inactive, meaning that they will not be drawn until we set them as display-active. We do this simply by writing:

	Now Luigi is display-active
	Now Mario is display-inactive

The display-layer property tells Inform in what order to draw the sprite, in reference to other display-active sprites. Sprites on display-layer 1 are drawn first, those on layer 2 second, and so on. There can be any number of display-layers, but by default all sprites are set to draw on layer 1. The display-layer can be changed like this:

	Now the display-layer of Mario is 3

The sprite-scaling factor is the amount by which the sprite should be scaled when it is drawn, expressed as a number with four-digit precision. It is mandatory to include all four decimals. In the example above, Mario will be reduced 75% (expressed as a ratio: 0.7500) in relation to the background image. Thus, Mario's image will be drawn so that one of Mario's pixels equals only 0.75 of one pixel of the background image. By default, the sprite-scaling factor is 1.000, or 100%. (The sprite-scaling factor affects only the size of the sprite, not the coordinates of its placement.)

The sprite-scaling factor lets us make adjustments to the size of our sprites without remaking them in our graphics program, but it is likely more useful for simulating depth--images that are intended to be seen as farther away can be drawn at a smaller scale, then scaled up as we approach them. When combined with the display-layer feature, we have the tools we need to procedurally generate landscapes based on the distance to objects and the ways they overlap or occlude one another in our field of vision.

One of the most useful features of sprites is that we can define subclasses of sprites and give them their own defaults:

	An occluder is a kind of sprite. An occluder is usually display-active. The display-layer of an occluder is usually 2.

Now we can refer to occluders as a class anywhere in our source, including in special rules to control their display.

Similarly, sprites can be "attached" to other items in the game. To assign a sprite to every object in the game, for example, we could write:

	An object has a sprite called the thing-sprite.

This opens a number of options to us, such as:

	To activate the (N - a thing) sprite:
		Now the thing-sprite of N is display-active

And now we can simply type "Activate the sword sprite" in our source to mark it for display in the graphics window.

Finally, note that, in most cases, it will likely be easier and more readable to define sprites using tables rather than in-line.


Section: Drawing Rules

Graphical Window Sprites uses the Simple Graphical Window extension to provide basic control over the graphical window. Various parameters of the window can be set, including the size of one of its dimensions (either the width or the height, depending on whether the graphics window appears above, below, or to one side of the main window). See the documentation for Simple Graphical Window for more detail.

Graphical Window Sprites, however, defines its own rules for drawing the images in the graphics window. The two rules defined in the extension are:

	the sprite-background scaled-centered display rule
	the sprite-background centered display rule

The former scales the background image and sprites down to fit the current graphics window size and centers them both horizontally and vertically within the window. The latter centers them within the window but does not scale them; they are displayed using the pixel dimensions of the original files. The scaled-centered rule will not scale images to greater than their original size.

We must specify the rule we wish to use in our source in order to draw our sprites to the screen. Usually this will be done in a "when play begins" rule:

	When play begins:
		now the currently shown picture is Figure of Background;
		now the current graphics drawing rule is the sprite-background centered display rule

This tells Inform to draw both the background image (the currently shown picture) and sprites to the screen when the game begins. Simple Graphical Window will ensure that the screen is also redrawn whenever the window is resized or otherwise changed by the player.

This is probably fine if we want the screen to remain the same throughout the game, but if we want to update the graphical window during play, we will need to tell Inform precisely when to do this. Perhaps the easiest way is with an every turn rule, but depending on our particular application, this may mean that the window is often redrawn needlessly, and we may prefer to tailor things a bit more. If our sprites are updated whenever the player enters a new room, for example, we might attach our updating rules to the looking command, since this is invoked automatically whenever the player moves from room to room:

	Carry out looking (this is the sprite-window update rule):
		Follow the current graphics drawing rule. 

If we have elsewhere provided rules for marking our sprites display-active and display-inactive, this will update them each time the PC moves. Here is a rule that both marks sprites for display and displays them; it ensures that the sprite associated with a given room is drawn when the player moves into the room:

	A room has a sprite called the room-sprite....

	Carry out looking (this is the sprite update rule):
		If the room-sprite of the location is display-inactive:
			change the room-sprite of the location to display-active;
		Follow the current graphics drawing rule. 

If we only wish to use the special sprite mechanisms for part of our game, that is possible too. We merely need to change the current graphics drawing rule to one of those defined by Simple Graphical Window (or one we write ourselves), and we can use the window as described in the Simple Graphical Window documentation. To draw with sprites again, we simply change the current graphics drawing rule back to one of the Graphical Window Sprites rules.

Authors will find it easy to write their own sprite display rules, should they need them. This will not be covered in detail here, but using the extension's "draw the background," "draw active sprites," and "draw sprite X at coordinates x and y with dimensions m and n" phrases, we should be able to do just about anything we like without dropping into I6 code, since all of the variables we need are exposed at the I7 level. 

Finally, it should be noted that there are inherent inaccuracies in the scaling process, which may cause sprites to appear one or even two pixels out of place when scaled down. If a high degree of precision is needed, we should avoid scaling by using the sprite-background centered display rule rather than the sprite-background scaled-centered display rule. Alternatively, if appropriate, we can make sprites that will displayed directly adjacent to one another overlap slightly; this overlap will prevent unsightly "seams" caused by misalignment in the composite image. The image files used for the rooms in the "Castle of Sprites" example below use this approach, with 2 to 3 pixels of overlap between tiles.


Section: Hyperlinking Sprites

If we have also included Jeff Sheets' Graphic Links extension, sprites may be configured to be "hotlinked" so that they will trigger a predefined command input when the player clicks with the mouse on the area covered by the sprite. Once this extension has been included, we need only to specify that a sprite is "graphlink-active" and we may click on it. Graphical Window Sprites does all of the required bookkeeping automatically.

A click on a sprite will not, however, have any effect unless we also define a "linked replacement-command" for the sprite, which is simply the command we wish to fire when the sprite is clicked. So, to complete the definition of the example sprite presented above, we would add the hyperlinking information:

	Mario is a sprite. The sprite-identity is Figure of Mario. The sprite coordinates are {58, 45}. Mario is display-active. The display-layer is 4. The sprite-scaling factor is 0.7500. Mario is graphlink-active. The linked replacement-command is "JUMP".

And now, while the Mario sprite appears in the window, clicking on it with our mouse will result in the command "JUMP" being entered at the command prompt. Note that the entire area of the sprite--including transparent zones--is hotlinked in this way. Also note that a sprite is only available to be clicked on when it is actually displayed on the screen (i.e., it is display-active and has already been drawn to the window). A linked replacement-command of "" will be perceived by the player as having had no effect, and this is the default command for graphlink-active sprites. We can make a hyperlinked sprite once again unresponsive to clicks by changing it to "graphlink-inactive".

We can also make replacement commands fire silently; that is, the command will not be printed to the input prompt and will not appear in the transcript. This functionality relies on a hack that changes the command prompt, for which reason we need to define a use option before we can employ such "silent" commands:

	Use silent replacement-commands

Silent commands can be used alongside regular replacement commands. We simply indicate a command's silence by prefacing the command with "$-":

	The linked replacement-command is "$-ZOOM IN"

We can then define actions as usual:

	Zooming in is an action out of world. Understand "zoom in" as zooming in.

Note that the name of the action does not include the "$-"; the prefix is solely a marker for use in defining the linked replacement-command as silent.

Silent commands should really be used only for actions that will not output any text whatsoever; as such, they are mainly intended for out-of-world actions that will affect only the graphical window, such as zooming in and out, switching to another view, bringing up a pop-up, or something similar. If we do wish to print text as a result of a silent command, we need to be aware that we may need to output a line break or paragraph break to produce the desired output.

A graphlink-active sprite that overlaps another in the display layering system will supercede the lower sprite. That is, if Mario partially overlaps a hyperlinked mushroom, clicking within the boundaries of the rectangle that defines Mario will cause Mario's, rather than the mushroom's, linked replacement-command to be invoked.

The background cannot be hyperlinked. We can, however, imitate a clickable background by including a fully transparent sprite image of the same dimensions as the background and placing it on the lowest display-layer (usually display-layer 1).

A final note: if we will need to have more than 25 hyperlinked sprites active at a single moment, we need to extend the number of blank rows in the Table of Graphlink Glulx Replacement Commands. Graphic Window Sprites manages this table automatically, and we should not attempt to set entries in it directly--the table is rebuilt each time the sprite drawing rules are updated, so direct edits will be disregarded in any case.


Section: Simple Calculations with Coordinates

There may be times when it is useful to calculate the coordinates of one sprite based on the coordinates of another. For example, the Castle of Sprites example below implements a torch that appears to be carried by the player's avatar thanks to the calculation of the torch sprite's coordinates as an offset of the player avatar's coordinates. To calculate an offset, we simply use the phrasing "x offset by y", where x and y are coordinates in the form {a, b}:

	Change the coordinates of the torch-sprite to the coordinates of the player-sprite offset by {-12, 15}.
	
This will set the torch-sprite coordinates to the coordinates of the player's avatar, but offset by 12 pixels to the left and 15 pixels down. Again, the coordinates are given with reference to the background.


Section: Debugging Commands

Graphical Window Sprites provides three debugging commands. The first will, when toggled on, print a list, every turn, of all display-active sprites organized by display-layer; it will also give either the present background image and the size at which it is currently scaled in the window, or the dimensions of the grid-background and its size as currently scaled. The command is:

	sprite tracing / sprite-tracing / sprites

Enter the command again to toggle it off.

The two remaining debugging commands are activated only when Jeff Sheets' Graphic Links extension is included. The first provides a listing of the currently displayed hyperlinked sprites, together with the coordinates of the upper left and lower right corners of the hotlinked box and the replacement command that results from clicking. The command is:

	graphlinks

The final debugging command prints the coordinates corresponding to mouse input, giving them first in window coordinates and second in the coordinate system of the background. Since the background system's coordinates are calculated using scaling operations, they are approximate, but should be accurate to within about 1 pixel. To toggle coordinate display on and off, we type:

	coordinates

The extension is compatible with the Permanent Debugging extension, which allows you to include debugging commands in a released version. (Inform currently allows you to save a debug version of a story file, but that file will not include multimedia resources, which is not very useful for multimedia projects). Just include the Permanent Debugging extension to turn on debugging commands in released files. 


Section: Preloading Sprites

By default, Graphical Window Sprites checks the dimensions of each active sprite every time the graphics window is updated. In other words, each time the window is redrawn, each sprite's size is evaluated and (if required) scaled to the proper size, then drawn. This could be considered wasteful, since for most applications the dimensions of the graphic associated with a sprite (the sprite-identity property) will not change during the course of play. In my tests, the arguably unnecessary calls to glk_image_get_info have had no noticeable impact on performance, but an option to preload sprites at the beginning of the game has been included even so. To take advantage of this option, we include this phrase in the source code:

	Use preloaded sprites

When enabled, this will read in the dimensions of all sprites at the beginning of the game, storing their dimensions in the image-width and image-height properties. The dimensions will never again be checked when sprites are drawn, so we should be certain that we do not change the sprite-identity for any sprite in the course of the source text.


Section: Producing Images for Use with Graphical Window Sprites

Full instructions for producing images are well beyond the scope of this documentation, but a few notes and links will be useful. For almost all purposes, you will want to produce your images in PNG (Portable Networks Graphics) format. PNG graphics (file extension .png) can contain an "alpha channel" that defines transparent areas of the image, allowing for shapes that are not rectangular. They can be produced with Photoshop, of course, but also with many other programs, including the free, cross-platform GIMP software (http://www.gimp.org). Here are some sites that might be of use to you if you are unfamiliar with PNG graphics (Inform tends to mangle URL spacing, so you may need to edit them by hand): 

	http://en.wikipedia.org/wiki/Portable_Network_Graphics
	http://www.libpng.org/pub/png/pngintro.html
	http://www.axialis.com/tutorials/tutorial-misc001.html (Photoshop tutorial)
	http://www.fabiovisentin.com/tutorial/GIMP_transparent_image/gimp_how_to_make_transparent_image.asp (GIMP tutorial)

When sprites are intended to fit together tightly on screen, as for example image tiles, we will have more flexibility if we design the tiles so that they overlap one another. In other words, where they will abut one another, we should include an extra margin of 1-3 pixels in each image. This will ensure that, if the sprites are scaled, the inaccuracies inherent in scaling do not create visible seams between sprites.


Section: Troubleshooting

Runtime error "cannot divide by zero" (or similar):

	The background has probably not been defined. Be sure you define the background such that it will have been defined before any of the sprite drawing rules fires. 

Inform doesn't recognize the "sprite-identity" property, or a table in which it is used:

	Inform requires a figure to be defined in the source before it can be referred to. Be sure that your figures are defined in the source *above* the text in which you are attempting to define sprite-identities.

The command prompt is not printing properly:

	The system that allows "silent" commands to be issued when the player clicks on a sprite is possibly at fault, since it lightly hacks the printing of the command prompt. If you've customized your command prompt somewhere after the when play begins activity, you may find that you need to also change buffered command-prompt value:

		change the buffered command-prompt to "CUSTOM PROMPT>"; 

	Failing this, check the rules in the section on Silent Replacement Commands above to see where things are going wrong.

Performance issues:

	Be sure that your images are not too large. Images should be sized no larger than you want them to appear onscreen. If performance issues persist, you may want to try preloading sprites (see appropriate section above), and/or using the (hacky) timer-based drawing documented below. 


Section: Summary of Sprite Properties

This section simply presents a list of the properties associated with sprites, including those (sprite-width and sprite-height) we should not try to set directly. 

	sprite: a kind of thing

	sprite-identity: the figure-name of the sprite's associated image file;

	sprite-coordinates: the x and y coordinates where the sprite will be placed; they should be matched to the background image or grid-background size, and tell where to place the upper-left corner of the sprite image. The sprite-coordinates are of the Inform list of numbers; The default is {0, 0};

	display-layer: a number that defines the layer the sprite will be drawn to; sprites with a display-layer of 1 are drawn first, then display-layer 2, and so on. The default is display-layer 1;

	sprite-scaling factor: a four-digit precision ratio for scaling the sprite, e.g. 0.5000. The default is 1.0000 (actual size, subject to adjustment by the window-scaling factor when the sprite-background scaled-centered display rule is in use);

	display-active, display-inactive: flags that indicate whether or not a sprite is marked for display. The default is display-inactive;

	sprite-width, sprite height: integers giving the dimensions of the original sprite in pixels; the author should have no reason to set these directly;

	graphlink-active, graphlink-inactive: flags that indicate whether or not a sprite is hyperlinked; can only be used if the "hyperlinked sprites" use-option in active. The default is graphlink-inactive;

	linked replacement-command: text of a command, given in quotation marks, that will be entered on behalf of the player when the corresponding sprite is clicked with the mouse. The default is "" (do nothing). The prefix "$-" added directly before the command will invoke the command without printing it to the command prompt.
	
	
Section: A Note on Interpreters

This extension has been tested with Zoom and Spatterlight on OS X, and with Windows Glulxe, Windows Git, and Gargoyle on Windows XP. Spatterlight renders graphics more slowly than the other interpreters, and hyperlinks require a double-click.

We can test at run-time whether the interpreter the player is using supports hyperlinks or graphics display with the phrases

	if glulx graphic-window hyperlinks are supported...
	if glulx graphics is supported...
	
This allows us to (for example) warn the player if the functionality will not work with the chosen interpreter. We can also use the "immediately quit the game rule" to end the game immediately.


Section: Timer-Based Drawing

Graphical Window Sprites provides an approach to improving perceived performance by using a hack that calls drawing and scaling routines as glulx timer events. Normally, the extension asks glulx to draw images as part of the normal flow of game events. This means that, if an image takes a while to draw, the printing of game text and the appearance of the command prompt will be delayed until drawing is completed. Glulx timer events, however, route around the normal flow. If we move our drawing routines to the timer, they will occur simultaneously with the continued operation of the game. While the drawing routines don't take less time, the player will not experience a delay in the game as a whole, only in the update of the graphics window.

To switch to timer-based drawing, we need to do two things. We change the current graphics drawing rule so that it redirects to the timer, like so:

	now the current graphics drawing rule is the redirect drawing to timer rule

This requests a glulx timer event of 1 millisecond. After 1 millisecond, the timer will call a rule known as the current timer-based drawing rule. So, we simply need to assign our actual drawing rule to the timer-based rule, like this:

	now the current timer-based drawing rule is the sprite-background scaled-centered display rule

Now, all drawing and scaling will proceed as glulx timed events rather than as part of the normal flow of things. Note that this method is not recommended if you are using glulx timer events for other purposes in your story. (And it's really probably not a good idea to use timer-based drawing at all...)


Section: Credits
	
The Graphic Hyperlinks section of the extension comes from Jeff Sheets' extension of the same name, and is included here with only slight modifications. Thanks to Jesse McGrew, JDC, Eliuk Blau, Mike Tarbert, David Kinder, and Andrew Hunter for help and advice.

Section: Change Log

Version 1: Submitted June 9, 2009. 



Example: ** Clickable Compass - A graphical compass rose on which the exits from the current room are highlighted. Clicking on a direction moves us appropriately. Requires that we download version 2 of Graphic Links by Jeff Sheets.

A straightforward example in which all sprite management after the intial definition is controlled with a single rule (the compass sprites updating rule). 

	*: "Clickable Compass"

	Include Graphical Window Sprites by Erik Temple.
	Include version 2 of Graphic Links by Jeff Sheets.

	Use full-length room descriptions.

	The graphics window proportion is 40. The graphics background color is g-white.

	When play begins:
		Now the currently shown picture is Figure of Scroll;
		now the current graphics drawing rule is the sprite-background scaled-centered display rule.

	A carry out looking rule (this is the compass sprites updating rule):
		Repeat with the way running through directions:
			let place be the room the way from the location;
			if place is a room:
				change the dir-sprite of the way to display-active;
			otherwise:
				change the dir-sprite of the way to display-inactive;
			follow the current graphics drawing rule. 
		
	Figure of North is the file "North.png". Figure of Northwest is the file "Northwest.png". Figure of West is the file "West.png". Figure of South is the file "South.png". Figure of Southwest is the file "Southwest.png". Figure of Southeast is the file "Southeast.png". Figure of East is the file "East.png". Figure of Northeast is the file "Northeast.png". Figure of Up is the file "Up.png". Figure of Down is the file "Down.png". Figure of Inside is the file "Inside.png". Figure of Outside is the file "Outside.png". Figure of Compass Rose is the file "Compass.png". Figure of Scroll is the file "Scroll.png".

	Compass-sprite is a sprite. The sprite-identity is Figure of Compass Rose. The sprite-coordinates are {137, 93}. Compass-sprite is display-active.

	[We define the sprites themselves in table, and then we assign them to the directions. Unfortunately, Inform does not (yet?) allow us to assign sprites to already-existing things, such as the directions, from within a table. Note that all sprites are defined, even though one (outside-sprite) will never appear in the game; if we don't include an assignment to each of the directions, even those we don't plan to use, strange things will happen.]

	A direction-sprite is a kind of sprite. A direction-sprite is graphlink-active. The display-layer of a direction-sprite is 2. A direction has a direction-sprite called the dir-sprite. 

	Some direction-sprites are defined by the Table of Direction Sprites.

	Table of Direction Sprites
	direction-sprite	sprite-identity	sprite-coordinates	linked replacement-command
	north-sprite	Figure of North	{239, 93}	"GO NORTH"
	northeast-sprite	Figure of Northeast	{307, 119}	"GO NORTHEAST"
	east-sprite	Figure of East	{342, 196}	"GO EAST"
	southeast-sprite	Figure of Southeast	{308, 271}	"GO SOUTHEAST"
	south-sprite	Figure of South	{242, 298}	"GO SOUTH"
	southwest-sprite	Figure of Southwest	{156, 271}	"GO SOUTHWEST"
	west-sprite	Figure of West	{137, 196}	"GO WEST"
	northwest-sprite	Figure of Northwest	{156, 119}	"GO NORTHWEST"
	up-sprite	Figure of Up	{239, 173}	"GO UP"
	down-sprite	Figure of Down	{232, 226}	"GO DOWN"
	in-sprite	Figure of Inside	{213, 198}	"GO INSIDE"
	out-sprite	Figure of Outside	{268, 200}	"GO OUTSIDE"

	The dir-sprite of north is north-sprite. The dir-sprite of northwest is northwest-sprite. The dir-sprite of west is west-sprite. The dir-sprite of south is south-sprite. The dir-sprite of southwest is southwest-sprite. The dir-sprite of southeast is southeast-sprite. The dir-sprite of east is east-sprite. The dir-sprite of northeast is northeast-sprite. The dir-sprite of up is up-sprite. The dir-sprite of down is down-sprite. The dir-sprite of inside is in-sprite. The dir-sprite of outside is out-sprite.

	R01 is a room. R02 is north of R01. R03 is east of R01. R04 is north of R02 and northwest of R03. R05 is northeast of R02. R06 is north of R05. R07 is west of R06. R08 is southwest of R04 and northwest of R02. R09 is east of R06. R10 is northeast of R06. R11 is east of R10. R12 is southeast of R09. R13 is south of R12. R14 is northeast of R12. R14 is southeast of R11. R15 is up from R03. R16 is east of R15. R17 is north of R16. R18 is down from R17. The description of R18 is "A maze of twisty little passages, all alike. A breeze blows from the northeast."

	Exit is northeast of R18. Exit is outside from R18. The printed name of Exit is "Outside". "You emerge into sunlight." Southwest from Exit is nowhere. Inside from Exit is nowhere. After looking in Exit, end the game in victory.

	The printed name of a room is "Maze". The description of a room is usually "A maze of twisty little passages, all alike.".


Example: *** Castle of Sprites - An onscreen map of a multilevel space that reveals itself as the player moves through it. 

Let's say we want to create a graphical map of a multilevel space, and we want the different levels to appear onscreen at the same time while still remaining visually distinct for the player. This example takes one approach to this by modelling a multistory castle. As we move upward, rooms on the upper levels are drawn, while levels beneath are "grayed out" by a semitransparent sprite. As we move back down, the upper levels are successively peeled off--removed from the display--and the semitransparent occluding layer is moved downward appropriately. It may help to organize things beforehand using display layers. This example is organized using twelve layers, including a top-level display layer for a title that displays the name of the layer, and interstitial layers where the icons corresponding to the PC and his torch will be placed as we move upward:

	12	Titles (corresponding to the current region)
	11		Player's avatar (Tower level)
	10		Torch icon (Tower level)
	9	Tower level map
	8	Occluder (darkens the Palace and Dungeon maps when we're in the Tower)
	7		Player's avatar (Palace level)
	6		Torch icon (Palace level)
	5	Palace level map
	4	Occluder (darkens the Dungeon map when we're on higher levels)
	3		Player's avatar (Dungeon level)
	2		Torch icon (Dungeon level)
	1	Dungeon level map

Note: Inform automatically inserts spaces around brackets, so that the coordinates in this example will appear with spaces around them when viewed in the list of Installed Extensions in the documentation pane. When writing, it is not necessary to include the padding between the braces and the numerals, though a space after the comma is required.

We first the graphics window size and provide the necessary assignment of a background using the "when play begins" activity; in this case, we are simply specifying a background grid sans image. 

	*: "Castle of Sprites"

	Include Graphical Window Sprites by Erik Temple.
	
	The graphics window pixel count is 350.

	The first when play begins rule:
		Unless glulx graphics is supported:
			say "This interpreter does not support graphics. Now exiting...";
			follow the immediately quit the game rule.

	When play begins:
		Now grid-background is true;
		change grid-x to 780;
		change grid-y to 555;
		change the currently shown picture to no-picture;
		now the current graphics drawing rule is the sprite-background scaled-centered display rule.


Before defining sprite objects, we need to define the figures associated with them, and the files that each figure-name refers to:

	*: Figure of Tower Title is the file "Tower-Title.png". Figure of Palace Title is the file "Palace-Title.png". Figure of Dungeon Title is the file "Dungeon-Title.png". Figure of Occluder is the file "Occluder.png". Figure of Cell is the file "Cell.png". Figure of Central Hall is the file "Central Hall.png". Figure of Eastern Hall is the file "Eastern Hall.png". Figure of Western Hall is the file "Western Hall.png". Figure of Guardroom is the file "Guardroom.png". Figure of Torture Chamber is the file "Torture.png". Figure of Tower is the file "Tower.png". Figure of Palace is the file "Palace.png". Figure of Dungeon Stairs is the file "Dungeon Stairs.png". Figure of Palace Stairs is the file "Palace Stairs.png". Figure of Tower Stairs is the file "Tower Stairs.png". Figure of Player is the file "Player Icon.png". Figure of Torch is the file "Torch.png".

The following code defines the display-layer for each of the regions of the map. The sprites associated with the rooms in the each region will be be displayed on the appropriate layer (see the final block of code below). We use a table to quickly define the sprites that will display the name of the region we're in.

	*: The Dungeon Area is a region. The Cell, the Central Hallway, the Hallway East, the Hallway West, the Guard Room, the Dungeon Stairs, and the Torture Chamber are in the Dungeon Area.

	The Palace Area is a region. The Palatial Hall and the Palace Stairs are in the Palace Area.

	The Tower Area is a region. The Tower Chamber and the Tower Stairs are in the Tower Area.

	A region has a number called the region-layer. The region-layer of the Dungeon Area is 1. The region-layer of the Palace Area is 5. The region-layer of the Tower Area is 9.

	A title is a kind of sprite. The display-layer of a title is usually 12. Some titles are defined by the Table of Title Sprites. 

	A region has a sprite called the title-sprite. The title-sprite of the Tower Area is Tower-title. The title-sprite of the Palace Area is Palace-title. The title-sprite of the Dungeon Area is Dungeon-title. 

	Table of Title Sprites
	title	sprite-identity	sprite-coordinates
	Tower-title	Figure of Tower Title	{63, 59}
	Palace-title	Figure of Palace Title	{63, 59}
	Dungeon-title	Figure of Dungeon Title	{63, 59}


The following blocks of code define the sprites associated with things--the player's avatar, the icon for the torch, and the sprites that represent each of the rooms on the map. Note that the torch sprite has two pairs of coordinates (defined as "lists of numbers") that we can later use to relate the position of the torch icon to that of the player, allowing the player avatar to look as if it is carrying the torch. We will use the extension's "offset by" phrase in the final block of code (see below) to apply these offsets. The coordinates of the player-sprite are given as a property of the rooms, so that the avatar can be moved around the map as the player moves through the world (see below).

	*: The player-sprite is a sprite. The sprite-identity is Figure of Player. The display-layer is 3. The player-sprite is display-active. The sprite-scaling factor is 0.5200.

	The torch-sprite is a sprite. The sprite-identity is Figure of Torch. The display-layer is 2. The torch-sprite is display-inactive. The torch-sprite has a list of numbers called the held-offset. The held-offset of the torch-sprite is {-16, 2}. The torch-sprite has a list of numbers called the dropped-offset. The dropped-offset of the torch-sprite is {-30, 4}.

	A room-sprite is a kind of sprite. A room has a room-sprite called the location-sprite. Some room-sprites are defined by the Table of Location Sprites.

	The location-sprite of the Tower Chamber is Tower-sprite.  The location-sprite of the Palatial Hall is Palace-sprite.  The location-sprite of the Cell is Cell-sprite. The location-sprite of the Central Hallway is CentralHall-sprite. The location-sprite of the West Hallway is WestHall-sprite. The location-sprite of the East Hallway is EastHall-sprite. The location-sprite of the Guard Room is Guard-sprite. The location-sprite of the Torture Chamber is Torture-sprite. The location-sprite of the Dungeon Stairs is Dungeon-stair-sprite. The location-sprite of the Palace Stairs is Palace-stair-sprite. The location-sprite of the Tower Stairs is Tower-stair-sprite.  

	Table of Location Sprites
	room-sprite	sprite-identity	sprite-coordinates
	Tower-sprite	Figure of Tower	{586, 330}
	Palace-sprite	Figure of Palace	{426, 20}
	Cell-sprite	Figure of Cell	{265, 311}
	CentralHall-sprite	Figure of Central Hall	{263, 396}
	WestHall-sprite	Figure of Western Hall	{46, 397}
	EastHall-sprite	Figure of Eastern Hall	{360, 397}
	Guard-sprite	Figure of Guardroom	{576, 304}
	Torture-sprite	Figure of Torture Chamber	{544, 60}
	Dungeon-stair-sprite	Figure of Dungeon Stairs	{647, 440}
	Palace-stair-sprite	Figure of Palace Stairs	{662, 428}
	Tower-stair-sprite	Figure of Tower Stairs	{674, 416}


	The occluder is a sprite. The sprite-identity is Figure of Occluder. The sprite-coordinates are {0, 0}. The occluder is display-inactive. The display-layer is 4. 

Finally, the lines below control the positioning of sprites on display-layers, which sprites should be displayed and when, and so on. The looking rules are used as the basic "hook" for most sprite updating, since our sprites generally change based on player movement and the looking rules are called each time the player character moves. Only the torch sprite provides a special case, since we display it differently depending on whether the PC holds it, is in the same room with but does not hold it, or whether the player is not in the same room with it. (The torch sprite is only visible when we are in the same room as the torch).

Note the use of the phrase:
	
	{a set of coordinates} offset by {a set of coordinates}.

This is defined by the extension and allows us to easily add one set of coordinates to another. In this case, one of two pairs of coordinates are chosen to offset the torch, based on whether it should be held by the player's avatar, or merely appear alongside it.

	*: The update map sprites rule is listed in the carry out looking rules.

	The uppermost map layer is a number that varies. The uppermost map layer is 1.

	This is the update map sprites rule:
		Repeat with item running through regions:
			now the title-sprite of the item is display-inactive; 
		now the title-sprite of the map region of the location is display-active;
		let the current map layer be the the region-layer of the map region of the location;
		change the display-layer of the location-sprite of the location to the current map layer;
		change the display-layer of the player-sprite to (the current map layer + 2);
		change the display-layer of the torch-sprite to (the current map layer + 1);
		change the display-layer of the occluder to (the current map layer - 1);
		if the display-layer of the occluder < 1:
			now the occluder is display-inactive;
		otherwise:
			now the occluder is display-active;
		if the current map layer < the uppermost map layer:
			repeat with item running through regions:
				if the region-layer of item is greater than the current map layer:
					repeat with chamber running through the rooms in item:
						now the location-sprite of chamber is display-inactive;
		if the current map layer > the uppermost map layer:
			now the uppermost map layer is the current map layer;
		if the current map layer > 1:
			repeat with space running through rooms in the map region of the location:
				if space is visited:
					now the location-sprite of space is display-active;
		if the location-sprite of the location is display-inactive:
			if in darkness:
				do nothing;
			otherwise:
				change the location-sprite of the location to display-active;
		follow the current graphics drawing rule.

	The torch-sprite activation rule is listed before the update map sprites rule in the carry out looking rules. The player-sprite activation rule is listed before the torch-sprite activation rule in the carry out looking rules. 

	This is the player-sprite activation rule:
		Change the sprite-coordinates of the player-sprite to the player-coordinates of the location.
		 	 
	This is the torch-sprite activation rule:
		if the player carries the torch:
			change the sprite-coordinates of the torch-sprite to the sprite-coordinates of the player-sprite offset by the held-offset of the torch-sprite;
		otherwise	:
			change the sprite-coordinates of the torch-sprite to the sprite-coordinates of the player-sprite offset by the dropped-offset of the torch-sprite;
		if the player can see the torch:
			now the torch-sprite is display-active;
		otherwise:
			now the torch-sprite is display-inactive.
			
	Report taking the torch:
		follow the torch-sprite activation rule;
		follow the player-sprite activation rule;
		follow the update map sprites rule.
		
	Report dropping the torch:
		follow the torch-sprite activation rule;
		follow the player-sprite activation rule;
		follow the update map sprites rule.


The geography and other elements of the game world follow. The room definitions include a pair of coordinates called the player-coordinates. These are the coordinates, given in terms of the background, where the icon representing the player's avatar should be placed so that it will appear properly within the graphic representation of the room.

	*: The description of the player is "Your matted hair rests heavy on your shoulders, your fingernails are long, yellowed, and splintered, your clothes threadbare and worn."

	Before taking inventory:
		Say "[the description of the player][line break]".

	A room has a list of numbers called the player-coordinates. The player-coordinates are usually {0, 0}. A room is usually dark.

	The Cell is a room. "The close, dank cell where you have spent so many days and nights. Very little light filters in from the hallway, but you known every chink in the stone walls and every loose bit of straw on the cobbled floor. The heavy wooden door in the south wall hangs open. Outside, silence." The player-coordinates are {304, 345}. The cell is lighted.

	Instead of going outside when in the Cell, try going south.

	The Central Hallway is south of the Cell. "A low hallway just wide enough for two overfed guards to drag a racked and bastinadoed prisoner between them. Soot darkens the ceiling at intervals along the hall, but most of the torches have gone out. The hall leads into darkness east and west." The player-coordinates are {305, 404}.

	Instead of going inside when in the Central Hallway, try going north.

	The torch is in the Central Hallway. "One torch burns valiantly in its sconce." The torch is lit. The description of the torch is "The torch's flame shows no sign of sputtering out." The printed name of the torch is "burning torch".

	Hallway East is east of the Central Hallway. "The hallway seems to open into a larger space to the east, and recedes into shadow back to the west." The printed name is "Hallway (east)". The player-coordinates are {478, 404}. 

	Hallway West is west of the Central Hallway. "The hallway ends in a blank wall to the west, and recedes into shadow again to the east." The printed name is "Hallway (west)". The player-coordinates are {146, 404}.

	The Guard Room is east of Hallway East. "Quiet. Nothing disturbed. Where are they? Perhaps up the stairs in the alcove to the southeast, or in...that room to the north?" The player-coordinates are {628, 404}. 

	The Torture Chamber is north of the Guard Room. "You shiver and focus your gaze resolutely at the center of the torch's pool of light. The room is empty but for the Implements. You want only to return to the south." The player-coordinates are {628, 160}.

	The Palatial Hall is a room. "The massive chamber where your imprisonment was pronounced. Shadows hang heavy among the columns. There was no exit then, and no exit now, apart from the stairs to the southeast." The player-coordinates are {558, 231}.

	The Tower Chamber is a room. "If it were daylight, you could glimpse your own castle from here--provided it still stands. As it is, the darkness outside this small chamber is total. There is no moon, no twinkling of stars. The stairwell is back to the southeast." The player-coordinates are {643, 376}.

	The Dungeon Stairs are southeast from the Guard Room. "Stairs spiral upward from this alcove." The player-coordinates are {683, 473}. 

	The Palace Stairs are up from the Dungeon Stairs and southeast from the Palatial Hall. "A massive space opens to the northwest, and the stairs continue up and down." The player-coordinates are {695, 461}.

	The Tower Stairs are up from the Palace Stairs and southeast from the Tower Chamber. "You have reached the summit of the tower. The stairs wend steeply downward, and a chamber opens to the northwest." The player-coordinates are {707, 449}.

	Before going to the Tower Stairs:
		say "The stairs spiral upward interminably, but in the end you emerge at the top of the:[line break]".

		
The "test me" command will show the full state of the map, with all sprites (except two of the three mutually exclusive titles) displayed:

	*: Test me with "s / get torch / w / e / e / e / n / s / se / u / nw / se / u / nw / drop torch".


Console by Aaron Reed begins here.

"Creates an external text file to which debugging information can be easily saved; support for displaying this file in a Glulx window."

Use authorial modesty.

Part  - No Console

To in the console say (msg - indexed text): do nothing. [In a released game, these statements are simply ignored.]

To csay (msg - indexed text): in the console say msg.

Part - Console (not for release)

Chapter - Setup

The File of Console Output is called "console". 

When play begins (this is the reset the console when play begins rule):
	write "" to File of Console Output.

Console message counter is a number that varies.

Chapter - in the console say

To in the console say (msg - indexed text):
	append "[msg][line break]" to File of Console Output;
	increase console message counter by 1.

Chapter - Windowed Console (for use with Flexible Windows by Jon Ingold)

Section - Setup

The console-window is a g-window. The main-window spawns the console-window. The position of the console-window is g-placeabove. The scale method of the console-window is g-proportional. The measurement of the console-window is 30.

Section - Console Toggling

Understand "console" as console toggling. Console toggling is an action out of world applying to nothing. console-on is a truth state that varies.

Carry out console toggling:
	if console-on is true:
		now console-on is false;
		shut down console-window;
	otherwise:
		now console-on is true;
		open up console-window.

Section - Drawing Rules

Saved console message counter is a number that varies.

Before reading a command when console-window is g-present (this is the update console window with new lines rule):
	move focus to console-window;
	let console-text be indexed text;
	now console-text is "[text of File of Console Output]";
	while saved console message counter < console message counter:
		increase saved console message counter by 1;
		say "[line number saved console message counter in console-text][line break]";
	say "[run paragraph on]";
	return to main screen.

A window-drawing rule for the console-window (this is the redraw the console window rule):
	move focus to console-window, clearing the window;
	say "[text of File of Console Output][run paragraph on]";
	return to main screen.

Console ends here.

---- DOCUMENTATION ----

This extension creates a new phrase that lets authors save diagnostic and debugging information into an external file, which should be called "console.glkdata" on most systems and appear in the same directory as the project. This keeps the main story file clear of clutter and allows testing information to be monitored through a text editor in a separate window. 

To write something to the console, use the phrase "in the console say" or its abbreviation, "csay," follow by text:

	in the console say "Testing whether gold present with [the noun].";
	csay "Testing whether gold present with [the noun].";

A line break is added after each say statement. The console is cleared each time the story is restarted. In a released project, all console-related phrases will be ignored.

When using a Glulx project and including the extension Flexible Windows by Jon Ingold (which should be included before this extension), you can additionally monitor the console from directly within your story. Type CONSOLE to activate a window displaying the console's contents, and CONSOLE again to close it.

Example: * Character Monitoring - Use the console to display information about NPC movements.

	*: "Character Monitoring"

	Include Flexible Windows by Jon Ingold. Include Console by Aaron Reed.  

	Hallway is north of Foyer and south of Ballroom. Dining Room is east of Ballroom. Stage is west of Ballroom.

	A guest is a kind of person. Alec, Betty, Cecil, Deidre, and Emile are guests in the Hallway.

	A mood is a kind of value. The moods are petulant, nonchalant, blase, and keen. A person has a mood. A person is usually petulant.

	Every turn:
		in the console say "*** Beginning NPC processing";
		repeat with NPC running through guests:
			now NPC is a random mood;
			if NPC is keen:
				let spot be location of NPC;
				let route be the best route from spot to a random room which is adjacent to spot;
				if route is a direction, try NPC going route;
			in the console say "[NPC] is [mood of NPC][if mood of NPC is keen], so moves to[otherwise]; in[end if] [location of NPC]."

	test me with "console / z / z".








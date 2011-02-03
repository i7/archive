Lines of Communication (for Glulx only) by Aaron Reed begins here.

"This extension creates a manager for file i/o, designed to ease communication with one or more external programs running in parallel with an Inform story. External programs can send parseable commands that are executed in the background when their associated file channel is switched on. Requires Real-Time Delays by Erik Temple."

Chapter - Definitions

A file channel is a kind of thing.

A file channel has an external file called the input file. A file channel has an external file called the output file.

A file channel can be switched on. A file channel is usually switched off.

Chapter - Enabling and Disabling

Understand "enable [any file channel]" as file enabling. File enabling is an action out of world applying to one thing. File enabling is restricted to file channels.

Check file enabling (this is the can only enable file channels rule): if noun is not a file channel, instead do nothing.

Carry out file enabling (this is the switch on file channels rule): now the noun is switched on.
	
Understand "disable [any file channel]" as file disabling. File disabling is an action out of world applying to one thing. File disabling is restricted to file channels.

Check file disabling (this is the can only disable file channels rule): if noun is not a file channel, instead do nothing.

Carry out file disabling (this is the switch off file channels rule): now the noun is switched off.

Chapter - Polling Frequency

The polling frequency in milliseconds is a number that varies. The polling frequency in milliseconds is usually 1000.

Chapter - Pinging

Pinging is an action out of world applying to nothing. Understand "ping" as pinging. [Just a do-nothing command to process when there are no real commands in the file to deal with.]

To say ping command: say "ping".
To say ping output: say ". [run paragraph on]".

Pinging is restricted to file channels.

Chapter - Marking commands from external files

processing external commands is a truth state that varies.

Before reading a command (this is the reset processing external files toggle rule): now processing external commands is false. 

Before restricted to file channels when processing external commands is false: instead say the file channels only error.

To say the file channels only error: issue miscellaneous library message number 38.

Section - More explicit file channels only error (not for release)

To say the file channels only error: say "That command is restricted to use only through external file channels (see the documentation for the extension Lines of Communication by Aaron Reed). This message will be replaced by a standard 'That's not a verb I recognise' upon release."

Chapter - Merged Inputs

[Read in lines from the inputs of the passed list of file channels, and combine them all into a single line separated by periods. This will prep the parser to execute all queued commands.]

To decide what indexed text is the merged inputs from (L - a list of objects):
	let finalCommand be indexed text;
	repeat with chan running through L:
		let incoming commands be indexed text;
		now incoming commands is "[text of the input file of chan]";
		replace the regular expression "\n+" in incoming commands with ". ";
		unless incoming commands is empty:
			unless finalCommand is empty, now finalCommand is "[finalCommand]. ";
			now finalCommand is "[finalCommand][incoming commands]";
		write "" to the input file of chan;
	decide on finalCommand.

Chapter - Real-time file channels

Include Real-Time Delays by Erik Temple.

A real-time file channel is a kind of file channel. 

For reading a command when a real-time file channel is switched on (this is the process real-time file channels rule):
	let incoming commands be indexed text;
	now incoming commands is the merged inputs from the list of switched on real-time file channels;	
	if incoming commands is empty:
		change the text of the player's command to "[ping command]";
	otherwise:
		change the text of the player's command to "[incoming commands]";
		now processing external commands is true;
		in the console say "[if the number of switched on real-time file channels is 1]real-time file channel [random switched on real-time file channel][otherwise]one or more real-time file channels[end if] caused command: *[the player's command]*";
	say "[ping output]".
	
Before reading a command when a real-time file channel is switched on: wait the polling frequency in milliseconds ms before continuing. 

Chapter - Background file channels

A background file channel is a kind of file channel.

The saved player's command is an indexed text variable. The saved player's command is "".

For reading a command when a background file channel is switched on and the saved player's command is not empty (this is the restore the player's saved command rule):
	change the text of the player's command to "[the saved player's command]";
	now the saved player's command is "".

After reading a command when a background file channel is switched on (this is the process background file channels rule):
	let incoming commands be indexed text;
	now incoming commands is the merged inputs from the list of switched on background file channels;
	unless incoming commands is empty:
		now processing external commands is true;
		now the saved player's command is "[the player's command]";
		change the text of the player's command to "[incoming commands]";
		in the console say "[if the number of switched on background file channels is 1]background file channel [random switched on background file channel][otherwise]one or more background file channels[end if] caused command: *[the player's command]*".

Chapter - Persistent Files

A file channel can be persistent.

Chapter - Cleanup

When play begins (this is the flush i/o files on startup rule):
	flush input files;
	flush output files.

To flush input files:
	repeat with chan running through not persistent file channels:
		write "" to the input file of chan.
		
To flush output files:
	repeat with chan running through not persistent file channels:
		write "" to the output file of chan.	

Chapter - Output

To inform (channel - a file channel) that (cmd - an indexed text), overwriting all else:
	if overwriting all else:
		write "[cmd][line break]" to output file of channel;
		in the console say "informing [channel] that *[cmd]*, overwriting all else";
	otherwise:
		append "[cmd][line break]" to output file of channel;
		in the console say "informing [channel] that *[cmd]*".
 
Chapter - No Console (for use without Console by Aaron Reed)

To in the console say (msg - indexed text): do nothing.

Lines of Communication ends here.

---- DOCUMENTATION ----

This extension creates a manager for file i/o, designed to ease communication with one or more external programs running in parallel with an Inform story. External programs can send parseable commands to a Glulx story that are executed in the background when their associated file channel is switched on. For instance, you might have a fast external chess algorithm. With this extension you could send the player's moves to it:

	inform the chess computer that "play queen's gamble"

...and receive back a parseable command like:

	"PLAY KNIGHT'S ORANGUTAN"

Hooks make it easy to detect which commands are coming from external files, and change behaviors accordingly (in this case, for instance, redirecting the command to be tried by a non-player character in the story). Accepting parseable commands means authors don't need to write their own text-parsing routines to deal with incoming data.

Real-Time Delays by Erik Temple is required for this extension. Including Console by Aaron Reed provides optional debugging support.

Section: Setup

Before creating a file channel, you must first create one or both of its input and output files, using whatever internal name and file name you choose. ("Input" and "output" are from the perspective of the Inform program.) On most systems, the quoted filenames will have ".glkdata" appended to them when created.

	The File of chess-input is called "chessInput". The File of chess-output is called "chessOutput". 

	The File of high scores is called "highScore". 

File channels are only active when they are switched on. They come in two types: background file channels, which only look for and execute incoming commands when the player submits a move, and real-time file channels, which pause the game and don't allow the player to type new commands until the channel is switched off.

A file channel's i/o files are normally blanked out each time the story is restarted: to override this, they can optionally be declared persistent.

File channels must be declared and assigned an input and/or output file:

	The chess computer is a real-time file channel. The input file is File of chess-input. The output file is File of chess-output. 

	The high score roster is a persistent switched on background file channel. The output file is File of high scores.

The extension can handle multiple file channels of any kind being switched on simultaneously, and will automatically queue multiple incoming commands for execution.

Section: Communicating with File Channels

To send some text to a file channel:

	inform the chess computer that "play queen's gamble";

(You can of course use any style of outgoing communication you like and that your external program expects, as long as it can be represented by a line of text.)

Multiple outgoing commands will be automatically placed on individual lines. External programs are expected to clear lines as they accept each one for input. These programs should honor Inform's file format expectations (i.e. the first line should be left alone; the first character identifies whether the file is locked or unlocked; etc., see Files in the documentation for more information.)

For incoming data, external programs should write one command per line (or multiple commands separated by periods) to the input file. You should ensure that these commands can be successfully parsed by your story. The extension will clear an input line it has finished reading from the file.

Since external files are sending parseable commands, it's possible for your players to use these commands too, if they know what they are. While often it's enough to create new verbs with obscure names, you can also definitively restrict an action to only be allowed when passed in by a file channel by marking it "restricted to file channels."

	Updating meta info is an action applying to one thing. Updating meta info is restricted to file channels.

You can also check directly whether a command was generated by an external file rather than the player by checking the truth state "processing external commands" during any action rule.

Section: Background File Channels

Switched on background file channels will submit any accumulated commands just before the player's next command is executed. This is useful for background processes that can continue while the player is still interacting with the story.

Section: Real-time File Channels

Switched on real-time file channels will halt execution of the Inform story until they are switched off; any number of incoming commands can be accepted in the interim. You can switch off any file channel by simply making it so:

	now chess computer is switched off;

File channels can also switch themselves off by using the DISABLE action on the name of the channel. 

	DISABLE CHESS COMPUTER

An ENABLE action is also provided, which might allow one channel to switch on another, or the player to have control over switching channels. (Both actions are restricted to file channels by default, but this can be overridden.)

Real-time channels will poll their input files every 1000 milliseconds (one second) by default: you can customize this by changing the "polling frequency in milliseconds".

	The polling frequency in milliseconds is 500.

By default, at each polling interval the extension will print a dot and a space, to indicate to the player that something is still happening. You can change what's printed by writing a new "say ping output" rule. For instance, to print nothing at all:

	To say ping output: say "[run paragraph on]".

Section: Debugging

The extension can log useful debugging information to an external file (which can be displayed live in a secondary Glulx window) if the optional extension Console by Aaron Reed is included. See the documentation for Console for more details.

Section: Possible Future Improvements

* Some way to time out a real-time file channel, either after a certain elapsed time or as a result of a player cancellation.

* Support for receiving data not designed to be parsed as a command. This could overcome limitations with using the extension to interface with (say) an external conversation system, which would be awkward since parsed commands don't preserve casing and can't contain as many special characters.

Example: * Smarter Smarter Parser - Send unrecognized commands to an external text parser.

One could imagine doing much more sophisticated text processing on commands not recognized by the Inform parser, perhaps involving external libraries like WordNet or ConceptNet. Here's how you could set this up on the Inform side. To simulate the external recognizer, try typing in an invalid command and then putting a valid one in the "recognizerInput.glkdata" file.

	*: "Smarter Smarter Parser"

	Include Lines of Communication by Aaron Reed.

	The File of recognizer-input is called "recognizerInput". The File of recognizer-output is called "recognizerOutput". 

	The recognizer is a real-time file channel. The input file is File of recognizer-input. The output file is File of recognizer-output. 

	Before printing a parser error:
		inform the recognizer that "[the player's command]";
		now the recognizer is switched on.
	
	For printing a parser error when recognizer is switched on: do nothing.
	
	Before doing anything when the recognizer is switched on:
		say "[line break](reparsed that as '[the player's command]')";
		now the recognizer is switched off.

	The Forest is a room. A tree and a boulder are fixed in place in forest. A deer is an animal in forest.

Example: * Background Hint Processing - Hint processing in the background while the player continues.

Here, we use a background file channel to work on recommending a course of action while the player keeps playing. We send information to the hint system about important game state changes-- new locations discovered and acquired objects. Then, when the player requests a hint, we turn on the hint system and let it chug until it comes up with a recommendation.

To simulate this, try moving around a little and observing how "hintOutput.glkdata" updates. Then type BACKUP to request a hint, make a few more moves, and put something like "recommend get the knife" in "hintInput.glkdata". Make another move in the story and observe the result.

	*: "Background Hint Processing"

	Include Lines of Communication by Aaron Reed.

	The File of hint-input is called "hintInput". The File of hint-output is called "hintOutput". 

	The hint system is a background file channel. The input file is File of hint-input. The output file is File of hint-output. 

	After taking something:
		inform hint system that "take [noun]";
		continue the action.
	
	Before going to an unvisited room (called the new place):
		inform hint system that "go [new place]";
		continue the action.
	
	Understand "backup" as requesting a hint. Requesting a hint is an action applying to nothing.

	Carry out requesting a hint:
		say "You pull out your walkie-talkie and radio base. 'Captain, I could really use some advice here,' you say.[paragraph break]'Roger that,' the Captain says, 'I'll analyze your situation and get back to you.'";
		inform hint system that "hintrequest";
		now hint system is switched on.

	Understand "recommend [text]" as recommending. Recommending is an action applying to one topic. Recommending is restricted to file channels.

	Carry out recommending:
		say "Your radio crackles. 'Echo niner, captain here,' it says. 'Recommend you [the topic understood]. Repeat, [the topic understood].'[paragraph break]'Roger wilco,' you say.";
		now hint system is switched off.

	Intersection is a room. It is south of Bedroom, east of Dining Room, west of Foyer, and north of Kitchen. An apple and a knife are in Kitchen. A bed is fixed in place in Bedroom. A coat and a hat are in Foyer.

Example: ** Man vs Robot - Imagining a chess match with both an external chess computer and a peanut gallery of online commenters.

This example demonstrates using two simultaneous file channels: a chess computer and a peanut gallery. Both receive the player's moves, but the chess computer responds with commands to play (which are parsed differently while this channel is switched on) and the peanut gallery responds with text utterances, presumably from some chat server which the external module is ferrying game moves to.

To test this, try to PLAY one of the gambits, then open up commentOutput.glkdata and try saving a command like "SUGGEST ooh look, he's weak on the left flank!" (without the quotes). For the computer to make up its mind, add a line like "PLAY BISHOP'S UNMENTIONABLES" to chessOutput.glkdata. Set the polling speed in milliseconds to a high number to see how the extension can correctly deal with input from both sources if they come in at the same time.

	*: "Man vs Robot"

	Include Lines of Communication by Aaron Reed. 

	The File of chess-input is called "chessInput". The File of chess-output is called "chessOutput". 

	The chess computer is a real-time file channel. The input file is File of chess-input. The output file is File of chess-output. 

	The File of comment-input is called "commentInput". The File of comment-output is called "commentOutput".  

	The peanut gallery is a real-time file channel. The input file is File of comment-input. The output file is File of comment-output.

	The Arena is a room. A hulking metal robot is a man in Arena. A chessboard is here. For writing a paragraph about robot: say "Your opponent, a hulking metal robot, hunches over [the chessboard]."   

	A chess gambit is a kind of thing. The queen's gamble, the bishop's unmentionables, and the knight's orangutan are chess gambits in Arena. For writing a paragraph about a chess gambit: say "Possible strategies include [the list of visible chess gambits]." 

	Understand "play [a chess gambit]" as playing. Playing is an action applying to one thing.

	Check playing when chess computer is switched on: instead try the robot playing the noun.
	
	Carry out playing:
		say "Boldly, you play [the noun]. Your opponent begins to think. [run paragraph on]";
		inform chess computer that "[the noun]";
		now chess computer is switched on;
		inform peanut gallery that "Human plays [the noun]!";
		now peanut gallery is switched on.

	Carry out the robot playing:
		say "[paragraph break]The robot's gears finally grind, and it decides to play [the noun]. 'YOUR MOVE,' it grates.";
		now chess computer is switched off;
		inform peanut gallery that "Robot plays [the noun]!";
		now peanut gallery is switched off.
	 
	Understand "suggest [text]" as suggesting. Suggesting is an action applying to one topic. Carry out suggesting: say "Comment from the peanut gallery: '[the topic understood]'". 






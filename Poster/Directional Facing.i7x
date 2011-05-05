Version 2 of Directional Facing by Poster begins here.

"Allows the player to move by forward, backward, left, and right depending on which way he is facing."

[Gloria Dei.]

Include Basic Screen Effects by Emily Short. 
Include Unicode Character Names by Graham Nelson. 

Facing relates various things to one direction. The verb to be facing implies the Facing relation.

[Change this value to false if you want to allow compass directions in addition to relative directions. The default value, true, forbids compass directions.]
Disallow_compass_dirs is a truth state that varies.
Disallow_compass_dirs is true. 

DF_Use_in_out is a truth state that varies.
DF_Use_in_out is false.

A room has a direction called auto_facing.

Understand "e" and "w" and "s" and "n" and "nw" and "ne" and "se" and "sw" as "[standard_dirs_short]".
Understand "east" and "west" and "south" and "north" and "northeast" and "northwest" and "southwest" and "southeast" as "[standard_dirs_long]".

Before examining something that is facing a direction (called the way):
	now the player is facing the opposite of the way.

before going somewhere:
	If DF_Use_in_out is false:
		Now the player is facing the noun;
	

Lturning is an action applying to nothing.
Understand "turn left" as lturning.
Instead of lturning:
	Say "You turn to your left.[line break]";
	If the player is facing south:
		Now the player is facing east;
		Rule succeeds;
	If the player is facing east:
		Now the player is facing north;
		Rule succeeds;		
	If the player is facing north:
		Now the player is facing west;
		Rule succeeds;
	If the player is facing west:
		Now the player is facing south;
		Rule succeeds;

Rturning is an action applying to nothing.
Understand "turn right" as rturning.
Instead of rturning:
	Say "You turn to your right.[line break]";
	If the player is facing south:
		Now the player is facing west;
		Rule succeeds;
	If the player is facing west:
		Now the player is facing north;
		Rule succeeds;		
	If the player is facing north:
		Now the player is facing east;
		Rule succeeds;
	If the player is facing east:
		Now the player is facing south;
		Rule succeeds;

[Turning around.]
Aturning is an action applying to nothing.
Understand "turn around" as aturning.

Instead of aturning:
	Say "You turn around and face the other way.[line break]";
	If the player is facing south:
		Now the player is facing north;
		Rule succeeds;
	If the player is facing west:
		Now the player is facing east;
		Rule succeeds;		
	If the player is facing east:
		Now the player is facing west;
		Rule succeeds;
	If the player is facing north:
		Now the player is facing south;
		Rule succeeds;

Sturning is an action applying to nothing.
Instead of sturning:
	If the player is facing south:
		Now the player is facing north;
		Rule succeeds;
	If the player is facing west:
		Now the player is facing east;
		Rule succeeds;		
	If the player is facing east:
		Now the player is facing west;
		Rule succeeds;
	If the player is facing north:
		Now the player is facing south;
		Rule succeeds;

understand "go left/right/forward/back/backward/backwards/l/r/f/b" or "left/right/forward/back/backward/backwards/l/r/f/b" as "[going-directional]".
After reading a command:
	Now DF_Use_in_out is false;
	if the player's command matches "[going-directional]":
		if the player's command includes "left":
			replace matched text with "l";
		if the player's command includes "right":
			 replace matched text with "r";
		if the player's command includes "forward":
			 replace matched text with "f";
		if the player's command includes "back":
			 replace matched text with "b"; 
		if the player's command includes "backward":
			 replace matched text with "b"; 
		if the player's command includes "backwards":
			 replace matched text with "b";
		if the player is facing north:
			if the player's command includes "l", replace the matched text with "w";
			if the player's command includes "r", replace the matched text with "e";
			if the player's command includes "f", replace the matched text with "n";
			if the player's command includes "b", replace the matched text with "s";
		if the player is facing south:
			if the player's command includes "l", replace matched text with "e";
			if the player's command includes "r", replace matched text with "w";
			if the player's command includes "f", replace matched text with "s";
			if the player's command includes "b", replace matched text with "n";
		if the player is facing east:
			if the player's command includes "l", replace matched text with "n";
			if the player's command includes "r", replace matched text with "s";
			if the player's command includes "f", replace matched text with "e";
			if the player's command includes "b", replace matched text with "w";
		if the player is facing west:
			if the player's command includes "l", replace matched text with "s";
			if the player's command includes "r", replace matched text with "n";
			if the player's command includes "f", replace matched text with "w";
			if the player's command includes "b", replace matched text with "e";
	else:
		let junk be zero;
		if player's command includes "exit", let junk be one;
		if player's command includes "leave", let junk be one;
		if player's command includes "out", let junk be one;
		if player's command includes "in", let junk be two;
		if junk is one:
			Now DF_Use_in_out is true;
			let temproom be the room outside from the location;
			if temproom is not a room:
				Make no decision;
			else:
				let tempaf be the auto_facing of the location;
				if tempaf is not a direction:
					Now the player is facing north;
				else:
					Now the player is facing tempaf; 
		if junk is two:
			Now DF_Use_in_out is true;
			let temproom be the room inside from the location;
			if temproom is not a room:
				Make no decision;
			else:
				let tempaf be the auto_facing of the location;
				if tempaf is not a direction:
					Now the player is facing south;
				else:
					Now the player is facing tempaf;
		if disallow_compass_dirs is false:
			Make no decision;
		[Otherwise, we are forbidding them.]
		if the player's command includes "[standard_dirs_long]":
			Say "[bracket]This game uses relative directions instead of compass directions: left, right, forward(s), and back(wards).[close bracket][line break]";
			Stop the action;
		else if the player's command includes "[standard_dirs_short]":
			Say "[bracket]This game uses relative directions instead of compass directions: left, right, forwards, and backwards.[close bracket][line break]";
			Stop the action;
		else:
			Make no decision.

[How do I get it to do caps if at beginning of a sentence? That would be ideal.]
To say (way - a direction) directional:
	if the way is north Begin;
		if player is facing north, say "in front of you";
		if player is facing south, say "behind you";
		if player is facing east, say "to your left";
		if player is facing west, say "to your right";
	end if;
	if the way is south Begin;
		if player is facing south, say "in front of you";
		if player is facing north, say "behind you";
		if player is facing east, say "to your right";
		if player is facing west, say "to your left";
	end if;
	if the way is east Begin;
		if player is facing east, say "in front of you";
		if player is facing west, say "behind you";
		if player is facing south, say "to your left";
		if player is facing north, say "to your right";
	end if;
	if the way is west Begin;
		if player is facing west, say "in front of you";
		if player is facing east, say "behind you";
		if player is facing north, say "to your left";
		if player is facing south, say "to your right";
	end if.

To say top rose:
	let place be the room up from the location;
		if the place is a room, say "U   "; otherwise say "    "; 
	let place be the room northwest from the location;
		if place is a room, say "NW"; otherwise say "  ";
	let place be the room north from the location;
		if place is a room, say " N "; otherwise say "   ";
	let place be the room northeast from the location;
		if place is a room, say "NE"; otherwise say "  ".
	
To say middle rose:
	if player is facing up begin;
		say "[unicode black up-pointing triangle]   ";
	else;
		if player is facing down Begin;
			say "[unicode black down-pointing triangle]   ";
		else;
			say "    ";
		end if;
	end if;
	let place be the room west from the location;
		if place is a room, say "W "; otherwise say "  ";
	if player is facing north, say " [unicode black up-pointing triangle] ";
	if player is facing south, say " [unicode black down-pointing triangle] ";
	if player is facing east, say " [unicode black right-pointing pointer] ";
	if player is facing west, say " [unicode black left-pointing pointer] ";
	if player is facing northwest, say " [unicode bullet operator] ";
	if player is facing southwest, say " [unicode bullet operator] ";
	if player is facing northeast, say " [unicode bullet operator] ";
	if player is facing southeast, say " [unicode bullet operator] ";
	if player is facing up, say " [unicode bullet operator] ";
	if player is facing down, say " [unicode bullet operator] ";
	if player is not facing a direction, say " [unicode bullet operator] ";
	let place be the room east from the location;
		if place is a room, say " E"; otherwise say "  ".
	
To say bottom rose:
	let place be the room down from the location;
		if place is a room Begin;
			say "D   "; 
		otherwise;
			say "    ";
		end if;
	let place be the room southwest from the location;
		if place is a room, say "SW"; otherwise say "  ";
	let place be the room south from the location;
		if place is a room, say " S "; otherwise say "   ";
	let place be the room southeast from the location;
		if place is a room, say "SE"; otherwise say "  ".


Directional Facing ends here.

---- DOCUMENTATION ----

Chapter: How to Use this Extension


Section: Do This First

Under the directive "When play begins:", you must type "The player is facing <zzz>" where <zzz> is a cardinal compass direction. The extension does not fully work unless you do this. 


Section: Movement

Directional Facing allows the player to say "go forward" and the player moves the direction he's facing. Directions allowed are "forward" or "f", "back" or "b", "left" or "l", and "right" or "r".  "inside" or "in", "outside" or "out", and "exit" are also supported, with a tiny bit of modification to the rooms that use them.

For rooms that use in/out (and for exit from rooms with one entrance/exit), you can allow the player to face a particular way when leaving. This ensures that any relative direction descriptions work in room he's entering. To do this, set the  auto_facing for the room to the direction you wish the player to face. If you don't, the player faces north upon entering. (This extension gives all rooms the auto_facing property.)

At this time, the diagonal directions -- NW, NE, SE, SW -- are not supported. The status bar printout does not have an indicator for NE, NW, SE, or SW, and that is the holdup.


Section: Room Descriptions

When typing descriptions, type "[<zzz> directional]" to produce a description that says "to your left", "to your right", "in front of you", or "behind you" depending on the direction the player is facing. "<zzz>" is one of the cardinal compass directions: north, south, east, or west. When the player moves to a new room, he will face the way he is traveling.


Section: Other Objects

This also adds the relation "to be facing [a direction]". When making anything, we can type "[the thing] is facing north" and when the player examines it, he will first face south - the direction opposite the thing is facing so they are face to face. This also works with people. However, setting a facing for objects and people is not mandatory; examine will still work if an object or person does not have an orientation.


Section: New Verbs

There are several new verbs that allow greater control over the PC:
	
	aturn ("turn around")
	lturn ("turn left")
	rturn ("turn right")
	sturn - An internal-only verb that turns the PC around silently. 


Section: Status Bar

Use the following code for Status Bar Use (be sure to replace any spaces in the table with tabs if an error occurs):

	Table of Fancy Status
	left	central	right 
	""	""	"[top rose]"
	" [location]"	"[time of day]"	"[middle rose]"
	""	""	"[bottom rose]"
	 	
	Rule for constructing the status line:
		fill status bar with Table of Fancy Status;
		rule succeeds.


Chapter: Shortcomings, Unfinished Business, and Contact Info

This extension is not NPC-aware. Everything in it is written to handle PCs only. It also uses the present tense. I don't know how much effort (probably not much) is required to fix those, but as I didn't need those capabilities, I didn't bother with them.

I don't know if the compass rose stuff works. I left that unchanged from V1. 

If you find something horribly awry, want to send me money, or have a marriage offer, contact me at poster@aurora.cotse.net.


Chapter: Change Log

Version 1 (Tim Pittman). 
	Initial release.

Version 2 (Poster).
	Added new verbs: turn around, turn left/right, and turn around silently.
	Added support for going out/in.
	Added support for forbidding compass directions.
	Corrected directionals (previously they were flipped).
	Updated/corrected documentation.
	
[I hate how examples have to go last to look good.]	

Example: * In And Out - An example of in, out, and auto_facing.

	*: "In And Out"

	[This is an example of how to use the auto_facing property, so that the directionals work when a player goes in or out.]

	Include Directional Facing by Poster.

	When play begins:
	Now the player is facing north.
	
	Defecatory is a room. "Just the name makes you want to go #2. A beautiful door leads out [north directional]."
	
	The auto_facing of Defecatory is north.
	Outside from Defecatory is Urinal Mint City.
	North from Defecatory is Urinal Mint City.

	Urinal Mint City is a room. "You are surrounded by a bedazzling array of urinal mints, most of which are deeply discounted! A small, nasty door leads in [south directional]."
	 
	The auto_facing of Urinal Mint City is south.
	Inside from Urinal Mint City is Defecatory.
	South from Urinal Mint City is Defecatory.

	Test me with "f / b / n"
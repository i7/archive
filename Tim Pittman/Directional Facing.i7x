Version 1 of Directional Facing by Tim Pittman begins here.

"Allows the player to move by forward, backward, left, and right depending on which way he is facing."

Include Basic Screen Effects by Emily Short. Include Unicode Character Names by Graham Nelson. 

Facing relates various things to one direction. The verb to be facing implies the Facing relation.

Before examining something that is facing a direction (called the way):
	now the player is facing the opposite of the way.

before going somewhere:
	now the player is facing the noun.

understand "go left/right/forward/back/backward/backwards/l/r/f/b" or "left/right/forward/back/backward/backwards/l/r/f/b" as "[going-directional]".
After reading a command:
	if the player's command matches "[going-directional]" Begin;
		if the player's command includes "left", replace matched text with "l";
		if the player's command includes "right", replace matched text with "r";
		if the player's command includes "forward", replace matched text with "f";
		if the player's command includes "back", replace matched text with "b"; if the player's command includes "backward", replace matched text with "b"; if the player's command includes "backwards", replace matched text with "b";
		if the player is facing north Begin;
			if the player's command includes "l", replace matched text with "w";
			if the player's command includes "r", replace matched text with "e";
			if the player's command includes "f", replace matched text with "n";
			if the player's command includes "b", replace matched text with "s";
		end if;
		if the player is facing south Begin;
			if the player's command includes "l", replace matched text with "e";
			if the player's command includes "r", replace matched text with "w";
			if the player's command includes "f", replace matched text with "s";
			if the player's command includes "b", replace matched text with "n";
		end if;
		if the player is facing east Begin;
			if the player's command includes "l", replace matched text with "n";
			if the player's command includes "r", replace matched text with "s";
			if the player's command includes "f", replace matched text with "e";
			if the player's command includes "b", replace matched text with "w";
		end if;
		if the player is facing west Begin;
			if the player's command includes "l", replace matched text with "s";
			if the player's command includes "r", replace matched text with "n";
			if the player's command includes "f", replace matched text with "w";
			if the player's command includes "b", replace matched text with "e";
		end if;
	else;
		make no decision;
	end if.

To say (way - a direction) directional:
	if the way is north Begin;
		if player is facing north, say "in front of you";
		if player is facing south, say "behind you";
		if player is facing east, say "to your right";
		if player is facing west, say "to your left";
	end if;
	if the way is south Begin;
		if player is facing south, say "in front of you";
		if player is facing north, say "behind you";
		if player is facing west, say "to your right";
		if player is facing east, say "to your left";
	end if;
	if the way is east Begin;
		if player is facing east, say "in front of you";
		if player is facing west, say "behind you";
		if player is facing south, say "to your right";
		if player is facing north, say "to your left";
	end if;
	if the way is west Begin;
		if player is facing west, say "in front of you";
		if player is facing east, say "behind you";
		if player is facing north, say "to your right";
		if player is facing south, say "to your left";
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

Directional Facing allows the player to say "go forward" and the player moves the direction he's facing. Directions allowed are "go forward" or "f", "go back" or "b", "go left" or "l", and "go right" or "r".

When typing descriptions, we can type "[north directional]" and get a description that say "to your left", "to your right", "in front of you", or "behind you" depending on the direction the player is facing.

Finnaly, this adds the relation "to be facing [a direction]". When making anything, we can type "[the thing] is facing north" and when the player examines it, he will first face south - the direction opposite the thing is facing so they are face to face. This also works with people. At the begining of our story, we can type "the player is facing north" and he will start out facing north. Things can be not facing any direction. When the player moves to a new room, he will face the way he is traveling.

(note: only works properly for the four main compas directions - Do not attempt to use descriptions for any other directions, it will return blank)

(in future versions, I hope to include all other directions - The hold up, the status bar printout does not have an indicator for NE, NW, SE, or SW...)


Use the following code for Status Bar Use (be sure to replace any spaces in the table with tabs if an error occurs):

	Table of Fancy Status
	left	central	right 
	""	""	"[top rose]"
	" [location]"	"[time of day]"	"[middle rose]"
	""	""	"[bottom rose]"
	 	
	Rule for constructing the status line:
		fill status bar with Table of Fancy Status;
		rule succeeds.

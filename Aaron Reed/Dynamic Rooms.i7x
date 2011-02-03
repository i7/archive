Dynamic Rooms by Aaron Reed begins here.

"Lets new rooms be created on the fly."

Section - Initialization

A dynamic room is a kind of room.

The unformed room list is a list of objects that varies.

First when play begins (this is the Dynamic Rooms initialization rule):
	change the unformed room list to the list of dynamic rooms.

Section - Utility

To decide what number is available dynamic rooms:
	decide on the number of entries in the unformed room list.

To decide what number is used dynamic rooms: decide on the number of dynamic rooms - the number of entries in the unformed room list.

To decide whether out of dynamic rooms:
	if available dynamic rooms is 0, decide yes;
	decide no.


Section - Creating a room

To decide which object is a newly created room with name (new name - some text):
	if out of dynamic rooms, decide on location;
	let selected be entry 1 in the unformed room list;
	change the printed name of selected to new name;
	remove selected from unformed room list;
	decide on selected.

To decide which object is a newly created room (dir - a direction) of/from (place - a room) with name (new name - some text):
	let excavation be a newly created room with name new name;
	change the dir exit of place to excavation;
	change the ( opposite of dir ) exit of excavation to place;
	decide on excavation.


Section - Deleting a room

To dissolve (rm - a room):
	now printed name of rm is "room";
	now description of rm is "";
	repeat with dir running through directions:
		if the room dir from rm is a room:
			change the ( opposite of dir ) exit of ( the room dir from rm ) to nothing;
			change the dir exit of rm to nothing;
	add rm to the unformed room list, if absent.
	

Dynamic Rooms ends here.

---- DOCUMENTATION ----

With this extension, you can easily create and destroy new rooms during play. While this is technically possible with Jesse McGrew's "Dynamic Objects," the method here is simpler, customized for rooms, and available for both z-code and Glulx.

The extension works by creating a reserve of empty rooms when the game first begins and swapping them in and out as needed. The author must declare the maximum number of dynamic rooms that will be needed:

	There are 50 dynamic rooms.

This statement should appear *after* you define your initial starting room (unless you explicitly move the player when play begins). Also note that you can only define 100 duplicates at once, but for more, you could chain a series of definition statements. (Repeating the above statement three times would produce 150 dynamic rooms.) Note, though, that large numbers of dynamic rooms will start to slow down your game considerably.

Before creating a new room, you need to check whether there are any unused rooms left. You can use the phrase:

	if out of dynamic rooms

Or perform more elaborate calculations by checking the number of:

	available dynamic rooms
	used dynamic rooms

To create a new room, you must give it a printed name and assign it to an object variable:

	let excavation be a newly created room with name "Cave";

By default, the new room will have no entrances or exits. For convenience, you can instead create a room with a reciporical exit connecting to any existing location via the shortcut phrase:

	let excavation be a newly created room east of location with name "Cave";

To destroy a room:

	dissolve excavation;

This will remove any exits to or from the room and un-name it; you must account in your own code for the possibility that the player might be in the dissolved room when this happens, otherwise she would be trapped there.

Example: * Frobozz Magic Excavator - Allow the player to create new rooms.

	*: "Frobozz Magic Excavator"

	Include Dynamic Rooms by Aaron Reed.  

	Cave is a room. There are 10 dynamic rooms. 

	The player holds a Frobozz Magic Excavator. Instead of examining Excavator, say "Try DIG (a direction)." Instead of dropping Excavator, say "But you'd lose points!".
 
	Understand "dig [a direction]" as excavating. Excavating is an action applying to one visible thing.
 
	Check excavating:      
		let way be noun;
		if the room way from location is a room, say "You've already excavated in that direction." instead;
		if out of dynamic rooms, say "Your Frobozz Magic Excavator seems to be out of juice." instead.   
	   
	Carry out excavating: 
		let rm be a newly created room noun of location with name "Cave";
		say "You power up your Frobozz Magic Excavator and tunnel out a passage to the [noun]. As you finish, the charge indicator drops to ([available dynamic rooms] out of [the number of dynamic rooms]).".
	
	Definition: a direction (called thataway) is viable if the room thataway from the location is a room.

	After looking: 
		let count of exits be the number of viable directions; 
		if the count of exits is 0, say "You appear to be trapped in here." instead;
		if the count of exits is 1, say "From here, the only way out is to [a list of viable directions].";
		otherwise say "From here, the viable exits are to [a list of viable directions]."

Note that nothing in this example prohibits the player from making arrangements of rooms that make no spatial sense. With great power comes great responsibility.

Example: ** Cave-In - A randomly generated map.

In this example, we'll generate a random map of ten rooms, and also add the possibility for the floor to collapse and new rooms to be created below the current location.

	*: "Cave-In"

	Include Dynamic Rooms by Aaron Reed.  

	When play begins: say "Stunned, you brush yourself off and stand to your feet. It looks like you fell quite a way through that cave in. Let's hope you can find another way to the surface-- and that the floor is more solid on this level.".

	Cave-In is a room. Daylit Passage is a room.

	There are 15 dynamic rooms.

	The viable cave directions list is a list of objects that varies. The viable cave directions list is {northeast, northwest, southeast}. 

	The cave room names list is a list of texts that varies. The cave room names list is {"Passage", "Cavern", "Tunnel", "Hallway", "Maze", "Scramble", "Jumble"}.

	When play begins:
		let current room be Cave-In;
		let cave name be text;
		let new room be Cave-In;
		let dir be north;
		while available dynamic rooms > 5:
			now dir is entry ( a random number from 1 to the number of entries in the viable cave directions list ) in the viable cave directions list;  
			if the room dir from current room is a room, now current room is the room dir from current room;
			now cave name is entry ( a random number from 1 to the number of entries in cave room names list ) in cave room names list;
			now new room is a newly created room dir of current room with name cave name;
			if a random chance of 1 in 3 succeeds, now current room is new room;
		change the up exit of current room to Daylit Passage.

	Every turn when location is Daylit Passage: end the game in victory.

	fall count is a number that varies.

	Every turn when we are going and a random chance of 1 in 4 succeeds:
		if the room down from location is nowhere and the printed name of location is not "Pit" and available dynamic rooms > 0:
			let collapse be a newly created room down from location with name "Pit";
			say "Suddenly, the floor gives way underneath you and you fall, adding to your injuries!";
			increase fall count by 1;
			if fall count > 3:
				say "[line break]The fall proves fatal!";
				end the game in death;
			else:
				try going down.
		
	Definition: a direction (called thataway) is viable if the room thataway from the location is a room.

	After looking: 
		let count of exits be the number of viable directions; 
		if the count of exits is 0:
			say "The fresh sunlight shines on your face.";
		else if the count of exits is 1:
			say "From here, the only way out is to [a list of viable directions].";
		else:
			say "From here, the viable exits are to [a list of viable directions].";
		continue the action. 


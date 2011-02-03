Version 3/071115 of Instead of Going by Mikael Segercrantz begins here.

"Replacing the standard library's Instead of going nowhere and Instead of going <a direction> with something smarter."

Use authorial modesty.

Include Case Management by Emily Short.

[From version 2 onward, we require the extension Shipboard Directions by the same author.]
Include Shipboard Directions by Mikael Segercrantz.


Part 1 - Globalia

Chapter 1(a) - Use options

Section 1(a)1 - Use smart can't go to

Use smart can't go to translates as (- Constant SMART_CANT_GO_TO = 1; -).

Section 1(a)2 - Use smarter can't go to

Use smarter can't go to translates as (- Constant SMART_CANT_GO_TO = 2; -).

Section 1(a)3 - Use smartest can't go to

Use smartest can't go to translates as (- Constant SMART_CANT_GO_TO = 3; -).


Chapter 1(b) - Modifications

Section 1(b)1 - Room

A room has some text called can't go north. The can't go north of a room is usually "nothing".
A room has some text called can't go northeast. The can't go northeast of a room is usually "nothing".
A room has some text called can't go east. The can't go east of a room is usually "nothing".
A room has some text called can't go southeast. The can't go southeast of a room is usually "nothing".
A room has some text called can't go south. The can't go south of a room is usually "nothing".
A room has some text called can't go southwest. The can't go southwest of a room is usually "nothing".
A room has some text called can't go west. The can't go west of a room is usually "nothing".
A room has some text called can't go northwest. The can't go northwest of a room is usually "nothing".
A room has some text called can't go inside. The can't go inside of a room is usually "nothing".
A room has some text called can't go outside. The can't go outside of a room is usually "nothing".
A room has some text called can't go up. The can't go up of a room is usually "nothing".
A room has some text called can't go down. The can't go down of a room is usually "nothing".
A room has some text called can't go aft. The can't go aft of a room is usually "nothing".
A room has some text called can't go fore. The can't go fore of a room is usually "nothing".
A room has some text called can't go port. The can't go port of a room is usually "nothing".
A room has some text called can't go starboard. The can't go starboard of a room is usually "nothing".
A room has some text called general can't go. The general can't go of a room is usually "nothing".


Chapter 1(c) - Globals

Section 1(c)1 - No way out

No way out is text which varies. No way out is "You can't see a way out from here."

Section 1(c)2 - Only one exit

Only one exit is text which varies. Only one exit is "The only visible exit is".

Section 1(c)3 - Multiple exits

Multiple exits is text which varies. Multiple exits is "The visible exits are".


Part 2 - Rules

Chapter 2(a) - Instead of rules

Section 2(a)1 - Instead of going north

Instead of going north:
	let way be north;
	let prop be the can't go north of location;
	if managing can't go way with prop, continue the action.

Section 2(a)2 - Instead of going northeast

Instead of going northeast:
	let way be northeast;
	let prop be the can't go northeast of location;
	if managing can't go way with prop, continue the action.

Section 2(a)3 - Instead of going east

Instead of going east:
	let way be east;
	let prop be the can't go east of location;
	if managing can't go way with prop, continue the action.

Section 2(a)4 - Instead of going southeast

Instead of going southeast:
	let way be southeast;
	let prop be the can't go southeast of location;
	if managing can't go way with prop, continue the action.

Section 2(a)5 - Instead of going south

Instead of going south:
	let way be south;
	let prop be the can't go south of location;
	if managing can't go way with prop, continue the action.

Section 2(a)6 - Instead of going southwest

Instead of going southwest:
	let way be southwest;
	let prop be the can't go southwest of location;
	if managing can't go way with prop, continue the action.

Section 2(a)7 - Instead of going west

Instead of going west:
	let way be west;
	let prop be the can't go west of location;
	if managing can't go way with prop, continue the action.

Section 2(a)8 - Instead of going northwest

Instead of going northwest:
	let way be northwest;
	let prop be the can't go northwest of location;
	if managing can't go way with prop, continue the action.

Section 2(a)9 - Instead of going inside

Instead of going inside:
	let way be inside;
	let prop be the can't go inside of location;
	if managing can't go way with prop, continue the action.

Section 2(a)10 - Instead of going outside

Instead of going outside:
	let way be outside;
	let prop be the can't go outside of location;
	if managing can't go way with prop, continue the action.

Section 2(a)11 - Instead of going up

Instead of going up:
	let way be up;
	let prop be the can't go up of location;
	if managing can't go way with prop, continue the action.

Section 2(a)12 - Instead of going down

Instead of going down:
	let way be down;
	let prop be the can't go down of location;
	if managing can't go way with prop, continue the action.

Section 2(a)13 - Instead of going fore

Instead of going fore:
	let way be fore;
	let prop be the can't go fore of location;
	if managing can't go way with prop, continue the action.

Section 2(a)14 - Instead of going starboard

Instead of going starboard:
	let way be starboard;
	let prop be the can't go starboard of location;
	if managing can't go way with prop, continue the action.

Section 2(a)15 - Instead of going aft

Instead of going aft:
	let way be aft;
	let prop be the can't go aft of location;
	if managing can't go way with prop, continue the action.

Section 2(a)16 - Instead of going port

Instead of going port:
	let way be port;
	let prop be the can't go port of location;
	if managing can't go way with prop, continue the action.


Chapter 2(b) - Deciding rules

Section 2(b)1 - To decide whether managing can't go

To decide whether managing can't go (way - a direction) with (prop - text):
	let place be the room the way from the location;
	if place is a room, decide yes;
	if prop is "nothing"
	begin;
		if the general can't go of the location is "nothing"
		begin;
			if using the smart can't go to option
			begin;
				list available exits;
			otherwise;
				if using the smarter can't go to option
				begin;
					list available exits, mentioning visited rooms;
				otherwise;
					if using the smartest can't go to option
					begin;
						list available exits, mentioning all rooms;
					otherwise;
						decide yes;
					end if;
				end if;
			end if;
		otherwise;
			say "[general can't go of the location][paragraph break]";
		end if;
	otherwise;
		say "[prop][paragraph break]";
	end if;
	decide no.


Chapter 2(c) - Other rules

Section 2(c)1 - To list available exits

To list available exits, mentioning visited rooms or mentioning all rooms:
	let count be 0;
	repeat with way running through directions
	begin;
		let place be the room the way from the location;
		if place is a room, increase count by 1;
	end repeat;
	if count is 0
	begin;
		say "[No way out][paragraph break]";
	otherwise;
		if count is 1, say "[Only one exit]";
		otherwise say "[Multiple exits]";
		let original count be count;
		repeat with way running through directions
		begin;
			let place be the room the way from the location;
			if place is a room
			begin;
				say " [way]";
				if mentioning visited rooms and place is visited, say " (to [the place in lower case])";
				if mentioning all rooms, say " (to [the place in lower case])";
				let count be count minus 1;
				if count is 0, say ".";
				if count is 1 and original count is 2, say " and";
				if count is 1 and original count is not 2, say "[can't go to optional comma] and";
				if count is at least 2, say ",";
			end if;
		end repeat;
	end if.

Section 2(c)2 - To say can't go to optional comma

To say can't go to optional comma:
	if using the serial comma option, say ",".


Instead of Going ends here.

---- DOCUMENTATION ----

Chapter: Requirements

This extension requires the extension Shipboard Directions by the same author.

Chapter: Options

We can choose to use one or none of three options:

	Use smart can't go to.
	Use smarter can't go to.
	Use smartest can't go to.

Without any of these, the extension lets the action continue to print out the library's message for not being able to go somewhere (normally "You can't go that way."). If we choose the first one, going in a direction which has no exit and no can't go message specified for it lists the exits of the room. Using the second one, we get the same list of exits, except for visited rooms we get an annotation of where the exit leads us. If we choose to use the third one, we get the annotations on all rooms, even if unvisited. Note that the options are exclusive, if we use one, we cannot use another.

Chapter: Messages

This extension defines 17 messages for the room kind, namely

	can't go north
	can't go northeast
	can't go east
	can't go southeast
	can't go south
	can't go southwest
	can't go west
	can't go northwest
	can't go inside
	can't go outside
	can't go up
	can't go down
	can't go fore
	can't go starboard
	can't go aft
	can't go port
	general can't go

each one being some text. The default value of each is "nothing", meaning the extension is to perform the appropriate action depending on which one, if any, of the use options provided by the extension are in effect.

The messages can't go fore, can't go starboard, can't go aft and can't go port support the extension Shipboard Directions, which this extension automatically includes.

The extension also creates three global text variables, with their default values being

	no way out - "You can't see a way out of here."
	only one exit - "The only visible exit is"
	multiple exits - "The visible exits are"

used in the exit lister.

Chapter: Phrases

The extension provides one phrase that can be used, with two optional exclusive phrase options. The possibilities are

	list available exits
	list available exits, mentioning visited rooms
	list available exits, mentioning all rooms

and they correspond to the use options described above.


Example: * A Short Way Out 1 - A basic example of how to use custom can't go messages

	*: "A Short Way Out"

	Include Instead of Going by Mikael Segercrantz.

	The Kitchen is a room. "Your basic kitchen, with all the required appliances."

	The Hallway is a room. "A large hallway, leading north towards the sitting room. The door outside is nearby."
	The hallway is east of the kitchen. The can't go north of the hallway is "You have no wish to meet your in-laws at the moment."

	Outside from the hallway is a room called Outside the House. The description of outside the house is "Finally, you've made it outside!".

	Every turn:
		if the location is outside the house, end the game in victory.

	test me with " w / e / n / e / out ".

Example: * A Short Way Out 2 - Slightly elaborated version of the above example, using smart exit listing.

	*: "A Short Way Out"

	Include Instead of Going by Mikael Segercrantz.

	Use smart can't go to.

	The Kitchen is a room. "Your basic kitchen, with all the required appliances."

	The Hallway is a room. "A large hallway, leading north towards the sitting room. The door outside is nearby."
	The hallway is east of the kitchen. The can't go north of the hallway is "You have no wish to meet your in-laws at the moment."

	Outside from the hallway is a room called Outside the House. The description of outside the house is "Finally, you've made it outside!".

	Every turn:
		if the location is outside the house, end the game in victory.

	test me with " w / e / n / e / out ".

Example: * A Short Way Out 3 - Still more elaborated, this time smarter exit listing and overridden default messages for the lister.

	*: "A Short Way Out"

	Include Instead of Going by Mikael Segercrantz.

	Use smarter can't go to.

	No way out is "There's currently no way out from here."
	Only one exit is "The only exit you can see is".
	Multiple exits is "You can see many exits, namely".

	The Kitchen is a room. "Your basic kitchen, with all the required appliances."

	The Hallway is a room. "A large hallway, leading north towards the sitting room. The door outside is nearby."
	The hallway is east of the kitchen. The can't go north of the hallway is "You have no wish to meet your in-laws at the moment."

	Outside from the hallway is a room called Outside the House. The description of outside the house is "Finally, you've made it outside!".

	Every turn:
		if the location is outside the house, end the game in victory.

	test me with " w / e / n / e / out ".

Example: *** Printing the Room Description - Creating an activity for printing the room description, which uses the list available exits phrase.

	*: "Printing the Room Description"

	Include Instead of Going by Mikael Segercrantz.

We start by declaring the activity.

	Printing the room description is an activity.

	For printing the room description:
		if mode is verbose
		begin;
			say "[description of the location][paragraph break]";
			list available exits, mentioning visited rooms;
		otherwise;
			if mode is brief and the location has not been visited
			begin;
				say "[description of the location][paragraph break]";
				list available exits, mentioning visited rooms;
			end if;
		end if.

Now we need to create the two decision rules referenced above.

	To decide if mode is verbose:
		(- lookmode == 2 -).

	To decide if mode is brief:
		(- lookmode == 1 -).

And then let us override the standard looking mechanism to use our activity:

	Procedural rule:
		substitute the room description activity rule for the room description body text rule.

	This is the room description activity rule:
		carry out the printing the room description activity.

And that's it. Now to add a few rooms just to test this out.

	The Driveway is a room. "A driveway, leading up to the house and down south towards the street."

	The Porch is a room. "A simple porch, with a rocking chair in it." It is north of the driveway.

	The Hallway is a room. "A hallway, with a helical staircase on one side." It is north of the porch.

	The Dining Room is a room. "A large dining room, dominated by a massive oaken table." It is east of the hallway.

	The Kitchen is a room. "A kitchen, large enough to supply the large dining room with food." It is east of the dining room.

	The Sitting Room is a room. "A sitting room, with some shelves of books." It is west of the hallway.

	The Upper Hall is a room. "A hallway, leading to the different bedrooms in the house." It is above the hallway.

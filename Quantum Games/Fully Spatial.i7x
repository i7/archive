Fully Spatial by Quantum Games begins here.

"Allows the player to look and examine directions much more fully using a table system."

Use authorial modesty.

Part I - Looking in a Direction from a Room

The examine directions rule is not listed in the carry out examining rulebook.

First carry out examining (this is the Fully Spatial examine directions rule):
	if the noun is a direction:
		repeat through the Table of Direction Descriptions:
			if the place entry is the printed name of the location of the player and the way entry is the printed name of the noun:
				if there is a description entry:
					say "[description entry][line break]";
				otherwise:
					say "[direction without description value][line break]";
		stop the action;

The direction without description value is a text variable. The direction without description value is "You see nothing unexpected in that direction.".

When play begins (this is the number off rooms and directions rule):
	let Q be 1;
	repeat with R running through rooms:
		repeat with S running through directions:
			now the place in row Q of the Table of Direction Descriptions is the printed name of R;
			now the way in row Q of the Table of Direction Descriptions is the printed name of S;
			now Q is Q + 1;

Table of Direction Descriptions
Place (text)	way (text)	description (text)
with 2000 blank rows

Part II - A special testing command - Not for release

Understand "direcnum" as numbering direction descriptions. Numbering direction descriptions is an action out of world, applying to nothing.

Report numbering direction descriptions (this is the list numbered rooms and directions rule):
	let Q be 1;
	repeat with R running through rooms:
		repeat with S running through directions:
			say "[Q]. [place in row Q of the Table of Direction Descriptions], [way in row Q of the Table of Direction Descriptions][line break]";
			now Q is Q + 1;

Fully Spatial ends here.

---- DOCUMENTATION ----

Chapter: How to use this extension

Section: How does it work?

Fully Spatial allows the player to look and examine certain directions much more fully. The secret? A table system. As soon as the game is started, Fully Spatial takes into account every single combination of rooms and directions (yes, you read that right), and conveniently numbers them all in one table so you may refer to any given combination using just one number.

Section: Limits

There are limits to using this extension, but it will be very unlikely that you ever come across them. If the number of rooms in your game multiplied by the number of directions in your game is equal to 2000 or more, you will not be able to use Fully Spatial. Also, you must not have two rooms with the same printed name because the system relies on the fact that each room's printed name must be different. How sad. Moving on.

Section: Checking for the corresponding number

To create the view of a certain direction from a certain room, you must first start your game. (To start your game in Inform, press the Go! button) At the command prompt, type the special testing command >DIRECNUM (which stands for DIRECtion-description NUMbering). You will see a list that might look like this:

	1. First Room, north
	2. First Room, northeast
	3. First Room, northwest
	...

Section: Writing the description

Each combination of direction and room is numbered, so you need to find the number corresponding to the direction from the room which you would like to be examined. Since Fully Spatial relies on a table system, you have to use the following phrase (let's say my corresponding number is 9):

	now the description in row 9 of the Table of Direction Descriptions is "You could look at the ceiling all day if it wasn't for this quest.";

Of course, where it says "row 9" you need to change the 9 to your corresponding number (unless it's also 9), and your description goes at the end, in between the quotation marks.

Chapter: Changing the default message

Section: How to change the default

Normally, Fully Spatial makes the game reply the following when you examine a direction without a description (at least from that particular room):

	You see nothing unexpected in that direction.

But you can change that message! All you need to do is type:

	now the direction without description value is "You are too focused on your quest to look back there now.";

Again, just change the text inside the quotations to whichever message you would like to display.

Example: * Circus - A circus where you can look in and examine all directions.

This is a real-life example of when the player might look in certain directions.

	*: "Circus"
	
	Include Fully Spatial by Quantum Games.

	There is a room called Outside the Tent. "This is the wonderful outdoors, which happen to be near a circus tent. You can enter the tent to the east."

	There is a room called the Circus. "This is the great circus, with amazing acts in all directions. There is an exit to the west."

	The Circus is east of Outside the Tent.

	When play begins:
		now the description in row 1 of the Table of Direction Descriptions is "Grass and hills extend to the north.";
		now the description in row 2 of the Table of Direction Descriptions is "Grass and hills extend to the northeast.";
		now the description in row 3 of the Table of Direction Descriptions is "Grass and hills extend to the northwest.";
		now the description in row 4 of the Table of Direction Descriptions is "There is a fenced-off small village to the south.";
		now the description in row 5 of the Table of Direction Descriptions is "There is a fenced-off small village to the southeast.";
		now the description in row 6 of the Table of Direction Descriptions is "There is a fenced-off small village to the southwest.";
		now the description in row 7 of the Table of Direction Descriptions is "The brightly coloured circus tent welcomes you.";
		now the description in row 8 of the Table of Direction Descriptions is "Grass and hills extend to the west.";
		now the description in row 9 of the Table of Direction Descriptions is "The sky is particularly clear today.";
		now the description in row 10 of the Table of Direction Descriptions is "A yellow path leads east to the circus tent.";
		now the description in row 11 of the Table of Direction Descriptions is "You peek inside the tent and see circus acts everywhere!";
		now the description in row 12 of the Table of Direction Descriptions is "The sky is bright, the wind is breezy.";
		now the description in row 13 of the Table of Direction Descriptions is "You can see a pair of jugglers to the north.";
		now the description in row 14 of the Table of Direction Descriptions is "You can see a caged lion to the northeast.";
		now the description in row 15 of the Table of Direction Descriptions is "You can see the audience cheering to the northwest.";
		now the description in row 16 of the Table of Direction Descriptions is "The ringleader is south of you, conducting the circus.";
		now the description in row 17 of the Table of Direction Descriptions is "There is a magician to the southeast.";
		now the description in row 18 of the Table of Direction Descriptions is "You can see a sign reading 'Welcome' to the southwest.";
		now the description in row 19 of the Table of Direction Descriptions is "There is a locked merchandise store to the east.";
		now the description in row 20 of the Table of Direction Descriptions is "There is an exit to the west.";
		now the description in row 21 of the Table of Direction Descriptions is "There is a tightrope act happening right above you.";
		now the description in row 22 of the Table of Direction Descriptions is "There are some stairs below you leading northwest.";
		now the description in row 23 of the Table of Direction Descriptions is "There are circus acts everywhere!";
		now the description in row 24 of the Table of Direction Descriptions is "You peek outside, and can see a bright blue sky.";

	Test me with "look / look north / look southeast / look up / e / look outside / look up / look up / look south / w".

Of course, what if you want the description to change, based on a condition? The solution to this is to use Before, Instead and After rules, like this:

	*: "Circus 2"

	Include Fully Spatial by Quantum Games.

	There is a room called Outside the Tent. "This is the wonderful outdoors, which happen to be near a circus tent. You can enter the tent to the east."

	There is a room called the Circus. "This is the great circus, with amazing acts in all directions. There is an exit to the west."

	The Circus is east of Outside the Tent.

	The tightrope check is a number variable. The tightrope check is 0.

	After examining up while the player is in the Circus:
		now the tightrope check is 1;
		now the description in row 21 of the Table of Direction Descriptions is "There is a tightrope act finishing right above you.";

	When play begins:
		now the description in row 1 of the Table of Direction Descriptions is "Grass and hills extend to the north.";
		now the description in row 2 of the Table of Direction Descriptions is "Grass and hills extend to the northeast.";
		now the description in row 3 of the Table of Direction Descriptions is "Grass and hills extend to the northwest.";
		now the description in row 4 of the Table of Direction Descriptions is "There is a fenced-off small village to the south.";
		now the description in row 5 of the Table of Direction Descriptions is "There is a fenced-off small village to the southeast.";
		now the description in row 6 of the Table of Direction Descriptions is "There is a fenced-off small village to the southwest.";
		now the description in row 7 of the Table of Direction Descriptions is "The brightly coloured circus tent welcomes you.";
		now the description in row 8 of the Table of Direction Descriptions is "Grass and hills extend to the west.";
		now the description in row 9 of the Table of Direction Descriptions is "The sky is particularly clear today.";
		now the description in row 10 of the Table of Direction Descriptions is "A yellow path leads east to the circus tent.";
		now the description in row 11 of the Table of Direction Descriptions is "You peek inside the tent and see circus acts everywhere!";
		now the description in row 12 of the Table of Direction Descriptions is "The sky is bright, the wind is breezy.";
		now the description in row 13 of the Table of Direction Descriptions is "You can see a pair of jugglers to the north.";
		now the description in row 14 of the Table of Direction Descriptions is "You can see a caged lion to the northeast.";
		now the description in row 15 of the Table of Direction Descriptions is "You can see the audience cheering to the northwest.";
		now the description in row 16 of the Table of Direction Descriptions is "The ringleader is south of you, conducting the circus.";
		now the description in row 17 of the Table of Direction Descriptions is "There is a magician to the southeast.";
		now the description in row 18 of the Table of Direction Descriptions is "You can see a sign reading 'Welcome' to the southwest.";
		now the description in row 19 of the Table of Direction Descriptions is "There is a locked merchandise store to the east.";
		now the description in row 20 of the Table of Direction Descriptions is "There is an exit to the west.";
		now the description in row 21 of the Table of Direction Descriptions is "There is a tightrope act happening right above you.";
		now the description in row 22 of the Table of Direction Descriptions is "There are some stairs below you leading northwest.";
		now the description in row 23 of the Table of Direction Descriptions is "There are circus acts everywhere!";
		now the description in row 24 of the Table of Direction Descriptions is "You peek outside, and can see a bright blue sky.";

	Test me with "look / look north / look southeast / look up / e / look outside / look up / look up / look south / w".

The part of the preceding example which says "examining up" means that the player is typing >LOOK UP or something similar.
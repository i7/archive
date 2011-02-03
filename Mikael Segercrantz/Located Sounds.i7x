Version 2/080508 of Located Sounds (for Glulx only) by Mikael Segercrantz begins here.

Table of Located Sounds
location		sound			message
an object	a sound-name		text

LS Nothing Unexpected is text that varies. LS Nothing Unexpected is "You hear nothing unexpected."

This is the basic listening rule:
	let spoken be 0;
	repeat through the Table of Located Sounds:
		if the noun is the location entry:
			now spoken is 1;
			if there is a message entry, say "[message entry][paragraph break]";
			if there is a sound entry, play the sound entry;
	if spoken is 0, say "[LS Nothing Unexpected]";
	continue the action.

The basic listening rule is listed in the carry out listening to rules.

Procedural rule: ignore the block listening rule.

Located Sounds ends here.

---- Documentation ----

Chapter: Usage
Location Sounds allows us to assign a sound and a message to each room and item of the game.

Section: The Table of Located Sounds

The base of the sound and message assignment is the Table of Located Sounds, which is defined as follows:

	Table of Located Sounds
	location		sound			message
	an object	a sound-name		text

and used by continuing it in the game itself.

Section: LS Nothing Unexpected

This extension defines a text variable called LS Nothing Unexpected. By default, it is set to

	You hear nothing unexpected.

but can be overridden, eg. in a When play begins -rule, like so

	When play begins:
		Change LS Nothing Unexpected to "It[']s quiet, too quiet."

Section: The Basic Listening Rule

We also define a rule called the basic listening rule, which is placed in the carry out listening to rulebook, and we mark the block listening rule to be ignored.

Example: * To Listen Is Golden - Shows how to set up the sounds and to listen to different items and rooms.

	*: "To Listen Is Golden"

	Include Version 2 of Located Sounds by Mikael Segercrantz.

	Sound of frogs is the file "Frogs.ogg".
	Sound of the highway is the file "Highway.ogg".
	Sound of the chopper is the file "Chopper.ogg".

	The Pond is a room. "An almost quiet pond, with the sound of frogs crooning. The highway is to the east."

	The Highway is east of the Pond. "A busy highway, with cars zooming both ways. The quiet pond is back to the west."

	The Chopper is in the highway. "A chopper is hovering right above you." The description is "It's flying low, so low you could almost touch it.". It is fixed in place. Instead of taking the chopper, say "It's just out of reach.".

	Table of Located Sounds (continued)
	location		sound			message
	The Pond	Sound of frogs		"You can hear some frogs crooning."
	The Highway	Sound of the highway	"Cars zoom past you, and the sound is almost deafening."
	The Chopper	Sound of the chopper	"The rotor whirls around, creating a force of sound reaching you."

	Test me with "listen / listen / listen to chopper".

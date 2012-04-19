Touchy Feely by Quantum Games begins here.

"Allows the player to use the other senses on things much more fully. Works well with, but does not require, Fully Spatial by Quantum Games."

Use authorial modesty.

Part I - Feels

Understand "touch" as touching the room. Touching the room is an action applying to nothing.

A thing has some text called the feel. The feel of a thing is usually "".

A room has some text called the feel. The feel of a room is usually "".

The report touching yourself rule is not listed in the report touching rulebook.

The report touching other people rule is not listed in the report touching rulebook.

The report touching things rule is not listed in the report touching rulebook.

Report touching (this is the Touchy Feely report touching rule):
	if the feel of the noun is not "":
		say "[the feel of the noun][line break]";
	otherwise:
		say "[thing without feel value][line break]";

Report touching the room (this is the Touchy Feely report touching the room rule):
	if the feel of the location of the player is not "":
		say "[the feel of the location of the player][line break]";
	otherwise:
		say "[thing without feel value][line break]";

The thing without feel value is a text variable. The thing without feel value is "You feel nothing unexpected.".

Part II - Scents

A thing has some text called the scent. The scent of a thing is usually "".

A room has some text called the scent. The scent of a room is usually "".

The block smelling rule is not listed in the check smelling rulebook.

Report smelling (this is the Touchy Feely report smelling rule):
	if the noun is nothing:
		if the feel of the location of the player is not "":
			say "[the scent of the location of the player][line break]";
		otherwise:
			say "[thing without scent value][line break]";
	otherwise:
		if the scent of the noun is not "":
			say "[the scent of the noun][line break]";
		otherwise:
			say "[thing without scent value][line break]";

The thing without scent value is a text variable. The thing without scent value is "You smell nothing unexpected.".

Part III - Tastes

Understand "taste" as tasting the room. Tasting the room is an action applying to nothing.

A thing has some text called the taste. The taste of a thing is usually "".

A room has some text called the taste. The taste of a room is usually "".

The block tasting rule is not listed in the check tasting rulebook.

Report tasting (this is the Touchy Feely report tasting rule):
	if the taste of the noun is not "":
		say "[the taste of the noun][line break]";
	otherwise:
		say "[thing without taste value][line break]";

Report tasting the room (this is the Touchy Feely report tasting the room rule):
	if the taste of the location of the player is not "":
		say "[the taste of the location of the player][line break]";
	otherwise:
		say "[thing without taste value][line break]";

The thing without taste value is a text variable. The thing without taste value is "You taste nothing unexpected.".

Part IV - Sounds

Understand "hear" as listening.

A thing has some text called the sound. The sound of a thing is usually "".

A room has some text called the sound. The sound of a room is usually "".

The block listening rule is not listed in the check listening to rulebook.

Report listening to (this is the Touchy Feely report listening rule):
	if the noun is nothing:
		if the sound of the location of the player is not "":
			say "[the sound of the location of the player][line break]";
		otherwise:
			say "[thing without sound value][line break]";
	otherwise:
		if the sound of the noun is not "":
			say "[the sound of the noun][line break]";
		otherwise:
			say "[thing without sound value][line break]";

The thing without sound value is a text variable. The thing without sound value is "You hear nothing unexpected.".

Part V - Descriptions

Understand "see" as looking.

Understand "see [something]" as examining.

Part VI - Special testing commands - Not for release

Understand "testfeel" as testing the feel of things. Testing the feel of things is an action out of world, applying to nothing.

Report testing the feel of things (this is the Touchy Feely feel testing rule):
	repeat with R running through things:
		if the feel of R is not "":
			say "[R]: [feel of R][line break]";
		otherwise:
			say "[R]: [thing without feel value][line break]";
	repeat with R running through rooms:
		if the feel of R is not "":
			say "[R]: [feel of R][line break]";
		otherwise:
			say "[R]: [thing without feel value][line break]";

Understand "testscent" as testing the scent of things. Testing the scent of things is an action out of world, applying to nothing.

Report testing the scent of things (this is the Touchy Feely scent testing rule):
	repeat with R running through things:
		if the scent of R is not "":
			say "[R]: [scent of R][line break]";
		otherwise:
			say "[R]: [thing without scent value][line break]";
	repeat with R running through rooms:
		if the scent of R is not "":
			say "[R]: [scent of R][line break]";
		otherwise:
			say "[R]: [thing without scent value][line break]";

Understand "testtaste" as testing the taste of things. Testing the taste of things is an action out of world, applying to nothing.

Report testing the taste of things (this is the Touchy Feely taste testing rule):
	repeat with R running through things:
		if the taste of R is not "":
			say "[R]: [taste of R][line break]";
		otherwise:
			say "[R]: [thing without taste value][line break]";
	repeat with R running through rooms:
		if the taste of R is not "":
			say "[R]: [taste of R][line break]";
		otherwise:
			say "[R]: [thing without taste value][line break]";

Understand "testsound" as testing the sound of things. Testing the sound of things is an action out of world, applying to nothing.

Report testing the sound of things (this is the Touchy Feely sound testing rule):
	repeat with R running through things:
		if the sound of R is not "":
			say "[R]: [sound of R][line break]";
		otherwise:
			say "[R]: [thing without sound value][line break]";
	repeat with R running through rooms:
		if the sound of R is not "":
			say "[R]: [sound of R][line break]";
		otherwise:
			say "[R]: [thing without sound value][line break]";

Touchy Feely ends here.

---- DOCUMENTATION ----

Chapter: Feeling

Section: How does it work?

Like a description, but for touching instead of examining, every thing in the model world has something called a "feel". To declare the feel of something works almost exactly like declaring the description of something:

	The feel of the fluff is "You feel a fluffy sensation run through your fingers.".

Section: Changing the default message

Normally, Touchy Feely makes the game reply the following when you feel something which does not have a feel:

	You feel nothing unexpected.

But you can change that message! All you need to do is type:

	now the thing without feel value is "Touching that would just waste your time.";

Just change the text inside the quotations to whichever message you would like to display.

Section: A special testing command

The action >TESTFEEL lets you check the feel of every thing in the model world.

Chapter: Smelling

Section: How does it work?

Like a description, but for smelling instead of examining, every thing in the model world has something called a "scent". To declare the scent of something works almost exactly like declaring the description of something:

	The scent of the flower is "The flower smells strange and plastic.".

Section: Changing the default message

Normally, Touchy Feely makes the game reply the following when you smell something which does not have a scent:

	You smell nothing unexpected.

But you can change that message! All you need to do is type:

	now the thing without scent value is "Smelling that would just waste your time.";

Just change the text inside the quotations to whichever message you would like to display.

Section: A special testing command

The action >TESTSCENT lets you check the scent of every thing in the model world.

Chapter: Tasting

Section: How does it work?

Like a description, but for tasting instead of examining, every thing in the model world has something called a "taste". To declare the taste of something works almost exactly like declaring the description of something:

	The taste of the spaghetti plate is "You taste a noodle. It tastes delicious!".

Section: Changing the default message

Normally, Touchy Feely makes the game reply the following when you taste something which does not have a taste:

	You taste nothing unexpected.

But you can change that message! All you need to do is type:

	now the thing without taste value is "Tasting that would just waste your time.";

Just change the text inside the quotations to whichever message you would like to display.

Section: A special testing command

The action >TESTTASTE lets you check the taste of every thing in the model world.

Chapter: Hearing

Section: How does it work?

Like a description, but for hearing instead of examining, every thing in the model world has something called a "sound". To declare the sound of something works almost exactly like declaring the description of something:

	The sound of the magical guitar is "You hear every single style of music emanating from the guitar at once.".

Section: Changing the default message

Normally, Touchy Feely makes the game reply the following when you hear something which does not have a sound:

	You hear nothing unexpected.

But you can change that message! All you need to do is type:

	now the thing without sound value is "Listening to that would just waste your time.";

Just change the text inside the quotations to whichever message you would like to display.

Section: A special testing command

The action >TESTSOUND lets you check the sound of every thing in the model world.

Chapter: Rooms

Section: How does it work?

Touchy Feely works with rooms as well as things. Just treat a room the same way you would treat a thing:

	The scent of Odd Room Infinity is "It smells infinitely odd here.".

Example: * Sensing Lab - A lab where you can look at (description), hear (sound), taste (taste), touch (feel), and smell (scent).

This is a real-life example of when the player will need to use their senses.

	*: "Sensing Lab"

	Include Touchy Feely by Quantum Games.

	When play begins:
		now the thing without sound value is "Silence. Absolute silence.";

	There is a room called the Sensing Lab. "This is the Sensing Lab, where you can test your five senses."

	The feel of the Sensing Lab is "It feels very cold and equally damp here.".

	The scent of the Sensing Lab is "It smells like toxic chemicals, due to the experiments that were carried out here yesterday.".

	The taste of the Sensing Lab is "The air here tastes like chemical reactions.".

	There is a feather in the Sensing Lab. "A feather sits here, waiting to be experimented on."

	The description of the feather is "This feather looks very grey and lifeless at the moment.".

	The feel of the feather is "The feather feels extremely ticklish on your fingers.".

	The scent of the feather is "The feather smells like chemical reactions.".

	The taste of the feather is "The feather is extremely ticklish on your tongue.".

	The sound of the feather is "The feather is making a soft 'whoosh' noise, as if it were just a machine.".

	Before listening to the feather:
	now the description of the feather is "On second thoughts, you can see some gears poking out of the feather...";

	Test me with "look / listen / feel / smell / taste / feel feather / smell feather / taste feather / look at feather / listen to feather / look at feather".
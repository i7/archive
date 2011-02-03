Version 1 of Spellcasting by Jim Aikin begins here.

"A system for creating magic spells that can be cast anywhere, but that the player must learn before using."

Section 1 - Definition, Some Spells, and Table

A magic-spell is a kind of backdrop. A magic-spell can be learned or unlearned. A magic-spell is usually unlearned.

xyzzy is a magic-spell. It is everywhere.

Table of Spells
Spell		Output			Directed Output	Description
xyzzy		"You cast the xyzzy spell, but nothing happens."	"You cast the xyzzy spell at [the second noun], but nothing happens."		"The xyzzy spell does nothing much."

Section 2 - Trapping Non-Allowed References to Spell Objects & Spell-Casting Verb

Instead of doing anything when the noun is a magic-spell (this is the pretend the spell is invisible rule):
	if the current action is casting something:
		continue the action;
	otherwise if the current action is casting something at something:
		continue the action;
	otherwise if the current action is zapping:
		continue the action;
	otherwise:
		say "[cant-see-any-such]".
	
[This rule handles the case where the player types 'cast X'. When the intended action is "cast", we want a different error message, not "You can't see any such thing," since one can't see spells. However, if word 1 is "cast" and word 2 is the name of a spell, then we're getting the parser error because something later in the input made no sense, so in this case we DO want "You can't see any such thing."]
	
Rule for printing a parser error when parser error is can't see any such thing (this is the new can't see any such thing rule):
	let T be indexed text;
	let T be the player's command;
	if word number 1 in T is "cast":
		let W be word number 2 in T;
		repeat with N running from 1 to the number of rows in the Table of Spells:
			let S be the spell in row N of the Table of Spells;
			let SS be the printed name of S;
			if W is SS:
				say "[cant-see-any-such]";
				stop the action;
		say "[unknown-spell]";
	otherwise:
		say "[cant-see-any-such]".

[This rule handles the case where the player tries to cast a spell (learned or unlearned) at an object that is not in scope or does not exist. Without this rule, Inform would reply, "That's not a verb I recognize," which would be misleading if the spell were known. So we need to trap the first word in the input and look at it. If it's a spell, we need to output a different error message.]
		
Rule for printing a parser error when parser error is not a verb I recognise (this is the new not a verb I recognise rule):
	let T be indexed text;
	let T be the player's command;
	let W be word number 1 in T;
	repeat with N running from 1 to the number of rows in the Table of Spells:
		let S be the [name of the] spell in row N of the Table of Spells;
		let SS be the printed name of S;
		if W is SS:
			say "[cant-see-any-such]";
			stop the action;
	continue the action.
		
Section 3 - New Actions

Zapping is an action applying to two things. Understand "[magic-spell] [something]" as zapping.

Carry out zapping:
	try casting the noun at the second noun instead.

Casting is an action applying to one thing. Understand "[magic-spell]" and "cast [something]" as casting.

Check casting:
	let found-it be a truth state;
	let found-it be false;
	let its-learned be a truth state;
	let its-learned be false;
	repeat with N running from 1 to the number of rows in the Table of Spells:
		if the spell in row N of the Table of Spells is the noun:
			now found-it is true;
			if the noun is learned:
				now its-learned is true;
	if found-it is true:
		if its-learned is false:
			say "[unlearned-spell]";
			stop the action;
		otherwise:
			continue the action;
	otherwise:
		say "[not-a-spell]";
		stop the action.
		
Carry out casting:
	repeat with N running from 1 to the number of rows in the Table of Spells:
		if the spell in row N of the Table of Spells is the noun:
			say "[output in row N of the Table of Spells][line break]".

Casting it at is an action applying to two things. Understand "cast [something] at [something]" as casting it at.

Check casting it at:
	let found-it be a truth state;
	let found-it be false;
	let its-learned be a truth state;
	let its-learned be false;
	repeat with N running from 1 to the number of rows in the Table of Spells:
		if the spell in row N of the Table of Spells is the noun:
			now found-it is true;
			if the noun is learned:
				now its-learned is true;
	if found-it is true:
		if its-learned is false:
			say "[unlearned-spell]";
			stop the action;
		otherwise:
			continue the action;
	otherwise:
		say "[not-a-spell]";
		stop the action.
		
Carry out casting it at:
	repeat with N running from 1 to the number of rows in the Table of Spells:
		if the spell in row N of the Table of Spells is the noun:
			say "[directed output in row N of the Table of Spells][line break]".
			
Section 4 - Supplying Information

Spellchecking is an action out of world applying to nothing. Understand "spells" as spellchecking.

Carry out spellchecking:
	let found-one be a truth state;
	let found-one be false;
	repeat with N running from 1 to the number of rows in the Table of Spells:
		if the spell in row N of the Table of Spells is learned:
			now found-one is true;
	if found-one is false:
		say "[no-spells-learned]";
	otherwise:
		say "You are the master of the following spells:[line break]";
		repeat with N running from 1 to the number of rows in the Table of Spells:
			if the spell in row N of the Table of Spells is learned:
				say "[spell in row N of the Table of Spells]:   ";
				say "[description in row N of the Table of Spells][line break]".

Section 5 - Error Messages

To say no-spells-learned:
	say "You have not learned any spells."

To say cant-see-any-such:
	say "You can't see any such thing."
	
To say unlearned-spell:
	say "I'm not quite sure what you meant by that."

To say not-a-spell:
	say "[The noun] [if the noun is plural-named]are[otherwise]is[end if] not a spell."
		
To say unknown-spell:
	say "I don't know that spell."

Spellcasting ends here.

---- DOCUMENTATION ----

Section: What it does.

Spellcasting is a simple extension that does the following things. First, we can create words for new magic-spells, such as shazam. Once shazam has been added to a game according to the guidelines below, the player will be able to use the commands "shazam", "cast shazam", "shazam the X", and "cast shazam at the X" (where X is some object in the game).

By default, however, the spells we add to a game are unlearned, and thus can't be used by the player. We can declare a spell as learned when we create it (in which case the player will be able to use it from the beginning of the game), or we can create a mechanism (for instance, as part of the action of reading a spell-book) that includes the line "now shazam is learned".

The extension also implements the out of world command "spells". This will list the spells the player has learned, together with a brief description of each. If no spells have been learned, the "spells" command will say so.

The new actions defined in Spellcasting are casting, casting it at, zapping (which handles commands of the form "shazam the X"), and spellchecking.

Section: Using Spellcasting.

To add our own spells to a game, we need to do a few things.

First, we create Table of Spells (continued). The Table of Spells (continued) should have the following headings: Spell, Output, Directed Output, Description.

Put new spell words into the Spell column. The other three columns should contain double-quoted text. The Output column should contain the default text that will print when the player types the name of the spell as a bare command ("shazam") or uses the "cast" verb ("cast shazam"). The Directed Output column should contain the default text that will print when the player casts the spell at an object in the game using the format "shazam the X" or "cast shazam at X". In most cases these defaults won't be needed, because the handling of spell-casting will be under the control of instead rules; but writing catch-all default messages is good coding style. The Description column should contain a brief description of the spell, which will be printed (after the spell has been learned) in response to the "spells" command.

After entering a new spell in the Table of Spells (continued), declare the name of the spell as a magic-spell. A magic-spell is a kind of backdrop, which is convenient as we want it to be present in the room no matter where the player is. Because Inform can't put kinds in locations, we have to make each of our magic-spells everywhere, like this:

	shazam is a magic-spell. It is everywhere.

Alternatively, we might want to define a region in which the shazam spell will operate, and confine the backdrop to that region. If we do this, however, the spell will not be in scope when the player is not in that region, which will cause a spell the player has learned to erroneously appear unlearned when the player tries to cast it in the wrong place. A better solution is to edit the Output or Directed Output message of the spell in a way that depends on the player's location.

This is easily done using "To say" code. In the Output column, the text should read something like "[shazam-cast]". We could then write code like this:

	To say shazam-cast:
		if the player is in the Arboretum...

Because magic-spells are unlearned by default, the next step in coding is to specify the manner in which the new spells can be learned.

Finally, we write our own Instead rules for casting specific spells, either without an object ("shazam") or at specific objects ("shazam the X").

We can also, if desired, substitute our own messages for the extension's error messages no-spells-learned, not-a-spell, unknown-spell, unlearned-spell, and cant-see-any-such:

	To say not-a-spell:
		say "What are you gibbering about now?"

If a game uses some other message than "You can't see any such thing" in response to references to things that are invisible or nonexistent, it's a good idea to substitute the new message for cant-see-any-such.

Example: ** The Sorcerer's Apprentice - Some new spells that can be learned from a dusty old book.

	*: "The Sorcerer's Apprentice"

	Include Spellcasting by Jim Aikin.

	The Wizard's Inner Chamber is a room. "This tall, dusty room is littered with magical apparatus. Inasmuch as you're only a lowly apprentice, you have no idea what most of it does."

	The big round beach ball is in the Chamber. The description is "Big and round and bright red and yellow." Understand "bright", "red", and "yellow" as the beach ball.

	A thing can be consultable. A thing is usually not consultable.

	The dusty old book is in the Chamber. "The wizard seems to have left his book of magic spells lying out in plain view!" The description is "It's a very dusty old book. You recall seeing the wizard look up various spells in the book, including frotz, nitfol, and gnusto." The dusty old book is consultable.
	
	Researching it in is an action applying to two things. Understand "research [something] in [something]" and "look up [something] in [something]" as researching it in.

The check rule for researching it in will reject everything, because we're going to use instead rules for researching.

	*:   Check researching it in:
		if the second noun is not consultable:
			say "[The second noun] [if the second noun is plural-named]are[otherwise]is[end if] not useful for researching things.";
		otherwise if the noun is not a magic-spell:
			say "You leaf through the book, but find nothing on that subject.";
		otherwise:
			say "Hmm ... that page of the book seems to have been torn out."
		
	Carry out researching it in:
		say "This message should never print."

	Instead of consulting the book about something:
		say "So many words ... it's all just a blur."

The consulting action, which is part of the Inform library, can be used only with topics, not with objects. Since we're making the spells objects, this action won't work with them. Thus the new action, researching it in.

When the researching it in action is being invoked, its instead rule will supersede the default instead rule contained in the extension, which prohibits any reference at all to the spell objects, other than the actions involved in casting the spells.

	*:   Instead of researching a magic-spell in the book:
		say "Hmm ... that page of the book seems to have been torn out."
	
	Instead of researching frotz in the book:
		if frotz is learned:
			say "You've already learned the frotz spell from the book.";
		otherwise:
			now frotz is learned;
			say "You find the page in the book that describes the frotz spell, and commit the spell to memory."
		
	Instead of researching nitfol in the book:
		if nitfol is learned:
			say "You've already learned the nitfol spell from the book.";
		otherwise:
			now nitfol is learned;
			say "You find the page in the book that describes the nitfol spell, and commit the spell to memory."

	Table of Spells (continued)
	Spell		Output			Directed Output	Description
	frotz		"You cast the frotz spell, but nothing happens."	"You cast frotz at [the second noun], but nothing happens."		"The frotz spell causes spherical objects to quiver."
	gnusto		"You cast the gnusto spell, but nothing happens."	"You cast gnusto at [the second noun], but nothing happens."	"The gnusto spell causes great gusts of wind."
	nitfol		"You cast the nitfol spell, but nothing happens."	"You cast nitfol at [the second noun], but nothing happens."		"The nitfol spell does something completely different."

	frotz is a magic-spell. It is everywhere.
	gnusto is a magic-spell. It is everywhere.
	nitfol is a magic-spell. It is everywhere.

	Instead of casting frotz at the beach ball:
		if frotz is not learned:
			say "[unlearned-spell]";
		otherwise if the beach ball is held:
			say "The beach ball quivers vigorously for a moment.";
		otherwise:
			say "The ball bounces several times and then comes to rest."
		
	Test learning with "spells / look up nitfol in book / spells / nitfol / nitfol the ball".

	Test casting with "cast shazam at ball / cast frotz at ball / look up frotz in book / cast frotz at ball / take ball / frotz ball".

	Test errors with "x frotz / take nitfol / frotz book / gnusto book / look up gnusto in book / frotz desk".

	Test me with "test learning / test casting / test errors".
		

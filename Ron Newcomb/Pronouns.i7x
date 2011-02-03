Version 4 of Pronouns by Ron Newcomb begins here.

"Provides phrases for checking and setting the current value of a particular pronoun.  Works well with Eric Eve's Conversation Framework."

Section 1 - integration - unindexed (for use without Conversation Framework by Eric Eve)

The current interlocutor is an object that varies. 

Section 2 - the pronouns

To decide which person is the/-- pronoun/-- he/him/his: (- PronounValue('him') -).
To decide which person is the/-- pronoun/-- she/her/hers: (- PronounValue('her') -).
To decide which object is the/-- pronoun/-- it/its: (- PronounValue('it') -).    [  It can refer to anything: things, rooms, directions, anything ]
To decide which object is the/-- pronoun/-- they/them/their: (- PronounValue('them') -).  [ ditto for Them ]
To decide which object is the/-- pronoun/-- you/your/yours: decide on the current interlocutor.
To set/now/change 	the/-- pronoun/-- 	he/him/his 		to/is/are/mean/means/refer/refers to/-- 	(character - a person): (- (SetPronoun('him',{character})); -).
To set/now/change 	the/-- pronoun/-- 	she/her/hers 		to/is/are/mean/means/refer/refers to/-- 	(character - a person): (- (SetPronoun('her',{character})); -).
To set/now/change 	the/-- pronoun/-- 	it/its 			to/is/are/mean/means/refer/refers to/-- 	(character - an object): (- (SetPronoun('it',{character})); -).
To set/now/change 	the/-- pronoun/-- 	they/them/their 	to/is/are/mean/means/refer/refers to/-- 	(character - an object): (- (SetPronoun('them',{character})); -).
To set/now/change 	the/-- pronoun/-- 	you/your/yours 	to/is/are/mean/means/refer/refers to/-- 	(character - an object): now the current interlocutor is the character.

Pronouns ends here.

---- DOCUMENTATION ----

In most cases, I7's built-in ability to set pronouns works well enough to set the appropriate pronoun for a given thing or person:
	*: have the parser notice (an object);

Sometimes it's useful to ask the current value of a particular pronoun ("the pronoun" is optional):
	*: if Janell is the pronoun her begin;
	if Travis is him begin;
	if the maple carving is the pronoun it begin;
	if the mob is they begin;
	if Inspector Davis is you:

Or to save it for later, in context-sensitive, conversation-heavy games where a character may go off on tangents repeatedly:
	*: let the previous dating subject be the pronoun he;

And for completeness, to set an individual pronoun (with a few variations on syntax):
	*: change the pronoun he to Travis;
	now she is Janell;
	now the pronoun it means the stop sign;
	now they refers to the annoying couple;
	now you means a random person who is conversing with the player;

These provided phrases work well with any form of the pronoun.  For example, he, him, and his may be used interchangably.

Saying the value of the pronoun is straightforward (again, with variations on syntax -- "the pronoun" is optional):
	*: say "I gave [it] to [him].";
	say "You can also see [the pronoun she] here.";

If we have included Eric Eve's Conversation Framework extension, the pronoun "you" refers to that extension's "the current interlocutor".

A final note, Inform automatically notices the pronouns of items listed in room descriptions and inventory, so that for instance the last item mentioned in an inventory or room contents listing will be considered "it".  The extension Plurality has the option to turn off this behavior:

	*: Include Plurality by Emily Short.  Use Manual Pronouns.

[
Version History:

version 1: initial release

version 2: added phrase synonym "now he is X" and "say '[he]';" to more closely resemble Inform's normal assignment and say operations 

version 3: added conditional support for the pronoun You, tying it into Conversation Framework, if available

version 3/080615: added "hers"; ensured that "current interlocutor" is unindexed; moved the "works well with" into the blurb; added version history

]


Example: * Test Him - Simple usage, without Using Manual Pronouns

	*: "Test Him"

	Include Pronouns by Ron Newcomb.

	The bar is room.  Donnie and Burt are men in the bar. 

	Before looking: now it is the bar; now he refers to Donnie. 

	Every turn: say "'It' is [it].  'He' means [he]."

	Test me with " x donnie / L ".


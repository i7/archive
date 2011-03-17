Version 2/110308 of Lost Items by Mike Ciul begins here.

"Prints a special message instead of 'You can't see any such thing' when certain items are out of scope, indicating that they have disappeared unexpectedly. Useful for flashbacks, theft, and NPCs who might sneak away."

Include Epistemology by Eric Eve.

Book 1 - Lost

Chapter 1 - Losable Things

A thing can be losable.

Chapter 2 - Definition of lost

Section 1 - The lost adjective

Definition: A thing is lost:
	follow did we lose rules for it;
	if the outcome of the rulebook is the we did outcome, decide yes;
	no;

Section 2 - The Determine Loss rulebook

Did we lose is an object-based rulebook. The did we lose rules have outcomes we didn't (failure), and we did (success).

Did we lose a known losable not visible thing (this is the default did we lose rule): we did.

The default did we lose rule is listed last in the did we lose rulebook.

Book 2 - Noticing what is lost

Part 1 - The Noticing Absence activity

Chapter 1 - Defining the rulebook

Noticing absence of something is an activity on objects.

Chapter 2 - A default rule (for use without Custom Library Messages by Ron Newcomb)

Section 1 - Acting Plural (for use without Plurality by Emily Short)

To decide whether (item - a thing) acts plural:
	Decide on whether or not item is plural-named.

Section 2 - The default notice absence rule

To say The (item - a thing) does-do: if the item acts plural, say "[The item] do"; otherwise say "[The item] does";

For noticing absence of something (called the missing item) (this is the default notice absence rule):
	say "[The missing item does-do]n't seem to be here anymore."

Chapter 4 - A default rule (for use with Custom Library Messages by Ron Newcomb)

For noticing absence of something (called the missing item) (this is the default notice absence rule):
	say "[The missing item] [aux][do*]n't seem to be here anymore."

Part 2 - When to notice absence

Chapter 1 - Sought - a hack to aid with command matching (unindexed)

Definition: A thing is sought if it is the item sought.
The item sought is a thing that varies.

Chapter 2 - Printing a parser error

The parser's wn is a number that varies. The parser's wn variable translates into I6 as "wn".

Rule for printing a parser error when the latest parser error is the can't see any such thing error (this is the check for lost items rule):
	let the remembered wn be the parser's wn;
	Repeat with the missing item running through lost things:
		Now the item sought is the missing item;
		if the player's command includes "[any sought thing]":
			carry out the noticing absence activity with the missing item;
			rule fails;
	now the latest parser error is the can't see any such thing error;
	now the parser's wn is the remembered wn;
	make no decision;

Book 3 - Avoiding Extra Line Breaks When Trying an Action During a Parser Error

Converting parser error to action is a truth state that varies.

Before printing a parser error (this is the not yet converting parser error to action rule):
	Now converting parser error to action is false.

After printing a parser error when converting parser error to action is true (this is the prevent extra line breaks when converting parser error to action rule):
	say run paragraph on.

Before doing anything when the printing a parser error activity is going on (this is the now converting parser error to action rule):
	Now converting parser error to action is true.

Book 4 - Testing commands - not for release

[Additional epistemic status regarding losable and lost items]

Report requesting epistemic status of:
	if the noun is not losable, say "not ";
	say "losable / ";
	if the noun is not visible, say "not ";
	say "visible / ";
	if the noun is not lost, say "not ";
	say "lost";
	say ".";

Lost Items ends here.

---- DOCUMENTATION ----

Requires Epistemology by Eric Eve. Intended to work optionally with Remembering by Aaron Reed and Custom Library Messages by Ron Newcomb.

Section: Losable and Lost

By default, objects in the story are not expected to move around without the player's knowledge. Lost Items creates a new property for things called "losable." Things are not losable by default.

	The gold watch is losable.

Just like Epistemology has a "familiar" property that we can set, and a "known" adjective that we can test, Lost Items gives things a "lost" adjective. A losable thing can't be lost unless it is known. But if a thing is both losable and known, it will be lost, and therefore subject to the Notice Absence rulebook.

	If the gold watch has been lost for exactly one turn:
		say "Your pockets feel a little lighter."

One thing that is different from Epistemology, however, is that we can rewrite the rules about when an item is lost. The rulebook is called "Did we lose," and it has outcomes "we did" and "we didn't.":

	Did we lose a losable thing carried by the urchin: we did.

	Did we lose something (this is the misplaced things don't count as lost rule): we didn't.

	The misplaced things don't count as lost rule is listed instead of the default did we lose rule in the did we lose rulebook.

Section: The Noticing Absence Activity

The heart of Lost Items is the "noticing absence" activity. When the parser is about to give the error "you can't see any such thing," the "check for lost items" rule intercepts it. If the player did mention a lost item in his or her command, the Noticing Absence activity is performed with the mentioned item.

If the player mentions more than one lost item, or uses a phrase that matches more than one lost item, only the first item checked will be used. It is assumed that there will only be a small number of losable items, so there shouldn't be many conflicts, but it is important to be aware of this possibility.

The "default notice absence rule" for noticing absence normally handles the Noticing Absence activity. It tells the player:

	(The missing item) doesn't seem to be here anymore.

To customize the message, we may replace the default notice absence rule, or add additional rules for different items and situations.

Section: Use with and without Custom Library Messages by Ron Newcomb

All messages printed by Lost Items should print in the correct person and tense when used with CLM. Since CLM makes use of Plurality by Emily Short, one phrase from Plurality is duplicated in the event that neither Plurality nor CLM is included in the source. No matter what other extensions are included, we will still be able to use this phrase:

	if the noun acts plural

Section: Use with Remembering by Aaron Reed

Remembering prints a special message when examining, taking, or dropping an object that has been seen already. When used with glulx, it tells the player where the PC last saw the object. We can make this work with all verbs using the following rule:

	*: For noticing absence of something (called item) (this is the remember lost items rule):
		Try remembering item;

	The remember lost items rule is listed instead of the default notice absence rule in the for noticing absence rulebook.

There's a little bit going on behind the scenes here, because normally an extra line break is printed when an action is tried during the printing a parser error activity. To make the line breaks work out as we'd expect, Lost Items implements a global variable (converting parser error to action) and a trio of rules (the "not yet converting parser error to action" rule in the before printing a parser error rulebook, the "now converting parser error to action" rule in the before rulebook, and the "prevent extra line breaks when converting parser error to action" rule in the after printing a parser error rulebook). It's unlikely that we'll need to interfere with these rules, but it's good to know that they exist.

Section: Testing Commands

There are no new testing commands for Lost Items, but it adds a line to the "epistat" output defined by Epsitemology. The new line tells whether the inspected object is losable, visible, or lost.

Section: Changes

Version 2:

Updated to work with Version 6 of Remembering by Aaron Reed. Actually what this means is that Version 2 does nothing at all with the Remembering verb. Aaron has already implemented all the functionality that was in Lost Items Version 1, although some of it only works with glulx.

Fixed a bug in interactions with Neutral Library Messages by Aaron Reed and possibly other code that depends on the parser's word-number variable.

Gave a name to the check for lost items rule.

Fixed a bug causing an extra line break when an action is triggered by the noticing absence activity.

Section: Credits

Thanks to Eric Eve, Aaron Reed and Ron Newcomb for the other extensions that make this work. Aaron Reed has been a big inspiration for making interactive fiction more user-friendly. Ron Newcomb and Brady Garvin provided some instrumental advice and bugfixes for version 2. Andrew Plotkin and Emily Short, as well as many others on intfiction.org, have always been forthcoming with advice and explanations for the more arcane aspects of Inform.

If you have questions, suggestions or bugfixes, please contact the author at captainmikee@yahoo.com.

Example: * The Artful Dodger - Handling stolen items.

	*: "The Artful Dodger"

	Include Lost Items by Mike Ciul.

	Saffron Hill is a room. An urchin is a man in Saffron Hill.

	The player carries a gold watch. The watch is losable.

	Every turn when the player carries the watch and the urchin is in the location:
		say "The boy bumps into you. 'Terribly sorry, sir, I must look where I'm going.' he says.";
		now the urchin carries the gold watch.
	
	Rule for deciding the concealed possessions of the urchin: yes.

	Test me with "x watch/g"

Example: *** Living in the Past - Using the Remembering extension and implementing flashbacks. This will tell the player where they last saw some things if it is compiled to glulx.

	*: "Living in the Past"

	Include Remembering by Aaron Reed.
	Include Lost Items by Mike Ciul.

	Chapter 1 - Things that come and go

	[We are going to have a flashback. Some things only belong to the present time, and other things only belong to the past. We want to keep track of that so we will have the appropriate "notice absence" message.]

	A thing can be past or present.

	The Street is a room. In the Street is a flower. The flower is losable and familiar.
	The Park is east of the Street.

	Amelia is a losable past woman.

	Chapter 2 - The Passage of Time

	[Let's demonstrate what happens when an object moves unexpectedly.]
	
	After looking for the first time:
		say "You are startled by a strong gust of wind.";
		move the flower to the Park.

 	[The Remembering extension assumes that things stay where you put them, so it would, tell you that you saw it in the Street, even though you haven't seen it since it left the Park. Lost Items corrects for this situation by keeping track of where you saw losable things as well as people.]
	
	[Now let's demonstrate what happens when the time frame changes and lots of things move around:]
	
	Flashback is a scene. Flashback begins when smelling the flower in the Park. Flashback ends when kissing Amelia.

	Instead of smelling the flower in the Park:
		say "You breathe deep, and the fragrance takes you back to a happier time...";

	When flashback begins:
		remove the flower from play;
		Now Amelia is in the park;
		try looking;
	
	Instead of kissing Amelia:
		say "You hold her close, but before your lips touch, the vision fades...";
	
	When flashback ends:
		Remove Amelia from play;
		Now the flower is in the park;
		try looking;

	Chapter 3 - Reporting Lost and Missing Items

	Section 1 - Making sure something is truly lost

	[In this scenario, "lost" doesn't mean misplaced or stolen, it means it doesn't belong to the current time frame]

	Did we lose a present thing when flashback is not happening: we didn't.

	Did we lose a past thing when flashback is happening: we didn't.

	Section 1 - Customized messages for different time periods

	For noticing absence of a past thing (called memento) when flashback is not happening:
		say "Though your heart aches, you cannot bring [the memento] back.";

	For noticing absence of a present thing when flashback is happening:
		say "That is something from another time.";

	Section 3 - Noticing absence instead of remembering, sometimes

	[This demonstrates how we might sometimes change the behavior of remembering to mimic the "noticing absence" message, so for example "smell" and "examine" would have identical results.]

	Instead of remembering something lost (called item) when the noun is not a person:
		carry out the noticing absence activity with item;
	
	For printing the name of the location when remembering:
		say "right here"

	Chapter 4 - Testing

	test me with "x flower/smell flower/e/x amelia/smell flower/x flower/smell flower/kiss amelia/g/x amelia"

Version 1 of Conditional Backdrops by John Clemens begins here.

"An extension to allow rules for determining the presence of backdrops."


A conditional backdrop is a kind of thing.

A conditional backdrop is always fixed in place. A conditional backdrop is never portable. A conditional backdrop is usually scenery.

Include (- with found_in [ ; ProcessRulebook( (+ Backdrop condition rules +), self);  return (rulechange_stack-->rulechange_sp == RS_SUCCEEDS); ], -) when defining a conditional backdrop.

The specification of conditional backdrop is "Like a backdrop, but allows rules for determining presence or absence in a given room."

Backdrop condition rules are an object-based rulebook.

Backdrop condition rules have outcomes present (success), it is present (success), it is absent (failure) and absent (failure - the default).

To decide which object is new location: (- location -).


Conditional Backdrops ends here.

---- DOCUMENTATION ----

This is a simple extension to allow rules for determining whether a backdrop is present in a particular room. Such a backdrop should be declared as a "conditional backdrop". By default, these will not be present in any room. This can be changed by adding backdrop condition rules for the objects. Such a rule should conclude with the phrases "it is present" or "it is absent" to make a decision. For testing conditions, "new location" should be used instead of location:
	The sky is a conditional backdrop.
	A backdrop condition for the sky: if the new location is the yard, it is present.

Note: Backdrops are only automatically updated at certain times (such as when moving from one room to another). If a backdrop condition can change under other circumstances, this must be updated manually by using the "move floating objects rule". 

Example: * Exclusion - Excluding one room in a region.

	*: "Exclusion"

	Include Conditional Backdrops by John Clemens.

	Living room is a room. Study is east of living room. Kitchen is south of living room. Yard is north of living room.
	The house is a region. Living room, study, and kitchen are in the house.

	The rug is a conditional backdrop. The rug is not scenery.

	Backdrop condition for the rug:
		if the new location is the kitchen, it is absent;
		if the new location is in the house, it is present.

	Test me with "e / w / s / n / n / s".

Example: ** Ostrich - Updating backdrop conditions manually.

	*: "Ostrich"

	Include Conditional Backdrops by John Clemens.

	The garden is a room. The path is east of the garden.

	The player carries the paper bag. The paper bag is wearable.

	The sky is a conditional backdrop.
	The grass is a conditional backdrop.

	Backdrop condition when the player wears the paper bag: it is absent.

	Backdrop condition for the sky: it is present.
	Backdrop condition for the grass: it is present.

	After wearing the paper bag:
		consider the move floating objects rule;
		say "You hide your head in the paper bag."

	After taking off the paper bag:
		consider the move floating objects rule;
		say "You bravely withdraw your head from the bag."

	Test me with "x sky / x grass / wear bag / x sky / x grass / remove bag / x sky / x grass".

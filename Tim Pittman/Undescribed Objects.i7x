Version 1/080526 of Undescribed Objects by Tim Pittman begins here.

"Allows for objects to be made that print the parser error 'That's not something you need to refer to...' when anything is done to them. Compatible with, but does not require, Custom Library Messages by David Fisher."

Section 1 - Undescribed Objects

An undescribed object is a kind.
The specification of undescribed object is "Represents a super simple thing that cannot be moved, touched, or dealt with in any way. Dealing with this object will result simply in a 'not something you need to refer to' parser error (even though the parser has already completed).".

An undescribed object has a text called error text.

This is the don't refer to rule:
	if the noun is an undescribed object:
		throw the not refer to error with the noun;
		rule fails with result the don't refer to rule;
	if the second noun is an undescribed object:
		throw the not refer to error with the second noun;
		rule fails with result the don't refer to rule.

The don't refer to rule is listed after the basic visibility rule in the action-processing rules.

To throw the not refer to error with (obj - an undescribed object):
	make the not refer to error;
	begin the printing a parser error activity;
		if obj provides the property error text and the error text of obj is not "" begin;
			say "[error text of obj][paragraph break]";
		otherwise
		if handling printing a parser error activity;
			say "That is not something you need to refer to during the course of the game.";
		end if;
	end the printing a parser error activity.

To make the not refer to error: (- (etype = SCENERY_PE); -).

Section 2a - Library Message (for use with Custom Library Messages by David Fisher)

Rule for printing a parser error when parser error is not something you need to refer to:
	display LibMsg <unimportant object>.

Undescribed Objects ends here.

---- DOCUMENTATION ----

This extension creates a new kind (not a new kind of thing) called an Undescribed Object. An undescribed object can be described as a super simple thing which only has one property (error text) and a presence in the room that is was placed in. However, it is NOT a thing and, therefore, does not even get considered in room descriptions, look actions, or search actions. These things are here so that if you mention something in passing in a room description, the parser will not say "You can't see any such thing."

Note: Even though an undescribed object is present in the world model and, therefore, a "physical" entity, the game will throw a parser error (specifically the unused-in-I7 "That is not something you need to refer to during the course of the game." error). It gives a parser error because historically this was caught by the parser and it allows the intentional consequence of being able to change the parser error with the following phrase:

	Rule for printing a parser error when parser error is not something you need to refer to: say "Don't bother with that.".

Also, if you also include Custom Library Messages by David Fisher, this extension will use the library message given by the Table of custom library messages (which is slightly different than the default message that was written in this extension). This extension also allows the author to change the error text of individual undescribed objects by using the error text property:

	The goat is an undescribed object in the Field. The error text of the goat is "No need to bother with the goat, I just mentioned it in passing.".

Please note that the error text is not action-specific and will print the same for any error. Also note that the rule that prints the parser error is listed before the instead rules but after the before rules.

Example: * Home on the Range - Doing something with things that aren't really there by using undescribed objects.

In this simple example, we use Undescribed Objects to take the place of any items we mentioned in passing but don't really feel like writing about or don't want taking up space in the Z-Machine. Also note that undescribed objects in one room are not noticed in another room.

	*: "Home on the Range" By Tim Pittman

	Include Undescribed Objects by Tim Pittman.

	The Field is a room. "A vast field where grass is abundant - well it should be, except that darn [goat] keeps eating it! It does eat any dandelions when he gets the chance though."

	The goat is an animal in the field. The description is "A sturdy goat that can get you a hefty price at the market... if anyone was willing to buy it.".
	The grass is scenery in the field. The description is "It would grow tall and green, if it wasn't for that damn goat!".

	Dandelions are an undescribed object in the field.

	The Barn is south of the field. "The rafters hold up the great roof of this barn. In the barn you can see [hay] and [a cow] munching on the hay."

	Some hay is in the Barn. The description is "A stack of hay. Maybe you can find a needle in it!"
	A cow is an animal in the barn. The description is "Her name is Betsy. She won a blue ribbon in last year's festival, but she won't be competing this year - she's pregnant."

	A needle is an undescribed object in the Barn with error text "Nothing you do will make you find the needle.".
	The rafters is an undescribed object in the Barn.

	Test me with "x dandelions/x grass/x trees/s/x rafters/x hay/x needle/take needle/x dandelions/n/x rafters/x needle".


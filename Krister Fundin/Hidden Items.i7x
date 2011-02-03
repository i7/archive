Version 2 of Hidden Items by Krister Fundin begins here.

"Provides a simple way of defining objects (including doors and backdrops) that are initially out of play."

Chapter 1 - Properties and attributes

A thing can be hidden or revealed.

A thing has an object called the original location.

Chapter 2 - Floating objects - Unindexed

Definition: a door is double-sided if the front side of it is not nothing and the back side of it is not nothing.

Definition: a thing is multi-location:
	if it is a double-sided door, yes;
	if it is a backdrop, yes;
	no.

A thing can be Inform library absent.
A thing is usually not Inform library absent.
The Inform library absent property translates into I6 as "absent".

To surreptitiously remove (T - a thing) from play: (- remove {T}; -).

Chapter 3 - Removing initially hidden objects from play

When play begins:
	repeat with T running through hidden things:
		hide T.

Chapter 4 - Hiding and revealing

To reveal (T - a thing):
	now T is revealed;
	if T is multi-location:
		now T is not Inform library absent;
		now T is not undescribed;
		update backdrop positions;
	otherwise:
		move T to the original location of T.

To hide (T - a thing):
	now T is hidden;
	if T is multi-location:
		now T is Inform library absent;
		now T is undescribed;
		surreptitiously remove T from play;
	otherwise:
		change the original location of T to the holder of T;
		remove T from play.

Hidden Items ends here.

---- Documentation ----

Hidden Items provides a more natural way of defining objects that don't make their appearance until later on in the game. Normally, we would achieve this by defining the object as out of play and then moving it to the desired location when it is found:

	The banana is a thing.

	Instead of looking under the table for the first time:
		move the banana to the kitchen;
		say "You find a banana!"

When using Hidden Items, we can instead put the object where we want it to end up and mark it as "hidden". When we want it to appear, we can use the phrase "reveal the object":

	A banana is hidden in the kitchen.

	Instead of looking under the table for the first time:
		reveal the banana;
		say "You find a banana!"

Hidden Items also works with backdrops and doors:

	The secret passage is a hidden door. It is east of the office and west of the secret room.

	Instead of turning the bust of Plato:
		reveal the secret passage;
		say "A secret passage opens to the east!"

Especially when dealing with backdrops and doors, it may be useful to be able to hide them again. This can be done simply by using the phrase "hide the object":

	Instead of turning the bust of Plato when the secret passage is revealed:
		hide the secret passage;
		say "The secret passage closes again."

Ordinary objects can also be hidden using the same phrase. When revealed, they will appear where they were before being hidden.

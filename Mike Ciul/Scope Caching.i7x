Version 1/111117 of Scope Caching by Mike Ciul begins here.

"Gives things the 'marked visible' property, to check the visibility of something without repeating the entire scope loop each time. Works with Epistemology by Eric Eve, Conditional Backdrops by Mike Ciul, and Remembering by Aaron Reed."

"based on code provided by Andrew Plotkin"

[and Jimmy Maher? http://www.intfiction.org/forum/viewtopic.php?f=7&t=3241&start=40]

Use authorial modesty.

Volume - Scope Caching

Chapter - Iterating over Scope

[Thanks to Andrew Plotkin for this code to make the scope checking not incredibly repetitive]

To iterate scope with (func - phrase thing -> nothing): (-scope_token=0; LoopOverScope({func}-->1); -).

To iterate scope for (actor - thing) with (func - phrase thing -> nothing): (- scope_token=0; LoopOverScope({func}-->1, {actor}); -).

Chapter - The Marked Visible Property

A thing can be marked visible or marked invisible.

To mark the/-- visibility of (target - a thing) (this is scope caching):
	now target is marked visible;

To cache the/-- scope for (viewer - a person):
	Now everything is marked invisible;
	Iterate scope for viewer with scope caching.

Chapter - When to Perform Scope Caching

After reading a command (this is the cache player's scope rule):
	Cache the scope for the player.

The cache player's scope rule is listed first in the after reading a command rules.

Volume - Interactions with Conditional Backdrops (for use with Conditional Backdrops by Mike Ciul)

After moving floating objects:
	cache scope for the player;

Volume - Interactions with Epistemology (for use with Epistemology by Eric Eve)

Book - Sight (in place of Book 1 - Sight in Epistemology by Eric Eve)

A thing can be either seen or unseen. A thing is usually unseen.

[ With the speed advantages of scope caching, we can now do more accurate accounting of what has actually been seen. ]

After reading a command (this is the mark cached items as seen rule):
	Now every marked visible thing is seen.

The mark cached items as seen rule is listed after the cache player's scope rule in the after reading a command rulebook.

The cache player's scope rule is listed last in the carry out looking rules.
The mark cached items as seen rule is listed last in the carry out looking rules.

The cache player's scope rule is listed last in the carry out opening rules.
The mark cached items as seen rule is listed last in the carry out opening rules.

Volume - Interactions with Remembering (for use with Remembering by Aaron Reed)

Book - Keeping Track (for Glulx only)

Section - Rules (in place of Section - Rules in Remembering by Aaron Reed)

After reading a command (this is the update remembered positions of cached things rule):
	repeat with item running through marked visible things that are enclosed by the location:
		if remembered location of item is not holder of item:
			now the remembered location of item is the holder of item.

The update remembered positions of cached things rule is listed after the cache player's scope rule in the after reading a command rules.

First report remembering (this is the Remembering specific report remembering rule):
	if remembered location of noun is nothing, continue the action;
	say the message corresponding to a rule name of Remembering specific report remembering rule in Table of Remembering Messages;
	stop the action. 

Volume - Testing commands - not for release

Checking the scope cache is an action out of world. Understand "scopestat" as checking the scope cache.

Report checking the scope cache (this is the standard report checking the scope cache rule):
	say "The following items are marked visible: [line break]";
	repeat with item running through marked visible things:
		say "  [the item][line break]";

Checking the scope cache for is an action out of world applying to one visible thing. Understand "scopestat [any thing]" as checking the scope cache for.

Carry out checking the scope cache for something (this is the recache scope when checking the scope cache for rule):
	Cache the scope for the noun;

Report checking the scope cache for something (this is the standard report checking the scope cache for rule):
	say "The following items are marked visible for [the noun]: [line break]";
	repeat with item running through marked visible things:
		say "  [the item][line break]";

Scope Caching ends here.

---- DOCUMENTATION ----

Optimizes Epistemology by Eric Eve and Remembering by Aaron Reed. I6 code by Andrew Plotkin. Andrew also explained how to pass a phrase as an argument to another phrase for looping.

Section: The Marked Visible Property

Scope Caching creates a property for things called "marked visible." This is equivalent to the "visible" adjective, except it is calculated only at specific times and then stored, trading storage space for speed.

These conditions:

	the player can see the ball

	the ball is visible

Will normally mean the same as:

	the ball is marked visible

Section: The Cache Scope Phrase

If circumstances change during a turn and we need to check scope again, or if we want to check scope for something other than the player, we need to refresh the cache. We can do this with the "cache scope" phrase:

	Before Bob trying doing something:
		cache scope for Bob

This will, of course, leave the "marked visible" property set for Bob, so if we need to check the player's scope again, we need to run the phrase an additional time.

Section: The Cache Scope After Reading a Command Rule

This is the rule which normally sets the "marked visible" property each turn:

	After reading a command (this is the cache scope after reading a command rule):
		Cache the scope for the player.

It's listed first in the "after reading a command" rulebook, so other "after reading a command" rules should be able to make use of the "marked visible" property.

Section: Testing Commands

We can use the "scopestat" command to find out what items are currently marked visible. The command by itself will list the items marked visible for the player, while "scopestat [any thing]" will list the items visible for another person.

Example: * Which Rubber - Uses Scope Caching to prevent an infinite loop. Without it, the "After deciding the scope of the player" rule repeats forever.

	*: "Which Rubber"

	Include Scope Caching by Mike Ciul.

	Indoors is a room.

	The front door is a door. It is west of Indoors and east of Outdoors.

	Bob is a man in Outdoors.

	There is a container called a pile of balls in Indoors. "There is a pile of rubber balls here." In the pile is a ball.

	Understand "rubber" as a pile when the ball is not marked visible.
	Understand "rubber" as a ball when the ball is marked visible.

	The outdoor view is scenery. The description is "It's bright outside.";

	After deciding the scope of the player in Indoors when the front door is open:
		place the outdoor view in scope.
	
	Test me with "rules/open door/get rubber/scopestat/scopestat bob"

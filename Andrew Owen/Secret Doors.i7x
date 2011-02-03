Secret Doors by Andrew Owen begins here.

"Doors and switches that cannot be acted upon until they are
discovered."

A secret door is a kind of door.
A secret door can be revealed or unrevealed.
A secret door is unrevealed.
A secret door is scenery.
A secret door is closed.

A secret switch is a kind of thing.
A secret switch can be revealed or unrevealed.
A secret switch is unrevealed.
A secret switch is scenery.

To print the you can't go message:
	(- L__M(##Go, 2, 0); -).

To print the you can't see message:
	(- L__M(##Miscellany, 30, 0); -).

Before going through a secret door which is unrevealed:
	print the you can't go message instead.

Before doing something to a secret door which is unrevealed:
	print the you can't see message instead.

Before doing something when when a secret door is the second noun and
the
second noun is unrevealed:
	print the you can't see message instead.

Before doing something to a secret switch which is unrevealed:
	print the you can't see message instead.

Before doing something when when a secret switch is the second noun and
the
second noun is unrevealed:
	print the you can't see message instead.

Secret Doors ends here.

---- DOCUMENTATION ----

Secret Doors is an extension which provides robust support for hidden
doors and hidden switches. It creates two new kinds: "secret door" (a
kind of door) and "secret switch" (a kind of thing) with the properties
"revealed" or "unrevealed".

	The passage door is a secret door.
	The passage door is west of the Big Cave and east of the Secret
Passage.

	The hidden lever is a secret switch in the Big Cave.

If the player attempts to walk through a secret door, the same response
to attempting to travel in a non-existent direction is given:

	>west
	You can't go that way.

If the player attempts to interact with a secret switch, the same
response to attempting to interact with a non-existent object is given:

	>pull lever
	You can't see any such thing!

	>throw rock at lever
	You can't see any such thing!

It might be that we want the switch to be in plain sight. In that case
it should be defined as a normal object rather than a secret switch:

	The lever is fixed in place in the Big Cave.

	Instead of pulling the lever for the first time:
		now the passage door is revealed;
		now the passage door is open;
		say "As you pull the lever, a secret door opens, revealing a secret
passage!"

If on the other hand we want the switch to be hidden as well, then we
need a way of revealing it so that it can be used. For example:

	The lever is a secret switch in the Big Cave.

	The cave wall is scenery in the Big Cave.

	Instead of searching or examining the cave wall:
		now the lever is revealed;
		say "In a gap between two rocks you discover a lever."

	Instead of pulling the lever which is revealed for the first time:
		now the passage door is revealed;
		now the passage door is open;
		say "As you pull the lever, a secret door opens, revealing a secret
passage!"

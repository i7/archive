Version 2 of Modified Lock-Unlock by Al Golden begins here.

a thing can be open.
a thing can be closed.
a thing can be locked.
a thing can be unlocked.
a thing is either openable or unopenable.
a thing is either lockable or unlockable.

a thing is either matched or unmatched.
a thing is usually unmatched.

a thing is either key-required or nonkey-required.
a thing is usually nonkey-required.

a thing is usually unopenable.
a thing is usually unlockable.

rule for printing room description details: stop.

understand the command "open" as something new.

opening it with is an action applying to two things.
understand "open [something] with [something]" as opening it with.
understand "open [something]" as opening.

understand the command "unwrap" as something new.
unwrapping is an action applying to one thing.
understand "unwrap [something]" as unwrapping.

understand the command "uncover" as something new.
understand "uncover [something]" as unwrapping.
uncovering is an action applying to one thing.

understand the command "lock" as something new.
locking is an action applying to one thing.

understand the command "unlock" as something new.
unlocking is an action applying to one thing.

understand "lock [something]" as locking.
understand "unlock [something]" as unlocking.
understand "lock [something] with [something preferably held]" as locking it with.
understand "unlock [something] with [something preferably held]" as unlocking it with.

before locking a locked thing with a second noun:
say "[The noun] is already locked.";
stop.

before locking a locked thing:
say "[The noun] is already locked.";
stop.

check unlocking an unlocked thing with a second noun:
say "[The noun] is already unlocked." instead.

check unlocking an unlocked thing:
say "[The noun] is already unlocked." instead.

check  locking an unlockable thing:
say "[The noun] is incapable of being locked." instead.


check unlocking an unlockable thing:
say "[The noun] is incapable of being unlocked." instead.

before unlocking an unlockable thing with a second noun:
say "[The noun] is incapable of being unlocked with [the second noun]." instead.

before locking an unlockable thing with a second noun:
say "[The noun] is incapable of being locked with [the second noun]." instead.

check opening an unopenable thing:
say "[The noun] is incapable of being opened." instead.

check closing an unopenable thing:
say "[The noun] is incapable of being closed." instead.


before unlocking a key-required thing: 
if a matched thing is not carried by the player,
say "You need a key in order to do that." instead.

before unlocking a key-required thing with a second noun:
if a matched thing is not carried by the player,
say "You need a key in order to do that." instead.

before locking a key-required thing: 
if  a matched thing is not carried by the player,
say "You need a key in order to do that." instead.

before  locking a key-required thing with a second noun: 
if a matched thing is not carried by the player,
say "You need a key in order to do that." instead.

report unwrapping something:
say "You unwrap [the noun].".

report uncovering something:
say "You uncover [the noun].".

before  opening an unopenable thing with a second noun:
say "The [noun] is incapable of of being opened with [the second noun]." instead.

before opening an open thing with a second noun:
say "The noun is already open." instead.

instead opening a closed unlocked thing with a second noun:
now the noun is open;
say "You open [the noun] with [the second noun].".

instead opening a closed locked thing with a second noun:
if the second noun is not carried by the player begin;
say "You need to take  [second noun] before doing that.";
otherwise;
now the noun is unlocked;
now the noun is open;
say "You unlock and open [the noun] with [the second noun].";
end if.

instead opening a closed unlocked thing with a second noun:
if the second noun is not carried by the player begin;
say "You need to take the [second noun] before doing that.";
otherwise;
now the noun is unlocked;
now the noun is open;
say "You open [the noun] with [the second noun].";
end if.

before locking something with a second noun:
if the second noun is the noun,
say "You can't use [the second noun] to lock itself." instead.

before unlocking something with a second noun:
if the second noun is the noun,
say "You can't use [the second noun] to unlock itself."

instead of locking an unlocked lockable thing:
if the noun is open begin;
now the noun is closed;
now the noun is locked;
say  "You close and lock [the noun].";
otherwise;
now the noun is locked;
say "You lock [the noun].";
end if.

instead of locking an unlocked lockable thing:
now the noun is locked;
say "You lock [the noun].".

before locking a locked lockable thing with a second noun:
say "[The noun] is already locked." instead.

instead of locking an unlocked lockable thing with a second noun:
if the second noun is matched begin;
now the noun is locked;
say "You lock [the noun] with [the second noun].";
otherwise;
say "[The second noun] does not lock [the noun].";
end if.

instead of unlocking a locked lockable thing:
if the noun is key-required begin;
say "You need something to do that with.";
otherwise;
now the noun is unlocked;
say "You unlock [the noun].";
end if.

instead of unlocking a locked thing with a second noun:
if the second noun is matched begin;
now the noun is unlocked;
say "You unlock [the noun] with [the second noun].";
otherwise;
say "[The second noun] does not unlock [the noun].";
end if.
	
instead of unlocking a key-required thing:
if a matched thing is carried by the player begin;
now the noun is unlocked;
say "You unlock [the noun].";
otherwise;
say "You need something to unlock [the noun] with.";
end if.

instead of locking a key-required thing:
if a matched thing is carried by the player begin;
now the noun is locked;
say "You lock [the noun].";
otherwise;
say "You need something to lock [the noun].";
end if.


Modified Lock-Unlock ends here.

---- DOCUMENTATION ----

Allows locking and unlocking of doors, non-doors, containers, and non-containers with or without a key.

Also this version will not allow something which is unlockable to be unlocked or locked, nor will it allow
something which is unopenable to be closed or opened.

Doors and containers need to have the attribute openable and lockable if you want them as such otherwise
you will never be able to lock/unlock/close/open them.

Version 2 now REQUIRES the player to be carrying the  key or whatever you designate as the matched unlocking 
device with in your hands before you can unlock or lock something with it.

New properties added for this version: 

key-required,nonkey-required. matched and unmatched.

NOTE: the verbs "UNCOVER" and "UNWRAP" are now separate from "OPEN".

HOW TO USE:

The properties unlockable and unopenable have been added to this extension.
Make an object unlockable if you don't ever want it to be unlocked or locked.

Objects are now unopenable by default. You need to say that the object is openable 
if you want it to be so. Objects are unlockable by default. They need to be made
lockable if you want them to be able to be locked. This goes for doors and 
containers as well for both locking/unlocking and opening/closing.

If an object requires a key then make it key-required. You will not be able 
to unlock it without a "matched" key or whatever you want to call it.

The key needs to be given the "matched" property.

************************************************************************************

WARNING 1:  This extension is NOT recommended for brand new I7 Authors.

WARNING 2 : IT CAN NOT BE USED WITH the LOCKSMITH extension by Emily Short. 

WARNING 3: If there is  more than 1 matched key in the game, then each key must 
be matched to whatever it unlocks.  Example:if you have a chest key and a box key,
you must code the fact that the chest key can only open the chest and the box key 
can only open the box. Otherwise you will be able to open the box with the chest key and vice versa. 

This seems somewhat complicated but a work-around is very easy to code for those 
who are experienced with the Inform 7 language.

************************************************************************************

It is HIGHLY suggested that you print out this entire extension and study it. 

Report any problems to:  radical1@evcohs.com

************************************************************************************

Example: ** Lock/Unlock Test - a small test program.

	*: "Lock/Unlock Test"

	Include Modified Lock-Unlock by Al Golden.

	Starter is a room.

	a chestkey is in Starter.
	the chestkey is unlockable.
	the printed name of the chestkey is "chest key".
	understand "key" and "chest key" as the chestkey.
	the chestkey is matched.

	a locked, openable, lockable door called a plain old door
	is north of Starter and south of Ender.

	a locked, openable, lockable thing called a gizmo is in Starter.

	a locked, lockable, openable container called a box is in Starter.

	a locked, openable, lockable thing called a thingy is in the box.

	a locked, openable, lockable key-required container called a chest is in Starter.
	an unlockable unopenable thing called a whizbang is in the chest.

	before opening something  with a second noun:
	if the second noun is not the chestkey,
	say "Don't be ridiculous! ! ! !" instead.

	instead of opening the chest with a second noun:
	if the second noun is not the chestkey begin;
	say "The [second noun] isn't used for opening the box.";
	otherwise;
	now the chest is open;
	now the chest is unlocked;
	say "You unlock and open [the noun] with [the second noun].";
	end if.

	
	[Test Scripts]
	
	test go with "take key/take box/unlock door/open door/n/close door/lock door/unlock door with key/open door/s".

	test open with "open box with door/open box with gizmo/open box with key/open chest/open chest with key/take key/open chest with key".

	test chest with "open chest/unlock chest/take key/unlock chest with key/lock chest with key/unlock chest/lock chest/drop key"

	test unlock with "unlock box with box/unlock box with gizmo/unlock key with key/unlock key/unlock gizmo with gizmo/unlock chest with key/take key/unlock chest with key/open chest/unlock box/unlock gizmo/unlock thingy/unlock door".


	test lock with "lock box with box/lock box with gizmo/lock key with key/lock key/lock gizmo with gizmo/lock thingy with thingy/lock box/lock gizmo/lock thingy /lock door.".

	test me with "open door/close door/unlock door/unlock door with key/unlock box/open box/take thingy/close box/lock box with key/unlock gizmo/open gizmo/close gizmo/lock gizmo with key/lock gizmo/open thingy/unlock thingy/open thingy/close thingy/lock thingy with key"

	test whiz with "unlock whizbang/unlock whizbang with key/lock whizbang/lock whizbang with key".


Version 9 of Considerate Holdall by Jon Ingold begins here.

"Provides an improving stashing mechanism for the player's holdall. Objects that haven't been used in a long time will be stashed first. A rulebook is provided to contextualise the stashing process."

A thing can be stashable or unstashable. A thing is usually stashable.

Use inline implicit library translates as (- Constant INLINE; -). 

Section 1 - remembering handled items

Table of Recent Items
recent item		time
a thing	a time
with 15 blank rows

To decide if (item - a thing) is not a recently handled item:
	if the item is not a recent item listed in the Table of Recent Items, decide yes;
	decide no.

Definition: a thing is forgotten-about if it is not a recently handled item.

Before when the noun is a thing:
	if the noun is not unstashable,  note the noun.
Before when the second noun is a thing:
	if the second noun is not unstashable, note the second noun.

To note (n - a thing):
	if the n is a recent item listed in the Table of Recent Items begin;
		change the time entry to the time of day;
	otherwise;
		sort the Table of Recent Items in time order;
		if the number of blank rows in the Table of Recent Items is zero, choose row 1 in the Table of Recent Items; 
		otherwise choose a blank row in the Table of Recent Items;
		change the recent item entry to the n;
		change the time entry to the time of day;
		sort the Table of Recent Items in time order;
	end if;
	
The considerate player's holdall rule is listed instead of the use player's holdall to avoid exceeding carrying capacity rule in the check taking rules.

Section 2 - Rulebooks, one for each type

part 1 - Holdall rules

The holdall rules are an object-based rulebook. The holdall rules have outcomes allow stashing (success), no decision (no outcome - the default) and disallow stashing (failure).

Holdall rule for a thing not enclosed by the player: disallow stashing.

Holdall rule for a thing (called the item) when multi (this is the remove all from a holdall rule): 
	if taking something inside the item, disallow stashing; 

Holdall rule for a closed player's holdall  (this is the require an open holdall rule): 
	if not using the inline implicit library option, disallow stashing;

A holdall rule for a thing (called the item) (this is the check the size of a holdall rule):
	if item provides the property carrying capacity and the number of things in item is at least the carrying capacity of item, disallow stashing.

The last holdall rule: allow stashing.

A player's holdall can be CHavailable or CHunavailable. A thing can be CHviable or CHunviable.

To decide if multi: (- (multiflag) -).

part 2 - Stashable object rules

The stashing rules are an object-based rulebook. The stashing rules have outcomes allow stashing (success), no decision (no outcome - the default) and disallow stashing (failure).

Definition: a thing is a body-part if it is a part of the player.

First stashing rule for thing (called the item): if the item is unstashable, disallow stashing; 
Stashing rule for the considered holdall: disallow stashing.
Stashing rule for something enclosing the considered holdall: disallow stashing.
Stashing rule for a body-part thing: disallow stashing.
The last stashing rule: allow stashing.

section 3 - the main loop

The considered holdall is a thing that varies. The current stashable thing is a thing that varies. 

This is the considerate player's holdall rule:
[ if you've got too much in your hands...]
if the number of things carried by the player is at least the carrying capacity of the player begin;
	now every player's holdall is CHunavailable;
	repeat with current holdall running through player's holdalls enclosed by the player begin;
[ mark-up holdalls to see if they're appropriate to use...]
		follow the holdall rules for the current holdall;
		if the outcome of the rulebook is the disallow stashing outcome, now the current holdall is CHunavailable;
		if the outcome of the rulebook is the allow stashing outcome, now the current holdall is CHavailable;
	end repeat;
	repeat with current holdall running through CHavailable player's holdalls begin;
[ try each holdall individually... hopefully we won't actually have to try very many! ]
		change considered holdall to current holdall;
		repeat with item running through things carried by the player begin;
[ see if we can stash items in this particular holdalll... ]
			follow the stashing rules for the item;
			if the outcome of the rulebook is the disallow stashing outcome, now the item is CHunviable;
			if the outcome of the rulebook is the allow stashing outcome, now the item is CHviable;
		end repeat;
		change the current stashable thing to a random forgotten-about CHviable thing held by the player;
[ is there anything you could stash which you've never used...? ]
		if the current stashable thing is not a thing begin;
[ if not, find the oldest thing we can stash ... ]
			repeat through Table of Recent Items in time order begin;
				if the recent item entry is CHviable and the recent item entry is carried by the player begin;	
					change the current stashable thing to the recent item entry;
[ we're happy with this item .]
					break;
				end if;
			end repeat;
		end if;
		if the current stashable thing is a thing begin; 
[ we're happy with the combination of stashable thing and holdall... ]
			if using the inline implicit library option begin;
[ this is an entry point for implicit libraries, such as Eric Eve's, to use, to tidy up more complicated lines. ]
				spit inline library message as appropriate for the current stashable thing into the considered holdall;
				if the current stashable thing is not inside the considered holdall, stop the action;
			otherwise;
[ try putting it away, and report if we managed to ... ]
				try silently inserting the current stashable thing into the considered holdall;
				if the current stashable thing is not inside the considered holdall, stop the action;
				spit library message as appropriate for the current stashable thing into the considered holdall;
			end if;
			continue the action;
		end if;
	end repeat;
[ we give up! ]
	spit library message for failure of holdalls instead;
end if; 



To spit library message for failure of holdalls:
	(- GL__M(##Take,12);  
	-)

To spit inline library message as appropriate for (n - a thing) into (s - a thing):
	(- SACK_OBJECT  = {s}; #ifdef INLINE;  __stash({n}); #endif;
	-)

To spit library message as appropriate for (n - a thing) into (s - a thing):
	(- SACK_OBJECT  = {s}; GL__M(##Take,13,{n});  
	-)

Include (- Constant CONSIDERATE_HOLDALL; -).

Considerate Holdall ends here.

---- DOCUMENTATION ----

For a long time now, Inform games have provided a "stashing" mechanism, to aid kleptomaniac players with limited carrying capacities take as much as possible with a single TAKE ALL command. This mechanism frees up space in the player's hands by moving something already carried into the "player's holdall". Considerate Holdall is designed to make this mechanism more intelligent, so that less-recently used items are stashed before recently-used items. It also allows for multiple holdalls, and offers some flexibility over what will be automatically stashed into which.

The extension's primary work - stashing neglected items first - will happen merely by including the extension and providing a holdall. Furthermore, the extension allows us to declare some objects "never stashable" - good for pet dogs, flaming torches and so forth. The idea of this tag is to minimise the number of times the games automatic stashing fails due to the game making poor choices.

Other objects can be declared "stashable" if they are - regardless of circumstance - good for stashing. For the third case (the most frequent) there is a rulebook to decide whether an object can be stashed.

	A stashing rule for the burning torch: disallow stashing.
	A stashing rule for a lit thing: disallow stashing.
	A stashing rule for an animal (called the pet in question): 
		if the pet in question is the lizard, allow stashing; otherwise disallow stashing.

These rules can reference the "considered holdall" if necessary, if there are limitations on where certain objects can go (see the example).

Possibly less usefully, the extension also provides a rulebook for choosing viable holdall's into which to stash. By default, this precludes closed or full rucksacks, and ensures that a player who types TAKE ALL FROM RUCKSACK will not find himself putting things back into the rucksack to make more room! Should more rules be needed, the holdall rules follow the same format as the stashing rules.

	A holdall rule for a burning player's holdall: disallow stashing.

By default, any carried holdall and any carried object are viable for stashing. Note that this rulebook is _not_ a sensible place to put a default-opening rule: these rules are about the possibility of stashing somewhere - the remaining code may yet reject any particular holdall in favour of another one.

Example: * A Basic Holdall - Skeleton code for a working holdall.

	*: The Art Gallery is a room. "Filled to the brim with treasures protected by laser-guided motion-sensitive auto-detection self-repairing burglar-maiming insurance-devices. Lucky thing about that power cut, really." The gold sceptre, jade obelisk, diamond tiara, ancient Saxon silver knife are here.

We provide the player with a holdall:

	*: Include Considerate Holdall by Jon Ingold.
	
	The black swag bag is an open wearable player's holdall. The player is wearing the swag bag. It has description "Big letters: SWAG."
	
	The player is carrying the lit torch and a lockpick.
	
	The lit torch is unstashable.

And finally, something to ensure a bag is necessary anyway:

	*: The carrying capacity of the player is 3.

	test me with "i/take sceptre/take obelisk/examine sceptre/take tiara/take knife".

Note the order in which the objects are stashed.

Example: *** Tomb Raider - An adventurer, with one backpack of varying size and a thigh-holster that will automatically accept pistols, but nothing else. 

	*: Include Considerate Holdall by Jon Ingold.

	Rule for printing the name of the player: say "Lara".

	The player is wearing some thigh-holsters and a tiny backpack. The player is carrying a flaming torch. The backpack is an open player's holdall. The thigh-holsters are an open player's holdall. The carrying capacity of the player is 2. 

	The player is holding a wearable thing called a crystal amulet. The crystal amulet has description "The Amulet of Khesh-to." A pistol is a kind of thing. The left pistol and the right pistol are pistols. Understand "gun" as a pistol. The left pistol and the right pistol are in the thigh-holsters. The carrying capacity of the backpack is 2. The fake amulet is a wearable thing in the backpack. The fake amulet has description "This amulet lacks the mystical powers of the real crystal amulet."

A holdall rule: this simulates the magic of Lara's backpack, but only if the amulet is being worn: 

	*: A holdall rule for the backpack when the number of things in the backpack is the carrying capacity of the backpack and the player is wearing the crystal amulet:
		increase the carrying capacity of the backpack by 1;

Then some stashing rules. 

	*: A stashing rule for the pistols when the considered holdall is the backpack (this is the no weapons in backpack rule):
		disallow stashing.

	A stashing rule for a pistol when taking a pistol (this is the don't exchange one pistol for another rule):
		disallow stashing.

Two rules to ensure that only pistols go in the holsters. 

	*: A stashing rule for the pistols when the considered holdall is the thigh-holsters (this is the stash pistols in holsters rule): 
		allow stashing.

	A stashing rule for something when the considered holdall is the thigh-holsters (this is the nothing else in holsters rule): 
		disallow stashing.

A location with some goodies. 	

	*: The Temple Ruins are a room. "Triangular blocks of rubble litter the ground. Particle trails of dust sweep the air. Somewhere close by, a tiger roars. A small chamber orchestra plays orchestral music. You are panting slightly."

	The stone pedestal is a supporter in the Ruins. The ammo-pack is on the stone pedestal. The medi-pack is on the stone pedestal. The carrying capacity of the pedestal is 2. The ancient papyrus is on the stone pedestal.

Whatever happens, the torch can't ever be stashed. And we can't put it down until we've sorted a few things out. 

	*: The flaming torch is unstashable. 

	Every turn when the ancient papyrus is on the pedestal and the torch is on the pedestal: remove the papyrus from play; say "In a flash, the papyrus is consumed by sparks from the torch."

	After dropping the flaming torch:
		end the game in death;
		say "As the torch torches the dry stone underneath, flames lick outwards in all directions! Soon you have curled up, and dropped to your knees, still burning."

Now, our adversary, and a classic Tomb Raider solution: bullets.

	*: The tiger is an animal in the Temple Ruins. "There is a tiger right here! It paces backwards and forwards."

	The vine-covered arch is an open door. "An old twisted archway leads north." The arch is north of the Temple Ruins and south of the Grand Hall. Instead of going through the arch when the player can see the tiger, say "The tiger growls and roars at you!";

	Instead of inserting the ammo-pack into a pistol:
		remove the ammo-pack from play;
		say "You lock and load up."

	Shooting it with is an action applying to one thing and one carried thing.
	Understand "shoot [something] with [something]" as shooting it with.

	Instead of shooting something with something: say "No."
	Instead of shooting the tiger with the pistol when the player is not carrying two pistols: say "But Lara always shoots two-handed!"
	Instead of shooting the tiger with the pistol when the ammo-pack is not on-stage:
		say "Oh no! Your guns are out of ammo! Where are you going to find some here, in the depths of the jungle?"
	
	Instead of shooting the tiger with the pistol:
	remove the tiger from play;
	say "You pummel the tiger with bullets until it falls to the ground. A moment later - eerily - it fades from sight."

A little hokery to try and get round the multiple object-similar name problems. 

	*: Does the player mean taking a pistol (called the first one) when the player is carrying a pistol (called the second one): if the first one is the second one, it is very unlikely.
	Does the player mean doing something with the left pistol: it is very likely.
	Rule for clarifying the parser's choice of a pistol: do nothing instead.

And finally, our just desserts. 

	*: Instead of going through the arch:
		end the game in death;
		say "As you approach the arch, vicious spikes leap out from either side!"

	Test me with "i / wear amulet / shoot tiger with left pistol / take right pistol / take papyrus / take medi-pack / examine papyrus / put torch on pedestal / take all pistols / shoot tiger with left pistols / x right pistol / take medi-pack / n".

Note the choices the system makes for stashing as you test it.



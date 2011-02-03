Version 1/080522 of Dice-Lock by S John Ross begins here.
"Dice-Lock is a lightweight set of tools for preserving important random results against brute-force UNDO tactics."

Volume of Locking Up Dice

Chapter of the DiceLock Variable

DiceLock is a number variable.

Chapter of the Game Beginning

When play begins: change DiceLock to a random number between 1000 and 9999;
   [Insures that random seeding will still vary from play-through to play-through]
   [With a seed less than 1000, Inform doesn't behave properly]

Chapter of the Dice-Locking Activity

To lock the dice:
	Seed the random-number generator with DiceLock;
	Sprout the seed;
	If DiceLock is greater than 30000 begin;
		change DiceLock to DiceLock divided by 29; [Recycles the DiceLock before it gets too high]
		end if;

Section of Behaving Randomly

Before behaving randomly: lock the dice;

Section of the Dummy Designator

Verifying the story file is behaving randomly. [Replace or remove as needed]

Section of the RandomLock Token

To say RandomLock: lock the dice;

Section of the Sprouting Seed

To sprout the seed:
	Increase DiceLock by a random number between 0 and 9;
	Increase DiceLock by a random number between 0 and 9;
	Increase DiceLock by a random number between 1 and 9; [all zeroes would be Bad]

[
Yeah, I know. But I tested close to a dozen alternate "sprouts," including some based on Turn Count, some based on funky math (remainders after dividing), and of course simple stuff like simply raising by 1 ... anyway, maybe your tests will lead you somewhere more elegant than mine did :)
]


Dice-Lock ends here.

---- DOCUMENTATION ---- 

Chapter: Dice-Lock

Dice-Lock provides simple tools to protect random results from the ravages of UNDO. Rather than restricting the UNDO command directly, this extension allows the author to selectively "lock" random results. Once locked, the result is immune to brute-force undo-redo attempts.

This extension doesn't touch UNDO itself; the player is free to back off and choose another course of action. Dice-Lock also leaves the game's overall randomness intact(you "lock" only what you choose to), and preserves unpredictability from game to game (a locked coin-toss is still a coin-toss; locking it doesn't "fix" the result to Heads or Tails).

There are three basic ways to use Dice-Lock in your source: declaring an action as "behaving randomly," calling directly on the "lock the dice" activity, or inserting the "RandomLock" token into a string.

Section: Behaving Randomly

Any action defined as "behaving randomly" will always be locked. If you've got an old-school fantasy romp with lots of hit-point chewing combat, for example, a single line of added code might do the trick:

	Attacking is behaving randomly.

This marks every use of the "attack" action as something to be locked, so any attack's randomness (and randomized counterattacks within the same turn, for example) will be preserved. If the game includes new actions ("Blocking" or "Parrying," etc) they can be perma-locked with similar one-time declarations.

Section: Calling on the "lock the dice" Activity

The "lock the dice" activity sits at the extension's functional core, and it's often desirable to simply summon the action directly, like so:

	To rob the player:
		if the player encloses something begin;
			lock the dice;
			remove a random thing enclosed by the player from play;
			end if; 

Now, when we call on the game to "rob the player," UNDO will not save our poor protagonist from the choice the cruel Fates have made.

Section: Saying "[RandomLock]"

On occasion, it's useful to plug a lock directly into a string. The "RandomLock" token, inserted into any printable text, will call on the game to lock the randomness whenever that text is printed.

Chapter: Limitations

This isn't an elaborate extension, but it's pretty spiffy as far as it goes. It's worth bearing in mind, however, how far it DOESN'T go.

Dice-Lock preserves random results by rebooting the game's RNG with a seed stored and manipulated as a number variable (the "DiceLock"). This preserves selected results against simple UNDO (or SAVE/RESTORE) workarounds but it's far from bulletproof, and errs on the side of simplicity and trust. Like anything I do, it's for players like me, and in this case that means "honest, but sometimes led astray by easy temptation." This game eliminates an easy temptation, but in truth that's ALL it does. That said, it should be sufficient for a good many games, and it does have the advantage of being very tiny and easy to modify(it requires no understanding of I6, and given who wrote it, not much understanding of I7, either).
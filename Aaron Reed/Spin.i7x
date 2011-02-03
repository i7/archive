Spin by Aaron Reed begins here.

"Lets the player bypass puzzles they aren't interested in whenever they have spin, which they gain by experimenting and interacting with the story world."

Section - Implementing Spin

A thing can be spinnable. A thing is usually not spinnable.

player-has-spin is a truth state that varies. player-disabled-spin is a truth state that varies.

Spinning is an action applying to one visible thing. Understand "spin [something]" as spinning.

Check spinning a not spinnable thing (this is the only spinnables can be spun rule): say "That's not something that can be spun. Type SPIN for a list of visible things that can be." instead.

Check spinning when player-has-spin is false (this is the players without spin can't spin rule): say "You don't have spin." instead.

Check spinning when player-disabled-spin is true (this is the players who have disabled spin can't use it rule): say "You've disabled spin for this game." instead.

First carry out spinning (this is the process spinning rule):
	now noun is not spinnable;
	now player-has-spin is false.
	
After spinning (this is the display results of spinning rule):
	try looking;
	say "(Spin [one of]returns[or]goes back[stopping] to me.)".

To award spin for (item - a thing):
	if item is spinnable, gain spin;
	now item is not spinnable.

To gain spin: (- gainSpin(); -).

Include (- 

[ gainSpin ;
	if ( (+ player-has-spin +) == false && (+ player-disabled-spin +) == false)
		print "^(You reclaim spin.)^";
	(+ player-has-spin +) = true;
];

-).

Section - Controlling Spin

Querying spinnables is an action out of world applying to nothing. Understand "spin" as querying spinnables.

Check querying spinnables when player-disabled-spin is true (this is the players who have disabled spin can't query it rule): say "You've disabled spin for this game." instead.

Carry out querying spinnables (this is the display visible spinnables rule): say "[one of]In this story, certain obstacles have been introduced to impede your forward progress. Some delight in puzzling out ways past these obstacles. However, if you find an obstacle you grow tired of or wish to skip past, you can SPIN that obstacle to overcome it. You must have spin to use it; you gain spin by experimenting with obstacles, successfully or unsuccessfully.[paragraph break]Some people prefer to play without spin. Type SPIN OFF to disable spin for the remainder of the game.[paragraph break][or][stopping][if player-has-spin is true]Visible things that can be spun: [the list of visible spinnable things][otherwise]Right now, you don't have spin[end if]."

Disabling spin is an action out of world applying to nothing. Understand "spin off" as disabling spin. Carry out disabling spin (this is the disable spin rule): now player-disabled-spin is true; say "Spin has been permanently disabled." Understand "spin on" as a mistake ("Disabling spin is permanent. You can type RESTART to begin a new game with spin enabled.").

To say award -- beginning award_spin: (- {-allocate-storage:award_spin}if (I7_ST_award_spin-->{-counter:award_spin} == false) {-open-brace} I7_ST_award_spin-->{-advance-counter:award_spin} = true; gainSpin(); -). 
To say spin -- ending award_spin: 
    (- {-close-brace} -).


Spin ends here.

---- DOCUMENTATION ----

This extension creates a new meta-command (a la SAVE or UNDO) called spin, which allows the player and author to alternately hold control over forward progress in a story.

 Since IF's open-ended interface gives the illusion of open-ended solutions to problems that almost always have only one implemented solution, players are invariably let down when their well-reasoned behaviors are not options implemented by the author. 

This extension introduces the abstract concept of spin, which is always held by either the game or the player. Certain objects representing blocks on forward progress in the story (puzzles) can be declared spinnable. Interacting with these objects (in ways judged by the author to be incorrect) causes the game to forfeit spin. When the player has spin, he can give it up to bypass one obstacle.

The ultimate goal is to assist more players in reaching the middles and ends of interactive stories they are genuinely interested in, but frustrated by, without them having to feel they are "cheating" by consulting out-of-game hints or walkthroughs.

To use the extension, you must select appropriate spinnable moments in your game: locked doors, angry trolls, unclear devices, etcetera. For each moment, select an item the player will most likely interact with to try to overcome this obstacle. (For more abstract puzzles such as a maze, a scenery item present in all relevant locations might be required.) For each selected item, you must modify your game in four ways:

1) Give the target item the property "spinnable."

2) Define one or more responses for actions the player might conceivably try that are not your particular puzzle solution. (For a locked door, attacking, pushing, knocking, or touching might all be appropriate.) Write response messages for these, if you haven't already, and include at the very end of each one the special phrase "[award][spin]". This will, one time only, return spin to a player who doesn't already have it. This represents the acknowledgement that the player is interacting with your story world in good faith.

3) In the rules carried out when a player successfully solves the puzzle, add the phrase "award spin for thing" (where thing is the name of the primary, spinnable item). This returns spin to the player for correctly solving a puzzle.

4) Write a "Carry out spinning the thing" rule that describes the player bypassing your obstacle via a different approach which isn't your main puzzle solution and isn't normally possible. For example, bypassing a locked door might have descriptive text requiring bashing in the lock with a handy rock. This rule should also change the world's state such that the puzzle is now solved (and, if necessary, irreversible). The player will give up spin to take this action, representing that they are willing to keep playing past your obstacle but can't figure out the behavior you expected of them. This is not a place to "educate" the player as to what they "should have done" to solve your puzzle: the spin text should be a fresh, creative way around the problem that stands in for some equally creative approach the character might have tried but which the player was unable to due to the limits of implementation.

A player with spin can use the SPIN verb on a thing to spend it. SPIN alone produces a list of visible, spinnable things, and, the first time only, some explanatory text: you may wish to suggest the player type SPIN to see the explanation in your about or introductory text. SPIN OFF lets a player permanently disable spin.

Puzzles that require preliminary puzzles to be solved first can be handled in a variety of ways. The easiest is to add a rule which prevents the target item being spun until the subsidiary items are also spun:

	Instead of spinning steel door when troll is spinnable or puzzle box is spinnable: say "That's too big to spin right now."

Another case is when uncovering the normal solution to an obstacle reveals important story information to the player. In this case, spinning should make what was previously concealed visible, or what was previously unclear more plain. If passing through a locked door required first discovering a key hidden in Grandma's diary, then spinning the door should cause the diary to fall from its hiding place behind the bookcase into plain sight on the floor, perhaps producing a noise loud enough to be heard from the current location. If learning the right topic to persuade Thomas involves examining an offhand item mentioned in a room description, spinning Thomas should cause that item to be mentioned prominantly in its own paragraph the next time that room is visited.

	Carry out spinning Thomas: say "Oh, if only you could think of what to ask the old fool. Maybe another stroll through the house will help jog your memory."; now initial appearance of the violin is "Thomas's violin catches a shaft of gleaming sunlight.".

This extension is still highly experimental and contentious. Feedback is welcomed to the gmail account name aareed.

Example: * Escape - Basic Example of using spin

	*: "Escape"

	Include Spin by Aaron Reed.

	Prison Cell is a room. 

	A flimsy cot is a fixed in place enterable supporter in Prison Cell. "A flimsy cot is shoved into a corner."

	Instead of pushing or pulling cot: say "The cot is bolted to the floor.[award][spin]". Instead of searching cot: say "You look through the sheets and mattress, but don't find anything.[award][spin]".

	Instead of looking under cot when rusty nail is off-stage: move rusty nail to cot; say "Under the cot you find a rusty nail." The rusty nail is a thing. 

	Corridor is a room. Some steel bars are a door. "Some steel bars to the west lead to the prison corridor.". They are west of Prison Cell and east of Corridor. The bars are locked and closed.  

	A bored guard is a man in Prison Cell. "Outside the bars stands a bored guard, not paying you any attention."

	Instead of attacking the guard: say "You don't have any chance of that through the bars." Instead of asking the guard about anything: say "'Why don't you shut up?' he says menacingly.[award][spin]". Instead of singing: say "The guard glowers at you. 'Cut that noise out,' he says.[award][spin]".

	Instead of attacking the guard when rusty nail is held: say "You viciously stab the guard's neck through the bars with the rusty nail! He drops to the ground. You reach through the bars and snag his keys from his pocket."; move keys to player; remove guard from play; award spin for guard. The keys unlock the steel bars.
 
	After going to Corridor: end the game saying "Then more things happen".

	The guard is spinnable. Carry out spinning the guard: say "Carefully, you wait until the guard is distracted, then reach through the bars, grab his collar, and viciously pull back! His head slams against the bars and he slumps to the ground. You quickly reach through and grab his keys."; move keys to player; remove guard from play. Instead of spinning the bars: try spinning the guard.

	Test me with "spin / attack guard / x cot / push cot / spin / ask guard about prison / spin guard / unlock bars with keys / open bars / w".
Bitwise Operators by Bart Massey begins here.

"Provides phrases for bitwise arithmetic/logical operators."

[ Copyright © 2012 Bart Massey]
[ Released under the Creative Commons Attribution 3.0 United States license: http://creativecommons.org/licenses/by/3.0/us/ ]

Chapter - Primitive Operators

To decide what number is bit-not (A - a number):
	(- (~{A}) -).

To decide what number is (A - a number) bit-and (B - a number):
	(- ({A} & {B}) -).

To decide what number is (A - a number) bit-or (B - a number):
	(- ({A} | {B}) -).

Chapter - Bit Shifts

[ This is frustrating. The Z-machine and Glulx both include shift instructions, but apparently Inform 6 not so much. ]

Section - Bit Shift Primitives (for Glulx only)

Include (-
[ SHL A B;
  @shiftl A B A;
  return A;
];
[ SHR A B;
  @sshiftr A B A;
  return A;
]; -).

[ These are really only for Z-machine version 5 or later, but since the Inform 7 IDE doesn't seem to support earlier versions, I'm not going to worry about it. ]

Section - Bit Shift Primitives (for Z-machine only)

Include (-
[ SHL A B;
  @art_shift A B -> A;
  return A;
];
[ SHR A B;
  B = -B;
  @art_shift A B -> A;
  return A;
]; -).


Section - Bit Shift Phrases

To bit-shl (A - an existing number variable) by (B - a number):
	(- {A} = SHL({A}, {B}); -).
        
To bit-shr (A - an existing number variable) by (B - a number):
	(- {A} = SHR({A}, {B}); -).
        
To decide what number is (A - a number) bit-shl by (B - a number):
	(- SHL({A}, {B}) -).

To decide what number is (A - a number) bit-shr by (B - a number):
	(- SHR({A}, {B}) -).

Chapter - XOR

[ Glulx includes an XOR opcode, but the Z-machine does not. ]

Section - XOR Phrases (for Glulx only)

To bit-xor (A - a number) into (B - an existing number variable):
	(- @bitxor {A} {B} {B}; -)

To decide what number is (A - a number) bit-xor (B - a number):
	let C be B;
	bit-xor A into C;
        decide on C.

Section - XOR Phrases (for Z-machine only)

[ http://www.firthworks.com/roger/informfaq/tt.html#2 ]

Include (-
[ XOR a b;
  return (a | b) & ~(a & b);
]; -).

To bit-xor (A - a number) into (B - an existing number variable):
	(- {B} = (XOR({A}, {B}); -)

To decide what number is (A - a number) bit-xor (B - a number):
	(- XOR({A}, {B}) -).

Chapter - Other Phrases

[ Numbers by Krister Fundin showed me the pattern for this. ]

To bit-negate (A - an existing number variable):
	(- {A} = ~{A}; -)

To bit-and (A - a number) into (B - an existing number variable):
	(- {B} = {A} & {B}; -)

To bit-or (A - a number) into (B - an existing number variable):
	(- {B} = {A} | {B}; -)

Bitwise Operators ends here.

---- Documentation ----

This module extends Inform 7 by providing some standard bitwise logical operations on numbers. Bitwise operations are rarely needed in the course of stories; the use of XOR in the example below was the inspiration for creating this extension.

The supported bitwise logical operators are "NOT", "AND", "OR", "XOR" (eXclusive-OR), "SHL" (left shift) and "SHR" (arithmetic right shift). Negative shift counts work as expected.

	bit-not (number)
	(number) bit-and (number)
	(number) bit-or (number)
	(number) bit-xor (number)
	(number) bit-shl by (number)
	(number) bit-shr by (number)

It is useful to be able to modify variables "in-place". Bitwise NOT is the simplest case. Note that the variable argument N must be a local variable, not a global.

	bit-negate N

For binary increment and decrement, the standard Inform 7 syntax provides:

	increase N by (number)
	decrease N by (number)

A similar syntax is used for bitwise shifts SHL and SHR.

	bit-shl N by (number)
	bit-shr N by (number)

This right-to-left syntax is grammatically awkward for the binary logical operators. Bitwise AND, OR and XOR use a left-to-right construction with "into".

	bit-and (number) into N
	bit-or (number) into N
	bit-xor (number) into N

Example: ** Behind This Door - Using bitwise operators in a puzzle

The classic "toggling lights" puzzle is the "Magic Square" mode of the 1978 Parker Brothers electronic game Merlin. There's a certain addictive fascination in figuring out what is going on with the lights. This is a much harder version of this "Lights Out" style of puzzle in that there are few regular patterns, but easier in that the search space is small. The lights are rendered as ASCII graphics, for lack of a better plan.

The puzzle size is configurable; it can be NxN for any N greater than one. The Table of Toggle Values, below, gives the full configuration of a particular puzzle instance. One must be careful with the entries here: it is easy to create an unsolvable puzzle. The table given follows the additional constraint, borrowed from Merlin, that pushing a given button always toggles the light at that button.

It would certainly be possible to write this game in pure Inform, representing each button and light with an object. However, this approach tends not to scale well. A lot of source text (and a high object count) ends up being needed to implement a reasonable-sized puzzle.

	*: "Behind This Door" by "Bart Massey".
	
	Include Bitwise Operators by Bart Massey.
	
	The Antechamber is a room. "This barren metal room has two doors. The [entrance door] to the south is locked: can't go back now. The [exit door] to the north is locked as well, by an [electronic pushbutton lock] on the wall next to it."
	
	The entrance door is a scenery door. It is south of the Antechamber. It is closed and locked.
	
	The exit door is a scenery door. It is north of the Antechamber and south of the Unreachable Room. It is closed and locked.
	
	The electronic pushbutton lock is scenery in the Antechamber. The description is "This peculiar lock has a horizontal row of buttons. Each button has a light in the center. The lights currently look like this:[state of the lights]". Understand "button" or "buttons" or "light" or "lights" as the electronic pushbutton lock.
	
	The puzzle size is a number that varies. All-ones is a number that varies. The button state is a number that varies.
	
	When play begins: now the puzzle size is the number of rows in the Table of Toggle Values; let M be 1 bit-shl by the puzzle size; now all-ones is M - 1; now the button state is all-ones.
	
	To say button instructions: say "You must press a button between 1 and [puzzle size] by number. For example, PRESS [puzzle size]."
	
	Pressing is an action applying to one value. Understand "button [number]" or "light [number]" or "[number]" as "[button number]". Understand "press [button number]" or "push [button number]" or "touch [button number]" as pressing. Understand "push button/buttons" or "press button/buttons" or "touch button/buttons" as a mistake ("[button instructions]").
	
	To say state of light (X - a number): let M be 1 bit-shl by X; let B be  the button state bit-and M; if B is 0, say "-"; otherwise say "*".
	
	To say state of the lights: say "[conditional paragraph break]    "; repeat with X running from 0 to the puzzle size - 1 begin; say state of light X; end repeat; say "[conditional paragraph break]".
	
	Check pressing a number (called N): if N is less than 1 or N is greater than the puzzle size, instead say button instructions.
	
	Carry out pressing a number (called N): let B be N - 1; let T be the Toggle Value in row N of the Table of Toggle Values; say "You see the lights go from [state of the lights]"; now the button state is the button state bit-xor T; say "to [state of the lights]".

	Table of Toggle Values
	Toggle Value
	42
	18
	25
	22
	11
	7
	
	Report pressing a number: if the button state is not 0, continue the action; now the exit door is unlocked; now the button state is all-ones; say "You hear a loud click from the vicinity of the [exit door]."
	
	After pressing a number for the first time: say "Hmmm... Maybe if you could get all the lights turned off the door would unlock."
	
	Carry out going through the exit door: end the story saying "You made it! Just in time, too!".
	
	Test me with "n / s / x lock / push 1 / push 3 / push 5 / push 6 / n".
	
Spoiler Alert! That last line tells you how to solve the game.

Example: ** Nimrod - Using bitwise XOR to play Nim

The game of Nim is a skill game in which players take turns taking stones from any one of a number pits until some player wins by taking the last stone. It turns out that a strategy involving XOR is optimal for this game. It is possible to play this strategy in your head, and easy for a computer to play it. Since Nimrod lets the player go first, it is possible for the player to force a win; if the player makes any mistakes, however, the player will lose.

	*: "Nimrod" by "Bart Massey".
	
	Include Bitwise Operators by Bart Massey.
	
	The maximum score is 1.
	
	There is a room called The Game Room. "An ancient, pitted Nim Table dominates the center of the room. Behind the table, seated in a high-backed chair, is the legendary Nim champion Nimrod. You, it appears, may stand."
	
	A high-backed chair is a scenery supporter in The Game Room. The description is "This chair is carved from ashen granite."
	
	A nim table is a scenery supporter in The Game Room.  The description is "This table is waist-high, and has three pits for stones. [The description of pit one] [The description of pit two] [The description of pit three]".
	
	Nimrod is a scenery man on the high-backed chair. The description is "Nimrod is pale, dark-haired and inscrutable."
	
	[ We build a bunch of auxiliary machinery to support the algorithm. ]
	
	To say (n - a number) stones: if n is 0, say "nothing"; if n is 1, say "one stone"; if n is greater than 1, say "[n] stones".
	
	A pit is a kind of thing. Every pit has a number called the stone count. The description of a pit is "[The item described] contains [the stone count of the item described stones]."
	
	A pit called pit one is part of the nim table. The stone count of it is 3. Understand "pit 1" as pit one.
	
	A pit called pit two is part of the nim table. The stone count of it is 5. Understand "pit 2" as pit two.
	
	A pit called pit three is part of the nim table. The stone count of it is 7. Understand "pit 3" as pit three.
	
	Taking it stones from is an action applying to one value and one visible thing and requiring light. Understand "take [number] stone/stones/-- from [pit]" as taking it stones from.
	
	Check taking a number (called n) stones from a pit (called p): let np be the stone count of p; if n > np, say "Your reach exceeds your grasp. Too many stones? The wrong pit? Just confused? Who can say?" instead; if n < 1, say "Clever...but also illegal. Nimrod glares mercilessly at you as you pull your hand back." instead. 
	
	Carry out taking a number (called n) stones from a pit (called p): now the stone count of p is the stone count of p - n; say "You feel [n stones] magically fade away at your touch. [The p] now contains [the stone count of p stones]."; try Nimrod moving.
	
	Carry out Nimrod taking a number (called n) stones from a pit (called p): now the stone count of p is the stone count of p - n; say "Nimrod deftly erases [n stones] from [p], leaving [the stone count of p stones]."
	
	Moving is an action applying to nothing.
	
	Definition: A pit is nonempty if the stone count of it is greater than 0.
	
	To decide whether the table is empty: let l be the list of nonempty pits; if the number of entries of l is 0, yes; otherwise no.
	
	[ Finally (finally!) the actual game mechanic is fairly simple.]
	
	Check Nimrod moving when the table is empty: say "Nimrod stares sadly at the empty pits. He hangs his head in shame. He has been defeated."; now the score is 1; end the story.
	
	Report Nimrod moving when the table is empty: say "Nimrod's eyes flash in triumph as he completes his victory."; end the story.
	
	Carry out Nimrod moving:
		say "Nimrod ponders the situation ponderously...[line break]";
		let q be 0;
		repeat with p running through the list of nonempty pits:
			let n be the stone count of p;
			let q be q bit-xor n;
		repeat with p running through the list of nonempty pits:
			let n be the stone count of p;
			let r be q bit-xor n;
			if n > r:
				let t be n - r;
				try Nimrod taking t stones from p instead;
		let m be pit one;
		repeat with p running through the list of nonempty pits:
			let nm be the stone count of m;
			let np be the stone count of p;
			if np > nm:
				now m is p;
		try Nimrod taking 1 stones from m.
	
	Test winning with "take 1 stone from pit 1 / take 1 stone from pit 2 / take 1 stone from pit 1 / take 1 stone from pit 1 / take 1 stone from pit 3 / take 1 stone from pit 3 / take 1 stone from pit 3 / take 1 stone from pit 3".
	
	Test losing with "take 3 stones from pit 1 / take 4 stones from pit 3 / take 1 stone from pit 2".
	
	Test me with "test losing".

The name "Nimrod" is a Biblical name meaning "Mighty Hunter".

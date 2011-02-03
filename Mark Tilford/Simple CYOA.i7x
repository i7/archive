Simple CYOA by Mark Tilford begins here.

"An extension for creating simple menu-based games."

Use inline choices translates as (- Constant Inline_Choices 1; -).
Use mention all changes translates as (- Constant AlertChanges 1; -).

Game page is a kind of value.  
Initial page is a game page that varies. 
A game state is a kind of thing.  
Initial state is a game state.


Table of Current Choices
Result
a game page
with 4 blank rows

The rowcount is a number which varies;

To reset the links:
  repeat through the Table of Current Choices begin;
    blank out the whole row;
  end repeat;
  change rowcount to 0.

To say link (which - a game page): 
  if rowcount is less than the number of rows in the Table of Current Choices begin;
    increase rowcount by 1;
    change result in row rowcount of Table of Current Choices to which;
    if using the inline choices option begin; otherwise; say line break; end if;
    say "[rowcount]) ";
  otherwise;
    say "Too many choices, including [which] (BUG).";
  end if.

To continue to (next - a game page):
  if current view mode is allow changes then try preparing page next;
  [change current page to next;]
  try displaying page next.
  
To say continue to (next - a game page): continue to next;

Backup state is a game state.  Current state is a game state.  Current page is a game page that varies.  Backup page is a game page that varies.

View mode is a kind of value. The view modes are just looking and allow changes.  [A view mode is usually allow changes.]  Current view mode is a view mode that varies.

Include (-
Default UndoBufferLength 100;
Constant NAttributes 48;
Array UndoBuffer --> UndoBufferLength;
Default AlertChanges 0;

Global UndoStep = 0;

[ ShowBacktrace ptr block_ends x;
  !for (ptr = (UndoStep + (UndoBufferLength - 1)) % UndoBufferLength: ptr ~= UndoStep: 
  !     ptr = (ptr + (UndoBufferLength - 1)) % UndoBufferLength )
  !  print UndoBuffer-->ptr, ", ";
  for (ptr = 0: ptr < UndoBufferLength: ptr ++ ) {
    if (ptr % 5 == 0) print "  ";
    print UndoBuffer-->ptr;
    if (ptr + 1 == UndoStep) print "*";
    print ", ";
  }
  print "^";
  ptr = UndoStep;
  for (::) {
    !x = x + 1; if (x >= 10) "overflow";
    !ptr = (ptr + (UndoStep-1)) % UndoBufferLength;

    ptr = (ptr + (UndoBufferLength - 1)) % UndoBufferLength;
    if (ptr == UndoStep) "(end of buffer)";
    block_ends = UndoBuffer-->ptr;
    !print "  {", ptr, ":", UndoBuffer-->ptr, "}";
    if (block_ends == -1) "(overwritten)";
    if (UndoBuffer-->block_ends == -2) "(start)";
    if (UndoBuffer-->block_ends == -1) "---";

    ptr = (ptr + (UndoBufferLength-1)) % UndoBufferLength;
    if (ptr == UndoStep) "...b";
    print "^Page == ", (UndoBuffer-->ptr), ": ";

    while (ptr ~= block_ends) {
      ptr = (ptr + (UndoBufferLength-1)) % UndoBufferLength;
      !print "{", ptr, "|", UndoBuffer-->ptr, "}";
      if (ptr == UndoStep) "...c";
      print "(", (UndoBuffer-->ptr), ": ";

      ptr = (ptr + (UndoBufferLength-1)) % UndoBufferLength;
      !print "{", ptr, ";", UndoBuffer-->ptr, "}";
      if (ptr == UndoStep) "...d";
      print (UndoBuffer-->ptr), ") ";
    }
  }
];

! Copy all properties from src to dest.  They must be of the exact same kind.
!
[ CopyObject src dest i j;
  !print "Copy Object -- ^";
  for (i = 0: i < NAttributes: i ++) {
    if (src has i) give dest i;
    else give dest ~i;
  }
  !print "Comparing object ", src, " to ", dest, "^";
  for (i = 4: i < #identifiers_table-->0: i ++) {
    if ((dest provides i) ~= (src provides i))
      print "Error: property mismatch: ", i, "^";
    if (dest provides i) {
      if (dest.#i ~= src.#i)
        print "Error: property size mismatch: ", (dest.#i), " / ", (src.#i), "^";
      else if (dest.#i == 1) 
        dest.i = src.i;
      else
        for (j = 0: j < dest.#i: j ++)
          dest.&i->j = src.&i->j;
    }
  }
];

! PushGameState:  Copies all differences between the 'current state /
!                          current page' and 'backup state / backup page' 
!                          onto the undo stack, and then copies the current
!                          values into the backup values.
!
[ PushGameState current prev i old_undostep;
  !print "Pushing game state...^";
  current = (+ current state +);
  prev = (+ backup state +);
  old_undostep = UndoStep;
  for (i = 0: i < NAttributes: i ++)
    if ((current has i) ~= (prev has i)) {
      if (AlertChanges)
        print "(Detected change of attribute ", i, " to ", (current has i), ")^";
      PushUndoValue((prev has i));
      PushUndoValue(i);
      if (current has i) give prev i;
      else give prev ~i;
    }
  for (i = 4: i < #identifiers_table-->0: i ++) {
    if (~~(current provides i)) continue;
    if (~~(prev provides i)) continue;    
    if (current.#i > 2) {
      continue; ! TODO
    }
    if (current.i ~= prev.i) {
      if (AlertChanges)
        print "(Detected change of prop ", (property) i, " to ", (current.i), ")^";
      PushUndoValue (prev.i);
      PushUndoValue (NAttributes + i);
      prev.i = current.i;
    }
  }
  
  PushUndoValue ( (+ Backup page +) );
  (+ backup page +) = (+ current page +);
  PushUndoValue (old_undostep);
];

! PopGameState:  Reverses a previous call to PushGameState
!                        Sets all values in current state, backup state,
!                        current page, backup page to before that call.
!
[ PopGameState current prev prop val undo_to;
  current = (+ current state +);
  prev = (+ backup state +);
  val = PeekUndoBuffer();
  if (val == -1)
    "(Sorry, you can't undo any further.)";  
  val = UndoBuffer-->val;
  if (val == -2)
    "(You're at the beginning of the game!)";
  if (val == -1)
    "(Sorry, you can't undo any further.)";
  undo_to = PopUndoValue();
  (+ current page +) = PopUndoValue();
  while (UndoStep ~= undo_to) {
    if (UndoStep == 0) return;
    prop = PopUndoValue();
    val = PopUndoValue();
    if (prop < NAttributes) {
      if (AlertChanges)
        print "(Reverting change of attribute ", prop, " to ", val, ")^";

      if (val) {
        give current prop;
        give prev prop;
      } else {
        give current ~prop;
        give prev ~prop;
      }
    } else {
      prop = prop - NAttributes;
      if (AlertChanges)
        print "(Reverting change of property ", prop, " to ", val, ")^";
      (+ current state +).prop = val;
      (+ backup state +).prop = val;
    }
  }
  (+ backup page +) = (+ current page +);
  return 0;
];

[ ClearUndoBuffer i;
  for (i = 0; i < UndoBufferLength; i ++)
    UndoBuffer-->i = -1;
  UndoStep = 0;

  PushUndoValue(-2);
  PushUndoValue(0);
  ! Special values to indicate that the undo stack is at the very start of the game.
  !(+ initial page +) = (+ current page +);
  !CopyObject ( (+ current state +), (+ initial state +) );
];

[ PushUndoValue i;
  !print "[[Pushing ", i, " onto stack: ", UndoStep, "]]^";
  UndoBuffer-->UndoStep = i;
  UndoStep = (UndoStep + 1) % UndoBufferLength;
];

[ PopUndoValue tmp;
  if (UndoStep <= 0) UndoStep = UndoStep + UndoBufferLength;
  UndoStep = UndoStep - 1;
  tmp = UndoBuffer-->UndoStep;
  UndoBuffer-->UndoStep = -1;
  !print "[[Popping ", tmp, " from stack: ", UndoStep, "]]^";
  return tmp;
];

[ PeekUndoBuffer tmp;
  tmp = PopUndoValue();
  !print "[[Peeking: ", tmp, ": ", UndoStep, "]]^";
  PushUndoValue(tmp);
  return tmp; 
];

[ ReadChoice i j wd;
  for (::) {
    !ShowBacktrace();
    if ( (+ rowcount +) == 0)
      print "restart / restore / undo / quit> ";
    else
      print "> ";
    read buffer parse;
    !print "parse->1 == ", parse->1, "^";
    if (parse->1 ~= 1) continue;
    wd = parse-->1;

    if (wd == 'undo') {
      if (PopGameState ( (+ current page +), (+ backup page +) ) == 0)
        return -1;
      continue;
    }

    if (wd == 'save' && (+ rowcount +) > 0) {
      #IFV5;
      @save -> j;
      switch (j) {
        0: L__M(##Save,1);
        1: L__M(##Save,2);
        2: L__M(##Restore,2);
      }
      #IFNOT;
      save Smaybe;
      L__M(##Save,1);
      continue;
      .SMaybe; L__M(##Save,2);
      #ENDIF;
      continue;
    }

    if (wd == 'restore') {
      restore Rmaybe;
      L__M(##Restore,1);
      continue;
      .RMaybe; L__M(##Restore,2);
      continue;
    }

    if (wd == 'look' && (+ rowcount +) > 0)
      return -1;

    if (wd == 'restart') {
      ClearUndoBuffer();
      CopyObject ( (+ initial state +), (+ current state +) );
      CopyObject ( (+ initial state +), (+ backup state +) );
      !print "Changing page from ", (+ current page +), " to ", (+ initial page +), "^";
      (+ current page +) = (+ initial page +);
      (+ backup page +) = (+ initial page +);
      return -1;
    }

    if (parse-->1 == 'quit') {
      print "Bye^";
      @read_char i;
      quit;
    }

    i = TryNumber(1);
    if (i > 0 && i <= (+ rowcount +)) return i;
    !j = j + 1;
    !if (j >= 10) return 2;
  }
];

[ EndTheGame x; print "Press a key to exit^"; @read_char x; print "Bye!^"; quit; ];
-);


To abort the game: (- EndTheGame(); -).
To back up the game state: (- PushGameState(); -).
To undo a game state: (- PopGameState(); -).
To decide which number is page to view next: (- ReadChoice() -).
To clear the undo buffer: (- ClearUndoBuffer(); -).
To copy object (SRC - thing) onto (DEST - thing): (- CopyObject ( {SRC}, {DEST} ); -).
To initialize the gamebook: copy object initial state onto current state; copy object initial state onto backup state; clear the undo buffer; change current page to initial page.

Displaying page is an action applying to a game page.  Carry out displaying page: say "Fallthrough:  there is no support for saying page on [game page understood](BUG).". 
Preparing page is an action applying to a game page.  Carry out preparing page: do nothing. 

To say page for (which - a game page): try displaying page which.

The game base is a room.  "You should never see this (BUG).".

Interturn rules is a rulebook.

when play begins:
  say banner text;  
  say list of extension credits;
  change rowcount to 1;
  reset the links;
  change current view mode to allow changes;
  try preparing page current page;
  try displaying page current page;
  initialize the gamebook;
  while 1 is 1 begin;
    let nextrow be page to view next;
    if nextrow is -1 begin;
      reset the links;
      change current view mode to just looking;
      try displaying page current page;
    otherwise;
      change current page to result in row nextrow of the Table of Current Choices;
      reset the links;
      change current view mode to allow changes;
      try preparing page current page;
      try displaying page current page;
      follow the interturn rules;
      back up the game state;
    end if;
  end while.
  [abort the game.]


Simple CYOA ends here.

---- DOCUMENTATION ----

This allows the user to make simple gamebooks.  Also supports 'look' (redisplay current text), 'undo', 'save', 'restore'.

There is a kind of value 'game page'.  The author must give a type of game page for each reference in the game.  (For example, "The game pages are at entrance, left door, right door, down hall, take sword, climb ladder, take potion, back down, take sword 2, left bridge, right bridge, drink, and across bridge.").  The author must also set the variable 'initial page' appropriately.  (Continuing, "Initial page is at entrance.").

For each page, the author must add a rule "Instead of displaying page _____, instead ...".  For each choice the player can make on that page, put in the text "[link ____](Description of choice)", where ____ is the game page which follows.  (For example, Instead of displaying page at entrance, say "You find yourself in a long hall with doors on either side.  Do you [link left door]go left, [link right door]go right, or [link down hall]go forward?".)  To end the game, do not provide any links from a page.  To move to a different page without prompting for a choice in between, put "[continue to ____]" in the description.

If the game is to have any state beyond the current page, the author must add appropriate variables to the 'game state' kind.  (For example, if you want to keep track of a score, "A game state has a number called the player score.") and initialize initial state appropriately.  (The player score of initial state is 0.)  Display page actions should not make any changes to game state; instead, put any changes into a prepare page rule.  (For example, Instead of preparing page take sword: increase player score of current state by 1; now current state is has sword. Instead of displaying page take sword: say "Taken.  Now do you [link climb ladder]climb up the ladder or [link right door]go out the door?".)

There is also a rulebook called the interturn rules, used to monitor for changes.  They will be called after the text and all choices have been displayed, but before prompting for input.  The state of the game before the choice is accessible in the variable backup state, if the author wishes to compare the two.  (For example, to notify on score changes, An interturn rule:  if player score of current state is greater than player score of backup state then say "Your score went up by [player score of current state - player score of backup state] point[s] to [player score of current state].".  An interturn rule:  if player score of current state is less than player score of backup state then say "Your score went down by [player score of backup state - player score of current state] point[s] to [player score of current state].".)  The game should not modify backup state in any way.

By default, each choice is displayed on its own line.  To have choices listed within the text (as in "You can 1) enter the house or 2) back off slowly."), put the line "Use inline choices;" at the start of the file.

For debugging a game, adding "Use mention all changes;" before include Simple CYOA will cause it to list all changes detected between turns or when undoing.


LIMITATIONS:
At present, there can not be more than 4 choices from any single page.  In addition, the undo buffer is limited to a fixed size of 100 (50 turns with no state, 25 turns if there is one variable which changes every turn, close to 50 turns if state variables change very rarely).  Both these limits should be author-settable in future releases.

Example: * Castle Escape - A simple test.

	"Castle Escape" by ralphmerridew

	Use inline choices;
	[Use mention all changes;]

	Include Simple CYOA by Mark Tilford.

	The game pages are at entrance, left door, right door, down hall, take sword, climb ladder, take potion, back down, take sword 2, left bridge, right bridge, drink, and across bridge.

	Initial page is at entrance.

	A game state can be has sword or hasnt sword.  A game state can be has potion or hasnt potion.  A game state has a number called the player score.

	Initial state is hasnt sword.  
	Initial state is hasnt potion.
	The player score of initial state is 0.

	An interturn rule:  if player score of current state is greater than player score of backup state then say "Your score went up by [player score of current state - player score of backup state] point[s] to [player score of current state].".

	An interturn rule:  if player score of current state is less than player score of backup state then say "Your score went down by [player score of backup state - player score of current state] point[s] to [player score of current state].".

	[ Just to help keep track of the way the game branches, we diagram the nodes:
	  at start -> left door, right door, down hall  (down hall == left door)
	  left door -> take sword, climb ladder, right door
	  take sword (set sword) -> climb ladder, right door
	  climb ladder (if has sword) -> DIE; otherwise -> take potion, back down
	  take potion (set potion) -> back down 
	  back down -> take sword 2, right door
	  take sword 2 (set sword) -> right door
	  right door (if has potion) -> left bridge, right bridge, drink; otherwise -> left bridge, right bridge
	  left bridge -> DIE
	  right bridge -> DIE
	  drink -> across bridge
	  across bridge (if has sword) -> WIN; otherwise -> DIE
	]

	Instead of displaying page at entrance, say "You find yourself in a long hall with doors on either side.  Do you [link left door]go left, [link right door]go right, or [link down hall]go forward?".

	Instead of displaying page left door, say "There is a sword resting on the ground here; a rope ladder leads to the ceiling, and there's another door at the far end of the room.  Do you [link take sword]take the sword, [link climb ladder]climb the ladder, or [link right door]go through the door?".

	Instead of preparing page down hall: decrease player score of current state by 1.
	Instead of displaying page down hall: say "Ten feet down the hall, a trapdoor opens below you.  After hitting the ground, you look around to see a sword by your feet, a rope ladder leading upwards, and a door at the far end of the room.  Do you [link take sword]take the sword, [link climb ladder]climb the ladder, or [link right door]go through the door?".

	Instead of preparing page take sword: increase player score of current state by 1; now current state is has sword.
	Instead of displaying page take sword: say "Taken.  Now do you [link climb ladder]climb up the ladder or [link right door]go out the door?".

	Instead of displaying page climb ladder: 
		say "[if current state is has sword]Oops.  The sword cuts the ladder as you climb it.  You die.[otherwise]You are in a small room.  There is a potion on the floor.  Do you [link take potion]take it or [link back down]climb back down?[end if]";

	Instead of preparing page take potion: increase player score of current state by 1; now current state is has potion.
	Instead of displaying page take potion: say "You take the potion.  With nothing left to do here, you climb back down the ladder.  Do you [link take sword 2]take the sword or [link right door]move on?".

	Instead of displaying page back down: say "You are back at the bottom.  Do you [link take sword 2]take the sword or [link right door]move on?".

	Instead of preparing page take sword 2: increase player score of current state by 1; now current state is has sword.
	Instead of displaying page take sword 2: say "Taken. You then move on. [continue to right door]";

	Instead of preparing page right door: increase player score of current state by 1.
	Instead of displaying page right door: say "The door locks behind you.  A fiery pit splits this room in two.  Two bridges cross it.  Do you [link left bridge]cross the left bridge"; if current state is has potion, say ", [link right bridge]cross the right bridge, or [link drink]drink the potion?"; otherwise say " or [link right bridge]cross the right bridge?".

	Instead of displaying page left bridge: say "It breaks and you die.".

	Instead of displaying page right bridge: say "It breaks and you die.".

	Instead of displaying page drink: say "As you drink, a third bridge appears between the two. Do you [link left bridge]cross the left bridge, [link right bridge]cross the right bridge, or [link across bridge]cross the middle bridge?".

	Instead of displaying page across bridge: say "You quickly run across.  On the other side, a man suddenly attacks you[if current state is has sword]. You quickly draw your sword and defeat him, then exit the complex.  *** YOU WIN ***[otherwise], and being unarmed, you are unable to fight back.[end if]".


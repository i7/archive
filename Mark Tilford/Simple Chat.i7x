Version 2 of Simple Chat by Mark Tilford begins here.

Use Default Allow Exiting Conversations translates as (- Constant AllowingExit 1; -).
Use Default Forbid Exiting Conversations translates as (- Constant AllowingExit 0; -).


Conversation exiting is a kind of value.  
The conversation exitings are player may exit upon zero, player may not exit.
Current exiting is a conversation exiting that varies.

To allow exiting on zero:  Now current exiting is player may exit upon zero.
To forbid exiting on zero:  Now current exiting is player may not exit.

To decide whether exiting on zero is allowed:
  if current exiting is player may exit upon zero, decide yes;
  decide no.

Chat node is a kind of value.
The chat nodes are no quip chosen.

Table of Current Choices
Result
a chat node
with 9 blank rows

The rowcount is a number which varies.

Finding responses to is an action applying to a chat node.  
Carry out finding responses to: do nothing.

Activatedness is a kind of value.  The activatednesses are quip on.
Activation relates various chat nodes to various activatednesses.
The verb to activate (it activates, they activate, it activated) implies the activation relation.

To activate (which - a chat node): now which activates quip on.
To deactivate (which - a chat node): now which does not activate quip on.
To decide whether (which - a chat node) is active:
  if which activates quip on, decide yes;
  decide no.

To link to (response - a chat node):
  if response is active begin;
    increase rowcount by 1;
    [if rowcount is less than or equal to the number of rows in table of current choices begin;]
    if rowcount <= the number of rows in table of current choices begin;
      change result in row rowcount of table of current choices to response;
    otherwise;
      decrease rowcount by 1;
    end if;
  end if.


To reset the links:
  repeat through the Table of Current Choices begin;
    blank out the whole row;
  end repeat;
  change rowcount to 0.

first chat node is a chat node that varies.  second chat node is a chat node that varies.  [I can't figure out how to make "giving link to it from" work using arguments, so I'm currently using globals. ]
Giving text for is an action applying to a chat node.  Carry out giving text for:  say "Error: no text for [chat node understood].".
Giving link to is an action applying to a chat node.  Carry out giving link to:  say "Error: no link text for [chat node understood].". [*** This line is incorrectly listed as the problem ***]
[Giving link to it from is an action applying to two chat nodes. ]
[Carry out giving link to it from: try giving link to second chat node understood.]
[Carry out giving link to (tail - a chat node) from (head - a chat node): try giving link to head.]
[Before giving link to (next - a chat node) from (prev - a chat node): change first chat node to next; change second chat node to prev.] [ *** This line is the real problem ***]
[Carry out giving link to it from:  try giving link to first chat node.]

Preparing is an action applying to a chat node.  Carry out preparing:  [say "preparing [chat node understood]"; activate the chat node understood.] [say "preparing [first chat node]";] activate first chat node.

Instead of giving text for no quip chosen: do nothing.

Include (-
[ ReadChoice low high i;
  for (::) {
    print ">> ";
    KeyboardPrimitive (buffer, parse);
    i = TryNumber (1);
    if (i >= low && i <= high) return i;
  }
];
-).


To run a conversation from (current node - a chat node):
  let previous node be no quip chosen;
  let next node be no quip chosen;
  while current node is not no quip chosen begin;
    if using the default forbid exiting conversations option begin;
      forbid exiting on zero;
    otherwise;
      allow exiting on zero;
    end if;
    try giving text for current node;    
    reset the links;
    try silently finding responses to current node;
    if rowcount is greater than 0 begin;
      repeat with current row running from 1 to rowcount begin;
        say "[current row]) [run paragraph on]";
        change next node to result in row current row of table of current choices;
        change first chat node to next node; [*** FIX: globals ***]
        change second chat node to current node; [*** FIX: globals ***]
        [try giving link to next node from current node;]
        try giving link to next node;
      end repeat;
      let choice made be 0;
      if exiting on zero is allowed begin;
        say "(or 0 to say nothing)";
        change choice made to the choice made from 0 to rowcount;
      otherwise;
        change choice made to the choice made from 1 to rowcount;
      end if;
      if choice made is 0 begin;
        change next node to no quip chosen;
      otherwise;
        change next node to result in row choice made of table of current choices;
      end if;
      [change first chat node to next node; [*** FIX: globals ***]
      change second chat node to current node; [*** FIX: globals ***]      
      if next node is not no quip chosen,
        try giving link to next node from current node;]
      change previous node to current node;
      change current node to next node;
    otherwise;
      change current node to no quip chosen;
    end if;
  end while;
  [say "You walk away.".]

To decide what number is the choice made from (low value - a number) to (high value - a number): (- ReadChoice ( {low value}, {high value} ) -).

When play begins:
  let current node be the chat node after no quip chosen;
  while current node is not no quip chosen begin;
    [say "prepreparing [current node]";]
    [activate current node;]
    change first chat node to current node; [*** FIX: globals ***]
    try preparing current node;
    change current node to the chat node after current node;
  end while.

[(If you want that text to vary depending on the previous chat node, you may instead use "Instead of giving link to ___ from ___:".)] [[Not supported by I7 at present]]

Simple Chat ends here.

---- DOCUMENTATION ----

This is an extension to handle simple menu-based conversations.  

For each thing the player can say, define a chat node value.  To keep things organized, consider starting the name of each node with the name of the character the player is talking with, or something else related to the overall conversation.

For all chat nodes, you must put in an "Instead of giving text for ___: ..." override.  This function is to display the text for when the player is at that chat node.

For all chat nodes which are linked from some other chat node (which will generally be all those which are not ones which start conversations), you must put in an "Instead of giving link to ___: ..." override.  This function is to display the text which will be listed in the menu.  If you want the text to vary depending on the previous chat node, you may instead use "Instead of giving link to ___ when second chat node is ___:"  Only chat nodes which are currently activated will be listed; all chat nodes are activated by default.

For all chat nodes which are to display a menu, you must put in a "Instead of finding responses to ___:" override.  For each chat node the player can go to from here, put in "link to ___;".

If the list of options is to vary, this can be done by either putting conditionals in the "find responses to" action, or by activating / deactivating chat nodes.

For example, to make a chat option which only appears when the player has been to a certain room:
1)  Put code like "if ____ is visited, link to ____;" into the "find responses to" action.
2)  Initially deactivate the option with "instead of preparing ____: do nothing."  Activate it at the appropriate point with "After going to ___: activate ____; continue the action."

Finally, to show the menu, put in "run a conversation from ___".

There can be at most ten links printed from any chat node.  Any more will be silently dropped.

By default, the player can get out of any menu by choosing 0.  To change this for all menus, put "Use Default Forbid Exiting Conversations;" at the beginning of the file.  To change this for some menus, put "allow exiting on zero;" or "forbid exiting on zero;" in the appropriate "give text for ..." or "find responses to ..." block.



Example: * Chat Test - A conversation with Larry

	"Chat Test" by Mark Tilford

	Include Simple Chat by Mark Tilford.

	Talking to is an action applying to one visible thing.  Understand "talk to [someone]" as talking to.  Report talking to:  say "You have nothing to say.".

	Living Room is a room.  East of the living room is the Family Room.  Kitchen is west of the living room.

	hello larry, hows tricks, good bye are chat nodes.

	Instead of giving text for hello larry: instead say "Larry looks up as you approach him.".
	Instead of finding responses to hello larry: link to hows tricks; link to good bye; forbid exiting on zero.

	Instead of giving link to hows tricks: say "'How's tricks?' ".
	Instead of giving text for hows tricks: deactivate hows tricks; say "'Just fine.'".
	Instead of finding responses to hows tricks: link to good bye; forbid exiting on zero.


	Instead of giving link to good bye: say "'Good bye.' ".
	[Instead of giving link to good bye from hows tricks: say "'Well then, good bye.'".]  [[Syntax not supported by I7.]]
	Instead of giving link to good bye when second chat node is hows tricks: say "'Well then, good bye.' ".
	Instead of giving text for good bye: say "'You too.'".

[[Syntax not supported by I7.]]
[Definition:  a chat node is larryish:
  if it is hello larry, decide yes;
  if it is hows tricks, decide yes;
  if it is good bye, decide yes;
  decide no.]

	Larry is a man.  Larry is in the living room.

	Instead of talking to larry: run a conversation from hello larry.


[ There are two ways to an option only after certain conditions:
  1)  Start it out initially disabled (replace the "preparing" action)
       Only activate it at the appropriate time.  (Illustrated with "sandra family".)

  2)  Only link to it if the appropriate condition is met.  (Illustrated with "sandra kitchen".)
]

	sandra hello, sandra name, sandra job, sandra bye, sandra family, sandra kitchen are chat nodes.

	Instead of giving text for sandra hello: say "The woman looks up as you approach."
	Instead of finding responses to sandra hello: link to sandra name; link to sandra job; if kitchen is visited, link to sandra kitchen; link to sandra family; link to sandra bye; forbid exiting on zero.

	Instead of giving link to sandra name: say "'Who are you? '".
	Instead of giving text for sandra name: deactivate sandra name; activate sandra job; say "'I'm Sandra.'".
	Instead of finding responses to sandra name: try finding responses to sandra hello.

	Instead of giving link to sandra job: say "'What do you do here?' ".
	Instead of giving text for sandra job: deactivate sandra job; say "'I'm the official greeter.'".
	Instead of finding responses to sandra job: try finding responses to sandra hello.
	Instead of preparing sandra job: do nothing.

	Instead of giving link to sandra kitchen: say "'What do you think of the kitchen?' ".
	Instead of giving text for sandra kitchen: say "'It's an ordinary kitchen.'".
	Instead of finding responses to sandra kitchen: try finding responses to sandra hello.

	Instead of giving link to sandra family: say "'What do you think of the family room?' ".
	Instead of giving text for sandra family: say "'It's an ordinary family room.'".
	Instead of finding responses to sandra family: try finding responses to sandra hello.
	Instead of preparing sandra family: do nothing.
	After going to the family room: activate sandra family; continue the action.

	Instead of giving link to sandra bye: say "(Walk away) ".
	Instead of giving text for sandra bye: say "You nod and move the other direction.".

	Sandra is a woman.  Sandra is in the living room.
	Instead of talking to sandra: run a conversation from sandra hello.



	John is a man.  John is in the living room.
	john hello, john weather, john sports, john politics are chat nodes.

	Instead of talking to john: run a conversation from john hello.

	Instead of giving text for john hello: say "'Hi, I'm John.  What shall we talk about?'". Instead of finding responses to john hello: link to john weather; link to john sports; link to john politics.

	Instead of giving link to john weather: say "The weather". Instead of giving text for john weather: say "'Nice day,' says John, 'but a little cloudy.'".

	Instead of giving link to john sports: say "Sports". Instead of giving text for john sports: say "John yammers on about football.".

	Instead of giving link to john politics: say "Politics". Instead of giving text for john politics: say "John gabs about the mayor briefly.".


	The macguffin is in the living room.  
	The Baron CD is held by Victor.  "It's a copy of The Baron (Special Edition)."
	The Fate CD is held by Victor.  "It's a copy of Fate (Special Edition)."

	Victor is a man.  Victor is in the living room.
	victor hello, victor given macguffin, victor reward, victor give baron, victor give fate, victor welcome are chat nodes.
	
	Instead of talking to victor: run a conversation from victor hello.
	
	Instead of giving text for victor hello:
	  if the macguffin is held by Victor begin; 
	    say "Thank you for the Macguffin.";
	  otherwise;
	    say "'I'm really looking for a Macguffin.  Any one will do.'";
	  end if.
	Instead of finding responses to victor hello: if the macguffin is held by the player, link to victor given macguffin.
	
	Instead of giving link to victor given macguffin: say "'Take this one.'  (Give macguffin)".
        Instead of giving text for victor given macguffin: now the macguffin is held by victor;  say "'That's perfect.  You can have a special edition of either of my games.'".
        Instead of finding responses to victor given macguffin:  forbid exiting on zero; link to victor give baron; link to victor give fate.
        
	Instead of giving link to victor give baron:  say "'I'd like 'The Baron'.' ".
	Instead of giving text for victor give baron:  say "He hands you the CD.  'And thank you.'"; now the baron cd is held by the player.
	Instead of finding responses to victor give baron:  forbid exiting on zero; link to victor welcome.
	
	Instead of giving link to victor give fate:  say "'I'd like 'Fate'.' ".
	Instead of giving text for victor give fate:  say "'Here you go, and thanks.'"; now the fate cd is held by the player.
	Instead of finding responses to victor give fate:  forbid exiting on zero; link to victor welcome.
	
	Instead of giving link to victor welcome:  say "'You're welcome.' ".
	Instead of giving text for victor welcome:  say "Victor nods as you walk away.".
	
	instead of giving the macguffin to victor:  say "You approach him."; try talking to victor.




	test me with "talk to larry".
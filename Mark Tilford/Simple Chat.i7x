Version 4 of Simple Chat by Mark Tilford begins here.

[Please note that this extension is currently maintained by Victor Gijsbers. Bug reports and feature requests should be sent to victor@lilith.cc.]

Section - Conversation exiting

Conversation exiting is a kind of value. The conversation exitings are player may exit upon zero, player may not exit.

Current exiting is a conversation exiting that varies. Current exiting is player may exit upon zero.

To allow exiting on zero: now current exiting is player may exit upon zero.
To forbid exiting on zero: now current exiting is player may not exit.

To decide whether exiting on zero is allowed:
	if current exiting is player may exit upon zero, decide yes;
	decide no.

Section - Chat nodes

Chat node is a kind of value.

The chat nodes are no quip chosen.

Section - Chat node activation


Activatedness is a kind of value.  The activatednesses are sc-active, sc-inactive, sc-once and sc-shown-once.	

A chat node has an activatedness. The activatedness of a chat node is usually sc-active.

To activate (chosen node - a chat node): now chosen node is sc-active.
To deactivate (chosen node - a chat node): now chosen node is sc-inactive.


Section - Setting up the Table of Current Choices

Table of Current Choices
Result
a chat node
with 20 blank rows

The rowcount is a number which varies.

To link to (response - a chat node):
	unless response is sc-inactive:
		increase rowcount by 1;
		if rowcount <= the number of rows in table of current choices:
			now result in row rowcount of table of current choices is response;
		otherwise:
			decrease rowcount by 1.

To reset the links:
	blank out the whole of the Table of Current Choices;
	now rowcount is 0.

Section - Finding responses to

Finding responses to is an action applying to a chat node.  
Carry out finding responses to: do nothing.

Section - Giving text for

First chat node is a chat node that varies.  
Second chat node is a chat node that varies.

Giving text for is an action applying to a chat node.

First report giving text for: [Nodes with sc-once set are deactivated when they are chosen.]
	if the chat node understood is sc-once:
		now  chat node understood is sc-inactive.

Report giving text for:  say "Error: no text for [chat node understood].".
Report giving text for no quip chosen: do nothing instead.

Section - Giving link to

Giving link to is an action applying to a chat node.

First report giving link to: [Nodes with sc-shown-once set are deactivated when they are displayed in the menu.]
	if the chat node understood is sc-shown-once:
		now  chat node understood is sc-inactive.
		
Report giving link to:  say "Error: no link text for [chat node understood]. ".

Section - Preparing

Preparing is an action applying to a chat node.

Carry out preparing:
	activate the chat node understood.

Section - Readchoice I6 routine

Include (-
[ ReadChoice low high i;
  for (::) {
    print ">> ";
    KeyboardPrimitive (buffer, parse);
    i = TryNumber (1);
    if (i >= low && i <= high) return i;
    else print "[Please answer by typing a number between ", low, " and ", high, ".]^";
  }
];
-).

To decide what number is the choice made from (low value - a number) to (high value - a number): (- ReadChoice ( {low value}, {high value} ) -).

Section - Running a conversation from

To run a conversation from (current node - a chat node):
	let previous node be no quip chosen;
	let next node be no quip chosen;
	while current node is not no quip chosen:
		try giving text for current node;    
		reset the links;
		try silently finding responses to current node;
		if rowcount is greater than 0:
			repeat with current row running from 1 to rowcount:
				say "[current row]) [run paragraph on]";
				now next node is result in row current row of table of current choices;
				now first chat node is next node;
				now second chat node is current node;
				try giving link to next node;
			let choice made be 0;
			if exiting on zero is allowed:
				say "[italic type]([simple chat zero option])[roman type][line break]";
				now choice made is the choice made from 0 to rowcount;
			otherwise:
				now choice made is the choice made from 1 to rowcount;
			if choice made is 0:
				now next node is no quip chosen;
				say "[line break][run paragraph on]";
			otherwise:
				now next node is result in row choice made of table of current choices;
			now previous node is current node;
			now current node is next node;
		otherwise:
			now current node is no quip chosen.

To say simple chat zero option:
	say "or 0 to say nothing[run paragraph on]".
	
Section - German (for use with German by Team GerX)
	
To say simple chat zero option:
	say "oder 0 um nichts zu sagen[run paragraph on]".
	
Section - French (for use with French by Eric Forgeot)

To say simple chat zero option:
	say "ou 0 pour ne rien dire[run paragraph on]".




Simple Chat ends here.

---- DOCUMENTATION ----

Section: Using Simple Chat

This is an extension to handle simple menu-based conversations, or anything else for which you want to use an in-text menu. Simple Chat differs from Emily Short's Menus in that the latter replaces the normal game window by a menu navigated with the arrow keys, whereas Simple Chat prints a list of numbered options in the game text itself. In addition, Simple Chat makes it easy to set up the kind of connections that one needs for a menu-based conversation.

The basic kind of value introduced by the extension is the chat node. For each thing the player can say, the author defines a chat node value: "Harry-on-aliens is a chat node". To keep things organized, consider starting the name of each node with the name of the character the player is talking with, or something else related to the overall conversation.

For all chat nodes, you must put in an "Instead of giving text for ___: ..." override.  This function is to display the text for when the player is at that chat node.

For all chat nodes which are linked from some other chat node (which will generally be all those which are not ones which start conversations), you must put in an "Report giving link to ___: ... instead" override.  This function is to display the text which will be listed in the menu.  If you want the text to vary depending on the previous chat node, you may instead use "Report giving link to ___ when second chat node is ___:".

For all chat nodes which are to display a menu, you must put in a "Carry out finding responses to ___:" override.  For each chat node the player can go to from here, put in "link to ___".  If no chat nodes are linked to, then the conversation will stop. You can use conditionals in these phrases to change the contents of the menu based on the state of the game, e.g., "if player wears the weird hat, link to ___".

The "link to ___" phrase has no effect if the chat node is not active. Every chat node has an activatedness: either sc-active, sc-inactive, sc-once or sc-shown-once. These can be set at the beginning of the game with declarations like "____ is sc-once". If no declaration is made, a chat node starts as sc-active.

An sc-active chat node is shown when it is linked to, while an sc-inactive chat node is not shown. Chat nodes that are sc-once are shown normally, but will be set to sc-inactive once they are chosen, thus disappearing from the menu. Chat nodes that are sc-shown-once are also shown normally, but will be set to sc-inactive after being displayed in a menu, whether they are chosen or not: in effect, the player has only one chance to choose them. 

During play, chat nodes can be actived or deactived by "activate ___" and "deactivate ___". (These are easier-to-read equivalents of "now ___ is sc-active" and "now ___ is sc-inactive".)

Finally, to show the menu starting from a certain chat node, put in "run a conversation from ___". Simple Chat does not define a "talking to" action -- this is left to the author of the game.

There can be at most twenty links printed from any chat node.  Any more will be silently dropped.  This number can be increased by adding rows to the Table Of Current Choices.

By default, the player can get out of any menu by choosing 0.  To change this for all menus, put "When play begins: allow exiting on zero." at the beginning of the file.  To change this for some menus, put "allow exiting on zero;" or "forbid exiting on zero;" in the appropriate "give text for ..." or "find responses to ..." block.

The only text a user should ever see which is printed by Simple Chat is "or 0 to say nothing". In games using the German or French translation extension, this is replaced by "oder 0 um nichts zu sagen" and "ou 0 pour ne rien dire" respectively. Other non-English games should add a translation by adding something like the following line:

	To say simple chat zero option:
		say "or 0 to say nothing[run paragraph on]".
				
Section: Contact

The current maintainer of Simple Chat is Victor Gijsbers. You can reach him at victor@lilith.cc.

Section: Change log

Version 4: First version released by Victor Gijsbers.
- Code cleanup.
- Use options were removed. (They led to a confusing double functionality.)
- Implemented activatedness as a property of chat nodes, rather than as a relation between chat nodes and property values. Added sc-inactive, sc-once and sc-shown-once for easier control of when chat nodes are shown.
- Added a 'parser message' to the routine which asks for a number: some players did not see that the command prompt had changed, or did not understand what it meant.
- Rewritten the documentation.
- Reworked and replaced the example games.
- Increased the maximum number of nodes in a single menu from 9 to 20.
- A number of changes to the internal workings of the extension.
- Easier internationalisation.
Version 4 is not necessarily compatible with code written for previous versions!

Version 3: Tentative version by Mark Tilford to make Inform 7 compatible with release 6E72 of Inform 7. Not released on the Inform 7 website. Version 3 is not necessarily compatible with code written for previous versions!

Example: * Simplest Chat - Have a simple conversation with Larry. Shows how to use the basic functionality of Simple Chat.

	*: "Simplest Chat" by Mark Tilford
	
	Include Simple Chat by Mark Tilford.

	Talking to is an action applying to one visible thing.

	Understand "talk to [someone]" as talking to.
	Report talking to: say "You have nothing to say.".

	Living Room is a room. Larry is a man in Living Room.

	Hello larry, hows tricks, good bye are chat nodes.

	Report giving text for hello larry: instead say "Larry looks up as you approach him.".
	Carry out finding responses to hello larry: link to hows tricks; link to good bye.

	Report giving link to hows tricks: say "'How's tricks?' " instead.
	Report giving text for hows tricks: deactivate hows tricks; say "'Just fine.'" instead.
	Carry out finding responses to hows tricks: link to good bye.

	Report giving link to good bye: instead say "'Good bye.' ".
	Report giving link to good bye when second chat node is hows tricks: instead say "'Well then, good bye.' ".
	Report giving text for good bye: instead say "'You too.'".

	Instead of talking to larry: run a conversation from hello larry.

	Test me with "talk to larry / 1 / 1 / talk to larry / 1 / talk to larry / 0".
        
Example: ** Less Simple Chat - Shows off a few of the more advanced features of Simple Chat: nodes that get activated during play; nodes that can be chosen only once, or appear in the menu only once; mixing other actions with simple chat conversations.

	*: "Less Simple Chat" by Victor Gijsbers
	
	Include Simple Chat by Mark Tilford.

	Talking to is an action applying to one visible thing.

	Understand "talk to [someone]" as talking to.
	Report talking to: say "You have nothing to say.".

	When play begins:
		forbid exiting on zero.

	Living room is a room. Harry is a man in Living Room.

	Finnegans Wake is a thing. Harry carries Finnegans Wake.

	Chat-hello-Harry, chat-book, chat-I-want-it, chat-I-do-not-want-it, chat-fire, chat-goodbye and chat-again are chat nodes. 

	Chat-book is sc-once. [We can choose this option only once.] Chat-fire is sc-shown-once. [We must choose it immediately or we can never choose it again.] Chat-again is sc-inactive. [This is only shown once it has been activated.] 

	Instead of talking to Harry: run a conversation from chat-hello-harry.

	Report giving text for chat-hello-harry: instead say "Harry looks up as you approach him.".
	Carry out finding responses to chat-hello-harry: link to chat-book; link to chat-fire; link to chat-again; link to chat-goodbye.

	Report giving link to chat-book: instead say "'What was that book you told me about?' ".
	Report giving text for chat-book: instead say "'It's by some guy called Finnegan Wake, and I think it's in Irish or something. Do you want it?'".
	Carry out finding responses to chat-book: link to chat-I-want-it; link to chat-I-do-not-want-it.

	Report giving link to chat-I-want-it: instead say "'Sure.' ".
	Report giving text for chat-I-want-it: move Finnegans Wake to player; instead say "Harry hands the book to you.".
	Carry out finding responses to chat-I-want-it: try finding responses to chat-hello-harry instead.

	Report giving link to chat-I-do-not-want-it: instead say "'No, thanks.' ".
	Report giving text for chat-I-do-not-want-it: instead say "Harry sighs. 'I'm never going to get rid of it.'".
	Carry out finding responses to chat-I-do-not-want-it: try finding responses to chat-hello-harry instead.

	Report giving link to chat-fire: instead say "'Run! Fire!' ".
	Report giving text for chat-fire: instead say "'We are only pixels on a two-dimensional screen. There is nowhere to run to.' Harry's words shatter the fourth wall.".
	Carry out finding responses to chat-fire: try finding responses to chat-hello-harry instead

	Report giving link to chat-again: instead say "'Didn't we have this conversation before?' ".
	Report giving text for chat-again: instead say "'The world is one big circle, and we are doomed to repeat ourselves.'".
	Carry out finding responses to chat-again: try finding responses to chat-hello-harry instead.

	Report giving link to chat-goodbye: instead say "'See you later, Harry.' ".
	Report giving text for chat-goodbye: activate chat-again; instead say "'Later!'".

	Test me with "talk to harry / 1 / 1 / 1 / i / talk to harry / 1 / 4 / 2".
	
	

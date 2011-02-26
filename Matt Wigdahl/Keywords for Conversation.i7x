Version 2 of Keywords for Conversation by Matt Wigdahl begins here.

"Bridges Eric Eve's Conversation Package and Aaron Reed's Keyword Interface, providing an interface to support single-keyword conversations."

Include Complex Listing by Emily Short.
Include Conversation Package by Eric Eve.
Include Keyword Interface by Aaron Reed.

Chapter 1 - Definitions

A person has a list of objects called unsuggested-topics.
A convnode has a list of objects called unsuggested-topics.

Definition: a thing is ask-topical:
	if the current interlocutor is not nothing:
		if it is listed in the ask-suggestions of the current interlocutor:
			decide yes;
	if the current node is not null-node:
		if it is listed in the ask-suggestions of the current node:
			decide yes;
	decide no;

Definition: a thing is tell-topical:
	if the current interlocutor is not nothing:
		if it is listed in the tell-suggestions of the current interlocutor:
			decide yes;
	if the current node is not null-node:
		if it is listed in the tell-suggestions of the current node:
			decide yes;
	decide no;

Definition: a thing is other-topical:
	if the current interlocutor is not nothing:
		if it is listed in the other-suggestions of the current interlocutor:
			decide yes;
	if the current node is not null-node:
		if it is listed in the other-suggestions of the current node:
			decide yes;
	decide no;

Definition: a thing is unsuggested-topical:
	if the current interlocutor is not nothing:
		if it is listed in the unsuggested-topics of the current interlocutor:
			decide yes;
	if the current node is not null-node:
		if it is listed in the unsuggested-topics of the current node:
			decide yes;
	decide no;

Definition: a thing is topical if it is ask-topical or it is tell-topical or it is other-topical or it is unsuggested-topical.
Definition: a thing is non-topical if it is not topical.

Chapter 2 - Rules

Understand "[any ask-topical thing]" as implicit-quizzing.
Understand "[any tell-topical thing]" as implicit-informing.
Understand "[any other-topical thing]" as implicit-quizzing.
Understand "[any unsuggested-topical thing]" as implicit-quizzing.
Understand "[any thing]" as implicit-quizzing when (the current interlocutor is not nothing or the current node is not null-node). [this is to make all keywords typed when in active conversation attempt to resolve as conversation]

Section 2 Topic Keyword Overrides (in place of Section - Examine Grammar Line in Keyword Interface by Aaron Reed)
 
Understand "[a non-topical thing]" as examining.

Chapter 3 - Rule For Printing

Rule for printing the name of something (called item) when listing suggested topics (this is the KICP print names while listing topics rule):
	let output be indexed text;
	now output is the printed name of item;
	let kw be indexed text;
	now kw is the keyword of item;
	if kw is "":
		now kw is word number (the number of words in output) in output;
	repeat with wordcounter running from 1 to the number of words in output:
		say "[if wordcounter > 1] [end if]";
		if word number wordcounter in output matches the regular expression "\b(?i)[kw]":
			say "[t][word number wordcounter in output][x]";
		else:
			say "[word number wordcounter in output]".

Chapter 4 - When Play Begins

First when play begins:
	now topic keyword highlighting is true;

Keywords for Conversation ends here.

---- Documentation ----

Keywords for Conversation is intended to extend Aaron Reed's Keyword Interface to conversations that use Eric Eve's Conversation Package.  Keyword Interface provides mechanisms for highlighting topic keywords, but doesn't go farther than that.  This extension provides the necessary bridgework to make the topic highlighting (and single-keyword conversations) work seamlessly with Eric's extension family.

Conversation Suggestions provides a feature that allows display of available topics.  This extension applies the Keyword Interface keyword highlighting rules to the displayed topic list.  

This extension also provides understand rules so that you can simply type the name of a topic and have the conversation system choose the proper conversational action and apply it accordingly.

In order to display the topic keywords, we must first include Emily Short's Complex Listing extension.  When this is included, Eric Eve's Conversation Suggestions uses an alternative topic listing mechanism which is compatible with topic keywording.  As this alternative mechanism is required for my extension to work properly, including this extension will also include Complex Listing.  Of course, Aaron Reed's Keyword Interface and Eric Eve's Conversation Package are required as well.

To enable the proper conversational action from a single keyword, certain assumptions are made.  Any topic found in the ask-suggestions, other-suggestions, or unsuggested-topics list is assumed to require "quizzing" as the appropriate action.  Any topic found in tell-suggestions is assumed to require "informing".

In order to more fully understand how to use this extension, you'll likely need to be familiar with the documentation for:

	Conversation Package by Eric Eve (an omnibus extension that pulls in several other extensions.  Conversation Suggestions is particularly relevant)

and

	Keyword Interface by Aaron Reed

Example: * Small Talk - Demonstrate topic keyword highlighting and single-keyword conversation.

	*: "Small Talk"

	Include Keywords for Conversation by Matt Wigdahl.

	The Cubicle is a room.  "This is a typical corporate wage slave's cubicle.  Beige and grey decor, fluorescent lighting, and the ceaseless drone of idling computer fans inspire creatively suicidal ideation."

	The software linguist is a man in the Cubicle.  The description of the software linguist is "Perched on his swivel chair, the programmer eyes you with mild interest and severe myopia."

	Understand "man/programmer/coder" as the software linguist.

	Smalltalk is a familiar thing.
	Cobol is a familiar thing.  The printed name of Cobol is "the ancient, arcane mysteries of Cobol".
	Inform_7 is a familiar thing.  The printed name of Inform_7 is "the natural-language excellence that is Inform 7".  The keyword of Inform_7 is "Inform".
	Your awesome hack is a familiar thing.
	The crazy bug is a familiar thing.
	Applesoft BASIC is a familiar thing.

	Understand "Inform 7" as Inform_7.  Understand "Inform" as Inform_7.

	The ask-suggestions of the software linguist are { Smalltalk, Cobol, Inform_7 }.
	The tell-suggestions of the software linguist are { awesome hack, crazy bug }.
	The unsuggested-topics of the software linguist are { Applesoft BASIC }.

	Greeting response for the software linguist:
		say "You address the coder.  'Hi!'[paragraph break]'Hello yourself!  What do you want to talk about?'";

	Implicit greeting response for the software linguist:
		say "He swivels to look directly at you as you speak.";

	Farewell response for the software linguist:
		say "'Bye!'[paragraph break]'Come back any time you want to talk about obscure programming languages!'";

	Implicit farewell response for the software linguist:
		say "He turns back to the glow of his monitor as the conversation lapses.";

	Default response for the software linguist:
		say "The programmer glances at you as you speak, but he doesn't seem interested and quickly looks away as his attention wanders.";
		show topic suggestions implicitly;

	Response of the software linguist when asked about Cobol:
		say "His mouth twists in a grimace.  'Yeah, I've used Cobol.  When I lost a drinking game.'";

	Response of the software linguist when asked about Smalltalk:
		say "He smiles.  'That language was way ahead of its time, man.'";

	Response of the software linguist when asked about Inform_7:
		say "He perks up.  'No way!  You know about Inform 7?  It's awesome, isn't it?'";

	Response of the software linguist when asked about Applesoft BASIC:
		say "The programmer starts in surprise.  'Funny you should mention that.  You know, I'm working on writing an Apple II emulator from scratch.'  He shrugs.  'It passes the time.'";

	Response of the software linguist when told about the awesome hack:
		say "He listens, nodding his head.  'Sounds cool!  But you know you could have just used the Masterson algorithm there.  Read your Knuth, dude...'";

	Response of the software linguist when told about the crazy bug:
		say "He seems interested as you describe your debugging session.  'Sounds like a tough one!'";

	test me with "ask linguist about cobol/cobol/topics/hack/BASIC/Inform 7".

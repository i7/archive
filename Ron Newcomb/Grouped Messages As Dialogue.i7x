Grouped Messages As Dialogue by Ron Newcomb begins here.

"Allows the full complement of standard error and reporting messages to be changed wholesale to another set, instantly.  Now these messages can be dressed-up as dialogue with whichever NPC is present."

Include Complex Listing by Emily Short. 
Include Pronouns by Ron Newcomb.

Section 1 - Errors As Dialogue

[ ACTIVITIES MUST COME FIRST in rulebooks!]

Use grouped messages as dialogue debugging translates as (- Constant DEBUG_GROUPED_MSGS_AS_DIALOGUE; -). 

The default errors are a rulebook. 
The default errors have default success. 
First default errors rule: if using grouped messages as dialogue debugging option, say "// Parser error holds a [parser-error in words]"; continue the action.
Last default errors rule (this is the Setup For I6 Call rule): if using grouped messages as dialogue debugging option, say "// Consulting Inform6 for messages for [message of game error]"; rule fails.

A person has a rulebook called observations. The observations of a person is usually the default errors rulebook. The observer is a person that varies.

The observer finder rules are a rulebook.  
A rule for observer finder (this is the Consult Character's Errorbook rule): 
	if observer is nothing begin;
		if using grouped messages as dialogue debugging option, say "// 'Observer Finder' can't consult 'observer' for [message of game error]: 'observer' is Nothing";
		continue the action;
	end if;
	if using grouped messages as dialogue debugging option, say "// 'Observer Finder' consults [observer]'s '[observations of the observer]' for [message of game error]"; 
	abide by the observations of the observer.
Last observer finder rule (this is the Consult Default Errorbook rule):
	if using grouped messages as dialogue debugging option, say "// 'Observer Finder' consults the default errors rulebook for [message of game error]"; 
	abide by the default errors rulebook.

The current errorbook is a rulebook that varies.  The current errorbook is usually the observer finder rulebook.

To say consult the/a/an/-- (code - a rule): abide by the code. 


Before clarifying the parser's choice: 
	if using grouped messages as dialogue debugging option, say "// Clarifying the parser's choice"; 
	now cull inform default messages is 1;
	consider the current errorbook;
	if the rule failed, now cull inform default messages is 0.

Rule for clarifying the parser's choice when cull inform default messages is 1: 	if using grouped messages as dialogue debugging option, say "// 'Errors As Dialogue' skipping normal Clarifying the Parser's Choice processing"; do nothing.

After clarifying the parser's choice:  now cull inform default messages is 0.



To decide which number is the parser-error: (- etype -).
To decide whether the/-- parser error is did not make sense in this context: (- (etype == ASKSCOPE_PE) -).  [ missing parser error ]

[

deprecated code, but I won't delete in case I need it again. 

Before printing a parser error:
	if parser-error is   1, set the game error to LibMsg <command not understood>;  	[when the parser error is didn't understand: ] 		["I didn't understand that sentence."]
	if parser-error is   2, set the game error to LibMsg <command partly understood>;	[when the parser error is only understood as far as:]	["I only understood you as far as wanting to "]
	if parser-error is   3, set the game error to LibMsg <number not understood>;		[when the parser error is didn't understand that number]	["I didn't understand that number."]
	if parser-error is   4, set the game error to LibMsg <unknown object>;				[when the parser error is can't see any such thing]		["You can't see any such thing."]
	if parser-error is   5, set the game error to LibMsg <command incomplete>;			[when the parser error is said too little]				["You seem to have said too little!"]
	if parser-error is   6, set the game error to LibMsg <object not held>;				[when the parser error is aren't holding that: ]		["You aren't holding that!"]
	if parser-error is   7, set the game error to LibMsg <verb cannot have multiple objects>;	[when the parser error is can't use multiple objects:]	["You can't use multiple objects with that verb."]
	if parser-error is   8, set the game error to LibMsg <too many multiple objects>;		[when the parser error is can only use multiple objects]	["You can only use multiple objects once on a line."]
	if parser-error is   9, set the game error to LibMsg <pronoun not set>;				[when the parser error is not sure what it refers to:]		[I'm not sure what {the pronoun} refers to.]
	if parser-error is 10, set the game error to LibMsg <excepted object not included anyway>;	[when the parser error is excepted something not included:]	[You excepted something not included anyway!]
	if parser-error is 11, set the game error to LibMsg <verb cannot have inanimate object>;		[when the parser error is can only do that to something animate:]	[You can only do that to something animate.]
	if parser-error is 12, set the game error to LibMsg <unknown verb>;				[when the parser error is not a verb i recognise:]		[That's not a verb I recognize.]  [NOTE the code is always S, but may print a Z for American dialect ]
	if parser-error is 13, set the game error to LibMsg <unimportant object>;		[when the parser error is not something you need to refer to:]	[That's not something you need to refer to in the course of this game.]
	if parser-error is 14, set the game error to LibMsg <pronoun absent>;			[when the parser error is can't see it at the moment: ]		["You can't see {the pronoun} ([the main object]) at the moment."]
	; [ sometimes <pronoun absent> will change itself to <pronoun not set> instead ]
	if parser-error is 15, set the game error to LibMsg <command badly ended>;	[when the parser error is didn't understand the way that finished:]	[I didn't understand the way that finished.]
	if parser-error is 16, set the game error to LibMsg <not that many available>; 	[when the parser error is not enough of those available:]		["None/Only [the number understood] of those is/are available."]
[(address) pronoun_word,]
	if parser-error is 17, set the game error to LibMsg <no objects available>;		[when the parser error is not enough of those available: ]		["There are none at all available!"]
	; [ sometimes <no objects available> will change to <zero multiple objects> instead ]		[when the parser error is nothing to do:]	["Nothing to do!"]
	if parser-error is 18, set the game error to LibMsg <noun out of context>;	[when the parser error is did not make sense in this context:]  ["That noun did not make sense in this context"]
	if parser-error is 19, set the game error to LibMsg <empty line>;		[when the parser error is i beg your pardon:]		["I beg your pardon?"]
	if using grouped messages as dialogue debugging option, say "// 'Errors As Dialogue' attempting parser error processing for #[parser-error]: [message of game error]";
	now cull inform default messages is 1;
	consider the current errorbook;
	if the rule failed, now cull inform default messages is 0.
]

I6 error bug workaround is a truth state that varies. I6 error bug workaround is usually false.

[ There's a bug in I6 file parserm.inf line 2000 that prints some stuff right there instead of putting that little routine inside L__M routine where it can be overridden properly. ]
Before printing a parser error when parser error is only understood as far as:
	set the game error to LibMsg <command partly understood>;
	if using grouped messages as dialogue debugging option, say "// 'Errors As Dialogue' attempting parser error processing for [message of game error]";
	now cull inform default messages is 1;
	consider the current errorbook;
	if the rule failed, now cull inform default messages is 0;
	now I6 error bug workaround is true.

[ There's a bug in I7 that does not express this parser error. ]
Before printing a parser error when parser error is did not make sense in this context:
	set the game error to LibMsg <noun out of context>;
	if using grouped messages as dialogue debugging option, say "// 'Errors As Dialogue' attempting parser error processing for [message of game error]";
	now cull inform default messages is 1;
	consider the current errorbook;
	if the rule failed, now cull inform default messages is 0;
	now I6 error bug workaround is true.

[ These two lines are needed in order to finish the processing of the above two paragraphs ]
Rule for printing a parser error when cull inform default messages is 1 and I6 error bug workaround is true: 	if using grouped messages as dialogue debugging option, say "// 'Errors As Dialogue' skipping normal parser error processing for [message of game error]"; do nothing.

After printing a parser error: now cull inform default messages is 0; now I6 error bug workaround is false.


Section 2 - Which Do You Mean  as Dialogue - written by Emily Short

Definition: a thing is parselist-fitting if it fits the parse list.

Rule for asking which do you mean:
	if message of game error is LibMsg <no error>, set game error to LibMsg <which disambiguation>;
	if answering the NPC is changing phase begin;  [ setting up the parser for a third go]
		now answering the NPC is ready for answer;
		rule succeeds;
	end if;
	prepare a list of parselist-fitting things; 
	if using grouped messages as dialogue debugging option, say "// Asking which do you mean with [the number of filled rows in the table of scored listing in words] nouns"; 
[	if using grouped messages as dialogue debugging option, say "// Asking which do you mean, [the prepared list delimited in disjunctive style].";   [ CAN ONLY PRINT THIS LIST ONCE! ] ]
	abide by the current errorbook;
	[say "'Which one, man?  I've got [a prepared list delimited in sequential style].'"]

To decide whether (N - an object) fits the parse list: (- (FindInParseList({N})) -)

Include (-

[ FindInParseList obj i k marker;
	marker = 0;
	for (i=1 : i<=number_of_classes : i++) {
		while (((match_classes-->marker) ~= i) && ((match_classes-->marker) ~= -i)) marker++;
		k = match_list-->marker;
		if (k==obj) rtrue;
	}
	rfalse;
];

-).

Section 3 - Understand As Far As as Dialogue - written by Emily Short

To decide what number is the first misunderstood word: (- (wn - 1) -).

To say parser-understood words: (- PrintPatternCommand(); -).

Include (-
[ PrintPatternCommand m pcount pcount2;
	if (etype == UPTO_PE) {
		for (m=0 : m<32 : m++) pattern-->m = pattern2-->m;
		pcount = pcount2; 
		PrintCommand(0);
	}
];
-).

To say parser-confusing words:
	let N be indexed text;
	let N be the player's command;
	repeat with index running from first misunderstood word to the number of words in N begin;
		if index is greater than the first misunderstood word, say " ";
		say word number index in N;
	end repeat.

Section - free parser from question state (doesn't work well if at all)

Free parser from question state is a truth state that varies. Free parser from question state is false.

To end the parser's question:
		now free parser from question state is true;
		change the text of the player's command to "l";
		now cull inform default messages is 1;
		carry out the reading a command activity.

[ DOESN'T WORK WELL ]

Rule for reading a command when free parser from question state is true:  [ INSTEAD OF ACTUALLY READING A COMMAND, DO THIS: ]
	do nothing.

First after reading a command when free parser from question state is true:  
	now free parser from question state is false;
	reject the player's command.
	

Section 4 - How an NPC Causes A Parser Error, on Purpose

The verb word is some text that varies.

A thing can be relevant or irrelevant. A thing is usually irrelevant.

Understand the relevant property as describing a thing.

A respond phase is a kind of value.  The respond phases are normal, changing phase, ready for answer, and answered. Answering the NPC is a respond phase that varies.  Answering the NPC is usually normal.

[ this rule will skip asking the player to type in his next command, instead re-supplying his previous command in a way to specifically cause the Which Did You Mean activity ]
Rule for reading a command while answering the NPC is changing phase:  [ INSTEAD OF ACTUALLY READING A COMMAND, DO THIS: ]
	change the text of the player's command to "[run paragraph on][verb word] relevant ";

Before reading a command while answering the NPC is ready for answer: [ ]
	change answering the NPC to answered.

Before reading a command while answering the NPC is answered:
	change answering the NPC to normal.


Section 5 - The 'Asks' Phrases

To decide whether (character - a person) ask/asks (quotation - some text): 
	[if answering the NPC < ready for answer begin;]      [ CAN'T REMEMBER WHY I HAD THIS IF STATEMENT HERE.  BETTER NOT DELETE IT TIL I REMEMBER WHY ]
		if using grouped messages as dialogue debugging option, say "// [character] asks [quotation] expecting: [list of relevant things]."; 
		if the number of relevant things > 0 begin;
			say quotation;
			now answering the NPC is changing phase;
			decide yes;
		otherwise;
			reset yes and no;
			decide no;
		end if;
	[end if.]

To decide whether (character - a person) ask/asks (quotation - some text) expecting/including (d - a description):
	repeat with item running through d begin;
		now item is relevant;
	end repeat;
	if character asks quotation, decide yes;
	otherwise decide no.

To decide whether (character - a person) ask/asks (quotation - some text) excluding/except (d - a description): 
	repeat with item running through d begin;
		now item is irrelevant;
	end repeat;
	if character asks quotation, decide yes;
	otherwise decide no.

To decide whether (character - a person) ask/asks (quotation - some text) expecting/including (d - a description) excluding/except (d2 - a description):
	repeat with item running through d begin;
		now item is relevant;
	end repeat;
	if character asks quotation excluding d2, decide yes;
	otherwise decide no.

To (character - a person) ask/asks (quotation - some text): 
	if character asks quotation, do nothing.
	
To (character - a person) ask/asks (quotation - some text) expecting/including (answer - a description):
	if character asks quotation expecting answer, do nothing.

To (character - a person) ask/asks (quotation - some text) excluding/except (items - a description):
	if character asks quotation excluding items, do nothing.

To (character - a person) ask/asks (quotation - some text) expecting/including (answer - a description) excluding/except (items - a description):
	if character asks quotation expecting answer excluding items, do nothing.

To ask/asks (quotation - some text):
	The observer asks quotation.
To ask/asks (quotation - some text) expecting/including (answer - a description):
	The observer asks quotation expecting answer.
To ask/asks (quotation - some text) excluding/except (items - a description):
	The observer asks quotation excluding items.
To ask/asks (quotation - some text) expecting/including (answer - a description) excluding/except (items - a description): 
	The observer asks quotation expecting answer excluding items.

To decide whether ask/asks (quotation - some text): 
	if the observer asks quotation, decide yes; otherwise decide no.
To decide whether ask/asks (quotation - some text) expecting/including (answer - a description):
	if the observer asks quotation expecting answer, decide yes; otherwise decide no.
To decide whether ask/asks (quotation - some text) excluding/except (items - a description):
	if the observer asks quotation excluding items, decide yes; otherwise decide no.
To decide whether ask/asks (quotation - some text) expecting/including (answer - a description) excluding/except (items - a description):
	if the observer asks quotation expecting answer excluding items, decide yes; otherwise decide no.

Section 6 - Yes and No

This is the picking response to yes rule:
	if answering the NPC is ready for answer, now answering the NPC is changing phase;  [BACKS UP A STEP FOR THE CASE WHERE PLAYER ANSWERS YES TO WHICH DID MEAN; THIS MAY HAPPEN IF THE NPC PHRASES HIS/HER QUESTION IN CERTAIN WAYS]
	if spurious yes is true, now answering the NPC is changing phase;
	now spurious yes is false;   [ SPURIOUS ANSWERS ARE IGNORED, BUT WE "TURN BACK THE CLOCK" BY BACKING UP THE "ANSWERING THE NPC" VARIABLE ]
	abide by The yes-answer.
This is the picking response to no  rule: 
	if spurious no is true, now answering the NPC is changing phase;
	now spurious no is false;     [ SPURIOUS ANSWERS ARE IGNORED, BUT WE "TURN BACK THE CLOCK" BY BACKING UP THE "ANSWERING THE NPC" VARIABLE ] 
	abide by The no-answer.

The picking response to yes rule is listed instead of the block saying yes rule in the check saying yes rules.
The picking response to no  rule is listed instead of the block saying no  rule in the check saying no rules.

The no-answer is a rule that varies.  The no-answer is usually the block saying yes rule.
The yes-answer is a rule that varies.  The yes-answer is usually the block saying no rule.
Spurious yes is a truth state that varies.  Spurious yes is usually false.
Spurious no  is a truth state that varies.  Spurious no  is usually false.

To  Yes is (code - a rule):				now spurious yes is false;	now the yes-answer is the code.
To  No  is (code - a rule):				now spurious no  is false;	now the no-answer is the code.
To  Yes is (code - a rule) and ignored:	now spurious yes is true;	now the yes-answer is the code.
To  No  is (code - a rule) and ignored:	now spurious no  is true;	now the no-answer is the code.

To reset yes and no:
	Yes is the block saying yes rule;
	No  is the block saying no rule;


To say the/-- pronoun understood: 
	if the main object is nothing begin; say "that";
	otherwise if the main object is the pronoun him; say "him";
	otherwise if the main object is the pronoun her; say "her";
	otherwise if the main object is the pronoun it; say "it";
	otherwise if the main object is the pronoun them; say "them";
	otherwise; say "that";
	end if.

Section 7 - Scripts as a Series of Relevant Things


Section 8 - Excerpt from Default Messages - written by David Fisher


A library-message-value is a kind of value. 
The library-message-values are defined by the table of library messages.  

A library-message is a kind.  
A library-message has a library-message-value called the message.

A library-message can be out of world.
A library-message can be action acknowledgement.
[ not all actions that fail are futile.  Attempting to open a locked door would fail, but the attempt wasn't futile.  How are we to know a door's locked until we try it? ]
A library-message can be failing.  [ an action stopped, usually because of some sort of "cannot" rule ]
	A library-message can be futile.  [ searching in the dark, doing something already done, emptying something into itself, etc]
		A library-message can be re-attempting.  [ doing something already done is always a futile activity, but not all futile activies involve re-doing something ]
A library-message can be blocked.  [ blocked actions.  See the Actions index ]
A library-message can be darkness-involving.
A library-message can be parser-erroring. [ the built-in parser errors ]
A library-message can be parser-modal.  [ the parser is in a special mode: waiting for a Disambig. answer, a Yes/No answer, a menu selection, a SPACE to continue... ]
	A library-message can be answer-awaiting.  [ a disambig answer, yes/no, or menu selection]
A library-message can be physically-vigorous. [ Indiana-Jones kind of stuff. ]
A library-message can be bodily-senses.
A library-message can be civilized.  [ giving, showing, asking, saying, telling, kissing, hugging, and all conversation.  Sadly, a small list ]
	A library-message can be conversational.  [ including the answer-awaiting parser problems ]
A library-message can be involving-nothing.


The game error is a library-message.


[ Special handling for "go" without a direction ]

The block vaguely going rule is not listed in the for supplying a missing noun rules.

Rule for supplying a missing noun while going:
	change  message of the game error  to   LibMsg <block vaguely going>;
	abide by the current errorbook; say "".		[ if this isn't here, it says "You must supply a noun" ! ]

[ discovering things in newly opened containers ]

To say what's on the object:
		list the contents of the main object, prefacing with is/are, as a sentence,
			including contents, giving brief inventory information,
			tersely, not listing concealed items.

To say what's inside the object part 1:
		if main object is the location, say "You";
		otherwise say "On/In [the main object] you";
		say " can".

To say what's inside the object part 2:
		say "see ";
		list the contents of the main object, as a sentence, including contents,
			listing marked items only, giving brief inventory information,
			tersely, not listing concealed items;
		if the main object is the location, say " here";
		say "."

The main object is an object that varies.

section 9b - Setting the game error and Observe statements

To set (ge - a library-message) to (x - a library-message-value):
	now the message of ge is x;
	consider the categorizing errors rulebook.

To say observe (x - a library-message): if x is observed, do nothing.
To observe (x - a library-message): if x is observed, do nothing.
To say (character - a person) observes/observe (x - a library-message):  let o be the observer; change the observer to the character; if x is observed, do nothing; change the observer to o.
To (character - a person) observes/observe (x - a library-message):  let o be the observer; change the observer to the character; if x is observed, do nothing; change the observer to o.

To decide whether (id - a library-message) is observed:
	consider the print library message rule;
	if cull inform default messages is 0 begin;
		decide no;
	otherwise;
		change cull inform default messages to 0;
		decide yes;
	end if.

To say observe (x - a library-message-value): set game error to x; if x is observed, do nothing.
To observe (x - a library-message-value): set game error to x; if x is observed, do nothing.
To say (character - a person) observes/observe (x - a library-message-value):  set game error to x; let o be the observer; change the observer to the character; if x is observed, do nothing; change the observer to o.
To (character - a person) observes/observe (x - a library-message-value):  set game error to x; let o be the observer; change the observer to the character; if x is observed, do nothing; change the observer to o.

To decide whether (id - a library-message-value) is observed:
	set game error to id;
	if game error is observed, decide yes;
	otherwise decide no.


To say defer to/-- (character - a person): if cannot defer to character, do nothing.
To defer to/-- (character - a person): if cannot defer to character, do nothing.

To decide whether cannot defer to (character - a person):
	if character is in the location begin;
		let save cull value be cull inform default messages;
		[now the current interlocutor is the character;] 
		character observes game error;
		now cull inform default messages is save cull value;
		decide no;
	otherwise;
		decide yes;
	end if.

section 10 - Pre-empting all built-in actions' Report rules - written by David Fisher

First report someone trying closing: 
	if LibMsg <report npc closing> is observed, stop the action.
First report closing rule:
	if LibMsg <report player closing> is observed, stop the action.

First report someone taking: if LibMsg <report npc taking> is observed, stop the action.
First report taking: if LibMsg <report player taking> is observed, stop the action.

The first report someone trying consulting:
   if  LibMsg <block npc consulting> is observed, stop the action;
First report consulting it about rule:
   if  LibMsg <block player consulting> is observed, stop the action;

First report someone trying dropping:
   if  LibMsg <report npc dropping> is observed, stop the action;
First report dropping rule:
   if  LibMsg <report player dropping> is observed, stop the action;

First report someone trying eating:
   if  LibMsg <report npc eating> is observed, stop the action;
First report eating rule:
   if  LibMsg <report player eating> is observed, stop the action;

First report someone trying entering:
   if  LibMsg <report npc entering> is observed, stop the action;
First report entering rule:
   if  LibMsg <report player entering> is observed begin; 
   		abide by the describe contents entered into rule;
		stop the action;
	end if;
	
This is the custom report exiting rule:
   if the actor is the player begin;
	      if  LibMsg <report player exiting> is observed, stop the action;        [ no need to call the "describe room emerged into rule"  - comes next in the ruleboook ]
   otherwise;
	      if  LibMsg <report npc exiting> is observed, stop the action;  
   end if;

[ Inform 7 separates getting "out of" (a non-supporter) and
  getting "off" (a supporter); these are grouped together in
  this extension. ]

The custom report exiting rule is listed instead of the standard report exiting rule in the report exiting rules.

The custom report exiting rule is listed instead of the standard report getting off rule in the report getting off rules.

First report someone trying giving:
   if  LibMsg <report npc giving> is observed, stop the action.
First report giving it to rule:
   if  LibMsg <report player giving> is observed, stop the action.

First report someone trying inserting:
   if  LibMsg <report npc inserting> is observed, stop the action.
First report inserting it into rule:
   if  LibMsg <report player inserting> is observed, stop the action.

First report someone trying locking:
   if  LibMsg <report npc locking> is observed, stop the action.
First report locking it with rule:
   if  LibMsg <report player locking> is observed, stop the action.

First report someone trying opening:
   if  LibMsg <report npc opening> is observed, stop the action.
First report opening rule:
   if  LibMsg <report player opening> is observed, stop the action.

[ there are two "report opening" rules, and this one needs
  to happen before the one above ]
First report opening rule:
   abide by the reveal any newly visible interior rule.

First report someone trying pulling:
   if  LibMsg <report npc pulling> is observed, stop the action.
First report pulling rule:
   if  LibMsg <report player pulling> is observed, stop the action.

First report someone trying pushing:
   if  LibMsg <report npc pushing> is observed, stop the action.
First report pushing rule:
   if  LibMsg <report player pushing> is observed, stop the action.

First report someone trying putting:
   if  LibMsg <report npc putting on> is observed, stop the action.
First report putting it on rule:
   if  LibMsg <report player putting on> is observed, stop the action.

[There are no "report removing" rules in Inform 7 any more ]

Rule for default errors when the message of the game error is LibMsg <report npc removing>: say "Removed."
Rule for default errors when the message of the game error is LibMsg <report player removing>: say "Removed."

First report someone trying removing:
   if  LibMsg <report npc removing> is observed, stop the action.
First report removing it from rule:
   if  LibMsg <report player removing> is observed, stop the action.

First report someone trying squeezing:
   if  LibMsg <report npc squeezing> is observed, stop the action.
First report squeezing rule:
   if  LibMsg <report player squeezing> is observed, stop the action.

First report someone trying switching on:
   if  LibMsg <report npc switching on> is observed, stop the action.
First report switching on rule:
   if  LibMsg <report player switching on> is observed, stop the action.

First report someone trying switching off:
   if  LibMsg <report npc switching off> is observed, stop the action.
First report switching off rule:
   if  LibMsg <report player switching off> is observed, stop the action.

First report someone trying taking off:
   if  LibMsg <report npc taking off> is observed, stop the action.
First report taking off rule:
   if  LibMsg <report player taking off> is observed, stop the action.


[ there are two "report taking" rules, and this one needs
  to happen before the one above ]
First report taking rule:
   abide by the don't report successful implicit takes rule.

First report someone trying turning:
   if  LibMsg <report npc turning> is observed, stop the action.
First report turning rule:
   if  LibMsg <report player turning> is observed, stop the action.

First report someone trying unlocking:
   if  LibMsg <report npc unlocking> is observed, stop the action.
First report unlocking it with rule:
   if  LibMsg <report player unlocking> is observed, stop the action.

First report someone trying waiting:
   if  LibMsg <report npc waiting> is observed, stop the action.
First report waiting rule:
   if  LibMsg <report player waiting> is observed, stop the action.

First report someone trying waving some thing:
   if  LibMsg <report npc waving things> is observed, stop the action.
First report waving rule:
   if  LibMsg <report player waving things> is observed, stop the action.

First report someone trying wearing:
   if  LibMsg <report npc wearing> is observed, stop the action.
First report wearing rule:
   if  LibMsg <report player wearing> is observed, stop the action.

First report someone trying touching:
   if the noun is the actor and LibMsg <report npc touching self> is observed, stop the action;
   if the noun is a person or the noun is the player and LibMsg <report npc touching other people> is observed, stop the action;
   if  LibMsg <report npc touching things> is observed, stop the action.

First report touching rule:
   if the noun is the player and LibMsg <report player touching self> is observed, stop the action;
   if the noun is a person and LibMsg <report player touching other people> is observed, stop the action;
   if  LibMsg <report player touching things> is observed, stop the action;  

First report someone trying examining:
   if  LibMsg <report npc examining> is observed, stop the action.

This is the fake report npc looking rule:
   do nothing.

First report someone trying looking:
   if  LibMsg <report npc looking> is observed, stop the action.

First report someone trying looking under:
   if  LibMsg <report npc looking under> is observed, stop the action.

First report someone trying searching:
   if  LibMsg <report npc searching> is observed, stop the action.

First report someone trying taking inventory:
   if  LibMsg <report npc taking inventory> is observed, stop the action.

This is the fake examine directions rule:
   say "You see nothing unexpected in that direction."

The new examine directions rule is listed instead of the examine directions rule in the carry out examining rules.

Carry out examining (this is the new examine directions rule):
	now the main object is the noun;
	if the noun is a direction and LibMsg <examine direction> is observed, stop the action.

Section 11 - Remove all "Before Printing a Library Message" routines (I6) - written by David Fisher - unindexed
 
When play begins: init library messages.  To init library messages: (- InitLibraryMessages(); -).

Include (-
  Constant LibraryMessages = (+I7_LibraryMessages+);

[ InitLibraryMessages n;

#Ifndef TARGET_GLULX;
  if ((+I7_LibraryMessages+).&before)
  {
      ! get rid of any other "before" routines
      for (n = 0 : n < (+I7_LibraryMessages+).#before / WORDSIZE : n++)
      {
          if ((+I7_LibraryMessages+).&before --> n ~= LibraryMessagesBefore)
              (+I7_LibraryMessages+).&before --> n = nothing;
      }
  }
#Endif; ! TARGET_GLULX
];
-) before the library.


Section 11 - The New Before Printing a Library Message (I6) - written by David Fisher - unindexed

Cull inform default messages is a number that varies. [USED AS THE I6 RETURN VALUE] Cull inform default messages is 0.
Message-game-error is a library-message-value that varies.  [ USED AS ANOTHER I6 RETURN VALUE ]

This is the I6 returns rule:
	if using grouped messages as dialogue debugging option, say "// in 'I6 returns' rule"; 
	set game error to message-game-error;
	now cull inform default messages is 1;
	consider the current errorbook;
	if the rule failed, now cull inform default messages is 0;
	set game error to LibMsg <no error>.

This is the print library message rule: 
	if using grouped messages as dialogue debugging option, say "// in 'print library message' rule"; 
	now cull inform default messages is 1;
	consider the current errorbook;
	if the rule failed, now cull inform default messages is 0;
	set game error to LibMsg <no error>.

I7_LibraryMessages is a thing.
Include (-
  with before LibraryMessagesBefore,
-) when defining I7_LibraryMessages.

Include (-
[ LibraryMessagesBefore id isImplicitAction;
  id = -1;
  (+main object+) = lm_o;
-)

[*** Miscellany ***]

Include (-
Miscellany:
    switch (lm_n) {
       1: id = (+LibMsg <first N objects>+);
       2: id = (+LibMsg <zero multiple objects>+);
       3: id = (+LibMsg <you have died>+);
       4: id = (+LibMsg <you have won>+);
     ! 5 is "Would you like to restart ...", handled specially by Inform 7
       6: id = (+LibMsg <undo not provided>+);
       7: id = (+LibMsg <undo failed>+);
       8: id = (+LibMsg <restrict answer>+);
       9: id = (+LibMsg <entering darkness>+);
       10: id = (+LibMsg <empty line>+);
       11: id = (+LibMsg <cannot undo nothing>+);
       12: id = (+LibMsg <cannot undo twice in a row>+);
       13: id = (+LibMsg <undo succeeded>+);
       14: id = (+LibMsg <oops failed>+);
       15: id = (+LibMsg <oops no arguments>+);
       16: id = (+LibMsg <oops too many arguments>+);
       17: id = (+LibMsg <dark description>+);
       18: id = (+LibMsg <player self description>+);
     ! 19 was LibMsg <player description>
	 ! - use "The description of the player is ..." instead
       20: id = (+LibMsg <again usage>+);
       21: id = (+LibMsg <cannot do again>+);
       22: id = (+LibMsg <cannot begin at comma>+);
       23: id = (+LibMsg <cannot talk to absent person>+);
       24: id = (+LibMsg <cannot talk to inanimate object>+);
       25: id = (+LibMsg <extra words before comma>+);
       26: (+main object+) = not_holding;
             id = (+LibMsg <report implicit take>+);
       27: id = (+LibMsg <command not understood>+);
       28: id = (+LibMsg <command partly understood>+);
       29: id = (+LibMsg <number not understood>+);
       30: id = (+LibMsg <unknown object>+);
-)

Include (-
       31: id = (+LibMsg <command incomplete>+);
       32: id = (+LibMsg <object not held>+);
       33: id = (+LibMsg <verb cannot have multiple objects>+);
       34: id = (+LibMsg <too many multiple objects>+);
       35: id = (+LibMsg <pronoun not set>+);
       36: id = (+LibMsg <excepted object not included anyway>+);
       37: id = (+LibMsg <verb cannot have inanimate object>+);
       38: id = (+LibMsg <unknown verb>+);
       39: id = (+LibMsg <unimportant object>+);
       40: !print (address) pronoun word; ! (address)
		(+main object+) = pronoun_obj;
	       id = (+LibMsg <pronoun absent>+);
       41: id = (+LibMsg <command badly ended>+);
       42: (+the number understood+) = multi_had;
		id = (+LibMsg <not that many available>+);
       43: id = (+LibMsg <zero multiple objects>+); ! same as Miscellany #2 (?)
       44: id = (+LibMsg <no objects available>+);
       45: id = (+LibMsg <who disambiguation>+);
       46: id = (+LibMsg <which disambiguation>+);
       47: id = (+LibMsg <single object disambiguation>+);
       48: (+main object+) = actor;
	       id = (+LibMsg <whom disambiguation>+);
       49: (+main object+) = actor;
	       id = (+LibMsg <what disambiguation>+);
       50: id = (+LibMsg <score changed>+);
       51: id = (+LibMsg <command cut short>+);
       52: id = (+LibMsg <menu prompt>+);
       53: id = (+LibMsg <page prompt>+);
       54: id = (+LibMsg <comment recorded>+);
       55: id = (+LibMsg <comment unrecorded>+);
    }
    jump end_part;
-)

[ The ListMiscellany rules ("providing light", etc) can be handled OK by Inform 7 ]

[*** Quit, Restart ***]

Include (-
Quit:
    switch (lm_n) {
       1: id = (+LibMsg <yes-no prompt>+);
       2: id = (+LibMsg <confirm Quit>+);
    }
    jump end_part;

Restart:
    switch (lm_n) {
       1: id = (+LibMsg <confirm Restart>+);
       2: id = (+LibMsg <Restart failed>+);
    }
    jump end_part;
-)

[*** File Operations ***]

Include (-

Restore:
    switch (lm_n) {
       1: id = (+LibMsg <Restore failed>+);
       2: id = (+LibMsg <Restore succeeded>+);
    }
    jump end_part;

Save:
    switch (lm_n) {
       1: id = (+LibMsg <Save failed>+);
       2: id = (+LibMsg <Save succeeded>+);
    }
    jump end_part;

Verify:
    switch (lm_n) {
       1: id = (+LibMsg <Verify succeeded>+);
       2: id = (+LibMsg <Verify failed>+);
    }
    jump end_part;
-)

[*** Transcripts ***]

Include (-
ScriptOn:
    switch (lm_n) {
       1: id = (+LibMsg <transcript already on>+);
       2: id = (+LibMsg <start of transcript>+);
       3: id = (+LibMsg <transcript failed>+);
    }
    jump end_part;

ScriptOff:
    switch (lm_n) {
       1: id = (+LibMsg <transcript already off>+);
       2: id = (+LibMsg <end of transcript>+);
       3: id = (+LibMsg <end transcript failed>+);
    }
    jump end_part;
-)

[*** Scoring ***]

Include (-
NotifyOn:
     id = (+LibMsg <score notification turned on>+);
    jump end_part;
 
NotifyOff:
     id = (+LibMsg <score notification turned off>+);
    jump end_part;
 
Score:
     id = (+LibMsg <Score command>+);
    jump end_part;
 
FullScore:
    switch (lm_n) {
       1: id = (+LibMsg <Full Score initial text>+);
       2: id = (+LibMsg <Full Score items>+);
       3: id = (+LibMsg <Full Score places>+);
       4: id = (+LibMsg <Full Score total>+);
    }
    jump end_part;
-)

[*** Orders ***]

Include (-
Order:
    id = (+LibMsg <person ignores command>+);
    jump end_part;
-)

[*** Listing ***]

Include (-
Pronouns:
    switch (lm_n) {
       1: id = (+LibMsg <Pronouns initial text>+);
       2: id = (+LibMsg <Pronouns -means- text>+);
       3: id = (+LibMsg <Pronouns -unset- text>+);
       4: id = (+LibMsg <no pronouns known>+);
    }
    jump end_part;

Places:
    id = (+LibMsg <Places initial text>+);
    jump end_part;

Objects:
    if (lm_n == 1) { id = (+LibMsg <Objects initial text>+); }
!	2:  "None.";
!          3:  print "   (worn)";
!          4:  print "   (held)";
!          5:  print "   (given away)";
!          6:  print "   (in ", (name) x1, ")";
!          7:  print "   (in ", (the) x1, ")";
!          8:  print "   (inside ", (the) x1, ")";
!          9:  print "   (on ", (the) x1, ")";
!          10: print "   (lost)";
  ! (there are others as well)
    jump end_part;

Inv:
    switch (lm_n) {
       1: id = (+LibMsg <Inventory no possessions>+);
       2: id = (+LibMsg <Inventory initial text>+);
    }
    jump end_part;
-)

[*** Take, Remove ***]

Include (-
Take:
    switch (lm_n) {
     ! 1 is for the report taken rule, which will be called instead
       2: id = (+LibMsg <cannot take yourself>+);
       3: id = (+LibMsg <cannot take other people>+);
       4: id = (+LibMsg <cannot take something you are within>+);
       5: id = (+LibMsg <cannot take something already taken>+);
       6: id = (+LibMsg <cannot take possessions of others>+);
       7: id = (+LibMsg <cannot take component parts>+);
       8: id = (+LibMsg <cannot take hidden parts>+);
       9: id = (+LibMsg <cannot reach within closed containers>+);
       10: id = (+LibMsg <cannot take scenery>+);
       11: id = (+LibMsg <cannot take something fixed>+);
       12: id = (+LibMsg <cannot exceed carrying capacity>+);
       13: id = (+LibMsg <use holdall to avoid exceeding carrying capacity>+);
           isImplicitAction = 1;
       14: id = (+LibMsg <cannot reach within other places>+);
    }
    jump end_part;

Remove:
    switch (lm_n)
    {  1: id = (+LibMsg <cannot remove from closed containers>+);
       2: id = (+LibMsg <cannot remove something not within>+);
     ! 3 is for the report removing rule, which will be called instead
    }
    jump end_part;
-)

[*** Drop, Insert, Put ***]

Include (-
Drop:
    switch (lm_n) {
       1: id = (+LibMsg <cannot drop something already dropped>+);
       2: id = (+LibMsg <cannot drop not holding>+);
       3: id = (+LibMsg <cannot drop clothes being worn>+);
           isImplicitAction = 1;
     ! 4 is for the report dropping rule, which will be called instead
    }
    jump end_part;

Insert:
    switch (lm_n) {
       1: id = (+LibMsg <cannot insert something not held>+);
       2: id = (+LibMsg <cannot insert into something not a container>+);
       3: id = (+LibMsg <cannot insert into closed containers>+);
       4: id = (+LibMsg <need to take off before inserting>+);   ! (unused ?)
       5: id = (+LibMsg <cannot insert something into itself>+);
       6: id = (+LibMsg <cannot insert clothes being worn>+);
           isImplicitAction = 1;
       7: id = (+LibMsg <cannot insert if this exceeds carrying capacity>+);
     ! 8-9 are for the custom report inserting rule, which will be called instead
    }
    jump end_part;

PutOn:
    switch (lm_n) {
       1: id = (+LibMsg <cannot put something not held>+);
       2: id = (+LibMsg <cannot put something on itself>+);
       3: id = (+LibMsg <cannot put onto something not a supporter>+);
       4: id = (+LibMsg <cannot put onto something being carried>+);
       5: id = (+LibMsg <cannot put clothes being worn>+);
           isImplicitAction = 1;
       6: id = (+LibMsg <cannot put if this exceeds carrying capacity>+);
     ! 7-8 are for the custom report putting on rule, which will be called instead
    }
    jump end_part;
-)

[*** Empty ***]

Include (-
EmptyT:
    switch (lm_n) {
       1: id = (+LibMsg <need to empty into a container>+);
       2: id = (+LibMsg <need to empty into something open>+);
       3: id = (+LibMsg <already empty>+);
       4: id = (+LibMsg <empty something into itself>+);
    }
    jump end_part;
-)

[*** Give, Show ***]

Include (-
Give:
    switch (lm_n) {
       1: id = (+LibMsg <cannot give what you have not got>+);
       2: id = (+LibMsg <cannot give to yourself>+);
       3: id = (+LibMsg <block giving>+);
       4: id = (+LibMsg <unable to receive things>+);
   }
    jump end_part;

Show:
    switch (lm_n) {
       1: id = (+LibMsg <cannot show what you have not got>+);
       2: id = (+LibMsg <block showing>+);
    }
    jump end_part;
-)

[*** Enter, Exit, GetOff ***]

Include (-
Enter:
    switch (lm_n) {
       1: id = (+LibMsg <cannot enter something already entered>+);
       2: id = (+LibMsg <cannot enter something not enterable>+);
       3: id = (+LibMsg <cannot enter closed containers>+);
       4: id = (+LibMsg <cannot enter something carried>+);
     ! 5 is for the report entering rule, which will be called instead
       6: id = (+LibMsg <implicitly pass outwards through other barriers>+);
          isImplicitAction = 1;
       7: id = (+LibMsg <implicitly pass inwards through other barriers>+);
           isImplicitAction = 1;
    }
    jump end_part;

Exit:
    switch (lm_n) {
       1: id = (+LibMsg <cannot exit when not within anything>+);
       2: id = (+LibMsg <cannot exit closed containers>+);
     ! 3 is for the report exiting rule, which will be called instead
    }
    jump end_part;

GetOff:
    id = (+LibMsg <cannot get off things>+);
    jump end_part;
-)

[*** Go, VagueGo ***]

Include (-
Go:
    switch (lm_n) {
       1: id = (+LibMsg <cannot travel in something not a vehicle>+);
       2: id = (+LibMsg <cannot go that way>+);
          (+main object+) = noun;   ! the direction
       3: id = (+LibMsg <cannot go up through closed doors>+);
       4: id = (+LibMsg <cannot go down through closed doors>+);
       5: id = (+LibMsg <cannot go through closed doors>+);
       6: id = (+LibMsg <nothing through door>+);
    }
    jump end_part;

! VagueGo: (the block vaguely going rule will be called instead)
-)

[*** Verbosity Level ***]

Include (-
LMode1:
    id = (+LibMsg <brief look mode>+);
    jump end_part;

LMode2:
    id = (+LibMsg <verbose look mode>+);
    jump end_part;

LMode3:
    id = (+LibMsg <superbrief look mode>+);
    jump end_part;
-)

[*** Look ***]

Include (-
Look:
    switch (lm_n) {
       1: id = (+LibMsg <top line what on>+);
       2: id = (+LibMsg <top line what in>+);
       3: id = (+LibMsg <top line what as>+);
       4: id = (+LibMsg <say things on>+);
       5: id = (+LibMsg <say things also within>+);
       6: id = (+LibMsg <say things within>+);
       8: if (lm_o has supporter) id = (+LibMsg <top line what on>+);
          else id = (+LibMsg <top line what in>+);
    }
    jump end_part;
-)

[*** Examine, Search, LookUnder ***]

Include (-
Examine:
    switch (lm_n) {
       1: id = (+LibMsg <examine while dark>+);
       2: id = (+LibMsg <examine undescribed things>+);
       3: id = (+LibMsg <examine devices>+);
    }
    jump end_part;

Search:
    switch (lm_n) {
       1: id = (+LibMsg <search while dark>+);
       2: id = (+LibMsg <nothing found on top of>+);
     ! 3 prints what is on a supporter; use I6 default behaviour
       4: id = (+LibMsg <cannot search unless container-supporter>+);
       5: id = (+LibMsg <cannot search closed opaque containers>+);
       6: id = (+LibMsg <nothing found within container>+);
     ! 7 prints the contents of a container; use I6 default behaviour
    }
    jump end_part;

LookUnder:
   switch (lm_n) {
       1: id = (+LibMsg <look under while dark>+);
       2: id = (+LibMsg <look under>+);
    }
    jump end_part;
-)

[*** Open, Close, Lock, Unlock ***]

Include (-
Open:
    switch (lm_n) {
       1: id = (+LibMsg <cannot open unless openable>+);
       2: id = (+LibMsg <cannot open something locked>+);
       3: id = (+LibMsg <cannot open something already open>+);
       4: id = -2; ! reveal any newly visible exterior
     ! 5 is for the report opening rule, which will be called instead
    }
    jump end_part;

Close:
    switch (lm_n) {
       1: id = (+LibMsg <cannot close unless openable>+);
       2: id = (+LibMsg <cannot close something already closed>+);
     ! 3 is for the report closing rule, which will be called instead
    }
    jump end_part;

Lock:
    switch (lm_n) {
       1: id = (+LibMsg <cannot lock without a lock>+);
       2: id = (+LibMsg <cannot lock something already locked>+);
       3: id = (+LibMsg <cannot lock something open>+);
       4: id = (+LibMsg <cannot lock without the correct key>+);
     ! 5 is for the report locking rule, which will be called instead
    }
    jump end_part;

Unlock:
    switch (lm_n) {
       1: id = (+LibMsg <cannot unlock without a lock>+);
       2: id = (+LibMsg <cannot unlock something already unlocked>+);
       3: id = (+LibMsg <cannot unlock without the correct key>+);
     ! 4 is for the report unlocking rule, which will be called instead
    }
    jump end_part;
-)

[*** Switch On / Off ***]

Include (-
SwitchOn:
    switch (lm_n) {
       1: id = (+LibMsg <cannot switch on unless switchable>+);
       2: id = (+LibMsg <cannot switch on something already on>+);
     ! 3 is for the report switching on rule, which will be called instead
    }
    jump end_part;

SwitchOff:
    switch (lm_n) {
       1: id = (+LibMsg <cannot switch off unless switchable>+);
       2: id = (+LibMsg <cannot switch off something already off>+);
     ! 3 is for the report switching off rule, which will be called instead
    }
    jump end_part;
-)

[*** Wear, Disrobe ***]

Include (-
Wear:
    switch (lm_n) {
       1: id = (+LibMsg <cannot wear something not clothing>+);
       2: id = (+LibMsg <cannot wear not holding>+);
       3: id = (+LibMsg <cannot wear something already worn>+);
     ! 4 is for the report wearing rule, which will be called instead
    }
    jump end_part;

Disrobe:
    switch (lm_n) {
       1: id = (+LibMsg <cannot take off something not worn>+);
     ! 2 is for the report taking off rule, which will be called instead
    }
    jump end_part;
-)

[*** Eating, Drinking, Senses ***]

Include (-
Eat:
    switch (lm_n) {
       1: id = (+LibMsg <cannot eat unless edible>+);
     ! 2 is for the report eating rule, which will be called instead
    }
    jump end_part;
Drink:
    id = (+LibMsg <block drinking>+);
    jump end_part;
Taste:
    id = (+LibMsg <block tasting>+);
    jump end_part;
Smell:
    id = (+LibMsg <block smelling>+);
    jump end_part;
Listen:
    id = (+LibMsg <block listening>+);
    jump end_part;

!Touch: all cases are handled by "report" rules
-)

[*** Rhetorical Commands ***]

Include (-
Yes:
    id = (+LibMsg <block saying yes>+);
    jump end_part;
No:
    id = (+LibMsg <block saying no>+);
    jump end_part;
Sorry:
    id = (+LibMsg <block saying sorry>+);
    jump end_part;
Strong:
    id = (+LibMsg <block swearing obscenely>+);
    jump end_part;
Mild:
    id = (+LibMsg <block swearing mildly>+);
    jump end_part;
-)

[*** Body Movement  ***]

Include (-
Climb:
    id = (+LibMsg <block climbing>+);
    jump end_part;
Jump:
    id = (+LibMsg <block jumping>+);
    jump end_part;
JumpOver:
    id = (+LibMsg <block jumping over>+);
    jump end_part;
Swim:
    id = (+LibMsg <block swimming>+);
    jump end_part;
Swing:
    id = (+LibMsg <block swinging>+);
    jump end_part;
WaveHands:
    id = (+LibMsg <block waving hands>+);
    jump end_part;
-)

[*** Physical Interaction ***]

Include (-
Attack:
    id = (+LibMsg <block attacking>+);
    jump end_part;
Blow:
    id = (+LibMsg <block blowing>+);
    jump end_part;
Burn:
    id = (+LibMsg <block burning>+);
    jump end_part;
Cut:
    id = (+LibMsg <block cutting>+);
    jump end_part;
Dig:
    id = (+LibMsg <block digging>+);
    jump end_part;
Fill:
    id = (+LibMsg <block filling>+);
    jump end_part;
Rub:
    id = (+LibMsg <block rubbing>+);
    jump end_part;
Set:
    id = (+LibMsg <block set>+);
    jump end_part;
SetTo:
    id = (+LibMsg <block setting to>+);
    jump end_part;
Tie:
    id = (+LibMsg <block tying>+);
    jump end_part;

Wave:
    switch (lm_n) {
       1: id = (+LibMsg <cannot wave something not held>+);
     ! 2 is for the report waving things rule, which will be called instead
    }
    jump end_part;

Squeeze:
    switch (lm_n) {
       1: id = (+LibMsg <squeezing people>+);
     ! 2: is for the report squeezing rule, which will be called instead
    }
    jump end_part;

ThrowAt:
    switch (lm_n) {
       1: id = (+LibMsg <throw at inanimate object>+);
       2: id = (+LibMsg <block throwing at>+);
    }
    jump end_part;
-)

[*** Push, Pull, Turn ***]

Include (-
Push:
    switch (lm_n) {
       1: id = (+LibMsg <cannot push something fixed in place>+);
       2: id = (+LibMsg <cannot push scenery>+);
     ! 3: is for the report pushing rule, which will be called instead
       4: id = (+LibMsg <cannot push people>+);
    }
    jump end_part;

PushDir:
    switch (lm_n) {
       1: id = (+LibMsg <block pushing in directions>+);
       2: id = (+LibMsg <not pushed in a direction>+);
       3: id = (+LibMsg <pushed in illegal direction>+);
    }
    jump end_part;

Pull:
    switch (lm_n) {
       1: id = (+LibMsg <cannot pull something fixed in place>+);
       2: id = (+LibMsg <cannot pull scenery>+);
     ! 3 is for the report pulling rule, which will be called instead
       4: id = (+LibMsg <cannot pull people>+);
    }
    jump end_part;

Turn:
    switch (lm_n) {
       1: id = (+LibMsg <cannot turn something fixed in place>+);
       2: id = (+LibMsg <cannot turn scenery>+);
     ! 3 is for the report turning rule, which will be called instead
       4: id = (+LibMsg <cannot turn people>+);
    }
    jump end_part;
-)

[*** Speech / Interpersonal Actions ***]

Include (-
Answer:
    id = (+LibMsg <block answering>+);
    jump end_part;
Ask:
    id = (+LibMsg <block asking>+);
    jump end_part;
Buy:
    id = (+LibMsg <block buying>+);
    jump end_part;
Kiss:
    id = (+LibMsg <block kissing>+);
    jump end_part;
Pray:
    id = (+LibMsg <block praying>+);
    jump end_part;
Sing:
    id = (+LibMsg <block singing>+);
    jump end_part;
Tell:
    switch (lm_n) {
       1: id = (+LibMsg <telling yourself>+);
       2: id = (+LibMsg <block telling>+);
    }
    jump end_part;
-)

[*** Mental Actions ***]

Include (-
Think:
    id = (+LibMsg <block thinking>+);
    jump end_part;

! Consult: (the block consulting rule will be called instead)
-)

[*** Sleep And Waiting ***]

Include (-
Sleep:
    id = (+LibMsg <block sleeping>+);
    jump end_part;

! Wait: (the report waiting rule will be called instead)

Wake:
    id = (+LibMsg <block waking up>+);
    jump end_part;

WakeOther:
    id = (+LibMsg <block waking other>+);
    jump end_part;
-)

Include (-
default:
.end_part;
    if (id == -1) { rfalse; }

    if (id == -2)  {
   	   if (WriteListFrom(child(lm_o), ENGLISH_BIT+TERSE_BIT+CONCEAL_BIT) == 0) {
		    id = (+LibMsg <fake newly visible exterior> +);
	} else {
		    id = (+LibMsg <fake newly visible exterior nothing> +);
	}
    }


       (+message-game-error+) = id;
       (+I6 returns rule+)();  
	 return (+cull inform default messages+);
];
-)

section 12 - Defining the Kind-Of-Value - written by David Fisher - unindexed

Table of library messages
Message Id
LibMsg <no error>					[ BASE CASE ]
LibMsg <noun out of context>			[ a parser error ]
LibMsg <fake newly visible exterior>					
LibMsg <fake newly visible exterior nothing>					
LibMsg <comment recorded>
LibMsg <comment unrecorded>
LibMsg <you have died>					
LibMsg <you have won>					
LibMsg <player self description>				
LibMsg <unimportant object>				
LibMsg <empty line>			[ parser error "I BEG YOUR PARDON" ]
LibMsg <confirm Quit>					
LibMsg <yes-no prompt>				
LibMsg <restrict answer>				
LibMsg <page prompt>					
LibMsg <menu prompt>					
LibMsg <undo succeeded>				
LibMsg <undo failed>					
LibMsg <undo not provided>				
LibMsg <cannot undo nothing>				
LibMsg <cannot undo twice in a row>			
LibMsg <oops failed>					
LibMsg <oops too many arguments>			
LibMsg <oops no arguments>				
LibMsg <cannot do again>				
LibMsg <again usage>					
LibMsg <command not understood>			
LibMsg <command partly understood>			[ PARSER ERROR "only UNDERSTOOD AS FAR AS" ]
LibMsg <command badly ended>				
LibMsg <command incomplete>				
LibMsg <command cut short>				
LibMsg <number not understood>			
LibMsg <cannot begin at comma>			
LibMsg <extra words before comma>			
LibMsg <unknown object>				
LibMsg <object not held>				
LibMsg <unknown verb>					
LibMsg <verb cannot have inanimate object>		
LibMsg <verb cannot have multiple objects>		
LibMsg <too many multiple objects>			
LibMsg <not that many available>			
LibMsg <no objects available>				
LibMsg <zero multiple objects>				
LibMsg <first N objects>					
LibMsg <excepted object not included anyway>		
LibMsg <report implicit take>				
LibMsg <implicitly pass outwards through other barriers>	
LibMsg <implicitly pass inwards through other barriers>	
LibMsg <cannot drop clothes being worn>		
LibMsg <cannot insert clothes being worn>		
LibMsg <cannot put clothes being worn>			
LibMsg <cannot exceed carrying capacity>		
LibMsg <use holdall to avoid exceeding carrying capacity>	
LibMsg <cannot insert if this exceeds carrying capacity>	
LibMsg <cannot put if this exceeds carrying capacity>	
LibMsg <who disambiguation>				
LibMsg <which disambiguation>				
LibMsg <whom disambiguation>				
LibMsg <what disambiguation>				
LibMsg <single object disambiguation>			
LibMsg <pronoun not set>				
LibMsg <pronoun absent>				
LibMsg <Pronouns initial text>				
LibMsg <Pronouns -means- text>				
LibMsg <Pronouns -unset- text>				
LibMsg <no pronouns known>				
LibMsg <person ignores command>			
LibMsg <cannot talk to absent person>			
LibMsg <cannot talk to inanimate object>			
LibMsg <Places initial text>				
LibMsg <Objects initial text>				
LibMsg <confirm Restart>				
LibMsg <Restart failed>					
LibMsg <Restore failed>					
LibMsg <Restore succeeded>				
LibMsg <Save failed>					
LibMsg <Save succeeded>				
LibMsg <Verify succeeded>				
LibMsg <Verify failed>					
LibMsg <transcript already on>				
LibMsg <transcript already off>				
LibMsg <start of transcript>				
LibMsg <end of transcript>				
LibMsg <transcript failed>				
LibMsg <end transcript failed>				
LibMsg <Score command>				
LibMsg <score changed>				
LibMsg <score notification turned on>			
LibMsg <score notification turned off>			
LibMsg <Full Score initial text>				
LibMsg <Full Score items>				
LibMsg <Full Score places>				
LibMsg <Full Score total>				
LibMsg <Inventory initial text>				
LibMsg <Inventory no possessions>			
LibMsg <entering darkness>				
LibMsg <dark description>				
LibMsg <examine while dark>				
LibMsg <search while dark>				
LibMsg <look under while dark>				
LibMsg <cannot take yourself>				
LibMsg <cannot take other people>			
LibMsg <cannot take something you are within>		
LibMsg <cannot take something already taken>		
LibMsg <cannot take possessions of others>		
LibMsg <cannot take component parts>			
LibMsg <cannot take hidden parts>			
LibMsg <cannot reach within closed containers>		
LibMsg <cannot take scenery>				
LibMsg <cannot take something fixed>			
LibMsg <cannot reach within other places>		
LibMsg <cannot remove from closed containers>		
LibMsg <cannot remove something not within>		
LibMsg <cannot drop something already dropped>	
LibMsg <cannot drop not holding>			
LibMsg <cannot insert something not held>		
LibMsg <cannot insert into something not a container>	
LibMsg <cannot insert into closed containers>		
LibMsg <need to take off before inserting>		
LibMsg <cannot insert something into itself>		
LibMsg <cannot put something not held>			
LibMsg <cannot put something on itself>			
LibMsg <cannot put onto something not a supporter>	
LibMsg <cannot put onto something being carried>	
LibMsg <need to empty into a container>			
LibMsg <need to empty into something open>		
LibMsg <already empty>					
LibMsg <empty something into itself>			
LibMsg <cannot give what you have not got>		
LibMsg <cannot give to yourself>				
LibMsg <unable to receive things>			
LibMsg <cannot show what you have not got>		
LibMsg <cannot enter something already entered>	
LibMsg <cannot enter something not enterable>		
LibMsg <cannot enter closed containers>			
LibMsg <cannot enter something carried>		
LibMsg <cannot exit when not within anything>		
LibMsg <cannot exit closed containers>			
LibMsg <cannot get off things>				
LibMsg <cannot go that way>				
LibMsg <cannot travel in something not a vehicle>	
LibMsg <cannot go through concealed doors>		
LibMsg <cannot go up through closed doors>		
LibMsg <cannot go down through closed doors>		
LibMsg <cannot go through closed doors>		
LibMsg <nothing through door>				
LibMsg <brief look mode>				
LibMsg <superbrief look mode>				
LibMsg <verbose look mode>				
LibMsg <top line what on>				
LibMsg <top line what in>				
LibMsg <top line what as>				
LibMsg <say things within>				
LibMsg <say things also within>				
LibMsg <say things on>					
LibMsg <examine undescribed things>			
LibMsg <examine direction>				
LibMsg <examine devices>				
LibMsg <cannot search unless container-supporter>	
LibMsg <cannot search closed opaque containers>	
LibMsg <nothing found within container>			
LibMsg <nothing found on top of>			
LibMsg <look under>					
LibMsg <cannot open unless openable>			
LibMsg <cannot open something locked>			
LibMsg <cannot open something already open>		
LibMsg <reveal any newly visible exterior initial text>	
LibMsg <no newly visible exterior>			
LibMsg <cannot close unless openable>			
LibMsg <cannot close something already closed>		
LibMsg <cannot lock without a lock>			
LibMsg <cannot lock something already locked>		
LibMsg <cannot lock something open>			
LibMsg <cannot lock without the correct key>		
LibMsg <cannot unlock without a lock>			
LibMsg <cannot unlock something already unlocked>	
LibMsg <cannot unlock without the correct key>		
LibMsg <cannot switch on unless switchable>		
LibMsg <cannot switch on something already on>		
LibMsg <cannot switch off unless switchable>		
LibMsg <cannot switch off something already off>		
LibMsg <cannot wear something not clothing>		
LibMsg <cannot wear not holding>			
LibMsg <cannot wear something already worn>		
LibMsg <cannot take off something not worn>		
LibMsg <cannot eat unless edible>			
LibMsg <cannot wave something not held>		
LibMsg <squeezing people>				
LibMsg <throw at inanimate object>			
LibMsg <not pushed in a direction>			
LibMsg <pushed in illegal direction>			
LibMsg <cannot push something fixed in place>		
LibMsg <cannot pull something fixed in place>		
LibMsg <cannot turn something fixed in place>		
LibMsg <cannot push scenery>				
LibMsg <cannot pull scenery>				
LibMsg <cannot turn scenery>				
LibMsg <cannot push people>				
LibMsg <cannot pull people>				
LibMsg <cannot turn people>				
LibMsg <telling yourself>				
LibMsg <block giving>					
LibMsg <block showing>					
LibMsg <block vaguely going>				
LibMsg <block drinking>					
LibMsg <block tasting>					
LibMsg <block smelling>					
LibMsg <block listening>					
LibMsg <block saying yes>				
LibMsg <block saying no>				
LibMsg <block saying sorry>				
LibMsg <block swearing obscenely>			
LibMsg <block swearing mildly>				
LibMsg <block climbing>					
LibMsg <block jumping>					
LibMsg <block jumping over>				
LibMsg <block swimming>				
LibMsg <block swinging>				
LibMsg <block waving hands>				
LibMsg <block attacking>				
LibMsg <block blowing>					
LibMsg <block burning>					
LibMsg <block cutting>					
LibMsg <block digging>					
LibMsg <block filling>					
LibMsg <block rubbing>					
LibMsg <block set>					
LibMsg <block setting to>				
LibMsg <block tying>					
LibMsg <block throwing at>				
LibMsg <block pushing in directions>			
LibMsg <block answering>				
LibMsg <block asking>					
LibMsg <block buying>					
LibMsg <block kissing>					
LibMsg <block praying>					
LibMsg <block singing>					
LibMsg <block telling>					
LibMsg <block thinking>					
LibMsg <block player consulting>				
LibMsg <block npc consulting>				
LibMsg <block sleeping>					
LibMsg <block waking up>				
LibMsg <block waking other>				
LibMsg <report npc taking inventory>			
LibMsg <report player taking>				
LibMsg <report npc taking>				
LibMsg <report player removing>			
LibMsg <report npc removing>				
LibMsg <report player dropping>				
LibMsg <report npc dropping>				
LibMsg <report player inserting>				
LibMsg <report npc inserting>				
LibMsg <report player putting on>			
LibMsg <report npc putting on>				
LibMsg <report player giving>				
LibMsg <report npc giving>				
LibMsg <report player entering>				
LibMsg <report npc entering>				
LibMsg <report player exiting>				
LibMsg <report npc exiting>				
LibMsg <report npc looking>				
LibMsg <report npc examining>				
LibMsg <report npc searching>				
LibMsg <report npc looking under>			
LibMsg <report player opening>				
LibMsg <report npc opening>				
LibMsg <report player closing>				
LibMsg <report npc closing>				
LibMsg <report player locking>				
LibMsg <report npc locking>				
LibMsg <report player unlocking>			
LibMsg <report npc unlocking>				
LibMsg <report player switching on>			
LibMsg <report npc switching on>			
LibMsg <report player switching off>			
LibMsg <report npc switching off>			
LibMsg <report player wearing>				
LibMsg <report npc wearing>				
LibMsg <report player taking off>			
LibMsg <report npc taking off>				
LibMsg <report player eating>				
LibMsg <report npc eating>				
LibMsg <report player touching things>			
LibMsg <report npc touching things>			
LibMsg <report player touching self>			
LibMsg <report npc touching self>			
LibMsg <report player touching other people>		
LibMsg <report npc touching other people>		
LibMsg <report player waving things>			
LibMsg <report npc waving things>			
LibMsg <report player squeezing>			
LibMsg <report npc squeezing>				
LibMsg <report player pushing>				
LibMsg <report npc pushing>				
LibMsg <report player pulling>				
LibMsg <report npc pulling>				
LibMsg <report player turning>				
LibMsg <report npc turning>				
LibMsg <report player waiting>				
LibMsg <report npc waiting>				
		


Categorizing errors is a rulebook.

First categorizing errors rule (this is the reset all error categories rule):
	now game error is not out of world;
	now game error is not action acknowledgement;
	now game error is not failing;
	now game error is not futile; 
	now game error is not re-attempting;
	now game error is not blocked;  
	now game error is not darkness-involving;
	now game error is not parser-erroring; 
	now game error is not parser-modal; 
	now game error is not answer-awaiting;  
	now game error is not physically-vigorous; 
	now game error is not bodily-senses;
	now game error is not civilized;  
	now game error is not conversational;  
	now game error is not involving-nothing;
	continue the action.


A categorizing errors rule for when message of game error is LibMsg <Save failed>: now game error is out of world; now game error is action acknowledgement; now game error is failing.
A categorizing errors rule for when message of game error is LibMsg <Save succeeded>: now game error is out of world; now game error is action acknowledgement.
A categorizing errors rule for when message of game error is LibMsg <noun out of context>: now game error is out of world; now game error is parser-erroring.
A categorizing errors rule for when message of game error is LibMsg <fake newly visible exterior>: do nothing.
A categorizing errors rule for when message of game error is LibMsg <fake newly visible exterior nothing>: now game error is involving-nothing.
A categorizing errors rule for when message of game error is LibMsg <comment recorded>: now game error is out of world.
A categorizing errors rule for when message of game error is LibMsg <comment unrecorded>: now game error is out of world; now game error is failing.
A categorizing errors rule for when message of game error is LibMsg <you have died>: now game error is out of world.
A categorizing errors rule for when message of game error is LibMsg <you have won>: now game error is out of world.
A categorizing errors rule for when message of game error is LibMsg <player self description>: now game error is bodily-senses; now game error is action acknowledgement.
A categorizing errors rule for when message of game error is LibMsg <unimportant object>: now game error is out of world; now game error is parser-erroring.
A categorizing errors rule for when message of game error is LibMsg <empty line>: now game error is out of world;  now game error is parser-erroring.
A categorizing errors rule for when message of game error is LibMsg <confirm Quit>: now game error is out of world.
A categorizing errors rule for when message of game error is LibMsg <yes-no prompt>: now game error is out of world; now game error is parser-modal.
A categorizing errors rule for when message of game error is LibMsg <restrict answer>: now game error is out of world.
A categorizing errors rule for when message of game error is LibMsg <page prompt>: now game error is out of world; now game error is parser-modal.
A categorizing errors rule for when message of game error is LibMsg <menu prompt>: now game error is out of world; now game error is parser-modal; now game error is answer-awaiting; now game error is conversational; now game error is civilized.
A categorizing errors rule for when message of game error is LibMsg <undo succeeded>: now game error is out of world; now game error is action acknowledgement.
A categorizing errors rule for when message of game error is LibMsg <undo failed>: now game error is out of world; now game error is action acknowledgement; now game error is failing.
A categorizing errors rule for when message of game error is LibMsg <undo not provided>: now game error is out of world; now game error is action acknowledgement.
A categorizing errors rule for when message of game error is LibMsg <cannot undo nothing>: now game error is out of world; now game error is failing.
A categorizing errors rule for when message of game error is LibMsg <cannot undo twice in a row>: now game error is out of world; now game error is failing.
A categorizing errors rule for when message of game error is LibMsg <oops failed>: now game error is out of world; now game error is action acknowledgement; now game error is failing.
A categorizing errors rule for when message of game error is LibMsg <oops too many arguments>: now game error is out of world; now game error is action acknowledgement.
A categorizing errors rule for when message of game error is LibMsg <oops no arguments>: now game error is out of world; now game error is action acknowledgement.
A categorizing errors rule for when message of game error is LibMsg <cannot do again>: now game error is out of world; now game error is action acknowledgement; now game error is failing.
A categorizing errors rule for when message of game error is LibMsg <again usage>: now game error is out of world; now game error is action acknowledgement.
A categorizing errors rule for when message of game error is LibMsg <command not understood>: now game error is out of world; now game error is parser-erroring.
A categorizing errors rule for when message of game error is LibMsg <command partly understood>: now game error is out of world;  now game error is parser-erroring.
A categorizing errors rule for when message of game error is LibMsg <command badly ended>: now game error is out of world; now game error is parser-erroring.
A categorizing errors rule for when message of game error is LibMsg <command incomplete>: now game error is out of world; now game error is parser-erroring.
A categorizing errors rule for when message of game error is LibMsg <command cut short>: now game error is out of world.
A categorizing errors rule for when message of game error is LibMsg <number not understood>: now game error is out of world; now game error is parser-erroring.
A categorizing errors rule for when message of game error is LibMsg <cannot begin at comma>: now game error is out of world; now game error is failing.
A categorizing errors rule for when message of game error is LibMsg <extra words before comma>: now game error is out of world.
A categorizing errors rule for when message of game error is LibMsg <unknown object>: now game error is out of world; now game error is parser-erroring.
A categorizing errors rule for when message of game error is LibMsg <object not held>: now game error is parser-erroring.
A categorizing errors rule for when message of game error is LibMsg <unknown verb>: now game error is out of world; now game error is parser-erroring.
A categorizing errors rule for when message of game error is LibMsg <verb cannot have inanimate object>: now game error is failing; now game error is parser-erroring.
A categorizing errors rule for when message of game error is LibMsg <verb cannot have multiple objects>: now game error is failing; now game error is parser-erroring.
A categorizing errors rule for when message of game error is LibMsg <too many multiple objects>: now game error is out of world; now game error is parser-erroring.
A categorizing errors rule for when message of game error is LibMsg <not that many available>: now game error is parser-erroring.
A categorizing errors rule for when message of game error is LibMsg <no objects available>: now game error is out of world; now game error is parser-erroring; now game error is involving-nothing.
A categorizing errors rule for when message of game error is LibMsg <zero multiple objects>: now game error is out of world; now game error is parser-erroring.
A categorizing errors rule for when message of game error is LibMsg <first N objects>: 
A categorizing errors rule for when message of game error is LibMsg <excepted object not included anyway>: now game error is parser-erroring.
A categorizing errors rule for when message of game error is LibMsg <report implicit take>: now game error is action acknowledgement.
A categorizing errors rule for when message of game error is LibMsg <implicitly pass outwards through other barriers>: 
A categorizing errors rule for when message of game error is LibMsg <implicitly pass inwards through other barriers>: 
A categorizing errors rule for when message of game error is LibMsg <cannot drop clothes being worn>: now game error is failing.
A categorizing errors rule for when message of game error is LibMsg <cannot insert clothes being worn>: now game error is failing.
A categorizing errors rule for when message of game error is LibMsg <cannot put clothes being worn>: now game error is failing.
A categorizing errors rule for when message of game error is LibMsg <cannot exceed carrying capacity>: now game error is failing.
A categorizing errors rule for when message of game error is LibMsg <use holdall to avoid exceeding carrying capacity>: 
A categorizing errors rule for when message of game error is LibMsg <cannot insert if this exceeds carrying capacity>: now game error is failing.
A categorizing errors rule for when message of game error is LibMsg <cannot put if this exceeds carrying capacity>: now game error is failing.
A categorizing errors rule for when message of game error is LibMsg <who disambiguation>: now game error is parser-modal; now game error is answer-awaiting; now game error is conversational; now game error is civilized.
A categorizing errors rule for when message of game error is LibMsg <which disambiguation>: now game error is parser-modal; now game error is answer-awaiting; now game error is conversational; now game error is civilized.
A categorizing errors rule for when message of game error is LibMsg <whom disambiguation>: now game error is parser-modal; now game error is answer-awaiting; now game error is conversational; now game error is civilized.
A categorizing errors rule for when message of game error is LibMsg <what disambiguation>: now game error is parser-modal; now game error is answer-awaiting; now game error is conversational; now game error is civilized.
A categorizing errors rule for when message of game error is LibMsg <single object disambiguation>: 
A categorizing errors rule for when message of game error is LibMsg <pronoun not set>: now game error is parser-erroring.
A categorizing errors rule for when message of game error is LibMsg <pronoun absent>: now game error is parser-erroring.
A categorizing errors rule for when message of game error is LibMsg <Pronouns initial text>: now game error is out of world.
A categorizing errors rule for when message of game error is LibMsg <Pronouns -means- text>: now game error is out of world.
A categorizing errors rule for when message of game error is LibMsg <Pronouns -unset- text>: now game error is out of world.
A categorizing errors rule for when message of game error is LibMsg <no pronouns known>: now game error is involving-nothing.
A categorizing errors rule for when message of game error is LibMsg <person ignores command>: now game error is conversational; now game error is civilized.
A categorizing errors rule for when message of game error is LibMsg <cannot talk to absent person>: now game error is failing.
A categorizing errors rule for when message of game error is LibMsg <cannot talk to inanimate object>: now game error is failing.
A categorizing errors rule for when message of game error is LibMsg <Places initial text>: do nothing.
A categorizing errors rule for when message of game error is LibMsg <Objects initial text>: do nothing.
A categorizing errors rule for when message of game error is LibMsg <confirm Restart>: now game error is out of world.
A categorizing errors rule for when message of game error is LibMsg <Restart failed>: now game error is failing; now game error is out of world.
A categorizing errors rule for when message of game error is LibMsg <Restore failed>: now game error is failing; now game error is out of world.
A categorizing errors rule for when message of game error is LibMsg <Restore succeeded>: now game error is out of world.
A categorizing errors rule for when message of game error is LibMsg <Verify succeeded>: now game error is out of world.
A categorizing errors rule for when message of game error is LibMsg <Verify failed>: now game error is failing; now game error is out of world.
A categorizing errors rule for when message of game error is LibMsg <transcript already on>: now game error is out of world; now game error is re-attempting;  now game error is futile; now game error is failing.
A categorizing errors rule for when message of game error is LibMsg <transcript already off>: now game error is out of world; now game error is re-attempting;  now game error is futile; now game error is failing.
A categorizing errors rule for when message of game error is LibMsg <start of transcript>: now game error is out of world.
A categorizing errors rule for when message of game error is LibMsg <end of transcript>: now game error is out of world.
A categorizing errors rule for when message of game error is LibMsg <transcript failed>: now game error is failing; now game error is out of world.
A categorizing errors rule for when message of game error is LibMsg <end transcript failed>: now game error is failing; now game error is out of world.
A categorizing errors rule for when message of game error is LibMsg <Score command>: now game error is out of world.
A categorizing errors rule for when message of game error is LibMsg <score changed>: now game error is out of world; now game error is action acknowledgement.
A categorizing errors rule for when message of game error is LibMsg <score notification turned on>: now game error is out of world; now game error is action acknowledgement.
A categorizing errors rule for when message of game error is LibMsg <score notification turned off>: now game error is out of world; now game error is action acknowledgement.
A categorizing errors rule for when message of game error is LibMsg <Full Score initial text>: now game error is out of world.
A categorizing errors rule for when message of game error is LibMsg <Full Score items>: now game error is out of world.
A categorizing errors rule for when message of game error is LibMsg <Full Score places>: now game error is out of world.
A categorizing errors rule for when message of game error is LibMsg <Full Score total>: now game error is out of world.
A categorizing errors rule for when message of game error is LibMsg <Inventory initial text>: 
A categorizing errors rule for when message of game error is LibMsg <Inventory no possessions>: now game error is involving-nothing.
A categorizing errors rule for when message of game error is LibMsg <entering darkness>: now game error is darkness-involving.
A categorizing errors rule for when message of game error is LibMsg <dark description>: now game error is darkness-involving.
A categorizing errors rule for when message of game error is LibMsg <examine while dark>: now game error is darkness-involving;  now game error is futile; now game error is failing; now game error is bodily-senses.
A categorizing errors rule for when message of game error is LibMsg <search while dark>: now game error is darkness-involving;  now game error is futile; now game error is failing.
A categorizing errors rule for when message of game error is LibMsg <look under while dark>: now game error is darkness-involving;  now game error is futile; now game error is failing; now game error is bodily-senses.
A categorizing errors rule for when message of game error is LibMsg <cannot take yourself>: now game error is failing.
A categorizing errors rule for when message of game error is LibMsg <cannot take other people>: now game error is failing.
A categorizing errors rule for when message of game error is LibMsg <cannot take something you are within>: now game error is failing.
A categorizing errors rule for when message of game error is LibMsg <cannot take something already taken>: now game error is failing; now game error is re-attempting;  now game error is futile.
A categorizing errors rule for when message of game error is LibMsg <cannot take possessions of others>: now game error is failing.
A categorizing errors rule for when message of game error is LibMsg <cannot take component parts>: now game error is failing.
A categorizing errors rule for when message of game error is LibMsg <cannot take hidden parts>: now game error is failing.
A categorizing errors rule for when message of game error is LibMsg <cannot reach within closed containers>: now game error is failing.
A categorizing errors rule for when message of game error is LibMsg <cannot take scenery>: now game error is failing.
A categorizing errors rule for when message of game error is LibMsg <cannot take something fixed>: now game error is failing.
A categorizing errors rule for when message of game error is LibMsg <cannot reach within other places>: now game error is failing.
A categorizing errors rule for when message of game error is LibMsg <cannot remove from closed containers>: now game error is failing.
A categorizing errors rule for when message of game error is LibMsg <cannot remove something not within>: now game error is failing.
A categorizing errors rule for when message of game error is LibMsg <cannot drop something already dropped>: now game error is failing; now game error is re-attempting;  now game error is futile.
A categorizing errors rule for when message of game error is LibMsg <cannot drop not holding>: now game error is failing.
A categorizing errors rule for when message of game error is LibMsg <cannot insert something not held>: now game error is failing.
A categorizing errors rule for when message of game error is LibMsg <cannot insert into something not a container>: now game error is failing.
A categorizing errors rule for when message of game error is LibMsg <cannot insert into closed containers>: now game error is failing.
A categorizing errors rule for when message of game error is LibMsg <need to take off before inserting>: now game error is failing.
A categorizing errors rule for when message of game error is LibMsg <cannot insert something into itself>: now game error is failing.
A categorizing errors rule for when message of game error is LibMsg <cannot put something not held>: now game error is failing.
A categorizing errors rule for when message of game error is LibMsg <cannot put something on itself>: now game error is failing.
A categorizing errors rule for when message of game error is LibMsg <cannot put onto something not a supporter>: now game error is failing.
A categorizing errors rule for when message of game error is LibMsg <cannot put onto something being carried>: now game error is failing.
A categorizing errors rule for when message of game error is LibMsg <need to empty into a container>: now game error is failing.
A categorizing errors rule for when message of game error is LibMsg <need to empty into something open>: now game error is failing.
A categorizing errors rule for when message of game error is LibMsg <already empty>: now game error is re-attempting;  now game error is futile; now game error is failing.
A categorizing errors rule for when message of game error is LibMsg <empty something into itself>: now game error is futile; now game error is failing.
A categorizing errors rule for when message of game error is LibMsg <cannot give what you have not got>: now game error is failing; now game error is civilized.
A categorizing errors rule for when message of game error is LibMsg <cannot give to yourself>: now game error is failing; now game error is civilized.
A categorizing errors rule for when message of game error is LibMsg <unable to receive things>: 
A categorizing errors rule for when message of game error is LibMsg <cannot show what you have not got>: now game error is failing; now game error is civilized.
A categorizing errors rule for when message of game error is LibMsg <cannot enter something already entered>: now game error is failing; now game error is re-attempting;  now game error is futile.
A categorizing errors rule for when message of game error is LibMsg <cannot enter something not enterable>: now game error is failing.
A categorizing errors rule for when message of game error is LibMsg <cannot enter closed containers>: now game error is failing.
A categorizing errors rule for when message of game error is LibMsg <cannot enter something carried>: now game error is failing.
A categorizing errors rule for when message of game error is LibMsg <cannot exit when not within anything>: now game error is failing.
A categorizing errors rule for when message of game error is LibMsg <cannot exit closed containers>: now game error is failing.
A categorizing errors rule for when message of game error is LibMsg <cannot get off things>: now game error is failing.
A categorizing errors rule for when message of game error is LibMsg <cannot go that way>: now game error is failing.
A categorizing errors rule for when message of game error is LibMsg <cannot travel in something not a vehicle>: now game error is failing.
A categorizing errors rule for when message of game error is LibMsg <cannot go through concealed doors>: now game error is failing.
A categorizing errors rule for when message of game error is LibMsg <cannot go up through closed doors>: now game error is failing.
A categorizing errors rule for when message of game error is LibMsg <cannot go down through closed doors>: now game error is failing.
A categorizing errors rule for when message of game error is LibMsg <cannot go through closed doors>: now game error is failing.
A categorizing errors rule for when message of game error is LibMsg <nothing through door>: now game error is involving-nothing.
A categorizing errors rule for when message of game error is LibMsg <brief look mode>: now game error is out of world; now game error is action acknowledgement; now game error is bodily-senses.
A categorizing errors rule for when message of game error is LibMsg <superbrief look mode>: now game error is out of world; now game error is action acknowledgement; now game error is bodily-senses.
A categorizing errors rule for when message of game error is LibMsg <verbose look mode>: now game error is out of world; now game error is action acknowledgement; now game error is bodily-senses.
A categorizing errors rule for when message of game error is LibMsg <top line what on>: now game error is out of world; now game error is action acknowledgement.
A categorizing errors rule for when message of game error is LibMsg <top line what in>: now game error is out of world; now game error is action acknowledgement.
A categorizing errors rule for when message of game error is LibMsg <top line what as>: now game error is out of world; now game error is action acknowledgement.
A categorizing errors rule for when message of game error is LibMsg <say things within>: now game error is out of world.
A categorizing errors rule for when message of game error is LibMsg <say things also within>: now game error is out of world.
A categorizing errors rule for when message of game error is LibMsg <say things on>: now game error is out of world.
A categorizing errors rule for when message of game error is LibMsg <examine undescribed things>: now game error is bodily-senses.
A categorizing errors rule for when message of game error is LibMsg <examine direction>: now game error is bodily-senses.
A categorizing errors rule for when message of game error is LibMsg <examine devices>: now game error is bodily-senses.
A categorizing errors rule for when message of game error is LibMsg <cannot search unless container-supporter>: now game error is failing.
A categorizing errors rule for when message of game error is LibMsg <cannot search closed opaque containers>: now game error is failing.
A categorizing errors rule for when message of game error is LibMsg <nothing found within container>: now game error is involving-nothing.
A categorizing errors rule for when message of game error is LibMsg <nothing found on top of>: now game error is involving-nothing.
A categorizing errors rule for when message of game error is LibMsg <look under>: now game error is bodily-senses.
A categorizing errors rule for when message of game error is LibMsg <cannot open unless openable>: now game error is failing.
A categorizing errors rule for when message of game error is LibMsg <cannot open something locked>: now game error is failing.
A categorizing errors rule for when message of game error is LibMsg <cannot open something already open>: now game error is failing; now game error is re-attempting;  now game error is futile.
A categorizing errors rule for when message of game error is LibMsg <reveal any newly visible exterior initial text>: 
A categorizing errors rule for when message of game error is LibMsg <no newly visible exterior>: now game error is involving-nothing.
A categorizing errors rule for when message of game error is LibMsg <cannot close unless openable>: now game error is failing.
A categorizing errors rule for when message of game error is LibMsg <cannot close something already closed>: now game error is failing; now game error is re-attempting;  now game error is futile.
A categorizing errors rule for when message of game error is LibMsg <cannot lock without a lock>: now game error is failing.
A categorizing errors rule for when message of game error is LibMsg <cannot lock something already locked>: now game error is failing; now game error is re-attempting;  now game error is futile.
A categorizing errors rule for when message of game error is LibMsg <cannot lock something open>: now game error is failing.
A categorizing errors rule for when message of game error is LibMsg <cannot lock without the correct key>: now game error is failing.
A categorizing errors rule for when message of game error is LibMsg <cannot unlock without a lock>: now game error is failing.
A categorizing errors rule for when message of game error is LibMsg <cannot unlock something already unlocked>: now game error is failing; now game error is re-attempting;  now game error is futile.
A categorizing errors rule for when message of game error is LibMsg <cannot unlock without the correct key>: now game error is failing.
A categorizing errors rule for when message of game error is LibMsg <cannot switch on unless switchable>: now game error is failing.
A categorizing errors rule for when message of game error is LibMsg <cannot switch on something already on>: now game error is failing; now game error is re-attempting;  now game error is futile.
A categorizing errors rule for when message of game error is LibMsg <cannot switch off unless switchable>: now game error is failing.
A categorizing errors rule for when message of game error is LibMsg <cannot switch off something already off>: now game error is failing; now game error is re-attempting;  now game error is futile.
A categorizing errors rule for when message of game error is LibMsg <cannot wear something not clothing>: now game error is failing.
A categorizing errors rule for when message of game error is LibMsg <cannot wear not holding>: now game error is failing.
A categorizing errors rule for when message of game error is LibMsg <cannot wear something already worn>: now game error is failing; now game error is re-attempting;  now game error is futile.
A categorizing errors rule for when message of game error is LibMsg <cannot take off something not worn>: now game error is failing.
A categorizing errors rule for when message of game error is LibMsg <cannot eat unless edible>: now game error is failing; now game error is bodily-senses.
A categorizing errors rule for when message of game error is LibMsg <cannot wave something not held>: now game error is failing; now game error is physically-vigorous.
A categorizing errors rule for when message of game error is LibMsg <squeezing people>: now game error is physically-vigorous; now game error is civilized.
A categorizing errors rule for when message of game error is LibMsg <throw at inanimate object>: now game error is physically-vigorous.
A categorizing errors rule for when message of game error is LibMsg <not pushed in a direction>: now game error is physically-vigorous.
A categorizing errors rule for when message of game error is LibMsg <pushed in illegal direction>: now game error is physically-vigorous.
A categorizing errors rule for when message of game error is LibMsg <cannot push something fixed in place>: now game error is failing;  now game error is futile; now game error is physically-vigorous.
A categorizing errors rule for when message of game error is LibMsg <cannot pull something fixed in place>: now game error is failing;  now game error is futile; now game error is physically-vigorous.
A categorizing errors rule for when message of game error is LibMsg <cannot turn something fixed in place>: now game error is failing;  now game error is futile.
A categorizing errors rule for when message of game error is LibMsg <cannot push scenery>: now game error is failing; now game error is physically-vigorous.
A categorizing errors rule for when message of game error is LibMsg <cannot pull scenery>: now game error is failing;  now game error is physically-vigorous.
A categorizing errors rule for when message of game error is LibMsg <cannot turn scenery>: now game error is failing.
A categorizing errors rule for when message of game error is LibMsg <cannot push people>: now game error is failing; now game error is physically-vigorous.
A categorizing errors rule for when message of game error is LibMsg <cannot pull people>: now game error is failing; now game error is physically-vigorous.
A categorizing errors rule for when message of game error is LibMsg <cannot turn people>: now game error is failing.
A categorizing errors rule for when message of game error is LibMsg <telling yourself>: now game error is conversational; now game error is civilized.
A categorizing errors rule for when message of game error is LibMsg <block giving>: now game error is blocked; now game error is civilized.
A categorizing errors rule for when message of game error is LibMsg <block showing>: now game error is blocked; now game error is civilized.
A categorizing errors rule for when message of game error is LibMsg <block vaguely going>: now game error is blocked.
A categorizing errors rule for when message of game error is LibMsg <block drinking>: now game error is blocked; now game error is bodily-senses.
A categorizing errors rule for when message of game error is LibMsg <block tasting>: now game error is blocked; now game error is bodily-senses.
A categorizing errors rule for when message of game error is LibMsg <block smelling>: now game error is blocked; now game error is bodily-senses.
A categorizing errors rule for when message of game error is LibMsg <block listening>: now game error is blocked; now game error is bodily-senses.
A categorizing errors rule for when message of game error is LibMsg <block saying yes>: now game error is blocked; now game error is conversational; now game error is civilized.
A categorizing errors rule for when message of game error is LibMsg <block saying no>: now game error is blocked; now game error is conversational; now game error is civilized.
A categorizing errors rule for when message of game error is LibMsg <block saying sorry>: now game error is blocked; now game error is conversational; now game error is civilized.
A categorizing errors rule for when message of game error is LibMsg <block swearing obscenely>: now game error is blocked; now game error is conversational; now game error is civilized.
A categorizing errors rule for when message of game error is LibMsg <block swearing mildly>: now game error is blocked; now game error is conversational; now game error is civilized.
A categorizing errors rule for when message of game error is LibMsg <block climbing>: now game error is blocked; now game error is physically-vigorous.
A categorizing errors rule for when message of game error is LibMsg <block jumping>: now game error is blocked; now game error is physically-vigorous.
A categorizing errors rule for when message of game error is LibMsg <block jumping over>: now game error is blocked; now game error is physically-vigorous.
A categorizing errors rule for when message of game error is LibMsg <block swimming>: now game error is blocked; now game error is physically-vigorous.
A categorizing errors rule for when message of game error is LibMsg <block swinging>: now game error is blocked; now game error is physically-vigorous.
A categorizing errors rule for when message of game error is LibMsg <block waving hands>: now game error is blocked; now game error is physically-vigorous.
A categorizing errors rule for when message of game error is LibMsg <block attacking>: now game error is blocked; now game error is physically-vigorous.
A categorizing errors rule for when message of game error is LibMsg <block blowing>: now game error is blocked; now game error is physically-vigorous.
A categorizing errors rule for when message of game error is LibMsg <block burning>: now game error is blocked; now game error is physically-vigorous.
A categorizing errors rule for when message of game error is LibMsg <block cutting>: now game error is blocked; now game error is physically-vigorous.
A categorizing errors rule for when message of game error is LibMsg <block digging>: now game error is blocked; now game error is physically-vigorous.
A categorizing errors rule for when message of game error is LibMsg <block filling>: now game error is blocked.
A categorizing errors rule for when message of game error is LibMsg <block rubbing>: now game error is blocked; now game error is physically-vigorous.
A categorizing errors rule for when message of game error is LibMsg <block set>: now game error is blocked.
A categorizing errors rule for when message of game error is LibMsg <block setting to>: now game error is blocked.
A categorizing errors rule for when message of game error is LibMsg <block tying>: now game error is blocked; now game error is physically-vigorous.
A categorizing errors rule for when message of game error is LibMsg <block throwing at>: now game error is blocked; now game error is physically-vigorous.
A categorizing errors rule for when message of game error is LibMsg <block pushing in directions>: now game error is blocked; now game error is physically-vigorous.
A categorizing errors rule for when message of game error is LibMsg <block answering>: now game error is blocked; now game error is conversational; now game error is civilized.
A categorizing errors rule for when message of game error is LibMsg <block asking>: now game error is blocked; now game error is conversational; now game error is civilized.
A categorizing errors rule for when message of game error is LibMsg <block buying>: now game error is blocked; now game error is civilized.
A categorizing errors rule for when message of game error is LibMsg <block kissing>: now game error is blocked; now game error is civilized.
A categorizing errors rule for when message of game error is LibMsg <block praying>: now game error is blocked; now game error is civilized.
A categorizing errors rule for when message of game error is LibMsg <block singing>: now game error is blocked; now game error is civilized.
A categorizing errors rule for when message of game error is LibMsg <block telling>: now game error is blocked; now game error is conversational; now game error is civilized.
A categorizing errors rule for when message of game error is LibMsg <block thinking>: now game error is blocked; now game error is civilized.
A categorizing errors rule for when message of game error is LibMsg <block player consulting>: now game error is blocked; now game error is civilized.
A categorizing errors rule for when message of game error is LibMsg <block npc consulting>: now game error is blocked; now game error is civilized.
A categorizing errors rule for when message of game error is LibMsg <block sleeping>: now game error is blocked; now game error is bodily-senses.
A categorizing errors rule for when message of game error is LibMsg <block waking up>: now game error is blocked; now game error is bodily-senses.
A categorizing errors rule for when message of game error is LibMsg <block waking other>: now game error is blocked; now game error is bodily-senses.
A categorizing errors rule for when message of game error is LibMsg <report npc taking inventory>: now game error is action acknowledgement.
A categorizing errors rule for when message of game error is LibMsg <report player taking>: now game error is action acknowledgement.
A categorizing errors rule for when message of game error is LibMsg <report npc taking>: now game error is action acknowledgement.
A categorizing errors rule for when message of game error is LibMsg <report player removing>: now game error is action acknowledgement.
A categorizing errors rule for when message of game error is LibMsg <report npc removing>: now game error is action acknowledgement.
A categorizing errors rule for when message of game error is LibMsg <report player dropping>: now game error is action acknowledgement.
A categorizing errors rule for when message of game error is LibMsg <report npc dropping>: now game error is action acknowledgement.
A categorizing errors rule for when message of game error is LibMsg <report player inserting>: now game error is action acknowledgement.
A categorizing errors rule for when message of game error is LibMsg <report npc inserting>: now game error is action acknowledgement.
A categorizing errors rule for when message of game error is LibMsg <report player putting on>: now game error is action acknowledgement.
A categorizing errors rule for when message of game error is LibMsg <report npc putting on>: now game error is action acknowledgement.
A categorizing errors rule for when message of game error is LibMsg <report player giving>: now game error is civilized; now game error is action acknowledgement.
A categorizing errors rule for when message of game error is LibMsg <report npc giving>: now game error is civilized; now game error is action acknowledgement.
A categorizing errors rule for when message of game error is LibMsg <report player entering>: now game error is action acknowledgement.
A categorizing errors rule for when message of game error is LibMsg <report npc entering>: now game error is action acknowledgement.
A categorizing errors rule for when message of game error is LibMsg <report player exiting>: now game error is action acknowledgement.
A categorizing errors rule for when message of game error is LibMsg <report npc exiting>: now game error is action acknowledgement.
A categorizing errors rule for when message of game error is LibMsg <report npc looking>: now game error is bodily-senses; now game error is action acknowledgement.
A categorizing errors rule for when message of game error is LibMsg <report npc examining>: now game error is bodily-senses; now game error is action acknowledgement.
A categorizing errors rule for when message of game error is LibMsg <report npc searching>: now game error is action acknowledgement.
A categorizing errors rule for when message of game error is LibMsg <report npc looking under>: now game error is bodily-senses; now game error is action acknowledgement.
A categorizing errors rule for when message of game error is LibMsg <report player opening>: now game error is action acknowledgement.
A categorizing errors rule for when message of game error is LibMsg <report npc opening>: now game error is action acknowledgement.
A categorizing errors rule for when message of game error is LibMsg <report player closing>: now game error is action acknowledgement.
A categorizing errors rule for when message of game error is LibMsg <report npc closing>: now game error is action acknowledgement.
A categorizing errors rule for when message of game error is LibMsg <report player locking>: now game error is action acknowledgement.
A categorizing errors rule for when message of game error is LibMsg <report npc locking>: now game error is action acknowledgement.
A categorizing errors rule for when message of game error is LibMsg <report player unlocking>: now game error is action acknowledgement.
A categorizing errors rule for when message of game error is LibMsg <report npc unlocking>: now game error is action acknowledgement.
A categorizing errors rule for when message of game error is LibMsg <report player switching on>: now game error is action acknowledgement.
A categorizing errors rule for when message of game error is LibMsg <report npc switching on>: now game error is action acknowledgement.
A categorizing errors rule for when message of game error is LibMsg <report player switching off>: now game error is action acknowledgement.
A categorizing errors rule for when message of game error is LibMsg <report npc switching off>: now game error is action acknowledgement.
A categorizing errors rule for when message of game error is LibMsg <report player wearing>: now game error is action acknowledgement.
A categorizing errors rule for when message of game error is LibMsg <report npc wearing>: now game error is action acknowledgement.
A categorizing errors rule for when message of game error is LibMsg <report player taking off>: now game error is action acknowledgement.
A categorizing errors rule for when message of game error is LibMsg <report npc taking off>: now game error is action acknowledgement.
A categorizing errors rule for when message of game error is LibMsg <report player eating>: now game error is bodily-senses; now game error is action acknowledgement.
A categorizing errors rule for when message of game error is LibMsg <report npc eating>: now game error is bodily-senses; now game error is action acknowledgement.
A categorizing errors rule for when message of game error is LibMsg <report player touching things>: now game error is bodily-senses; now game error is action acknowledgement.
A categorizing errors rule for when message of game error is LibMsg <report npc touching things>: now game error is bodily-senses; now game error is action acknowledgement.
A categorizing errors rule for when message of game error is LibMsg <report player touching self>: now game error is bodily-senses; now game error is action acknowledgement.
A categorizing errors rule for when message of game error is LibMsg <report npc touching self>: now game error is bodily-senses; now game error is action acknowledgement.
A categorizing errors rule for when message of game error is LibMsg <report player touching other people>: now game error is bodily-senses; now game error is action acknowledgement.
A categorizing errors rule for when message of game error is LibMsg <report npc touching other people>: now game error is bodily-senses; now game error is action acknowledgement.
A categorizing errors rule for when message of game error is LibMsg <report player waving things>: now game error is physically-vigorous; now game error is action acknowledgement.
A categorizing errors rule for when message of game error is LibMsg <report npc waving things>: now game error is physically-vigorous; now game error is action acknowledgement.
A categorizing errors rule for when message of game error is LibMsg <report player squeezing>: now game error is physically-vigorous; now game error is action acknowledgement.
A categorizing errors rule for when message of game error is LibMsg <report npc squeezing>: now game error is physically-vigorous; now game error is action acknowledgement.
A categorizing errors rule for when message of game error is LibMsg <report player pushing>: now game error is physically-vigorous; now game error is action acknowledgement.
A categorizing errors rule for when message of game error is LibMsg <report npc pushing>: now game error is physically-vigorous; now game error is action acknowledgement.
A categorizing errors rule for when message of game error is LibMsg <report player pulling>: now game error is physically-vigorous; now game error is action acknowledgement.
A categorizing errors rule for when message of game error is LibMsg <report npc pulling>: now game error is physically-vigorous; now game error is action acknowledgement.
A categorizing errors rule for when message of game error is LibMsg <report player turning>: now game error is action acknowledgement.
A categorizing errors rule for when message of game error is LibMsg <report npc turning>: now game error is action acknowledgement.
A categorizing errors rule for when message of game error is LibMsg <report player waiting>: now game error is action acknowledgement.
A categorizing errors rule for when message of game error is LibMsg <report npc waiting>: now game error is action acknowledgement.


Grouped Messages As Dialogue ends here.

---- DOCUMENTATION ----

Chapter :  Errors As Dialogue

Section : Purpose

It is said there are at least four people present in every interactive fiction:  the human player, his character the protagonist, the author as narrator, and the computer as the parser.  This extension's aim is to thin the crowd.  Although extensions such as David Fisher's excellent "Default Messages" and "Custom Library Messages" -- on which this is heavily based -- allow changing Inform's built-in messages and errors, they cannot easily change them during play.  Hence, cloaking parser errors and action acknowledgements in an NPC's responses is generally limited to NPCs who accompany the player at all times.  Due to this limitation, it came to be known that such error messages are a fine way to characterize the PC.  But now, they can characterize NPCs as well.

This extension allows two things.  One, the responses for all error messages and action acknowledgements can be changed from one character or narrative voice to another at the flick of a switch.  There is no processing overhead for this switch, and it is possible that even the switch itself can be automated.  Two, the act of printing a particular message is now a rule rather than a static string, so a great deal of declarative processing -- Inform 7's strength -- can be brought to bear.  Want to have a character comment on seeing the player make an entire series of actions and attempts?  No problem.  Hint system need some data to analyze?  Easy.  Need the primary antagonist to learn by watching the player's trials and tribulations?  Here's some hooks.

And here's how it works.

Section : Basic Usage

Every set of responses is wrapped in a rulebook, with a default value of success, and assigned to a character's "observations" property:
	*: Alice's responses are a rulebook.  Alice's responses have default success. The observations of Alice are Alice's responses rulebook.

And each rule within recognizes and responds, either to a particular error, or to a group of them:
	*:Rule for Alice's responses when asking which do you mean:
		say "'Sure! Would you like [a prepared list delimited in disjunctive style]?'".
	
	Rule for Alice's responses when printing a parser error:
		if the parser error is only understood as far as, say "'I can [parser-understood words], but I'm not sure about [parser-confusing words],' she says.";
		otherwise continue the action.
	
	Rule for Alice's responses when the message of the game error is LibMsg <report player taking> and when the noun is the black puppy: 
		say "'Smokey bites,' she warns.".
	
	Rule for Alice's responses when the message of the game error is LibMsg <report player taking>: 
		say "Alice hands you [the noun]. 'Need anything else?'[line break]".
	

The variable "observer" is the person who will be commenting on the action. We could do worse than keeping this in sync with "the current interlocutor" from Eric Eve's conversation extensions.  We must be sure to initialize it to someone when play begins.
	*: The observer is Alice.

If a character's response rules fail, then this extension will consult "the default errors rulebook".  Rules we put into here are used for everyone if a particular character doesn't have anything to say for a particular situation.  And if the default errors rulebook fails, the standard Inform 6 messages are used.  So, we can put rules in the default errors rulebook which will override Inform's defaults but censors itself in lieu of a character's specific response.  
	*: Rule for default errors when game error is LibMsg <empty line>:
		say "Dear reader, this is the 'command prompt'.  Here is when and where you type in what you would like your character to do.".


(NOTE: We have two known limitations.  One, it seems that rules depending on Activities need to be listed before any "when the message of the game error is" rules.  Two, we must never set Game Error directly; always use one of the Observe phrases shown below.)

Section : Grouping Messages Together

The various error and acknowledgement messages are grouped together so multiple situations can be overridden together, as in:
	*: Rule for Alice's error when game error is failing not out of world:
		say "'Let me know if I can help you with any of that,' says Alice.".

The groups are declared as a "can be" property on the library-message kind.  (The Game Error is an object of that kind.)  The pre-existing ones are:

	* out of world - A character would have to break the fourth wall to remark on one of these.
	* action acknowledgement - "Taken" and other such successful actions.
	* failing - an action stopped, usually because of some sort of "cannot" rule.
	* futile - searching in the dark, doing something already done, emptying something into itself, etc.  Not all actions that fail are futile.  Attempting to open a locked door would fail, but the attempt wasn't futile.  How are we to know a door's locked until we try it? 
	* re-attempting - doing something already done is always a futile activity, but not all futile activies involve re-doing something.
	* blocked - blocked actions.  See the Actions index for the actions which do nothing unless rules intervene.
	* darkness-involving - self-explanatory.
	* parser-erroring - the built-in parser errors.
	* parser-modal - the parser is in a special mode, such as waiting for a disambig. answer, a Yes/No answer, a menu selection, a SPACE to continue, etc.
	* answer-awaiting - a subset of parser-modal: a disambig answer, yes/no, or menu selection.
	* physically-vigorous - Climbing, jumping, attacking, etc.   Indiana-Jones kind of stuff. 
	* bodily-senses - taste, listen, sleep, etc.
	* civilized - giving, showing, asking, saying, telling, kissing, hugging, and all conversation.  Sadly, a smaller list than Indiana's. 
	* conversational - a subset of civilized, and including the answer-awaiting parser problems.
	* involving-nothing - self-explanatory, and probably futile, too.

We can freely add and modify groups as well.  See chapter two, below.

Section : Yes and No 

We can override the <block saying yes> and <block saying no> errors same as any other, but we now have some additional functionality for deciding the effects of these two words for any particular usage. The phrases used to point these answers to a rule (or rulebook) are:

	Yes is (a rule);
	No  is (a rule); 
	Yes is (a rule) and ignored;
	No  is (a rule) and ignored; 

If our prose ever asks a yes/no question of our player, we can point the answers to the appropriate effects in this way.  The "and ignored" bit means it will not terminate an existing Which question (see section below: NPCs cause parser errors on purpose).  When we're done (either because one was called, or our player chose some third option), we can reset them so that future use will once again trigger their respective <block> messages. 

	reset yes and no;

Section : Other Handy Phrases to be Found in Error Messages

We can invoke a message manually, and frequently need to for home-made messages.  We use one of these phrases, knowing that the Observer will be used if no character is specified. There are also equivalent say-phrase versions of these:
	Bob observes LibMsg <ok>;
	observe LibMsg <ok>;
	Alice observes the game error;
	observe the game error;
	if LibMsg <ok> is observed, stop the action; otherwise say "LibMsg <ok> not handled.".


We can have one character defer to another for particular messages, or say something else if they "cannot defer to" because the other character is not in the location:
	Rule for Bob's error when message of game error is LibMsg <report player taking> and when the noun is the black puppy:
	     say "'[']Ey Alice! What'dya say [']bout Smokey?'[line break]";
	     if cannot defer to Alice, say "'Ah she can't hear me.'".

There are also say-phrase and non-conditional versions of deferring:
	defer to Alice;


The Which Do You Mean activity allows the say phrase "prepared list delimited in ... style" from Emily Short's Complex Listing extension.  This extension is automatically included.

The Understand As Far As parser error defines two say phrases:  "parser-understood words", as the player's command that it can understand, and "parser-confusing words", as the rest that it didn't. 

Finally, a few miscellaneous phrases, which are identical to their Default Message extension counterparts.  "The main object" is frequently the noun, actor, or direction in question. Also look for "the number understood".  "What's on the object" is a say phrase for listing the contents of the main object.  "What's inside the object part 2" is similar.  And "What's inside the object part 1" is a say phrase for the subject of a sentence that will describe the contents of the main object. 


Chapter : New Ways To Respond

Section : Adding New Actions and Responses

New actions and new parser errors can always be created in a work, and it's easy to hook them into this system.  First, give the new situation a name, by adding it to this single-column table:
	*: Table of library messages (continued)
	Message Id
	LibMsg <my first hook>

New actions in particular will require the Observe phrases (from the Handy Messages section above) in their first report rule.  When it returns true, then someone (or something), somewhere, just commented on our new action, so the rest of our action's report rules can probably be skipped.
	*: The first report an actor innovating:
		if LibMsg <my first hook> is observed, stop the action.

And now we can write the rule to do whatever magic for each character.  Of course, putting a rule into the Default Errors rulebook is probably a good idea as well, for testing purposes if nothing else.  Obviously, there is not an Inform 6 built-in message for our new situation.
	*: Rule for Alice's responses when game error is LibMsg <my first hook>:
		say "'Oh! The most curious thought just struck me,' says Alice.";
		fetch brilliant idea for Alice;
		consider the scene changing rules.

	*: Rule for default errors when message of game error is LibMsg <my first hook>:
		say "[message of game error] STILL UNWRITTEN FOR [observer]!".

Many times, what is entered at the command prompt will produce absolutely no change in the game, but when spoken to a character, should still invoke a tailored response.  With the appropriate rules in each character's observations errorbook, here is an example of how to handle such a thing succintly:
	*: Table of library messages (continued)
	Message Id
	LibMsg <ok>
	LibMsg <please>
	LibMsg <thanks>

	Understand "ok" or "okay" as a mistake ("[observe LibMsg <ok>]"). 
	Understand "please" as a mistake ("[observe LibMsg <please>]"). 
	Understand "thanks" or "thank you" as a mistake ("[observe LibMsg <thanks>]"). 
	
	Rule for default errors when the message of the game error is LibMsg <ok>: say "You get a nod in reply.".
	Rule for default errors when the message of the game error is LibMsg <please>: say "'But of course.'".
	Rule for default errors when the message of the game error is LibMsg <thanks>: say "'Your welcome.'".

Even if one particular character is a stickler on manners, how she personally processes them need not complicate the work in general.

Finally, and optionally, we can put our new messages into the pre-existing groups.
	*: A categorizing errors rule for when message of game error is LibMsg <ok>: now game error is conversational; now game error is civilized.
	A categorizing errors rule for when message of game error is LibMsg <please>: now game error is conversational; now game error is civilized.
	A categorizing errors rule for when message of game error is LibMsg <thanks>: now game error is conversational; now game error is civilized.

Section : Adding Groups

When an error occurs, the categorizing errors rulebook is called, which has one error per rule, and sets the appropriate categories for each.  We can add our new error messages to this rulebook, and we can also create new categories if we like.  
	
New groups can be created thusly:
	*: A library-message can be something-special.
	
	First categorizing errors rule (this is the reset my new error categories rule):
		now game error is not something-special;
	
We categorize new messages same way we categorize them into existing groups:
	*: A categorizing errors rule for when message of game error is LibMsg <ok>: now game error is conversational; now game error is civilized; now game error is not something-special.
	A categorizing errors rule for when message of game error is LibMsg <please>: now game error is conversational; now game error is civilized; now game error is not something-special.
	A categorizing errors rule for when message of game error is LibMsg <thanks>: now game error is conversational; now game error is civilized; now game error is not something-special.

We categorize existing error messages by adding a second rule that applies to them.  We can also remove them from their pre-existing categories:
	*: 	A categorizing errors rule for when message of game error is LibMsg <Inventory no possessions>: now game error is something-special; now game error is not involving-nothing.

Try it out:
	*: A default errors rule when the game error is involving-nothing: say "(There's a whole lot of nothing around here.)".
	A default errors rule when the game error is something-special: say "Well isn't that special.".
	
	Test me with " i / please / ok / thank you ". 


Section : NPCs Cause Parser Errors to Ask Questions

Conversation frequently involves people taking turns speaking, and ending one's speech with a question is an obvious way to flag the listener of her turn to speak.  It's also a subtle way to guide a person toward or away from certain subjects.  In this way, the below Ask routines are handy within the NPCs' errorbooks as a way to guide the player away from the less simulated portions of the game, and toward the more interesting portions.

So while we're overriding the response to Which Do You Mean, consider this:  "which" is the most basic question word of English.  All others are defined in terms of it:  "who" asks which person, "what" asks which noun, "how much" asks which number and unit, "how many" asks which whole number, etc.  The Which Do You Mean activity is actually a very general question-asking routine, and nicely sets up the parser to understand a direct answer, or ignore the question entirely if our player wishes, without any additional work. This extension provides an "ask" phrase to our NPCs which causes this particular parser error on purpose. The main variations are:

	(a person) ask/asks (some text); 
	(a person) ask/asks (some text) expecting/including (a description);
	(a person) ask/asks (some text) excluding/except (a description);
	(a person) ask/asks (some text) expecting/including (a description) excluding/except (a description);

The person that begins each is optional.  If dropped, the observer is used, which is handy since this phrase will most likely be used within someone's observations errorbook.  Also, these can be used either as statements or as conditions in an if statement, because it is possible the descriptions we feed it may result in no objects.  If no objects are the case, the quotation fed to the routine is not printed, and Yes and No are reset.  Here's the relevant excerpt from the examples section below:

	*: Rule for Bob's error when game error is LibMsg <report player taking>: 
		say "'[']ere ya go.' Bob hands you [the noun].  ";
		if ask "'Can ya think of anything ya might also need?'" expecting anything except things carried by the player begin;
			Yes is the Whazzat rule  and ignored;
			No  is the Said No To Need Anything Else rule; 
			now the verb word is "take";
		end if;
		say line break.

This particular bit of code asks for any thing in the shop, will say whatever's in the Whazzat rule but otherwise ignore a Yes, and No will terminate the question with saying whatever is in the Said No To Need Anything rule.  We currently must set the verb word to the action Bob is essentially asking us to do:  take another object from his store shelves, in this example. However, it can be set to other verbs; whichever is appropriate for what the NPC's prose is asking about.

Note that this code will not print whatever Which Do You Mean phrase Bob always uses -- the quotation passed to Ask is the last thing printed.  Moreover, Which Do You Mean will not activate when the player answers -- by then the question is already answered.  We should merely know that that activity is happening behind the scenes (and upon a property called "relevant/irrelevant") in case a particular project's own code needs to engage the activity further.

Section : Multiple Narrative Tones, or, Who Gets To Respond

To recap, the rulebook assigned to a character's observations property takes precedence, and if it doesn't succeed in producing something, the default errors rulebook is consulted for a basic but still game-specific handling, and if -it- fails, the built-in Inform response is used. 

Unless we change this. 

"The observer finder rulebook" decides this heirarchy. It is a simple book of only two rules, "Consult Character's Errorbook" and "Consult Default Errorbook", in that order. ("Consult Default Errorbook" is the Last rule of the book.)  Unlike a character's observations errorbook which runs at most one rule, the observer finder rulebook runs all its rules until something succeeds.  Adding rules here is a good way for the extension to consider our newly-written response packages that aren't tied to a particular character.  For example, we could write several author-as-narrator packages, each in a different tone. First, we modify the observer finder rules:
	*: Narrative tone is a rulebook that varies. 

	This is the Consult Narrative Tone rule: 
		if using errors as dialogue debugging option, say "// 'Observer Finder' consults tone [the narrative tone]."; 
		abide by the narrative tone.
	
	The Consult Narrative Tone rule is listed first in the observer finder rulebook.

Then we start creating our packages:	
	*: Silly is a rulebook. Silly has default success. 
	Rule for silly when game error is LibMsg <report player taking>: say "Yoink!".

Finally assign one of those packages its task:	
	*: When play begins: now narrative tone is silly;

And if we'd like to see our modified observer finder rulebook in action, we can include this statement in our project:
	*: Use   Grouped Messages As Dialogue   debugging.

Section : A Changing of the Guard

The observer finder rulebook is not called directly by the low-level processing code.  Rather, a simple variable, the rulebook-that-varies called "the current errorbook", is considered.  Pointing this to a rulebook to our own devising is trivial, but know that we will lose automatic calling of the default errors rulebook by doing so.  Still, it may useful to use the observer finder rulebook's heirarchy in only portions of the game, and we can always set the current errorbook to the observer finder or default errors rulebooks at any time. 

Chapter : Credits

This extension would not be possible without the technical assistance and code of David Fisher and Emily Short.  I thank them for their incredibly useful extensions and bits of code.  Their specific pieces are highlighted within this extension's source, in the section headers.  Also thanks to JDC and ??? from the raif newsgroup for a particular coding trick which made NPC Asks possible.

Chapter : Reference List of Supported Errors and Messages 

These are identical to David Fisher's extensions, with a few exceptions. Any tag that included the conjunctions "and" or "or" was renamed to exclude such conjunctions -- they use a hyphen in place of the conjunction.  A couple of exceptional cases in his code were refactored to work within the normal framework.  And LibMsg <no error> was added as a base case. 

Most block and report messages are together at the bottom of the list.

	LibMsg <no error> - Base Case. If this happens, it's a parser error or activity avoiding normal processing, or normal processing directly calling an errorbook.

Section : Fourth Wall Messages - out-of-world action acknowledgements

Fourth Wall messages include parser errors, game status, and other actions and acknowledgements that happen out-of-world.  If a character comments on them, he or she is breaking the fourth wall. 

Regarding Looking
	LibMsg <brief look mode> - The BRIEF command
	LibMsg <superbrief look mode> - The SUPERBRIEF command
	LibMsg <verbose look mode> - The VERBOSE command
	LibMsg <top line what on> - These three appear next to the bold-printed room name.
	LibMsg <top line what in>				
	LibMsg <top line what as>					
	LibMsg <yes-no prompt> - "Please answer yes or no."
	LibMsg <Pronouns initial text> - These three are for the PRONOUNS command: "At the moment, "
	LibMsg <Pronouns -means- text> - " means "
	LibMsg <Pronouns -unset- text>	- " is unset "			
	LibMsg <you have died>					
	LibMsg <you have won>					
	LibMsg <confirm Quit>					
	LibMsg <confirm Restart>
	LibMsg <Restart failed>					
	LibMsg <Restore failed>				
	LibMsg <Restore succeeded>				
	LibMsg <Save failed>					
	LibMsg <Save succeeded>				
	LibMsg <Verify succeeded>				
	LibMsg <Verify failed>					
	LibMsg <transcript already on>				
	LibMsg <transcript already off>				
	LibMsg <start of transcript>				
	LibMsg <end of transcript>				
	LibMsg <transcript failed>				
	LibMsg <end transcript failed>				
	LibMsg <Score command>
	LibMsg <score changed>	
	LibMsg <score notification turned on> - The NOTIFY ON command			
	LibMsg <score notification turned off> - The NOTIFY OFF command
	LibMsg <Full Score initial text>				
	LibMsg <Full Score items>				
	LibMsg <Full Score places>				
	LibMsg <Full Score total>				
	LibMsg <page prompt> - "[bracket]Please press SPACE.[close bracket]"
	LibMsg <menu prompt> - "Type a number from 1 to N, 0 to redisplay or press ENTER."
	LibMsg <restrict answer> - "Please give one of the answers above."
	LibMsg <undo succeeded>				
	LibMsg <undo failed>					
	LibMsg <undo not provided>				
	LibMsg <cannot undo nothing>				
	LibMsg <cannot undo twice in a row>			
	LibMsg <oops failed> - Abbreviation for OOPS is O
	LibMsg <oops too many arguments>			
	LibMsg <oops no arguments>				
	LibMsg <again usage> - Abbreviation for AGAIN is G
	LibMsg <cannot do again>
	LibMsg <command cut short> - An memory buffer overrun error, usually from the player's command being very long, results in this error: "(Since something dramatic has happened, your list of commands has been cut short.)"
	LibMsg <say things within>				
	LibMsg <say things also within>				
	LibMsg <say things on>						


Section : Fourth Wall Messages - parser errors

Most of these are already expressed through Inform 7, but we may like to keep all of a character's messages in the same place, and deal with them equally.
	LibMsg <noun out of context> - parser error is did not make sense in this context: "That noun did not make sense in this context."
	LibMsg <unimportant object> - parser error is not something you need to refer to: "That's not something you need to refer to in the course of this game." (Scenery objects)				
	LibMsg <empty line> - parser error is i beg your pardon: "I beg your pardon?"
	LibMsg <command not understood> - parser error is didn't understand: "I didn't understand that sentence."
	LibMsg <command partly understood> - parser error is only understood as far as: "I only understood you as far as wanting to [parser-understood words]"
	LibMsg <command badly ended>	- parser error is didn't understand the way that finished: "I didn't understand the way that finished."
	LibMsg <command incomplete> - parser error is said too little: "You seem to have said too little!"				
	LibMsg <number not understood> - parser error is didn't understand that number: "I didn't understand that number."			
	LibMsg <unknown object> - parser error is can't see any such thing: "You can't see any such thing."				
	LibMsg <object not held> - parser error is aren't holding that: "You aren't holding that!"
	LibMsg <unknown verb> - parser error is not a verb i recognise: "That's not a verb I recogni[s/z]e."
	LibMsg <verb cannot have inanimate object> - parser error is can only do that to something animate: "You can only do that to something animate."	
	LibMsg <verb cannot have multiple objects> - parser error is can't use multiple objects: "You can't use multiple objects with that verb."		
	LibMsg <too many multiple objects> - parser error is can only use multiple objects: "You can only use multiple objects once on a line."		
	LibMsg <not that many available> - parser error is not enough of those available: "None/Only [the number understood] of those is/are available."			
	LibMsg <no objects available> - parser error is not enough of those available: "There are none at all available!"				
	LibMsg <zero multiple objects> - parser error is nothing to do: "Nothing to do!"
	LibMsg <excepted object not included anyway> - parser error is excepted something not included: "You excepted something not included anyway!"
	LibMsg <pronoun not set> - parser error is not sure what it refers to: "I'm not sure what [the pronoun understood] refers to."
	LibMsg <pronoun absent> - parser error is can't see it at the moment: "You can't see [the pronoun understood] ([the main object]) at the moment."
	LibMsg <cannot begin at comma>			
	LibMsg <extra words before comma>			
	LibMsg <comment recorded>
	LibMsg <comment unrecorded>
	LibMsg <period newline>
	LibMsg <question newline>

Section : Quizzical Characters

As in the above documentation, our characters may cause parser errors on purpose, so that they may understand the context of their own questions.
	LibMsg <who disambiguation>				
	LibMsg <which disambiguation>				
	LibMsg <whom disambiguation>				
	LibMsg <what disambiguation>
	LibMsg <no pronouns known>				
	LibMsg <person ignores command>			
	LibMsg <cannot talk to absent person>			
	LibMsg <cannot talk to inanimate object>			
	LibMsg <Places initial text>				
	LibMsg <Objects initial text>				
	LibMsg <single object disambiguation>

Section : Perceptive Characters

Some actions fail because the player lacks a key. Some action fail because the player just remembered there isn't a door in the south wall.  In the latter case, the player-character would most likely only look south before checking himself, and only perceptive NPCs would be able to comment on what they're pretty sure he was thinking of doing. 
	LibMsg <first N objects>					
	LibMsg <report implicit take>				
	LibMsg <implicitly pass outwards through other barriers>	
	LibMsg <implicitly pass inwards through other barriers>	
	LibMsg <cannot drop clothes being worn>		
	LibMsg <cannot insert clothes being worn>		
	LibMsg <cannot put clothes being worn>			
	LibMsg <cannot exceed carrying capacity>		
	LibMsg <use holdall to avoid exceeding carrying capacity>	
	LibMsg <cannot insert if this exceeds carrying capacity>	
	LibMsg <cannot put if this exceeds carrying capacity>	
	LibMsg <cannot take yourself>				
	LibMsg <cannot take other people>			
	LibMsg <cannot take something you are within>		
	LibMsg <cannot take something already taken>		
	LibMsg <cannot take possessions of others>		
	LibMsg <cannot take component parts>			
	LibMsg <cannot take hidden parts>			
	LibMsg <cannot reach within closed containers>		
	LibMsg <cannot take scenery>				
	LibMsg <cannot take something fixed>			
	LibMsg <cannot reach within other places>		
	LibMsg <cannot remove from closed containers>		
	LibMsg <cannot remove something not within>		
	LibMsg <cannot drop something already dropped>	
	LibMsg <cannot drop not holding>			
	LibMsg <cannot insert something not held>		
	LibMsg <cannot insert into something not a container>	
	LibMsg <cannot insert into closed containers>		
	LibMsg <need to take off before inserting>		
	LibMsg <cannot insert something into itself>		
	LibMsg <cannot put something not held>			
	LibMsg <cannot put something on it-self>			
	LibMsg <cannot put onto something not a supporter>	
	LibMsg <cannot put onto something being carried>	
	LibMsg <need to empty into a container>			
	LibMsg <need to empty into something open>		
	LibMsg <already empty>					
	LibMsg <empty something into itself>			
	LibMsg <cannot give what you have not got>		
	LibMsg <cannot give to yourself>				
	LibMsg <unable to receive things>			
	LibMsg <cannot show what you have not got>		
	LibMsg <cannot enter something already entered>	
	LibMsg <cannot enter something not enterable>			
	LibMsg <cannot enter closed containers>			
	LibMsg <cannot enter something carried>		
	LibMsg <cannot exit when not within anything>		
	LibMsg <cannot exit closed containers>			
	LibMsg <cannot get off things>				
	LibMsg <cannot go that way>				
	LibMsg <cannot travel in something not a vehicle>	
	LibMsg <cannot go through concealed doors>		
	LibMsg <cannot go up through closed doors>		
	LibMsg <cannot go down through closed doors>		
	LibMsg <cannot go through closed doors>		
	LibMsg <nothing through door>				
	LibMsg <cannot search unless container-supporter>	
	LibMsg <cannot search closed opaque containers>	
	LibMsg <nothing found within container>			
	LibMsg <nothing found on top of>			
	LibMsg <fake newly visible exterior>					
	LibMsg <fake newly visible exterior nothing>						
	LibMsg <cannot open unless openable>			
	LibMsg <cannot open something locked>			
	LibMsg <cannot open something already open>			
	LibMsg <reveal any newly visible exterior initial text>	
	LibMsg <no newly visible exterior>			
	LibMsg <cannot close unless openable>			
	LibMsg <cannot close something already closed>		
	LibMsg <cannot lock without a lock>			
	LibMsg <cannot lock something already locked>		
	LibMsg <cannot lock something open>				
	LibMsg <cannot lock without the correct key>		
	LibMsg <cannot unlock without a lock>			
	LibMsg <cannot unlock something already unlocked>	
	LibMsg <cannot unlock without the correct key>		
	LibMsg <cannot switch on unless switchable>		
	LibMsg <cannot switch on something already on>		
	LibMsg <cannot switch off unless switchable>		
	LibMsg <cannot switch off something already off>		
	LibMsg <cannot wear something not clothing>		
	LibMsg <cannot wear not holding>				
	LibMsg <cannot wear something already worn>		
	LibMsg <cannot take off something not worn>		
	LibMsg <cannot eat unless edible>			
	LibMsg <cannot wave something not held>		
	LibMsg <throw at inanimate object>			
	LibMsg <not pushed in a direction>				
	LibMsg <pushed in illegal direction>			
	LibMsg <cannot push something fixed in place>		
	LibMsg <cannot pull something fixed in place>		
	LibMsg <cannot turn something fixed in place>		
	LibMsg <cannot push scenery>				
	LibMsg <cannot pull scenery>				
	LibMsg <cannot turn scenery>				
	LibMsg <cannot push people>				
	LibMsg <cannot pull people>					
	LibMsg <cannot turn people>				

Section : Involving darkness

	LibMsg <entering darkness>				
	LibMsg <dark description>				
	LibMsg <examine while dark>				
	LibMsg <search while dark>				
	LibMsg <look under while dark>				

Section : Involving conversation

	LibMsg <block showing>					
	LibMsg <block saying yes>				
	LibMsg <block saying no>				
	LibMsg <block saying sorry>					
	LibMsg <block swearing obscenely>			
	LibMsg <block swearing mildly>				
	LibMsg <block answering>				
	LibMsg <block asking>					
	LibMsg <block telling>					
	LibMsg <telling yourself>

Section : Involving others in a social or civilized context (as opposed to attacking)

Sadly missing from this list of standard I-F actions would be "selling", "offering", "accepting", "caretaking", "diagnosing", "healing", "accusing", "blessing", "dancing", etc.
	LibMsg <report player giving>				
	LibMsg <report npc giving>				
	LibMsg <block giving>
	LibMsg <block buying>
	LibMsg <block kissing>
	LibMsg <squeezing people> - hugging, presumably
	LibMsg <block waking other>

Section : In a social or civilized context, without involving others

	LibMsg <block praying>					
	LibMsg <block singing>					
	LibMsg <block thinking>					
	LibMsg <block player consulting>				
	LibMsg <block npc consulting>				

Section : Involving the senses and body needs

	LibMsg <block drinking>					
	LibMsg <block tasting>					
	LibMsg <block smelling>					
	LibMsg <block listening>					
	LibMsg <block sleeping>	
	LibMsg <block waking up>
	LibMsg <report player eating>				
	LibMsg <report npc eating>				
	LibMsg <report player touching things>			
	LibMsg <report npc touching things>			
	LibMsg <report player touching self>			
	LibMsg <report npc touching self>			
	LibMsg <report player touching other people>		
	LibMsg <report npc touching other people>		
	LibMsg <report npc looking>				
	LibMsg <report npc examining>				
	LibMsg <report npc looking under>			
	LibMsg <look under>					
	LibMsg <player self description>				
	LibMsg <examine undescribed things>			
	LibMsg <examine direction>				
	LibMsg <examine devices>			

Section : Mundane actions

While in the lobby of Life, we check our pockets while we wait:
	LibMsg <report npc taking inventory>
	LibMsg <Inventory initial text>				
	LibMsg <Inventory no possessions>						
	LibMsg <report player waiting>				
	LibMsg <report npc waiting>				
How about "fidget"?

Jacket and car keys:
	LibMsg <report player taking>				
	LibMsg <report npc taking>				
	LibMsg <report player removing>			
	LibMsg <report npc removing>					
	LibMsg <report player dropping>				
	LibMsg <report npc dropping>				
	LibMsg <report player wearing>				
	LibMsg <report npc wearing>				

Walking around:
	LibMsg <report npc searching>				
	LibMsg <block vaguely going>				
	LibMsg <report player entering>				
	LibMsg <report npc entering>				
	LibMsg <report player exiting>				
	LibMsg <report npc exiting>				

Section : Highly Physical actions for Indiana Jones

	LibMsg <block attacking>				
	LibMsg <block blowing>					
	LibMsg <block burning>					
	LibMsg <block climbing>						
	LibMsg <block cutting>					
	LibMsg <block digging>					
	LibMsg <block filling>					
	LibMsg <block jumping>					
	LibMsg <block jumping over>				
	LibMsg <block pushing in directions>			
	LibMsg <block rubbing>					
	LibMsg <block set>					
	LibMsg <block setting to>				
	LibMsg <block swimming>				
	LibMsg <block swinging>				
	LibMsg <block tying>					
	LibMsg <block throwing at>				
	LibMsg <block waving hands>				

Section : Devices and doodads

	LibMsg <report player inserting>				
	LibMsg <report npc inserting>				
	LibMsg <report player putting on>			
	LibMsg <report npc putting on>				
	LibMsg <report player opening>				
	LibMsg <report npc opening>				
	LibMsg <report player closing>				
	LibMsg <report npc closing>				
	LibMsg <report player locking>				
	LibMsg <report npc locking>				
	LibMsg <report player unlocking>			
	LibMsg <report npc unlocking>				
	LibMsg <report player switching on>			
	LibMsg <report npc switching on>			
	LibMsg <report player switching off>			
	LibMsg <report npc switching off>			
	LibMsg <report player taking off>			
	LibMsg <report npc taking off>				
	LibMsg <report player waving things>			
	LibMsg <report npc waving things>			
	LibMsg <report player squeezing>			
	LibMsg <report npc squeezing>				
	LibMsg <report player pushing>				
	LibMsg <report npc pushing>				
	LibMsg <report player pulling>				
	LibMsg <report npc pulling>				
	LibMsg <report player turning>				
	LibMsg <report npc turning>				

Thank you for reading.

Example: ** "Pet Shop People" - Tests basic operation of the extension by running the same test with two different observers. 

	*: "Pet Shop People"

	Include Grouped Messages as Dialogue by Ron Newcomb.

	The observer is usually Bob.  

	The pet store is room.  Bob is a man in the pet store.  Alice is a woman in the pet store.  A collar and a brush are things in the pet store.  Persuasion rule: rule succeeds. A pet carrier is a closed, openable container in the pet store. The pet store contains a white puppy and a black puppy.  

	Test me with " test a-run / swap / drop all / test a-run / swap / / /". 
	Test a-run with "take puppy / black / i/ take / puppy / x me closely / take collar / take collar".

	Section 1 - Bob's errorbook

	Bob's error are an rulebook.  Bob's error rulebook have default success. The observations of Bob is Bob's error rules. [ ACTIVITIES MUST COME FIRST ]
	
	Rule for Bob's error when printing a parser error:
		if the parser error is only understood as far as,  say "'[']ey man, I only know [']ow to [parser-understood words].  Don't know much about ['][parser-confusing words]['] and all,' he says."; 
		otherwise continue the action.

	Rule for Bob's error when asking which do you mean:
		say "'Which one, man?  I got [a prepared list delimited in sequential style].'".

	Rule for Bob's error when message of game error is LibMsg <what disambiguation>:
		say "'[The player's command] what?' says Bob.".

	Rule for Bob's error when message of game error is LibMsg <report player taking> and when the noun is the black puppy: 
		say "'[']ere ya go.' Bob hands you [the noun].  '[']is name's Smokey.'  He turns to the back of the shop. 'Ey Alice! What'dya say [']bout Smokey?'[line break]";
		if cannot defer to Alice, say "'Ah she can't hear me.'".

	Rule for Bob's error when message of game error is LibMsg <report player taking>: 
		say "'[']ere ya go.' Bob hands you [a noun].[line break]".

	Section 2 - Alice's errorbook

	Alice's error are an rulebook.  Alice's error rulebook have default success. The observations of Alice is Alice's error rules. [ ACTIVITIES MUST COME FIRST ]
	
	Rule for Alice's error when printing a parser error:
		if the parser error is only understood as far as begin;
			say "Alice looks confused for a moment. 'Just a minute.  Hey Bob?'  She repeats that to Bob, in the back."; 
			if cannot defer to bob, say "'He doesn't hear me.  I'll ask him when he gets back.'";
		otherwise;
			continue the action;
		end if.

	Rule for Alice's error when asking which do you mean:
		say "'Sure! Would you like [a prepared list delimited in disjunctive style]?  Their names are Cottonball and Smokey.'".

	Rule for Alice's error when message of game error is LibMsg <what disambiguation>:
		say "'Sorry? What would you like to [player's command]?' says Alice.".

	Rule for Alice's error when message of game error is LibMsg <report player taking> and when the noun is the white puppy: 
		say "'Cottonball is really sweet,' she says.  Now in your arms, Cottonball pokes her nose into your shirt, as if she's looking for something.";

	Rule for Alice's error when message of game error is LibMsg <report player taking> and when the noun is the black puppy: 
		say "'Smokey bites,' she says.";

	Rule for Alice's error when message of game error is LibMsg <report player taking>: 
		say "Alice hands you [the noun]. 'Need anything else?'[line break]".

	Rule for Alice's error when game error is failing not out of world :
		say "'Let me know if I can help you with anything,' says Alice.".
     
	Section 3 - An pseudoaction specifically to change the observer

	Understand "swap" as a mistake ("[observer] goes into the back for something. [swap em][observer] is now waiting on you.").
	To say swap em: if observer is bob, now observer is alice; otherwise now observer is bob.

	Section 4 - The default errors are a rulebook
	
	Rule for default errors when message of game error is LibMsg <empty line>:
		say "Say again?".


Example: ** "The Inquisitive Sort" - The NPC asks questions and accepts single noun replies by piggybacking on the parser's which-disambiguation abilities.

	*: "The Inquisitive Sort"

	Include Grouped Messages as Dialogue by Ron Newcomb.  [ Use grouped messages as dialogue debugging.]

	The observer is usually Bob.  
 
	The pet store is a room.  Bob is a man in the pet store.  Alice is a woman in the pet store.  A collar and a brush are things in the pet store.  Persuasion rule: rule succeeds. A pet carrier is a closed container in the pet store. The pet store contains a white puppy and a black puppy.  
 
	Test me with "take brush/the puppy/drop all/take brush/collar/carrier/take brush/drop all/take brush/alice/take bob/drop all/take brush/no/no/ok/yes/drop all/take brush/yes/collar/no/yes".
 
	Table of library messages (continued)
	Message Id
	LibMsg <ok> 

	Understand "ok" or "okay" as a mistake ("[run paragraph on][observe LibMsg <ok>][run paragraph on]").  
 
	section 4 - Bob's errorbook

	Bob's error are an rulebook.  Bob's error rulebook have default success. The observations of Bob is Bob's error rules.  [ ACTIVITIES MUST COME FIRST ]
	
	Rule for Bob's error when asking which do you mean:
		say "'Which one, man?  I got [a prepared list delimited in sequential style].'".

	Rule for Bob's error when the message of the game error is LibMsg <cannot take other people>:
		if the noun is Bob, say "Bob gives you a funny look.";
		otherwise say "Bob grins.  'Ah, ya'd have to ask her about that.'".

	Rule for Bob's error when the message of the game error is LibMsg <report player taking>: 
		say "'[']ere ya go.' Bob hands you [the noun].  ";
		if ask "'Can ya think of anything ya might also need?'" expecting a thing except things carried by the player begin;
			No  is the Said No To Need Anything Else rule; 
			Yes is the Whazzat rule  and ignored;
			now the verb word is "take";
		end if;
		say line break.

	This is the Whazzat rule: say "'OK, whazzat?'".

	this is the Said No To Need Anything Else rule:
		say "'Ya ready to check out then?'[line break]";
		Yes is the Price rule; 
		No is the Not Ready To Check-Out rule.
	
	this is the Not Ready To Check-Out rule:
		say "'Well lemme or Alice know when ya are and we'll getcha taken care of, ok?'";
		reset yes and no.

	this is the Price rule: say "'[']at's $29.95.'".

	Rule for Bob's error when the message of the game error is LibMsg <ok>:  
		say "Bob nods, and goes on to other tasks. ".
	
Example: * "Silent Acknowledgement" - There's a whole category of human conversation that carries no information. Let's re-create it.

	*: "Silent Acknowledgement"

	Include Grouped Messages As Dialogue by Ron Newcomb.

	Right here is room.

	Table of library messages (continued)
	Message Id
	LibMsg <hi>
	LibMsg <please>
	LibMsg <thanks>
	LibMsg <handshake>
	
	Understand "hi" or "hello" as a mistake ("[run paragraph on][observe LibMsg <hi>]").
	Understand "please" as a mistake ("[run paragraph on][observe LibMsg <please>]").
	Understand "thanks" or "thank you" as a mistake ("[run paragraph on][observe LibMsg <thanks>]").
	Understand "handshake" or "shake hands" as a mistake ("[run paragraph on][observe LibMsg <handshake>]").
	
	A library-message can be ritualistic.
	
	First categorizing errors rule (this is the reset new categories rule):
		now game error is not ritualistic.
	
	A categorizing errors rule for when message of game error is LibMsg <hi>: now game error is conversational; now game error is civilized; now game error is ritualistic.
	A categorizing errors rule for when message of game error is LibMsg <please>: now game error is conversational; now game error is civilized; now game error is ritualistic.
	A categorizing errors rule for when message of game error is LibMsg <thanks>: now game error is conversational; now game error is civilized; now game error is ritualistic.
	A categorizing errors rule for when message of game error is LibMsg <handshake>: now game error is civilized; now game error is ritualistic.
		
	A default errors rule when the game error is ritualistic conversational: say "(Unfortunately, being a mime, he never stood much on the ritualistic bits of conversation.)".
	
	Rule for default errors when the message of the game error is LibMsg <hi>: say "'Hello.'".
	Rule for default errors when the message of the game error is LibMsg <please>: say "'But of course.'".
	Rule for default errors when the message of the game error is LibMsg <thanks>: say "'Your welcome.'".
	Rule for default errors when the message of the game error is LibMsg <handshake>: say "You shake hands.".
	
	Test me with " please / hi / thanks / shake hands". 


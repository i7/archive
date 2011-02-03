Version 2 of Interactive Poetry by Michael Bacon begins here.

"A very simple alternate interactive fiction system conducive to writing keyword-based interactive poetry or narrative. "

"Most code by Ron Newcomb. Code for the introductory page altered from Jon Ingold's Title Page extension. Extension designed and maintained by Michael Bacon. Original design lifted from Andrew Plotkin's short narrative 'The Space Under the Window.' "

Include Basic Screen Effects by Emily Short.

[Include this and remove status line code when Status Line Removal is working:]
[Include Status Line Removal by Emily Short.]

Chapter 1 - Author Stuff

Section 1 - All You Really Need to Know

[ if the author includes "Use paragraphs." in the program, there won't be a linebreak automatically added to the end of a line. ]
Use paragraphs translates as (- Constant POEM_OR_PARAGRAPH; -).

[ if the author includes "Use centering." in the program, the lines will be centered. ]
Use centering translates as (- Constant CENTERING_OR_NOTCENTERING; -).

[ This table will definitely be "(continued)" -- see Writing with Inform, Chapter 15.18 "Table Amendments" ]
Table of Possible Lines
Topic 	line-number	Line 
--		a number		some text


[ This table can be "(amended)" -- see Writing with Inform, Chapter 15.19 "Table Amendments" ]
Table of Informational Messages
informational message		line
topbar				"[story title]"
word-not-valid-yet		"[line break][line break](That word is not part of the poem yet.)[line break]"
word-not-valid			"[line break][line break](That word is not part of the poem at all.)[line break]"
roll-credits				"[banner text][line break]Thank you for reading.[line break][line break][list of extension credits][line break]"
hidden-thanks-response	"[bold type]You are very welcome.[roman type]"
end-poem-soft-hiatus		"fín"


[ this say phrase is how the author ends the poem. ]
To say fín/fin: end the game saying the line corresponding to an informational message of end-poem-soft-hiatus in the table of informational messages.


Section 2 - End of Poem Options (in place of Section SR2/12 - Final question options in Standard Rules by Graham Nelson)

Table of Final Question Options
final question wording  	only if victorious 	topic  			final response rule		final response activity
 "KEEP this poem"		false		"keep/save/print"		save the game rule		an activity
"CREATE a new poem"	false		"create/restart"			immediately restart the game rule
"SHOW the poem again"	false		"show/reprint"			poem display rule
"FIND a kept poem"		false		"find/restore/kept"		restore the game rule
"view the CREDITS"		false		"view/roll/credits/author/poet/credit"	credits rule
"say GOODBYE"			false		"bye/goodbye/quit/by"	immediately quit the game rule
--					false		"thank you"			hidden you're welcome rule


This is the credits rule: say the line corresponding to an informational message of roll-credits in the table of informational messages.

This is the hidden you're welcome rule: say the line corresponding to an informational message of hidden-thanks-response in the table of informational messages. 

The immediately restart the game rule translates into I6 as
"IMMEDIATELY_RESTART_VM_R".
The immediately restore the game rule translates into I6 as
"IMMEDIATELY_RESTORE_SAVED_R".
The immediately quit the game rule translates into I6 as
"IMMEDIATELY_QUIT_R". 

Section 3 - Appearance

Use no scoring.  Use the serial comma.  [ both are for End Of Poem options ]

The display banner rule is not listed in the startup rulebook.  [we'll use the banner in CREDITS]

The poem display rule is listed instead of the room description heading rule in the carry out looking rules.

Rule for printing a parser error (this is the silence parser errors rule): consider the poem display rule.

Every turn (this is the poem display rule):
	clear only the main screen;
	say "[line break][line break]"; [ to ensure the status line does not cover the text in certain interpreters]
	repeat with X running from 1 to the current line minus 1 begin;
		choose row X in the table of selected lines;
		If not using the centering option begin;
			if there is a line entry begin;
				say the line entry;
				if not using the paragraphs option, say line break;
			end if;
		end if;
		If using the centering option begin;
			if there is a line entry begin;
				centre the line entry;
				if not using the paragraphs option, say line break;
			end if;
		end if;
	end repeat;
[The following is for debugging if uncommented:]
	[say "(now looking for line [current line]).";]
	unless the unknown words message is "", say the unknown words message;
	now the unknown words message is "".


Section 1a Status Line - (for Glulx only)

Rule for constructing the status line (this is the title and author at top rule): 
    center (the line corresponding to an informational message of topbar in the table of informational messages) at row 1; 
    rule succeeds.

Section 1b Status Line (for Z-machine only)

Include (-

Replace DrawStatusLine;

-) after "Definitions.i6t".

Include (-

[ DrawStatusLine;
];

-).

Rule for constructing the status line: do nothing instead. 

Chapter 2 - Mechanics

Section 1 - Declarations

Poem is a room. 

An informational message is a kind of value.  Some informational messages are defined by the table of informational messages. 
The current line is a number that varies.  The current line is usually 2.
Unknown words message is some text that varies.  The unknown words message is usually "".


Section 2 - Table wrangling

When play begins (this is the autoselect the first line rule): 
	choose row with a line-number of 1 from the table of possible lines;
	let First Line be the line entry;
	choose row 1 in the table of selected lines;
	change the line entry to the First Line.


Table of Selected Lines
Topic		Line 
-- 		text
with 50 blank rows.


Section 3 - Info gathering

To decide which number is previous line: decide on the current line minus one.
To decide which number is next line: decide on the current line plus one.
To decide which number is (T - a topic) as a number: (- {T} -).  
To decide which topic is (N - a number) as a topic: (- {N} -).
To decide which number is the currently chosen row: (- ct_1 -).

To decide which number is the row that matches (topic understood - a snippet) in (T - a table-name):
	repeat through T in reverse order begin;
		if T is the table of possible lines and the line-number entry > the current line, [skip to] next [row];
		if there is a topic entry and the topic understood matches the topic entry, decide on the currently chosen row;
	end repeat;
	decide on 0.


Section 4 - Word choosing

Understand "[text]" as choosing.  Choosing is an action applying to one topic.
Carry out choosing:
	let the found row be the row that matches the topic understood in the table of possible lines;
	[say "1";]   [ debugging -- please ignore ]
	if the found row is not 0 begin;
		[say "2";]   [ debugging -- please ignore ]
		choose row the found row from the table of possible lines;
		let X be the line entry;
		let T be the topic entry as a number;
		[say "3";]   [ debugging -- please ignore ]
		if the line-number entry < the current line, change the current line to the line-number entry; [ backs up ]
		[say "4";]   [ debugging -- please ignore ]
		if the current line is the line-number entry begin;
			[say "5";]   [ debugging -- please ignore ]
			choose row current line in the table of selected lines;
			change the line entry to X;
			change the topic entry to T as a topic;
			increase the current line by 1;
			rule succeeds;
		otherwise; 
			now the unknown words message is the line corresponding to an informational message of word-not-valid-yet in the table of informational messages  ;
			rule fails;
		end if;
	end if;
	; [ Everything from here down is probably obsolete. ]
	[say "6";]   [ debugging -- please ignore ]
	change the found row to the row that matches the topic understood in the table of selected lines;
	[say "7";]   [ debugging -- please ignore ]
	if the found row is 0 begin;
		now the unknown words message is the line corresponding to an informational message of word-not-valid in the table of informational messages;
		rule fails;
	otherwise;
		[now the unknown words message is "(DEBUGGING: chose an old line.)";]
		rule succeeds; [ This branch might now be obsolete. ]
	end if;


Section 5 - Verb removing (in place of Section SR4/10 - Grammar in Standard Rules by Graham Nelson) 

Instead of going, try choosing the player's command.

Include (-
Constant AGAIN1__WD     = ' ';
Constant AGAIN2__WD     = ' ';
Constant AGAIN3__WD     = ' ';
Constant OOPS1__WD      = ' ';
Constant OOPS2__WD      = ' ';
Constant OOPS3__WD      = ' ';
Constant UNDO1__WD      = ' ';
Constant UNDO2__WD      = ' ';
Constant UNDO3__WD      = ' ';

Constant ALL1__WD       = ' ';
Constant ALL2__WD       = ' ';
Constant ALL3__WD       = ' ';
Constant ALL4__WD       = ' ';
Constant ALL5__WD       = ' ';
Constant AND1__WD       = ' ';
Constant AND2__WD       = ' ';
Constant AND3__WD       = ' ';
Constant BUT1__WD       = ' ';
Constant BUT2__WD       = ' ';
Constant BUT3__WD       = ' ';
Constant ME1__WD        = ' ';
Constant ME2__WD        = ' ';
Constant ME3__WD        = ' ';
Constant OF1__WD        = ' ';
Constant OF2__WD        = ' ';
Constant OF3__WD        = ' ';
Constant OF4__WD        = ' ';
Constant OTHER1__WD     = ' ';
Constant OTHER2__WD     = ' ';
Constant OTHER3__WD     = ' ';
Constant THEN1__WD      = ' ';
Constant THEN2__WD      = ' ';
Constant THEN3__WD      = ' ';

Constant NO1__WD        = 'no';  ! these are needed when asking "are you sure you want to restart/quit?"
Constant NO2__WD        = 'n';
Constant NO3__WD        = ' ';
Constant YES1__WD       = 'yes';
Constant YES2__WD       = 'y';
Constant YES3__WD       = ' ';

Constant AMUSING__WD    = ' ';
Constant FULLSCORE1__WD = ' ';
Constant FULLSCORE2__WD = ' ';
Constant QUIT1__WD      = ' ';
Constant QUIT2__WD      = ' ';
Constant RESTART__WD    = ' ';
Constant RESTORE__WD    = ' ';
-) instead of "Vocabulary" in "Language.i6t".


Chapter 3 - Title Page (altered from Jon Ingold)

section 1 - inclusions

Include Menus by Emily Short. 
Include Basic Screen Effects by Emily Short. 

section 2 - definitions

Use menus translates as (- Constant USE_MENUS; -). 
Use skip intro translates as (- Constant Skip_Intro; -).

[The quotation is some text that varies. The quotation is "[story headline]".]

To say quotation: say story headline.

The intro menu is a table-name that varies. The intro menu is the Table of Sample Options.

To centre (t - an indexed text), bold or italic:
	let N be the number of characters in T;
	say spaces to centre N;
	if bold, say bold type;
	if italic, say italic type;
	say T;
	say roman type.

To say spaces to centre (n -  a number) -- running on:
(- 	print "^"; spaces (((VM_ScreenWidth() - {n})/2)-1); 
-)

Section 3 - cover art (for Glulx only)

Include Glulx Image Centering by Emily Short. 
Figure opening figure is the file "cover.jpg".
To display art if appropriate: 	display figure opening figure centered;

Section 3b - no cover art (for Z-machine only)

To display art if appropriate: do nothing.

Section 4a - title screen rule


The first when play begins rule (this is the interactive poetry title screen rule):
while 1 is 1 begin;
	clear the screen;
	redraw status line;
	centre "[story title]", bold;
	centre "   by [story author]";
	say paragraph break;
	display art if appropriate;
	say line break;
	say fixed letter spacing;
	centre "[quotation]", italic;
	say roman type;
	say paragraph break;
	say fixed letter spacing;
	if not using the paragraphs option, say "Enter a word of significance from the text to revise the poem. [line break]";
	if using the paragraphs option, say "Enter a word of significance from the text to revise the story. [line break]";
	say "To continue, press [bold type]SPACE[roman type].[line break]";
	say variable letter spacing;
	let k be 0;
	while k is 0 begin;
		let k be the chosen letter;
	end while;
	if k is 13 or k is 31 or k is 32 begin;
		clear the screen; 
		make no decision;
	otherwise if k is 109 or k is 77;
	end if;
	pause the game;
end while;



Section 5 - the debug option - not for release

A procedural rule when using the skip intro option: 
	ignore the interactive poetry title screen rule.


Chapter 4 - end extension

Interactive Poetry ends here.

---- Documentation ----

Uses Basic Screen Effects (built in to Inform 7) by Emily Short to clear the screen.

This extension nearly closes down Graham Nelson's Standard Rules (without removing them, which is currently difficult to do) and replaces them with a simple system conducive to writing keyword-based interactive poetry or narrative. It revises a body of text based on keywords found in the currently displayed text rather than using verb commands.

The syntax for creating a poem by continuing the Table of Possible Lines is very simple and may be seen in the included example. This table is all one needs to get started.

If the author includes "Use paragraphs." in his/her program, there won't be a linebreak automatically added to the end of a line, which will allow the extension to function to support an ordinary paragraph-oriented narrative, like Andrew Plotkin's "The Space Under the Window." 

Punctuation choices currently have to be written manually by the author. Examine the example poem to see how. Michael Bacon would be grateful for any report of a better way to do this.

The Table of Informational Messages may be amended if desired as explained in Writing with Inform, Chapter 15.19 "Table Amendments." For reference, the table is below:

	Table of Informational Messages
	informational message		line
	topbar				"[story title]"
	word-not-valid-yet			"[line break][line break](That word is not part of the poem yet.)[line break]"
	word-not-valid			"[line break][line break](That word is not part of the poem at all.)[line break]"
	roll-credits			"[banner text][line break]Thank you for reading.[line break][line break][list of extension credits][line break]"
	hidden-thanks-response		"[bold type]You are very welcome.[roman type]"
	end-poem-soft-hiatus		"fín"

The following table may be amended to change the options displayed at the end of a poem or narrative:

	Table of Final Question Options
	final question wording  	only if victorious 	topic  			final response rule		final response activity
	 "KEEP this poem"		false		"keep/save/print"		save the game rule		an activity
	"CREATE a new poem"	false		"create/restart"			restart the game rule
	"SHOW the poem again"	false		"show/reprint"			poem display rule
	"FIND a kept poem"		false		"find/restore/kept"		restore the game rule
	"VIEW the credits"		false		"view/roll/credits/author/poet/credit"	credits rule
	"say GOODBYE"			false		"bye/goodbye/quit/by"	quit the game rule
	--					false		"thank you"			hidden you're welcome rule


In the poem display rule, comment out or otherwise remove the "clear only the main screen;" line to remove the screen-clearing mechanism. The author may wish to do this for longer works or to allow for the possibility of a smaller game screen.

Please send bug reports, code improvements, and feature requests to Michael Bacon or to the users of RAIF. Michael can be reached at valzispam@gmail.com.

Example: * Arid and Pale (without varied punctuation) - A short interactive poem.

	*: "Arid and Pale"

	Include Interactive Poetry by Michael Bacon.

	Table of Possible Lines (continued)
	Topic 	line-number	Line 
	-- 				1			"Arid and pale"
	"Arid"			2			"tan sandy dust"
	"Pale"			2			"cracked skin"
	"Tan"			3			"like her skin"
	"Sandy"			3			"crunches soundlessly"
	"Dust"			3			"whirls in a devil"
	"Cracked"			3			"dried clay -"
	"Skin"			3			"raw, bloody and dry -"
	"Like"			4			"like her heart. [fin]"
	"Her"				4			"dried after rain. [fín]"
	"Skin"			4			"envelopes form. [fín]"
	"Crunches"		4			"but not her bones. [fin]"
	"Soundlessly"		4			"under her bare feet. [fin]"
	"Whirls"			4			"so she squints. [fin]"
	"Devil"			4			"as she prays. [fin]"
	"Dried"			4			"she waits. [fin]"
	"Clay"			4			"she cannot shape. [fin]"
	"Raw"			4			"preparing a meal. [fin]"
	"Bloody"			4			"sleeves discolored. [fin]"
	"Dry"				4			"her eyes itch tearlessly. [fin]" 

	Test me with "arid / tan / skin / credits / thank you".

Example: ** Arid and Pale (with varied punctuation) - A short interactive poem with punctuation varying depending on how much of the poem has been displayed.

	*: "Arid and Pale"

	Include Interactive Poetry by Michael Bacon.

	Table of Possible Lines (continued)
	Topic 	line-number	Line 
	-- 				1			"Arid and pale"
	"Arid"			2			"tan sandy dust"
	"Pale"			2			"cracked skin[period or colon]"
	"Tan"			3			"like her skin"
	"Sandy"			3			"crunches soundlessly"
	"Dust"			3			"whirls in a devil"
	"Cracked"			3			"dried clay -"
	"Skin"			3			"raw, bloody and dry -"
	"Like"			4			"like her heart. [fin]"
	"Her"				4			"dried after rain. [fín]"
	"Skin"			4			"envelopes form. [fín]"
	"Crunches"		4			"but not her bones. [fin]"
	"Soundlessly"		4			"under her bare feet. [fin]"
	"Whirls"			4			"so she squints. [fin]"
	"Devil"			4			"as she prays. [fin]"
	"Dried"			4			"she waits. [fin]"
	"Clay"			4			"she cannot shape. [fin]"
	"Raw"			4			"preparing a meal. [fin]"
	"Bloody"			4			"sleeves discolored. [fin]"
	"Dry"				4			"her eyes itch tearlessly. [fin]" 

To allow a line's end punctuation to vary depending on what follows in the next line, punctuation choices have to be coded manually by the author like so:

	Remember punc is some text that varies. Remember punc is usually "".
	To say period or colon:
		if the current line is 3, change remember punc to "";  
		if the current line is 4 begin;
			if the topic understood matches "skin", change remember punc to ":";
			if the topic understood matches "cracked", change remember punc to ". ";
		end if;
		say remember punc.

Notice that "[period or colon]" appears in one of the possible versions of Line 2. "the current line" has already been advanced.


	Test me with "arid / tan / skin / credits / thank you".
	Test punctuation with "pale / skin / cracked / clay".
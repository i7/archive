Version 2 of Interactive Poetic Interludes by Kazuki Mishima begins here.

"A system for creating interludes within interactive fiction that present keyword-based interactive poetry or narratives."

"Adapted from Michael R. Bacon's Interactive Poetry extension. Most code by Ron Newcomb. Original design for keyword-based interaction lifted from Andrew Plotkin's 'The Space Under the Window.'"

Include Basic Screen Effects by Emily Short.

Chapter 1 - Author Stuff

Section 1 - All You Really Need to Know

[ if the author includes "Use paragraphs." in the program, there won't be a linebreak automatically added to the end of a line. ]
Use paragraphs translates as (- Constant POEM_OR_PARAGRAPH; -).

[ if the author includes "Use centering." in the program, the lines will be centered. ]
Use centering translates as (- Constant CENTERING_OR_NOTCENTERING; -).


[ This table can be "(amended)" -- see Writing with Inform, Chapter 15.19 "Table Amendments" ]
Table of Informational Messages
informational message		line
word-not-valid-yet		"[line break][line break][bracket]That word is not part of the poem yet.[close bracket][line break]"
word-not-valid			"[line break][line break][bracket]That word is either insignificant or not part of the poem.[close bracket][line break]"


[ this say phrase is how the author ends the poem. ]
To say fín/fin:
	pause the game;
	clear the screen;
	now the current poem is read.

Chapter 2 - Mechanics

Section 1 - Declarations

Recitation is a room.

An informational message is a kind of value.  Some informational messages are defined by the table of informational messages. 
The current line is a number that varies.  The current line is usually 2.
Unknown words message is some text that varies.  The unknown words message is usually "".

Section 4 - Poem Objects

A poem is a kind of thing. A poem has a table-name called the textual content.

A poem can be read or unread. A poem is usually unread.

Null Poem is a poem. Null poem is read.

The current poem is a poem that varies. The current poem is Null Poem.

Section 3 - Table Wrangling

Table of Selected Lines
Topic	Line
--	text
with 50 blank rows.

Section 4 - The Poetic Interlude Scene

Poetic Interlude is a scene. Poetic Interlude begins when the current poem is unread. Poetic Interlude ends when the current poem is read.

When Poetic Interlude begins (this is the starting an interlude rule):
	pause the game;
	clear the screen;
	choose row with a line-number of 1 from the textual content of the current poem;
	let First Line be the line entry;
	choose row 1 in the table of selected lines;
	change the line entry to the First Line;
	move the player to Recitation, without printing a room description;
	consider the poem display rule.

Section 5 - Info gathering

To decide which number is previous line: decide on the current line minus one.
To decide which number is next line: decide on the current line plus one.
To decide which number is (T - a topic) as a number: (- {T} -).  
To decide which topic is (N - a number) as a topic: (- {N} -).
To decide which number is the currently chosen row: (- ct_1 -).

To decide which number is the row that matches (topic understood - a snippet) in (T - a table-name):
	repeat through T in reverse order begin;
		if T is the textual content of the current poem and the line-number entry > the current line, [skip to] next [row];
		if there is a topic entry and the topic understood matches the topic entry, decide on the currently chosen row;
	end repeat;
	decide on 0.

Section 6 - Choosing a Line

Topic-choosing is an action out of world applying to one topic.

Understand "[text]" as topic-choosing when Poetic Interlude is happening.

Instead of doing something other than topic-choosing when Poetic Interlude is happening: try topic-choosing the player's command.

Carry out topic-choosing:
	let the found row be the row that matches the player's command in the textual content of the current poem;
	say "1";   [ debugging -- please ignore ]
	if the found row is not 0 begin;
		say "2";   [ debugging -- please ignore ]
		choose row the found row from the textual content of the current poem;
		let X be the line entry;
		let T be the topic entry as a number;
		say "3";   [ debugging -- please ignore ]
		if the line-number entry < the current line, change the current line to the line-number entry; [ backs up ]
		say "4";   [ debugging -- please ignore ]
		if the current line is the line-number entry begin;
			say "5";   [ debugging -- please ignore ]
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
	say "6";   [ debugging -- please ignore ]
	change the found row to the row that matches the topic understood in the table of selected lines;
	say "7";   [ debugging -- please ignore ]
	if the found row is 0 begin;
		now the unknown words message is the line corresponding to an informational message of word-not-valid in the table of informational messages;
		rule fails;
	otherwise;
		[now the unknown words message is "(DEBUGGING: chose an old line.)";]
		rule succeeds; [ This branch might now be obsolete. ]
	end if.

Section 7 - Displaying the Poem

Report topic-choosing (this is the poem display rule):
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
				center the line entry;
				if not using the paragraphs option, say line break;
			end if;
		end if;
	end repeat;
[The following is for debugging if uncommented:]
	[say "(now looking for line [current line]).";]
	unless the unknown words message is "", say the unknown words message;
	now the unknown words message is "";
	consider the scene change machinery rule.

Section 8 - The Status Line

Rule for constructing the status line when Poetic Interlude is happening: do nothing instead.

Interactive Poetic Interludes ends here.

---- Documentation ----

Uses Basic Screen Effects (built in to Inform 7) by Emily Short to clear the screen.

This extension creates a scene called Poetic Interlude that temporarily suppresses in-world verbs and displays a body of text. It revises the text based on keywords found in the currently displayed text rather than using verb commands.

This extension includes a room (called Recitation) specifically for the Poetic Interlude scene. Therefore, you will have to take care of letting Inform know in which room play should start. For example:

	Starting Room is a room. The player is in Starting Room.

To set up the body of text that is displayed, the author must implement a "poem", which is a kind of thing defined in the extension. A poem can be read or unread. It is unread by default. A poem has a table-name called textual content which should point to a table containing the lines of poetry or pieces of text to be displayed, the place of each within the whole, and the keywords that trigger them. The table has to follow a certain format, which I find hard to explain except by example:

	Many Lines is a poem. The textual content of Many Lines is the Table of Many Lines.
	
	Table of Many Lines
	Topic	line-number	Line
	--	a number	some text
	--	1	"The first line"
	"first"	2	"of three or more"
	"line"	2	"of a bland poetic narrative"
	"three"	3	"is, by itself, still only one.[fin]"
	"more"	3	"holds untold possibility in finite space.[fin]"
	"bland"	3	"shows so little promise.[fin]"
	"poetic"	3	"may contain no play on words.[fin]"
	"narrative"	3	"tells no story worth hearing.[fin]"

Note that invoking [fin] or [fín] brings the poem to an end. Also note that a keyword can not be "quit" or "restart" or correspond to any of these out-of-world actions.

When displayed, the poem will grow line by line as the player uses keywords to choose lines from the table. These will be displayed with automatic line breaks between them unless the author invokes this code:

	Use paragraphs.

You can define multiple poems this way, keeping them in separate objects for use at different points in the story.

To start poetic interlude, the author must manipulate "the current poem", which points to the poem queued for display. By default, the current poem points to a null poem object marked as read. When the current poem is unread, the Poetic Interlude scene will start and display whatever poem is current. So, to invoke the poem created in the example above, one would leave at the end of a rule:

	change the current poem to Many Lines.

The Poetic Interlude Scene moves the player to a purpose-created room where no room-specific rules can get in the way. When the interlude ends, it is up to the author to decide how play should proceed. This is probably best done with a scene, like so:

	After the Poem is a scene. After the Poem Begins when Many Lines is read.
	When After the Poem begins:
		say "After reading that bland poem you realize where you really want to be.";
		move the player to the Bar, printing an abbreviated room description.

When the end of a poem is reached, it is marked as read, so this property of a poem object can be used to trigger the next scene.

It should be noted that any rules applying to in-world commands should be restricted so that they don't apply during the Poetic Interlude scene, because otherwise they may interfere with the keyword mechanism:

	Instead of jumping when Poetic Interlude is not happening:
		say "You've better things to do at present."

The Table of Informational Messages may be amended if desired as explained in Writing with Inform, Chapter 15.19 "Table Amendments." For reference, the table is below:

	Table of Informational Messages
	informational message		line
	word-not-valid-yet			"[line break][line break](That word is not part of the poem yet.)[line break]"
	word-not-valid			"[line break][line break](That word is not part of the poem at all.)[line break]"

In the poem display rule, comment out or otherwise remove the "clear only the main screen;" line to remove the screen-clearing mechanism. The author may wish to do this for longer works or to allow for the possibility of a smaller game screen.

Example: * Bland Poetry - A short piece of interactive fiction with an interactive poetic interlude.

	*: "Bland Poetry"
	
	Include Interactive Poetic Interludes by Kazuki Mishima.
	
	Many Lines is a poem. The textual content of Many Lines is the Table of Many Lines.
	
	Table of Many Lines
	Topic	line-number	Line
	--	a number	some text
	--	1	"The first line"
	"first"	2	"of three or more"
	"line"	2	"of a bland poetic narrative"
	"three"	3	"is, by itself, still only one.[fin]"
	"more"	3	"holds untold possibility in finite space.[fin]"
	"bland"	3	"shows so little promise.[fin]"
	"poetic"	3	"may contain no play on words.[fin]"
	"narrative"	3	"tells no story worth hearing.[fin]"
	
	Underimplemented Room is a room. The player is in Underimplemented Room.
	
	In Underimplemented Room is a thing called a paper with some writing on it.
	Instead of examining the paper:
		say "It's a poem.";
		change the current poem to Many Lines.
	
	Underimplemented Bar is a room.
	
	After the Poem is a scene. After the Poem begins when Many Lines is read.
	When After the Poem begins:
		say "Now you need a drink.";
		remove the paper from play;
		move the player to Underimplemented Bar, printing an abbreviated room description.

	Test me with "take paper / read it / line / bland".
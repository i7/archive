Version 14/110802 of Smarter Parser by Aaron Reed begins here.

"Understands a broader range of input than the standard parser, and can direct new players towards proper syntax."

[
CHANGES:
 -- Version 14: Added more enthusiastic blank line replacement code that allows for any command to run with time passing as normal. Tweaks to make the unnecessary movement rule more clear and specific; added code so item examples can choose the player's noun even without parsing; removed most references to "compass directions" in deference to down, out etc; clarified text of generic surroundings rule.
 -- Version 13: Added a new final rule to restore the command to its original state, to prevent later rules from looking at modified command text; fixed bug in Stripping Niceties; adjusted stripping interjections.
 -- Version 12: Updated for compatibility with Player Experience Upgrade.
 -- Version 11: Significant update based on statistical analysis of several hundred newbie transcripts. Now supports converting a blank line to look, and understanding a noun alone as examining. Also added sections for "Where can I go?", "Failed communication attempts", "Unnecessary possessives", "Gerunds". Added and refined patterns and message text throughout. 
 -- Version 10: Added beta support for two meta-smart parsing activities: converting a blank line to LOOK, and parsing commas more helpfully. (Note: the latter removed in version 11, this proved a lot more problematic than first thought.)
 -- Version 9: Updated for build 6F95
 -- Version 8: Some minor tweaks to vocabulary
 -- Version 7: Added some new punctuation marks to be stripped.
 -- Version 6: Major revision. Altered visual style to be more refined and more flexible; named rulebook outcomes; renamed and clarified several variables; rewrote documentation; added a few new cases from newbie Sand-dancer transcripts; stopped trying to strip single quotes from input (this was a bug that led to problems with recognizing possessives like "grandma's"; Poor Man's Mistype would catch attempts to say "grandmas" anyway.) Marked as glulx only due to issues with z-machine compilation. Cleaned up some formatting issues, including an occasional erroneous first space.
 -- Version 5: Removed deprecated features; added option to ignore all rules; adjusted responses to not have fantasy RPG elements & use more examples taken from the player's current environment.
 -- Version 4: Updated for build 6E59
 -- Version 3: added ? for help, more punctuation removal; corrected a typo; minor bug fixes.
 -- Version 2: bug fixes.
]


[IDEAS FOR FUTURE:
-- Rewrite some of the simpler routines to directly manipulate the I6 player strings, the way Punctuation Removal by Emily Short works. Could speed things up significantly.
]

[
Some Notes:

It might be tempting to just strip all unrecognized words from the player's command and try reparsing, but that has much more of a risk of completely misinterpreting the player's command. Here, at least, we usually know the content of what we're stripping and can react accordingly. Some good examples of the failings of this technique here: http://groups.google.com/group/rec.arts.int-fiction/browse_frm/thread/5c4eca496b34abc6
]

Chapter - Compatibility

Section - Parser Speak (for use without Keyword Interface by Aaron Reed)

To say as the parser: do nothing.
To say as normal: do nothing.
To parser say (txt - an indexed text): say "[as the parser][txt][run paragraph on][as normal][line break]".

Chapter - Definitions

Use MAX_EXPRESSION_NODES of 300.

The rejected command is an indexed text that varies. The reborn command is an indexed text that varies. 

Suppress parser error is a truth state that varies. sp reparse flag is a truth state that varies.

Smarter Parser is a rulebook. The Smarter Parser rules have outcomes reparse the command (success), reject the command (failure), and no match (no outcome).


Chapter - Empty Smarter Parser Rulebook

Use empty Smarter Parser rulebook translates as (- Constant NO_SMARTER_PARSER_RULES; -).

To decide whether sp_normal: if the empty Smarter Parser rulebook option is active, no; if novice mode enabled is false, no; yes.
To decide whether sp_normal_and_verb_related: if sp_normal and the latest parser error is verb-related, yes; no. [We must do this awkwardly since we want the rules to be in the order we declare them, but if they have an unequal number of when conditions, they are sorted in that order instead.]

Definition: a command parser error is verb-related if it is the only understood as far as error or it is the didn't understand error or it is the not a verb I recognise error.


Chapter - Smarter Parser Core Routines

Section - Try Harder to Understand

Before printing a parser error (this is the Smarter Parser trying harder to understand rule):
	now the rejected command is the player's command;
	now the reborn command is the player's command; 
	follow the Smarter Parser rules;
	if the outcome of the rulebook is the reparse the command outcome:
		if reborn command is not rejected command:
			clean up the reparsed command;
			announce the reparsed command;
			now sp reparse flag is true;
	otherwise if the outcome of the rulebook is the reject the command outcome:
		now suppress parser error is true;
		explain the reborn command.

Rule for printing a parser error when suppress parser error is true or sp reparse flag is true (this is the Smarter Parser suppress parser messages on matches rule):
	now suppress parser error is false.

Rule for reading a command when sp reparse flag is true (this is the Smarter Parser retrying input rule):
	now sp reparse flag is false;
	change the text of the player's command to "[reborn command]".

Section - Explaining Results

To announce the reparsed command:
	let msg be "";
	if there is a rule name of saved Smarter Parser error in Table of Smarter Parser Messages:
		now msg is the message corresponding to a rule name of saved Smarter Parser error in Table of Smarter Parser Messages;
	show the reparsed command with explanation msg.
	
To show the reparsed command with explanation (explanation - a text):
	say "[unless explanation is empty][explanation][command clarification break][end unless]>[reborn command in upper case]".

To explain the reborn command:
	if there is a rule name of saved Smarter Parser error in Table of Smarter Parser Messages:
		let msg be the message corresponding to a rule name of saved Smarter Parser error in Table of Smarter Parser Messages;
		show the reborn command with explanation msg.
		
To show the reborn command with explanation (explanation - a text):
	say "[explanation][line break]". 

To clean up the reparsed command:
	while character number 1 in reborn command is " ":
		replace character number 1 in reborn command with "";
	replace the regular expression " {2,}" in reborn command with " ".
	

Section - The Print Rule

The saved Smarter Parser error is a rule variable.

To identify error as (why - a rule):
	if sp-debug is true, parser say "***Smarter Parser: matched on [why].";
	now saved Smarter Parser error is why.

Section - The Table

Table of Smarter Parser Messages
rule name	message
rule	text

Chapter - Macros for defining rules

To decide whether stripping (regex - an indexed text) is fruitful, even within words, only in the middle:
	if even within words:
		if replacing regex with "" is fruitful, even within words:
			decide yes;
	if only in the middle:
		if replacing regex with "" is fruitful, only in the middle:
			decide yes;	
	otherwise:
		if replacing regex with "" is fruitful, decide yes;
	decide no.

To decide whether replacing (regex - an indexed text) with (newstr - an indexed text) is fruitful, even within words, only in the middle:
	let original be the reborn command;
	if even within words:
		replace the regular expression "[regex]" in reborn command with "[newstr]";
	otherwise if only in the middle:
		replace the regular expression "(?=(^\s)+)\b[regex]\b(?=(^\s)+)" in reborn command with "[newstr]";
	otherwise:
		replace the regular expression "\b[regex]\b" in reborn command with "[newstr]";
	if original is not reborn command:
		decide yes;
	now reborn command is original;
	decide no.

To decide whether input starts with (regex - an indexed text), even within words:
	if even within words:
		if reborn command exactly matches the regular expression "^[regex].*":
			decide yes;
	otherwise:
		if reborn command exactly matches the regular expression "^[regex]\b.*":
			decide yes;
	decide no.

To decide whether input ends with (regex - an indexed text), even within words:
	if even within words:
		if reborn command exactly matches the regular expression ".*[regex]$":
			decide yes;
	otherwise:
		if reborn command exactly matches the regular expression ".*\b[regex]$":
			decide yes;
	decide no.

To decide whether input contains (regex - an indexed text), even within words:
	if even within words:
		if reborn command matches the regular expression "[regex]":
			decide yes;
	otherwise: 
		if reborn command matches the regular expression "\b[regex]\b":
			decide yes;
	decide no.

Chapter - Applicable Examples

Definition: a thing is sp_alive: if it is yourself, yes; if it is a person, yes; if it is the player, yes; no.

Definition: a thing is appropriate for taking: if it is sp_alive, no; if it is part of something, no; if it is not touchable, no; if it is scenery, no; if it is fixed in place, no; yes.

Definition: a thing is bestial if it is an animal.

To say get noun example:
	let fake_example be false;
	let noun_example be indexed text;
	[Check to see if the player tried to reference something nearby]
	let candidate be indexed text;
	let first misunderstood word be indexed text;
	now first misunderstood word is word number ( the number of words in the rejected command ) in the rejected command;
	repeat with item running through things enclosed by location:
		if item is visible:
			now candidate is printed name of item in lower case;
			repeat with wordcounter running from 1 to the number of words in candidate:
				if word number wordcounter in candidate matches the regular expression "\b[first misunderstood word]":
					now noun_example is the printed name of item;
	if noun_example is empty:
		[Otherwise, choose the most sensible example possible.]
		if the number of visible appropriate for taking things which are not enclosed by the player > 0:
			now noun_example is "[random visible appropriate for taking things which are not enclosed by the player]";
		otherwise if the number of visible things which are not sp_alive > 0:
			now noun_example is "[random visible thing which is not sp_alive]";
		otherwise:
			now noun_example is "flower";
			now fake_example is true;
	say "[noun_example in upper case][if fake_example is true] (if one were here)".

To get person example, in normal case:
	let subj be a random visible not bestial person who is not the player;
	if subj is not a person, now subj is a random visible person who is not the player;
	let person_example be indexed text;
	if subj is a person:
		now person_example is "[subj]";
		let name_length be the number of words in person_example;
		now person_example is "[word number name_length in person_example]";
	otherwise:
		now person_example is "John";
	if in normal case:
		say "[person_example]";
	otherwise:
		say "[person_example in upper case]".

To say get person example: get person example. To say get person example in normal case: get person example, in normal case.

The standard directions list is a list of directions variable. The standard directions list is {north, northeast, east, southeast, south, southwest, west, northwest, up, down}.

Definition: a direction is sp_standard if it is listed in the standard directions list.
Definition: a direction is sp_viable if the room it from location is a room.

To get direction example, omitting superfluous details: 
	let randdir be a random sp_standard sp_viable direction;
	if randdir is not a direction, now randdir is a random sp_viable direction;
	if randdir is not a direction, now randdir is north; 
	let dir_example be indexed text;
	now dir_example is "[randdir]";
	now dir_example is "[dir_example in upper case]";
	if omitting superfluous details:
		say "[dir_example]";
	otherwise:
		if randdir is sp_standard:
			let dir_shorthand be indexed text;
			now dir_shorthand is "[character number 1 in dir_example]";
			if randdir is northeast, now dir_shorthand is "NE";
			if randdir is northwest, now dir_shorthand is "NW";
			if randdir is southeast, now dir_shorthand is "SE";
			if randdir is southwest, now dir_shorthand is "SW";
			say "(for example) [dir_example] or [dir_shorthand]";
		otherwise:
			say "(for example) [dir_example]".

To say get direction example: get direction example.
To say get direction example omitting superfluous details: get direction example, omitting superfluous details.

Chapter - Let Experts Disable

Novice mode enabled is a truth state variable. Novice mode enabled is true.

Understand "novice" as novice mode toggling. Novice mode toggling is an action out of world applying to nothing. Understand "novice on" as novice mode toggling when novice mode enabled is false. Understand "novice off" as novice mode toggling when novice mode enabled is true.

Carry out novice mode toggling:
	if novice mode enabled is true:
		now novice mode enabled is false;
		say "Novice mode disabled.";
	otherwise:
		now novice mode enabled is true;
		say "Novice mode enabled."


Chapter - Testing - For Testing Only

SP-debug is a truth state variable. SP-debug is false.

Understand "parser" as parser-debugging. Parser-debugging is an action out of world applying to nothing. Understand "parser on" as parser-debugging when sp-debug is false. Understand "parser off" as parser-debugging when sp-debug is true.

Carry out parser-debugging:
	if sp-debug is true:
		now sp-debug is false;
		say "Smart Parser debugging off.";
	otherwise:
		now sp-debug is true;
		say "Smart Parser debugging on."


Chapter - The Rules

[Because blank lines are handled differently than all other kinds of parser errors (see the "Keyboard" routine in Parser.i6t), it's impossible to intervene other than through intercepting the library message, which creates problems because the parser is in an unusual state at this point, or replace the whole Keyboard routine, which might create compatibility issues with other extensions. Both solutions are offered here.]

Use normal blank lines translates as (- Constant USE_NORMAL_BLANK_LINES; -).
		
Section - Nothing Entered Advanced Version

Include (- [ Keyboard  a_buffer a_table  nw i w w2 x1 x2;
	sline1 = score; sline2 = turns;

	while (true) {
		! Save the start of the buffer, in case "oops" needs to restore it
		for (i=0 : i<64 : i++) oops_workspace->i = a_buffer->i;
	
		! In case of an array entry corruption that shouldn't happen, but would be
		! disastrous if it did:
		#Ifdef TARGET_ZCODE;
		a_buffer->0 = INPUT_BUFFER_LEN;
		a_table->0 = 15;  ! Allow to split input into this many words
		#Endif; ! TARGET_
	
		! Print the prompt, and read in the words and dictionary addresses
		PrintPrompt();
		DrawStatusLine();
		KeyboardPrimitive(a_buffer, a_table);
	
		! Set nw to the number of words
		#Ifdef TARGET_ZCODE; nw = a_table->1; #Ifnot; nw = a_table-->0; #Endif;
	
		! If the line was blank, get a fresh line
		!if (nw == 0) {
		!	@push etype; etype = BLANKLINE_PE;
		!	players_command = 100;
		!	BeginActivity(PRINTING_A_PARSER_ERROR_ACT);
		!	if (ForActivity(PRINTING_A_PARSER_ERROR_ACT) == false) L__M(##Miscellany,10);
		!	EndActivity(PRINTING_A_PARSER_ERROR_ACT);
		!	@pull etype;
		!	continue;
		!}
	
		! Unless the opening word was OOPS, return
		! Conveniently, a_table-->1 is the first word on both the Z-machine and Glulx
	
		w = a_table-->1;
		if (w == OOPS1__WD or OOPS2__WD or OOPS3__WD) {
			if (oops_from == 0) { L__M(##Miscellany, 14); continue; }
			if (nw == 1) { L__M(##Miscellany, 15); continue; }
			if (nw > 2) { L__M(##Miscellany, 16); continue; }
		
			! So now we know: there was a previous mistake, and the player has
			! attempted to correct a single word of it.
		
			for (i=0 : i<INPUT_BUFFER_LEN : i++) buffer2->i = a_buffer->i;
			#Ifdef TARGET_ZCODE;
			x1 = a_table->9;  ! Start of word following "oops"
			x2 = a_table->8;  ! Length of word following "oops"
			#Ifnot; ! TARGET_GLULX
			x1 = a_table-->6; ! Start of word following "oops"
			x2 = a_table-->5; ! Length of word following "oops"
			#Endif; ! TARGET_
		
			! Repair the buffer to the text that was in it before the "oops"
			! was typed:
			for (i=0 : i<64 : i++) a_buffer->i = oops_workspace->i;
			VM_Tokenise(a_buffer,a_table);
		
			! Work out the position in the buffer of the word to be corrected:
			#Ifdef TARGET_ZCODE;
			w = a_table->(4*oops_from + 1); ! Start of word to go
			w2 = a_table->(4*oops_from);    ! Length of word to go
			#Ifnot; ! TARGET_GLULX
			w = a_table-->(3*oops_from);      ! Start of word to go
			w2 = a_table-->(3*oops_from - 1); ! Length of word to go
			#Endif; ! TARGET_
		
			! Write spaces over the word to be corrected:
			for (i=0 : i<w2 : i++) a_buffer->(i+w) = ' ';
		
			if (w2 < x2) {
				! If the replacement is longer than the original, move up...
				for (i=INPUT_BUFFER_LEN-1 : i>=w+x2 : i-- )
					a_buffer->i = a_buffer->(i-x2+w2);

				! ...increasing buffer size accordingly.
				#Ifdef TARGET_ZCODE;
				a_buffer->1 = (a_buffer->1) + (x2-w2);
				#Ifnot; ! TARGET_GLULX
				a_buffer-->0 = (a_buffer-->0) + (x2-w2);
				#Endif; ! TARGET_
			}
		
			! Write the correction in:
			for (i=0 : i<x2 : i++) a_buffer->(i+w) = buffer2->(i+x1);
		
			VM_Tokenise(a_buffer, a_table);
			#Ifdef TARGET_ZCODE; nw = a_table->1; #Ifnot; nw = a_table-->0; #Endif;
		
			return nw;
		}

		! Undo handling
	
		if ((w == UNDO1__WD or UNDO2__WD or UNDO3__WD) && (nw==1)) {
			Perform_Undo();
			continue;
		}
		i = VM_Save_Undo();
		#ifdef PREVENT_UNDO; undo_flag = 0; #endif;
		#ifndef PREVENT_UNDO; undo_flag = 2; #endif;
		if (i == -1) undo_flag = 0;
		if (i == 0) undo_flag = 1;
		if (i == 2) {
			VM_RestoreWindowColours();
			VM_Style(SUBHEADER_VMSTY);
			SL_Location(); print "^";
			! print (name) location, "^";
			VM_Style(NORMAL_VMSTY);
			L__M(##Miscellany, 13);
			continue;
		}
		return nw;
	}
]; -) instead of "Reading the Command" in "Parser.i6t".

The blank line replacement is an indexed text variable.
The blank line replacement is usually "look".

After reading a command (this is the Smarter Parser advanced replace blank line rule):
	let T be indexed text;
	now T is the player's command;
	if T is "":
		if the normal blank lines option is inactive:
			say ">[blank line replacement in upper case][command clarification break]";
			change the text of the player's command to the blank line replacement;
		otherwise:
			issue miscellaneous library message number 10; ["I beg your pardon?"]
			stop the action.

Section - Nothing Entered - Fallback Version

[Normally this will never be reached, but if the prior section is commented out, then things will fall through to this less intrusive implementation.]

Rule for printing a parser error when the latest parser error is the I beg your pardon error (this is the do something useful with blank lines rule):
	identify error as do something useful with blank lines rule;
	if the normal blank lines option is active:
		continue the activity;
	otherwise:
		now the reborn command is "look";
		announce the reparsed command;
		try looking.

Section - Incorrect Use of commas

[Parsing commas also happens before normal rules can intervene. Commas can either be used to separate multiple items in a command (as in TAKE BELL, BOOK, CANDLE) or to give orders (THORIN, GET THE RUCKSACK). While the former is intuitive and sometimes spontaneously tried by IF novices, the latter is not, and responses for this error can be misleading in this context. (For instance, VERY WELL, GO NORTH leads to "You seem to want to talk to someone, but I can't see whom."

Unfortunately, due to an omission in the Inform template layer as of this writing (http://inform7.com/mantis/view.php?id=525) there is no way to interfere with the comma section of the parser through an activity. Our options are to either throw the baby out with the bathwater by stripping commas from input entirely (thus losing the list-making ability) or replace this section of the parser with a large block of Inform 6 code. Once the issue above is fixed, we could try setting a flag when a comma is detected in input, which could then trigger a rule name that does something more sophisticated: if the error reveals that the command began with a this processing via an activity. ]

[Use no comma-based orders translates as (- Constant USE_NO_COMMA_ORDERS; -). 

comma_flag is a truth state variable.

After reading a command (this is the Smarter Parser strip commas from commands rule):
	if the no comma-based orders option is active:
		let tmpcmd be indexed text;
		now tmpcmd is the player's command;
		if tmpcmd matches the text ",":
			now comma_flag is true.

Last before reading a command (this is the Smarter Parser cleanup comma checking rule):
	now comma_flag is false.

A Smarter Parser rule when sp_normal (this is the incorrect use of commas rule):
	if comma_flag is true:
		if the latest parser error is the can't see whom to talk to error or the latest parser error is the didn't understand addressee's last name error:
			try stripping everything before the comma and reparsing;
		otherwise:
			print an error about not using commas and reject the command.]


[		let new_cmd be indexed text;
		now new_cmd is the player's command;
		replace the regular expression ".*\p" in new_cmd with "";
		now the reborn command is new_cmd;
		announce the reparsed command;
		say command clarification break;
		change the text of the player's command to new_cmd.]


	[	identify error as the incorrect use of commas rule;
		let new_cmd be indexed text;
		now new_cmd is the player's command;
		now the reborn command is new_cmd;
		now the rejected command is "///"; [so it looks different than the old cmd.]
		reparse the command.]

[Table of Smarter Parser Messages (continued)
rule name	message
incorrect use of commas rule	"Avoid the use of commas or other unnecessary punctuation to make your commands better understood."]


[Section: Dealing with Commas

The archaic THORIN, TAKE THE RUCKSACK syntax is rarely used in modern IF, and many of the default parser messages relates to commas assume players understands this convention, leading do confusion if they don't.  whereas new players who include a comma in their input and be confused by the response. If any people are visible when a misunderstood command including a comma is tried, Smarter Parser tries to better explain the expected syntax. Otherwise, the extension strips everything up to and including the comma and reparses the command (so YOU IDIOT, GO NORTH can succeed).

If your story does not allow the player to order characters around (or uses an alternate syntax), you should trigger the second behavior in all cases by adding the following line:

	Use no comma-based orders.

You can stop Smarter Parser from interfering with commas like this:

	Use no Smarter Parser comma interference.]


Section - Stripping Punctuation

A Smarter Parser rule when sp_normal (this is the stripping punctuation rule):
	if reborn command exactly matches the regular expression "<\?!>+":
		identify error as stripping punctuation rule;
		now reborn command is "help";
		reparse the command;	
	if replacing "<*~\\\/()\{\}[quotation mark][bracket][close bracket]>" with " " is fruitful, even within words or 
	replacing "<!?>+$" with "" is fruitful, even within words or
	replacing "<;:!?>+(?=(<^;:!?>|$))" with ". " is fruitful, even within words [regex here means any run of first set of characters that's followed by either something not one of those characters or the end of the line] or 
	replacing "&" with " and " is fruitful, even within words:
		identify error as stripping punctuation rule;
		reparse the command.

Section - Noun alone examines (for use without Keyword Interface by Aaron Reed)

[We don't want to make a new action, since that might interfere with "doing anything except examining" style rules.]
[BUG: If the player types an examine word alone and the parser supplies a noun, this rule erroneously fires, printing a confusing EXAMINE {VERB}. But only sometimes?! weird...]

Understand "[thing]" as examining when sp_normal. 

Carry out examining when sp_normal and the number of words in the player's command is 1 and not ( the reborn command matches the text "EXAMINE" ) (this is the Smarter Parser noun alone examines rule):
	now the reborn command is "EXAMINE [the player's command]";
	announce the reparsed command.

Section - Standardize apostrophes


A smarter parser rule when sp_normal (this is the standardize apostrophes rule):
	[We can't do <'s> here because it might be a possessive or "is".]
	replace the regular expression "[apostrophe](m|re)" in reborn command with " am"; 
	replace the regular expression "[apostrophe]ll" in reborn command with " will"; 
	replace the regular expression "[apostrophe]ve" in reborn command with " have";
	replace the regular expression "[apostrophe]t" in reborn command with "t";
	replace the regular expression "[apostrophe]d" in reborn command with "".

Section - Standardize can verbs

A smarter parser rule when sp_normal (this is the standardize can verbs rule):
	replace the regular expression "\b(can|would|will|should|may|do)\b" in the reborn command with "can".


Section - Where can I go

A smarter parser rule when sp_normal_and_verb_related (this is the where can I go rule):
	if input contains "(which|what|where|what) (way|direction|door|exit)" or input contains "can i (go|walk|move|travel|explore|leave)":
		identify error as the where can I go rule;
		now reborn command is "look";
		reparse the command.

Table of Smarter Parser Messages (continued)
rule name	message
where can I go rule	"[as the parser]Movement is usually by compass direction. Typing LOOK is a good way to get oriented.[as normal]"


Section - Signs of Confusion


A smarter parser rule when sp_normal (this is the signs of confusion rule):
	if input contains "(confused|lost|huh|understand|dont know|going on|wtf|help|hint|instructions|directions|info|verbs)" or input contains "(how|what) (can|get|commands|actions|verbs)":
		identify error as signs of confusion rule;
		reject the command.

Table of Smarter Parser Messages (continued)
rule name		message
signs of confusion rule		"[as the parser]Try typing LOOK for a description of your surroundings. Any directions indicate exits which you can use by typing [get direction example]. Some of the objects mentioned in the description might be worth a closer look with a command like EXAMINE [get noun example]. You can also TAKE or DROP some things, type INVENTORY to see a list of what you're carrying already, OPEN or CLOSE containers or doors, and so on.[as normal]"


Section - Stripping Niceties


A smarter parser rule when sp_normal (this is the stripping niceties rule):
	if stripping "(please|^can i|^may i)" is fruitful:
		identify error as stripping niceties rule;
		if the number of words in reborn command > 0, reparse the command;
		otherwise reject the command.
		
Table of Smarter Parser Messages (continued)
rule name		message
stripping niceties rule		"[as the parser]You can just state your commands directly.[as normal]"		

Section - scandalous standardize swears

A smarter parser rule when sp_normal (this is the scandalous standardize swears rule):
	replace the regular expression "\b(goddamn|god damn|damn|damm)( it|it| ed|ed)?\b" in reborn command with "_swear";
	replace the regular expression "\b(fuck|freak|piss)(ing|er)?s?\b" in reborn command with "_swear";
	replace the regular expression "\b(hell|shit|ass|dick)s?\b" in reborn command with "_swear".

Section - Stripping Interjections

[Problem: commands in the form >_SWEAR BOB are silently reparsed as >BOB.]

A smarter parser rule when sp_normal (this is the stripping interjections rule):
	if stripping "\b(in )?(the )?_swear( you| this)?\b" is fruitful[, only in the middle]:
		if the number of words in the reborn command > 0:
			identify error as stripping interjections rule;
			reparse the command;
		otherwise:
			identify error as signs of frustration rule;
			reject the command.
			

Section - Signs of Frustration


A smarter parser rule when sp_normal (this is the signs of frustration rule):
	if input contains "(dumb|moron|idiot|lame|duh|retard|sucks|blows|screw)(ic|ed|s)?" or input contains "(_swear|stupid|bored|boring|die|suicide|death|hate)":
		identify error as signs of frustration rule;
		reject the command.

Table of Smarter Parser Messages (continued)
rule name		message
signs of frustration rule		"[as the parser]I'm sorry if you're feeling frustrated. If you like, you can type SAVE to store your progress to a file (in most interpreters), then RESTORE to come back to it later. In the meantime, you might try searching the web to see if there are hints available.[as normal]"


Section - Standardize be verbs


A smarter parser rule when sp_normal (this is the standardize be verbs rule):
	replace the regular expression "\b(had|has|have|having)\b " in the reborn command with "";
	replace the regular expression "\b(is|am|are|be|being|been|was|were)\b" in the reborn command with "_be".



Section - Who are you

["Who said that," "Who am I talking to," "Who are you," "Who've I been speaking with," etc]

A smarter parser rule when sp_normal_and_verb_related (this is the asking who are you rule):
	if input contains "who.*\b(talk|speak|there|this|said|you|that)", even within words:
		identify error as asking who are you rule;
		reject the command.

Table of Smarter Parser Messages (continued)
rule name	message
asking who are you rule	"[as the parser]I'm the parser-- I translate what you type into actions your character takes in the story world. Use imperative commands like LOOK, GET [get noun example], or GO [get direction example] to advance the story. Try typing HELP or ABOUT for more information.[as normal]"


Section - Who am I


A smarter parser rule when sp_normal_and_verb_related (this is the asking who am i rule):
	if input contains "who _be i":
		identify error as asking who am i rule;
		now the reborn command is "examine me";
		reparse the command.

Table of Smarter Parser Messages (continued)
rule name	message
asking who am i rule	"[as the parser]You are a character in this story. Normally, you'll want to phrase your input as commands, not questions. I've taken the liberty of demonstrating below.[as normal]"


Section - Where am I

A smarter parser rule when sp_normal (this is the asking where am i rule):
	if input contains "where _be i" or
			input contains "(examine|x|look)( at)?( the)? (here|this place|place|room|area|around)" or
			input contains "(search|what _be in) (the )?(room|area|location|scene)":
		identify error as asking where am i rule;
		now reborn command is "look";
		reparse the command.

Table of Smarter Parser Messages (continued)
rule name	message
asking where am i rule	"[as the parser]To get a description of your surroundings, try typing LOOK.[as normal]"


Section - Asking unparseable questions

[Problem: >DO SOMETHING or whatever doesn't respond appropriately.]

A smarter parser rule when sp_normal_and_verb_related (this is the asking unparseable questions rule):
	if input starts with "(who|what|where|why|which|how|can)s?":
		identify error as asking unparseable questions rule;
		reject the command.

Table of Smarter Parser Messages (continued)
rule name	message
asking unparseable questions rule	"[as the parser]You can't ask direct questions to the game. Type a verb - noun command like EXAMINE [get noun example] to interact with the story world, or LOOK to get a description of your surroundings.[as normal]"


Section - Stripping Adverbs

[There are a few English verbs, nouns, and names that end in "ly" and aren't adverbs, like family, Molly, and apply. The biggest danger is that a noun gets referred to in the middle of an improperly formatted command, like >GIVE MOLLY SOME KISSES. To prevent this, only look for adverbs at the start or end of a command.]

A smarter parser rule when sp_normal (this is the stripping adverbs rule):
	if stripping "\w{3,}ly" is fruitful:
		identify error as stripping adverbs rule;
		reject the command.

Table of Smarter Parser Messages (continued)
rule name	message
stripping adverbs rule	"[as the parser]I didn't understand that. You used a word that ends in 'ly'; if it was an adverb like 'slowly' or 'carefully,' you don't usually need to be that specific.[as normal]"



Section - Stripping Verbose Intro

[Things like "I want to go north" or "can you take the ball" ]

A smarter parser rule when sp_normal_and_verb_related (this is the stripping verbose intro rule):
	if stripping "i (_be )?(want|can|going|guess)( to)?" is fruitful or stripping "(can|try) (i|you|we|to)" is fruitful or stripping "let([apostrophe])?s?" is fruitful:
		identify error as stripping verbose intro rule;
		reparse the command.

Table of Smarter Parser Messages (continued)
rule name	message
stripping verbose intro rule	"[as the parser]You can just begin your command with the verb.[as normal]"


Section - Making assertions

["I am strong," "You're weird," etc. ]

A smarter parser rule when sp_normal_and_verb_related (this is the making assertions rule):
	if input starts with "\b(i|he|she|it|this|you|your)":
		identify error as making assertions rule;
		reject the command.

Table of Smarter Parser Messages (continued)
rule name	message
making assertions rule	"[as the parser]Please rephrase your command to start with an imperative verb, like LOOK.[as normal]"





Section - Starting command with I

[Normally something like "i don't know what to do" results in the unfortunate message "I only understood you as far as wanting to take inventory."]

A smarter parser rule when sp_normal_and_verb_related (this is the starting command with i rule):
	if input starts with "i":
		identify error as starting command with i rule;
		reject the command.

Table of Smarter Parser Messages (continued)
rule name		message
starting command with i rule		"[as the parser]Please rephrase your command to start with an imperative verb, like LOOK.[as normal]"



Section - Unnecessary Movement

["get closer to ball," "move away from ball, "stand next to ball," "get in front of ball," etc. One of the most common mistaken impressions about the world model seen in novice players.]

A smarter parser rule when sp_normal (this is the unnecessary movement rule):
	if stripping "(walk|move|go|stand|get) (to|close|away|by|over|near|next)" is fruitful, even within words or stripping "(under|over|behind|around|near|nearer|far|farther|inside|front of|approach|up to|goto)" is fruitful:
		identify error as unnecessary movement rule;
		reject the command.

Table of Smarter Parser Messages (continued)
rule name		message
unnecessary movement rule		"[as the parser]If you can see an object, you can usually just interact with it directly without worrying about your position[if player is enclosed by something] (although since you're in or on something, you may need to type EXIT first)[end if]. Try a command like EXAMINE [get noun example] for a closer look at something[if the number of sp_viable directions is at least 1], LOOK to get a new description of this location, or a direction like [get direction example] to move to a different location[otherwise], or LOOK to show the description of this location again.[as normal]"


Section - Stripping Vague Words


A smarter parser rule when sp_normal (this is the stripping vague words rule):
	if input contains "(some|any|every|no|here|there)(one|thing|body|where|place)?":
		identify error as stripping vague words rule;
		reject the command.

Table of Smarter Parser Messages (continued)
rule name	message
stripping vague words rule	"[as the parser]You will need to be more specific. Try typing LOOK to get a description of your surroundings.[as normal]"


Section - Stripping Pointless Words


A smarter parser rule when sp_normal (this is the stripping pointless words rule):
	if stripping "(anyway|instead|very|almost|this|so|just|ye)" is fruitful or stripping "(now|try|next|around|more)" is fruitful:
		identify error as stripping pointless words rule;
		if the number of words in the reborn command > 0, reparse the command;
		else reject the command. [If there are no more words to deal with.]

Table of Smarter Parser Messages (continued)
rule name	message
stripping pointless words rule	"[as the parser]Most connecting and comparative words are not necessary.[as normal]"

[Understand "get ye flask" as a mistake ("[as the parser]Thorns are deprecated; use 'th'.[as normal]").]

Section - Stripping Failed With

[">take ball with my hand," for instance. If a game actually implements an action using "with [something]", and the player types an unknown second noun, this could produce a misleading message; so we make sure the parser error isn't one that would indicate such a thing.]

A smarter parser rule when sp_normal (this is the stripping failed with rule):
	if the latest parser error is not the can't see any such thing error:
		if stripping "(with|using|by) (the|a|some|my)?.?$" is fruitful:
			identify error as stripping failed with rule;
			reparse the command.

Table of Smarter Parser Messages (continued)
rule name	message
stripping failed with rule	"[as the parser]You don't always need to specify what you're doing something with.[as normal]"

Section - Gerunds

[Catch some of the most common regular verbs that might be tried as a gerund, like TRY LOOKING.]

A smarter parser rule when sp_normal (this is the no gerunds rule):
	if input contains "(go|look|wait|listen|enter|exit|open|wear|attack|touch|push)(ing\b)":
		replace the regular expression text matching subexpression 2 in the reborn command with "";
		identify error as no gerunds rule;
		reparse the command.

Table of Smarter Parser Messages (continued)
rule name	message
no gerunds rule	"[as the parser]Control your character with verbs in present tense command form.[as normal]"


Section - Generic surroundings


A smarter parser rule when sp_normal (this is the generic surroundings rule):
	if input contains "(ground|floor|left|right|above|below|wall|ceiling|forward|backward|onward|sky)":
		identify error as generic surroundings rule;
		reject the command.

Table of Smarter Parser Messages (continued)
rule name		message
generic surroundings rule		"[as the parser]Unless specifically mentioned by the text, avoid general concepts like the floor and ceiling, or relative directions like left and right. Try typing LOOK and then using verbs like TAKE or EXAMINE on the things you see mentioned.[as normal]"



Section - Stripping Body Parts

[can successfully parse things like "take Phil's arm" or "hit Phil with my hand," and at least prints a recognition of the body part word otherwise. ]
[BUG: >BOB'S FACE reparses to EXAMINE BOB, but the response is on the same line...]

A smarter parser rule when sp_normal (this is the stripping body parts rule):
	replace the regular expression "\b(eye|head|skull|hair|nose|mouth|ear|cheek|forehead)s?\b" in reborn command with "_body";
	replace the regular expression "\b(face|neck|chest|gut|breast|body|nipple|shoulder|collar|arm|wrist)s?\b" in reborn command with "_body";
	replace the regular expression "\b(hand|finger|knuckle|fingernail|waist|thigh|leg|knee)s?\b" in reborn command with "_body";
	replace the regular expression "\b(shin|ankle|foot|feet|toe|elbow|fist|thumb|tongue|lip|heart)s?\b" in reborn command with "_body";
	if stripping "(on|in) ?(the|his|her|a|their|my)? _body" is fruitful or stripping "[apostrophe]?s _body" is fruitful, even within words: [Note: this isn't idea for something like KISS LIPS, where it strips "S LIPS"]
		identify error as stripping body parts rule;
		reparse the command;
	if input contains "_body":
		identify error as stripping body parts rule;
		reject the command.

Table of Smarter Parser Messages (continued)
rule name	message
stripping body parts rule	"[as the parser]You do not normally need to refer to parts of the body.[as normal]"

Section - No Implemented Clothes

A smarter parser rule when sp_normal (this is the usually no clothing rule):
	if input contains "\b(clothes|shirt|pant|jacket|sock|shoe|belt|hat|underwear|jean|trouser|pocket)s?\b", even within words:
		identify error as usually no clothing rule;
		reject the command.

Table of Smarter Parser Messages (continued)
rule name	message
usually no clothing rule	"[as the parser]You do not normally need to refer to articles of clothing.[as normal]"


Section - Unnecessary possessives

[Convert a command like >GET BOB'S JACKET to >GET JACKET, but leave alone >BOB'S A WEIRDO or >GET APPLE'S. ]

A smarter parser rule when sp_normal (this is the stripping possessives rule):
	if input contains "\s(\w*[apostrophe]s)\b\s":
		replace the regular expression text matching subexpression 1 in the reborn command with "";
		identify error as stripping possessives rule;
		reparse the command.


Section - Understood as far as

[Will parse things like "take ball I suppose," "look about the room", or "kill the troll in terror"]

A smarter parser rule when sp_normal (this is the stripping unnecessary addendum rule):
	if the latest parser error is the only understood as far as error or latest parser error is the can't see any such thing error:
		if stripping "\b(the|a|some|my|this|that)\b" is fruitful, do nothing;
		if input starts with "(get off|look under|switch on|switch off|turn on|turn off|take off|listen to|wake up|put on)" and the number of words in reborn command is at least 3:
			now reborn command is "[word number 1 in reborn command] [word number 2 in reborn command] [word number 3 in reborn command]";
			identify error as stripping unnecessary addendum rule;
			reparse the command;
		if input starts with "(take|get|drop|eat|go|enter|get|x|examine|search|open)" or input starts with "(close|wear|wake|attack|kiss|touch|pull|push|turn)" or input starts with "(squeeze|burn|taste|cut|drink|rub|buy|climb|kill)" and the number of words in reborn command is at least 2:
			now reborn command is "[word number 1 in reborn command] [word number 2 in reborn command]";
			identify error as stripping unnecessary addendum rule;
			reparse the command;
		if input starts with "(l|look|inventory|exit|z|wait)" or input starts with "(yes|no|jump|sorry|sleep)": ["i" is intentionally left out, so this doesn't think something like "I don't think so" is an attempt to take inventory.]
			now reborn command is "[word number 1 in reborn command]";
			identify error as stripping unnecessary addendum rule;
			reparse the command.

[(get|look|switch|turn|take|listen|wake|put) (off|under|on|to|up)]


Table of Smarter Parser Messages (continued)
rule name		message
stripping unnecessary addendum rule		"[as the parser]I only understood the first part of that-- trying anyway.[as normal]"


Section - Failed Communication Attempts

A smarter parser rule when sp_normal_and_verb_related (this is the failed communication attempts rule):
	if input starts with "(hello|hi|talk|speak|greet|greetings|ask|tell|goodbye|bye)" and there is at least one visible person who is not the player:
		identify error as failed communication attempts rule;
		reject the command.

Table of Smarter Parser Messages (continued)
rule name	message
failed communication attempts rule	"[as the parser]If you're trying to talk to someone, you might try ASK [get person example] ABOUT something, the traditional conversation syntax. Type ABOUT to see if this story offers more detailed instructions for conversation.[as normal]"


Section - Too Many Words


A smarter parser rule when sp_normal (this is the too many words rule):
	if the number of characters in the reborn command > 1 and the number of words in the reborn command > 6:
		identify error as too many words rule;
		reject the command.

Table of Smarter Parser Messages (continued)
rule name		message
too many words rule		"[as the parser]You typed a rather long command and I didn't understand it. It's better to stick to simpler things like TAKE [get noun example].[as normal]"

Section - Fix the command

The last smarter parser rule when sp_normal (this is the fix the command rule):
	now the reborn command is the rejected command.


Smarter Parser ends here.

---- DOCUMENTATION ----


Section: Introduction


Some newcomers to IF are put off by the traditional parser, which offers no default instruction, is fairly rigid about the type of input it will accept, and does not usually phrase error messages in an instructional manner. After one or two confusing error messages, many new players will just give up.

This extension responds to various common forms of misunderstood input tried by new players, offering more helpful responses or reparsing certain commands in a more standard form. It also is easy to extend with your own matched patterns.

The easiest way to use the extension is to just include it; nothing else is necessary. Further reading is only necessary if you wish to customize the behavior.

A few notes: This extension owes a lot conceptually to Emily Short's Inform 6 extension, NewbieGrammar.h, and is also to a large degree a response to its author's experience with new player transcripts (see http://aaronareed.net/wttc/transcripts.html). While the extension is marked for Glulx only, it's technically possible to compile a .z8 story using it, although you won't have a lot of headroom left for story.


Section: Existing Rules


A new rulebook, the smarter parser rules, is run just before printing a parser error message. Each rule looks for a specific type of input pattern, and if it finds one, can print a better error message, or even adjust or replace the command and try running it again.

Running the rulebook at the end of the turn cycle rather than the beginning means that nothing in this extension should conflict with game-specific code. If you define your own "what is" command, for instance, it will be parsed and dealt with before Smarter Parser has a chance to kick in.

Here is the default rule set, in order, along with an example of the type of malformed command each is designed to catch. Most of these rules can understand a wide range of similar input. 

	the stripping punctuation rule
	the noun alone examines rule:
		">sword" --> ">examine sword"
	the standardize apostrophes rule
	the standardize can verbs rule
	the where can I go rule:
		">what exits are there?"
	the signs of confusion rule:
		">I don't know what to do"
	the stripping niceties rule:
		">please take the sword" --> "take the sword"
	the scandalous standardize swears rule
	the stripping interjections rule:
		">take the damn sword" --> "take the sword"
	the signs of frustration rule:
		">this game sucks"
	the standardize be verbs rule
	the asking who are you rule
		">who am I talking to "
	the asking who am i rule
		">who am i" --> "examine me"
	the asking where am i rule
		">look at the room" --> "look"
	the asking unparseable questions rule
		">why is this sword here"
	the blocking adverbs rule	
		">go north carefully"
	the stripping verbose intro rule
		">I want to get the sword" --> "get the sword"
	the making assertions rule
		">I am strong"
	the starting command with i rule
		">I love this game"
	the unnecessary movement rule
		">go to sword"
	the stripping vague words rule
		">go somewhere" --> "go"
	the stripping pointless words rule
		">anyway kill the troll" --> "kill the troll"
	the stripping failed with rule	
		">kill goblin with a rock" --> "kill goblin"
	the no gerunds rule
		">going"
	the generic surroundings rule	
		">look at ground"
	the stripping body parts rule	
		">take woman's hand" --> "take woman"
	the usually no clothing rule
		">take off my shoes"
	the stripping possessives rule
		">get troll's axe" --> "get axe"
	the stripping unnecessary addendum rule
		">wait for a while" --> "wait"
	the failed communication attempts rule
		">hello"
	the too many words rule
		">how can i go somewhere else now"


(The standardize apostrophes rule converts contractions like "I'm" to "I am", then strips any remaining apostrophes; the "standardize be verbs" replaces am, was, were, and so on with "_be". Later rules can use this tag to simplify pattern matching.)

Section: Dealing with Blank Lines

One of the most common forms of new player input, an empty command (just pressing enter at the prompt) normally results in the message "I beg your pardon?" Smarter Parser treats a blank line as if the player had typed LOOK, instead (under the theory that a player just pressing enter may be at a loss for what to try next, and a fresh room description might refocus them). You can change what text is inserted when a blank line is entered:

	The blank line replacement is "wait".

...or restore the default behavior:

	Use normal blank lines.

(Note that this functionality requires the replacement of the Keyboard routine, which may create compatibility issues with other extensions that replace this routine (such as Undo Output Control by Erik Temple). If you don't want to replace Keyboard, you can fall back on a simpler implementation that will always LOOK, although without the passage of time or firing of every turn rules. To do so simply replace the section with an empty block, like this:)

	Section - revert to simple blank lines (in place of Section - Nothing Entered Advanced Version in Smarter Parser by Aaron Reed)

Section: Reparsing

The rules beginning with "stripping" attempt to remove the offending part of the command and try again: >PLEASE TAKE THE SWORD is tried as >TAKE THE SWORD. When this happens, the player is notified of both the reason the original command failed and the new command being tried. A named phrase controls the style of notification. By default, it looks like this:

	To show the reparsed command with explanation (explanation - a text):
		say "[unless explanation is empty][explanation][command clarification break][end unless]>[reborn command in upper case]".

You can create your own custom style of notification by simply rewriting this named phrase in your own code. "Explanation" will contain the message for the error triggered, and the variable "reborn command" will contain the corrected command:

	To show the reparsed command with explanation (explanation - a text):
		say "(retrying that as '[reborn command]')[command clarification break]".

Section: Rejecting More Helpfully

All other Smarter Parser rules look for certain patterns in misunderstood input and display a message explaining why the command wasn't understood and offering suggestions for a better command to try. The named phrase that controls this is:

	To show the reborn command with explanation (explanation - a text):
		say "[explanation][line break]". 

Again, you can override this by re-declaring the phrase.

Section: Changing Messages

The error message for a smarter parser rule can be changed by amending the Table of Smarter Parser Messages, like so:

	Table of Smarter Parser Messages (amended)
	rule name						message
	the stripping niceties rule		"Your fawning attitude sickens me."

These messages can make use of the phrases "[get noun example]", to print the name of a visible thing, "[get direction example]" to print a direction that can be moved in, or "[get person example]" for a nearby person. All three will print hypothetical backups if no actual match can be found. 

If you don't like a rule, you can get rid of it with standard rule ordering syntax:

	The stripping niceties rule is not listed in the smarter parser rulebook.

You can also remove all of the built-in rules by adding the use option:

	Use empty Smarter Parser rulebook.
	
Experienced players can disable smarter parser by typing NOVICE OFF.

Section: Testing

Use the test command PARSER in an unreleased game to see which rule is generating a particular message.

Section: Making new Smarter Parser Rules

To create your own Smarter Parser rules, you'll need to understand regular expressions: see the "Advanced Text" chapter of the Inform docs for a basic introduction.

Here's an example of how to write a new Smarter Parser rule that removes a pattern and tries the command again:

	A smarter parser rule (this is the stripping formal address rule):
		if stripping "(sir|ma'am)" is fruitful:
			identify error as stripping formal address rule;
			reparse the command.

The condition "if stripping (some text) is fruitful" will be true if the text was found and successfully removed from the player's command. You must then "identify error as (the name of the rule)" and either "reparse the command" (to try it again) or "reject the command" (to give up). If you do neither, the next smarter parser rule will be checked. If no smarter parser rules match, Inform's default parser error printing system will kick in.

In addition to stripping text, you can also try matching:

	A smarter parser rule (this is the no leet speak allowed rule):
		if input contains "\w\d+\w":
			identify error as no leet speak allowed rule;
			reject the command.

"if input contains (a regular expression)" will be true if the given expression appears as its own word or set of words in the rejected command. You can also test the conditions "if input starts with" or "if input ends with." To any of these you can add the phrase option ", even within words" to match more broadly.

If we want to set the reparsed command by hand, we can directly adjust the variable "the reborn command."

You should define the text printed when a new smarter parser rule matches by continuing the Table of Smarter Parser Messages. (If there is no matching entry, nothing will be printed when this rule matches, which is sometimes what you want for very minor corrections.)

	Table of Smarter Parser Messages (continued)
	rule name						message
	no leet speak allowed rule	"This story requires you to use proper spelling and grammar."

Note that rules are tried in the order listed. "asking who am i," which would match the command >WHO AM I, needs to come before "asking unparseable questions," which matches the pattern "who (any text)". If the order were reversed, "asking who am i" would never be run. In general, more specific rules involving the same words should come before more general rules.

A final note: checking regular expressions causes a certain performance hit, so the more rules you add, the slower things will be. The slowdown only happens when the player types misunderstood input, but keep in mind this might be rather frequent for new players, many of whom may be playing your story on a slow interpreter such as Quixe for the web.


Example: * Caverns and Kobolds - A tiny scenario to test misunderstood input with.

	*: "Caverns and Kobolds"

	Include Smarter Parser by Aaron Reed.

	Spooky Cave is a room. A glowing sword is in Spooky Cave. Dark Tunnel is north of Spooky Cave. A dusty skull is in Dark Tunnel. The kobold is a man in Tunnel. The kobold holds a spear.

	A smarter parser rule (this is the no leet speak allowed rule):
		if input contains "\w\d+\w":
			identify error as no leet speak allowed rule;
			reject the command.

	A smarter parser rule (this is the stripping formal address rule):
		if stripping "(sir|maam)" is fruitful:
			identify error as stripping formal address rule;
			reparse the command.

	The stripping formal address rule is listed first in the smarter parser rules.

	Table of Smarter Parser Messages (continued)
	rule name			message
	no leet speak allowed rule		"This game requires you to use proper spelling and grammar."
	stripping formal address rule		"I appreciate your respect, but all you need to do is type your commands directly."
	
	Test me with "ub4r l33t / what do I do then?? / who am i? / who are you / where am I!? / which way should I go / go to sword / please take the sword sir / this is stupid / drop the damned sword / why is the sky blue / I want to take the sword / go somewhere / carefully go north / go north then / anyway look around / hello / get kobold's spear / touch kobold's hand / touch ceiling / touch skull with my foot / touch skull / scratch head / wait for a while / I like this game after all".

Example: * Stress test - A large archive of edge cases and actual misunderstood newbie inputs. Not all of these are caught by Smarter Parser, but are included to help ensure the extension is not making things less clear (or for speed profiling thousands of regular expression calls).

	*: "Stress Test"

	Include Smarter Parser by Aaron Reed.

	Stage is a room. A sword is in Stage. A cat is a male animal in Stage. A cube is a fixed in place supporter in Stage. Understand "Molly" as cat. Bob is a man in Stage. An apple is in Stage.

	East of Stage is Isolation Ward. North of Isolation Ward is Cell. The prisoner is a person in cell. A dog is an animal in cell. North of Cell is Foyer. Suzan and a lady barrister are women in Foyer. Mister Aleric Chesterworth and the Prime Minister are men in Foyer. The platform is a fixed in place supporter in Foyer. The bolt is part of the platform. The glass bowl is a transparent closed unopenable container. It is part of the platform. In the glass bowl is a screwdriver. The crowd is a backdrop in Foyer. An orange is in Foyer.
            
	The alcove is inside from Foyer. Spleenwards is a direction. The opposite of spleenwards is liverwurst. Liverwurst is a direction. The opposite of liverwurst is spleenwards. The kidney room is spleenwards from  the Foyer. Stage is east from the kidney room.

	test punctuation with "? / get sword & cat / x cat; x sword: x cube? x me / ~wait / wait* / get (cat) / (get cat / * / ???look / !!?!! / look??go north / north???!".

	Test examples with "who are you / hello / e / who are you / hello / n / who are you / hello / hello / n / who are you / who are you / hello / hello / hello / in / who are you / out / spleenwards / who are you / who are you / who are you".  

	Test standardize with "who is there / who's there / who i'm speaking to / who're you / I'll go north / who I've been talking to" 

	test where with "which way / can I go / what direction should I move in" 

	test confusion with "I'm confused / I don't get it / how can I play / what should I do"

	test niceties with "please go north / can I jump / please go / please / please please / please please please look please wait please".

	test interjections with "what in the hell / who the hell are you / take the freaking sword / the shit / you're the shit / this is balls / in the name of god run"

	test frustration with "commit suicide / you're stupid / I hate this / screw you / go to hell / die in a fire / MORON / what in the hell is that?"
 
	test words with "one two three four five / one two three four five six / one two three four five six seven / wait. wait. wait. wait. wait. / wait & wait & wait & xyzzy".
 
	test who with "who are you? / who said that / who am i talking to / who've i been speaking with / who's there / whos talking / who is saying that". 
    
	test whome with "who am I? / who am i supposed to be?"
 
	test whereami with "where am i / look at the room / look around / search area / what is this place / look in room".  

	test questions with "what should i do / who is that man / where is the sword / why am I playing this / which sword should I choose / how do I solve this puzzle / do I have to go north?".
  
	test intro with "i want to go north / I'm going north / I'm going to take sword / I'll wait / I'll try to wait / I'd like to listen / can I get the sword / try to listen / try listening / try going north / should I stop / let's go west / I think we should go west".

	test assertions with "I am happy / I can do anything / I don't care about you / He's crazy / She is a bird / It is only natural / This is interesting / You have a problem / Your fly is unzipped".

	test adverbs with "go carefully north / find fly / find lyre / look at lysander / look at Pigglywiggles / pet molly / give molly some cream / where is molly / golly this is fun / really / Really I mean it / This is awefully dangerous / casually pet the cat / think locally, not globally / run really fast / run really quickly / run carefully north".   
 
	test movewithin with "get closer to cat / move away from cat / stand next to cat / get in front of cat / go to cat / go over to cat / walk near the cat / move underneath cat / go farther away / get inside cat / climb up to cat / walk around cat".
 
	test vague with "somebody listen / is anyone there / take everyone / nobody likes me / go anyplace / walk to somewhere / here".

	test pointless with "anyway get cat / go north instead / very carefully attack cat / walk almost north / so just listen now / next try waiting / walk a little farther".

	Understand "attack [something] with [something]" as targetting. Targetting is an action applying to two things. Carry out targetting: say "You target [the noun] with [the second noun]."

	test failedwith with "get cat with my hands / get cat with patience / get cat using my brain / get cat using legs / get cat by using my hands / kill cat with sword / kill cat with the blunderbuss / attack cat with / attack cat burgler / attack cat with fence / attack cat with sword".

	test surroundings with "look at ground / sit on floor / go left / climb above cat / touch ceiling / forward / look backward / examine sky"

	test body with "take bob's hand / hit bob with my fist / get on my knees / slit wrists / kiss tongue / touch bob on his chest / cut bob's fingernails" 
	
	test clothes with "take off shirt / remove underwear / untie shoes / tie tie / undo belt"

	test possessives with "x suzan's orange / suzan's a weirdo / get orange's / get aleric's goat / examine suzan's barrister"	

	test newbies with "talkto cat / talk cat / smack cat / damn cat / wait for cat / call cat / stay here with cat / hello cat / bye / get apple, cat / say hi / yo / tell cat to ask me about the apple / cat, what seems to be the problem? / hit me, cat / Where is cat / I am ready to fight! / what next? / why not / who is cat / who is there / the voice outside bother me / please help me / who is around / what is in the room / what is it / what do you want me to do? / i have to go home / what do you mean / what happened / talk to cat / hmm / what apple / what is apple / who / enter / stand / leave\ / back / lay down / walk outside / go Stage / go Outdoors / move / right / leave room / leave Stage / leave Outdoors / jump across apple / walk apple / go to apple / goto apple / put the apple on the ground / examine the apple on the floor / find apple / look room / exit right / sit apple / lie on stage / lie on floor / lie on apple / approach apple / run east / go through door / use door / open doors / exit door / look left / sleep on apple / look behind apple / jump down / return / move apple /  go back / climb apple / walk away / sit / look outside / exit door / walk into door / exit apple / follow cat / help' / get appl / lsk s / take golden ap / wati / \asdf / ;apple / looka ta apple / gt apple / dfsdf / waiyt / help0 / 0 / 'exit' / goodbuy / get apepl / loook / udno / zlook / ook / poop / smile / ok / don't hesitate / laugh / commit suicide / choke and die from poison / explore / kill myself / lol / die / suicide / scream / pick nose / l33t hax0r skillz / shrug / hear / cool / for goodness sake give me my apple / say maybe I can eat it later / get ye flask / lick self / take a nap / ... / close my eyes / search ground / damn / okay / hi / kill me with apple / kill me / kill self / look apple / get that apple / use apple / listen apple / drop apple / make to to apple / raise apple / put the apple back / drop apple / info look / grab apple / drop apple / more / bring apple / swallow apple /  view apple / grab apple / stare apple / inspect apple / see apple / lift apple / hold apple / lay on apple / feel apple / put hand on apple / think of apple / lie down in apple / walk on apple / don apple / carry apple / use apple on cat / throw apple against the wall / take and go /  please take / listen more / listen then / take a lot / watch /  detailed instructions / what actions are there / what commands are available"

	test all with "test punctuation / test standardize / test where / test confusion /test niceties / test interjections / test frustration / test words / test who / test whome / test whereami / test questions / test intro / test assertions / test adverbs / test movewithin / test vague / test pointless / test failedwith / test surroundings / test body / test newbies / test clothes / test possessives".

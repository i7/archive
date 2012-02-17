Version 2/111127 of Player Experience Upgrade by Aaron Reed begins here.

"A compilation extension to significantly improve player experience by improving the parser, correcting misspelled words, understanding more synonyms, providing more helpful library messages, and addressing common misconceptions."

"Includes Approaches and Punctuation Removal by Emily Short, Epistemology by Eric Eve, Default Messages by Ron Newcomb, and Smarter Parser, Poor Man's Mistype, Numbered Disambiguation Choices, Small Kindnesses, Neutral Library Messages, Remembering, and Extended Grammar by Aaron Reed."

Book - Compatibility

Chapter - Inclusions

Include Plurality by Emily Short. Include Punctuation Removal by Emily Short. [These are both part of the default Inform distribution, so we are safe to simply include them.]

Chapter - Basic Refusing Keys (for use without Locksmith by Emily Short)

Refusing keys of something is an activity.

Rule for refusing keys of something (called locked-thing) (this is the standard printing key lack rule):
	say "You lack a key that fits [the locked-thing]."
	
Chapter - Set up Punctuation Removal

First after reading a command (this is the Player Experience Upgrade engage punctuation removal rule): resolve punctuated titles.

Chapter - Limited Approaches

[We create an option to allow authors to restrict approaches to only work for adjacent rooms.]

Use single room approaches translates as (- Constant SINGLE_ROOM_APPROACHES; -).

Table of Player Experience Upgrade Messages
rule name	message
Player Experience Upgrade limited approaches rule	"[as the parser]You can only travel one location at a time.[as normal][line break]"

Check approaching when the single room approaches option is active (this is the Player Experience Upgrade limited approaches rule):
	if the noun is not adjacent, instead say the message corresponding to a rule name of Player Experience Upgrade limited approaches rule in Table of Player Experience Upgrade Messages.

Book - Epistemology by Eric Eve (for use without Epistemology by Eric Eve)

[We need to adjust the heading levels to correspond with our mechanism here.]

Chapter 1 - Sight

A thing can be either seen or unseen. A thing is usually unseen.

[ It might seem more straightforward simply to write "Now everything visible in the location is seen." but
  this turns out to be unacceptably slow in practice. The following code does approximately the same thing
  but much faster.]

Carry out looking (this is the mark items as seen when looking rule): 
  unless in darkness begin;    
  repeat with item running through things that are enclosed by the location begin;   
       if the item is not enclosed by an opaque closed container, now the item is seen;  
  end repeat;
 end unless.

Carry out opening a container (this is the mark items as seen on opening a container rule):
  repeat with item running through things that are enclosed by the noun begin;   
       if the item is unseen and the item is visible, now the item is seen;  
  end repeat.

The mark items as seen on opening a container rule is listed after the standard opening rule in the carry out opening rules.

Chapter 2 - Familiarity

Section 1 - Basic Familiarity

A thing can be familiar or unfamiliar. A thing is usually unfamiliar.

Carry out examining something visible (this is the mark items as seen on examining rule):
 now the noun is familiar;
 now the noun is seen.

Definition: a thing is known if it is familiar or it is seen.

Definition: a thing is unknown if it is not known.

Section 2 - Subject (for use without Threaded Conversation by Emily Short) 

A subject is a kind of thing. The specification of a subject is "Something that conversation can refer to, but which has no real-world presence or functionality."


Section 3 - Familiarity of Subjects

A subject is usually familiar.



Chapter 3 - Testing commands - not for release

Requesting epistemic status of is an action out of world applying to one visible thing.

Understand "epistat [any thing]" as requesting epistemic status of.

Report requesting epistemic status of:
  say "[noun] - [if seen]seen[otherwise]unseen[end if] / [if familiar]familiar[otherwise]unfamiliar[end if] / [if known]known[otherwise]unknown[end if]."


Book - Approaches by Emily Short

[Version 4]

A person can be staid or hurrying. A person is usually staid.
A room can be proper-named or improper-named.

Before refusing keys for something (this is the tell the preface blocked doors with path walked rule): 
	say "[path-walked so far]".
	
Rule for refusing keys for a door (called locked-thing) when the player is hurrying (this is the tell the player when blocked at a door rule):
	say "Unfortunately, you find you lack a key that fits [the locked-thing].[no line break]";
	rule succeeds.

A person has a list of objects called the path so far.
A person has a list of indexed text called described motion.
	
To say path-walked so far:
	carry out the describing path activity with the player.

Describing path of something is an activity.

Rule for describing path of someone (called the worker) (this is the default path description rule):
	if the number of entries in the path so far of the worker is greater than 0:
		if the location is not the noun:
			let N be the number of entries in the described motion of the worker;
			let last movement be entry N in the described motion of the worker;
			truncate the described motion of the worker to (N - 1) entries;
			if N is 1:
				say "[The worker] head[s]";
			otherwise:
				say "[The worker] go[es] [described motion of the worker]";
				if N is greater than 2, say ", before heading"; 
				otherwise say ", then head[s]"; 
			say " [the last movement]. [run paragraph on]";
		otherwise:
			say "[The worker] go[es] [described motion of the worker]. [run paragraph on]";
	clear path-walked for worker.
		
To clear all/the/-- path-walked for (worker - a person):
	truncate the described motion of the worker to 0 entries;
	truncate the path so far of the worker to 0 entries.

Understand "go to [any visited room]" or "go back to [any visited room]" or "return to [any visited room]" or "revisit [any visited room]"  as approaching.  

Approaching is an action applying to one visible thing.

Check an actor approaching (this is the can't approach our current location rule):
	if the noun is the location of the actor:
		if the actor is the player, say "You're already in [the location].";
		stop the action;

The approach-finding rules are a rulebook.

The approach-heading is an object that varies.
The approach-destination is a room that varies.
The final destination is a room that varies.

A first approach-finding rule (this is the recording destination rule):
	now the final destination is the noun.

An approach-finding rule (this is the approach-heading selection rule):
	now approach-heading is the best route from the location to the noun through visited rooms, using doors;
	if approach-heading is not a direction:
		now approach-heading is the best route from the location to the noun through visited rooms, using even locked doors;

An approach-finding rule (this is the refusing bad headings rule):
	if approach-heading is not a direction:
		say "You can't think how to get there from here.";
		rule fails; 

An approach-finding rule (this is the find outcome rule):
	now approach-destination is the room approach-heading from the location; 

An approach-finding rule (this is the actual approach movement rule):
	silently try going approach-heading. 

An approach-finding rule (this is the abort movement if held up rule):
	if the location is not the approach-destination:
		clear the path-walked for the player;
		now the player is staid; 
		say conditional paragraph break;
		try looking;
		rule fails; 

Carry out going while the player is hurrying (this is the creating a path history rule):
	add the approach-heading to the path so far of the player;
	let approach-destination-name be indexed text;
	let approach-destination-name be "[the approach-destination]";
	let adverb be indexed text;
	let adverb be "";
	let X be the number of entries in the path so far of the player;
	if X is greater than 1:
		let previous direction be entry (X - 1) in the path so far of the player;
		if the previous direction is the approach-heading, now adverb is "again ";  
	let N be indexed text;
	if approach-destination is proper-named:
		let N be "[approach-heading] [adverb]to [approach-destination-name]";
	otherwise:
		let N be "[approach-heading] [adverb]to [approach-destination-name in lower case]"; 
	add N to the described motion of the player; 

An approach-finding rule (this is the final approach success rule):
	rule succeeds.

Carry out approaching (this is the default approaching rule):
	clear path-walked for the player;
	now the player is hurrying;
	let initial location be the location; 
	while the location is not the noun:
		follow the approach-finding rules;
		if rule failed:
			now the player is staid;
			stop the action;
	now the player is staid;

Carry out someone approaching (this is the other character approach rule):
	clear path-walked for the actor;
	let initial location be the location of the actor; 
	while the location of the actor is not the noun:
		now approach-heading is the best route from the location of the actor to the noun, using doors;
		if approach-heading is not a direction:
			now approach-heading is the best route from the location of the actor to the noun, using even locked doors;
		if approach-heading is not a direction:
			stop the action; 
		now approach-destination is the room approach-heading from the location of the actor; 
		try the actor going the approach-heading;
		if the location of the actor is not the approach-destination:
			stop the action.

Report approaching when the location is the noun and the number of entries in the path so far of the player is greater than 1 (this is the describe overall path on arrival rule):
	carry out the describing path activity with the player;
	say paragraph break;
	try looking instead.
	
Report approaching when the location is the noun (this is the default looking on arrival after approaching rule):
	clear path-walked for the player;
	try looking instead.



Book - Smarter Parser by Aaron Reed (for use without Smarter Parser by Aaron Reed)

[Version 14/110802]

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


Book - Poor Man's Mistype by Aaron Reed 

[Version 7]

Chapter - Sequence

The Poor Man's Mistype rule is listed before the stripping unnecessary addendum rule in the Smarter Parser rules. The strip misspelled articles rule is listed before the Poor Man's Mistype rule in the Smarter Parser rules.

Chapter - Rules

A smarter parser rule (this is the strip misspelled articles rule):
	if stripping "(teh|th)" is fruitful:
		identify error as strip misspelled articles rule;
		reparse the command.		

A smarter parser rule (this is the Poor Man's Mistype rule):
	let wnum be the position of first bad word;
	if wnum > 0:
		let badword be indexed text;
		now badword is word number wnum in reborn command;
		if the number of characters in badword < 3, no match;
		let first3 be indexed text;
		now first3 is "[character number 1 in badword][character number 2 in badword][character number 3 in badword]";
		let candidate be indexed text;
		repeat with item running through things enclosed by location:
			if item is visible:
				now candidate is printed name of item in lower case;
				if candidate matches the regular expression "\b[first3]":
					repeat with wordcounter running from 1 to the number of words in candidate:
						if word number wordcounter in candidate matches the regular expression "\b[first3]":
							replace the regular expression "\b[badword]\b" in the reborn command with "[word number wordcounter in candidate]";
							identify error as the Poor Man's Mistype rule;
							reparse the command.

A smarter parser rule (this is the most common verb misspellings rule):
	if the latest parser error is the not a verb I recognise error:
		if input contains "^(lok|loook|ook)":
			identify error as most common verb misspellings rule;
			replace the regular expression text matching subexpression 1 in the reborn command with "look";
			reparse the command;
		if input contains "^(tkae)":
			identify error as most common verb misspellings rule;
			replace the regular expression text matching subexpression 1 in the reborn command with "take";
			reparse the command.	
					
Chapter - Utilities
					
To decide which number is the position of first bad word: (- GetFirstNonDictWord() -).

Include (-

[ GetFirstNonDictWord myword   twn;
	twn=wn;
	wn = 1;
	myword = 0;
	while (myword ~= -1) {
		myword = NextWordStopped();
		if (myword == 0) {
			myword=wn-1;
			wn=twn;
			return wn-1;
		}
	}
	myword=wn-1;
	wn=twn;
	return -1;	
];

-).

Book - Numbered Disambiguation Choices by Aaron Reed

[Version 6/111127]

Chapter - Setup

Section - Disambiguation ID

Every thing has a number called disambiguation id. The disambiguation id of something is usually 0.  
 
Understand the disambiguation id property as describing a thing. Understand the disambiguation id property as describing an animal. [I'm not sure why this second line is necessary, but for some reason, it is.]

Section - List of disambiguables

The list of disambiguables is a list of objects that varies.

Section - disambiguation-busy

disambiguation-busy is a truth state that varies. disambiguation-busy is false. [In certain cases numbers could be printed twice. Thanks to Robert Jenkins for pointing this out.]

Chapter - Appearance

The before disambiguation number text is some text that varies. The before disambiguation number text is "". 

The after disambiguation number text is some text that varies. The after disambiguation number text is ") ". 

Chapter - Number Choices

Before printing the name of something (called macguffin) while asking which do you mean (this is the Numbered Disambiguation Choices preface disambiguation objects with numbers rule):
	if disambiguation-busy is false:
		now disambiguation-busy is true;
		add macguffin to the list of disambiguables, if absent;
		now the disambiguation id of macguffin is the number of entries in list of disambiguables;
		say "[before disambiguation number text][the number of entries in list of disambiguables][after disambiguation number text]".

After printing the name of something while asking which do you mean (this is the Numbered Disambiguation Choices cleanup disambiguation-busy flag rule):
	now disambiguation-busy is false.

Before asking which do you mean (this is the Numbered Disambiguation Choices reset disambiguables rule):
	repeat with item running through list of disambiguables:
		now disambiguation id of item is 0;
	truncate list of disambiguables to 0 entries.

Chapter - Fix number error

[Unfortunately, the above understand rules mean Inform thinks any misunderstood sentence is misunderstood because of a number, and will issue a confusing library error message (Misc #29). I can't think of a good way to fix this-- you'd have to loop over grammar lines and check if the player was using one that legitimately called for a number, or something-- so this just replaces the "number" message with the more general "I didn't understand that sentence" message, which is still accurate.]

Rule for printing a parser error when the latest parser error is the didn't understand that number error (this is the Numbered Disambiguation Choices don't use number rule):
	now the latest parser error is the didn't understand error;
	make no decision.
	[issue miscellaneous library message number 27.]

Chapter - Understand preface

[In testing, some players would try to respond with something like "1) dog collar". If we replace closing parentheses from the input with a space, this can still be understood, rather than producing an unhelpful error.]

After reading a command (this is the Numbered Disambiguation Choices strip closing parenthesis rule):
	let disam-cmd be indexed text;
	let disam-cmd be the player's command;
	replace the regular expression "\)" in disam-cmd with " ";
	change the text of the player's command to disam-cmd.
	
Chapter - When to reset numbers

[How long should the disambiguation ID number still be understood as referring to the assigned item? Some players will try to use the numbers on subsequent turns as shortcuts. However, keeping them indefinitely can create a problem with duplicate objects: the disambiguation ID property makes them distinguishable, so "two apples" will start being identified as "an apple" and "an apple." To address this, we reset the numbers as soon as the player enters a command which does not include a number.]

After reading a command when the number of entries in list of disambiguables > 0 (this is the Numbered Disambiguation Choices reset disambiguation id when no numbers in command rule):
	let disam-cmd be indexed text;
	let disam-cmd be the player's command;
	unless disam-cmd matches the regular expression ".*\d.*":
		consider the Numbered Disambiguation Choices reset disambiguables rule.
		

Book - Small Kindnesses by Aaron Reed

[Version 11/110320]
[Reminder: "Go Back returns to previous location" needs to be altered to not include the special section for Approaches.]

Chapter - Responses

Table of Small Kindnesses Responses
rule name	message
Small Kindnesses carry out using rule	"[as the parser]You'll have to try a more specific verb than use.[as normal][line break]" 


Chapter - Exit leaves when there's only one way to go

[If a room only has a single exit, typing EXIT should use it. Works through doors. This extends the functionality in Emily Short's Modified Exit, which is already overriding the Standard Rules here. ]

Check an actor exiting (this is the Small Kindnesses exit leaves when there's only one way to go rule):
	let the local room be the location of the actor;
	if the container exited from is the local room:
		if the actor is the player and the count of indirectly-adjacent rooms is 1:
			let way be best route from location to the first indirectly-adjacent room, using even locked doors;
			if way is inside:
				issue library message going action number 2 for the local room;
				stop the action;
			if way is a direction, convert to the going action on way;
		otherwise if the room-or-door outside from the local room is not nothing:
			convert to the going action on the outside.

To decide what number is the count of indirectly-adjacent rooms:
	let ctr be 0;
	repeat with dir running through directions:
		let dest be the room-or-door dir from location;
		if dest is a room:
			increase ctr by 1;
		otherwise if dest is a door and the other side of dest from location is a room:
			increase ctr by 1;
	decide on ctr.

To decide what room is the first indirectly-adjacent room:
	repeat with dir running through directions:
		let dest be the room-or-door dir from location;
		if dest is a room:
			decide on dest;
		otherwise if dest is a door and the other side of dest from location is a room:
			decide on the other side of dest from location;
	decide on location.
				

Section A (for use with Modified Exit by Emily Short)

The small kindnesses exit leaves when there's only one way to go rule is listed instead of the new convert exit into go out rule in the check exiting rules.

Section B (for use without Modified Exit by Emily Short)

The small kindnesses exit leaves when there's only one way to go rule is listed instead of the convert exit into go out rule in the check exiting rules.

Chapter - Leaving a named objects (for use without Modified Exit by Emily Short) 

Understand "exit [thing]" as getting off. Understand "get out of [thing]" as getting off.

This is the new can't get off things rule:	
	if the actor is on the noun, continue the action;
	if the actor is carried by the noun, continue the action;
	if the actor is in the noun, continue the action;
	stop the action with library message getting off action number 1 for the noun.

The new can't get off things rule is listed instead of the can't get off things rule in the check getting off rules.


Chapter - Go Back returns to previous location


The small kindnesses former location is a room that varies.

First carry out going rule (this is the Small Kindnesses store former location rule): 
    now the small kindnesses former location is the location.

Understand "go to" or "go back to" or "go back" or "return" or "return to" or "revisit" or "back" or "retreat" as approaching.

Rule for supplying a missing noun when we are approaching (this is the Small Kindnesses supply missing noun when approaching rule):
	now the noun is the small kindnesses former location.


Chapter - Examining the room

Understand "look at/around/in/into the/a/an/some [room]" or "look at/around/in/into [room]" or "look [room]" or "x [room]" or "examine [room]" or "search [room]" as overly elaborate looking. Overly elaborate looking is an action applying to one thing. 

After deciding the scope of the player when overly elaborate looking (this is the Small Kindnesses place the room in scope while looking rule):
   place the location in scope, but not its contents.

Carry out overly elaborate looking (this is the Small Kindnesses overly elaborate looking rule):
	instead try looking.
	
Chapter - Leave to exit

Understand "leave [room]" or "exit [room]" or "flee [room]" as getting off.

After deciding the scope of the player when getting off (this is the Small Kindnesses place the room in scope while getting off rule): place the location in scope, but not its contents.

Instead of getting off the location (this is the Small Kindnesses overly elaborate exiting rule), try exiting.

Understand "leave room/area/place/here" as exiting.


Chapter - Show valid directions after going nowhere

[Based on the "Bumping into Walls" example. Tell players trying to move invalidly which directions are open.]

Use no normal movement tricks translates as (- Constant NO_NORMAL_MOVEMENT_TRICKS; -).

Instead of going nowhere (this is the Small Kindnesses reporting on exits rule):
	if the no normal movement tricks option is active, continue the action;
	if in darkness:
		issue miscellaneous library message number 17; ["It is pitch dark, and you can't see a thing."]
		stop the action; 
	issue library message going action number 2 for the room gone from;
	try listing exits.

Section - Listing Exits (for use without Keyword Interface by Aaron Reed)

Definition: a direction is viable if the room it from the location is a room. 

Listing exits is an action out of world applying to nothing. Understand "exits" as listing exits. The listing exits action has a number called the count of exits.

Carry out listing exits (this is the Small Kindnesses count exits rule): now count of exits is the number of viable directions.

Report listing exits when count of exits is 0 (this is the Small Kindnesses report on no exits rule):
	say the message corresponding to a rule name of Small Kindnesses report on no exits rule in the Table of Small Kindnesses Responses.

Report listing exits when count of exits is 1 (this is the Small Kindnesses report on one exit rule):
	say the message corresponding to a rule name of Small Kindnesses report on one exit rule in the Table of Small Kindnesses Responses.

Report listing exits when count of exits > 1 (this is the Small Kindnesses report on exits rule):
	say the message corresponding to a rule name of Small Kindnesses report on exits rule in the Table of Small Kindnesses Responses.

Table of Small Kindnesses Responses (continued)
rule name	message
Small Kindnesses report on no exits rule	"[as the parser]In fact, you can't see any obvious exits.[as normal][line break]"
Small Kindnesses report on one exit rule	"[as the parser]The only way to go is [list of viable directions].[as normal][line break]"
Small Kindnesses report on exits rule	"[as the parser]From here, you can go [list of viable directions].[as normal][line break]"


Chapter - Allow for switching things in darkness

[If the player switches off something providing light and not held, allow them to switch it back on again. ]

Definition: a thing is switchable: if it provides the property switched on, yes.

After deciding the scope of the player when in darkness (this is the Small Kindnesses allow for switching things in darkness rule):
	repeat with machine running through switchable things enclosed by location:
		unless the holder of machine is a closed opaque container and the holder of machine is not the holder of player, place machine in scope.


Chapter - Don't perform implicit actions for doomed tasks

[Inspired by (but implemented differently from) the "Delicious, Delicious Rocks" example. Don't bother to try automatically taking something as a result of an EAT or WEAR command that can't possible work (because the noun isn't eatable or wearable).]

Before eating an inedible thing (this is the Small Kindnesses don't implicitly take inedibles rule): 
	stop the action with library message eating action number 1 for the noun.

Before wearing a not wearable thing (this is the Small Kindnesses don't implicitly take unwearables rule):
	stop the action with library message wearing action number 1 for the noun. 

Chapter - Implement Use verb for common actions

[Based on "Alpaca Farm" in the I7 docs. Does the most obvious action if the player tries to USE something.]

Understand "use [something]" as using. Using is an action applying to one thing.

Carry out using (this is the Small Kindnesses carry out using rule): say the message corresponding to a rule name of Small Kindnesses carry out using rule in the Table of Small Kindnesses Responses.

Understand "use [an edible thing]" as eating. 

Understand "use [a wearable thing]" as wearing. 

Understand "use [a closed openable container]" as opening. Understand "use [an open openable container]" as closing. 

Understand "use [something preferably held] on [a locked lockable thing]" as unlocking it with (with nouns reversed). Understand "use [something preferably held] on [an unlocked lockable thing]" as locking it with (with nouns reversed). 

Understand "use [a switched off device]" as switching on. [We don't have the reverse, since typically something that's switched on has a more useful function which USE might refer to.]

Understand "use [a closed door]" as opening. Understand "use [an open door]" as entering. 

Understand "use [an enterable not occupied supporter]" as entering. Understand "use [an enterable not occupied container]" as entering. Definition: something is occupied if it encloses the player.



Book - Default Messages by Ron Newcomb

[Version 3]

Section - Default Messages

Use library message alerts translates as (- Constant LIBRARY_MESSAGE_ALERTS; -). 

To say library message verb: (- PrintCommand(); -). [prints the whole command except for the person asked & the comma]
To say library message pronoun: (- print (address) pronoun_word; -).
To say ignore library line break: (- lm_n = -1; -).

Table of custom library messages
library-action	library-message-id	library-message-text
action-name			number			text


[Section - some backwards compatibility that doesn't use memory, I think - unindexed

The main object is an object that varies. The main object variable translates into I6 as "lm_o".
The secondary object is an object that varies. The secondary object variable translates into I6 as "lm_o2".]


Section - internal (in place of Section SR5/8/2 - Message support - Intervention - Unindexed in Standard Rules by Graham Nelson) unindexed

To #if library message alerts is active and not in a release build: (- #ifdef DEBUG; #ifdef LIBRARY_MESSAGE_ALERTS; -). 
To #end if library message alerts is active and not in a release build: (- #endif; #endif; -). 

To decide if intervened in miscellaneous message: 
	repeat through the table of custom library messages in reverse order:
		if the library-message-id entry is the library message number and there is no library-action entry:
			say the library-message-text entry;
			unless library message number is -1, say line break;
			decide yes;
	#if library message alerts is active and not in a release build;
	say "{ library message #[library message number] }[paragraph break]";
	#end if library message alerts is active and not in a release build;
	decide no.

To decide if intervened in miscellaneous list message: 
	increase library message number by 100;
	repeat through the table of custom library messages in reverse order:
		if the library-message-id entry is the library message number and there is no library-action entry:
			say the library-message-text entry;
			decide yes;
	#if library message alerts is active and not in a release build;
	say "{ library message #[library message number] }[paragraph break]";
	#end if library message alerts is active and not in a release build;
	decrease library message number by 100;
	decide no.

To decide if intervened in action message: 
	repeat through the table of custom library messages in reverse order:
		if the library-message-id entry is the library message number  and there is a library-action entry and the library-action entry is the library message action:
			say the library-message-text entry;
			unless library message number is -1, say line break;
			decide yes;
	#if library message alerts is active and not in a release build;
	say "{ [library message action] action #[library message number] }[paragraph break]";
	#end if library message alerts is active and not in a release build;
	decide no.

Book - Neutral Library Messages by Aaron Reed

[Version 2/110709]

Chapter - Messages

Section - Better Instruction

[Some messages do not give the player enough information about why their command failed, or what the expected input form is.]

Table of custom library messages (continued)
library-action	library-message-id	library-message-text
--	14	"[as the parser]Nothing to correct. 'Oops' or 'O' followed by a word corrects a single misunderstood word in the last command.[as normal]" ["Sorry, that can't be corrected."]
--	16	"[as the parser]Too many words. 'Oops' or 'O' corrects a single misunderstood word in the last command.[as normal]" ["'Oops' can only correct a single word."]
--	23	"[as the parser]In some stories, you can type CHARACTER, COMMAND to give someone else an order; but I couldn't understand what you said in that context.[as normal]" ["You seem to want to talk to someone, but I can't see whom."]
--	25	"[as the parser]In some stories, you can type CHARACTER, COMMAND to give someone else an order; but I couldn't understand some of what you said before the comma in that context.[as normal]" ["To talk to someone, try 'someone, hello' or some such."]
--	28	"[as the parser]I can't understand your entire command, although the first part matched the action [ignore library line break]" ["I only understood you as far as wanting to [ignore library line break]] [NOTE: This message is usually (always?) generated now by the special rules in "Section - Only as far as" ]
--	29	"[as the parser]I can't understand your entire command, although the first part matched an action I expected to include a number.[as normal]" ["I didn't understand that number."]
--	44	"[as the parser][if command includes except]That excludes everything.[otherwise]There is nothing available to [the quoted verb].[as normal]" ["There are none at all available!" <!-- TAKE ALL or TAKE X EXCEPT Y]
--	67	"[as the parser]Part of your command is not a physical part of the story world, so you can't act on it in that way.[as normal]"  ["You must name something more substantial."]
Exiting action	1	"[as the parser]You're not inside something. To leave this location, try a direction or 'out'.[as normal]" ["But you aren't in anything at the moment."]
climbing action	1	"[as the parser][That-Those of noun] can't be climbed in that way. Sometimes a direction like 'up' or 'down' works instead.[as normal]" ["I don't think much is to be achieved by that." <-- This is to help address a common problem in poorly implemented works with something like a staircase and no support for CLIMBing it.]
taking action	10	"[as the parser][That-those of noun] [is-are] just scenery, and can't be taken.[as normal]" ["That's hardly portable."]

To decide whether command includes except: if the player's command includes "but" or the player's command includes "except", decide yes.

Section - Generic action rejections

[Some actions, such as taking, directly interface with the world model and thus can fail with specific explanations as to why. But actions without a detailed world model supporting them can't know whether the player's request is categorically impossible (>DRINK SKY), plausible but not implemented (>DRINK STREAM), or simply not being tried with the correct grammar (>DRINK FROM STREAM).

Unfortunately, many of the default messages attempt to guess which of these situations has arisen, sometimes leading to messages that are counterfactual ("That's plainly inedible") or, more dangerously, misleading ("Violence isn't the answer to this one"). Ideally, these messages should refuse the command without implying anything about the possibility or desirability of the requested action. In addition, since we don't know anything about the author's usage of the verb in question, we can't recommend a better command to try.

Ideally, of course, an author implementing a non-standard verb will replace the default message with his own instructions, but we can't rely on that.
 ]

Table of custom library messages (continued)
library-action	library-message-id	library-message-text
attacking action	1	"[as the parser]Attacking [the noun] would have no effect[can't-addendum].[as normal]" ["Violence isn't the answer to this one."]
burning action	1	"[as the parser]You can't burn [the noun][can't-addendum].[as normal]" ["This dangerous act would achieve little."]
buying action	1	"[as the parser]You can't buy [the noun][can't-addendum].[as normal]" ["Nothing is on sale."]
Cutting action	1	"[as the parser]You can't cut [the noun][can't-addendum].[as normal]" ["Cutting that up would achieve little."]
Drinking action	1	"[as the parser][if noun is player]You can't drink yourself.[otherwise if noun is a person]You can't normally consume other characters.[otherwise]You can't consume [the noun][can't-addendum].[end if][as normal]" ["There's nothing suitable to drink here."]
Eating action	1	"[as the parser][if noun is player]You can't eat yourself.[otherwise if noun is a person]You can't normally consume other characters.[otherwise]You can't consume [the noun][can't-addendum].[end if][as normal]" ["There's nothing suitable to drink here."]
Jumping action	1	"[as the parser]Jumping would have no effect[can't-addendum].[as normal]" ["You jump on the spot, fruitlessly."]
rubbing action	1	"[as the parser]Rubbing [the noun] would have no effect[here-addendum].[as normal]" ["You achieve nothing by this."]
pushing action	1	"[as the parser]Pushing [the noun] would have no effect[here-addendum].[as normal]" ["It is fixed in place."]
setting it to action	1	"[as the parser]You can't set [the noun] to that[can't-addendum].[as normal]" ["No, you can't set that to anything."]
singing action	1	"[as the parser]Singing would have no effect[here-addendum].[as normal]" ["Your singing is abominable."]
swinging action	1	"[as the parser]You can't swing [the noun][can't-addendum].[as normal]" ["There's nothing sensible to swing here."]
taking action	11	"[as the parser][The noun] [is-are]n't portable.[as normal]" ["That's fixed in place." <-- statues, odors, and clouds usually aren't literally fixed in place, you just can't pick them up.]
throwing it at action	2	"[as the parser]Throwing [the noun] at [the second noun] would have no effect[here-addendum].[as normal]" ["You lack the nerve when it comes to the crucial moment."]
Tying it to action	1	"[as the parser]You can't tie [the noun] to [that-those of second noun][can't-addendum].[as normal]" ["You would achieve nothing by this."]

To say can't-addendum: say ", or that's not the way to do so".
To say here-addendum: say " in these circumstances".

Section - NPC action rejections

[Using verbs on people is problematic, since player expectations are so much higher. For this reason the library blocks many actions that are allowed on other objects. Lacking a valid physical objection, these messages fall back on social ones, like "That would be less than courteous." But these messages make assumptions about the player character which may not be appropriate.]

Table of custom library messages (continued)
library-action	library-message-id	library-message-text
pulling action	4	"[as the parser]You can't normally pull [yourself-or-other].[as normal]" ["That would be less than courteous."]
taking action	3	"[as the parser]You can't normally pick up other characters.[as normal]" ["I don't suppose Bob would care for that."]
Turning action	4	"[as the parser]You can't normally turn [yourself-or-other].[as normal]" ["That would be less than courteous."]
showing it to action	2	"[as the parser]You can't show [the noun] to [the second noun][can't-addendum].[as normal]"  ["Bob is unimpressed."]
giving it to action	3	"[as the parser]You can't give [the noun] to [the second noun][can't-addendum].[as normal]" ["Bob doesn't seem interested."]
pushing action	4	"[as the parser]You can't normally push [yourself-or-other].[as normal]" ["That would be less than courteous."]
touching action	1	"[as the parser]You can't touch [the noun][can't-addendum].[as normal]" ["Keep your hands to yourself!"]
squeezing action	1	"[as the parser]You can't squeeze [the noun][can't-addendum].[as normal]" ["Keep your hands to yourself."]
Kissing action	1	"[as the parser]You can't kiss [the noun][can't-addendum].[as normal]" ["Keep your mind on the game."]
Waking action	1	"[as the parser][if noun is player]As far as you know, you're already awake.[otherwise]You can't wake [the noun][can't-addendum].[end if][as normal]" ["That seems unnecessary."]
--	72	"[as the parser]You can't order [the person asked] to do that[can't-addendum].[as normal]" ["Bob has  better things to do."]

To say yourself-or-other: say "[if noun is player]yourself[otherwise]other characters".

Section - Generic action acceptance messages

[Some actions succeed by default. We want to take care to describe these successes in the vaguest possible terms, so as not to contradict any author-written text. Even the cautious default for some of these, "Nothing obvious happens," seems too suggestive that something non-obvious might be happening elsewhere. The default examining message has been very slightly softened, to reduce the incongruency of rare objects being called "nothing special," and to bring it in line with the other default sensory messages.

Conversation actions that succeed mean the parser must admit the action took place, without implying anything about the NPC's reaction: "The detective is unimpressed" can be particularly misleading if you've just shown him a bloody weapon. The solution adopted here is to narrate the player's action, not the NPC's response.]

Table of custom library messages (continued)
library-action	library-message-id	library-message-text
squeezing action	2	"You squeeze [the noun]." ["You achieve nothing by this."]
pushing action	3	"You push [the noun]." ["Nothing obvious happens." <-- for portable objects.]
pulling action	3	"You pull [the noun]." ["Nothing obvious happens."]
turning action	3	"You turn [the noun]." ["Nothing obvious happens."]
examining action	2	"You see nothing unexpected about [the noun]." ["You see nothing special about Bob."]
thinking action	1	"Time passes." ["What a good idea."]
asking it about action	1	"You learn nothing new."  ["There is no reply."]
telling it about action	2	"You learn nothing new." ["This provokes no reaction."]
asking it for action	1	"You aren't successful." ["There is no reply."]
answering it that action	1	"You speak." ["There is no reply."]

Section - You Can't See Any Such Thing 

 [This famous message has frustrated many. Part of the difficulty is the wide variety of circumstances it can appear under. From the player's perspective, this message appears when she tries to use a verb with
	a) something neither mentioned nor implemented (like the sky)
	b) something mentioned in descriptive text but not implemented
	c) something implemented but not given the specific word used as a synonym
	d) a misspelled word
	e) a word that mistakenly is understood as part of the direct object, rather than a word in the grammar line, as in >TAKE INVENTORY NOW which is matched as {take | inventory now}.
	f) something that exists but has never been seen and is not in scope
	g) something previously seen but no longer in scope, perhaps without the player realizing it's no longer available

In nearly all of these cases, the player believes the object they're referring to should exist, meaning the message is often frustrating. 

Distinguishing between these subtle cases can be difficult. For instance, short of capturing all text output and analyzing it, there is no way to distinguish A from B. Perhaps the easiest distinction to make is between commands containing dictionary words and those that don't, which separates A-D from E-G. Some IF systems implement this by telling the player when she's used an invalid word: this is the approach we adopt below.

Several additional extensions can help break things down further. "Remembering" carves off G from E-F, while "Poor Man's Mistype" can sometimes address D. "Smarter Parser" can sometimes offer helpful messages for certain types of A command related to body parts and common environmental features like the sky. Eric Eve's Text Capture could be a tool in distinguishing A from B.
]

Use traditional can't see any such thing translates as (- Constant TRADITIONAL_CANT_SEE; -).

Table of custom library messages (continued)
library-action	library-message-id	library-message-text
--	30	"[as the parser][if the traditional can't see any such thing option is active]You can't see any such thing.[otherwise if the misunderstood word is known elsewhere and position of non-dictionary word is 0]That's not something you can see now, or I misunderstood you.[otherwise if the misunderstood word is known elsewhere]I didn't [recogniz]e all of the words in that command.[otherwise]You don't need to use the word '[the misunderstood word]' in that way.[end if][as normal]" ["You can't see any such thing."]

[Here are some things you can see: [the list of visible things which are not the player].]
["The word 'sky' doesn't refer to anything right now" is a pretty good alternative, from TADS3.]

Section - Personality-neutral parser

[Many parser messages are written in too strong of a narrative voice, which can clash with the author's prose. ]

Table of custom library messages (continued)
library-action	library-message-id	library-message-text
--	9	"[as the parser]You can't see anything.[as normal]" ["It is now pitch dark in here!"]
--	10	"[as the parser]No command given.[as normal]" ["I beg your pardon?"]
--	11	"[as the parser]Can't 'undo' on the first turn.[as normal]" ["[You can't 'undo' what hasn't been done!]"]
--	12	"[as the parser]Can't 'undo' twice in succession.[as normal]" ["Can't 'undo' twice in succession. Sorry!"]
--	15	"[as the parser]Nothing to correct. 'Oops' or 'O' followed by a word corrects a single misunderstood word in the last command.[as normal]" ["Think nothing of it."]
--	19	"[as the parser]As expected.[as normal]" ["As good-looking as ever." <--- although this message does not seem to be used any more, see Section - Player Description below.]
--	21	"[as the parser]There is not a command to repeat.[as normal]" ["You can hardly repeat that."]
--	70	"[as the parser]You can't 'undo' in this story.[as normal]" [The use of UNDO is forbidden in this game."]
Eating action	2	"You eat [the noun]." ["You eat the noun. Not bad."]
Entering action	1	"[as the parser]You're already [if noun is a supporter]on[otherwise]in[end if] [the noun].[as normal]" [But you're already in the car.]
Examining action	1	"It's too dark to examine [that-them of noun]." ["Darkness, noun. An absence of light to see by."]
Giving it to action	2	"[as the parser]You're already holding [it-them of noun].[as normal]" ["You juggle [the noun] for a while, but don't achieve much."]
Looking under action	1	"It's too dark to look under [that-them of noun]." ["But it's dark."]
pushing it to action	3	"[as the parser]There is no exit in that direction.[as normal]" ["Not that way you can't."]
putting it on action	3	"[as the parser][The second noun] doesn't need to hold anything in this story.[as normal]" ["Putting things on the car would achieve nothing."]
putting it on action	4	"[as the parser][if we are dropping]You can't drop yourself.[else]You can't put anything on [the second noun] while you're holding [it-them of second noun].[as normal]" ["You lack the dexterity." <-- Also runs in the "can't drop yourself" rule.]
removing it from action	1	"[as the parser]You can't, because [it-they of noun] [is-are] closed.[as normal]" [It is unfortunately closed.]
searching action	1	"It's too dark to search [that-them of noun]." ["But it's dark."]
sleeping action	1	"You can't sleep right now." ["You aren't feeling especially drowsy."]
taking action	2	"[as the parser]You can't take yourself.[as normal]" ["You are always self-possessed."]
telling it about action	1	"[as the parser]You can't tell yourself about something.[as normal]" ["You talk to yourself a while."]
throwing it at action	1	"[as the parser]You can't throw [that-them of noun], or can't do so in that way.[as normal]" ["Futile." <-- for inanimate objects]
touching action	3	"As expected." ["If you think that'll help." <-- for TOUCH SELF]
Waking up action	1	"As far as you know, you're already awake." ["The dreadful truth is, this is not a dream."]
waving action	2	"You wave [the noun]." ["You look ridiculous waving [the noun]."]
waving hands action	1	"You wave." ["You wave, feeling foolish."]


Section - Performance

[This small set of verbs normally produce jokey or out-of-character responses. These may be read as something the player is directing his character to say, or something he's expressing himself. Here, we simply say that the action does nothing under the current circumstances. ]

Table of custom library messages (continued)
library-action	library-message-id	library-message-text
saying yes action	1	"[as the parser]Saying yes here has no effect.[as normal]" ["That was a rhetorical question."]
saying no action	1	"[as the parser]Saying no here has no effect.[as normal]" ["That was a rhetorical question."]
saying sorry action	1	"[as the parser]Saying sorry here has no effect.[as normal]" ["Oh, don't apologise."]
swearing mildly action	1	"[as the parser]Swearing here has no effect.[as normal]" ["Quite."]
swearing obscenely action	1	"[as the parser]Swearing here has no effect.[as normal]" ["Real adventurers do not use such language."]


Section - Less Excited parser

[Some of the default messages end with exclamation points, which can make the parser seem breathless on occasion. Most of these messages are replaced elsewhere, but for the remainder:]

Table of custom library messages (continued)
library-action	library-message-id	library-message-text
--	31	"[as the parser]You seem to have said too little.[as normal]" [This error may possibly be deprecated now, since I can't find where in the library the error type TOOLIT_PE is ever assigned.]
--	32	"[as the parser]You aren't holding that.[as normal]"
--	36	"[as the parser]You excepted something not included anyway.[as normal]"
--	43	"[as the parser]Nothing to do.[as normal]"
wearing action	1	"[as the parser][if noun is a person]You can't normally wear other characters.[otherwise]You can't wear [that-those of noun].[as normal]"
wearing action	2	"[as the parser]You're not holding [that-those of noun].[as normal]"
wearing action	3	"[as the parser]You're already wearing [that-those of noun].[as normal]"

Section - Story, not Game

[Modern terminology prefers calling an IF a story, not a game. This has been adopted in the main I7 structures, but not yet these messages.]

Table of custom library messages (continued)
library-action	library-message-id	library-message-text
requesting the pronoun meanings action	4	"no pronouns are set.[as normal]"
requesting the score action	1	"[if the story has ended]You scored [otherwise]You have so far scored [end if][score] out of a possible [the maximum score], in [turn count] turn[s][ignore library line break]"
requesting the score action	2	"There is no score in this story" [These two messages are not parser-styled for fiddly reasons specified below.]
Verifying the story file action	1	"The story file has verified as intact."
Verifying the story file action	2	"The story file did not verify as intact, and may be corrupt."

Section - Parser-styled action messages

[Here are the remaining messages not replaced already that should be styled as from the parser. This is a bit of an aesthetic judgment in some cases. ]

Table of custom library messages (continued)
library-action	library-message-id	library-message-text
Closing action	1	"[as the parser][Cap That's-They're of noun] not something you can close.[as normal]"
Closing action	2	"[as the parser][Cap That's-They're of noun] already closed.[as normal]"
Dropping action	1	"[as the parser][The noun] [is-are] already here.[as normal]"
Dropping action	2	"[as the parser]You haven't got [that-those of noun].[as normal]"
Entering action	2	"[as the parser][Cap That's-They're of noun] not something you can [quoted verb posture].[as normal]"
Entering action	3	"[as the parser]You can't get into the closed [noun].[as normal]"
Entering action	4	"[as the parser]You can only get into something free-standing.[as normal]"
Exiting action	2	"[as the parser]You can't get out of the closed [library message object].[as normal]"
Getting off action	1	"[as the parser]But you aren't on [the library message object] at the moment.[as normal]"
Giving it to action	1	"[as the parser]You aren't holding [the noun].[as normal]"
Giving it to action	4	"[as the parser][The second noun] [is-are]n't able to receive things.[as normal]"
Going action	7	"[as the parser]You'll have to say which compass direction to go in.[as normal]"
Inserting it into action	1	"[as the parser]You need to be holding [the noun] before you can put [it-them] into something else.[as normal]"
Inserting it into action	2	"[as the parser][Cap That-Those of noun] can't contain things.[as normal]"
Inserting it into action	3	"[as the parser][The second noun] [is-are] closed.[as normal]"
Inserting it into action	4	"[as the parser]You'll need to take [it-them of noun] off first.[as normal]"
Inserting it into action	5	"[as the parser]You can't put something inside itself.[as normal]"
Locking it with action	1	"[as the parser][Cap That-Those of noun] do[es]n't seem to be something you can lock.[as normal]"
Opening action	1	"[as the parser][Cap That's-They're of noun] not something you can open.[as normal]"
Opening action	3	"[as the parser][Cap That's-They're of noun] already open.[as normal]"
Pushing it to action	1	"[as the parser][The noun] cannot be pushed from place to place.[as normal]"
Pushing it to action	2	"[as the parser]That's not a direction.[as normal]"
Putting it on action	1	"[as the parser]You need to be holding [the noun] before you can put [it-them] on top of something else.[as normal]"
Putting it on action	2	"[as the parser]You can't put something on top of itself.[as normal]"
Showing it to action	1	"[as the parser]You aren't holding [the noun].[as normal]"
Switching off action	1	"[as the parser][Cap That's-They're of noun] not something you can switch.[as normal]"
Switching on action	1	"[as the parser][Cap That's-They're of noun] not something you can switch.[as normal]"
Taking action	5	"[as the parser]You already have [that-those of noun].[as normal]"
Taking action	4	"[as the parser]You'd have to get [if noun is a supporter]off[otherwise]out of[end if] [the noun] first.[as normal]"
Taking action	8	"[as the parser][Cap That-Those of library message object] [is-are]n't available.[as normal]"
Unlocking it with action	1	"[as the parser][Cap That-Those of noun] do[es]n't seem to be something you can unlock.[as normal]"


Section - Parser-styled misc messages

Table of custom library messages (continued)
library-action	library-message-id	library-message-text
--	27	"[as the parser]I didn't understand that sentence.[as normal]" 
--	45	"[as the parser]Who do you mean, [ignore library line break]"
--	46	"[as the parser]Which do you mean, [ignore library line break]"
--	56	".[as normal]"
--	57	"?[as normal]"
--	2	"[as the parser]Nothing to do![as normal]"
--	6	"[as the parser]This platform does not provide 'undo'. Sorry![as normal]"
--	7	"[as the parser]You cannot 'undo' any further.[as normal]"
--	8	"[as the parser]Please give one of the answers above.[as normal]"
--	13	"[as the parser]Previous turn undone.[as normal]"
--	20	"[as the parser]To repeat a command like 'frog, jump', just say 'again', not 'frog, again'.[as normal]"
--	22	"[as the parser]You can't begin with a comma.[as normal]"
--	24	"[as the parser]You can't talk to [the library message object].[as normal]"
--	33	"[as the parser]You can't use multiple objects with that verb.[as normal]"
--	34	"[as the parser]You can only use multiple objects once on a line.[as normal]"
--	35	"[as the parser]I'm not sure what '[pronoun dictionary word]' refers to.[as normal]"
--	37	"[as the parser]You can only do that to something animate.[as normal]"
--	38	"[as the parser]That's not a verb I [recogniz]e.[as normal]"
--	39	"[as the parser]That's not something you need to refer to in the course of this game.[as normal]"
--	40	"[as the parser]You can't see '[pronoun dictionary word]' ([pronoun reference object]) at the moment.[as normal]"
--	41	"[as the parser]I didn't understand the way that finished.[as normal]"
--	42	"[as the parser][if library message amount is 0]None[otherwise]Only [library message amount] of those[end if] [is-are] available.[as normal]"
--	47	"[as the parser]Sorry, you can only have one item here. Which exactly?[as normal]"
--	48	"[as the parser]Whom do you want[if the person asked is not the player] [the person asked][end if] to [recap of command]?[as normal]"
--	49	"[as the parser]What do you want[if the person asked is not the player] [the person asked][end if] to [recap of command]?[as normal]"
--	51	"[as the parser]Since something dramatic has happened, your list of commands has been cut short.[as normal]"
--	52	"[line break][as the parser]Type a number from	1	to [library message amount],	0	to redisplay or press ENTER.[as normal]"
--	53	"[line break][as the parser]Please press SPACE.[as normal]"
--	54	"[as the parser]Comment recorded.[as normal]"
--	55	"[as the parser]Comment NOT recorded.[as normal]"
--	58	"[as the parser][The person asked] [is-are] unable to do that.[as normal]"
--	59	"[as the parser]You must supply a noun.[as normal]"
--	60	"[as the parser]You may not supply a noun.[as normal]"
--	61	"[as the parser]You must name an object.[as normal]"
--	62	"[as the parser]You may not name an object.[as normal]"
--	63	"[as the parser]You must name a second object.[as normal]"
--	64	"[as the parser]You may not name a second object.[as normal]"
--	65	"[as the parser]You must supply a second noun.[as normal]"
--	66	"[as the parser]You may not supply a second noun.[as normal]"
--	72	"[as the parser][The noun] [has-have] better things to do.[as normal]"
--	73	"[as the parser]That noun did not make sense in this context.[as normal]"
--	74	"[as the parser]That command asks to do something outside of play, so it can only make sense from you to me. [The person asked] cannot be asked to do this.[as normal]"


Section - Unreplaced Messages


Chapter - Hacks

Section - Fixing the Score

[As an exercise in masochism, we roll up our sleeves for the unpleasant plumbing involved in making the score command be styled correctly. Since the standard rules hard-code printing a period and line break into the obscure PrintRank routine, of all places, we have to do some ugly trickery to make this work.]

[Note: Technically, "verifying the story file" and "requesting the pronoun meanings" need a similar enema, but in lieu of an army of clones who don't mind doing difficult work for almost zero benefit I've chosen to simply leave those messages unstyled for now.]

[Further note: SAVE, TRANSCRIPT, UNDO are also tricky to fix, but since it's not safe to change the display style during these commands since they can have drastic changes on turn order etc., we feel better about leaving these messages unstyled as well.]

To #if ranking table is active: (- #ifdef RANKING_TABLE; -). 
To #PrintRank: (- PrintRank(); -).
To #if not: (- #Ifnot; -).
To #end if: (- #endif; -). 

The Neutral Library Messages announce the score rule is listed instead of the announce the score rule in the carry out requesting the score rulebook.

This is the Neutral Library Messages announce the score rule:
	if actor is the player:
		repeat through the table of custom library messages in reverse order:
			if there is a library-action entry and the library-action entry is the requesting the score action:
				if the no scoring option is active and the library-message-id entry is 2:
					parser say "[the library-message-text entry].";
					stop;
				otherwise if the no scoring option is not active and the library-message-id entry is 1:
					#if ranking table is active;
					say the library-message-text entry;
					#PrintRank;
					#if not;
					parser say "[the library-message-text entry].";
					#end if;
					stop;
	follow the announce the score rule. [Fallback to normal behavior if these messages are omitted from the table, for some reason.]
	
Section - Fixing Other Miscellaneous Messages

[Happily, it's a little easier to replace some of the other messages that print unusual information within themselves and thus can't be replaced via the normal mechanisms.]

The Neutral Library Messages report preferring abbreviated room descriptions rule is listed instead of the standard report preferring abbreviated room descriptions rule in the report preferring abbreviated room descriptions rulebook.

This is the Neutral Library Messages report preferring abbreviated room descriptions rule: if actor is the player, parser say "[story title] is now in its 'superbrief'  mode, which always gives short descriptions of locations (even if you haven't been there before)."

The Neutral Library Messages report preferring unabbreviated room descriptions rule is listed instead of the standard report preferring unabbreviated room descriptions rule in the report preferring unabbreviated room descriptions rulebook.

This is the Neutral Library Messages report preferring unabbreviated room descriptions rule: if actor is the player, parser say "[story title] is now in its normal 'verbose'  mode, which always gives long descriptions of locations (even if you've been there before)."

The Neutral Library Messages report preferring sometimes abbreviated room descriptions rule is listed instead of the standard report preferring sometimes abbreviated room descriptions rule in the report preferring sometimes abbreviated room descriptions rulebook.

This is the Neutral Library Messages report preferring sometimes abbreviated room descriptions rule: if actor is the player, parser say "[story title] is now in its 'brief' printing mode, which gives long descriptions of places never before visited and short descriptions otherwise."


Section - Player Description (in place of Section SR1/11 - People in Standard Rules by Graham Nelson) 

[Authors can easily override the description of the player, but extension authors can't without tromping on the final author's ability to (can't have two "usually" or two "is" lines). Bother. The only line changed is the description of yourself property. ]

The specification of person is "Despite the name, not necessarily
a human being, but anything animate enough to envisage having a
conversation with, or bartering with."

A person can be female or male. A person is usually male.
A person can be neuter. A person is usually not neuter.

A person has a number called carrying capacity.
The carrying capacity of a person is usually 100.

Include (-
	has transparent animate
	with before NULL,
-) when defining a person.

The yourself is an undescribed person. The yourself is proper-named.

The description of yourself is usually "You see nothing unexpected about yourself." ["As good-looking as ever."]

The yourself object translates into I6 as "selfobj".
Include (-
	with saved_short_name "yourself",
 -) when defining yourself.


Section - Only as far as

[We want to be careful about using something like "the quoted verb" here, because we might get a message like "I expect you wanted to i" or "I recognized the damn action, but not what came after" or even "the do something to Suzan action" for commands...]

For printing a parser error when the latest parser error is the only understood as far as error (this is the Neutral Library Messages understood as far as rule):
	parser say "I can't understand your entire command: the first part might be an action I know, but I don't know the word '[misunderstood word]'." 
	
For printing a parser error when the latest parser error is the only understood as far as error and the misunderstood word is known elsewhere (this is the Neutral Library Messages understood as far as supplemental rule):
	parser say "I can't understand your entire command: the first part might be an action I know, but I didn't expect the word '[misunderstood word]' next." 
	

Chapter - Misc Helpers 

Section - British/American Spellings (for use without Keyword Interface by Aaron Reed)

To say recogniz: if the American dialect option is active, say "recogniz"; else say "recognis". 


Section - Extensions to Plurality

To say that-them of (item - a thing):   
    now the prior named noun is the item;
	mark prior named noun in output;
    if the item acts plural
    begin;
    	say "them"; 
    otherwise if the item is the player;
		 say "yourself";
	otherwise if the item is male and item is not neuter;
   		say "him";
    otherwise if the item is female and item is not neuter;
    	say "her";
    otherwise; 
    	say "that";
    end if.

To say Cap That's-They're of (item - a thing):   
    now the prior named noun is the item;
	mark prior named noun in output;
    if the item acts plural
    begin;
    	say "They're"; 
    otherwise if the item is the player;
		 say "You're";
	otherwise if the item is male and item is not neuter;
   		say "He's";
    otherwise if the item is female and item is not neuter;
    	say "She's";
    otherwise; 
    	say "That's";
    end if.

To say Cap It-Those of (item - a thing):   
    now the prior named noun is the item;
	mark prior named noun in output;
    if the item acts plural
    begin;
    	say "Those"; 
    otherwise if the item is the player;
		 say "You";
	otherwise if the item is male and item is not neuter;
   		say "He";
    otherwise if the item is female and item is not neuter;
    	say "She";
    otherwise; 
    	say "It";
    end if.

Section - Posture

To decide which text is (quoted word - a snippet) posture:
     if the quoted word matches "stand", decide on "stand on";
     if the quoted word matches "sit", decide on "sit down on";
     if the quoted word matches "lie", decide on "lie down on";
     otherwise decide on "enter".


Chapter - Parser Style

Section - Parser Speak (for use without Keyword Interface by Aaron Reed)

To say as the parser: say "[italic type][bracket]".
To say as normal: say "[close bracket][roman type]".

Section - Parser Say

[This gets around an issue with line breaks after periods, and is the best way for authors to invoke the parser style in their own text.]

To parser say (txt - an indexed text):
	say "[as the parser][txt][run paragraph on][as normal][line break]".

Chapter - Utility Functions
	
To decide which snippet is the misunderstood word: 
	(- (((wn - 1) * 100) + 1) -).

To decide if the misunderstood word is known elsewhere: 
	(- (wn--, NextWord() ~= 0) -).

To decide which snippet is the quoted verb:
	(- ((verb_wordnum * 100) + 1) -) .

To decide what number is position of non-dictionary word:
	(- (FindUnknownWordToken(2)) -).

[To decide which snippet is what was misunderstood: 
	(- (((wn - 1) * 100) + (WordCount() - 2)) -).]
	
[To say show matched action: (- show_matched_action(); -).]



Include (-
[ show_matched_action m;
	for (m=0 : m<32 : m++) pattern-->m = pattern2-->m;
	pcount = pcount2;
	PrintCommand(0);
];
-).

[Code from Unknown Word Error by Neil. Thanks!!]

Include (-
[ FindUnknownWordToken wordnum     w twn numwds;
	#ifdef TARGET_GLULX;
	numwds = parse-->0;
	#ifnot;
	numwds = parse->1;
	#endif; ! TARGET_GLULX;
	! Throw out invalid word numbers
	if (wordnum <= 0 || wordnum > numwds) rfalse;
	twn=wn; ! save the value of wn so it can be restored
	wn=wordnum;
	while (1) {
		w=NextWordStopped();
		if (w == -1) { wn=twn; rfalse; }
		if (w == 0 && TryNumber(wn-1) == -1000) {
			wordnum=wn-1;
			wn=twn;
			return wordnum; 
		}
	}
];
-)


Book - Remembering by Aaron Reed

[8/110317]

Chapter - Responses

Table of Remembering Messages
rule name	message
Remembering generic report remembering rule	"[as the parser]You can't see [the noun] any more.[as normal][line break]"
Remembering don't disambiguate while remembering rule	"[as the parser]That's not something you can see now.[as normal][line break]"

To say was-were: if noun acts plural, say "were"; otherwise say "was".


Chapter - Remembering Main

Section - Grammar Line

[Future: any way to make this work for any reference to an object?]

Understand
"examine [any seen thing]" or
"x [any seen thing]" or
"look at/for [any seen thing]" or
"take [any seen thing]" or
"get [any seen thing]" or
"pick up [any seen thing]" or
"pick [any seen thing] up" or
"drop [any seen thing]" or
"put down [any seen thing]" or
"put [any seen thing] down" or
"drop [any seen thing] away" or
"drop away [any seen thing]" or
"find [any seen thing]" or
"where is/are [any seen thing]" as remembering.

Section - The Remembering Action

Remembering is an action applying to one thing.

The allow remembering faraway things rule is listed instead of the basic accessibility rule in the action-processing rules.

This is the allow remembering faraway things rule:
	unless remembering, abide by the basic accessibility rule.

Report remembering (this is the Remembering generic report remembering rule): say the message corresponding to a rule name of Remembering generic report remembering rule in Table of Remembering Messages.

Chapter - Fixes

Section - Fix in this context message

[ Since we've used an "any" grammar token, we'll get the "That noun did not make sense in that context." message for any unrecognized word or not visible noun. Restore this to the normal behavior. Note: if your game features other uses of "any" tokens, you'll need to replace this rule. ]

Rule for printing a parser error when the latest parser error is the noun did not make sense in that context error (this is the Remembering replace did not make sense in that context rule):
	now the latest parser error is the can't see any such thing error;
	make no decision.

Section - Avoiding Disambiguation

 [In practice, it doesn't really matter which of several unavailable items the player was referring to; it's quite annoying to be asked which one you meant and then told it isn't there anyway. Unfortunately, there's no easy way to bypass the disambiguation process since it's hard-coded into the Inform 6 templates. Here we do a trick, simply printing a refusal message instead of the disambiguation question. This mostly works, EXCEPT if the player tries to type a direction word: since directions aren't understood as verbs, the parser tries to insert the command into the misunderstood line, leading to "You can't see any such thing."]

Rule for asking which do you mean while remembering (this is the Remembering don't disambiguate while remembering rule): say the message corresponding to a rule name of Remembering don't disambiguate while remembering rule in Table of Remembering Messages.


Chapter - Keeping Track (for Glulx only)

Section - The Remembered Location

Every thing has an object called the remembered location. The remembered location of a thing is usually nothing.

Section - Rules

Last when play begins (this is the Remembering update remembered positions for first turn rule):
	follow the Remembering update remembered positions of things rule.

Every turn (this is the Remembering update remembered positions of things rule):
	unless in darkness:
		repeat with item running through things that are enclosed by the location:
			if remembered location of item is not holder of item:
				if item is visible:
					now the remembered location of item is the holder of item.

First report remembering (this is the Remembering specific report remembering rule):
	if remembered location of noun is nothing, continue the action;
	say the message corresponding to a rule name of Remembering specific report remembering rule in Table of Remembering Messages;
	stop the action. 
	
Section - The Message
		
Table of Remembering Messages (continued)
rule name	message
Remembering specific report remembering rule	"[as the parser]The last time you saw [the noun], [it-they of noun] [was-were] [at the remembered location of noun].[as normal][line break]"

To say at the (place - an object):
	carry out the saying the location name activity with place.

Section - The Activity
	
saying the location name of something is an activity on objects.

For saying the location name of a room (this is the Remembering saying room name rule): say "at '[the item described]'".

For saying the location name of the location (this is the Remembering saying current location name rule): say "right here".

For saying the location name of a person (this is the Remembering saying person name rule): say "in the possession of [the item described]".

For saying the location name of a person who is the player (this is the Remembering saying player name rule): say "in your possession".

For saying the location name of a container (this is the Remembering saying container name rule): say "in [the item described]".

For saying the location name of a supporter (this is the Remembering saying supporter name rule): say "on [the item described]".



Book - Extended Grammar by Aaron Reed

[Version 6/110706]

Section - Extended Grammar for Attack

Understand the command "injure" or "kick" or "strike" or "smack" as "attack".

Understand "break in/into/down/through [something]" as attacking.
Understand "break [something] in/down" as attacking.

Section - Extended Grammar for Burn

Understand the command "melt" or "ignite" or "incinerate" or "kindle" or "bake" or "toast" as "burn".

Section - Extended Grammar for Cut

Understand the command "carve" as "cut".

Section - Extended Grammar for Climb

Understand "climb on/in/into/onto [something]" as climbing.

Understand "throw [something preferably held] away" as dropping.
Understand "throw away [something preferably held]" as dropping.

Section - Extended Grammar for Drop

Understand the command "toss" or "fling" or "hurl" as "drop".

Understand "put [something preferably held] on floor/ground" as dropping.

Section - Extended Grammar for Examine

Understand the command "view" or "observe" or "inspect" as "examine".

Section - Extended Grammar for Enter

Understand the command "board" as "enter".
Understand "climb on/onto/in/into [something enterable]" as entering.
Understand "exit [a door]" or "exit through/using/by/out [a door]" as entering.
Understand "sit [something]" as entering. [Note: This breaks I7 [recap of command] / I6 PrintCommand, which expects the player has typed a grammatical command. Thus we might get messages like "What do you want to sit?"]
Understand "sit down on/in [something]" as entering.
Understand "jump on/in/into/onto [something]" as entering.
Understand "sit down" as entering.

Section - Extended Grammar for Exit

Understand the command "escape" or "depart" as "exit".

Section - Extended Grammar for Give

Understand the command "hand" or "deliver" as "give".

Section - Extended Grammar for Go

Understand the command "proceed" or "wander" or "explore" as "go".
Understand "upstairs/ascend" as up.
Understand "downstairs/descend" as down. 

Understand "go to [direction]" as going.
Understand "climb [a direction]" as going.

Section - Extended Grammar for Listen

Understand "listen [something]" as listening to.

Section - Extended Grammar for Look

Understand the command "see" as "look".
Understand "look around/about" as looking.

Section - Extended Grammar for Pull

Understand the command "raise" or "lift" as "pull".

Section - Extended Grammar for Push

Understand the command "lower" as "push".

Section - Extended Grammar for Put

Understand the command "place" or "stick" or "shove" or "stuff" as "put".

Section - Extended Grammar for Switch

Understand the command "activate" or "start" as "switch".
Understand the command "deactivate" or "stop" as "switch".

Section - Extended Grammar for Take

Understand the command "steal" or "grab" or "acquire" or "snatch" or "bring" as "take".

Section - Extended Grammar for Turn

Understand the command "spin" as "turn".

Section - Extended Grammar for Saying Yes

Understand "okay" or "ok" as saying yes.

Section - Extended Grammar for Throw

Understand "throw [something preferably held] into/through/to [something]" as throwing it at.





[A note:

The following extensions were considered for inclusion in this package but ultimately rejected for the reasons given below.

Locksmith by Emily Short - omitted because of size, redundancy with "Approaches," and because most modern games don't have locks and keys.

Reversed Persuasion Correction by Juhana Leinonen - the extension does not try to replace or improve the standard NPC interaction behaviors, the better to interface with any future extension that does do this.

Tutorial Mode by Emily Short - too obnoxious for experienced players, but can be a nice optional addition.

Keyword Interface by Aaron Reed - Changes the presentation layer too much for this package, although it's compatible.

Modified Exit by Emily Short - Functionality mostly subsumed into Small Kindnesses.

Implicit Actions by Eric Eve - Some nice features, but more focused on felicity rather than better understanding commands, and use of Text Capture can be problematic with some games. Both this and Limited Implicit Actions also overlap some of the included extensions in nontrivial ways.

Disambiguation Control by Jon Ingold - Requires replacing a standard Inform syntax (Does the player mean) and thus outside the scope of this extension.

Basic Help Menu by Emily Short - Aesthetically, I feel text-based menus look dated, and would prefer to point players towards better-designed help resources.
]

Player Experience Upgrade ends here.

---- DOCUMENTATION ----

This compilation extension significantly increases the percentage of understood inputs to an average work of IF, and is especially helpful at training new players to learn proper syntax.

Simply including the extension is all that's necessary to gain its benefits, which include, among other things, correctly responding to commands like these:

	LOOK AROUND
	CLIMB STAIRS
	GO TO THE KITCHEN
	TAKE BOB'S WALLET
	GET OUT OF THE CAR
	WHERE IS THE COIN
	KICK CAN
	HUG DR. PHIL
	USE BLENDER

Section: Details

Player Experience Upgrade bundles ten extensions focused on improving various aspects of player experience, to save authors (especially new authors) from reinventing old wheels. The included extensions have been tested and tweaked to work together with a minimum of hands-on fuss. The full list of included extensions is:

	Approaches by Emily Short (Version 4)
	 -- Allows players to GO BACK or GO TO a location by name. Addresses the common complaint among new players that compass directions are unintuitive.
	
	Smarter Parser by Aaron Reed (Version 14)
	 -- Scours misunderstood inputs looking for common mistakes and either reparses the command or explains what went wrong.
	
	Poor Man's Mistype by Aaron Reed (Version 7)
	 -- Corrects typing mistakes.
	
	Numbered Disambiguation Choices by Aaron Reed (Version 6)
	 -- Ensures ambiguously named objects are always selectable.
	
	Default Messages by Ron Newcomb (Version 3)
	 -- Allows for easy replacement of library messages.
	
	Neutral Library Messages by Aaron Reed (Version 2)
	 -- Replaces misleading or inappropriate default messages with more helpful or neutral alternatives.
	
	Remembering by Aaron Reed (Version 8)
	 -- Tells the player where they last saw something out-of-scope they're trying to interact with.
	
	Extended Grammar by Aaron Reed (Version 6)
	 -- Adds a number of verb and command form synonyms to the standard actions.
	
	Punctuation Removal by Emily Short (Version 4)
	 -- Allows the player to type titles like MR. without the period causing problems.
	
	Small Kindnesses by Aaron Reed (Version 12)
	 -- Adds many small player aids like a smart USE verb, auto-listing exits after bad movement, and intelligently picking the right way to go for IN or OUT.
	
Nothing here alters the default behavior of the Standard Rules or introduces any new mandatory syntax. Authors do not need to learn anything or change their habits to benefit from this extension.

More experienced authors may wish to simply cherry pick the individual extensions they'd like to use and download and include them individually, although note that each extension is given its own "Book" level heading within Player Experience Upgrade for easy replacement. For example, to remove just "Remembering," add the following as an empty heading, maybe at the end of your source text:

Book - No Remembering (in place of Book - Remembering by Aaron Reed in Player Experience Upgrade by Aaron Reed)

If newer versions of component extensions have been released than the ones compiled here, you can simply include them after including Player Experience Upgrade, and the new version will take precedence.

Section: Replacing Default Messages

The individual extensions by this author have been standardized in the way they name rules and print messages. Every rule begins with the name of the extension it's part of, as in the "Small Kindnesses don't implicitly take unwearables rule." Messages generated by the extensions redirect to library messages whenever possible; when new messages must be created, they're placed in a table called the "Table of <Extension> Responses" with two columns: rule name, and message. You can amend this table to adjust these messages:

	Table of Small Kindnesses Responses (amended)
	rule name	message
	Small Kindnesses carry out using rule	"You'll have to give me an exact verb."
	
Library and action messages not specific to Player Experience Upgrade are changed by continuing the Table of Custom Library Messages, like this:

	Table of custom library messages (continued)
	library-action	library-message-id	library-message-text
	--	21	"[as the parser]There's nothing to repeat![as normal]" 
	dropping action	4	"Okay, you drop it."

Messages from the parser should be wrapped in the [as the parser] and [as normal] tags, as seen in the first line above. Messages from the narrator can omit these tags.

The best way to determine the action and number of a message is to open the extension and search for a few consecutive words in the text. (Keep in mind some words like "You" or "their" may be procedurally generated and thus not searchable.) Doing so will also demonstrate the say statements needed to appropriate generate the right text (such as [Cap That's-They're noun], which prints "That's" or "They're" based on whether the noun in question is singular or plural).

Section: Common Snafus

If your story includes implemented body parts, common clothing items, adverbs, implementations of room boundaries like walls and floors, or nontraditional movement, you may want to look through the "Smarter Parser" section of the extension code and consider replacing or overriding some of its default behavior (see above).

Stories with nontraditional movement might also want to take a look at "Small Kindnesses" and "Approaches" to be sure neither are stepping on your toes.

If your story includes fuller implementations of any of the built-in stub verbs Inform provides (including jump, kiss, sing, rub, swing, and quite a few more: see the Actions tab of the Index panel) you should check that "Neutral Library Messages" does not include messages that might mislead your players, and change them if necessary.
	
Section: Style of Parser Messages	
	
Messages across all extensions are divided into narrator messages and parser messages, the latter referring to out-of-world responses and styled by default in italics and wrapped in square brackets. To override this:

	To say as the parser: say "<parser>".
	To say as normal: say "</parser>".
	
To style both kinds of messages identically, as the standard Inform distribution does:

	To say as the parser: do nothing.
	To say as normal: do nothing.
	
Authors can use the phrase "parser say" to easily create parser messages in a way that won't cause line break issues:

	Instead of dividing anything by zero, parser say "That's not allowed."
	
Section: You can't see any such thing
	
The extension divides the standard "You can't say any such thing" message into a set of more targeted messages, including one which reveals if any command words were not in the story's dictionary. To overrule this, add:

	Use traditional can't see any such thing.
	
Section: GO TO
	
Via Approaches by Emily Short, the extension allows players to GO TO any previously visited location by typing its name (assuming a route is still open). To restrict this to only work for immediately adjacent rooms:

	Use single room approaches. 
	
Section: Stories without directional movement

If the player moves in a direction that does not lead anywhere, the extension will show a list of the valid exits. To disable this:

	Use no normal movement tricks. Understand the command "exits" as something new.
	
Section: Disable Smarter Parser
	
Smarter Parser can cause slower processing of misunderstood input, which may be especially noticeable on platforms with limited speed, like Javascript or mobile phones. Authors can disable its functionality with:

	Use empty Smarter Parser rulebook.
	
...or players can do so by typing:

	>NOVICE OFF
	
Section: Blank Line

If the player presses enter at a prompt, Player Experience Upgrade makes the story respond as if they had typed LOOK. You can disable this with:

	Use normal blank lines.

...or replace the substituted action with a new string:

	The blank line replacement is "wait".

Section: Compatibility

The extension is known to be compatible with Locksmith by Emily Short, Keyword Interface by Aaron Reed, and probably many others.

The extension will technically compile as z8, but you may not be able to squeeze a very large game in with it. I highly recommend switching to Glulx.

This extension should NOT be used with any of its component extensions: they are duplicated entirely within it. It should also not be used with Default Messages by David Fisher, which was the go-to extension for replacing library messages up until about mid-2010, nor with extensions offering partially overlapping functionality, such as alternative methods of processing implicit actions.


Example: * Quick Test - Verify that all components are included and functional.

	*: "Quick Test"

	Include Player Experience Upgrade by Aaron Reed.
	
	The Stage is a room. A mike stand is a portable supporter in Stage. On it is a microphone. Mr Mike is a man in Stage with printed name "Mr. Mike". Mr Mike wears a headset. South of Stage is Backstage.

	test me with "s / go to stage / take the damn microphone / touch microphn / jump / look at mike / 2 / get 2 / get stand / s / drop stand / x mr. mike / n / x stand / toss microphone / east".




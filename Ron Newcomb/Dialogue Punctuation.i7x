Version 3 of Dialogue Punctuation by Ron Newcomb begins here.

"Correctly placing double quotes, commas, periods, and spacing is a tricky and tedious problem for dialogue-heavy games whose characters' lines span multiple rules and say phrases.  This extension provides say phrases that automate the process."

Section 1 - Usable by Outside World

Use dialogue punctuation debugging translates as (- Constant DIALOGUE_PUNC_DEBUGGING; -).

The indentation is some text that varies.  The indentation is usually "".  [ if indention is used, a five-space indent is recommended. ]
The sentence break is some text that varies.  The sentence break is usually "  ". [ two spaces after a sentence ]
The opening quote is some text that varies. The opening quote is usually "'".
The closing quote is some text that varies. The closing quote is usually "'".
The speaker break is some text that varies.  The speaker break is usually "[line break][line break]".

To decide if outside quotes: decide on whether or not outside-quotes is true.
To decide if inside quotes: decide on whether or not outside-quotes is false.

To decide if the/-- dialogue punctuation extension/-- is/are on: decide on whether or not the dialogue punctuation extension is true.
To decide if the/-- dialogue punctuation extension/-- is/are off: decide on whether or not the dialogue punctuation extension is false.

To       turn off the/-- dialogue punctuation extension/--: say run paragraph on; end dialogue; now the dialogue punctuation extension is false.
To say turn off the/-- dialogue punctuation extension/--: turn off dialogue punctuation.

To       narrative: if inside quotes, say "[run paragraph on][close quote 9]"; if oldline is true, say "[sentence break][run paragraph on]".
To say narrative: narrative.

[ When debugging, it is important to know which quote mark is intended to open and which to close.  Hence the Unicode European quote marks in debugging mode -- they look different from one another. ]

To say open quote (n - number): 
	if using dialogue punctuation debugging option, say "[run paragraph on][bold type]«[n][roman type][run paragraph on]";
	otherwise say "[run paragraph on][opening quote][run paragraph on]";
	now outside-quotes is false.

To say close quote (n - number): 
	if using dialogue punctuation debugging option, say "[run paragraph on][bold type]»[n][roman type][run paragraph on]";
	otherwise say "[run paragraph on][closing quote][run paragraph on]";
	now outside-quotes is true.

Section 2 - Implementation Details

The dialogue punctuation extension is a truth state that varies. The dialogue punctuation extension is usually false. 
The currently speaking character is an object [a person, or nothing] that varies. 
The previously attributed character is an object [a person, or nothing] that varies. 
Outside-quotes is a truth state that varies. Outside-quotes is usually true.
An oldline is a truth state that varies.  An oldline is usually false. [ an oldline, as opposed to a newline ]

To end dialogue: if inside quotes, say "[close quote 9]"; if oldline is true begin; say speaker break; now oldline is false; end if; say run paragraph on.

Before reading a command (this is the finish dialogue quoting rule): say run paragraph on; end dialogue.
After reading a command (this is the start dialogue quoting rule): now the previously attributed character is nothing; now the currently speaking character is nothing.

To say (character - a person) speaking:
	now the dialogue punctuation extension is true;
	if character is not the currently speaking character begin; [this closes an existing quote, linebreaks, re-opens a new one]
		if inside quotes, say "[run paragraph on][close quote 6]";  [coming after the command line, this will be false]
		say "[if the currently speaking character is not nothing][speaker break][end if][indentation][open quote 1]"; 
		now the currently speaking character is the character;
		now oldline is true;
	otherwise if outside quotes;
		say "[open quote 2][run paragraph on]";
		now oldline is true;
	otherwise if oldline is true;
		say sentence break;
	end if.

To say says (character - a person): 
	if character is not the previously attributed character begin;
		say "[run paragraph on][close quote 7] says [character].[run paragraph on][sentence break][run paragraph on]"; 
		now the previously attributed character is the character;
		now the currently speaking character is the character;
		now oldline is true;
	otherwise;
		say run paragraph on;
	end if.

To say c[omma] says (character - a person):  [ This just calls the above function if attrib is needed ]
	if character is not the previously attributed character, say ",[says character]";
	otherwise say ".[run paragraph on]";
	now oldline is true.

To say (character - a person) says: 
	now the dialogue punctuation extension is true;
	if character is not the previously attributed character begin;
		if inside quotes, say "[run paragraph on][close quote 8][sentence break]"; 
		if the currently speaking character is not nothing and the currently speaking character is not the character, say "[speaker break][indentation]";
		say "[if the currently speaking character is nothing][indentation][end if]";
		say "[Character] says, [open quote 3][run paragraph on]"; 
		now the previously attributed character is the character;
		now the currently speaking character is the character;
		now oldline is true;
	otherwise if oldline is true;
		say sentence break;
	end if.

[To (character - a person) says (t - some text):
	say "[character speaking][t][run paragraph on]". ]   [ No workie:  I7 complains that variable & table entry substitutions would be invalid "later", even though I'm not assigning the string to a variable ]

[To say rpo: (- I7_RunOnParagraph(true); -).]   [ No workie:  I6 still sticks in the new_line beforehand.  And I can't REPLACE the new_line function, either. ]

Dialogue Punctuation ends here.

---- DOCUMENTATION ----

Section : Basic Usage

Correctly placing double quotes, commas, periods, and spacing is a tricky and tedious problem for dialogue-heavy games whose characters' lines span multiple rules and say phrases.  This extension provides say phrases that automate the process, inserting the necessary punctuation and spacing where appropriate.  Also provided are three attribution tags, which will censor themselves after one of them attributes the speaker.  This is so we may use the attribution tags indiscriminately, knowing they will not interrupt the flow of text if they are not needed.

The first pair of phrases go at the beginning of every passage of dialogue.  "[Person speaking]" prints nothing other than any necessary spacing and punctuation, and tells the extension who is speaking the passage.  "[Person says]" also does that, plus attributes the character for the player's benefit, "  Bob says, '  ", but only if the character has not yet been attributed since he began speaking.

	"[(Person) speaking]"
	"[(Person) says]"

The next two say phrases are for attributing dialogue after a passage of text, which is the usual case in dialogue.  As usual, a character will not be attributed again since he began speaking, regardless which say phrase printed the attribution.  The second form of the post-passage attributions, "[c says Person]", will print a period at minimum, or replace the period with a comma in the case the attribution is needed.

	"[says (Person)]"
	"[c says (Person)]"

Finally, due to the way Inform 7 handles line breaks, the end of a passage of text must end with "[run paragraph on]".  The only exception is if other substitutions would end the passage; in that case, the "[run paragraph on]" goes just before them:

	say "[Charlie speaking]Well the transmission seems fine.  But, the [run paragraph on][broken part of car]";

One exception we must be aware of is actions out-of-world.  Such actions always cause a line break.  To avoid this, instead of creating actions which print nothing as out of world, we instead leave them in-world but do not provide an Understand statement so our player cannot trigger them.  


Section : Sliding Between Narrative and Dialogue

We can insert some narrative into a paragraph of dialogue with either of the calls to "narrative":
	*: say "[Bob speaking]Hi Jim![run paragraph on]"; narrative; say "Bob waves his hand.[run paragraph on]  ";
	say "[Bob speaking]Hi Jim![narrative]Bob waves his hand.[run paragraph on]  ";

For long stretches of narrative, we can simply turn off the extension:
	*: turn off dialogue punctuation;
	say "[turn off dialogue punctuation]";

Either of these uses will correctly end any current paragraph.  A use of "[(Person) speaking]" or "[(Person) says]" will turn on the extension again, but the post-passage attributions will merely silence themselves.  

Of course, we can ask if the extension is currently on or not.  The extension is still considered on after a call to "narrative":
	*: if dialogue punctuation is on begin;
	if the dialogue punctuation extension is off begin;


Section : Customizing

The look of the punctation and size & nature of the spacing may be changed thus:
	*: When play begins:
		now the indentation is "     "; [ five-space indent] 
		now the opening quote is "<<";
		now the closing quote is ">>";
		now the sentence break is "    ";
		now the speaker break is "[line break]".

For example, if we wanted our dialogue (if not our narrative) in the standard format of indented paragraphs:
	*: When play begins: 
		now the indentation is "     "; [ five-space indent] 
		now the speaker break is "[line break]".

A pair of conditions are occasionally useful.  They are:
	*: if inside quotes begin;

	*: if outside quotes begin;

To turn on the extension's debugging:
	*: Use dialogue punctuation debugging. 

Debugging uses different punctuation for opening and closing quotemarks, and furthermore follows each with a number.  Internally, this extension uses the say phrases "[open quote]" and "[close quote]" for exactly this reason, and since each phrase is invoked in about four different places within the extension's code,  the number allows us to find which invocation printed a particular mark.  Open quote marks are numbered starting from 1; close quotes, from 6.

Finally, the quote mark say phrases can be directly edited to use different "quotes" for each character.  For example, in third-person view, the viewpoint character may have his or her thoughts italicized to set them off from the narrative.  This could be coded as:
	*: To say open quote (n - number): 
		if using dialogue punctuation debugging option begin;
			say "[run paragraph on][bold type]«[n][roman type][run paragraph on]";
		otherwise if the currently speaking character is Gary;
			say italic type;  
		otherwise;
			say "[run paragraph on][opening quote][run paragraph on]";
		end if;
		now outside-quotes is false.
	
	To say close quote (n - number): 
		if using dialogue punctuation debugging option begin;
			say "[run paragraph on][bold type]»[n][roman type][run paragraph on]";
		otherwise if the currently speaking character is Gary;
			say roman type;
		otherwise;
			say "[run paragraph on][closing quote][run paragraph on]";
		end if;
		now outside-quotes is true.


Example: ** "Dialogue Test" - A working example of most every combination.

	*: "Dialogue Test"
 
	Include Dialogue Punctuation by Ron Newcomb. [Use dialogue punctuation debugging.]
  
	The podium is a room.  "You are [player]."  Allen, Bob, and Charlie are men in the podium. The player is Bob. Rule for printing the name of the player: say "[printed name of player]".

	Understand "r [number]" as reciting. Reciting is an action applying to one number. 
	Carry out reciting 1: say "[player speaking]I shall comma-attribute this line[c says player][run paragraph on]".
	Carry out reciting 2: say "[player speaking]This is unattributed.[run paragraph on]".
	Carry out reciting 3: say "[player speaking]This is exclamatory unattributed![run paragraph on]".
	Carry out reciting 4: say "[player speaking]Now I will pick a random action to call.[run paragraph on]"; try regurgitating a random number from 1 to 3.
	Carry out reciting 5: say "[player speaking]I will attrib then call![run paragraph on][says player]"; try regurgitating 3.   [ need the run paragraph on right after the ! ] 
	Carry out reciting 6: say "[player speaking]I will call something comma-attributed.[run paragraph on]"; try regurgitating 1.  
	Carry out reciting 7: say "[Player says]I will pre-attrib.[run paragraph on]".
	Carry out reciting 8: say "[Player says]I will pre-attrib then call.[run paragraph on]"; try regurgitating 2.
	Carry out reciting 9: say "[player speaking]I will call a pre-attributed subaction.[run paragraph on]"; try regurgitating 4. 
	Carry out reciting 10: turn off dialogue punctuation; say "This narrative turned off the extension."
	Carry out reciting 11: turn off dialogue punctuation; say "This narrative turned off the extension and calls some sub-narrative per Inform's normal rules."; try regurgitating 5. 
	Carry out reciting 12: turn off dialogue punctuation; say "This narrative turned off the extension and calls some sub-narrative as a single paragraph.[run paragraph on]  "; try regurgitating 5. 
	Carry out reciting 13: say "[Player speaking]I end with with non-comma attribution![run paragraph on][says player]".
	Carry out reciting 14: say "[Player speaking]Now I will segue through narrative for a beat.[run paragraph on][narrative]".
	Carry out reciting 15: say "This is a grounding beat, with the necessary RPO and sentence break.[run paragraph on]  ".
 
	Regurgitating is an action applying to one number.  
	Carry out regurgitating 1: say "[player speaking]This is from a comma-attributed sub-action[c says player][run paragraph on]".
	Carry out regurgitating 2: say "[player speaking]Boring sub-action.[run paragraph on]".
	Carry out regurgitating 3: say "[player speaking]Another boring sub-action.[run paragraph on]".
	Carry out regurgitating 4: say "[Player says]This is pre-attributed.[run paragraph on]".
	Carry out regurgitating 5: turn off dialogue punctuation; say "This is narrative from a sub-action.  I am printed according to Inform's native rules about linebreaking between rulebooks."

	Understand "be [person]" as becoming. Becoming is an action [out of world] applying to one thing. Carry out becoming: now the player is the noun.   
    
	Understand "note [text]" as noting. Noting is an action applying to one topic. 
  
	Test me with "r 2. note Basic Unattrib / r 1. note Basic Attrib Comma Rep / r 3. r 2. note Basic Unattrib Connective / r 1. r 2. note Basic Middle Connective / r 1. r 2. r 1. note Middle Connective with Silenced Extension / r 1. r 2. be allen. r 1. note Basic Speaker Change / r 2. r 3. r 1. note Extension with Ending Attrib / r 4. note Basic Inter-Action Connective / r 6. r 1. r 5.  note First Attrib from Subaction with Silenced Extension / r 5. r 5. r 5. note Attrib then Call, Silencing Extensions / r 1. be bob. be bob. r 1. note Spurious Linebreak Nonexistance / r 7. note Basic pre-attribution / r 8. note Pre-attributed followed by subaction / r 9. r 9. note Calling a pre-attributed subaction / be charlie. r 1. r 2. be allen. r 8. note Basic Speaker Change with a Pre-attrib / r 1. be bob. r 8. note Post-attrib followed by pre-attrib / r 13. note End with non-comma attrib / r 10. note Simple Narrative / r 1. r 10. r 1. note Narrative inside dialogue / r 10. r 1. r 10. note Dialogue inside narrative. / r 1. r 11.  note Dialogue followed by lots of narrative / r 12. note Long narrative / r 1. r 14. r 15. r 9. note Dialogue with grounding beat. / r 1. r 14. r 15. note Ending with grounding beat.".


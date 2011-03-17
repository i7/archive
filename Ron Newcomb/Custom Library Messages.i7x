Version 3 of Custom Library Messages by Ron Newcomb begins here.

"Changes the tense and viewpoint of all of the built-in messages in Inform's library.  Also provides an activity for additional customizations, and say-phrases for verb phrase generation."

"with special thanks to David Fisher"

[ Ron Newcomb can be reached at pscion@yahoo.com ]
[ Version 1: initial public release (not including several beta versions.) Thanks Jeff Nyman, "capmikee", Paul "Laroquod", and "gravel". ]
[ Version 2: Corrects "On the table is ." error.  Thanks CEJ Pacian. ]
[ Version 3: Now compatible with "use no deprecated phrases" when including Plurality, meaning, all "[Cap xx-xxx]" phrases were rewritten to "[Xx-xxx]".  Fixed bug with have* irregular verb, especially when used in the second person present tense. Thanks George Oliver. Also documents snafu with "only understood as far as" which reprints the command afterward regardless what's replaced.  Copied documentation regarding globals from Default Messages to here. Removed optional of/-- word from the case-sensitive say-phrases that-those, etc., due to Inform bug. Cleaned up the index a bit.  Added an example from Default Messages. Removed a phrase that was only used in the example, and added it to the documentation instead. ]

[ WISHLIST:  An example to print out the entirety of the CLM table in a code form that can be copy-pasted back into a work and used with the much smaller Default Messages.  This is if the author needn't change viewpoint or tense during play. ]

Section - Custom Library Messages

Use library message alerts translates as (- Constant LIBRARY_MESSAGE_ALERTS; -). 

[ This allows whole reams of messages to be swapped out at once. ]
The default messages table is a table name that varies. 
The default messages table is usually the table of custom library messages. 

To say library message verb: (- PrintCommand(); -). [ identical to "recap of command" but per Appendix A, "recap of command" isn't guaranteed to be around forever. ]  [prints the command predicate]
To say library message pronoun: (- print (address) pronoun_word; -).  ["pronoun dictionary word"]
To say ignore library line break: (- lm_n = -lm_n; -).

To decide what snippet is the misunderstood word: (- (((wn - 1) * 100) + 1) -).
To decide which snippet is the quoted verb: (- ((verb_wordnum * 100) + 1) -).  [if command is TAKE OFF HAT, gives just TAKE]

To decide which text is (quoted word - a snippet) posture:
	if the quoted word matches "stand", decide on "stand on";
	if the quoted word matches "sit", decide on "sit down on";
	if the quoted word matches "lie", decide on "lie down on";
	decide on "enter".

To say list the contents of (X - object) with (N - number): (- WriteListFrom(child({X}), {N}); -).

The current player's holdall is a player's holdall that varies. 
The current player's holdall variable translates into I6 as "SACK_OBJECT".

Printing library message something is an activity on numbers [while <action>ing].
To decide if misc messaging: decide on whether or not the action in progress is the miscellaneous non-action.
The action in progress is an action name that varies. 



Section - For Saying "list the contents of something with Options"

The as a sentence list option is a number that varies. The as a sentence list option variable translates into I6 as "ENGLISH_BIT".
The tersely list option is a number that varies. The tersely list option variable translates into I6 as "TERSE_BIT". [ More terse English style ]

The is-are list option is a number that varies. The is-are list option variable translates into I6 as "ISARE_BIT". [ Print " is" or " are" before list ]

The suppressing all articles list option is a number that varies. The suppressing all articles list option variable translates into I6 as "NOARTICLE_BIT". [ Print no articles, definite or not ]
The using the definite article list option is a number that varies. The using the definite article list option variable translates into I6 as "DEFART_BIT". [ Use the definite article in list ]
The capitalise first article list option is a number that varies. The capitalise first article list option variable translates into I6 as "CFIRSTART_BIT"   

With newlines list option is a number that varies. The with newlines list option variable translates into I6 as "NEWLINE_BIT". 
The indented list option is a number that varies. The indented list option variable translates into I6 as "INDENT_BIT". [ Indent each entry by depth]
With extra indentation list option is a number that varies. The with extra indentation list option variable translates into I6 as "EXTRAINDENT_BIT". [ New in I7: extra indentation of 1 level ]

The giving brief inventory information list option is a number that varies. The giving brief inventory information list option variable translates into I6 as "PARTINV_BIT". [ Only brief inventory information  ]
The giving inventory information list option is a number that varies. The giving inventory information list option variable translates into I6 as "FULLINV_BIT". [Full inventory information ]

The including contents list option is a number that varies. The including contents list option variable translates into I6 as "RECURSE_BIT". [Recurse downwards with usual rules]
The including all contents list option is a number that varies. The including all contents list option variable translates into I6 as "ALWAYS_BIT". [ Always recurse downwards ]

The not listing concealed items list option is a number that varies. The not listing concealed items list option variable translates into I6 as "CONCEAL_BIT". [ Omit objects with "undescribed" or "scenery": if marked for listing also set, then does not apply at top level, but does lower down ]
The listing marked items only list option is a number that varies. The listing marked items only list option variable translates into I6 as "WORKFLAG_BIT". [ At top level (only), only list objects which have the "marked for listing" attribute ]


Section - Correct a List Writer Snafu - unindexed

Include (-
[ Switch__TX   t;
	if ((t & 1) == 0) {
		IS__TX = " is"; 
		ARE__TX = " are"; 
		IS2__TX = "is "; 
		ARE2__TX = "are "; 
		IS3__TX = "is"; 
		ARE3__TX = "are"; 
	} else {
		IS__TX = " was"; 
		ARE__TX = " were"; 
		IS2__TX = "was "; 
		ARE2__TX = "were "; 
		IS3__TX = "was"; 
		ARE3__TX = "were"; 
	}	
];-).

[ Overrides the one in the Standard Rules ]
To list the contents of (O - an object), 
	with newlines, 
	indented, 
	giving inventory information, 
	as a sentence, 
	including contents, 
	including all contents, 
	tersely, 
	giving brief inventory information, 
	using the definite article, 
	listing marked items only, 
	prefacing with is/are, 
	not listing concealed items, 
	suppressing all articles 
	and/or with extra indentation: 
	(- Switch__TX((+ story tense +)); WriteListFrom(child({O}), {phrase options}); -). 


[ The following silences a runtime error when including Plurality, which created "prior named noun" as a thing, not an object.  I put it into this section so it doesn't appear in the author's index.]
To decide what thing is (x - an object) anyway: (- ({x}) -). 



Section - internal (in place of Section SR5/8/2 - Message support - Intervention - Unindexed in Standard Rules by Graham Nelson) unindexed

[These all loop through the table in reverse order because when the table is (continued) rather than (amended), it'll find the new messages first]

To decide if intervened in miscellaneous message: 
	now the library message action is the action in progress;
	now the action in progress is the miscellaneous non-action;
	begin the printing library message activity with the library message number; 
	if handling the printing library message activity with the library message number: 
		repeat through the default messages table in reverse order:
			if the library-message-id entry is the library message number and there is no library-action entry:
				say the library-message-text entry;
				if the library message number is at least one, say line break;
				otherwise now the library message number is 0 - the library message number;
				break;
		#if library message alerts is active and not in a release build;
		unless a paragraph break is pending:
			say "{ library message #[library message number] }[paragraph break]";
		#end if library message alerts is active and not in a release build;
	end the printing library message activity with the library message number; 
	now the action in progress is the library message action;
	decide yes.

To decide if intervened in miscellaneous list message: 
	now the library message action is the action in progress;
	now the action in progress is the miscellaneous non-action;
	increase library message number by 100;
	begin the printing library message activity with the library message number; 
	if handling the printing library message activity with the library message number: 
		repeat through the default messages table in reverse order:
			if the library-message-id entry is the library message number and there is no library-action entry:
				say the library-message-text entry;
				break;
		#if library message alerts is active and not in a release build;
		unless a paragraph break is pending:
			say "{ library message #[library message number] }[paragraph break]";
		#end if library message alerts is active and not in a release build;
	end the printing library message activity with the library message number; 
	decrease library message number by 100;
	now the action in progress is the library message action;
	decide yes.

To decide if intervened in action message: 
	begin the printing library message activity with the library message number; 
	if handling the printing library message activity with the library message number: 
		repeat through the default messages table in reverse order: 
			if the library-message-id entry is the library message number  and there is a library-action entry and the library-action entry is the library message action:
				say the library-message-text entry;
				if the library message number is at least one, say line break;
				otherwise now the library message number is 0 - the library message number;
				break;
		#if library message alerts is active and not in a release build;
		unless a paragraph break is pending:
			say "{ [library message action] action #[library message number] }[paragraph break]";
		#end if library message alerts is active and not in a release build;
	end the printing library message activity with the library message number; 
	decide yes.

To #if library message alerts is active and not in a release build: (- #ifdef DEBUG; #ifdef LIBRARY_MESSAGE_ALERTS; -). 
To #end if library message alerts is active and not in a release build: (- #endif; #endif; -). 
To say #if American dialect: (- #ifdef DIALECT_US; -).
To say #if Z-machine: (- #ifdef TARGET_ZCODE; -).
To say #otherwise: (- #Ifnot; -).
To say #end if: (- #endif; -).
The action in progress variable translates into I6 as "action".
To decide which action name is the miscellaneous non-action: (- (-1) -).

Include (-  
[ LanguageLM; 
#ifdef DEBUG;  ! Always on in debug builds regardless the Use option, because control should never get here.
	print "{ ";
	if (lm_act == ##Miscellany or ##ListMiscellany) print "library message";
	else print (SayActionName) lm_act, " action";
	print " #", lm_n, " }";
#endif;
];  -) instead of "Long Texts" in "Language.i6t".  [saves a little over 10K of memory]


Section - Plurality expansions

[ These are not in Plurality, or if they are, only operate on Things.  Here, we allow operating on "nothing" to mean "use whatever 'the story viewpoint' is set to." ]

To decide if (item - nothing) acts plural:  [then get answer from generic library setting]
	if the story viewpoint is first person plural, decide yes; ["Do we?"]
	if the story viewpoint is second person plural, decide yes; ["Do y'all?"]
	if the story viewpoint is third person plural, decide yes; ["Do they?"]
	if the story viewpoint is first person:
		if the story tense is present tense, decide yes; ["Do I?"] [but not "Were I?" nor "Are I?"]
		if the story tense is in any perfect tense, decide yes; ["Do I?"] [but not "Were I?" nor "Are I?"]
	if the story viewpoint is second person, decide yes; ["Do you?"]
	decide no.

To mark (target - an object) in output:
	if the target acts plural [or target is the player], now the recently said number is 1; 
	otherwise now the recently said number is 29;
	now the prior named noun is the target anyway.

[generally, "those're" is awkward, and in collinqual speech, "they're" is frequently used.]
To say That's-They're of (item - an object): mark item in output; if the item acts plural, say "They're"; otherwise say "That's".

[ Even though this one is in Plurality already, only this version understands first person and all past tenses. ]
To say 's-'re:   [*MUST override Plurality's own]
	if the story tense is in any past tense:
		if prior named noun acts plural, say " were";
		otherwise say " was";
	otherwise if the story viewpoint is first person and the story tense is in any present tense:
		say "[']m";
	otherwise if the prior named noun acts plural:
		say "[']re";
	otherwise:
		say "[']s".

[ Even though this one is in Plurality already, only this version understands first person and all past tenses. ]
To say is-are of (item - an object):  [*MUST override Plurality's own]
	mark item in output; 
	if the story tense is in any past tense:
		if the item acts plural, say "were";
		otherwise say "was";
	otherwise if the item is nothing and the story viewpoint is first person and the story tense is in any present tense:
		say "am";
	otherwise if the item acts plural:
		say "are";
	otherwise:
		say "is".



Section - Plurality supplements (for use without Plurality by Emily Short)

[ This extension does things just like Plurality when it can, to preserve memory.  If Plurality is not included, this is the heart of it which CLM needs. ]

The prior named noun is an object that varies.
To decide if (item - object) acts plural: decide on whether or not the item is plural-named.
After printing the name of something (called the target) (this is the plurality rule): mark target in output.

To say is-are: say is-are of prior named noun.

To say that-those: say that-those of prior named noun.
To say That-those: say That-those of prior named noun. 
To say that-those of (item - an object): mark item in output; if the item acts plural [or the item is the player], say "those"; otherwise say "that".
To say That-those of (item - an object): mark item in output; if the item acts plural [or the item is the player], say "Those"; otherwise say "That".

To say it-them: say it-them of prior named noun.
To say it-them of (item - an object): mark item in output; if the item acts plural [or the item is the player], say "them"; otherwise say "it".
To say it-they of (item - an object): mark item in output; if the item acts plural [or the item is the player], say "they"; otherwise say "it".
To say It-They of (item - an object): mark item in output; if the item acts plural [or the item is the player], say "They"; otherwise say "It".

To say its-their: say its-their of prior named noun.
To say its-their of (item - an object): 
	mark item in output;
	if the item acts plural:
		say "their";
	otherwise if the item is the player:
		say "your";
	otherwise if the item is female:
		say "her";
	otherwise if the item is male:
		say "his";
	otherwise:
		say "its".


[Section - all this just for the only understood as far as error

[ As nice as it is to set message #28 to something like "I only understood [library message verb] but not the rest of it.", I feel it's better to leave CLM working identically to Default Messages here.  Since fixing this in DM is more difficult due to the whole of LanguageLM() being necessary to re-include, I'll leave matters as they are. It isn't my job to fix inconsistencies in Inform itself. So, for message #28, moving the partially understood command to somewhere other than the end of the message requires a rule. I've included an example for this. ]

Include (-
    ! If the player was the actor (eg, in "take dfghh") the error must be printed,
    ! and fresh input called for.  In three cases the oops word must be jiggled.

    if ((etype ofclass Routine) || (etype ofclass String)) {
        if (ParserError(etype) ~= 0) jump ReType;
    } else {
		if (verb_wordnum == 0 && etype == CANTSEE_PE) etype = VERB_PE;
		players_command = 100 + WordCount(); ! The snippet variable ``player's command''
        BeginActivity(PRINTING_A_PARSER_ERROR_ACT);
        if (ForActivity(PRINTING_A_PARSER_ERROR_ACT)) jump SkipParserError;
    }
    pronoun_word = pronoun__word; pronoun_obj = pronoun__obj;

    if (etype == STUCK_PE) {    L__M(##Miscellany, 27); oops_from = 1; }
    if (etype == UPTO_PE) {     
        for (m=0 : m<32 : m++) pattern-->m = pattern2-->m;
        pcount = pcount2; 
	L__M(##Miscellany, 28);  ! CLM replaces this message with a say phrase that does the following two lines as well.
!	PrintCommand(0); 
!	L__M(##Miscellany, 56);
    }
    if (etype == NUMBER_PE)     L__M(##Miscellany, 29);
    if (etype == CANTSEE_PE) {  L__M(##Miscellany, 30); oops_from=saved_oops; }
    if (etype == TOOLIT_PE)     L__M(##Miscellany, 31);
    if (etype == NOTHELD_PE) {  L__M(##Miscellany, 32); oops_from=saved_oops; }
    if (etype == MULTI_PE)      L__M(##Miscellany, 33);
    if (etype == MMULTI_PE)     L__M(##Miscellany, 34);
    if (etype == VAGUE_PE)      L__M(##Miscellany, 35);
    if (etype == EXCEPT_PE)     L__M(##Miscellany, 36);
    if (etype == ANIMA_PE)      L__M(##Miscellany, 37);
    if (etype == VERB_PE)       L__M(##Miscellany, 38);
    if (etype == SCENERY_PE)    L__M(##Miscellany, 39);
    if (etype == ITGONE_PE) {
        if (pronoun_obj == NULL)
                                L__M(##Miscellany, 35);
        else                    L__M(##Miscellany, 40);
    }
    if (etype == JUNKAFTER_PE)  L__M(##Miscellany, 41);
    if (etype == TOOFEW_PE)     L__M(##Miscellany, 42, multi_had);
    if (etype == NOTHING_PE) {
        if (parser_results-->ACTION_PRES == ##Remove &&
        	parser_results-->INP2_PRES ofclass Object) {
            noun = parser_results-->INP2_PRES; ! ensure valid for messages
            if (noun has animate) L__M(##Take, 6, noun);
            else if (noun hasnt container or supporter) L__M(##Insert, 2, noun);
            else if (noun has container && noun hasnt open) L__M(##Take, 9, noun);
            else if (children(noun)==0) L__M(##Search, 6, noun);
            else parser_results-->ACTION_PRES = 0;
            }
        if (parser_results-->ACTION_PRES ~= ##Remove) {
            if (multi_wanted==100)  L__M(##Miscellany, 43);
            else                    L__M(##Miscellany, 44);
        }
    }
    if (etype == ASKSCOPE_PE) {
        scope_stage = 3;
        if (indirect(scope_error) == -1) {
            best_etype = nextbest_etype;
            if (~~((etype ofclass Routine) || (etype ofclass String)))
            	EndActivity(PRINTING_A_PARSER_ERROR_ACT);
            jump GiveError;
        }
    }
    if (etype == NOTINCONTEXT_PE) L__M(##Miscellany, 73);

    .SkipParserError;
    if ((etype ofclass Routine) || (etype ofclass String)) jump ReType;
    say__p = 1;
    EndActivity(PRINTING_A_PARSER_ERROR_ACT);

-) instead of "Parser Letter I" in "Parser.i6t".
]

Book - Light Prose Generation, inflections - verb tense, aspect, mood, and voice, and pronoun declension

Chapter 1 - inflections

Section 1 - capitalising words, typecasting numbers - unindexed

The capitalisation mode is a truth state that varies. 
The capitalisation mode variable translates into I6 as "caps_mode".

To say the/-- capitalised (t - some text): (- CPrintOrRun({t}, 0); caps_mode = 0; -).
To say the/-- capitalised (t - a xould): (- CPrintOrRun({t}, 0); caps_mode = 0; -).
To say the/-- possibly capitalised (t - text): (- Cap({t}, ~~caps_mode); caps_mode = 0; -).

The recently said number is a number that varies. 
The recently said number variable translates into I6 as "say__n".

To decide what number is (N - a declension) as a number: (- {N} -).
To decide which declension is (x - a declension) + (y - a declension): (- ({x} + {y}) -). [ needed for 6E72 and later ]
To decide which conjugation is (x - a conjugation) + (y - a conjugation): (- ({x} + {y}) -). [ needed for 6E72 and later ]


Section 2 - pronoun declension and verb conjugation

[ The idea we're using in here is:  bitfield == table row# ]

[bits 0, 1, 2 of a declension]
Declension is a kind of value. A declension is first person, second person, third person masculine, third person feminine, third person, first person plural, second person plural, or third person plural.

The story viewpoint is a declension that varies. [When play begins, the story viewpoint is usually first person plural.] [or whichever]

Conjugation is a kind of value.  A conjugation is [present tense,] past tense, present-perfect tense, past-perfect tense, continuous present tense, continuous past tense, or continuous present-perfect tense, continuous past-perfect tense, present tense. [This is intended to be a 0-based enum, but all Inform enums are 1-based.  Hence, "present tense" is tacked onto the end. ]

The story tense is a conjugation that varies.

To decide if (x - a conjugation) is in any present tense: (- (({x} & 1) == 0) -).
To decide if (x - a conjugation) is in any past tense: (- (({x} & 1) ~= 0) -).
To decide if (x - a conjugation) is in any perfect tense: (- (({x} & 2) ~= 0) -).
To decide if (x - a conjugation) is not in any perfect tense: (- (({x} & 2) == 0) -).
To decide if (x - a conjugation) is in any continuous tense: (- (({x} & 4) ~= 0) -).
To decide if (x - a conjugation) is not in any continuous tense: (- (({x} & 4) == 0) -).


Section 2b - declension and conjugation bits - unindexed

[bits 3 & 4 of a declension]
To decide which declension is subjective case: (- 0 -).
To decide which declension is objective case: (- 8 -).
To decide which declension is possessive pronoun case: (- 16 -).
To decide which declension is reflexive case: (- 24 -).

To decide which declension is possessive case: (- 32 -).


[ BE SURE TO MASK WITH SEVEN (00000111) FIRST: 
bit 0 = present(0)/past(1);  
bit 1 = simple(0)/perfect(1);  
bit 2 = instant(0)/continuous(1)  a.k.a progressive ]

To decide which conjugation is the past tense bitval: (- 1 -).
To decide which conjugation is the perfect tense bitval: (- 2 -).
To decide which conjugation is the continuous tense bitval: (- 4 -).



Section 3 - to say the appropriate pronoun

[NOTE: only Say phrases can distinguish between capitalised and uncapitalised letters; To Decide Which phrases cannot.]
[ALSO only the first word in the Say phrase distinguishes, so We/He/She/I will only distinguish case for 'we'.]

[LOWERCASE]
[these are pronouns]
To say we: say the possibly capitalised pronoun corresponding to the story viewpoint + subjective case.
To say us: say the possibly capitalised pronoun corresponding to the story viewpoint + objective case.
To say ours: say the possibly capitalised pronoun corresponding to the story viewpoint + possessive pronoun case.
To say ourselves: say the possibly capitalised pronoun corresponding to the story viewpoint + reflexive case.
[these are determiners (a kind of adjective)]
To say our: say the possibly capitalised [possessive] pronoun [adjective] corresponding to the story viewpoint + possessive case.

[UPPERCASE]
[these are pronouns]
To say We: say the capitalised pronoun corresponding to the story viewpoint + subjective case.
To say Us: say the capitalised pronoun corresponding to the story viewpoint + objective case.
To say Ours: say the capitalised pronoun corresponding to the story viewpoint + possessive pronoun case.
To say Ourselves: say the capitalised pronoun corresponding to the story viewpoint + reflexive case.
[these are determiners (a kind of adjective)]
To say Our: say the capitalised [possessive] pronoun [adjective] corresponding to the story viewpoint + possessive case.

To decide which text is the pronoun corresponding to (decl - a declension):
	now the prior named noun is nothing anyway; [Plurality-like phrases need to know the last noun printed; in the case of our generic library pronoun, use Nothing to flag this ]
	choose row (decl as a number) from the table of pronouns; 
	decide on the pronoun-declension-column entry.

Table of pronouns
pronoun-declension-column (text)
"I"
"you"
"he"
"she"
"it"
"we"
"you" [you all]
"they"
"me"
"you"
"him"
"her"
"it"
"us"
"you" [you all]
"them"
"mine"
"yours"
"his"
"hers"
"its"
"ours"
"yours" [you all's]
"theirs"
"myself"
"yourself"
"himself"
"herself"
"itself"
"ourselves"
"yourselves"
"themselves"
[
Table of possessive adjectives
word (text)]
"my"
"your"
"his"
"her"
"its"
"our"
"your"
"their"

Section 4 - testing commands - not for release

Understand "pov" as a mistake ("[italic type][The story title][roman type] is in [story viewpoint] [story tense].").
Understand "pov [declension]" as a mistake ("[pov the declension understood][italic type][The story title][roman type] is in [story viewpoint] [story tense].").
Understand "pov [conjugation]" as a mistake ("[pov the conjugation understood][italic type][The story title][roman type] is in [story viewpoint] [story tense].").
To say pov (x - a declension): now the story viewpoint is x.
To say pov (x - a conjugation): now the story tense is x.



Section 5 - sentence-level modes

Xould is a kind of value. Xould is non-modal, could, would, or should.
Could-would-should is a xould that varies. could-would-should is usually non-modal.

Passive voice is a truth state that varies. Passive voice is usually false.
Negation pending is a truth state that varies. Negation pending is usually false.
Question pending is a truth state that varies. Question pending is usually false.


Section 6 - scratchpads for extension's internal use - unindexed

First aux moved is a truth state that varies. First aux moved is usually false [for statements].
Suffix eaten by do is a truth state that varies. Suffix eaten by do is usually false.
Suffix eaten by c-w-s is a truth state that varies. Suffix eaten by c-w-s is usually false.

To decide which conjugation is the zero conjugation: (- 0 -).
To decide which conjugation is (x - a conjugation) - (y - a conjugation): (- ({x} - {y}) -). [ needed for 6E72 and later ]
Restore-library-conjugation is a conjugation that varies. The restore-library-conjugation variable translates into I6 as "restore_library_conjugation". Include (- Global restore_library_conjugation = 0; -) after "Definitions.i6t".

[  Appropriate form (participle, etc.): (again, an off-by-one error due to KOVs being 1-based 
-3="ies"
-2="ied"
-1="ying" 
 0="y" for the suffixes (less than e-s) ;  for irregular forms, the -en form]
[ This routine is slightly RECURSIVE.  If called for a suffix like [-s] or [-ies] it's caller will choose straight text for an answer, but if called for an irregular verb its caller may choose "take[-s]" for an answer, which will then call this phrase again for the [-s] suffix. ]
To decide which number is the appropriate form for (irverb - an irregular verb): 
	if passive voice is true:
		now suffix eaten by do is [reset to] false;
		now suffix eaten by c-w-s is [reset to] false;
		now passive voice is [reset to] false;
		decide on -2;
	if the story tense is in any continuous tense:
		now suffix eaten by do is [reset to] false;  
		now suffix eaten by c-w-s is [reset to] false;
		decide on -1;
	otherwise if suffix eaten by do is true:
		now suffix eaten by do is [reset to] false;
	otherwise if the story tense is [exactly] past tense and suffix eaten by c-w-s is true:
		now suffix eaten by c-w-s is [reset to] false;
	otherwise if the story tense is not present tense:
		if the story tense is in any perfect tense and irverb is greater than e-s , decide on 0; [ -en form rather than -ed form ]  
		decide on -2;  [eaten by "did"]
	otherwise if suffix eaten by c-w-s is true:
		now suffix eaten by c-w-s is [reset to] false;
	otherwise unless the [nothing]prior named noun acts plural[recently said number is not one]:
		decide on -3;  ["ies"]
	if irverb is greater than e-s:   [ DO NOT use "otherwise" in front of this. It'll break when used with CAN (but not COULD)  ]
		decide on -3;  [ irregular verbs (not the suffixes) use "take[-s]" ]
	decide on 0.  ["y" / "-en"]


Chapter 2 - auxiliary words and phrases

To decide which text is is/was as auxiliary:
	if could-would-should is not non-modal, decide on "be";
	if the story tense is in any present tense:
		if the story viewpoint is first person [and the story tense is continuous present tense] and prior named noun is nothing:
			decide on "am";
		if the prior named noun acts plural[ or the prior named noun is the player]:
			decide on "are";
		decide on "is";
	otherwise: [is in any past tense]
		if the prior named noun acts plural[ or the prior named noun is the player]:
			decide on "were"; 
		decide on "was".

To decide which text is has/have as auxiliary: 
	if could-would-should is not non-modal, decide on "have";
	if the story tense is in any present tense:
		if the prior named noun acts plural[ or the prior named noun is the player]:
			decide on "have";
		decide on "has";
	otherwise: [is in any past tense]     
		decide on "had".

To decide which text is do as auxiliary: 
	if the story tense is in any past tense, decide on "did"; 
	if the prior named noun acts plural[[ or the prior named noun is the player]], decide on "do";
	decide on "does".

To decide what text is (x - xould) as auxiliary:
	now suffix eaten by c-w-s is true;
	if the story tense is in any present tense:
		if x is would:
			if negation pending is false, decide on "will"; [otherwise...]
			now negation pending is false;  [cannot use  [will][n't]  ]
			decide on "won't";
		if the story tense is not in any perfect tense:
			if x is could:
				if negation pending is false, decide on "can";
				now negation pending is false;  
				decide on "can't";
			if x is should:
				if negation pending is false, decide on "shall";
				now negation pending is false;
				decide on "shouldn't"; ["shan't" isn't much used anymore]
	if x is could, decide on "could";
	if x is would, decide on "would";
	if x is should, decide on "should";
	now suffix eaten by c-w-s is false; [shouldn't get down here, but if you DO pass in non-modal...]
	decide on "".

To say n't: 
	if negation pending is false, stop;
	if question pending is true and the story viewpoint is first person:
		if story tense is continuous present tense, stop; [to avoid "Am not I carrying..."]
		if story tense is present tense and passive voice is true, stop; [to avoid "Amn't I carried by..."]
	now negation pending is false;
	if the story viewpoint is first person and story tense is continuous present tense [and non-modal?]:
		say " not"; 
	say "n't".

To say moment: say "[if the story tense is in any present tense]moment[else]time".
To say here-there: if the story tense is in any past tense, say "t"; say "here".
To say can: if the story tense is in any past tense, say "could"; otherwise say "can".
To say can't: if the story tense is in any past tense, say "couldn't"; otherwise say "can't".
To say =>negation: now negation pending is true.
To say =>would: now could-would-should is would.
To say =>could: now could-would-should is could.
To say =>perfect:  
	if the story tense is not in any perfect tense:
		now the story tense is the story tense + the perfect tense bitval;
		now restore-library-conjugation is restore-library-conjugation + the perfect tense bitval.

To say =>continuous:  
	if the story tense is not in any continuous tense:
		now the story tense is the story tense + the continuous tense bitval;
		now restore-library-conjugation is restore-library-conjugation + the continuous tense bitval.

To say => (x - an object): mark x in output.
To say Aux (x - an object): mark x in output; say Aux.


[  PASSED IN:
QUESTION PENDING
NEGATION PENDING
PASSIVE VOICE
]

To say Aux:  [This one, capitalized, is used to begin a question, and is not much used otherwise]
	now first aux moved is [reset to] false;
	now suffix eaten by do is [reset to] false;
	now suffix eaten by c-w-s is [reset to] false;
	if question pending is false:
		now the capitalisation mode is true; [Aux won't print anything at all, so it "passes" capitalization to the next word]
		stop; 
	if could-would-should is not non-modal:
		say capitalised could-would-should as auxiliary;
	otherwise if the story tense is in any perfect tense:
		say capitalised has as auxiliary;
	otherwise if the story tense is in any continuous tense:
		say capitalised is as auxiliary;
	otherwise if passive voice is true:
		say capitalised is as auxiliary;
	otherwise:
		say capitalised do as auxiliary;
		now suffix eaten by do is true;
	say "[n't] ";
	now first aux moved is whether or not suffix eaten by do is false;  ["do" (only) is created, not moved]
	now question pending is false.  ["n't" checks this variable, so don't clear it until end of leading Aux]

To say aux:
	if could-would-should is not non-modal:
		if first aux moved is false, say "[could-would-should as auxiliary][n't] ";
		otherwise now first aux moved is [reset to] false; [in case the following branch is taken as well]
	if the story tense is in any perfect tense:
		if first aux moved is false, say "[has as auxiliary][n't] ";
		otherwise now first aux moved is [reset to] false;
		if the story tense is in any continuous tense, say "been ";
	otherwise if the story tense is in any continuous tense:
		if first aux moved is false, say "[is as auxiliary][n't] ";
		if first aux moved is true and the story viewpoint is first person and story tense is continuous present tense and negation pending is true, say "not "; [to avoid "Am I --- carrying..."]
		now first aux moved is [reset to] false;
	otherwise if negation pending is true and passive voice is false:
		say "[do as auxiliary][n't] ";
		now suffix eaten by do is true;  
	if passive voice is true and first aux moved is false:
		if the story tense is in any continuous tense:
			say "being ";
		otherwise if the story tense is in any perfect tense:
			say "been ";
		otherwise:
			say "[is as auxiliary][n't] ";
	now could-would-should is [reset to] non-modal;
	now first aux moved is [reset to] false.

To say end aux: [this is for any case where a [-s], [e-s], [ve], or [-ies] isn't needed]
	now suffix eaten by do is [reset to] false;
	now suffix eaten by c-w-s is [reset to] false;
	now passive voice is [reset to] false;
	if restore-library-conjugation is not the zero conjugation:
		now the story tense is the story tense - restore-library-conjugation;
		now restore-library-conjugation is the zero conjugation.


Chapter 3 - irregular verbs

An irregular verb is a kind of value. 

To decide what number is (N - an irregular verb) as a number: (- {N} -).

To say (v - an irregular verb):
	choose row ((v as a number multiplied by 4) + the appropriate form for v) from the table of irregular verbs; 
	if restore-library-conjugation is not the zero conjugation:
		now the story tense is the story tense - restore-library-conjugation;
		now restore-library-conjugation is the zero conjugation;
	say the word entry.

Some irregular verbs are -s, -es, -ies, e-s, eat*, feel*, find*, get*, give*, hear*, put*, see*, take*, have*, go*, wear*, think*, keep*, be*, do*.

table of irregular verbs
word (text)
"s"   [regular verbs with -s suffix]
"ed"
"ing"
""
"es"  [regular verbs with -es suffix]
"ed"
"ing"
""
"ies"  [regular verbs ending in y, so with -ies suffix]
"ied"
"ying"
"y"
"es"  [regular verbs ending in e, so with e-s suffix]
"ed"
"ing"
"e"
"eat[-s]"
"ate"
"eating"
"eaten"
"feel[-s]"
"felt"
"feeling"
"felt"
"find[-s]"
"found"
"finding"
"found"
"get[-s]"
"got"
"getting"
"gotten"
"give[-s]"
"gave"
"giving"
"given"
"hear[-s]"
"heard"
"hearing"
"heard"
"put[-s]"
"put"
"putting"
"put"
"see[-s]"
"saw"
"seeing"
"seen"
"take[-s]"
"took"
"taking"
"taken"
"ha[if the story tense is in any past tense]d[otherwise if the prior named noun acts plural]ve[otherwise]s" 
"had"
"having"
"had"
"go[-es]"
"went"
"going"
"gone"
"wear[-s]"
"wore"
"wearing"
"worn"
"think[-s]"
"thought"
"thinking"
"thought"
"keep[-s]"
"kept"
"keeping"
"kept"
"[is as auxiliary]"
"[was as auxiliary]"
"being"
"been"
"do[-es]"
"did"
"doing"
"done"


Section - replacement for you-can-also-see 

[ The default version in the standard rules hard-codes "you" in there.  Looks like that rule used to use library messages 5 and 6 once upon a time, but due to difficult edge cases regarding list recursion, needed some serious coding work. ]

The I-could-also-see rule is listed instead of the you-can-also-see rule in the for printing the locale description rulebook.

For printing the locale description (this is the I-could-also-see rule):
	now everything is unmarked for listing;
	repeat through the Table of Locale Priorities:
		[say "[notable-object entry] - [locale description priority entry].";]
		if the locale description priority entry is at least one and the notable-object entry is not [already] mentioned, now the notable-object entry is marked for listing;
	if something is marked for listing:
		let the domain be the parameter-object;  
		begin the listing nondescript items activity with the domain;
		if handling the listing nondescript items activity:
			issue library message looking action number 5 for the domain;
			let the common holder be nothing;
			let contents form of list be true;
			repeat with list item running through marked for listing things:
				if the holder of the list item is not the common holder:
					if the common holder is nothing, now the common holder is the holder of the list item;
					otherwise now contents form of list is false;
				if the list item is mentioned, now the list item is unmarked for listing;
			filter list recursion to unmentioned things;
			if contents form of list is true and the common holder is not nothing, 
				list the contents of the common holder, as a sentence, including contents, giving brief inventory information, tersely, not listing concealed items, listing marked items only;
			otherwise say a list of marked for listing things including contents;
			unfilter list recursion;
			issue library message looking action number 6 for the domain;
		now the domain is the parameter-object; [ just in case someone assigned to it in a Before or For rule ]
		end the listing nondescript items activity with the domain;
	continue the activity.



Book - table

Section - The Custom Library Messages table

Table of custom library messages [(continued)]
library-action (action-name) 	library-message-id (number)	library-message-text (text)
[Section 2.3 - Prompts and Input]
--		10	"I beg your pardon?"
Quitting the game action	2	"Are you sure you want to quit? "
Quitting the game action	1	"Please answer yes or no."
--		8	"Please give one of the answers above."
--		53	"[line break][bracket]Please press SPACE.[close bracket]"
--		52	"[line break]Type a number from 1 to [library message amount], 0 to redisplay or press ENTER."
--		54	"[bracket]Comment recorded.[close bracket]"
--		55	"[bracket]Comment NOT recorded.[close bracket]"
[Section 2.4 - Undo]
--		13	"[bracket]Previous turn undone.[close bracket]"
--		7	"[#if Z-machine]'Undo' failed.  [bracket]Not all interpreters provide it.[close bracket][#otherwise][bracket]You cannot 'undo' any further.[close bracket][#end if]"
--		6	"[bracket]Your interpreter does not provide 'undo'.  Sorry![close bracket]"
--		11	"[bracket]You can't 'undo' what hasn't been done![close bracket]"
--		12	"[bracket]Can't 'undo' twice in succession. Sorry![close bracket]"
--		70	"The use of UNDO is forbidden in this game."
[Section 2.5 - Oops]
--		14	"Sorry, that can't be corrected."
--		16	"'Oops' can only correct a single word."
--		15	"Think nothing of it."
[Section 2.6 - Again]
--		21	"[We] [can] hardly repeat that."
--		20	"To repeat a command like 'frog, jump', just say 'again', not 'frog, again'."
[Section 2.7 - Syntax Errors]
--		27	"I didn't understand that sentence."
--		28	"I only understood you as far as wanting to [ignore library line break]"
--		41	"I didn't understand the way that finished."
--		31	"You seem to have said too little."
--		51	"(Since something dramatic has happened, your list of commands has been cut short.)"
--		29	"I didn't understand that number."
--		22	"You can't begin with a comma."
--		25	"To talk to someone, try 'someone, hello' or some such."
[Section 2.8 - Illegal Commands]
--		30	"[We] [can't] see any such thing."
--		32	"[We] [is-are]n't holding that."   [TODO]
--		38	"That's not a verb I recogni[#if American dialect]z[#otherwise]s[#end if]e."
--		37	"[We] [can] only do that to something animate."
--		59	"You must supply a noun."
--		60	"You may not supply a noun."
--		61	"You must name an object."
--		62	"You may not name an object."
--		63	"You must name a second object."
--		64	"You may not name a second object."
--		65	"You must supply a second noun."
--		66	"You may not supply a second noun."
--		67	"You must name something more substantial."
[Section 2.9 - Multiple Objects]
--		33	"You can't use multiple objects with that verb."
--		34	"You can only use multiple objects once on a line."
--		42	"[if library message amount is 0]None[otherwise]Only [library message amount] of those[end if] [is-are] available."
--		44	"There are none at all available."
--		43	"Nothing to do."
--		1	"(considering the first sixteen objects only)[ignore library line break]"
--		36	"You excepted something not included anyway."
[Section 2.10 - Implicit Actions]
--		69	"(first taking [the noun])" [doesn't need to ignore library line break]
--		68	"([The person asked] first taking [the noun])" [doesn't need to ignore library line break]
Entering action	6	"(getting [if the library message object is a supporter]off[otherwise]out of[end if] [the library message object])[ignore library line break]"
Entering action	7	"[if the noun is a supporter](getting onto [the noun])[otherwise if the noun is a container](getting into [the noun])[otherwise](entering [the noun])[end if][ignore library line break]"
--			26	"(first taking [the noun])[ignore library line break]"  [needs the ignore]
Dropping action		3	"(first taking [the noun] off)[ignore library line break]"
Inserting it into action	6	"(first taking [it-them of noun] off)[ignore library line break]"
Putting it on action   	5	"(first taking [it-them of noun] off)[ignore library line break]"
Going action		27	"(first getting off [the library message object])[ignore library line break]"
Going action		28	"(first opening [the library message object])[ignore library line break]"
[Section 2.11 - Carrying Capacity]
Taking action		12	"[We]['s-'re] carrying too many things already."  [TODO]
Taking action		13	"(putting [the library message object] into [the current player's holdall] to make room)[ignore library line break]"
Inserting it into action	7	"There is no more room in [the noun]."
Dropping action		6	"There is no more room in [the noun]."
Dropping action		5	"There is no more room on [the noun]."
Putting it on action		6	"There is no more room on [the noun]."
Taking action		15	"[We] [can't] carry [the library message object]." 
[Section 2.12 - Disambiguation]
--		45	"Who [=> nothing][do as auxiliary] [we] mean, [ignore library line break]"
--		46	"Which [=> nothing][do as auxiliary] [we] mean, [ignore library line break]"
--		48	"Whom [=> nothing][do as auxiliary] [we] want [if the person asked is not the player][the person asked] [end if]to [recap of command]?"  
--		49	"What [=> nothing][do as auxiliary] [we] want [if the person asked is not the player][the person asked] [end if]to [recap of command]?"
--		47	"Sorry, you can only have one item here. Which exactly?"
[Section 2.13 - Pronouns]
--		35	"I'm not sure what '[pronoun dictionary word]' refers to."
--		40	"[We] [can't] see '[pronoun dictionary word]' ([pronoun reference object]) at the [moment]."
requesting the pronoun meanings action	1	"At the moment, "
requesting the pronoun meanings action	2	"means "
requesting the pronoun meanings action	3	"is unset"
requesting the pronoun meanings action	4	"no pronouns are known to the game."
requesting the pronoun meanings action	5	"."
[Section 2.14 - Commanding People]
--		72	"[The person asked] [aux][have*] better things to do."
--		23	"[We] [aux]seem[-s] to want to talk to someone, but I [can't] see whom."
--		24	"[We] [can't] talk to [the library message object]." [TODO: always present tense? ]
--		58	"[The person asked] [is-are] unable to do that."
[Section 2.15 - File Operations]
Restarting the game action	1	"Are you sure you want to restart? "
Restarting the game action	2	"Failed."
Restoring the game action	1	"Restore failed."
Restoring the game action	2	"Ok."
Saving the game action		1	"Save failed."
Saving the game action		2	"Ok."
Verifying the story file action	1	"The game file has verified as intact."
Verifying the story file action	2	"The game file did not verify as intact, and may be corrupt."
[Section 2.16 - Transcripts]
switching the story transcript on action	1	"Transcripting is already on."
switching the story transcript off action	1	"Transcripting is already off."
switching the story transcript on action	2	"Start of a transcript of"
switching the story transcript off action	2	"[line break]End of transcript."
switching the story transcript on action	3	"Attempt to begin transcript failed."
switching the story transcript off action	3	"Attempt to end transcript failed."
[Section 2.17 - Scoring]
requesting the score action		1	"[if the story has ended]In that game [we][otherwise][We] have so far[end if] scored [score] out of a possible [the maximum score], in [turn count] turn[s][ignore library line break]"
--		50	"Your score has just gone [if library message amount > 0]up by [library message amount][otherwise]down by [0 - library message amount][end if] point[s]"
switching score notification on action	1	"Score notification on."
switching score notification off action	1	"Score notification off."
requesting the score action		2	"There is no score in this story."
requesting the score action		3	", earning you the rank of "
[Section 2.18 - Inventory]
Taking inventory action	5	"[The person asked] [aux]look[-s] through [its-their] possessions."
Taking inventory action	1	"[We] [is-are] carrying nothing."  [TODO]
Taking inventory action	2	"[We] [is-are] carrying[ignore library line break]"  [TODO: continuous tense]
Taking inventory action	3	":[line break]"
Taking inventory action	4	"."  [TODO:  linebreak?] [unused?]
--		101	" (providing light)" [they get a parameter [library message object] ]
--		102	  " (closed)"
--		104	  " (empty)"
--		106	  " (closed and empty)"
--		103	  " (closed and providing light)"
--		105	  " (empty and providing light)"
--		107	  " (closed, empty and providing light)"
--		108	  " (providing light and being worn" 
--		109	  " (providing light"
--		110	 " (being worn"
--		111	" ("
--		112	 "open"
--		113	 "open but empty"
--		114	 "closed"
--		115	 "closed and locked"
--		116	 " and empty"
--		117	 " (empty)"
--		118	 " containing "
--		119	 " (on "
--		120	 ", on top of "
--		121	" (in "
--		122	 ", inside "
[Section 2.19 - Darkness]
--		9	"[if the story tense is in any past tense]It suddenly became pitch dark.[otherwise]It is now pitch dark in here![end if]"
--		17	"It [if the story tense is in any past tense]was[else]is[end if] pitch dark, and [we] [can't] see a thing."
Examining action	1	"Darkness, noun.  An absence of light to see by."
Looking under action	1	"But it[if the story tense is in any past tense] was[else]'s[end if] dark."
Searching action  		1	"But it[if the story tense is in any past tense] was[else]'s[end if] dark."
--		71	"Darkness"  [DARKNESS__TX]
[Section 2.20 - Take]
Taking action	1	"Taken."
Taking action	16	"[The person asked] [aux]pick[-s] up [the noun]."
Taking action	2	"[We] [is-are] always self-possessed."
Taking action	3	"[We] [=>negation][aux]suppos[e-s] [the noun] [=>would][if the story tense is in any past tense][=>perfect][end if][aux]car[e-s] for that."
Taking action	4	"[We][']d have to get [if noun is a supporter]off[otherwise]out of[end if] [the noun] first."
Taking action	5	"[We] already [aux][have*] [that-those of the noun]."
Taking action	6	"[That-Those of the noun] [aux]seem[-s] to belong to [the library message object]." 
Taking action	7	"[That-Those of the noun] [aux]seem[-s] to be a part of [the library message object]."
Taking action	8	"[That-Those of the library message object] [is-are]n't available."
Taking action	9	"[The library message object] [is-are]n't open."
Taking action	10	"[That's-They're of the library message object] hardly portable."
Taking action	11	"[That's-They're of the library message object] fixed in place."
Taking action	14	"[We] [can't] reach into [the library message object]." 
[Section 2.21 - Remove]
Removing it from action	3	"Removed."
[LibMsg <report npc removing>			"[The actor] remov[e-s] [the % dobj] from [the second noun]."]
Removing it from action	1	"[It-they of noun] [is-are] unfortunately closed."
Removing it from action	2	"But [it-they of noun] [is-are]n't there [if the story tense is in any past tense]any longer[else]now[end if]."
[Section 2.22 - Drop]
Dropping action		4	"Dropped."
Dropping action		7	"[The person asked] [aux][put*] down [the noun]."
Dropping action		1	"[The noun] [is-are] already [if the story tense is in any past tense]t[end if]here."
Dropping action		2	"[=>negation][We] [aux][have*] [that-those of the noun]."
[Section 2.23 - Insert]
Inserting it into action	8	"Done."
Inserting it into action	9	"[We] [aux][put*] [the noun] into [the second noun]."
Inserting it into action	10	"[The person asked] [aux][put*] [the noun] into [the second noun]."
Inserting it into action	1	"[We] [aux]need[-s] to be holding [the noun] before [we] [can] put [it-them] into something else."
Inserting it into action	2	"[That-Those of the noun] [can't] contain things."
Inserting it into action	3	"[The noun] [is-are] closed."
Inserting it into action	4	"[We]'ll need to take [it-them of noun] off first."
Inserting it into action	5	"[We] [can't] put something inside itself."
[Section 2.24 - Put On]
Putting it on action	7	"Done."
Putting it on action	8	"[We] [aux][put*] [the noun] on [the second noun]."
Putting it on action	9	"[The person asked] [aux][put*] [the noun] on [the second noun]."
Putting it on action	1	"[We] [aux]need[-s] to be holding [the noun] before [we] [can] put [it-them] on top of something else."
Putting it on action	2	"[We] [can't] put something on top of itself."
Putting it on action	3	"Putting things on [the noun] [=>would][if the story tense is in any past tense][=>perfect][end if][aux]achieve[-s] nothing."
Putting it on action	4	"[We] [aux]lack[-s] the dexterity."
[Section 2.25 - Give]
Giving it to action	5	"[We] [aux][give*] [the noun] to [the second noun]."
Giving it to action	1	"[We] [=>negation][=>continuous][aux]hold[-s] [the noun]."
Giving it to action	6	"[The person asked] [aux][give*] [the noun] to you."
Giving it to action	7	"[The person asked] [aux][give*] [the noun] to [the second noun]."
Giving it to action	2	"[We] [aux]juggle[-s] [the noun] for a while, but [=>negation][aux]achieve[-s] much."
Giving it to action	3	"[The second noun] [=>negation][aux]seem[end aux] interested."
Giving it to action	4	"[The second noun] [is-are]n't able to receive things."
[Section 2.26 - Show]
Showing it to action	1	"[We] [=>negation][=>continuous][aux]hold[-s] [the noun]."
Showing it to action	2	"[The noun] [is-are] unimpressed."
[Section 2.27 - Enter]
Entering action	5	"[We] [aux][get*] [if noun is a supporter]onto[otherwise]into[end if] [the noun]."
Entering action	8	"[The person asked] [aux][get*] into [the noun]."
Entering action	9	"[The person asked] [aux][get*] onto [the noun]."
Entering action	1	"But [we]['s-'re] already [if noun is a supporter]on[otherwise]in[end if] [the noun]."
Entering action	2	"[That's-They're of the noun] not something [we] [can] [quoted verb posture]."
Entering action	3	"[We] [can't] get into the closed [noun]."
Entering action	4	"[We] [can] only get into something free-standing."
[Section 2.28 - Exit, Get Off]
Exiting action		3	"[We] [aux][get*] [if library message object is a supporter]off[otherwise]out of[end if] [the library message object]."
Exiting action		5	"[The person asked] [aux][get*] off [the library message object]."
Exiting action		6	"[The person asked] [aux][get*] out of [the library message object]."
Exiting action		1	"But [we] [is-are]n't in anything at the [moment]."
Exiting action		2	"[We] [can't] get out of the closed [library message object]."
Getting off action		1	"But [we] [is-are]n't on [the library message object] at the [moment]."
Exiting action		4	"But [we] [is-are]n't [if library message object is a supporter]on[otherwise]in[end if] [the library message object]."
[Section 2.29 - Go]
Going action		2	"[We] [can’t] go that way." [CANTGO__TX]
Going action		1	"[We] [=>would][aux][have*] to get [if library message object is a supporter]off[otherwise]out of[end if] [the library message object] first."
Going action		6	"[We] [can't], since [the library message object] [aux]lead[-s] nowhere."
Going action		7	"You'll have to say which compass direction to go in."
Going action		8	"[The person asked] [aux][go*] up"
Going action		9	"[The person asked] [aux][go*] down"
Going action		10	"[The person asked] [aux][go*] [noun]"
Going action		11	"[The person asked] [aux]arrive[-s] from above"
Going action		12	"[The person asked] [aux]arrive[-s] from below"
Going action		13	"[The person asked] [aux]arrive[-s] from the [library message object]"
Going action		14	"[The person asked] [aux]arrive[-s]"
Going action		15	"[The person asked] [aux]arrive[-s] at [the library message object] from above"
Going action		16	"[The person asked] [aux]arrive[-s] at [the library message object] from below"
Going action		17	"[The person asked] [aux]arrive[-s] at [the library message object] from the [second library message object]" [TODO]
Going action		18	"[The person asked] [aux][go*] through [the library message object]"
Going action		19	"[The person asked] [aux]arrive[-s] from [the library message object]"
Going action		20	"on [the library message object]"
Going action		21	"in [the library message object]"
Going action		22	", pushing [the library message object] in front, and [us] along too"
Going action		23	", pushing [the library message object] in front"
Going action		24	", pushing [the library message object] away"
Going action		25	", pushing [the library message object] in"
Going action		26	", taking [us] along"
[Section 2.30 - Brief, Super Brief, Verbose]
preferring unabbreviated room descriptions action 	1	" is now in its 'verbose' mode, which always gives [us] long descriptions of locations (even if [we] have been there before)."
preferring abbreviated room descriptions action	1	" is now in its 'superbrief' mode, which always gives [us] short descriptions of locations (even if [we] haven't been there before)."
preferring sometimes abbreviated room descriptions action	1	" is now in its normal 'brief' printing mode, which gives [us] long descriptions of places never before visited and short descriptions otherwise."
[Section 2.31 - Look]
Looking action		9	"[The person asked] [aux]look[-s] around."
Looking action		1	" (on [the library message object])[ignore library line break]"
Looking action		2	" (in [the library message object])[ignore library line break]"
Looking action		3	" (as [library message object])[ignore library line break]"
Looking action		8	"[if the library message object is a supporter] (on [otherwise] (in [end if][the library message object])[ignore library line break]"
Looking action		5	"[if the library message object is the location][We] [otherwise if the library message object is a room]In [the library message object] [we] [otherwise if the library message object is a supporter]On [the library message object] [we] [otherwise if the library message object is an animal]On [the library message object] [we] [otherwise]In [the library message object] [we] [end if][can] [if the locale paragraph count is at least one]also [end if]see [ignore library line break]"     [messages 5 and 6 are now used again, from this extension's I-could-also-see rule, which replaces the standard you-can-also-see rule ]
Looking action		6	"[if the library message object is not the location].[otherwise if the story tense is in any past tense] there.[otherwise] here.[end if]"
Looking action		4	"On [the library message object] [list the contents of library message object with as a sentence list option +  tersely list option + not listing concealed items list option + is-are list option + including contents list option + giving brief inventory information list option]."   [ "+ listing marked items only list"    was removed for 6G60 ]
Looking action		7	"[We] [aux][see*] nothing unexpected in that direction."
[Section 2.32 - Examine]
Examining action	4	"[The person asked] [aux]look[-s] closely at [the noun]."
Examining action	2	"[We] [aux][see*] nothing special about [the noun]."
Examining action	5	"[We] [aux][see*] nothing unexpected in that direction."
Examining action	3	"[The noun] [is-are][if the story tense is in any present tense] currently[end if] switched [if noun is switched on]on[otherwise]off[end if]." 
[Section 2.33 - Search]
Searching action  	8	"[The person asked] [aux]search[-es] [the noun]."
Searching action  	4	"[We] [aux][find*] nothing of interest."
Searching action  	5	"[We] [can't] see inside, since [the noun] [is-are] closed."
Searching action  	6	"[The noun] [is-are] empty."
Searching action  	2	"There [is-are] nothing on [the noun]."
Searching action  	3	"On [the noun] [list the contents of noun with as a sentence list option +  tersely list option + not listing concealed items list option + is-are list option]."
Searching action  	7	"In [the noun] [list the contents of noun with as a sentence list option +  tersely list option + not listing concealed items list option + is-are list option]."
[Section 2.34 - Look Under]
Looking under action	3	"[The person asked] [aux]look[-s] under [the noun]."
Looking under action	2	"[We] [aux][find*] nothing of interest."
[Section 2.35 - Open]
Opening action		5	"[We] [aux]open[-s] [the noun]."
Opening action		6	"[The person asked] [aux]open[-s] [the noun]."
Opening action		7	"[The noun] [aux]open[-s]."
Opening action		1	"[That's-They're of the noun] not something [we] [can] open."
Opening action		2	"[It-They of the noun] [aux]seem[-s] to be locked."
Opening action		3	"[That's-They're of the noun] already open."
Opening action		4	"[We] [aux]open[-s] [the noun], revealing [if the number of not undescribed not scenery things in the noun is zero]nothing[otherwise][list the contents of noun with the as a sentence list option +  the tersely list option + the not listing concealed items list option][end if]." 
[Section 2.36 - Close]
Closing action		3	"[We] [aux]clos[e-s] [the noun]."
Closing action		4	"[The person asked] [aux]clos[e-s] [the noun]."
Closing action		5	"[The noun] [aux]clos[e-s]."
Closing action		1	"[That's-They're of the noun] not something [we] [can] close."
Closing action		2	"[That's-They're of the noun] already closed."
[Section 2.37 - Lock]
Locking it with action	5	"[We] [aux]lock[-s] [the noun]."
Locking it with action	6	"[The person asked] [aux]lock[-s] [the noun]."
Locking it with action	1	"[That-Those of the noun] [=>negation][aux]seem[end aux] to be something [we] [can] lock."
Locking it with action	2	"[That's-They're of the noun] locked at the [moment]."
Locking it with action	3	"First [we] [=>would][aux][have*] to close [the noun]."
Locking it with action	4	"[That-Those of the noun] [=>negation][aux]seem[end aux] to fit the lock."
[Section 2.38 - Unlock]
Unlocking it with action	4	"[We] [aux]unlock[-s] [the noun]."
Unlocking it with action	5	"[The person asked] [aux]unlock[-s] [the noun]."
Unlocking it with action	1	"[That-Those of the noun] [=>negation][aux]seem[end aux] to be something [we] [can] unlock."
Unlocking it with action	2	"[That's-They're of the noun] unlocked at the [moment]."
Unlocking it with action	3	"[That-Those of the second noun] [=>negation][aux]seem[end aux] to fit the lock."
[Section 2.39 - Switch On, Off]
Switching on action	3	"[We] [aux]switch[-es] [the noun] on."
Switching on action	4	"[The person asked] [aux]switch[-es] [the noun] on."
Switching on action	1	"[That's-They're of the noun] not something [we] [can] switch."
Switching on action	2	"[That's-They're of the noun] already on."
Switching off action	3	"[We] [aux]switch[-es] [the noun] off."
Switching off action	4	"[The person asked] [aux]switch[-es] [the noun] off."
Switching off action	1	"[That's-They're of the noun] not something [we] [can] switch."
Switching off action	2	"[That's-They're of the noun] already off."
[Section 2.41 - Wear]
Wearing action		4	"[We] [aux][put*] on [the noun]."
Wearing action		5	"[The person asked] [aux][put*] on [the noun]."
Wearing action		1	"[We] [can't] wear [that-those of the noun]!"
Wearing action		2	"[We] [=>negation][=>continuous][aux]hold[-s] [that-those of the noun]!"
Wearing action		3	"[We] [is-are] already wearing [that-those of the noun]!"
[Section 2.42 - Take Off]
Taking off action 	2	"[We] [aux][take*] off [the noun]."
Taking off action 	3	"[The person asked] [aux][take*] off [the noun]."
Taking off action 	1	"[We] [=>continuous][=>negation][aux][wear*] [that-those of the noun]."
[Section 2.43 - Eating And Drinking, Senses]
Eating action		2	"[We] [aux][eat*] [the noun]. Not bad."
Eating action		3	"[The person asked] [aux][eat*] [the noun]."
Eating action		1	"[We] [is-are]n't that hungry." 
Drinking action		1	"[We] [is-are]n't that thirsty."
Tasting action		1	"[We] [aux]tast[e-s] nothing unexpected."
Smelling action		1	"[We] [aux]smell[-s] nothing unexpected."
Listening to action		1	"[We] [aux][hear*] nothing unexpected."
[Section 2.44 - Touching]
Touching action		2	"[We] [aux][feel*] nothing unexpected."
Touching action		6	"[The person asked] [aux]touch[-es] [the noun]."
Touching action		3	"[if the story viewpoint is second person]If you think that'll help[else][We] [aux]touch[-es] [ourselves][end if]."
Touching action		4	"[The person asked] [aux]touch[-es] [it-them of noun]self."
Touching action		1	"[We] [aux][keep*] [our] hands to [ourselves]."
Touching action		5	"[The person asked] [aux]touch[-es] [us]."
[Section 2.45 - Rhetorical Commands]
Saying Yes action 	1	"That was a rhetorical question."
Saying No action  	1	"That was a rhetorical question."
Saying sorry action	1	"Oh, don't apologi[#if American dialect]z[#otherwise]s[#end if]e."
Swearing obscenely action		1	"Real adventurers do not use such language."
Swearing mildly action		1	"Quite."
[Section 2.46 - Body Movement]
Climbing action		1	"[We] [=>negation][aux][think*] much would be achieved by that."
Jumping action		1	"[We] [aux]jump[-s] on the spot, fruitlessly."
Swinging action		1	"There [is-are] nothing sensible to swing here."
Waving Hands action 	1	"[We] [aux]wav[e-s], feeling foolish."
[Section 2.47 - Physical Interaction]
Attacking action  	1	"Violence [is-are]n't the answer to this one."
Burning action	1	"This dangerous act [=>would][aux]achiev[e-s] little."
Cutting action	1	"Cutting [that-those of the noun] up [=>would][aux]achiev[e-s] little."
Rubbing action	1	"[We] [aux]achiev[e-s] nothing by this."
Setting it To action	1	"[We] [can't] set [that-those of the noun] to anything."
Tying it to action 	1	"[We] [=>would][aux]achiev[e-s] nothing by this."
Waving action	2	"[We] [aux]wav[e-s] [the noun] around, but to no effect."
Waving action	3	"[The person asked] [aux]wav[e-s] [the noun], to [our] amusement."
Waving action	1	"But [we] [is-are]n't holding [that-those of the noun]."
Squeezing action 	1	"[We] [aux][keep*] [our] hands to [ourselves]."
Squeezing action 	2	"[We] [aux]achiev[e-s] nothing by this."
Squeezing action 	3	"[The person asked] [aux]squeez[e-s] [the noun]."
throwing it at action	2	"[We] [aux]lack[-s] the nerve when it [if story tense is in any past tense]came[else]comes[end if] to the crucial moment."
throwing it at action	1	"Futile."
[Section 2.48 - Push, Pull, Turn]
Pushing action		6	"[The person asked] [aux]push[-es] [the noun]."
Pulling action		5	"[The person asked] [aux]pull[-s] [the noun]."
Turning action		7	"[The person asked] [aux]turn[-s] [the noun]."
Pushing action		3	"Nothing obvious happen[-s]."
Pulling action		3	"Nothing obvious happen[-s]."
Turning action		3	"Nothing obvious happen[-s]."
Pushing it to action		1	"[The noun] [can] not be pushed from place to place."
Pushing it to action		2	"[We] [aux][have*] to decide in what direction to push [the noun]."
Pushing it to action		3	"[We] [=>could][=>negation]push[-es] it [second noun][if story tense is in any past tense], though [we] tried[end if]."
Pushing action		1	"[It-They of the noun] [is-are] fixed in place."
Pulling action		1	"[It-They of the noun] [is-are] fixed in place."
Turning action		1	"[It-They of the noun] [is-are] fixed in place."
Pushing action		2	"[We] [is-are] unable to."
Pulling action		2	"[We] [is-are] unable to."
Turning action		2	"[We] [is-are] unable to."
Pushing action		4	"That would [if story tense is in any past tense]have been[else]be[end if] less than courteous."
Pulling action		4	"That would [if story tense is in any past tense]have been[else]be[end if] less than courteous."
Turning action		4	"That would [if story tense is in any past tense]have been[else]be[end if] less than courteous."
[Section 2.49 - Speech / Interpersonal Actions]
Answering it that action	1	"There [if story tense is in any past tense]was[else]is[end if] no reply."
Asking it about action  	1	"There [if story tense is in any past tense]was[else]is[end if] no reply."
Asking it for action		1	"There [if story tense is in any past tense]was[else]is[end if] no reply."
Buying action		1	"[Our] impulse buying nearly [aux][get*] the better of [us]."
Kissing action		1	"Some things [if the story tense is in any past tense]were[else]are[end if] best approached slowly."
Singing action		1	"[We] [aux]start[-s] singing to [ourselves], though not loud enough to disturb."
Telling it about action	2	"This [aux]provok[e-s] no reaction."
Telling it about action	1	"[We] [aux]talk[-s] to [ourselves] a while."
[Section 2.50 - Mental Actions]
Thinking action		1	"I'll wait here."
Consulting it about action	1	"[We] [=>negation][aux]discover[-s] anything of interest in [the noun]."
Consulting it about action	2	"[The person asked] [aux]look[-s] at [the noun]."
[Section 2.51 - Sleep And Waiting]
Sleeping action		1	"[We] [is-are]n't feeling especially drowsy."
Waking up action 		1	"[We] [aux]pinch[-es] [ourselves], but it wasn't worth it."
Waking action		1	"That [aux]seem[-s] unnecessary."
Waiting action		1	"Time [aux]pass[-es]."
Waiting action		2	"[The person asked] [aux]wait[-s]."
[miscellaneous messages not in the original CLM, possibly by design]
--		2	"Nothing to do!"
--		18	"[ourselves]"  [deprecated?]
--		19	"As good-looking as ever."
--		39	"That's not something you need to refer to in the course of this game."
--		56	"."
--		57	"?"
--		73	"That noun did not make sense in this context."
--		74	"[bracket]That command asks to do something outside of play, so it can only make sense from you to me. [The person asked] cannot be asked to do this.[close bracket]"
[end of game]
--		3	" You have died [ignore library line break]"
--		4	" You have won [ignore library line break]"
--		75	" The End [ignore library line break]"
--		5	"Would you like to [ignore library line break]" [bug reported, #0000203]
--		76	" or " [bug reported, #0000203]



Custom Library Messages ends here.

---- DOCUMENTATION ----

Section : Changing tense and viewpoint

As the big brother of Default Messages by Ron Newcomb, this extension Custom Library Messages allows several features beyond selectively replacing Inform's library messages.  Primarily, the viewpoint and tense of the entire library can be changed with a pair of lines, and changed again at any time during play.  (Merely including the extension sets first person past tense.)
	The story tense is past tense.
	The story viewpoint is third person feminine.
	
	When a flashback scene ends, now the story tense is present tense.


The possible values for the story viewpoint are:
	first person
	second person
	third person masculine
	third person feminine
	third person
	first person plural
	second person plural
	third person plural

And for the story tense:
	present tense
	past tense
	present-perfect tense
	past-perfect tense
	continuous present tense
	continuous past tense
	continuous present-perfect tense
	continuous past-perfect tense

Only the past/present portion of the story tense is permanently set.  Perfect and continuous are "used up", and are primarily intended for prose generation purposes rather than inflecting the entire message collection. 

If the extension Plurality is included, it needs to be included before this extension.  Otherwise, "[is-are]" and related substitutions will not work for first person viewpoint or any past tense.

	Include Plurality by Emily Short.
	Include Custom Library Messages by Ron Newcomb.


Section : Selective Message replacement

Identical to Default Messages, messages can be changed by a table continuation. (Table amendments may be used for actions to save a little bit of space.)

	*: Table of custom library messages (continued)
	library-action	library-message-id	library-message-text
	--			10				"(I beg your pardon, but I didn't catch your drift.)"
	going action	2				"She couldn't go [noun] from here."
	taking action	1				"She always wanted [a noun]."
	--	28	"(I understood [library message verb] but not the rest of it.)"

There's a few variables that come in handy for certain messages. "The noun" and "the second noun" are of course available, as is "the number understood" and similar. The others are:

	the person asked -- we cannot use "the actor" within our table, but this is identical.

	library message verb -- this would be "take" for the taking action, "go" for the going action, etc. (More precisely, it is the entire command predicate typically used in "What do you want to take?" or "I only understood you as far as take them.")

	library message pronoun -- when our reader uses a pronoun, this is the pronoun she used.

	pronoun reference object -- the noun that the above pronoun refers to.

	library message object, second library message object, library message amount -- effectively synonymous with the noun, the second noun, and the number understood for non-action messages.

	library message action, library message number -- these are the variables that are compared to our two table columns. The first differs from the library message verb in that it has the present participle ("taking") rather than the root form ("take"). For actions which take two nouns, the preposition is also included ("giving it to").

This extension usually guesses correctly on line break issues, but for those cases where it adds an extra, the say phrase "[ignore library line break]" should cure it.  It can be mixed-n-matched with the normal "[run paragraph on]" if need be.


Section : the Printing Library Message activity

A new activity, "printing library message", is available for whatever purpose.  It is an activity on numbers, and the action's name is attached by a "while" clause.  For messages that aren't attached to a particular action, use "misc messaging" as the action. 

	*: For printing library message 3 while taking: say "Er, nevermind." 
	For printing library message 10 while misc messaging: say "Please type something in." 

We can create multiple tables that resemble the custom library messages table, and set one of them as the official table via the table-that-varies "the default messages table", like so.
	Carry out Lady Marion following the player:
		now the default messages table is the table of Lady Marion's observations.
	
	Table of Lady Marion's observations
	library-action	library-message-id	library-message-text
	-- 		10	"'Are you always so quiet?'"

If the alternate table does not hold every message, the activity can take corrective action in any number of ways.  As a safeguard during testing, the option "Use library message alerts" will print a warning if a message went unhandled.  
	*: Use library message alerts.


Section : Complete Verb Phrase Generation

Various voice and modes may be set temporarily by changing the following global variables.  All are truth states, usually false.
	passive voice
	negation pending
	question pending

The final mode is a global variable with one of the following values.
	now could-would-should is non-modal;
	now could-would-should is could;
	now could-would-should is would;
	now could-would-should is should;

(Future tense is created by combining "would" with any present tense, in which "would" becomes "will".  Or to state that the other way around, "would" is the past tense of "will".  It is done this way because future tense is syntactically a mode, not an inflection.)

Like the perfective and continuous aspects, these modes are "used up".


Section : Using Verb Phrase Generation

The same say-phrase combinations used within this extension can be used in a work for limited prose generation. The verb is wrapped with "[aux]" and one of the suffixes "[-s]", "[e-s]", "[-es]", "[-ies]", or the silent "[end aux]".  To allow generating questions, the sentence begins with the capitalized "[Aux]", marking where the first word goes.  For pronouns, say-phrases exist, named after the first person plural because it has a unique word and capitalization for all five declensions. It will always print the pronoun appropriate for the story viewpoint.
	*: say "[We] [aux]lik[e-s] it very much.";

This can print as:
	I like it very much.
	He likes it very much.
	You liked it very much.
	They had liked it very much.
	She would not have liked it very much.

And so on. Likewise for questions.
	*: say "[Aux][we] [aux]want[-s] it very much?";


Irregular verbs replace the word & suffix with the root form immediately followed by an asterick, like "[eat*]".  The verbs understood by default are: eat*, feel*, find*, get*, give*, hear*, put*, see*, take*, have*, go*, wear*, think*, keep*, be*, and do*.
	*: say "[Aux]Bob [aux][eat*] much lately?";

New irregular verbs can be defined by a sentence and table continuation.
	*: Some irregular verbs are say*, lead*, wake*, wake up*.
	
	table of irregular verbs (continued)
	word
	"say[-s]"
	"said"
	"saying"
	"said"
	"lead[-s]"
	"led"
	"leading"
	"led"
	"wake[-s]"
	"woke"
	"waking"
	"woken"
	"wake[-s] up"
	"woke up"
	"waking up"
	"woken up"

Some verbs can be used as auxiliary verbs rather than as the main verb.  For these, the following phrases should give correct results. 
	"[is as auxiliary]"
	"[have as auxiliary]"
	"[do as auxiliary]"

For example, with decide as the main verb.
	say "[We] [have as auxiliary] decided to soldier on."


Section : Miscellaneous Substitutions

The say phrase "[=> (an object)]", like "[=> the player]", will 'mark that object in output' a la Plurality.  Using nothing, "[=> nothing]", will reference the story viewpoint.  A few others are used to touch up certain messages.  

	"[moment]" for the final word in "at the moment/time"
	"[here-there]" for the final word in "is here" vs "was there"
	"[can]" for can/could 
	"[can't]" for can't/couldn't

These temporarily put the verb phrase generation into a particular mode. Their effects are used up as above.

	"[=>negation]" 
	"[=>would]"  
	"[=>could]" 
	"[=>perfect]"
	"[=>continuous]"

None of the say phrases in this section are necessary for the author to learn, but they occasionally come in handy.  New ones can be created by quizzing the story viewpoint and story tense, or by asking if something "acts plural" to determine is/are distinctions. 

	*: To say 's-'ve:    
		if the story tense is in any past tense:
			say "[']d";
		otherwise if the prior named noun acts plural:
			say "[']ve";
		otherwise:
			say "[']s".


(Ron Newcomb can be reached at pscion@yahoo.com)


Example: * Poster Shopping - A vignette.

Normally, an author wouldn't use the heavily adaptable text like this table is doing. It's done here so a few various viewpoints may be tried out. Indeed, this example doesn't fully support present tense.

	*: "Poster Shopping"
	
	Include Custom Library Messages by Ron Newcomb.

	The story tense is past tense.
	The story viewpoint is first person.
	
	The poster shop is a room.
	
	The horror movie poster is a lit thing in the poster shop. 
	The romantic movie poster is a thing in the poster shop.
	The fantasy movie poster is a thing in the poster shop.
	
	Carry out examining the player for the first time: increase the score by 2.
	
	Table of custom library messages (continued)
	library-action	library-message-id	library-message-text
	taking inventory action	1	"[We] [have as auxiliary] decided to acquire a new movie poster."
	--		10	"[bracket]I didn't catch your drift there.[close bracket]"
	--		109	" (glowing in the dark"
	taking action	1	"[We] [go*] for [the noun]."
	going action	2	"Born and raised in the city, [we] [have*] no idea what direction [is-are] [noun]."
	--		49	"Which poster [would as auxiliary] [we] [library message verb]?"
	--		35	"[We] [=>negation][aux][see*] what '[library message pronoun]' could possibly refer to."
	--		50	"[We] [have as auxiliary] [if library message amount > 0]gained[otherwise]lost[end if] [library message amount in words] point[s][ignore library line break]"
	--		75	" A [random carried thing] [aux]adorn[-s] [our] wall [ignore library line break]"
	
	Instead of going when something is carried, end the story.
	
	Test me with "x me / i / / take / her / s / take horror poster / i / s ".
	Test her with "pov third person feminine / x me / i / / take / her / s / take horror poster / i / s".
	Test them with "pov third person plural / x me / i / / take / her / s / take horror poster / i / s".

Example: * But Then What? - Regarding the "only understood as far as" parser error.

Unlike the "What would you like to..." message which incorporates the relevant part of the player's command into itself, the parser error "I only understood you as far as.." does not.  We can change the message, but the player's command will always be tacked on afterward, making it difficult if we wish to end the response with a close quote, a closing bracket, roman type, etc.  For this situation, we must use a rule.  (If we use both, the rule is consulted first.  This can be useful if we want to add "when..." conditions to the rule:  the table's version would be used when no rules apply.)

For additional measure, a phrase printing the rest of the command, and a phrase deciding if the misunderstood word is known at all, also appear.

	*: "But Then What?"
	
	Include Custom Library Messages by Ron Newcomb.
	
	There is a room called In the Spotlight.   

	Rule for printing a parser error when the latest parser error is the only understood as far as error:
		say "I see you wanted to [library message verb] but what did you mean by the word [misunderstood word] in '[what was misunderstood]'?" 
	
	To decide which snippet is what was misunderstood: 
		(- (((wn - 1) * 100) + (WordCount() - 2)) -).
	
	Rule for printing a parser error when the latest parser error is the only understood as far as error and the misunderstood word is known elsewhere:
		say "I see you wanted to [library message verb] but, although I know the word [misunderstood word], I wasn't expecting it there."
	
	To decide if the misunderstood word is known elsewhere: 
		(- (wn--, NextWord() ~= 0) -).
	
	Test me with "examine me now / examine me closely now /  examine me spotlight".

Example: **** Exhaustive Test - Prints out the same line in every combination of tense, aspect, mood, voice, declension, etc., some 1,024 variations of the same sentence.

	*: "Exhaustive Test for Custom Library Messages"
	
	Spot is room. Include Custom Library Messages by Ron Newcomb.
	
	Test me with "list all verb phrasings / list passive verb phrasings".
	
	Understand "list all verb phrasings" as a mistake ("[verb phrasings]").
	Understand "list passive verb phrasings" as a mistake ("[passive verb phrasings]").
	
	To say verb phrasings:
		repeat with modality running from 0 to (2 * 2 * 2 * 4 * 2 * 2) - 1:
			if the modality masked by 7 is zero, now the story tense is present tense;
			otherwise now the story tense is (modality masked by 7) as a conjugation;
			now could-would-should is (((modality divided by 8) masked by 3) plus 1) as a xould;
			now negation pending is whether or not modality masked by 32 is 32;
			now question pending is whether or not modality masked by 64 is 64;
			say "[line break][bold type][modality] [if could-would-should is not non-modal][could-would-should] [end if][if negation pending is true]-not- [end if][the story tense][if question pending is true]?[otherwise].[end if][roman type]";
			repeat with form running through all declensions:
				now the story viewpoint is form;
				if the modality masked by 7 is zero, now the story tense is present tense;
				otherwise now the story tense is (modality masked by 7) as a conjugation;
				now could-would-should is (((modality divided by 8) masked by 3) plus 1) as a xould;
				now negation pending is whether or not modality masked by 32 is 32;
				now question pending is whether or not modality masked by 64 is 64;
				say "[=> nothing][Aux][we] [aux]carr[-ies] [our] stuff [ourselves] for [us] and [ours][if modality masked by 64 is 64]?[else].[end if]"
	
	
	To say passive verb phrasings:
		repeat with modality running from 128 to 128 + (2 * 2 * 2 * 4 * 2 * 2) - 1:
			if the modality masked by 7 is zero, now the story tense is present tense;
			otherwise now the story tense is (modality masked by 7) as a conjugation;
			now could-would-should is (((modality divided by 8) masked by 3) plus 1) as a xould;
			now negation pending is whether or not modality masked by 32 is 32;
			now question pending is whether or not modality masked by 64 is 64;
			say "[line break][bold type][modality] [if could-would-should is not non-modal][could-would-should] [end if][if negation pending is true]-not- [end if][the story tense][if question pending is true]?[otherwise].[end if][roman type]";
			repeat with form running through all declensions:
				now the story viewpoint is form;
				now passive voice is true;
				if the modality masked by 7 is zero, now the story tense is present tense;
				otherwise now the story tense is (modality masked by 7) as a conjugation;
				now could-would-should is (((modality divided by 8) masked by 3) plus 1) as a xould;
				now negation pending is whether or not modality masked by 32 is 32;
				now question pending is whether or not modality masked by 64 is 64;
				say "[=> nothing][Aux][we] [aux]carr[-ies] by [our] horse[if modality masked by 64 is 64]?[else]."
	
	To decide what number is (N - a number) masked by (mask - a number): (- ({N} & {mask}) -) .
	To decide what declension is (N - a number) as a declension: (- ({N}) -) .
	To decide what conjugation is (N - a number) as a conjugation: (- ({N}) -) .
	To decide what xould is (N - a number) as a xould: (- {N} -) .
	
	

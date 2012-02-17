Version 4/120212 of Custom Library Messages by Ron Newcomb begins here.

"Changes the tense and viewpoint of all of the built-in messages in Inform's library.  Also provides an activity for additional customizations, and say-phrases for verb phrase generation."

"with special thanks to David Fisher"

[ Ron Newcomb can be reached at pscion@yahoo.com ]
[ Version 1: initial public release (not including several beta versions.) Thanks Jeff Nyman, "capmikee", Paul "Laroquod", and "gravel". ]
[ Version 2: Corrects "On the table is ." error.  Thanks CEJ Pacian. ]
[ Version 3: Now compatible with "use no deprecated phrases" when including Plurality, meaning, all "[Cap xx-xxx]" phrases were rewritten to "[Xx-xxx]".  Fixed bug with have* irregular verb, especially when used in the second person present tense. Thanks George Oliver. Also documents snafu with "only understood as far as" which reprints the command afterward regardless what's replaced.  Copied documentation regarding globals from Default Messages to here. Removed optional of/-- word from the case-sensitive say-phrases that-those, etc., due to Inform bug. Cleaned up the index a bit.  Added an example from Default Messages. Removed a phrase that was only used in the example, and added it to the documentation instead. ]
[ Version 4: Saying "[The player] saw [the player]" now works correctly for non-second person viewpoints. Thanks Mark Tilford. Several Going action messages were corrected for obvious faults, and looking action #6 was touched to deal with line break issues when additional rules follow I-could-also-see. Thanks CEJ Pacian, StJohnLimbo, and Matt W.  Fixed many more messages for particular tense-viewpoint combinations. Thanks Ben Sokal.  Informed the list writer to change between past & present tenses. Modified Aux/aux say-phrases so I could change the [n't] say-phrase so it always prints n't/not when used, to make it more user-friendly outside of the extension.  Removed a few say-phrases that weren't used at all. Documented remaining say-phrases. Re-arranged documentation. Added the "any third person singular" and "any third person plural" objects to cover some edge cases. Rewrote the irregular verb handling to use 5 table rows per entry rather than four.  Polished extension's appearance in the author's index. Added the [^] capitalisation say-phrase from the extension Mentioned In Room Descriptions.  Added [have+], [are+], and [do+] to ease migration from David's CLM extension.  For Glulx builds only, split the I-could-also-see rule in twain, so the former can be replaced without nixing the listing nondescript items activity. Added the ability to expand the list of pronouns & declensions (story viewpoints) for members of the LGBT community.  Added new example for same.  Removed support for second person plural; an example demonstrates how to add it back in.  Added a run-time problem callout in the case of a missing library message, which prints which table the message is missing from, and corrected its ability to detect same. The use option library message alerts is now always on, in testing builds only. Rewrote from scratch the code to decide on verb inflections -- it's really elegant now!  Gave names to the grammatical cases and verb inflections.  Now uses section replacement on Plurality for much smoother integration.  Rewrote L__M() and completely removed LanguageLM() so there's only one intervened phrase, which is now an activity For rule which works better with rules placed before & after it.  Extracted some higher functionality out and moved it to another extension, "Automated Verb Phrases".  Renamed the that-those phrase to that-those-us because Plurality's is in nominative case, not dative case.  Thanks Ben Sokal.  Fixed a few messages to use the library message object or the second noun instead of the noun.  And finally, replaced the pronoun in "You have died" with [We] because, even though the message is arguably out of world, the player at the keyboard presumably does not die.  But even if they do, this would explain I-F's perpetually limited audience, and anyone who argues otherwise won't be around long enough to complain about the change. Thanks CEJ Pacian. ]
[ Version 4/110422:  Switch_TX had its present/past swapped. Thanks CEJ Pacian. ]
[ Version 4/120212:  Saying that-those-us now says "that" instead of nothing for the case of a neuter animal. Thanks Dan Efran. ]


[ WISHLIST:  An example to print out the entirety of the CLM table in a code form that can be copy-pasted back into a work and used with the much smaller Default Messages.  This is if the author needn't change viewpoint or tense during play. ]

Book - Interface

Section - Custom Library Messages

Use library message alerts translates as (- ! Constant LIBRARY_MESSAGE_ALERTS; -). [ From Default Messages extension, but is always on in CLM (in testing builds only) ]

To say library message verb: (- PrintCommand(); -).  [prints the command predicate]
To say library message pronoun: (- print (address) pronoun_word; -).  ["pronoun dictionary word" is already in the Standard Rules, but in a "this might change later" section. ]
To say ignore library line break: (- lm_n = -lm_n; -).

To decide which snippet is the misunderstood word: (- (((wn - 1) * 100) + 1) -).
To decide which snippet is the quoted verb: (- ((verb_wordnum * 100) + 1) -).  [if command is TAKE OFF HAT, gives just TAKE]

To decide which text is (quoted word - a snippet) posture:
	if the quoted word matches "stand", decide on "stand on";
	if the quoted word matches "sit", decide on "sit down on";
	if the quoted word matches "lie", decide on "lie down on";
	decide on "enter".

To say list the contents of (X - object) with (N - number): (- Switch__TX((+ story tense +)); WriteListFrom(child({X}), {N}); -).

The current player's holdall is a player's holdall that varies. The current player's holdall variable translates into I6 as "SACK_OBJECT".

The capitalisation mode is a truth state that varies.  The capitalisation mode variable translates into I6 as "caps_mode".

To say the/-- capitalised (output - text): (- CPrintOrRun({output}); -).  [ annoying that I need both phrases, but at least I needn't code it from scratch. ]
To say the/-- possibly capitalised (output - text): if capitalisation mode is true, say the capitalised output; otherwise say the output; now capitalisation mode is false.

Section - The Printing Library Message Activity

The default messages table is a table name that varies. The default messages table is usually the table of custom library messages.  [ This allows whole reams of messages to be swapped out at once. ]

Printing library message something is an activity on numbers [while <action>ing].

For printing library message (this is the standard library message rule): 
	choose the library message corresponding to the library message action # library message number;
	if the chosen row is zero, make no decision;
	say the library-message-text entry;
	library line break if applicable.

To decide if misc messaging: (- (action == (+ the miscellaneous non-action +)) -).
To decide which action name is the miscellaneous non-action: (- TABLE_NOVALUE -).

The action in progress is an action name that varies. The action in progress variable translates into I6 as "action". [ Not used by this extension, but might be handy within the activity. ]
To decide if there is a   library message corresponding to (act - an action name) #/number (n - number): (- (CorrespondingLM({act}, {n}) > 0) -).
To decide if there is a   library message corresponding to (act - an action name) #/number (n - number) in/from (tab - a table name): (- (CorrespondingLM({act}, {n}, {tab}) > 0) -).
To decide if there is no library message corresponding to (act - an action name) #/number (n - number): (- (CorrespondingLM({act}, {n}) == 0) -).
To decide if there is no library message corresponding to (act - an action name) #/number (n - number) in/from (tab - a table name): (- (CorrespondingLM({act}, {n}, {tab}) == 0) -).
To decide what number is the library message corresponding to (act - an action name) #/number (n - number): (- CorrespondingLM({act}, {n}) -).
To decide what number is the library message corresponding to (act - an action name) #/number (n - number) in/from (tab - a table name): (- CorrespondingLM({act}, {n}, {tab}) -).
To choose the/-- library message corresponding to (act - an action name) #/number (n - number): (- {-require-ctvs} ct_0 = (+ default messages table +); ct_1 = CorrespondingLM({act}, {n}); -).
To choose the/-- library message corresponding to (act - an action name) #/number (n - number) in/from (tab - a table name): (- {-require-ctvs} ct_0 = {tab}; ct_1 = CorrespondingLM({act}, {n}, {tab}); -).
To decide what number is the chosen row: (- ct_1 -).

To library line break if applicable:
	if the library message number is less than 100:
		if the library message number is at least 1, say line break;
		otherwise now the library message number is zero minus the library message number.

Include (-
[ CorrespondingLM act num tab     row;
	if (tab == 0) tab = (+ the default messages table +);
	for (row = TableRows(tab) : row >= 1 : row-- )
		if (  (act == (tab-->1)-->(row+COL_HSIZE))  && (num == TableLookUpEntry(tab,2,row))  )
			break;   ! I6 actions ##Miscellany & ##ListMiscellany were changed to a table's BLANK value, so this code compares two things without regarding BLANK as a special circumstance. 
	return row;   ! returns zero if not found
];-) instead of "Long Texts" in "Language.i6t".  [ saves 10K ]


Section - For Saying "list the contents of something with the..."

The as a sentence list option is a number that varies. The as a sentence list option variable translates into I6 as "ENGLISH_BIT".
The tersely list option is a number that varies. The tersely list option variable translates into I6 as "TERSE_BIT". [ More terse English style ]

The is-are list option is a number that varies. The is-are list option variable translates into I6 as "ISARE_BIT". [ Print " is" or " are" before list ]

The suppressing all articles list option is a number that varies. The suppressing all articles list option variable translates into I6 as "NOARTICLE_BIT". [ Print no articles, definite or not ]
The using the definite article list option is a number that varies. The using the definite article list option variable translates into I6 as "DEFART_BIT". [ Use the definite article in list ]
The capitalise first article list option is a number that varies. The capitalise first article list option variable translates into I6 as "CFIRSTART_BIT"   

with newlines list option is a number that varies. The with newlines list option variable translates into I6 as "NEWLINE_BIT". 
The indented list option is a number that varies. The indented list option variable translates into I6 as "INDENT_BIT". [ Indent each entry by depth]
with extra indentation list option is a number that varies. The with extra indentation list option variable translates into I6 as "EXTRAINDENT_BIT". [ New in I7: extra indentation of 1 level ]

The giving brief inventory information list option is a number that varies. The giving brief inventory information list option variable translates into I6 as "PARTINV_BIT". [ Only brief inventory information  ]
The giving inventory information list option is a number that varies. The giving inventory information list option variable translates into I6 as "FULLINV_BIT". [Full inventory information ]

The including contents list option is a number that varies. The including contents list option variable translates into I6 as "RECURSE_BIT". [Recurse downwards with usual rules]
The including all contents list option is a number that varies. The including all contents list option variable translates into I6 as "ALWAYS_BIT". [ Always recurse downwards ]

The not listing concealed items list option is a number that varies. The not listing concealed items list option variable translates into I6 as "CONCEAL_BIT". [ Omit objects with "undescribed" or "scenery": if marked for listing also set, then does not apply at top level, but does lower down ]
The listing marked items only list option is a number that varies. The listing marked items only list option variable translates into I6 as "WORKFLAG_BIT". [ At top level (only), only list objects which have the "marked for listing" attribute ]


Book - Plurality Phrases

Chapter - For CLM regardless Plurality

The prior named noun is an object that varies. The prior named noun is usually yourself.
After printing the name (this is the notice plurality of printed object rule), mark the parameter-object in output. 

[ These are not in Plurality, or if they are, only operate on Things.  Here, we allow operating on "nothing" to mean "whatever the story viewpoint is." ]

To mark (target - an object) in output:
	now the prior named noun is the target;
	now the built-in S-substitution's decision is whether or not (the target acts plural).  

[generally, "those're" is awkward, and in colloquial speech, "they're" is frequently used.]
To say That's-They're of (item - an object): 
	mark item in output; 
	if the item acts plural, say "They['s-'re]"; 
	otherwise say "That['s-'re]".

To say 's-'re:  
	let the form be the appropriate auxiliary inflection;
	if the form is at least the -ed past form or the form is the infinitive form, say " [are* in its form]";  [ We won't contract was, were, being, been, or be. ]
	otherwise say "[contraction-for-is in its form]".

To say is-are of (item - an object): 
	mark item in output; 
	say are*.

To say n't:
	if the story viewpoint is first person and the prior named noun is nothing and the story tense is present tense, say " not"; 
	otherwise say "n't".

To say that-those-us of (item - an object): 
	mark item in output; 
	if the item is nothing:
		say "[us]";
	otherwise if the item acts plural:
		say "those"; 
	otherwise if the item is a person:
		if the item is female:
			say "her";
		otherwise if the item is not neuter:
			say "him";
		otherwise:
			say "that";
	otherwise:
		say "that".


Chapter - (for use with Plurality by Emily Short) 

Section - (in place of Section 1 - Tracking Last Item in Plurality by Emily Short)
 
[ Here is only the stuff that Plurality needs and CLM does not. The stuff common to both is included unconditionally elsewhere and is removed from this section of Plurality. ]

A thing can be neuter. A thing is usually neuter.  [ Already a property of Person in vanilla Inform, Plurality gives it to Thing as well. ]

To decide if (item - an object) acts plural:  
	if the item is nothing:
		if the story viewpoint is at least first person plural, yes;
		if the story viewpoint is at most second person, yes;  [ "I" acts plural with every verb except the was/were inflections of are*. That sole exception we solve within the table of irregular verbs. ]
		no;
	if the item is any third person singular, no; 
	if the item is any third person plural, yes; 
	if the item is an ambiguously plural thing, yes;   [ Plurality needs this line.  CLM does not. ]
	decide on whether or not the item is plural-named.

Section - (in place of Section 2 - Verbs in Plurality by Emily Short)

The recently said number is a number that varies. The recently said number variable translates into I6 as "say__n".

To say Is-are: 					say "[Is-are of prior named noun]".
To say Is-are of (item - an object):	say "[=> item][=>capital][are*]".

To say has-have: 				say "[have*]".
To say has-have of (item - an object):	say "[=> item][have*]".
To say Has-have: 				say "[=>capital][have*]".
To say Has-have of (item - an object):say "[=> item][=>capital][have*]".
To say 's-'re of (item - an object):	say "[=> item]['s-'re]".

To say numerical 's-'re:			if the recently said number is 1, say "[=> any third person singular]"; otherwise say "[=> any third person plural]"; say 's-'re.
To say numerical is-are:			if the recently said number is 1, say "[=> any third person singular]"; otherwise say "[=> any third person plural]"; say are*.
To say numerical has-have:		if the recently said number is 1, say "[=> any third person singular]"; otherwise say "[=> any third person plural]"; say have*.
To say Numerical is-are:			if the recently said number is 1, say "[=> any third person singular]"; otherwise say "[=> any third person plural]"; say "[^][are*]".
To say Numerical has-have:		if the recently said number is 1, say "[=> any third person singular]"; otherwise say "[=> any third person plural]"; say "[^][have*]".

To say es: say es of prior named noun.
To say es of (item - an object): if the item acts plural, say ""; otherwise say "es".
To say ies: say ies of prior named noun.
To say ies of (item - an object): if the item acts plural, say "y"; otherwise say "ies".

[ Plurality is inconsistent with whether or not the "of (a thing)" versions of phrases set the prior named noun. I mimic this here so there's no surprises for existing works. ]

Chapter - (for use without Plurality by Emily Short)

[ If Plurality is NOT included, this is the heart of it which CLM needs. ]

Include (- 
! These are Plurality-like phrases Inform automatically includes but only uses in the L__M() we've removed. Since they would have to be rewritten anyway, save the memory. 
-) instead of "Printed Inflections" in "Language.i6t". 

To decide if (item - an object) acts plural:  
	if the item is nothing:
		if the story viewpoint is at least first person plural, yes;
		if the story viewpoint is at most second person, yes;  [ "I" acts plural with every verb except the was/were past-tenses of are*. That sole exception we solve within the table of irregular verbs. ]
		no;
	if the item is any third person singular, no; 
	if the item is any third person plural, yes; 
	decide on whether or not the item is plural-named.

To say it-them of (item - an object): mark item in output; if the item acts plural, say "them"; otherwise say "it".

To say That-those of (item - an object): mark item in output; if the item acts plural, say "Those"; otherwise say "That".

To say it-they of (item - an object): mark item in output; if the item acts plural, say "they"; otherwise say "it".
To say It-They of (item - an object): mark item in output; if the item acts plural, say "They"; otherwise say "It".

[To say its-their of (item - an object): 
	mark item in output;
[	if the item is the player:
		say "[our]";]
	otherwise if the item acts plural:
		say "their";
	otherwise if the item is female:
		say "her";
	otherwise if the item is male:
		say "his";
	otherwise:
		say "its".]



Book - Inflections

Chapter - Pronoun Inflections

Section - The Story Viewpoint and The Story Tense

A declension [ -- specifically, grammatical person, number, and gender, but not grammatical case -- ] is a kind of value. Some declensions are first person, second person, third person masculine, third person feminine, third person, first person plural, and third person plural. The specification of a declension is "These are the possible values for 'the story viewpoint'. To create others, see the documentation for Custom Library Messages."

The story viewpoint is a declension that varies. 

A conjugation is a kind of value.  The conjugations are present tense, past tense.  The specification of a conjugation is "These are the possible values for 'the story tense'."

The story tense is a conjugation that varies. 

An irregular verb is a kind of value. The specification of an irregular verb is "Normally one of the suffixes [-s], [-es], [e-s], or [-ies] follow a verb to conjugate it, but irregular verbs cannot be done so.  Hence, [have*], [eat*], and the rest.  (Each suffix pretends to be an irregular verb from zero to three letters long.)"

[A grammatical case is a kind of value. [Or as much of a grammatical case as English ever gets.] The specification of grammatical case is "English tends to use a specific word order instead of inflecting its nouns, but pronouns are sensitive to their location and function within a sentence.  Here, grammatical case is used in a single phrase, 'the pronoun corresponding to', and the possible values are:  subjective case (I, we), objective case (me, us), possessive case (my, our), reflexive case (myself, ourselves), and possessive pronoun case (mine, ours)."]

To decide if (x - a conjugation) is in any present tense: (- ((({x} - 1) & 1) == 0) -).
To decide if (x - a conjugation) is in any past tense: (- ((({x} - 1) & 1) ~= 0) -).


Section - Grammatical Case, Tense Breakdown, and Typecasting - unindexed

To decide which number is the number of grammatical cases: (- 5 -).   [ This is provided in case someone needs to change the number of supported cases, esp. for languages other than English. Re-define this phrase in your source and re-write the table of pronouns, and then the [we], [our], etc. say-phrases should automatically compensate. ]
To decide which [grammatical case] number is the subjective [nominative] case: (- (-4) -).
To decide which [grammatical case] number is the objective [accusative/dative] case: (- (-3) -).
To decide which [grammatical case] number is the possessive pronoun [independent genitive] case: (- (-2) -).
To decide which [grammatical case] number is the reflexive case: (- (-1) -).
[ and an extra bit for the adjective form]
To decide which [grammatical case] number is the possessive [genitive determiner] case: (- (0) -).

The built-in S-substitution's decision is a truth state that varies. The built-in S-substitution's decision variable translates into I6 as "say__n".

To decide which conjugation is the zero conjugation: (- 0 -).
To decide which conjugation is (x - a conjugation) + (y - a conjugation): (- ({x} + {y}) -). 
To decide which conjugation is (x - a conjugation) - (y - a conjugation): (- ({x} - {y}) -). 
To decide what number is (iv - an irregular verb) as a number: (- {iv} -).
To decide what number is (d - a declension) as a number: (- {d} -).


Section - Say the Appropriate Pronoun for the Story Viewpoint

[NOTE: only say-phrases can distinguish between capitalised and uncapitalised letters. Decide-phrases cannot.]
[Also, only the first word in the say-phrase distinguishes, so We/He/She/I will only distinguish capitalisation for we, not he/she/I.]

[LOWERCASE]
[these are pronouns]
To say we: say the possibly capitalised pronoun corresponding to the story viewpoint in subjective case.
To say us: say the possibly capitalised pronoun corresponding to the story viewpoint in objective case.
To say ours: say the possibly capitalised pronoun corresponding to the story viewpoint in possessive pronoun case.
To say ourselves: say the possibly capitalised pronoun corresponding to the story viewpoint in reflexive case.
[these are determiners (like an adjective)]
To say our: say the possibly capitalised [possessive] pronoun [adjective] corresponding to the story viewpoint in possessive case.

[UPPERCASE]
[these are pronouns]
To say We: say the capitalised pronoun corresponding to the story viewpoint in subjective case.
To say Us: say the capitalised pronoun corresponding to the story viewpoint in objective case.
To say Ours: say the capitalised pronoun corresponding to the story viewpoint in possessive pronoun case.
To say Ourselves: say the capitalised pronoun corresponding to the story viewpoint in reflexive case.
[these are determiners (like an adjective)]
To say Our: say the capitalised [possessive] pronoun [adjective] corresponding to the story viewpoint in possessive case.

To decide which text is the pronoun corresponding to (decl - a declension) in (gcase - a number): 
	now the prior named noun is nothing;
	choose row ((decl as a number) multiplied by the number of grammatical cases) plus the gcase from the table of pronoun declensions;
	decide on the pronoun-declension-column entry.

Section - The Table of Pronouns

Table of pronoun declensions
pronoun-declension-column (text)
"I"			[ first person ]
"me"
"mine"  	
"myself" 	
"my" 	
"you"		[ second person ] 	
"you" 	
"yours" 	
"yourself" 	
"your" 	
"he" 			[ third person masculine ]	
"him" 	
"his" 		
"himself" 	
"his" 	
"she" 		[ third person feminine ]
"her" 		
"hers" 	
"herself" 	
"her" 	
"it" 			[ third person ]
"it" 		
"its" 		
"itself" 	
"its" 	
"we" 		[ first person plural ]
"us" 		
"ours" 	
"ourselves" 	
"our" 	
"they" 		[ third person plural ]
"them" 	
"theirs" 	
"themselves" 	
"their" 

Chapter - Verb Inflections

Suffix eaten by auxiliary is a truth state that varies. Suffix eaten by auxiliary is usually false.

Restore-library-conjugation is a conjugation that varies. The restore-library-conjugation variable translates into I6 as "restore_library_conjugation".  
Include (- Global restore_library_conjugation = 0; -) after "Definitions.i6t".

Section - The verb inflections - unindexed

To decide what number is the number of verb inflections: (-  3  -).	[ This extension doesn't use the participle forms. ]
To decide which [verb inflection] number is the infinitive form: 					(- 0 -). [ The verb to sport ]   [this is just used for be* ]
To decide which [verb inflection] number is the -s present singular form: 			(- 1 -). [ (he sports, 	] 	[ (he weaves, 	]
To decide which [verb inflection] number is the base present plural form: 			(- 2 -). [ they sport, 	] 	[ they weave,	]
To decide which [verb inflection] number is the -ed past form:					(- 3 -). [ he sported, 	] 	[ he wove,   	]
[To decide which [verb inflection] number is the exceptional present plural form:		(- 0 -). [ only used for one word in the whole damned English language: "am", plus its contraction. ]]

To decide which number is the appropriate --/auxiliary inflection:
	if suffix eaten by auxiliary is true, decide on the infinitive form;
	if the story tense is the past tense, decide on the -ed past form;   
	if the prior named noun acts plural, decide on the base present plural form;
	decide on the -s present singular form. 

Section - Pick a Verb Inflection - unindexed

To decide what text is (helping verb - an irregular verb) as auxiliary:  decide on the helping verb in its appropriate auxiliary inflection. 

To decide what text is (uninflected verb - an irregular verb) in its (verb inflection - a number):  
	if the uninflected verb is at least contraction-for-is and the uninflected verb is at most aren't*:	[ Then convert "is/are" to "am/be" if need be. ]
		if the story viewpoint is first person and the prior named noun is nothing and the verb inflection is the base present plural form:
			choose row (((the uninflected verb as a number) minus (contraction-for-is as a number)) plus one) from the table of additional inflected forms of be;
			decide on the irregular-verb-form entry;
		otherwise if the verb inflection is the infinitive form:
			choose row (((the uninflected verb as a number) minus (contraction-for-is as a number)) plus four) from the table of additional inflected forms of be;
			decide on the irregular-verb-form entry;
	otherwise:   [ For all verbs except are*, the infinitive is identical to the present plural, so fold the value. ]
		if the verb inflection is the infinitive form, now the verb inflection is the base present plural form;
	choose row ((((the uninflected verb as a number) minus 1) multiplied by the number of verb inflections) + the verb inflection) from the table of irregular verbs; 
	decide on the irregular-verb-form entry.


Table of additional inflected forms of be
irregular-verb-form (text)
"[']m"	[ contraction-for-is ]	[ first person ]
"am"		[ are* ]
"am not"	[ aren't* ]	
" be" 	[ contraction-for-is ]	[ infinitive ]
"be"  	[ are* ]
"not be"	[ aren't* ]


Section - Auxiliary Words and Phrases

To say (main verb - an irregular verb):
	if the main verb is greater than end aux, say "[the main verb in its appropriate inflection]";
	now suffix eaten by auxiliary is false;
	if restore-library-conjugation is not the zero conjugation:
		now the story tense is the story tense - restore-library-conjugation;
		now restore-library-conjugation is the zero conjugation.

To say =>capital/uc/^: (- caps_mode = true; -).   [ Prevent Inform from making tiny little functions. ]
To say =>we: (- (+ prior named noun +) = nothing; -).
To say => (x - an object): mark x in output.
To decide what object is any third person singular: (- 1 -).  [	(- if (say__n == 1) print "'s"; else print "'re"; -) ]
To decide what object is any third person plural: (- 2 -).

To say moment: say "[if the story tense is in any present tense]moment[else]time".
To say here-there: if the story tense is in any past tense, say "t"; say "here".

[ Use "to decide" so the "[^]" capitalizer will work on it. ]
To decide what text is can: 	if the story tense is in any past tense, decide on "could"; decide on "can".
To decide what text is can't:	if the story tense is in any past tense, decide on "couldn't"; decide on "can't".
To decide what text is will: 		if the story tense is in any past tense, decide on "would"; decide on "will".
To decide what text is won't: 	if the story tense is in any past tense, decide on "wouldn't"; decide on "won't".


To decide which irregular verb is be*/am*/is*: 	(- (+ are* +) -).			[ This is so a whole function isn't created for the synonym. ]
To decide which text is aren't+:  		 	(- (+ aren't* as auxiliary +) -).	[ Likewise, doesn't not generate an extra function, but calls the pre-existing one by synonym. ]
To decide which text is are+/is-are/was-were: 	(- (+ are* as auxiliary +) -).	[ Likewise, doesn't not generate an extra function, but calls the pre-existing one by synonym. ]
To decide which text is have+: 				(- (+ have* as auxiliary +) -).	[ So, saying "[are+]" is the *exact* same as saying "[are* as auxiliary]" but without eating extra memory for a translation function. ]
To decide which text is do+: 				(- (+ do* as auxiliary +) -). 	
To decide which irregular verb is end aux:  		(- 0 -).   				[ This can act as a "reset" without printing anything. ]


Section - Verb Phrase Generation unindexed

[ A hook for verb phrase generation. Uses no memory. ]
To say aux: (-  -). 

To say =>don't/=>doesn't: say "[do+]n't "; now suffix eaten by auxiliary is true.
To say =>perfect: say "[have+] "; now suffix eaten by auxiliary is false.
To say =>could: say "[can] "; now suffix eaten by auxiliary is true.
To say =>would: say "[will] "; now suffix eaten by auxiliary is true.


Section - testing commands - not for release

Understand "pov" as a mistake ("[italic type][The story title][roman type] is in [story viewpoint] [story tense].").
Understand "pov [declension]" as a mistake ("[pov the declension understood][italic type][The story title][roman type] is now in [story viewpoint] [story tense].").
Understand "pov [conjugation]" as a mistake ("[pov the conjugation understood][italic type][The story title][roman type] is now in [story viewpoint] [story tense].").
To say pov (x - a declension): now the story viewpoint is x.
To say pov (x - a conjugation): now the story tense is x.


Chapter - Irregular Verbs

Some irregular verbs are -s, -es, -ies, e-s, contraction-for-is, are*, aren't*, have*, do*, go*, eat*, feel*, find*, get*, give*, hear*, put*, see*, take*, wear*, think*, keep*.

[The verb to sport (he sports, they sport, he sported, it is sported, he is sporting) implies the wearing relation. 
	to sport - infinitive    [not used here, as it's identical to the present plural for all verbs except is/be. ]
	he sports - present singular  	; he weaves
	they sport - present plural     	; they weave
	he sported - past 			; he wove
]

Table of Irregular Verbs
irregular-verb-form (text)
"s"   [ the -s suffix ]  	[ he sportS  ]
""				[ they sport  ]
"ed"				[ he sportED ]
"es"  [ the -es suffix ]	[ he searchES ]
""				[ they search ]
"ed"				[ he searchED ]
"ies"  [ the -ies suffix ]  	[ he spIES ]
"y"					[ they spY ]
"ied"					[ he spIED ]
"es"  [ the e-s suffix ]	[ he likES ]
"e"				[ they likE ]
"ed"				[ he likED ]
"'s"	  	[ contraction for am/is/are ]
"[']re"
""
"is"  		[ are*]   
"are"  	
"[if the story viewpoint is first person and the prior named noun is nothing]was[else if the prior named noun acts plural]were[else]was" 
"isn't"  	[ aren't*]   
"aren't"  		
"[if the story viewpoint is first person and the prior named noun is nothing]wasn't[else if the prior named noun acts plural]weren't[else]wasn't" 
"has" 	[have*]
"have"
"had"
"does"	[do*]
"do"
"did"
"goes"	[go*]
"go"
"went"
"eats"	[eat*]
"eat"
"ate"
"feels"	[feel*]
"feel"
"felt"
"finds"	[find*]
"find"
"found"
"gets"	[get*]
"get"
"got"
"gives"	[give*]
"give"
"gave"
"hears"	[hear*]
"hear"
"heard"
"puts"	[put*]
"put"
"put"
"sees"	[see*]
"see"
"saw"
"takes"	[take*]
"take"
"took"
"wears"	[wear*]
"wear"
"wore"
"thinks"	[think*]
"think"
"thought"
"keeps"	[keep*]
"keep"
"kept"


Book - Rule and Template Replacements

Chapter - L__M now calls the activity instead

Section - L__M (in place of Section SR5/8/2 - Message support - Intervention - Unindexed in Standard Rules by Graham Nelson) 

Include (-  
[ L__M   actn  n  x1  x2  rv;
    @push action;
    lm_act = actn;
    if (n == 0) n = 1;
    lm_n = n;
    lm_o = x1;
    lm_o2 = x2;
    if (lm_act == ##ListMiscellany) {
	lm_act = TABLE_NOVALUE;     ! set it to the same value as a blank table entry
	lm_n = lm_n + 100; 
    } else if (lm_act == ##Miscellany) {
	lm_act = TABLE_NOVALUE;     ! set it to the same value as a blank table entry
    }
    action = lm_act;
#ifdef DEBUG;  
    BeginActivity((+ the printing library message activity +), lm_n);
    if (~~(ForActivity((+ the printing library message activity +), lm_n)))  {  ;
	print "{ ";
	if (lm_act == TABLE_NOVALUE) print "library message";
	else print (SayActionName) lm_act, " action";
	print " #", lm_n, " }";
	RunTimeProblem(RTP_TABLE_NOROW, (+ default messages table +));
    }
    EndActivity((+ the printing library message activity +), lm_n);
#ifnot;
    CarryOutActivity((+ the printing library message activity +), lm_n);
#endif;
    @pull action;
];  -) instead of "Printing Mechanism" in "Language.i6t".  


Chapter - Miscellaneous Fixes - unindexed

To say #if American dialect: (- #ifdef DIALECT_US; -).
To say #if Z-machine: (- #ifdef TARGET_ZCODE; -).
To say #otherwise: (- #Ifnot; -).
To say #end if: (- #endif; -).

[ The list writer has these linking verbs hard-coded as print (string), so we replace them just-in-time. ]
Include (-
[ Switch__TX   t;
	if (((t - 1) & 1) == 0) { IS__TX = " is";    ARE__TX = " are";   IS2__TX = "is ";    ARE2__TX = "are ";    IS3__TX = "is";    ARE3__TX = "are";    }
	else                                                  { IS__TX = " was"; ARE__TX = " were"; IS2__TX = "was "; ARE2__TX = "were "; 	IS3__TX = "was"; ARE3__TX = "were"; }	
];-).

[ Overrides the one in the Standard Rules to call the above. ]
To list the contents of (O - an object), with newlines, indented, giving inventory information, as a sentence, including contents, including all contents, tersely, giving brief inventory information, using the definite article, listing marked items only, prefacing with is/are, not listing concealed items, suppressing all articles and/or with extra indentation:  (- Switch__TX((+ story tense +)); WriteListFrom(child({O}), {phrase options}); -). 


Chapter - replacement for you-can-also-see 

[ The default version in the standard rules hard-codes "you" in there.  Looks like that rule used to use library messages 5 and 6 once upon a time, but due to difficult edge cases regarding list recursion, needed some serious coding work. ]

The I-could-also-see rule is listed instead of the you-can-also-see rule in the for printing the locale description rulebook.

Section - original version takes less memory (for Z-machine only)

For printing the locale description (this is the I-could-also-see rule):
	now everything is unmarked for listing;
	repeat through the Table of Locale Priorities:
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

Section - cleaner rule design (for Glulx only)

For printing the locale description (this is the I-could-also-see rule):
	now everything is unmarked for listing;
	repeat through the Table of Locale Priorities:
		if the locale description priority entry is at least one and the notable-object entry is not [already] mentioned, now the notable-object entry is marked for listing;
	if something is marked for listing, carry out the listing nondescript items activity with the parameter-object;
	continue the activity.

Last for listing nondescript items (this is the standard listing nondescript items rule):
	issue library message looking action number 5 for the parameter-object;
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
	issue library message looking action number 6 for the parameter-object.


Chapter - so the Printing the Name activity doesn't favor You and yourself - unindexed

Include (- Global caps_mode = false; -) after "Definitions.i6t".  [move this variable to earlier in the I6 source so the "capitalisation mode" variable can be used in many more places]

The printed name of yourself is usually "[if capitalisation mode is true][We][else][ourselves]".

Include (- 
[ STANDARD_NAME_PRINTING_R obj;
    obj = parameter_object;
    if (obj == 0) { print (string) NOTHING__TX; return; }
    switch (metaclass(obj)) {
		Routine:  print "<routine ", obj, ">"; return;
		String:   print "<string ~", (string) obj, "~>"; return;
		nothing:  print "<illegal object number ", obj, ">"; return;
    }
    #Ifdef LanguagePrintShortName;
    if (LanguagePrintShortName(obj)) return;
    #Endif; ! LanguagePrintShortName
    if (indef_mode && obj.&short_name_indef ~= 0 && PrintOrRun(obj, short_name_indef, true) ~= 0) return;
    if ( caps_mode && obj.&cap_short_name   ~= 0 && PrintOrRun(obj, cap_short_name   , true) ~= 0) { caps_mode = false; return; }
    if (                         obj.&short_name          ~= 0 && PrintOrRun(obj, short_name          , true) ~= 0) return;
    print (object) obj;
];-) instead of "Standard Name Printing Rule" in "Printing.i6t".




Book - The Table

Section - The Custom Library Messages table

table of custom library messages [(continued)]
library-action (action-name) 	library-message-id (number)	library-message-text (text)
[Section 2.3 - Prompts and Input]
--		10	"I beg your pardon?"
Quitting the game action	2	"Are you sure you want to quit? "
Quitting the game action	1	"Please answer yes or no."
--		8	"Please give one of the answers above."
[--		52	"[line break]Type a number from 1 to [library message amount], 0 to redisplay or press ENTER."
--		53	"[line break][bracket]Please press SPACE.[close bracket]"
--		54	"[bracket]Comment recorded.[close bracket]"
--		55	"[bracket]Comment NOT recorded.[close bracket]"]
[Section 2.4 - Undo]
--		13	"[bracket]Previous turn undone.[close bracket]"
--		7	"[#if Z-machine]'Undo' failed.  [bracket]Not all interpreters provide it.[close bracket][#otherwise][bracket]You cannot 'undo' any further.[close bracket][#end if]"
--		6	"[bracket]Your interpreter does not provide 'undo'.  Sorry![close bracket]"
--		11	"[bracket]You can't 'undo' what hasn't been done.[close bracket]"
[--		12	"[bracket]Can't 'undo' twice in succession. Sorry.[close bracket]"]
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
--		32	"[We] [are+][n't] holding that."   
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
--		42	"[=> any third person plural][if library message amount is 0]None[otherwise]Only [library message amount in words] of those[end if][if library message amount is one][=> any third person singular][end if] [are+] available."
--		44	"There are none at all available."
--		43	"Nothing to do."
--		1	"(considering the first sixteen objects only)[ignore library line break]"
--		36	"You excepted something not included anyway."
[Section 2.10 - Implicit Actions]
--		69	"(first taking [the library message object])" [doesn't need to ignore library line break]
--		68	"([The person asked] first taking [the library message object])" [doesn't need to ignore library line break]
Entering action	6	"(getting [if the library message object is a supporter]off[otherwise]out of[end if] [the library message object])[ignore library line break]"
Entering action	7	"[if the library message object is a supporter](getting onto [the library message object])[otherwise if the library message object is a container](getting into [the library message object])[otherwise](entering [the library message object])[end if][ignore library line break]"
--		26				"(first taking [the noun])[ignore library line break]"  [needs the ignore]
Dropping action			3	"(first taking [the library message object] off)[ignore library line break]"
Inserting it into action	6	"(first taking [it-them of the library message object] off)[ignore library line break]"
Putting it on action   		5	"(first taking [it-them of the library message object] off)[ignore library line break]"
Going action		27	"(first getting off [the library message object])[ignore library line break]"
Going action		28	"(first opening [the library message object])[ignore library line break]"
[Section 2.11 - Carrying Capacity]
Taking action		12	"[We]['s-'re] carrying too many things already." 
Taking action		13	"(putting [the library message object] into [the current player's holdall] to make room)[ignore library line break]"
Inserting it into action	7	"There is no more room in [the second noun]."
Dropping action		6	"There is no more room in [the library message object]."
Dropping action		5	"There is no more room on [the library message object]."
Putting it on action		6	"There is no more room on [the second noun]."
Taking action		15	"[We] [can't] carry [the library message object]." 
[Section 2.12 - Disambiguation]
--		45	"Who [=> nothing][do+] [we] mean, [ignore library line break]"
--		46	"Which [=> nothing][do+] [we] mean, [ignore library line break]"
--		48	"Whom [=> nothing][do+] [we] want [if the person asked is not the player][the person asked] [end if]to [library message verb]?"  
--		49	"What [=> nothing][do+] [we] want [if the person asked is not the player][the person asked] [end if]to [library message verb]?"
--		47	"Sorry, you can only have one item here. Which exactly?"
[Section 2.13 - Pronouns]
--		35	"I'm not sure what '[library message pronoun]' refers to."
--		40	"[We] [can't] see '[library message pronoun]' ([the pronoun reference object]) at the [moment]."
requesting the pronoun meanings action	1	"At the moment, "
requesting the pronoun meanings action	2	"means "
requesting the pronoun meanings action	3	"is unset"
requesting the pronoun meanings action	4	"no pronouns are known to the game."
[requesting the pronoun meanings action	5	"."]
[Section 2.14 - Commanding People]
--		72	"[The person asked] [have*] better things to do."
--		23	"[We] [aux]seem[-s] to want to talk to someone, but I [can't] see whom."
--		24	"[We] [can't] talk to [the library message object]." 
--		58	"[The person asked] [are*] unable to do that."
[Section 2.15 - File Operations]
Restarting the game action	1	"Are you sure you want to restart? "
Restarting the game action	2	"Failed."
Restoring the game action	1	"Restore failed."
Restoring the game action	2	"Ok."
Saving the game action		1	"Save failed."
Saving the game action		2	"Ok."
Verifying the story file action	1	"The game file has verified as intact."
Verifying the story file action	2	"The game file did not verify as intact and may be corrupt."
[Section 2.16 - Transcripts]
switching the story transcript on action	1	"Already saving the transcript."
switching the story transcript off action	1	"A transcript was not being recorded."
switching the story transcript on action	2	"Starting a transcript of"
switching the story transcript off action	2	"[line break]End of transcript."
switching the story transcript on action	3	"Attempt to begin a transcript failed."
switching the story transcript off action	3	"Attempt to end the transcript failed."
[Section 2.17 - Scoring]
requesting the score action		1	"[if the story has ended]In that game [we][otherwise][We] have so far[end if] scored [score] out of a possible [the maximum score], in [turn count] turn[s][ignore library line break]"
--		50	"Your score has just gone [if library message amount > 0]up by [library message amount][otherwise]down by [0 - library message amount][end if] point[s]"
switching score notification on action	1	"Score notification on."
switching score notification off action	1	"Score notification off."
requesting the score action		2	"There is no score in this story."
requesting the score action		3	", earning you the rank of "
[Section 2.18 - Inventory]
Taking inventory action	5	"[The person asked] [aux]look[-s] for something that might help."  [through [its-their of the person asked] possessions." ]
Taking inventory action	1	"[We] [are+] carrying nothing."  
Taking inventory action	2	"[We] [are+] carrying[ignore library line break]" 
[Taking inventory action	3	":[line break]"  [unused]]
[Taking inventory action	4	"."   [unused]]
--		101	" (providing light)" [ We can use [library message object] in these. ]
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
--		9	"[if the story tense is in any past tense]It suddenly became pitch dark.[otherwise]It is now pitch dark in here.[end if]"
--		17	"It [if the story tense is in any past tense]was[else]is[end if] pitch dark, and [we] [can't] see a thing."
[Examining action	1	"Darkness, noun.  An absence of light to see by."]
[Looking under action	1	"But it[if the story tense is in any past tense] was[else]'s[end if] dark."
Searching action  		1	"But it[if the story tense is in any past tense] was[else]'s[end if] dark."]
--		71	"Darkness"  [DARKNESS__TX]
[Section 2.20 - Take]
Taking action	1	"Taken."
Taking action	16	"[The person asked] [aux]pick[-s] up [the noun]."
Taking action	2	"[We] [are*] always self-possessed."
Taking action	3	"[We] [=>don't][aux]suppos[e-s] [the noun] [=>would][if the story tense is in any past tense][=>perfect][end if][aux]car[e-s] for that."
Taking action	4	"[We][']d have to get [if noun is a supporter]off[otherwise]out of[end if] [the noun] first."
Taking action	5	"[We] already [have*] [that-those-us of the noun]."
Taking action	6	"[That-Those of the noun] [aux]seem[-s] to belong to [the library message object]." 
Taking action	7	"[That-Those of the noun] [aux]seem[-s] to be a part of [the library message object]."
Taking action	8	"[That-Those of the library message object] [aren't*] available."
Taking action	9	"[The library message object] [aren't*] open."
Taking action	10	"[That's-They're of the library message object] hardly portable."
Taking action	11	"[That's-They're of the library message object] fixed in place."
Taking action	14	"[We] [can't] reach into [the library message object]." 
[Section 2.21 - Remove]
[Removing it from action	3	"Removed."]
[LibMsg <report npc removing>			"[The actor] remov[e-s] [the % dobj] from [the second noun]."]
[Removing it from action	1	"[It-they of noun] [are*] unfortunately closed."]
Removing it from action	2	"But [it-they of noun] [aren't*] there [if the story tense is in any past tense]any longer[else]now[end if]."
[Section 2.22 - Drop]
Dropping action		4	"Dropped."
Dropping action		7	"[The person asked] [put*] down [the noun]."
Dropping action		1	"[The noun] [are*] already [if the story tense is in any past tense]t[end if]here."
Dropping action		2	"[We] [=>don't][have*] [that-those-us of the noun]."
[Section 2.23 - Insert]
Inserting it into action	8	"Done."
Inserting it into action	9	"[We] [put*] [the noun] into [the second noun]."
Inserting it into action	10	"[The person asked] [put*] [the noun] into [the second noun]."
[Inserting it into action	1	"[We] [aux]need[-s] to be holding [the noun] before [we] [can] put [it-them of the noun] into something else."]
Inserting it into action	2	"[That-Those of the second noun] [can't] contain things."
Inserting it into action	3	"[The second noun] [are*] closed."
[Inserting it into action	4	"[We][']ll need to take [it-them of noun] off first."]
Inserting it into action	5	"[We] [can't] put something inside itself."
[Section 2.24 - Put On]
Putting it on action	7	"Done."
Putting it on action	8	"[We] [put*] [the noun] on [the second noun]."
Putting it on action	9	"[The person asked] [put*] [the noun] on [the second noun]."
Putting it on action	1	"[We] [aux]need[-s] to be holding [the noun] before [we] [can] put [it-them of the noun] on top of something else."
Putting it on action	2	"[We] [can't] put something on top of itself."
Putting it on action	3	"Putting things on [the second noun] [=>would][if the story tense is in any past tense][=>perfect][end if][aux]achiev[e-s] nothing."
Putting it on action	4	"[We] [aux]lack[-s] the dexterity."
[Section 2.25 - Give]
Giving it to action	5	"[We] [give*] [the noun] to [the second noun]."
Giving it to action	1	"[We] [aren't+] holding [the noun]."
Giving it to action	6	"[The person asked] [give*] [the noun] to you."
Giving it to action	7	"[The person asked] [give*] [the noun] to [the second noun]."
Giving it to action	2	"[We] [aux]juggl[e-s] [the noun] for a while, but [=>we][do+]n't achieve much."
Giving it to action	3	"[The second noun] [=>doesn't][aux]seem[-s] interested."
Giving it to action	4	"[The second noun] [aren't*] able to receive things."
[Section 2.26 - Show]
Showing it to action	1	"[We] [aren't+] holding [the noun]."
Showing it to action	2	"[The second noun] [are*] unimpressed."
[Section 2.27 - Enter]
Entering action	5	"[We] [get*] [if noun is a supporter]onto[otherwise]into[end if] [the noun]."
Entering action	8	"[The person asked] [get*] into [the noun]."
Entering action	9	"[The person asked] [get*] onto [the noun]."
Entering action	1	"But [we]['s-'re] already [if noun is a supporter]on[otherwise]in[end if] [the noun]."
Entering action	2	"[That's-They're of the noun] not something [we] [can] [quoted verb posture]."
Entering action	3	"[We] [can't] get into the closed [noun]."
Entering action	4	"[We] [can] only get into something free-standing."
[Section 2.28 - Exit, Get Off]
Exiting action		3	"[We] [get*] [if library message object is a supporter]off[otherwise]out of[end if] [the library message object]."
Exiting action		5	"[The person asked] [get*] off [the library message object]."
Exiting action		6	"[The person asked] [get*] out of [the library message object]."
Exiting action		1	"But [we] [aren't*] in anything at the [moment]."
Exiting action		2	"[We] [can't] get out of the closed [library message object]."
Getting off action	1	"But [we] [aren't*] on [the library message object] at the [moment]."
[Exiting action		4	"But [we] [aren't*] [if library message object is a supporter]on[otherwise]in[end if] [the library message object]."]
[Section 2.29 - Go]
Going action		2	"[We] [can't] go that way." 
Going action		1	"[We] [=>would][have*] to get [if library message object is a supporter]off[otherwise]out of[end if] [the library message object] first."
Going action		6	"[We] [can't], since [the library message object] [aux]lead[-s] nowhere."
Going action		7	"Go in which compass direction?"
Going action		8	"[The person asked] [go*] up[ignore library line break]"
Going action		9	"[The person asked] [go*] down[ignore library line break]"
Going action		10	"[The person asked] [go*] [noun][ignore library line break]"
Going action		11	"[The person asked] [aux]arriv[e-s] from above[ignore library line break]"
Going action		12	"[The person asked] [aux]arriv[e-s] from below[ignore library line break]"
Going action		13	"[The person asked] [aux]arriv[e-s] from the [library message object][ignore library line break]"
Going action		14	"[The person asked] [aux]arriv[e-s][ignore library line break]"
Going action		15	"[The person asked] [aux]arriv[e-s] at [the library message object] from above[ignore library line break]"
Going action		16	"[The person asked] [aux]arriv[e-s] at [the library message object] from below[ignore library line break]"
Going action		17	"[The person asked] [aux]arriv[e-s] at [the library message object] from the [second library message object][ignore library line break]" 
Going action		18	"[The person asked] [go*] through [the library message object][ignore library line break]"
Going action		19	"[The person asked] [aux]arriv[e-s] from [the library message object][ignore library line break]"
Going action		20	"on [the library message object][ignore library line break]"
Going action		21	"in [the library message object][ignore library line break]"
Going action		22	", pushing [the library message object] in front, and [us] along too[ignore library line break]"
Going action		23	", pushing [the library message object] in front[ignore library line break]"
Going action		24	", pushing [the library message object] away[ignore library line break]"
Going action		25	", pushing [the library message object] in[ignore library line break]"
Going action		26	", taking [us] along[ignore library line break]"
[Section 2.30 - Brief, Super Brief, Verbose]
preferring unabbreviated room descriptions action 	1	" is now in its 'verbose' mode, which always gives [us] long descriptions of locations (even if [we] have been there before)."
preferring abbreviated room descriptions action	1	" is now in its 'super brief' mode, which always gives [us] short descriptions of locations (even if [we] haven't been there before)."
preferring sometimes abbreviated room descriptions action	1	" is now in its normal 'brief' printing mode, which gives [us] long descriptions of places never before visited and short descriptions otherwise."
[Section 2.31 - Look]
Looking action		9	"[The person asked] [aux]look[-s] around."
[Looking action		1	" (on [the library message object])[ignore library line break]"
Looking action		2	" (in [the library message object])[ignore library line break]"
Looking action		3	" (as [library message object])[ignore library line break]"]
Looking action		8	"[if the library message object is a supporter] (on [otherwise] (in [end if][the library message object])[ignore library line break]"
Looking action		5	"[if the library message object is the location][We] [otherwise if the library message object is a room]In [the library message object] [we] [otherwise if the library message object is a supporter]On [the library message object] [we] [otherwise if the library message object is an animal]On [the library message object] [we] [otherwise]In [the library message object] [we] [end if][can] [if the locale paragraph count is at least one]also [end if]see [ignore library line break]"     [messages 5 and 6 are now used again, from this extension's I-could-also-see rule, which replaces the standard you-can-also-see rule ]
Looking action		6	"[if the library message object is not the location].[otherwise if the story tense is in any past tense] there.[otherwise] here.[end if][ignore library line break][paragraph break]"
Looking action		4	"On [the library message object] [list the contents of library message object with as a sentence list option +  tersely list option + not listing concealed items list option + is-are list option + including contents list option + giving brief inventory information list option]."   [ "+ listing marked items only list option"    was removed for 6G60 ]
[Looking action		7	"[We] [see*] nothing unexpected in that direction."]
[Section 2.32 - Examine]
Examining action	4	"[The person asked] [aux]look[-s] closely at [the noun]."
Examining action	2	"[We] [see*] nothing special about [the noun]."
Examining action	5	"[We] [see*] nothing unexpected in that direction."
Examining action	3	"[The noun] [are+][if the story tense is in any present tense] currently[end if] switched [if noun is switched on]on[otherwise]off[end if]." 
[Section 2.33 - Search]
Searching action  	8	"[The person asked] [aux]search[-es] [the noun]."
Searching action  	4	"[We] [find*] nothing of interest."
Searching action  	5	"[We] [can't] see inside, since [the noun] [are+] closed."
Searching action  	6	"[The noun] [are*] empty."
Searching action  	2	"There [=> any third person singular][are*] nothing on [the noun]."
Searching action  	3	"On [the noun] [list the contents of noun with as a sentence list option +  tersely list option + not listing concealed items list option + is-are list option]."
Searching action  	7	"In [the noun] [list the contents of noun with as a sentence list option +  tersely list option + not listing concealed items list option + is-are list option]."
[Section 2.34 - Look Under]
Looking under action	3	"[The person asked] [aux]look[-s] under [the noun]."
Looking under action	2	"[We] [find*] nothing of interest."
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
Locking it with action	1	"[That-Those of the noun] [=>don't][aux]seem[-s] to be something [we] [can] lock."
Locking it with action	2	"[That's-They're of the noun] locked at the [moment]."
Locking it with action	3	"First [we] [=>would][have*] to close [the noun]."
Locking it with action	4	"[That-Those of the second noun] [=>don't][aux]seem[-s] to fit the lock."
[Section 2.38 - Unlock]
Unlocking it with action	4	"[We] [aux]unlock[-s] [the noun]."
Unlocking it with action	5	"[The person asked] [aux]unlock[-s] [the noun]."
Unlocking it with action	1	"[That-Those of the noun] [=>don't][aux]seem[-s] to be something [we] [can] unlock."
Unlocking it with action	2	"[That's-They're of the noun] unlocked at the [moment]."
Unlocking it with action	3	"[That-Those of the second noun] [=>don't][aux]seem[-s] to fit the lock."
[Section 2.39 - Switch On, Off]
Switching on action	3	"[We] [aux]switch[-es] [the noun] on."
Switching on action	4	"[The person asked] [aux]switch[-es] [the noun] on."
Switching on action	1	"[That's-They're of the noun] not something [we] [can] switch."
Switching on action	2	"[We] [aux]ensur[e-s] it [=> any third person singular][are+] on."
Switching off action	3	"[We] [aux]switch[-es] [the noun] off."
Switching off action	4	"[The person asked] [aux]switch[-es] [the noun] off."
Switching off action	1	"[That's-They're of the noun] not something [we] [can] switch."
Switching off action	2	"[We] [aux]ensur[e-s] it [=> any third person singular][are+] off."
[Section 2.41 - Wear]
Wearing action		4	"[We] [put*] on [the noun]."
Wearing action		5	"[The person asked] [put*] on [the noun]."
Wearing action		1	"[We] [can't] wear [that-those-us of the noun]."
Wearing action		2	"[We] [aren't+] holding [that-those-us of the noun]."
Wearing action		3	"[We] [are+] already wearing [that-those-us of the noun]."
[Section 2.42 - Take Off]
Taking off action 	2	"[We] [take*] off [the noun]."
Taking off action 	3	"[The person asked] [take*] off [the noun]."
Taking off action 	1	"[We] [aren't+] wearing [that-those-us of the noun]."
[Section 2.43 - Eating And Drinking, Senses]
Eating action		2	"[We] [eat*] [the noun]. Not bad."
Eating action		3	"[The person asked] [eat*] [the noun]."
Eating action		1	"[We] [aren't*] that hungry." 
Drinking action		1	"[We] [aren't*] that thirsty."
Tasting action		1	"[We] [aux]tast[e-s] nothing unexpected."
Smelling action		1	"[We] [aux]smell[-s] nothing unexpected."
Listening to action		1	"[We] [hear*] nothing unexpected."
[Section 2.44 - Touching]
Touching action		2	"[We] [feel*] nothing unexpected."
Touching action		6	"[The person asked] [aux]touch[-es] [the noun]."
Touching action		3	"[if the story viewpoint is second person]If you think that'll help[else][We] [aux]touch[-es] [ourselves][end if]."
Touching action		4	"[The person asked] [aux]touch[-es] [it-them of noun]self."
Touching action		1	"[We] [keep*] [our] hands to [ourselves]."
Touching action		5	"[The person asked] [aux]touch[-es] [us]."
[Section 2.45 - Rhetorical Commands]
Saying Yes action 	1	"That was a rhetorical question."
Saying No action  	1	"That was a rhetorical question."
Saying sorry action	1	"Oh, don't apologi[#if American dialect]z[#otherwise]s[#end if]e."
Swearing obscenely action		1	"Real adventurers do not use such language."
Swearing mildly action		1	"Quite."
[Section 2.46 - Body Movement]
Climbing action		1	"[We] [=>don't][think*] much would be achieved by that."
Jumping action		1	"[We] [aux]jump[-s] on the spot, fruitlessly."
Swinging action		1	"There [=> any third person singular][are*] nothing sensible to swing [here-there]."
Waving Hands action 	1	"[We] [aux]wav[e-s], feeling foolish."
[Section 2.47 - Physical Interaction]
Attacking action  	1	"Violence [=> any third person singular][aren't*] the answer to this one."
Burning action	1	"This dangerous act [=>would][aux]achiev[e-s] little."
Cutting action	1	"Cutting [that-those-us of the noun] up [=>would][aux]achiev[e-s] little."
Rubbing action	1	"[We] [aux]achiev[e-s] nothing by this."
Setting it To action	1	"[We] [can't] set [that-those-us of the noun] to anything."
Tying it to action 	1	"[We] [=>would][aux]achiev[e-s] nothing by this."
Waving action	2	"[We] [aux]wav[e-s] [the noun] around, but to no effect."
Waving action	3	"[The person asked] [aux]wav[e-s] [the noun], to [our] amusement."
Waving action	1	"But [we] [are+][n't] holding [that-those-us of the noun]."
Squeezing action 	1	"[We] [keep*] [our] hands to [ourselves]."
Squeezing action 	2	"[We] [aux]achiev[e-s] nothing by this."
Squeezing action 	3	"[The person asked] [aux]squeez[e-s] [the noun]."
throwing it at action	2	"[We] [aux]lack[-s] the nerve when it [if story tense is in any past tense]came[else]comes[end if] to the crucial moment."
throwing it at action	1	"Futile."
[Section 2.48 - Push, Pull, Turn]
Pushing action		6	"[The person asked] [aux]push[-es] [the noun]."
Pulling action		5	"[The person asked] [aux]pull[-s] [the noun]."
Turning action		7	"[The person asked] [aux]turn[-s] [the noun]."
Pushing action		3	"Nothing obvious [=> any third person singular][aux]happen[-s]."
Pulling action		3	"Nothing obvious [=> any third person singular][aux]happen[-s]."
Turning action		3	"Nothing obvious [=> any third person singular][aux]happen[-s]."
Pushing it to action		1	"[The noun] [can] not be pushed from place to place."
Pushing it to action		2	"[We] [have*] to decide in what direction to push [the noun]."
Pushing it to action		3	"[We] [=>could]not [aux]push[-es] it [second noun][if story tense is in any past tense], though [we] tried[end if]."
Pushing action		1	"[It-They of the noun] [are*] fixed in place."
Pulling action		1	"[It-They of the noun] [are*] fixed in place."
Turning action		1	"[It-They of the noun] [are*] fixed in place."
Pushing action		2	"[We] [are*] unable to."
Pulling action		2	"[We] [are*] unable to."
Turning action		2	"[We] [are*] unable to."
Pushing action		4	"That would [if story tense is in any past tense]have been[else]be[end if] less than courteous."
Pulling action		4	"That would [if story tense is in any past tense]have been[else]be[end if] less than courteous."
Turning action		4	"That would [if story tense is in any past tense]have been[else]be[end if] less than courteous."
[Section 2.49 - Speech / Interpersonal Actions]
Answering it that action	1	"There [=> any third person singular][are*] no reply."
Asking it about action  	1	"There [=> any third person singular][are*] no reply."
[Asking it for action		1	"There [=> any third person singular][are*] no reply."]
Buying action		1	"[The noun] [aren't*] up to [our] usual standards."
Kissing action		1	"Some things [=> any third person plural][are*] best approached slowly."
Singing action		1	"[We] [aux]start[-s] singing to [ourselves], though not loud enough to disturb."
Telling it about action	2	"This [=> any third person singular][aux]provok[e-s] no reaction."
Telling it about action	1	"[We] [aux]talk[-s] to [ourselves] a while."
[Section 2.50 - Mental Actions]
Thinking action		1	"I'll wait here."
Consulting it about action	1	"[We] [=>don't][aux]discover[-s] anything of interest in [the noun]."
Consulting it about action	2	"[The person asked] [aux]look[-s] at [the noun]."
[Section 2.51 - Sleep And Waiting]
Sleeping action		1	"[We] [are+][n't] feeling especially drowsy."
Waking up action 		1	"[We] [aux]pinch[-es] [ourselves], but it wasn't worth it."
Waking action		1	"That [=> any third person singular][aux]seem[-s] unnecessary."
Waiting action		1	"Time [=> any third person singular][aux]pass[-es]."
Waiting action		2	"[The person asked] [aux]wait[-s]."
[miscellaneous messages not in the original CLM, possibly by design]
--		2	"Nothing to do."
[--		18	"[ourselves]"  YOURSELF__TX, but removed from the Printing the Name Activity above]
[--		19	"As good-looking as ever."]
--		39	"That's not something you need to refer to in the course of this game."
--		56	"."
--		57	"?"
--		73	"That noun did not make sense in this context."
--		74	"[bracket]That command asks to do something outside of play, so it can only make sense from you to me. [The person asked] cannot be asked to do this.[close bracket]"
[end of game]
--		3	" [We] [have+] died [ignore library line break]"
--		4	" [We] [have+] won [ignore library line break]"
--		75	" The End [ignore library line break]"
--		5	"Would you like to [ignore library line break]" [bug reported, #0000203]
[--		76	" or " [bug reported, #0000203]]



Custom Library Messages ends here.

---- DOCUMENTATION ----

Section : Changing Tense and Viewpoint

This extension can change the tense and/or viewpoint of all of Inform's pre-packaged responses at once.  It also allows replacing Inform's library messages in the same way as Default Messages by Ron Newcomb.  We select the viewpoint and tense with the following lines.  If we don't specify, first person present will be used.

	*: The story tense is past tense.
	The story viewpoint is third person feminine.
	
The possible viewpoints are:
	first person
	second person
	third person masculine
	third person feminine
	third person
	first person plural
	third person plural

And the story tenses:
	present tense
	past tense


A testing command, POV, prints the current viewpoint and tense, and can change them as well.
	> pov
	Adventures in Linguistics is in first person past tense.

	>pov third person masculine
	Adventures in Linguistics is now in third person masculine past tense.

	>i
	He was carrying nothing.

	>pov present tense
	Adventures in Linguistics is now in third person masculine present tense.

	>i
	He is carrying nothing.

Tense and viewpoint can be changed during play as well.  Code-wise, viewpoint is easiest because only the pronouns used in the messages need change, and there's a very short list of pronouns in English. 

	Carry out becoming Lady Marion: now the story viewpoint is third person feminine.

In our own writing, these phrases say whichever pronoun is appropriate for the story viewpoint, the capitalization, and the role in the sentence.  We use the first person plural not because it reads best, but because all ten cases are different, avoiding verbose circumlocutions like 'his-mine' or 'I in lowercase'.

	"[we]" 
	"[us]" 
	"[ours]" 
	"[ourselves]" 
	"[our]" 

	"[We]" 
	"[Us]" 
	"[Ours]" 
	"[Ourselves]" 
	"[Our]" 

For example, this:
	Report wearing something: say "[We] donned [the noun]." instead.

could print as any of these.
	I donned the...
	You donned the...
	He donned the...
	She donned the...

And so on.  More complicated differences in writing can use "[if the story viewpoint is first person]" and the like.

Changing the story tense between present and past is a slightly trickier problem because there's many more verbs than pronouns, some verbs are highly irregular, and the verb must agree with the subject. First, the easy part.

	When a flashback scene begins, now the story tense is past tense.
	When a flashback scene ends, now the story tense is present tense.

For regular verbs, we only append one of the suffix phrases "[-s]", "[-es]", "[e-s]", or "[-ies]".  (Note the hyphen:  there are non-hyphenated versions in Inform and other extensions which are for nouns, not verbs.)  An example of each of our verb suffixes:
	Report waiting: say "[We] wait[-s]." instead.
	Report searching: say "[We] search[-es] [the noun]." instead.
	Report waving: say "[We] wav[e-s] back." instead.
	Report spying: say "[We] sp[-ies] on [the noun]." instead.

For irregular verbs, we must explicitly tell Inform about them.  This extension already defines several:  are*, aren't*, have*, do*, go*, eat*, feel*, find*, get*, give*, hear*, put*, see*, take*, wear*, think*, and keep*.  (The trailing asterisk prevents confusing Inform.)  For example:
	Report eating: say "[We] [eat*] [the noun]." instead.

That prints either "eat" or "ate", as appropriate.  The others are used similarly.  

We can add to this list as well, of course.  In the following sample, we add "weave" and "say".  For the say-phrase we use within our prose, we use the present plural with an asterisk appended.  We list the other three forms in plain ol' text. 

	*: Some irregular verbs are weave*, say*.
	
	Table of Irregular Verbs (continued)
	irregular-verb-form
	"weaves"
	"weave"
	"wove"
	"says"
	"say"
	"said"

The order is very important here.  Not only do the order of the asterisked verbs need come in the same order as their corresponding sets in the list, but the three forms in each set come in the same order as that of a relation from chapter 13.9 of the manual:  "The verb to weave (he weaves, they weave, he wove) implies the..."  

Occasionally we'll need to use one of are, have, or do, as a helping verb instead of the main verb. For this, these: 
	"[are+]"
	"[have+]"
	"[do+]"

As an example, with 'decide' and 'wear' as the main verb:
	say "[We] [have+] decided to soldier on."
	say "[We] [are+] already wearing [our] uniform."

The first can produce:
	I have decided to soldier on.
	I had decided to soldier on.
	He has decided to soldier on.
	We had decided to soldier on.

And so on.  

Subject-verb agreement is usually observed automatically because the last object printed is remembered for the verb's (or suffix'es) benefit, except in a case like this.
	say "Time march[-es] on."

'Time' isn't an object, so the "[-es]" suffix would be considering some other object in the game, one that might be plural.  To ensure it, "[=> (an object)]" can be used to silently inform the next verb or suffix what it's supposed to agree with.  If no object is handy, "any third person singular" and "any third person plural" will suffice.
	say "[=> any third person singular]Time march[-es] on."
	say "[=> any third person plural]Some people pass[-es] by."

This will now produce the appropriate:
	Time marches on.
	Time marched on. 
	Some people pass by.
	Some people passed by.

Hence changing tense during play is a little trickier than changing viewpoint, but only because the computer isn't responsible for anything but the simple grammar we all take* for granted.



Section : Replacing Selective Responses

Inform comes pre-packaged with many messages for many situations.  Although changing the story viewpoint and tense will automatically change these, much of writing interactive fiction boils down to providing fresh writing for the same interactive framework.  If the story viewpoint and/or tense are never changed from second person present, then the smaller, similar extension Default Messages by Ron Newcomb also replaces responses, and by the same method:  a table of three columns.  The first column is for the action involved (or just the -- double hyphen for general messages), the second is a number (because many actions have many outcomes), and the final column is the response to the reader.  

	*: Table of custom library messages (continued)
	library-action	library-message-id	library-message-text
	--			10				"(I beg your pardon, but I didn't catch your drift.)"
	going action	2				"Marion saw nothing interesting [noun] of there."
	taking action	1				"Marion had always wanted [a noun]!"
	--	28	"(I understood [library message verb] but not the rest of it.)"

There's a few variables that come in handy for certain messages. "The noun" and "the second noun" are of course available, as is "the number understood" and similar. The others are:

	the person asked -- we cannot use "the actor" within our table, but this is identical.

	library message verb -- this would be "take" for the taking action, "go" for the going action, etc. (More precisely, it is the entire command predicate typically used in "What do you want to take?" or "I only understood you as far as take them.")

	library message pronoun -- when our reader uses a pronoun, this is the pronoun she used.

	pronoun reference object -- the noun that the above pronoun refers to.

	library message object, second library message object, library message amount -- effectively synonymous with the noun, the second noun, and the number understood for non-action messages.

	library message action, library message number -- these are the variables that are compared to our two table columns. The first differs from the library message verb in that it has the present participle ("taking") rather than the root form ("take"). For actions which take two nouns, the preposition is also included ("giving it to").

The extension usually guesses correctly on line break issues, but for those cases where it adds an extra, the say phrase "[ignore library line break]" should cure it.  It can be mixed-n-matched with the normal "[run paragraph on]" if need be.

(Table amendments, rather than continuations, may be used for actions to save some computer memory.  See chapter 15.19 in the manual.)


Section : The Printing Library Message Activity

A new activity, "printing library message", is available for whatever purpose.  It is an activity on numbers, though a "while" clause can attach an action's name to one of its rules.  For messages that aren't attached to a particular action, use "misc messaging" as the action. 

	*: For printing library message 3 while taking: say "Er, nevermind." 
	For printing library message 10 while misc messaging: say "Please type something in." 

We can create multiple tables that resemble the custom library messages table, and deem one of them the official table via a table-that-varies, "the default messages table."
	
	*: Carry out Lady Marion following the player:
		now the default messages table is the table of Lady Marion's observations.
	
	Table of Lady Marion's observations
	library-action	library-message-id	library-message-text
	-- 		10	"'Are you always so quiet, [player]?'"


If the alternate table does not hold every message, we can leverage the activity to take corrective action in any number of ways.  The activity's sole rule, "the standard library message rule," prints the corresponding library message for the situation, drawing it from the table referenced by the "default messages table".  This rule is purposefully not placed last in the activity's 'for' rulebook so we can place rules both before and after it.  We have a handful of phrases available to us to ease writing of new rules -- see the phrasebook of the index for the full list.  But for the sake of example, the following rule closely resembles the standard rule, and we would likely list it before the standard rule, as it is quite unlikely Lady Marion will be commenting on out-of-world happenings.

	*: For printing library message: 
		choose the library message corresponding to the library message action # library message number from the table of Lady Marion's observations;
		if the chosen row is zero, make no decision;
		say the library-message-text entry;
		library line break if applicable.


The initial "choose the library message corresponding to (action name) # (number) from (table)" phrase does most of the work.  Like other 'choose' phrases dealing with tables, it selects a row which later "..entry" phrases reference.  The "chosen row" is a number -- the row it chose.  Notably, it is zero if there is no corresponding message for that action and number combination in that table, allowing the rule to pass the situation to the next rule in the 'for' rulebook.  Otherwise, after the say statement shows the message to the reader, "library line break if applicable" might tack on a "[line break]" unless the message itself used "[ignore library line break]". 

For library messages which have a blank in their action column, we can use "the miscellaneous non-action" as the action.  Unrelatedly, the action our player is currently attempting is named "the action in progress". 

If no rule in the activity's 'for' phase makes a decision, a runtime error will result with the action & number of the missing message.  In a release build, the reader is greeted only with silence.



Section : Miscellaneous Substitutions

Several say-phrases that this extension uses internally are useful for the author who needs multiple tenses or viewpoints in their story.  Many of the following are similar to the ones found in the extension Plurality. 

	"['s-'re]" - contraction for is-are-am
	"[is-are of (an object)]"
	"[n't]" - contraction for not
	"[that-those-us of (an object)]" 
	"[That-those of (an object)]" 
	"[That's-They're of (an object)]" 
	"[it-them of (an object)]" 
	"[it-they of (an object)]" 
	"[It-They of (an object)]" 
	"[^]" - capitalises what text the next phrase 'decides on'

These touch-up a few miscellaneous messages.

	"[moment]" for the final word in "at the moment/time"
	"[here-there]" for the final word in "is here" vs "was there"
	"[can]" for can/could 
	"[can't]" for can't/couldn't
	"[will]" for will/would 
	"[won't]" for won't/wouldn't

None of the say phrases in this section are necessary for the author to learn, but they occasionally come in handy.  New ones can be created by quizzing the story viewpoint and story tense, or by asking if something "acts plural" to determine is/are distinctions.  "The prior named noun" is the last object to have its name printed.

	*: To say 's-'ve:    
		if the story tense is in any past tense:
			say "[']d";
		otherwise if the prior named noun acts plural:
			say "[']ve";
		otherwise:
			say "[']s".



(Ron Newcomb can be reached at pscion@yahoo.com)


Example: * Poster Shopping - Replace Inform's default responses with tailored ones for a much-improved player experience. 

In this table, we also use various say-phrases like "[We]" and "[see*]" so when the viewpoint or tense is changed during play, the messages immediately correct themselves.

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
	taking inventory action	1	"[We] decid[e-s] to acquire a new movie poster."
	--	10	"[bracket]I didn't catch your drift there.[close bracket]"
	--	109	" (glowing in the dark"
	taking action	1	"[We] [go*] for [the noun]."
	going action	2	"Born and raised in the city, [we] [have*] no idea what direction [=> any third person singular][are*] [noun]."
	--	49	"Which poster [will] [we] [library message verb]?"
	--	35	"[We] [=>don't][see*] what '[library message pronoun]' could possibly refer to."
	--	50	"[Our] score [=> any third person singular][if library message amount > 0]gain[-s][otherwise]reduc[e-s] by[end if] [library message amount in words] point[s][ignore library line break]"
	--	75	" A [random carried thing] adorn[-s] [our] wall [ignore library line break]"
	
	Instead of going when something is carried, end the story.
	
	Test me with "x me / i / / take / her / s / take horror poster / i / s ".
	Test her with "pov third person feminine / x me / i / / take / her / s / take horror poster / i / s".
	Test them with "pov third person plural / x me / i / / take / her / s / take horror poster / i / s".
	Test present with "pov present tense / x me / i / / take / her / s / take horror poster / i / s".
	


Example: ** We Said, Zie Said - "Creating new pronouns is easy," zie said. "Lightspeed travel is easy," zie said.  Zie obviously knew little of what fifty-seven centuries of tradition could do to a people.

Life and linguistics both are slippery things, and sometimes the former surprises the latter.  To catch up:  we can create new pronouns in the same manner we made new irregular verbs.  It's a three-step process.  First we name the new "declensions," which is the linguistic term for what we call story viewpoints.  Then we list in the table of pronoun declensions the five grammatical cases of the new pronoun set in the order:  I, me, mine, myself, my.  Finally we write a phrase declaring whether they conjugate as plural or not.  

Note that whether a declension acts plural doesn't mean its pronouns are plural.  For example, "I" and "you" are certainly singular, but conjugate as plural:  it's they look, we look, I look; not he looks, she looks, I looks.  (And if that weren't surprising enough, this exception doesn't exist for was/were!)

We list new pronouns in lowercase unless the pronoun is always capitalised.

	*: "We Said, Zie Said"
	
	Include Custom Library Messages by Ron Newcomb. 
	
	There is a room. 
	
	Some [more] declensions are second person plural, third person neutrois.
	
	Table of pronoun declensions (continued)
	pronoun-declension-column (text)
	"y[']all"
	"yeh"
	"y[']all[']s"
	"yourselves"
	"yer"
	"zie"
	"zir"
	"zirs"
	"zirself"
	"zir"

	To decide if (decl - nothing) acts plural:
		if the story viewpoint is second person plural, yes;
		if the story viewpoint is third person neutrois, no;
		otherwise decide on whether or not decl acts plural.
	
	Instead of examining yourself, say "[We] [are*] afraid, but [we] gathered what was [ours], said [our] goodbyes to [our] kin, and told [ourselves] that a new life lie ahead of [us]."
	
	Understand "us/ourselves" as yourself when the story viewpoint is first person plural.
	Understand "you/y'all/yourselves" or "you all" as yourself when the story viewpoint is second person plural.
	Understand "zir/zirself" as yourself when the story viewpoint is third person neutrois.
	
	Test me with "pov / examine me / pov second person plural / examine y'all / pov third person neutrois / examine zir".


Example: * All the Things Computers Don't Know - How to improve the "I only understood you as far as" response.

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




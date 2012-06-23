Original Parser by Ron Newcomb begins here.

"This port of the venerable Inform parser to Inform 7 sheds some light on how the parser accomplishes its tasks."

[ Deciding the concealed possessions activity is called from here anytime the phrase "conceals" or "does not conceal" appears. ]

[Also, belated: An object's core is whatever it is ultimately a part of. So if the tine is part of the fork, the fork is part of the place setting, the tine's core is the setting.]


Volume 1 - Exposing Necessary Pieces from Other Template Files

Include (- -) instead of "Parser.i6t".   

Chapter 1 - New Kinds of Value

[ The details for these are at the bottom of the file. ]

An understood word is a kind of value. 
A ZSCII letter is a kind of value. 
[ An array is a rulebook, based on one of the following indices, producing a value. ]
A 0-based index is a kind of value. 
A 1-based index is a kind of value. 
A struct is a kind of value.  

Chapter 2 - From the Definitions i6t File 

A token type is a kind of value. Some token types are 
	'<grammar token>',	[ then tdata is a Grammar Token. ]
	'<understood word>',		[ then tdata is a Understood Word, but it isn't interesting -- like the "to" in GIVE X TO Y ] 
	'<description of values>',		[ then tdata is a noun=Routine matching most anything: KOVs, description of objects, a kind like direction, etc. ]
	'<adjective>', 				[ then tdata is an either/or property: edible? lit? open?  I7 just uses the above for this, but it works if exposed. ]
	'any <description of objects>',	[ then tdata is a scope=Routine that adds objects to Scope: 'any room', 'any person', etc. 16.7. Understanding any, understanding rooms]
	'<understand token>'.    		[ then tdata is a <Routine> that returns GPR_FAIL, GPR_PREPOSITION, etc.]
[To decide what token type is 
	the end of line token type:   	(- ENDIT_TOKEN -). ]

To decide which token type is the first slashed synonym:  (- $20 -). 
[To decide which number is a middle slashed synonym:  (- $30 -). ]
To decide which token type is the last slashed synonym:  (- $10 -).

[See chapter 16.4, "Standard Tokens of Grammar" in _Writing with Inform_. ]
A grammar token is a kind of value.	To decide which grammar token is 
	'something':        			[0] (- NOUN_TOKEN -).  Some [more] grammar tokens are 
	'something preferably held', 	[held token] 
	'things',  					[multi token]
	'things preferably held',		[multi-held token]
	'other things', 				[multi-except token]  [ anything except the second noun ]
	'things inside', 				[multi-inside token]
	'someone', 				[ synonymously anyone, somebody, anybody but NOT 'a person' ]
	'understood word',			[ used for TEST and SHOWME testing commands ]
	'number',
	'text'. 					[ The Topic Understood ]
To decide which grammar token is 
	the end of line token: [15] (- ENDIT_TOKEN -).

A descriptor property is a kind of value. Some descriptor properties are the invalid-descriptor-property.
To decide which descriptor property is like 'MY\THESE\HIS' etc: (-POSSESS_PK-). 
To decide which descriptor property is like 'THE': (-DEFART_PK-) .
To decide which descriptor property is like 'A\AN\SOME': (-INDEFART_PK-). 
To decide which descriptor property is 'LIT\LIGHTED': (- light -). 
To decide which descriptor property is 'UNLIT': (- (-light) -). 

A run-time problem is a kind of value. Some run-time problems are the backdrops in regions only run-time problem. 
To decide which run-time problem is the cannot say invalid snippets run-time problem: (- RTP_SAYINVALIDSNIPPET -).
To decide which run-time problem is the cannot splice invalid snippets run-time problem: (- RTP_SPLICEINVALIDSNIPPET -).
To decide which run-time problem is the cannot include invalid snippets run-time problem: (- RTP_INCLUDEINVALIDSNIPPET -).
To decide which run-time problem is the bad topic run-time problem: (- RTP_BADTOPIC -).

A parser result is a kind of value. Some parser results are 
	parse succeeds as the-K-understood,  [1]
	the resulting objects.            		[2]
To decide which parser result is 
	parse fails: 		[-1] (- GPR_FAIL -).
To decide which parser result is 
	parse succeeds: 	[0] (- GPR_PREPOSITION -).
To decide which parser result is 
	reparsing:  			(- GPR_REPARSE -). 
To decide which parser result is 
	reparsing as (gt - grammar token): 	[-256+...] (- (GPR_NOUN + {gt}) -). 

To decide which parser result is (obj - an object) as a parser result: (- {obj} -).
To decide which object is (pr - a parser result) as an object: (- {pr} -).
[To decide if (pr - a parser result) is at least (pr2 - a parser result): (- ({pr} >= {pr2}) -).]
To decide which grammar token is (pr - a parser result) as a grammar token: (- ({pr} + 256) -).
To decide which number is (pr - a parser result) as a number: (- {pr} -).
To say (pr - a parser result):
	if pr is parse fails, say "parse fails";
	if pr is parse succeeds, say "parse succeeds";
	if pr is reparsing, say "reparsing";
	if pr is parse succeeds as the-K-understood, say "parse succeeds as the-K-understood";
	if pr is resulting objects, say "resulting objects";
	if pr as a number < -1, say "reparse as '[(pr as a number - 256) as a grammar token]'";
	if pr as a number > 2, say "parse succeeds as '[pr as an object]'";


The pattern union is a kind of value. [ It combines objects, understood words, and 4 different KOV values. ]
Some pattern unions are that special word. [1]
To decide which pattern union is a bunch of objects: [0] (- MULTIPLE_OBJECT_PATTERN -).
To decide which pattern union is the null pattern: [-1] (- PATTERN_NULL -).  
To decide which pattern union is noun domain's bunch of objects: (- 1 -).
To decide which pattern union is the pattern matched successfully: (- 1 -).
To decide which pattern union is noun domain's no match: (- 0 -).  
To decide which pattern union is the misunderstood command: (- REPARSE_CODE -).
To decide if (n - a pattern union) is currently an object: 
(- (({n} > (+ that special word +)) && ({n} < (+ the misunderstood command +))) -).
To decide if (n - a pattern union) is currently an understood word: 
(- ({n} >= (+ the misunderstood command +)) -).
To decide what pattern union is (w - an understood word) as a pattern union: (- ((+ misunderstood command +) + VM_DictionaryAddressToNumber({w})) -).
To decide what pattern union is (obj - an object) as a successful match: (- ({obj}) -).
To decide what object is (n - a pattern union) as an object: (- ({n}) -).


An UNDO reason is a kind of value. 	To decide which UNDO reason is 
	UNDO's unsupported: 		(- 0 -).   Some [more] UNDO reasons are 
	no further saved state exists to return to, 
	ready to UNDO, and 
	UNDO succeeded.  

A scope reason is a kind of value.  Some scope reasons are
	does this allow multiple objects,  [ return a truth state ]
	please add eligible objects to scope,  [ return whether or not these are the ONLY objects in scope ]
	please report the noun not making sense in this context,  [or return -1 for the parser error activity to handle it ]
	the invalid scope reason,
	because we're looping over scope,
	because we're testing scope.
To decide which scope reason is 
	because we're parsing the predicate nouns: (- PARSING_REASON -).
To decide which scope reason is 
	because we're parsing the addressee: (- TALKING_REASON -).

To say (r - a scope reason):
	if r is because we're parsing the predicate nouns: 
		say "parsing the predicate nouns";
	otherwise if r is because we're parsing the addressee: 
		say "parsing the addressee";
	otherwise:
		say r.

A word usage is a kind of value.  Some word usages are 
	being a verb, 
	being out of world, 
	an invalid word usage, 
	being plural.
To decide what word usage is 
	being a preposition: 	(- IS_PREPOSITION -). 
To decide what word usage is 
	being a noun: 		(- IS_NOUN -). 
To decide what word usage is 
	the unused usages: 	(- UNUSED_USAGES -). 
To decide what word usage is 
	all possible grammatical cases: (- $$111111111111 -). [4095]

To decide what word usage is the usages/usage of (w - an understood word): 
(- (({w})->#dict_par1) -).

Include (-
Constant IS_PREPOSITION = 8;
Constant IS_NOUN = 128;
Constant UNUSED_USAGES = $$01110000;
-).

A parser action is a kind of value. Some parser actions are parsing normally, identifying identical things, and identifying plurals.  [ This is for the technically-sophisticated author's use only; the parser doesn't use this. See 25.22 "Understand Tokens" in Writing With Inform.  Originally they were declared as fake-actions, but Inform 7 doesn't have those.  So, I chose this. ]

To decide which object is the used-up object: (- (-1) -).  [ The parser formerly used an I6-only object called "InformParser" for one obscure case that only made debugging output slightly nicer. I removed it in favor of this object, which gets much more use elsewhere in the parser. ]


Chapter 3 - From the Output i6t File

To decide what understood word is the missing verb for noun-only commands: (- UnknownVerb((+the verb+)) -).

To decide what number is (text - a command parser error) issued as a low-level parser error: 
(- ParserError({text}) -).

To decide if (text - a command parser error) contains text:
(-  (({text} ofclass Routine) || ({text} ofclass String)) -).

[1]
The saved score is a number that varies. 
The saved turn count is a number that varies. 
[2]
The pending paragraph break is a truth state that varies.
The paragraphing status is a number that varies.
The UNDO status is an UNDO reason that varies. 
The TRACE testing command setting is a number that varies.  
The parser callback is an object based rule producing nothing that varies.  
[To decide which 0-based index to he parser's results: (-parser_results-).]

The pronoun used is an understood word that varies.
The saved pronoun used is an understood word that varies.
The saved pronoun reference object is an object that varies.

[8]
Process the multiple object list is a truth state that varies.
The numeric word is an understood word that varies.
The action out of world is a truth state that varies.
To decide what action name is the parser's returned action: (- parser_results-->ACTION_PRES -).
To decide what object is the parser's returned noun: (- parser_results-->INP1_PRES -).
To decide what object is the parser's returned second noun: (- parser_results-->INP2_PRES -).
To change the parser's returned action to (act - an action name): (- parser_results-->ACTION_PRES = {act}; -).
To change the parser's returned noun to (obj - object): 
(- parser_results-->INP1_PRES = {obj}; -).
To change the parser's returned second noun to (obj - object): 
(- parser_results-->INP2_PRES = {obj}; -).
To change the parser's returned parameter count to (n - number): 
(- parser_results-->NO_INPS_PRES = {n}; -).
To change the parser's returned noun # (Nth - number) to (obj - object): 
(- parser_results-->({Nth} + INP1_PRES) = {obj}; -).
To reset the parser's results:
(-	parser_results-->ACTION_PRES = 0;
	parser_results-->NO_INPS_PRES = 0;
	parser_results-->INP1_PRES = 0;
	parser_results-->INP2_PRES = 0; -).


[9]
What the parser's doing is a parser action that varies. [ an "output" variable for understood tokens ]
Parser one is an object that varies.  
Parser two is a truth state that varies.  
Parser object two is an object that varies.  
The number of parameters in the command is a number that varies.
The action to be is an action name that varies. 
The action's nouns swapped places is a truth state that varies. 
The parser's current word position is a number that varies. 
The number of words in the command is a number variable. 
The verb is an understood word that varies. 
The verb's position is a number that varies.
[10]
The reason for deciding scope is a scope reason that varies. 
The scope decider is a rule producing a truth state that varies.  
The context that this noun didn't make sense within is a rule producing a truth state that varies.
The scope stage is a scope reason that varies.  
The likely second noun is an object that varies. 
The add to scope flag is a number that varies.  
The add to scope has-light-source is a truth state that varies. 
[]
The actor's scopewise location is an object that varies. 
To decide which 1-based index based rulebook producing objects is the multiple-object list: (-multiple_object-).
To decide if we suspect what the second noun will be: (- (advance_warning ~= -1) -).
To decide if we do not suspect what the second noun will be: (- (advance_warning == -1) -).
The multiple-object list overflowed is a truth state that varies. 
The action in progress is an action name that varies. 
The person requesting is a person that varies. 
The position of the topic understood  is a [word position] number that varies.
The length of the topic understood is a number that varies.
The first KOV parameter is a number that varies.
The second KOV parameter is a number that varies.

[1]
The saved score variable translates into I6 as "sline1".
The saved turn count variable translates into I6 as "sline2".
[2]
The pending paragraph break variable translates into I6 as "say__p".
The paragraphing status variable translates into I6 as "say__pc".
The UNDO status variable translates into I6 as "undo_flag".
The TRACE testing command setting variable translates into I6 as "parser_trace".

The pronoun used variable translates into I6 as "pronoun_word".
The saved pronoun used variable translates into I6 as "pronoun__word".
The saved pronoun reference object variable translates into I6 as "pronoun__obj".

[8]
The numeric word variable translates into I6 as "special_word".
Process the multiple object list variable translates into I6 as "multiflag".
The action out of world variable translates into I6 as "meta".

[9]
What the parser's doing variable translates into I6 as "parser_action".
The parser callback variable translates into I6 as "parser_one".
Parser one variable translates into I6 as "parser_one".
Parser two variable translates into I6 as "parser_two".
Parser object two variable translates into I6 as "parser_two".
The number of parameters in the command variable translates into I6 as "parameters".
The action to be variable translates into I6 as "action_to_be".
The action's nouns swapped places variable translates into I6 as "action_reversed".
The parser's current word position variable translates into I6 as "wn".
The number of words in the command variable translates into I6 as "num_words".
The verb variable translates into I6 as "verb_word".
The verb's position variable translates into I6 as "verb_wordnum".
[10]
The reason for deciding scope variable translates into I6 as "scope_reason".
The scope decider variable translates into I6 as "scope_token".

The context that this noun didn't make sense within variable translates into I6 as "scope_error".

The scope stage variable translates into I6 as "scope_stage".
The likely second noun variable translates into I6 as "advance_warning".
The add to scope flag variable translates into I6 as "ats_flag".
The add to scope has-light-source variable translates into I6 as "ats_hls".
[]
The actor's scopewise location variable translates into I6 as "actors_location".
The multiple-object list overflowed variable translates into I6 as "toomany_flag".
The action in progress variable translates into I6 as "action".
The person requesting variable translates into I6 as "act_requester".
The position of the topic understood variable translates into I6 as "consult_from".
The length of the topic understood variable translates into I6 as "consult_words".
The parsed number in question variable translates into I6 as  "parsed_number".
The first KOV parameter variable translates into I6 as "special_number1".
The second KOV parameter variable translates into I6 as "special_number2".

The parsed number in question is a number that varies.


Chapter 4 - From the Light i6t File 

[ An object is see-through if it's transparent, animate, a supporter, or an open container. ]
To decide if (obj - an object) is see-through: (- IsSeeThrough({obj}) -).
To decide whether light can get out of (obj - an object): (- (HasLightSource({obj})) -).
To decide whether light can get into (obj - an object): (- (OffersLight({obj})) -).
[ If an object is see-through, then light can get into AND get out of it. ]

[ Scope is almost the same thing as visibility, but not quite,  if the obj is inside a container which is itself part of something else. ]
To decide what object is the scope ceiling of (obj - an object): (- ScopeCeiling({obj}) -).



Chapter 5 - From the Language i6t File

To decide what ZSCII letter is the space/spaces: (- ' ' -).
To decide what understood word is the 'comma': (- ',//' -).
To decide what understood word is the 'period': (- './/' -).
To decide what understood word is the comma: (- comma_word -).
To decide what understood word is 'YES': (- YES1__WD or YES2__WD or YES3__WD -).
To decide what understood word is 'NO': (- NO1__WD or NO2__WD or NO3__WD -).
To decide what understood word is 'OF': (- OF1__WD or OF2__WD or OF3__WD or OF4__WD -).
To decide what understood word is 'ME': (- ME1__WD or ME2__WD or ME3__WD -).
To decide what understood word is 'AND': (- AND1__WD or AND2__WD or AND3__WD -).
To decide what understood word is 'THEN': (- THEN1__WD -).
To decide what understood word is synonymous with 'THEN': (- THEN1__WD or THEN2__WD or THEN3__WD -).
To decide what understood word is 'BUT': (- BUT1__WD or BUT2__WD or BUT3__WD -).
To decide what understood word is 'OOPS': (- OOPS1__WD or OOPS2__WD or OOPS3__WD -).
To decide what understood word is 'UNDO': (- UNDO1__WD or UNDO2__WD or UNDO3__WD -).
To decide what understood word is 'AGAIN': (- AGAIN1__WD or AGAIN2__WD or AGAIN3__WD -).
To decide what understood word is 'OTHER': (- OTHER1__WD or OTHER2__WD or OTHER3__WD -).
To decide what understood word is 'ALL': (- ALL1__WD or ALL2__WD or ALL3__WD or ALL4__WD or ALL5__WD -).
To decide what understood word is 'ALL' simply to enter the loop: (- ALL1__WD -).
To decide what understood word is 'AND\THEN\BUT': (- AND1__WD or AND2__WD or AND3__WD or THEN1__WD or THEN2__WD or THEN3__WD or BUT1__WD or BUT2__WD or BUT3__WD -).


To decide if (word - an understood word) is an abbreviation then say its expanded form otherwise: 
(- (LanguageVerb({word}) == 0) -).
To decide if (word - an understood word) is invalid then say so otherwise: 
(- (PrintVerb({word}) == 0) -).
To decide if (word - an understood word) cannot be a name or adjective: 
(- (~~LanguageVerbMayBeName({word})) -).


Chapter 6 - From the Standard Rules

[ Odd but true: there is one I6 function in the SR not exposed to the player. It converts a rulebook outcome to a number. ]
To decide what number is did the player mean this: (- CheckDPMR() -).

[ These have similar phrases in the SR already, but they call GL__M or AGL__M, which silence themselves in some situations.  Besides, this way of messaging will eventually disappear, and I like the following wording better anyway. Also, I really wanted some blue prose to appear in the code in places, partly for variety, and party because they themselves help document what's going on. They also serve as landmarks when scrolling.  So even though the one message below makes no use of it, it's there for those reasons. ]
To issue (Nth - a number) message for (act - an action name):  	(- L__M({act}, {Nth}, noun); -).
To issue (Nth - a number) response (txt - some text):   		(- L__M(##Miscellany, {Nth}); -).
To issue (Nth - a number) response with (obj - an number):		(- L__M(##Miscellany, {Nth}, {obj}); -).

[ Well, this one isn't but I want to highlight where parser errors occur with blue text. ]
To issue (txt - some text) as (cpe - a command parser error):	(- (+ latest parser error +) = {cpe}; -).

Chapter 7 - From the RTP i6t File

To issue (Nth - a number) run-time message (t - text): (- RunTimeError({Nth}); -).
To issue (rtp - a run-time problem) as (t - text): (- RunTimeProblem({rtp}); -).
To issue (rtp - a run-time problem) for (snp - a snippet) as (t - text): (- RunTimeProblem({rtp}, {snp}/100, ((({snp}) / 100) + (({snp}) % 100) - 1)); -).

Chapter 8 - From the Individual VM's i6t File

To decide what understood word is (n - a pattern union) as an understood word: 
(- VM_NumberToDictionaryAddress({n} - (+ the misunderstood command +)) -).

To decide what number is (word - an understood word) as a number: 
(- VM_DictionaryAddressToNumber({word}) -).

To decide if (word - an alternative grammar result) would be an invalid understood word: 
(- VM_InvalidDictionaryAddress({word}) -)

The restore window colors rule translates into I6 as "VM_RestoreWindowColours".

[ Do not use the below with "the player's input buffer".  Get the # letters copied from "the number of elements in (buf)" ]
To copy (t - some text) into (buf - a 1-based index based rulebook producing ZSCII letters):
(-	{buf}-->0 = INPUT_BUFFER_LEN;
	VM_PrintToBuffer({buf}, INPUT_BUFFER_LEN, {t}); -).

[ This appends 2 - 4 spaces (which were an array size briefly), then the word, onto the end of the buffer. ]
To append (w - an understood word) to (buf - a 1-based index based rulebook producing ZSCII letters):
(-	{-require-ctvs} 
	ct_0 = {buf}; 
	ct_1 = (+ the number of letters in the chosen array +) + WORDSIZE;
	(+ the number of letters in the chosen array +) = (+ the number of letters in the chosen array +) + WORDSIZE + VM_PrintToBuffer(ct_0+ct_1, INPUT_BUFFER_LEN - ct_1 - WORDSIZE, SayUnderstoodWord, {w});  
	(ct_0+ct_1)->0 = ' ';  ! now fill with spaces the place where the array's size had landed
	(ct_0+ct_1)->1 = ' '; 
	#ifdef TARGET_GLULX;
	(ct_0+ct_1)->2 = ' '; 
	(ct_0+ct_1)->3 = ' '; 
	#endif; -).
Include (- [ SayUnderstoodWord word x; print (address) word; ]; -).

To Parse (input array - a 1-based index based rulebook producing ZSCII letters) into (parsed array - a 1-based index based rulebook producing a struct): 
(- VM_Tokenise({input array}, {parsed array}); -).

To decide which UNDO reason is the result of saving the game state: 
(- VM_Save_Undo() + 1 -).

To decide which UNDO reason is the result of carrying out undoing a game turn:
 (- VM_Undo() + 1 -). [ Unused in here, but I included it in case you want to roll your own Undoing action ]


Chapter 9 - From other i6t Files

[Printing i6t]
To draw the status line: (- DrawStatusLine(); -).
To draw the command prompt: (- PrintPrompt(); -). 
To reset the paragraph-breaking mechanism: (- ClearParagraphing(); -).

[Out of World i6t]
The check-'n-carry out undoing a game turn rule translates into I6 as "Perform_Undo".

[Tests i6t]
To say the/-- current grammar line: (- DebugGrammarLine(); -).



Volume 2 - The Inform 6 Parser Template File

Book - Basic Definitions and Utilities


Chapter - Grammar Line Variables

[This is the I6 library parser in mostly untouched form: reformatted for template
file use, and with paragraph divisions, but otherwise hardly changed at all.
It is a complex algorithm but one which is known to produce good results for
the most part, and it is well understood from (at time of writing) fifteen
years of use. A few I7 additions have been made, but none disrupting the
basic method. For instance, I7's system for resolving ambiguities is
implemented by providing a |ChooseObjects| routine, just as a user of the
I6 library would do.

The I6 parser uses a huge number of global variables, which is not to modern
programming tastes: in the early days of Inform, the parser was essentially
written in assembly-language only lightly structured by C-like syntaxes,
and the Z-machine's 240 globals were more or less registers. The I6 library
made no distinction between which were ``private'' to the parser and which
allowed to be accessed by the user's code at large. The I7 template does
impose that boundary, though not very strongly: the variables defined
in ``Output.i6t'' are for general access, while the ones below should only
be read or written by the parser.
]

Include (-
Global best_etype;                  ! Preferred error number so far
Global nextbest_etype;              ! Preferred one, if ASKSCOPE_PE disallowed
Global parser_inflection;           ! A property (usually "name") to find object names in

Array pattern --> 32;               ! For the current pattern match
Global pcount;                      ! and a marker within it
Array pattern2 --> 32;              ! And another, which stores the best match
Global pcount2;                     ! so far

Array  line_ttype-->32;             ! For storing an analysed grammar line
Array  line_tdata-->32;
Array  line_token-->32;

Global nsns;                        ! Number of special_numbers entered so far

Global params_wanted;               ! Number of parameters needed (which may change in parsing)

Global inferfrom;                   ! The point from which the rest of the command must be inferred
Global inferword;                   ! And the preposition inferred
Global dont_infer;                  ! Another dull flag

Global cobj_flag = 0;

Global oops_from;                   ! The "first mistake" word number
Global saved_oops;                  ! Used in working this out
Array  oops_workspace -> 64;        ! Used temporarily by "oops" routine

Global held_back_mode;              ! Flag: is there some input from last time
Global hb_wn;                       ! left over?  (And a save value for wn.)
                                    ! (Used for full stops and "then".)

Global usual_grammar_after;         ! Point from which usual grammar is parsed (it may vary from
                                    ! the above if user's routines match multi-word verbs)
-) after "Utilities.i6t".

The best parser error so far is a command parser error that varies. 
The second-best parser error so far is a command parser error that varies. 

Have more to parse is a truth state that varies. 
The have more to parse variable translates into I6 as "held_back_mode".
The word position we held back at is a number that varies.
The word position we held back at variable translates into I6 as "hb_wn".

The best parser error so far variable translates into I6 as "best_etype".
The second-best parser error so far variable translates into I6 as "nextbest_etype"

The count of non-objects is a number that varies.
The count of non-objects variable translates into I6 as "nsns".

The inferred preposition is an understood word that varies. 
The inferred preposition variable translates into I6 as "inferword".

The predicate's position is a number that varies.
The predicate's position variable translates into I6 as "usual_grammar_after".

The current names list is an understood word valued property that varies. 
To decide which 0-based index based rulebook producing pattern unions is the player's understood command: 
(-pattern-).
[To decide which 0-based index based rulebook producing objects is the player's understood command as objects: 
(-pattern-).
To decide which 0-based index based rulebook producing understood words is the player's understood command as understood words: 
(-pattern-).]

To decide which 0-based index based rulebook producing pattern unions is the player's saved understood command: 
(-pattern2-).
[To decide which 0-based index based rulebook producing objects is the player's saved command as objects: 
(-pattern2-).
To decide which 0-based index based rulebook producing understood words is the player's saved command as understood words: 
(-pattern2-).]

The understood command's current position is a number[pattern index] that varies. 
The second understood command's current position is a number[pattern index] that varies. 
The number of parameters for this line is a number that varies.
Make inferences is a truth state that varies. [ Parser.i6t has the value of this boolean swapped. Negatives don't read well in my opinion so I try to do what I can. ]
Where inferring the pattern from is a number[pattern index] that varies.
Remember where the typo's at is a number[pattern index] that varies

The ranking strategy is a number that varies. 

To decide which 1-based index based rulebook producing zscii letters is the previous turn's input: (-oops_workspace-).
Where the previous typo's at is a [word position] number that varies.  


To decide which 0-based index based rulebook producing grammar tokens is the grammar line tokens: (-line_token-).
To decide which 0-based index based rulebook producing token types is the grammar line types: (-line_ttype-).
To decide which 0-based index based rulebook producing grammar tokens is the grammar line data: (-line_tdata-).
[max sizes are 32]
To decide which token type is this token's type: (- line_ttype-->pcount -).
To decide which grammar token is this grammar token: (- line_tdata-->pcount -).
To decide which grammar token is this grammar element: (- line_token-->pcount -).

The current names list variable translates into I6 as "parser_inflection".
The understood command's current position variable translates into I6 as "pcount".
The second understood command's current position variable translates into I6 as "pcount2".
The number of parameters for this line variable translates into I6 as "params_wanted".
Where inferring the pattern from variable translates into I6 as "inferfrom".
Make inferences variable translates into I6 as "dont_infer".  [ this boolean's value is negated in Parser.i6t ]
The ranking strategy variable translates into I6 as "cobj_flag".
Where the previous typo's at variable translates into I6 as "oops_from".
Remember where the typo's at variable translates into I6 as "saved_oops".


Chapter - declarations moved forward

[ These originally occurred later in the file, but I need them here so variables can be declared. ]

A descriptor kind is a kind of value. 
Some descriptor kinds are the misc descriptors.
To decide which descriptor kind is an other descriptor: (- OTHER_BIT -).
To decide which descriptor kind is a possessive descriptor: (- MY_BIT -).
To decide which descriptor kind is a THAT descriptor: (- THAT_BIT -).
To decide which descriptor kind is a plural descriptor: (- PLURAL_BIT -).
To decide which descriptor kind is a lit descriptor: (- LIT_BIT -).
To decide which descriptor kind is an unlit descriptor: (- UNLIT_BIT -).
Include (-
Constant OTHER_BIT  =   1;     !  These will be used in Adjudicate()
Constant MY_BIT     =   2;     !  to disambiguate choices
Constant THAT_BIT   =   4;
Constant PLURAL_BIT =   8;
Constant LIT_BIT    =  16;
Constant UNLIT_BIT  =  32;
-).


Chapter - Grammar Token Variables

[More globals, but dealing at the level of individual tokens now.]

Include (-
Constant PATTERN_NULL = -1 ; !  $ffff;      ! Entry for a token producing no text
Constant MULTIPLE_OBJECT_PATTERN = 0;
  ! I believe $ffff would give bad results on Glulx if there were over 65K objects in a single game.

Global found_ttype;                 ! Used to break up tokens into type
Global found_tdata;                 ! and data (by AnalyseToken)
Global token_filter;                ! For noun filtering by user routines

Global length_of_noun;              ! Set by NounDomain to no of words in noun

Global lookahead;                   ! The token after the one now being matched

Global multi_mode;                  ! Multiple mode
Global multi_wanted;                ! Number of things needed in multitude
Global multi_had;                   ! Number of things actually found
Global multi_context;               ! What token the multi-obj was accepted for

Global indef_mode;                  ! "Indefinite" mode - ie, "take a brick"
                                    ! is in this mode
Global indef_type;                  ! Bit-map holding types of specification
Global indef_wanted;                ! Number of items wanted (INDEF_ALL_WANTED for all)
Constant INDEF_ALL_WANTED = 32767;
Global indef_guess_p;               ! Plural-guessing flag
Global indef_owner;                 ! Object which must hold these items
Global indef_cases;                 ! Possible gender and numbers of them
Global indef_possambig;             ! Has a possibly dangerous assumption
                                    ! been made about meaning of a descriptor?
Global indef_nspec_at;              ! Word at which a number like "two" was parsed
                                    ! (for backtracking)
Global allow_plurals;               ! Whether plurals presently allowed or not

Global take_all_rule;               ! Slightly different rules apply to "take all" than other uses
                                    ! of multiple objects, to make adjudication produce more
                                    ! pragmatically useful results
                                    ! (Not a flag: possible values 0, 1, 2)

Global dict_flags_of_noun;          ! Of the noun currently being parsed
                                    ! (a bitmap in #dict_par1 format)
Global pronoun__word;               ! Saved value
Global pronoun__obj;                ! Saved value

Constant comma_word = 'comma,';     ! An "untypeable word" used to substitute
                                    ! for commas in parse buffers
-) after "Utilities.i6t". 


The current token type is a token type that varies.
The current grammar token is a grammar token that varies.
The length of this noun is a number that varies. 
The next token is a grammar token that varies.
The kind of multi is a grammar token that varies. 
The number of items wanted previously wanted is a number that varies.
The number of items actually received is a number that varies.
The indefinite article mode is a truth state that varies. 
The type of descriptor word used is a descriptor kind that varies.
The number of items wanted is a number that varies.
To decide what number is all items are wanted: (- INDEF_ALL_WANTED -).
Probably plural is a truth state that varies.
What the pronoun stands for is an object that varies.
The grammatical case is a [bitmap] word usage that varies.
assume leading words to be descriptors is a truth state that varies.
Where we found a number used like an adjective is a [word position] number that varies.
The noun filter is a rule producing a truth state that varies.  
Allow numeric words as descriptors is a truth state that varies.
The TAKE ALL exception is a number that varies. 
The word's usages is a word usage that varies.

The current token type variable translates into I6 as "found_ttype".
The current grammar token variable translates into I6 as "found_tdata".
The length of this noun variable translates into I6 as "length_of_noun".
The next token variable translates into I6 as "lookahead".
The kind of multi variable translates into I6 as "multi_context".
The number of items wanted previously wanted variable translates into I6 as "multi_wanted".
The number of items actually received variable translates into I6 as "multi_had".
The indefinite article mode variable translates into I6 as "indef_mode".
[Typed in A\AN\SOME]
The type of descriptor word used variable translates into I6 as "indef_type".
The number of items wanted variable translates into I6 as "indef_wanted".
Probably plural variable translates into I6 as "indef_guess_p".
What the pronoun stands for variable translates into I6 as "indef_owner".
The grammatical case variable translates into I6 as "indef_cases".
assume leading words to be descriptors variable translates into I6 as "indef_possambig".  [rename this to imperative]
Where we found a number used like an adjective variable translates into I6 as "indef_nspec_at".
The noun filter variable translates into I6 as "token_filter".
Allow numeric words as descriptors variable translates into I6 as "allow_plurals".
The TAKE ALL exception variable translates into I6 as "take_all_rule".
The word's usages variable translates into I6 as "dict_flags_of_noun".


Chapter - Match List Variables

[The most difficult tokens to match are those which refer to objects, since
there is such a variety of names which can be given to any individual object,
and we don't of course know which object or objects are meant. We store the
possibilities (up to |MATCH_LIST_WORDS|, anyway) in a data structure called the match list.]

Include (-
Array  match_list --> MATCH_LIST_WORDS;    ! An array of matched objects so far
Array  match_classes --> MATCH_LIST_WORDS; ! An array of equivalence classes for them
Array  match_scores --> MATCH_LIST_WORDS;  ! An array of match scores for them
Global number_matched;              ! How many items in it?  (0 means none)
Global number_of_classes;           ! How many equivalence classes?
Global match_length;                ! How many words long are these matches?
Global match_from;                  ! At what word of the input do they begin?
-). 

To decide which 0-based index based rulebook producing an object is the match list: (-match_list-).
To decide which 0-based index based rulebook producing a number is the match list's groups: (-match_classes-).
To decide which 0-based index based rulebook producing a number is the match score list: (-match_scores-).
The number of objects in the match list is a number that varies. 
The number of match groups is a number that varies.
The number of words matched per object is a number that varies. 
The next word to parse's position is a number that varies. 


The number of objects in the match list variable translates into I6 as "number_matched".
The number of match groups variable translates into I6 as "number_of_classes".
The number of words matched per object variable translates into I6 as "match_length".
The next word to parse's position variable translates into I6 as "match_from". 




Chapter - Words

[The player's command is broken down into a numbered sequence of words, which
break at spaces or certain punctuation (see the DM4). The numbering runs
upwards from 1 to |WordCount()|. The following utility routines provide
access to words in the current command; because buffers have different
definitions in Z and Glulx, so these routines must vary also.

The actual text of each word is stored as a sequence of ZSCII values in
a |->| (byte) array, with address |WordAddress(x)| and length |WordLength(x)|.

We picture the command as a stream of words to be read one at a time, with
the global variable |wn| being the ``current word'' marker. |NextWord|, which
takes no arguments, returns:
(a) 0 if the word at |wn| is unrecognised by the dictionary or |wn| is out
of range,
(b) |comma_word| if the word was a comma,
(c) |THEN1__WD| if it was a full stop (because of the Infocom tradition that
a full stop abbreviates for the word ``then'': e.g., TAKE BOX. EAST was read
as two commands in succession),
(d) or the dictionary address if the word was recognised.

The current word marker |wn| is always advanced.

|NextWordStopped| does the same, but returns $-1$ when |wn| is out of range
(e.g., by having advanced past the last word in the command).

|MoveWord(at1, b2, at2)| copies word |at2| from parse buffer |b2| -- which
doesn't need to be |buffer| -- to word |at1| in |parse|.]

[Section 1 - (for Z-machine only)

Include (-
!#Ifdef TARGET_ZCODE;
![ WordCount; return parse->1; ];
![ WordAddress wordnum; return buffer + parse->(wordnum*4+1); ];
![ WordLength wordnum; return parse->(wordnum*4); ];
![ MoveWord at1 b2 at2 x y;
!    x = at1*2-1; y = at2*2-1;
!    parse-->x++ = b2-->y++;
!    parse-->x = b2-->y;
!];
-).

Section 2 - (for Glulx only)

Include (-
!#Ifnot;
![ WordCount; return parse-->0; ];
![ WordAddress wordnum; return buffer + parse-->(wordnum*3); ];
![ WordLength wordnum; return parse-->(wordnum*3-1); ];
![ MoveWord at1 b2 at2 x y;
!    x = at1*3-2; y = at2*3-2;
!    parse-->x++ = b2-->y++;
!    parse-->x++ = b2-->y++;
!    parse-->x = b2-->y;
!];
!#Endif;
-).]

[Section 3 - both VMs]

[ MoveWord() removed from the parser per bug #755 ]
[To move (Nth - a number) word of (source - a 1-based index based rulebook producing structs) to (Pth - a number) position (this is MoveWord):
	change the Pth word of the player's parsed command to the Nth word of the source;
	change the Pth word's length of the player's parsed command to the Nth word's length of the source;
	change the Pth word's position of the player's parsed command to the Nth word's position of the source.]

[To choose (Nth - a number) element from (arr - a 1-based index based rulebook producing structs):
	(- {-require-ctvs} ct_0 = {arr}; ct_1 = {Nth}; -).

Every turn:
	choose the 2nd element from the player's parsed command;
	say "The 2nd word used was [the chosen word of the player's parsed command].";
	say "The position is at [the chosen word's position of the player's parsed command].";
	say "The length is [the chosen word's length of the player's parsed command].";
	say "The 1st word used was [the 1st word of the player's parsed command].";
	say "The position is at [the 1st word's position of the player's parsed command].";
	say "The length is [the 1st word's length of the player's parsed command].";
	repeat with x running from 1 to 4:
		say the x word of the player's parsed command;
	move the 3rd word of the player's parsed command to the 2nd position;
	repeat with x running from 1 to 4:
		say the x word of the player's parsed command;]

To decide what number is the word count (this is WordCount):
	decide on the number of words in the player's parsed command.

To decide which 1-based index based rulebook producing ZSCII letters is the (nth - a number) word's address (this is WordAddress):
	decide on the player's input buffer advanced to the Nth word's real position of the player's parsed command.
	
To decide what number is the length of (Nth - a number) word (this is WordLength):
	decide on the Nth word's length of the player's parsed command.

[ Remember: 1) check bounds, 2) always increase wn, even on error, 3) don't deref the array until after bounds are checked ]
To decide what understood word is the next word (this is NextWord):
	if the parser's current word position is less than 1 or the parser's current word position is greater than the word count:
		increment the parser's current word position;
		decide on a word unknown by the game;
	let the current word be the (parser's current word position) -th word of the player's parsed command;
	increment the parser's current word position;
	if the current word is the 'comma', now the current word is the comma;
	if the current word is the 'period', now the current word is 'THEN';
	decide on the current word.

[ NextWord i j wc;
	#Ifdef TARGET_ZCODE; wc = parse->1; i = wn*2-1;
	#Ifnot; wc = parse-->0; i = wn*3-2; #Endif;
    wn++;
    if ((wn < 2) || (wn > wc+1)) return 0;
    j = parse-->i;
    if (j == ',//') j = comma_word;
    if (j == './/') j = THEN1__WD;
    return j;
]

To decide what understood word is the next word if any (this is NextWordStopped):
	if the parser's current word position is less than 1 or the parser's current word position is greater than the word count:
		increment the parser's current word position;
		decide on no more words left to parse;
	decide on the next word; 

[ NextWordStopped wc;
	#Ifdef TARGET_ZCODE; wc = parse->1; #Ifnot; wc = parse-->0; #Endif;
	if ((wn < 1) || (wn > wc)) { wn++; return -1; }
    return NextWord();
]

[ This is used only once, to loop through the words in the 2nd parsed command, trying to find a comma. ]
[ So it may be refactored as an "is listed in" command. ]
To decide what understood word is the next word from (Nth - a number) position of (array - a 1-based index based rulebook producing structs) (this is WordFrom):
	if the Nth is less than 1 or Nth is greater than the word count:
		decide on a word unknown by the game;
	let the current word be the Nth word of the array;
	if the current word is the 'comma', now the current word is the comma;
	if the current word is the 'period', now the current word is 'THEN';
	decide on the current word.

To decide if (wanted word - an understood word) is listed in (wordlist - a 1-based index based rulebook producing structs):
	repeat with this running from 1 to the number of words in the wordlist:
		if this word of the wordlist is the wanted word:
			now where that word was found is this;
			yes.

[ WordFrom w p i j wc;
	#Ifdef TARGET_ZCODE; wc = p->1; i = w*2-1;
	#Ifnot; wc = p-->0; i = w*3-2; #Endif;
    if ((w < 1) || (w > wc)) return 0;
    j = p-->i;
    if (j == ',//') j = comma_word;
    if (j == './/') j = THEN1__WD;
    return j;
]


Chapter - Snippets

[Although the idea is arguably implicit in I6, the formal concept of
``snippet'' is new in I7. A snippet is a value which represents a word
range in the command most recently typed by the player. These words number
consecutively upwards from 1, as noted above. The correspondence between
$(w_1, w_2)$, the word range, and $V$, the number used to represent it as
an I6 value, is:
$$ V = 100w_1 + (w_2-w_1+1) $$
so that the remainder mod 100 is the number of words in the range. We
require that $1\leq w_1\leq w_2\leq N$, where $N$ is the number of words in
the current player's command. The entire command is therefore represented by:
$$ C = 100 + N $$]

Section - A Small Snippet Extension

[ This snippet mini-extension is really handy. ]

[ Snippets as a unit ]
To decide what number is the position part of (snp - a snippet): (- ({snp} / 100) -).
To decide what number is the length in words part of (snp - a snippet): (- ({snp} % 100) -).

[ Useful little phrases. ]
To decide if (snp - a snippet) is/are invalid: (-  ( ({snp} < 101) || (({snp} % 100) < 1) ) -).
To decide what number is the ending position of (snp - a snippet): (- ((({snp}) / 100) + (({snp}) % 100) - 1) -).
To decide what snippet is the empty snippet: (- 100 -).
To decide what snippet is (snip - a snippet) lengthened by (n - a number): (- ({snip} + {n}) -).
To decide what snippet is (snip - a snippet) shortened by (n - a number): (- ({snip} - {n}) -).
To decide what snippet is the single word at/-- (position - a number): (- ((({position}) * 100) + 1) -).
To decide what snippet is the insertion point at/-- (position - a number): (- (({position}) * 100) -).

[ Turning a snippet of words into a "snippet of letters". ]
To decide what [letter-wise position] number is the left edge of (snip - a snippet):
	let leftmost [word-wise position] be the [word-wise] position part of the snip;
	decide on the leftmost word's [letter-wise] position of the player's parsed command;

To decide what [letter-wise position] number is the right edge of (snip - a snippet):
[	say "length in words of snip [length in words part of the snip].";]
	if the length in words part of the snip is 0, decide on the left edge of the snip - 2;
	let rightmost [word-wise position] be the [word-wise] ending position of the snip;
	let the last word's first letter's position be the rightmost word's [letter-wise] position of the player's parsed command;
	decide on the last word's first letter's position + the rightmost word's length of the player's parsed command - 1.

[ OOPS processing also uses this, as it's essentially a call to "replace (snippet) with (text)". ]
[ Old word(s) are in the player's input buffer.  New word(s) are in the secondary input buffer. ]
To replace (old word - snippet) with (new word's length - a number) in letters from (new word's position - a number): 
	let the old word's position be the left edge of the old word;
	let the old word's length be (the right edge of the old word) - the old word's position + 1;
[	say "[right edge of the old word] - old position [old word's position] + 1 = old len [old word's length]; new len [new word's length].";]
[	if the new word's length < the old word's length:
		fill the player's input buffer with spaces starting at the old word's position for old word's length elements;  [ fill? or shift left? And retokenize? ]]
	if the new word's length > the old word's length:
[		say "     [player's input buffer][line break]";]
		insert (new word's length - old word's length) elements into the player's input buffer at the old word's position;
[		say "     [player's input buffer][line break]";]
	copy (the new word's length) elements FROM the secondary input buffer at the new word's position TO the player's input buffer at the old word's position;
	if the new word's length < the old word's length:
		shift the player's input buffer left by (old word's length - new word's length) starting at the old word's position + the old word's length;
	PARSE the player's input buffer into the player's parsed command;
	now the player's command is the empty snippet lengthened by the word count.

[Every turn:
	say "[the player's command].";
	if the player's command includes "blue/red", replace the matched text with "yellow";
	say "[the player's command].";
	if the player's command includes "yellow", cut the matched text;
	say "[the player's command].";
	change the text of the player's command to "";
	say "[the player's command].";]

[Before printing a parser error, say "   [the player's input buffer].".]

Section - Snippets

To say (snipped - a snippet) (this is PrintSnippet):
	if the snipped is invalid or the ending position of the snipped is greater than the word count:
		unless the snipped is the empty snippet, issue the cannot say invalid snippets run-time problem for the snipped as "Attempt to say a snippet value which is currently invalid.";
		stop;
	say the player's input buffer from the left edge of the snipped to the right edge of the snipped.

[ PrintSnippet snip from to i w1 w2;
	w1 = snip/100; w2 = w1 + (snip%100) - 1;
	if ((w2<w1) || (w1<1) || (w2>WordCount())) {
		if ((w1 == 1) && (w2 == 0)) rfalse;
		return RunTimeProblem(RTP_SAYINVALIDSNIPPET, w1, w2);
	}
	from = WordAddress(w1); 
	to = WordAddress(w2) + WordLength(w2) - 1;
	for (i=from: i<=to: i++) print (char) i->0;
]

To cut (snipped - a snippet): replace the snipped with "".

To replace (old words - a snippet) with (new text - some text) (this is SpliceSnippet):
	if the old words are invalid:
		unless the old words are the empty snippet, issue the cannot splice invalid snippets run-time problem for the old words as "Attempt to splice a snippet value which is currently invalid.";
		stop;
	save the pending paragraph break;
	save the paragraphing status;
	copy the new text into the secondary input buffer;
	let the new words' length be the number of elements in the secondary input buffer;
	replace the old words with the new words' length in letters from the 1st [position];
	restore the paragraphing status;
	restore the pending paragraph break.

[ SpliceSnippet snip t i w1 w2 nextw at endsnippet newlen;
	w1 = snip/100; w2 = w1 + (snip%100) - 1;
	if ((w2<w1) || (w1<1)) {
		if ((w1 == 1) && (w2 == 0)) return;
		return RunTimeProblem(RTP_SPLICEINVALIDSNIPPET, w1, w2);
	}
	@push say__p; @push say__pc;
	nextw = w2 + 1;
	at = WordAddress(w1) - buffer;
	if (nextw <= WordCount()) endsnippet = 100*nextw + (WordCount() - nextw + 1);
	buffer2-->0 = INPUT_BUFFER_LEN;
	newlen = VM_PrintToBuffer(buffer2, INPUT_BUFFER_LEN, SpliceSnippet__TextPrinter, t, endsnippet);
	for (i=0: (i<newlen) && (at+i<120): i++) buffer->(at+i) = buffer2->(WORDSIZE+i);
	#Ifdef TARGET_ZCODE; buffer->1 = at+i; #ifnot; buffer-->0 = at+i; #endif;
	for (:at+i<120:i++) buffer->(at+i) = ' ';
	VM_Tokenise(buffer, parse);
	players_command = 100 + WordCount();
	@pull say__pc; @pull say__p;
]

[ SpliceSnippet__TextPrinter t endsnippet;
	PrintText(t);
	if (endsnippet) { print " "; PrintSnippet(endsnippet); }
]

[ Very like a relation, but checking it must set "the matched text" as a side-effect. ]
[ Remember the case where "the matched text" is itself passed into this function. ]
To decide if (snipped - a snippet) includes (T - a topic) (this is SnippetIncludes): 
	if the snipped is invalid:
		unless the snipped is the empty snippet, issue the cannot include invalid snippets run-time problem for the snipped as "Attempt to match a snippet value which is currently invalid.";
		now the matched text is the empty snippet;
		no;
	unless T is currently a rule:    [ might happen if there's a blank row in a table with a topic column. ]
		[issue the bad topic run-time problem as "Attempt to see if a snippet of text matches something which is not a topic.";]
		now the matched text is the empty snippet;
		no; 
	repeat with spot running from the position part of the snipped to the ending position of the snipped:
		let the match attempt be T applied to the spot;
		if the match attempt is not parse fails:
			now the matched text is the insertion point at the spot lengthened by the parser's current word position - the spot;
			yes;
	now the matched text is the empty snippet;
	no.

To decide if (S - a snippet) does not include (T - a topic): if S includes T, no; otherwise yes.


[ SnippetIncludes test snippet w1 w2 wlen i j;
	w1 = snippet/100; w2 = w1 + (snippet%100) - 1;
	if ((w2<w1) || (w1<1)) {
		if ((w1 == 1) && (w2 == 0)) rfalse;
		return RunTimeProblem(RTP_INCLUDEINVALIDSNIPPET, w1, w2);
	}
	if (metaclass(test) == Routine) {
		wlen = snippet%100;
		for (i=w1, j=wlen: j>0: i++, j-- ) {
			if (((test)(i, 0)) ~= GPR_FAIL) return i*100+wn-i;
		}
	}
	rfalse;
]


To decide if (snipped - a snippet) matches (T - a topic) (this is SnippetMatches): 
	now the parser's current word position is 1;
	if T is currently blank, no;
	if T is currently a rule:
		let the match attempt be T applied to the snipped;
		decide on whether or not the match attempt is not parse fails;
	issue the bad topic run-time problem as "Attempt to see if a snippet of text matches something which is not a topic.";
	no.

To decide if (S - a snippet) does not match (T - a topic): if S matches T, no; otherwise yes. 

[ SnippetMatches snippet topic_gpr rv;
	wn=1;
	if (topic_gpr == 0) rfalse;
	if (metaclass(topic_gpr) == Routine) {
		rv = (topic_gpr)(snippet/100, snippet%100);
		if (rv ~= GPR_FAIL) rtrue;
		rfalse;
	}
	RunTimeProblem(RTP_BADTOPIC);
	rfalse;
]


Chapter - Unpacking Grammar Lines

[Grammar lines are sequences of tokens in an array built into the story file,
but in a format which differs depending on the virtual machine in use, so
the following code unpacks the data into more convenient if larger arrays
which are VM-independent.]

To decide which number is the size of the grammar line's header: (- (WORDSIZE/2 + 1) -).
To decide which number is the size of a single token in the grammar line: (- (WORDSIZE + 1) -).

[To decide which 0-based index based rulebook producing structs is the token string: 
(-line_address-).]


To decide which token type is the token type at (packed data - 0-based index based rulebook producing grammar tokens): (- ({packed data}->0 & $$1111) -). [byte]

To decide which grammar token is the grammar token at (packed data - 0-based index based rulebook producing grammar tokens): (- ({packed data}+1)-->0 -). 

To decide which grammar token is the token properties at (packed data - 0-based index based rulebook producing grammar tokens): (- ({packed data}) -). [byte]

To decide if (packed data - 0-based index based rulebook producing grammar tokens) is not at the end of the grammar line: 
(- ({packed data}->0 ~= ENDIT_TOKEN) -). 



To decide which 0-based index based rulebook producing grammar tokens is the verb's next understand-as line after (line address - a 0-based index based rulebook producing grammar tokens) (this is UnpackGrammarLine):
	unpack the action to be and whether the action's nouns swapped places from the line address;
	advance the line address by the size of the grammar line's header; 
	let this be 0;
	now the number of parameters for this line is 0;
	while the line address is not at the end of the grammar line:
		change this element of the grammar line tokens to the token properties at the line address;
		change this element of the grammar line types to the token type at the line address;
		change this element of the grammar line data to the grammar token at the line address;
		if this element of the grammar line types is not '<understood word>':
			increment the number of parameters for this line;
		increment this;
		advance the line address by the size of a single token in the grammar line;
	repeat with unused running from this to 31:
		change the unused element of the grammar line tokens to the end of line token;
		change the unused element of the grammar line types to '<grammar token>';
		change the unused element of the grammar line data to the end of line token;
	advance the line address by 1;
[	repeat with unused running from 0 to 31:
		say "[unused]: [the unused element of the grammar line tokens as a debugging number] [the unused element of the grammar line types] [if the unused element of the grammar line types is '<understood word>'][the unused element of the grammar line data as an understood word][else][the unused element of the grammar line data][end if][line break][run paragraph on]";]
	decide on the line address.

Include(-
[ AnalyseToken token;
    if (token == ENDIT_TOKEN) {
        found_ttype = ELEMENTARY_TT; ! token type
        found_tdata = ENDIT_TOKEN;  ! grammar token
        return;
    }
    found_ttype = (token->0) & $$1111;
    found_tdata = (token+1)-->0;
];
-).


To split (t - a [0-based index based rulebook producing] grammar tokens) into the current grammar token & current token type: (- AnalyseToken({t}); -).
[	if t is not at the end of the grammar line:
		now the current token type is the token type at t;
		now the current grammar token is the grammar token at t;
	otherwise:
		now the current token type is '<grammar token>';
		now the current grammar token is the end of line token.]

[ UnpackGrammarLine line_address i size;
    for (i=0 : i<32 : i++) {
        line_token-->i = ENDIT_TOKEN;
        line_ttype-->i = ELEMENTARY_TT;
        line_tdata-->i = ENDIT_TOKEN;
    }
#Ifdef TARGET_ZCODE;
    action_to_be = 256*(line_address->0) + line_address->1;
    action_reversed = ((action_to_be & $400) ~= 0);
    action_to_be = action_to_be & $3ff;
    line_address--;
    size = 3;
#Ifnot; ! GLULX
    @aloads line_address 0 action_to_be;
    action_reversed = (((line_address->2) & 1) ~= 0);
    line_address = line_address - 2;
    size = 5;
#Endif;
    params_wanted = 0;
    for (i=0 : : i++) {
        line_address = line_address + size;
        if (line_address->0 == ENDIT_TOKEN) break;
        line_token-->i = line_address;
        AnalyseToken(line_address);
        if (found_ttype ~= PREPOSITION_TT) params_wanted++;
        line_ttype-->i = found_ttype;
        line_tdata-->i = found_tdata;
    }
    return line_address + 1;
]

Chapter - Extracting Verb Numbers

[A long tale of woe lies behind the following. Infocom games stored verb numbers
in a single byte in dictionary entries, but they did so counting downwards, so
that verb number 0 was stored as 255, 1 as 254, and so on. Inform followed
suit so that debugging of Inform 1 could be aided by using the then-available
tools for dumping dictionaries from Infocom story files; by using the Infocom
format for dictionary tables, Inform's life was easier.

But there was an implicit restriction there of 255 distinct verbs (not 256
since not all words were verbs). When Glulx raised almost all of the Z-machine
limits, it made space for 65535 verbs instead of 255, but it appears that
nobody remembered to implement this in I6-for-Glulx and the Glulx form of
the I6 library. This was only put right in March 2009, and the following
routine was added to concentrate lookups of this field in one place.]

To decide what 1-based index based rulebook producing structs is the first understand-as line for (word - an understood [verb] word):
(- VM_CommandTableAddress(DictionaryWordToVerbNum({word})) -).

[ see the VM-specific sections at the bottom. ]

Chapter - Keyboard Primitive

[This is the primitive routine to read from the keyboard: it usually delegates
this to a routine specific to the virtual machine being used, but sometimes
uses a hacked version to allow TEST commands to work. (When a TEST is running,
the text in the walk-through provided is fed into the buffer as if it had
been typed at the keyboard.)]

[ This is called from outside Parser.i6t, and the multiple #defines means it's pointless to translate it. ]
To read a command into (buffer - a 1-based index based rulebook producing ZSCII letters) and parse it into (parse table - a 1-based index based rulebook producing structs):
(- KeyboardPrimitive({buffer}, {parse table}); -).

Include (-
[ KeyboardPrimitive a_buffer a_table;
	! In case of an array entry corruption that shouldn't happen, but would be disastrous if it did.
#Ifdef TARGET_ZCODE;
	a_buffer->0 = INPUT_BUFFER_LEN;
	a_table->0 = 15;  ! Allow to split input into this many words
#Endif;  
		
#Ifdef DEBUG; 
#Iftrue ({-value:NUMBER_CREATED(test_scenario)} > 0);
	return TestKeyboardPrimitive(a_buffer, a_table);
#Endif; 
#Endif;
	return VM_ReadKeyboard(a_buffer, a_table);
];-). 

Chapter - Reading the Command

[The |Keyboard| routine actually receives the player's words, putting the
words in |a_buffer| and their dictionary addresses in |a_table|. It is
assumed that the table is the same one on each (standard) call. Much
of the code handles the OOPS and UNDO commands, which are not actions and
do not pass through the rest of the parser. The undo state is saved --
it is essentially an internal saved game, in the VM interpreter's memory
rather than in an external file -- and note that this is therefore also
where execution picks up if an UNDO has been typed. Since UNDO recreates
the former machine state perfectly, it might seem impossible to tell that
an UNDO had occurred, but in fact the VM passes information back in the
form of a return code from the relevant instruction, and this allows us
to detect an undo. (We deal with it by printing the current location and
asking another command.)

|Keyboard| can also be used by miscellaneous routines in the game to ask
yes/no questions and the like, without invoking the rest of the parser.

The return value is the number of words typed.]


[ This is usually called from the default For Reading A Command rule, but can also be called in response to Which Did You Mean and What/Whom Did You Want To Take. ]
To decide what number is the number of words TYPED IN AT THE KEYBOARD into (input array - a 1-based index based rulebook producing ZSCII letters) and (parsed array - a 1-based index based rulebook producing structs) (this is Keyboard):
	now the saved score is the score;
	now the saved turn count is the turn count;
	repeat forever:
		copy 64 letters from the input array to the previous turn's input; 
		draw the command prompt;
		draw the status line;
		READ A COMMAND into the input array and PARSE it into the parsed array;
		if the word count is zero:
			save the latest parser error;
			now the latest parser error is the I beg your pardon error;
			carry out THE PRINTING A PARSER ERROR ACTIVITY; [ This activity is called again below. ]
[			begin THE PRINTING A PARSER ERROR ACTIVITY;   [ This activity is called again below. ]
			if handling THE PRINTING A PARSER ERROR ACTIVITY:
				issue the 10th response "I beg your pardon?";
			end THE PRINTING A PARSER ERROR ACTIVITY;]
			restore the latest parser error;
		otherwise if the 1st word of the parsed array is 'OOPS':
			[ CHECK correcting a typo rulebook: ]
			if where the previous typo's at  is 0:
				issue the 14th response "Sorry, that can't be corrected.";
			otherwise if the word count is less than 2:
				issue the 15th response "Think nothing of it.";
			otherwise if the word count is greater than 2:
				issue the 16th response "'Oops' can only correct a single word.";
			otherwise:
				[ CARRY OUT correcting a typo: ]
				let the new word's position be the 2nd word's position of the parsed array; 
				let the new word's length be the 2nd word's length of the parsed array;
				copy the input array into the secondary input buffer;  [ saves away OOPS SWORD ]
				copy the previous turn's input into the input array;   [ retrieves TAKE WSORD ]
				PARSE the input array into the parsed array; [ updates position & length of the parsed array ]
				replace the single word where the previous typo's at with the new word's length in letters from the new word's position; [ WSORD becomes SWORD ]
				PARSE the input array into the parsed array; [ re-parse TAKE SWORD and we're done. ]
				decide on the word count;
		otherwise if the 1st word of the parsed array is 'UNDO' and the word count is one:
			[[ CHECK undoing a game turn rules: ]
			if the prevent undo option is active:
				issue the 70th response "The use of 'undo' is forbidden in this game.";
			otherwise if the turn count is one:
				issue the 11th response "You can't 'undo' what hasn't been done!";
			otherwise if the UNDO status is UNDO's unsupported:
				issue the 6th response "Your interpreter does not provide 'undo'. Sorry!";
			otherwise if the UNDO status is no further saved state exists to return to:
				issue the 7th response "You cannot 'undo' any further.";
			[ CARRY OUT undoing a game turn: ]
			otherwise if the result of carrying out undoing a game turn is no further saved state exists to return to:
				issue the 7th response "You cannot 'undo' any further.";]
			consider the check-'n-carry out undoing a game turn rule directly;
		otherwise:
			now the UNDO status is the result of saving the game state;
			if the undo prevention option is active, now the UNDO status is UNDO's unsupported;
			[ Usually the UNDO status is 'ready to UNDO' here, unless the saving tells us we just UNDid & need to Report. ]
			if the UNDO status is UNDO succeeded:
				now the UNDO status is ready to UNDO;
				[ REPORT undoing a game turn: ]
				consider the restore window colors rule directly;
				say "[bold type][the player's surroundings][line break][roman type]";
				issue the 13th response "(Previous turn undone.)";
			otherwise:
				decide on the word count.

[ Keyboard  a_buffer a_table  nw i w w2 x1 x2;
	sline1 = score; sline2 = turns;

	while (true) {      ! this while(true) only exists so we can use next/continue instead of goto
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
		if (nw == 0) {
			@push etype; etype = BLANKLINE_PE;
			players_command = 100;
			BeginActivity(PRINTING_A_PARSER_ERROR_ACT);
			if (ForActivity(PRINTING_A_PARSER_ERROR_ACT) == false) L__M(##Miscellany,10);
			EndActivity(PRINTING_A_PARSER_ERROR_ACT);
			@pull etype;
			continue;
		}
	
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
			x1 = a_table->9;  ! Position of word following "oops"
			x2 = a_table->8;  ! Length of word following "oops"
			#Ifnot; ! TARGET_GLULX
			x1 = a_table-->6; ! Position of word following "oops"
			x2 = a_table-->5; ! Length of word following "oops"
			#Endif; ! TARGET_
		
			! Repair the buffer to the text that was in it before the "oops"
			! was typed:
			for (i=0 : i<64 : i++) a_buffer->i = oops_workspace->i;
			VM_Tokenise(a_buffer,a_table);
		
			! Work out the position in the buffer of the word to be corrected:
			#Ifdef TARGET_ZCODE;
			w = a_table->(4*oops_from + 1); ! Position of word to go
			w2 = a_table->(4*oops_from);    ! Length of word to go
			#Ifnot; ! TARGET_GLULX
			w = a_table-->(3*oops_from);      ! Position of word to go
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
			Perform_Undo();  ! which asks undo_flag if it's ok to VM_Undo() 
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
			SL_Location(); print "^";          ! say "[the player’s surroundings][line break]" 
			! print (name) location, "^";
			VM_Style(NORMAL_VMSTY);
			L__M(##Miscellany, 13);
			continue;
		}
		return nw;
	}
]


Book - The Parser Proper

Chapter - Parser Proper

[The main parser routine is something of a leviathan, and it has traditionally
been divided into 11 lettered parts:

(A) Get the input, do OOPS and AGAIN
(B) Is it a direction, and so an implicit GO?  If so go to (K)
(C) Is anyone being addressed?
(D) Get the command verb: try all the syntax lines for that verb
(E) Break down a syntax line into analysed tokens
(F) Look ahead for advance warning for |multiexcept|/|multiinside|
(G) Parse each token in turn (calling |ParseToken| to do most of the work)
(H) Cheaply parse otherwise unrecognised conversation and return
(I) Print best possible error message
(J) Retry the whole lot
(K) Last thing: check for THEN and further instructions(s), return.

This lettering has been preserved here, with the code under each letter
now being the body of ``Parser Letter A'', ``Parser Letter B'' and so on.

Note that there are three different places where a return can happen.
The routine returns only when a sensible request has been made; for a
fairly thorough description of its output, which is written into the
|parser_results| array and also into several globals (see ``OrderOfPlay.i6t'').]

Section 1 - debug - not for release

To say the parsed command:
	say "[bracket] ";
	repeat with Nth running from 1 to the number of words in the command:
		say "'[the player's input buffer from (the Nth word's position of the player's parsed command) to (the Nth word's position of the player's parsed command + the Nth word's length of the player's parsed command - 1)]' ";
		if the Nth word of the player's parsed command is a word unknown by the game, say "? ";
		otherwise say the Nth word of the player's parsed command;
		if Nth < the number of words in the command, say " / ";
	say " [close bracket][line break]".

Section 2 - parser

Where the comma was found is a number that varies.

To parse (this is Parser__parse):
	now the ranking strategy is 0;
	reset the parser's results;
	now the action out of world is false;
	[  PARSER LETTER A ]
	if we have more to parse:
		we no longer have more to parse;
		Parse the player's input buffer into the player's parsed command;
	otherwise:
		(At this point we ReType);
		while this isn't done:
			now the ranking strategy is 0;
			now the actor's scopewise location is the scope ceiling of the player;
			begin THE READING A COMMAND ACTIVITY;
			if handling THE READING A COMMAND ACTIVITY:
				let nw be the number of words typed in at the keyboard into the player's input buffer and the player's parsed command;
				now the player's command is the empty snippet lengthened by the word count;
				now the number of words in the command	is the word count;
			end THE READING A COMMAND ACTIVITY; [ this one fails on "reject the player's command" ]
		do that again while the rule failed;
	(At this point we ReParse); 
	bugfix now the current names list is the name list;
	now the number of words in the command	is the word count;
	now the parser's current word position is 1;
	[consider the convert to subject–verb–object format rule;  [ A hook for non-English player languages. ]]
	PARSE the player's input buffer into the player's parsed command;
	now the number of words in the command	is the word count;
[	k=0;]
	if trace 2, say the parsed command;
	now the verb's position is 1;
	now the person asked is the player;
	now the actor's scopewise location is the scope ceiling of the player;
	now the predicate's position is 0;
	(At this point we AlmostReParse);
	now the scope decider is the nothing rule;
	now the action to be is the default value of action names;
	now where the comma was found is 0;
	(At this point we BeginCommand);
	now the parser's current word position is the verb's position;
	now the verb is the next word if any;
	[ If there's no input here, we must have something like "person,". ]
	if the verb is no more words left to parse:
		now the best parser error so far is the didn't understand error;
		(go down to where we GiveError);
	[ Now try for "again" or "g", which are special cases: don't allow "again" if nothing
	! has previously been typed; simply copy the previous text across ]
	if the verb is 'AGAIN':
		if the player is not the person asked:
			issue the 20th response "To repeat a command like ~frog, jump~, just say ~again~, not ~frog, again~.";
			(go back up to where we ReType);
		if the number of letters in the AGAIN input buffer is 0:
			issue the 21st response "You can hardly repeat that.";
			(go back up to where we ReType);
		copy the AGAIN input buffer into the player's input buffer;
		PARSE the player's input buffer into the player's parsed command;
		now the number of words in the command is the word count;
		now the player's command is the empty snippet lengthened by the word count;
		(go back up to where we ReParse);
	copy the player's input buffer into the AGAIN input buffer;
	if the predicate's position is 0 [unknown]:
		let the new verb be using normal grammar;
		if the hidden personalized grammar of the person asked is not currently blank:
			now the new verb is the personalized grammar of the person asked considered;
			if trace 2, say " [bracket]Grammar property returned [new verb as a debugging number][close bracket][line break]";
		if the new verb is this created action:
			change the parser's returned action to the action in progress;
			change the parser's returned noun to the noun;
			change the parser's returned second noun to the second noun;
			if the second noun is not nothing:
				change the parser's returned parameter count to 2;
			otherwise if the noun is not nothing:
				change the parser's returned parameter count to 1;
			otherwise:
				change the parser's returned parameter count to 0;
			STOP;
		otherwise if the new verb is using normal grammar:
			now the parser's current word position is the verb's position;
			now the verb is the next word;
		otherwise:
			if the new verb would be an invalid understood word:
				now the predicate's position is the verb's position;
				now the new verb is the new verb without the tentatively;
			now the verb is the new verb as an understood word;
			decrement the parser's current word position;
			decrement the verb's position;
	otherwise:
		now the predicate's position is 0;
	[ Chapter - Parser Letter B ]  [Is the command a direction name, and so an implicit GO? If so, go to (K).]
	[#Ifdef LanguageIsVerb;
	if (verb_word == 0) {
		i = wn; verb_word = LanguageIsVerb(buffer, parse, verb_wordnum);
		wn = i;
	}
	#Endif; ! LanguageIsVerb]
	[ If the first word is not listed as a verb, it must be a direction or the name of someone to talk to ]
	if the [first word] verb is a word unknown by the game or the usages of the verb does not include being a verb:
		[ So is the first word an object contained in the special object "compass"
		! (i.e., a direction)?  This needs use of NounDomain, a routine which
		! does the object matching, returning the object number, or 0 if none found,
		! or REPARSE_CODE if it has restructured the parse table so the whole parse
		! must be begun again...]
		now the parser's current word position is the verb's position;
		now the indefinite article mode is false;
		now the noun filter is the nothing rule;
		now the number of parameters in the command is 0;
		save the person asked;
		save the action in progress;
		save the action to be;
		now the person asked is the player;
		now the action out of world is false;
		now the action in progress is the going action;
		now the action to be is the going action;
		let pu be the noun domain the compass and nothing under 'something';
		restore the action to be;
		restore the action in progress;
		restore the person asked;
		if pu is the misunderstood command:
			(go back up to where we ReParse);
		if pu is not noun domain's no match and pu as an object is a direction:
			change the parser's returned action to the going action;
			change the parser's returned noun to pu as an object; [line 100]
			change the parser's returned parameter count to 1;
			if any additional words present a problem:
				(go down to where we GiveError);
			STOP;
	[ !Chapter - Parser Letter C ]  [ Is anyone being addressed?]
	[ Only check for a comma (a "someone, do something" command) if we are
	! not already in the middle of one.  (This simplification stops us from
	! worrying about "robot, wizard, you are an idiot", telling the robot to
	! tell the wizard that he is an idiot.) ]
	if the player is the person asked:
		if where the comma was found is zero  and  the 'comma' is listed in the player's parsed command:
			now where the comma was found is where that word was found;
			[(At this point we have conversation);]
			if where that word was found is 1:
				issue the 22nd response "You can’t begin with a comma.";
				(go back up to where we ReType);
			[ Use NounDomain (in the context of "animate creature") to see if the words make sense as the name of someone held or nearby ]
			now the parser's current word position is 1;
			now the next token is 'something preferably held';
			now the reason for deciding scope is because we're parsing the addressee;
			let pu be the noun domain the player and the actor's scopewise location under 'someone';
			now the reason for deciding scope is because we're parsing the predicate nouns;
			if pu is the misunderstood command:
				(go back up to where we ReParse);
			if pu is noun domain's no match:
				if the verb is not a word unknown by the game and the usages of the verb includes being a verb:
					(go down to where we do not have conversation);
				otherwise:
					issue the 23rd response "You seem to want to talk to someone, but I can’t see whom.";
					(go back up to where we ReType);
			[(At this point we also have conversation);]  [ The object addressed must at least be "talkable" if not actually "animate" (the distinction allows, for instance, a microphone to be spoken to, without the parser thinking that the microphone is human).  ]
			unless pu as an object provides the property animate directly or pu as an object provides the property talkable directly:
				issue the 24th response "You can’t talk to that.";
				(go back up to where we ReType);
			[ Check that there aren't any mystery words between the end of the person's name and the comma (eg, throw out "dwarf sdfgsdgs, go north"). ]
			if the parser's current word position is not where the comma was found:
				if the verb is not a word unknown by the game and the usages of the verb includes being a verb:
					(Go down to where we do not have conversation);
				otherwise:
					issue the 25th response "To talk to someone, try ~someone, hello~ or some such."; 
					(go back up to where we ReType);
			[ Otherwise the player has now successfully named someone.  Adjust "him", "her", "it": ]
			set pronouns from pu as an object;
			now the verb's position is where the comma was found + 1; [ i.e., right after the comma ]
			[ Stop things like "me, again": ]
			if pu as an object is the player:	
				now the parser's current word position is the verb's position;
				if the next word if any is 'AGAIN':
					issue the 20th response "To repeat a command like ~frog, jump~, just say ~again~, not ~frog, again~.";
					(go back up to where we ReType);
			[ Set the global variable "actor", adjust the number of the first word, and begin parsing again from there. ]
			now the person asked is pu as an object;
			now the actor's scopewise location is the scope ceiling of the person asked;
			if trace 1, say "[bracket]Actor is [the person asked] in [the actor's scopewise location][close bracket][line break]";
			(go back up to where we BeginCommand);
	[ Chapter - Parser Letter D]  [Get the verb: try all the syntax lines for that verb.]
	(At this point we do not have conversation);
	if the verb is a word unknown by the game or the usages of the verb does not include being a verb:
		if the person asked is the player:
			now the verb is the missing verb for noun-only commands;
		if the person asked is not the player   or   the verb is a word unknown by the game:
			now the best parser error so far is the not a verb I recognise error;
			(go down to where we GiveError);  [ this will be converted to the Answering It About action for NPCs ]
	[.VerbAccepted;] [ We now definitely have a verb, not a direction, whether we got here by "take ..." or "person, take ..."  ]
	now action out of world is whether or not (the usages of the verb include being out of world);
	if the action out of world is true and the person asked is not the player:
		[issue the 74th response "(That command asks to do something outside of play, so it can 
only make sense from you to me. [The person asked] cannot be asked to do this.)";]
		now the best parser error so far is the not a verb I recognise error;
		now action out of world is false;
		(go down to where we GiveError);
	if trace 1, say "[bracket]Parsing for the verb ['][verb]['][close bracket][line break]"; [ ([the number of grammar lines + 1] lines)]
	now the pronoun used is no more words left to parse;
	now the pronoun reference object is the used-up object;
	now the best parser error so far is the didn't understand error;
	now the second-best parser error so far is the didn't understand error;
	we shouldn't process the multiple object list; 
	let allow multiple objects unconditionally be false;
	[ Chapter - Parser Letter E  ] [Break down a syntax line into analysed tokens.]
	repeat through the understand-as lines for the verb:
		now the chosen grammar is the verb's next understand-as line after the chosen grammar;
		now where inferring the pattern from is 0;
		now the number of parameters in the command is 0;
		now the count of non-objects is 0;
		now the numeric word is a word unknown by the game;
		change the multiple-object list to have 0 elements;
		now the kind of multi is 'something';
		now the latest parser error is the didn't understand error;
		now the parser's current word position is the verb's position + 1;
		if trace 1, say "[if the trace testing command setting is at least 2][line break][end if][bracket]line [chosen][the current grammar line][close bracket][line break]";
		[  PARSER LETTER F ]  [ Look ahead for advance warning for |multiexcept|/|multiinside|.]
		now the likely second noun is the used-up object;
		now the indefinite article mode is false;
		let how many parameters lookahead found be 0;
		now the understood command's current position is 0;
		let word be an understood word;
		[ begin Lookahead ]
		while this grammar element is not the end of line token:
			now the scope decider is the nothing rule;
			if this token's type is not '<understood word>':
				increment how many parameters lookahead found;
			if this token's type is '<grammar token>':
				if this grammar token is 'things':
					we now allow multiple objects unconditionally;
				if this grammar token is either 'other things' or 'things inside' and how many parameters lookahead found is 1:
					[ First non-preposition is "multiexcept" or "multiinside", so look ahead. ]
					if trace 2, say " [bracket]Trying look-ahead[close bracket][line break]";
					[ We need this to be followed by 1 or more prepositions. ]
					increment the understood command's current position;
					if this token's type is '<understood word>':
						[ skip ahead to a preposition word in the input ]
						(now the word is the next word) until the parser's current word position > the number of words in the command or (the word is not a word unknown by the game and the usages of the word include being a preposition);
						if the parser's current word position > the number of words in the command:
							if trace 2, say " [bracket]Look-ahead aborted: prepositions missing[close bracket][line break]";
							(go down to where our LineFailed);
					while this isn't done:
						if the word is one of the slashed synonyms that start at the (understood command's current position) position:
							now the understood command's current position is the understood command's current position advanced past the slashed synonyms;
						[otherwise:
							increment pcount;]
						otherwise:
							[ try to find another preposition word ]
							(now the word is the next word) until the parser's current word position >= the number of words in the command or (the word is not a word unknown by the game and the usages of the word include being a preposition);
							if the word is not a word unknown by the game and the usages of the word include being a preposition:
								increment the understood command's current position;  [line 200]
								next;
							[ lookahead failed ]
							if trace 2, say " [bracket]Look-ahead aborted: prepositions don't match[close bracket][line break]";
							(go down to where our LineFailed);
						now the word is the next word;
					do that again until this token's type is not '<understood word>';
					[ put back the non-preposition we just read ]
					decrement the parser's current word position;
					if this token's type is '<grammar token>' and this grammar token is 'something':
						now any problems is the result of parsing determiners like ALL\OTHER\FIVE\MY\THESE\HIS\THE\AN\SOME\etc; 
						unless any problems is no errors here:
							now the latest parser error is any problems;  [ don't allow multiple objects]
						let temp obj be the parser's returned noun; 
						save temp obj; 
						save the number of parameters in the command;
						now the number of parameters in the command is 1; 
						change the parser's returned noun to nothing;
						let pu be the noun domain actor's scopewise location and the person asked under 'something';
						restore the number of parameters in the command; 
						restore temp obj; 
						change the parser's returned noun to temp obj;
						if trace 2, say " [bracket]Advanced to 'something' token: [if pu is the misunderstood command]re-parse request[else if pu is noun domain's bunch of objects]but multiple found[else if pu is noun domain's no match]error [latest parser error][else if pu is currently an object][the pu as an object][end if][close bracket][line break]";
						if pu is the misunderstood command, (go back up to where we ReParse);
						if pu is currently an object, now the likely second noun is pu as an object;
			break; [while this grammar element is not the end of line token ]
		[ end LOOKAHEAD ]
		[ Slightly different line-parsing rules will apply to "take multi", to prevent "take all" behaving correctly but misleadingly when there's nothing to take.]
		now the TAKE ALL exception is 0;
		if we allow multiple objects unconditionally and the number of parameters for this line is 1 and the action to be is the taking action:
			now the TAKE ALL exception is 1;
		[ And now start again, properly, forearmed or not as the case may be.  As a precaution, we clear all the variables again (they may have been disturbed by the call to NounDomain, which may have called outside code, which may have done anything!). ]
		now where inferring the pattern from is at the 0th position;
		now the number of parameters in the command is 0;
		now the count of non-objects is 0; 
		now the numeric word is a word unknown by the game;
		change the multiple-object list to have 0 elements;
		now the latest parser error is the didn't understand error;
		now the parser's current word position is the verb's position + 1;
		[ Chapter - Parser Letter G] [Parse each token in turn (calling |ParseToken| to do most of the work). The |pattern| gradually accumulates what has been recognised so far, so that it may be reprinted by the parser later on.]
		now the understood command's current position is 0;
		repeat forever:  [ loops on pcount = 1 upward ]   [while this grammar element is not the end of line token?]
			increment the understood command's current position;
			change (the understood command's current position) element of the player's understood command to the null pattern; 
			now the scope decider is the nothing rule;
			let the token be (understood command's current position - 1) element of the grammar line tokens;
			let the lookahead be (understood command's current position) element of the grammar line tokens;
			if trace 2, say " [bracket]line [chosen] token [understood command's current position] word [parser's current word position] : [token][close bracket][line break]";
			if the token is not the end of line token:
				now the reason for deciding scope is because we're parsing the predicate nouns;
				split the token into the current grammar token & current token type;
				let pr be the parsing of current grammar token as current token type at (understood command's current position - 1) under the token;
				while the pr is at least reparsing as 'something' and reparsing as the end of line token is at least the pr:
					now pr is the parsing of (pr as a grammar token) as '<grammar token>' at 0 under 'something';
				now the reason for deciding scope is because we're parsing the predicate nouns;
				let pu be noun domain's no match[a pattern union];
				if pr is parse succeeds: 
					if the current token type is not '<understood word>' and (the current token type is not '<grammar token>' or the current grammar token is not 'text'): 
						decrement the number of parameters for this line;
					now pu is the pattern matched successfully;[1]
				otherwise if pr is at most parse fails:
					now pu is noun domain's no match;[0]
				otherwise if pr is not reparsing: 
					if pr is parse succeeds as the-K-understood: [1]
						if the count of non-objects is 0:
							now the first KOV parameter is the parsed number in question;
						otherwise:
							now the second KOV parameter is the parsed number in question;
						increment the count of non-objects; 
						now pu is the pattern matched successfully;[1] 
					otherwise if pr is the resulting objects: [2]
						now pu is a bunch of objects;[0] 
					otherwise:
						now pu is pr as an object as a successful match;
					change the parser's returned noun # (number of parameters in the command) to pu as an object; 
					increment the number of parameters in the command;
					change (the understood command's current position) element of the player's understood command to pu; 
					now pu is the pattern matched successfully;[1]
				if trace 3, say "  [bracket]token resulted in [if pr is reparsing]re-parse request[else if pu is the pattern matched successfully]success[else if pu is noun domain's no match]failure with error type [latest parser error as a debugging number][end if][close bracket][line break]";
				if pr is reparsing:
					(go back up to where we ReParse);
				if pu is noun domain's no match, break; [LineFailed]
			otherwise:
				[ If the player has entered enough already but there's still text to wade through: store the pattern away so as to be able to produce a decent error message if this turns out to be the best we ever manage, and in the mean time give up on this line.  However, if the superfluous text begins with a comma or "then" then take that to be the start of another instruction ]
				if the parser's current word position <= the number of words in the command:
					let word be the next word;
					if the word is the comma or the word is synonymous with 'THEN':
						we still have more to parse; 
						now the word position we held back at is the parser's current word position - 1;
					otherwise:
						copy 32 elements from the player's understood command to the player's saved understood command; 
						now the second understood command's current position is the understood command's current position;
						now latest parser error is the only understood as far as error;
						break;  [LineFailed]
				[ Now, we may need to revise the multiple object because of the single one we now know (but didn't when the list was drawn up). ]
				if the number of parameters in the command is at least 1 and the parser's returned noun is nothing:
					filter the multiple-object list by the grammar token & the parser's returned second noun;
					if the number of elements in the multiple-object list is 0:
						now the latest parser error is the nothing to do error; 
						change the parser's returned action to the action to be; 
						break;  [LineFailed]
				if the number of parameters in the command is at least 2 and the parser's returned second noun is nothing:
					filter the multiple-object list by the grammar token & the parser's returned noun;
					if the number of elements in the multiple-object list is 0:
						now the latest parser error is the nothing to do error; 
						break;  [LineFailed]
				[ To trap the case of "take all" inferring only "yourself" when absolutely nothing else is in the vicinity... ]
				if the TAKE ALL exception is 2 and the parser's returned noun is the person asked:
					now the best parser error so far is the nothing to do error;
					(go down to where we GiveError);
				LINE SUCCESSFULLY PARSED;  [line 300]
				[ ...and return from the parser altogether, having successfully matched a line.]
				if we still have more to parse:
					now the parser's current word position is the word position we held back at;
					if any additional words present a problem:
						(go down to where we GiveError);
				STOP; [SUCCESS!]
			[ end of " if the token is not the end of line token) ... otherwise ... " ]
		[ end of for(pcount++) (repeat forever) or,  while this grammar element is not the end of line token?  ]
		[ Chapter - Parser Letter H ]
		At this point our LineFailed;
		[ The line has failed to match. We continue the outer "for" loop, trying the next line in the grammar. ]
		if the latest parser error is more specific than best parser error so far:
			now the best parser error so far is the latest parser error;
		if the latest parser error is not the noun did not make sense in that context error and the latest parser error is more specific than the second-best parser error so far:
			now the second-best parser error so far is the latest parser error;
		[ ...unless the line was something like "take all" which failed because nothing matched the "all", in which case we stop and give an error now. ]
		if the TAKE ALL exception is 2 and the latest parser error is the nothing to do error, break;
	[ end of repeat through the understand-as lines for the verb: ]
	[ The grammar is exhausted: every line has failed to match.]
	At this point we GiveError;
	let what to do next be give a parser error;
	if what to do next is reparsing: 
		go back up to where we AlmostReParse;
	if what to do next is parse fails:
		go back up to where we ReType;
[	if what to do next is parse succeeds: [ with the Answering It That action ]
		stop.  [line 319]]

To LINE SUCCESSFULLY PARSED:
	if trace 1, say "[bracket]Line successfully parsed[close bracket][line break]";
	[ The line has successfully matched the text.  Declare the input error-free...]
	now where the previous typo's at is 0;
	[ ...explain any inferences made (using the pattern)... ]
	if where inferring the pattern from is not 0:
		clarify the parser's choice of the (where inferring the pattern from) -th element;
		reset the paragraph-breaking mechanism;
	[ ...copy the action number, and the number of parameters...]
	change the parser's returned action to the action to be;
	change the parser's returned parameter count to the number of parameters in the command;
	[ ...reverse first and second parameters if need be...]
	if the action's nouns swapped places is true and the number of parameters in the command is 2:
		let temp obj be the parser's returned noun;
		change the parser's returned noun to the parser's returned second noun;
		change the parser's returned second noun to the temp obj;
		if the count of non-objects is 2:
			let temp num be the first KOV parameter; 
			now first KOV parameter is the second KOV parameter;
			now second KOV parameter is the temp num;
	[ ...and to reset "it"-style objects to the first of these parameters, if there is one (and it really is an object)... ]
	if the number of parameters in the command > 0 and the parser's returned noun is not currently a kind-of-value, set pronouns from the parser's returned noun.


To decide what parser result is give a parser error (this is Parser__parse GiveError):
	now the latest parser error is the best parser error so far;
	if the person asked is not the player:
		if the predicate's position is not 0:
			now the verb's position is the predicate's position;
			decide on reparsing;
		change the parser's returned action to the ANSWERING IT THAT action;
		change the parser's returned noun to the person asked;
		change the parser's returned second noun to (parse succeeds as the-K-understood) as an object; 
		change the parser's returned parameter count to 2;
		now the parser's current word position is the verb's position;
		now the numeric word is the next word;
		if the numeric word is the comma:
			now the numeric word is the next word;
			increment the verb's position;
		now first KOV parameter is the numeric word as a number;
		now the person asked is the player;
		now the position of the topic understood is the verb's position;
		now the length of the topic understood is the number of words in the command + 1 - the position of the topic understood;
		decide on parse succeeds;
	otherwise if the latest parser error contains text:
		if the latest parser error issued as a low-level parser error is 0:
			consider the standard print parser error rule [instead];
	otherwise:
		if the verb's position is 0 and the latest parser error is the can’t see any such thing error: 
			now the latest parser error is the not a verb I recognise error;
		now the player's command is the empty snippet lengthened by the word count;
		begin the PRINTING A PARSER ERROR ACTIVITY;
		if handling the PRINTING A PARSER ERROR ACTIVITY:
			consider the standard print parser error rule;
		we should pending paragraph break;
		end the PRINTING A PARSER ERROR ACTIVITY;
		if we should call GiveError afterward:
			we no longer call GiveError afterward;
			decide on give a parser error;
	decide on parse fails.

Call GiveError afterward is a truth state that varies.
Call GiveError afterward is usually false.

[ this is PARSER LETTER I & J ]
Last for printing a parser error (this is the standard print parser error rule):
	now the pronoun used is the saved pronoun used; 
	now the pronoun reference object is the saved pronoun reference object;
	if the latest parser error is:
		-- didn’t understand error:
			issue the 27th response "I didn’t understand that sentence.";
			now where the previous typo's at is at the 1st position;
		-- only understood as far as error:
			issue the 28th response "I only understood you as far as wanting to ";
			copy 32 elements from the player's saved understood command to the player's understood command; 
			now the understood command's current position is the second understood command's current position;
			say "[recap of command from 0]";
			issue the 56th response ".";
		-- didn’t understand that number error:
			issue the 29th response "I didn’t understand that number.";
		-- can’t see any such thing error:
			issue the 30th response "You can’t see any such thing.";
			now where the previous typo's at is remember where the typo's at;
		-- said too little error:
			issue the 31st response "You seem to have said too little.";
		-- aren’t holding that error:
			issue the 32nd response "You aren’t holding that.";
			now where the previous typo's at is remember where the typo's at;
		-- can’t use multiple objects error:
			issue the 33rd response "You can’t use multiple objects with that verb."; [line 400]
		-- can only use multiple objects error:
			issue the 34th response "You can only use multiple objects once on a line.";
		-- not sure what it refers to error:
			issue the 35th response "I’m not sure what 'it' refers to.";
		-- excepted something not included error:
			issue the 36th response "You excepted something not included anyway!";
		-- can only do that to something animate error:
			issue the 37th response "You can only do that to something animate.";
		-- not a verb I recognise error: 
			issue the 38th response "That’s not a verb I recognise.";
		-- not something you need to refer to error:
			issue the 39th response "That’s not something you need to refer to in the course of this game.";
		-- can’t see it at the moment error:
			if the pronoun reference object is the used-up object:
				issue the 35th response "I'm not sure what 'it' refers to.";
			otherwise:
				issue the 40th response "You can't see 'it' (the chew toy) at the moment.";
		-- didn’t understand the way that finished error:
			issue the 41st response "I didn’t understand the way that finished.";
		-- not enough of those available error:
			issue the 42nd response with the number of items actually received ["Only X are available"];
		-- nothing to do error:
			if the parser's returned action is the removing it from action and the parser's returned second noun is currently an object:
				now the noun is the parser's returned second noun; [ ensure valid for messages ]
				if the noun provides the property animate directly:
					issue the 6th message for the taking action;
				otherwise unless the noun is a supporter or container:
					issue the 2nd message for the inserting it into action;
				otherwise if noun is a closed container:
					issue the 9th message for the taking action;
				otherwise if nothing is in the noun:
					issue the 6th message for the searching action;
				otherwise:
					change the parser's returned action to the default value of action names;
			if the parser's returned action is not the removing it from action: 
				if the number of items wanted previously wanted is 100:
					issue the 43rd response "Nothing to do!";
				otherwise:
					issue the 44th response "There are none at all available!";
		-- noun did not make sense in that context error:
			now the scope stage is please report the noun not making sense in this context;
			if the parser result produced by the context that this noun didn't make sense within is parse fails:
				now the best parser error so far is the second-best parser error so far;
				[unless the latest parser error contains text:
					end the PRINTING A PARSER ERROR ACTIVITY;]
				we should call GiveError afterward;
				[go back up to where  (give a parser error);]
		-- referred to a determination of scope error:
			issue the 73rd response "That noun did not make sense in this context.";
		-- I beg your pardon error:
			issue the 10th response "I beg your pardon?"  [448]


[Last thing: check for THEN and further instructions(s), return.  At this point, the return value is all prepared, and we are only looking to see if there is a "then" followed by subsequent instruction(s). ]
To decide if any additional words present a problem (this is Parser__parse Part K LookForMore):
	if the parser's current word position > the number of words in the command:
		no;
	let the word be the next word;
	if the word is synonymous with 'THEN' or the word is the comma:
		if the parser's current word position > the number of words in the command:
			we no longer have more to parse;
			no;
		[i = WordAddress(the verb's position);
		j = WordAddress(the parser's current word position);]
		let the saved position be the parser's current word position;
		shift the player's input buffer left by (the parser's current word position - the verb's position) starting at the parser's current word position;
		shift the AGAIN input buffer left by (the parser's current word position - the verb's position) starting at the parser's current word position; 
		PARSE the player's input buffer into the player's parsed command;
		now the parser's current word position is 1;
		[for (: i<j : i++) i->0 = ' ';]
		now the word is the next word;
[		if the word is 'AGAIN':
			[ Delete the words "then again" from the again buffer to prevent an infinite loop on "i. again" ]
[			i = WordAddress(the saved position - 2) - buffer;
			if (wn > num_words) j = INPUT_BUFFER_LEN-1;
			else j = WordAddress(the saved position) - buffer;
			for (: i<j : i++) buffer3->i = ' ';]
			shift the AGAIN input buffer left by the 1st word's length of the player's parsed command starting at the 1st word's length of the player's parsed command; 
		PARSE the player's input buffer into the player's parsed command;]
		we still have more to parse;
		no;
	now the best parser error so far is the only understood as far as error;
	yes.
[	decide on give a parser error.]  [466 lines]


[[[[[-).	]]]]]

Chapter - Personalized Grammars

[ With this we can, for a particular character or other "talkable" object, make it understand completely different things than normal.  It works by either setting the noun, the second noun, and the action in progress then returning 'this created action', or just by returning '<word> [tentatively] as the verb to use' with the verb to use instead. ]

An alternative grammar result is a kind of value.  
Some alternative grammar results are this created action.
To decide which alternative grammar result is using normal grammar: (- 0 -).
To decide which alternative grammar result is (verb - an understood word) as the verb to use:
 (- {verb} -).
To decide which alternative grammar result is (verb - an understood word) tentatively as the verb to use:
 (- (-{verb}) -).
To decide which understood word is (agr - an alternative grammar result) as an understood word: (-{agr}-).

To decide which alternative grammar result is (agr - an alternative grammar result) without the tentatively: (- (0 - {agr}) -).

To decide what rule producing an alternative grammar result valued property is the personalized grammar: (-grammar-).
To decide what alternative grammar result is (prop - a rule producing an alternative grammar result valued property) of (obj - an object) considered: (- RunRoutines({obj}, {prop}) -).

Section - alternative grammar - not for release

To say (agr - alternative grammar result):
	if agr is using normal grammar:
		say "using normal grammar";
	otherwise if agr would be an invalid understood word:
		say "tentatively the verb '[agr without the tentatively as an understood word]'";
	otherwise if agr is not this created action:
		say "the verb '[agr as an understood word]'";
	otherwise:
		say agr.

		

Chapter - original 

[ Parser__parse
	syntax line num_lines line_address i j k token l m;

	return ((+ Parser__parse +)-->1)();

	cobj_flag = 0;
	parser_results-->ACTION_PRES = 0;
	parser_results-->NO_INPS_PRES = 0;
	parser_results-->INP1_PRES = 0;
	parser_results-->INP2_PRES = 0;
	meta = false;


!Chapter - Parser Letter A

![Get the input, do OOPS and AGAIN.]

!Include (-
    if (held_back_mode == 1) {
        held_back_mode = 0;
        VM_Tokenise(buffer, parse);
        jump ReParse;
    }

  .ReType;  !  while the rule failed....   test-at-bottom loop

    cobj_flag = 0;
    actors_location = ScopeCeiling(player);
    BeginActivity(READING_A_COMMAND_ACT); 
    if (ForActivity(READING_A_COMMAND_ACT)==false) {
		Keyboard(buffer, parse);
		players_command = 100 + WordCount();
		num_words = WordCount();
    } 
    if (EndActivity(READING_A_COMMAND_ACT)) jump ReType;  ! if  reject the player's command,

  .ReParse;

    parser_inflection = name;

    ! Initially assume the command is aimed at the player, and the verb
    ! is the first word

    num_words = WordCount();
    wn = 1;

    #Ifdef LanguageToInformese;
    LanguageToInformese();
    ! Re-tokenise:
    VM_Tokenise(buffer,parse);
    #Endif; ! LanguageToInformese

    num_words = WordCount();

    k=0;
    #Ifdef DEBUG;
    if (parser_trace >= 2) {
        print "[ ";
        for (i=0 : i<num_words : i++) {

            #Ifdef TARGET_ZCODE;
            j = parse-->(i*2 + 1);
            #Ifnot; ! TARGET_GLULX
            j = parse-->(i*3 + 1);
            #Endif; ! TARGET_
            k = WordAddress(i+1);
            l = WordLength(i+1);
            print "~"; for (m=0 : m<l : m++) print (char) k->m; print "~ ";

            if (j == 0) print "?";
            else {
                #Ifdef TARGET_ZCODE;
                if (UnsignedCompare(j, HDR_DICTIONARY-->0) >= 0 &&
                    UnsignedCompare(j, HDR_HIGHMEMORY-->0) < 0)
                     print (address) j;
                else print j;
                #Ifnot; ! TARGET_GLULX
                if (j->0 == $60) print (address) j;
                else print j;
                #Endif; ! TARGET_
            }
            if (i ~= num_words-1) print " / ";
        }
        print " ]^";
    }
    #Endif; ! DEBUG
    verb_wordnum = 1;
    actor = player;
    actors_location = ScopeCeiling(player);
    usual_grammar_after = 0;

  .AlmostReParse;

    scope_token = 0;
    action_to_be = NULL;

    ! Begin from what we currently think is the verb word

  .BeginCommand;

    wn = verb_wordnum;
    verb_word = NextWordStopped();

    ! If there's no input here, we must have something like "person,".

    if (verb_word == -1) {
        best_etype = STUCK_PE;
        jump GiveError;
    }

    ! Now try for "again" or "g", which are special cases: don't allow "again" if nothing
    ! has previously been typed; simply copy the previous text across

    if (verb_word == AGAIN2__WD or AGAIN3__WD) verb_word = AGAIN1__WD;
    if (verb_word == AGAIN1__WD) {
        if (actor ~= player) {
            L__M(##Miscellany, 20);  !  "To repeat a command like ~frog, jump~, just say ~again~, not ~frog, again~."
            jump ReType;
        }
        #Ifdef TARGET_ZCODE;
        if (buffer3->1 == 0) {
            L__M(##Miscellany, 21);  !  "You can hardly repeat that."
            jump ReType;
        }
        #Ifnot; ! TARGET_GLULX
        if (buffer3-->0 == 0) {
            L__M(##Miscellany, 21);  !  "You can hardly repeat that."
            jump ReType;
        }
        #Endif; ! TARGET_
        for (i=0 : i<INPUT_BUFFER_LEN : i++) buffer->i = buffer3->i;
        VM_Tokenise(buffer, parse);
		num_words = WordCount();
    	players_command = 100 + WordCount();
		jump ReParse;
    }

    ! Save the present input in case of an "again" next time

    if (verb_word ~= AGAIN1__WD)
        for (i=0 : i<INPUT_BUFFER_LEN : i++) buffer3->i = buffer->i;

    if (usual_grammar_after == 0) {
        j = verb_wordnum;
        i = RunRoutines(actor, grammar); 
        #Ifdef DEBUG;
        if (parser_trace >= 2 && actor.grammar ~= 0 or NULL)
            print " [Grammar property returned ", i, "]^";
        #Endif; ! DEBUG

        if ((i ~= 0 or 1) && (VM_InvalidDictionaryAddress(i))) {
            usual_grammar_after = verb_wordnum; i=-i;
        }

        if (i == 1) {
            parser_results-->ACTION_PRES = action;
            parser_results-->NO_INPS_PRES = 0;
            parser_results-->INP1_PRES = noun;
            parser_results-->INP2_PRES = second;
            if (noun) parser_results-->NO_INPS_PRES = 1;
            if (second) parser_results-->NO_INPS_PRES = 2;
            rtrue;
        }
        if (i ~= 0) { verb_word = i; wn--; verb_wordnum--; }
        else { wn = verb_wordnum; verb_word = NextWord(); }
    }
    else usual_grammar_after = 0;


!Chapter - Parser Letter B

![Is the command a direction name, and so an implicit GO? If so, go to (K).]

!Include (-
    #Ifdef LanguageIsVerb;
    if (verb_word == 0) {
        i = wn; verb_word = LanguageIsVerb(buffer, parse, verb_wordnum);
        wn = i;
    }
    #Endif; ! LanguageIsVerb

    ! If the first word is not listed as a verb, it must be a direction
    ! or the name of someone to talk to

    if (verb_word == 0 || ((verb_word->#dict_par1) & (+ being a verb +)) == 0) {

        ! So is the first word an object contained in the special object "compass"
        ! (i.e., a direction)?  This needs use of NounDomain, a routine which
        ! does the object matching, returning the object number, or 0 if none found,
        ! or REPARSE_CODE if it has restructured the parse table so the whole parse
        ! must be begun again...

        wn = verb_wordnum; indef_mode = false; token_filter = 0; parameters = 0;
        @push actor; @push action; @push action_to_be;
        actor = player; meta = false; action = ##Go; action_to_be = ##Go;
        l = NounDomain(compass, 0, 0);
        @pull action_to_be; @pull action; @pull actor;
        if (l == REPARSE_CODE) jump ReParse;

        ! If it is a direction, send back the results:
        ! action=GoSub, no of arguments=1, argument 1=the direction.

        if ((l~=0) && (l ofclass K3_direction)) {
            parser_results-->ACTION_PRES = ##Go;
            parser_results-->NO_INPS_PRES = 1;
            parser_results-->INP1_PRES = l;
            jump LookForMore;
        }

    } ! end of first-word-not-a-verb


!Chapter - Parser Letter C

![Is anyone being addressed?]

!Include (-
	! Only check for a comma (a "someone, do something" command) if we are
	! not already in the middle of one.  (This simplification stops us from
	! worrying about "robot, wizard, you are an idiot", telling the robot to
	! tell the wizard that he is an idiot.)
	
	if (actor == player) {
		for (j=2 : j<=num_words : j++) {
			i=NextWord();
			if (i == comma_word) jump Conversation;
		}
	}
	jump NotConversation;
	
	! NextWord nudges the word number wn on by one each time, so we've now
	! advanced past a comma.  (A comma is a word all on its own in the table.)
	
	.Conversation;
	
	j = wn - 1;
	if (j == 1) {
		L__M(##Miscellany, 22);  !  "You can’t begin with a comma."
		jump ReType;
	}
	
	! Use NounDomain (in the context of "animate creature") to see if the
	! words make sense as the name of someone held or nearby
	
	wn = 1; lookahead = HELD_TOKEN;
	scope_reason = TALKING_REASON;
	l = NounDomain(player, actors_location,6);
	scope_reason = PARSING_REASON;
	if (l == REPARSE_CODE) jump ReParse;
	if (l == 0) {
		if (verb_word && ((verb_word->#dict_par1) & (+ being a verb +))) jump NotConversation;
		L__M(##Miscellany, 23);  !  "You seem to want to talk to someone, but I can’t see whom."
		jump ReType;
	}
	
	.Conversation2;
	
	! The object addressed must at least be "talkable" if not actually "animate"
	! (the distinction allows, for instance, a microphone to be spoken to,
	! without the parser thinking that the microphone is human).
	
	if (l hasnt animate && l hasnt talkable) {
		L__M(##Miscellany, 24, l);   !  "You can’t talk to ", (the) x1, "."
		jump ReType;
	}
	
	! Check that there aren't any mystery words between the end of the person's
	! name and the comma (eg, throw out "dwarf sdfgsdgs, go north").
	
	if (wn ~= j) {
		if (verb_word && ((verb_word->#dict_par1) & (+ being a verb +))) jump NotConversation;
		L__M(##Miscellany, 25);   !  "To talk to someone, try ~someone, hello~ or some such."; 
		jump ReType;
	}
	
	! The player has now successfully named someone.  Adjust "him", "her", "it":
	
	PronounNotice(l);
	
	! Set the global variable "actor", adjust the number of the first word,
	! and begin parsing again from there.
	
	verb_wordnum = j + 1;
	
	! Stop things like "me, again":
	
	if (l == player) {
		wn = verb_wordnum;
		if (NextWordStopped() == AGAIN1__WD or AGAIN2__WD or AGAIN3__WD) {
			L__M(##Miscellany, 20);     !   "To repeat a command like ~frog, jump~, just say ~again~, not ~frog, again~.";
			jump ReType;
		}
	}
	
	actor = l;
	actors_location = ScopeCeiling(l);
	#Ifdef DEBUG;
	if (parser_trace >= 1)
		print "[Actor is ", (the) actor, " in ", (name) actors_location, "]^";
	#Endif; ! DEBUG
	jump BeginCommand;


!Chapter - Parser Letter D

![Get the verb: try all the syntax lines for that verb.]

!Include (-
	.NotConversation;
	if (verb_word == 0 || ((verb_word->#dict_par1) & (+being a verb+)) == 0) {
		if (actor == player) {
			verb_word = UnknownVerb(verb_word);
			if (verb_word ~= 0) jump VerbAccepted;
		}
		best_etype = VERB_PE;
		jump GiveError;
	}
	.VerbAccepted;

    ! We now definitely have a verb, not a direction, whether we got here by the
    ! "take ..." or "person, take ..." method.  Get the meta flag for this verb:

    meta = ((verb_word->#dict_par1) & (+being out of world+))/(+being out of world+);

    ! You can't order other people to "full score" for you, and so on...

    if (meta == 1 && actor ~= player) {
        best_etype = VERB_PE;
        meta = 0;
        jump GiveError;
    }

    ! Now let i be the corresponding verb number...

    i = DictionaryWordToVerbNum(verb_word);

    ! ...then look up the i-th entry in the verb table to get the address of the verb's syntax
    ! table...

    syntax = VM_CommandTableAddress(i);

    ! ...and then see how many lines (ie, different patterns corresponding to the
    ! same verb) are stored in the parse table...

    num_lines = (syntax->0) - 1;

    ! ...and now go through them all, one by one.
    ! To prevent pronoun_word 0 being misunderstood,

    pronoun_word = NULL; pronoun_obj = NULL;

    #Ifdef DEBUG;
    if (parser_trace >= 1)
    	print "[Parsing for the verb '", (address) verb_word, "' (", num_lines+1, " lines)]^";
    #Endif; ! DEBUG

    best_etype = STUCK_PE; nextbest_etype = STUCK_PE;
    multiflag = false;

    ! "best_etype" is the current failure-to-match error - it is by default
    ! the least informative one, "don't understand that sentence".
    ! "nextbest_etype" remembers the best alternative to having to ask a
    ! scope token for an error message (i.e., the best not counting ASKSCOPE_PE).
    ! multiflag is used here to prevent inappropriate MULTI_PE errors
    ! in addition to its unrelated duties passing information to action routines


!Chapter - Parser Letter E

![Break down a syntax line into analysed tokens.]

!Include (-
    line_address = syntax + 1;

    for (line=0 : line<=num_lines : line++) {

!        for (i=0 : i<32 : i++) {     ! this is done inside UnpackGrammarLine(), which follows.
!            line_token-->i = ENDIT_TOKEN;
!            line_ttype-->i = ELEMENTARY_TT;
!            line_tdata-->i = ENDIT_TOKEN;
!        }

        ! Unpack the syntax line from Inform format into three arrays; ensure that
        ! the sequence of tokens ends in an ENDIT_TOKEN.

        line_address = UnpackGrammarLine(line_address);

        #Ifdef DEBUG;
        if (parser_trace >= 1) {
            if (parser_trace >= 2) new_line;
            print "[line ", line; DebugGrammarLine();  ! say current grammar line;
            print "]^";
        }
        #Endif; ! DEBUG

        ! We aren't in "not holding" or inferring modes, and haven't entered
        ! any parameters on the line yet, or any special numbers; the multiple
        ! object is still empty.

        inferfrom = 0;
        parameters = 0;
        nsns = 0; special_word = 0;
        multiple_object-->0 = 0;
        multi_context = 0;
        etype = STUCK_PE;

        ! Put the word marker back to just after the verb

        wn = verb_wordnum+1;


!Chapter - Parser Letter F

![Look ahead for advance warning for |multiexcept|/|multiinside|.

!There are two special cases where parsing a token now has to be affected by
!the result of parsing another token later, and these two cases (multiexcept
!and multiinside tokens) are helped by a quick look ahead, to work out the
!future token now. We can only carry this out in the simple (but by far the
!most common) case:
       
!	|multiexcept <one or more prepositions> noun|
        
!and similarly for |multiinside|.]

!Include (-
        advance_warning = -1; indef_mode = false;
        for (i=0,m=false,pcount=0 : line_token-->pcount ~= ENDIT_TOKEN : pcount++) {
            scope_token = 0;

            if (line_ttype-->pcount ~= PREPOSITION_TT) i++;

            if (line_ttype-->pcount == ELEMENTARY_TT) {
                if (line_tdata-->pcount == MULTI_TOKEN) m = true;
                if (line_tdata-->pcount == MULTIEXCEPT_TOKEN or MULTIINSIDE_TOKEN  && i == 1) {
                    ! First non-preposition is "multiexcept" or
                    ! "multiinside", so look ahead.

                    #Ifdef DEBUG;
                    if (parser_trace >= 2) print " [Trying look-ahead]^";
                    #Endif; ! DEBUG

                    ! We need this to be followed by 1 or more prepositions.

                    pcount++;
                    if (line_ttype-->pcount == PREPOSITION_TT) {
                        ! skip ahead to a preposition word in the input
                        do {
                            l = NextWord();
                        } until ((wn > num_words) ||
                                 (l && (l->#dict_par1) & (+being a preposition+) ~= 0));
                        
                        if (wn > num_words) {
                            #Ifdef DEBUG;
                            if (parser_trace >= 2)
                                print " [Look-ahead aborted: prepositions missing]^";
                            #Endif;
                            jump LineFailed;
                        }
                        
                        do {
                            if (PrepositionChain(l, pcount) ~= false) {
                                ! advance past the chain
                                if ((line_token-->pcount)->0 & $20 ~= 0) {
                                    pcount++;
                                    while ((line_token-->pcount ~= ENDIT_TOKEN) &&
                                           ((line_token-->pcount)->0 & $10 ~= 0))
                                        pcount++;
                                } else {
                                    pcount++;
                                }
                            } else {
                                ! try to find another preposition word
                                do {
                                    l = NextWord();
                                } until ((wn >= num_words) ||
                                         (l && (l->#dict_par1) & (+being a preposition+) ~= 0));
                                
                                if (l && (l->#dict_par1) & (+being a preposition+)) continue;
                                
                                ! lookahead failed
                                #Ifdef DEBUG;
                                if (parser_trace >= 2)
                                    print " [Look-ahead aborted: prepositions don't match]^";
                                #endif;
                                jump LineFailed;
                            }
                            l = NextWord();
                        } until (line_ttype-->pcount ~= PREPOSITION_TT);
                        
                        ! put back the non-preposition we just read
                        wn--;

                        if ((line_ttype-->pcount == ELEMENTARY_TT) &&
                        	(line_tdata-->pcount == NOUN_TOKEN)) {
                            l = Descriptors();  ! skip past THE etc
                            if (l~=0) etype=l;  ! don't allow multiple objects
                        	k = parser_results-->INP1_PRES; @push k; @push parameters;
                        	parameters = 1; parser_results-->INP1_PRES = 0;
                            l = NounDomain(actors_location, actor, NOUN_TOKEN);
                            @pull parameters; @pull k; parser_results-->INP1_PRES = k;
                            #Ifdef DEBUG;
                            if (parser_trace >= 2) {
                                print " [Advanced to ~noun~ token: ";
                                if (l == REPARSE_CODE) print "re-parse request]^";
                                else {
                                	if (l == 1) print "but multiple found^";
                                	if (l == 0) print "error ", etype, "^";
                                	if (l >= 2) print (the) l, "^";
                                }
                            }
                            #Endif; ! DEBUG
                            if (l == REPARSE_CODE) jump ReParse;
                            if (l >= 2) advance_warning = l;
                        }
                    }
                    break;
                }
            }
        }

        ! Slightly different line-parsing rules will apply to "take multi", to
        ! prevent "take all" behaving correctly but misleadingly when there's
        ! nothing to take.

        take_all_rule = 0;
        if (m && params_wanted == 1 && action_to_be == ##Take)
            take_all_rule = 1;

        ! And now start again, properly, forearmed or not as the case may be.
        ! As a precaution, we clear all the variables again (they may have been
        ! disturbed by the call to NounDomain, which may have called outside
        ! code, which may have done anything!).

        inferfrom = 0;
        parameters = 0;
        nsns = 0; special_word = 0;
        multiple_object-->0 = 0;
        etype = STUCK_PE;
        wn = verb_wordnum+1;


!Chapter - Parser Letter G

![Parse each token in turn (calling |ParseToken| to do most of the work).

!The |pattern| gradually accumulates what has been recognised so far,
!so that it may be reprinted by the parser later on.]

!Include (-
        for (pcount=1 : : pcount++) {
            pattern-->pcount = PATTERN_NULL; scope_token = 0;

            token = line_token-->(pcount-1);
            lookahead = line_token-->pcount;

            #Ifdef DEBUG;
            if (parser_trace >= 2)
                print " [line ", line, " token ", pcount, " word ", wn, " : ", (DebugToken) token,
                  "]^";
            #Endif; ! DEBUG

            if (token ~= ENDIT_TOKEN) {

                scope_reason = PARSING_REASON;
                AnalyseToken(token);
                l = ParseToken(found_ttype, found_tdata, pcount-1, token);
                while ((l >= GPR_NOUN) && (l < -1)) 
			l = ParseToken(ELEMENTARY_TT, l + 256);
                scope_reason = PARSING_REASON;

		if (l == GPR_PREPOSITION) 
		{
                    if (found_ttype~=PREPOSITION_TT && (found_ttype~=ELEMENTARY_TT ||
                        found_tdata~=TOPIC_TOKEN)) params_wanted--;
                    l = true;
                }
                else if (l < 0) 
			l = false;
              	else if (l ~= GPR_REPARSE) 
		{
                            if (l == GPR_NUMBER) {
                                if (nsns == 0) special_number1 = parsed_number;
                                else special_number2 = parsed_number;
                                nsns++; 
                                l = 1;
                            }
                            if (l == GPR_MULTIPLE) 
				l = 0;
                            parser_results-->(parameters+INP1_PRES) = l;
                            parameters++;
                            pattern-->pcount = l;
                            l = true;
             	}

                #Ifdef DEBUG;
                if (parser_trace >= 3) {
                    print "  [token resulted in ";
                    if (l == REPARSE_CODE) print "re-parse request]^";
                    if (l == 0) print "failure with error type ", etype, "^";
                    if (l == 1) print "success^";
                }
                #Endif; ! DEBUG

                if (l == REPARSE_CODE) jump ReParse;
                if (l == false) break;
            }
            else {

                ! If the player has entered enough already but there's still
                ! text to wade through: store the pattern away so as to be able to produce
                ! a decent error message if this turns out to be the best we ever manage,
                ! and in the mean time give up on this line

                ! However, if the superfluous text begins with a comma or "then" then
                ! take that to be the start of another instruction

                if (wn <= num_words) {
                    l = NextWord();
                    if (l == THEN1__WD or THEN2__WD or THEN3__WD or comma_word) {
                        held_back_mode = 1; hb_wn = wn-1;
                    }
                    else {
                        for (m=0 : m<32 : m++) pattern2-->m = pattern-->m;
                        pcount2 = pcount;
                        etype = UPTO_PE;
                        break;
                    }
                }

                ! Now, we may need to revise the multiple object because of the single one
                ! we now know (but didn't when the list was drawn up).

                if (parameters >= 1 && parser_results-->INP1_PRES == 0) {
                    l = ReviseMulti(parser_results-->INP2_PRES);
                    if (l ~= 0) { etype = l; parser_results-->ACTION_PRES = action_to_be; break; }
                }
                if (parameters >= 2 && parser_results-->INP2_PRES == 0) {
                    l = ReviseMulti(parser_results-->INP1_PRES);
                    if (l ~= 0) { etype = l; break; }
                }

                ! To trap the case of "take all" inferring only "yourself" when absolutely
                ! nothing else is in the vicinity...

                if (take_all_rule == 2 && parser_results-->INP1_PRES == actor) {
                    best_etype = NOTHING_PE;
                    jump GiveError;
                }

                #Ifdef DEBUG;
                if (parser_trace >= 1) print "[Line successfully parsed]^";
                #Endif; ! DEBUG

                ! The line has successfully matched the text.  Declare the input error-free...

                oops_from = 0;

                ! ...explain any inferences made (using the pattern)...
                if (inferfrom ~= 0) {
                	PrintInferredCommand(inferfrom);
                    ClearParagraphing();
                }

                ! ...copy the action number, and the number of parameters...

                parser_results-->ACTION_PRES = action_to_be;
                parser_results-->NO_INPS_PRES = parameters;

                ! ...reverse first and second parameters if need be...

                if (action_reversed && parameters == 2) {
                    i = parser_results-->INP1_PRES;
                    parser_results-->INP1_PRES = parser_results-->INP2_PRES;
                    parser_results-->INP2_PRES = i;
                    if (nsns == 2) {
                        i = special_number1; special_number1 = special_number2;
                        special_number2 = i;
                    }
                }

                ! ...and to reset "it"-style objects to the first of these parameters, if
                ! there is one (and it really is an object)...

                if (parameters > 0 && parser_results-->INP1_PRES >= 2)
                    PronounNotice(parser_results-->INP1_PRES);

                ! ...and return from the parser altogether, having successfully matched
                ! a line.

                if (held_back_mode == 1) {
                    wn=hb_wn;
                    jump LookForMore;
                }
                rtrue;

            } ! end of if(token ~= ENDIT_TOKEN) else
        } ! end of for(pcount++)

        .LineFailed;
        ! The line has failed to match.
        ! We continue the outer "for" loop, trying the next line in the grammar.

        if (etype > best_etype) best_etype = etype;
        if (etype ~= ASKSCOPE_PE && etype > nextbest_etype) nextbest_etype = etype;

        ! ...unless the line was something like "take all" which failed because
        ! nothing matched the "all", in which case we stop and give an error now.

        if (take_all_rule == 2 && etype==NOTHING_PE) break;

    } ! end of for(line++)

    ! The grammar is exhausted: every line has failed to match.


!Chapter - Parser Letter H

![Cheaply parse otherwise unrecognised conversation and return.

!(Errors are handled differently depending on who was talking. If the command
!was addressed to somebody else (eg, DWARF, SFGH) then it is taken as
!conversation which the parser has no business in disallowing.)

!The parser used to return the fake action |##NotUnderstood| when a
!command in the form PERSON, ARFLE BARFLE GLOOP is parsed, where a character
!is addressed but with an instruction which the parser can't understand.
!(If a command such as ARFLE BARFLE GLOOP is not an instruction to someone
!else, the parser prints an error and requires the player to type another
!command: thus |##NotUnderstood| was only returned when |actor| is not the
!player.) And I6 had elaborate object-oriented ways to deal with this, but we
!won't use any of that: we simply convert to a |##Answer| action, which
!communicates a snippet of words to another character, just as if the
!player had typed ANSWER ARFLE BARFLE GLOOP TO PERSON. For I7 purposes, the
!fake action |##NotUnderstood| does not exist.]

!Include (-
  .GiveError;

    etype = best_etype;
    if (actor ~= player) {
        if (usual_grammar_after ~= 0) {
            verb_wordnum = usual_grammar_after;
            jump AlmostReParse;
        }
        wn = verb_wordnum;
        special_word = NextWord();
        if (special_word == comma_word) {
            special_word = NextWord();
            verb_wordnum++;
        }
        parser_results-->ACTION_PRES = ##Answer;
        parser_results-->NO_INPS_PRES = 2;
        parser_results-->INP1_PRES = actor;
        parser_results-->INP2_PRES = 1; special_number1 = special_word;
        actor = player;
        consult_from = verb_wordnum; consult_words = num_words-consult_from+1;
        rtrue;
    }


!Chapter - Parser Letter I

![Print best possible error message.]

!Include (-
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
    if (etype == UPTO_PE) {     L__M(##Miscellany, 28);
        for (m=0 : m<32 : m++) pattern-->m = pattern2-->m;
        pcount = pcount2; PrintCommand(0); L__M(##Miscellany, 56);
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
        scope_stage = (+ please report the noun not making sense in this context +);
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


!Chapter - Parser Letter J

![Retry the whole lot.]

!Include (-
    ! And go (almost) right back to square one...

    jump ReType;

    ! ...being careful not to go all the way back, to avoid infinite repetition
    ! of a deferred command causing an error.


!Chapter - Parser Letter K

![Last thing: check for THEN and further instructions(s), return.]

!Include (-
    ! At this point, the return value is all prepared, and we are only looking
    ! to see if there is a "then" followed by subsequent instruction(s).

  .LookForMore;

    if (wn > num_words) rtrue;

    i = NextWord();
    if (i == THEN1__WD or THEN2__WD or THEN3__WD or comma_word) {
        if (wn > num_words) {
           held_back_mode = false;
           return;
        }
        i = WordAddress(verb_wordnum);
        j = WordAddress(wn);
        for (: i<j : i++) i->0 = ' ';
        i = NextWord();
        if (i == AGAIN1__WD or AGAIN2__WD or AGAIN3__WD) {
            ! Delete the words "then again" from the again buffer,
            ! in which we have just realised that it must occur:
            ! prevents an infinite loop on "i. again"

            i = WordAddress(wn-2)-buffer;
            if (wn > num_words) j = INPUT_BUFFER_LEN-1;
            else j = WordAddress(wn)-buffer;
            for (: i<j : i++) buffer3->i = ' ';
        }
        VM_Tokenise(buffer,parse);
        held_back_mode = true;
        return;
    }
    best_etype = UPTO_PE;
    jump GiveError;


]



Book - Tokens

Chapter - Parse Token

[The main parsing routine above tried a sequence of ``grammar lines'' in turn,
matching each against the text typed until one fitted. A grammar line is
itself a sequence of ``grammar tokens''. Here we have to parse the tokens.

|ParseToken(type, data)| tries the match text beginning at the current
word marker |wn| against a token of the given |type|, with the given |data|.
The optional further arguments |token_n| and |token| supply the token
number in the current grammar line (because some tokens do depend on what
has happened before or is needed later) and the address of the dictionary
word which makes up the |token|, in the case where it's a ``preposition''.

The return values are:
(a) |GPR_REPARSE| for ``I have rewritten the command, please re-parse from scratch'';
(b) |GPR_PREPOSITION| for ``token accepted with no result'';
(c) $-256 + x$ for ``please parse |ParseToken(ELEMENTARY_TT, x)| instead'';
(d) 0 for ``token accepted, result is the multiple object list'';
(e) 1 for ``token accepted, result is the number in |parsed_number|'';
(f) an object number for ``token accepted with this object as result'';
(g) $-1$ for ``token rejected''.

Strictly speaking |ParseToken| is a shell routine which saves the current
state on the stack, and calling |ParseToken__| to do the actual work.

Once again the routine is traditionally divided into six letters, here named under
paragraphs ``Parse Token Letter A'', and so on.

(A) Analyse the token; handle all tokens not involving object lists and
break down others into elementary tokens
(B) Begin parsing an object list
(C) Parse descriptors (articles, pronouns, etc.) in the list
(D) Parse an object name
(E) Parse connectives (AND, BUT, etc.) and go back to (C)
(F) Return the conclusion of parsing an object list]

[ Called from Number.i6t ]
[ ParseTokenStopped x y; 
	if (wn>WordCount()) return GPR_FAIL; 
	return ParseToken(x,y); 
]

To decide what parser result is the parsing of (y - a grammar token) as (x - token type) if any (this is ParseTokenStopped):
	if the parser's current word position > the word count, decide on parse fails;
	decide on the parsing of y as x at 0 under 'something'.

The parse token nesting level is a number that varies. 
The parse token nesting level variable translates into I6 as "parsetoken_nesting".
Include (- Global parsetoken_nesting = 0; -).

To decide what parser result is the parsing of (y - a grammar token) as (x - a token type) at (pcount - number) under (token - a grammar token) (this is ParseToken):
	let temp be an object;
	let tempnum be a number;
	if the parse token nesting level > 0:
		save the next word to parse's position;
		save the noun filter;
		save the number of words matched per object ;
		save the number of match groups;
		save where the previous typo's at;
		repeat through the match list of size the number of objects in the match list:
			now temp is the match list element;
			save temp;
			now tempnum is the match list's groups element;
			save tempnum;
			now tempnum is the the match score list element;
			save tempnum;
		save the number of objects in the match list;
	increment the parse token nesting level;
	let rv be the actual parsing of y as x at pcount and token;
	decrement the parse token nesting level;
	if the parse token nesting level > 0:
		restore the number of objects in the match list;
		repeat through the match list of size the number of objects in the match list:
			restore tempnum;
			change the match score list element to tempnum;
			restore tempnum;
			change the match list's groups element to tempnum;
			restore temp;
			change the match list element to temp;
		restore where the previous typo's at;
		restore the number of match groups;
		restore the number of words matched per object ;
		restore the noun filter;
		restore the next word to parse's position;
	decide on rv.

[ ParseToken given_ttype given_tdata token_n token  i t rv;
	if (parsetoken_nesting > 0) {
		! save match globals
		@push match_from; @push token_filter; @push match_length;
		@push number_of_classes; @push oops_from;
		for (i=0: i<number_matched: i++) {
			t = match_list-->i; @push t;
			t = match_classes-->i; @push t;
			t = match_scores-->i; @push t;
		}
		@push number_matched;
	 }

	parsetoken_nesting++;
	rv = ParseToken__(given_ttype, given_tdata, token_n, token);
	parsetoken_nesting--;

	if (parsetoken_nesting > 0) {
		! restore match globals
		@pull number_matched;
		for (i=0: i<number_matched: i++) {
 			@pull t; match_scores-->i = t;
			@pull t; match_classes-->i = t;
			@pull t; match_list-->i = t;
   		}
		@pull oops_from; @pull number_of_classes;
		@pull match_length; @pull token_filter; @pull match_from;
	}
	return rv;
]


Chapter - Parse Token Letter A

[Analyse token; handle all not involving object lists, break down others.]

Section - Parse Token - not for release

To say that (obj - a pattern union) matched with (former list size - a number):
	if obj is currently an object:
		say "  [bracket]ND returned [obj as an object][close bracket][line break]";
	otherwise:
		say "  [bracket]ND appended to the multiple object list:[line break]";
		increment the former list size ; [not really, just makes the printout neater & more correct. ]
		repeat through the multiple-object list starting at the former list size:
			say "  Entry [chosen]: [the multiple-object list element] ([the multiple-object list element as a debugging number])[line break]";
		say "  List now has size [number of elements in the multiple-object list][close bracket][line break]".

Section - Parse Token__

To decide if (token - a grammar token) isn't a first slashed synonym: 
(- (({token}->0) & (+last slashed synonym+)) -).

To decide what parser result is the actual parsing of (y[given_tdata] - a grammar token) as (x[given_ttype] - a token type) at (this - number) and (token - a grammar token) (this is ParseToken__ Part A): 
	now the noun filter is the nothing rule;
	bugfix now the current names list is the name list;
	let the very next be this + 1;
	let the word be an understood word;
	if x is:
		-- '<grammar token>':
			if y is:
				-- 'understood word': [Either a number or understood word. Usually the latter despite the return value.]
					now the number understood is the number typed in by the player at the parser's current word position;
					now the numeric word is the next word;
					if the number understood is not -1000:
						if trace 3, say "  [bracket]Read special as the number [the number understood][close bracket][line break]";
					if the number understood is -1000:
						if trace 3, say "  [bracket]Read special word at word number [parser's current word position][line break]";
						now the understood word understood is the numeric word;
					decide on the parse succeeds as the-K-understood;
				-- 'number':
					now the number understood is the number typed in by the player at the parser's current word position;
					increment the parser's current word position;
					if the number understood is -1000:
						issue "I didn't understand that number." as the didn’t understand that number error; 
						decide on parse fails;
					if trace 3, say "  [bracket]Read number as [the number understood][close bracket][line break]";
					decide on the parse succeeds as the-K-understood;
				-- 'text':
					now the position of the topic understood is the parser's current word position;
					unless the very next element of the grammar line types is '<understood word>' or the very next element of the grammar line tokens is the end of line token:
						issue the 13th run-time message "A ’topic’ token can only be followed by a preposition." [...or the end of the line ];
					while this isn't done:
						now the word is the next word if any;
					do that again until the word is no more words left to parse OR the word is one of the slashed synonyms that start at the very next position;
					decrement the parser's current word position;
					now the length of the topic understood is the parser's current word position - the position of the topic understood;
					if the length of the topic understood is 0, decide on parse fails;
					if the action to be is either the asking it about action or the answering it that action or the telling it about action: [not sure what this is doing. Turns topic understood to a single word? ]
						let the saved spot be the parser's current word position;
						now the parser's current word position is the position of the topic understood;
						now the understood word understood is the next word;
						now the parser's current word position is the saved spot;
						decide on the parse succeeds as the-K-understood;
					if the word is no more words left to parse and the very next element of the grammar line types is '<understood word>':
						decide on parse fails; [ don't infer if required preposition is absent ]
					decide on parse succeeds;
				-- 'someone':
					if the action to be is either the asking it about action or the answering it that action or the telling it about action or the asking it for action:
						now the reason for deciding scope is because we're parsing the addressee;
		-- '<understood word>':   [PREPOSITION_TT]
			[ Is it an unnecessary alternative preposition, when a previous choice has already been matched? ]
			if the token isn't a first slashed synonym, decide on parse succeeds;
			[ If we've run out of the player's input, but still have parameters to specify, we go into "infer" mode, remembering where we are and the preposition we are inferring... ]
			if the parser's current word position > the number of words in the command: 
				if 0 is where inferring the pattern from and the number of parameters in the command < the number of parameters for this line:
					now where inferring the pattern from is the understood command's current position; 
					now the inferred preposition is the token as an understood word;
					change (the understood command's current position) element of the player's understood command to y as an understood word as a pattern union;
				[ If we are not inferring, then the line is wrong... ]
				if 0 is where inferring the pattern from, decide on parse fails;
				[ If not, then the line is right but we mark in the preposition... ]
				change (understood command's current position) element of the player's understood command to y as an understood word as a pattern union;
				decide on parse succeeds;
			now the word is the next word;
			change the (understood command's current position) element of the player's understood command to the word as a pattern union;
			[ Whereas, if the player has typed something here, see if it is the required preposition... if it's wrong, the line must be wrong, but if it's right, the token is passed (jump to finish this token). ]
			if the word is y as an understood word, decide on parse succeeds;
			if the word is one of the slashed synonyms that start at this position, decide on parse succeeds;
			decide on parse fails;
		-- '<understand token>':  [ A "general parsing routine" which returns something of type "parser result" ]
			let the result be the parser result produced by (y as a filter); [too many parameters?]
			if trace 3, say "  [bracket]Outside parsing routine returned [the result][close bracket][line break]";
			decide on the result;
		-- 'any <description of objects>':
			now the scope decider is y as a filter;
			now the scope stage is does this allow multiple objects;
			if trace 3, say "  [bracket]Scope routine called at stage 1[close bracket][line break]";
			if the scope decider returns true, now y is 'things'; 
			otherwise now y is 'something';
			if trace 3, say "  [bracket]Scope routine returned multiple-flag of [y][close bracket][line break]";
		-- '<adjective>':
			now the noun filter is y as an adjective filter;
			now y is 'something';
		-- '<description of values>':
			now the noun filter is y as a filter;
			now y is 'something';
	decide on the parsed token as a y.

To decide what parser result is the parsed token as a (token - a grammar token) (this is ParseToken Parts BCDEF):
	let accept multiple objects be whether or not the token is either 'things' or 'things preferably held' or 'other things' or 'things inside';  [token_allows_multiple]
	let the singular object be an object;  [ the eventual return value ]
	we may make inferences;  [dont_infer, negated]
	let have many objects in the command be false;  [many_flag]
	now the saved number of items wanted is the number of items wanted;  [prev_indef_wanted]
	let assume 'AND' means add objects be true;  [and_parity]
	let the word be the comma; 
	while the word is the comma or the word is 'AND' or the word is 'BUT':  [this is .ObjectList ]
		if trace 3, say "  [bracket]Object list from word [parser's current word position][close bracket][line break]";
		[ Peek ahead and see if there's a pronoun. ]
		now the word is the next word;
		decrement the parser's current word position;
		now the pronoun used is no more words left to parse;
		now the pronoun reference object is the used-up object;
		now the singular object [presumably an antecedent] is what the word [presumably a pronoun] stands for;
		if the singular object is not nothing:
			now the pronoun used is the word;
			now the pronoun reference object is the singular object;
			if the singular object is the used-up object:
				now the saved pronoun used is the pronoun used;
				now the saved pronoun reference object is the pronoun reference object;
				issue "I'm not sure what that pronoun refers to." as the not sure what it refers to error;
				if trace 3, say "  [bracket]Stop: unset pronoun[close bracket][line break]";
				decide on parse fails;
		if the word is 'ME':
			now the pronoun used is the word;
			now the pronoun reference object is the player;
		we should allow numeric words as descriptors;
		now where the descriptor starts is the parser's current word position;  [desc_wn]
		(At this point we TryAgain);
		now any problems is the result of parsing determiners like ALL\OTHER\FIVE\MY\THESE\HIS\THE\AN\SOME\etc;
		unless any problems is no errors here:
			now the latest parser error is any problems;
			decide on parse succeeds;  [do what?? succeeds? ]
		(At this point we TryAgain2 due to an ambiguous descriptor word);
		now where the previous typo's at is the parser's current word position;
		let the former list size be the number of elements in the multiple-object list;
		if trace 3, say "  [bracket]Calling NounDomain on location and actor[close bracket][line break]";
		let pu be the noun domain the actor's scopewise location and the person asked under the token;
		if pu is the misunderstood command, decide on reparsing;
		if the token is 'something preferably held':
			if pu is noun domain's no match:
				if we still assume leading words to be descriptors:
					reset descriptor words;
					now the parser's current word position is where the descriptor starts;
					Go back up to where we TryAgain2 due to an ambiguous descriptor word; [-->]
				otherwise:
					now the latest parser error is a more specific error if possible;
					decide on what the token fails as unless it's reparsing;
					Go back up to where we TryAgain; [-->]
			if the parent of pu as an object is not the person asked:
				if trace 3, say "  [bracket]Allowing object [the pu as an object] for now[close bracket][line break]"; [implicit take coming up]
			now the singular object is pu as an object;	
		otherwise:
			if pu is noun domain's no match and the number of objects in the match list is 0 and the number of items wanted is all items are wanted:
				now pu is noun domain's bunch of objects;  [ ReviseMulti if TAKE ALL FROM empty container]
			if we accept multiple objects and we haven't process the multiple object list:
				if the best parser error so far is the can't use multiple objects error:
					now the best parser error so far is the didn't understand error;
				we should process the multiple object list;
			if pu is noun domain's no match:
				if we still assume leading words to be descriptors:
					reset descriptor words;
					now the parser's current word position is where the descriptor starts;
					Go back up to where we TryAgain2 due to an ambiguous descriptor word;[-->]
				otherwise:
					if we should process the multiple object list and the latest parser error is either the can't use multiple objects error or the not enough of those available error:
						now the latest parser error is the didn't understand error;
					now the latest parser error is a more specific error if possible;
					decide on what the token fails as unless it's reparsing;
					Go back up to where we TryAgain; [-->]
			if trace 3, say that pu matched with the former list size;
			if pu is noun domain's bunch of objects:
				if we do not have many objects in the command:
					we now have many objects in the command;
				otherwise:
					if trace 3, say "  [bracket]Merging [number of elements in the multiple-object list minus the former list size] new objects to the [number of elements in the multiple-object list] old ones[close bracket][line break]";
					unless we assume 'AND' means add objects: [ND already added them? ]  [ TEST THIS ]
						repeat through the multiple-object list starting at the former list size + 1:
							remove the multiple-object list element from the multiple-object list;
			otherwise:
				if the number of words matched per object is 0 and we still assume leading words to be descriptors:
					[ So the answer had to be inferred from no textual data, and we know that there was an ambiguity in the descriptor stage (such as a word which could be a pronoun being parsed as an article or possessive).  It's worth having another go.]
					reset descriptor words;
					now the parser's current word position is where the descriptor starts;
					Go back up to where we TryAgain2 due to an ambiguous descriptor word;[-->]
				if the token is 'someone':
					unless pu as an object is a creature:
						now the latest parser error is the can only do that to something animate error;
						decide on what the token fails as unless it's reparsing;
						Go back up to where we TryAgain; [-->]
				if we do not have many objects in the command: 
					now the singular object is pu as an object;
				otherwise:
					if we assume 'AND' means add objects:
						add pu as an object to the multiple-object list; 
					otherwise:
						remove pu as an object from the multiple-object list; 
					if trace 3, say "  [bracket]Combining [the pu as an object] with list[close bracket][line break]";
		now the parser's current word position is where the previous typo's at + the number of words matched per object;
		[  PARSE TOKEN LETTER E ]
		[ Getting ready to loop back to "while the word is 'AND' or 'BUT'.... ]
		now the word is the next word;
		if the word is 'AND' or the word is 'BUT' or the word is the comma:
			if trace 3, say "  [bracket]Read connective '[the word]'[close bracket][line break]";
			if we do not accept multiple objects:
				unless we still process the multiple object list:
					now the latest parser error is the can't use multiple objects error;
					decide on what the token fails as unless it's reparsing;
					Go back up to where we TryAgain;  [-->]
				otherwise:
					increment the parser's current word position;
					break; [ out of the ObjectList loop ]
			if the word is 'BUT':
				we will assume 'AND' means add objects if we shouldn't assume 'AND' means add objects;
			if we do not have many objects in the command:
				change the multiple-object list to have 1 elements;
				change the 1st element of the multiple-object list to the singular object;
				we now have many objects in the command;
				if trace 3, say "  [bracket]Making new list from [the singular object][close bracket][line break]";
			we shouldn't make inferences;
			now where inferring the pattern from is 0;
	decrement the parser's current word position;
	[  PARSE TOKEN LETTER F -- PassToken ]
	if we have many objects in the command:
		now the kind of multi is the token;
		decide on the resulting objects;
	if indefinite article mode is false or the type of descriptor word used does not include a plural descriptor:
		decide on the singular object as a parser result;
	if the number of items wanted < 2:
		decide on the singular object as a parser result;
	[ otherwise we have a problem ]
	now the latest parser error is the not enough of those available error;
	now the number of items actually received is 1; 
	now the number of items wanted previously wanted is the number of items wanted;
	decide on what the token fails as unless it's reparsing;
	go back up to where we TryAgain.

To decide on (phrase - a parser result) unless it's (pr - a parser result): 
(-	cacheval4 = {phrase}; 
	if (cacheval4 ~= {pr}) return cacheval4; -).

Where the descriptor starts is a number that varies.
The saved number of items wanted is a number that varies.

To decide what parser result is what the token fails as (this is ParseToken__ FailToken):
	[(At this point we FailToken);]  [ If we were only guessing about it being a plural, try again but only allowing singulars (so that words like "six" are not swallowed up as Descriptors) ][-->]
	if we allow numeric words as descriptors and probably plural is true:
		if trace 4, say "   [bracket]Retrying singulars after failure [latest parser error][close bracket][line break]";
		now the saved number of items wanted is the number of items wanted;
		we shouldn't allow numeric words as descriptors;
		now the parser's current word position is where the descriptor starts;
		decide on reparsing; [Go back up to where we TryAgain;[-->]]
	if (the number of items wanted is at least 1 or the saved number of items wanted is at least 1) and we haven't process the multiple object list:
		now the latest parser error is the can't use multiple objects error;
	decide on parse fails.


[for (we allow numeric words as descriptors;
	failtoken not  : 
	failtoken = retrysingular?)
]	

[ ParseToken__ given_ttype given_tdata token_n token
	l o i j k and_parity single_object desc_wn many_flag
	token_allows_multiple prev_indef_wanted;

    token_filter = 0;
    parser_inflection = name;

    switch (given_ttype) {
      ELEMENTARY_TT:
        switch (given_tdata) {
          SPECIAL_TOKEN:  ! special number token
            l = TryNumber(wn);
            special_word = NextWord();
           #Ifdef DEBUG;
            if (l ~= -1000)
                if (parser_trace >= 3) print "  [Read special as the number ", l, "]^";
            #Endif; ! DEBUG
            if (l == -1000) {
                #Ifdef DEBUG;
                if (parser_trace >= 3) print "  [Read special word at word number ", wn, "]^";
                #Endif; ! DEBUG
                l = special_word;
            }
            parsed_number = l;
            return GPR_NUMBER;

          NUMBER_TOKEN:
            l=TryNumber(wn++);
            if (l == -1000) {
                etype = NUMBER_PE;
                return GPR_FAIL;
            }
            #Ifdef DEBUG;
            if (parser_trace>=3) print "  [Read number as ", l, "]^";
            #Endif; ! DEBUG
            parsed_number = l;
            return GPR_NUMBER;

          CREATURE_TOKEN:
            if (action_to_be == ##Answer or ##Ask or ##AskFor or ##Tell)
                scope_reason = TALKING_REASON;

          TOPIC_TOKEN:
            consult_from = wn;
            if ((line_ttype-->(token_n+1) ~= PREPOSITION_TT) &&
               (line_token-->(token_n+1) ~= ENDIT_TOKEN))
                RunTimeError(13);
            do o = NextWordStopped();
            until (o == -1 || PrepositionChain(o, token_n+1) ~= false);
            wn--;
            consult_words = wn-consult_from;
            if (consult_words == 0) return GPR_FAIL;
            if (action_to_be == ##Ask or ##Answer or ##Tell) {
                o = wn; wn = consult_from; parsed_number = NextWord();
                wn = o; return 1;
            }
            if (o==-1 && (line_ttype-->(token_n+1) == PREPOSITION_TT))
                return GPR_FAIL;    ! don't infer if required preposition is absent
            return GPR_PREPOSITION;
        }

      PREPOSITION_TT:
        ! Is it an unnecessary alternative preposition, when a previous choice
        ! has already been matched?
        if ((token->0) & $10) return GPR_PREPOSITION;

        ! If we've run out of the player's input, but still have parameters to
        ! specify, we go into "infer" mode, remembering where we are and the
        ! preposition we are inferring...

        if (wn > num_words) {
            if (inferfrom==0 && parameters<params_wanted) {
                inferfrom = pcount; inferword = token;
                pattern-->pcount = REPARSE_CODE + VM_DictionaryAddressToNumber(given_tdata);
            }

            ! If we are not inferring, then the line is wrong...

            if (inferfrom == 0) return -1;

            ! If not, then the line is right but we mark in the preposition...

            pattern-->pcount = REPARSE_CODE + VM_DictionaryAddressToNumber(given_tdata);
            return GPR_PREPOSITION;
        }

        o = NextWord();

        pattern-->pcount = REPARSE_CODE + VM_DictionaryAddressToNumber(o);

        ! Whereas, if the player has typed something here, see if it is the
        ! required preposition... if it's wrong, the line must be wrong,
        ! but if it's right, the token is passed (jump to finish this token).

        if (o == given_tdata) return GPR_PREPOSITION;
        if (PrepositionChain(o, token_n) ~= false) return GPR_PREPOSITION;
        return -1;

      GPR_TT:
        l = indirect(given_tdata);
        #Ifdef DEBUG;
        if (parser_trace >= 3) print "  [Outside parsing routine returned ", l, "]^";
        #Endif; ! DEBUG
        return l;

      SCOPE_TT:
        scope_token = given_tdata;
        scope_stage = (+ does this allow multiple objects +);
        #Ifdef DEBUG;
        if (parser_trace >= 3) print "  [Scope routine called at stage 1]^";
        #Endif; ! DEBUG
        l = scope_token();  ! truth state
!	if the scope decider returns true,
        if (l == 1) given_tdata = (+ 'things' +); else given_tdata = (+ 'something' +);
        #Ifdef DEBUG;
        if (parser_trace >= 3) print "  [Scope routine returned multiple-flag of ", l, "]^"; ! use given_tdata in here
        #Endif; ! DEBUG

      ATTR_FILTER_TT:
        token_filter = 1 + given_tdata;
        given_tdata = NOUN_TOKEN;

      ROUTINE_FILTER_TT:
        token_filter = given_tdata;
        given_tdata = NOUN_TOKEN;

    } ! end of switch(given_ttype)

    token = given_tdata;


!Chapter - Parse Token Letter B

![Begin parsing an object list.]

!Include (-
    ! There are now three possible ways we can be here:
    !     parsing an elementary token other than "special" or "number";
    !     parsing a scope token;
    !     parsing a noun-filter token (either by routine or attribute).
    !
    ! In each case, token holds the type of elementary parse to
    ! perform in matching one or more objects, and
    ! token_filter is 0 (default), an attribute + 1 for an attribute filter
    ! or a routine address for a routine filter.

    token_allows_multiple = false;
    if (token == MULTI_TOKEN or MULTIHELD_TOKEN or MULTIEXCEPT_TOKEN or MULTIINSIDE_TOKEN)
        token_allows_multiple = true;

    many_flag = false; and_parity = true; dont_infer = true; !false;


!Chapter - Parse Token Letter C

![Parse descriptors (articles, pronouns, etc.) in the list.]

!Include (-
    ! We expect to find a list of objects next in what the player's typed.

  .ObjectList;

    #Ifdef DEBUG;
    if (parser_trace >= 3) print "  [Object list from word ", wn, "]^";
    #Endif; ! DEBUG

    ! Take an advance look at the next word: if it's "it" or "them", and these
    ! are unset, set the appropriate error number and give up on the line
    ! (if not, these are still parsed in the usual way - it is not assumed
    ! that they still refer to something in scope)

    o = NextWord(); wn--;

    pronoun_word = NULL; pronoun_obj = NULL;
    l = PronounValue(o);
    if (l ~= 0) {
        pronoun_word = o; pronoun_obj = l;
        if (l == NULL) {
            ! Don't assume this is a use of an unset pronoun until the
            ! descriptors have been checked, because it might be an
            ! article (or some such) instead

            for (l=1 : l<=LanguageDescriptors-->0 : l=l+4)
                if (o == LanguageDescriptors-->l) jump AssumeDescriptor;  ! i'm pretty sure this is unattainable. If the word 'o' was an article or some such, then PronounValue would've returned 0 and we wouldn't be here to begin with.
            pronoun__word = pronoun_word; pronoun__obj = pronoun_obj;
            etype = VAGUE_PE;
            if (parser_trace >= 3) print "  [Stop: unset pronoun]^";
            return GPR_FAIL;
        }
    }

  .AssumeDescriptor;

    if (o == ME1__WD or ME2__WD or ME3__WD) { pronoun_word = o; pronoun_obj = player; }

    allow_plurals = true; desc_wn = wn;

  .TryAgain;

    ! First, we parse any descriptive words (like "the", "five" or "every"):
    l = Descriptors(token_allows_multiple);   ! this function does not use this value 
    if (l ~= 0) { etype = l; return 0; }

  .TryAgain2;


!Chapter - Parse Token Letter D

![Parse an object name.]

!Include (-
    ! This is an actual specified object, and is therefore where a typing error
    ! is most likely to occur, so we set:

    oops_from = wn;

    ! So, two cases.  Case 1: token not equal to "held" (so, no implicit takes)
    ! but we may well be dealing with multiple objects

    ! In either case below we use NounDomain, giving it the token number as
    ! context, and two places to look: among the actor's possessions, and in the
    ! present location.  (Note that the order depends on which is likeliest.)

    if (token ~= HELD_TOKEN) {
        i = multiple_object-->0;
        #Ifdef DEBUG;
        if (parser_trace >= 3) print "  [Calling NounDomain on location and actor]^";
        #Endif; ! DEBUG
        l = NounDomain(actors_location, actor, token);
        if (l == REPARSE_CODE) return l;                  ! Reparse after Q&A
        if (indef_wanted == INDEF_ALL_WANTED && l == 0 && number_matched == 0)
            l = 1;  ! ReviseMulti if TAKE ALL FROM empty container

        if (token_allows_multiple && ~~multiflag) {
            if (best_etype==MULTI_PE) best_etype=STUCK_PE;
            multiflag = true;
        }
        if (l == 0) {
            if (indef_possambig) {
                ResetDescriptors();
                wn = desc_wn;
                jump TryAgain2;
            }
            if (etype == MULTI_PE or TOOFEW_PE && multiflag) etype = STUCK_PE;
            etype=CantSee();
            jump FailToken;
        } ! Choose best error

        #Ifdef DEBUG;
        if (parser_trace >= 3) {
            if (l > 1) print "  [ND returned ", (the) l, "]^";
            else {
                print "  [ND appended to the multiple object list:^";
                k = multiple_object-->0;
                for (j=i+1 : j<=k : j++)
                    print "  Entry ", j, ": ", (The) multiple_object-->j,
                          " (", multiple_object-->j, ")^";
                print "  List now has size ", k, "]^";
            }
        }
        #Endif; ! DEBUG

        if (l == 1) {
            if (~~many_flag) many_flag = true;
            else {                                ! Merge with earlier ones
                k = multiple_object-->0;            ! (with either parity)
                multiple_object-->0 = i;
                for (j=i+1 : j<=k : j++) {
                    if (and_parity) MultiAdd(multiple_object-->j);
                    else            MultiSub(multiple_object-->j);
                }
                #Ifdef DEBUG;
                if (parser_trace >= 3)
                	print "  [Merging ", k-i, " new objects to the ", i, " old ones]^";
                #Endif; ! DEBUG
            }
        }
        else {
            ! A single object was indeed found

            if (match_length == 0 && indef_possambig) {
                ! So the answer had to be inferred from no textual data,
                ! and we know that there was an ambiguity in the descriptor
                ! stage (such as a word which could be a pronoun being
                ! parsed as an article or possessive).  It's worth having
                ! another go.

                ResetDescriptors();
                wn = desc_wn;
                jump TryAgain2;
            }

            if ((token == CREATURE_TOKEN) && (CreatureTest(l) == 0)) {
                etype = ANIMA_PE;
                jump FailToken;
            } !  Animation is required

            if (~~many_flag) single_object = l;
            else {
                if (and_parity) MultiAdd(l); else MultiSub(l);
                #Ifdef DEBUG;
                if (parser_trace >= 3) print "  [Combining ", (the) l, " with list]^";
                #Endif; ! DEBUG
            }
        }
    }

    else {

    ! Case 2: token is "held" (which fortunately can't take multiple objects)
    ! and may generate an implicit take

        l = NounDomain(actor,actors_location,token);       ! Same as above...
        if (l == REPARSE_CODE) return l;
        if (l == 0) {
            if (indef_possambig) {
                ResetDescriptors();
                wn = desc_wn;
                jump TryAgain2;
            }
            etype = CantSee(); jump FailToken;            ! Choose best error
        }

        ! ...until it produces something not held by the actor.  Then an implicit
        ! take must be tried.  If this is already happening anyway, things are too
        ! confused and we have to give up (but saving the oops marker so as to get
        ! it on the right word afterwards).
        ! The point of this last rule is that a sequence like
        !
        !     > read newspaper
        !     (taking the newspaper first)
        !     The dwarf unexpectedly prevents you from taking the newspaper!
        !
        ! should not be allowed to go into an infinite repeat - read becomes
        ! take then read, but take has no effect, so read becomes take then read...
        ! Anyway for now all we do is record the number of the object to take.

        o = parent(l);
        if (o ~= actor) {
            #Ifdef DEBUG;
            if (parser_trace >= 3) print "  [Allowing object ", (the) l, " for now]^";
            #Endif; ! DEBUG
        }
        single_object = l;
    } ! end of if (token ~= HELD_TOKEN) else

    ! The following moves the word marker to just past the named object...

    wn = oops_from + match_length;


!Chapter - Parse Token Letter E

![Parse connectives (AND, BUT, etc.) and go back to (C).]

!Include (-
    ! Object(s) specified now: is that the end of the list, or have we reached
    ! "and", "but" and so on?  If so, create a multiple-object list if we
    ! haven't already (and are allowed to).

!  .NextInList;

    o = NextWord();

    if (o == AND1__WD or AND2__WD or AND3__WD or BUT1__WD or BUT2__WD or BUT3__WD or comma_word) {

        #Ifdef DEBUG;
        if (parser_trace >= 3) print "  [Read connective '", (address) o, "']^";
        #Endif; ! DEBUG

        if (~~token_allows_multiple) {
            if (multiflag) jump PassToken; ! give UPTO_PE error
            etype=MULTI_PE;
            jump FailToken;
        }

        if (o == BUT1__WD or BUT2__WD or BUT3__WD) and_parity = 1-and_parity;

        if (~~many_flag) {
            multiple_object-->0 = 1;
            multiple_object-->1 = single_object;
            many_flag = true;
            #Ifdef DEBUG;
            if (parser_trace >= 3) print "  [Making new list from ", (the) single_object, "]^";
            #Endif; ! DEBUG
        }
        dont_infer = false; !true;
         inferfrom=0;           ! Don't print (inferences)
        jump ObjectList;                          ! And back around
    }

    wn--;   ! Word marker back to first not-understood word


!Chapter - Parse Token Letter F

![Return the conclusion of parsing an object list.]

!Include (-
    ! Happy or unhappy endings:

  .PassToken;

    if (many_flag) {
        single_object = GPR_MULTIPLE;
        multi_context = token;
    }
    else {
        if (indef_mode == 1 && indef_type & PLURAL_BIT ~= 0) {
            if (indef_wanted < INDEF_ALL_WANTED && indef_wanted > 1) {
                multi_had = 1; multi_wanted = indef_wanted;
                etype = TOOFEW_PE;
                jump FailToken;
            }
        }
    }
    return single_object;

  .FailToken;

    ! If we were only guessing about it being a plural, try again but only
    ! allowing singulars (so that words like "six" are not swallowed up as
    ! Descriptors)

    if (allow_plurals && indef_guess_p == 1) {
        #Ifdef DEBUG;
        if (parser_trace >= 4) print "   [Retrying singulars after failure ", etype, "]^";
        #Endif;
        prev_indef_wanted = indef_wanted;
        allow_plurals = false;
        wn = desc_wn;
        jump TryAgain;
    }

    if ((indef_wanted > 0 || prev_indef_wanted > 0) && (~~multiflag)) etype = MULTI_PE;

    return GPR_FAIL;

]


Chapter - Descriptors

[In grammatical terms, a descriptor appears at the front of an English noun
phrase and clarifies the quantity or specific identity of what is referred
to: for instance, {\it my} mirror, {\it the} dwarf, {\it that} woman.
(Numbers, as in {\it four} duets, are also descriptors in linguistics:
but the I6 parser doesn't handle them that way.)

Slightly unfortunately, the bitmap constants used for descriptors in the
I6 parser have names in the form |*_BIT|, coinciding with the names of
style bits in the list-writer: but they never occur in the same context.

The actual words used as descriptors are read from tables in the language
definition. |ArticleDescriptors| uses this table to move current word
marker past a run of one or more descriptors which refer to the definite
or indefinite article.]

To reset descriptor words (this is ResetDescriptors):
	now the indefinite article mode is false;
	exclude all possibilities from the type of descriptor word used;
	now the number of items wanted is 0;
	now probably plural is false;
	now what the pronoun stands for is nothing;
	now the grammatical case is all possible grammatical cases;
	we shouldn't assume leading words to be descriptors;
	now where we found a number used like an adjective is at the 0th position.


[ ResetDescriptors;
    indef_mode = 0; indef_type = 0; indef_wanted = 0; indef_guess_p = 0;
    indef_possambig = false;
    indef_owner = nothing;
    indef_cases = $$111111111111;
    indef_nspec_at = 0;
]

[ ArticleDescriptors  o x flag cto type n;
    if (wn > num_words) return 0;

    for (flag=true : flag :) {
        o = NextWordStopped(); flag = false;

       for (x=1 : x<=LanguageDescriptors-->0 : x=x+4)
            if (o == LanguageDescriptors-->x) {
                type = LanguageDescriptors-->(x+2);
                if (type == DEFART_PK or INDEFART_PK) flag = true;
            }
    }
    wn--;
    return 0;
]


Chapter - Parsing Descriptors

[The |Descriptors()| routine parses the descriptors at the head of a noun
phrase, leaving the current word marker |wn| at the first word of the
noun phrase's body. It is allowed to set up for a plural only if |allow_p|
is set; it returns a parser error number, or 0 if no error occurred.]

[ One place sends a truth state to this function, but it erases its value almost immediately. ]
To decide which command parser error is the result of parsing determiners like ALL\OTHER\FIVE\MY\THESE\HIS\THE\AN\SOME\etc (this is Descriptors):
	reset descriptor words;
	if the parser's current word position is greater than the number of words in the command, decide on no errors here;
	let get another word be true;
	while we still get another word:  [ This wants to be a test-at-the-bottom loop containing an else-if chain. ]
		let the word be the next word if any;
		we shouldn't get another word;
		if the word is listed as one of the descriptors in the language's descriptor list:
			let its type be the category element;
			unless its type is like 'THE':
				now the indefinite article mode is true;
			we now assume leading words to be descriptors;
			exclude all except the gender-animation element from the grammatical case;
			if its type is like 'MY\THESE\HIS' etc:
				if the possessive descriptor element is 'MY\THIS\THESE': 
					include a possessive descriptor in the type of descriptor word used;
				otherwise if the possessive descriptor element is 'THAT\THOSE':
					include a THAT descriptor in the type of descriptor word used;
				otherwise[ if the possessive descriptor element is 'HIS\HER\THEIR\ITS']: 
					now what the pronoun stands for is what the possessive descriptor element stands for;
			otherwise if its type is 'LIT\LIGHTED':
				include a lit descriptor in the type of descriptor word used;
			otherwise if its type is 'UNLIT':
				include an unlit descriptor in the type of descriptor word used;
			we should get another word;
		if the word is 'OTHER':
			include an OTHER descriptor in the type of descriptor word used;
			now the indefinite article mode is true;
			we should get another word;
[		if the word is 'OF' and the number of consecutive descriptor words is at least 2:
			do nothing;  [ we may not wish to skip OF if it leads the next phrase, only if it follows ALL, TWO, etc.]
			we should get another word;  ]
		if the word is 'ALL':
			include a Plural descriptor in the type of descriptor word used;
			now the indefinite article mode is true;
			now the number of items wanted is all items are wanted;
			if the TAKE ALL exception is 1, now the TAKE ALL exception is 2;
			we should get another word;
		if we allow numeric words as descriptors:[the 'three' in 'take three rocks' but not 'take the Memphis Three' ]
			let finished be whether or not the next word if any is no more words left to parse;
			decrement the parser's current word position;
			if we haven't finished:
				let the typed-in numeric word be the number typed in by the player at the parser's current word position - 1;  [ which returns negative numbers if the player didn't use one]
				if the typed-in numeric word is at least 1:
					now the indefinite article mode is true;
					we should get another word;
					if the typed-in numeric word is at least 2:
						include a plural descriptor in the type of descriptor word used;
						now probably plural is true;
						now the number of items wanted is the typed-in numeric word;
						now where we found a number used like an adjective is the parser's current word position - 1;
		if we should get another word:
			unless the next word if any is 'OF':
				decrement the parser's current word position;
	decrement the parser's current word position;
	decide on no errors here.	


[ Descriptors  o x flag cto type n;
    ResetDescriptors();
    if (wn > num_words) return 0;

    for (flag=true : flag :) {
        o = NextWordStopped(); flag = false;

       for (x=1 : x<=LanguageDescriptors-->0 : x=x+4)
            if (o == LanguageDescriptors-->x) {
                flag = true;
                type = LanguageDescriptors-->(x+2);
                if (type ~= DEFART_PK) indef_mode = true;
                indef_possambig = true;
                indef_cases = indef_cases & (LanguageDescriptors-->(x+1));

                if (type == POSSESS_PK) {
                    cto = LanguageDescriptors-->(x+3);
                    switch (cto) {
                      0: indef_type = indef_type | MY_BIT;
                      1: indef_type = indef_type | THAT_BIT;
                      default:
                        indef_owner = PronounValue(cto);
                        if (indef_owner == NULL) indef_owner = InformParser;   !  this should never happen: POSSESS_PK + NULL
                    }
                }

                if (type == light)  indef_type = indef_type | LIT_BIT;
                if (type == -light) indef_type = indef_type | UNLIT_BIT;
            }

        if (o == OTHER1__WD or OTHER2__WD or OTHER3__WD) {
            indef_mode = 1; flag = 1;
            indef_type = indef_type | OTHER_BIT;
        }
        if (o == ALL1__WD or ALL2__WD or ALL3__WD or ALL4__WD or ALL5__WD) {
            indef_mode = 1; flag = 1; indef_wanted = INDEF_ALL_WANTED;
            if (take_all_rule == 1) take_all_rule = 2;
            indef_type = indef_type | PLURAL_BIT;
        }
        if (allow_plurals) {
        	if (NextWordStopped() ~= -1) { wn--; n = TryNumber(wn-1); } else { n=0; wn--; }
            if (n == 1) { indef_mode = 1; flag = 1; }
            if (n > 1) {
                indef_guess_p = 1;
                indef_mode = 1; flag = 1; indef_wanted = n;
                indef_nspec_at = wn-1;
                indef_type = indef_type | PLURAL_BIT;
            }
        }
        if (flag == 1 && NextWordStopped() ~= OF1__WD or OF2__WD or OF3__WD or OF4__WD)
            wn--;  ! Skip 'of' after these
    }
    wn--;
    return 0;
]

To skip over any descriptor words (this is SafeSkipDescriptors):
	save the indefinite article mode;
	save the type of descriptor word used;
	save the number of items wanted;
	save probably plural;
	save assume leading words to be descriptors;
	save what the pronoun stands for;
	save the grammatical case;
	save where we found a number used like an adjective;
	Let the ignored error be the result of parsing determiners like ALL\OTHER\FIVE\MY\THESE\HIS\THE\AN\SOME\etc;
	restore where we found a number used like an adjective;
	restore the grammatical case;
	restore what the pronoun stands for;
	restore assume leading words to be descriptors;
	restore probably plural;
	restore the number of items wanted;
	restore the type of descriptor word used;
	restore the indefinite article mode.

[ SafeSkipDescriptors;
	@push indef_mode; @push indef_type; @push indef_wanted;
	@push indef_guess_p; @push indef_possambig; @push indef_owner;
	@push indef_cases; @push indef_nspec_at;
	
	Descriptors();
	
	@pull indef_nspec_at; @pull indef_cases;
	@pull indef_owner; @pull indef_possambig; @pull indef_guess_p;
	@pull indef_wanted; @pull indef_type; @pull indef_mode;
]


Chapter - Preposition Chain

[A small utility for runs of prepositions.]

To decide if (word - an understood word) is one of the slashed synonyms that start at (Nth - a number) position (this is PrepositionChain):
	if the Nth element of the grammar line data as an understood word is the word, yes;
	repeat running Nth through the slashed synonyms:
		if the Nth element of the grammar line data as an understood word is the word, yes;
	no.
	
To decide what number is (Nth - a number) advanced past the slashed synonyms:
	repeat running Nth through the slashed synonyms:
		do nothing;
	decide on Nth.
	

To repeat running (index - an existing number variable) through the slashed synonyms begin -- end:
(-	for	( cacheval4 = ((line_token-->{index})->0 & (+the first slashed synonym+) ~= 0)
		: cacheval4 
		: ++{index}, 
		   cacheval4 = ((line_token-->{index} ~= (+the end of line token+)) && (((line_token-->{index})->0 & (+the last slashed synonym+)) ~= 0))
		) -).



[ PrepositionChain wd index;
    if (line_tdata-->index == wd) return wd;
    if ((line_token-->index)->0 & $20 == 0) return -1;
    do {
        if (line_tdata-->index == wd) return wd;
        index++;
    } until ((line_token-->index == ENDIT_TOKEN) || (((line_token-->index)->0 & $10) == 0));
    return -1;
]


Chapter - Creature

[Will this object do for an I6 |creature| token? (In I7 terms, this affects
the tokens ``[someone]'', ``[somebody]'', ``[anyone]'' and ``[anybody]''.)]

To decide if (obj - an object) is a creature (this is CreatureTest):
	if obj provides the property animate directly, yes;
	if obj does not provide the property talkable directly, no;
	if the action to be is either the asking it about action or the answering it that action or the telling it about action or the asking it for action, yes.

[ CreatureTest obj; 
    if (obj has animate) rtrue;
    if (obj hasnt talkable) rfalse;
    if (action_to_be == ##Ask or ##Answer or ##Tell or ##AskFor) rtrue;
    rfalse;
]

Chapter - Noun Domain

[|NounDomain| does the most substantial part of parsing an object name.
It is given two ``domains'' -- usually a location and then the actor who is
looking -- and a context (i.e. token type), and returns:

(a) 0 if no match at all could be made,
(b) 1 if a multiple object was made,
(c) $k$ if object $k$ was the one decided upon,
(d) |REPARSE_CODE| if it asked a question of the player and consequently
rewrote the player's input, so that the whole parser should start again
on the rewritten input.

In case (c), |NounDomain| also sets the variable |length_of_noun| to the
number of words in the input text matched to the noun. In case (b),
the multiple objects are added to |multiple_object| by hand (not by |MultiAdd|,
because we want to allow duplicates).]

Section - Descriptor Debugging - not for release

To say the descriptor status:
	if the indefinite article mode is true:
		say "indefinite object: ";
		if the type of descriptor word used includes an other descriptor, say "other ";
		if the type of descriptor word used includes a possessive descriptor, say "my ";
		if the type of descriptor word used includes a THAT descriptor, say "that ";
		if the type of descriptor word used includes a plural descriptor, say "plural ";
		if the type of descriptor word used includes a lit descriptor, say "lit ";
		if the type of descriptor word used includes an unlit descriptor, say "unlit ";
		unless what the pronoun stands for is nothing, say "owner:[the what the pronoun stands for]";
		say "[line break]   number wanted: ";
		if the number of items wanted is all items are wanted, say "all"; 
		otherwise say "[the number of items wanted]";
		say "[line break]   most likely GNAs of names: [the grammatical case as a debugging number][line break]";
	otherwise:
		say "definite object[line break]".

[The second marked for listing property translates into I6 as "workflag2".] 
[ I'm sorely tempted to rewrite the WDYM activity to use the built-in ListWriter. ]

Section - Noun Domain

To decide which pattern union is the noun domain (first domain - an object) and (second domain - an object) under (context - a grammar token) (this is NounDomain):
	if trace 4, say "   [bracket]NounDomain called at word [the parser's current word position][line break]   seeking [the descriptor status]";
	now the number of words matched per object is 0; 
	now the number of objects in the match list is 0; 
	now the next word to parse's position is the parser's current word position;
	search the scope of the first domain and second domain under the context;
	if trace 4, say "   [bracket]ND made [the number of objects in the match list] matches[close bracket][line break]";
	now the parser's current word position is the next word to parse's position + the number of words matched per object;
	[ If nothing worked at all, leave with the word marker skipped past the first unmatched word...]
	if the number of objects in the match list is zero:
		increment the parser's current word position;
		Decide on noun domain's no match;
	[ Suppose that there really were some words being parsed (i.e., we did not just infer).  If so, and if there was only one match, it must be right and we return it...]
	if the next word to parse's position <= the number of words in the command:
		if the number of objects in the match list is 1:
			Decide on the 0th element of the match list as a successful match;
	        [ ...now suppose that there was more typing to come, i.e. suppose that the user entered something beyond this noun.  If nothing ought to follow, then there must be a mistake, (unless what does follow is just a full stop, and or comma) ]
		if the parser's current word position <= the number of words in the command:
			let the word be the next word;
			decrement the parser's current word position;
			unless the word is 'AND\THEN\BUT' or the word is the comma:
				if the next token is the end of line token:
					Decide on noun domain's no match;
	[ Now look for a good choice, if there's more than one choice...]
	now the number of match groups is 0;
	let the likely choice be noun domain's no match;
	if the number of objects in the match list is 1:
		now the likely choice is the 0th element of the match list as a successful match;
	if the number of objects in the match list is at least 2:
		let assume all objects indistinguishable be true;
		repeat through the match list of size the number of objects in the match list:
			if the chosen element is not indistinguishable from the 0th element of the match list:
				we shouldn't assume all objects indistinguishable;
		if we still assume all objects indistinguishable, we needn't make inferences;
		now the likely choice is the result of adjudicating under the context;
		if the likely choice is the null pattern:
			Decide on noun domain's no match;
		if the likely choice is noun domain's bunch of objects:
			Decide on noun domain's bunch of objects;
	[ If i is non-zero here, one of two things is happening: either
    	 (a) an inference has been successfully made that object i is the intended one from the user's specification, or
    	 (b) the user finished typing some time ago, but we've decided on i because it's the only possible choice.
	In either case we have to keep the pattern up to date, note that an inference has been made and return. (Except, we don't note which of a pile of identical objects.) ]
	unless the likely choice is noun domain's no match:
		if we shouldn't make inferences, decide on the likely choice;
		if where inferring the pattern from is at the 0th position, now where inferring the pattern from is the understood command's current position;
		change (understood command's current position) element of the player's understood command to the likely choice;
		Decide on the likely choice;
	[ If we get here, there was no obvious choice of object to make.  If in fact we've already gone past the end of the player's typing (which means the match list must contain every object in scope, regardless of its name), then it's foolish to give an enormous list to choose from - instead we go and ask a more suitable question...]
	if the next word to parse's position > the number of words in the command:
		Decide on the incomplete noun under the context;
	[ Otherwise, now we print up the question using the equivalence classes as worked out by Adjudicate() so as not to repeat ourselves on plural objects...]
	begin THE ASKING WHICH DO YOU MEAN ACTIVITY;
	if handling THE ASKING WHICH DO YOU MEAN ACTIVITY:
		let assume all objects people be true;
		repeat through the first item of each group:
			if the chosen element does not provide the property animate directly:
				we shouldn't assume all objects people;
		if we still assume all objects people, issue the 45th response "Who do you mean, ";
		otherwise issue the 46th response "Which do you mean, ";
		repeat through the first item of each group:
			if we should say the group as A\AN\SOME, say "[a chosen element]"; 
			otherwise say "[the chosen element]";
			if the current group-together number < the number of match groups - 1, say ", ";
			if the current group-together number is the number of match groups - 1, say "[if the serial comma option is active and the number of match groups is not 2],[end if] or ";
		issue the 57th response "?[line break]";
	end THE ASKING WHICH DO YOU MEAN ACTIVITY;
	[ ...and get an answer: ]
	change the 1st word of the second parsed command to 'ALL' simply to enter the loop;
	while the 1st word of the second parsed command is 'ALL':  [ another test-at-the-bottom loop ]
		fill the secondary input buffer with spaces starting at 2 for the maximum buffer size - 2 elements;
		let the answer be the number of words TYPED IN AT THE KEYBOARD into the secondary input buffer and the second parsed command;
		[ Take care of "all", because that does something too clever to do later on: ]
		if the 1st word of the second parsed command is 'ALL':  [ "X HAT" Which? "ALL" Sorry, you.... ]
			if the context is either 'things' or 'things preferably held' or 'other things' or 'things inside':  
				repeat through the match list of size the number of objects in the match list:
					add the chosen element to the multiple-object list, allowing duplicates;
				decide on the noun domain's bunch of objects;
			issue the 47th response "Sorry, you can only have one item here. Which exactly?";
	[ Look for a comma, and interpret this as a fresh conversation command if so: ]
	if the 'comma' is listed in the second parsed command:
		copy the secondary input buffer into the player's input buffer;
	[ If the first word of the reply can be interpreted as a verb, then assume that the player has ignored the question and given a new command altogether. (This is one time when it's convenient that the directions are not themselves verbs - thus, "north" as a reply to "Which, the north or south door" is not treated as a fresh command but as an answer.) ]
	otherwise:
		let the first word be the 1st word of the second parsed command;
		[#Ifdef LanguageIsVerb;   [ Non-English languages may place the verb in other positions. ]
		if first word is not a word unknown by the game:
			let the saved position be the parser's current word position;
		 	now the first word is LanguageIsVerb(buffer2, parse2, 1); 
			now the parser's current word position is the saved position;
		#Endif; ! LanguageIsVerb]
		if the first word is not a word unknown by the game and the usages of the first word include being a verb and the first word cannot be a name or adjective:
			copy the secondary input buffer into the player's input buffer;
		otherwise:
			[ Now we insert the answer into the original typed command: TAKE HAT becomes TAKE RED HAT. ]
			replace (the insertion point at the next word to parse's position) with (the number of letters in the secondary input buffer) in letters from 1; 
	now the parser's current word position is 1;
[	consider the convert to subject–verb–object format rule;  [ A hook for non-English player languages. ]]
	PARSE the player's input buffer into the player's parsed command;
	now the number of words in the command is the word count;
	now the player's command is the empty snippet lengthened by the word count;
	now the actor's scopewise location is the scope ceiling of the player;
	follow the AFTER READING A COMMAND rules;
	decide on the misunderstood command.


To decide which pattern union is the incomplete noun under (context - a grammar token) (this is NounDomain's Incomplete):  [ can be reached by EXAMINE THE or even just EXAMINE ]
	if the context is 'someone':
		issue the 48th response "Whom do you want[if the person asked is not the player] [the person asked][end if] to [recap of command]?[line break]"; 
	otherwise:
		issue the 49th response "What do you want[if the person asked is not the player] [the person asked][end if] to [recap of command]?[line break]"; 
	fill the secondary input buffer with spaces starting at 2 for the maximum buffer size - 2 elements;
	let the answer be the number of words TYPED IN AT THE KEYBOARD into the secondary input buffer and the second parsed command;
	let the first word be the 1st word of the second parsed command;
	[#Ifdef LanguageIsVerb;
	if first word is not a word unknown by the game:
		let the saved position be the parser's current word position;
	 	now the first word is LanguageIsVerb(buffer2, parse2, 1); 
		now the parser's current word position is the saved position;
	#Endif; ! LanguageIsVerb]	
	[ Once again, if the reply looks like a command, give it to the parser to get on with and forget about the question ]
	if the first word is not a word unknown by the game and the usages of the first word include being a verb:
		copy the secondary input buffer into the player's input buffer;
		decide on the misunderstood command;
	[ ...but if we have a genuine answer, then:
	 (1) we must glue in text suitable for anything that's been inferred. ]
	if where inferring the pattern from is not at the 0th position: [ reached by ASK ME; the FOR will be inferred]
		repeat with Nth running from where inferring the pattern from to the understood command's current position - 1:
			let this pattern be the Nth element of the player's understood command;
			if this pattern is the null pattern, next;
			if trace 5, say "[bracket]Gluing in inference with pattern code [this pattern as a debugging number][close bracket][line break]";
			let the inferred word be a word unknown by the game;
			if this pattern is currently an object:
				[ Because object names are so complicated and prone to overlap, we'll set a pronoun to it, then use the pronoun.  (This is imperfect, but it's very seldom needed anyway.)]
				set pronouns from this pattern as an object;
				if this pattern is listed as one of the antecedents in the language's pronoun list:
					now the inferred word is the pronoun element;
					if trace 5, say "[bracket]Using pronoun '[inferred word]'[close bracket][line break]";
			otherwise: [ it's an inferred preposition.]
				now the inferred word is this pattern as an understood word;
				if trace 5, say "[bracket]Using preposition '[inferred word]'[close bracket][line break]";
			unless the inferred word is a word unknown by the game:
				append a space to the player's input buffer;
				append the inferred word to the player's input buffer;
	[ (2) then glue in the newly-typed text onto the end.]  
	append a space to the player's input buffer;
	append (the number of letters in the secondary input buffer) letters from the secondary input buffer to the player's input buffer;
	[ (3) we fill up the buffer with spaces, which is unnecessary, but may help incorrectly-written interpreters to cope.]
	fill the player's input buffer with spaces starting at (the number of letters in the player's input buffer + 1) for (the maximum buffer size - the number of letters in the player's input buffer) elements; 
	decide on the misunderstood command.


[ NounDomain domain1 domain2 context
	first_word i j k l answer_words marker;
    #Ifdef DEBUG;
    if (parser_trace >= 4) {
        print "   [NounDomain called at word ", wn, "^";   ! ]   
        print "   ";
        if (indef_mode) {
            print "seeking indefinite object: ";
            if (indef_type & OTHER_BIT)  print "other ";
            if (indef_type & MY_BIT)     print "my ";
            if (indef_type & THAT_BIT)   print "that ";
            if (indef_type & PLURAL_BIT) print "plural ";
            if (indef_type & LIT_BIT)    print "lit ";
            if (indef_type & UNLIT_BIT)  print "unlit ";
            if (indef_owner ~= 0) print "owner:", (name) indef_owner;
            new_line;
            print "   number wanted: ";
            if (indef_wanted == INDEF_ALL_WANTED) print "all"; else print indef_wanted;
            new_line;
            print "   most likely GNAs of names: ", indef_cases, "^";
        }
        else print "seeking definite object^";
    }
    #Endif; ! DEBUG

    match_length = 0; number_matched = 0; match_from = wn;

    SearchScope(domain1, domain2, context);

    #Ifdef DEBUG;
    if (parser_trace >= 4) print "   [ND made ", number_matched, " matches]^";
    #Endif; ! DEBUG

    wn = match_from+match_length;

    ! If nothing worked at all, leave with the word marker skipped past the
    ! first unmatched word...

    if (number_matched == 0) { wn++; rfalse; }

    ! Suppose that there really were some words being parsed (i.e., we did
    ! not just infer).  If so, and if there was only one match, it must be
    ! right and we return it...

    if (match_from <= num_words) {
        if (number_matched == 1) {
            i=match_list-->0;
            return i;
        }

        ! ...now suppose that there was more typing to come, i.e. suppose that
        ! the user entered something beyond this noun.  If nothing ought to follow,
        ! then there must be a mistake, (unless what does follow is just a full
        ! stop, and or comma)

        if (wn <= num_words) {
            i = NextWord(); wn--;
            if (i ~=  AND1__WD or AND2__WD or AND3__WD or comma_word
                   or THEN1__WD or THEN2__WD or THEN3__WD
                   or BUT1__WD or BUT2__WD or BUT3__WD) {
                if (lookahead == ENDIT_TOKEN) rfalse;
            }
        }
    }

    ! Now look for a good choice, if there's more than one choice...

    number_of_classes = 0;

    if (number_matched == 1) i = match_list-->0;
    if (number_matched > 1) {
	    i = true;
	    if (number_matched > 1)  ! I removed this if statement cause it does nothing.
	    	for (j=0 : j<number_matched-1 : j++)    
				if (Identical(match_list-->j, match_list-->(j+1)) == false)
					i = false;  ! "unless all elements are indistinguishable from each other", now i is false
		if (i) dont_infer = true;   ! the meaning of dont_infer is flipped because it reads better
        i = Adjudicate(context);
        if (i == -1) rfalse;
        if (i == 1) rtrue;       !  Adjudicate has made a multiple
                             !  object, and we pass it on
    }

    ! If i is non-zero here, one of two things is happening: either
    ! (a) an inference has been successfully made that object i is
    !     the intended one from the user's specification, or
    ! (b) the user finished typing some time ago, but we've decided
    !     on i because it's the only possible choice.
    ! In either case we have to keep the pattern up to date,
    ! note that an inference has been made and return.
    ! (Except, we don't note which of a pile of identical objects.)

    if (i ~= 0) {
    	if (dont_infer) return i;    ! meaning of dont_infer toggled
        if (inferfrom == 0) inferfrom=pcount;
        pattern-->pcount = i;
        return i;
    }

    ! If we get here, there was no obvious choice of object to make.  If in
    ! fact we've already gone past the end of the player's typing (which
    ! means the match list must contain every object in scope, regardless
    ! of its name), then it's foolish to give an enormous list to choose
    ! from - instead we go and ask a more suitable question...

    if (match_from > num_words) jump Incomplete;

    ! Now we print up the question, using the equivalence classes as worked
    ! out by Adjudicate() so as not to repeat ourselves on plural objects...

	BeginActivity(ASKING_WHICH_DO_YOU_MEAN_ACT);
	if (ForActivity(ASKING_WHICH_DO_YOU_MEAN_ACT)) jump SkipWhichQuestion;
	j = 1; marker = 0;   ! "marker" becomes "ct_1" while "i" becomes a I7 global "the current group-together number"
	for (i=1 : i<=number_of_classes : i++) {
		while (((match_classes-->marker) ~= i) && ((match_classes-->marker) ~= -i))
			marker++;
		if (match_list-->marker hasnt animate) j = 0;
	}
	if (j) L__M(##Miscellany, 45); else L__M(##Miscellany, 46);

    j = number_of_classes; marker = 0;
    for (i=1 : i<=number_of_classes : i++) {
        while (((match_classes-->marker) ~= i) && ((match_classes-->marker) ~= -i)) marker++;
        k = match_list-->marker;

        if (match_classes-->marker > 0) print (the) k; else print (a) k;

        if (i < j-1)  print (string) COMMA__TX;
        if (i == j-1) {
			#Ifdef SERIAL_COMMA;
			if (j ~= 2) print ",";
        	#Endif; ! SERIAL_COMMA
        	print (string) OR__TX;
        }
    }
    L__M(##Miscellany, 57);

	.SkipWhichQuestion; EndActivity(ASKING_WHICH_DO_YOU_MEAN_ACT);

    ! ...and get an answer:

  .WhichOne;
    #Ifdef TARGET_ZCODE;
    for (i=2 : i<INPUT_BUFFER_LEN : i++) buffer2->i = ' ';
    #Endif; ! TARGET_ZCODE
    answer_words=Keyboard(buffer2, parse2);

    ! Conveniently, parse2-->1 is the first word in both ZCODE and GLULX.
    first_word = (parse2-->1);

    ! Take care of "all", because that does something too clever here to do
    ! later on:

    if (first_word == ALL1__WD or ALL2__WD or ALL3__WD or ALL4__WD or ALL5__WD) 
    {
        if (context == MULTI_TOKEN or MULTIHELD_TOKEN or MULTIEXCEPT_TOKEN or MULTIINSIDE_TOKEN) 
	{
            l = multiple_object-->0;
            for (i=0 : i<number_matched && l+i<MATCH_LIST_WORDS : i++) 
	    {      !  I don't check the max size in my version as I use the AddMulti function, which stops adding when its full.
                k = match_list-->i;
                multiple_object-->(i+1+l) = k;
            }
            multiple_object-->0 = i+l;
            rtrue;
        }
        L__M(##Miscellany, 47);
        jump WhichOne;
    }

	! Look for a comma, and interpret this as a fresh conversation command
	! if so:

	for (i=1 : i<=answer_words : i++)
		if (WordFrom(i, parse2) == comma_word) {
            VM_CopyBuffer(buffer, buffer2);
            jump RECONSTRUCT_INPUT;		
		}

    ! If the first word of the reply can be interpreted as a verb, then
    ! assume that the player has ignored the question and given a new
    ! command altogether.
    ! (This is one time when it's convenient that the directions are
    ! not themselves verbs - thus, "north" as a reply to "Which, the north
    ! or south door" is not treated as a fresh command but as an answer.)

    #Ifdef LanguageIsVerb;
    if (first_word == 0) {
        j = wn; first_word = LanguageIsVerb(buffer2, parse2, 1); wn = j;
    }
    #Endif; ! LanguageIsVerb
    if (first_word ~= 0) {
        j = first_word->#dict_par1;
        if ((0 ~= j&1) && ~~LanguageVerbMayBeName(first_word)) {
            VM_CopyBuffer(buffer, buffer2);
            jump RECONSTRUCT_INPUT;
        }
    }

    ! Now we insert the answer into the original typed command, as
    ! words additionally describing the same object
    ! (eg, > take red button
    !      Which one, ...
    !      > music
    ! becomes "take music red button".  The parser will thus have three
    ! words to work from next time, not two.)

    #Ifdef TARGET_ZCODE;
    k = WordAddress(match_from) - buffer; l=buffer2->1+1;
    for (j=buffer + buffer->0 - 1 : j>=buffer+k+l : j-- ) j->0 = 0->(j-l); ! shift right original contents
    for (i=0 : i<l : i++ ) buffer->(k+i) = buffer2->(2+i);  ! copy from 2nd buffer to the new hole in 1st
    buffer->(k+l-1) = ' ';  ! ...plus a space, so the patched command isn't "musicred button" since a space wasn't typed. 
    buffer->1 = buffer->1 + l;   ! increase the size as well
    if (buffer->1 >= (buffer->0 - 1)) buffer->1 = buffer->0; ! cap the size at the maximum allowed size

    #Ifnot; ! TARGET_GLULX

    k = WordAddress(match_from) - buffer;
    l = (buffer2-->0) + 1;
    for (j=buffer+INPUT_BUFFER_LEN-1 : j>=buffer+k+l : j-- ) j->0 = j->(-l);
    for (i=0 : i<l : i++) buffer->(k+i) = buffer2->(WORDSIZE+i);
    buffer->(k+l-1) = ' ';
    buffer-->0 = buffer-->0 + l;
    if (buffer-->0 > (INPUT_BUFFER_LEN-WORDSIZE)) buffer-->0 = (INPUT_BUFFER_LEN-WORDSIZE);
    #Endif; ! TARGET_

    ! Having reconstructed the input, we warn the parser accordingly
    ! and get out.

	.RECONSTRUCT_INPUT;

	num_words = WordCount();
    wn = 1;
    #Ifdef LanguageToInformese;
    LanguageToInformese();
    ! Re-tokenise:
    VM_Tokenise(buffer,parse);
    #Endif; ! LanguageToInformese
	num_words = WordCount();
    players_command = 100 + WordCount();
    actors_location = ScopeCeiling(player);
	FollowRulebook(Activity_after_rulebooks-->READING_A_COMMAND_ACT, true);

    return REPARSE_CODE;

!!!!  NEW FUNCTION :  INCOMPLETE NOUN DOMAIN. WHAT PARAMETERS DOES IT NEED?
!!! context is needed.

    ! Now we come to the question asked when the input has run out
    ! and can't easily be guessed (eg, the player typed "take" and there
    ! were plenty of things which might have been meant).

  .Incomplete;

    if (context == CREATURE_TOKEN) L__M(##Miscellany, 48);
    else                           L__M(##Miscellany, 49);

    #Ifdef TARGET_ZCODE;
    for (i=2 : i<INPUT_BUFFER_LEN : i++) buffer2->i=' ';
    #Endif; ! TARGET_ZCODE
    answer_words = Keyboard(buffer2, parse2);

    first_word=(parse2-->1);
    #Ifdef LanguageIsVerb;
    if (first_word==0) {
        j = wn; first_word=LanguageIsVerb(buffer2, parse2, 1); wn = j;
    }
    #Endif; ! LanguageIsVerb

    ! Once again, if the reply looks like a command, give it to the
    ! parser to get on with and forget about the question...

    if (first_word ~= 0) {
        j = first_word->#dict_par1;
        if (0 ~= j&1) {
            VM_CopyBuffer(buffer, buffer2);
            return REPARSE_CODE;
        }
    }

    ! ...but if we have a genuine answer, then:
    !
    ! (1) we must glue in text suitable for anything that's been inferred.

    if (inferfrom ~= 0) {
        for (j=inferfrom : j<pcount : j++) {
            if (pattern-->j == PATTERN_NULL) continue;
            #Ifdef TARGET_ZCODE;
            i = 2+buffer->1; (buffer->1)++; buffer->(i++) = ' ';
            #Ifnot; ! TARGET_GLULX
            i = WORDSIZE + buffer-->0;
            (buffer-->0)++; buffer->(i++) = ' ';
            #Endif; ! TARGET_

            #Ifdef DEBUG;
            if (parser_trace >= 5)
            	print "[Gluing in inference with pattern code ", pattern-->j, "]^";
            #Endif; ! DEBUG

            ! Conveniently, parse2-->1 is the first word in both ZCODE and GLULX.

            parse2-->1 = 0;

            ! An inferred object.  Best we can do is glue in a pronoun.
            ! (This is imperfect, but it's very seldom needed anyway.)

            if (pattern-->j >= 2 && pattern-->j < REPARSE_CODE) {
                PronounNotice(pattern-->j);
                for (k=1 : k<=LanguagePronouns-->0 : k=k+3)
                    if (pattern-->j == LanguagePronouns-->(k+2)) {
                        parse2-->1 = LanguagePronouns-->k;
                        #Ifdef DEBUG;
                        if (parser_trace >= 5)
                        	print "[Using pronoun '", (address) parse2-->1, "']^";
                        #Endif; ! DEBUG
                        break;
                    }
            }
            else {
                ! An inferred preposition.
                parse2-->1 = VM_NumberToDictionaryAddress(pattern-->j - REPARSE_CODE);
                #Ifdef DEBUG;
                if (parser_trace >= 5)
                	print "[Using preposition '", (address) parse2-->1, "']^";
                #Endif; ! DEBUG
            }

            ! parse2-->1 now holds the dictionary address of the word to glue in.

            if (parse2-->1 ~= 0) {
                k = buffer + i;
                #Ifdef TARGET_ZCODE;
                @output_stream 3 k;
                 print (address) parse2-->1;
                @output_stream -3;
                k = k-->0;
                for (l=i : l<i+k : l++) buffer->l = buffer->(l+2);
                i = i + k; buffer->1 = i-2;
                #Ifnot; ! TARGET_GLULX
                k = Glulx_PrintAnyToArray(buffer+i, INPUT_BUFFER_LEN-i, parse2-->1);
                i = i + k; buffer-->0 = i - WORDSIZE;
                #Endif; ! TARGET_
            }
        }
    }

    ! (2) we must glue the newly-typed text onto the end.

    #Ifdef TARGET_ZCODE;
    i = 2+buffer->1; (buffer->1)++; buffer->(i++) = ' ';
    for (j=0 : j<buffer2->1 : i++,j++) {
        buffer->i = buffer2->(j+2);
        (buffer->1)++;
        if (buffer->1 == INPUT_BUFFER_LEN) break;
    }
    #Ifnot; ! TARGET_GLULX
    i = WORDSIZE + buffer-->0;
    (buffer-->0)++; buffer->(i++) = ' ';
    for (j=0 : j<buffer2-->0 : i++,j++) {
        buffer->i = buffer2->(j+WORDSIZE);
        (buffer-->0)++;
        if (buffer-->0 == INPUT_BUFFER_LEN) break;
    }
    #Endif; ! TARGET_

    ! (3) we fill up the buffer with spaces, which is unnecessary, but may
    !     help incorrectly-written interpreters to cope.

    #Ifdef TARGET_ZCODE;
    for (: i<INPUT_BUFFER_LEN : i++) buffer->i = ' ';
    #Endif; ! TARGET_ZCODE

    return REPARSE_CODE;

]

 


Chapter - Adjudicate

[The |Adjudicate| routine tries to see if there is an obvious choice, when
faced with a list of objects (the |match_list|) each of which matches the
player's specification equally well. To do this it makes use of the |context|
(the token type being worked on).

It counts up the number of obvious choices for the given context -- all to
do with where a candidate is, except for 6 (|animate|) which is to
do with whether it is animate or not -- and then:

(a) if only one obvious choice is found, that is returned;
(b) if we are in indefinite mode (don't care which) one of the obvious choices
is returned, or if there is no obvious choice then an non-obvious one is made;
(c) at this stage, we work out whether the objects are distinguishable from
each other or not: if they are all indistinguishable from each other, then
choose one, it doesn't matter which;
(d) otherwise, 0 (meaning, unable to decide) is returned (but remember
that the equivalence classes we've just worked out will be needed by other
routines to clear up this mess, so we can't economise on working them out).

|Adjudicate| returns $-1$ if an error occurred.

returns 1 on multiple-object list?
]

To decide what pattern union is the result of adjudicating under (context - a grammar token) (this is Adjudicate):
	if trace 4, say "   [bracket]Adjudicating match list of size [the number of objects in the match list] in context [the context][line break]   [the descriptor status]";
	[ First, let's see which ones agree with the specified Understand Token. ]
	let the count of hopefuls be 0;
	let the recent hopeful be nothing;
	repeat through the match list of size the number of objects in the match list:
		change the match score list element to 0;
		if the context is:
			-- 'something preferably held':
				if the chosen element is directly in the person asked:
					change the match score list element to how much token agreement's worth;
			-- 'things':
				if the chosen element is not the person asked and the chosen element does not provide the property undescribed directly and the chosen element does not provide the property scenery directly and the scope ceiling of the chosen element is the scope ceiling of the person asked:
					change the match score list element to how much token agreement's worth;
			-- 'things preferably held':
				if the chosen element is directly in the person asked:
					change the match score list element to how much token agreement's worth;
			-- 'other things':
				if we do not suspect what the second noun will be  or  the chosen element is not the likely second noun:
					change the match score list element to how much token agreement's worth;
			-- 'things inside':
				if we do not suspect what the second noun will be:
					if the person asked doesn't have the chosen element:
						change the match score list element to how much token agreement's worth;
				otherwise if the chosen element is directly in the likely second noun:
					change the match score list element to how much token agreement's worth;
			-- 'someone':
				if the chosen element is a creature:
					change the match score list element to how much token agreement's worth;
		if the match score list element is at least 1:
			increment the count of hopefuls;
			now the recent hopeful is the chosen element;
	if the count of hopefuls is 1:
		decide on the recent hopeful as a successful match;
	[ If there is ambiguity about what was typed, but it definitely wasn't animate as required, then return anything; higher up in the parser a suitable error will be given.  (This prevents a question being asked.) ]
	if the count of hopefuls is 0 and the context is 'someone':
		decide on the 0th element of the match list as a [non-]successful match;
	if the indefinite article mode is false:
		exclude all possibilities from the type of descriptor word used;
	RANK the remaining according to their properties and descriptor words used and their location regarding the context;
	if the number of objects [hopefuls] in the match list is 0:
		decide on the null pattern;
	if the indefinite article mode is false:  [ if 'THE', ]
		let the hopeful be the single best guess;
		unless the hopeful is the used-up object:
			if trace 4, say "   Single best-scoring object returned.[close bracket][line break]";
			decide on the hopeful as a successful match;
	if the indefinite article mode is true and the type of descriptor word used includes a plural descriptor:
		if the context is neither 'things' nor 'things preferably held' nor 'other things' nor 'things inside':
			issue "You can’t use multiple objects with that verb." as can’t use multiple objects error;
			decide on the null pattern;  [get here with EXAMINE ALL HAT  ]
		now the count of hopefuls is 0;
		now the recent hopeful is the best guess;
		let include it be false;
		while the recent hopeful is not the used-up object and the count of hopefuls < the number of items wanted:  [ get here with TAKE ALL HAT ]
			begin THE DECIDING WHETHER ALL INCLUDES ACTIVITY with the recent hopeful;
			unless handling THE DECIDING WHETHER ALL INCLUDES ACTIVITY with the recent hopeful:
				we should include it if the rule succeeded;
			otherwise:
				we should include it if the recent hopeful is described not worn;
				if the person asked doesn't have the recent hopeful and the context is either 'things preferably held' or 'other things':
					we shouldn't include it;
				if the recent hopeful is directly in the person asked and the action to be is either the taking action or the removing it from action:
					we shouldn't include it;
			end THE DECIDING WHETHER ALL INCLUDES ACTIVITY with the recent hopeful;
			if trace 4, say "   [if we should include it]Accept[else]Reject[end if]ing it[line break]";
			if we should include it:
				add the recent hopeful to the multiple-object list, allowing duplicates;
				increment the count of hopefuls;
			now the recent hopeful is the best guess;
		if the count of hopefuls < the number of items wanted and the number of items wanted < all items are wanted:   [ get here with TAKE 9 HAT though the error message may be changed. ]
			issue "Only X of those are available." as the not enough of those available error; 
			now the number of items wanted previously wanted is the number of items wanted;
			now the number of items actually received is the count of hopefuls;
			decide on the null pattern;
		now the kind of multi is the context;
		if trace 4, say "   Made multiple object of size [the count of hopefuls][close bracket][line break]";
		decide on the noun domain's bunch of objects;
	[ Now that we have the list of "all" of the objects, let's group indistinguishable objects together. ]
	now the number of match groups is 0;  [ get here with TAKE HAT that provokes a which-did-you-mean. ]
	repeat through the match list's groups    of size  the number of objects in the match list:
		change the chosen element of the match list's groups to the 0th [group];
		if an earlier indistinguishable element is listed in the match list:
			we should say the earlier element of the match list's groups as A\AN\SOME;
			change the chosen element of the match list's groups to the earlier element of the match list's groups;
		if the match list's groups element is [still] 0:
			increment the number of match groups;
			change the chosen element of the match list's groups to the number of match groups;
	if trace 4, say "   Grouped into [the number of match groups] possibilities by name:[line break][the match list]";
	if the indefinite article mode is false and the number of match groups is at least 2:
		let found a clear winner be false;
		let the best score so far be -1;
		repeat through the match score list  of size the number of objects in the match list:
			if the match score list element is greater than the best score so far:
				now the best score so far is the match score list element;
				we just found a clear winner;
			otherwise if the match score list element is the best score so far:
				we no longer have found a clear winner;
		if we haven't found a clear winner:
			if trace 4, say "   Unable to choose best group, so ask player.[close bracket][line break]";
			decide on a bunch of objects;
		if trace 4, say "   Best choices are all from the same group.";
	[  When the player is really vague, or there's a single collection of indistinguishable objects to choose from, choose the one the player most recently acquired, or if the player has none of them, then the one most recently put where it is. ]
	if the number of match groups is 1, we needn't make inferences;
	decide on the best guess as a successful match.

[ Adjudicate context i j k good_ones last n ultimate flag offset;
    #Ifdef DEBUG;
    if (parser_trace >= 4) {
        print "   [Adjudicating match list of size ", number_matched,
        	" in context ", context, "^";
        print "   ";
        if (indef_mode) {
            print "indefinite type: ";
            if (indef_type & OTHER_BIT)  print "other ";
            if (indef_type & MY_BIT)     print "my ";
            if (indef_type & THAT_BIT)   print "that ";
            if (indef_type & PLURAL_BIT) print "plural ";
            if (indef_type & LIT_BIT)    print "lit ";
            if (indef_type & UNLIT_BIT)  print "unlit ";
            if (indef_owner ~= 0) print "owner:", (name) indef_owner;
            new_line;
            print "   number wanted: ";
            if (indef_wanted == INDEF_ALL_WANTED) print "all"; else print indef_wanted;
            new_line;
            print "   most likely GNAs of names: ", indef_cases, "^";
        }
        else print "definite object^";
    }
    #Endif; ! DEBUG

    j = number_matched-1; good_ones = 0; last = match_list-->0;
    for (i=0 : i<=j : i++) {
        n = match_list-->i;
        match_scores-->i = good_ones;
        ultimate = ScopeCeiling(n);

        if (context==HELD_TOKEN && parent(n)==actor)
        {   good_ones++; last=n; }
        if (context==MULTI_TOKEN && ultimate==ScopeCeiling(actor)
            && n~=actor && n hasnt concealed && n hasnt scenery) 
        {   good_ones++; last=n; }
        if (context==MULTIHELD_TOKEN && parent(n)==actor)
        {   good_ones++; last=n; }

        if (context==MULTIEXCEPT_TOKEN or MULTIINSIDE_TOKEN)
        {   if (advance_warning==-1)
            {   if (context==MULTIEXCEPT_TOKEN)
                {   good_ones++; last=n;
                 }
                if (context==MULTIINSIDE_TOKEN)
                {   if (parent(n)~=actor) { good_ones++; last=n; }
                 }
            }
            else
            {   if (context==MULTIEXCEPT_TOKEN && n~=advance_warning)
                {   good_ones++; last=n; }
                if (context==MULTIINSIDE_TOKEN && n in advance_warning)
                {   good_ones++; last=n; }
            }
         }
        if (context==CREATURE_TOKEN && CreatureTest(n)==1)
        {   good_ones++; last=n; }
        
        match_scores-->i = SCORE__IFGOOD*(good_ones - match_scores-->i);
    }
    if (good_ones == 1) return last;

    ! If there is ambiguity about what was typed, but it definitely wasn't
    ! animate as required, then return anything; higher up in the parser
    ! a suitable error will be given.  (This prevents a question being asked.)

    if (context == CREATURE_TOKEN && good_ones == 0) return match_list-->0;

    if (indef_mode == 0) indef_type=0;

    ScoreMatchL(context);
    if (number_matched == 0) return -1;

    if (indef_mode == 0) {
        !  Is there now a single highest-scoring object?
        i = SingleBestGuess();
        if (i >= 0) {

            #Ifdef DEBUG;
            if (parser_trace >= 4) print "   Single best-scoring object returned.]^";
            #Endif; ! DEBUG
            return i;
        }
    }

    if (indef_mode == 1 && indef_type & PLURAL_BIT ~= 0) {
        if (context ~= MULTI_TOKEN or MULTIHELD_TOKEN or MULTIEXCEPT_TOKEN
                     or MULTIINSIDE_TOKEN) {
            etype = MULTI_PE;
            return -1;
        }
        i = 0; offset = multiple_object-->0;
        for (j=BestGuess(): j~=-1 && i<indef_wanted && i+offset<MATCH_LIST_WORDS-1:
        	j=BestGuess()) {
            flag = 0;    ! flag is a rulebook outcome for .    the it does not outcome.  
            BeginActivity(DECIDING_WHETHER_ALL_INC_ACT, j);
            if ((ForActivity(DECIDING_WHETHER_ALL_INC_ACT, j)) == 0) {

                if (j hasnt concealed && j hasnt worn) flag = 1;
            
                if (context == MULTIHELD_TOKEN or MULTIEXCEPT_TOKEN && parent(j) ~= actor)
                    flag = 0;

                if (action_to_be == ##Take or ##Remove && parent(j) == actor)
                    flag = 0;

                k = ChooseObjects(j, flag);

                if (k == 1)   !  "it does"
                    flag = 1;   
                else {
                    if (k == 2) flag = 0;  ! "it does not"
                }
            } else {
                flag = 0; if (RulebookSucceeded()) flag = 1;  
            }
            EndActivity(DECIDING_WHETHER_ALL_INC_ACT, j);
            if (flag == 1) {     ! if the rule succeeded, 
                i++; multiple_object-->(i+offset) = j;
                #Ifdef DEBUG;
                if (parser_trace >= 4) print "   Accepting it^";
                #Endif; ! DEBUG
            }
            else {
                i = i;
                #Ifdef DEBUG;
                if (parser_trace >= 4) print "   Rejecting it^";
                #Endif; ! DEBUG
            }
        }
        if (i < indef_wanted && indef_wanted < INDEF_ALL_WANTED) {
            etype = TOOFEW_PE; multi_wanted = indef_wanted;
            multi_had=i;
            return -1;
        }
        multiple_object-->0 = i+offset;
        multi_context = context;
        #Ifdef DEBUG;
        if (parser_trace >= 4)
            print "   Made multiple object of size ", i, "^";
        #Endif; ! DEBUG
        return 1;
    }

    for (i=0 : i<number_matched : i++) match_classes-->i = 0;

    n = 1;
    for (i=0 : i<number_matched : i++)
        if (match_classes-->i == 0) {
            match_classes-->i = n++; flag = 0;
            for (j=i+1 : j<number_matched : j++)
                if (match_classes-->j == 0 && Identical(match_list-->i, match_list-->j) == 1) {
                    flag=1;
                    match_classes-->j = match_classes-->i;
                }
            if (flag == 1) match_classes-->i = 1-n;
        }
     n--; number_of_classes = n;

    #Ifdef DEBUG;
    if (parser_trace >= 4) {
        print "   Grouped into ", n, " possibilities by name:^";
        for (i=0 : i<number_matched : i++)
            if (match_classes-->i > 0)
                print "   ", (The) match_list-->i, " (", match_list-->i, ")  ---  group ",
                  match_classes-->i, "^";
    }
    #Endif; ! DEBUG

    if (indef_mode == 0) 
    {
        if (n > 1) 
        {
            k = -1;
            for (i=0 : i<number_matched : i++) 
            {
                if (match_scores-->i > k) 
                {
                    k = match_scores-->i;
                    j = match_classes-->i; j = j*j;
                    flag = 0;
                }
                else if (match_scores-->i == k) 
                {
                        if ((match_classes-->i) * (match_classes-->i) ~= j)
                            flag = 1;
                }
            }

            if (flag) 
	    {
                #Ifdef DEBUG;
                if (parser_trace >= 4) print "   Unable to choose best group, so ask player.^";
                #Endif; ! DEBUG
                return 0;
            }
            #Ifdef DEBUG;
            if (parser_trace >= 4) print "   Best choices are all from the same group.^";
            #Endif; ! DEBUG
        }
    }

    !  When the player is really vague, or there's a single collection of
    !  indistinguishable objects to choose from, choose the one the player
    !  most recently acquired, or if the player has none of them, then
    !  the one most recently put where it is.

    if (n == 1) dont_infer = false; !true;
    return BestGuess();
]



Chapter - Match List

[The match list is an array, |match_list-->|, which holds the current best
guesses at what object(s) a portion of the command refers to. The global
|number_matched| is set to the current length of the |match_list|.

When the parser sees a possible match of object |obj| at quality level |q|,
it calls |MakeMatch(obj, q)|. If this is the best quality match so far, then
we wipe out all the previous matches and start a new list with this one.
If it's only as good as the best so far, we add it to the list (provided
we haven't run out of space, and provided it isn't in the list already).
If it's worse, we ignore it altogether.

I6 tokens in the form |noun=Filter| or |Attribute| are ``noun filter tokens'',
and mean that the match list should be filtered to accept only nouns which
are acceptable to the given routine, or have the given attribute. Such a
token is in force if |token_filter| is used. (I7 makes no use of this in the
attribute case, which is deprecated nowadays.)

Quality is essentially the number of words in the command referring to
the object: the idea is that "red panic button" is better than "red button"
or "panic".]

To add (obj - an object) to the match list assuming (quality - a number) qualifies it (this is MakeMatch):
	if trace 6, say "    Match with quality [quality][line break]";
	if the noun filter is not currently blank and the noun filter disallows the obj:
		if trace 6, say "    Match filtered out: token filter [noun filter][line break]";
		stop the action;
	if the quality < the number of words matched per object, stop the action;
	if the quality > the number of words matched per object:
		now the number of objects in the match list    is  0;  [ empty it out of all the lesser matches ]
		now the number of words matched per object is  the quality;
	otherwise:
		if the number of objects in the match list >= the maximum number of things understood at once, stop the action;
		if the obj is listed in the match list of size the number of objects in the match list, stop the action;
	append the obj to the match list of size the number of objects in the match list;
	if trace 6, say "    Match added to list[line break]".

[ MakeMatch obj quality i;
    #Ifdef DEBUG;
    if (parser_trace >= 6) print "    Match with quality ",quality,"^";
    #Endif; ! DEBUG
    if (token_filter ~= 0 && ConsultNounFilterToken(obj) == 0) {
        #Ifdef DEBUG;
        if (parser_trace >= 6) print "    Match filtered out: token filter ", token_filter, "^";
        #Endif; ! DEBUG
        rtrue;
    }
    if (quality < match_length) rtrue;
    if (quality > match_length) { match_length = quality; number_matched = 0; }
    else {
        if (number_matched >= MATCH_LIST_WORDS) rtrue;
        for (i=0 : i<number_matched : i++)
            if (match_list-->i == obj) rtrue;
    }
    match_list-->number_matched++ = obj;
    #Ifdef DEBUG;
    if (parser_trace >= 6) print "    Match added to list^";
    #Endif; ! DEBUG
]

To decide if the noun filter disallows (obj - an object) (this is ConsultNounFilterToken):
	if the noun filter is currently a rule:
		now the noun is the obj;
		decide on whether or not the noun filter returns true;
	if the obj provides the property (noun filter as an adjective) directly, yes.

[ ConsultNounFilterToken obj;
    if (token_filter ofclass Routine) {
	    noun = obj;
    	return indirect(token_filter);
    }
    if (obj has (token_filter-1)) rtrue;
    rfalse;
]

Chapter - ScoreMatchL

[|ScoreMatchL| scores the match list for quality in terms of what the player
has vaguely asked for. Points are awarded for conforming with requirements
like ``my'', and so on. Remove from the match list any entries which fail
the basic requirements of the descriptors. (The scoring system used to
evaluate the possibilities is discussed in detail in the DM4.)]

To decide what number is the weight given it: (- SCORE__CHOOSEOBJ -).
To decide what number is how much token agreement's worth : (- SCORE__IFGOOD -).
To decide what number is how much being unconcealed's worth: (- SCORE__UNCONCEALED -).
To decide what number is how much the best location's worth: (- SCORE__BESTLOC -).
To decide what number is how much the second-best location's worth: (- SCORE__NEXTBESTLOC -).
To decide what number is how much not being a direction's worth: (- SCORE__NOTCOMPASS -).
To decide what number is how much not being scenery's worth: (- SCORE__NOTSCENERY -).
To decide what number is how much not being the actor's worth: (- SCORE__NOTACTOR -).
To decide what number is how much gender-animation agreement's worth: (- SCORE__GNA -).
[To decide what number is the score divisor: (- SCORE__DIVISOR -).] [unused?]

Use preferred held objects translates as (- Constant PREFER_HELD; -).
Use preferred held objects.

Include (-
Constant SCORE__CHOOSEOBJ = 1000;
Constant SCORE__IFGOOD = 1000;  ! Changed from 500 because 1) the name was unused anyway, and 2) a naked 1000 is used in Adjudicate() for this purpose, per page 240 of the DM4.  I'll use it there.
Constant SCORE__UNCONCEALED = 100;
Constant SCORE__BESTLOC = 60;
Constant SCORE__NEXTBESTLOC = 40;
Constant SCORE__NOTCOMPASS = 20;
Constant SCORE__NOTSCENERY = 10;
Constant SCORE__NOTACTOR = 5;
Constant SCORE__GNA = 1;
!Constant SCORE__DIVISOR = 20;
-).

To rank the remaining according to their properties and descriptor words used and their location regarding (context - a grammar token) (this is ScoreMatchL):
	[ First rule about creating a noun filter based on what descriptor words the player typed in: initialize minimum required score. ]
	let the threshold be zero;
	[ A rule about MY, HIS, HER, THEIR, etc. ]
	if the type of descriptor word used includes a possessive descriptor, increment threshold;
	[ A rule about THAT as in THAT BOX ]
	if the type of descriptor word used includes a THAT descriptor, increment threshold; [as in "that box"]
	[ A rule about LIT/LIGHTED things ]
	if the type of descriptor word used includes a lit descriptor, increment threshold;
	[ A rule about UNLIT/UNLIGHTED things ]
	if the type of descriptor word used includes an unlit descriptor, increment threshold;
	[ A rule about pronouns that are set to a noun should have a say in disallowing nouns. ]
	unless what the pronoun stands for is nothing, increment threshold;
	[ end rulebook ]
	if trace 4, say "   Scoring match list: indef mode [the indefinite article mode as a debugging number] type [the type of descriptor word used as a debugging number], satisfying [threshold] requirements:[line break][run paragraph on]";
	[ This paragraph of code exists only because of the "use preferred held objects" option. ]
	let how much being in the actor's pocket's worth  be  how much the best location's worth; 
	let how much being in the actor's room's worth  be  how much the second-best location's worth;
	if the preferred held objects option is active:
		if the action to be is either the taking action or the removing it from action: [then swap them]
			now how much being in the actor's pocket's worth  is  how much the second-best location's worth; 
			now how much being in the actor's room's worth  is  how much the best location's worth;
	otherwise:
		unless the context is either 'something preferably held' or 'things preferably held' or 'other things':[then swap them]
			now how much being in the actor's pocket's worth  is  how much the second-best location's worth; 
			now how much being in the actor's room's worth  is  how much the best location's worth;
	repeat through the match list of size the number of objects in the match list:
		[ First excluding rule initializes variables. ]
		let its owner be the parent of the chosen element;
		let its score be 0;
		[ A excluding rule about MY ]
		if the type of descriptor word used includes a possessive descriptor and its owner is the person asked, increment its score;
		[ A excluding rule about THAT as in THAT BOX ]
		if the type of descriptor word used includes a THAT descriptor and its owner is the actor's scopewise location, increment its score;
		[ A excluding rule about the LIT/LIGHTED property ]
		if the type of descriptor word used includes a lit descriptor and the chosen element provides the property lit directly, increment its score;
		[ A excluding rule about the UNLIT/UNLIGHTED property ]
		if the type of descriptor word used includes an unlit descriptor and the chosen element does not provide the property lit directly, increment its score;
		[ A excluding rule about things which a pronoun refers to ]
		if its owner is what the pronoun stands for and its owner is not nothing, increment its score;
		[ end rulebook ]
		if its score is less than the threshold:
			if trace 4, say "   [The chosen element] ([the chosen element as a debugging number]) in [the its owner] is rejected (doesn't match descriptors)[line break]";
			change the chosen element of the match list to the used-up object;
		otherwise:
			[ First ranking rule: invoke the DOES THE PLAYER MEAN rules (usually) and initialize the score. ]
			now its score is the weight given it multiplied by how much does the player mean the chosen element;
			[ A rule about the undescribed/concealed property ]
			if the chosen element does not provide the property undescribed directly:
				increase its score by how much being unconcealed's worth;
			[ A rule about the liklihood given its location ]
			if its owner is the person asked:
				increase its score by how much being in the actor's pocket's worth;
			otherwise if its owner is the actor's scopewise location:
				increase its score by how much being in the actor's room's worth;
			otherwise if its owner is not the compass:
				increase its score by how much not being a direction's worth;
			[ A rule about the scenery property ]
			if the chosen element does not provide the property scenery directly:
				increase its score by how much not being scenery's worth;
			[ A rule about preferring actions on things other than yourself ]
			if the chosen element is not the person asked:
				increase its score by how much not being the actor's worth;
			[ A rule about the his/her/it/they/that/those words implying certain things ]
			if the grammatical case includes any of the gender-animation usages for the chosen element:
				increase its score by how much gender-animation agreement's worth;
			[ end rulebook ]
			change the match score list element to its score + the match score list element;
			if trace 4, say "     [The chosen element] ([the chosen element as a debugging number]) in [the its owner] : [the match score list element] points[line break]";
	[ Now shorten the list by removing all entries which are "the used-up object". ]
	while the number of objects in the match list is at least one:
		if the used-up object is listed in the match list of size the number of objects in the match list:
			shift the match list left between the chosen and the number of objects in the match list using a scratchpad;
			shift the match score list left between the chosen and the number of objects in the match list using scratchspace;
			decrement the number of objects in the match list;
		otherwise:
			stop.
 

[ ScoreMatchL context its_owner its_score obj i j threshold met a_s l_s;
!   if (indef_type & OTHER_BIT ~= 0) threshold++;
    if (indef_type & MY_BIT ~= 0)    threshold++;
    if (indef_type & THAT_BIT ~= 0)  threshold++;
    if (indef_type & LIT_BIT ~= 0)   threshold++;
    if (indef_type & UNLIT_BIT ~= 0) threshold++;
    if (indef_owner ~= nothing)      threshold++;

    #Ifdef DEBUG;
    if (parser_trace >= 4) print "   Scoring match list: indef mode ", indef_mode, " type ",
      indef_type, ", satisfying ", threshold, " requirements:^";
    #Endif; ! DEBUG

    #ifdef PREFER_HELD;
    a_s = SCORE__BESTLOC; l_s = SCORE__NEXTBESTLOC;
    if (action_to_be == ##Take or ##Remove) {
        a_s = SCORE__NEXTBESTLOC; l_s = SCORE__BESTLOC;
    }
    context = context;  ! silence warning
    #ifnot;
    a_s = SCORE__NEXTBESTLOC; l_s = SCORE__BESTLOC;
    if (context == HELD_TOKEN or MULTIHELD_TOKEN or MULTIEXCEPT_TOKEN) {
        a_s = SCORE__BESTLOC; l_s = SCORE__NEXTBESTLOC;
    }
    #endif; ! PREFER_HELD

    for (i=0 : i<number_matched : i++) {
        obj = match_list-->i; its_owner = parent(obj); its_score=0; met=0;

        !      if (indef_type & OTHER_BIT ~= 0
        !          &&  obj ~= itobj or himobj or herobj) met++;
        if (indef_type & MY_BIT ~= 0 && its_owner == actor) met++;
        if (indef_type & THAT_BIT ~= 0 && its_owner == actors_location) met++;
        if (indef_type & LIT_BIT ~= 0 && obj has light) met++;
        if (indef_type & UNLIT_BIT ~= 0 && obj hasnt light) met++;
        if (indef_owner ~= 0 && its_owner == indef_owner) met++;

        if (met < threshold) {
            #Ifdef DEBUG;
            if (parser_trace >= 4)
            	print "   ", (The) match_list-->i, " (", match_list-->i, ") in ",
            	    (the) its_owner, " is rejected (doesn't match descriptors)^";
            #Endif; ! DEBUG
            match_list-->i = -1;
        }
        else {
            its_score = 0;
            if (obj hasnt concealed) its_score = SCORE__UNCONCEALED;

            if (its_owner == actor) its_score = its_score + a_s;
            else
                if (its_owner == actors_location) its_score = its_score + l_s;
                else
                    if (its_owner ~= compass) its_score = its_score + SCORE__NOTCOMPASS;

            its_score = its_score + SCORE__CHOOSEOBJ * ChooseObjects(obj, 2);

            if (obj hasnt scenery) its_score = its_score + SCORE__NOTSCENERY;
            if (obj ~= actor) its_score = its_score + SCORE__NOTACTOR;

            !   A small bonus for having the correct GNA,
            !   for sorting out ambiguous articles and the like.

            if (indef_cases & (PowersOfTwo_TB-->(GetGNAOfObject(obj))))
                its_score = its_score + SCORE__GNA;

            match_scores-->i = match_scores-->i + its_score;
            #Ifdef DEBUG;
            if (parser_trace >= 4) print "     ", (The) match_list-->i, " (", match_list-->i,
              ") in ", (the) its_owner, " : ", match_scores-->i, " points^";
            #Endif; ! DEBUG
        }
     }

    for (i=0 : i<number_matched : i++) {
        while (match_list-->i == -1) {
            if (i == number_matched-1) { number_matched--; break; }
            for (j=i : j<number_matched-1 : j++) {
                match_list-->j = match_list-->(j+1);
                match_scores-->j = match_scores-->(j+1);
            }
            number_matched--;
        }
    }
]

Chapter - BestGuess

[|BestGuess| makes the best guess it can out of the match list, assuming that
everything in the match list is textually as good as everything else;
however it ignores items marked as $-1$, and so marks anything it chooses.
It returns $-1$ if there are no possible choices.]

To decide which object is the best guess (this is BestGuess):
	let the best be at the 0th position;
	let the best score so far be -1;
	repeat through the match score list of size the number of objects in the match list:
		if the match list element is not the used-up object:
			if the number element > the best score so far:
				now the best score so far is the number element;
				now the best is at the chosen position;
	if trace 4, say "[if the best score so far is less than zero]   Best guess ran out of choices[line break][otherwise]   Best guess [the best element of the match list] ([best element of the match list as a debugging number])[line break]";
	if the best score so far is less than zero, decide on the used-up object;
	let the best object be the best element of the match list;
	change the best element of the match list  to  the used-up object;
	decide on the best object.

[ BestGuess  earliest its_score best i;
    earliest = 0; best = -1;
    for (i=0 : i<number_matched : i++) {
        if (match_list-->i >= 0) {
            its_score = match_scores-->i;
            if (its_score > best) { best = its_score; earliest = i; }
        }
    }
    #Ifdef DEBUG;
    if (parser_trace >= 4)
      if (best < 0) print "   Best guess ran out of choices^";
      else print "   Best guess ", (the) match_list-->earliest,
      	" (", match_list-->earliest, ")^";
    #Endif; ! DEBUG
    if (best < 0) return -1;
    i = match_list-->earliest;
    match_list-->earliest = -1;
    return i;
]

Chapter - SingleBestGuess

[|SingleBestGuess| returns the highest-scoring object in the match list
if it is the clear winner, or returns $-1$ if there is no clear winner.]

To decide which object is the single best guess (this is SingleBestGuess):
	let the best object be the used-up object;
	let the best score so far be -1000;
	repeat through the match score list of size the number of objects in the match list:
		if the number element is the best score so far, now the best object is the used-up object;
		if the number element > the best score so far:
			now the best score so far is the number element;
			now the best object is the match list element;
	decide on the best object.

[ SingleBestGuess  earliest its_score best i;
    earliest = -1; best = -1000;
    for (i=0 : i<number_matched : i++) {
        its_score = match_scores-->i;
        if (its_score == best) earliest = -1;
        if (its_score > best) { best = its_score; earliest = match_list-->i; }
    }
    return earliest;
]

Chapter - Identical

[|Identical| decides whether or not two objects can be distinguished from each
other by anything the player can type. If not, it returns |true|. (This
routine is critical to the handling of plurals, and the list-writer
requires it to be an equivalence relation between objects: but it is,
because it is equivalent to $O_1\sim O_2$ if and only if $f(O_1) = f(O_2)$
for some function $f$.)]

To decide if (obj1 - an object) is not indistinguishable from (obj2 - an object):
	if obj1 is indistinguishable from obj2, no; otherwise yes.

To decide if (obj1 - an object) is indistinguishable from (obj2 - an object) (this is Identical):
	if obj1 is obj2, yes;
	if obj1 is nothing or obj2 is nothing, no;
	if obj1 is a direction or obj2 is a direction, no;
	if the hidden parse name rule of obj1 is not currently blank or the hidden parse name rule of obj2 is not currently blank:
		if the hidden parse name rule of obj1 is not the hidden parse name rule of obj2, no;
		now What the parser's doing is identifying identical things;
		now Parser one is the obj1;
		now parser object two is the obj2;
		let the saved position be the parser's current word position;
		let the return value be the parse name rule of obj1 considered directly;
		now the parser's current word position is the saved position;
		if the return value is -1, yes;
		if the return value is -2, no;
	let find a difference be a truth state;
	repeat through the name list of obj1: 
		we may find a difference;
		if the understood word element is listed in the name list of obj2, we no longer find a difference;
		if we find a difference, no;
	repeat through the name list of obj2: 
		we may find a difference;
		if the understood word element is listed in the name list of obj1, we no longer find a difference;
		if we find a difference, no;
	yes.


[ Identical o1 o2 p1 p2 n1 n2 i j flag;
    if (o1 == o2) rtrue;  ! This should never happen, but to be on the safe side
    if (o1 == 0 || o2 == 0) rfalse;  ! Similarly
    if (o1 ofclass K3_direction || o2 ofclass K3_direction) rfalse; ! Saves time

    !  What complicates things is that o1 or o2 might have a parsing routine,
    !  so the parser can't know from here whether they are or aren't the same.
    !  If they have different parsing routines, we simply assume they're
    !  different.  If they have the same routine (which they probably got from
    !  a class definition) then the decision process is as follows:
    !
    !     the routine is called (with self being o1, not that it matters)
    !       with noun and second being set to o1 and o2, and action being set
    !       to the fake action TheSame.  If it returns -1, they are found
    !       identical; if -2, different; and if >=0, then the usual method
    !       is used instead.

    if (o1.parse_name ~= 0 || o2.parse_name ~= 0) {
      if (o1.parse_name ~= o2.parse_name) rfalse;
      parser_action = ##TheSame; parser_one = o1; parser_two = o2;
      j = wn; i = RunRoutines(o1,parse_name); wn = j;
      if (i == -1) rtrue;
      if (i == -2) rfalse;
    }

    !  This is the default algorithm: do they have the same words in their
    !  "name" (i.e. property no. 1) properties.  (Note that the following allows
    !  for repeated words and words in different orders.)

    p1 = o1.&1; n1 = (o1.#1)/WORDSIZE;
    p2 = o2.&1; n2 = (o2.#1)/WORDSIZE;

    !  for (i=0 : i<n1 : i++) { print (address) p1-->i, " "; } new_line;
    !  for (i=0 : i<n2 : i++) { print (address) p2-->i, " "; } new_line;

    for (i=0 : i<n1 : i++) {
        flag = 0;
        for (j=0 : j<n2 : j++)
            if (p1-->i == p2-->j) flag = 1;
        if (flag == 0) rfalse;
    }

    for (j=0 : j<n2 : j++) {
        flag = 0;
        for (i=0 : i<n1 : i++)
            if (p1-->i == p2-->j) flag = 1;
        if (flag == 0) rfalse;
    }

    !  print "Which are identical!^";
    rtrue;
]


Chapter - Print Command

[|PrintCommand| reconstructs the command as it presently reads, from the
pattern which has been built up.

If |from| is 0, it starts with the verb: then it goes through the pattern.

The other parameter is |emptyf| -- a flag: if 0, it goes up to |pcount|:
if 1, it goes up to |pcount|-1.

Note that verbs and prepositions are printed out of the dictionary:
and that since the dictionary may only preserve the first six characters
of a word (in a V3 game), we have to hand-code the longer words needed.
At present, I7 doesn't do this, but it probably should.

(Recall that pattern entries are 0 for ``multiple object'', 1 for ``special
word'', 2 to |REPARSE_CODE-1| are object numbers and |REPARSE_CODE+n| means
the preposition |n|.)]

To clarify the parser's choice of (inferred - a number) -th element (this is PrintInferredCommand):
	if inferred is not 0 and inferred is the understood command's current position minus 1:  [ ensure valid array index ]
		let the item be the inferred element of the player's understood command;
		if the item is currently an object:
			begin the clarifying the parser’s choice activity with the item as an object;
			if handling clarifying the parser’s choice activity with the item as an object, say "([recap of command from inferred])[line break]";
			end the clarifying the parser’s choice activity with the item as an object;
			stop;
	say "([recap of command from inferred])[line break]".

[ PrintInferredCommand from singleton_noun;
	singleton_noun = FALSE;
	if ((from ~= 0) && (from == pcount-1) &&
		(pattern-->from > 1) && (pattern-->from < REPARSE_CODE))
			singleton_noun = TRUE;

	if (singleton_noun) {
		BeginActivity(CLARIFYING_PARSERS_CHOICE_ACT, pattern-->from);
		if (ForActivity(CLARIFYING_PARSERS_CHOICE_ACT, pattern-->from) == 0) {
			print "("; PrintCommand(from); print ")^";
		}
		EndActivity(CLARIFYING_PARSERS_CHOICE_ACT, pattern-->from);
	} else {
		print "("; PrintCommand(from); print ")^";
	}
]

To say recap of command from (position to recap from - number) (this is PrintCommand):
	let need a space be false;
	if the position to recap from is 0:
		if the verb is an abbreviation then say its expanded form otherwise:
			if the verb is invalid then say so otherwise:
				say the verb [as-is];
		increment the position to recap from;
		we will need a space;
	repeat through the player's understood command of size the understood command's current position starting at the position to recap from:
		let i be the player's understood command element;
		if i is the null pattern, next;
		if we need a space, say " ";
		if i is a bunch of objects:
			say "those things";
		otherwise if i is that special word:
			say "that";
		otherwise if i is currently an understood word:
			say "[i as an understood word]";
		otherwise:
			say the i as an object;
		we may need a space again.


[ PrintCommand from;  ];

[!  otherwise known as I7's  "recap of command" -- when used without a parameter;]
[ PrintCommand from i k spacing_flag;
    if (from == 0) {
        i = verb_word;
        if (LanguageVerb(i) == 0)
            if (PrintVerb(i) == 0) print (address) i;
        from++; spacing_flag = true;
    }
    for (k=from : k<pcount : k++) {
        i = pattern-->k;
        if (i == PATTERN_NULL) continue;
        if (spacing_flag) print (char) ' ';
        if (i == 0) { print (string) THOSET__TX; jump TokenPrinted; }
        if (i == 1) { print (string) THAT__TX;   jump TokenPrinted; }
        if (i >= REPARSE_CODE)
            print (address) VM_NumberToDictionaryAddress(i-REPARSE_CODE);
        else
            if (i ofclass K3_direction)
                print (LanguageDirection) i; ! the direction name as adverb
            else
                print (the) i;
      .TokenPrinted;
        spacing_flag = true;
    }
]
 

Chapter - CantSee

[The |CantSee| routine returns a good error number for the situation where
the last word looked at didn't seem to refer to any object in context.

The idea is that: if the actor is in a location (but not inside something
like, for instance, a tank which is in that location) then an attempt to
refer to one of the words listed as meaningful-but-irrelevant there
will cause ``you don't need to refer to that in this game'' rather than
``no such thing'' or ``what's `it'?''.

(The advantage of not having looked at ``irrelevant'' local nouns until
now is that it stops them from clogging up the ambiguity-resolving process.
Thus game objects always triumph over scenery.)]

To if it's more specific decide on (cpe - a command parser error): 
(- if ({cpe} > (+ the latest parser error +)) return {cpe}; -).

To decide if (cpe1 - a command parser error) is more specific than (cpe2 - a command parser error):
(- ({cpe1} > {cpe2}) -).

To decide which command parser error is a more specific error if possible (this is CantSee):
	now remember where the typo's at is where the previous typo's at;
	if the scope decider is not currently blank:
		now the context that this noun didn't make sense within is the scope decider;
		decide on the noun did not make sense in that context error;
	decrement the parser's current word position;
	let the word be the next word;
	if the word is the pronoun used:
		now the word is the next word if any;
		decrement the parser's current word position;
		if the word is no more words left to parse or the (the understood command's current position) element of the grammar line tokens is not the end of line token:
			split the (the understood command's current position - 1) element of the grammar line tokens into the current grammar token & current token type;
			if the current token type is either '<description of values>' or '<adjective>':
				if it's more specific decide on the referred to a determination of scope error;
			otherwise:
				now the saved pronoun used is the pronoun used;
				now the saved pronoun reference object is the pronoun reference object;
				if it's more specific decide on the can’t see it at the moment error;
	if it's more specific decide on the can’t see any such thing error;
	otherwise decide on the latest parser error.


[ CantSee  i w e;
    saved_oops=oops_from;

    if (scope_token ~= 0) {
        scope_error = scope_token; return ASKSCOPE_PE;
    }

    wn--; w = NextWord();
    e = CANTSEE_PE;
    if (w == pronoun_word) {
		w = NextWordStopped(); wn--;
		if ((w == -1) || (line_token-->(pcount) ~= ENDIT_TOKEN)) {
	    		AnalyseToken(line_token-->(pcount-1));
			!DebugToken(pcount-1); print " ", found_ttype, "^";
			if (found_ttype == ROUTINE_FILTER_TT or ATTR_FILTER_TT)
				e = NOTINCONTEXT_PE;
			else {
				pronoun__word = pronoun_word; 
				pronoun__obj = pronoun_obj;
				e = ITGONE_PE;
			}
		}
    }
    
    if (etype > e) return etype;
    return e;
]


Chapter - Multiple Object List

[The |MultiAdd| routine adds object |o| to the multiple-object-list. This is
only allowed to hold |MATCH_LIST_WORDS| minus one objects at most, at which
point it ignores any new entries (and sets a global flag so that a warning
may later be printed if need be).

The |MultiSub| routine deletes object |o| from the multiple-object-list.
It returns 0 if the object was there in the first place, and 9 (because
this is the appropriate error number in |Parser()|) if it wasn't.
(However, nowhere in the code uses that return value.)

The |MultiFilter| routine goes through the multiple-object-list and throws
out anything without the given attribute |attr| set.

|ReviseMulti| goes through the multiple-object list and removes certain items. 
Some grammar tokens like [other things] and [things inside] refer to the other
noun's grammar token, such as [container].  So ReviseMulti enables this 
cross-talk between token by filtering out objects that relate to the other 
noun in the indicated way. ]

To add (obj - an object) to the multiple-object list, allowing duplicates (this is MultiAdd):
	let the size be the number of elements in the multiple-object list;
	if the size is the maximum number of things understood at once - 1:
		now the multiple-object list overflowed is true;
		stop the action;
	if not allowing duplicates:
		if the obj is listed in the multiple-object list, stop the action;
	increment size;
	change the size element of the multiple-object list to the obj;
	change the multiple-object list to have size elements.

[ MultiAdd o i j;
    i = multiple_object-->0;
    if (i == MATCH_LIST_WORDS-1) 
    {    toomany_flag = 1; 
         rtrue; 
    }
    for (j=1 : j<=i : j++)
        if (o == multiple_object-->j) rtrue;
    i++;
    multiple_object-->i = o;
    multiple_object-->0 = i;
]

[ Lacks cache optimizations. Can easily be generalized for all 1-based arrays. ]
To remove (obj - an object) from the multiple-object list (this is MultiSub): [MultiSubtract, not MultiSubroutine]
	let the final position be the number of elements in the multiple-object list;
	if the obj is listed in the multiple-object list:
		shift the multiple-object list left between the chosen and the final position using some scratch space;
		decrement the final position;
		change the multiple-object list to have (final position) elements.
		[return 0;]
	[return the not sure what it refers to error.]

[ MultiSub o i j k;
    i = multiple_object-->0;
    for (j=1 : j<=i : j++)
        if (o == multiple_object-->j) {
            for (k=j : k<=i : k++) multiple_object-->k = multiple_object-->(k+1);
            multiple_object-->0 = --i;
            return 0;
        }
    return VAGUE_PE;
]

[ Unused?  Can easily be generalized for all 1-based arrays if MultiSub is as well. ]
To remove all except (attr - an either/or property) objects/things from the multiple-object list (this is MultiFilter):
	repeat through the multiple-object list:
		if the chosen element does not provide the property attr directly:
			remove the chosen element from the multiple-object list;
			now the chosen [row] is at the 0th position. [ which restarts the loop ]

[ MultiFilter attr  i j o;
	.MFiltl;
    i = multiple_object-->0;
    for (j=1 : j<=i : j++) {
        o = multiple_object-->j;
        if (o hasnt attr) { MultiSub(o); jump Mfiltl; }
    }
]


[ The 'other things' grammar token filters out the second noun. ]
[ The 'things inside' grammar token filters out what's outside the second noun. ]
[ The 'things' grammar token, during TAKE ALL..., filters out anything outside the actor's scope. ]
To filter the multiple-object list by the grammar token & (other noun - an object) (this is ReviseMulti):
	if trace 4, say "   Revising multiple object list of size [number of elements in the multiple-object list] with 2nd [other noun][line break]";
	let kept be 0;
	if the kind of multi is 'other things':
		remove the other noun from the multiple-object list;
[		repeat through the multiple-object list:
			if [as long as] the chosen element is not the second noun:
				increment kept;
				change the kept element of the multiple-object list to the chosen element;
			[otherwise the chosen element is removed from the list. ]
		change the multiple-object list to have kept elements;]
	otherwise if the kind of multi is 'things inside':
		repeat through the multiple-object list:
			if [as long as] the chosen element is directly in the other noun:
				increment kept;
				change the kept element of the multiple-object list to the chosen element;
		change the multiple-object list to have kept elements;
	otherwise if the kind of multi is 'things' and the action to be is the taking action:
		if trace 4, say "   Token 2 plural case: number with actor [the person asked][line break]"; 
		if the TAKE ALL exception is 2:
			repeat through the multiple-object list:
				if [as long as] the scope ceiling of the chosen element is the scope ceiling of the person asked:
					increment kept;
					change the kept element of the multiple-object list to the chosen element;
				[otherwise the chosen element is removed from the list. ]
			change the multiple-object list to have kept elements;
	if trace 4, say "   Done: new size [number of elements in the multiple-object list][line break]".
[	if the number of elements in the multiple-object list is 0, decide on the nothing to do error;
	decide on no errors here.]

[ ReviseMulti second_p  i low;
    #Ifdef DEBUG;
    if (parser_trace >= 4)
    	print "   Revising multiple object list of size ", multiple_object-->0,
     	" with 2nd ", (name) second_p, "^";
    #Endif; ! DEBUG

    if (multi_context == MULTIEXCEPT_TOKEN or MULTIINSIDE_TOKEN) {
        for (i=1,low=0 : i<=multiple_object-->0 : i++) {
            if ( (multi_context==MULTIEXCEPT_TOKEN && multiple_object-->i ~= second_p) ||
                 (multi_context==MULTIINSIDE_TOKEN && multiple_object-->i in second_p)) {
                low++;
                multiple_object-->low = multiple_object-->i;
            }
        }
        multiple_object-->0 = low;
    }

    if (multi_context == MULTI_TOKEN && action_to_be == ##Take) {
        #Ifdef DEBUG;
        if (parser_trace >= 4) print "   Token 2 plural case: number with actor ", low, "^";
        #Endif; ! DEBUG
        if (take_all_rule == 2) {
            for (i=1,low=0 : i<=multiple_object-->0 : i++) {
                if (ScopeCeiling(multiple_object-->i) == ScopeCeiling(actor)) {
                    low++;
                    multiple_object-->low = multiple_object-->i;
                }
            }
            multiple_object-->0 = low;
        }
    }

    i = multiple_object-->0;
    #Ifdef DEBUG;
    if (parser_trace >= 4) print "   Done: new size ", i, "^";
    #Endif; ! DEBUG
    if (i == 0) return NOTHING_PE;
    return 0;
]



Book - Scope

Chapter - Scope

[The scope of an actor is the set of objects which he can refer to in typed
commands, which is normally the same as the set of visible objects; but this
can be modified. This is how I7 handles tokens like ``[any room]''.

Scope determination is done by calling |SearchScope| to iterate through the
objects in scope, and ``visit'' each one: which means, carry out some task
for each as we get there. The task depends on the current value of
|scope_reason|, which is |PARSING_REASON| when the parser is matching
command text against object names.

The scope machinery is built on a number of levels, each making use only
of lower levels:
(0) Either |NounDomain|, |TestScope| or |LoopOverScope| makes one or more
calls to |SearchScope| (on level 1). The point of making multiple calls
is to influence the order in which items in scope are visited, which improves
the quality of ``take all''-style multiple object lists, for instance.
(1) |SearchScope| searches for the objects in scope which are within first
one domain, and then another: for instance, first within the current room
but not within the current actor, and then within the current actor. It can
be called either from level 0, or externally from the choose-objects
machinery, but is not recursive. It works within the context of a given
token in the parser (when called for |PARSING_REASON|) and in particular
the |multiinside| token, and also handles testing commands, scope tokens,
scope in darkness, and intervention by the I7 ``deciding the scope of''
activity. Most of its actual searches are delegated to |ScopeWithin| (level
2), but it also uses |DoScopeActionAndRecurse| (level 3) and
|DoScopeAction| (level 4) as necessary.
(2) |ScopeWithin| iterates through the objects in scope which are within
one supplied domain, but not within another. It can be called either
from level 1, or independently from rules in the ``deciding the scope of''
activity via the I7 ``place the contents of X in scope'' phrase. It calls
|DoScopeActionAndRecurse| (level 3) on any unconcealed objects it finds.
(3) |DoScopeActionAndRecurse| visits a given object by calling down to
|DoScopeAction| (level 4), and recurses to all unconcealed object-tree
contents and component parts of the object. The I7 phrase ``place X in
scope'' uses this routine.
(4) |DoScopeAction| simply visits a single object, taking whatever action
is needed there -- which will depend on the |scope_reason|. The only use
made by the parser of |TryGivenObject|, which tries to match command text
against the name of a given object, is from here. The I7 phrase ``place X
in scope, but not its contents'' uses this routine.

Two routines are provided for code external to the parser to modify the
scope. They should be called only during scope deliberations -- i.e., 
in |scope=...| tokens or in rules for the ``deciding the scope of''
activity. (At present, |AddToScope| is not used in I7 at all.) Note
that this I7 form of |PlaceInScope| has a slightly different specification
to its I6 library counterpart of the same name: it can place a room in
scope. (In I6, room names were not normally parsed.)]

To place (O - an object) in scope, but not its contents (this is PlaceInScope):
	now the parser's current word position is the next word to parse's position;
	if not but not its contents, recursively do scope action on O;
	otherwise do scope action on O.

[ PlaceInScope O opts; ! If opts is set, do not place contents in scope
	wn = match_from;
	if (opts == false) DoScopeActionAndRecurse(O);
	else DoScopeAction(O);
	return;
]

To add (obj - an object) to scope (this is AddToScope):
	if the add to scope flag is at least 2, recursively do scope action on obj excluding nothing under (add to scope flag - 2 as a grammar token);
	if the add to scope flag is 1 [meaning LOOPOVERSCOPE_REASON] and light can get out of the obj, now the add to scope has-light-source is true.

[ AddToScope obj;
    if (ats_flag >= 2) DoScopeActionAndRecurse(obj, 0, ats_flag-2);
    if (ats_flag == 1) { if (HasLightSource(obj)==1) ats_hls = 1; }
]


Chapter - Scope Level 0

[The two ways of starting up the scope machinery other than via the parser
code above.]

To decide if (scopee - an object) is within the scope of (scoper - an object) (this is TestScope): [this would be a fine relation]
	[ save these values ]
	let x be parser one; 
	let y be parser two;
	let a be the person asked; 
	let al be the actor's scopewise location;
	let sr be the reason for deciding scope; 
	;
	now parser one is the scopee; 
	now parser two is false; 
	now the reason for deciding scope is because we're testing scope;
	if the scoper is nothing, now the person asked is the player; 
	otherwise now the person asked is the scoper;
	now the actor's scopewise location is the scope ceiling of the person asked;
	search the scope of the actor's scopewise location and the person asked under 'something'; 
	let the returned truth state be parser two;
	;
	[ restore those values ]
	now the reason for deciding scope is sr; 
	now the actor's scopewise location is al; 
	now the person asked is a;
	now parser two is y;
	now parser one is x;
	decide on the returned truth state.  

[ TestScope obj act a al sr x y;
    x = parser_one; y = parser_two;
    parser_one = obj; parser_two = 0; a = actor; al = actors_location;
    sr = scope_reason; scope_reason = TESTSCOPE_REASON;
    if (act == 0) actor = player; else actor = act;
    actors_location = ScopeCeiling(actor);
    SearchScope(actors_location, actor, 0); scope_reason = sr; actor = a;
    actors_location = al; parser_one = x; x = parser_two; parser_two = y;
    return x;
]

To apply (desired routine - an object based rule producing nothing) to everything within scope of (scoper - an object) (this is LoopOverScope):
	[ save these values ]
	let x be the parser callback; 
	let y be parser two;
	let a be the person asked; 
	let al be the actor's scopewise location;
	;
	now the parser callback is the desired routine; 
	if the scoper is nothing, now the person asked is the player; 
	otherwise now the person asked is the scoper;
	now the actor's scopewise location is the scope ceiling of the person asked;
	now the reason for deciding scope is because we're looping over scope;
	search the scope of the actor's scopewise location and the person asked under 'something'; 
	;
	[ restore those values ]
	now the actor's scopewise location is al; 
	now the person asked is a;
	now parser two is y;
	now the parser callback is x.
	

[ LoopOverScope routine act x y a al;
    x = parser_one; y = scope_reason; a = actor; al = actors_location;
    parser_one = routine;
    if (act == 0) actor = player; else actor = act;
    actors_location = ScopeCeiling(actor);
    scope_reason = LOOPOVERSCOPE_REASON;
    SearchScope(actors_location, actor, 0);
    parser_one = x; scope_reason = y; actor = a; actors_location = al;
]


Chapter - SearchScope

[Level 1. The method is:
(a) If the context is a |scope=...| token, then the search is delegated
to ``stage 2'' of the scope routine. This was the old I6 way to override
the searching behaviour: while users probably won't be using it any more,
the template does, in order to give testing commands universal scope which
is exempt from the activity below; and the NI compiler creates |scope=...|
tokens to handle Understand grammar such as ``[any room]''. So the feature
remains very much still in use.
(b) The ``deciding the scope of'' activity is given the chance to intervene.
This is the I7 way to override the searching behaviour, and is the one taken
by users.
(c) And otherwise:
(-1) The I6 |multiinside| token, used as the first noun of its grammar line,
has as its scope all of the objects which are inside or on top of the
{\it second} noun of the grammar line. This provides a neat scope for the
ALL in a command like GET ALL FROM CUPBOARD, where the player clearly
does not intend ALL to refer to the cupboard itself, for instance. The
difficulty is that we don't yet know what the second object is, if we are
parsing left to right. But the parser code above has taken care of all of
that, and the |advance_warning| global is set to the object number of the
second noun, or to $-1$ if that is not yet known. Note that we check that
the contents are visible before adding them to scope, because otherwise
an unscrupulous player could use such a command to detect the contents of
an opaque locked box. If this rule applies, we skip (c.2), (c.3) and (c.4).
(-2) For all other tokens except |creature|, searching scope for the room
holding the current actor always catches the compass directions unless a
definite article has already been typed. (Thus OPEN THE EAST would match
an object called ``east door'', but not the compass direction ``east''.)
(-3) The contents of |domain1| which are not contents of |domain2| are
placed in scope, and so are any component parts of |domain1|. If |domain1|
is a container or supporter, it is placed in scope itself.
(-4) The contents and component parts of |domain2| are placed in scope.
If |domain2| is a container or supporter, it is placed in scope itself.
(-5) In darkness, the actor and his component parts are in scope. If the
actor is inside or on top of something, then that thing is also in scope.
(This avoids a situation where the player gets into an opaque box, then
pulls it closed from the inside, plunging himself into darkness, then types
OPEN BOX only to be told that he can't see any such thing.)]

To search the scope of (first domain - an object) and (second domain - an object) under (context - a grammar token) (this is SearchScope):
	if the first domain is nothing, stop;
	[ Rule (a) - If the current scope limit is set by an understand token like    Understand "[any room]" as...   or one of those described in 25.22 of _Writing with Inform_ then invoke that phrase/function/routine.  ]
	if the scope decider is not currently blank:    
		now the scope stage is please add eligible objects to scope;
		if TRACE 3, say "  [bracket]Scope routine called at stage 2[close bracket][line break]";
		if the scope decider returns true, stop the action;
	[ Rule (b) - The "deciding the scope" activity allows the I7 author their preferences now.]
	begin the deciding the scope activity with the person asked;
	if handling the deciding the scope activity with the person asked: 
		[ Rule (c) - if the author has no special preferences, then the default is these five rules: ]
		[ Rule (c.1) - for GET ALL FROM CUPBOARD we place the contents of the second noun into scope, assuming we can see the contents (i.e. the second noun is a supporter, open container, transparent anything, etc.). ]
		if the reason for deciding scope is because we're parsing the predicate nouns  and  the context is 'things inside'  and  we suspect what the second noun will be:
			if the likely second noun is see-through:
				place the contents of the likely second noun into scope excluding nothing under the context;
		otherwise:
			[ Rule (c.2) - For non-creatures, searching scope for the room containing the actor always catches the compass directions unless a definite article has already been typed. (Thus OPEN THE EAST would match "east door" but not the compass direction "east".)]
			if the reason for deciding scope is because we're parsing the predicate nouns   and   the context is not 'someone'   and   the indefinite article mode is false   and   the first domain is the actor's scopewise location:
				place the contents of the compass in scope;
			[ Rule (c.3) - The contents of |domain1| which are not contents of |domain2| are placed in scope, and so are any component parts of |domain1|. If |domain1| is a container or supporter, itself is placed in scope.]
			if the first domain is a supporter or container:
				do scope action on the first domain;
			place the contents of the first domain in scope excluding the second domain under the context;
			[ Rule (c.4) - The contents and component parts of |domain2| are placed in scope. If |domain2| is a container or supporter, it is placed in scope itself.]
			unless the second domain is nothing:
				if the second domain is a supporter or container:
					do scope action on the second domain;
				place the contents of the second domain in scope excluding nothing under the context;
		[ Rule (c.5) - avoid the situation where the player gets into an opaque box, then pulls it closed from the inside, plunging himself into darkness, then types OPEN BOX only to be told that he can't see any such thing.]
		if the first domain is the ur-darkness or the second domain is the ur-darkness:
			recursively do scope action on the person asked excluding the person asked under the context;
			if the parent of the person asked is a supporter or container:
				recursively do scope action on the parent of the person asked excluding the parent of the person asked under the context;
	end the deciding the scope activity with the person asked.

[ SearchScope domain1 domain2 context i;
	if (domain1 == 0) return;
	! (a)
    if (scope_token) {
        scope_stage = 2;
        #Ifdef DEBUG;
        if (parser_trace >= 3) print "  [Scope routine called at stage 2]^";
        #Endif;
        if (indirect(scope_token) ~= 0) rtrue;
    }
	! (b)
    BeginActivity(DECIDING_SCOPE_ACT, actor);
    if (ForActivity(DECIDING_SCOPE_ACT, actor) == false) {
		! (c.1)
		if ((scope_reason == PARSING_REASON) && (context == MULTIINSIDE_TOKEN) &&
			(advance_warning ~= -1)) {
			if (IsSeeThrough(advance_warning) == 1)
			    ScopeWithin(advance_warning, 0, context);
		} else {
			! (c.2)
			if ((scope_reason == PARSING_REASON) && (context ~= CREATURE_TOKEN) &&
				(indef_mode == 0) && (domain1 == actors_location))
					ScopeWithin(compass);
			! (c.3)
			if (domain1 has supporter or container) DoScopeAction(domain1);
			ScopeWithin(domain1, domain2, context);
			! (c.4)
			if (domain2) {
				if (domain2 has supporter or container) DoScopeAction(domain2);
				ScopeWithin(domain2, 0, context);
			}
		}
		! (c.5)
		if (thedark == domain1 or domain2) {
			DoScopeActionAndRecurse(actor, actor, context);
			if (parent(actor) has supporter or container)
				DoScopeActionAndRecurse(parent(actor), parent(actor), context);
		}
    }
    EndActivity(DECIDING_SCOPE_ACT, actor);
]


Chapter - ScopeWithin

[Level 2. |ScopeWithin| puts objects visible from within the |domain| into scope.
An item belonging to the |domain| is placed in scope unless it is being
concealed by the |domain|: and even then, if the |domain| is the current
actor. Suppose Zorro conceals a book beneath his cloak: then the book is
not in scope to his lady friend The Black Whip, but it is in scope to Zorro
himself. (Thus an actor is not allowed to conceal anything from himself.)

Note that the |domain| object itself, and its component parts if any, are
not placed in scope by this routine, though nothing prevents some other
code doing so.]

To place the/-- contents of (domain - an object) in scope: [ from the Standard Rules ]
	place the contents of the domain in scope excluding nothing under 'something'.

To place the/-- contents of (domain - an object) in/into scope excluding (nosearch - an object) under (context - a grammar token) (this is ScopeWithin):
	if the domain is nothing, stop the action;
	repeat with the possession running through the possessed nodes of the domain:
		if the domain is the person asked or the domain does not conceal the possession:
			recursively do scope action on possession excluding nosearch under the context;


[ ScopeWithin domain nosearch context obj next_obj;
    if (domain == 0) rtrue;

    ! Look through the objects in the domain, avoiding "objectloop" in case
    ! movements occur.
    obj = child(domain);
    while (obj) {
        next_obj = sibling(obj);
        if ((domain == actor) || (TestConcealment(domain, obj) == false))
            DoScopeActionAndRecurse(obj, nosearch, context);
        obj = next_obj;
    }
]

Chapter - DoScopeActionAndRecurse

[Level 3.
In all cases, the |domain| itself is visited. There are then three possible
forms of recursion:
(a) To unconcealed objects which are inside, on top of, carried or worn by
the |domain|: this is called ``searching'' in traditional I6 language and
is suppressed if |domain| is the special value |nosearch|. hidden
(b) To unconcealed component parts of the |domain|.
(c) To any other objects listed in the |add_to_scope| property array, or
supplied by the |add_to_scope| property routine, if it has one. (I7 does
not usually use |add_to_scope|, but it remains a useful hook in the parser,
so it retains its old I6 library interpretation.)]


To recursively do scope action on (domain - an object):
	recursively do scope action on the domain excluding nothing under 'something'.

To recursively do scope action on (domain - an object) excluding (nosearch - an object) under (context - a grammar token) (this is DoScopeActionAndRecurse):
	[ Rule 0 - In all cases, the |domain| itself is visited. ]
	do scope action on the domain;
	[ Rule (a) - Assuming the calling function hasn't specifically requested a domain not be searched, we'll consider everything that rooms, people, and see-through things have. ]
	if the domain is not the nosearch and (the domain is a room or the domain is a person or the domain is see-through):
		repeat with the possession running through the possessed nodes of the domain:
			if the domain is the person asked or the domain does not conceal the possession:
				recursively do scope action on the possession excluding nosearch under the context;
	[ Rule (b) - Also consider anything (unconcealed) that the domain incorporates. ]
	if the domain can have parts:
		repeat with the piece running through the incorporated nodes of the domain:
			if the domain is the person asked or the domain does not conceal the piece:
				recursively do scope action on the piece excluding nosearch under the context;
	[ Rule (c) - Now consider objects in the add_to_scope property.  If used, that property points to either an array or a routine. I7 doesn't use add_to_scope so it's usually nothing. ]
	let ad be the hidden scope extender array of the domain;
	if ad is not currently blank:
		if ad is currently a rule:
			now the add to scope flag is 2 plus the context as a number;
			consider the scope extender of the domain directly;
			now the add to scope flag is zero;
		otherwise:
			repeat through the scope extender of the domain:
				if the object element is not currently blank:
					recursively do scope action on the object element excluding nothing under the context.

[ DoScopeActionAndRecurse domain nosearch context i ad n obj next_obj;

	DoScopeAction(domain);

 	! (a)
    if ((domain ~= nosearch) &&
        ((domain ofclass K1_room or K8_person) || (IsSeeThrough(domain) == 1))) {
		obj = child(domain);
		while (obj) {
			next_obj = sibling(obj);
			if ((domain == actor) || (TestConcealment(domain, obj) == false))
				DoScopeActionAndRecurse(obj, nosearch, context);
			obj = next_obj;
		}
	}

	! (b)
	if (domain provides component_child) {
		obj = domain.component_child;
		while (obj) {
			next_obj = obj.component_sibling;
			if ((domain == actor) || (TestConcealment(domain, obj) == false))
				DoScopeActionAndRecurse(obj, 0, context);
			obj = next_obj;
		}
	}

    ! (c)
    ad = domain.&add_to_scope;
    if (ad ~= 0) {
        ! Test if the property value is not an object.
        #Ifdef TARGET_ZCODE;
        i = (UnsignedCompare(ad-->0, top_object) > 0);
        #Ifnot; ! TARGET_GLULX
        i = (((ad-->0)->0) ~= $70);
        #Endif; ! TARGET_

        if (i) {
            ats_flag = 2+context;
            RunRoutines(domain, add_to_scope);
            ats_flag = 0;
        }
        else {
            n = domain.#add_to_scope;
            for (i=0 : (WORDSIZE*i)<n : i++)
                if (ad-->i)
                    DoScopeActionAndRecurse(ad-->i, 0, context);
        }
    }
]

Chapter - DoScopeAction

[Level 4. This is where we take whatever action is to be performed as the
``visit'' to each scoped object, and it's the bottom at last of the scope
mechanism.]

To do scope action on (item - an object) (this is DoScopeAction):
	if trace 6, say "[bracket]DSA on [the item] with reason = [the reason for deciding scope as a debugging number] p1 = [parser one as a debugging number] p2 = [parser two as a debugging number][close bracket][line break]";
	save parser one;
	save the reason for deciding scope;
	if the reason for deciding scope is because we're testing scope:
		if the item is parser one, now parser two is true;
	otherwise if the reason for deciding scope is because we're looping over scope:
		if the parser callback is currently a rule, consider the parser callback for the item directly;
	otherwise: [ we're parsing for nouns or an addressee ]
		match text against the item;
	restore the reason for deciding scope;
	restore parser one.

[ DoScopeAction item;

    #Ifdef DEBUG;
    if (parser_trace >= 6)
        print "[DSA on ", (the) item, " with reason = ", scope_reason,
            " p1 = ", parser_one, " p2 = ", parser_two, "]^";
    #Endif; ! DEBUG

    @push parser_one; @push scope_reason;

	switch(scope_reason) {
		TESTSCOPE_REASON: if (item == parser_one) parser_two = 1;
		LOOPOVERSCOPE_REASON: if (parser_one ofclass Routine) indirect(parser_one, item);
		PARSING_REASON, TALKING_REASON: MatchTextAgainstObject(item);
    }

    @pull scope_reason; @pull parser_one;
]

Book - Text to Name Matching

Chapter - Parsing Object Names

[We now reach the final major block of code in the parser: the part which tries
to match a given object's name(s) against the text at word position |match_from|
in the player's command, and calls |MakeMatch| if it succeeds. There are
basically four possibilities: ME, a pronoun such as IT, a name which doesn't
begin misleadingly with a number, and a name which does. In the latter two
cases, we pass the job down to |TryGivenObject|.]

To decide if  (item - an object) is the antecedent for (i - an understood [pronoun] word):
(- (({i} >= 2) && ({i} < 128) && (LanguagePronouns-->{i} == {item}))  -).

To match text against (item - an object) (this is MatchTextAgainstObject):
	if the next word to parse's position <= the number of words in the command:
		now the parser's current word position is the next word to parse's position;
		let the appropriate word be the possibility that it's a noun;
		[ Possibility 1:  "me" ]
		if the item is the player and the appropriate word is ME The Player:
			add the item to the match list assuming 1 qualifies it;
		[ Possibility 2:  a pronoun ]
		if the item is the antecedent for the appropriate word:
			 add the item to the match list assuming 1 qualifies it;
	now the parser's current word position is [set back to] the next word to parse's position;
	if how many words the item can match is at least 1:
		if where we found a number used like an adjective > 0 and where we found a number used like an adjective is not [at] the next word to parse's position:
			[ This case arises if the player has typed a number in
			! which is hypothetically an indefinite descriptor:
			! e.g. "take two clubs".  We have just checked the object
			! against the word "clubs", in the hope of eventually finding
			! two such objects.  But we also backtrack and check it
			! against the words "two clubs", in case it turns out to
			! be the 2 of Clubs from a pack of cards, say.  If it does
			! match against "two clubs", we tear up our original
			! assumption about the meaning of "two" and lapse back into
			! definite mode.]
			now the parser's current word position is where we found a number used like an adjective;
			if how many words the item can match is at least 1:
				now the next word to parse's position is where we found a number used like an adjective;
				reset descriptor words;
			now the parser's current word position is the next word to parse's position.


[ MatchTextAgainstObject item i;
	if (match_from <= num_words) { ! If there's any text to match, that is
		wn = match_from;
		i = NounWord();
		if ((i == 1) && (player == item)) MakeMatch(item, 1); ! "me"
		if ((i >= 2) && (i < 128) && (LanguagePronouns-->i == item)) MakeMatch(item, 1);
	}

	! Construing the current word as the start of a noun, can it refer to the
	! object?

	wn = match_from;
	if (TryGivenObject(item) > 0)
		if (indef_nspec_at > 0 && match_from ~= indef_nspec_at) {
			! This case arises if the player has typed a number in
			! which is hypothetically an indefinite descriptor:
			! e.g. "take two clubs".  We have just checked the object
			! against the word "clubs", in the hope of eventually finding
			! two such objects.  But we also backtrack and check it
			! against the words "two clubs", in case it turns out to
			! be the 2 of Clubs from a pack of cards, say.  If it does
			! match against "two clubs", we tear up our original
			! assumption about the meaning of "two" and lapse back into
			! definite mode.

			wn = indef_nspec_at;
			if (TryGivenObject(item) > 0) {
				match_from = indef_nspec_at;
				ResetDescriptors();
			}
			wn = match_from;
		}
] 

Chapter - TryGivenObject

[|TryGivenObject| tries to match as many words as possible in what has been
typed to the given object, |obj|. If it manages any words matched at all,
it calls |MakeMatch| to say so, then returns the number of words (or 1
if it was a match because of inadequate input).]

To decide what number is how many words (obj - an object) can match, hypothetically (this is TryGivenObject):
	if trace 5, say "    Trying [the obj] ([the obj as a debugging number]) at word [parser's current word position][line break]";
	if the obj is nothing and hypothetically, Decide on 0;
	exclude all possibilities from the word's usages;
	if the parser's current word position > the number of words in the command:
		if hypothetically, decide on 0 [words matched];
		if the indefinite article mode is true, now the word's usages is the unused usages;
		ADD the obj TO THE MATCH LIST assuming zero qualifies it;
		if trace 5, say "    Matched (0)[line break]";
		Decide on 1 [word matched];
	let the count of matched words be 0;
	if the hidden parse name rule of the obj is not currently blank:
		now what the parser's doing is parsing normally;
		let the saved position be the parser's current word position;
		now the count of matched words is the parse name rule of the obj considered directly;
		if the count of matched words is at least 1:
			now the parser's current word position is the saved position + the count of matched words;
			Decide on the count of matched words after noting descriptors and plurality of the obj;
		otherwise if the count of matched words is 0:
			if the indefinite article mode is false, Decide on 0 [words matched];
			now what the parser's doing is parsing normally;
			Decide on 0 after noting descriptors and plurality of the obj;
	now what the parser's doing is parsing normally;
	let the appropriate word be the possibility that it's a noun;
	if the appropriate word is ME The Player and the obj is the player:
		Decide on 1 after noting descriptors and plurality of the obj;
	if the obj is the antecedent for the appropriate word:
		Decide on 1 after noting descriptors and plurality of the obj;
	unless the word at the parser's current word position - 1 can refer to the obj:
		if the indefinite article mode is false, Decide on 0 [words matched];
		now what the parser's doing is parsing normally;
		Decide on 0 after noting descriptors and plurality of the obj;
	now the count of matched words is 1;
	now the word's usages is the usage of the appropriate word excluding (being plural + the unused usages);
	now the appropriate word is the next word;
	while the word at the parser's current word position - 1 can refer to the obj:
		increment the count of matched words;
		if the appropriate word is not a word unknown by the game:
			include the usage of the appropriate word excluding (being plural + the unused usages) in the word's usages;
		now the appropriate word is the next word;
	Decide on the count of matched words after noting descriptors and plurality of the obj.


To decide which number is (how many matched - a number) after (done this hypothetically - a truth state) and plurality of (obj - an object):
	if identifying plurals is what the parser's doing:
		include being plural in the word's usages;
	if the word's usages include being plural:
		if we cannot allow numeric words as descriptors: 
			now how many matched is 0;
		otherwise:
			if the indefinite article mode is false:
				now the indefinite article mode is true;
				exclude all possibilities from the type of descriptor word used;
				now the number of items wanted is 0;
			include a plural descriptor in the type of descriptor word used;
			if the number of items wanted is 0:
				now the number of items wanted is all items are wanted;
	if trace 5, say "    Matched ([how many matched]) words[line break]";
	if we haven't done this hypothetically:
		ADD the obj TO THE MATCH LIST assuming how many matched qualifies it;
	Decide on how many matched.

Noting descriptors is a truth state that varies.  [ This is a hackish way to get code that reads well. ]
Noting descriptors variable translates into I6 as "phrase_options".

[ TryGivenObject obj nomatch threshold k w j;
    #Ifdef DEBUG;
    if (parser_trace >= 5) print "    Trying ", (the) obj, " (", obj, ") at word ", wn, "^";
    #Endif; ! DEBUG

	if (nomatch && obj == 0) return 0;

! if (nomatch) print "*** TryGivenObject *** on ", (the) obj, " at wn = ", wn, "^";

    dict_flags_of_noun = 0;

!  If input has run out then always match, with only quality 0 (this saves
!  time).

    if (wn > num_words) {
    	if (nomatch) return 0;
        if (indef_mode ~= 0)
            dict_flags_of_noun = $$01110000;  ! Reject "plural" bit
        MakeMatch(obj,0);
        #Ifdef DEBUG;
        if (parser_trace >= 5) print "    Matched (0)^";
        #Endif; ! DEBUG
        return 1;
    }

!  Ask the object to parse itself if necessary, sitting up and taking notice
!  if it says the plural was used:

    if (obj.parse_name~=0) 
    {
        parser_action = NULL; j=wn;
        k = RunRoutines(obj,parse_name);
        if (k > 0) 
        {
            wn=j+k;

          .MMbyPN;

            if (parser_action == ##PluralFound)
                dict_flags_of_noun = dict_flags_of_noun | 4;

            if (dict_flags_of_noun & 4) 
            {
                if (~~allow_plurals) 
                    k = 0;
                else 
                {
                    if (indef_mode == 0) 
                    {
                        indef_mode = 1; indef_type = 0; indef_wanted = 0;
                    }
                    indef_type = indef_type | PLURAL_BIT;
                    if (indef_wanted == 0) 
                        indef_wanted = INDEF_ALL_WANTED;
                }
            }

            #Ifdef DEBUG;
            if (parser_trace >= 5) print "    Matched (", k, ")^";
            #Endif; ! DEBUG
            if (nomatch == false) 
                   MakeMatch(obj,k);
            return k;
        }
        if (k == 0) 
            jump NoWordsMatch;
    }

    ! The default algorithm is simply to count up how many words pass the
    ! Refers test:

    parser_action = NULL;

    w = NounWord();
    if (w == 1 && player == obj) { k=1; jump MMbyPN; }
    if (w >= 2 && w < 128 && (LanguagePronouns-->w == obj)) { k = 1; jump MMbyPN; }

    if (Refers(obj, wn-1) == 0) 
    {
        .NoWordsMatch;
        if (indef_mode ~= 0) 
	{ 
		k = 0; 
		parser_action = NULL; 
		jump MMbyPN; 
	}
        rfalse;
    }

    threshold = 1;
    dict_flags_of_noun = (w->#dict_par1) & $$01110100;
    w = NextWord();
    while (Refers(obj, wn-1)) 
    {
        threshold++;
        if (w)
            dict_flags_of_noun = dict_flags_of_noun | ((w->#dict_par1) & $$01110100);
        w = NextWord();
    }
    k = threshold;

    jump MMbyPN;
]
 

Chapter - Refers

[|Refers| works out whether the word at number wnum can refer to the object
|obj|, returning true or false.  The standard method is to see if the word
is listed under the |name| property for the object, but this is more
complex in languages other than English.]

To decide if the word at (position - a number) can refer to (obj - an object) (this is Refers):
	if the obj is nothing, no;
	if the inflected nouns option is active, decide per non-English rules if the word at the position refers to the obj;
	let k be the parser's current word position;  [saves]
	now the parser's current word position is the position;
	let the current word be the next word if any;
	now the parser's current word position is k;  [restores]
	let the names be the current names list;
	if the names are currently a rule: [ rare ]
		let the names be the current names list rule considered for the current word and the obj;
		if the names are an invalid list, decide on whether or not the names as a truth state;
	if the current word is listed in the names of the obj, yes.
	
[ Refers obj wnum   wd k l m;
    if (obj == 0) rfalse;

    #Ifdef LanguageRefers;
    k = LanguageRefers(obj,wnum); if (k >= 0) return k;
    #Endif; ! LanguageRefers

    k = wn;  wn = wnum; wd = NextWordStopped(); wn = k;

    if (parser_inflection >= 256) {
        k = indirect(parser_inflection, obj, wd);
        if (k >= 0) return k;
        m = -k;
    }
    else
        m = parser_inflection;
    k = obj.&m; l = (obj.#m)/WORDSIZE-1;
    for (m=0 : m<=l : m++)
        if (wd == k-->m) rtrue;
    rfalse;
]

To decide if (word - an understood word) is understood as (obj - an object) per its (names - an understood word valued property) (this is WordInProperty): 
	if the word is listed in the names of the obj, yes.

[ WordInProperty wd obj prop k l m; 
    k = obj.&prop; l = (obj.#prop)/WORDSIZE-1; 
    for (m=0 : m<=l : m++) 
        if (wd == k-->m) rtrue;
    rfalse;
]


Chapter - NounWord

[|NounWord| (which takes no arguments) returns:
(a) 0 if the next word is not in the dictionary or is but does not carry the
``noun'' bit in its dictionary entry,
(b) 1 if it is a word meaning ``me'',
(c) the index in the pronoun table (plus 2) of the value field of a pronoun,
if it is a pronoun,
(d) the address in the dictionary if it is a recognised noun.]

To decide what understood word is the Nth pronoun: (- ct_1+2 -). [hackish]


To decide what understood word is the possibility that it's a noun (this is NounWord):
	let the word be the next word; 
	if the word is a word unknown by the game:
		decide on a word unknown by the game;
	if the word is 'ME':
		decide on ME The Player;
	if the word is listed as one of the pronouns in the language's pronoun list:
		decide on the Nth pronoun;
	if the usage of the word does not include being a noun:
		decide on a word unknown by the game;
	decide on the word.

[ NounWord i j s;
    i = NextWord();
    if (i == 0) rfalse;
    if (i == ME1__WD or ME2__WD or ME3__WD) return 1;
    s = LanguagePronouns-->0;
    for (j=1 : j<=s : j=j+3)
        if (i == LanguagePronouns-->j)
            return j+2;
    if ((i->#dict_par1)&128 == 0) rfalse;
    return i;
]



Chapter - TryNumber

[|TryNumber| takes word number |wordnum| and tries to parse it as an (unsigned)
decimal number or the name of a small number, returning

(a) $-1000$ if it is not a number
(b) the number, if it has between 1 and 4 digits
(c) 10000 if it has 5 or more digits.

(The danger of allowing 5 digits is that Z-machine integers are only 16 bits
long, and anyway this routine isn't meant to be perfect: it only really needs
to be good enough to handle numeric descriptors such as those in TAKE 31 COINS
or DROP FOUR DAGGERS. In particular, it is not the way I7 ``[number]'' tokens
are parsed.)]

To decide what number is the number typed in by the player at (Nth - a number) (this is TryNumber): 
	save the parser's current word position;
	now the parser's current word position is the Nth;
	let the num be the next word as digits; [ is it a word like "twenty"? ]
	restore the parser's current word position;
	if the num is at least 1, decide on the num;
	now num is 0;  [ otherwise it's in numeric form like "365", so read them a 'letter' at a time, toting them up. ]
	let the typed number be the player's input buffer advanced to the Nth word's position of the player's parsed command - 1;
	repeat with ith running from 1 to the Nth word's length of the player's parsed command:
		let the digit's value be the ith letter of the typed number as a numeric digit;
		if the digit's value < 0 or the digit's value > 9, [ then it isn't a numeric digit, so ] decide on -1000;
		if num >= 1000, [then we're about to make a five-digit number, a total >= 10,000, so cap it: ] decide on 10000;  
		now num is (num multiplied by 10) plus the digit's value;
	decide on the num.


[ TryNumber wordnum   i j c num len mul tot d digit;
    i = wn; wn = wordnum; j = NextWord(); wn = i;
    j = NumberWord(j); ! Test for verbal forms ONE to THIRTY
    if (j >= 1) return j;

    #Ifdef TARGET_ZCODE;
    i = wordnum*4+1; j = parse->i; num = j+buffer; len = parse->(i-1);
    #Ifnot; ! TARGET_GLULX
    i = wordnum*3; j = parse-->i; num = j+buffer; len = parse-->(i-1);
    #Endif; ! TARGET_

    if (len >= 4) mul=1000;
    if (len == 3) mul=100;
    if (len == 2) mul=10;
    if (len == 1) mul=1;

    tot = 0; c = 0; len = len-1;

    for (c=0 : c<=len : c++) {
        digit=num->c;
        if (digit == '0') { d = 0; jump digok; }
        if (digit == '1') { d = 1; jump digok; }
        if (digit == '2') { d = 2; jump digok; }
        if (digit == '3') { d = 3; jump digok; }
        if (digit == '4') { d = 4; jump digok; }
        if (digit == '5') { d = 5; jump digok; }
        if (digit == '6') { d = 6; jump digok; }
        if (digit == '7') { d = 7; jump digok; }
        if (digit == '8') { d = 8; jump digok; }
        if (digit == '9') { d = 9; jump digok; }
        return -1000;
     .digok;
        tot = tot+mul*d; mul = mul/10;
    }
    if (len > 3) tot=10000;
    return tot;
]


Chapter - Gender

[|GetGender| returns 0 if the given animate object is female, and 1 if male,
and is abstracted as a routine in case something more elaborate is ever
needed.

For GNAs -- gender/noun/animation combinations -- see the {\it Inform Designer's
Manual}, 4th edition.]

[  Unused. ]

[ GetGender person;
    if (person hasnt female) rtrue;
    rfalse;
]

To decide which number is the gender-animation of (noun - an object) (this is GetGNAOfObject):
	let the noun's gender be the default gender for inanimate things;
	if the noun provides the property neuter directly:
		let the noun's gender be neuter;
	otherwise if the noun provides the property female directly:
		let the noun's gender be female;
	otherwise if the noun provides the property linguistically male directly:
		let the noun's gender be linguistically male;
	otherwise if the noun provides the property animate directly:
		let the noun's gender be the default gender for animate things;
	let the g&a be 0;
	unless the noun provides the property animate directly, increase the g&a by 6;
	if the noun provides the property plural-named directly, increase the g&a by 3;
	if the noun's gender holds the property neuter, increase the g&a by 2;
	if the noun's gender holds the property female, increase the g&a by 1;
	decide on the g&a.

[  The above returns a number from 0 to 11 :
00     animate male
01     animate female
02     animate neuter
03     animate male plural
04     animate female plural
05     animate neuter plural
06  inanimate male
07  inanimate female
08  inanimate neuter
09  inanimate male plural
10  inanimate female plural
11  inanimate neuter plural
]


[ GetGNAOfObject obj case gender;
    if (obj hasnt animate) case = 6;  
    if (obj has male) gender = male;
    if (obj has female) gender = female;
    if (obj has neuter) gender = neuter;
    if (gender == 0) {
        if (case == 0) gender = LanguageAnimateGender;
        else gender = LanguageInanimateGender;
    }
    if (gender == female)   case = case + 1;  
    if (gender == neuter)   case = case + 2;  
    if (obj has pluralname) case = case + 3;  
    return case;
]


Chapter - Noticing Plurals

[ This is called by the auto-generated Inform 7 source when it compiles Understand lines. Beside returning whether it found a plural word in a run of words, it also set's "what the parser's doing" to that fact. ]

To decide whether any plural words exist starting at (position - a number) for (length - a number) (this is DetectPluralWord):
	let the saved position be the parser's current word position;
	now the parser's current word position is the position;
	repeat with each word running from one to the length:
		let the current word be the next word if any;
		if the current word is either 'THEN' or the comma or a word unknown by the game or no more words left to parse:
			break;
		if the usages of the current word include being plural:
			now what the parser's doing is identifying plurals;
			now the parser's current word position is the saved position;
			yes;
	now the parser's current word position is the saved position;
	no.

[ DetectPluralWord at n       i w swn outcome;
	swn = wn; wn = at;
	for (i=0:i<n:i++) {
		w = NextWordStopped();
		if (w == 0 or THEN1__WD or COMMA_WORD or -1) break;
		if ((w->#dict_par1) & $$00000100) {
			parser_action = ##PluralFound;
			outcome = true;
		}
	}
	wn = swn;
	return outcome;
]

Chapter - Pronoun Handling

[To reset vague words with (obj - an object) (this is ResetVagueWords): set pronouns from the obj.]

To change (pronoun - an understood word) to (obj - an object) (this is SetPronoun):
	if the pronoun is listed as one of the pronouns in the language's pronoun list:
		change the chosen antecedent element to the obj;
		stop;
	issue the 14th run-time message "** Library error 14 (0,0) **[line break]** (unexplained) **[line break]".

[ SetPronoun dword value x;
    for (x=1 : x<=LanguagePronouns-->0 : x=x+3)
        if (LanguagePronouns-->x == dword) {
            LanguagePronouns-->(x+2) = value; return;
        }
    RunTimeError(14);
]

[ Returns 'nothing' if the inputted word isn't one of the four pronouns.  Returns the 'used-up object' (NULL) if it's an unset pronoun. ]
To decide which object is what (pronoun - an understood word) stands for (this is PronounValue):
	if the pronoun is listed as one of the pronouns in the language's pronoun list:
		decide on the antecedent element.

[ PronounValue dword x;
    for (x=1 : x<=LanguagePronouns-->0 : x=x+3)
        if (LanguagePronouns-->x == dword)
            return LanguagePronouns-->(x+2);
    return 0;
]

To decide which word usage is the gender-animation usages for (obj - object):
	(- PowersOfTwo_TB-->(GetGNAOfObject({obj})) -).

To set pronouns from (obj - an object) (this is PronounNotice):
	if the obj is the player, stop;  [ even in 3rd person, the player wouldn't refer to his avatar as him/her. ]
	repeat through all three columns of the language's pronoun list:
		if the gender-animation element includes any of the gender-animation usages for the obj:
			change the chosen antecedent element to the obj.

[ PronounNotice obj x bm;
    if (obj == player) return;

    bm = PowersOfTwo_TB-->(GetGNAOfObject(obj));

    for (x=1 : x<=LanguagePronouns-->0 : x=x+3)
        if (bm & (LanguagePronouns-->(x+1)) ~= 0)
            LanguagePronouns-->(x+2) = obj;
]


Chapter - Yes/No Questions

[ see bug #752 ]
To decide if the player consents (this is YesOrNo):
	repeat forever:
		draw the status line;
		read a command into the player's input buffer and parse it into the player's parsed command;
		if the number of words in the player's parsed command is at least one:
			let the word be the 1st word of the player's parsed command;
			if the word is 'YES', yes;
			if the word is 'NO', no;
		issue the 1st message for the quitting the game action;  [ "Please answer yes or no." ]
		say "> ".

[ YesOrNo i j;
    for (::) {
        DrawStatusLine();
        KeyboardPrimitive(buffer, parse); !  see bug #752 on Mantis for why I did this.
        #Ifdef TARGET_ZCODE;
        !if (location == nothing || parent(player) == nothing) read buffer parse;
        !else read buffer parse DrawStatusLine;
        j = parse->1;
        #Ifnot; ! TARGET_GLULX;
        !KeyboardPrimitive(buffer, parse);
        j = parse-->0;
        #Endif; ! TARGET_
        if (j) { ! at least one word entered
            i = parse-->1; ! get first word
            if (i == YES1__WD or YES2__WD or YES3__WD) rtrue;
            if (i == NO1__WD or NO2__WD or NO3__WD) rfalse;
        }
        L__M(##Quit, 1); print "> ";
    }
]


Chapter - Number Words

[Not much of a parsing routine: we look through an array of pairs of number
words (single words) and their numeric equivalents.]

To decide which number is (x - an understood word) as digits (this is NumberWord):
	if x is listed as a spelled-out number in the language's number list:
		decide on the number as digits element.

[ NumberWord o i n;
    n = LanguageNumbers-->0;
    for (i=1 : i<=n : i=i+2)
        if (o == LanguageNumbers-->i) return LanguageNumbers-->(i+1);
    return 0;
]

Book - Does The Player Mean

Chapter - Choose Objects

[This material, the final body of code in the parser, is an I7 addition.
The I6 parser leaves it to the user to provide a |ChooseObjects| routine
to decide between possibilities when the situation is ambiguous. For I7
use, we provide a |ChooseObjects| which essentially runs the ``does the
player mean'' rulebook to decide, though this is not obvious from the
code below because it is hidden in the |CheckDPMR| routine -- which
is defined in the Standard Rules, not here.]

To decide which number is the maximum possible does-the-player-mean score: (- HIGHEST_DPMR_SCORE -).
To decide which 0-based index based rulebook producing objects is the alternate match list: (-alt_match_list-).
The number of objects in the alternate match list is a number that varies.
[ The alternate match list was originally 1-based even though the original match list is 0-based.  I've made it 0-based because the code is much neater that way. ]

Include (-
!Constant COBJ_DEBUG;

! the highest value returned by CheckDPMR (see the Standard Rules)
Constant HIGHEST_DPMR_SCORE = 4;

Array alt_match_list --> (MATCH_LIST_WORDS+1);
-).

[ swap alt_match_list with match_list/number_matched ]
To swap the match list with the alternate match list (this is COBJ__SwapMatches):
	let x be the number of objects in the match list;
	now the number of objects in the match list is the number of objects in the alternate match list;
	now the number of objects in the alternate match list is x;
	let obj be an object;
	repeat through the match list of size the number of objects in the match list:
		now obj is the match list element;
		change the chosen element of the match list to the alternate match list element;
		change the chosen element of the alternate match list to obj.

[ COBJ__SwapMatches i x;
	! swap the counts
	x = number_matched;
	number_matched = alt_match_list-->0;
	alt_match_list-->0 = x;
	! swap the values
	if (x < number_matched) x = number_matched;
	for (i=x: i>0: i-- ) {
		x = match_list-->(i-1);
		match_list-->(i-1) = alt_match_list-->i;
		alt_match_list-->i = x;
	}
]

[ To remove the Jumps from this, the bottom third of the function was moved to be the first third.  To ease the creation of its surrounding utility functions, the alternate match list was changed from being 1-based to 0-based just like the match list that it mirrors. ]
To decide what number is how much does the player mean (obj - an object) (this is ChooseObjects):
	[if the deciding whether all includes activity is going on, decide on 0; ]
	if the ranking strategy is 0:
		if the choose objects debugging option is active, say "[bracket]choosing a cobj strategy: ";
		[ save these ]
		let saved position be the parser's current word position;
		let saved understood command's current position be the understood command's current position;
		[ advance past the "prepositions" ]
		while '<understood word>' is the (understood command's current position) element of the grammar line types:
			increment the understood command's current position;
		if the (understood command's current position) element of the grammar line types is '<grammar token>':
			while the parser's current word position <= the number of words in the command:
				let the current word be the next word if any;
				if (the current word is either a word unknown by the game or no more words left to parse) and the usage of the current word includes being a preposition, next;
				if the current word is 'ALL', next;
				decrement the parser's current word position; [back up again to point at the non-ALL word]
				[ get here with TAKE ALL HATS ]
				skip over any descriptor words;
				[ save some state, including the whole match list ]
				save the number of words matched per object;
				save the noun filter;
				save the next word to parse's position;
				now the number of objects in the alternate match list is the number of objects in the match list;
				copy (number of objects in the match list) chosen objects from the match list to the alternate match list;
				[ Change what's in scope?? ]
				now the number of words matched per object is 0;
				now the noun filter is the nothing rule;
				now the number of objects in the match list is 0;
				now the next word to parse's position is the parser's current word position; 
				search the scope of the person asked and the actor's scopewise location under the (understood command's current position) element of the grammar line data;
				if the choose objects debugging option is active, say "[number of objects in the match list] possible second nouns[close bracket][line break]";
				now the ranking strategy is 1;
				[ restore ]
				swap the match list with the alternate match list;
				restore the next word to parse's position;
				restore the noun filter;
				restore the the number of words matched per object;
		[ now restore these ]
		now the understood command's current position is the saved understood command's current position; 
		now the parser's current word position is the saved position;
		unless the ranking strategy is 1:
			now the ranking strategy is 2;
			if the choose objects debugging option is active, say "nothing interesting[close bracket][line break]";
	let this object's score be 0;
	if the ranking strategy is 1:
		if the number of parameters in the command is at least one:
			if the choose objects debugging option is active, say "[bracket]scoring [the obj] (second)[close bracket][line break]";
			decide on the disambiguating score for the parser's returned noun combined with the obj;
		otherwise: 
			if the choose objects debugging option is active, say "[bracket]scoring [the obj] (first) in [the number of objects in the alternate match list] combinations[close bracket][line break]";
			let their maximum score be 0;
			repeat through the alternate match list of size the number of objects in the alternate match list:
				now this object's score is the disambiguating score for the obj combined with the object element;
				if this object's score is the maximum possible does-the-player-mean score:
					if the choose objects debugging option is active, say "[bracket]scored [this object's score] - best possible[close bracket][line break]";
					decide on this object's score;
				if this object's score > their maximum score, now their maximum score is this object's score;
			decide on their maximum score;
	otherwise [ the ranking strategy is 2 ]:
		if the choose objects debugging option is active, say "[bracket]scoring [the obj] (simple); parameters = [the number of parameters in the command] aw = [the likely second noun][close bracket][line break]";
		save the action to be; [ Is this necessary? I don't believe so. ]
		if the number of parameters in the command is zero:
			unless the likely second noun is either nothing or the used-up object:
				now this object's score is the disambiguating score for the obj combined with the likely second noun;
			otherwise:
				now this object's score is the disambiguating score for the obj combined with nothing;
		otherwise:
			now this object's score is the disambiguating score for the parser's returned noun combined with the obj;
		restore the action to be;
		decide on this object's score.

	

[ Once you enter the ==1 or ==2 if-statements in here, you don't get back out. ]
[ ChooseObjects obj code  l i swn spcount;
	if (code<2) rfalse;

	if (cobj_flag == 1) {
		.CodeOne;
		if (parameters > 0) 
		{	#ifdef COBJ_DEBUG; print "[scoring ", (the) obj, " (second)]^"; #endif;
			return ScoreDabCombo(parser_results-->INP1_PRES, obj);
		} else 
		{	#ifdef COBJ_DEBUG; print "[scoring ", (the) obj, " (first) in ", alt_match_list-->0, " combinations]^"; #endif;
			l = 0;
			for (i=1: i<=alt_match_list-->0: i++) 
			{	spcount = ScoreDabCombo(obj, alt_match_list-->i);
				if (spcount == (+  the maximum possible does-the-player-mean score +)) 
				{	#ifdef COBJ_DEBUG; print "[scored ", spcount, " - best possible]^"; #endif;
					return spcount;
				}
				if (spcount>l) l = spcount;
			}
			return l;
		}
	}
	if (cobj_flag == 2) {
		.CodeTwo;
		#ifdef COBJ_DEBUG; print "[scoring ", (the) obj, " (simple); parameters = ", parameters, " aw = ", advance_warning, "]^"; #endif;
		@push action_to_be;
		if (parameters==0) 
		{	if (advance_warning > 0)
				l = ScoreDabCombo(obj, advance_warning);
			else
				l = ScoreDabCombo(obj, 0);
		} else
			l = ScoreDabCombo(parser_results-->INP1_PRES, obj);
		@pull action_to_be;
		return l;
	}

	#ifdef COBJ_DEBUG; print "[choosing a cobj strategy: "; #endif;
	swn = wn;
	spcount = pcount;
	while (line_ttype-->pcount == PREPOSITION_TT) 
		pcount++;
	if (line_ttype-->pcount == ELEMENTARY_TT) 
	{
		while (wn <= num_words) 
		{
			l = NextWordStopped(); wn--;
			if ( (l ~= -1 or 0) && (l->#dict_par1) &8 ) { wn++; continue; }	! if preposition
			if (l == ALL1__WD or ALL2__WD or ALL3__WD or ALL4__WD or ALL5__WD) { wn++; continue; }
			
			SafeSkipDescriptors();
			! save the current match state
			@push match_length; @push token_filter; @push match_from;
			alt_match_list-->0 = number_matched;
			COBJ__Copy(number_matched, match_list, alt_match_list+WORDSIZE);
			! now get all the matches for the second noun
			match_length = 0; number_matched = 0; match_from = wn;
			token_filter = 0;
			SearchScope(actor, actors_location, line_tdata-->pcount);
			#ifdef COBJ_DEBUG;
			print number_matched, " possible second nouns]^";
			#endif;
			wn = swn;
			cobj_flag = 1;
			! restore match variables
			COBJ__SwapMatches();
			@pull match_from; @pull token_filter; @pull match_length;
			pcount = spcount;
			jump CodeOne;
		}
	}
	pcount = spcount;
	wn = swn;	
	
	#ifdef COBJ_DEBUG; print "nothing interesting^"; #endif;
	cobj_flag = 2;
	jump CodeTwo;
]
 


To decide what number is the disambiguating score for (first item - an object) combined with (second item - an object) (this is ScoreDabCombo):
	save the action in progress;
	save the person requesting;
	save the noun;
	save the second noun;
	now the action in progress is the action to be;
	now the person requesting is the player;
	if the action's nouns swapped places is true:
		now the noun is the second item;
		now the second noun is the first item;
	otherwise:
		now the noun is the first item;
		now the second noun is the second item;
	let result be did the player mean this;
	restore the second noun;
	restore the noun;
	restore the person requesting;
	restore the action in progress;
	if the choose objects debugging option is active, say "[bracket][the first item] / [the second item] => [the result][close bracket][line break]";
	decide on the result.

[ ScoreDabCombo a b  result;
	@push action; @push act_requester; @push noun; @push second;
	action = action_to_be;
	act_requester = player;
	if (action_reversed) { noun = b; second = a; }
	else { noun = a; second = b; }
	result = CheckDPMR();
	@pull second; @pull noun; @pull act_requester; @pull action;
	#ifdef COBJ_DEBUG;
	print "[", (the) a, " / ", (the) b, " => ", result, "]^";
	#endif;
	return result;
]



Chapter - Default Topic

[A default value for the I7 sort-of-kind ``topic'', which never matches.]

Include (-[DefaultTopic; return GPR_FAIL;];-).



Volume - Translation

[ This part is boring; please ignore. ]

Book - Inform 7 mini-extensions

Chapter 1 - Understood Words

[ Inform 6 calls these "dictionary words". ]

[An understood word is a kind of value. ]  [ This line must go at the top of this file. ]
Some understood words are the invalid understood word. [required by I7]
To decide what understood word is a word unknown by the game: (- 0 -).
To decide what understood word is no more words left to parse: (- (-1) -).
To decide what understood word is ME the player: (- 1 -).
To say (word - an understood word): (- print (address) {word}; -).
The understand token understood word translates into I6 as "special".
To decide what understood word is (n - number) as an understood word: (- {n} -).
[  Use the latter like: 
Understand "do you know the word [understood word]" as a mistake ("[if the understood word understood is a word unknown by the game]No.[else if the number understood < 10000]Yes, I know the number [number understood].[else if the number understood is 10000]Yes, but I cap numbers at the ten thousand mark.[else]Yes, I know the word [the understood word understood].[end if]").
]

Chapter 2 - ZSCII Letters

Some ZSCII letters are the invalid ZSCII letter. 
To say (z - a ZSCII letter): (- print (char) {z}; -).  
To decide what number is (z - a ZSCII letter) as a numeric digit: (- ({z} - '0') -).

Chapter 3 - New Command Parser Errors

To decide what command parser error is no errors here: (- 0 -).
[Some command parser errors are
	the can't use addressee w/AGAIN error, [could also be a CHECK AGAINing rule]
	the nothing to repeat error, [when the saved command in the AGAIN workspace is empty] [could also be a CHECK AGAINing rule]
	the can't begin w/commas error, [still can't trigger this. The code eats multiple commas in a row ]
	the can't see addressee error,
	the can't talk to inanimate objects error,
	the can't understand sentence subjects error. [(eg, throw out "dwarf sdfgsdgs, go north").]
]
[
20: "To repeat a command like ~frog, jump~, just say ~again~, not ~frog, again~."; 
21: "You can hardly repeat that."; 
22: "You can’t begin with a comma."; 
23: "You seem to want to talk to someone, but I can’t see whom."; 
24: "You can’t talk to ", (the) x1, "."; 
25: "To talk to someone, try ~someone, hello~ or some such."; 
]

Chapter 4 - Bit Twiddling

To decide if (x - K) includes/include (y - an enumerated value of kind K): (-  (( ({x}) & ({y}) ) == ({y}) ) -).
To decide if (x - K) includes/include any of (y - an enumerated value of kind K): (- ((({x}) & ({y})) ~= 0) -).
To decide if (x - K) does not include (y - an enumerated value of kind K): (- (( ({x}) & ({y}) ) == 0) -).
To decide what K is (x - K) + (y - an enumerated value of kind K): (- ({x} | {y}) -).
To decide what K is (x - K) excluding (y - an enumerated value of kind K): (- ( ({x}) & ({y}) ) -).
To include (y - an enumerated value of kind K) in (x - K): (- {x} = {x} | ({y}); -). 
To exclude (y - an enumerated value of kind K) from (x - K): (- {x} = {x} &~ ({y}); -). [test me?]
To exclude all except (y - an enumerated value of kind K) from (x - K): (- {x} = {x} & ({y}); -).
To exclude all possibilities from (x - an enumerated value): (- {x} = 0; -).

Chapter 5 - Truth States as 'We' Commands

[ It's always difficult to name truth states because nothing reads naturally other than a letter: if x is true.  These phrases allow us to name a truth state after an imperative sentence, and the optional adverbs allow us to imply how the variable is being used. ]
To decide if we still/should/-- (bool - a truth state): (- ({bool}) -).
To decide if we do/-- not/cannot/shouldn't/haven't (bool - a truth state): (- (~~({bool})) -).
To we will/should/just/now/still/may (bool - a truth state) again/--: (- {bool} = true; -);
To we no/do longer/not have/-- (bool - a truth state): (- {bool} = false; -).
To we needn't/shouldn't (bool - a truth state): (- {bool} = false; -).
To we will/should/may (bool - a truth state) if (c - a condition): (- {bool} = ({c}); -);

Chapter 6 - Unconditional Local Jumps

[ I would love to remove all GOTOs from the parser's source, never mind the performance implications.  But some functions are just too convoluted for me to disentangle while keeping faith that they would work like the originals. ]
A control label is a kind of value. Some control labels are the finished control label.
To at this point (here - a control label): (- .{here}; -).
To go back/-- up/down to where (here - a control label): (- jump {here}; -).

[ -- parser__parse --]
To decide what control label is we ReType: (-ReType-).
To decide what control label is we ReParse: (-ReParse-).
To decide what control label is we AlmostReParse: (-AlmostReParse-).
To decide what control label is we BeginCommand: (-BeginCommand-).
[To decide what control label is we have conversation: (-Conversation-).]
[To decide what control label is we also have conversation: (-Conversation2-).]
To decide what control label is we do not have conversation: (-NotConversation-).
[VerbAccepted]
   [loop through understand-as lines, beginning with]
   [lookahead at 2nd noun]
   [loop through each token in the line ]
To decide what control label is our LineFailed: (-LineFailed-).
To decide what control label is we GiveError: (-GiveError-).
[To decide what control label is we LookForMore: (-LookForMore-).]

[ -- ParseToken__ -- ]
[To decide what control label is we begin the ObjectList: (-ObjectList-).]
To decide what control label is we TryAgain: (-TryAgain-).
To decide what control label is we TryAgain2 due to an ambiguous descriptor word: (-TryAgain2-).
To decide what control label is we FailToken: (-FailToken-).
To decide what control label is we PassToken: (-PassToken-).



Chapter 7 - Pointer Arithmetic

[ Would also like to rid myself of this. ]
To decide which 1-based index based rulebook producing ZSCII letters is (a - 1-based index based rulebook producing ZSCII letters) advanced to (n - number): (- ({a} + {n}) -).
To advance (a - 0-based indexes based rulebook producing grammar tokens) by (n - number): (- {a} = {a} + {n}; -).

Chapter 8 - Bug Fixes

[bug #759]
To follow (r - a nothing based rule):  (- FollowRulebook({r}); -).

[bug #751]
To decide if (x - an existing either/or property variable) holds the property (p - an either/or property): 
(- ({x} == {p}) -).  

[bug #751]
To bugfix now the current names list is the name list: (- (+ the current names list +) = (+ the name list +); -).

[bug #752]

Chapter 9 - Other Loops

To repeat forever begin -- end: (- while (true) -).
To while this isn't done begin -- end:  (-  do  -).
To do this/that again unless/until (c - a condition): (- until ({c}); -).
To do this/that again if/while (c - a condition): (- until (~~({c})); -).
To that/this is done if/while/when (c - a condition): (- until (~~({c})); -).
To that/this isn't done unless/until (c - a condition): (- until ({c}); -).
To (ph - a phrase) until (c - a condition): (- do {ph} } until ({C}); !-).

The chosen grammar is a 0-based index based rulebook producing grammar tokens that varies. 
The chosen grammar variable translates into I6 as "ct_0".

To repeat through the understand-as lines for (verb - an understood word) begin -- end:
(-	ct_0 = VM_CommandTableAddress(DictionaryWordToVerbNum({verb}));
	cacheval6 = ct_0->0;
	ct_0++;  ! + the size of the grammar line header???
	for (ct_1 = 0 : ct_1 < cacheval6 : ++ct_1)   -).
	

Chapter 10 - Alternatives (for use without Alternatives by Eric Eve)

To decide if (item - a value of kind K) is either (v1 -  K) or (v2 - K): 
(- ({item} == {v1} or {v2}) -).
To decide if (item - a value of kind K) is either (v1 - K) or (v2 - K) or (v3 - K): 
(- ({item} == {v1} or {v2} or {v3}) -).
To decide if (item - a value of kind K) is either (v1 - K) or (v2 - K) or (v3 - K) or (v4 - K): 
(- ({item} == {v1} or {v2} or {v3} or {v4}) -).
To decide if (item - a value of kind K) is either (v1 - K) or (v2 - K) or (v3 - K) or (v4 - K) or (v5 - K): 
(- ({item} == {v1} or {v2} or {v3} or {v4} or {v5}) -).

To decide if (item - a value of kind K) is neither (v1 - K) nor (v2 - K): 
(- ({item} ~= {v1} or {v2}) -).
To decide if (item - a value of kind K) is neither (v1 - K) nor (v2 - K) nor (v3 - K): 
(- ({item} ~= {v1} or {v2} or {v3}) -).
To decide if (item - a value of kind K) is neither (v1 - K) nor (v2 - K) nor (v3 - K) nor (v4 - K): 
(- ({item} ~= {v1} or {v2} or {v3} or {v4}) -).
To decide if (item - a value of kind K) is neither (v1 - K) nor (v2 - K) nor (v3 - K) nor (v4 - K) nor (v5 - K): 
(- ({item} ~= {v1} or {v2} or {v3} or {v4} or {v5}) -).


Chapter 11 - Inform 6 Direct Translations

[ Inform 7 can do much of this in its own way, but this project calls for the generated code to resemble the original Parser.i6t as closely as possible. ]

Section 1 - Object Tree and Properties

To decide what object is the parent of (O - an object): (- parent({O}) -).
To decide if nothing is in (O - an object): (- children({O}) == 0 -).
To decide if (obj1 - an object) is directly in (obj2 - an object): (- ({obj1} in {obj2}) -).
To decide if (obj2 - an object) doesn't have (obj1 - an object): (- ({obj1} notin {obj2}) -).
To decide if (obj - an object) is a supporter or container: (- ({obj} has supporter or container) -).
To decide if (obj - an object) can have parts:  (- ({obj} provides component_child) -).
To decide if (obj - an object) provides the property (prop - an either/or property) directly: (- ({obj} has {prop}) -).
To decide if (obj - an object) does not provide the property (prop - an either/or property) directly: (- ({obj} hasnt {prop}) -).
To decide what K is the hidden (p - a value of kind K valued property) of (o - an object): (- {o}.{p} -).
[bug?]
To decide if the hidden personalized grammar of the person asked is not currently blank: 
(- (actor.grammar ~= 0 or -1) -).

To decide which either/or property is animate: (-animate-).
To decide which either/or property is talkable: (-talkable-).
To decide which understood word valued property is the name list: (-name-).
To decide what rule valued property is the parse name rule: (-parse_name-).
To decide what rule valued property is the scope extender: (-add_to_scope-).
To decide which either/or property is linguistically male: (-male-).
To decide which either/or property is the default gender for animate things: (-LanguageAnimateGender-).
To decide which either/or property is the default gender for inanimate things: (-LanguageInanimateGender-).

[ The scope functions avoid "objectloop" in case movements occur. ]
To repeat with (loopvar - nonexisting object variable) running through the possessed nodes of (item - an object) begin -- end:  (- 	{-require-ctvs}
	for ( {loopvar} = child({item}) : {loopvar} : {loopvar} = ct_1 ) 
	{	ct_1 = sibling({loopvar});  !-).

To repeat with (loopvar - nonexisting object variable) running through the incorporated nodes of (item - an object) begin -- end:  (- 	{-require-ctvs}
	for ( {loopvar} = {item}.component_child : {loopvar} : {loopvar} = ct_1 )  
	{	ct_1 =  {loopvar}.component_sibling;   !-).


Section 2 - Control

To decide whether (v - a word value) is not currently blank: (- ({v}) -).
To decide whether (v - a word value) is currently blank: (- (~~({v})) -).
To save     (v - a value): (-  @push {v};  -).
To restore (v - a value):  (-  @pull {v};  -).

To decide what object is the compass: (- compass -).
To decide what object is the ur-darkness: (- thedark -).
To decide what number is the virtual machine's wordsize: (- WORDSIZE -).
To decide what number is the maximum number of things understood at once: (- MATCH_LIST_WORDS -). [Use maximum things understood at once of at least 100]

Section 3 - Rules and Routines

To decide what rule producing truth states is the nothing rule: (- 0 -).
To decide if (r - a rule producing a truth state) returns true: (- {r}() -).
To decide which parser result is the parser result produced by (r - a rule producing truth states): (- {r}() -).
To consider (r - a rule) directly: (- {r}(); -). 
To consider (r - an object based rule producing nothing) for (obj - an object) directly: (- {r}({obj}); -). 
To consider (prop - a rule valued property) of (obj - an object) directly: (- RunRoutines({obj}, {prop}); -).
To decide which parser result is (r - a topic) applied to (s - a snippet): (- {r}({s}/100, {s}%100) -).
To decide which parser result is (r - a topic) applied to (pos - a number): (- {r}({pos},0) -).
To decide what number is (prop - a rule valued property) of (obj - an object) considered directly: (- RunRoutines({obj}, {prop}) -).

[ rule + object ]
To decide whether (v - a word value) is currently a rule: (- ({v} ofclass Routine) -).
To decide whether (v - a pointer value) is currently a rule: (- ({v} ofclass Routine) -).

[ property + truth state ]
To decide which understood word valued property is (names - an understood word valued property) rule considered for  (wd - an understood word) and (obj - an object): (-  (0 - {names}({obj}, {wd})) -).


Chapter 12 - Testing

Section 1 - Debugging Built in to Parser i6t

[ This may look odd as it can be done with more orthogonal pieces, but it's used so much in here it really is worth it. ]
To if TRACE (n - a number), (ph - a phrase):
(-	#ifdef DEBUG;
	if ( (+TRACE testing command setting+) >= {n})   {ph};  }
	#endif; !-).


Use choose objects debugging translates as (- Constant COBJ_DEBUG; -).

To if the choose objects debugging option is active, (ph - phrase): 
(-	#ifdef COBJ_DEBUG;
	if (1) {ph};  }
	#endif;  !-). 

[ Since I name many of the unnamed magic numbers, I need this in the TRACE statements to preserve the output.  ]
To decide which number is (v - a value) as a debugging number: (- {v} -).


Section 2 - Debugging this - not for release	

[ Specific to this project. ]

To say (gt - a grammar token): (- DebugToken({gt}); -).
[	if the gt is 'something':
		say "[']something[']";
	otherwise if gt is the end of line token:
		say "END";
	otherwise if gt >= 'something preferably held' and gt <= 'text':
		say gt;
	otherwise:
		say "[gt as a debugging number]".]

To say (buf  - a 1-based index based rulebook producing ZSCII letters): (- SayBuffer({buf}); -).

Include (-
[ SayBuffer buf  ct_1;
	print "(", buf->LETTER_ARRAY_BASE, ")"; ! if size >255 then GLULX's size prints wrong
	style bold;  
	for(ct_1 = WORDSIZE; ct_1 < 64; ct_1++ ) 
	{
		if (ct_1 == WORDSIZE + buf->LETTER_ARRAY_BASE) style roman;
		if (buf->ct_1 > 20) 	print (char) buf->ct_1; 
		else print (char) '?'; 
	}
	style roman;
];-).

To say the match list:
	let the previous group# be the 0th;
	repeat through the match list of size the number of objects in the match list:
		if the previous group# is the match list's groups element, next;
		if we should say the group as A\AN\SOME, say "   [A match list element] ([the match list element as a debugging number])  ---  group [0 - the match list's groups element][line break]";
		otherwise say "   [The match list element] ([the match list element as a debugging number])  ---  group [the match list's groups element][line break]";
		now the previous group# is the match list's groups element.

Chapter 13 - Use-Options for Languages Other Than English 

[ The #ifdef is always tricky because I can't use I7's block feature to auto-add the #endif the way it does a closing brace. So I try to diguise the inner body as a single phrase.  The use-option I created merely for documentation purposes.  It doesn't actually work if used, mainly because that "constant" needs to be a function defined in Inform 6 directly. I may fix it later if I find out how. ]

Use inflected nouns translates as (- Constant LanguageRefers; -).

To if (option - a use-option) is active, decide per non-English rules if the word at (position - a number) refers to (obj - an object):
(- 	#ifdef LanguageRefers;
	t_2 = LanguageRefers({obj}, {position}); if (t_2 >= 0) return t_2;
	#endif;   -).

The convert to subject–verb–object format rule translates into I6 as "LanguageToInformese".

Chapter 14 - Typecasts

[ Inform 7 is strongly-typed.  Inform 6 is not.  And the parser code likes to cram multiple kinds of things into the same number.  This makes sense code-wise, but is a little difficult for the human to understand until they familiarize themselves with what's going on.  Many odd-looking mathmatical operations and comparisons result from trying to pull apart disparate types. I try to name meaningfully what's going on. ]

To decide if (prop - an understood word valued property) are a/an/-- invalid list/--: (- ({prop} < 1) -).
To decide if (x - an understood word valued property) as a truth state: (-  ({x} == -1)  -).
To decide if (v - a property) are currently a rule: (- ({v} >= 256) -).
To decide which either/or property is (r - a rule producing a truth state) as an adjective: (- ({r} - 1) -).

To decide what number is at (n - a number) position: (- {n} -).   [ Syntactic sugar for dealing with indexes -- think of it as typecasting between cardinal and ordinal numbers. ]

To decide what rule producing a truth state is (x - a grammar token) as a filter: (- ({x}) -).
To decide what rule producing a truth state is (x - a grammar token) as an adjective filter: (- ({x} + 1) -).

To decide which understood word is (gt - a grammar token) as an understood word: (- {gt} -).
To decide what grammar token is (x - a number) as a grammar token: (- ({x}) -).
To decide what number is (x - a grammar token) as a number: (- ({x}) -).
To decide what number is (o - object) as a number: (- {o} -).

To decide if (obj - an object) is currently an object: (- ({obj} ofclass Object) -).
To decide if (obj - an object) is not currently a kind-of-value: (- ({obj} >= 2) -).


Book - Preserving I6 Function Names Where Necessary

[Section  - (in place of Section SR5/6/4 - Understanding - Scope and pronouns in Standard Rules by Graham Nelson)]

[ Some I6 functions are called from outside Parser.i6t so I create the following stubs to bounce control back up into their new I7 incarnations.  I then comment out those lines when I no longer need them. ]

Include (-
![ ScopeWithin domain nosearch context; 	return ((+ ScopeWithin  +)-->1)(domain, nosearch, context); ]; ! I7 SR, but overridden
[ PlaceInScope O opts;                        	return ((+ PlaceInScope +)-->1)(O, opts); ]; ! in testcommandnoun  (and I7 SR but can't override)
![ AddToScope obj;                               	return ((+ AddToScope +)-->1)(obj); ]; ! I6 hook, but not normally used
![ DoScopeAction item;                              	return ((+ DoScopeAction +)-->1)(item); ];
[ TestScope obj actr;                           	return ((+ TestScope +)-->1)(obj, actr); ]; ! TestVisibility, TestTouchability
[ LoopOverScope routine actr;             	return ((+ LoopOverScope +)-->1)(routine, actr); ]; ! SCOPE testing command
![ DoScopeActionAndRecurse d1 d2 cntxt;  	return ((+ DoScopeActionAndRecurse +)-->1)(d1, d2, cntxt); ];  
![ ConsultNounFilterToken obj;                 	return ((+ ConsultNounFilterToken +)-->1)(obj); ];
![ SearchScope d1 d2 cntxt;                  	return ((+ SearchScope +)-->1)(d1, d2, cntxt); ];
![ MakeMatch obj quality;                          	return ((+ MakeMatch +)-->1)(obj, quality); ]; 
![ MatchTextAgainstObject item;               	return ((+ MatchTextAgainstObject +)-->1)(item); ];
![ MultiSub o;                                      	return ((+ MultiSub +)-->1)(o); ];
![ MultiAdd o dups;                             	return ((+ MultiAdd +)-->1)(o, dups); ];
![ MultiFilter o;                                      	return ((+ MultiFilter +)-->1)(o); ];
![ Refers obj wnum;                              	return ((+ Refers +)-->1)(wnum, obj); ];  ! order of params swapped 
[ WordInProperty wd obj prop;             	return ((+ WordInProperty +)-->1)(wd, obj, prop); ]; 
![ CreatureTest obj;                              	return ((+ CreatureTest +)-->1)(obj); ]; 
![ ReviseMulti second_p;                   	return ((+ ReviseMulti +)-->1)(second_p); ];
![ BestGuess;                                              	return ((+ BestGuess +)-->1)(); ];
![ SingleBestGuess;                                    	return ((+ SingleBestGuess +)-->1)(); ];
![ PrintInferredCommand from;             	return ((+ PrintInferredCommand +)-->1)(from); ];
! 21 functions down, 50 to go
![ ScoreDabCombo a b;                            	return ((+ ScoreDabCombo +)-->1)(a,b); ]; 
[ YesOrNo;                                         	return ((+ YesOrNo +)-->1)(); ]; ! quitting the game rules
![ NumberWord o;                               	return ((+ NumberWord +)-->1)(o);  ];
![ ResetVagueWords x; ];    ! not used?
![ SetPronoun p o;                                   	return ((+ SetPronoun +)-->1)(p, o); ];
![ PronounValue p;                               	return ((+ PronounValue +)-->1)(p); ];
[ PrintCommand  from;                      	return ((+ PrintCommand +)-->1)(from); ]; ! language.i6t
[ WordCount;                                      	return ((+ WordCount +)-->1)(); ];
[ WordLength w;                                 	return ((+ WordLength +)-->1)(w); ];
![ Keyboard  b t ;                                  	return ((+ Keyboard +)-->1)(b, t); ]; 
![ ResetDescriptors;                              	return ((+ ResetDescriptors +)-->1)(); ];
![ ArticleDescriptors  ]  !  unused?
![ NounWord i;                                   	return ((+ NounWord +)-->1)(i);  ];
![ TryGivenObject obj nomatch;              	return ((+ TryGivenObject +)-->1)(obj, nomatch);  ];
![ GetGender person; ];  ! unused?
[ DetectPluralWord at len;                    	return ((+ DetectPluralWord +)-->1)(at, len);  ]; ! auto-generated parse name functions
![ PronounNoticeHeldObjects x; ]; ! deprecated per 16.18 in Writing With Inform
![ PronounNotice obj;                         	return ((+ PronounNotice +)-->1)(obj);  ];  ! SR but re-exposed directly here
![ COBJ__Copy len from dest;                    	return ((+ PronounNotice +)-->1)(len, from, dest);  ];
![ COBJ__SwapMatches;                             	return ((+ COBJ__SwapMatches +)-->1)(); ];
![ ChooseObjects obj strat;                        	return ((+ ChooseObjects +)-->1)(obj, strat); ];
![ ScoreMatchL context;                             	return ((+ ScoreMatchL +)-->1)(context); ];
[ NextWord;                                        	return ((+ NextWord +)-->1)(); ];
[ NextWordStopped;                        	return ((+ NextWordStopped +)-->1)(); ];
! 46 functions down; 25 to go
[ WordAddress wordnum;                   	return ((+ WordAddress +)-->1)(wordnum); ];
[ PrintSnippet snip;                             	return ((+ PrintSnippet +)-->1)(snip); ]; ! LCORE.i6t, indexed text
![ SpliceSnippet snip t;                             	return ((+ SpliceSnippet +)-->1)(snip, t); ];   ! I7 SR, overridden
![ SnippetMatches s t;                                	return ((+ SnippetMatches +)-->1)(s,t); ];
[ WordFrom w p;                                	return ((+ WordFrom +)-->1)(w,p); ]; 
![ SafeSkipDescriptors;                          	return ((+ SafeSkipDescriptors +)-->1)(); ]; 
![ Descriptors t;                                	return ((+ Descriptors +)-->1)(t); ]; 
![ NounDomain d1 d2 c;                    	return ((+ NounDomain +)-->1)(d1,d2,c); ];
![ Adjudicate context;]
![ CantSee;                                          	return ((+ CantSee +)-->1)(); ];
![ I7_ExtendedTryNumber;]  !  obsolete.  reported as bug
![ DefaultTopic ;]   ! this is too simple to translate, and must be an I6 name anyway.
![ KeyboardPrimitive; ] ! also too simple to translate, called from outside Parser.i6t, uses many unique features
[ ParseTokenStopped x y;                 	return ((+ ParseTokenStopped +)-->1)(y,x); ]; ! order of params swapped ! only callled from Number.i6t
[ UnpackGrammarLine line_address;  	return ((+ UnpackGrammarLine +)-->1)(line_address); ]; ! used in SHOWVERBsub
![ DictionaryWordToVerbNum  ! not translated: called from outside Parser.i6t
![ ParseToken ty data token_n token;  	return ((+ ParseToken +)-->1)(data, ty, token_n, token); ];  !order of params swapped a bit
![ PrepositionChain wd index;             	return ((+ PrepositionChain +)-->1)(wd, index); ]; 
[ Identical o1 o2;                              	return ((+ Identical +)-->1)(o1,o2); ]; ! ListEqual()
[ TryNumber wordnum;                    	return ((+ TryNumber +)-->1)(wordnum);  ]; ! [time] tokens
[ GetGNAOfObject obj;                   	return ((+ GetGNAOfObject +)-->1)(obj);  ]; ! PrefaceByArticle()
![ AnalyseToken
![ ParseToken__ ttype tdata Nth token; return ((+ ParseToken__ Part A +)-->1)(tdata, ttype, Nth, token); ]; ! order of 1st params swapped 
[ Parser__parse;  return ((+ Parser__parse +)-->1)(); ]; ! the parse command rule, in the turn sequence rulebook
-).

[![ MoveWord w1 source w2;                        	return ((+ MoveWord +)-->1)(w1, source, w2); ]; ! unused]


Book - Array Phrases

Chapter - Arrays in Inform 7

[ There's lots of different kinds of arrays in I6, and in the parser.  Some are word-based, some byte-based.  Some hold objects, some individual letters, some a unique struct.  Some keep the size of the array in element 0, some in globals, some in named constants. It's less of a headache if I create lots of finely-tuned array definitions and overload the same functions heavily, so the client code cannot tell what kind of array is what. ]

[ To overload the same phrases requires the array to "carry with itself" the type of things it's pointing to -- numbers, objects, structures, etc. -- as well as if it's a 0-based or 1-based index.  For structures I use a unique phrase for each field. ]

Some 0-based indexes are the 0-based-array.
Some 1-based indexes are the 1-based-array.
9<7> specifies a struct with parts desired [column] and maximum [column]. 

[The chosen row is a number that varies. The chosen row variable translates into I6 as "ct_1".]
The chosen is a number that varies. The chosen variable translates into I6 as "ct_1".

To decide what 1-based index based rulebook producing ZSCII letters is the chosen array: (-ct_0-).
To decide what object is the chosen element:                             	(- (ct_0-->ct_1) -). [commonest case]
To decide which K is the (name of kind of value K) element:   	(-  ct_0-->ct_1  -). [allows typecasting]


To decide which 1-based index based rulebook producing ZSCII letters is the player's input buffer: (-buffer-).
To decide which 1-based index based rulebook producing ZSCII letters is the secondary input buffer: (-buffer2-).
To decide which 1-based index based rulebook producing ZSCII letters is the AGAIN input buffer: (-buffer3-).
To decide what number is the maximum buffer size: (-INPUT_BUFFER_LEN-).

To decide which 1-based index based rulebook producing structs is the player's parsed command: (-parse-).
To decide which 1-based index based rulebook producing structs is the second parsed command: (-parse2-).
To decide which understood word is the word element: (-(+ the chosen word element of the chosen array +)-).
To decide which number is the length element: (-(+ the chosen length element of the chosen array +)-).
To decide which number is the position element: (-(+ the chosen position element of the chosen array +)-).

To decide which 1-based index based rulebook producing objects is the multiple-object list: (-multiple_object-).

To decide which 1-based index based rulebook producing structs is the language's number list: (-LanguageNumbers-).
To decide which understood word is the spelled-out number element:   (- ct_0-->(ct_1) -).
To decide which number is the number as digits element:  (- ct_0-->(ct_1+1) -).
To decide which struct is as a spelled-out number: (-(+ 1<2> +)-).

To decide which 1-based index based rulebook producing structs is the language's pronoun list: (-LanguagePronouns-).
To decide which understood word is the pronoun element:   (- ct_0-->ct_1 -).
To decide which word usage is the gender-animation element:  (- ct_0-->(ct_1+1) -).
To decide which object is the antecedent element:  (- ct_0-->(ct_1+2) -).
To change the (Nth - number) antecedent element to (data - object):  (- ct_0-->({Nth}+2) = {data}; -).
To decide which struct is as one of the pronouns: (-(+ 1<3> +)-).
To decide which struct is as one of the antecedents:  (- ct_0-->(ct_1+2) -).

To decide which 1-based index based rulebook producing structs is the language's descriptor list: 
(- LanguageDescriptors -).
To decide which understood word is the descriptor element:   (- ct_0-->ct_1 -). 
[To decide which word usage is the gender-animation element:  (- ct_0-->(ct_1+1) -).]  [same as above]
To decide which descriptor property is the category element:  (- ct_0-->(ct_1+2) -). 
To decide which understood word is the possessive descriptor element:  (- ct_0-->(ct_1+3) -).
To decide which struct is as one of the descriptors: (-(+ 1<4> +)-).
To decide which understood word is 'MY\THIS\THESE': (- 0 -).
To decide which understood word is 'THAT\THOSE': (- 1 -).


Chapter - Get and Set a particular element for arrays of word values

	[ Get a[i]  ]
To decide what K is the (n - a number) element of (arr - a 1-based index based rulebook producing a word value of kind K):
(- {arr}-->{n} -).
To decide what K is the (n - a number) element of (arr - a 0-based index based rulebook producing a word value of kind K):
(- {arr}-->{n} -).

        [ Assign a[i] = x; ]
To change (n - a number) element of (arr - a 1-based index based rulebook producing a word value of kind K) to (obj - K):
(- {arr}-->{n} = {obj}; -).
To change (n - a number) element of (arr - a 0-based index based rulebook producing a word value of kind K) to (obj - K):
(- {arr}-->{n} = {obj}; -).

        [ Assign a[i] = x; where i is assumed to be the chosen row ]
To change (arr - a 0-based index based rulebook producing a word value of kind K) element to (obj - K):
(- {arr}-->ct_1 = {obj}; -).

	[ Get a[i] where i is assumed: it's the chosen row. ]
To decide what K is the (arr - a 1-based index based rulebook producing a word value of kind K) element: 
(-  {arr}-->ct_1 -).
To decide what K is the (arr - a 0-based index based rulebook producing a word value of kind K) element: 
(-  {arr}-->ct_1 -).

Chapter - Get and Set a particular element for arrays of letters

[ Assign a[i] = x; ]
To change (Nth - a number) letter of (arr - a 1-based index based rulebook producing ZSCII letters) to (char - ZSCII letter): 
(- {arr}->({Nth}+LETTER_ARRAY_BASE) = {char}; -).

[ Get a[i]  ]
To decide what ZSCII letter is the (Nth - a number) letter of (arr - a 1-based index based rulebook producing ZSCII letters):
(- {arr}->({Nth}+LETTER_ARRAY_BASE) -).

[ Get a[i] where i is assumed: it's the chosen row. ]
To decide what ZSCII letter is the (arr - a 1-based index based rulebook producing ZSCII letters) letter: 
(-  {arr}->(ct_1+LETTER_ARRAY_BASE) -).

[ Say a run of letters.  Used by PrintSnippet and some TRACE output. ]
To say (buf  - a 1-based index based rulebook producing ZSCII letters) between/from (min - a number) and/to (max - a number):
(-	{-require-ctvs} for(ct_1 = {min} + LETTER_ARRAY_BASE; ct_1 <= {max} + LETTER_ARRAY_BASE; ++ct_1) print (char) {buf}->ct_1;   -).


Section 1 - Get and Set the array size for 1-based arrays only

[ Get size of a ]
To decide what number is the number of elements in/of (arr - a 1-based index based rulebook producing word values):  [ The number of words & letters variations are re-defined in the (for Z-machine only) section below. ]
(- {arr}-->0 -).

[ Set size of a ]
To change (arr - a 1-based index based rulebook producing word values) to have (n - a number) elements: 
(- {arr}-->0 = {n}; -).

Section 2 - Searches, Loops, and Ifs

Include (- 
Global cacheval1;  ! it hurts performance to put ct_0-->0 into the While condition test, so,
Global cacheval2;   ! these variables just exist so I needn't do that. 
Global cacheval3;
Global cacheval4;
Global cacheval5;
Global cacheval6;
-).

Any problems is a command parser error that varies. 
The any problems variable translates into I6 as "cacheval4". [too many locals error]
Where that word was found is a number that varies.
Where that word was found variable translates into I6 as "cacheval4". [if... then used it]


	[ Repeat through, setting ct_0 and ct_1 for the various chosen/element phrases. ]
To repeat through (arr - a 0-based index based rulebook producing a value of kind K) of size (size - a number) begin -- end:
(-	{-require-ctvs}ct_0 = {arr};
	for (ct_1=0 : ct_1<{size} : ++ct_1)  -).

To repeat through (arr - a 0-based index based rulebook producing a value of kind K) of size (size - a number) starting at (min - a number) begin -- end:
(-	{-require-ctvs}ct_0 = {arr};
	for (ct_1={min} : ct_1<{size} : ++ct_1)  -).

To repeat through (arr - a 1-based index based rulebook producing a value of kind K) begin -- end:
(-	{-require-ctvs}ct_0 = {arr}; cacheval1 = ct_0-->0;
	for (ct_1=1 : ct_1 <= cacheval1 : ++ct_1)  -).

To repeat through (arr - a 1-based index based rulebook producing a value of kind K) starting at (min - a number) begin -- end:
(-	{-require-ctvs}ct_0 = {arr}; cacheval1 = ct_0-->0;
	for (ct_1={min} : ct_1 <= cacheval1 : ++ct_1)  -).

To repeat through all (struct size - a number) columns of (arr - a 1-based index based rulebook producing structs) begin -- end:
(-	{-require-ctvs}ct_0 = {arr}; cacheval1 = ct_0-->0;
	for (ct_1=1 : ct_1 <= cacheval1 : ct_1 = ct_1 + {struct size} )  -).

	[ If x is listed in a, phrase. ]
To if (obj - K) is listed in (arr  - a 0-based index based rulebook producing a value of kind K) of size (size - a number), (ph - a phrase):
(-	{-require-ctvs}
	ct_0 = {arr};
	cacheval1 = {size}; 
	cacheval2 = {obj};
#ifdef TARGET_ZCODE;
	@scan_table cacheval2 ct_0 cacheval1 $82 -> ct_1  ?~ScanTable{-counter:scantable};
.ScanTable{-advance-counter:scantable};
	if (ct_1)  ! returns the address if found or 0 if not found
	{	! convert the address to the element # 
		ct_1 = (ct_1 - ct_0) / WORDSIZE;
		if (true) {ph}; }
	}
#ifnot; 
	@linearsearch cacheval2 WORDSIZE ct_0 WORDSIZE cacheval1 0 $$0100    ct_1;
	if (ct_1 ~= -1)
		{ph}; }
#endif;  !-).

	[ if x is listed in a, block of phrases. ]
To if (obj - K) is listed in (arr  - a 0-based index based rulebook producing a value of kind K) of size (size - a number) begin -- end:
(-	{-require-ctvs}
	ct_0 = {arr};
	cacheval1 = {size}; 
	cacheval2 = {obj};
#ifdef TARGET_ZCODE;
	@scan_table cacheval2 ct_0 cacheval1 $82 -> ct_1  ?~ScanTable{-counter:scantable};
.ScanTable{-advance-counter:scantable};
	if (ct_1)  ! if something found, convert the pointer to an index 
	{	ct_1 = (ct_1 - ct_0) / WORDSIZE;
#ifnot; 
	@linearsearch cacheval2 WORDSIZE ct_0 WORDSIZE cacheval1 0 $$0100    ct_1;
	if (ct_1 ~= -1)
	{
#endif;  !-).

To if (obj - K) is listed in (arr - a 1-based index based rulebook producing a value of kind K), (ph - phrase):
(-	{-require-ctvs}
	ct_0 = {arr};
	cacheval1 = {arr}-->0; 
	cacheval2 = {obj};
#ifdef TARGET_ZCODE;
	@scan_table cacheval2 ct_0 cacheval1 $82 -> ct_1  ?~ScanTable{-counter:scantable};
.ScanTable{-advance-counter:scantable};
	if (ct_1)  ! if something found, convert the pointer to an index 
	{	ct_1 = (ct_1 - ct_0) / WORDSIZE;
		if (true) {ph}; }
	}
#ifnot; 
	@linearsearch cacheval2 WORDSIZE ct_0 WORDSIZE cacheval1 0 $$0100    ct_1;
	if (ct_1 ~= -1)
		{ph}; }
#endif;  !-).

To if (obj - a word value) is listed (field - a struct) in/from (arr - a 1-based index based rulebook producing structs) begin -- end:
(-	{-require-ctvs}ct_0 = {arr}; 
	cacheval1 = ct_0-->0; 
	cacheval2 = ({field} & 7); 
	cacheval3 = ct_0 + ({field} / 8) - 1;
	for (ct_1=1 : ct_1 <= cacheval1 : ct_1 = ct_1 + cacheval2)
            if (cacheval3-->ct_1 == {obj})  { cacheval1 = 0;  !-).

To if (obj - K) is listed in (arr - a 1-based index based rulebook producing a value of kind K) begin -- end:
(-	{-require-ctvs}
	ct_0 = {arr};
	cacheval1 = {arr}-->0; 
	cacheval2 = {obj};
#ifdef TARGET_ZCODE;
	@scan_table cacheval2 ct_0 cacheval1 $82 -> ct_1  ?~ScanTable{-counter:scantable};
.ScanTable{-advance-counter:scantable};
	if (ct_1)  ! if something found, convert the pointer to an index 
	{	ct_1 = (ct_1 - ct_0) / WORDSIZE;
#ifnot; 
	@linearsearch cacheval2 WORDSIZE ct_0 WORDSIZE cacheval1 0 $$0100    ct_1;
	if (ct_1 ~= -1)
	{
#endif;  !-).

	[ Misc. ]
To if (obj - K) is listed in (arr - a 1-based index based rulebook producing a value of kind K) between (min - a number) and (max - a number) begin -- end:
(-	{-require-ctvs}
	ct_0 = {arr} + {min};
	cacheval1 = {max} - {min}; 
	cacheval2 = {obj};
#ifdef TARGET_ZCODE;
	@scan_table cacheval2 ct_0 cacheval1 $82 -> ct_1  ?~ScanTable{-counter:scantable};
.ScanTable{-advance-counter:scantable};
	if (ct_1)  ! if something found, convert the pointer to an index 
	{	ct_1 = (ct_1 - ct_0) / WORDSIZE;
#ifnot; 
	@linearsearch cacheval2 WORDSIZE ct_0 WORDSIZE cacheval1 0 $$0100    ct_1;
	if (ct_1 ~= -1)
	{
#endif;  !-).

To fill (arr - a 1-based index based rulebook producing ZSCII letters) with (char - a ZSCII letter) starting at (min - a number) for (n - a number) elements:
(-	{-require-ctvs}  cacheval1 = {arr}+{min}+LETTER_ARRAY_BASE;
	for (ct_1=0 : ct_1<{n} : ++ct_1)
		cacheval1->ct_1 = {char};  -).

To shift (arr - a 1-based index based rulebook producing ZSCII letters) left by (size - a number) starting at (source - a number):
(-	{-require-ctvs} ct_0 = {arr};
	cacheval1 = {arr} + LETTER_ARRAY_BASE - {size}; 
	cacheval2 = {arr} + LETTER_ARRAY_BASE;
	for (ct_1={source} : ct_1<INPUT_BUFFER_LEN : ++ct_1)
		cacheval1->ct_1 = cacheval2->ct_1;
	(+ the number of letters in the chosen array +) = (+ the number of letters in the chosen array +)  - {size}; -).

To shift (arr - a 1-based index based rulebook producing a word value) left between/from (min - a number) and/to (max  - a number) using (i - a nonexisting number variable):
(-	for ({i} = {min} : {i} <= {max} : ++{i} )  {arr}-->({i}) = {arr}-->({i} + 1);   -).

To shift (arr - a 0-based index based rulebook producing a word value) left between/from (min - a number) and/to (max  - a number) using (i - a nonexisting number variable):
(-	for ({i} = {min} : {i} < {max} : ++{i} )  {arr}-->({i}) = {arr}-->({i} + 1);   -).

To insert (length - a number) elements into (arr - a 1-based index based rulebook producing ZSCII letters) at (position - number):
(- 	{-require-ctvs} ct_0 = {arr};
	for (ct_1=INPUT_BUFFER_LEN-1 : ct_1 >= {position}+LETTER_ARRAY_BASE+1 : --ct_1) 
		{arr}->ct_1 = {arr}->(ct_1 - ({length})); 
	(+ the number of letters in the chosen array +) = (+ the number of letters in the chosen array +) + {length};  -).

To copy (count - a number) elements FROM (source - a 1-based index based rulebook producing ZSCII letters) at (sourceAt - number) TO (dest - a 1-based index based rulebook producing ZSCII letters) at (destAt - number):
(-	cacheval1 = {dest} + {destAt} + LETTER_ARRAY_BASE;  
	cacheval2 = {source} + {sourceAt} + LETTER_ARRAY_BASE;
	#ifdef TARGET_ZCODE;
	@copy_table cacheval2 cacheval1 {count};
	#ifnot; 
	@mcopy {count} cacheval2 cacheval1;
	#endif;  -).

[ "The previous input buffer", used for OOPS, is only 64 letters long, not INPUT_BUFFER_LEN letters long. ]
To copy (count - a number) letters from (source - a 1-based index based rulebook producing ZSCII letters) to (destination - a 1-based index based rulebook producing ZSCII letters):
(-	#ifdef TARGET_ZCODE;
	@copy_table {source} {destination} {count};
	#ifnot; 
	@mcopy {count} {source} {destination};
	#endif; -).

To copy (source - a 1-based index based rulebook producing ZSCII letters) into (destination - a 1-based index based rulebook producing ZSCII letters):  
(-	#ifdef TARGET_ZCODE;
	@copy_table {source} {destination} INPUT_BUFFER_LEN;
	#ifnot; 
	@mcopy INPUT_BUFFER_LEN {source} {destination};
	#endif; -).

To decide what 1-based index based rulebook producing ZSCII letters is (arr - a 0-based index based rulebook producing values) as a letter array: (- {arr} -).  [ be sure to multiply the #/elements by WORDSIZE ]

To copy (mwords - a number) chosen objects from (source - a 0-based index based rulebook producing objects) to (destination - a 0-based index based rulebook producing objects) (this is COBJ__Copy): 
	let the count of bytes be mwords multiplied by the virtual machine's wordsize;
	copy  count of bytes  letters from the source as a letter array to the destination as a letter array.

To copy (mwords - a number) elements from (source - a 0-based index based rulebook producing pattern unions) to (destination - a 0-based index based rulebook producing pattern unions): 
	let the count of bytes be mwords multiplied by the virtual machine's wordsize;
	copy  count of bytes  letters from the source as a letter array to the destination as a letter array.

To append a/an/-- (z - a ZSCII letter) to (buf - a 1-based index based rulebook producing ZSCII letters):
(- 	{-require-ctvs} ct_0 = {buf}; ct_1 = (+ the number of letters in the chosen array +);
	ct_0->(ct_1 + WORDSIZE) = {z};
	(+ the number of letters in the chosen array +)++;  -).

To append (count - a number) letters from (source - a 1-based index based rulebook producing ZSCII letters) to (destination - a 1-based index based rulebook producing ZSCII letters):
(- 	{-require-ctvs} 
	ct_0 = {destination};  
	cacheval1 = {destination} + WORDSIZE + (+ the number of letters in the chosen array +);
	cacheval2 = {source} + WORDSIZE;
	cacheval3 = {count};
	#ifdef TARGET_ZCODE;
	@copy_table cacheval2 cacheval1 cacheval3;
	#ifnot; 
	@mcopy cacheval3 cacheval2 cacheval1;
	#endif; 
	(+ the number of letters in the chosen array +) = (+ the number of letters in the chosen array +)  + {count}; -).

To append (obj - K) to (arr - a 0-based index based rulebook producing a value of kind K) of size (size - a number variable): 
(- {arr}-->({size})++ = {obj}; -).


Section - For use by WDYM element grouping

[ Used in the which-do-you-mean activity on the match list & match groups list. ]

The current group-together number is a number that varies. 

To decide if we should say the group as A\AN\SOME: (- (match_classes-->ct_1 < 0) -).
To we should say (element - a number) as A\AN\SOME: (- if (({element}) > 0) ({element}) = -({element}); -).

To repeat through the first item of each group begin -- end:
(-		{-require-ctvs}ct_0 = match_list; ct_1 = 0;
		for ((+ the current group-together number+) = 1 : (+ the current group-together number+)<=number_of_classes : ++(+ the current group-together number+))  {
			while (((match_classes-->ct_1) ~= (+ the current group-together number+)) && ((match_classes-->ct_1) ~= -(+ the current group-together number+)))
				ct_1++;   !-).

To if an/a/-- (earlier - nonexisting number variable) indistinguishable element is listed in (arr - a 0-based index based rulebook producing objects) begin -- end:
(-	for ({earlier}=ct_1-1 : {earlier}>=0 : --{earlier})
		if (Identical({arr}-->ct_1, {arr}-->{earlier})) -).

[To choose (Nth - a number) element from (array - a 1-based index based rulebook producing word values):
	(- {-require-ctvs}ct_0 = {array}; ct_1 = {Nth}; -).]


Chapter - Array-based Properties

[ An object may have a property which is a 0-based array.  These have their size in obj.#prop while the elements are pointed to by obj.&prop.  However, the size returned is in bytes, not double-bytes, so a division is necessary. ]

[ Useful for "name" and "add_to_scope"  and "parser_inflection" properties only.  Probably needs the ability to self-nest. ]
To decide what [0-based index based rulebook producing] object is the hidden (prop - a value of kind K valued property) array of (O - an object):  
(- {O}.&{prop} -).

To decide what number is the size of (prop - a word value valued property) of (O - an object):  
(- {O}.#{prop} -).

To repeat through (prop - an [at least sometimes array] property) of (obj - an object) begin -- end:  
(- 	{-require-ctvs}
	ct_0 = {obj}.&{prop};
	cacheval1 = ({obj}.#{prop}) / WORDSIZE;
	for (ct_1=0 : ct_1 < cacheval1 : ++ct_1)  -).

[ This one needed to nest within the above repeat loop. ]
To if (word - an understood word) is listed in (prop  - an understood word valued property) of (obj - an object), (ph - phrase):
(-	{-require-ctvs}
	cacheval4 = {obj}.&{prop};
	cacheval3 = ({obj}.#{prop}) / WORDSIZE; 
	cacheval2 = {word};
#ifdef TARGET_ZCODE;
	@scan_table cacheval2 cacheval4 cacheval3 $82 -> cacheval5  ?~ScanTable{-counter:scantable};
.ScanTable{-advance-counter:scantable};
	if (cacheval5)  ! returns the address if found or 0 if not found
	{	! convert the address to the element # 
		cacheval5 = (cacheval5 - cacheval4) / WORDSIZE;
		if (true) {ph}; }
	}
#ifnot; 
	@linearsearch cacheval2 WORDSIZE cacheval4 WORDSIZE cacheval3 0 $$0100    cacheval5;
	if (cacheval5 ~= -1)
		{ph}; }
#endif;  !-).

[!	for (ct_1 = 0 : ct_1 < cacheval1 : ++ct_1)
!            if ({word} == ct_0-->ct_1) {ph}; ]

Volume - Differences between the Z-machine and Glulx

Book - (for Z-machine only)

[holds an array or routine]
To decide if (ad - a 0-based index based rulebook producing a word value) is currently a rule:
(- (UnsignedCompare({ad}-->0, top_object) > 0) -).

Include (- 
Constant LETTER_ARRAY_BASE = 1; 
[ DictionaryWordToVerbNum dword verbnum; return 255 - (dword->#dict_par2); ]; 
-).

To decide which understood word is the (Nth - number) -th/-- word --/element of (ar - a 1-based index based rulebook producing a struct): 
(- ({ar})-->(({Nth})*2-1) -).
To decide which number is the (Nth - number) -th/-- word's length --/element of (ar - a 1-based index based rulebook producing a struct): 
(- ({ar})->({Nth}*4) -).
To decide which number is the (Nth - number) -th/-- word's position --/element of (ar - a 1-based index based rulebook producing a struct): 
(- ({ar})->({Nth}*4+1) - LETTER_ARRAY_BASE -).
To decide which number is the (Nth - number) -th/-- word's real position --/element of (ar - a 1-based index based rulebook producing a struct): 
(- ({ar})->({Nth}*4+1) -).

To change (Nth - number) word of (arr - a 1-based index based rulebook producing structs) to (data - understood word):  
(- {arr}-->({Nth}*2-1) = {data}; -).
To change (Nth - number) word's length of (arr - a 1-based index based rulebook producing structs) to (data - number):  
(- {arr}->({Nth}*4) = {data}; -).
To change (Nth - number) word's position of (arr - a 1-based index based rulebook producing structs) to (data - number):  
(- {arr}->({Nth}*4+1) = {data}; -).

[ Get the number of structs ]
To decide what number is the number of words in/of (prs - a 1-based index based rulebook producing structs): 
(-({prs}->1)-).

[ Get the number of letters/elements. ]
To decide what number is the number of letters in/of (buf - a 1-based index based rulebook producing ZSCII letters):
(-({buf}->1)-).

To unpack (act - an action name variable) and whether (rev - truth state variable) from (packed data - 0-based index based rulebook producing grammar tokens):
(-	{act} = 256*({packed data}->0) + {packed data}->1;
	{rev} = (({act} & $400) ~= 0);
	{act} = {act} & $3ff;  -).


Book - (for Glulx only)

[holds an array or routine]
To decide if (ad - a 0-based index based rulebook producing a word value) is currently a rule: 
(- ((({ad}-->0)->0) ~= $70)  -).

Include (-  
Constant LETTER_ARRAY_BASE = 3;
[ DictionaryWordToVerbNum dword verbnum;
	dword = dword + #dict_par2 - 1;
	@aloads dword 0 verbnum;
	return 65535 - verbnum;
];-).

To decide which understood word is the (Nth - number) -th/-- word --/element of (ar - a 1-based index based rulebook producing a struct): 
(- {ar}-->(({Nth})*3-2) -).
To decide which number is the (Nth - number) -th/-- word's length --/element of (ar - a 1-based index based rulebook producing a struct): 
(- {ar}-->(({Nth})*3-1) -).
To decide which number is the (Nth - number) -th/-- word's position --/element of (ar - a 1-based index based rulebook producing a struct): 
(- ({ar}-->(({Nth})*3) - LETTER_ARRAY_BASE) -).
To decide which number is the (Nth - number) -th/-- word's real position --/element of (ar - a 1-based index based rulebook producing a struct): 
(- {ar}-->(({Nth})*3) -).

To change (Nth - number) word of (arr - a 1-based index based rulebook producing structs) to (data - understood word):  
(- {arr}-->({Nth}*3-2) = {data}; -).
To change (Nth - number) word's length of (arr - a 1-based index based rulebook producing structs) to (data - number):  
(- {arr}-->({Nth}*3-1) = {data}; -).
To change (Nth - number) word's position of (arr - a 1-based index based rulebook producing structs) to (data - number):  
(- {arr}-->({Nth}*3) = {data}; -).


[ Get size of a ]
To decide what number is the number of words/letters in/of (arr - a 1-based index based rulebook producing word values):  
(-({arr}-->0)-).

To unpack (act - an action name variable) and whether (rev - truth state variable) from (packed data - 0-based index based rulebook producing grammar tokens):
(-	@aloads {packed data} 0 {act};
	{rev} = ((({packed data}->2) & 1) ~= 0);  -).



Original Parser ends here.

---- DOCUMENTATION ----

Chapter: Introduction

The parser is the part of software that takes the letters our player types into the game, and figures out to which action(s) and object(s) those words refer.  This transformative step is useful to the game author because the author is in most cases only concerned with the player's intent, not how the intent was worded.  For Inform, the parser is one of the oldest pieces of software within it, and since changes to it could interfere with players' long-ingrained typing habits, has not been rewritten with modern tools or sensibilities. 

If the parser isn't doing what an author expects or needs, they are welcome to change it anyway.  But the language and techniques used to build the parser presents a technical obstacle even to the above-average Inform 7 author.  And so, this extension presents the venerable parser in the rather more readable Inform 7 source code, but written in such a way that, upon pressing GO, Inform 7 will effectively re-create the original parser.  

This documentation walks us through the higher-level aspects of the parser while omitting many of the finer details of memory management, array access, and virtual machine differences that the original code makes extensive use of.

Let's begin. 

Chapter: Parse

Section: Enter the Parser

Of the many rulebooks within Inform 7, one of the top-level ones is named "the turn sequence rules".  (Click the Rules tab within the index. The "top level" section is near the bottom, below "light and darkness".)  The first rule within the turn sequence rules is the parse command rule.  This calls a to-phrase, "parse", which you'll find within this extension. This is our starting point, and is also the largest single part of this extension.  Let's walk down this to-phrase line-by-line to see what the parser actually does. 

The first lines reset many variables to their initial state, such as "the parser's results" which will eventually be copied into "the actor", "the noun" and "the second noun" which we use regularly. (We'll see what "the ranking strategy" does much later. For now, it's being reset to its initial state as well.)  But then we hit this curious line.
	if we have more to parse:

If the player enters, "TAKE COIN. EXAMINE IT.", the parser will process the first command, leaving "EXAMINE IT" behind and setting the More To Parse truth state to true.  So the first thing the parser does it look for something leftover from a previous parse.  If found, it'll clear the state and use that as the next command to work on.  

But the usual case is the Otherwise, in which we'll carry out the READING A COMMAND activity.  A peculiar While loop surrounds the activity because of the "reject the player's command" phrase we sometimes use:

	After reading a command: 
		if the player's command includes "please": 
			say "Please do not say please."; 
			reject the player's command.

The "while this isn't done" pairs with the following "do that again while the rule failed" so the lines in between them will be re-ran if the author used "reject the player's command".  

You'll notice the ranking strategy is initialized to 0 again.  A brief digression:  it's because of the line "(At this point we ReType)".  Normally in a phrase, Inform performs the lines sequentially, barring the occasional "if" statement, which causes it to sometimes skip ahead, and the occasional "repeat" or "while" statement, which causes it to hop backward a few lines.  The "at this point..." line marks a place to hop to from anywhere else in the phrase, specifically, from a line like "go to where...".  Since "at this point" is a landing pad for such long-range jumps, the ranking strategy is re-initialized just in case it's been changed by the time the jump launched from where-ever. 

Now, we already now what "the location" means -- it's what room or container our player is currently in.  "The actor's scopewise location" is effectively the same thing with one minor difference which I'll explain when we get to that.  (Also, what is "in scope" and what is "visible" is also the same thing, with one minor difference, which we'll examine later.)  For now, we initialize the variable. 

The lines within the "if handling" block act as a Last For Reading A Command rule, and it's the first line within which does most of the work.  "The number of words typed in at the keyboard into.." is a phrase elsewhere in this extension which talks to the keyboard, redraws the status line and command prompt, and processes UNDO, OOPS, and the easier parts of AGAIN.  (Its return value is unused, but could be.)  It also breaks the string of letters into a string of words.

As you know, interactive fiction is played on an 'interpreter', such as Gargoyle, Quixe, Frotz, Zoom, Spatterlight, and so on.  One of the duties of the interpreter is, given a string of player-typed letters (which is in "the player's input buffer"), group them into words and look those words up in the game's dictionary.  The interpreter gives back a list of dictionary references (which is in "the player's parsed command").  So a command like,

	EXAMINE THE DOOR

 comprises several letters, or three words, depending on how you look at it.  This is also done within that sole line when it goes to the keyboard for information.  So now, what to do with it?

The next line puts good information into "the player's command", which is used by Inform 7 authors.  If you don't know what a snippet is, now's the time to learn:  it's a pair of numbers.  The first number is the Nth word of a series of words, and the second number is the number of words in the series.  (The first number is multiplied by a hundred and added to the second, so if a player should type in a command with more than 99 words in it, the parser will break.)  Since "the player's command" is supposed to represent the whole command, it's set to the number of words in EXAMINE THE DOOR (3), plus 100 (because it always starts from word #1).  Another snippet, "the matched text", might hold 201 to represent THE in the above example, or 202 to represent THE DOOR, or 102 to represent EXAMINE THE.

The next line looks like a tautology:  now the number of words in the command is the word count.  Well, "the number of words in the command" is a number-that-varies, while "the word count" is a to-phrase that figures out how many words are in the current command.  The reason we make a copy of it is for quick reference later:  every time we need to know this information, it's slow if we have to ask the phrase to count them all up again.  So this line is like writing down the answer on a little slip of paper for use later on. 

Anyway, outside that if-statement we have a landing pad, "at this point we reparse".  We soon after initialize some variables -- including ones we just did a moment ago -- because who knows what has happened from where the jump launched.  It might have even re-written the letters in the input buffer for all we know. We also issue the line, "PARSE the player's input buffer into the player's parsed command", which again asks the interpreter to turn the string of letters into a string of words.  

Now why, you might ask, would we do this again, especially if the same line already appeared within "if we have more to parse"?  Partly it's because this old parser had features added to it piecemeal over a couple of decades, so it's safer when adding to it not to change anything that works already even if you're duplicating what work the software needs to do.  Since later parts of the parser can rewrite what letter or words are in the player's input buffer, it needs the ability to do-over.  When it needs a complete do-over, it lands at "we reparse". So in some sense parsing -- without caring where the input actually comes from -- actually starts here. 

That's the best explanation I can give, really.  I don't know because I didn't write it, just translated it to this pseudo-English that is Inform 7.


Section: Walking Down a Path of Words

Here's a quick dictionary of the terms we'll see in the following lines.

"The parser's current word position" is the most important.  The parser will consider one-by-one each of the looked-up dictionary words that the interpreter gave it. This variable is which one it's currently on. 

"The verb's position" will be the Nth word where the verb is found, once we've found it.  Usually it'll be one: EXAMINE ME, TAKE THE ROCK, CLIMB A TREE, all have the verb as the first word.  But sometimes there's a DR HATHAWAY, EXAMINE ME which moves it a bit further down.  

"if trace..." is ignored except when the testing command TRACE has been issued.  Go ahead, start playing your work-in-progress in the right-side pane of the Inform 7 environment, and type TRACE 6, followed by any legal command, such as EXAMINE ME.  These if-trace statements will say a lot.  If you modify the parser somehow and it breaks, the TRACE command is invaluable.  So we'll see these "if trace..." statements sprinkled throughout. 

"The person asked" is a synonym for "the actor", which you are already familiar with. 

"The actor's scopewise location" is the same as "the location" except in a very specific circumstance.

"The predicate's position" marks the beginning of a sentence's predicate, which for English, is where the verb is.  However, the parser does have some vestigial support for non-English languages, which I have not taken the care to preserve, nor am convinced still function.

"The scope decider" is likewise an old feature of the parser which Inform 7 supplies in a different way.  It used to be that an object could decide for itself whether it was in scope or not, or put other objects into scope as it pleased, but the modern way is to use the Deciding The Scope activity.  Still, this feature is mostly preserved as this rule-that-varies.

"The action to be" is like "the action name part of the current action" (see chapter 12.20, Stored Actions), with the minor difference in that it's actually a lot simpler.  Like "the noun" and "the second noun", this one is "the verb" except it is an action name -- the taking action, the inserting it into action -- rather than the specific synonym used -- like GET vs TAKE.  Still, it's useful for Inform 7 work.

And now, we're "at the point we BeginCommand".  

The "next word if any" is a phrase which takes a single step down the path of words we're to parse.  If the word it says it finds is the error state "no more words left to parse", then, in this particular case, we throw a parser error.  Since we just began parsing, there should be plenty of words to parse, but again, those landing pads we passed on the way here could've messed things up. 

But anyway, assuming nothing's broken, we ask if the word is AGAIN.  Inside this "if the verb is AGAIN" is some pretty obvious code that looks like a series of Check rules followed by a Carry Out rule.  The only new-ish bit is "copy the Again buffer into the player's buffer".  Since AGAIN makes the parser do whatever the player typed-in previously, the parser keeps a copy of the previous command around.  It keeps it in "the again buffer".  The rest of the lines within this if-statement look familiar.  And we also see our first "go back" launch.  Since it says "back" the landing pad is earlier in the phrase; we saw it over by the Reading A Command activity, if you'll recall.

Assuming the word wasn't AGAIN, then we make that copy into the Again buffer for next time. 

Beginning with "if the predicate's position is 0" is an interesting feature not exposed to Inform 7.  If you have a German character who only speaks German, an author might want the player to give commands in German, like "DR VAN HELSING, ÜBERPRÜFEN SIE DIES." rather than "DR VAN HELSING, EXAMINE THIS".  This block of code allows this. Since it isn't exposed to Inform 7 (and my ported code may not be completely correct), I'll explain it only briefly.  Characters have a hidden property, a rule-that-varies, which is totally responsible for parsing the line of text. The rule produces an "alternative grammar result" (see elsewhere in this extension) which the following if-otherwise-if chain looks at.  "This created action" means it's all done, so copy the answers to the appropriate locations and stop parsing. Other results mean never mind or error, as appropriate. That's all I'll say besides this:  the only way that "the predicate's position" won't be zero is due to code we haven't even gotten to yet, which will launch & land before this if-block. 

The next block is within "if the verb is a word unknown by the game or the usages of the verb does not include being a verb".  By 'verb' we probably still mean the first word, and now we're asking if that first word really is a verb.  If it isn't, the code within this if-statement is going to see if that word is a compass direction.  If it is, we'll copy the answers to the appropriate locations and then stop parsing: the command is simply "NORTH" or some such.  

A note about the "save.." and "restore..." lines.  If we want to try out some code 'hypothetically', we save what that code might use or change with "save...", put into those variables what we want that code to see, use the code, then "restore.." what was changed.  In this case, we made a new variable with "let pu be..." and called the code.  

So now let's briefly look at "noun domain". 


Section: A First Look at Noun Domain

The phrase known as "noun domain" straddles that line between text and simulated space.  When the player types "LOOK INSIDE THE DARK WELL", the parser at first sees merely a string of five words.  But also, in an interactive fiction, the dark well is a simulated space, which can contain things including the player.  And if the player is inside the well, what he can interact with is constrained by virtue of his location there.  Moreover, the verb LOOK INSIDE itself expects a thing to look inside, so "noun domain" constrains what it understands in that way too.  Consider the player entering "KISS ROCK".  The kissing action says to expect a someone, so even if there's a perfectly serviceable rock at hand, "noun domain" will make a fuss because ROCK is not in the expected domain of 'someones'. 

Here, we're searching the "compass" place -- and I use the word place in a loose conceptual sense -- under the expectation of finding a 'something'.  This is, I must admit, a bad example of Noun Domain, because Inform has for many years had a hidden game object called "compass" which 'contains' the directions.  In other words, this is a dirty hack which Inform 7 could handle more elegantly if someone were to write a parser from first principles in Inform 7. The parser is old code, and again, altering it could muck with player's habits, so this odd way of determining directions has stayed this way for years. 

At the end of the day, know this:  "noun domain" is in charge of parsing a noun phrase (see your English textbook for the definition of noun phrase) with the assumption of finding a fit within a particular domain, such as 'someone' or 'something inside' or whatever.  The answer it gives back is called, in this code, a "pattern union" for lack of a better term, because it returns any number of meanings -- some kind of game object, various error codes, various commands to the parser itself, etc.

So, back to the code at hand.  Assuming what was parsed was NOT a direction, but "noun domain" says it IS a recognizable something-or-other, we'll skip right by both of those if-statements and out of the "if the verb... or the usages..." block we've been in for the last few paragraphs.  And this brings us to conversation, and addressing other people.


Section: Addressing Other Characters

"if the player is the person asked" begins this larger if-statement, followed immediately by a search for commas in the player's command.  So we're looking for commands of the form JANE, LOOK AT ME which has a person we're ordering around, a comma, and then the order in question. 

The "if ... the 'comma' is listed in the player's parsed command" is pretty obvious, but what's with the two ifs in front of it?  Well, if we launched from further below, and landed above, we need to protect ourselves from that.  Also we need to be aware of situations like JANE, BOB, LOOK AT ME, which is grammatically incorrect, but who knows what a player may enter.  Anyway, this "is listed in" will set "where that word was found".  (Inform considers a comma to be a word all on its own.)  If there's no comma, we skip way down to "the point we do not have conversation". Otherwise, let's look at how Inform handles addressing other people. 

We'll call noun domain again, telling it to expect any 'someone' who's either in the player's location, or carried/worn by the player.  (We make allowances for the fantasy genre.)  Now we run through a series of if-statements that act much like Check rules, some of which look for strange erroneous input, and some enforce the rules of the virtual world.  Once things check out mostly OK, we'll update the player's pronouns, update the position of the verb to be after the comma, and after one final check, set "the actor" to this object that noun domain gave us.  We also update the location variable the parser uses, because commands like TAKE THIS depend on what the addressee can reach, not what the player-character can reach.  

If all went well, we launch back up to BeginCommand.  If we find another person and a second comma, this block will be skipped entirely, so the Answering It That action will be called with the remainder of the command, multiple commas and all. 


Section: At This Point We Do Not Have Conversation

A slight misnomer, this point, because even if we do have conversation, we'll jump way back up to the earlier part, filter our way back down (except for BOB, NORTH or somesuch), and then fall to here when the addressee portion above refuses to allow a second entrance.  

Or maybe there never was an addressee and we got here honestly. Either way, we always end up here except in the case of a compass direction.  So let's look at the word that "the verb" is pointing to, either as position #1 or wherever is at the comma's position, plus one.  If it isn't a verb, well, that might be ok. What if the author issued a line like this:

	Understand "[tool]" as using.

A tool isn't a verb, but a lone noun is still OK by the game.  Inform has a faux-verb it uses for those sorts of things, which we call "the missing verb for noun-only commands".   But Inform proclaims things like NURSE, SCAPEL should go to the Answering It About action, so it does this by sending control down to "where we GiveError".  Of course, invoking the Answering action isn't an error, so this is bad design, but again, this is old code which accumulated features over a very long time.  

Anyway, assuming everything is OK, and it usually is, we have a verb.  It's interesting that out-of-worldness is attached to the verb, not to the action, but again, old code.  Set the "action out of world" variable and ensure an NPC isn't trying to accomplish it. 

This brings us to understand lines and grammar tokens, which we'll digress for explanation. 


Section:  Understand Lines, Grammar Tokens, and Types of Grammar Tokens

Game authors write understand lines like so.

	Understand "steal [something]" as taking.
	Understand "toss [other things] in/inside/into [something]" as inserting it into. 
	Understand "choose [things inside] from [something]" as removing it from.
	Understand "splash [available color]" as painting.
	Understand "go to [any room]" as going by name.

Each of those understand lines is transformed into a machine-readable representation within the game file.  Each element of each line will state 1) what the 'type' of the element is, and 2) the actual value.   Let's look first at the umbrella types possible, then it will start to make sense. 

There's several token types in the parser, though Inform 7 uses only some of them.  This extension frequently denotes a token type by angle brackets within single quotes, '<like this>', except for the simple ones like the end of line token.  Using the sample game author code just above to illustrate, the relevant token types are:

	'<grammar token>' - like "[things inside]"
	'<understood word>' - like "choose" or "from"
	'<description of values>' - like "[available color]"
	'any <description of objects>' - like "[any room]"
	'<understand token>' - [ then tdata is a <Routine> that returns GPR_FAIL, GPR_PREPOSITION, etc.]
	the first slashed synonym - 'in' in "in/inside/into"
	a middle slashed synonym - 'inside' in "in/inside/into"
	the last slashed synonym - 'into' in "in/inside/into"

(The slashed-synonym types aren't true types since they're just a variation on '<understood word>', but we'll talk of them as if they were.)  Now remember each of the above is a type. Meaning, each of the above has a range of values that it can be, and the ranges for each are very different.  For example, the 'any <description of objects>' token can have as its value any of the following:

	"[any room]"
	"[any person]"
	"[any thing touched by a snorgle]"

..and so on.  Similarly, '<understood word>' covers words the player can type, like "steal", "toss", "choose", "from", "splash", and so on.  An interesting token type is '<grammar token>', whose value can be one of these:

	'something'
	'something preferably held' 	[held token] 
	'things'  					[multi token]
	'things preferably held'		[multi-held token]
	'other things' 				[multi-except token]  [ anything except the second noun ]
	'things inside' 				[multi-inside token]
	'someone'   				[ synonymously anyone, somebody, anybody but NOT 'a person' ]
	'understood word'			[ used for TEST and SHOWME testing commands ]
	'number'
	'text' 					[ The Topic Understood ]

(Notice these all have single quotes around them, but no angle brackets.)  These are all of the tokens from chapter 16.4, "Standard Tokens of Grammar", of Writing With Inform.  It's here in the parser that we actually have to make them work.  

So to recap, this line:
	Understand "toss [other things] in/inside/into [something]" as inserting it into. 

Becomes the machine-readable:
	'<understood word>'		---- 	"toss"
	'<grammar token>'  	----	'other things'
	first slashed synonym	----	"in"
	middle slashed synonym	----	"inside"
	last slashed synonym ----	"into"
	'<grammar token>'	----	'something'
	end of line token	----	end of line token

And likewise for all the other Understand lines in the author's game.  In the code, "this grammar token" refers to one of the right-hand column values in the above example, and "this token's type" refers to the left-hand side.  When "the understood command's current size" changes, it changes which row those two refer to.

We're getting ready to repeat through many of these lines, looking to match the player's command. And for each of those lines, we are twice going to use another loop to step through the type and token elements in each line. Twice, because the first time is only preliminary needed for certain grammar tokens. 


Section: Repeating Through Understand-as Lines

Right after the trace line "Parsing for the verb" we begin initializing many variables, then begin a repeat loop with  "repeat through the understand-as lines for the verb", and initialize more variables which are used on each understand line we're going to try to match to the player's command.  A dictionary of all these new variables may be rather boring to read, but it really will help understand what's going on in the code.

Rather than list these in the order the code has them, we'll list them in order of relevance.

"The chosen grammar" is the current line we're working on.  A line begins where the previous line ended, hence this variable is set by referencing its old value.

"The player's understood command" is what the parser is really all about.  Just as the player's input buffer sees EXAMINE THE YELLOW TREE as a series of a few dozen letters, and the player's parsed command sees the same command as a series of four words, the player's understood command sees that command as a series of two components, one actionable verb followed by one game object.  Its understanding of the input is the highest-level of the three, and it is in some senses the final product of any parser.

"The understood command's current position" we use in conjunction with the above. When this is changed, then "this grammar token" and "this token's type" change in reaction.

"The likely second noun" takes some explanation since it participates in a long solution to a non-obvious technical problem that arises during parsing two lesser-used tokens.  Consider this line.

	Understand "put [other things] into [something]" as inserting it into. 

The token "[other things]" means anything except the "[something]" which will be the second noun. But the way our parser works is by stepping through a series of words from left to right, so when the parser first encounters "[other things]", it needs to know what the second noun is to process the first noun, but it always processes the first noun first.  So, we'll soon see a rather large section of code that does nothing but put everything on pause and parses the whole rest of the line 'hypothetically' just to fill-in "the likely second noun", just to process the first token.  The other token which causes this is "[things inside]".

"The number of parameters in the command" simply notes now many noun phrases a verb expects.  One for TAKE, two for INSERTING IT INTO, zero for JUMP, and so on. 

"The count of non-objects" is for commands like SET (THING) TO (NUMBER) in which not all parameters are game objects, but instead numbers or kinds-of-value.

"Process the multiple object list" remembers whether or not we need do what it says.  For commands like TAKE THE CANDLE AND THE APPLE this variable will become true.

"Allow multiple objects unconditionally" only gets involved to catch an edge case for TAKE ALL. We'll detail it later.

"The multiple-object list" is a list, of course, of multiple nouns in the same noun phrase, such as THE BOOK AND THE CANDLE in the command GIVE THE BOOK AND THE CANDLE TO ARIAL.

"The kind of multi" is a grammar token.  When an understand line uses "[things]" or "[things inside]" which allow a list of nouns, this variable is set to 'things' or 'things inside' or whatever, to remember which multiple-allowing token is in effect. 

"The indefinite article mode" remembers whether the player used THE or A/AN/SOME. 

"The pronoun used" holds which pronoun the player used in the command. It's a dictionary entry, like that used in the player's parsed command. 

"The pronoun reference object" is to what that pronoun refers to. 

"Where inferring the pattern from" remembers where the command trailed off, but the parser can still figure out the rest on its own.  Or to put that another way, it decides whether the Clarifying The Parser's Choice activity is needed or not.

"The best parser error so far" is of course one of the standard parser errors. The parser goes to some trouble to try to give the most specific (and hence, helpful) parser error it can. This variable aids in that.

"The second-best parser error so far," likewise.

"The latest parser error" is the real one.  Inform 7 authors should already recognize it.

"The numeric word" exists for commands like TAKE 50 COINS, a command of three words, the middle being the "numeric word".  Also worth noting is that kind-of-values like color are treated like numbers by the parser, similar to how the words one, two, and three are treated as numbers.  (Though in that case they actually are.) 

"How many parameters lookahead found" helps tell us when we can stop fast-forwarding and examine the current token. It's very temporary, appearing only three times in the whole code.


Section: The Annoying Look-ahead Loop

Upon finishing this slew of variables we find a while loop that stops on finding the end of line token.  It does of course iterate through the elements of the current understand line, but it isn't processing what you think it is. This is the look-ahead loop, and its sole purpose in life is to find a value for "the likely second noun", so two tokens, "[other things]" and "[things inside]", will work correctly. 

As explained above, those two tokens when used in the first noun's slot need to know what the second noun is in order to work, but since we haven't parsed the second noun yet, we use this loop to fast-forward and take a look.  

This whole loop does nothing unless and until it finds "[other things]" or "[things inside]" in the slot for the first noun.  

So back to the code.  We use "how many parameters lookahead found" to keep track if we're on noun number 1 or 2 (or more), and we also check to see if the current element's type is '<grammar token>', and if so, if its value is either the 'other things' or 'things inside' token we're interested in.  Assuming this circumstance comes to pass, we enter the rather large if-statement.

Incrementing "the understood command's current size" advances us off the 'other things' or 'things inside' token and onto the preposition for the line.  (For example, onto the "in" in "toss [other things] in/inside/into [something]".)   Now we advance our position in the player's command until it's at a preposition word, placed in "the word".  But how does the parser know which words or even if what the player typed in is a preposition or not?

Here's the scoop:  even for a command like "examine [something] dawg", the word "dawg" is considered to be a preposition by the Inform compiler.  If a required word isn't first, like EXAMINE is here, it's marked to be a preposition in the game's dictionary.  If a word refers to an object, like BRASS for a RING, it won't be marked as a  preposition.  Simplistic, but good enough for this purpose.

So the one-line "until" loop continues forward through the player's parsed command searching for a word that is marked as a preposition, because presumably, the second noun will appear sometime after that. Right?

Well, usually.  What about GIVE SNOW WHITE THE APPLE?  About 90% of the time this method works.  But since it's only used for two grammar tokens placed in a particular position, 90% of the instances of a rare situation is about 100% effective.

Anyway, the look-ahead aborts if, as in the case of Snow White, the prepositions are missing. 

Assuming there's prepositions, now we enter a "while this isn't done" loop.  (This kind of loop *always* allows entry. You'll follow its contents at least once no matter what.)  Now we want to see if "the word" typed in matches the preposition(s) in the understand line.  If not, it'll advance deeper down the player's parsed command, because maybe "dawg" was part of the noun and there's another "dawg" down the line.  If so, the "next" statement jumps us back up to the "while this isn't done" to try again. But if there really is no match, the understand line doesn't match the player's input at all, so abort the whole thing, and get a new understand line if any.  

Back to the happy path:  if one of the synonymous prepositions matched, (and we "do that again" in case the player typed a couple of prepositions in a row, like "up into" or whatever), then we've made it to where the second noun is at. 

(The way our one-liner "until" loop works, it always goes one word too far, so we back up a step.) 

Now, if the second noun is "[something]" we begin parsing the words here using two feature-rich pieces of code, "parsing descriptor words like..." and "noun domain", and if they are happy with the words here representing some game object in scope and all, we finally, finally set "the likely second noun" to that object.  And "break" out of our While loop.

It's worth noting we get different behavior for:

	Understand "choose [things inside] from [thing]" as removing it from.

than for

	Understand "choose [things inside] from [something]" as removing it from.

Specifically, if we want 'things inside' to function correctly, the second noun must be 'something', not 'thing' or 'someone' or anything more specific.  Such is our parser. 


Section: When I Said TAKE ALL I Didn't Mean Me

The TAKE ALL exception is yourself:  you never want to take yourself.  For the purposes of better error messages, the parser catches TAKE ALL trying to take one's self.  The variable works similar to a DEFCON warning status.  Initially zero, when each condition becomes true -- the taking action is desired, there's one parameter on the grammar line and it is 'things', the word ALL is used by the player -- the variable increases in value until it sounds the alarm... well, until an alarm is sounded, so the variable tells the error-reporting machinery not to complain about yourself being the only takable thing in the room, but not cooperating. 

Anyway, before we enter the next loop we go through our usual rash of variable initializations, the only interesting one being that we set the parser's current word position back to where it was before the lookahead loop futzed with it. 

Section: Choosing a Matching Understand-as Line

Now we come to the business of looping through a great many Understand-as lines.  Specifically, the understand-as lines which used the verb that the player used.  (This means it could be a number of different actions.  For example, TAKE could mean the taking action, or as TAKE OFF, the removing clothes action.)

The repeat loop says "forever" but that's a slight exaggeration.  If all goes according to plan and we find a grammar line which matches the string of verbs & objects, we'll certainly exit.  The logic of this loop is a bit convoluted, again due to being old code accreting features over time. Fortunately it's one of the shorter loops in the extension.

"The understood command's current position" acts as our cursor as we walk down the pieces of the understand-as line, but we'll copy what it's pointing to into "the token", as well as copy the next whatever into "the lookahead" and use those instead to mitigate the look-up time it takes to use the former.  Also, the token it points to is actually a combination of two variables I introduced us to earlier: the current grammar token & current token type.  Old code tends to try to squeeze as much data into as few pieces of computer memory as possible, and Inform has always followed suit. (How snippets combine two numbers into one are another fine example of this.)  Hence the line now where we "split" the token into those two variables.

The next line, which retrieves "the parsing of..", is a long and involved process.  Suffice to say, how each of the token types work -- '<understood word>', '<grammar token>', etc. -- is found in there.  It's also in charge of filling in the multiple object list when appropriate.  But the reason the following code looks so opaque is that "the parsing of..." really want to return an object which contain several pieces of data all at once, but the code was written for a version of Inform in which objects weren't yet a feature of the language. This is also the reason that the code here uses variables like "pu" for pattern union, and "pr" for parse result.  They are both wanna-be objects.  

And when "the parsing of.." finishes, it isn't necessarily finished. One of the things it can return is a command to run itself again, reparsing the inputs as one of the '<grammar tokens>', such as 'something' or 'someone'.   some other assumption.  The reason for that is because it uses the previously-mentioned "noun domain", which can call for a reparse of the noun phrase, and if so, "parsing of" needs to as well. 

Afterward, we do something different depending on whether the parse result "pr" indicates success, some kind of failure (there are several kinds), or some kind of parameter (indicated by "pr" not being a 'reparse' command).  And if "pr" is a kind of parameter, whether that parameter is a kind-of-value (like colors), a number or time or time period or other "the whatever understood", the multiple object list (indicated by "resulting objects" and "bunch of objects" placeholders), or an honest-to-goodness game object (like THE YELLOW TREE).  In each of those cases we may need to keep track of 1) how many parameters in the line we've used up and/or have yet to go, 2) how many of those parameters are game objects rather than kinds-of-value or numbers or units, and 3) indicate, via the "pu" variable (a pattern union, like what noun domain outputs) our overall status:  pattern matched successfully (to a non-object like time or color, but keep on reading the line), noun domain's no match (so stop reading the line and fetch a new one to try), a bunch of objects (like success, but remember that's it's a whole list of successful objects), or just echo the game object in question if that was what "parsing of..." found.   
 
Ah yes, and when appropriate we also update "the parser's returned noun", which will eventually become Inform 7's "the noun" and/or "the second noun" which we know so well.  We also update the "player's understood command", which is that view of the player's command EXAMINE THE YELLOW TREE as just two entities, one action and one object.

This little section ends at the otherwise.  Within that otherwise is what happens once we've reached the end of current understand-as line.  We do a few final checks.

First, have we used up all the words in the player's command?  If the next unused word is THEN or a comma everything's OK.  The command was something like EXAMINE THE TREE THEN CLIMB THE TREE, or, LOOK, WAIT, in which case we'll save it for the next time we parse -- checking if "we still have more to parse" is one of the very first things Inform does when it's time to parse.  Otherwise we have an "I only understood you as far as" error, so we'll stop here and report it. 

If we have used up all the words, then we do something special for those troublesome grammar tokens 'things inside' and 'other things'.  Remember how we had that whole annoying look-ahead loop in case they appeared as the first noun in the command?  Well here we handle the case when they appear as the second noun.  It's much simpler:  the filter phrase just removes from the multiple-object list anything that shouldn't be there.  We do need to ensure afterward, however, that we still have something in the multiple object list afterward.  So for PUT EVERYTHING INTO MY RUCKSACK, when the only thing around is said rucksack, we will have only the rucksack in the multiple object list, which is promptly removed by this filter, will promptly causes a resulting "nothing to do" parser error.  

Next up is the TAKE ALL exception.  Similar to the above rucksack case, we'd rather the parser throw a "nothing to do" error than start a take action guaranteed to fail because the only thing in the multiple object list is yourself. 

Assuming we've made it past that final gauntlet, we have finally, on the 300th line of the phrase, located which understand-as line matches the player's input.  The all-caps line itself is a phrase which copies the parser's results to the Inform 7 variables, calls the Clarifying The Parser's Choice activity if needed, swaps the noun and the second noun if they're "(with nouns reversed)" (see chapter 16.2 in Writing With Inform), and sets pronouns. 

The final bit before the STOP will move the rest of the command, from the word THEN through to the end, leftward, so EXAMINE THE TREE THEN CLIMB THE TREE becomes just CLIMB THE TREE.   A problem is only presented if there's no THEN or comma, but since we checked for that earlier, there shouldn't be any problems. 


Section: When Lines Don't Match

So what now when none of the lines match?  Or one line got very close but then throws an "I only understood you as far as" error?  

Let's take the last question first: we update the "best parser error so far" and possibly the "second best parser error so far" according to what the designer considers 'best', and get ready to try the next line.  But if the error so far is "nothing to do" because of the TAKE ALL exception, we immediately stop checking lines. Why?  It's because in that case the whole line matched just fine -- the action and the object(s) the player mentioned are all spot-on -- but we already know doing the action will be pointless.  And while Inform 7 authors can write "Instead of taking yourself", they cannot write "Instead of taking a list of things which includes only yourself", meaning they can't reword the response to something like, "You're the only thing around here worth taking, dear player."  Instead, we stop everything and send to "nothing to do" and let the author rewrite that.

Anyway, un-indenting one more time to bring us within arm's reach of that left margin is a landing point, GiveError, which is where we go when no understand-as line match... or anything else goes wrong in the phrase, really.  It calls another phrase, "give a parser error" which appears about two screens below that point in the source.  That phrase either 1) says the parser succeeded after all, as an Answering It That action, or 2) calls the printing a parser error activity.  There is a third case unused by Inform 7:  the variable "the latest parser error" can be used like a rule-that-varies (or a say-phrase, or text that includes a say-phrase), and if set such, the contents will be followed instead.  But the contents can't turn failure into success so it can't do anything that the activity couldn't -- less, in fact.  But, again, old code.

The "give a parser error" phrase returns and, assuming we aren't to do the Answering It That action, launches us to the beginning of this long, long phrase:  ReType will re-run the Reading A Command activity while AlmostReParse will start just after that, re-using the player's words for another attempt. (The latter is only used for NPC-specific grammars.) 

And thus, "to parse" ends with it scrambling to figure out how it ended up there.

But stay tuned: "parse" used a couple of heavy-duty phrases which need some explaining themselves.


Chapter: Noun Domain

As stated previously, the phrase known as "noun domain" straddles the line between simulated space and just-a-bunch-of-words.  It's in charge of matching words to one or more nouns given that the associated game objects are "in" the simulated space where we're looking.  (So even if Noun Domain knows what a doorknob is, it may pretend it doesn't if an action like KISS says to only recognize a person.)  But the most interesting parts of it are actually farmed out to sub-phrases like "search the scope", "adjudicate", and "rank".  It is notable for being the home of the Which Did You Mean activity, and the peculiar mode the parser is in while waiting for an answer.

Noun Domain uses "the match list", which is a list of game objects which match the current words the parser is pointing at.  The "search the scope" phrase populates this list as the first step in Noun Domain.  So right away we have zero or more items in the match list, and we've used up at least one word from the command so far.  The rules of Noun Domain state that if exactly one object was matched (and we haven't tried to use more words than there actually are), then Noun Domain is already done:  it returns that object.  If there isn't a singular match and we haven't used up all the words left, then we better have hit the end of the command; the next grammar token should be '<end of line>' and not '<understood word>' or '<grammar token>' or what-have-you.  Otherwise we have a problem:  no object matches all the words leftover in the command even though one or more objects matches some of the words -- but Inform's stance is always "understand it all or complain" so a no-match result is returned.  

Anyway, if we either 1) have multiple matches and no more words to disambiguate, or 2) we have one match but there's a connector word (AND, THEN, etc.) after it, we're going to have to think a bit.  

Truth to tell, if there's exactly one match it'll still get returned in short order as "the likely choice", but we do take a detour down here to inform the Clarifying the Parser's Choice activity of this one object should later matters need to know.  But never mind that:  most of the code from here on down deals with disambiguation.

If there's at least two matched objects, we have to decide between them if we can.  First we find out if they indistinguishable, such as a multitude of otherwise identical coins.  (We don't *use* that information here other than to turn off the Clarifying activity.)   We call the "adjudicate" phrase to decide on one of the match list's items.  (Adjudicate uses lots of pieces of information to make decisions: this "assume all objects indistinguishable" variable, the grammar token ('someone'? 'things inside'?), the Decide Whether All Includes activity, whether A/AN/SOME or THE was used, the location of each item, whether a pronoun stands for any of these items, descriptor words like THAT, HIS, and the special-cased adjectives LIT and UNLIT, and even what was handled very recently.)  If it can't make a good decision, it may return null (no idea), "noun domain's bunch of objects" (if the verb OKs multiple objects) "a bunch of objects" (if the verb doesn't), or a single object (if it successfully figured it all out from all that information it has).  

If we have a singular object at this point -- either because Adjudicate found it or Noun Domain itself found it up by those connector words -- we'll return it either before or after informing the Clarifying activity of the object we're deciding on, as appropriate.  

Otherwise we're going to ask the player one of two questions. One question is of the form "what do you want to <verb>" and the other is "which did you mean...".   The first is triggered by EXAMINE THE, but only when it isn't followed by connector words (or absolutely anything else), so it's something of a special case.  That question is handled by the "incomplete noun under the context" phrase located elsewhere in the source.  But the usual case is the hallowed Which Did You Mean activity, which uses some of the information that Adjudicate figured out to pare down the items to list.  (For example, Adjudicate groups multiple indisinguishables together so the activity need only say "a coin" once.)  

It's unfortunate that Adjudicate groups things together in such an ad-hoc way, as it makes the default behavior of this activity a bit more complicated than need be, but a special-cased "repeat through the first item of each group" phrase, and a special-case "say the group as a/an/some" phrase, hide this bit.  (To write your own activity rule, you'll likely need to use these phrases and hew pretty closely to the code shown here.)  The activity only asks "who" when every single item is a person, otherwise "which" is it.  It also handles commas and connector manually rather than using a list writer, because, again, it isn't using a proper list, but an ad-hoc list of groups, which Inform has no support for elsewhere in the language.  

Now we get ready to parse the player's answer to this question.  We're going to put the answer into the "second parsed command" so we don't overwrite the original command.  And that's important, because we're about to re-use the original command.  First things first:  clear out that second buffer with spaces so it doesn't confuse the later code.

It's a little-known fact that we can answer this question with words like "all of them" or "both of them" and the parser will respond appropriately.  (It only looks at the first word anyway.)  And if the appropriate response is "you can only have one" then it will stay in this loop, asking again and again for the player to either enter a word that, when put together with the words from the original command, might solve the issue.  If the verb actually allows multiple objects (as evidenced by the grammar token being 'things' or similar), then we move all the objects from the match list to the multiple-object list, and we're done. 

Typically, the player will type in RED or HIS or some other word.  Or he might type in a new command.  Well, if the command contains a comma, it's likely a BOB, DO THIS sort of thing, so destroy the original command with whatever's freshly typed.  Or if the first word is a known verb, destroy the original command with the fresh typing.  Otherwise we insert into the original the new word or words. 

Regardless which way that went, we re-parse, reset the important variables, call the After Reading a Command rules so it can do any magic it normally does, and start all over.  It's interesting that that rulebook is called alone, as it's supposed to be indivisible from the rest of the Reading a Command activity, and it's possible it'll introduce bugs into an author's work who uses the Before Reading a Command rules to reset variables that the After rules mess with.  But so far, any problems from this semi-parsing in the shadow of Which Did You Mean have centered around entering or exiting this quasi-mode. 



Chapter: The Parsing of Tokens

Section: Will the Real ParseToken Please Stand Up?

So the parse phrase called another phrase called "the parsing of..." which I had promised did a lot of work.  So we go there now to examine this auspicious phrase which holds more secrets of the Inform parsing machinery, and we find this:

	To decide what parser result is the parsing of (y - a grammar token) as (x - token type) if any:
		if the parser's current word position > the word count, decide on parse fails;
		decide on the parsing of y as x at 0 under 'something'.

How anti-climatic.  If we ran out of words, the parse fails. Otherwise... do the same thing?  Well, there's another "parsing of..." phrase which it's using, which takes a couple more bits of input than just the grammar token and its type.  So we'll go there now -- it's just three lines below onscreen -- and find a phrase that begins with a lot of "save" phrases, calls yet another "parsing of..." phrase, and call a lot of "restore" phrases in the precisely reversed order as the saves. 

Programmer wisdom says not to use global variables. A value-that-varies should always belong to a function ("let x be...") or to objects ("A thing has a text called x.") or whatever.  When this advice isn't followed, phrases like the one we're seeing now eventually appear.  Let us skip this blight and find "the actual parsing of..."

Section: I Came Here Looking For A...

Earlier in this documentation I gave examples of the valid token types.

	'<grammar token>' - like "[things inside]"
	'<understood word>' - like "choose" or "from"
	'<description of values>' - like "[available color]"
	'any <description of objects>' - like "[any room]"
	the first slashed synonym - 'in' in "in/inside/into"

In "the actual parsing of..." we look at which one the understand-as line gave us, and act appropriately. Some of these are easy:  interpret the next word(s) as a number / color / dictionary word / topic understood / general parsing rule, set a variable or run the rule, and return success.  

The ones that don't usually refer to one or more objects, with one or more restrictions.  And not all of these are even relevant to Inform 7 anymore.  For example, '<adjective>' would have allowed us to write

	Understand "lean on [fixed in place]" as waiting.

instead of

	Understand "lean on [something fixed in place]" as waiting.

But it wouldn't work any differently, and the latter is far more flexible, so Inform 7 doesn't explicitly support '<adjective>'.  The old code just sits here, a fossil from another age.  

Others are added for Inform 7's benefit. It's easier to say 

	Understand "go to [any room]" as going by name.

..than it is to create a scope decider rule and set the scope decider variable to it.  "Scope decider" being an old feature which can do this and much more, its use isn't obvious to most of us.  At least, not as obvious as the word "any" placed in front of a kind.

Some are allegedly exposed to Inform 7 but with little explanation, such as with '<understand token>' and chapter 25 page 22 of Writing With Inform, "Inform 6 Understand tokens".  With no example, nor even the type existing that the rule is supposed to produce, you'd need an understanding of the parser equal to this extension to even begin to explore the feature. 

But for those grammar tokens and grammar token types which don't immediately find their answer and return, we find ourselves on the last line of this phrase, which looks a lot like this phrase's name, and the names of the two phrases before us.  Unlike numbers or colors or rules-which-handle-it-all, most of the stuff that comes down here will be actual game objects.  And Inform supports more features with objects than it does other things, such as multiple object lists.

I didn't need to break off the phrase here and call the immediately following, but could have joined them into a single phrase. Indeed, that is what the original code does.  But I wanted to emphasize that the only bit of data the two share is just the current grammar token -- 'someone', 'things inside', etc. -- and nothing else.

Section: The Myriad Ways of Specifying Many Objects

The very first line of "the parsed token as a.." tells us whether we're expecting (and hence, allowing) a list of objects or not.  That's not to say we can ignore any possibility of a list when the action doesn't allow it.  A player may give a list where one isn't allowed, and we would need to explicitly respond.  But anyway, this is where we parse list-related words like AND, BUT, EXCEPT, ALL, EVERY, and the like. 

Let's initialize some variables. 

"The singular object" will be this phrase's result if there isn't a list.  

"May make inferences" refers to the Clarifying the Parser's Choice activity. 

"Accept multiple objects" remembers whether or not the verb allows a list of objects like THE BOOK, THE CANDLE, AND THE QUILL.  Some verbs cannot be used with a multitude.

"Have many objects in the command" remembers whether or not the player is giving us a list of objects.  This is assumed to be no until we find a connective word like AND or BUT, or a comma, or an encompassing word like EVERYTHING.  Obviously there's a potential for conflict between this and the "accept multiple objects" command.

It's worth noting that just because there isn't an AND, BUT, or comma, there still may be a list. Consider THREE COINS, in which case there's three objects, but a single call to Noun Domain will package them up as the returned value "noun domain's bunch of objects."  So in the case of THE BOOK, THREE COINS, AND A KEY, there's going to be some merging of lists:  the list Noun Domain made for the coins, and the list we're making here in Parse Token for the book, candle, etc. 

"The number of items wanted" is usually "all items are wanted" except in the case of (any) THREE COINS, in which three are wanted even if more are available.

"Assume AND means add objects" handles the difference between taking THE BOOK AND THE CANDLE versus EVERYTHING EXCEPT THE BOOK AND THE CANDLE.  In the latter case, AND means removing things from the list of objects to which the verb will apply.

Now we start the list by entering the While loop.  The body of this loop will read words and match it to a game object.  If, at the place where the words for that object end, there is an AND, a comma, or the like, the loop assumes it's a list of objects and acts appropriately.  But what about the very first object?  There isn't a comma or AND in front of it.  Well, we neatly solve that by initializing "the word" to a comma, allowing us to enter the loop for the first object. 

So we're inside the loop.  First thing we're going to do is replace any pronoun with what it stands for.  Since the "what (a word) stands for" phrase won't change anything if the word isn't a pronoun, we're going to use it unconditionally:  set the pronoun variables to nothing, use it, then see if the pronoun variables have been changed.  If so, the player really did use a pronoun after all, so act appropriately.  There is a case that the word IS a pronoun, but the parser doesn't know what that pronoun stands for, which will bring everything to a screeching halt.  There's also the case caused by the pronoun ME not being considered a true pronoun by Inform.  (If you've ever used the PRONOUNS out-of-world command in someone's game, notice that "me" and "you" are absent.  Inform knows the words, but not as pronouns.)  However, ME is always the player, so it isn't a big deal. 

Now we get ready to parse determiner words.  Determiners include articles (a/an/the), possessives (my/his/her/its/their), demonstratives (this/that/these/those), quantifiers (all/other), and numbers in the sense of TAKE 3 APPLES (but not in the sense of The Three Stooges).  The phrase will also eat the word "of" if at least one determiner was found already, so the phrase as a whole matches ALL OF THE and FIVE OF THE and similar constructions.  The phrase sets global variables according to what it found, including storing the number the player used if such appeared.   

Numbers aren't always a determiner, such as a restaurant named Fifty Coins, but we'll assume they are here, and that's usually right, and the parser can backtrack if we were wrong because we also record where the determiners started.  The only problem the determiners phrase can have is running out of words to parse.

Once those are out of the way, we use noun domain to match the player's words to a game object. Assuming Noun Domain doesn't demand a reparse, we look at the grammar token we're expected to match.  For 'something preferably held', we know a list isn't allowed, so set the singular object to what noun domain returned.  (There's some error-checking just beforehand, to backtrack regarding those determiners if needed, or to try, TryAgain if we already retried the determiners.)

Otherwise, the grammar token isn't 'something preferably held', so we have a lot of different situations to consider. First up:  if neither Noun Domain nor Parse Token have found anything, not even determiners, then we're going to assume some sort of list.  Second, if our verb allows a list of objects and we haven't looked at the official multiple-object list, we make a mental note that we should process that in the near future.  (Incidentally, we also fix the just-in-case parser error, because a "can't use multiple objects" error would be obviously inappropriate when our verb certainly allows such.) 

Third is an actual test case rather than set-up.  If Noun Domain doesn't recognize the player's words, we backtrack, depending upon whether we've already used the "maybe THREE was part of the name and not a descriptor" excuse. Fourth, (after a debugging TRACE statement,) if Noun Domain found several objects (such as THREE COINS, which yielded three indistinguishable objects), we officially set the "have many objects in the command" variable I mentioned a few paragraphs ago, and if it's not the first time Noun Domain has said this, we merge this list of coins (or whatever) with the list of fourteen Dragon Balls (or whatever) that was also in the player's command SIX KNIVES, 14 DRAGON BALLS, THREE COINS, AND ONE FOR THE ROAD.  

Otherwise, we have the usual case of Noun Domain finding a single object.  But there's edge cases even here:  if Noun Domain assumed an object without using any words, well, that's a failed parse, but we'll try our usual excuse of re-interpreting descriptors as actual names anyway.  Otherwise we've actually, finally, successfully parsed something simple, like THE BOOK, whether or not it's embedded in a larger list of things.  We ensure the expected grammar token is satisfied -- really, the only one that's picky at this point is 'someone', since most other tokens are appeased in the at-where-or-in-what-are-we-looking-for-stuff  phase -- and then put our book (whatever) into where-ever it is the returned object should go:  if the whole noun phrase is a single object, it goes in the "singular object" variable, otherwise the multiple-object list is the destination.  (And even then, not necessarily adding it, depending on the current definition of AND meaning to include or to exclude.)

Here, the long if-statement for whether the token is 'something preferably held' (or not) finally ends.  

Now we update the parser's current word position to be at whatever word is behind THE CANDLE (or whatever), and we look at this word to see if it's a connective like AND, BUT, a comma, and so on.  If so, does the verb even accept multiple objects?   If not, well, the whole command might still be something like TAKE THE CANDLE AND LIGHT IT, so thank goodness for the "process the multiple object list" variable and the "break" statement.  (Otherwise, TryAgain.)  If the verb OKs multitudes, then words like BUT and EXCEPT change the meaning of later ANDs and commas between inclusive and exclusive behavior, as previously mentioned.  Next up, if this is the first time we've found a connective, we'll set "have many objects in the command" and setup the multiple object list with the first object (currently in "the singular object", but quickly remedied).  Finally, as a later note to the Clarifying the Parser's Choice of Something, we're going to refrain from inferring an object from scant data, since we might have several objects next to one another and finding where one's name ends and the next begins is hard enough without trying to be all fancy about it and inferring things like a fortuneteller.

Here, the even-longer 'while' loop that continues to spin as long as connectives are found, ends.  Since that last word was *not* an AND, BUT, or comma, we back up the parser's current word position to point to this mysterious next word once more, and we'll leave it there for the rest of Parse Token.  So now that we've finished the compound noun phrase, we get to the business of returning what we've found to the calling phrase.  The "resulting objects" is just a message to the caller to look in the multiple-object list for our results. "The singular object" is the variable that holds the actual BOOK (or whatever) we found for the simple case of no lists at all were involved.  We do do a final check in case multitudes were wanted but we didn't find any.   "What the token fails as" is a phrase which appears a few lines below, which if it decided it mis-parsed a singular as a plural (which in turn meant it assumed multitudes were meant even if they weren't -- perhaps the player wanted  only one Three Stooge) it'll TryAgain, otherwise, to quote Yoda:  failed it has.



Version 1/110416 of Automated Verb Phrases by Ron Newcomb begins here.

"Adds to Custom Library Messages the continuous and perfect aspects, inquisitive mood, passive voice, negative mode, and various modal auxiliary verbs."

Include Custom Library Messages by Ron Newcomb.

Chapter - For CLM regardless Plurality

To say n't?: if negation pending is true, say n't. 

To say n't:
	if question pending is true and the story viewpoint is first person and the prior named noun is nothing:
		if story tense is continuous present tense, stop; [to avoid "Am not I carrying..."]
		if story tense is present tense and passive voice is true, stop; [to avoid "Amn't I carried by..."]
	now negation pending is false;
	if the story viewpoint is first person and the prior named noun is nothing and the story tense is in any present tense and question pending is false and could-would-should is "", say " not"; 
	otherwise say "n't".


Section - The Story Viewpoint and The Story Tense

Some [more] conjugations are present-perfect tense, past-perfect tense, continuous present tense, continuous past tense, continuous present-perfect tense, continuous past-perfect tense.  

A could-would-should is some text that varies. A could-would-should is usually "". 

The passive voice   is a truth state that varies. [The passive voice    is usually false.] The passive voice      variable translates into I6 as "CLM_passive_voice".
A negation pending is a truth state that varies. [A negation pending is usually false.] The negation pending variable translates into I6 as "CLM_negation_pending".
A question pending is a truth state that varies. [A question pending is usually false.] The question pending variable translates into I6 as "CLM_question_pending".

[ The idea we're using in here is:  bitfield == table row# ]
To decide if (x - a conjugation) is in any perfect tense: (- ((({x} - 1) & 2) ~= 0) -).
To decide if (x - a conjugation) is not in any perfect tense: (- ((({x} - 1) & 2) == 0) -).
To decide if (x - a conjugation) is in any continuous tense: (- ((({x} - 1) & 4) ~= 0) -).
To decide if (x - a conjugation) is not in any continuous tense: (- ((({x} - 1) & 4) == 0) -).


Section - Grammatical Case, Tense Breakdown, and Typecasting - unindexed

[ BE SURE TO MASK WITH SEVEN (00000111) FIRST: 
bit 0 = present(0)/past(1);  
bit 1 = simple(0)/perfect(1);  
bit 2 = instant(0)/continuous(1)  a.k.a progressive ]
To decide which conjugation is the past tense bitval: (- 1 -).
To decide which conjugation is the perfect tense bitval: (- 2 -).
To decide which conjugation is the continuous tense bitval: (- 4 -).


Section - The verb inflections - unindexed (in place of Section - The verb inflections - unindexed in Custom Library Messages by Ron Newcomb)

First aux moved is a truth state that varies. First aux moved is usually false [for statements].

Include (- 
Global CLM_passive_voice = false;
Global CLM_negation_pending = false;
Global CLM_question_pending = false; -) after "Definitions.i6t".

To decide what number is the number of verb inflections: (-  5  -).
To decide which [verb inflection] number is the infinitive form: 					(- 0 -). [ The verb to sport ]
To decide which [verb inflection] number is the -s present singular form: 			(- 1 -). [ (he sports, 	] 	[ (he weaves, 	]
To decide which [verb inflection] number is the base present plural form: 			(- 2 -). [ they sport, 	] 	[ they weave,	]
To decide which [verb inflection] number is the -ed past form:					(- 3 -). [ he sported, 	] 	[ he wove,   	]
To decide which [verb inflection] number is the -en past participle form:				(- 4 -). [ it is sported, 	] 	[ it is woven, 	]
To decide which [verb inflection] number is the -ing present participle form:			(- 5 -). [ he is sporting) implies the wearing relation. ]		[ he is weaving) ... ]
[To decide which [verb inflection] number is the exceptional present plural form:		(- (-1) -). [ only used for one word in the whole damned English language: "am", plus its contraction. ]]

To decide which number is the appropriate inflection [for a main verb]:
	if passive voice is true, decide on the -en past participle form;
	if the story tense is in any continuous tense, decide on the -ing present participle form; 
	if the story tense is in any perfect tense, decide on the -en past participle form; 
	[ Now only two of the eight tenses are left:  simple past & simple present]
	if suffix eaten by auxiliary is true, decide on the infinitive form;
	if the story tense is the past tense, decide on the -ed past form;   
	if the prior named noun acts plural, decide on the base present plural form;
	decide on the -s present singular form. 

To decide which number is the appropriate auxiliary inflection [for a helping verb]:
	if suffix eaten by auxiliary is true, decide on the infinitive form;   [ be/have (do never appears with could/would/should) ]  
	if the story tense is in any past tense, decide on the -ed past form; [ was-were/had/did]
	if the prior named noun acts plural, decide on the base present plural form;  [are/have/do] 
	decide on the -s present singular form.  [is/has/does]
	
	
Section - Modal Auxiliaries - unindexed

[ choose row (the row# corresponding to the KOV) & 11111100) + (past/present tense << 1) + (negation pending) from the table of modal auxiliaries ]
To change to the row with the appropriate modal auxiliary form:
(-	ct_1 = ((ct_1 - 1) & $$111111111111100) | (+ negation pending +);
	if ((+ story tense +) ~= (+ present tense +) or (+ continuous present tense +) )  ct_1 = ct_1 | 2;  
	++ct_1;
-).

To decide what text is the appropriate modal auxiliary form for (modal auxiliary - text):
	choose the row with modal-auxiliary-column of the modal auxiliary from the table of modal auxiliaries;
	change to the row with the appropriate modal auxiliary form;
	if there is no modal-auxiliary-column entry, decide on "";
[	now suffix eaten by auxiliary is true; [fsdfsdsdf]]
	now negation pending is false;
	decide on the modal-auxiliary-column entry.

Table of modal auxiliaries
modal-auxiliary-column (text)
"can"
"can't"
"could"
"couldn't"
"will"
"won't"
"would"
"wouldn't"

Chapter - Irregular Verbs (in place of Chapter - Irregular Verbs in Custom Library Messages by Ron Newcomb)

Some irregular verbs are -s, -es, -ies, e-s, contraction-for-is, are*, aren't*, have*, do*, go*, eat*, feel*, find*, get*, give*, hear*, put*, see*, take*, wear*, think*, keep*.

Table of Irregular Verbs
irregular-verb-form (text)
"s"   [ the -s suffix ]  	[ he sportS  ]
""				[ they sport  ]
"ed"				[ he sportED ]
"ed"				[ we have sportED ]  [ -en ]
"ing"				[ he is sportING ]	
"es"  [ the -es suffix ]	[ he searchES ]
""				[ they search ]
"ed"				[ he searchED ]
"ed"				[ we have searchED]
"ing"				[ he is searchING ]
"ies"  [ the -ies suffix ]  	[ he spIES ]
"y"					[ they spY ]
"ied"					[ he spIED ]
"ied"					[ we have spIED ]
"ying"				[ he is spYING ]
"es"  [ the e-s suffix ]	[ he likES ]
"e"				[ they likE ]
"ed"				[ he likED ]
"ed"				[ we have likED ]
"ing"				[ he is likING ]					[ verbs start here / suffixes end here ] 
"'s"	  	[ contraction for am/is/are -- only three rows used ]
"[']re"
"[']m"
"be"		[ -- Two extra lines are allowed for are* due to it having *eight* inflected forms instead of the usual five. ]
"am"		
"is"  		[ are*]   
"are"  		
"[if the story viewpoint is first person and the prior named noun is nothing]was[else if the prior named noun acts plural]were[else]was" 
"been"
"being"
"isn't"  	[ aren't*]   
"aren't"  		
"[if the story viewpoint is first person and the prior named noun is nothing]wasn't[else if the prior named noun acts plural]weren't[else]wasn't" 
"been"
"being"
"has" 	[have*]
"have"
"had"
"had"
"having"
"does"	[do*]
"do"
"did"
"done"
"doing"
"goes"	[go*]
"go"
"went"
"gone"
"going"
"eats"	[eat*]
"eat"
"ate"
"eaten"
"eating"
"feels"	[feel*]
"feel"
"felt"
"felt"
"feeling"
"finds"	[find*]
"find"
"found"
"found"
"finding"
"gets"	[get*]
"get"
"got"
"gotten"
"getting"
"gives"	[give*]
"give"
"gave"
"given"
"giving"
"hears"	[hear*]
"hear"
"heard"
"heard"
"hearing"
"puts"	[put*]
"put"
"put"
"put"
"putting"
"sees"	[see*]
"see"
"saw"
"seen"
"seeing"
"takes"	[take*]
"take"
"took"
"taken"
"taking"
"wears"	[wear*]
"wear"
"wore"
"worn"
"wearing"
"thinks"	[think*]
"think"
"thought"
"thought"
"thinking"
"keeps"	[keep*]
"keep"
"kept"
"kept"
"keeping"




Section - Auxiliary Words and Phrases (in place of Section - Verb Phrase Generation unindexed in Custom Library Messages by Ron Newcomb)

To say (main verb - an irregular verb):
	if the main verb is aren't*: [untested]
		now negation pending is true; [untested]
		now the main verb is are*;
	if the main verb is greater than end aux, say "[if the main verb is at least are*][aux for the main verb][end if][the main verb in its appropriate inflection][n't?]";
	now negation pending is false;
	now suffix eaten by auxiliary is [reset to] false;
	now passive voice is [reset to] false;
	now could-would-should is ""; 
	if restore-library-conjugation is not the zero conjugation:
		now the story tense is the story tense - restore-library-conjugation;
		now restore-library-conjugation is the zero conjugation.

To say =>perfect:  
	if the story tense is not in any perfect tense:
		now the story tense is the story tense + the perfect tense bitval;
		now restore-library-conjugation is restore-library-conjugation + the perfect tense bitval.

To say =>continuous:  
	if the story tense is not in any continuous tense:
		now the story tense is the story tense + the continuous tense bitval;
		now restore-library-conjugation is restore-library-conjugation + the continuous tense bitval.



To say =>not: (- CLM_negation_pending = true; -). 
To say =>don't: (- CLM_negation_pending = true; -). 
To say =>doesn't: (- CLM_negation_pending = true; -). 
To say =>negation: (- CLM_negation_pending = true; -). 
To say =>would/=>will: (- (+ could-would-should +) = (+ "would" +); -).
To say =>could/=>can: (- (+ could-would-should +) = (+ "could" +); -).
To say =>passive: (- CLM_passive_voice = true; -).
To say =>question: (- CLM_question_pending = true; -).


[ possibly capitalised]
[To decide what text is can/could: (- (+ the appropriate modal auxiliary form for "could" +) -).
To decide what text is can't/couldn't: now negation pending is true; decide on the appropriate modal auxiliary form for "could".
To decide what text is will/would: (- (+ the appropriate modal auxiliary form for "would" +) -).
To decide what text is won't/wouldn't: now negation pending is true; decide on the appropriate modal auxiliary form for "would".]


To say Qaux/Aux/¿¿ (x - an object): mark x in output; say "[uc][qaux for end aux]".
To say Aux: say "[uc][qaux]".

[ Passed in: question pending, negation pending, passive voice ]
To say qaux: say qaux for end aux. [This one, capitalized, is used to begin a question, and is not much used otherwise]

To say qaux for (main verb - an irregular verb):  [This one, capitalized, is used to begin a question, and is not much used otherwise]
	now suffix eaten by auxiliary is [reset to] false;
	now first aux moved is question pending;
	if question pending is false, stop;
	if the main verb is aren't*: [untested]
		now negation pending is true; [untested]
		now the main verb is are*;
	if could-would-should is not "":
		say possibly capitalised appropriate modal auxiliary form for could-would-should;
		now suffix eaten by auxiliary is true; 
		now negation pending is false;
	otherwise if the story tense is in any perfect tense:
		say possibly capitalised have+;  
	otherwise if the story tense is in any continuous tense:
		say possibly capitalised are+;
	otherwise if passive voice is true:
		say possibly capitalised are+; 
	otherwise if the main verb is are*:  
		say possibly capitalised are+;	[ are* isn't accepted here, but only simple present & past are left to deal with, so it still works. I think. ]  
	otherwise:						[ Never use "do" with "is".  Produce "Is he it?" or "Is he not it?" instead.]
		say possibly capitalised do+;
		now suffix eaten by auxiliary is true;
		now first aux moved is false;  [ A new aux word, do, was created, rather than moving a pre-existing aux word to the front of the question. ]
	say "[n't?] ".

To say aux: say aux for end aux.   [ For a regular verb, a suffix, or just an unknown kind of verb. ]

To say aux for (main verb - an irregular verb):  [unindexed; authors need only use [aux] ]
	if could-would-should is not "":
		if first aux moved is false, say "[the appropriate modal auxiliary form for could-would-should][n't?] ";
		now suffix eaten by auxiliary is true;  
		now first aux moved is [definitely reset to] false; [in case the following branch is taken as well]
	if the story tense is in any perfect tense:
		if first aux moved is false, say "[have+][n't?] ";  [ have+  haven't+ ]
		now first aux moved is [definitely reset to] false;
		if the story tense is in any continuous tense, say "been ";
	otherwise if the story tense is in any continuous tense:
		if first aux moved is false, say "[are+][n't?] ";
		if first aux moved is true and the story viewpoint is first person and the prior named noun is nothing and story tense is continuous present tense and negation pending is true:
			say "not "; [to avoid "Am I --- carrying..."]
			now negation pending is false;
		now first aux moved is [definitely reset to] false;
	otherwise if negation pending is true and passive voice is false and the main verb is not are*:
		say "[do+][n't] ";
		now suffix eaten by auxiliary is true;  
	if passive voice is true and first aux moved is false:
		if the story tense is in any continuous tense:
			say "being ";
		otherwise if the story tense is in any perfect tense:
			say "been ";
		otherwise:
			say "[are+][n't?] ";
	if negation pending is [by some miracle still] true [and the main verb is are*] and question pending is true:
		say "not ";   [ are* as simple question:  "Am I not it?" ]
		now negation pending is false; 
	now could-would-should is [reset to] "";
	now first aux moved is [reset to] false.


[To decide which irregular verb is end aux:  		(- 0 -).   				[ This is for any case where a [-s], [e-s], [-es], or [-ies] isn't used. ]]
To say ??:  (- if ((+ question pending +)) print "?"; else print "."; (+ question pending +) = false; -).  [line break problems?]


Automated Verb Phrases ends here.

---- DOCUMENTATION ----

Section : Changing Tense and Viewpoint

This extension can change the tense and/or viewpoint of all of Inform's pre-packaged responses at once.  It also allows replacing Inform's library messages in the same way as Default Messages by Ron Newcomb.  We select the viewpoint and tense with the following lines.  If we don't specify, first person past will be used.

	*: The story tense is past tense.
	The story viewpoint is third person feminine.
	
The possible values for the story viewpoint are:
	first person
	second person
	third person masculine
	third person feminine
	third person
	first person plural
	third person plural

For the story tense, the usual values are these.
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

For example:
	Report wearing something: say "[We] donned [the noun]." instead.

Could print as any of these.
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

For irregular verbs, we must explicitly tell Inform about them.  This extension already defines several:  are*, aren't*, have*, do*, go*, eat*, feel*, find*, get*, give*, hear*, put*, see*, take*, wear*, think*, and keep*.  For example:
	Report eating: say "[We] [eat*] [the noun]." instead.

That prints either "eat" or "ate", as appropriate.  The others are used similarly.  

We can add to this list as well, of course.  In the following sample, we add "weave" and "say".  We use the infinitive with an asterisk appended for the verb we'll use in our adaptable writing, and we list the other five forms in plain ol' text.  (Well, we cheated with are* because it's so much more readable than be*, but be* is still recognized.)

	*: Some irregular verbs are weave*, say*.
	
	Table of Irregular Verbs (continued)
	irregular-verb-form
	"weaves"
	"weave"
	"wove"
	"woven"
	"weaving"
	"says"
	"say"
	"said"
	"said"
	"saying"

The order is very important here.  Not only do the order of the asterisked verbs need come in the same order as their corresponding sets in the list, but the five forms in each set come in the same order as that of a relation from chapter 13.9 of the manual:  "The verb to weave (he weaves, they weave, he wove, it is woven, he is weaving) implies the..."  Not counting the initial infinitive form "to weave", the parenthesis enclose those five forms in the order:  present singular, present plural, past, past participle, and present participle.  Some words, like "said", fulfill multiple roles.  

Occasionally we'll need to use one of "[are*]", "[have*]", or "[do*]" as a helping verb, not as the main verb. For this, these: 
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

This will now produce the appropriate:
	Time marches on.
	Time marched on. 

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
		library line break.


The initial "choose the library message corresponding to (action name) # (number) from (table)" phrase does most of the work.  Like other 'choose' phrases dealing with tables, it selects a row which later "..entry" phrases reference.  The "chosen row" is a number -- the row it chose.  Notably, it is zero if there is no corresponding message for that action and number combination in that table, allowing the rule to pass the situation to the next rule in the 'for' rulebook.  Otherwise, after the say statement shows the message to the reader, "library line break if applicable" might tack on a "[line break]" unless the message itself used "[ignore library line break]". 

For library messages which have a blank in their action column, we can use "the miscellaneous non-action" as the action.  Unrelatedly, the action our player is currently attempting is named "the action in progress". 

If no rule in the activity's 'for' phase makes a decision, a runtime error will result with the action & number of the missing message.  In a release build, the reader is greeted only with silence.



Section : Miscellaneous Substitutions

Several say-phrases that this extension uses internally are useful for the author who needs multiple tenses or viewpoints in their story.  For the pronoun appropriate to the story viewpoint, we use one of the following phrases.

Many of the following are similar to the extension Plurality.

	"['s-'re]" - contraction for is-are-am
	"[is-are of (an object)]"
	"[n't]" - contraction for not
	"[that-those-us of (an object)]" 
	"[That-those of (an object)]" 
	"[That's-They're of (an object)]" 
	"[it-them of (an object)]" 
	"[it-they of (an object)]" 
	"[It-They of (an object)]" 

Any phrase beginning with the => arrow will print nothing, but will affect the next "[is-are]" or suffix.

	"[=>don't]" or "[=>not]" 
	"[=>would]"  
	"[=>could]" 
	"[=>perfect]"
	"[=>continuous]"

Finally, these touch-up a few miscellaneous messages.

	"[moment]" for the final word in "at the moment/time"
	"[here-there]" for the final word in "is here" vs "was there"
	"[can]" for can/could 
	"[can't]" for can't/couldn't

None of the say phrases in this section are necessary for the author to learn, but they occasionally come in handy.  New ones can be created by quizzing the story viewpoint and story tense, or by asking if something "acts plural" to determine is/are distinctions.  "The prior named noun" is the last object to have its name printed.

	*: To say 's-'ve:    
		if the story tense is in any past tense:
			say "[']d";
		otherwise if the prior named noun acts plural:
			say "[']ve";
		otherwise:
			say "[']s".



Section : Verb Phrase Generation

The story tense can be temporarily set to one of these additional values. 

	present-perfect tense
	past-perfect tense
	continuous present tense
	continuous past tense
	continuous present-perfect tense
	continuous past-perfect tense

To use these, prepend "[aux]" to the verb. It will print any helping (auxiliary) verbs needed.
	say "[We] [aux]mov[e-s] far away."

That can produce:
	He moved far away.
	They had moved far away.
	I am moving far away.
	She could not move far away.

And so on.  Irregular verbs do not need the "[aux]" phrase as they take care of it themselves.
	say "[We] [eat*] often."

By setting up phrases in this way, we can describe a variety of situations that the work's interactivity might produce.  The prose adapts not just on replaceable nouns, but verbs and tense -- time -- as well as others.  

Words like "can" and "would" are called modal auxiliary verbs.  Rather than trying to support all of them, a text variable called "could-would-should" inserts one.  Normally empty, it understands can, could, can't, couldn't, will, would, won't, and wouldn't.  Set the variable to any of those words and the extension will select the correct form between past and present tense, and affirmative and negative mode.  (For future tense, use "will" in present.  Future may be a tense semantically, but syntactically it's a mode.)
	now could-would-should is "";
	now could-would-should is "could";
	now could-would-should is "won't";

Three truth states control the final modes.  They default to false.
	passive voice
	negation pending
	question pending

All of these various modes -- perfect and continuous aspect, could and would modes, passive voice, negative mode, and inquisitive mood -- are used up after a single use.  It's assumed they are used within a larger prose generation system that will set or unset them as needed each time.  

There are three more phrases intended mainly for questions: "[quax]", "[??]", and "[^]".  To allow generating questions, prepend "[qaux]" to the subject just as "[aux]" is prepended to the verb.  It's placed directly next to the word on its right, in case it doesn't need to say anything.  At the other end of the sentence, "[??]" becomes a period or question mark, as appropriate.  Finally, "[^]" capitalises the next word. 
	say "[^][qaux][we] [aux]want[-s] [the noun] greatly[??]"
	say "But [qaux][we] [aux]want[-s] [the noun] at all[??]"

Irregular verbs don't need "[aux]" but everything else is game.
	say "[Aux]Bob [eat*] much lately[??]";

Finally, more modal auxiliaries may be added.
	*: Table of modal auxiliaries (continued)
	modal-auxiliary-column (text)
	"shall"
	"shan't"
	"should"
	"shouldn't"


(Ron Newcomb can be reached at pscion@yahoo.com)


Example: * Poster Shopping - Replace Inform's default responses with tailored ones for a much-improved player experience. 

In this table, we also use various say-phrases like "[We]" and "[see*]" so when the viewpoint or tense is changed during play, the messages immediately correct themselves.

	*: "Poster Shopping"
	
	Include Automated Verb Phrases by Ron Newcomb.
	
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
	
	Include Automated Verb Phrases by Ron Newcomb. 
	
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
	
	Include Automated Verb Phrases by Ron Newcomb.
	
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



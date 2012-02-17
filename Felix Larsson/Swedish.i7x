Version 1/110725 of Swedish by Felix Larsson begins here.

"Låter dig skriva spel/berättelser att spelas/läsas på svenska."


Volume - Localization of Inform 7

Book - Swedish Standard Rules

Part - Preamble 
[A/sr0 - SR0]

Section - Use options

[A/sr0§9 - SR0]
[Several common Swedish words have variant spellings in current usage (e.g. dig/dej or ska/skall), and a few of them occurs in the present Swedish translation of Inform's library messages. We therefore provide use options that set these words to an author's preferred spellings. Later we shall define grammar tokens for the words in question and have the say-phrases for them check if any relevant use option is set. And, while we're at it, we do the same for a number of words that do not occur in the present translation of the library messages. – For default values we use the spellings not listed as marked in any way in the 13th edition of the Swedish Academy Glossary (SAOL13).]
Use dan spelling translates as (- Constant DAN_SPELLING; -). 
Use dej spelling translates as (- Constant DEJ_SPELLING; -).
Use dom spelling translates as (- Constant DOM_SPELLING; -).
Use givit spelling translates as (- Constant GIVIT_SPELLING; -).
Use la spelling translates as (- Constant LA_SPELLING; -).
Use litet spelling translates as (- Constant LITET_SPELLING; -).
Use morron spelling translates as (- Constant MORRON_SPELLING; -).
Use ner spelling translates as (- Constant NER_SPELLING; -).
Use nån spelling translates as (- Constant NAAN_SPELLING; -).
Use sa spelling translates as (- Constant SA_SPELLING; -).
Use sen spelling translates as (- Constant SEN_SPELLING; -).
Use skall spelling translates as (- Constant SKALL_SPELLING; -).
Use sån spelling translates as (- Constant SAAN_SPELLING; -).
Use säja spelling translates as (- Constant SAEJA_SPELLING; -).
Use varann spelling translates as (- Constant VARANN_SPELLING; -).

[We also define use options to set several of these spellings in one go.]
Use formal spelling translates as (- Constant GIVIT_SPELLING; Constant LITET_SPELLING; Constant SKALL_SPELLING; -).
Use informal spelling translates as (- Constant DAN_SPELLING; Constant DEJ_SPELLING; Constant DOM_SPELLING; Constant LA_SPELLING; Constant MORRON_SPELLING; Constant NAAN_SPELLING; Constant SA_SPELLING; Constant SEN_SPELLING; Constant SAAN_SPELLING; Constant SAEJA_SPELLING; Constant VARANN_SPELLING; -).


Part - The Physical World Model
[A/sr1 - SR1]

Section - Primitive kinds

[A/sr1§13 - SR1/1]
[In Swedish, inanimate things can be common gender or neuter. Animate things can be male, female, common gender or neuter. So we need to add to the Standard Rules definition of the thing kind.]
An object can be neuter or common-gendered. An object is usually not neuter. 
[Actually the common-gendered property is a mere coy: it simply means "not neuter"; in particular, it is not connected in any way to our new I6 attribute "common", which the present extension defines to give objects the common gender. Still, declaring a thing to be common-gendered will work as expected, since you thereby declare the object to be not neuter and so, as a consequence, it will fall back on the default gender of things, which happens to be the common gender. (Men and women declared as common-gendered will remain male and female respectively, however. And, actually, the I7 property male is related to the old I6 attribute "male" just as I7 common-gendered to I6 'common')]

[In Swedish a few words - mostly names of noble families ("af Chapman", "de la Gardie", "von Wright" etc.) and some compunds with scientific acronyms (like "pH-mätare" (pH meter) are never capitalized, not even when occuring first in a sentence. We override capitalization in the definite species by declaring the word uncapitalisable and checking whether it is so, before printing it.(And we spell "uncapitalisable" with an "s" as an hommage to Graham Nelson.)]
An object can be uncapitalisable. An object is usually not uncapitalisable. 

[We want the game to understand the printed name of an object as that object, since normally the printed name of an object will contain the definite inflection of the object's name. It's probably good if this can be overriden, though.]
An object can be understood by its printed name or not understood by its printed name.
An object is usually understood by its printed name.
The understood by its printed name property translates into I6 as "short_name_understood".


Section - Things

[A/sr1§22 - SR1/3]
A thing can be non-count or not non-count. A thing is usually not non-count. 

[I you write source text like "A själ is a kind of thing. A själ is part of every person.", Inform automatically names these parts after their holders: "your själ", "Voldemort's själ", etc. The following code gives them a corresponding "indexed name" in Swedish ("din själ", "Voldemorts själ") that we can print and match input against instead.]

A thing has an indexed text called indexed name.
The indexed name of a thing is usually "".

When play begins (this is the give parts indexed names in Swedish rule):
	repeat with pars running through things:
		if pars is part of something (called totum):
			if word number 1 in the printed name of pars exactly matches the text "your":
				now	the indexed name of pars is the printed name of pars;
				replace word number 1 in the indexed name of pars with "di[n-tt-na for pars]";
			if the printed name of pars matches the text "[totum][']s":
				now the indexed name of pars is the printed name of pars;
				if "[totum]" matches the regular expression "s$|x$|z$":
					replace the text "[totum][']s" in the indexed name of pars with "[totum]";
				otherwise:
					replace the text "[totum][']s" in the indexed name of pars with "[totum]s".

For printing the name of a thing (called pars) that is part of something (this is the replace printed name with indexed name rule):
	if the indexed name of pars is not "", say the indexed name of pars;
	otherwise continue the action.


Section - Directions

[A/sr1§26 - SR1/4]
A direction is usually privately-named.
A direction has a text called printed name.
A direction is usually not understood by its printed name.

[A/sr1§29 - SR1/4]
The printed name of north is "norr". 
Understand "norrut/norr/nord/n" as north. Understand "åt norr/nord" as north.
[We keep "n" as in "norr" for north]

The printed name of northeast is "nordost". 
Understand "nordost/nordöst/no/nö" as northeast. Understand "åt nordost/nordöst" as northeast.
Understand the command "ne" as something new.

The printed name of northwest is "nordväst". 
Understand "nordväst/nv" as northwest. Understand "åt nordväst" as northwest.
Understand the command "nw" as something new.

The printed name of south is "söder". 
Understand "söderut/söder/syd/s" as south. Understand "åt söder/syd" as south.
[And "s" as in "söder" for south]

The printed name of southeast is "sydost". 
Understand "sydost/sydöst/so/sö" as southeast.Understand "åt sydost/sydöst" as southeast. 
Understand the command "se" as something new. ["se" is for looking]

The printed name of southwest is "sydväst". 
Understand "sydväst/sv" as southwest. Understand "åt sydväst" as southwest.
Understand the command "sw" as something new.

The printed name of east is "öster". 
Understand "österut/öster/ost/öst/o/ö" as east. Understand "åt öster/öst/ost" as east.
Understand the command "e" as something new.

The printed name of west is "väster". 
Understand "västerut/väster/väst/v" as west. Understand "åt väster/väst" as west.
Understand the command "w" as something new.

The printed name of up is "upp".
Understand "uppåt/upp" or "uppe/ovanför/ovan" as up. 
Understand the command "u" as something new. [And "u" for examining]

The printed name of down is "[if the ner spelling option is active]ner[otherwise]ned". 
Understand "nedåt/neråt/ned/ner" or "nere/nedanför/nedan/nedom" as down. 
Understand the command "d" as something new.

The printed name of inside is "in". 
Understand "inåt/in" or "inne/inuti/innanför" as inside. 
[But "in" means the same in Swedish as in English]

The printed name of outside is "ut". 
Understand "utåt/ut" or "ute/utanför" as outside. 
Understand the command "out" as something new.


Section - People (in place of Section SR1/11 - People in Standard Rules by Graham Nelson)
[We need to replace this wholesale to get at the description of yourself ...]

The specification of person is "Despite the name, not necessarily
a human being, but anything animate enough to envisage having a
conversation with, or bartering with."

A person can be female or male. A person is usually male.
A person can be neuter or common-gendered. A person is usually not neuter. [Adding the possibiity of people to be common gender.]

A person has a number called carrying capacity.
The carrying capacity of a person is usually 100.

Include (-
	has transparent animate
	with before NULL,
-) when defining a person.

The yourself is an undescribed person. The yourself is proper-named.

The description of yourself is usually "Lika snygg som vanligt."

The yourself object translates into I6 as "selfobj".

Yourself have a text called saved printed name.
The saved printed name property translates into I6 as "saved_short_name".
The saved printed name of yourself is "[dig]".


Part - Variables and Rulebooks
[A/sr2 - SR2]

Section - Used when counting things

Numerical quantifiers is a truth state that varies.
The numerical quantifiers variable translates into I6 as "num_quant". [A new I6 global.]

Neutrum is a truth state that varies.
The neutrum variable translates into I6 as "neutrum". [A new I6 global]


Section - Used when declining words

The number-just-said is a number that varies.
The number-just-said variable translates into I6 as "say__n". 

The indefinite mode is a truth state that varies.
The indefinite mode variable translates into I6 as "indef_mode".

Excise article is a truth state that varies.
The excise article variable translates into I6 as "exc_art". [A new I6 global]

Weak inflection is a truth state that varies.
The weak inflection is usually false.

The endophoric reference is an object that varies.
The endophoric reference is yourself.


Section - Unindexed Standard Rules variables - Unindexed

[A/sr2§8 - SR2/6a]
The story headline is usually "Interaktiv fiktion".

[A/sr2§10 - SR2/6c]
[These variables are used only in the phrases to decide if the printed name is understood and to decide if the indexed name is understood, called by the custom I6 routine LanguageRefers in the process of determining the reference of input nouns. The The LR-formal-supposition holds the object whose printed name we are matching against the input noun. The LR-material-supposition holds the input noun we are trying to match against. (In scholastic logic, the formal supposition of a word is what the word normally refers to in "use"; the material supposition is the word itself in "mention".)]
The LR-formal-supposition is an object that varies. The LR-formal-supposition variable translates into I6 as "LR_object".
The LR-material-supposition is indexed text that varies. The LR-material-supposition variable translates into I6 as "parameter_object".


Section - The Standard Rules

[A/sr2§26 - SR2/8]
This is the post-parse command rule:
	anonymously abide by the post-parsing rules.
The post-parse command rule is listed before the before stage rule in the action-processing rules.


Part - Activities
[A/sr3 - SR3]

Section - Definitions

[A/sr3§9 - SR3/1]
The Swedish pre-parsing rules are a rulebook.
Post-parsing is a rulebook.
Translating to Informese is an activity.

After translating to Informese: now the endophoric reference is the noun.
After translating to Informese: anonymously abide by the Swedish pre-parsing rules.


Section - Final Question

[A/sr3§17 - SR3/2]
The Swedish print the final question rule is listed instead of the print the final question rule in before handling the final question.
The Swedish respond to final question rule is listed instead of the standard respond to final question rule in for handling the final question.

[A/sr3§18 - SR3/2]
This is the Swedish print the final question rule:
	let named options count be 0;
	repeat through the Table of Final Question Options:
		if the only if victorious entry is false or the story has ended finally:
			if there is a final response rule entry
				or the final response activity entry [activity] is not empty:
				if there is a final question wording entry, increase named options count by 1;
	if the named options count is less than 1, abide by the immediately quit rule;
	say "Vill du ";
	repeat through the Table of Swedish Final Question Options:
		if the only if victorious entry is false or the story has ended finally:
			if there is a final response rule entry
				or the final response activity entry [activity] is not empty:
				if there is a final question wording entry:
					say final question wording entry;
					decrease named options count by 1;
					if the named options count is 0:
						say "?[line break]";
					otherwise if the named options count is 1:
						say " eller ";
					otherwise:
						say ", ".

[A/sr3§19 - SR3/2]
This is the Swedish respond to final question rule: 
	repeat through the Table of Swedish Final Question Options: 
		if the only if victorious entry is false or the story has ended finally: 
			if there is a final response rule entry or the final response activity entry [activity] is not empty: 
				if the player’s command matches the topic entry: 
					if there is a final response rule entry, abide by final response rule entry; 
					otherwise carry out the final response activity entry activity; 
					rule succeeds; 
	issue miscellaneous library message number 8. 


Section - Final question options

[A/sr3§20 - SR3/3]
Table of Swedish Final Question Options
final question wording	only if victorious	topic	final response rule	final response activity
"börja på en NY spelomgång"	false	"ny"	immediately restart the VM rule	--
"LADDA en sparad spelomgång"	false	"ladda"	immediately restore saved game rule	--
"få tips på KUL saker att testa i spelet"	true	"kul"	--	amusing a victorious player
"AVSLUTA"	false	"avsluta"	immediately quit rule	--
"ÅNGRA det sista draget"	false	"ångra"	immediately undo rule	--


Section - Locale descriptions
[lA/sr3 - SR3/4]

[A/sr3§23 - SR3/4]
The Swedish you-can-also-see rule is listed instead of the you-can-also-see rule in the for printing the locale description rules.

This is the Swedish you-can-also-see rule:
	let the domain be the parameter-object;
	let the mentionable count be 0;
	repeat with item running through things:
		now the item is not marked for listing;
	repeat through the Table of Locale Priorities:
		[say "[notable-object entry] - [locale description priority entry].";]
		if the locale description priority entry is greater than 0,
			now the notable-object entry is marked for listing;
		increase the mentionable count by 1;
	if the mentionable count is greater than 0:
		repeat with item running through things:
			if the item is mentioned:
				now the item is not marked for listing;
		begin the listing nondescript items activity with the domain;
		if the number of marked for listing things is 0:
			abandon the listing nondescript items activity with the domain;
		otherwise:
			if handling the listing nondescript items activity:
				if the domain is a room:
					if the domain is the location, say "Du ser ";
					otherwise say "I [the domain] ser du ";
				otherwise if the domain is a supporter:
					say "På [the domain] ser du ";
				otherwise if the domain is an animal:
					say "På [the domain] ser du ";
				otherwise:
					say "I [the domain] ser du ";
				say "[if the locale paragraph count is greater than 0]dessutom [end if]";
				let the common holder be nothing;
				let contents form of list be true;
				repeat with list item running through marked for listing things:
					if the holder of the list item is not the common holder:
						if the common holder is nothing,
							now the common holder is the holder of the list item;
						otherwise now contents form of list is false;
					if the list item is mentioned, now the list item is not marked for listing;
				filter list recursion to unmentioned things;
				if contents form of list is true and the common holder is not nothing,
					list the contents of the common holder, as a sentence, including contents,
						giving brief inventory information, tersely, not listing
						concealed items, listing marked items only;
				otherwise say "[a list of marked for listing things including contents]";
				if the domain is the location, say " här";
				say ".[paragraph break]";
				unfilter list recursion;
			end the listing nondescript items activity with the domain;
	continue the activity.

[A/sr3§25 - SR3/4]
The Swedish describe what's on scenery supporters in room descriptions rule is listed instead of the describe what's on scenery supporters in room descriptions rule in the for printing a locale paragraph about rules.

For printing a locale paragraph about a thing (called the item)
	(this is the Swedish describe what's on scenery supporters in room descriptions rule):
	if the item is not undescribed and the item is scenery and
		the item does not enclose the player:
		if a locale-supportable thing is on the item:
			set pronouns from the item;
			repeat with possibility running through things on the item:
				now the possibility is marked for listing;
				if the possibility is mentioned:
					now the possibility is not marked for listing;
			increase the locale paragraph count by 1;
			say "På [the item] finns ";
			list the contents of the item, as a sentence, including contents,
				giving brief inventory information, tersely, not listing
				concealed items, listing marked items only;
			say ".[paragraph break]";
	continue the activity.


Part - Actions
[A/sr4 - SR4]

[The following sections contain rules to prevent the parser from misinterpreting commands due to namespace clashes between Swedish verbs. Seriously wrong library messages threaten to result from the need in Swedish to let "sätt", "ställ" and "lägg" be synonymous for the purpose of putting it on action but not for the purposes of the switching on, switching off and setting it to actions; also, a commands such as "Jätte, ställ mig på hyllan" would be understood as the player asking the giant to enter the shelf rather than asking him to put the player on it. Less serious but still misleading responses would be issued by other actions understood by reflexive verbs. This is where we intercept to prevent those misinterpretations.]

Section - Pre-parsing rules

A Swedish pre-parsing rule (this is the disambiguate 'ta på sig' rule):
	if the player's command matches "ta/tag på dig/dej/mig/mej/sig/sej":
		say "Jag antar att du vill ta på [dig] [något] (inte bara känna på [dig] själv). Stämmer det?";
		if player consents:
			change the text of the player's command to "klä på mig";
		otherwise:
			try touching yourself instead.

A Swedish pre-parsing rule (this is the 'ta av mig' rule):
	if the player's command matches "ta/tag av dig/dej/mig/mej/sig/sej":
		change the text of the player's command to "ta av";
		rule fails.


Section - Post-parsing rules

Post-parsing putting the player on (this is the understand 'ställ mig på' as entering rather than putting myself on rule):
	if the player's command includes "lägg/sätt/ställ dig/dej/mig/mej/sig/sej":
		try the player entering the second noun;
		rule fails.

[We don't need this rule at present. For some reason or other, things work as intended anyway.]
[Post-parsing asking someone (called Great Gentle Giant) to try entering (this is the don't understand 'Person sätt mig på' as 'Person sätt dig på' rule):
	if the player's command includes "sätt/ställ/lägg mig/mej på/ovanpå":
		try asking Great Gentle Giant to try putting the player on the second noun instead.]

Post-parsing asking someone (called Houdini) to try exiting (this is the don't understand 'Person res mig' as 'Person res dig' rule):
	if the player's command includes "res mig/mej":
		try asking Houdini about the matched text instead;
		rule fails.

Post-parsing asking someone (called Houdini) to try getting off (this is the don't understand 'Person res mig upp ur' as 'Person res dig upp ur' rule):
	if the player's command includes "res mig/mej":
		try asking Houdini about the matched text instead;
		rule fails.

Post-parsing asking someone (called Argus) to try looking (this is the don't understand 'Person se mig om' as 'Person se dig om' rule):
	if the player's command includes "titta/se/kolla mig/mej om/omkring":
		try asking Argus about the matched text instead;
		rule fails.

Post-parsing an actor taking off something (this is the disambiguate 'ta av' rule):
	if the player's command includes "ta/tag av" and the player's command does not include "ta/tag av dig/dej/mig/mej/sig/sej":
		if the noun is not wearable, try the actor taking the noun instead.

Post-parsing touching something when the noun is not worn (this is the disambiguate 'ta på' rule):
	if the player's command includes "ta/tag på":
		if the noun is wearable:
			 say "Jag antar att du vill ta på [dig] [the noun] (inte bara känna på [if the noun is plural-named][dem][otherwise if the noun is female and the noun is a person]henne[otherwise if the noun is male and the noun is a person]honom[otherwise if the noun is neuter]det[otherwise]den[end if]). Stämmer det?";
			if player consents:
				try wearing the noun;
				rule fails.

Post-parsing asking someone (called Teufelsdröckh) to try touching something (this is the disambiguate 'Person ta på något' rule):
	if the noun is wearable:
		if the player's command includes "ta/tag på":
			say "Jag antar att du vill att [the actor] [ska] ta på [sig] [the noun] (inte bara känna på [if the noun is plural-named][dem][otherwise if the noun is female and the noun is a person]henne[otherwise if the noun is male and the noun is a person]honom[otherwise if the noun is neuter]det[otherwise]den[end if]). Stämmer det?";
			if player consents:
				try asking Teufelsdröckh to try wearing the noun;
				rule fails.

Post-parsing asking someone (called Teufelsdröckh) to try wearing something (this is the don't understand 'Person klä på mig' as 'Person klä på dig' rule):
	if the player's command includes "klä på/i mig/mej" or the player's command includes "klä mig/mej i" or the player's command includes "ta/tag på mig/mej":
		try asking Teufelsdröckh about the matched text instead;
		rule fails.

Post-parsing asking someone (called Teufelsdröckh) to try taking off something (this is the don't understand 'Person klä av mig' as 'Person klä av dig' rule):
	if the player's command includes "klä av mig/mej" or the player's command includes "ta/tag av mig/mej":
		try asking Teufelsdröckh about the matched text;
		rule fails.

[Post-parsing an actor setting something to (this is the don't understand 'lägg den på' as setting it to rule):
	if the player's command includes "lägg" and the player's command includes "på":
		try the actor putting the noun on the second noun instead;
		rule fails.]

[Post-parsing an actor switching on (this is the don't understand 'lägg på' and 'ställ på' as switching on rule):
	if the player's command includes "lägg" or the player's command includes "ställ":
		now the latest parser error is the can't see any such thing error;
		issue miscellaneous library message number 30;
		rule fails.]


Section - Standard actions concerning the actor's vision

[It's the room description heading rule that prints the name of the room the player is currently in (unless it's dark or the player is in a closed opaque container etc.). In effect it just prints "[location]", and the author is supposed to have given it a name beginning with a capital letter anyway – giving you "Ktichen" or "Sandy Beach" etc. In Swedish, however, it's idiomatic to use the definite species in that context (you'd rather call a room "Köket" or "Sandstranden" than "Kök" or "Sandstrand"). So we have the Swedish room description heading rule print "[The location]" instead (which by the way is more convenient when we want to print the name of the location elsewhere in the game -- Swedish takes much less kindly to occasional capitalization of words than English).]

[A/sr4§45 - SR4/4]
This is the Swedish room description heading rule:
	say bold type;
	if the visibility level count is 0:
		begin the printing the name of a dark room activity;
		if handling the printing the name of a dark room activity,
			issue miscellaneous library message number 71;
		end the printing the name of a dark room activity;
[	otherwise if the visibility ceiling is the location: 
		say "[visibility ceiling]"; ] [Commenting out these offending lines.]
	otherwise:
		say "[The visibility ceiling]";
	say roman type;
	let intermediate level be the visibility-holder of the actor;
	repeat with intermediate level count running from 2 to the visibility level count:
	[adding this extra conditional] [to prevent the game from printing the name of the core object rather than the part of it that the player is in]
		if the holder of the actor is a part of the intermediate level,
			issue library message looking action number 8 for the holder of the actor;
		otherwise [finished adding] 
			issue library message looking action number 8 for the intermediate level;
		let the intermediate level be the visibility-holder of the intermediate level;
	say line break;
	say run paragraph on with special look spacing.

The Swedish room description heading rule is listed instead of the room description heading rule in the carry out looking rulebook.


Section - Grammar

[We keep the English commands for out of world actions: these are either very entrenched (even Swedish players would expect to be able to type "q" to quit) or they are impossible to guess anyway (like "superbrief" or "notify"). We do provide a Swedish set of commands for these actions as well, though. We also keep ingrained abbreviations of English commands ("i", "inv", "l", "x", "y" and "z") with exception of direction (at the very least we need "se" for looking in Swedish -- and while we're at it we shall use "u" for the long word "undersök" rather than for the much shorter "upp"). For the sake of readibility, however, the English abbreviations that we keep are defined anew together with the Swedish commands.]

[lA/sr4§187 - SR4/10 ]
Understand the commands "take", "carry", "hold", "get" and "pick" as something new.
Understand the command "stand" as something new.
Understand the commands  "remove", "shed", "doff", "wear" and "don" as something new.
Understand the commands "put", "insert", "drop", "throw" and "discard" as something new.
Understand the commands "give", "pay", "offer", "feed", "show", "present" and "display" as something new.
Understand the commands "go", "walk" and "run" as something new.
Understand the commands "inventory", "i" and "inv" as something new.
Understand the commands "look", "l" and "consult" as something new.
Understand the commands "open", "unwrap", "uncover", "close", "shut" and "cover" as something new.
Understand the commands "enter", "cross", "sit", "exit", "leave" and "out" as something new.
Understand the commands "examine", "x", "watch", "describe", "check" and "read" as something new.
Understand the commands "yes", "y", "no" and "sorry" as something new.
Understand the commands "bother", "curses", "drat", "darn", "shit", "fuck" and "damn" as something new.
Understand the command "search" as something new.
Understand the command "wave" as something new.
Understand the commands "set" and "adjust" as something new.
Understand the commands "pull", "drag", "push", "move", "shift", "clear" and "press" as something new.
Understand the commands "turn", "rotate", "twist", "unscrew", "screw", and "switch" as something new.
Understand the commands "lock" and "unlock" as something new.
Understand the commands "attack", "break", "smash", "hit", "fight", "torture", "wreck", "crack", "destroy", "murder", "kill", "punch" and "thump" as something new.
Understand the commands "wait" and "z" as something new.
Understand the commands "answer", "say", "shout", "speak", "tell" and "ask" as something new.
Understand the command "eat" as something new.
Understand the commands "sleep" and "nap" as something new.
Understand the command "sing" as something new.
Understand the commands "climb" and "scale" as something new.
Understand the commands "buy" and "purchase" as something new.
Understand the commands "squeeze" and "squash" as something new.
Understand the commands "take", "carry", "hold", "get" and "pick" as something new.
Understand the command "swing" as something new.
Understand the commands "wake", "awake" and "awaken" as something new.
Understand the commands "kiss", "embrace" and "hug" as something new.
Understand the commands "think" as something new.
Understand the commands "smell", "sniff", "listen", "hear", "taste" and "touch" as something new.
Understand the commands "rub", "shine", "polish", "sweep", "clean", "dust", "wipe", and "scrub" as something new.
Understand the commands "tie", "attach" and "fasten" as something new.
Understand the commands "burn" and "light" as something new.
Understand the commands "drink", "swallow" and "sip" as something new.
Understand the commands "cut", "slice", "prune" and "chop" as something new.
Understand the commands "jump", "skip" and "hop" as something new.
[Understand the commands "score", "quit", "q", "save", "restart" and "restore" as something new.
Understand the commands "verify" and "version" as something new.
Understand the commands "script" and "transcript" as something new.
Understand the commands "superbrief", "short", "verbose", "long", "brief" and "normal" as something new.
Understand the commands "nouns" and "pronouns" as something new.
Understand the command "notify" as something new.]


Understand "gå igenom tillhörigheter/utrustning" or "gå igenom min/din/sin/mina/dina/sina utrustning/tillhörigheter" as taking inventory.
Understand "inventera" or "inventera tillhörigheter/utrustning" as taking inventory.
Understand the commands "i", "inv", "lista", "tillhörigheter", "tillh", "utrustning" and "utr" as "inventera".
["Take inventory" is hard to translate well. Fortunately, Fredrik Ramsberg, the translator of Inform 6 into Swedish, has already solved it: "lista tillhörigheter". We understand "inventera" as taking inventory, since players used to English games may try it. And we understand "lista" as a synonym of "inventera" rather than the other way around, since it is more likely that a Swedish author wants to create a new action that responds to the command "lista" than one that responds to the command "inventera".]

Understand "ta [things]" as taking.
Understand "ta upp/ut/ur [things]" as taking.
Understand "ta [things inside] från/ifrån/ur [something]" as removing it from. 
Understand "ta bort/upp/ut/ur [things inside] från/ifrån/ur [something]" or "ta [things inside] upp/ut/ur från/ifrån/ur [something]" as removing it from. 
Understand "ta på dig/dej/mig/mej/sig/sej [something preferably held]" or "ta [something preferably held] på dig/dej/mig/mej/sig/sej" as wearing.
Understand "ta av dig/dej/mig/mej/sig/sej [something preferably held]" or "ta [something preferably held] av dig/dej/mig/mej/sig/sej" as taking off.
Understand "ta av [something preferably held]" as taking off.
Understand "ta på [something]" as touching.
Understand the commands "tag", "hämta" and "plocka" as "ta".
[Note that "dig" or "dej" should be the first pronoun listed in understand tokens for reflexive verbs, or we may receive inappropriate parser errors.]

Understand "kasta [things preferably held]" or "kasta bort [things preferably held]" as dropping.
Understand "kasta [other things] i [something]" as inserting it into.
Understand  "kasta in/upp/ned/ner [other things] i/genom/igenom [something]" or  "kasta [other things] in/upp/ned/ner i/genom/igenom [something]" as inserting it into.
Understand "kasta [other things] på/ovanpå [something]" as putting it on.
Understand  "kasta upp/ned/ner/in [other things] på/ovanpå [something]" or "kasta [other things] upp/ned/ner/in på/ovanpå [something]" as putting it on.
Understand  "kasta [something preferably held] mot/på/i/genom/igenom [any thing]" as throwing it at.
Understand the commands "släpp" and "släng" as "kasta".

Understand "sätt ned/ner/undan [things preferably held]" as dropping.
Understand "sätt [other things] i [something]" as inserting it into.
Understand "sätt ned/ner/i/in [other things] i [something]" or "sätt [other things] nere/inne i [something]" as inserting it into.
Understand "sätt [other things] på/ovanpå [something]" as putting it on.
Understand "sätt upp/ned/ner [other things] på/ovanpå [something]" or "sätt [other things] uppe/nere på/ovanpå [something]" as putting it on.
Understand "sätt dig/dej/mig/mej/sig/sej på/ovanpå/i/inuti [something]" or "sätt dig/dej/mig/mej/sig/sej ned/ner/upp/nere/uppe/inne på/ovanpå/i [something]" as entering.
Understand the command "ställ" as "sätt".

Understand "lägg ned/ner/undan [things preferably held]" as dropping.
Understand "lägg [other things] i [something]" as inserting it into.
Understand "lägg ned/ner/i/in [other things] i [something]" or "lägg [other things] nere/inne i [something]" as inserting it into.
Understand "lägg [other things] på/ovanpå [something]" as putting it on.
Understand "lägg upp/ned/ner [other things] på/ovanpå [something]" or "lägg [other things] uppe/nere på/ovanpå [something]" as putting it on.
Understand "lägg dig/dej/mig/mej/sig/sej på/ovanpå/i/inuti [something]" or "lägg dig/dej/mig/mej/sig/sej ned/ner/upp/nere/uppe/inne på/ovanpå/i [something]" as entering.

Understand "stoppa [other things] i [something]" as inserting it into.
Understand "stoppa in [other things] i [something]" or "stoppa [other things] in i [something]" as inserting it into.
Understand the command "stick" as "stoppa".

Understand "ät [something preferably held]" as eating.

Understand "gå" as going.
Understand "gå [direction]" as going.
Understand "gå [something]" as entering.
Understand "gå i/in/på/genom/över [something]" or "gå in/upp/ned/ner i/på/genom/över [something]" as entering.
Understand "gå ut/av/ned/ner/upp/ur/härifrån/därifrån" as exiting.
Understand "gå av/från/ifrån [something]" or "gå av/ned/ner från/ifrån [something]" as getting off.
Understand the commands "åk", "fly" and "stig" as "gå".

Understand "ut" as exiting.  

Understand "sitt på/ovanpå/i/inuti [something]" or "sitt uppe/inne/ned/ner/nere på/ovanpå/i/inuti [something]" as entering.

Understand "stå på/ovanpå/i/inuti [something]" or "stå uppe/inne/nere på/ovanpå/i [something]" as entering.
Understand "stå" or "stå upp" as exiting.
Understand "stå upp från/ifrån [something]" as getting off.

Understand "ligg på/ovanpå/i/inuti [something]" or "ligg uppe/inne/nere på/ovanpå/i [something]" as entering.
Understand "ligg ned/ner på/ovanpå/i/inuti [something]" or "ligg ned/ner uppe/inne/nere på/ovanpå/i [something]" as entering.
[Swedish Inform 7 implements a basic "lie down" command.]

Understand "res dig/dej/mig/mej/sig/sej" or "res dig/dej/mig/mej/sig/sej upp" as exiting.
Understand "res dig/dej/mig/mej/sig/sej ur/från/ifrån [something]" or "res dig/dej/mig/mej/sig/sej upp ur/från/ifrån [something]" as getting off.

Understand "titta" as looking.
Understand "titta dig/dej/mig/mej/sig/sej om/omkring" as looking.
Understand "titta på [something]" as examining.
Understand "titta [something]" as examining.
Understand "titta under [something]" as looking under.
Understand "titta i/inuti/genom/igenom [something]" or "titta in i/inuti/genom/igenom [something]" as searching.
Understand "titta efter [text] i [something]" as consulting it about (with nouns reversed).
Understand "titta i [something] efter [text]" as consulting it about.
Understand the command "l", "t", "se", "c" and "kolla" as "titta".

Understand "undersök [something]" as examining.
Understand the commands "x" and "u" as "undersök".

Understand "läs [something]" as examining.
Understand "läs i/ur/från [something]" as examining.

Understand "leta i/genom/igenom [something]" as searching.
Understand "leta upp/efter [text] i [something]" as consulting it about (with nouns reversed).
Understand "leta i [something] efter/upp [text]" as consulting it about.
Understand the command "sök" as "leta"

Understand "lås [something] med [something preferably held]" as locking it with.
Understand "lås upp [something] med [something preferably held]" as unlocking it with.

Understand "knäpp på [something]" as switching on.
Understand "knäpp av [something]" as switching off.

Understand "sätt på [something]" as switching on.
[Understand the command "ställ på" as something new.[???]]

Understand "öppna [something]" as opening.
Understand the command "packa upp" as "öppna".

Understand "stäng av [something]" as switching off.
Understand "stäng [something]" as closing.

Understand "klä på/i dig/dej/mig/mej/sig/sej [something preferably held]" as wearing.
Understand "klä dig/dej/mig/mejsig/sej i [something preferably held]" as wearing.
Understand "klä av dig/dej/mig/mejsig/sej [something preferably held]" as taking off.

Understand "ge [something preferably held] till [someone]" or "ge bort [something preferably held] till [someone]" as giving it to.
Understand "ge [someone] [something preferably held]" as giving it to (with nouns reversed).
Understand the commands "giv", "skänk" and "betala" as "ge".

Understand "visa [something preferably held] för [someone]" or "visa upp/fram [something preferably held] för [someone]" as showing it to.
Understand "visa [someone] [something preferably held]" as showing it to (with nouns reversed).

Understand "väck [someone]" as waking.

Understand "slå i [something] efter/upp [text]" as consulting it about.
Understand "slå upp/efter [text] i [something]" as consulting it about (with nouns reversed).
Understand "slå på [something switched on]" as switching on.
Understand "slå på [something switched off]" as switching on.
Understand "slå av [something switched on]" as switching off.
Understand "slå av [something switched off]" as switching off.
Understand "slå [something]" or "slå på/till/in/ut/av/sönder/ihjäl [something]" as attacking.
Understand the commands "anfall", "angrip", "attackera", "krossa", "förstör", "spräck", "bryt", "knäck", "sparka", "misshandla", "döda" and "mörda" as "slå".

Understand "kyss [someone]" as kissing.
Understand the commands "pussa", "krama" and "omfamna" as "kyss".

Understand "svara [someone] [text]" or "svara [someone] att [text]" as answering it that.
Understand "svara [text] till [someone]" or  "svara att [text] till [someone]"as answering it that (with nouns reversed).
Understand the commands "säg", "säj", "ropa" and "skrik" as "svara".

Understand "berätta för [someone] [text]" or "berätta för [someone] om/att [text]" or "berätta för [someone] om att [text]" as telling it about.
Understand "berätta [text] för [someone]" or "berätta om/att [text] för [someone]" or "berätta om att [text] för [someone]" as telling it about (with nouns reversed).
Understand the command "förklara" as "berätta".

Understand "fråga [someone] om/efter [text]" or "fråga [someone] [text]" as asking it about.
Understand "fråga om/efter [text] av/hos/från [someone]" as asking it about (with nouns reversed).
Understand the command "undra" as "fråga".

Understand "be [someone] om [something]" as asking it for.
Understand "be om [something] av/hos/från [someone]" as asking it for (with nouns reversed).

Understand "vänta" as waiting.
Understand the command "z" as "vänta".

Understand "känn på [something]" as touching.
Understand the command "peta" as "känn".

Understand "rör vid [something]" or "vidrör [something]" as touching.

Understand "vifta [something]" or "vifta med [something]" as waving.

Understand "dra [something]" or "dra i [something]" as pulling.
Understand the commands "drag" and "ryck" as "dra".

Understand "tryck [something]" or "tryck på/in [something]" as pushing.

Understand "vrid [something]"or "vrid på [something]" as turning.
Understand the commands "skruva" and "snurra" as "vrid".

Understand "skjut [something] [direction]" or "skjut [something] mot/åt/till [direction]" or "skjut [something] [something]" as pushing it to.
Understand the commands "skjuva", "knuffa", "puffa" and "putta" as "skjut".

Understand "kläm [something]" or "kläm på/ur/ut [something]" as squeezing.

Understand "ja" as saying yes.
Understand the commands "jo", "j" and "y" as "ja".

Understand "nej " as saying no.
Understand the command "nä" as "nej".

Understand "bränn [something]" or "bränn upp/på [something]" as burning.
Understand the command "elda" as "bränn".

Understand "tänd [something]" or "tänd eld på [something]" as burning.

Understand "vakna" as waking up.

Understand "tänk" as thinking.

Understand "lukta" as smelling.
Understand "lukta på [something]" as smelling.
Understand the command "vädra" as "lukta".

Understand "lyssna" as listening.
Understand "lyssna på [something]" as listening.
Understand the command "hör" as "lyssna".

Understand "smaka [something]" or "smaka på [something]" as tasting.

Understand "skär [something]" or "skär av/itu/isär/sönder/upp/i [something]" as cutting.
Understand the commands "klipp", "hugg" and "klyv" as "skär".

Understand "hoppa" as jumping.

Understand "bind [something] vid/med/i/på/under [something]" or "bind fast/ihop [something] vid/med/i/på/under [something]" as tying it to.
Understand the commands "knyt" and "fäst" as "bind".

Understand "sätt fast [something] vid/med/i/på/under [something]" as tying it to.

Understand "drick [something]" as drinking.
Understand the command "svälj" as "drick".

Understand "ursäkta" as saying sorry.
Understand the command "förlåt" as "ursäkta".

Understand "tusan" as swearing mildly.
Understand the commands "attan", "jäklar", "jädrar" och "shit" as "tusan". 

Understand "fan" as swearing obscenely.
Understand the commands "helvete" and "jävlar" as "fan".

Understand "gunga [something]" or "gunga i/på" as swinging.
Understand the command "svinga" as "gunga".

Understand "gnid [something]" as rubbing.
Understand the commands "gnugga", "skrubba", "putsa", "torka", "damma", "sopa" and "städa" as "gnid".

Understand "ställ [something] på [text]" or "ställ in [something] på [text]" as setting it to.

Understand "ändra [something] till [text]" as setting it to.

Understand "vifta" as waving hands.
Understand the command "vinka" as "vifta".

Understand "köp [something]" as buying.
Understand the commands "handla" and "inhandla" as "köp".

Understand "sjung" as singing.
Understand the command "tralla" as "sjung".

Understand "klättra på/över/i/genom/igenom [something]" or "klättra upp/ut/in på/över/i/genom/igenom [something]" as climbing.

Understand "sov" as sleeping.
Understand the command "somna" as "sov".


[For player convenience we want the commands for I7 actions out of world to agree with the commands for Group 1 (=meta) action in the already existing Swedish I6 Library. But we also add several alternative ways to phrase these hard-to-guess commands in an attempt to capture wordings a player may possibly try.]

Understand "avsluta" or "avsluta spel/spelet/omgång/omgången/spelomgång/spelomgången" as quitting the game.
Understand the command "sluta" as "avsluta".

Understand "stäng" or "stäng spel/spelet/omgång/omgången/spelomgång/spelomgången" as quitting the game. 

Understand "a" or "dö" as quitting the game. []

Understand "spara" or "spara spel/spelet/omgång/omgången/spelomgång/spelomgången" as saving the game.
Understand "sparad" or "sparat" or "sparad omgång/spelomgång" or "sparat spel" as restoring the game.

Understand "gammal", "gammalt", "gammal omgång/spelomgång" or "gammalt spel" as restoring the game.

Understand "hämta" or "hämta spel/spelet/omgång/omgången/spelomgång/spelomgången" or "hämta gammal/gammalt/sparad/sparat" or "hämta gammal/gammalt/sparad/sparat spel/omgång/spelomgång" or "hämta en/ett gammal/gammalt/sparad/sparat spel/omgång/spelomgång" as restoring the game.
Understand "hämta sparning" or "hämta sparad position" as restoring the game. [] 

Understand "ladda" or "ladda spel/spelet/omgång/omgången/spelomgång/spelomgången" or "ladda gammal/gammalt/sparad/sparat" or "ladda gammal/gammalt/sparad/sparat spel/omgång/spelomgång" or "ladda en/ett gammal/gammalt/sparad/sparat spel/omgång/spelomgång" as restoring the game.
Understand "ladda sparning" or "ladda sparad position" as restoring the game. []

Understand "öppna" or "öppna spel/spelet/omgång/omgången/spelomgång/spelomgången" or "öppna gammal/gammalt/sparad/sparat" or "öppna gammal/gammalt/sparad/sparat spel/omgång/spelomgång" or "öppna en/ett gammal/gammalt/sparad/sparat spel/omgång/spelomgång" as restoring the game.

Understand "ny", "nytt", "ny omgång/spelomgång" or "nytt spel" as restarting the game.

Understand "omstart" as restarting the game.

Understand "börja", "börja om" or "börja om från början" as restarting the game.
Understand "börja ny/nytt", "börja spela/spel/spelet/omgång/omgången/spelomgång/spelomgången", "börja ny/nytt spel/omgång/spelomgång", "börja på/en/ett ny/nytt spel/omgång/spelomgång", "börja om/på på/en/ett ny/nytt spel/omgång/spelomgång" or "börja om på en/ett ny/nytt spel/omgång/spelomgång" as restarting the game.
Understand the command "starta" as "börja".

Understand "verifiera" or "verifiera fil" as verifying the story file.

Understand "avskrift" or "avskrift på" as switching the story transcript on.
Understand "avskrift av" as switching the story transcript off.
Understand the command "utskrift" as "avskrift".

Understand "ingen avskrift" as switching the story transcript off.

Understand "version" as requesting the story file version.

Understand "poäng" or "resultat" as requesting the score.

Understand "aldrig" or "beskriv aldrig/inte/inga", "beskriv rum aldrig" or "beskriv aldrig/inte/inga rum" as preferring abbreviated room descriptions.

Understand "kort" or "korta" as preferring abbreviated room descriptions. []
Understand "kort beskrivning" or "korta beskrivningar" as preferring abbreviated room descriptions. []

Understand the commands "superkort" and "superkorta" as "superbrief".

Understand "alltid" or "beskriv alltid/alla/allt", "beskriv rum alltid" or "beskriv alltid/alla rum" as preferring unabbreviated room descriptions.

Understand "långt", "lång" and "långa" as preferring unabbreviated room descriptions.
Understand "lång beskrivning" or "långa beskrivningar" as preferring unabbreviated room descriptions. []

Understand "ibland" or "beskriv ibland", "beskriv ibland rum" or "beskriv rum ibland" as preferring sometimes abbreviated room descriptions.

Understand "första gången" or "beskriv första gången" or "beskriv rum första gången" as preferring sometimes abbreviated room descriptions. []

[Understand the commands "kort" and "korta" as "brief".]
Understand "normalt" and "normala" as preferring sometimes abbreviated room descriptions. ["Normal" is already a command for this action in English. We never understood is as something new.][]
Understand "normal beskrivning" or "normala beskrivningar" as preferring sometimes abbreviated room descriptions. []

Understand "varsko" or "varsko poängändringar" or "varsko om poängändringar" as switching score notification on.
Understand "varsko inte" or "varsko inte poängändringar" or "varsko inte om poängändringar" as switching score notification off.

Understand "meddelande", "meddelanden", "meddelande på" or "meddelanden på" as switching score notification on. []
Understand "meddelande av" or "meddelanden av" as switching score notification off. []

Understand "pronomen" or "visa pronomen" as requesting the pronoun meanings.
Understand the commands "pronomina" and "substantiv" as "pronomen".


Part - Phrase Definitions
[A/sr5 - SR5]

Chapter - Numbers

Section - Counting things

[A/sr5§5 - SR5/1/1]
To say (quantum - number) in words counting common gender/genders:
	now numerical quantifiers is true;
	now neutrum is false;
	say quantum in words.

To say (quantum - number) in words counting common-gendered/common-gendereds:
	say quantum in words counting common gender.

To say (quantum - number) in words counting neuter/neuters:
	now numerical quantifiers is true;
	now neutrum is true;
	say quantum in words;
	now neutrum is false.

To say (quantum - number) in words counting öre/ören/år/ålder:
	say quantum in words counting nothing.

To say (quantum - number) in words counting nothing:
	now numerical quantifiers is false;
	say quantum in words;
	now numerical quantifiers is true.

To say (quantum - number) in words not counting:
	say quantum in words counting nothing.

To say (quantum - number) in words counting (items - object):
	if items are neuter, say quantum in words counting neuters;
	otherwise say quantum in words counting common gender;
	if the printed name of items is "öre" or the printed name of items is "år", say quantum in words counting nothing.


Section - Plural inflections

[A/sr5§5 - SR5/1/1]
To say or: [ros/ros|or]
	if the number-just-said is not 1, say "or".

To say a-or: [flick|a/flick|or]
	if the number-just-said is not 1, say "or";
	otherwise say "a".

To say ar: [gran/gran|ar]
	if the number-just-said is not 1, say "ar".

To say e-ar: [pojk|e/pojk|ar]
	if the number-just-said is not 1, say "ar";
	otherwise say "e".

To say er: [viol/viol|er]
	if the number-just-said is not 1, say "er".

To say a-er: [kolleg|a/kolleg|er]
	if the number-just-said is not 1, say "er";
	otherwise say "a".

To say r: [ko/ko|r]
	if the number-just-said is not 1, say "r".

To say -n: [äpple/äpple|n]
	if the number-just-said is not 1, say "n".
[We use "[-n]" with a hyphen here, since we want to reserve "[n]" for the much more common definite species ending -n]

To say a-on: [ör|a/ör|on]
	if the number-just-said is not 1, say "on";
	otherwise say "a".

To say um-er: [muse|um/muse|er]
	if the number-just-said is not 1, say "er";
	otherwise say "um".

To say um-a: [fakt|um/fakt|a]
	if the number-just-said is not 1, say "a";
	otherwise say "um".

To say en-ina: [exam|en/exam|ina]
	if the number-just-said is not 1, say "ina";
	otherwise say "en".

To say e-ia: [real|e/real|ia]
	if the number-just-said is not 1, say "ia";
	otherwise say "e".

To say ta: [schema/schema|ta]
	if the number-just-said is not 1, say "ta".


[Umlauts]					
To say a-ä: [man/män]
	if the number-just-said is not 1, say "ä";
	otherwise say "a";

To say o-ö: [son/söner]
	if the number-just-said is not 1, say "ö";
	otherwise say "o";
	
To say u-ö: [lus/löss]
	if the number-just-said is not 1, say "ö";
	otherwise say "u";
	
To say å-ä: [gås/gäss]
	if the number-just-said is not 1, say "ä";
	otherwise say "å";


[euphonic and orthographical variants]
To say er-ror: [åd|er/åd|ror]
	if the number-just-said is not 1, say "ror";
	otherwise say "er".			

To say mar: [dröm/dröm|mar]
	if the number-just-said is not 1, say "mar".

To say nar: [man/man|nar]
	if the number-just-said is not 1, say "nar".

To say en-nar: [bott|en/bott|nar]
	if the number-just-said is not 1, say "nar";
	otherwise say "en".

To say on-nar: [morg|on/morg|nar]
	if the number-just-said is not 1, say "nar";
	otherwise say "on".

To say ron-nar: [mor|ron/mor|nar]
	if the number-just-said is not 1, say "nar";
	otherwise say "ron".

To say mar-rar: [som|mar/som|rar]
	if the number-just-said is not 1, say "rar";
	otherwise say "mar".

To say er-rar: [dott|er/dött|rar]
	if the number-just-said is not 1, say "rar";
	otherwise say "er".

To say el-lar: [padd|el/padd|lar]
	if the number-just-said is not 1, say "lar";
	otherwise say "el".

To say mel-lar: [him|mel/him|lar]
	if the number-just-said is not 1, say "lar";
	otherwise say "mel".

To say k-cker: [bo|k/bö|cker]
	if the number-just-said is not 1, say "cker";
	otherwise say "k".

To say mer: [?]
	if the number-just-said is not 1, say "mer".

To say ner: [vän/vän|ner]
	if the number-just-said is not 1, say "ner".

To say ter: [nöt/nötter]
	if the number-just-said is not 1, say "ter".

To say el-ler: [?]
	if the number-just-said is not 1, say "ler";
	otherwise say "el".

To say en-ner: [?]
	if the number-just-said is not 1, say "ner";
	otherwise say "en".

To say er-rer: [?]
	if the number-just-said is not 1, say "rer";
	otherwise say "er".

To say s: [mus/mös|s]
	if the number-just-said is not 1, say "s".	

[Irregular plurals]	
To say far-fäder: [far/fäder]
	if the number-just-said is not 1, say "fäder";
	otherwise say "far".

To say liten-små: [liten/små]
	if the number-just-said is not 1, say "små";
	otherwise say "liten".

To say litet-små: [litet/små]
	if the number-just-said is not 1, say "små";
	otherwise say "litet".


Chapter - Names with articles

Section - Uncapitalisable names

[A/sr5§6 - SR5/1/2]
To say A (particular - an uncapitalisable proper-named object):
	say a particular.

To say An (item - an uncapitalisable non-count object):
	say an item.

To say The (item - an uncapitalisable object):
	say the item.


Section - Suppressing the definite article

[At times we need to prevent the printing of the definite article in the printed name of a thing. We do this (Inform style) by setting either of two global variables: 'indefinite mode' is set by standard Inform 6 code; 'excise article' is set by requiring the definite form of a noun to be said "without (the) definite article".]
To say (the item - an object) without the/-- definite article:
	now excise article is true;
	say "[the item]";
	now excise article is false.

[At times we need to use the weak forms of adjectives are used for the definite species but sometimes we need even in the indefinite.]
To say (item - an object) weakly inflected:
	now weak inflection is true;
	say "[item]";
	now weak inflection is false.


Chapter - Inflections inside printed names 
[The following say phrases help the user specify the definite form of nouns as part of the objects printed name, rather than as a separate text property.]

Section - Deciding whether in definite or indefinite mode

To decide if definite:
	if the indefinite mode is false, decide yes;
	otherwise decide no.

To decide if indefinite:
	if the indefinite mode is true, decide yes;
	otherwise decide no.


Section - Definite and indefinite articles
[The definite articles - Mind the blank space after!]

To say den:
	if the indefinite mode is false and excise article is false, say "den ".

To say det:
	if the indefinite mode is false and excise article is false, say "det ".

To say de:
	if the indefinite mode is false and excise article is false:
		if the dom spelling option is active or the informal spelling option is active, say "dom ";
		otherwise say "de ".


Section - Definite inflections

[Basic forms of inflexions - with examples of inflected nouns, adjectives and participles to show their use]
To say en: [varg/varg|en, hus/hus|en]
	if the indefinite mode is false, say "en".

To say n: [flicka/flicka|n]
	if the indefinite mode is false, say "n".

To say a-en: [materi|a/materi|en]
	if the indefinite mode is false, say "en";
	otherwise say "a".

To say et: [hus/hus|et]
	if the indefinite mode is false, say "et".

To say t: [öga/öga|t]
	if the indefinite mode is false, say "t".

To say na: [apor/apor|na]
	if the indefinite mode is false, say "na".

To say ena: [hus/hus|ena] [Colloquial!]
	if the indefinite mode is false, say "ena".

To say a: [gruvlig/gruvlig|a]
	if the indefinite mode is false or the weak inflection is true, say "a".

To say -a: [äpplen/äpplen|a]
	if the indefinite mode is false, say "a".
[Substantives should not be affected by the the weak inflection being set.]

To say e: [snorkig/snorkig|e, jagad/jagad|e]
	if the indefinite mode is false or the weak inflection is true, say "e".

To say t-a: [viktig|t/viktig|a]
	if the indefinite mode is false or the weak inflection is true, say "a";
	otherwise say "t".


[Orthografical and euphonical forms of the above inflexions]
[substantives (mostly)]
To say men: [dröm/dröm|men]
	if the indefinite mode is false, say "men".

To say met: [rum/rum|met]
	if the indefinite mode is false, say "met".

To say nen: [man/man|nen]
	if the indefinite mode is false, say "nen".

To say net: [can't think of an example or the weak inflection is true, but there might be one]
	if the indefinite mode is false, say "net".

To say en-net: [vatt|en/vatt|net]
	if the indefinite mode is false, say "net";
	otherwise say "en".

To say en-nen: [vap|en/vap|nen]
	if the indefinite mode is false, say "nen";
	otherwise say "en".

To say er-ret: [mörk|er/mörk|ret]
	if the indefinite mode is false, say "ret";
	otherwise say "er".

To say er-ren: [papp|er/papp|ren]
	if the indefinite mode is false, say "ren";
	otherwise say "er".

To say el-let: [tviv|el/tviv|let]
	if the indefinite mode is false, say "let";
	otherwise say "el".

To say el-len: [äck|el/äck|len]
	if the indefinite mode is false, say "len";
	otherwise say "el".

To say mel-len: [him|mel/him|len]
	if the indefinite mode is false, say "len";
	otherwise say "mel".


[adjectives and participles (mostly)]
To say tt-a: [fri|tt/fri|a]
	if the indefinite mode is false or the weak inflection is true, say "a";
	otherwise say "tt".

To say tt: [blå|tt/blå] [In a few cases it's the definite species that is unmarked!]
	unless the weak inflection is true and the indefinite mode is false, say "tt".
[We can't use the condition "if the indefinite mode is true", since we want inform to print things in the indefinite species in certain lists where the indefinite mode is NULL.]

To say t-da: [bestäm|t/bestäm|da]
	if the indefinite mode is false or the weak inflection is true, say "da";
	otherwise say "t".

To say tt-da: [rö|tt/rö|da]
	if the indefinite mode is false or the weak inflection is true, say "da";
	otherwise say "tt".

To say tt-dda: [betro|tt/betro|dda]
	if the indefinite mode is false or the weak inflection is true, say "dda";
	otherwise say "tt".

To say t-de: [jaga|t/jaga|de]
	if the indefinite mode is false or the weak inflection is true, say "de";
	otherwise say "t".

To say ma: [öm/öm|ma]
	if the indefinite mode is false or the weak inflection is true, say "ma".

To say me: [öm/öm|me]
	if the indefinite mode is false or the weak inflection is true, say "me".

To say t-ma: [öm|t/öm|ma]
	if the indefinite mode is false or the weak inflection is true, say "ma";
	otherwise say "t".

To say t-na: [gran|t/gran|na]
	if the indefinite mode is false or the weak inflection is true, say "na";
	otherwise say "t".

To say en-a: [vunn|en/vunn|a]
	if the indefinite mode is false or the weak inflection is true, say "a";
	otherwise say "en".

To say et-a: [vunn|et/vunn|a]
	if the indefinite mode is false or the weak inflection is true, say "a";
	otherwise say "et".

To say en-na: [vak|en/vak|na]
	if the indefinite mode is false or the weak inflection is true, say "na";
	otherwise say "en".

To say en-ne: [vak|en/vak|ne]
	if the indefinite mode is false or the weak inflection is true, say "ne";
	otherwise say "en".

To say et-na: [vak|et/vak|na]
	if the indefinite mode is false or the weak inflection is true, say "na";
	otherwise say "et".

To say er-ra: [vack|er/vack|ra]
	if the indefinite mode is false or the weak inflection is true, say "ra";
	otherwise say "er".

To say er-re: [vack|er/vack|re]
	if the indefinite mode is false or the weak inflection is true, say "re";
	otherwise say "er".

To say ert-ra: [vack|ert/vack|ra]
	if the indefinite mode is false or the weak inflection is true, say "ra";
	otherwise say "ert".

To say el-la: [simp|el/simp|la]
	if the indefinite mode is false or the weak inflection is true, say "la";
	otherwise say "el".

To say el-le: [simp|el/simp|le]
	if the indefinite mode is false or the weak inflection is true, say "le";
	otherwise say "el".

To say elt-la: [simp|elt/simp|la]
	if the indefinite mode is false or the weak inflection is true, say "la";
	otherwise say "elt".

To say mal-la: [gam|mal/gam|la]
	if the indefinite mode is false or the weak inflection is true, say "la";
	otherwise say "mal".

To say mal-le: [gam|mal/gam|le]
	if the indefinite mode is false or the weak inflection is true, say "le";
	otherwise say "mal".

To say malt-la: [gam|malt/gam|la]
	if the indefinite mode is false or the weak inflection is true, say "la";
	otherwise say "malt".

To say ten-lla: [li|ten/li|lla]
	if the indefinite mode is false or the weak inflection is true, say "lla";
	otherwise say "ten".

To say ten-lle: [li|ten/li|lle]
	if the indefinite mode is false or the weak inflection is true, say "lle";
	otherwise say "ten".

To say tet-lla: [li|tet/li|lla]
	if the indefinite mode is false or the weak inflection is true, say "lla";
	otherwise say "tet".

To say liten-lilla: [liten/lilla]
	if the indefinite mode is false or the weak inflection is true, say "lilla";
	otherwise say "liten".

To say liten-lille: [liten/lille]
	if the indefinite mode is false or the weak inflection is true, say "lille";
	otherwise say "liten".

To say litet-lilla: [litet/lilla]
	if the indefinite mode is false or the weak inflection is true, say "lilla";
	otherwise say "litet".


Chapter - Inflections outside printed names

[A term is "endophoric" if it refers back or forth to some other expression in the same linguistic context (the current sentence, utterance, text or conversation – or interactive fiction).]

Section - Strong inflections of adjectives, participles and pronouns

To say -t-a for (item - an object): [oätlig/oätlig|t/oätlig|a, vit/vit|t/vit|a, vår/vår|t/vår|a]
	now the endophoric reference is the item;
	if the item is plural-named:
		say "a";
	otherwise if the item is neuter:
		 say "t".

To say -t-a:
	say -t-a for the endophoric reference.

To say -t-ma for (item - an object): [tom/tom|t/tom|ma]
	now the endophoric reference is the item;
	if the item is plural-named:
		say "ma";
	otherwise if the item is neuter:
		 say "t".

To say -t-ma:
	say -t-ma for the endophoric reference.

To say -tt-a for (item - an object): [fri/fri|tt/fri|a]
	now the endophoric reference is the item;
	if the item is plural-named:
		say "a";
	otherwise if the item is neuter:
		say "tt".

To say -tt-a:
	say -tt-a for the endophoric reference.

To say -tt- for (item - an object): [blå/blå|tt/blå]
	now the endophoric reference is the item;
	if the item is neuter and the item is not plural-named:
		say "tt".

To say -tt-:
	say -tt- for the endophoric reference.

To say d-t-da for (item - an object): [stäng|d/stäng|t/stäng|da]
	now the endophoric reference is the item;
	if the item is plural-named:
		say "da";
	otherwise if the item is neuter:
		 say "t";
	otherwise:
		say "d".

To say d-t-da:
	say d-t-da for the endophoric reference.

To say d-tt-da for (item - an object): [rö|d/rö|tt/rö|da]
	now the endophoric reference is the item;
	if the item is plural-named:
		say "da";
	otherwise if the item is neuter:
		say "tt";
	otherwise:
		say "d".

To say d-tt-da:
	say d-tt-da for the endophoric reference.

To say dd-tt-dda for (item - an object): [betro|dd/betro|tt/betro|dda]
	now the endophoric reference is the item;
	if the item is plural-named:
		say "dda";
	otherwise if the item is neuter:
		say "tt";
	otherwise:
		say "dd".

To say dd-tt-dda:
	say dd-tt-dda for the endophoric reference.

To say --a for (item - an object): [låst/låst/låst|a]
	now the endophoric reference is the item;
	if the item is plural-named:
		say "a".

To say --a:
	say --a for the endophoric reference.

To say n-t-na for (item - an object): [gran|n/gran|t/gran|na]
	now the endophoric reference is the item;
	if the item is plural-named:
		say "na";
	otherwise if the item is neuter:
		say "t";
	otherwise:
		say "n".

To say n-t-na:
	say n-t-na for the endophoric reference.

To say en-et-na for (item - an object): [öpp|en/öpp|et/öpp|na]
	now the endophoric reference is the item;
	if the item is plural-named:
		say "na";
	otherwise if the item is neuter:
		 say "et";
	otherwise:
		say "en".

To say en-et-na:
	say en-et-na for the endophoric reference.

To say en-et-a for (item - an object): [vunn|en/vunn|et/vunn|a; vilk|en/vilk|et/vilk|a]
	now the endophoric reference is the item;
	if the item is plural-named:
		say "a";
	otherwise if the item is neuter:
		say "et";
	otherwise:
		say "en".

To say en-et-a:
	say en-et-a for the endophoric reference.

To say ten-tet-lla for (item - an object): [li|ten/li|tet/li|lla]
	now the endophoric reference is the item;
	if the item is plural-named:
		say "lla";
	otherwise if the item is neuter:
		say "tet";
	otherwise:
		say "ten".

To say ten-tet-lla:
	say ten-tet-lla for the endophoric reference.

To say liten-litet-lilla for (item - an object): [li|ten/li|tet/li|lla]
	now the endophoric reference is the item;
	if the item is plural-named:
		say "lilla";
	otherwise if the item is neuter:
		say "litet";
	otherwise:
		say "liten".

To say liten-litet-lilla:
	say liten-litet-lilla for the endophoric reference.

To say liten-litet-små for (item - an object): [li|ten/li|tet/små]
	now the endophoric reference is the item;
	if the item is plural-named:
		say "små";
	otherwise if the item is neuter:
		say "litet";
	otherwise:
		say "liten".

To say liten-litet-små:
	say liten-litet-små for the endophoric reference.

To say er-ert-ra for (item - an object): [vack|er/vack|ert/vack|ra]
	now the endophoric reference is the item;
	if the item is plural-named:
		say "ra";
	otherwise if the item is neuter:
		say "ert";
	otherwise:
		say "er".

To say er-ert-ra:
	say er-ert-ra for the endophoric reference.

To say el-elt-la for (item - an object): [simp|el/simp|elt/simp|la]
	now the endophoric reference is the item;
	if the item is plural-named:
		say "la";
	otherwise if the item is neuter:
		say "elt";
	otherwise:
		say "el".

To say el-elt-la:
	say el-elt-la for the endophoric reference.

To say mal-malt-la for (item - an object): [gam|mal/gam|malt/gam|la]
	now the endophoric reference is the item;
	if the item is plural-named:
		say "la";
	otherwise if the item is neuter:
		say "malt";
	otherwise:
		say "mal".

To say mal-malt-la:
	say mal-malt-la for the endophoric reference.

To say d-t-de for (item - an object): [jaga|d/jaga|t/jaga|de]
	now the endophoric reference is the item;
	if the item is plural-named:
		say "de";
	otherwise if the item is neuter:
		say "t";
	otherwise:
		say "d".

To say d-t-de:
	say d-t-de for the endophoric reference.


Section - Weak inflection of adjectives

To say a-e for (item - an object):
	now the endophoric reference is the item;
	if the item is male and the item is not plural-named, say "e";
	otherwise say "a".

To say a-e:
	say a-e for the endophoric reference:


Section - Adjectival inflections of pronouns
[Only endings for inflections not already defined will be found here.]

To say n-tt-na for (item - an object): [di|n/di|tt/di|na]
	now the endophoric reference is the item;
	if the item is plural-named:
		say "na";
	otherwise if the item is neuter:
		say "tt";
	otherwise:
		say "n".

To say n-tt-na:
	say n-tt-na for the endophoric reference.

[To say min-mitt-mina for (item - an object): [mi|n/mi|tt/mi|na]
	now the endophoric reference is the item;
	if the item is plural-named:
		say "mina";
	otherwise if the item is neuter:
		say "mitt";
	otherwise:
		say "min".

To say min-mitt-mina:
	say min-mitt-mina for the endophoric reference.

To say Min-Mitt-Mina for (item - an object): [Mi|n/Mi|tt/Mi|na]
	now the endophoric reference is the item;
	if the item is plural-named:
		say "Mina";
	otherwise if the item is neuter:
		say "Mitt";
	otherwise:
		say "Min".

To say Min-Mitt-Mina:
	say Min-Mitt-Mina for the endophoric reference.

To say din-ditt-dina for (item - an object): [di|n/di|tt/di|na]
	now the endophoric reference is the item;
	if the item is plural-named:
		say "dina";
	otherwise if the item is neuter:
		say "ditt";
	otherwise:
		say "din".

To say din-ditt-dina:
	say din-ditt-dina for the endophoric reference.

To say Din-Ditt-Dina for (item - an object): [Di|n/Di|tt/Di|na]
	now the endophoric reference is the item;
	if the item is plural-named:
		say "Dina";
	otherwise if the item is neuter:
		say "Ditt";
	otherwise:
		say "Din".

To say Din-Ditt-Dina:
	say Din-Ditt-Dina for the endophoric reference.

To say sin-sitt-sina for (item - an object): [si|n/si|tt/si|na]
	now the endophoric reference is the item;
	if the item is plural-named:
		say "sina";
	otherwise if the item is neuter:
		say "sitt";
	otherwise:
		say "sin".

To say sin-sitt-sina:
	say sin-sitt-sina for the endophoric reference.

To say Sin-Sitt-Sina for (item - an object): [Si|n/Si|tt/Si|na]
	now the endophoric reference is the item;
	if the item is plural-named:
		say "Sina";
	otherwise if the item is neuter:
		say "Sitt";
	otherwise:
		say "Sin".

To say Sin-Sitt-Sina:
	say Sin-Sitt-Sina for the endophoric reference.]

To say an-at-a for (item - an object): [vår|an/vår|at/vår|a] [Colloquial!]
	now the endophoric reference is the item;
	if the item is plural-named:
		say "a";
	otherwise if the item is neuter:
		say "at";
	otherwise:
		say "an".

To say an-at-a:
	say an-at-a for the endophoric reference.

To say nan-nat-dra for (item - an object): [an|nan/an|nat/an|dra] 
	now the endophoric reference is the item;
	if the item is plural-named:
		say "dra";
	otherwise if the item is neuter:
		say "nat";
	otherwise:
		say "nan".

To say nan-nat-dra:
	say nan-nat-dra for the endophoric reference.

To say n-t- for (item - an object): [de|n/de|t/de] 
	now the endophoric reference is the item;
	if the item is plural-named:
		say "";
	otherwise if the item is neuter:
		say "t";
	otherwise:
		say "n".

To say n-t-:
	say n-t- for the endophoric reference.

To say n-t-m for (item - an object): [de|n/de|t/de|m] 
	now the endophoric reference is the item;
	if the item is plural-named:
		say "m";
	otherwise if the item is neuter:
		say "t";
	otherwise:
		say "n".

To say n-t-m:
	say n-t-m for the endophoric reference.

To say en-et-om for (item - an object): [d|en/d|et/d|om] 
	now the endophoric reference is the item;
	if the item is plural-named:
		say "om";
	otherwise if the item is neuter:
		say "et";
	otherwise:
		say "en".

To say en-et-om:
	say en-et-om for the endophoric reference.

To say den-t- for (item - an object): [den/det/de, den/det/dom]
	now the endophoric reference is the item;
	if the item is plural-named:
		say "[de-dom]";
	otherwise if the item is neuter:
		say "det";
	otherwise:
		say "den".

To say den-t-:
	say den-t- for the endophoric reference.

To say Den-t- for (item - an object): [Den/Det/De, Den/Det/Dom]
	now the endophoric reference is the item;
	if the item is plural-named:
		say "[De-Dom]";
	otherwise if the item is neuter:
		say "Det";
	otherwise:
		say "Den".

To say Den-t-:
	say Den-t- for the endophoric reference.

To say den-t-m for (item - an object): [den/det/dem, den/det/dom]
	now the endophoric reference is the item;
	if the item is plural-named:
		say "[dem]";
	otherwise if the item is neuter:
		say "det";
	otherwise:
		say "den".

To say den-t-m:
	say den-t-m for the endophoric reference.

To say Den-t-m  for (item - an object): [Den/Det/Dem, Den/Det/Dom]
	now the endophoric reference is the item;
	if the item is plural-named:
		say "[Dem]";
	otherwise if the item is neuter:
		say "Det";
	otherwise:
		say "Den".

To say Den-t-m:
	say Den-t-m for the endophoric reference.

To say den-det-de for (item - an object): [den/det/de, den/det/dom]
	now the endophoric reference is the item;
	if the item is plural-named:
		say "[de-dom]";
	otherwise if the item is neuter:
		say "det";
	otherwise:
		say "den".

To say den-det-de:
	say den-det-de for the endophoric reference.

To say Den-Det-De for (item - an object): [Den/Det/De, Den/Det/Dom]
	now the endophoric reference is the item;
	if the item is plural-named:
		say "[De-Dom]";
	otherwise if the item is neuter:
		say "Det";
	otherwise:
		say "Den".

To say Den-Det-De:
	say Den-Det-De for the endophoric reference.

To say den-det-dem for (item - an object): [den/det/dem, den/det/dom]
	now the endophoric reference is the item;
	if the item is plural-named:
		say "[dem]";
	otherwise if the item is neuter:
		say "det";
	otherwise:
		say "den".

To say den-det-dem:
	say den-det-dem for the endophoric reference.

To say Den-Det-Dem  for (item - an object): [Den/Det/Dem, Den/Det/Dom]
	now the endophoric reference is the item;
	if the item is plural-named:
		say "[Dem]";
	otherwise if the item is neuter:
		say "Det";
	otherwise:
		say "Den".

To say Den-Det-Dem:
	say Den-Det-Dem for the endophoric reference.

To say nna-tta-ssa for (item - an object):
	now the endophoric reference is the item;
	if the item is plural-named:
		say "ssa";
	otherwise if the item is neuter:
		say "tta";
	otherwise if the item is male:
		say "nne";
	otherwise:
		say "nna".

To say nna-tta-ssa:
	say nna-tta-ssa for the endophoric reference.

To say sådan-t-a for (item - an object):
	now the endophoric reference is the item;
	if the sån spelling option is active, say "sån";
	otherwise say "sådan";
	say -t-a for the item.

To say sådan-t-a:
	say sådan-t-a for the endophoric reference.

To say Sådan-t-a for (item - an object):
	now the endophoric reference is the item;
	if the sån spelling option is active, say "Sån";
	otherwise say "Sådan";
	say -t-a for the item.

To say Sådan-t-a:
	say Sådan-t-a for the endophoric reference.

To say on-ot-ra for (item - an object): [någ|on/någ|ot/någ|ra]
	now the endophoric reference is the item;
	if the item is plural-named:
		say "ra";
	otherwise if the item is neuter:
		say "ot";
	otherwise:
		say "on".

To say on-ot-ra:
	say on-ot-ra for the endophoric reference.

To say n-t-ra for (item - an object): [nå|n/nå|t/nå|ra]
	now the endophoric reference is the item;
	if the item is plural-named:
		say "ra";
	otherwise if the item is neuter:
		say "t";
	otherwise:
		say "n".

To say n-t-ra:
	say n-t-ra for the endophoric reference.

To say någon-ot-ra for (item - an object):
	now the endophoric reference is the item;
	say "nå";
	if the nån spelling option is active:
		if the noun is plural-named:
			say "ra";
		otherwise if the item is neuter:
			say "t";
		otherwise:
			say "n";
	otherwise:
		if the item is plural-named:
			say "gra";
		otherwise if the item is neuter:
			say "got";
		otherwise:
			say "gon".

To say någon-ot-ra:
	say någon-ot-ra for the endophoric reference.

To say Någon-ot-ra for (item - an object):
	now the endophoric reference is the item;
	say "Nå";
	if the nån spelling option is active:
		if the item is plural-named:
			say "ra";
		otherwise if the item is neuter:
			say "t";
		otherwise:
			say "n";
	otherwise:
		if the item is plural-named:
			say "gra";
		otherwise if the item is neuter:
			say "got";
		otherwise:
			say "gon".

To say Någon-ot-ra:
	say Någon-ot-ra for the endophoric reference.


Section - Adjectival inflections of articles

To say den-det for (item - an object):
	now the endophoric reference is the item;
	if the item is plural-named:
		say "[de-dom]";
	otherwise if the item is neuter:
		say "det";
	otherwise:
		say "den".

To say den-det:
	say den-det for the endophoric reference.

To say Den-Det for (item - an object):
	now the endophoric reference is the item;
	if the item is plural-named:
		say "[De-Dom]";
	otherwise if the item is neuter:
		say "Det";
	otherwise:
		say "Den".

To say Den-Det:
	say Den-Det for the endophoric reference.

To say en-ett for (item - an object):
	now the endophoric reference is the item;
	if the item provides an indefinite article and the indefinite article of the item is not "":
		say "[indefinite article of item]";
	otherwise if the item is not non-count:
		if the item is plural-named:
			say "[några]";
		otherwise if the item is neuter:
			say "ett";
		otherwise:
			say "en".

To say en-ett:
	say en-ett for the endophoric reference.

To say En-Ett for (item - an object):
	now the endophoric reference is the item;
	if the item provides an indefinite article and the indefinite article of the item is not "":
		say "[indefinite article of item]" in sentence case;
	otherwise if the item is plural-named:
		say "[Några]";
	otherwise if the item is neuter:
		say "Ett";
	otherwise:
		say "En".

To say En-Ett:
	say En-Ett for the endophoric reference.

To say n-tt- for (item - an object): [e|n/e|tt/--] 
	now the endophoric reference is the item;
	if the item is plural-named:
		say "";
	otherwise if the item is neuter:
		say "tt";
	otherwise:
		say "n".

To say n-tt-:
	say n-tt- for the endophoric reference.


Chapter - Spelling Variants

To say dagen:
	if the dan spelling option is active or the informal spelling option is active, say "dan";
	otherwise say "dagen".
To say dagar:
	if the dan spelling option is active or the informal spelling option is active, say "dar";
	otherwise say "dagar".
	
To say mig:
	if the dej spelling option is active or the informal spelling option is active, say "mej";
	otherwise say "mig".
To say dig:
	if the dej spelling option is active or the informal spelling option is active, say "dej";
	otherwise say "dig".
To say sig:
	if the dej spelling option is active or the informal spelling option is active, say "sej";
	otherwise say "sig".
To say Mig:
	if the dej spelling option is active or the informal spelling option is active, say "Mej";
	otherwise say "Mig".
To say Dig:
	if the dej spelling option is active or the informal spelling option is active, say "Dej";
	otherwise say "Dig".
To say Sig:
	if the dej spelling option is active or the informal spelling option is active, say "Sej";
	otherwise say "Sig".


To say de-dom:
	if the dom spelling option is active or the informal spelling option is active, say "dom";
	otherwise say "de".
To say dem:
	if the dom spelling option is active or the informal spelling option is active, say "dom";
	otherwise say "dem".
To say De-Dom:
	if the dom spelling option is active or the informal spelling option is active, say "Dom";
	otherwise say "De".
To say Dem:
	if the dom spelling option is active or the informal spelling option is active, say "Dom";
	otherwise say "Dem".

To say gett:
	if the givit spelling option is active or the formal spelling option is active, say "givit";
	otherwise say "gett".

To say lade:
	if the la spelling option is active or the informal spelling option is active, say "la";
	otherwise say "lade".

To say lite:
	if the litet spelling option is active or the formal spelling option is active, say "litet";
	otherwise say "lite".
To say Lite:
	if the litet spelling option is active or the formal spelling option is active, say "Litet";
	otherwise say "Lite".

To say morgon:
	if the morron spelling option is active or the informal spelling option is active, say "morron";
	otherwise say "morgon".
To say morgonen:
	if the morron spelling option is active or the informal spelling option is active, say "morronen";
	otherwise say "morgonen".
To say morgnar:
	if the morron spelling option is active or the informal spelling option is active, say "mornar";
	otherwise say "morgnar".

To say ned:
	if the ner spelling option is active, say "ner";
	otherwise say "ned".
To say Ned:
	if the ner spelling option is active, say "Ner";
	otherwise say "Ned".
To say nedför:
	if the ner spelling option is active, say "nerför";
	otherwise say "nedför".
To say nedåt:
	if the ner spelling option is active, say "neråt";
	otherwise say "nedåt".

To say någon:
	if the nån spelling option is active or the informal spelling option is active, say "nån";
	otherwise say "någon".
To say något:
	if the nån spelling option is active or the informal spelling option is active, say "nåt";
	otherwise say "något".
To say några:
	if the nån spelling option is active or the informal spelling option is active, say "nåra";
	otherwise say "några".
To say Någon:
	if the nån spelling option is active or the informal spelling option is active, say "Nån";
	otherwise say "Någon".
To say Något:
	if the nån spelling option is active or the informal spelling option is active, say "Nåt";
	otherwise say "Något".
To say Några:
	if the nån spelling option is active or the informal spelling option is active, say "Nåra";
	otherwise say "Några".
To say någonsin:
	if the nån spelling option is active or the informal spelling option is active, say "nånsin";
	otherwise say "någonsin".
To say någonstans:
	if the nån spelling option is active or the informal spelling option is active, say "nånstans";
	otherwise say "någonstans".
To say någonting:
	if the nån spelling option is active or the informal spelling option is active, say "nånting";
	otherwise say "någonting".
To say någonvart:
	if the nån spelling option is active or the informal spelling option is active, say "nånvart";
	otherwise say "någonvart".

To say sedan:
	if the sen spelling option is active or the informal spelling option is active, say "sen";
	otherwise say "sedan".
To say Sedan:
	if the sen spelling option is active or the informal spelling option is active, say "Sen";
	otherwise say "Sedan".

To say ska:
	if the skall spelling option is active or the formal spelling option is active, say "skall";
	otherwise say "ska".

To say sådan:
	if the sån spelling option is active or the informal spelling option is active, say "sån";
	otherwise say "sådan".
To say Sådan:
	if the sån spelling option is active or the informal spelling option is active, say "Sån";
	otherwise say "Sådan".
To say sådant:
	if the sån spelling option is active or the informal spelling option is active, say "sånt";
	otherwise say "sådant".
To say sådana:
	if the sån spelling option is active or the informal spelling option is active, say "såna";
	otherwise say "sådana".

To say säga:
	if the säja spelling option is active or the informal spelling option is active, say "säja";
	otherwise say "säga".
To say säg:
	if the säja spelling option is active or the informal spelling option is active, say "säj";
	otherwise say "säg".
To say säger:
	if the säja spelling option is active or the informal spelling option is active, say "säjer";
	otherwise say "säger".

To say sade:
	if the sa spelling option is active or the säja spelling option is active or the informal spelling option is active, say "sa";
	otherwise say "sade".

To say varandra:
	if the varann spelling option is active or the informal spelling option is active, say "varann";
	otherwise say "varandra".


Section - Understanding the printed name of an object

[These phrases are called by the I6 LanguageRefers() routine. They match the printed name or indexed name of a given object in scope (the LR-formal-supposition -- LR_object in I6) against a would-be noun in the player's command (the LR-material-supposition, which is yet another I7 name for the I6 parameter_object variable).]

To decide if the printed name is understood:
	let numbawords be the number of words in the printed name of LR-formal-supposition;
	repeat with wordnumba running from 1 to numbawords:
		if word number wordnumba in the printed name of the LR-formal-supposition exactly matches the text LR-material-supposition, case insensitively:
			decide yes.

To decide if the indexed name is understood:
	let numbawords be the number of words in the indexed name of LR-formal-supposition;
	repeat with wordnumba running from 1 to numbawords:
		if word number wordnumba in the indexed name of the LR-formal-supposition exactly matches the text "di[n-tt-na for LR-formal-supposition]" and LR-material-supposition exactly matches the text "mi[n-tt-na for LR-formal-supposition]", case insensitively:
			decide yes;
		if word number wordnumba in the indexed name of the LR-formal-supposition exactly matches the text LR-material-supposition, case insensitively:
			decide yes.


Book  - Swedish Template Layer

Chapter - Output

Section - Other Configuration
[B/outt§2]

Include (-
#Ifdef TARGET_ZCODE;
Zcharacter table + '@{2013}';
Zcharacter table + '@{201d}';
Zcharacter table + '@{2026}';
Zcharacter "abcdefghijklmnoprstuvxy@oa@:a@:o"
           "ABCDEFGHIJKLMNOPRSTUVXY@oA@:A@:O"
           "0123456789,;:.?!@{2026}-@{2013}()’@{201d}" ;
#Endif;
-) before "Other Configuration" in "Output.i6t".
[Making the following characters cheaper on the Z-machine:
abcdefghijklmnoprstuvxyåäö
ABCDEFGHIJKLMNOPRSTUVXYÅÄÖ
0123456789,;:.?!…-–()’”]

Section - Global Variables
[B/outt§6]

Include (- 
Global num_quant = false; ! = I7 "numerical quantifiers"
Global neutrum = false;   ! = I7 "neutrum"

Global exc_art = false;   ! = I7 "excise article"
-) after "Global Variables" in "Output.i6t". 


Section - Grammar
[B/outt§32]

Include (-
{-log:Compiling I6 Verb directives} 
{-call:Plugins::Parsing::Verbs::compile_all} 

#IFTRUE ({-value:no_verb_verb_defined} == 1); 
[ UnknownVerb; verb_wordnum = 0; return ’no.verb’; ]; 
[ PrintVerb v; 
    if (v == ’no.verb’) { print "göra "; naagot(); print " med"; rtrue; } 
    rfalse; 
]; 
#Ifnot; 
[ UnknownVerb; rfalse; ]; [ PrintVerb v; rfalse; ]; 
#ENDIF;
-) instead of "Grammar" in "Output.i6t".


Chapter - Definitions

Section - Powers of Two
[B/dfnt§5]

[The PowersOfTwo array is used by the Pronoun Handling routine and needs as many entries as there are GNAs in the language: 12 in English, 16 in Swedish.]

Include (-
Array PowersOfTwo_TB
  --> $$1000000000000000
      $$0100000000000000
      $$0010000000000000
      $$0001000000000000
      $$0000100000000000
      $$0000010000000000
      $$0000001000000000
      $$0000000100000000
      $$0000000010000000
      $$0000000001000000
      $$0000000000100000
      $$0000000000010000
      $$0000000000001000
      $$0000000000000100
      $$0000000000000010
      $$0000000000000001;

Array IncreasingPowersOfTwo_TB
  --> $$0000000000000001
      $$0000000000000010
      $$0000000000000100
      $$0000000000001000
      $$0000000000010000
      $$0000000000100000
      $$0000000001000000
      $$0000000010000000
      $$0000000100000000
      $$0000001000000000
      $$0000010000000000
      $$0000100000000000
      $$0001000000000000
      $$0010000000000000
      $$0100000000000000
      $$1000000000000000;
-) instead of "Powers of Two" in "Definitions.i6t".


Section - Template Attributes
[B/dfnt§26]

Include (-
Attribute short_name_understood; ! flags objects to be understood by their printed name
Attribute common; ! common gender; not a translation of I7's "common-gendered" property! 
-) after "Template Attributes" in "Definitions.i6t"


Chapter - Parser

Section - Descriptors
[B/parst§30]

[We need to replace the "Descriptors" section since in it the global variable indef_cases is initialized to a 12-bit array. We need to make it a 16-bit array, since it will later (in the course of deciding what pronouns refer to what object) be matched to the PowersOfTwo array, which in turn we have expanded to sixteen bits to match the sixteen possible GNAs of Swedish.]

Include (-
Constant OTHER_BIT  =   1;     !  These will be used in Adjudicate()
Constant MY_BIT     =   2;     !  to disambiguate choices
Constant THAT_BIT   =   4;
Constant PLURAL_BIT =   8;
Constant LIT_BIT    =  16;
Constant UNLIT_BIT  =  32;

[ ResetDescriptors;
    indef_mode = 0; indef_type = 0; indef_wanted = 0; indef_guess_p = 0;
    indef_possambig = false;
    indef_owner = nothing;
!#    indef_cases = $$111111111111;
    indef_cases = $$1111111111111111;
    indef_nspec_at = 0;
];

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
];
-) instead of "Descriptors" in "Parser.i6t".


Section - Print Command
[B/parst§42]

Include (- 
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
];

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
        if (i >= REPARSE_CODE) {
!# We note reflexive pronouns in the player's command and convert them to the corresponding pronouns approppriate for parser errors.
            if (VM_NumberToDictionaryAddress(i-REPARSE_CODE) == ME1__WD             !#
             || VM_NumberToDictionaryAddress(i-REPARSE_CODE) == ME2__WD)            !#
                print (string) YOURSELF__TX;                                        !#
            else if (VM_NumberToDictionaryAddress(i-REPARSE_CODE) == YOU1__WD       !#
                  || VM_NumberToDictionaryAddress(i-REPARSE_CODE) == YOU2__WD) {    !#
                     if (actor == player) print (string) YOURSELF__TX;              !#
                     else print (string) ONESELF__TX;                               !#
                 }       
!# For the possibility that some player enters a command like "Klä på sig" or "Kejsare, klä på sig".                                                          
            else if (VM_NumberToDictionaryAddress(i-REPARSE_CODE) == ONESELF1__WD       !#     
                  || VM_NumberToDictionaryAddress(i-REPARSE_CODE) == ONESELF2__WD) {    !# 
                     if (actor == player) print (string) YOURSELF__TX;                  !# 
                     else print (string) ONESELF__TX;                                   !# 
                 }                                                                      !#  
            else                                                                        !#
                print (address) VM_NumberToDictionaryAddress(i-REPARSE_CODE);
        }
        else
            if (i ofclass K3_direction)
                print (LanguageDirection) i; ! the direction name as adverb
            else
                print (the) i;
      .TokenPrinted;
        spacing_flag = true;
    }
];
-) instead of "Print Command" in "Parser.i6t".


Section - Refers
[B/parst§53]

[We define a LanguageRefers routine to make sure that the Swedish translation understands the short_name (printed name) of objects, as the author normally will give the definite forms of object names there. This mirrors the standard I6 Refers routine but adds an else block that tries to match the input word (the value of parameter_object) against each word in the printed name of a given object in scope (the value of LR_object), using both the definite and the indefinite forms of the printed name (that's why we we change the indef_mode global). We also match the input word against the words in the "indexed name" given by the present extension to certain objects that Inform automatically gives an English name. The routine relies on I7 phrases that match indexed texts against each other.]

Include (-
Global LR_object = nothing;

[ LanguageRefers obj wnum   wd k po spec_mode;
  if (obj == 0) rfalse;
!# if parser_inflection is set to a routine, run it 
  k = wn; wn = wnum; wd = NextWordStopped(); wn = k;
  if (parser_inflection >= 256) {
      k = indirect(parser_inflection, obj, wd);
      if (k >= 0) return k;
  }
!# if parser_inflection is set to a property (by default it's set to the name property), look in it for our word
  k = WordInProperty(wd, obj, parser_inflection);
  if (k>0) rtrue;
!# and if we don't find the word we look for in that property, check the object's indexed name property or short_name (i.e. the I7 printed name)
  else if (obj has short_name_understood) {    
      LR_object = obj; po = parameter_object; spec_mode = indef_mode;
      parameter_object = INDEXED_TEXT_TY_Create(); 
      INDEXED_TEXT_TY_Cast(wnum*100+1, SNIPPET_TY, parameter_object);

      k = (+ whether or not the indexed name is understood +); 
      if (k>0) { 
          parameter_object = po; 
          rtrue; 
      }
      k = (+ whether or not the printed name is understood +); 
      if (k>0) { 
          parameter_object = po; 
          rtrue; 
      }
      if (indef_mode == false) indef_mode = true; 
      else indef_mode = false; 
      k = (+ whether or not the printed name is understood +); 
      indef_mode = spec_mode; parameter_object = po;
      if (k>0) rtrue; 
      else rfalse; 
  }
  else rfalse;
];
-) before "Refers" in "Parser.i6t". 


Section - Extended TryNumber
[B/parst§56]

Include (-
[ I7_ExtendedTryNumber wordnum i j; 
  i = wn; wn = wordnum; j = NextWordStopped(); wn = i; 
  switch (j) { 
      'tjugofem': return 25; 
      'tjugosex': return 26; 
      'tjugosju': return 27; 
      'tjugoåtta': return 28; 
      'tjugonio': return 29; 

      'trettio': return 30; 
      'trettioen': return 31; 
      'trettioett': return 31; 
      'trettiotvå': return 32; 
      'trettiotre': return 33; 
      'trettiofyra': return 34; 

      'trettiofem': return 35; 
      'trettiosex': return 36; 
      'trettiosju': return 37; 
      'trettioåtta': return 38; 
      'trettionio': return 39; 

      'fyrtio': return 40; 
      'fyrtioen': return 41; 
      'fyrtioett': return 41; 
      'fyrtiotvå': return 42; 
      'fyrtiotre': return 43; 
      'fyrtiofyra': return 44; 

      'fyrtiofem': return 45; 
      'fyrtiosex': return 46; 
      'fyrtiosju': return 47; 
      'fyrtioåtta': return 48; 
      'fyrtionio': return 49; 

      'femtio': return 50; 
      'femtioen': return 51; 
      'femtioett': return 51; 
      'femtiotvå': return 52; 
      'femtiotre': return 53; 
      'femtiofyra': return 54; 

      'femtiofem': return 55; 
      'femtiosex': return 56; 
      'femtiosju': return 57; 
      'femtioåtta': return 58; 
      'femtionio': return 59; 

      'sextio': return 60;

      default: return TryNumber(wordnum); 
  } 
]; 
-) instead of "Extended TryNumber" in "Parser.i6t".


Section - Gender
[B/parst§57]

[The GetGNAOFObject codes the gender/number/animation combination of an object (see the Inform Designer's Manual, 4th edition). It needs to be adjusted to accomodate all four Swedish genders.
(The Gender section of the Parser Template also includes a GetGender routine to decide whether persons are male or female. That routine seems unused but, for the sake of completeness, we include it here together with a similar one to decide whether things are common gender or neuter.)]

Include (-
[ GetGender person;
    if (person hasnt female) rtrue;
    rfalse;
];

[ GetGrammaticalGender thing;
    if (thing hasnt neuter) rtrue;
    rfalse;
];

[ GetGNAOfObject obj case gender;
!    if (obj hasnt animate)  case = 6;    !#
    if (obj hasnt animate)  case = 8;    !# There are 8 animate (and 8 inanimate) gender–number combinations in Swedish (only 6 in English).
    if (obj has male)     gender = male;
    if (obj has female)   gender = female;
    if (obj has common)   gender = common;    !# Adding common gender
    if (obj has neuter)   gender = neuter;
    if (gender == 0) {
        if (case == 0)    gender = LanguageAnimateGender;
        else              gender = LanguageInanimateGender;
    }
    if (gender == female)   case = case + 1;
!    if (gender == neuter)   case = case + 2;    !#             
!    if (obj has pluralname) case = case + 3;    !#
    if (gender == common)   case = case + 2;    !# Adding common gender.
    if (gender == neuter)   case = case + 3;    !# And making the needed changes to neuters
    if (obj has pluralname) case = case + 4;    !# and plurals.
    return case;
];
-) instead of "Gender" in "Parser.i6t".


Chapter - ListWriter

Section - Write After Entry
[B/lwt§18]

[In English relative pronouns distinguish between people and non-people but do not inflect with gender or number; in Swedish the contrary is true. We therefore need to replace the use here of the two Short Texts constants WHOM__TX and WHICH__TX with three custom Swedish ones (WHICH__TX, WHICH2__TX and WHICH3__TX).]

Include (-
[ WriteAfterEntry o depth
    p recurse_flag parenth_flag eldest_child child_count combo;

    inventory_stage = 2;
    if (c_style & PARTINV_BIT) {
        BeginActivity(PRINTING_ROOM_DESC_DETAILS_ACT);
        if (ForActivity(PRINTING_ROOM_DESC_DETAILS_ACT) == false) {

        combo = 0;
        if (o has light && location hasnt light) combo=combo+1;
        if (o has container && o hasnt open)     combo=combo+2;
        if ((o has container && (o has open || o has transparent))
            && (child(o)==0))                    combo=combo+4;
        if (combo) L__M(##ListMiscellany, combo, o);
        }
        EndActivity(PRINTING_ROOM_DESC_DETAILS_ACT);
    }   ! end of PARTINV_BIT processing

    if (c_style & FULLINV_BIT) {
        if (o has light && o has worn) { L__M(##ListMiscellany, 8, o);  parenth_flag = true; }
        else {
            if (o has light)           { L__M(##ListMiscellany, 9, o);  parenth_flag = true; }
            if (o has worn)            { L__M(##ListMiscellany, 10, o); parenth_flag = true; }
        }

        if (o has container)
            if (o has openable) {
                if (parenth_flag) {
                	#Ifdef SERIAL_COMMA; print ","; #Endif;
                	print (string) AND__TX;
                } else            L__M(##ListMiscellany, 11, o);
                if (o has open)
                    if (child(o)) L__M(##ListMiscellany, 12, o);
                    else          L__M(##ListMiscellany, 13, o);
                else
                    if (o has lockable && o has locked) L__M(##ListMiscellany, 15, o);
                    else                                L__M(##ListMiscellany, 14, o);
                parenth_flag = true;
            }
            else
                if (child(o)==0 && o has transparent)
                    if (parenth_flag) L__M(##ListMiscellany, 16, o);
                    else              L__M(##ListMiscellany, 17, o);

        if (parenth_flag) print ")";
    }   ! end of FULLINV_BIT processing

	child_count = 0;
	eldest_child = nothing;
	objectloop (p in o)
		if ((c_style & CONCEAL_BIT == 0) || (p hasnt concealed && p hasnt scenery))
			if (p has list_filter_permits) {
				child_count++;
				if (eldest_child == nothing) eldest_child = p;
			}

    if (child_count && (c_style & ALWAYS_BIT)) {
        if (c_style & ENGLISH_BIT) L__M(##ListMiscellany, 18, o);
        recurse_flag = true;
    }
    
    if (child_count && (c_style & RECURSE_BIT)) {
        if (o has supporter) {
            if (c_style & ENGLISH_BIT) {
                if (c_style & TERSE_BIT) L__M(##ListMiscellany, 19, o);
                else                     L__M(##ListMiscellany, 20, o);
!# Swedish makes no distincition between "whom" and "which".
!                if (o has animate)       print (string) WHOM__TX;     !# 
!                else                     print (string) WHICH__TX;    !#
!# But the word it uses for both is inflected.
                if (o has pluralname)    print (string) WHICH3__TX;    !#
                else {                                                 !#
                     if (o has neuter)   print (string) WHICH2__TX;    !#
                     else                print (string) WHICH__TX;     !#
                     }                                                 !#
            }
            recurse_flag = true;
        }
        if (o has container && (o has open || o has transparent)) {
            if (c_style & ENGLISH_BIT) {
                if (c_style & TERSE_BIT) L__M(##ListMiscellany, 21, o);
                else                     L__M(##ListMiscellany, 22, o);
!# Ditto
!                if (o has animate)       print (string) WHOM__TX;    !#
!                else                     print (string) WHICH__TX;   !#
!# Ditto
                if (o has pluralname)    print (string) WHICH3__TX;   !#
                else {                                                !#
                     if (o has neuter)   print (string) WHICH2__TX;   !#
                     else                print (string) WHICH__TX;    !#
                     }                                                !#
            }
            recurse_flag = true;
        }
    }

    if (recurse_flag && (c_style & ENGLISH_BIT))
        if (child_count > 1 || eldest_child has pluralname) print (string) ARE2__TX;
        else                                                print (string) IS2__TX;

    if (c_style & NEWLINE_BIT) new_line;

    if (recurse_flag) {
        o = child(o);
        @push lt_value; @push listing_together; @push listing_size;
        @push c_iterator;
        c_iterator = ObjectTreeIterator;
        lt_value = 0;   listing_together = 0;   listing_size = 0;
        WriteListR(o, depth+1, true);
        @pull c_iterator;
        @pull listing_size; @pull listing_together; @pull lt_value;
        if (c_style & TERSE_BIT) print ")";
    }
];
-) instead of "Write After Entry" in "ListWriter.i6t".


Chapter - OutOfWorld

Section - Announce Pronoun Meanings Rule
[B/oowt§13]

[Changes here are meant to hide the dummy pronoun "den/det" from the player's view and to replace the quite genuine but synonymous pronouns "dem" and "dom" with a dummy "dem/dom" when requesting the pronoun meanings (see Section - Pronouns below).]

Include (-
[ ANNOUNCE_PRONOUN_MEANINGS_R x y c d; 
    if (actor ~= player) rfalse; 
    GL__M(##Pronouns, 1); 
!    c = (LanguagePronouns-->0)/3;      !# c is the number of defined pronouns.
    c = ((LanguagePronouns-->0)/3) - 1; !# But we want to ignore three of them (viz. "dem", "dom" and "den/det").
    if (player ~= selfobj) c++; 
    if (c==0) return GL__M(##Pronouns, 4); 
!    for (x = 1, d = 0 : x <= LanguagePronouns-->0: x = x+3) { !#
!# So, we put "dem", "dom" and "den/det" first in the LanguagePronouns Table and start counting from the fourth pronoun in the table.
    for (x = 10, d = 0 : x <= LanguagePronouns-->0: x = x+3) {  !#
        print "~", (address) LanguagePronouns-->x, "~ "; 
        y = LanguagePronouns-->(x+2); 
        if (y == NULL) GL__M(##Pronouns, 3); 
        else { GL__M(##Pronouns, 2); print (the) y; } 
        d++; 
        if (d < c-1) print ", "; 
        if (d == c-1) print (string) LISTAND__TX; 
    } 
    if (player ~= selfobj) { 
        print "~", (address) ME1__WD, "~ "; GL__M(##Pronouns, 2); 
        c = player; player = selfobj; 
        print (the) c; player = c; 
    } 
    "."; 
];
-) instead of "Announce Pronoun Meanings Rule" in "OutOfWorld.i6t".


Chapter - Light

Section - Darkness
[B/light§1]

Include (-
Object thedark "(mörkerobjektet)";
-) instead of "Darkness" in "Light.i6t".


Chapter - Language

Section - Vocabulary
[B/langt§1]

Include (-
Constant AGAIN1__WD     = 'igen';
Constant AGAIN2__WD     = 'g//';
Constant AGAIN3__WD     = 'omigen';

Constant OOPS1__WD      = 'oj';
Constant OOPS2__WD      = 'o//';
Constant OOPS3__WD      = 'ojdå';

Constant UNDO1__WD      = 'ångra';
Constant UNDO2__WD      = 'återta';
Constant UNDO3__WD      = 'undo';

Constant ALL1__WD       = 'allt';
Constant ALL2__WD       = 'alla';
Constant ALL3__WD       = 'allting';
Constant ALL4__WD       = 'båda';
Constant ALL5__WD       = 'bägge';

Constant AND1__WD       = 'och';
Constant AND2__WD       = 'och';
Constant AND3__WD       = '&';

Constant BUT1__WD       = 'utom';
Constant BUT2__WD       = 'förutom';
Constant BUT3__WD       = 'utan';

Constant ME1__WD        = 'mig';
Constant ME2__WD        = 'mej';
Constant ME3__WD        = 'oss';

Constant YOU1__WD       = 'dig';
Constant YOU2__WD       = 'dej';
Constant YOU3__WD       = 'er';

Constant ONESELF1__WD   = 'sig';
Constant ONESELF2__WD   = 'sej';
Constant ONESELF3__WD   = 'dem';
Constant ONESELF4__WD   = 'dom';

Constant OF1__WD        = 'av';
Constant OF2__WD        = 'utav';
Constant OF3__WD        = 'bland';
Constant OF4__WD        = 'av';

Constant OTHER1__WD     = 'annan';
Constant OTHER2__WD     = 'annat';
Constant OTHER3__WD     = 'andra';    

Constant THEN1__WD      = 'samt';
Constant THEN2__WD      = 'sedan';
Constant THEN3__WD      = 'sen';

Constant NO1__WD        = 'n//';
Constant NO2__WD        = 'nej';
Constant NO3__WD        = 'nix';

Constant YES1__WD       = 'j//';
Constant YES2__WD       = 'ja';
Constant YES3__WD       = 'jo';

Constant AMUSING__WD    = 'kul';       !# Unused 

Constant FULLSCORE1__WD = 'fullpoäng'; !# Unused (Inform 7 does not provide the FullScore action at all)
Constant FULLSCORE2__WD = 'full';      !# Unused (Inform 7 does not provide the FullScore action at all)

Constant QUIT1__WD      = 'q//';       !# Unused 
Constant QUIT2__WD      = 'avsluta';   !# Unused 

Constant RESTART__WD    = 'ny';        !# Unused 

Constant RESTORE__WD    = 'hämta';     !# Unused 
-) instead of "Vocabulary" in "Language.i6t".


Section - Pronouns
[B/langt§2]

[We provide an extra personal pronoun in order to have some one thing to connect the possessive pronoun "dess" ("its") in the LanguageDescriptors array below to. Semantically "dess" ought to be connected to both "den" and "det" (both meaning "it"), but we can't do that; so we invent a new personal pronoun meaning "den or det", which we take care to hide from the requesting the pronoun meanings action (see Section - Announce Pronouns Meaning Rule above).]

Include (-
Array LanguagePronouns table

  ! word         possible GNAs                   connected
  !              to follow:                      to:
  !              a       i
  !              s   p   s   p
  !              mfcnmfcnmfcnmfcn

    'dem'      $$0000111100001111                NULL    !# The first three pronouns in the table will not 
    'dom'      $$0000111100001111                NULL    !# be printed when requesting pronoun meanings.
    'den/det'  $$0011000000110000                NULL    !# Some one thing to connect "dess" below to.
    'den'      $$0010000000100000                NULL
    'det'      $$0001000000010000                NULL
!    'henom'    $$1100000000000000                NULL    !# Experimental gender neutral pronoun (her or him)
    'honom'    $$1000000000000000                NULL
    'henne'    $$0100000000000000                NULL
    'dem/dom'  $$0000111100001111                NULL;    !# A dummy to be printed when requesting pronoun meanings.
-) instead of "Pronouns" in "Language.i6t".

[These changes necessitates further changes to do with pronoun handling, gender and articles (for articles see Chapter 8 below).]


Section - Descriptors
[B/langt§3]

Include (-
Array LanguageDescriptors table

  ! word            possible GNAs       descriptor      connected
  !                 to follow:          type:           to:
  !                 a       i
  !                 s   p   s   p
  !                 mfcnmfcnmfcnmfcn

    'min'         $$1110000011100000    POSSESS_PK      0
    'mitt'        $$0001000000010000    POSSESS_PK      0
    'mina'        $$0000111100001111    POSSESS_PK      0
    'denna'       $$1110000011100000    POSSESS_PK      0
    'detta'       $$0001000000010000    POSSESS_PK      0
    'dessa'       $$0000111100001111    POSSESS_PK      0
    'här'         $$1111111111111111    POSSESS_PK      0
    'där'         $$1111111111111111    POSSESS_PK      1
    'hans'        $$1111111111111111    POSSESS_PK      'honom'
    'hennes'      $$1111111111111111    POSSESS_PK      'henne'
!    'hens'        $$1111111111111111    POSSESS_PK      'henom'
    'deras'       $$1111111111111111    POSSESS_PK      'dem'
    'dess'        $$1111111111111111    POSSESS_PK      'den/det'    !# See Section - Pronouns above.
    'den'         $$1110000011100000    DEFART_PK       NULL
    'det'         $$0001000000010000    DEFART_PK       NULL
    'de'          $$0000111100001111    DEFART_PK       NULL
    'en'          $$1110000011100000    INDEFART_PK     NULL
    'ett'         $$0001000000010000    INDEFART_PK     NULL
    'några'       $$0000111100001111    INDEFART_PK     NULL
    'tänd'        $$1110000011100000    light           NULL
    'tänt'        $$0001000000010000    light           NULL
    'tända'       $$0000111100001111    light           NULL
    'ljus'        $$1110000011100000    light           NULL
    'ljust'       $$0001000000010000    light           NULL
    'ljusa'       $$1111111111111111    light           NULL
    'lysande'     $$1111111111111111    light           NULL
    'upplyst'     $$1111000011110000    light           NULL
    'upplysta'    $$1111111111111111    light           NULL
    'släckt'      $$1111000011110000    (-light)        NULL
    'släckta'     $$1111111111111111    (-light)        NULL
    'slocknad'    $$1110000011100000    (-light)        NULL
    'slocknat'    $$0001000000010000    (-light)        NULL
    'slocknade'   $$1111111111111111    (-light)        NULL;
-) instead of "Descriptors" in "Language.i6t".


Section - Numbers
[B/langt§4]

[The idomatic use of number words in Swedish are subject to several quirks (as described in Språkrådets "Svenska språkregler", 3d edition), which the following version of LanguageNumber is designed to respect.]

Include (- 
Array LanguageNumbers table
    'en' 1 'ett' 1 'två' 2 'tre' 3 'fyra' 4 'fem' 5
    'sex' 6 'sju' 7 'åtta' 8 'nio' 9 'tio' 10
    'elva' 11 'tolv' 12 'tretton' 13 'fjorton' 14 'femton' 15
    'sexton' 16 'sjutton' 17 'arton' 18 'nitton' 19 'tjugo' 20
    'tjugoen' 21 'tjugoett' 21 'tjugotvå' 22 'tjugotre' 23 'tjugofyra' 24;

!# We add several variables to LanguageNumber:
!# p is set to true when something is printed, so we can have an intial "hundra-" rather than "etthundra-" and know when to inflect "en".
!# nq stores and passes on the original value of num_quant through recursions. (The global num_quant (= I7 "numerical quantifiers") should be reset to its default value false at the end of LanguageNumber; but, being recursive, the routine can't reset the variable only the last time it's run.)
!# h, k and M are set while we print hundreds, thousands and millions (or billions) respectively.
!# f tells us when and where to put blank spaces.
[ LanguageNumber n p nq h k M f;  
    if (nq == false && num_quant == true) { nq = true; }
    if (n == 0)      { print "noll"; rfalse; }
    if (n < 0)       { print "minus "; n = -n; }
    if (n == 1000)   { print "tusen"; rfalse; }

#Iftrue (WORDSIZE == 4);
    if (n/1000000000 == 1 ) { print "en miljard"; if (n%1000000000 ~= 0) {print " "; } 
                              p = true; n = n%1000000000; f= true; 
    }
    if (n/1000000 == 1 )    { print "en miljon"; if (n%1000000 ~= 0) {print " "; } 
                              p = true; n = n%1000000; f = true; 
    }
    if (n >= 1000000000)    { M = true; LanguageNumber(n/1000000000, true, nq, h, k, M, f); M = false;
                              print " miljarder"; if (n%1000000000 ~= 0) {print " "; } 
                              n = n%1000000000; f = true; p = true; 
    }
    if (n >= 1000000)       { M = true; LanguageNumber(n/1000000, true, nq, h, k, M, f); M = false;
                              if (f = true) { print " "; } 
                              print "miljon"; if (n/1000000 ~= 1) { print "er"; } 
                              if (n%1000000 ~= 0) {print " "; } 
                              n = n%1000000; f = true; p = true; 
    }
#Endif;

    if (n >= 1000)   { k = true; if (n%1000 == 0) { f = true; }
                       LanguageNumber(n/1000, true, nq, h, k, M, f); 
                       if (f == true) { print " ";} print "tusen"; if (f == true) { print " "; } 
                       n = n%1000; k = false; p = true; 
    }
    if (n/100 == 1)  { h = true;
        if (p == true) { print "etthundra"; }
        else if (p == false) { print "hundra"; }
        n = n%100; p = true; h = false; M = false;
    }
    if (n >= 100)    { h = true; LanguageNumber(n/100, true, nq, h, k, M, f); 
                       if (n%100 == 0 && M == false && k == false) { print " "; } ; print "hundra"; 
                       n = n%100; h = false; p = true; 
    }
    if (n == 0) rfalse; 
    switch (n) {
      1:    if (k == true) { 
                 if (f == true) print "ett"; else print "et"; 
            }
            else { 
                 if (nq == false || h == true) { print "ett"; }
                 else { 
                      if (p == false && neutrum == true) { print "ett"; }
                      else { print "en"; }          
                 }             
            }                 
      2:    print "två";
      3:    print "tre";
      4:    print "fyra";
      5:    print "fem";
      6:    print "sex";
      7:    print "sju";
      8:    print "åtta";
      9:    print "nio";
      10:   print "tio";
      11:   print "elva";
      12:   print "tolv";
      13:   print "tretton";
      14:   print "fjorton";
      15:   print "femton";
      16:   print "sexton";
      17:   print "sjutton";
      18:   print "arton";
      19:   print "nitton";
      20 to 99: switch (n/10) {
        2:  print "tjugo";
        3:  print "trettio";
        4:  print "fyrtio";
        5:  print "femtio";
        6:  print "sextio";
        7:  print "sjuttio";
        8:  print "åttio";
        9:  print "nittio";
        }
    if (n%10 ~= 0) LanguageNumber(n%10, true, nq, h, k, M, f); p = true;
    }
    num_quant = false;
];
-) instead of "Numbers" in "Language.i6t".


Section - Time
[B/langt§5]

[Hours on a 24h basis rather than a 12h one.]

Include (- 
[LanguageTimeOfDay hours mins;
    print hours/10, hours%10, ".", mins/10, mins%10;
];
-) instead of "Time" in "Language.i6t".


Section - Directions
[B/langt§6]

[This section is nowadays obsolete since the name of directions is defined in the Standard Rules.]


Section - Translation
[B/lang§7]

Include (-
[ LanguageToInformese;
    BeginActivity((+ Translating to Informese +));
    ForActivity((+ Translating to Informese +));
    EndActivity((+ Translating to Informese +));
];
-) instead of "Translation" in "Language.i6t".


Section - Articles
[B/langt§8]

[Swedish doesn't use the definite article with nouns; instead, Swedish nouns inflect, marking definite species by suffix (those suffixes being remnants of Old Norse postpositive definite articles, though). Agreeing adjectives inflect, too; but, in addition, they do take the definite article. So, 'a grue', 'the grue', 'a gruesome grue', 'the gruesome grue' is in Swedish 'en gruv', 'gruven', 'en gruvlig gruv', 'den gruvliga gruven'.

So, we need some way to ensure that definite articles are printed is not printed unless a noun phrase begins with an adjective. We also have to handle the inflections of nouns and adjectives in the definite species. We do this by require users to spell out the definite form of noun phrases manually, as text substitutions to the printed names of objects. This includes specifying the relevant definite article ('den', 'det' or 'de'). Therefore, we leave the entries for definite articles in the LanguageArticles array empty.]

[Since we will never need to look up definite articles in the array, we leave the entries empty. On the other hand we need to extend it from 12 to 16 entries because of the extra common gender in Swedish.]

Include (-
Constant LanguageAnimateGender   = male;
! Constant LanguageInanimateGender = ~neuter;    ! --- Common ---
Constant LanguageInanimateGender = common;       !# Changed from above 

Constant LanguageContractionForms = 1;     !# No alternative contraction forms in Swedish

[ LanguageContraction text; return 0; ];

#ifdef NAAN_SPELLING;     
 Array LanguageArticles -->
 !   Contraction form 0:     
 !   Cdef Def Indef     
      ""  ""  "en "        ! Articles 0 (common gender) --- We leave the definite
      ""  ""  "ett "       ! Articles 1 (neuter)            article entries empty,
      ""  ""  "nåra ";     ! Articles 2 (plural)            as explained above ---
#ifnot; 
 Array LanguageArticles -->
 !   Contraction form 0:     
 !   Cdef Def Indef     
      ""  ""  "en "        ! Articles 0 (common gender) --- We leave the definite
      ""  ""  "ett "       ! Articles 1 (neuter)            article entries empty,
      ""  ""  "några ";    ! Articles 2 (plural)            as explained above ---
 #endif; 

                            !    a               i
                            !    s       p       s       p
                            !    m f c n m f c n m f c n m f c n
Array LanguageGNAsToArticles --> 0 0 0 1 2 2 2 2 0 0 0 1 2 2 2 2;
-) instead of "Articles" in "Language.i6t".


Section - Commands 
[B/langt§9]

[LanguageVerb provides a place to manipulate printing the verb part of a player's command.
We need it to expand abbreviated verbs; because  Inform 6 truncates most verbs longer than 6 characters; and because the template prints these verbs in contexts where the output requires the infinitive form of the input's imperative verb (in English infinitives look just like imperatives).]

Include (-
[ LanguageVerb i;
  switch (i) {
    'i//', 'inv', 'lista', 
    'tillhörigheter', 'tillh':  print "gå igenom dina tillhörigheter";
    'utr', 'utrustning':        print "gå igenom din utrustning";
    'tag':                      print "ta";
    'l//', 't//', 'c//':        print "titta";
    'x//', 'u//':               print "undersöka";
    'z//':                      print "vänta";
    'undersök':                 print "undersöka";
    'giv':                      print "ge";
    'attackera':                print "attackera";
    'förstör':                  print "förstöra";
    'misshandla':               print "misshandla";
    'omfamna':                  print "omfamna";
    'säg', 'säj': #ifdef SAEJA_SPELLING;
                                print "säja";
                  #ifnot;       print "säga"; #endif;
    'berätta':                  print "berätta";
    'förklara':                 print "förklara";
    'drag':                     print "dra";
    'kläm':                     print "klämma";
    'ja', 'jo', 'j', 'y':       print "svara ja";
    'nej', 'nä':                print "svara nej";
    'ursäkta', 'förlåt':        print "be om ursäkt";
    'tusan', 'attan', 'jäklar',
    'jädrar', 'shit':           print "vädra ditt missnöje";
    'fan', 'helvete', 'jävlar': print "uttala grova eder";
    'släpp','släng', 'lägg',
    'sätt', 'ställ', 'stick',
    'ät', 'åk', 'stig',
    'sitt', 'ligg', 'res',
    'läs', 'sök', 'lås', 
    'knäpp', 'stäng', 'skänk', 
    'anfall', 'angrip', 
    'spräck', 'bryt', 'knäck',
    'kyss', 'skrik', 'känn',
    'ryck', 'tryck', 'vrid',
    'skjut', 'bränn', 'tänd':   print (address) i, "a";
    'tänk', 'hör', 'skär', 
    'klipp', 'hugg', 'klyv',
    'bind', 'knyt', 'fäst', 
    'drick', 'svälj', 'gnid', 
    'skrubba', 'köp', 
    'inhandla', 'sjung', 
    'klättra', 'sov':           print (address) i, "a";

	default: rfalse;
  }
  rtrue;
];

[ LanguageVerbLikesAdverb w;                                          ! Unused in 6F95
    if (w == 'titta' or 'gå' or 'skjut' or 'se' or 'åk' or 'knuffa')  
        rtrue;
    rfalse;
];

[ LanguageVerbMayBeName w;
    if (w == 'sparat' or 'sparad' or 'gammalt' or 'gammal' or 'öppna' or 'nytt' or 'ny'
          or 'omstart' or 'avskrift' or 'utskrift' or 'ingen' or 'version' or 'poäng' or 'resultat'
          or 'aldrig' or 'superkort' or 'superkorta' or 'kort' or 'korta'
          or 'alltid' or 'lång' or 'långt' or 'långa'
          or 'ibland' or 'första' or 'normal' or 'normalt' or 'normala'
          or 'meddelande' or 'meddelanden'
          or 'pronomen' or 'pronomina' or 'substantiv' or 'visa')
        rtrue;
    rfalse;
];
-) instead of "Commands" in "Language.i6t".


Section - Short Texts
[B/langt§10]

Include (-
Constant NKEY__TX       = "N = nästa ämne  ";      !# Unused
Constant PKEY__TX       = "T = tidigare";          !# Unused
Constant QKEY1__TX      = "Q = fortsätt spel";     !# Unused
Constant QKEY2__TX      = "Q = tidigare meny";     !# Unused
Constant RKEY__TX       = "    RETUR = välj ämne"; !# Unused

Constant NKEY1__KY      = 'N';    !# Unused
Constant NKEY2__KY      = 'n';    !# Unused
Constant PKEY1__KY      = 'T';    !# Unused
Constant PKEY2__KY      = 't';    !# Unused
Constant QKEY1__KY      = 'Q';    !# Unused
Constant QKEY2__KY      = 'q';    !# Unused

Constant SCORE__TX      = "Poäng: ";    !# Unused
Constant MOVES__TX      = "Drag: ";     !# Unused
Constant TIME__TX       = "Tid: ";      !# Unused

Global CANTGO__TX       = "Man kommer inte åt det hållet.";

Global FORMER__TX       = "ditt tidigare jag";
! Global YOURSELF__TX     = "dig";     !# Deleting this in favor of the following:
#ifdef DEJ_SPELLING;                   !#
Constant MYSELF__TX     = "mej";       !# This set of Short Texts
Constant YOURSELF__TX   = "dej";       !# come in handy
Constant ONESELF__TX    = "sej";       !# to handle
#ifnot;                                !# 
Constant MYSELF__TX     = "mig";       !# reflexive pronouns
Constant YOURSELF__TX   = "dig";       !# in the subroutine PrintCommand
Constant ONESELF__TX    = "sig";       !# while printing parser errors.  
#endif;                                !# 
Constant YOU__TX        = "Du";

Constant DARKNESS__TX   = "I mörker";

Constant THOSET__TX     = "sakerna i fråga";
Constant THAT__TX       = "det";

Constant OR__TX         = " eller ";

Constant NOTHING__TX    = "ingenting";
Constant NOTHING2__TX   = "Ingenting"; !# New in 6E59

Global IS__TX           = " finns";    !# Unused 
Global ARE__TX          = " finns";    !# Unused 
Global IS2__TX          = "finns ";
Global ARE2__TX         = "finns ";
Global IS3__TX          = "finns";
Global ARE3__TX         = "finns";

Constant AND__TX        = " och ";
#ifdef I7_SERIAL_COMMA;
Constant LISTAND__TX    = " och ";     !# The serial comma option should
Constant LISTAND2__TX   = " och ";     !#  have no effect in Swedish. 
#ifnot;
Constant LISTAND__TX    = " och ";
Constant LISTAND2__TX   = " och ";
#endif; ! I7_SERIAL_COMMA

! Constant WHOM__TX       = "whom ";   !# Swedish doesn't make any distinction
Constant WHICH__TX      = "vilken ";   !# between "which" and "whom".
Constant WHICH2__TX     = "vilket ";   !# But this relative pronoun inflects,
Constant WHICH3__TX     = "vilka ";    !# so we need to add two forms.

Constant COMMA__TX      = ", ";
-) instead of "Short Texts" in "Language.i6t".


Section - Printed Inflections
[B/langt§11]

Include (-
[ denellerde obj;
    if (obj == player)            { print "du"; return; }
    if (obj has pluralname)       { de(); return; }
    if (obj has animate) {								    
        if (obj has female)       { print "han"; return; }
        else if (obj has male)    { print "hon"; return; }
    }
    if (obj has neuter)           { print "det"; return; }
    else print "den";
];

[ cDenellerDe obj;
    if (obj == player)            { print "Du"; return; }
    if (obj has pluralname)       { cDe(); return; }
    if (obj has animate) {								    
        if (obj has female)       { print "Han"; return; }
        else if (obj has male)    { print "Hon"; return; }
    }
    if (obj has neuter)           { print "Det"; return; }
    else print "Den";
];

[ denellerdem obj;
    if (obj == player)            { dig(); return; }
    if (obj has pluralname)       { dem(); return; }
    if (obj has animate) {								    
        if (obj has female)       { print "honom"; return; }
        else if (obj has male)    { print "henne"; return; }
    }
    if (obj has neuter)           { print "det"; return; }
    else print "den";
];

[ cDenellerDem obj;
    if (obj == player)            { cDig(); return; }
    if (obj has pluralname)       { cDem(); return; }
    if (obj has animate) {								    
        if (obj has female)       { print "Honom"; return; }
        else if (obj has male)    { print "Henne"; return; }
    }
    if (obj has neuter)           { print "Det"; return; }
    else print "Den";
];

[ dig;
    #ifdef DEJ_SPELLING; print "dej"; 
    #ifnot; print "dig"; #endif;
];

[ cDig;
    #ifdef DEJ_SPELLING; print "Dej"; 
    #ifnot; print "Dig"; #endif;
];

[ sig;
    #ifdef DEJ_SPELLING; print "sej"; 
    #ifnot; print "sig"; #endif;
];

[ cSig;
    #ifdef DEJ_SPELLING; print "Sej"; 
    #ifnot; print "Sig"; #endif;
];

[ de;
    #ifdef DOM_SPELLING; print "dom"; 
    #ifnot; print "de"; #endif;
];

[ cDe;
    #ifdef DOM_SPELLING; print "Dom"; 
    #ifnot; print "De"; #endif;
];

[ dem;
    #ifdef DOM_SPELLING; print "dom"; 
    #ifnot; print "dem"; #endif;
];

[ cDem;
    #ifdef DOM_SPELLING; print "Dom"; 
    #ifnot; print "Dem"; #endif;
];

[ ned;
    #ifdef NER_SPELLING; print "ner"; 
    #ifnot; print "ned"; #endif;
];

[ naagon;
    #ifdef NAAN_SPELLING; print "nån";
    #ifnot; print "någon"; #endif;
];


[ naagot;
    #ifdef NAAN_SPELLING; print "nåt";
    #ifnot; print "något"; #endif;
];

[ naagra;
    #ifdef NAAN_SPELLING; print "nåra";
    #ifnot; print "några"; #endif;
];

[ saadan;
    #ifdef SAAN_SPELLING; print "sån";
    #ifnot; print "sådan"; #endif;
];

[ ska;
    #ifdef SKALL_SPELLING; print "skall";
    #ifnot; print "ska"; #endif;
];

[ Inflect c n p obj;
    if (obj has pluralname) { print (string) p; return; } 
    if (obj has neuter)     { print (string) n; return; } 
    else                    { print (string) c; }         


];
-) instead of "Printed Inflections" in "Language.i6t".


Section - Long Texts
[B/langt§12]

Include (-
[ LanguageLM n x1 x2;
    say__p = 1;
    Answer,Ask: print_ret (The) x1, " svarar inte.";
!    Ask:  see Answer
    Attack: "Våld är inte lösningen nu.";
    Burn:   "Det är inte värt risken.";
    Buy:    "Här finns inget som är till salu.";
    Climb:  "Det tror jag inte ", (denellerde) actor, " skulle ha så mycket för.";
    Close: switch (n) {
        1:  print_ret (cDenellerDe) x1, " går varken att stänga eller öppna.";
        2:  print (cDenellerDe) x1, " är ju redan stäng"; Inflect("d", "t", "da", x1); ".";
        3:  "Du stänger ", (the) x1, ".";
        4:  print (The) actor, " stänger ", (the) x1, ".^";
        5:  print (The) x1, " stängs.^";
    }
    Consult: switch (n) {
        1:  "Du hittar inget intressant i ", (the) x1, ".";
        2:  print (The) actor, " tar "; sig(); print " en titt.^";
    }
    Cut:    "Det skulle inte tjäna mycket till.";
    Disrobe: switch (n) {
        1:  print "Du har ", (denellerdem) x1, " ju inte på "; dig(); ".";
        2:  print "Du tar av "; dig(); " ", (the) x1, ".";
        3:  print (The) actor, " tar av "; sig(); print " ", (the) x1, ".^";
    }
    Drink:  "Här finns inget som går att dricka.";
    Drop: switch (n) {
        1:  print (The) x1;
            switch (verb_word) {
                'ställ',
                'sätt':  print " står ";
                'lägg':  print " ligger ";
                default: print " är ";
            } "ju redan här.";
        2:  "Du har ", (denellerdem) x1, " ju inte.";
        3:  print "(måste ta av ", (the) x1, " först)^"; say__p = 0; return;
        4:  print "Släpp"; Inflect("t", "t", "ta", x1); ".";
        5:  "Det finns inte plats på ", (the) x1, ".";
        6:  "Det finns inte plats i ", (the) x1, ".";
        7:  print (The) actor, " ";
            switch (verb_word) {
                'sätt':  print "sätter"; ned();
                'ställ': print "ställer ifrån"; sig();
                'lägg':  print "lägger undan";
                default: print "släpper";
            } print " ", (the) x1, ".^";
    }
  Eat: switch (n) {
        1:  print (CDenellerDe) x1, " är klart oätlig"; Inflect("", "t", "a", x1); ".";
        2:  "Du äter upp ", (the) x1, ". Inte så tokigt.";
        3:  print (The) actor, " äter upp ", (the) x1, ".^";
    }
  Enter: switch (n) {
        1:  print "Men du är ju redan ";
            if (x1 has supporter) print "på "; else print "i ";
            print_ret (the) x1, ".";
        2:  print (CDenellerDem) x1, " går det inte att ";
            switch (verb_word) {
                'sätt':  print_ret "sitta på.";
                'ställ': print_ret "stå på.";
                'lägg':  print_ret "ligga på.";
                'sitt':  print_ret "sitta på.";
                'stå':   print_ret "stå på.";
                'ligg':  print_ret "ligga på.";
                default: print_ret "komma in i.";
            }
        3:  print "Det går inte att ta "; sig();
            print " in i ", (denellerde) x1, " stäng"; Inflect("d", "t", "da", x1); 
            exc_art == true; print (the) x1; exc_art == false; ".";
        4:  print "Det går inte att ta "; sig();
            if (x1 has supporter) print " upp på "; else print " in i ";
            naagot(); " som man själv bär på.";
        5:  print "Du tar "; dig();
            if (x1 has supporter) print " upp på "; else print " in i ";
            print_ret (the) x1, ".";
        6:  print "(måste ";
            if (x1 has supporter) print "av "; else print "ur ";
            print (the) x1; print " först)^"; say__p = 0; return;
        7:  ! say__p = 0;
            if (x1 has supporter) "(måste upp på ", (the) x1, " först)";
            if (x1 has container) "(måste in i ", (the) x1, " först)";
            "(måste till ", (the) x1, " först)";
        8:  print (The) actor, " tar "; sig();
            print " in i ", (the) x1, ".^";
        9:  print (The) actor, " tar "; sig();
            print " upp på ", (the) x1, ".^";
    }
  Examine: switch (n) {
        1:  style bold; print "Mörker"; style roman; 
            print ", "; style underline; print "subs."; style roman;
            "  Avsaknad av för synsinnets funktion erforderligt ljus.";   !# Unused?
        2:  "Du ser inget särskilt med ", (the) x1, ".";
        3:  print (The) x1, " är för tillfället ";
            if (x1 has on) "på."; else "av.";
        4:  print (The) actor, " tittar på ", (the) x1, ".^";
        5:  "Det syns ingenting oväntat åt det hållet.";
    }
  Exit: switch (n) {
        1:  print "Men du befinner "; dig(); " ju inte inuti något för tillfället.";
        2:  print "Det går inte att komma ut ur ", (denellerde) x1, " stäng"; Inflect("d", "t", "da", x1); 
            exc_art == true; print (the) x1; exc_art == false; ".";
        3:  print "Du tar "; dig();
            if (x1 has supporter) print " av "; else print " ur ";
            print_ret (the) x1, ".";
        4:  print "Men du befinner "; dig(); print " ju inte "; 
            if (x1 has supporter) print "på "; else print "i ";
            print_ret (the) x1, ".";
        5:  print (The) actor, " tar "; sig(); print " av ", (the) x1, ".^";
        6:  print (The) actor, " tar "; sig(); print " ur ", (the) x1, ".^";
    }
  GetOff:   print "Men du befinner "; dig(); " ju inte på ", (the) x1, " för tillfället.";
  Give: switch (n) {
        1:  "Du håller inte i ", (the) x1, " än.";
        2:  "Du bollar ett tag med ", (the) x1, " men har inte mycket för det.";
        3:  print (The) x1, " verkar inte så angeläg"; Inflect("en", "et", "na", x1); " om det.";
        4:  print "Det går nog inte att få ", (the) x1, " att ta emot "; naagot(); " alls.";
        5:  "Du ger ", (the) x1, " till ", (the) second, ".";
        6:  print (The) actor, " ger "; dig(); print " ", (the) x1, ".^";
        7:  print (The) actor, " ger ", (the) x1, " till ", (the) second, ".^";
    }
  Go: switch (n) {
        1:  print "Det går inte så länge du är kvar ";
            if (x1 has supporter) print "på "; else print "i "; print_ret (the) x1;
        2:  print_ret (string) CANTGO__TX;   ! "You can't go that way."
        6:  "Det går inte, för ", (the) x1, " leder igenstans.";
        7:  "Du måste tala om åt vilket håll.";
        8:  print (The) actor, " beger "; sig(); print " av upp";
        9:  print (The) actor, " beger "; sig(); print " av "; ned();
        10: print (The) actor, " beger "; sig(); print (name) x1, "ut";
        11: print (The) actor, " kommer "; print ned();
        12: print (The) actor, " kommer upp";
        13: print (The) actor, " kommer ", (name) x1, "ifrån";
        14: print (The) actor, " dyker upp";
        15: print (The) actor, " kommer "; ned(); print " till ", (the) x1;
        16: print (The) actor, " kommer upp till ", (the) x1;
        17: print (The) actor, " kommer till ", (the) x1, (name) x2, "ifrån";
        18: print (The) actor, " beger "; sig(); print " genom ", (the) x1;
        19: print (The) actor, " dyker upp från ", (the) x1;
        20: print "på ", (the) x1;
        21: print "i ", (the) x1;
        22: print ", skjutande ", (the) x1, " framför "; 
            if (actor ~= player) sig(); else dig(); 
            print " och "; dig(); print " med "; denellerdem(x1);
        23: print ", skjutande ", (the) x1, " framför "; if (actor ~= player) sig(); else dig();
        24: print ", skjutande ", (the) x1, " med "; if (actor ~= player) sig(); else dig(); " bort";
        25: print ", skjutande ", (the) x1, " med "; if (actor ~= player) sig(); else dig(); " hit";
        26: print ", och du följer med";
        27: print "(måste av  ", (the) x1, " först)^"; say__p = 0; return;
        28: print "(måste öppna ", (the) x1, " först)^"; say__p = 0; return;
    }
  Insert: switch (n) {
        1:  print "Man måste ta ", (the) x1, " innan man kan stoppa ", (denellerdem) x1, " i ";
            naagot(); " annat."; !# Used, but what prints it?
        2:  print "Man kan inte ha "; naagot(); " i ", (denellerdem) x1, ".";
        3:  print (The) x1, " är stäng"; Inflect("d", "t", "da", x1); ".";
        4:  print "Det går inte utan att ta av "; sig(); " ", (denellerdem) x1, " först."; !# Unused?
        5:  print "Det går inte att stoppa in "; naagot(); print " i "; sig(); " självt.";
        6:  print "(måste ta av ", (denellerdem) x1, " först)^"; say__p = 0; return;
        7:  "Det är redan fullt i ", (the) x1, ".";
        8:  "Klart.";
        9:  "Du stoppar ", (the) x1, " i ", (the) second, ".";
        10: print (The) actor, " stoppar ", (the) x1, " i ", (the) second, ".^";
    }
  Inv: switch (n) {
        1:  print "Du har ingenting med "; dig(); ".";
        2:  print "Du har med "; dig();
        3:  print ":^";
        4:  print ".^";
        5:  print (The) x1, " tittar igenom sina tillhörigheter.^";
    }
  Jump:     "Du hoppar på stället – till ingen nytta.";
  Kiss:     print "Koncentrera "; dig(); " på spelet i stället.";
  Listen:   "Det hörs ingenting oväntat.";
  ListMiscellany: switch (n) {
        1:  print " (som ger ljus)";
        2:  print " (stäng"; Inflect("d", "t", "da", x1); print ")";
        4:  print " (tom"; Inflect("", "t", "ma", x1); print ")";
        6:  print " (stäng"; Inflect("d", "t", "da", x1);
            print " och tom"; Inflect("", "t", "ma", x1); print ")";
        3:  print " (stäng"; Inflect("d", "t", "da", x1); 
            print " men som ger ljus)";
        5:  print " (tom"; Inflect("", "t", "ma", x1); 
            print " men som ger ljus)";
        7:  print " (stäng"; Inflect("d", "t", "da", x1); 
            print " och tom"; Inflect("", "t", "ma", x1); 
            print " men som ger ljus)";
        8:  print " (som ger ljus och du har på "; dig();
        9:  print " (som ger ljus";
        10: print " (som du har på "; dig();
        11: print " (";
        12: print "öppe"; Inflect("n", "t", "na", x1);
        13: print "öppe"; Inflect("n", "t", "na", x1); 
            print " men tom"; Inflect("", "t", "ma", x1);
        14: print "stäng"; Inflect("d", "t", "da", x1);
        15: print "stäng"; Inflect("d", "t", "da", x1); 
            print " och låst"; Inflect("", "", "a", x1);
        16: print " och tom"; Inflect("", "t", "ma", x1);
        17: print " (tom"; Inflect(")", "t)", "ma)", x1);
        18: print " som innehåller ";
        19: print " (på ";
        20: print ", ovanpå ";
        21: print " (i ";
        22: print ", inuti ";
    }
  LMode1:   " är nu i ~ibland~-läge, vilket innebär att du får en fullständig beskrivning av en plats bara första gången du kommer dit (sedan står det bara var du är).";
  LMode2:   " är nu i ~alltid~-läge, vilket innebär att du alltid får en fullständig beskrivning av en plats (även om du redan varit där).";
  LMode3:   " är nu i ~aldrig~-läge, vilket innebär att du aldrig får en fullständig beskrivning av en plats (ens om det är första gången du är där).";
  Lock: switch (n) {
        1:  print_ret (cDenellerDe) x1, " verkar inte gå att låsa över huvud taget.";
        2:  print (cDenellerDe) x1, " är redan låst"; Inflect("", "", "a", x1); ".";
        3:  print "Det går inte att låsa ", (the) x1, " så länge",
            (denellerde) x1, " är öpp "; Inflect("en", "et", "na", x1); ".";
        4:  print_ret (cDenellerDe) x1, " tycks inte passa i låset.";
        5:  "Du låser ", (the) x1, ".";
        6:  print (The) actor, " låser ", (the) x1, ".^";
    }
  Look: switch (n) {
        1:  print " (on ", (the) x1, ")";    !# Unused?
        2:  print " (in ", (the) x1, ")";    !# Unused?
        3:  print " (as ", (object) x1, ")"; !# Unused?
        4:  print "På ", (the) x1, " ";      !# Examine supporters rule – kolla den!!!
            WriteListFrom(child(x1),
              ENGLISH_BIT+RECURSE_BIT+PARTINV_BIT+TERSE_BIT+CONCEAL_BIT+ISARE_BIT);
            ".";
        5,6:    !# Unused?
            if (x1 ~= location) {
                if (x1 has supporter) print "On "; else print "In ";
                print (the) x1, " you";
            }
            else print "You";
            print " can ";
            if (n == 5) print "also ";
            print "see ";
            WriteListFrom(child(x1),
              ENGLISH_BIT+RECURSE_BIT+PARTINV_BIT+TERSE_BIT+CONCEAL_BIT+WORKFLAG_BIT);
            if (x1 ~= location) "."; else " here.";
        7:  "Det syns ingenting oväntat åt det hållet.";    !# Unused ?
        8:  if (x1 has supporter) print " (på "; else print " (i "; print (the) x1, ")";
        9:  print (The) actor, " ser "; sig(); print " om.^";
    }
  LookUnder: switch (n) {
        1:  "Men det är ju mörkt.";    !# Unused?
        2:  "Du hittar inget spännande.";
        3:  print (The) actor, " tittar under ", (the) x1, ".^";
    }
  Mild:     "Precis.";
  Miscellany: switch (n) {
        1:  print "(begränsat till "; de(); " sexton första förmålen)^";
        2:  "Men jag har ju inget att göra!";
        3:  print " Du dog ";
        4:  print " Du vann ";
        5:  print "^Would you like to RESTART, RESTORE a saved game";    !# Unused?
            #Ifdef DEATH_MENTION_UNDO;
            print ", UNDO your last move";
            #Endif;
            #ifdef SERIAL_COMMA;
            print ",";
            #endif;
            " or QUIT?";
        6:  print "[Din spelmaskin klarar tyvärr inte att ~ångra~ "; naagra(); " drag.]";
            #Ifdef TARGET_ZCODE;
        7:  "Det gick tyvärr inte att ~ångra~. [Det är inte alla spelmaskiner som klarar det.]";
            #Ifnot; ! TARGET_GLULX
        7:  "[Du kan inte ~ångra~ fler drag nu.]";
            #Endif; ! TARGET_
        8:  "Var god välj ett av svaralternativen ovan.";
        9:  "Det är nu becksvart här!";
        10: "Ursäkta?";
        11: print "[Det går inte att ~ångra~ "; naagot(); " du inte ens gjort!]";
        12: "[Can't ~undo~ twice in succession. Sorry!]";    !# Unused?
        13: "[Förra draget är nu återtaget.]";
        14: "Tyvärr går inte det att rätta.";
        15: "Ingen orsak.";
        16: "Man kan bara rätta ett enda ord med ett ~Oj~.";
        17: "Det är kolmörkt, och du ser inte ett skvatt.";
        18: print dig();
        19: "Lika snygg som vanligt.";    !# Unused?
        20: "Vill du upprepa en instruktion som ~Groda, hoppa~, skriver du bara ~igen~, inte ~groda, igen~.";
        21: "Det är väl inget att göra om.";
        22: "Du kan inte inleda med ett kommatecken.";
        23: print "Du vill visst prata med "; naagon(); ", men jag förstår inte vem.";
        24: "Det går inte att tala med ", (the) x1, ".";
        25: print "Vill du prata med "; naagon(); ", skriv bara namn, kommatecken och vad du vill ha sagt: ~Watson, elementärt~ (inte t.ex. ~Watson min vän, elementärt~).";
        26: "(måste ta ", (the) x1, " först)";
        27: "Jag förstod inte den meningen.";
        28: print "Jag hängde inte med efter det där om att ";
        29: "Jag förstod inte räkneordet.";
        30: "Inget sådant föremål syns till.";
        31: "You seem to have said too little!";    !# unused?
        32: "You aren't holding that!";    !# Unused?
        33: "Det går bara att använda ett enda direkt eller indirekt objekt med det verbet.";
        34: "You can only use multiple objects once on a line.";    !# Unused?
        35: "Jag förstod inte vad ~", (address) pronoun_word, "~ syftar på.";
        36: "You excepted something not included anyway!";    !# Unused?
        37: print "Det kan man bara göra med "; naagot(); " levande.";
        38: "Jag förstår inte det verbet.";
        39: "That's not something you need to refer to in the course of this game.";    !# Unused?
        40: "Du ser inte till ~", (address) pronoun_word, "~ (", (the) pronoun_obj,
            ") för tillfället.";
        41: "I didn't understand the way that finished.";    !# Unused?
        42: print "Det finns ";
            if (x1 == 0) print "inga sådana tillgängliga,"; 
            else { 
                print "bara ", (number) x1; 
                saadan(); Inflect("", "t", "a", x1);
                print " tillgänglig"; Inflect("", "t", "a", x1); ".";
            }
        43: "Ingenting att göra!";
        44: "Ingenting är tillgängligt!";
        45: print "Menar du ";
        46: print "Menar du ";
        47: "Tyvärr måste du bestämma dig för ett enda av alternativen i det här läget. Vilket tar du?";
        48: print "Vem ville du ";
            if (actor ~= player) print "att ", (the) actor, " skulle ";
            PrintCommand(); print "?^";
        49: if (action_to_be == ##PushDir)  print "Vart"; else print "Vad"; print " ville du ";
            if (actor ~= player) print "att ", (the) actor, " skulle ";
            PrintCommand(); print "?^";
        50: print "Poängställningen gick just ";
            if (x1 > 0) print "upp"; else { x1 = -x1; ned(); }
            print " med ", (number) x1, " poäng";
        51: "(På grund av den dramatiska händelseutvecklingen slutfördes inte alla dina instruktioner.)";
        52: "^Type a number from 1 to ", x1, ", 0 to redisplay or press ENTER.";    !# Unused?
        53: "^[Please press SPACE.]";    !# Unused?
        54: "[Comment recorded.]";       !# Unused?
        55: "[Comment NOT recorded.]";   !# Unused?
        56: print ".^";
        57: print "?^";
        58: print (The) actor, " kan inte göra det.^";
        59: "Du måste ange ett direkt objekt.";
        60: "Du får inte använda ett direkt objekt med det här verbet.";
        61: "Objektet för handlingen måste vara ett föremål.";
        62: "Objektet för handlingen får inte vara ett föremål.";
        63: "Du måste ange ett föremål som indirekt objekt för handlingen.";
        64: "Du får inte ange ett föremål som indirekt objekt för handlingen.";
        65: "Du måste ange ett indirekt objekt.";
        66: "Du får inte använda ett indirekt objekt med det här verbet.";
        67: print "Du måste ange "; naagot(); " mer konkret än en riktning.";
        68: print "(", (The) actor, " måste ta ", (the) x1, " först)^";
        69: "(måste ta ", (the) x1, " först)";
        70: print "Spelet tillåter "; dig(); " inte att ÅNGRA ditt drag.";
        71: print (string) DARKNESS__TX;
        72: print (The) x1, " har viktigare saker för "; sig(); ".";
        73: print "Det var fel sorts sak att försöka göra "; naagot(); print " "; saadan();"t med.";
        74: print "[Det måste du göra själv. Det händer ju inte i spelvärlden, så det går inte att be ", (The) x1, " att göra det.]^";
        75: print " Slut ";
    }
  No,Yes:   "Det var en retorisk fråga.";
  NotifyOff:
            "Ändringar i poängställningen meddelas nu inte under spelets gång.";
  NotifyOn: "Ändringar i poängställningen meddelas under spelets gång.";
  Open: switch (n) {
        1:  print_ret (cDenellerDe) x1, " går varken att öppna eller stänga.";
        2:  print (cDenellerDe) x1, " verkar låst"; Inflect("", "", "a", x1); ".";
        3:  print (cDenellerDe) x1, " är redan öpp"; Inflect("en", "et", "na", x1); ".";
        4:  print "Du öppnar ", (the) x1, ". Därinne finns ";
            if (WriteListFrom(child(x1), ENGLISH_BIT+TERSE_BIT+CONCEAL_BIT) == 0) "ingenting.";
            ".";
        5:  "Du öppnar ", (the) x1, ".";
        6:  print (The) actor, " öppnar ", (the) x1, ".^";
        7:  print (The) x1, " öppnas.";
    }
  Pronouns: switch (n) {
        1:  print "För tillfället syftar ";
        2:  print "på ";
        3:  print "inte på "; naagon(); print "ting";
        4:  print "inget pronomen på "; naagon();"ting.";
        5:  ".";
    }
  Pull,Push,Turn: switch (n) {
        1:  print_ret (cDenellerDe) x1, "går inte att rubba.";
        2:  "Det går inte.";
        3:  print "Det tycks inte ha "; naagon(); " verkan.";
        4:  "Det vore inte helt hövligt.";
        5:  print (The) actor, " drar i ", (the) x1, ".^";
        6:  print (The) actor, " trycker på ", (the) x1, ".^";
        7:  print (The) actor, " vrider på ", (the) x1, ".^";
    }
! Push: see Pull
  PushDir: switch (n) {
        1:  print "Det går inte att skjuta ", (the) x1, " från ett ställe till ett annat.^";
        2:  "Jag förstod inte åt vilket håll du menade. Var snäll att ange en riktning.";
        3:  "Inte åt det hållet, vet du vad.";
    }
  PutOn: switch (n) {
        1:  print "Du måste ta ", (the) x1, " innan det går att ";
            switch (verb_word) {
                'sätt':  print "sätta ";
                'ställ': print "ställa ";
                'lägg':  print "lägga ";
                default: print "placera ";
            } print (denellerdem) x1, " på "; naagot(); ".";
        2:  print "Saker kan inte ";
            switch (verb_word) {
                'sätt':  print "sättas";
                'ställ': print "stå";
                'lägg':  print "ligga";
                default: print "vara";
            } print " på "; sig(); " själva.";
        3:  print "Det skulle inte tjäna mycket till att ";
            switch (verb_word) {
                'sätt':  print "sätta ";
                'ställ': print "ställa ";
                'lägg':  print "lägga ";
                default: print "placera ";
            } naagot(); " på ", (the) x1, ".";
        4:  "Så akrobatisk är du inte.";
        5:  print "(måste ta av ", (denellerdem) x1, " först)^"; say__p = 0; return;
        6:  "Det är fullt på ", (the) x1, ".";
        7:  "Klart.";
        8:  print "Du ";
            switch (verb_word) {
                'sätt':  print "sätter ";
                'ställ': print "ställer ";
                'lägg':  print "lägger ";
                default: print "placerar ";
            } print_ret (the) x1, " på ", (the) second, ".";
        9:  print (The) actor;
            switch (verb_word) {
                'sätt':  print "sätter ";
                'ställ': print "ställer ";
                'lägg':  print "lägger ";
                default: print "placerar ";
            } print_ret (the) x1, " på ", (the) second, ".^";
    }
  Quit: switch (n) {
        1:  print "Var vänlig svara ja eller nej.";
        2:  print "Vill du avsluta spelomgången nu? ";
    }
  Remove: switch (n) {
        1:  if (x1 has pluralname) print "They are"; else print "It is";
            " unfortunately closed.";    !# Unused?
        2:  "Men ", (denellerde) x1, " är inte där.";
        3:  "Removed.";    !# Unused?
    }
  Restart: switch (n) {
        1:  print "Vill du börja om från början nu? ";
        2:  "Det gick tyvärr inte att starta om spelet.";
    }
  Restore: switch (n) {
        1:  "Det gick tyvärr inte att hämta den tidigare spelomgången.";
        2:  "Klart.";
    }
  Rub:      "Du har visst ingenting för det här.";
  Save: switch (n) {
        1:  "Det gick tyvärr inte att spara spelomgången.";
        2:  "Klart.";
    }
  Score: switch (n) {
        1:  if (deadflag) print "I hela spelet fick du "; else print "Hittills har du fått ";
            print score, " poäng av ", MAX_SCORE, " möjliga på ", turns, " drag";
            return;
        2:  "Det räknas inga poäng i den här berättelsen.";
        3:  print ", vilket ger dig rang av ";
    }
  ScriptOff: switch (n) {
        1:  "Det pågick ingen avskrift av spelomgången.";
        2:  "^Här slutar avskriften.";
        3:  "Det gick inte att avbryta avskriften av spelomgången.";
    }
  ScriptOn: switch (n) {
        1:  "Avskrift av spelomgången pågår redan.";
        2:  "Här börjar en avskrift av";
        3:  "Det gick inte att påbörja en avskrift av spelomgången.";
    }
  Search: switch (n) {
        1:  "But it's dark.";    !# Unused?
        2:  "Det finns ingenting på ", (the) x1, ".";
        3:  print "På ", (the) x1, " ";
            WriteListFrom(child(x1), ENGLISH_BIT+TERSE_BIT+CONCEAL_BIT+ISARE_BIT);
            ".";
        4:  print_ret (The) actor, " hittar inget spännande.";
        5:  print (The) x1, " är stäng"; Inflect("d", "t", "da", x1); ", så det syns inte vad som finns i ", (denellerde) x1;
        6:  print (The) x1, " är tom"; Inflect("", "t", "ma", x1); ".";
        7:  print "I ", (the) x1, " ";
            WriteListFrom(child(x1), ENGLISH_BIT+TERSE_BIT+CONCEAL_BIT+ISARE_BIT);
            ".";
        8:  print (The) actor, " letar "; if (x1 has container) print "på "; else print "i "; print (the) x1, ".^";
    }
  SetTo:    print "Nej, det går inte att ställa in ", (denellerde) x1, " på "; naagon();"ting.";
  Show: switch (n) {
        1:  "Du håller inte i ", (the) x1, ".";
        2:  "Det gör inget intryck på ", (the) x1, ".";
    }
  Sing:     "Din sångröst är vedervärdig.";
  Sleep:    print "Du känner "; dig(); " inte särskilt sömnig.";
  Smell:    "Det luktar ingenting oväntat.";
  Sorry:    "Å, för all del.";
  Squeeze: switch (n) {
        1:  "Håll tassarna i styr.";
        2:  "Det händer inget.";
        3:  print (The) actor, " klämmer på ", (the) x1, ".^";
    }
  Strong:   print "Ett "; saadan();"t språk anstår inte en äkta äventyrare.";
  Swing:    "Det finns inget som passar att ", (string) verb_word, " här.";
  SwitchOff: switch (n) {
        1:  "Det går varken att stänga av eller sätta på ", (denellerdem) x1, ".";
        2:  print_ret (cDenellerDe) x1, " är redan av.";
        3:  "Du stänger av ", (the) x1, ".";
        4:  print (The) actor, " stänger av ", (the) x1, ".^";
    }
  SwitchOn: switch (n) {
        1:  "Det går varken att sätta på eller stänga av ", (denellerdem) x1, ".";
        2:  print_ret (cDenellerDe) x1, " är redan på.";
        3:  print_ret (The) actor, " sätter på ", (the) x1, ".";
        4:  print (The) actor, " sätter på ", (the) x1, ".^";
    }
  Take: switch (n) {
        1:  print "Tag"; Inflect("en", "et", "na", x1); ".";
        2:  print "Du tar "; dig(); " i kragen.";
        3:  "Jag tror inte ", (the) x1, " skulle uppskatta det.";
        4:  print "Du måste ";
            if (x1 has supporter) print "av "; else print "ur ";
            print_ret (the) x1, " först.";
        5:  "Du har ", (denellerdem) x1, " redan.";
        6:  print_ret (cDenellerDe) noun, " tillhör nog ", (the) x1, ".";
        7:  print_ret (cDenellerDe) noun, " är nog en del av ", (the) x1, ".";
        8:  print (CDenellerDe) x1, " är inte åtkomlig"; Inflect("", "t", "a", x1); ".";
        9:  print (The) x1, " är inte öpp"; Inflect("en", "et", "na", x1); ".";
        10: print_ret (cDenellerDe) x1, " är där ", (denellerde) x1, " är.";
        11: print_ret (cDenellerDe) x1, " sitter fast.";
        12: "Du har redan för mycket att bära.";
        13: print "(måste stoppa ", (the) x1, " i ", (the) x2,
            " för att få plats med allt)^"; say__p = 0; return;
        14: "Du når inte till ", (the) x1, ".";
        15: "Det går inte att ta med sig ", (the) x1, ".";
        16: print (The) actor, " tar ", (the) x1, ".^";
        }
  Taste:    "Det smakar ingenting oväntat.";
  Tell: switch (n) {
        1:  print "Du talar för "; dig(); " själv ett tag.";
        2:  "Upplysningarna väcker ingen uppståndelse.";
        }
  Think:    "Vilken bra idé.";
  ThrowAt: switch (n) {
        1:  "Meningslöst.";
        2:  "Modet sviker när det kommer till kritan.";
        }
  Tie:      "Det skulle inte tjäna mycket till.";
  Touch: switch (n) {
        1:  "Håll fingrarna i styr!";
        2:  "Du känner ingenting oväntat.";
        3:  "Tror du det tjänar "; naagot(); " till, så ...";
        4:  print (The) actor, " röd vid "; sig(); print ".^";
        5:  print (The) actor, " rör vid "; dig(); print ".^";
        6:  print (The) actor, " rör vid ", (the) x1, ".^";
    }
! Turn: see Pull.
  Unlock:  switch (n) {
        1:  print_ret (cDenellerDe) x1, " verkar inte gå att låsa upp över huvud taget.";
        2:  print (cDenellerDe) x1, " är inte alls låst"; Inflect("", "", "a", x1); ".";
        3:  print_ret (cDenellerDe) x1, " tycks inte passa i låset.";
        5:  "Du låser upp", (the) x1, ".";
        6:  print (The) actor, " låser upp ", (the) x1, ".^";
    }
  Verify: switch (n) {
        1:  "Filen med spelet har verifierats vara intakt.";
        2:  "Filen med spelet gick inte att verifiera som intakt utan kan vara skadad.";
    }
  Wait: switch (n) {
        1:  "Tiden går.";
        2:  print (The) actor, " väntar.^";
    }
  Wake:     "Den fasansfulla sanningen är att du inte drömmer.";
  WakeOther:"Det "; ska(); " väl ändå inte behövas?";
  Wave: switch (n) {
        1:  "Men du håller ju inte i ", (denellerdem) x1, ".";
        2:  "Du ser rätt fånig ut, där du står och viftar med ", (the) x1, ".";
        3:  print (The) actor, " viftar med ", (the) x1, ".^";
    }
  WaveHands:"Du vinkar. Du känner dig löjlig.";
  Wear: switch (n) {
        1:  print (cDenellerDem) x1, " går väl inte att ta på "; sig(); "!";
        2:  "Du håller inte i ", (denellerdem) x1, " än!";
        3:  print "Du har redan på "; dig(); print_ret " ", (denellerdem) x1, "!";
        4:  print "Du tar på "; dig(); print_ret " ", (the) x1, ".";
        5:  print (The) actor, " tar på "; sig(); print " ", (the) x1, ".^";
    }
! Yes:  see No.
];
-) instead of "Long Texts" in "Language.i6t".

Section - Printing Mechanism
[B/langt§13]

[No changes are needed in this section.]


Chapter - Printing

Section - Status Line Utilities
[B/print§8]

Include (-
[ SL_Score_Moves; 
if (not_yet_in_play) return; 
#ifdef NO_SCORING; print sline2; #ifnot; print sline1, "/", sline2; #endif; 
]; 
[ SL_Location; 
if (not_yet_in_play) return; 
if (location == thedark) { 
BeginActivity(PRINTING_NAME_OF_DARK_ROOM_ACT); 
if (ForActivity(PRINTING_NAME_OF_DARK_ROOM_ACT) == false) 
L__M(##Miscellany, 71); 
EndActivity(PRINTING_NAME_OF_DARK_ROOM_ACT); 
} else { 
FindVisibilityLevels(); 
!# In Swedish we want to treat room names as any other names;
!# wherefore we comment out the next line.
! if (visibility_ceiling == location) print (name) location; else     !#
print (The) visibility_ceiling; 
} 
]; 
-) instead of "Status Line Utilities" in "Printing.i6t".


Section - Banner
[B/print§9]

Include (-
[ Banner;
   BeginActivity(PRINTING_BANNER_TEXT_ACT);
   if (ForActivity(PRINTING_BANNER_TEXT_ACT) == false) {
	   	VM_Style(HEADER_VMSTY);
		print (string) Story;
		VM_Style(NORMAL_VMSTY);
		new_line;
		print (string) Headline;
		#ifdef Story_Author;
		print " av ", (string) Story_Author;
		#endif; ! Story_Author
		new_line;
		VM_Describe_Release();
		print " / Inform 7 build ", (string) NI_BUILD_COUNT, " ";
		print "(I6/v"; inversion;
		print " lib ", (string) LibRelease, ") ";
		#Ifdef STRICT_MODE;
		print "S";
		#Endif; ! STRICT_MODE
		#Ifdef DEBUG;
		print "D";
		#Endif; ! DEBUG
		new_line;
    }
    EndActivity(PRINTING_BANNER_TEXT_ACT);
];
-) instead of "Banner" in "Printing.i6t".


Section - Standard Name Printing Rule
[B/print§16]

[We add a few lines to the I6 implementation of the printing the name activity. These lines see to it that printed names are capitalised when the printing the name activity is called by a say-phrase using the capitalised article "The".]

Include (-
Global caps_mode = false;

[ STANDARD_NAME_PRINTING_R obj;
	obj = parameter_object;
    if (obj == 0) {
    	print (string) NOTHING__TX; return;
    }
    switch (metaclass(obj)) {
		Routine:  print "<routine ", obj, ">"; return;
		String:   print "<string ~", (string) obj, "~>"; return;
		nothing:  print "<illegal object number ", obj, ">"; return;
    }
    if (obj == player) { 
   	    if (indef_mode == NULL && caps_mode) print (string) YOU__TX;
   	    else print (string) YOURSELF__TX;
   	    return;
   	}
!# --- The LanguagePrintShortName routine is meant to be defined in translation extensions. We don't. Instead, we add some code directly to STANDARD_NAME_PRINTING_R.
!# The text properties short_name_indef and cap_short_name are likwise meant for use in translation extensions. We don't use them either. 
!# This all means that the following section really does no work. (I doesn't in the English original, either.)
!# --- ---
    #Ifdef LanguagePrintShortName;
    if (LanguagePrintShortName(obj)) return;
    #Endif; ! LanguagePrintShortName
    if (indef_mode && obj.&short_name_indef ~= 0 &&
    	PrintOrRun(obj, short_name_indef, true) ~= 0) return;
    if (caps_mode &&
    obj.&cap_short_name ~= 0 && PrintOrRun(obj, cap_short_name, true) ~= 0) {
    caps_mode = false; ! --- For som or no reason this line fires
    return;
   }
!# --- ---
!# --- Here, on the other hand, we have added an if-clause that calls CPrintOrRun with the argument short_name (i.e. "the printed name" in I7 terminology), if the caps_mode flag is set. In Section 4 below we see to it that it is set when CDefArt is called (i.e. when we 'say "[The noun]"'). 
    if (caps_mode &&
        obj.&short_name ~= 0 && CPrintOrRun(obj, short_name, true) ~= 0) return;    !#
!# --- ---
    if (obj.&short_name ~= 0 && PrintOrRun(obj, short_name, true) ~= 0) return;
    print (object) obj;
];
-) instead of "Standard Name Printing Rule" in "Printing.i6t".


Section - Object Names II
[B/print§17]

[Another change to accommodate the four Swedish genders. 
(The I6 routine PrefaceByArticle prints the definite and indefinite articles separately, before calling the PSN__ routine, which prints the name of the object by calling the standard name printing rule).]

Include (-
Global short_name_case;

[ PrefaceByArticle obj acode pluralise capitalise  i artform findout artval;
    if (obj provides articles) {
        artval=(obj.&articles)-->(acode+short_name_case*LanguageCases);
        if (capitalise)
            print (Cap) artval, " ";
        else
            print (string) artval, " ";
        if (pluralise) return;
        print (PSN__) obj; return;
    }

    i = GetGNAOfObject(obj);
    if (pluralise) {
!        if (i < 3 || (i >= 6 && i < 9)) i = i + 3;    !# This is the line we need to change.
        if (i < 4 || (i >= 8 && i < 12)) i = i + 4;    !#
    }
    i = LanguageGNAsToArticles-->i;

    artform = LanguageArticles
        + 3*WORDSIZE*LanguageContractionForms*(short_name_case + i*LanguageCases);

!# --- The following section doesn't apply to a language like Swedish, where articles have no alternative contraction forms.
    #Iftrue (LanguageContractionForms == 2);
    if (artform-->acode ~= artform-->(acode+3)) findout = true;
    #Endif; ! LanguageContractionForms
    #Iftrue (LanguageContractionForms == 3);
    if (artform-->acode ~= artform-->(acode+3)) findout = true;
    if (artform-->(acode+3) ~= artform-->(acode+6)) findout = true;
    #Endif; ! LanguageContractionForms
    #Iftrue (LanguageContractionForms == 4);
    if (artform-->acode ~= artform-->(acode+3)) findout = true;
    if (artform-->(acode+3) ~= artform-->(acode+6)) findout = true;
    if (artform-->(acode+6) ~= artform-->(acode+9)) findout = true;
    #Endif; ! LanguageContractionForms
    #Iftrue (LanguageContractionForms > 4);
    findout = true;
    #Endif; ! LanguageContractionForms
!# --- ---

    #Ifdef TARGET_ZCODE;
    if (standard_interpreter ~= 0 && findout) {
        StorageForShortName-->0 = 160;
        @output_stream 3 StorageForShortName;
        if (pluralise) print (number) pluralise; else print (PSN__) obj;
        @output_stream -3;
        acode = acode + 3*LanguageContraction(StorageForShortName + 2);
    }
    #Ifnot; ! TARGET_GLULX
    if (findout) {
        if (pluralise)
            Glulx_PrintAnyToArray(StorageForShortName, 160, EnglishNumber, pluralise);
        else
            Glulx_PrintAnyToArray(StorageForShortName, 160, PSN__, obj);
        acode = acode + 3*LanguageContraction(StorageForShortName);
    }
    #Endif; ! TARGET_

    Cap (artform-->acode, ~~capitalise); ! print article
    if (pluralise) return;
    print (PSN__) obj;
];
-) instead of "Object Names II" in "Printing.i6t".


Section - Object Names III
[B/print§18]

[These routines call PrefaceByArticle with the values that the latter need to print the correct article before a noun phrase. We simply add two lines to one of them, viz. CDefArt (the routine we call when we 'say "[The noun]"'): one line to set the caps_mode flag before calling PrefaceByArticle, which in turn first prints nothing (since we have defined the definite articles as empty text strings) and then calls the PSN__ routine (i.e. the printing the name activity), and on line to clear it afterwards. When caps_mode is set, it tells a few lines of code added to the standard name printing rule to capitalise the printed name, using the CprintOrRun routine (documented at §14 "Short Name Storage" in the Printing Template).]

Include (-
[ IndefArt obj i;
	if (obj == 0) { print (string) NOTHING__TX; rtrue; }
    i = indef_mode; indef_mode = true;
    if (obj has proper) { 
        indef_mode = NULL;
        print (PSN__) obj; indef_mode = i;
        return;
    }
    if ((obj provides article) && (obj.article ~= EMPTY_TEXT_VALUE)) {
        PrintOrRun(obj, article, true); print " ", (PSN__) obj; indef_mode = i;
        return;
    }
    if (obj has (+ non-count +)) {            !# This block of code added.
        print (PSN__) obj; indef_mode = i;    !#
        return;                               !# 
    }                                         !# 
    PrefaceByArticle(obj, 2); indef_mode = i;
];

[ CIndefArt obj i;
	if (obj == 0) { CPrintOrRun(NOTHING__TX, 0); rtrue; }
    i = indef_mode; indef_mode = true;
    if (obj has proper) {
        indef_mode = NULL; caps_mode = true;
        print (PSN__) obj;
        indef_mode = i; caps_mode = false;
        return;
    }
    if ((obj provides article) && (obj.article ~= EMPTY_TEXT_VALUE)) {
        CPrintOrRun(obj, article); print " ", (PSN__) obj; indef_mode = i;
        return;
    }
    if (obj has (+ non-count +)) {            !# This block of code added.
        caps_mode = true;                     !#
        print (PSN__) obj;                    !#
        caps_mode = false; indef_mode = i;    !#
        return;                               !#
    }                                         !#
    PrefaceByArticle(obj, 2, 0, 1); indef_mode = i;
];

[ DefArt obj i;
    i = indef_mode; indef_mode = false;
    if ((~~obj ofclass Object) || obj has proper) {
        indef_mode = NULL; print (PSN__) obj; indef_mode = i;
        return;
    }
    PrefaceByArticle(obj, 1); indef_mode = i;
];

[ CDefArt obj i;
    i = indef_mode; indef_mode = false;
    if ((obj ofclass Object) && (obj has proper || obj == player)) {
        indef_mode = NULL; caps_mode = true;
        	print (PSN__) obj;
        indef_mode = i; caps_mode = false;
        return;
    }
    if ((~~obj ofclass Object) || obj has proper) {
        indef_mode = NULL; print (PSN__) obj; indef_mode = i;
        return;
    }
    caps_mode = true;    !# Here we set the caps_mode flag
    PrefaceByArticle(obj, 0);
    indef_mode = i;
    caps_mode = false;    !# And now it's done its duty
];

[ PrintShortName obj i;
    i = indef_mode; indef_mode = NULL;
    PSN__(obj); indef_mode = i;
];
-) instead of "Object Names III" in "Printing.i6t".


Chapter - Utilities

Section - Saying Phrases
[B/utilt§1]

Include (-
[ SayPhraseName closure;
	if (closure == 0) print "ingenting";
	else print (string) closure-->2;
];
-) instead of "Saying Phrases" in "Utilities.i6t".


Chapter - Time

Section - Digital Printing
[B/timet§4]

Include (-
[ PrintTimeOfDay t h aop;
    if (t<0) { print "<ingen tid>"; return; }
!#    if (t >= TWELVE_HOURS) { aop = "pm"; t = t - TWELVE_HOURS; } else aop = "am"; 
    h = t/ONE_HOUR; !# (h==0) h=12;
    if (t<10) print "0"; !# Adding this line
!#  print h, ":";
    print h, ".";
    if (t%ONE_HOUR < 10) print "0"; print t%ONE_HOUR; !# print " ", (string) aop;
];
-) instead of "Digital Printing" in "Time.i6t".


Section - Analogue Printing
[B/timet§5]

[This routine has been pretty much completely rewritten.]

Include (-
[ PrintTimeOfDayEnglish t h m dir nmdk;
  h = (t/ONE_HOUR) % 12; m = t%ONE_HOUR; if (h==0) h=12;
  if (t == TWENTY_FOUR_HOURS || t < 5*ONE_HOUR) nmdk = "natten";
#ifdef MORRON_SPELLING;
  if (t >= 5*ONE_HOUR && t < 10*ONE_HOUR) nmdk = "morronen";  
#ifnot;
  if (t >= 5*ONE_HOUR && t < 10*ONE_HOUR) nmdk = "morgonen";  
#endif;
#ifdef DAN_SPELLING;
  if (t >= 10*ONE_HOUR && t < 18*ONE_HOUR) nmdk = "dan";         
#ifnot;
  if (t >= 10*ONE_HOUR && t < 18*ONE_HOUR) nmdk = "dagen"; 
#endif;        
  if (t >= 18*ONE_HOUR && t < TWENTY_FOUR_HOURS) nmdk = "kvällen"; 
  if (t >= TWELVE_HOURS) t = t - TWELVE_HOURS;                     
  if (m==0) { print (number) h, " på ", (string) nmdk ; return; }  

  dir = " över";
  if (m < HALF_HOUR && m >= HALF_HOUR-5) { 
      m = HALF_HOUR-m; h = (h+1)%12; 
      if (h==0) h=12; dir = " i halv"; 
  } 
  if (m == HALF_HOUR) {
      h = (h+1)%12; 
      if (h==0) h=12; dir = ""; 
  }
  if (m > HALF_HOUR && m <= HALF_HOUR+5) {
      m = m-HALF_HOUR; h = (h+1)%12; 
      if (h==0) h=12; dir = " över halv"; 
      } 
  if (m > HALF_HOUR+5) {
      m = ONE_HOUR-m; h = (h+1)%12; 
      if (h==0) h=12; dir = " i"; 
  } 

  switch(m) {
      QUARTER_HOUR: print "kvart"; 
      HALF_HOUR: print "halv";
      default: 
          if (m==1) print "en"; else print (number) m; 
          if (m == 1) print " minut"; else print " minuter";
  }
  print (string) dir, " ", (number) h; 
  if (m == HALF_HOUR) print " på ", (string) nmdk; 
];
-) instead of "Analogue Printing" in "Time.i6t".


Section - Understanding
[B/timet§6]

[This routine has been pretty much completely rewritten.]

Include (-
[ TIME_TOKEN first_word second_word w at length flag
	illegal_char offhour hr mn i original_wn;
	original_wn = wn;
{-call:Plugins::Parsing::Tokens::Values::time}
	wn = original_wn;
  first_word = NextWordStopped(); 
  !#  Ignore "klockan", "prick", "på slaget", "jämnt". Recognize "mitt på dagen", "midnatt", etc.
  for (w = first_word : w == 'vid' or 'på' or 'slaget' or 'prick' or 'jämnt' or 'klockan': w = first_word) {
		first_word = NextWordStopped();
  }
  if (first_word == 'mitt') {
      if (NextWordStopped() ~= 'på' or 'i//') wn--; 
      second_word = NextWordStopped();
      switch (second_word) { 
          'natt', 'natten': first_word = 'midnatt';
          'dag', 'dagen', 'dan': first_word = 'middag';
      }
  }
  switch (first_word) {
      'midnatt': parsed_number = 0; return GPR_NUMBER; 
      'middag', 'middagstid': parsed_number = TWELVE_HOURS; return GPR_NUMBER; 
  }
	
  ! Next try the format 12:02 
  !# or 12.02 !#
  at = WordAddress(wn-1); length = WordLength(wn-1);
	
  if (length<=2) { 
      hr = first_word; 
      if (NextWordStopped() == './/') mn = NextWordStopped();
      else wn--;
      second_word = '24timmars'; 
      parsed_number = HoursMinsWordToTime(hr, mn, second_word);
      if (parsed_number == -1) return GPR_FAIL;
      return GPR_NUMBER;
  }
!# --- Section of mostly unaltered I6 template code
  for (i=0: i<length: i++) {
      switch (at->i) {
          ':' : 
              if (flag == false && i>0 && i<length-1) flag = true;
              else illegal_char = true;
          '0', '1', '2', '3', '4', '5', '6', '7', '8', '9': ;
          default: illegal_char = true;
      }
  }
  if (length < 3 || length > 5 || illegal_char) flag = false;
  if (flag) {
      for (i=0: at->i~=':': i++, hr=hr*10) 
          hr = hr + at->i - '0'; 
      hr = hr/10;
      for (i++: i<length: i++, mn=mn*10) 
          mn = mn + at->i - '0';
      mn = mn/10;
!#    second_word = NextWordStopped(); !#
      second_word = '24timmars'; !#
      parsed_number = HoursMinsWordToTime(hr, mn, second_word);
!#	  if (second_word ~= 'pm' or 'am') wn--; !#
      if (parsed_number == -1) return GPR_FAIL;
      return GPR_NUMBER;
  }
!# ---
  ! Lastly the wordy format
  !# "noll nio tjugofem", "nollnoll trettio", etc.
  if (first_word == 'noll') first_word = NextWordStopped();
  if (first_word == 'noll' or 'nollnoll') mn = 0;
  !# "åtta minuter (i/över halv elva på kvällen)" etc.
  else mn = I7_ExtendedTryNumber(wn-1); 
  if (NextWordStopped() ~= 'minut' or 'minuter') wn--; 
  !# "kvart (i/över ett)" etc.
  if (first_word == 'kvart') mn = QUARTER_HOUR;
  !# "halv två" etc.
  if (first_word == 'halv') { offhour = HALF_HOUR; mn = 0; jump Halv_timme; }

  first_word = NextWordStopped();
  switch (first_word) {
      !# "kvart i elva", "fem över halv två", etc.
      'i//': 
          mn = -mn; 
          if (NextWordStopped() == 'halv') offhour = HALF_HOUR; 
      'över': 
          if (NextWordStopped() == 'halv') offhour = HALF_HOUR; 
      !# "(klockan) ett" etc.
      -1: 
          hr = mn; mn = 0; 
          parsed_number = HoursMinsWordToTime(hr, mn, second_word); 
          return GPR_NUMBER;
      !# "nitton och trettio", "sjutton noll noll", "nio noll tre" etc.
      'och', 'noll': 
          hr = mn; mn = I7_ExtendedTryNumber(wn); 
          if (NextWordStopped() == 'noll') mn = 0; 
          second_word = '24timmars'; 
          parsed_number = HoursMinsWordToTime(hr, mn, second_word); 
          return GPR_NUMBER;
      !# "sjutton nollnoll" etc.
      'nollnoll': 
          hr = mn; mn = 0; 
          NextWordStopped(); 
          second_word = '24timmars'; 
          parsed_number = HoursMinsWordToTime(hr, mn, second_word); 
          return GPR_NUMBER;
      default: 
          hr = mn; mn = I7_ExtendedTryNumber(wn-1); 
          !# "(klockan) fem (på eftermiddagen)" etc.
          if (mn == -1000) { mn = 0; wn--; } 
          !# "nitton trettio" etc.
          else { 
              NextWordStopped(); 
              second_word = '24timmars'; 
              parsed_number = HoursMinsWordToTime(hr, mn, second_word); 
              return GPR_NUMBER; }
  }
	
  .Halv_timme;
  !# "halv tre", "kvart över elva","fem i halv nio", etc.
  if (offhour == HALF_HOUR) { 
      hr = TryNumber(wn); wn++; 
      hr--; mn = HALF_HOUR+mn;  
  }
  else hr = TryNumber(wn-1);

 !# Ignore "prick", "på slaget", "jämnt". Recognize "på förmiddagen", "i natt", "om kvällen" etc.
  second_word = NextWordStopped(); 
  for (w = second_word : w == 'om' or 'i//' or 'på' or 'slaget' or 'prick' or 'jämnt': w = second_word) 
      second_word = NextWordStopped(); 
  parsed_number = HoursMinsWordToTime(hr, mn, second_word);
  return GPR_NUMBER;	
];

[ HoursMinsWordToTime hour minute word x y;
  if (hour >= 24) return -1;
  if (minute >= ONE_HOUR) return -1;
  x = hour*ONE_HOUR + minute; 
  if (hour >= 13) return x; 
  x = x % TWELVE_HOURS;

!#	if (word == 'pm') x = x + TWELVE_HOURS; !#
  switch (word) {
      '24timmars': 
          return x;
      'förmiddagen', 'förmiddan', 'fm':  
          return x;
      'eftermiddagen', 'eftermiddan', 'em': 
          x = x + TWELVE_HOURS; 
      'morgonen', 'morronen': 
          if (x<=11*ONE_HOUR) return x; 
          else return GPR_FAIL;
      'kvällen', 'kväll': 
          if (x>=4*ONE_HOUR) x = x + TWELVE_HOURS; 
          else return GPR_FAIL;
      'dagen', 'dan': 
          if (x>=10*ONE_HOUR) return x; 
          if (x<=6*ONE_HOUR) x = x + TWELVE_HOURS; 
          else return GPR_FAIL;
      'natten', 'natt', 'aftonen', 'afton': 
          if (x<6*ONE_HOUR) return x; 
          if (x>=11*ONE_HOUR) x = x + TWELVE_HOURS; 
          else return GPR_FAIL;
      default:
          y=x;
          if (the_time < TWELVE_HOURS && x < the_time) 
              y = x + TWELVE_HOURS;
          if (the_time >= TWELVE_HOURS && x+TWELVE_HOURS > the_time && x+TWELVE_HOURS <= TWENTY_FOUR_HOURS) 
              y = x + TWELVE_HOURS; 
          x = y;
  }
  return x;
];
-) instead of "Understanding" in "Time.i6t".


Section - Relative Time Token
[B/timet§4]

[This routine has been pretty much completely rewritten.]

Include (-
[ RELATIVE_TIME_TOKEN original_wn first_word second_word third_word offhour mult mn ; 
	original_wn = wn; !# I have no idea why these lines are here.
	wn = original_wn; !# In TIME_TOKEN there is a call between them.

  first_word = NextWordStopped(); 

  !# "trekvart" or "trekvarts (timme)"
  if (first_word == 'trekvart' or 'trekvarts') { 
      mn = 3; 
      mult = QUARTER_HOUR; 
      jump Trekvart1;
  }
  !# "fyra minuter", "tre kvart", "två timmar", "en halvtimme", etc.
  else { wn--; mn=I7_ExtendedTryNumber(wn); wn++; }	
  first_word = NextWordStopped();
  switch (first_word) {
      'minuter', 'minut': mult = 1; 
      'kvart', 'kvarts', 'kvartar': mult = QUARTER_HOUR; 
      'halv', 'halva', 'halvtimme', 'halvtimma', 'halvtimmar': mult = HALF_HOUR; 
      'timmar', 'timme', 'timmar': mult = ONE_HOUR; 

  !# "en och en halv (timme)", "två och en kvarts (timme)", "tre och tre kvarts (timme)", etc.
      'och':
          second_word = NextWordStopped();
          switch (second_word){
              'en':
                  third_word = NextWordStopped(); 
                  if (third_word == 'halv' or 'halvtimme' or 'halvtimma') { mult = ONE_HOUR; offhour = HALF_HOUR; }
                  else if (third_word == 'kvarts') { mult = ONE_HOUR; offhour = QUARTER_HOUR; }
                  else wn--;
              'tre':
                  third_word = NextWordStopped(); 
                  if (third_word == 'kvarts') { mult = ONE_HOUR; offhour = 3*QUARTER_HOUR; }
                  else wn--;
              'trekvart', 'trekvarts':
                  mult = ONE_HOUR; offhour = 3*QUARTER_HOUR;
              default: wn--;
          }
      default: return GPR_FAIL;
  }

  .Trekvart1;
  parsed_number = (mn*mult)+offhour;

!# "(två) timmar", "(tre kvarts) timme", "(en och en halv) timme", "(fem) timmar och tjugotre minuter", "(två) timmar och tre kvart", etc.
  if (mult == QUARTER_HOUR or HALF_HOUR or ONE_HOUR) { 
      if (NextWordStopped() ~= 'timme' or 'timma' or 'timmar') wn--;
      if (NextWordStopped() ~= 'och') wn--;
      if (NextWordStopped() == 'trekvart') { mn = 3; mult = QUARTER_HOUR; jump Trekvart2; } else wn--;
      mn=I7_ExtendedTryNumber(wn);
      if (mn ~= -1000) { !# We have a number
          wn++;
          first_word = NextWordStopped();
          switch (first_word) {
              'minuter', 'minut': mult = 1; 
              'kvart', 'kvarts', 'kvartar': mult = QUARTER_HOUR; 
              'halv', 'halva', 'halvtimme', 'halvtimma', 'halvtimmar': mult = HALF_HOUR; 
              default: wn = wn-2; 
          }

      .Trekvart2;
      parsed_number = parsed_number + (mn*mult);
      }
  }
  return GPR_NUMBER;
];
-) instead of "Relative Time Token" in "Time.i6t".


Volume - Utility Functions - Not for release

Book - Working Out Text Substitutions for Definite Species (by Björn Paulsen)

Part - Specifics

Section - Variables

förstaInput and andraInput are indexed texts that vary.
begärBestämd, begärObestämd and presenteraResultat are truth states that vary.
avsettObjekt is an object that varies.


Section - Actions, rules, and relevant phrases

To decide whether name request is going on:
	if begärBestämd is true or begärObestämd is true, yes;
	no.

To end name request:
	now begärBestämd is false;
	now begärObestämd is false;
	now presenteraResultat is false;
	now avsettObjekt is nothing.

Begär objektnamn rakt av is an action applying to nothing.
Understand "objekt" or "förslag" as begär objektnamn rakt av.
Begär objektnamn is an action applying to one thing.
Understand "objekt [any thing]" or "förslag [any thing]" as begär objektnamn.
Understand "objekt [any room]" or "förslag [any room]" as begär objektnamn.

Carry out begär objektnamn: 
	now begärBestämd is true;
	now avsettObjekt is the noun.

Carry out begär objektnamn rakt av:
	now begärBestämd is true.

After reading a command:
	if name request is going on:
		if begärObestämd is false, now förstaInput is the player's command;
		otherwise now andraInput is the player's command;
		change the text of the player's command to "l";

To say begärBestämdForm:
	say "Skriv namnet i bestämd form ('den röda lyktan').[line break]";
To say begärObestämdForm:
	say "Skriv nu dess obestämda form ('en röd lykta').[line break]";
To say errInputÄrTom:
	say "Beklagar, du tycks inte ha skrivit in någon text.";
To say errOrdenÖverensstämmerInte:
	say "Beklagar, programmet stödjer inte meningar med olika antal ord.";
To say errKonstigBöjning:
	say "Beklagar, antingen böjdes ord i dessa meningar på sätt som inte förekommer inom svenskan, eller så är programmet sönder.";
To say förslagPrefix:
	say "Förslag: The printed name of ";
	if avsettObjekt is not nothing, say "[italic type][avsettObjekt][roman type]";
	otherwise say "<[italic type]objektet[roman type]>";
	say " is '";
To say förslagSuffix:
	say "'.";

Report begär objektnamn: say begärBestämdForm.
Report begär objektnamn rakt av: say begärBestämdForm.

Instead of looking while name request is going on:
	if begärObestämd is false:
		now begärObestämd is true;
		say begärObestämdForm;
	otherwise:
		handle implicit pronouns;
		if förstaInput is empty and andraInput is empty:
			say errInputÄrTom;
		otherwise if words don't match:
			say errOrdenÖverensstämmerInte;
		otherwise:
			let output be indexed text;
			let output be the final phrase;
			if output is ".":
				say errKonstigBöjning;
			otherwise:
				say förslagPrefix;
				say the final phrase;
				say förslagSuffix;
		end name request.

[Lägger till en obestämd forms pronomen om det saknas.]
To handle implicit pronouns:
	let förstaIn, andraIn be indexed text;
	let förstaIn be förstaInput;
	let andraIn be andraInput;
	let n be a number;
	let n be the greater of the number of words in förstaIn or the number of words in andraIn;
	repeat with x running from 1 to n:
		if word number x in förstaInput is "den" and word number x in andraInput is not "en":
			let andraIn be inserted "en" at word x of andraIn;
		if word number x in andraInput is "den" and word number x in förstaInput is not "en":
			let förstaIn be inserted "en" at word x of förstaIn;
	repeat with x running from 1 to n:
		if word number x in förstaInput is "det" and word number x in andraInput is not "ett":
			let andraIn be inserted "ett" at word x of andraIn;
		if word number x in andraInput is "det" and word number x in förstaInput is not "ett":
			let förstaIn be inserted "ett" at word x of förstaIn;
	now förstaInput is förstaIn;
	now andraInput is andraIn.


Section - Decide phrases

[With thanks to Eric Temple.]
To decide which number is the greater/max of/-- (X - a number) or (Y - a number):
	if Y > X, decide on Y;
	decide on X.

To decide which indexed text is final phrase: 
	let förstan, andran, rot, primus and secundus be indexed text;
	let resultatet be indexed text;
	repeat with counter running from 1 to the number of words in andraInput:
		let förstan be word number counter in förstaInput;
		let andran be word number counter in andraInput;
		if the result of förstan and andran is not empty:
			let resultatet be "[unicode 91][the result of förstan and andran] [unicode 93]";
		otherwise:
			let rot be the root of förstan and andran;
			let resultatet be "[resultatet][rot]";
			let primus be the indefinite ending of förstan and andran;
			let secundus be the definite ending of förstan and andran;
			unless primus is empty and secundus is empty:
				let resultatet be "[resultatet][unicode 91][the token of primus and secundus][unicode 93][unless the counter is the number of words in andraInput] [end if]";
			otherwise if rot is not empty:
				let resultatet be "[resultatet][unless the counter is the number of words in andraInput] [end if]";
			otherwise:
				decide on ".";
		unless the counter is the number of words in andraInput, let resultatet be "[resultatet][run paragraph on]";
	decide on resultatet.
	
To decide which indexed text is the result of (förstnämnda - indexed text) and (sistnämnda - indexed text):
	let obest, best be indexed text;
	repeat through the table of Swedish substitutions:
		let the obest be the obestämd entry;
		let the best be the bestämd entry;
		if förstnämnda exactly matches the text "[best]" and sistnämnda exactly matches the text "[obest]":
			decide on the resultat entry;
		if förstnämnda exactly matches the text "[obest]" and sistnämnda exactly matches the text "[best]":
			decide on the resultat entry;
	decide on "".

To decide which indexed text is the token of (förstnämnda - indexed text) and (sistnämnda - indexed text):
	let obest, best be indexed text;
	repeat through the table of Swedish suffixes:
		let the obest be the obestämd entry;
		let the best be the bestämd entry;
		if förstnämnda exactly matches the text "[best]" and sistnämnda exactly matches the text "[obest]":
			decide on the resultat entry;
		if förstnämnda exactly matches the text "[obest]" and sistnämnda exactly matches the text "[best]":
			decide on the resultat entry;
	decide on "".

To decide whether words don't match:
	if the number of words in förstaInput is not the number of words in andraInput, yes;
	no.


Section - Tables

Table of Swedish substitutions
obestämd	bestämd	resultat
"en"	"den"	"den"
"ett"	"det"	"det"


Table of Swedish suffixes
obestämd	bestämd	resultat
""	"a"	"a"
""	"n"	"n"
""	"en"	"en"
"a"	"en"	"a-en"
""	"et"	"et"
""	"t"	"t"
""	"na"	"na"
""	"ena"	"ena"
""	"e"	"e"
"t"	"a"	"t-a"
""	"men"	"men"
""	"met"	"met"
""	"nen"	"nen"
""	"net"	"net"
"en"	"net"	"en-net"
"en"	"nen"	"en-nen"
"er"	"ret"	"er-ret"
"er"	"ren"	"er-ren"
"el"	"let"	"el-let"
"el"	"len"	"el-len"
"mel"	"len"	"mel-len"
"tt"	"a"	"tt-a"
"tt"	""	"tt"
"t"	"da"	"t-da"
"tt"	"da"	"tt-da"
"tt"	"dda"	"tt-dda"
"t"	"de"	"t-de"
""	"ma"	"ma"
""	"me"	"me"
"t"	"ma"	"t-ma"
"t"	"na"	"t-na"
"en"	"a"	"en-a"
"et"	"a"	"et-a"
"en"	"na"	"en-na"
"en"	"ne"	"en-ne"
"et"	"na"	"et-na"
"er"	"ra"	"er-ra"
"er"	"re"	"er-re"
"ert"	"ra"	"ert-ra"
"el"	"la"	"el-la"
"el"	"le"	"el-le"
"elt"	"la"	"elt-la"
"mal"	"le"	"mal-la"
"mal"	"le"	"mal-le"
"malt"	"la"	"malt-la"
"ten"	"lla"	"ten-lla"
"ten"	"lle"	"ten-lle"
"tet"	"lla"	"tet-lla"


Part - General functionality			

To decide which indexed text is the/-- root of (obest - indexed text) and (best - indexed text):
	let root be indexed text;
	let antal be a number;
	repeat with x running from 1 to the number of characters in obest:
		if character number x in obest exactly matches the text character number x in best:
			let root be "[root][character number x in obest]";
		otherwise:
			break;
	decide on root.

To decide which indexed text is the/-- indefinite ending of (obest - indexed text) and (best - indexed text):
	let root be indexed text;
	let root be the root of obest and best;
	replace the regular expression "^[root]" in obest with "";
	decide on obest.

To decide which indexed text is the/-- definite ending of (obest - indexed text) and (best - indexed text):
	let root be indexed text;
	let root be the root of obest and best;
	replace the regular expression "^[root]" in best with "";
	decide on best.

To decide which indexed text is inserted (snippet - indexed text) at word (index - a number) of (sentence - indexed text):
	let resultat be indexed text;
	if the index is greater than 1:
		repeat with x running from 1 to the index minus 1:
			let resultat be "[resultat][unless x is 1] [end if][word number x in the sentence]";
	let resultat be "[resultat][unless resultat is empty] [end if][snippet]";
	if the number of words in the sentence is not the index minus 1:
		repeat with x running from the index to the number of words in the sentence plus index minus 1:
			let resultat be "[resultat] [word number x in the sentence]";
	decide on resultat.


Volume - Localization of Built-In Extensions

Book - Swedish Basic Help Menu (for use with Basic Help Menu by Emily Short)

Chapter - Basic Help Menu (in place of Basic Help Menu by Emily Short)

Table of Basic Help Options
title	subtable	description	toggle
"Om [story title]"	a table-name	"Ett [story genre]-spel."	a rule
"Hur man spelar"	Table of Instruction Options	--	--

Table of Instruction Options
title	subtable	description	toggle
"Om interaktiv fiktion"	a table-name	"Detta spel är ett exempel på interaktiv fiktion. I interaktiv fiktion (även kallat IF) spelar du huvudpersonen i en berättelse. Det du skriver på datorn bestämmer vad huvudpersonen gör och vad som händer i berättelsen. I somliga IF-spel ingår [lite] grafik, men [de] är undantag: illustrationerna till spelet står vanligen din egen fantasi för. Å andra sidan kan du försöka [dig] på att göra nästan vad som helst: i många andra dataspel kan du bara skjuta, röra [dig] åt olika håll och undersöka saker genom att klicka på dem med musen, men i IF är oftast betydligt fler handlingar möjliga."	a rule
"Vad är '[command prompt]' till för?"	a table-name	"[command prompt]-tecknet betyder: 'Okej, vad vill du göra den här gången?'  Här skriver du dina instruktioner till huvudpersonen -- oftast ett verb i imperativ, eventuellt med prepositioner och  objekt.: till exempel TITTA, TA FISKEN, TITTA PÅ FISKEN eller TA PÅ FISKEN."	a rule
"Hur man börjar"	--	"Det första man [ska] göra i ett spel är att bekanta [sig] med omgivningarna och ta reda på vad spelet går ut på. Prologen kan innehålla ledtrådar, så läs den noggrant. Det är också bra att ta en titt på platsen där du befinner [dig] i. Åt vilka håll kan du gå? Vilka föremål finns där du är? Är det något av föremålen som verkar intressant, bör du UNDERSÖKA [dem].[paragraph break]Du kan också titta närmare på [dig] själv (UNDERSÖK [if the dej spelling option is active or the informal spelling option is active]MEJ[otherwise]MIG[end if]) för att se om du kan få reda på [något] mer om personen du spelar. Kommandot TILLHÖRIGHETER talar om vad du har med [dig] för saker.[paragraph break]När du har koll på läget, kan du börja utforska spelvärlden. Gå från plats till plats, och utforska alla ställen du kan hitta."	--
"Rum och riktningar"	--	"Du befinner [dig] alltid på en viss plats eller i ett visst rum. När du kommer till en ny plats beskriver spelet vad du ser där. På så sätt får du reda på två viktiga saker: dels vilka saker som finns där och som du kan försöka göra [något] med eller plocka upp och ta med [dig], dels vilka vägar kan du kan ta när du vill fortsätta därifrån. Vill du läsa beskrivningen av platsen igen, är det bara att skriva TITTA. [paragraph break]Vill du gå [någon] annanstans, berättar du det för spelet genom att tala om vilken riktning du vill gå i: t.ex. GÅ NORRUT eller GÅ ÅT SYDVÄST. För enkelhets skull behöver du inte skriva GÅ och du kan också förkorta väderstrecken. Alltså räcker det att skriva NORR, SÖDER, ÖSTER, VÄSTER, NORDOST, SYDOST, NORDVÄST, SYDVÄST (eller förkortat N, S, Ö, V, NO, SO, NV, och SV.[paragraph break]På sina håll går det också att gå UPP, NED, IN och UT."	--
"Föremål"	--	"I spelet kommer det att finnas diverse föremål du kan göra saker med. Framför allt kan du TA saker och SLÄPPA [dem] igen (när du tröttnat på dem). TILLHÖRIGHETER eller UTRUSTNING (förkortat TILLH och UTR) räknar upp alla de saker du för tillfället bär runt på.[paragraph break]Oftast finns det [något] du kan göra med dessa saker: att ÖPPNA, STÄNGA, TA PÅ [if the dej spelling option is active or the informal spelling option is active]MEJ[otherwise]MIG[end if], ÄTA, LÅSA och LÅSA UPP saker hör till det vanligaste.[paragraph break]Även om författaren skrivit att ett visst föremål finns i rummet, händer det ibland hända att spelet inte verkar fatta det när du försöker göra [något] med det föremålet. I så fall nämnde författaren föremålet bara för att ge en stämningsfull beskrivning av rummet, och du kan utgå från att du inte behöver det föremålet till [någon]ting."	--
"Spara och avsluta etc."	--	"Det finns några saker som inte huvudpersonen i berättelsen kan göra utan som du själv gör med spelet, som att spara en spelomgång eller avsluta programmet. Det gör du med direktiven:[paragraph break]SPARA, som sparar en kopia av spelvärlden som den ser ut precis för ögonblicket.[line break]LADDA, som hämtar en sparad spelomgång och låter [dig] fortsätta på den. Du kan spara hur många spelomgångar som helst.[line break]BÖRJA OM,  som låter [dig] börja om speloet från början.[line break]AVSLUTA, som avslutar spelet."	--
"Hur spelvärlden är uppbyggd"	Table of IF Elements	--	--
"Har du kört fast?"	Table of Stuckness Advice	--	--

Table of Stuckness Advice
title	subtable	description	toggle
"Utforska"	--	"Undersök allt du hittar och alla sakerna du bär med [dig]. Öppna alla dörrar och gå in genom [dem]. Kika i alla stängda behållare. Testa allt som går att göra på varje ställe.[paragraph break]Använd alla sinnen: känn, lukta, lyssna och smaka på saker som skulle kunna kännas, lukta, låta eller smaka på särskilda sätt.[paragraph break]Var grundlig. Kommer du inte på vad du ska göra, så försök att öppna fönster, titta under sängar o.s.v. I en del spel är viktiga saker väl gömda."
"Läs noggrant"	--	"Läs om stycken. Titta en gång till på saker du redan tittat på. Ibland får man nya idéer av det.[paragraph break]Leta efter ledtrådar i texten. Sakers om beskrivs ingående är antagaligen viktigare än saker som nämn i förbigående. Greja med de sakerna. Om en maskin har delar, titta på delarna och försök göra [något] med dem.  Lägg också märke till vilka verb som nämns i texten. Försök använda samma verb själv. Ofta behövs det speciella verb för speciella handlingar i ett speciellt spel -- som trollformler eller andra ovanliga kommandon. De skadar aldrig att pröva [något], om det omnämns i texten.[paragraph break]Kolla hela bildskärmen. Finns det några extra fönster förutom huvudfönstret? Vad händer i de fönstren? Håll ett öga på statusraden, om det finns en [sådan] -- där kan det stå var du är, hur många poäng du har, vad klockan är i spelvärlden, vilken kondition din figur är i eller annan viktig information. Om statusraden till exempel talar om vilken kondition figuren du spelar är i, kan du vara säker på att det kan vara viktigt att veta förr eller senare."
"Var påhittig"	--	"Formulera om [dig]. Om spelet inte verkar fatta vad du vill göra, försök säga samma sak med andra ord.[paragraph break]Pröva på olika sätt. Ibland när [något] inte funkar, kan man få ovanliga responser från spelet. Det är ofta ett tecken på att man är på rätt spår, fast man inte lyckats lista ut precis hur man gör än. När du trycker bara på den röda knappen, gnisslar det inifrån väggen, så kanske öppnar man lönndörren genom att trycka först p den blå knappen och [sedan] på den röda.[paragraph break]Tänk på vad det är för slags historia som berättas. Vad man [ska] göra och varför kan bero på ifall man spelar ett mysterium, en kärleksberättelse eller en thriller. Vad försöker du göra, och hur brukar huvudpersonerna i sådana berättelser lösa den sortens saker? Vad kan man vänta [sig] att en deckare, hjältinnan i en kärlekshistoria eller en hemlig agent skulle göra i en [sådan] situation?"
"Samarbeta"	--	"Spela ihop med [någon]. Två huvuden är klokare än ett. Om det ändå inte går, kan du försöka mejla författaren eller ännu hellre be om ledtrådar på rec.games.int-fiction eller intfiction.org.  Skriv vad det är för spel du behöver hjälp med, och inled med flera tomma rader (så du inte råkar avslöja vad som händer i spelet för folk som inte redan spelat det). Förklara sedan ditt problem så klart och tydligt som möjligt. Det finns säkert [någon] som vet hur man kommer vidare."	--

Table of IF Elements
title	subtable	description	toggle
"Vad du når"	--	"Vanligen har du tillgång till allting du kan se på den plats där du befinner [dig]. Det går att flytta [sig] från en plats till en annan; men du behöver oftast inte flytta på [dig] i rummet där du är. Kommandon som >GÅ TILL BORDET behövs sällan eller aldrig. Men berättar författaren att att [någon]ting ligga högt upp eller utom räckhåll, kan det ibland vara nöädvändigt att ställa [sig] på en stol eller dylikt för att nå. Den sortens handlingar brukar dock bara vara viktiga om texten i spelet antyder det."	--
"Saker i eller på [någon]ting"	--	"Vlika saker som ligger i eller på vilka andra saker brukar IF-spel ofta ha noga koll på. Många gåtor i spelen har att göra med var saker är -- om spelaren bär omkring på [dem], om [de] ligger på marken eller på ett bord eller i ett skrin o.s.v."	--
"Vad du kan göra"	--	"De flesta handlingar du kan utföra i en IF-värld är enkla och konkreta. >GÅ VÄSTERUT och >ÖPPNA DÖRR fungerar nästan säkert. >ÅK BORT eller >BYGG ETT BORD fungerar antagligen inte. Kommandon som >ÅK TILL HOTELLET ligger på gränsen: de funkar i en del spel, men inte i de flesta. I allmänhet är det så att abstrakta handlingar eller handlingar i flera led behöver delas upp i en serie enklare och konkretare handlingar för att spelet [ska] förstå dina kommandon. "	--
"Andra figurer"	--	"De fiktiva personer du möter i ett spel är ibland rätt begränsade. Å andra sidan finns det också spel som framför allt går ut på att interagera med andra figurer i IF-världen. Man får snart en känsla för figurerna i spelet: ger [de] vettiga svar på många olika frågor, kommer [de] ihåg saker man berättat för [dem], rör [de] [sig] på egen hand i spelvärlden o.dyl., så kan de vara viktiga. Ger [de] mest standardsvar och verkar [de] inte vara det som författaren lagt [ned] mesta jobbet på, så är de antagligen bara där för att ge [lite] stämning åt spelet eller för att [de] behövs för att lösa [något] bestämt problem. Figurer i spel med många problem måste ofta mutas, hotas eller smickras till att hjälpa spelaren med [något] -- avslöja [något], ge spelaren [något], släppa in spelaren [någon]stans och så vidare."	--

Table of Setting Options
title	subtable	description	toggle
"[if the current verbosity mode is verbose]Beskriver alla rum[end if][if the current verbosity mode is brief]Beskriver nya rum[end if][if the current verbosity mode is superbrief]Beskriver inga rum[end if]"	--	--	switch description types rule
"[if notify mode is on]Varskor om poängändringar[otherwise]Varskor inte om poängändringar[end if]"	--	--	switch notification status rule

To decide whether notify mode is on:
	(- notify_mode -);

This is the switch notification status rule:
	if notify mode is on, try switching score notification off;
	otherwise try switching score notification on.

This is the switch description types rule:
	if the current verbosity mode is verbose
	begin;
		try preferring sometimes abbreviated room descriptions;
		rule succeeds;
	end if;
	if the current verbosity mode is brief
	begin;
		try preferring abbreviated room descriptions;
		rule succeeds;
	end if;
	if the current verbosity mode is superbrief
	begin;
		try preferring unabbreviated room descriptions;
		rule succeeds;
	end if.

Verbosity is a kind of value. The verbosities are brief, verbose, and superbrief.

To decide what verbosity is the current verbosity mode:
	let n be the current lookmode number;
	if n is 1, decide on brief;
	if n is 2, decide on verbose;
	if n is 3, decide on superbrief.
	
To decide what number is the current lookmode number:
	(- lookmode -);

Understand "hjälp" or "tips" or "om" or "information" or "info" as asking for help.
Asking for help is an action out of world.
Carry out asking for help (this is the help request rule):
   now the current menu is the Table of Basic Help Options;
   carry out the displaying activity;
   clear the screen;
   try looking.

The story genre is "text"


Book - Swedish Basic Screen Effects (for use with Basic Screen Effects by Emily Short)

To pause the/-- game: 
	say "[paragraph break]Tryck MELLANSLAG för att fortsätta.";
	wait for the SPACE key;
	clear the screen.
[The SPACE key = VAGNRETUR, BLANKSTEG eller UNIT SEPARATOR]


Book - Swedish Complex Listing (for use with Complex Listing by Emily Short)

To say tabled verb:
	[if the number of filled rows in the Table of Scored listing is greater than 1, say "är ";
	otherwise ]say "är ";

To say prepared list:
	if the number of filled rows in the Table of Scored Listing is 0
	begin;
		say "ingenting";
		rule fails;
	end if;
	dump list;
	now current articulation style is bare.

First delimiter is ", ". 
Second delimiter is ", och ". 
Alternate second delimiter is " och ".

Table of List Style Assignments (amended)
list style	first delimiter	second delimiter	alternate second delimiter	indefinite name phrase	definite name phrase
sequential	", "	"[if the serial comma option is active],[end if] och "	" och "	"[a current listed object]"	"[the current listed object]"
disjunctive	", "	"[if the serial comma option is active],[end if] eller "	" eller "	"[a current listed object]"	"[the current listed object]"
semi-colon	"; "	"; "	" och "	"[a current listed object]"	"[the current listed object]"
comma	", "	", "	" och "	"[a current listed object]"	"[the current listed object]"
null	" "	" "	" och "	"[current listed object]"	"[current listed object]"
hyperconnective	" och "	" och "	" och "	"[a current listed object]"	"[the current listed object]"
fragmentary	". "	". "	". "	"[A current listed object]"	"[The current listed object]" 
enumerated	"; "	"; "	"; "	"([current enumeration]) [a current listed object]"	"([current enumeration]) [the current listed object]"


Book - Swedish Locksmith (for use with Locksmith by Emily Short)

The Swedish opening doors before entering rule is listed instead of the opening doors before entering rule in the before rulebook.
Before going through a closed door (called the blocking door) (this is the Swedish opening doors before entering rule):
	if sequential action option is active:
		try opening the blocking door;
	otherwise:
		say "(måste öppna [the blocking door] först)[command clarification break]";
		silently try opening the blocking door;
	if the blocking door is closed, stop the action.

The Swedish closing doors before locking rule is listed instead of the closing doors before locking rule in the before rulebook.
Before locking an open thing (called the door ajar) with something (this is the Swedish closing doors before locking rule):
	if sequential action option is active:
		try closing the door ajar;
	otherwise:
		say "(måste stänga [the door ajar] först)[command clarification break]";
		silently try closing the door ajar;
	if the door ajar is open, stop the action.
	
The Swedish closing doors before locking keylessly rule is listed instead of the closing doors before locking keylessly rule in the before rulebook.
Before locking keylessly an open thing (called the door ajar) (this is the Swedish closing doors before locking keylessly rule):
	if sequential action option is active:
		try closing the door ajar;
	otherwise:
		say "(måste stänga [the door ajar] först)[command clarification break]";
		silently try closing the door ajar;
	if the door ajar is open, stop the action.

The Swedish unlocking before opening rule is listed instead of the unlocking before opening rule in the before rulebook.
Before opening a locked thing (called the sealed chest) (this is the Swedish unlocking before opening rule): 
	if sequential action option is active:
		try unlocking keylessly the sealed chest;
	otherwise:
		say "(måste låsa upp [the sealed chest] först)[command clarification break]";
		silently try unlocking keylessly the sealed chest;
	if the sealed chest is locked, stop the action.


This is the Swedish need a matching key rule:
	if the noun provides the property matching key:
		let the item be the matching key of the noun;
		if the person asked encloses the item:
			now the second noun is the item;
			abide by the Swedish must have accessible the second noun rule;
		otherwise:
			if the item is a passkey and the item unbolts the noun and the item is visible:
				now the second noun is the item;
				abide by the Swedish must have accessible the second noun rule;
			otherwise:
				if the player is the person asked, say "[key-refusal for noun]";
				stop the action;
	otherwise:
		if the player is the person asked, say "[key-refusal for noun]";
		stop the action.

The Swedish standard printing key lack rule is listed instead of the standard printing key lack rule in the for refusing keys rulebook.
Rule for refusing keys of something (called locked-thing) (this is the Swedish standard printing key lack rule):
	say "Du har ingen nyckel som passar [the locked-thing]."


Understand the command "lås" as something new. Understand "lås upp [something] med [something]" as unlocking it with. Understand "lås upp [a locked lockable thing] med [something]" as unlocking it with. Understand "lås upp [a lockable thing] med [something]" as unlocking it with.

Understand the commands "öppna" and "packa" as something new. Understand "öppna [something]" or "packa upp [something]" as opening. Understand "öppna [something] med [something]" as unlocking it with. Understand "öppna [a locked lockable thing] med [something]" as unlocking it with. Understand "öppna [a lockable thing] med [something]" as unlocking it with.

The Swedish must be able to reach the key for unlocking rule is listed instead of the must be able to reach the key rule in the check unlocking it with rulebook.
Check unlocking it with (this is the Swedish must be able to reach the key for unlocking rule):
	abide by the Swedish must have accessible the second noun rule.

The Swedish right second rule is listed instead of the right second rule in the check unlocking it with rulebook.

This is the Swedish right second rule:
	if the noun provides the property matching key:
		if the second noun is not the matching key of the noun, say "[The second noun] passar inte [the noun]." instead;
	otherwise:
		say "[The second noun] passar inte [the noun]." instead.


Understand "lås upp [something]" as unlocking keylessly. Understand "lås upp [a locked lockable thing]" as unlocking keylessly. Understand "lås upp [a lockable thing]" as unlocking keylessly.

The Swedish check keylessly unlocking rule is listed instead of the check keylessly unlocking rule in the check unlocking keylessly rulebook.
Check unlocking keylessly (this is the Swedish check keylessly unlocking rule):
	abide by the can't unlock without a lock rule;
	abide by the can't unlock what's already unlocked rule;
	abide by the Swedish need a matching key rule.

The Swedish standard keylessly unlocking rule is listed instead of the standard keylessly unlocking rule in the carry out unlocking keylessly rulebook.
Carry out unlocking keylessly (this is the standard keylessly unlocking rule):
	if sequential action option is active, do nothing; otherwise say "(med [the matching key of the noun])[command clarification break]";
	try unlocking the noun with the matching key of the noun.

The Swedish check someone else keylessly unlocking rule is listed in the check someone else keylessly unlocking rule in the check someone trying unlocking keylessly rulebook.
Check someone trying unlocking keylessly (this is the Swedish check someone else keylessly unlocking rule):	 
	abide by the can't unlock without a lock rule;
	abide by the can't unlock what's already unlocked rule;
	abide by the Swedish need a matching key rule.


[Understand the command "lock" as something new.] [We already did that!!!] Understand "lås [something] med [something]" as locking it with. Understand "lås [an unlocked lockable thing] med [something]" as locking it with. Understand "lås [a lockable thing] med [something]" as locking it with.

Check locking it with (this is the Swedish must be able to reach the key for locking rule):
	abide by the Swedish must have accessible the second noun rule.
The Swedish must be able to reach the key for locking rule is listed first in the check locking it with rulebook.


Understand "lås [something]" as locking keylessly.  Understand "lås [an unlocked lockable thing]" as locking keylessly. Understand "lås [a lockable thing]" as locking keylessly.

The Swedish check keylessly locking rule is listed instead of the check keylessly locking rule in the check locking keylessly rulebook.
Check locking keylessly (this is the Swedish check keylessly locking rule):
	abide by the can't lock without a lock rule;
	abide by the can't lock what's already locked rule;
	abide by the can't lock what's open rule;
	abide by the Swedish need a matching key rule.

The Swedish standard keylessly locking rule is listed instead of the standard keylessly locking rule in the carry out locking keylessly rulebook.
Carry out locking keylessly (this is the Swedish standard keylessly locking rule):
	if sequential action option is active, do nothing; otherwise say "(med [the matching key of the noun])[command clarification break]";
	try locking the noun with the matching key of the noun.

The Swedish check someone keylessly locking rule is listed instead of the check someone keylessly locking rule in the check someone trying locking keylessly rulebook.
Check someone trying locking keylessly (this is the Swedish check someone keylessly locking rule):
	abide by the can't lock without a lock rule;
	abide by the can't lock what's already locked rule;
	abide by the can't lock what's open rule;
	abide by the Swedish need a matching key rule.
	

The Swedish identify passkeys in inventory rule is listed instead of the identify passkeys in inventory rule in the after rulebook.
After printing the name of an identified passkey (called the item) while taking inventory (this is the Swedish identify passkeys in inventory rule):
	say " (som går till [the list of things unbolted by the item])";
	
The Swedish passkey description rule is listed instead of the passkey description rule in the after rulebook.
After examining an identified passkey (this is the passkey description rule):
	say "[The noun] går till [the list of things unbolted by the noun]."


The Swedish limiting keychains rule is listed instead of the limiting keychains rule in the instead rulebook.
Instead of putting something which is not a passkey on a keychain (this is the Swedish limiting keychains rule):
	say "[The noun] är inte [någon] nyckel."

Understand "sätt [passkey] på [keychain]" or "häng [passkey] på [keychain]" as putting it on.


This is the Swedish noun autotaking rule:
	if sequential action option is active:
		if the player is the person asked:
			try taking the noun;
		otherwise:
			try the person asked trying taking the noun;
	otherwise:
		if the player is the person asked:
			say "(måste ta [the noun] först)";
			silently try taking the noun;
		otherwise:
			try the person asked trying taking the noun.
	
This is the Swedish second noun autotaking rule:
	if sequential action option is active:
		if the player is the person asked:
			try taking the second noun;
		otherwise:
			try the person asked trying taking the second noun;
	otherwise:
		if the player is the person asked:
			say "(måste ta [the second noun] först)";
			silently try taking the second noun;
		otherwise:
			try the person asked trying taking the second noun.

[------ The must hold the noun rule and the must hold the second noun rule are not used by this extension. However, there are other extensions that call them, so we define special phrases to redirect such calls to the Swedish must hold the noun rule and the Swedish must hold the second noun rule, respectively ------]
This is the Swedish must hold the noun rule:
	if the person asked does not have the noun, follow the Swedish noun autotaking rule;
	if the person asked does not have the noun, stop the action; 
	make no decision.

This is the Swedish must hold the second noun rule:
	if the person asked does not have the second noun, follow the Swedish second noun autotaking rule;
	if the person asked does not have the second noun, stop the action;
	make no decision.

To consider the must hold the noun rule:
	consider the Swedish must hold the noun rule.
To follow the must hold the noun rule:
	follow the Swedish must hold the noun rule.
To abide by the must hold the noun rule:
	abide by the Swedish must hold the noun rule.
To anonymously abide by the must hold the noun rule:
	anonymously abide by the Swedish must hold the noun rule.

To consider the must hold the second noun rule:
	consider the Swedish must hold the second noun rule.
To follow the must hold the second noun rule:
	follow the Swedish must hold the second noun rule.
To abide by the must hold the second noun rule:
	abide by the Swedish must hold the second noun rule.
To anonymously abide by the must hold the second noun rule:
	anonymously abide by the Swedish must hold the second noun rule.
[------ ------]
	
This is the Swedish must have accessible the noun rule:
	if the noun is not key-accessible:
		if the noun is on a keychain (called the containing keychain), now the noun is the containing keychain;
		follow the Swedish noun autotaking rule;
	if the noun is not key-accessible:
		if the player is the person asked,
			say "Så länge du inte håller i [the noun], kan du ingenting göra.";
		stop the action;
	make no decision.

This is the Swedish must have accessible the second noun rule:
	if the second noun is not key-accessible:
		if the second noun is on a keychain (called the containing keychain),
			now the second noun is the containing keychain;
		follow the Swedish second noun autotaking rule;
	if the second noun is not key-accessible:
		if the player is the person asked,
			say "Så länge du inte håller i [the second noun], kan du ingenting göra.";
		stop the action;
	make no decision.


Book - Swedish Menus (for use with Menus by Emily Short)

[
Table of Menu Commands
number	effect
78[= N]	move down rule
110[= n]	move down rule
80[= P]	move up rule
112[= p]	move up rule
81[= Q]	quit rule
113[= q]	quit rule
13[= CARRIAGE RETURN]	select rule
32[= SPACE]	select rule
130[= BREAK PERMITTED (DOWN ARROW)]	move down rule
129[= HICH OCTET PRESET (UP ARROW)]	move up rule
27[= ESCAPE]	quit rule
]

When play begins:
	now the number in row three of the Table of Menu Commands is 84[= T]; 
	now the number in row four of the Table of Menu Commands is 116[= t]. 

[
Table of Deep Menu Status
left	central	right
""	"[current menu title]"	""
""	""	" "
" N = Next"	""	"Q = [if menu depth > 1]Last Menu[otherwise]Quit Menu[end if]"
" P = Previous"	""	"ENTER = Select"
]

When play begins:
	now the left entry in row three of the Table of Deep Menu Status is "N = nästa ämne  "; 
	now the right entry in row three of the Table of Deep Menu Status is "Q = [if menu depth > 1]tidigare meny[otherwise]fortsätt spel[end if]"; 
	now the left entry in row four of the Table of Deep Menu Status is "T = tidigare"; 
	now the right entry in row four of the Table of Deep Menu Status is "    RETUR = välj ämne"; 

[
Table of Sample Hints
hint	used
"Sample Hint"	a number
]

To say known hints from (hint booklet - table-name):
	let __index be 0;
	clear only the main screen; 
	repeat through hint booklet
	begin;
		increase __index by 1;
		if there is a used entry
		begin;
			say "[__index]/[number of rows in hint booklet]: [hint entry][paragraph break]";
		otherwise;
			if __index is 1
			begin;
				now used entry is turn count;
				say "[__index]/[number of rows in hint booklet]: [hint entry][paragraph break]";
			end if;
		end if;
	end repeat; 
	say "Tryck MELLANSLAG för att återgå till menyn eller L för en ny ledtråd."


To say hints from (hint booklet - table-name): 
	let __index be 0;
	clear only the main screen; 
	repeat through hint booklet
	begin;
		increase __index by 1;
		say "[__index]/[number of rows in hint booklet]: [hint entry][paragraph break]"; 
		if there is a used entry
		begin;
			do nothing;
		otherwise;
			now used entry is turn count;
			say "Tryck MELLANSLAG för att återgå till menyn[if __index < number of rows in hint booklet] eller L för en ny ledtråd[end if].";
			make no decision; 
		end if;  
	end repeat; 
	say "Tryck MELLANSLAG för att återgå till menyn[if __index < number of rows in hint booklet] eller L för en ny ledtråd[end if]."


Book - Swedish Plurality (for use with Plurality by Emily Short)

Section - Enumeration (in place of Section 4 - Enumeration in Plurality by Emily Short)
    
A thing can be ambiguously plural or ordinarily enumerated. A thing is usually ordinarily enumerated.

This is the update ambiguous pronouns for actions rule: 
	if the noun is a thing and the noun is ambiguously plural:
		notice the plurality of the noun; 
	if the second noun is a thing and the second noun is ambiguously plural:
		notice the plurality of the second noun.

The update ambiguous pronouns for actions rule is listed after the set pronouns from items from multiple object lists rule in the action-processing rules.

After printing the name of an ambiguously plural thing (called the suspect) (this is the notice plurality of printed ambiguous object rule):
	if the manual pronouns option is active:
		do nothing;
	otherwise:
		notice the plurality of the suspect.
	
To notice the plurality of (suspect - an object):
	(- PlugPlural({suspect}); -)

Include (-
[ PlugPlural obj;
    #ifdef DOM_SPELLING;
	    SetPronoun('dom', obj);
    #ifnot;
	    SetPronoun('dem', obj);
    #endif;
	if obj has neuter {
        SetPronoun('det', obj)};
	if obj has common {
	SetPronoun('den', obj)};
];
-). 

Use Manual Pronouns translates as (- Constant MANUAL_PRONOUNS; -).

To have the parser notice (o - an object): 
	if o is ambiguously plural, notice the plurality of o;
	otherwise set pronouns from o.


Book - Swedish Rideable Vehicles (for use with Rideable Vehicles by Graham Nelson)

Check an actor mounting (this is the can't mount when mounted on an animal rule): 
	if the actor is carried by a rideable animal (called the steed):
		if the actor is the player, say "Du rider redan på [the steed].";
		stop the action.

Check an actor mounting (this is the can't mount when mounted on a vehicle rule):
	if the actor is on a rideable vehicle (called the conveyance):
		if the actor is the player, say "Du sitter redan på [the conveyance].";
		stop the action.

Check an actor mounting (this is the can't mount something unrideable rule):
	if the noun is not a rideable animal and the noun is not a rideable vehicle:
		if the actor is the player, say "Det går inte att [if the noun is an animal]rida[otherwise]åka[end if] på [the noun]." instead;
		stop the action.

Report an actor mounting (this is the standard report mounting rule):
	if the actor is the player:
		say "Du sitter upp på [the noun].";
		describe locale for the noun;
	otherwise:
		say "[The actor] sitter upp på [the noun]." instead. 

Unsuccessful attempt by someone trying mounting (this is the mounting excuses rule):
	if the reason the action failed is the can't mount when mounted on an animal rule,
		say "[The person asked] rider redan på [the random rideable animal which carries the person asked].";
	if the reason the action failed is the can't mount when mounted on a vehicle rule,
		say "[The person asked] sitter redan på [the random rideable vehicle which supports the person asked].";
	if the reason the action failed is the can't mount something unrideable rule,
		say "Det går inte att [if the noun is an animal]rida[otherwise]åka[end if] på [the noun].";

Understand "rid --/på [something]" as mounting.
Understand "åk --/på [something]" as mounting.
Understand "sitt upp på [something]" as mounting.

Check an actor dismounting (this is the can't dismount when not mounted rule):
	if the actor is not carried by a rideable animal and the actor is not on a rideable vehicle:
		if the actor is the player, say "Du varken rider eller åker på [något] för tillfället.";
		stop the action.

Report an actor dismounting (this is the standard report dismounting rule):
	if the actor is the player:
		say "Du sitter av från [the noun].[line break][run paragraph on]";
		produce a room description with going spacing conventions;
	otherwise:
		say "[The actor] sitter av från [the noun]."
	
Unsuccessful attempt by someone trying dismounting (this is the dismounting excuses rule):
	if the reason the action failed is the can't dismount when not mounted rule,
		say "[The person asked] varken åker eller rider på [något] för tillfället.";
	otherwise make no decision.

Understand "sitt av --/från" as dismounting.



Swedish ends here.



---- DOCUMENTATION ----


Chapter: Sammanfattning (Läs mig först!)

Extensionen Swedish låter dig i huvudsak använda en rad ändelser för att böja svenska substantiv och adjektiv. En kort sammanfattning av den viktigaste funktionaliteten följer här.

När du anger ett "printed name" för någonting, gör du det på ett sätt som tillåter Swedish att lista ut både dess obestämda och dess bestämda form:

(ett badkar / badkarET)
	The printed name of the badkar is "badkar[et]". 

(en väl använd kam / DEN väl användA kamMEN)
	The printed name of the comb is "[den ]väl använd[a] kam[men]".

(ett urgamMALT,  alvsmiTT svärd / DET urgamLA, alvsmiDDA svärdET)
	The printed name of the urgammalt alvsmitt svärd is "[det ]urgam[malt-la], alvsmi[tt-dda] svärd[et]". 

Andra böjningsformer hanteras efter samma principer:
	... say "De[n-t-] först[a-e] du ser är [a noun]. De[nna-tta-ssa] [noun] blir prompt avpricka[d-t-de] på din lista."

Objekt antas normalt vara reale (den-ord); vill du att ett objekt ska vara neutrum (det-ord) måste du tala om för Inform att objektet ifråga är "neuter":
	The svärd is a neuter in vapenförrådet. The printed name of the svärd is "svärd[et]".
	The badrum is a neuter room. The printed name of the badrum is "badrum[met]".
	A badkar is an enterable container in the badrum. The badkar is neuter. The printed name of the badkar is "badkar[et]".
	The akvarium is an open unopenable transparent neuter container. The printed name of the akvarium is "akvari[um-et]".

För en mer ingående redogörelse och hanteringen av diverse specialfall, se nedan. (För de riktigt fina detaljerna, se de fylliga kommentarerna i källtexten till Swedish.)

OBS! 

Swedish bör inkluderas EFTER de inbyggda extensioner (Built-In Extensions) som du eventuellt inkluderar i ditt spel/din berättelse.


Chapter: Om

Den följande dokumentationen för Swedish förutsätter grundläggande bekantskap med Inform 7.För hur man programmerar i Inform 7 i allmänhet hänvisas till den inbyggda dokumentationen (d.v.s. "Writing with Inform" och "The Recipe Book") samt till "The Rules Chart", Jim Aikins "Inform 7 Handbook", Ron Newcombs "Inform 7 for Programmers" och Jeff Nymans "Descriptions and Locales", som alla finns att ladda ner från Informs hemsida -- i likhet med de oumbärliga Appendix A (Standard Rules) och B (I6 Templates), d.v.s. de program på Inform 7 respektive Inform 6 som utgör stommen och kärnan i Inform 7 och som denna extension är en översättning av de relevanta delarna av.

För övrigt är Mark-Oliver Reisers "Inform 7 Cheat Sheet" bra att ha till hands medan man skriver (sök på nätet -- i juli 2011 fanns den här: <http://user.cs.tu-berlin.de/~moreiser/inform/>). Dessutom har Aaron A. Reed gett ut en bok i ämnet: "Writing Interactive Fiction with Inform 7" (köp av Amazon eller beställ till närmsta folkbibliotek). Och så har vi forumet på intfiction.org att fråga ut.

Föredrar du ett mer traditionellt programmeringsspråk rekommenderas varmt "Swedish Inform", som är Fredrik Ramsbergs översättning av Inform 6-biblioteket till svenska (här: <http://microheaven.com/svenska/skriva.shtml>; eller här: <http://www.ifarchive.org/indexes/if-archiveXinfocomXcompilersXinform6XlibraryXtranslations.html>).

Version 1 av Swedish fungerar med Inform 7 builds 6E59, 6E72, 6F95 och 6G60. 

Räkna med att du inte kommer att kunna kompilera dina spel till z5.

Tack till Björn Paulsen (som också skrev hjälpfunktionen som presenteras nedan), Fredrik Ramsberg, "Beelsebu" och Martin Norbäck för betatestning, goda råd och annat stöd.

Buggar och dylikt rapporteras lämpligen till <felix.larsson.IF@gmail.com>.


Chapter: Det svenska alfabetet

Inform 7 klarar både à, é, å, ä och ö med flera icke-engelska bokstäver direkt i källtexten ("source text"), såväl inom som utom citattecken. Du kan alltså utan vidare skriva: 
	The ängen is a room. "Solen skiner högsommarvarmt över ängen. Längre norrut glimmar det från den stora ån." 
	Kråkan is an animal in ängen. "En kråka hoppar hit och dit på en stenhäll som går i dagen mitt på ängen." 
	The å is north of ängen. "En bred å rinner längs norra änden av ängen. I ån är en ö."
	An ö is in the å."På ön står en ko och vinkar med hornen."

Och vips står Kråkan på ängen, och därborta är en å med en ö i. 

OBS!

Detta gäller INTE namnet på själva filen med källtexten. För dess del får man hålla sig till ASCII-tecken. Den bör få ett namn utan å, ä eller ö. Ett spel som heter "Kråkön" bör alltså sparas i en fil med namnet "kraakoen.inform" eller dylikt.


Chapter: Swedish ihop med andra extensioner

Swedish översätter alla de så kallade "Built-In Extensions" (inbyggda extensioner) som kommer med programmet Inform. 

För att använda dig av "Rideable Vehicles", "Locksmith", "Basic Help Menu" eller någon av de andra inbyggda extensionerna, behöver du därför inte ladda ner särskilda svenska versioner av dessa. Det räcker att skriva "Include Locksmith by Emily Short" etc., precis som du skulle ha gjort om du skrivit i engelska Inform.

OBS!

i) För att källtexten i Swedish ska kunna göra de ändringar i de inbyggda extensoinerna som krävs för översättningen, måste du inkludera alla inbyggda extensioner du vill använda INNAN du inkluderar Swedish. Skriv alltså FÖRST "Include Locksmith by Emily Short" o.s.v. och SEDAN "Include Swedish by Felix Larsson".

ii) Det finns två skäl till att använda Emily Shorts "Plurality" även på svenska: dels för att hantera det Short kallar ”ambiguous plurals”, d.v.s. objekt som kan vara både singularis och pluralis, exempelvis ett par strumpor (som spelaren/läsaren kan vilja kalla både "det" eller "dem") eller en skock får (som spelaren/läsaren kan vilja kalla både "den" eller "dem"), dels för att utnyttja den extra kontroll som extensionen ger över vad pronomina syftar på i spelet. Men Swedish behåller bara denna funktionalitet och avlägsnar all övrig funktionalitet ur "Plurality".

iii) Swedish innehåller bara översättningar av Informs INBYGGDA extensioner (the Built-In Extensions). Övriga extensioner till Inform kräver separata översättningar i de fall de inte kan användas rakt av. Det är inte säkert att andra extensioner än de inbyggda bör eller behöver inkluderas före Swedish.


Chapter: Genus och den obestämda artikeln

På svenska heter den obestämda artikeln antingen "en" eller "ett". Det beror på vilket genus det är på ordet som artikeln hör ihop med: är huvudordet neutrum heter artikeln "ett" (som i "ett textspel"); är huvudordet reale, maskulinum eller femininum heter artikeln "en" (som i "en mässingslykta", "en överstepräst", "en trollpacka").

Inform lägger i många sammanhang automatiskt till den obestämda artikeln när den skriver ut namnet på något, men Inform kan inte automatiskt lista ut om artikeln ska vara "en" eller "ett". Det måste du som författare tala om för spelet.

Med Swedish antar Inform att saker är reale (på engelska "common-gendered") och ger dem den obestämda artikeln "en", såvida inte författaren uttryckligen anger något annat.

För att göra ett föremål som du skapar till neutrum, så att det automatiskt får den obestämda artikeln "ett" och så att spelare kan syfta på det med pronominet "det" (som i >SLÄPP DET), måste du tala om för Inform att föremålet är neutrum (på engelska "neuter"). Det kan du göra antingen samtidigt som du skapar föremålet eller i efterhand:
	The svärd is a neuter in vapenförrådet.
	A badkar is an enterable container in the badrum. The badkar is neuter.
	The akvarium is an open unopenable transparent neuter container.

Ord som du definierar som pluralis (genom att använda något av nyckelorden "some" eller "plural-named", som i "Some dvärgar are in the gruva" eller "The frimärken are plural-named") kommer att få ordet "några" som obestämd artikel.

För vissa ord (de så kallade massorden, "non-counts") passar varken "en", "ett" eller "några" som obestämd artikel. "Du ser också en sand, ett vatten och några bling-bling här" är inte bra. Vill du kan du i sådana fall definiera en egen obestämd artikel: 
	The indefinite article of sand is "en massa". The indefinite article of vatten is "lite". The indefinite article of bling-bling is "en del".

ger
	"Du ser också en massa sand, lite vatten och en del bling-bling här." 

Men du kan också se till att ett föremål inte får någon obestämd artikel över huvud taget. Det gör du så här:
	Sand is non-count. Vatten is non-count. Bling-bling is non-count.

Detta ger
	"Du ser också sand, vatten och bling-bling här." 
	
Den bestämda artikeln fungerar annorlunda. Se nedan.

OBS!

i) Med Swedish kan även rum ("rooms") och regioner ("regions") vara antingen neutrum ("neuter") eller reale ("common-gendered").

ii) Om du ger föremålen i spelet alternativa "printed names" där de olika namnen har olika genus – säg att du vill kalla något för "ett fågelfä" innan spelaren har tittat på den i sin tubkikare och "en kråka" därefter –, se till att du också (om möjligt) ändrar föremålets genus samtidigt som dess namn.


Chapter: Bestämd och obestämd form i output

Section: Att ange bestämd och obestämd form i "printed name"

Att bilda bestämd form av ord på svenska är en krånglig historia: i engelska lägger man helt enkelt till ett "the" framför frasen som ska stå i bestämd form; på svenska däremot böjs substantiv i bestämd form med ändelser och på olika sätt beroende på om substantivet är neutrum eller ej, om det är i pluralis eller singularis och vilken s.k. deklination det tillhör (dessutom kommer stavning och uttal till och komplicerar det hela ännu mer), medan adjektiv däremot får svag böjning som bara tar hänsyn till om huvudordet är maskulinum eller ej, och till sist ska en fras i bestämd form ändå ha en bestämda artikel (antingen "den", "det" eller "de"), men bara om frasen börjar med ett adjektiv snarare än ett substantiv.

Summan av kardemumman är att du måste tala om för Inform vad saker och ting ("objects") som du skapar heter i både bestämd och obestämd form. Du anger detta i objektets "printed name". När du använder Swedish, bör du alltså alltid ge alla saker ("things") i spelet ett "printed name". (Med undantag förstås för sådana ting som av någon anledning inte behöver både bestämd och obestämd form: t.ex. egennamn som "Nisse" eller sådant som "din vänstra gummistövel". ) 

I nödfall är det alltid möjligt att skilja mellan bestämd och obestämd form av ett "printed name" genom att använda sig av villkorsatser av formen: "if definite <bestämd form> otherwise <obestämd form> end if" (alternativt "if indefinite <obestämd form> otherwise <bestämd form> end if").
	A svärd is in drakens håla. The printed name of the svärd is "[if definite]det urgamla, alvsmidda svärdet[otherwise]urgammalt, alvsmitt svärd".
	A mus is in drakens håla. The printed name of the mus is "[if definite]den lilla musen[otherwise]liten mus".
	A drake is an animal in drakens håla. The printed name of the drake is "[if definite]draken[otherwise]drake".
	Sankt Göran is a man in drakens håla.

Normalt finns det dock betydligt enklare sätt! Se nästa avsnitt.

OBS!

Du måste ange vilken BESTÄMD artikel föremålet har (om det har någon alls – varken Sankt Göran eller draken har någon), men du får INTE ange någon OBESTÄMD artikel i dess "printed name". (Swedish väljer automatiskt obestämd artikel -- "en", "ett" eller "några/nåra". Vid behov ändras detta som i engelska Inform -- se Writing with Inform avsnittet Articles and Proper Names).


Section: Say-fraser för bestämd artikel och för ändelser i bestämd form

För att underlätta för användaren definierar extensionen Swedish en uppsjö "say-phrases" som är tänkta att användas i det här sammanhanget. I stället för 
	The printed name of the skön jungfru is "[if definite]den sköna jungfrun[otherwise]skön jungfru". 

räcker det därför att skriva
	The printed name of the skön jungfru is "[den ]skön[a] jungfru[n]".

Bestämda artiklar och de delar av orden som bara ingår i deras bestämda form sätts helt enkelt inom klammer. (För att vara mer exakt: "[den ]skön[a] jungfru[n]" definieras som "[if definite]den [end if]skön[if definite]a[end if] jungfru[if definite]n[end if]".)

Ändelsen för bestämd form behöver inte komma sist i ett ord. Det går utmärkt att skriva
	The printed name of the reliker is "1100-talshelgon[et]s reliker".
	The printed name of the kaparbrev is "[den ]ökänd[e] anfader[n]s kaparbrev".

OBS!

i) Mind the gap! De bestämda artiklarna ("[den ]", "[det ]", "[de ]") innehåller ett avslutande mellanslag. Skriv alltså "[den ]röd[a] gubbe[n]" UTAN mellanslag mellan "[den ]" och "röd". (Skriver du i stället "[den] röd[a] gubben", kommer det att bli ett mellanslag för mycket i det färdiga spelet).

ii) När man ger föremål namn som "1100-talshelgon[et]s reliker" eller "[den ]ökänd[e] anfader[n]s kaparbrev" är det lätt hänt att genus och/eller numerus kommer i konflikt med varandra. "Reliker" är pluralis, så vi bör skapa dem med en fras i stil med "some reliker are in the krypta"; ett "kaparbrev" är neutrum, så vi bör tala om för Inform att "the kaparbrev is neuter". Men då kommer Inform att i obestämd form felaktigt kalla dessa saker för "NÅGRA 1100-talshelgons reliker" och "ETT ökänd anfaders kaparbrev" i stället för "ETT 1100-talshelgons reliker" och "EN ökänd anfaders kaparbrev". Lösningen är att för hand ange vilken "indefinite article" objektet har. Så här:
	Some reliker are in skogen. The printed name of the reliker is "1100-talshelgon[et]s reliker". The indefinite article of the reliker is "ett".
	A kaparbrev is in skogen. The printed name of the kaparbrev is "[den ]ökänd[e] anfader[n]s kaparbrev". The kaparbrev is neuter. The indefinite article of the kaparbrev is "en".


Section: Say-fraser för mer komplicerade böjningar i bestämd form

I många fall bildas bestämd form inte genom att man helt enkelt klistrar på en ändelse på orden, utan man måste kanske först ta bort en ändelse i den obestämda formen eller ändra stavningen av ordstammen. Jämför t.ex."ett urgamMALT, alvsmiTT svärd" och "det urgamLA, alvsmiDDA svärdet". Även för dylika fall finns det "say-phrases" som underlättar. I stället för
	The printed name of the svärd is "[if definite]det urgamla, alvsmidda svärdet[otherwise]urgammalt, alvsmitt svärd".

kan du skriva
	The printed name of the svärd is "[det ]urgam[malt-la], alvsmi[tt-dda] svärd[et]".

I dessa fall visar texten inom klammer alltså hur ordet slutar i både obestämd och bestämd form. FÖRST kommer slutet på ordet i obestämd form; SEDAN ett bindestreck; SIST slutet på ordet i bestämd form.

Fler exempel på samma sak:
	"[det ]oändlig[t-a] äventyr[et]"‚
	"[den ]blå him[mel-len]";
	"[det ]tom[t-ma] akvari[um-et]".

(Och mer exakt igen: "[det ]tom[t-ma] akvari[um-et]" definieras som "[if definite]det [end if]tom[if definite]ma[otherwise]t[end if] akvari[if definite]et[otherwise]um[end if]".)

Swedish definierar "say-phrases" för praktiskt taget alla böjningar av svenska ord i bestämd form (till och med "li[ten-lla]" och "li[tet-lla]"!).


Section: Hjälpreda för att bestämma textsubstitutionen

Som författare kan du få hjälp att välja rätt textsubstitution för objektets "printed" name om du skriver kommandot "FÖRSLAG" eller "OBJEKT".

Du kommer då att ombes skriva in det önskade namnet på ett föremål i dels bestämd, dels obestämd form, varpå programmet räknar ut vilken av de befintliga textsubstitutionerna som ger önskat resultat. 

Så här (författarens input återges med stora bokstäver):
	
	>FÖRSLAG
	Skriv namnet i bestämd form ("den röda lyktan").	
	
	>DET LUDNA STENDÖDA KADAVRET
	Skriv nu dess obestämda form ("en röd lykta").
	
	>ETT LUDET STENDÖTT KADAVER
	Förslag: The printed name of <objektet> is "[det ]lud[et-na] stendö[tt-da] kadav[er-ret]".

Denna funktion är not-for-release, så när du väl släppt spelet kommer inte dina spelare att kunna använda kommandona "FÖRSLAG" eller "OBJEKT".

Idén och programmet till hjälpredan är Björn Paulsens.


Section: Say-fraserna "without definite article" och "weakly inflected"

Det finns dock ett par tillfällen då de former du angett i "printed name" båda vore direkt felaktiga.

a)Det ena av dessa tillfällen är när namnet innehåller ett adjektiv och ska fogas in i en fras som redan börjar med ett adjektiv i bestämd form, som här:
	Instead of exiting when the location is a locked closed container, say "Du får inte upp de[n-t-] låst[--a] [noun? a noun? the noun?]".

Antag att du befinner dig i en behållare ("container") som heter "[den] egyptisk[a] sarkofag[en]". Ska vi använda "[noun]", "[a noun]" eller "[the noun]" här?
	
	"Du får inte upp de[n-t-] låst[--a] [noun]" 

leder till:
	Du får inte upp den låsta egyptisk sarkofag. 

	"Du får inte upp de[n-t-] låst[--a] [a noun]" 

leder till:
	Du får inte upp den låsta en egyptisk sarkofag. 

	"Du får inte upp de[n-t-] låst[--a] [the noun]" 

leder till:
	Du får inte upp den låsta den egyptiska sarkofagen.

Lösningen i Swedish är att använda say-frasen "[<objektet> without definite article]".

	"Du får inte upp de[n-t-] låst[--a] [the noun without definite article]" 

ger den rätta raden:
	Du får inte upp den låsta egyptiska sarkofagen. 

b) Det andra tillfället då ett "printed name" inte passar är då namnet innehåller ett adjektiv och ska fogas in i en fras som börjar med en genitiv eller ett possessivt pronomen, som här:
	After examining something not held by the player, say "Men titta! Det är ju di[n-tt-na] [noun? a noun? the noun?], som varit borta så länge."

Antag nu att spelaren undersöker något som heter "[den ]röd[a] strumpa[n]". Varken "Det är ju din röd strumpa, som varit borta så länge" eller "Det är ju din en röd strumpa, som varit borta så länge" eller "Det är ju din den röda strumpan, som varit borta så länge" är riktigt.

Vad vi skulle vilja ha är "Det är ju din röda strumpa", där substantivet står i obestämd form men adjektivet i bestämd! Eller, rättare sagt, där substantivet står i obestämd form och adjektivet har så kallad svag böjning (vilket svenska adjektiv får i bestämd form). Men Informs parser skiljer inte mellan adjektiv och substantiv.

Lösningen i Swedish är att använda say-frasen "[<object> weakly inflected]". ("Weakly inflected" är tänkt att översätta 'med svag böjning'.)

	After examining something not held by the player, say "Men titta! Det är ju di[n-tt-na] [noun weakly inflected], som varit borta så länge." 

ger:
	> UNDERSÖK STRUMPA
	"Men titta! Det är ju din röda strumpa som varit borta så länge."

Ett problem återstår nu. Vi vill att detta ska fungera smidigt för textsubstitutionen "[a]" (som i "röd[a]"), vilken oftast kommer att används för adjektivets svaga böjning (och bestämda form). Det finns dock en del substantiv som markerar bestämd form i pluralis med just ändelsen -a, t.ex. äpplen/äpplena, kalhyggen/kalhyggena. Om du nu ger ett objekt namnet ("printed name") "[de ]förgiftade äpplen[a]", så kommer du att få:
	> UNDERSÖK ÄPPLEN
	"Men titta! Det är ju dina förgiftade äpplena som varit borta så länge."

Det problemet löser Swedish genom att införa en särskild textsubstitution "[-a]", som bara ska användas efter ett substantiv som slutar på -n i pluralis som exempelvis "äpplen[-a]", "kilon[-a]", "grässtrån[-a]". Ge äpplena namnet "[de ]förgiftade äpplen[-a]", så hanterar "[<objekt> weakly inflected]" det hela rätt.
	> UNDERSÖK ÄPPLEN
	"Men titta! Det är ju dina förgiftade äpplen som varit borta så länge."

 
Chapter: Bestämd och obestämd form i input

I den svenska översättningen av Inform 7 behöver nästan varje objekt ett "printed name" som anger den bestämda formen av objektets namn. Det vore därför bekvämt om den svenska översättningen av Inform 7 (till skillnad från det engelska originalet) automatiskt tolkade orden i ett objekts "printed name" som namn på objektet.

Swedish åstadkommer detta genom att ge objekt ("objects") en särskild tvåvärd egenskap: ett objekt kan vara antingen "understood by its printed name" eller "not understood by its printed name". Defaultvärdet är att ett objekt är "understood by its proper name".

Antag att du i vanlig ordning ger ett objekt ett "printed name":
	A Panthera leo is a neuter animal in savannen.
	The printed name of the Panthera leo is "[det ]ilsk[et-na] lejon[et]".

En spelare kommer då automatiskt att kunna använda orden "ilsket", "ilskna", "lejon" och/eller "lejonet" för att syfta på objektet Panthera leo. Ingen åtskillnad görs härvidlag mellan versaler och gemena bokstäver. Spelet kommer automatiskt att förstå kommandon som "X LEJONET". 

(Dessutom tolkar spelet givetvis i det här exemplet även orden "Panthera" och "leo" som namn på objektet Panthera leo.)

Om du inte vill att spelet ska förstå ett visst objekts "printed name", kan du enkelt förhindra det genom att lägga till följande rad:
	The <objekt> is not understood by its printed name.

Lägger du alltså till raden "The Panthera leo is not understood by its printed name", så kommer spelaren inte längre att kunna syfta på lejonet med orden "ilsket", "ilskna", "lejon" eller "lejonet".

Vill du att spelet inte ska förstå några eller bara några få "printed names" ändrar du defaultvärdet genom att i källtexten skriva "An object is usually not understood by its printed name", och du kan sedan tala om för ett objekt vars "printed name" du trots allt vill att spelet ska förstå att just det objektet "is understood by its printed name" (t.ex. att "The Panthera leo is understood by its printed name").

Spelet respekterar de villkor som är inbakade i ett "printed name". Antag att du har ett printed name som ser ut så här:
	The printed name of the smörgås is "[if half eaten][den ]halvät[en-na] macka[n][otherwise][den ]nybredd[a] smörgås[en]"

Då kommer spelet bara att förstå namnen "nybredd", "nybredda" och "smörgåsen" så länge smörgåsen inte är "half eaten"; så fort smörgåsen blir "half eaten" så kommer spelet att sluta förknippa smörgåsen med de orden och i stället börja att förknippa den med orden "halväten", "halvätna", "macka" och "mackan".

OBS!

i) Var noga med att ange både bestämd och obestämd form av ord när du hittar på synonymer till ett objekt.

Att den svenska översättningen av Inform automatiskt förstår ord i ett objekts "printed name", betyder nämligen INTE att Inform automatiskt förstår bestämda former av ord, om dessa former inte angetts just i objektets "printed name".

Antag att du har skrivit följande:
	An ilsket lejon is a neuter animal in savannen.
	The printed name of the ilsket lejon is "[det ]ilsk[et-na], rytande lejon[et]".
	Understand "hotfullt" and "kattdjur" as the ilsket lejon.

I det här fallet kommer Inform automatiskt att förstå att följande ord syftar på objektet:
	"ilsket" -- eftersom det ordet ingår i objektets "name" (och dessutom i dess "printed name"),
	"lejon" -- eftersom även det ordet ingår i objektets "name" (och dessutom i dess "printed name"),
	"ilskna" -- eftersom det ordet ingår i objektets "printed name",
	"rytande" -- eftersom även det ordet ingår i objektets "printed name",
	"lejonet" -- eftersom också det ordet ingår i objektets "printed name",
	"hotfullt" -- eftersom det ordet är angett som synonym till objektet och
	"kattdjur" -- eftersom det ordet också är angett som synonym till objektet.

Däremot kommer Inform i detta fall INTE att förstå att ord som "hotfulla" eller "kattdjuret" syftar på det ilskna lejonet. För att få inform att förstå dessa ord måste de uttryckligen anges i "understand"-satsen, exempelvis så här:
	Understand "hotfullt/hotfulla" and "kattdjur/kattdjuret" as the ilsket lejon.

ii) Denna funktionalitet medför ibland att spelet behöver utföra rätt många beräkningar på indexerad text. På processorer med låg prestanda kan det leda till att spelet går märkbart långsamt när du testar det inuti Inform-programmet. Det är osannolikt att detta märks i det färdiga spelet, när det spelas med en vanlig IF-tolk (Gargoyle, WindowsFrotz, WindowsGit, Zoom etc.). Men skulle det ställa till problem, kan funktionaliteten stängas av med raden "An object is usually not understood by its printed name" eller "An object is never understood by its printed name". Glöm då inte att med understand-satser ange objektens namn i bestämd form som synonymer till namnet i stället.

iii) Gör du automatiskt ett visst slags sak (kind of thing) till en del av alla saker av ett visst annat slag, t.ex. genom att skriva:
	A näsa is a kind of thing.
	A näsa is part of every person.

så kommer dessa saker automatiskt att få namn som "din näsa" eller "Pomperipossas näsa". Men för att spelet ska förstå när spelaren kallar dem "min näsa" och "Pomperipossas näsa" måste en sådan sak vara "understood by its printed name".


Chapter: Böjningen av adjektiv, particip, pronomen och artiklar som inte ingår i namn

Section: Att ange reale-, neutrum- och pluralböjningar av adjektiv, particip, pronomen och artiklar.

Adjektiv (som "grön", "egyptisk" och "urgammal"),  perfekt particip (som "upphittad" och "tagen"),  en del pronomen (som "min" och "någon") och artiklarna ("en" och "den") böjs efter sitt huvudord (ordet de beskriver): diN mössa blir stulEN; diTT paraply blir stulET; diNA hänglsen blir stulNA.

Om man vet vilket huvudord adjektivet etc. har, vet man också hur det ska böjas; men när man skriver interaktiv fiktion vet man inte alltid det i förväg. Exempel: Om en spelare tar något ska han eller hon få lite olika meddelanden beroende på vad han/hon tar: tar han/hon upp gaffeln, ska det stå "Tagen"; tar han/hon upp ett papper, ska det stå "Taget"; tar han/hon upp några pottekulor, ska det stå "Tagna". Ordet "tagen" ska alltså böjas efter vad det är man tar, vad det än är. 

För att Inform ska kunna göra det måste du tala om för spelet hur ordet ska böjas och vilket huvudord det ska böjas efter.

I nödfall kan man alltid göra det med villkorsatser av formen: "if <huvudordet> is plural-named <pluralböjning> otherwise if <huvudordet> is neuter <neutrumböjning> otherwise <realeböjning> end if".
	Report taking something: say "[if the noun is plural-named]Tagna[otherwise if the noun is neuter]Taget[otherwise]Tagen[end if]."
	Report taking something: say "Tag[if the noun is plural-named]na[otherwise if the noun is neuter]et[otherwise]en[end if]."

Men återigen finns det normalt sett enklare sätt. Se nästa avsnitt!


Section. Say-fraser för stark böjning av adjektiv, particip och pronomen

För att underlätta för användaren definierar extensionen Swedish en uppsjö "say-phrases" som är tänkta att användas i det här sammanhanget. I stället för 
	Report taking something: say "[if the noun is plural-named]Tagna[otherwise if the noun is neuter]Taget[otherwise]Tagen[end if]."

räcker det därför att skriva
	Report taking something: say "Tag[en-et-na for the noun]."

Böjningsändelserna och huvudordet sätts alltså inom klammer. (För att vara mer exakt: "Tag[en-et-na for the noun]" definieras som "Tag[if the noun is plural-named]na[otherwise if the noun is neuter]et[otherwise]en[end if]".)

Sådana say-fraser har formen "<reale-neutrum-pluralis> for <någonting>".

FÖRST anges alltså hur adjektivet etc. böjs i reale (en tag-en sak); SEDAN följer bindestreck; DÄREFTER anges hur ordet böjs i neutrum (ett tag-et ting); SEDAN följer ännu ett bindestreck; SIST AV BÖJNINGARNA anges hur ordet böjs i pluralis (några tag-na föremål); EFTER ordet "for" anger man AVSLUTNINGSVIS vilket huvudordet är.
	"jaga[d-t-de for the second noun]"
	"bortglöm[d-t-da for a random thing held by the player]"
	"Di[n-tt-na for stolen thing] [stolen thing weakly inflected] har blivit stul[en-et-na for the stolen thing]."
	"De[nna-tta-ssa for the found thing] [the found thing without definite article] har varit försvunn[en-et-a for the found thing] hur länge som helst."

Swedish definierar "say-phrases" för praktiskt taget alla starka böjningar av svenska adjektiv etc. i reale, neutrum och pluralis (till och med "li[ten-tet-lla]"!).

OBS!

i) Huvudordet kan anges med hjälp av vilka variabler eller konstanter som helst.

ii) Det spelar ingen som helst roll ifall du använder bestämd, obestämd eller ingen artikel i denna fras: "tag[en-et-na for the second noun]", "tag[en-et-na for a second noun]", "tag[en-et-na for second noun]" ger alla exakt samma resultat.


Section: Say-fraser för böjningen av adjektiv, particip och pronomen med underförstått huvudord

Det blir fort tröttsamt att för varje adjektiv skriva ut vilket dess huvudord är. Swedish låter dig därför hoppa över detta i många sammanhang.

Om du redan angett att ett adjektiv ska böjas efter ett bestämt objekt, behöver du inte sedan tala om att nästa adjektiv ska böjas efter samma objekt. Swedish minns vilket det senaste huvudordet var och förutsätter att det även fortsättningsvis är huvudordet för alla adjektiv som inte ingår i något "printed name", fram till dess du som författare anger ett nytt huvudord eller spelaren/läsaren skriver ett nytt kommando och därmed påbörjar ett nytt drag. (Mer exakt: Objektet som adjektiven böjs efter sparas i den globala variabeln "endophoric reference".)

I stället för
	"Di[n-tt-na for stolen thing] kära [stolen thing weakly inflected] har blivit stul[en-et-na for the stolen thing]."
	"De[nna-tta-ssa for the found thing] borttappade [the found thing without definite article] har varit försvunn[en-et-a for the found thing] hur länge som helst."

kan man alltså att skriva
	"Di[n-tt-na for stolen thing] kära [stolen thing weakly inflected] har blivit stul[en-et-na]."
	"De[nna-tta-ssa for the found thing] borttappade [the found thing without definite article] har varit försvunn[en-et-a] hur länge som helst."

Det vanligaste är förmodligen att det är ackusativobjektet ("the noun") som är huvudord. Om du som författare inte anger något annat kommer därför Swedish att förutsätta att ett adjektiv ska böjas efter det objekt som är "the noun" i det kommando som spelaren senast gav. (Mer exakt: Variabeln "endophoric reference" sätts till "the noun" strax efter att Inform läst in ett nytt kommando från spelaren.)

Om huvudordet alltså är "the noun", behöver du därför inte över huvud taget ange det. I stället för
	"Di[n-tt-na for noun] [noun weakly inflected] har blivit stul[en-et-na]."
	"De[nna-tta-ssa for the noun] [the noun without definite article] har varit försvunn[en-et-a] hur länge som helst."

räcker det alltså att skriva
	"Di[n-tt-na] [noun weakly inflected] har blivit stul[en-et-na]."
	"De[nna-tta-ssa] [the noun without definite article] har varit försvunn[en-et-a] hur länge som helst."

Och i stället för
	Report taking: say "Tag[en-et-na for the noun]."

räcker det med
	Report taking: say "Tag[en-et-na]".

Say-phrases på formen "[<reale-neutrum-pluralis>]" betyder alltså generellt sett "[<reale-neutrum-pluralis> for <huvudord>]". Och om  inget annat huvudord har angetts, så betyder därmed "[<reale-neutrum-pluralis>]" detsamma som "[<reale-neutrum-pluralis> for the noun]"


Section: Say-fraser för adjektiv, particip och pronomen som saknar böjningsändelser i reale, neutrum eller pluralis

Många ord saknar böjningsändelser i reale eller neutrum eller pluralis. Det gäller t.ex.  arg/argt/arga, släppt/släppt/släppta, blå/blått/blå och många andra. Om en böjningsändelse saknas markerar du det genom att inte skriva någonting på den plats där böjningsändelsen saknas:
	"Du anfalls av [en-ett for attacking monster] arg[-t-a] [attacking monster]. De[n-t-] är blå[-tt-] av ilska."
	Report dropping: say "Släppt[--a]"


Section: Bestämd och obestämd artikel som inte ingår i något "printed name"

Adjektiv som inte ingår i ett "printed name" föregås ofta av bestämd eller obestämd artikel, och även artiklarna måste böjas efter samma huvudord som adjektiven. Det gör du med say-fraserna "[en-ett for <något>]" eller "[En-Ett for <något>]" och "[den-det for <något>]" eller "[Den-Det for <något>]".
	"Du anfalls av [en-ett for attacking monster] arg[-t-a] [attacking monster]."
	"[En-Ett for attacking monster] arg[-t-a] [attacking monster] anfaller dig!"
	"Du flyr för [den-det for the attacking monster] anfallande [the attacking monster without definite article]."
	"[Den-Det for the attacking monster] anfallande [the attacking monster without definite article] driver dig på flykten."

Dessa say-fraser böjer artiklarna i pluralis, neutrum och reale, allt efter som huvudordet är "plural-named", "neuter" eller "common-gendered". Fraserna "[en-ett for <något>]" och "[den-det for <något>]" ger artikeln liten begynnelsebokstav; fraserna "[En-Ett for <något>]" och "[Den-Det for <något>]" ger artikeln stor begynnelsebokstav.

Som vanligt betyder kortformerna "[en-ett]", "[En-Ett]", "[den-det]" och "[Den-Det]" detsamma som "[en-ett for <huvudordet>]", "[En-Ett for <huvudordet>]", "[den-det for <huvudordet>]" respektive "[Den-Det for <huvudordet>]". Och som vanligt gäller att om inget annat angetts är det det "the noun" som är huvudordet.

OBS!

Fraserna "[en-ett for <ett föremål>]" och "[En-Ett for <ett föremål>]" skriver ingenting, om du angett att föremålet i fråga är "non-count". Är föremålet "not non-count", och du uttryckligen har angett en "indefinite article" för föremålet, så används denna. I övriga fall används "en", "ett" och "några" i reale, neutrum respektive pluralis.


Section: Say-fraser för svag böjning av adjektiv

Hittills har det bara varit tal om s.k. stark böjning av adjektiv etc; det är den böjningen som gör skillnad på ändelser i reale, neutrum och pluralis (den-ord, det-ord och de-ord).

Vid vissa tillfällen behöver vi dock i stället använda s.k. svag böjning av adjektiven, och den svaga böjningen gör bara skillnad på maskulinum och femininum (han-ord och hon-ord). (Detta är samma tillfällen då det finns anledning att använda sig av say-fraserna "[<föremålet> without definite article]" eller "[<föremål> weakly inflected]".)

Antag att spelaren kan försöka reta upp olika varelser ("persons") i spelet och att vi vill kunna säga både "Du lyckas inte reta upp den kolugnA sjuksköterskan", "Du lyckas inte reta upp det kolugnA statsrådet", "Du lyckas inte reta upp de kolugnA AIK-supportrarna" och "Du lyckas inte reta upp den kolugnE trapistmunken". I Swedish gör vi det med say-frasen "[a-e for <objekt>]":
	Check provoking someone: say "Du lyckas inte reta upp [den-det for the noun] kolugn[a-e] [the noun without definite article]."

Och som vanligt, om huvudordet är "the noun", behöver det inte anges:
	Check provoking someone: say "Du lyckas inte reta upp [den-det] kolugn[a-e] [the noun without definite article]."

OBS!

i) Med undantag för "[a-e]" har de adjektivböjningar som inte ingår i ett "printed name" alltid två bindestreck, även när en eller flera av böjningsformerna inte markeras av någon ändelse som i "[-t-a]", "[n-t-]", "[--a]" och "[-tt-]".

ii) Förväxla inte "[-a]" (pluraländelsen i bestämd form som i "kalhyggen-a") med "[--a]" (som i "låst / låst / låst-a").

[
Chapter: Say-fraser för personliga och possessiva pronomen 

I vissa fall vill man kunna referera med ett personligt pronomen till ett variabelt objekt som man inte vet någonting om på förhand, inte om det är singulärt eller pluralt, inte om det är neutrum, reale, femininum eller maskulinum, inte om det är identiskt med spelfiguren eller ej. Swedish definierar textsubstitutioner även för detta ändamål. 

(Eller är åtminstone tänkt att göra det till slut)
]
 
Chapter: Egennamn och förkortningar med liten begynnelsebokstav

Några få ord, i första hand egennamn och vetenskapliga förkortningar som "af Chapman", "von Linné", "bin Ladin", ”el-Alamein”, "pH", "kg" stavas med liten bokstav i början även om de skulle inleda en mening. I Swedish anger man detta genom att tala om att ett objekt är "uncapitalisable":
	von Anka is a man in Pengabingen. von Anka is uncapitalisable.

OBS!

Swedish använder formen "uncapitalisable" med S (inte med z) –som ett slags hyllning till Informs skapare, Graham Nelson, som genomgående skriver "-ise" i stället för "-ize".


Chapter: Namn på rum

I engelska Inform är det kutym att man skriver namnen på rummen med stor bokstav: "The Lab is a room" eller "Kitchen is a room", och spelet skriver sedan ut namnet på rummet man kommer till utan bestämd eller obestämd artikel, men behåller stor bokstav för namnet på rummet var det än skrivs ut. Detta går dåligt ihop med svenska skrivregler. 

Swedish förutsätter därför att namn på rum behandlas som namn på vilka föremål som helst. Det finns alltså möjlighet att stava namn på rum med liten bokstav, om man vill skriva ut rummets namn med hjälp av textsubstitutionen "[location]" under spelets gång.
	The köket is a neuter room. The printed name of köket is "kök[et]"
	The balsal is a room. The printed name of the balsal is "[den ]stor[a] balsal[en]".
	Kungsgatan is a room.
	von Ankas pengabinge is a room. von Ankas pengabinge is uncapitalisable.

När man kommer till ett rum skrivs namnet på rummet ut i bestämd form och med stor bokstav. ("Köket", "Den stora balsalen", "Kungsgatan"). Samtidigt kan textsubstitutioner ("grammar tokens") som "[location]", "[a location]", "[A location]", "[the location]", "[The location]" användas med väntat resultat. 


Chapter: Räkneord och pluralböjningar

Section: Att ange om du räknar något och i så fall vad

Inform 7 låter dig skriva ut tal med ord i stället för med siffror med hjälp av say-frasen "[<antal> in words]". 

I svenska kompliceras detta av att svenskan har två uppsättningar räkneord: dels de som används för att räkna saker, dels de som används som namn på saker. Om man räknar rum, heter det "slottet har hundratjugoEN rum"; om man använder samma räkneord som namn på rum, heter det "jag bor i rum hundratjugoETT". 

Ordet "en" används alltså när man räknar saker, medan ordet "ett" används när man inte gör det. ("21 + 31" heter "tjugoETT plus trettioETT" för här används orden som namn på matematiska tal.)

Det finns dock ett viktigt undantag från regeln: även när man räknar antalet saker, så heter det förstås "ETT rum", "ETT monster" och "ETT textspel". I själva verket heter det, när man har en enda sak att räkna, ibland "ett" och ibland "en" ("det finns EN sak i rummet" men "det finns ETT föremål i rummet"), trots att det alltid heter "en" när man har flera saker att räkna ("det finns tjugoen saker i rummet" och "det finns tjugoen föremål i rummet"). I singularis spelar det alltså roll om det man räknar är neutrum (ett-ord) eller reale (en-ord), i pluralis gör det det inte.

För att Inform ska hålla ordning på det här måste du tala om för spelet dels om du använder räkneorden för att räkna något, dels vad det i så fall är du räknar. Det gör du med say-fraserna "[<antal> in words counting neuters]". "[<antal> in words counting common gender]", "[<antal> in words counting nothing]". 
	"Den senaste månaden har vi avverkat [a random number between 0 and 32000 in words counting neuters] träd."
	"Jaha, du ska tydligen bo i rum [a random number between 17 and 170 in words counting nothing]."

Om du inte anger annat kommer Swedish att förutsätta att du räknar något och att det du räknar är reale ("counting common gender").

OBS!

Ett mindre viktigt undantag från regeln ovan är ören och år: det heter alltid "-ett" när man räknar ören  och år: "Hon var tjugoett år gammal", "Då för tiden kostade smöret femtioett öre kilot." Japp, det går utmärkt att skriva "[<antal> in words counting öre]", "[<antal> in words counting ören]" "[<antal> in words counting år]" eller "[<antal> in words counting ålder]", så blir det rätt. (Mer exakt: "counting öre/ören/år/ålder" är likvärdigt med "counting nothing".)


Section: Pluralböjningar

Efter att ha sagt ett tal (vare sig i ord eller siffror) behöver man kunna skilja på singularis- och pluralisformen av det man räknar.
	"Den senaste året har vi producerat [a random number between 0 and 32000 in words counting neuters] [if the number-just-said is 1]kalhygge[otherwise]kalhyggen[end if]."

För att underlätta för författaren definierar Swedish say-fraser även för pluralböjningar. Lägg till ändelsen inom klammer i analogi med hur Swedish hanterar andra böjningar.
	"Nu har du fått ihop [the number of nötter in the gömställe] nöt[ter] i gömstället inför vintern."
	"Du märker genast att det finns åtminstone [the number of secret police in the location in words counting common gender] civilklädd[a] polis[er] i rummet."
	"I rummet lokaliserar du genast [the number of secret police in the location minus one in words counting common gender] kolleg[a-er]."

Vi får problem med pluralformen av ord som "äpple" och "kalhygge". Det går inte skriva "äpple[n]" och "kalhygge[n]", eftersom textsubstitutionen "[n]" redan är upptagen. Den står ju för ändelse i bestämd form (som i "stubbe[n]" och "gubbe[n]"). I stället använder vi för pluraländelsen -n textsubstitutionen "[-n]". Skriv alltså
	"Den senaste året har vi producerat [a random number between 0 and 32000 in words counting neuters] kalhygge[-n]."


Swedish definierar de flesta pluraländelser som förekommer i svenska. Även de omljud som förekommer är definierade. Det går till exempel att skriva:
	"Det återstår nu [the number of companions counting common gender] tapp[er-ert-ra for companions] m[a-ä]n i din trupp."
	"Fader Abraham, fader Abraham, [x in words counting common gender] s[o-ö]n[er] hade Abraham."
	"I bokhyllan hittar du [the number of interesting böcker in the bokhylla in words] interessanta b[o-ö][k-cker]." 
	"På gårdsplanen ränner det omkring [a random number between 0 and 32000 in words counting common gender] g[å-ä]s[s]."

OBS!

De enda oregelbundna pluralformer som Swedish definierar är "[far-fäder]", "[liten-små]" och "[litet-små]". I andra fall blir du tvungen att skriva saker i stil med:
	"en tunnelbana med [a random number between 1 and 12 in words] [if the number-just-said is 1]butler[otherwise]statligt subventionerade kammartjänare[end if]"


Chapter - Klockslag, tidsrymder och antal

Spel där spelaren behöver ange ett klockslag eller en tidsrymd i sina kommandon är inte så vanliga, men Inform har stöd för detta, och för en författare kan det vara bra att veta vilka format för att ange klockslag och tidsrymder på svenska som Inform tillåter spelaren att använda.

Svaret är att Swedish är tänkt att förstå de flesta sätt att uttrycka tid.

Klockslag kan bland annat uttryckas på följande vis:
	"17.23"
	"17:23"
	"sjutton nollnoll"
	"sjutton noll noll"
	"sjutton noll fem"
	"sjutton och tjugotre"
	"tjugotre minuter över fem"
	"sju minuter i halv sex på morgonen" 
	"klockan tjugo över fem på morronen"
	"kvart i elva på förmiddagen"
	"prick fem över fem på eftermiddan"
	"på slaget tolv"
	"vid midnatt"
	"mitt på dagen"
	(et cetera)

Tidsrymder kan bland annat uttryckas på följande vis:
	"5 minuter"
	"17 timmar"
	"tjugotre timmar och fyrtiotvå minuter"
	"tre kvart"
	"trekvart"
	"tre kvarts timme"
	"två timmar och tre kvart"
	"en halvtimme"
	"en halv timme"
	"en och en halv timma"
	(et cetera)

För detta ändamål har även Informs förståelse av tal skrivna med bokstäver utökats. Swedish förstår tal skrivna med bokstäver från ett till sextio. 

OBS!

i) I vanliga fall tolkar Inform en punkt i spelarens kommando som slut på kommandot, men Swedish gör ett undantag när det gäller just klockslag. I det sammanhanget antar Swedish att det rör sig om ett skiljetecken mellan timmar och minuter.

Det är bara i inmatningen från spelaren som Swedish förstår att en punkt skiljer timmar från minuter! I källtexten, när du skriver spelet, måste du använda kolon och am/pm. SPELAREN kan alltså skriva "vänta till 12.30", men FÖRFATTAREN måste skriva t.ex. "now the time of day is 12:30 PM". 

ii) Ordet "noll" förstår Inform bara i klockslag. I andra fall förstår Inform visserligen siffran "0" men inte ordet "noll".


Chapter:  Use options och textsubstitutioner för ord med alternativa stavningar

Section: Use options för alternativa stavningar

Det finns alternativa stavningar av ett antal vanliga svenska ord: dig/dej; de/dom; någon/nån; ska/skall; lite/litet. Somliga av dessa förekommer i meddelanden som översättningen av Inform skriver ut (framför allt som standardresponser på olika kommandon som t.ex. "Du har redan på DIG DEM").

Författaren kan genom "use options" välja hur extensionen ska stava följande ord: mig, dig, sig (mej, dej, sej); de, dem (dom); gett (givit); lade (la); lite (litet); ned, nedför, nedåt (ner, nerför, neråt); någon, något, några, någonsin, någonstans, någonting, någonvart (nån, nåt, nåra, nånsin, nånstans, nånting, nånvart); sade (sa); sedan (sen); ska (skall); sådan, sådant, sådana (sån, sånt, såna); säga, säg, säger (säja, säj, säjer); varandra (varann).

Det förvalda stavningen av alla dessa ord är de som INTE står inom parantes ovan. Om författaren inte använder någon use option kommer Swedish alltså att skriva "dig", "dem", "någon", "ned", "ska" o.s.v. (De förvalda stavningarna är de som anges som huvudvarianten av respektive ord i 13:e upplagan av Svenska Akademiens Ordlista.)

Följande use options med följande effekter på stavningen är tillgängliga:
	"Use dan spelling" ändrar dagen, dagar till dan, dar.
	"Use dej spelling" ändrar mig, dig, sig till mej, dej, sej.
	"Use dom spelling" ändrar de, dem till dom.
	"Use givit spelling" ändrar gett till givit.
	"Use la spelling" ändrar lade till la.
	"Use litet spelling" ändrar lite till litet.
	"Use morron spelling" ändrar morgon, morgonen, morgnar till morron, morronen, mornar.
	"Use ner spelling" ändrar ned, nedför, nedåt till ner, nerför, neråt.
	"Use nån spelling" ändrar någon, något, några, någonsin, någonstans, någonting, någonvart till nån, nåt, nåra, nånsin, nånstans, nånting, nånvart.
	"Use sa spelling" ändrar sade till sa.
	"Use sen spelling" ändrar sedan till sen.
	"Use skall spelling" ändrar ska till skall.
	"Use sån spelling" ändrar sådan, sådant, sådana till sån, sånt, såna.
	"Use säja spelling" ändrar säga, säg, säger till säja, säj, säjer.
	"Use varann spelling" ändrar varandra till varann.

Det finns också två use options som kombinerar flera av dessa:
	"Use formal spelling" kombinerar "use givit spelling", "use litet spelling" och "use skall spelling" och  får samma effekt som om du angett alla tre var för sig.
	"Use informal spelling" kombinerar "use dan spelling", "use dej spelling", "use dom spelling", "use la spelling", "use morron spelling", "use nån spelling", "use sa spelling", "use sen spelling", "use sån spelling", "use säja spelling" och "use varann spelling" och får samma effekt som om du angett alla elva var för sig.

OBS!

Stavningsalternativen "ned/ner" har här inte klassats som vare sig formell eller informell. Föredrar du stavningen "ner" måste detta därför anges separat. Det kan likaså ifrågasättas om stavningen "skall" verkligen är mer formell än stavningen "ska".


Section: Textsubstitutioner som påverkas av use options.

För alla dessa ord finns textsubstitutioner som påverkas av ovanstående use options. Exempel på sådana textsubstitutioner är "[mig]", "[dig]", "[sig]", "[någon]", "[något]", "[några]", "[någonstans]", "[ned]", "[nedför]", "[de]", "[dem]" o.s.v. Dessa är egentligen bara användbara, om du skulle skriva en extension till Swedish. Men i sådana fall kan du alltså skriva t.ex.
	Report looking while in the void: say "Du ser [dig] omkring men ser ingenting [någonstans]."

Användaren av din extension kan därefter anpassa stavningen av denna textsträng med hjälp av use options.

Somliga av textsubstitutionerna finns med stor begynnelsebokstav. Så medan "[några]" ger resultatet "några" eller "nåra", så ger "[Några]" resultatet "Några" eller "Nåra". För en lista på vilka textsubstitutioner som skiljer mellan stor och liten begynnelsebokstav, se kapitlet nedan med listan över alla say-fraser som Swedish definierar.

OBS!

i) Textsubstitutionerna använder ordens förvalda stavning "[dig]", "[någon]", "[dem]", "[sådan]" o.s.v. med undantag för "[de-dom]".

ii) Skilj på "[de-dom]" och "[de]"! Båda resulterar i stavningen "dom", om användaren väljer "dom spelling", och i stavningen "de" annars. Men de används i olika sammanhang: "[de]" ska bara användas för den bestämda artikeln inuti ett "printed name" för ett objekt som är "plural-named" (skriv t.ex.: The printed name of the graverande fakta is "[de ]graverande fakta"); "[de-dom]" ska användas i alla andra fall (d.v.s. när "de/dom" fungerar som personligt eller demonstrativt pronomen eller när en bestämd artikel i pluralis inte ska skrivas ut som en del av ett objekts namn (skriv t.ex.: "Du tittar storögt på [de-dom] jättelika svampar som växer överallt här").


Section: Speciella say-fraser för böjningen av vissa pronomen

Förutom de vanliga "adjektiviska" böjningarna av pronomen definierar Swedish några specialfall. I synnerhet gäller detta pronomen som i en eller annan böjningsform kan stavas på alternativa sätt.

Skriver man "de[n-t-]" och "de[n-t-m]" kan resultaten bara bli "den", "det" eller "de" respektive "den", "det" eller "dem"; skriver man "d[en-et-om]" kan resultaten bara bli "den", "det" eller "dom". Men ibland kan man vilja överlåta till en annan användare att välja stavningsalternativ med hjälp av en "use option" som "use dom spelling". Därför definierar Swedish även textsubstitutionerna "[den-t-]" och "[den-t-m]" som resultar i "den", "det", "de" eller "dom" respektive "den", "det", "dem" eller "dom", beroende på om författaren väljer "use dom spelling" eller ej. 

Motsvarande gäller för textsubstitutionerna "[sådan-t-a]" och "[någon-ot-ra]", som kan resultera i antingen "sådan/sådant/sådana" eller "sån/sånt/såna" respektive "någon/något/några" eller "nån/nåt/nåra".

De textsubstitutioner av böjningsformer som påverkas av use options för stavningsvarianter känns igen genom att hela ordet, inte bara ändelsen, ingår i say-frasen.

Alla dessa fyra say-fraser kompletteras med varianter med stor begynnelsebokstav: "[Den-t-]", "[Den-t-m]", "[Sådan-t-a]", "[Någon-ot-ra]". 

Naturligtvis finns samtliga dessa även på formen "[den-t- for the noun]", "[Den-t-m for the second noun"], "[sådan-t-a for the item described]", "[Någon-ot-ra for the person asked]" etc.

OBS!

Swedish definierar dessutom (redundant) fraserna "[den-det-de]", "[Den-Det-De]", "[den-det-dem]" och "[Den-Det-Dem]". Dessa är inget annat än varianter av  "[den-t-]" o.s.v. 

Chapter: Lista över say-fraser

Här följer en komplett lista över alla say-fraser och textsubstitutioner som Swedish definierar. (Saknar du någon böjningsform så rapportera det gärna till <felix.larsson.IF@gmail.com>.)

Ord inom vinkelparentes ("<>") ersätts med ett värde av angivet slag; snedstreck ("/") betecknar alternativa ordalydelser; två bindestreck ("--") före eller efter snedstreck betecknar att ett ord helt kan utelämnas : "[<antal> in words counting common gender/genders>]" betyder alltså att du som författare kan inleda frasen med vilka siffror eller konstanter eller variabler som helst som anger ett antal och avsluta den med antingen "gender" eller "genders"; medan "[<objektet> without the/-- definite article]" betyder att du kan inleda frasen med vilka namn, konstanter eller variabler som helst som anger ett bestämt objekt och att det inte spelar någon roll om du skriver ett "the" eller inte. 


Section: Fraser för att räkna saker

	"[<antal> in words counting common gender/genders]"
	"[<antal> in words counting common-gendered/common-gendereds]"
	"[<antal> in words counting neuter/neuters]"
	"[<antal> in words counting öre/ören]"
	"[<antal> in words counting år/ålder]"
	"[<antal> in words counting nothing]"
	"[<antal> in words not counting]"
	"[<antal> in words counting <objekt>]"


Section: Fraser för pluralböjningar

Grundmönster för pluralböjningar:
	"[or]" (ros/ros|or)
	"[a-or]" (flick|a/flick|or)
	"[ar]" (gran/gran|ar)
	"[e-ar]" (pojk|e/pojk|ar)
	"[er]" (viol/viol|er)
	"[a-er]" (kolleg|a/kolleg|er)
	"[r]" (ko/ko|r)
	"[-n]" (äpple/äpple|n) (Ska bara användas för pluralböjning! - jfr "[n]" nedan)
	"[a-on]" (ör|a/ör|on)
	"[um-er]" (muse|um/muse|er)
	"[um-a]" (fakt|um/fakt|a)
	"[en-ina]" (exam|en/exam|ina)
	"[e-ia]" (real|e/real|ia)
	"[ta]" (schema/schema|ta)

Omljud i pluralböjningar:
	"[a-ä]" (man/män)
	"[o-ö]" (son/söner)
	"[u-ö]" (lus/löss)
	"[å-ä]" (gås/gäss)

Eufoniska och ortografiska varianter av pluralböjningar:
	"[er-ror]" (åd|er/åd|ror)
	"[mar]" (dröm/dröm|mar)
	"[nar]" (man/man|nar)
	"[en-nar]" (bott|en/bott|nar)
	"[on-nar]" (morg|on/morg|nar)
	"[ron-nar]" (mor|ron/mor|nar)
	"[mar-rar]" (somm|ar/som|rar)
	"[er-rar]" (dott|er/dött|rar)
	"[el-lar]" (padd|el/padd|lar)
	"[mel-lar]" (him|mel/him|lar)
	"[k-cker]" (bo|k/bö|cker)
	"[mer]" (?) (Formen är med för säkerhets skull; jag känner inte till något ord som faktiskt böjs så)
	"[ner]" (vän/vän|ner)
	"[ter]" (nöt/nöt|ter)
	"[el-ler]" (?) (Formen är med för säkerhets skull; jag känner inte till något ord som faktiskt böjs så)
	"[en-ner]" (?) (Formen är med för säkerhets skull; jag känner inte till något ord som faktiskt böjs så)
	"[er-rer]" (?) (Formen är med för säkerhets skull; jag känner inte till något ord som faktiskt böjs så)
	"[s]" (mus/mös|s)

Oregelbundna pluralböjningar:
	"[far-fäder]" (far/fäder)
	"[iten-små]" (liten/små)
	"[litet-små]" (litet/små)


Section:  Fraser för att hoppa över bestämd artikel när man skriver adjektiv i bestämd form eller med svag böjning

	"[<objekt> without the/-- definite article]"
	"[<objekt> weakly inflected]"


Section: Fraser för att ange bestämd och obestämd form i ett objekts "printed name"  

För att skilja mellan bestämd och obestämd form:
	"[if definite]"
	"[if indefinite]"

Bestämda och obestämda artikeln:
	"[den ]" (ger "den " med avslutande mellanslag) (Ska bara användas som obestämde artikel! inte som pronomen!)
	"[det ]" (ger "det " med avslutande mellanslag) (Ska bara användas som obestämde artikel! inte som pronomen!) 
	"[de ]" (ger, beroende på vilken use option som är vald,  "de " eller "dom " med avslutande mellanslag) (Ska bara användas som obestämde artikel! inte som pronomen!)

Grundmönster för bestämda böjningsformer:
	"[en]" (varg/varg|en, hus/hus|en)
	"[n]" (flicka/flicka|n) (Ska bara användas för bestämd form! - jfr "[-n]" ovan)
	"[a-en]" (materi|a/materi|en)
	"[et]" (hus/hus|et)
	"[t]" (öga/öga|t)
	"[na]" (apor/apor|na)
	"[ena]" (hus/hus|ena) (Talspråklig böjningsform)
	"[a]" (gruvlig/gruvlig|a) (Ska bara användas med adjektiv!)
	"[-a]" (äpplen/äpplen|a) (Ska bara användas med substantiv!)
	"[e]" (snorkig/snorkig|e, jagad/jagad|e)
	"[t-a]" (viktig|t/viktig|a)

Eufoniska och ortografiska varianter av bestämda böjningsformer (huvudsakligen substantiv):
	"[men]" (dröm/dröm|men)
	"[met]" (rum/rum|met)
	"[nen]" (man/man|nen)
	"[net]" (?) (Formen är med för säkerhets skull; jag känner inte till något ord som faktiskt böjs så)
	"[en-net]" (vatt|en/vatt|net)
	"[en-nen]" (vap|en/vap|nen)
	"[er-ret]" (mörk|er/mörk|ret)
	"[er-ren]" (papp|er/papp|ren)
	"[el-let]" (tviv|el/tviv|let)
	"[el-len]" (äck|el/äck|len)
	"[mel-len]" (him|mel/him|len)

Eufoniska och ortografiska varianter av bestämda böjningsformer (huvudsakligen adjektiv):
	"[tt-a]" (fri|tt/fri|a)
	"[tt]" (blå|tt/blå)
	"[t-da]" (bestäm|t/bestäm|da)
	"[tt-da]" (rö|tt/rö|da)
	"[tt-dda]" (betro|tt/betro|dda)
	"[t-de]" (jaga|t/jaga|de)
	"[ma]" (öm/öm|ma)
	"[me]" (öm/öm|me)
	"[t-ma]" (öm|t/öm|ma)
	"[t-na]" (gran|t/gran|na)
	"[en-a]" (vunn|en/vunn|a)
	"[et-a]" (vunn|et/vunn|a)
	"[en-na]" (vak|en/vak|na)
	"[en-ne]" (vak|en/vak|ne)
	"[et-na]" (vak|et/vak|na)
	"[er-ra]" (vack|er/vack|ra)
	"[er-re]" (vack|er/vack|re)
	"[ert-ra]" (vack|ert/vack|ra)
	"[el-la]" (simp|el/simp|la)
	"[el-le]" (simp|el/simp|le)
	"[elt-la]" (simp|elt/simp|la)
	"[mal-la]" (gam|mal/gam|la)
	"[mal-le]" (gam|mal/gam|le)
	"[malt-la]" (gam|malt/gam|la)
	"[ten-lla]" (li|ten/li|lla)
	"[ten-lle]" (li|ten/li|lle)
	"[tet-lla]" (li|tet/li|lla)
	"[liten-lilla]" (liten/lilla)
	"[liten-lille]" (liten/lille)
	"[litet-lilla]" (litet/lilla)


Section: Fraser för att ange bestämd och obestämd form utanför ett objekts "printed name"

Starka böjningsformer av adjektiv:
	"[-t-a for <objekt>]" (oätlig/oätlig|t/oätlig|a, vit/vit|t/vit|a, vår/vår|t/vår|a)
	"[-t-a]"
	"[-t-ma for <objekt>]" (tom/tom|t/tom|ma)
	"[-t-ma]"
	"[-tt-a for <objekt>]" (fri/fri|tt/fri|a)
	"[-tt-a]"
	"[-tt- for <objekt>]" (blå/blå|tt/blå)
	"[-tt-]"
	"[d-t-da for <objekt>]" (stäng|d/stäng|t/stäng|da)
	"[d-t-da]"
	"[d-tt-da for <objekt>]" (rö|d/rö|tt/rö|da)
	"[d-tt-da]"
	"[dd-tt-dda for <objekt>]" (betro|dd/betro|tt/betro|dda)
	"[dd-tt-dda]"
	"[--a for <objekt>]" (låst/låst/låst|a)
	"[--a]"
	"[n-t-na for <objekt>]" (gran|n/gran|t/gran|na)
	"[n-t-na]"
	"[en-et-na for <objekt>]" (öpp|en/öpp|et/öpp|na)
	"[en-et-na]"
	"[en-et-a for <objekt>]" (vunn|en/vunn|et/vunn|a; vilk|en/vilk|et/vilk|a)
	"[en-et-a]"
	"[ten-tet-lla for <object>]" (li|ten/li|tet/li|lla)
	"[ten-tet-lla]"
	"[liten-litet-lilla for <objekt>]" (li|ten/li|tet/li|lla)
	"[liten-litet-lilla]"
	"[liten-litet-små for <objekt>]" (li|ten/li|tet/små)
	"[liten-litet-små]"
	"[er-ert-ra for <objekt>]" (vack|er/vack|ert/vack|ra)
	"[er-ert-ra]"
	"[el-elt-la for <objekt>]" (simp|el/simp|elt/simp|la)
	"[el-elt-la]"
	"[mal-malt-la for <objekt>]" (gam|mal/gam|malt/gam|la)
	"[mal-malt-la]"
	"[d-t-de for <objekt>]" (jaga|d/jaga|t/jaga|de)
	"[d-t-de]"

Svag böjning av adjektiv:
	"[a-e for <object>]"
	"[a-e]"

Genus- och pluralböjning av pronomen:
	"[n-tt-na for <objekt]" (mi|n/mi|tt/mi|na)
	"[n-tt-na]"
	"[an-at-a for <object>]" (vår|an/vår|at/vår|a) (Talspråklig böjningsform)
	"[an-at-a]"
	"[nan-nat-dra for <object>]" (an|nan/an|nat/an|dra)
	"[nan-nat-dra]"
	"[n-t- for <objekt>]" (de|n/de|t/de)
	"[n-t-]"
	"[n-t-m for <objekt>]" (de|n/de|t/de|m)
	"[n-t-m]"
	"[en-et-om for <objekt>]" (d|en/d|et/d|om)
	"[en-et-om]"
	"[den-t- for <objekt>]" (den/det/de eller den/det/dom) (Synnerligen användbar textsubstitution! Här i nominativ. Ska bara användas för pronomenen "den", "det" och "de" ("dom") -- inte för bestämda artikeln! Se listan över genus- och pluralböjning för bestämd och obestämd artikel nedan.)
	"[den-t-]"
	"[den-det-de for <objekt>]" (Samma som ovan.)
	"[den-det-de]"
	"[Den-t- for <objekt>]" (Den/Det/De eller Den/Det/Dom) (Samma som ovan fast med versal begynnelsebokstav)
	"[Den-t-]"
	"[Den-Det-De for <objekt>]" (Samma som ovan)
	"[Den-Det-De]"
	"[den-t-m for <objekt>]" (den/det/dem eller den/det/dom) (Samma som ovan fast i ackusativ/dativ med gemen begynnelsebokstav)
	"[den-t-m]"
	"[den-det-dem for <objekt>]" (Samma som ovan)
	"[den-det-dem]"
	"[Den-t-m  for <objekt>]" (Den/Det/Dem eller Den/Det/Dom) (Samma som ovan fast med versal begynnelsebokstav)
	"[Den-t-m]"
	"[Den-Det-Dem  for <objekt>]" (Samma som ovan)
	"[Den-Det-Dem]"
	"[nna-tta-ssa for <objekt>]" (de|nna/de|tta/de|ssa)
	"[nna-tta-ssa]"
	"[sådan-t-a for <objekt>]" (sådan/sådant/sådana eller sån/sånt/såna)
	"[sådan-t-a]"
	"[Sådan-t-a for <objekt>]" (Sådan/Sådant/Sådana eller Sån/Sånt/Såna)
	"[Sådan-t-a]"
	"[on-ot-ra for <objekt>]" (någ|on/någ|ot/någ|ra)
	"[on-ot-ra]"
	"[n-t-ra for <objekt>]" (nå|n/nå|t/nå|ra)
	"[n-t-ra]"
	"[någon-ot-ra for <objekt>]" (någon/något/några eller nån/nåt/nåra)
	"[någon-ot-ra]"
	"[Någon-ot-ra for <objekt>]" (Någon/Något/Några eller Nån/Nåt/Nåra)
	"[Någon-ot-ra]"

Genus- och pluralböjning av bestämd och obestämd artikel:
	"[den-det for <objekt>]" (den/det/de eller den/det/dom) (Ska bara användas för bestämda artikeln -- inte för pronomenen "den", "det" och "de" ("dom")! Se listan över genus- och pluralböjning för pronomen ovan.)
	"[den-det]"
	"[Den-Det for <objekt>]" (Den/Det/De eller Den/Det/Dom) (Samma som ovan fast med versal begynnelsebokstav)
	"[Den-Det]"
	"[en-ett for <objekt>]" (en/ett/några eller en/ett/nåra eller angiven indefinite article för objektet)
	"[en-ett]"
	"[En-Ett for <objekt>]"  (En/Ett/Några eller En/Ett/Nåra eller angiven indefinite article för objektet med versal begynnelsebokstav)
	"[En-Ett]"
	"[n-tt- for <objekt>]" (e|n/e|tt/--) 
	"[n-tt-]"


Section: Alternativa stavningar

	"[dagen]" (dagen eller dan)
	"[dagar]" (dagar eller dar)
	"[mig]" (mig eller mej)
	"[dig]" (dig eller dej)
	"[sig]" (dig eller sej)
	"[Mig]" (Mig eller Mej)
	"[Dig]" (Dig eller Dej)
	"[Sig]" (Sig eller Sej)
	"[de-dom]" (de eller dom)
	"[dem]" (dem eller dom)
	"[De-Dom]" (De eller Dom)
	"[Dem]" (Dem eller Dom)
	"[gett]" (gett eller givit)
	"[lade]" (lade eller la)
	"[lite]" (lite eller litet)
	"[Lite]" (Lite eller Litet)
	"[morgon]" (morgon eller morron)
	"[morgonen]" (morgonen eller morronen)
	"[morgnar]" (morgnar eller mornar)
	"[ned]" (ned eller ner)
	"[Ned]" (Ned eller Ner)
	"[nedför]" (nedför eller nerför)
	"[nedåt]" (nedåt eller neråt)
	"[någon]" (någon eller nån)
	"[något]" (något eller nåt)
	"[några]" (några eller nåra)
	"[Någon]" (Någon eller Nån)
	"[Något]" (Något eller Nåt)
	"[Några]" (Några eller Nåra)
	"[någonsin]" (någonsin eller nånsin)
	"[någonstans]" (någonstans eller nånstans)
	"[någonting]" (någonting eller nånting)
	"[någonvart]" (någonvart eller nånvart)
	"[sedan]" (sedan eller sen)
	"[Sedan]" (Sedan eller Sen)
	"[ska]" (ska eller skall)
	"[sådan]" (sådan eller sån)
	"[Sådan]" (Sådan eller Sån)
	"[sådant]" (sådant eller sånt)
	"[sådana]" (sådana eller såna)
	"[säga]" (säga eller säja)
	"[säg]" (säg eller säj)
	"[säger]" (säger eller säjer)
	"[sade]" (sade eller sa)
	"[varandra]" (varandra eller varann)


Example: * En alldaglig historia - En demonstration av de vanligaste textsubstitutionerna i Swedish (med en grunka som byter namn).

	*: "En alldaglig historia" 

	Include Swedish by Felix Larsson.

	På väg hem is a room. "Du vandrar den vanliga, trygga vägen hem från jobbet."
	
	A mojäng is in På väg hem. The mojäng is privately-named. The printed name of the mojäng is "[if the mojäng is exposed][den ]helt vanlig[a] grej[en][otherwise][den ]mystisk[a] mojäng[en]".
	
	The mojäng can be exposed. The mojäng is not exposed.
	
	Instead of examining the mojäng when the mojäng is carried:
		now the mojäng is exposed;
		say "Vid närmare betraktande visar det [sig] vara en helt vanlig grej."
	
	Test me with "x grej / x mojängen / ta den mystiska / x den mystiska mojängen / släpp grejen / x den vanliga / x mojäng". 


Example: ** Borta på vinden - En demonstration av lite obskyrare textsubstitutioner i Swedish (och exempel på olika stavningar i spelarkommandon).

	*: "Borta på vinden" 

	Include Swedish by Felix Larsson.

	The vinden is a room. "Vinden är full av bråte. Bland [a random number between 0 and 32000 in words counting common gender] saker och [a random number between 0 and 32000 in words counting neuters] ting ligger här till exempel:"
	
	A foto is a neuter in vinden. The printed name of the foto is "[det ]svart-vit[t-a] foto[t] på din morfarsmor".
	
	A docka is in vinden. The printed name is "docka[n] du fick när du fyllde två år".
	
	Some pottekulor are in vinden. The printed name is "pottekulor[na]". The pottekulor are plural-named.
	
	Some gummistövlar are in vinden. The printed name is "[de ]lila och rosa gummistövlar[na] i storlek 24". The gummistövlar are plural-named. The indefinite article of the gummistövlar is "ett par".
	
	After taking something:
		say "Du plockar upp di[n-tt-na for the noun] halvt bortglömda [noun weakly inflected]."
	
	After dropping something:
		say "Du lägger tillbaka [the noun]."
	
	The initial appearance of something is usually "[en-ett for the item described] gam[mal-malt-la for the item described] [item described]"
	
	The description of a thing is usually "[Den-Det for the item described] återfunna [the item described without definite article] väcker många minnen till liv."
	
	Test me with "tag fotot / undersök det / släpp foto / ta upp dockan / x docka / lägg undan den / plocka upp pottekulorna / u pottekulor / ställ ner dem / hämta gummistövlarna / titta på dom / sätt ned gummistövlar"


Example: **** Den mörka manteln - Roger Firths "The Cloak of Darkness" i översättning av Björn Paulsen efter Graham Nelsons och Emily Shorts version för Inform 7.

	*: "Den mörka manteln" 

	Include Swedish by Felix Larsson.

	The story headline is "Ett grundläggande IF-exempel".
	The maximum score is 2.
	
	
	The Operahusets foajé is a room. "Denna rymliga sal är vackert dekorerad i rött och guld med glittrande kristallkronor. Ingången från gatan ligger norrut, och dörröppningar går söder- och västerut."
	
	Instead of trying going north in the foajé, say "Du kom precis, och dessutom tycks vädret utanför bara bli sämre."
	
	
	The garderob is west of the foajé. "I det här lilla rummet måste mängder av krokar ha suttit, men nu återstår bara en. Utgången är en dörr som leder österut." The printed name is "garderob[en]".
	
	In the garderob is a supporter called the liten krok av mässing. The krok is scenery.
	The description of the krok is "Bara en liten mässingskrok [if something is on the krok]som har [list of things on the krok] hängande från sig[otherwise]som sitter fastskruvad i väggen[end if]." The printed name of the krok is "[den ]li[ten-lla] mässingskrok[en]".
	
	Understand "mässings" or "kroken" or "pigg/piggen" as the krok.
	
	
	Bar is south of the foajé. Bar is dark. "Baren är tom, och förvånansvärt sparsmakad efter den påkostade foajén. Någon tycks ha skrivit ett meddelande i sågspånet på golvet."
	The printed name of the bar is "foajéns bar".
	
	The skrivna meddelande is scenery in the bar. The printed name is "[det ]skriv[et-na] meddelande[t]". Understand "golv/golvet" or "sågspån/sågspånet" as the meddelande.
	
	Neatness is a kind of value. The neatnesses are neat, scuffed, and trampled. The meddelande has a neatness. The meddelande is neat.
	
	Instead of examining the meddelande:
		increment score;
		say "Meddelandet, prydligt tecknat i sågspånet, lyder...";
		end the story finally.
	
	Instead of examining the trampled meddelande:
		say "Meddelandet är upptrampat och svårt att läsa. Du kan precis uttyda orden...";
		end the story saying "Du har förlorat.".
	
	Instead of doing something other than going in the bar when in darkness:
		if the meddelande is not trampled, now the neatness of the meddelande is the neatness after the neatness of the meddelande;
		say "I mörkret? Du skulle lätt kunna stöta till något."
	
	Instead of going nowhere from the bar when in darkness:
		now the meddelande is trampled;
		say "Att famla runt i mörkret vore ingen bra idé!"
	
	
	The player wears the mörk mantel av sammet. The mantel can be hung or unhung.
	The description of the mantel is "En stilig sammetsfodrad sidenmantel, och något fuktig av regnet. Tyget är så mörkt att det nästan verka suga åt sig ljus."
	Understand "mörka" or "sammets" or "manteln" or "siden" or "sidenmanteln" as the mantel.
	The printed name of the mantel is "sammetsmantel[n]".
	
	Carry out taking the mantel:
		now the bar is dark.
	
	Carry out putting the unhung mantel on something in the garderob:
		now the mantel is hung;
		increment score.
    
	Carry out putting the mantel on something in the garderob:
		now the bar is lit.
	
	Carry out dropping the mantel in the garderob:
		now the bar is lit.
	
	Instead of dropping or putting the mantel on when the player is not in the garderob:
		say "Det här är inte det bästa stället att lämna en flott mantel utan uppsikt."
	
	
	When play begins:
		say "[paragraph break]Genom novembernattens piskande regn glimmar Operahusets lyktor inbjudande. Det är underligt få människor på gatorna, men å andra sidan, kan man vänta sig mer av ett simpelt demo-spel?"
	
	
	Understand "häng [other things] på/i/från [something]" as putting it on.
	Understand "häng upp [other things] på/i/från [something]" as putting it on.
	
	
	Test me with "s / n / v / utrustning / häng manteln på kroken / ö / s / läs meddelandet".

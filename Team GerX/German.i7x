Version 3/110303 of German by Team GerX begins here.

"GerX: An extension to make German the language of play, written by Banbury,
Christian Blümke and Michael Baltes. Designed for I7 releases 6G60 and 6F95."

"based on deform release 6/11 by Martin Oehm"


Part - I7 additions and replacements

Section - Memory settings

[Im aktuellen I6-Compiler wird der Standardwert von MAX_LINESPACE für
Mac OS X auf 10000 festgelegt, während unter Linux und Windows ein
Wert von 16000 der Standard ist.]

Use MAX_LINESPACE of 16000.


Section - Use options

Use traditional descriptors translates as (- Constant TRADITIONAL_DESCRIPTORS; -).

Use traditional dialect translates as (- Constant DIALECT_TRADITIONAL; -).
Use swiss dialect translates as (- Constant DIALECT_SWISS; -).

Include (- Default INVENTORY_INDENT = 2; -).
Use inventory indent translates as (- Constant INVENTORY_INDENT = 3; -).
Use inventory hyphen bullet translates as (- #IfNDef INVENTORY_BULLET; Constant INVENTORY_BULLET = "- "; #EndIf; -).
Use inventory asterisk bullet translates as (- #IfNDef INVENTORY_BULLET; Constant INVENTORY_BULLET = "* "; #EndIf; -).

Use compound heads translates as (- Constant COMPOUND_HEADS; -).
Use compound tails translates as (- Constant COMPOUND_TAILS; -).

Use non-nested lists translates as (- #IfNDef NO_NESTED_LISTS; Constant NO_NESTED_LISTS = 0; #EndIf; -).
Use non-nested lists with separate paragraphs translates as (- #IfNDef NO_NESTED_LISTS; Constant NO_NESTED_LISTS = 1; #EndIf; -).
Use list buffer size of at least 20 translates as (- Constant LIST_BUFFER_SIZE = {N}; -).

Use explicit error messages translates as (- Constant EXPLICIT_ERROR_MESSAGES; -).

Use capitalized Du translates as (- #IfNDef CAPITAL_YOU; Constant CAPITAL_YOU; #EndIf; -).
Use capitalised Du translates as (- #IfNDef CAPITAL_YOU; Constant CAPITAL_YOU; #EndIf; -).

Use debug messages translates as (- Constant DEBUG_MESSAGES; -).

Use manual pronouns translates as (- #IfNDef MANUAL_PRONOUNS; Constant MANUAL_PRONOUNS; #EndIf; -).

Use line break before printing the author's name translates as (- Constant NEW_LINE_BEFORE_AUTHOR; -). [']

Use init property translates as (- Constant DEFORM_INIT_PROPERTY; -).

Use skip libcheck translates as (- Constant SKIP_LIBCHECK; -).


Section - Values - The four German cases

Kasus is a kind of value.
The Kasus are Nominativ, Genitiv, Dativ and Akkusativ.

The specification of Kasus is "Represents the four German cases. Can be used
to print the object name in the correct case."

Case is a kind of value.
The cases are nominative, genitive, dative and accusative.

The specification of case is "Represents the four German cases in English.
Can be used to print the object name in the correct case or for setting the
case for writing a list."

To change case to (C - a case)
	(deprecated)
	(assignment operation):
	(- short_name_case = {C}-1; -).

To decide which case is the current case: (- (short_name_case + 1) -).


Section - Gender

A thing can be female. A thing can be male. A thing can be neuter.
A thing is usually neuter.
A male thing is never neuter. A female thing is never neuter.
A plural-named thing is never neuter.

A room can be female. A room can be male. A room can be neuter. A room can be plural-named.
A room is usually neuter.
A male room is never neuter. A female room is never neuter. A plural-named room is never neuter.

A man is never female. A man is never neuter. A man is never plural-named.
A woman is never male. A woman is never neuter. A woman is never plural-named. 

The male property translates into I6 as "male".

Gender is a kind of value.
The genders are Mehrzahl, männlich, weiblich, and sächlich.

The specification of gender is "Gender represents genders of a thing as one
of the values männlich, weiblich, sächlich, and Mehrzahl in addition to the
properties female, male, neuter, and plural-named."

Section - Values - Gender

[Die gender-Werte werden in I6 als die Werte 1, 2, 3 und 4 repräsentiert.
|Gender()| arbeitet mit der Basis 0, deshalb muss der von |Gender()| ermittelte
Wert um 1 erhöht werden. ]

To decide what gender is the gender of (something - an object):
	(- (Gender({something}) + 1) -).


Section - Changing Gender tokens

[Understand-Tokens für den CG, Idee und Code von Martin Oehm.
Die Routine |ParseTokenStopped()| musste ebenfalls geändert werden.]

The Understand token m translates into I6 as "CG_MALE_TOKEN".
The Understand token f translates into I6 as "CG_FEMALE_TOKEN".
The Understand token n translates into I6 as "CG_NEUTER_TOKEN".
The Understand token p translates into I6 as "CG_PLURAL_TOKEN".


Section - Values - The Changing Gender (CG)

To decide what gender is the changing gender of (something - an object):
	(- (Gender({something}, true) + 1) -).


Section - Values - Article mode

Article mode is a kind of value. The article modes are bare-mode, definite-mode and indefinite-mode.

To decide what article mode is the current article mode:
	(- indef_mode + 2 -).


Section - Lists - Writing sublists (for non-nested lists)

To write the/-- sublists: (- WriteSublists(1); -).

To write the/-- sublists with line break: (- WriteSublists(2); -).
To write the/-- sublists with paragraph break: (- WriteSublists(3); -).
To write the/-- sublists with space: (- WriteSublists(4); -).

To write the/-- inventory sublists: (- WriteSublists(4,1); -).



Section - Grammar - Setting suffixes and article mode

To set (AM - an article mode) suffixes from (O - an object) with (C - a case):
	(- indef_mode = {AM} - 2; SetLowStrings({C}-1, Gender({O})); -).

To set the/-- current article mode to (AM - an article mode):
	(- indef_mode = {AM} - 2; -).



Section - Grammar - Pronominal adverbs

[A pronominal adverb is a kind of value. The pronominal adverbs are erzwungen, hinein, heraus, hinweg, damit, darauf, darunter, dahinter, nach, hindurch, darüber, herunter, daran, dagegen, darum.

The current pronominal adverb is a pronominal adverb.
To decide what pronominal adverb is the current pronominal adverb: (- pronominal_adverb_flag -).]

To decide whether the/a noun has been supplied by a pronominal adverb: (- (pronominal_adverb_flag) -).
To reset the/-- pronominal adverb: (- pronominal_adverb_flag = false; -).



Section - Special articles

Special article is a kind of value.
The special articles are definite article, yours, no article, and pending.

A thing has a special article called special indefinite article.
The special indefinite article of a thing is usually pending.
The special indefinite article property translates into I6 as "special_article".

The specification of special article is "Only applies when the name of a thing
is printed with an indefinite article: by setting the special indefinite
article for a thing its name can be printed either with a definite article,
with the possesive article 'dein' ('your') or with no article at all, letting
things appear to be proper-named without really being it. The pending value
can be used to apply this property without defining a value right away."


Section - People (in place of Section SR1/11 - People in Standard Rules by Graham Nelson)

The specification of person is "Despite the name, not necessarily
a human being, but anything animate enough to envisage having a
conversation with, or bartering with."

[Die bipolaren either-or properties male/female des Originals auflösen;
eine Person hat jetzt kein explizit vordefiniertes Geschlecht mehr, sie
erbt jedoch das Attribut "neuter" von der Klasse "thing".]

A person can be neuter. A person can be female. A person can be male.

A person has a number called carrying capacity.
The carrying capacity of a person is usually 100.

Include (-
    has transparent animate
    with before NULL, ! number 0,
-) when defining a person.

The yourself is an undescribed person. The yourself is proper-named.

The description of yourself is usually "Gutaussehend wie immer."

The printed name of yourself is "[du]".
[Das ist nur Kosmetik für die Anzeige per showme.
Die eigentliche Ausgabe des Namens wird in print_yourself() erledigt.]

The yourself object translates into I6 as "selfobj".
Include (-
    has proper,
    with saved_short_name "@20",
 -) when defining yourself.


Section - Directions (in place of Section SR1/4 - Directions in Standard Rules by Graham Nelson)

The specification of direction is "Represents a direction of movement, such
as northeast or down. They always occur in opposite, matched pairs: northeast
and southwest, for instance; down and up."

A direction can be privately-named or publically-named. A direction is usually
publically-named.
A direction can be marked for listing or unmarked for listing. A direction is
usually unmarked for listing.

A direction can be male. A direction can be female. A direction can be neuter.
A direction can be plural-named.

A direction is usually male. A neuter direction is never male.
A female direction is never male. A plural-named direction is never male.

A direction has a direction called an opposite.

Include (-
    with special_article definite, ! *** (09.11.2010): Um den indefinite article "the"
                                   !     zu "berschreiben", den jede Richtung bekommt.
	has scenery, ! class CompassDirection,
-) when defining a direction.

[Die Richtungen sind privately-named; so werden die englischen Objektnamen
nicht mit ins Vokabular übernommen.]

A direction is usually privately-named.

The north is a direction.
The northeast is a direction.
The northwest is a direction.
The south is a direction.
The southeast is a direction.
The southwest is a direction.
The east is a direction.
The west is a direction.
The up is a direction.
The down is a direction.
The inside is a direction.
The outside is a direction.

[Die englischen Abkürzungen bleiben jedoch aus Traditionsgründen bestehen.]

The north has opposite south. Understand "n" as north.
The northeast has opposite southwest. Understand "ne" as northeast.
The northwest has opposite southeast. Understand "nw" as northwest.
The south has opposite north. Understand "s" as south.
The southeast has opposite northwest. Understand "se" as southeast.
The southwest has opposite northeast. Understand "sw" as southwest.
The east has opposite west. Understand "e" as east.
The west has opposite east. Understand "w" as west.
Up has opposite down. Understand "u" as up.
Down has opposite up. Understand "d" as down.
Inside has opposite outside. [Understand "in" as inside.]
Outside has opposite inside. [Understand "out" as outside.]

The up object translates into I6 as "u_obj".

The inside object translates into I6 as "in_obj".
The outside object translates into I6 as "out_obj".

The verb to be above implies the mapping up relation.
The verb to be mapped above implies the mapping up relation.
The verb to be below implies the mapping down relation.
The verb to be mapped below implies the mapping down relation.


[Deutsche Synonyme und angezeigte Objektnamen für die Richtungen.]

Understand "Norden" as north.
The printed name of north is "Norden[-s]".

Understand "Nordosten" or "no" as northeast.
The printed name of northeast is "Nordosten[-s]".

Understand "Nordwesten" as northwest.
The printed name of northwest is "Nordwesten[-s]".

Understand "Sueden" as south.
The printed name of south is "Süden[-s]".

Understand "Suedosten" or "so" as southeast.
The printed name of southeast is "Südosten[-s]".

Understand "Suedwesten" as southwest.
The printed Name of southwest is "Südwesten[-s]".

Understand "Osten" or "o" as east.
The printed name of east is "Osten[-s]".

Understand "Westen" as west.
The printed name of west is "Westen[-s]".

Understand "hoch", "h", "rauf", "hinauf" and "oben" as up.
The printed name of up is "oben". Up is proper-named and neuter.

Understand "runter", "r", "hinunter" and "unten" as down.
The printed name of down is "unten". Down is proper-named and neuter.

Understand "rein" or "drinnen" as inside.
The printed name of inside is "drinnen". Inside is proper-named and neuter.

Understand "raus" or "draussen" as outside.
The printed name of outside is "drau[ß]en". Outside is proper-named and neuter.


Section - Remove most of the English commands

Understand the command "take" as something new.
Understand the command "carry" as something new.
Understand the command "hold" as something new.
Understand the command "get" as something new.
Understand the command "pick" as something new.
Understand the command "stand" as something new.
Understand the command "remove" as something new.
Understand the command "shed" as something new.
Understand the command "doff" as something new.
Understand the command "disrobe" as something new.
Understand the command "don" as something new.
Understand the command "wear" as something new.
Understand the command "put" as something new.
Understand the command "drop" as something new.
Understand the command "throw" as something new.
Understand the command "discard" as something new.
Understand the command "give" as something new.
Understand the command "pay" as something new.
Understand the command "offer" as something new.
Understand the command "feed" as something new.
Understand the command "present" as something new.
Understand the command "display" as something new.
Understand the command "show" as something new.
Understand the command "go" as something new.
Understand the command "walk" as something new.
Understand the command "leave" as something new.
Understand the command "run" as something new.

Understand the command "inventory" as something new.
Understand the command "i" as something new.
Understand the command "inv" as something new.

Understand the command "look" as something new.
Understand the command "l" as something new.

Understand the command "consult" as something new.
Understand the command "open" as something new.
Understand the command "unwrap" as something new.
Understand the command "uncover" as something new.
Understand the command "shut" as something new.
Understand the command "cover" as something new.
Understand the command "close" as something new.
Understand the command "cross" as something new.
Understand the command "enter" as something new.
Understand the command "sit" as something new.
Understand the command "exit" as something new.
Understand the command "out" as something new.

Understand the command "x" as something new.

Understand the command "watch" as something new.
Understand the command "describe" as something new.
Understand the command "check" as something new.
Understand the command "examine" as something new.
Understand the command "read" as something new.
Understand the command "yes" as something new.
Understand the command "y" as something new.
Understand the command "yes" as something new.
Understand the command "no" as something new.

[Understand the command "sorry" as something new. ]
[Understand the command "shit" as something new. ]
[Understand the command "fuck" as something new. ]

Understand the command "damn" as something new.
Understand the command "bother" as something new.
Understand the command "curses" as something new.
Understand the command "drat" as something new.
Understand the command "darn" as something new.
Understand the command "search" as something new.
Understand the command "wave" as something new.
Understand the command "adjust" as something new.
Understand the command "set" as something new.
Understand the command "drag" as something new.
Understand the command "pull" as something new.
Understand the command "push" as something new.
Understand the command "move" as something new.
Understand the command "shift" as something new.
Understand the command "clear" as something new.
Understand the command "press" as something new.
Understand the command "rotate" as something new.
Understand the command "twist" as something new.
Understand the command "unscrew" as something new.
Understand the command "screw" as something new.
Understand the command "turn" as something new.
Understand the command "switch" as something new.
Understand the command "lock" as something new.
Understand the command "unlock" as something new.
Understand the command "attack" as something new.
Understand the command "break" as something new.
Understand the command "smash" as something new.
Understand the command "hit" as something new.
Understand the command "fight" as something new.
Understand the command "torture" as something new.
Understand the command "wreck" as something new.
Understand the command "crack" as something new.
Understand the command "destroy" as something new.
Understand the command "murder" as something new.
[Understand the command "kill" as something new.]
Understand the command "punch" as something new.
Understand the command "thump" as something new.
Understand the command "wait" as something new.
[Understand the command "z" as something new.]
Understand the command "answer" as something new.
Understand the command "say" as something new.
Understand the command "shout" as something new.
Understand the command "speak" as something new.
Understand the command "tell" as something new.
Understand the command "ask" as something new.
Understand the command "eat" as something new.
Understand the command "sleep" as something new.
Understand the command "nap" as something new.
Understand the command "sing" as something new.
Understand the command "climb" as something new.
Understand the command "scale" as something new.
Understand the command "purchase" as something new.
Understand the command "buy" as something new.
Understand the command "squeeze" as something new.
Understand the command "swim" as something new.
Understand the command "dive" as something new.
Understand the command "swing" as something new.
Understand the command "blow" as something new.
Understand the command "pray" as something new.
Understand the command "wake" as something new.
Understand the command "awake" as something new.
Understand the command "awaken" as something new.
Understand the command "kiss" as something new.
Understand the command "embrace" as something new.
Understand the command "hug" as something new.
Understand the command "think" as something new.
Understand the command "sniff" as something new.
Understand the command "smell" as something new.
Understand the command "listen" as something new.
Understand the command "hear" as something new.
Understand the command "feel" as something new.
Understand the command "touch" as something new.
Understand the command "rub" as something new.
Understand the command "shine" as something new.
Understand the command "polish" as something new.
Understand the command "sweep" as something new.
Understand the command "clean" as something new.
Understand the command "dust" as something new.
Understand the command "wipe" as something new.
Understand the command "scrub" as something new.
Understand the command "attach" as something new.
Understand the command "fix" as something new.
Understand the command "tie" as something new.
Understand the command "light" as something new.
Understand the command "burn" as something new.
Understand the command "swallow" as something new.
Understand the command "sip" as something new.
Understand the command "drink" as something new.
Understand the command "fill" as something new.
Understand the command "slice" as something new.
Understand the command "prune" as something new.
Understand the command "chop" as something new.
Understand the command "cut" as something new.
Understand the command "jump" as something new.
Understand the command "skip" as something new.
Understand the command "hop" as something new.
Understand the command "dig" as something new.
Understand the command "score" as something new.

[Understand the command "quit" as something new.
Understand the command "q" as something new.
Understand the command "save" as something new.
Understand the command "restart" as something new.
Understand the command "restore" as something new.
Understand the command "verify" as something new.
Understand the command "version" as something new.]

Understand the command "script" as something new.
Understand the command "transcript" as something new.

[Understand the command "superbrief" as something new.
Understand the command "short" as something new.
Understand the command "verbose" as something new.
Understand the command "long" as something new.
Understand the command "brief" as something new.
Understand the command "normal" as something new.
Understand the command "nouns" as something new.
Understand the command "pronouns" as something new.
Understand the command "notify" as something new.]

Understand the command "insert" as something new.
Understand the command "purchase" as something new.
Understand the command "squash" as something new.
Understand the command "taste" as something new.
Understand the command "fasten" as something new.


Section - German Understand tokens

The Understand token dich translates into I6 as "DICH_TOKEN".
The Understand token dir translates into I6 as "DIR_TOKEN".

The Understand token dativ translates into I6 as "DATIVE_TOKEN".
The Understand token dative translates into I6 as "DATIVE_TOKEN".

The Understand token substantive translates into I6 as "SUBSTANTIVE_TOKEN".
The Understand token substantiv translates into I6 as "SUBSTANTIVE_TOKEN".

The Understand token hinein translates into I6 as "PREP_HINEIN_TOKEN".
The Understand token heraus translates into I6 as "PREP_HERAUS_TOKEN".
The Understand token weg translates into I6 as "PREP_WEG_TOKEN".
The Understand token ab translates into I6 as "PREP_WEG_TOKEN".
The Understand token darauf translates into I6 as "PREP_DARAUF_TOKEN".
The Understand token hinauf translates into I6 as "PREP_DARAUF_TOKEN".
The Understand token nach translates into I6 as "PREP_NACH_TOKEN".
The Understand token hindurch translates into I6 as "PREP_HINDURCH_TOKEN".
The Understand token hinüber translates into I6 as "PREP_HINUEBER_TOKEN".
The Understand token hinueber translates into I6 as "PREP_HINUEBER_TOKEN".
The Understand token herunter translates into I6 as "PREP_HERUNTER_TOKEN".
The Understand token darunter translates into I6 as "PREP_DARUNTER_TOKEN".
The Understand token daran translates into I6 as "PREP_DARAN_TOKEN".
The Understand token dagegen translates into I6 as "PREP_DAGEGEN_TOKEN".

The Understand token noun hinein translates into I6 as "NOUN_HINEIN_TOKEN".
The Understand token noun heraus translates into I6 as "NOUN_HERAUS_TOKEN".
The Understand token noun damit translates into I6 as "NOUN_DAMIT_TOKEN".
The Understand token noun darauf translates into I6 as "NOUN_DARAUF_TOKEN".
The Understand token noun darunter translates into I6 as "NOUN_DARUNTER_TOKEN".
The Understand token noun dahinter translates into I6 as "NOUN_DAHINTER_TOKEN".
The Understand token noun hindurch translates into I6 as "NOUN_HINDURCH_TOKEN".
The Understand token noun darüber translates into I6 as "NOUN_DARUEBER_TOKEN".
The Understand token noun darueber translates into I6 as "NOUN_DARUEBER_TOKEN".
The Understand token noun herunter translates into I6 as "NOUN_HERUNTER_TOKEN".
The Understand token noun daran translates into I6 as "NOUN_DARAN_TOKEN".
The Understand token noun dagegen translates into I6 as "NOUN_DAGEGEN_TOKEN".


The Understand token held hinein translates into I6 as "HELD_HINEIN_TOKEN".
The Understand token held darauf translates into I6 as "HELD_DARAUF_TOKEN".

The Understand token force nach translates into I6 as "FORCE_NACH_TOKEN".
The Understand token force in translates into I6 as "FORCE_IN_TOKEN".
The Understand token force nach in translates into I6 as "FORCE_NACH_IN_TOKEN".
The Understand token force pronoun translates into I6 as "FORCE_PRONOUN_TOKEN".

The Understand token implicit up translates into I6 as "IMPLICIT_UP_TOKEN".


Section - German commands

[Vor einem Dativ-Token führt die durch Schrägstrich gruppierte Schreibweise
von Präpositionen ("unter/hinter") zu fehlerhaften Nachfragen des Parsers.
Deshalb empfiehlt es sich, Satzmuster mit Präpositionen vor einem Dativ-Token
einzeln anzugeben.]

Understand "punkte" as requesting the score.
Understand the command "punktestand" and "score" as "punkte".
Understand "punkte on/an/ein/einschalten" as switching score notification on.
Understand "punkte off/aus/ausschalten" as switching score notification off.

Understand "notify on/an/ein/einschalten" as switching score notification on.
Understand "notify off/aus/ausschalten" as switching score notification off.
Understand the command "meldungen" as "notify".

Understand "ende" as quitting the game.
Understand the commands "stirb" and "beend" as "ende".

[Alle Formen von "laden" angelegt wegen RESTORE__WD == 'laden' und um
Kollisionen mit einem möglichen vom Autor definierten Objekt "Lade/Laden" zu
verhindern. Siehe dazu auch die geänderte Bedingung für das Prüfen des
Infinitivs in Parser Letter B.]

Understand "load", "lad", "lade" and "laden" as restoring the game.

Understand "neu" or "neustart" as restarting the game.
Understand "speicher" as saving the game.

Understand "skript" or "skript on/an/ein" as switching the story transcript on.
Understand "skript off/aus" as switching the story transcript off.
Understand the commands "script", "transkript", "transcript", "protokoll" and "mitschrift" as "skript".

Understand "superknapp", "superkurz", "super knapp/kurz" or "sehr knapp/kurz" or "immer knapp/kurz" as preferring abbreviated room descriptions.
Understand "ausfuehrlich" or "lang" as preferring unabbreviated room descriptions.
Understand "knapp" or "kurz" as preferring sometimes abbreviated room descriptions.
Understand "pronomen" or "pronomina" or "fuerwoert" as requesting the pronoun meanings.

Understand "nimm [things]" as taking. [Damit NIMM ALLES sich richtig verhält.]
Understand "nimm [dir] [things]" as taking.
Understand "nimm [dir] [things] auf/mit" as taking.
Understand "nimm [a worn thing] ab" as taking off.
Understand "nimm [things] ab" as taking.
Understand "nimm [dir] [things inside] aus [dativ] [something] [heraus]" as removing it from.
Understand "nimm [dir] [things inside] in [dativ] [something] [heraus]" as removing it from.
Understand "nimm [dir] [things inside] von [dativ] [something] [herunter]" as removing it from.
Understand "nimm [dir] [things inside] [noun heraus]" as removing it from.
Understand "nimm [dir] [things inside] [noun herunter]" as removing it from.
Understand "nimm [substantiv] platz auf [dativ] [something]" as entering.
Understand "nimm auf [dativ] [something] [substantiv] platz" as entering.
Understand "nimm [substantiv] platz in [dativ] [something]" as entering.
Understand "nimm in [dativ] [something] [substantiv] platz" as entering.
Understand the commands "nehm" and "hol" as "nimm".

Understand "greif [dir] [things]" or "greif nach [dativ] [things]" as taking.
Understand "greif [things inside] auf [dativ] [something]" as removing it from.
Understand "greif [things inside] in [dativ] [something]" as removing it from.
Understand "greif nach [dativ] [things inside] auf [dativ] [something]" as removing it from.
Understand "greif nach [dativ] [things inside] in [dativ] [something]" as removing it from.
Understand "greif [things inside] [noun heraus]" as removing it from.
Understand "greif an [something] [daran]" as touching.
Understand "greif [someone alive] an" as attacking.
Understand "greif [something] an" as touching.
Understand "greif [someone alive] mit [dativ] [something preferably held] an" as attacking it with.
Understand "greif mit [dativ] [something preferably held] [someone] an" as attacking it with (with nouns reversed).
Understand "greif [things inside] von [dativ] [something] [heraus]" as removing it from.
Understand "greif [things inside] aus [dativ] [something] [heraus]" as removing it from.
Understand the commands "fass" and "ergreif" as "greif".

Understand "pack [things]" or "pack [things] ein" as taking.
Understand "pack [someone]" as attacking.
Understand "pack [other things] auf [something] [darauf]" as putting it on.
Understand "pack [other things] [noun darauf]" as putting it on.
Understand "pack [other things] in [something] [hinein]" as inserting it into.
Understand "pack [other things] [noun hinein]" as inserting it into.

Understand "heb [things] auf" as taking.
Understand "heb [things inside] [noun heraus]" or "heb [things inside] [noun darunter]" as removing it from.
Understand "heb [something] an/hoch" as looking under. [*** Hier heißt es in deform "Lift", das gibt es in I7 aber nicht. ]

Understand "trag [something preferably held]" as wearing.

Understand "steh" or "steh auf" as exiting.
Understand "steh auf von [dativ] [something]" as exiting from.
Understand "steh auf aus [dativ] [something]" as exiting from.
Understand "steh auf [dativ] [something] [darauf]" or "steh [noun darauf]" as entering.

Understand "entfern [a worn thing]" as taking off.
Understand "entfern [things]" as taking.
Understand "entfern [things inside] von [dativ] [something]" as removing it from.
Understand "entfern [things inside] aus [dativ] [something]" as removing it from.

Understand "tu [dich] auf [something]" as entering.
Understand "tu [dich] in [something]" as entering.

Understand "tu [things preferably held] weg" as dropping.
Understand "tu [other things] in [something] [hinein]" as inserting it into.
Understand "tu [other things] [noun hinein]" as inserting it into.
Understand "tu [other things] auf [something] [darauf]" as putting it on.
Understand "tu [other things] [noun darauf]" as putting it on.
Understand the commands "platzier" and "plazier" as "tu".

Understand "steck [other things] in [something] [hinein]" as inserting it into.
Understand "steck [dir] [things] ein" as taking.
Understand "steck [other things] [noun hinein]" as inserting it into.
Understand "steck [other things] auf [something] [darauf]" as putting it on.
Understand "steck [dir] [a wearable thing] an" as wearing.
Understand "steck [something] mit [dativ] [something preferably held] an" as burning it with.
Understand "steck mit [dativ] [something preferably held] [something] an" as burning it with (with nouns reversed).
Understand "steck [something] an" as burning.

[##Empty und ##EmptyT sind in I7 nicht mehr als Standard-Aktionen definiert.]

Understand "lass [dich] auf [dativ] [something] nieder" as entering.
Understand "lass [dich] in [dativ] [something] nieder" as entering.
Understand "lass [things preferably held]" as dropping.
Understand "lass [things preferably held] fallen/liegen/hier/ab/aus/los" as dropping.
Understand "lass [other things] in [dativ] [something]" as inserting it into.
Understand "lass [other things] unter [dativ] [something]" as inserting it into.
Understand "lass [other things] auf [dativ] [something]" as putting it on.
Understand "lass [other things] ueber [dativ] [something]" as putting it on.

Understand "wirf [dich] auf [someone]" as attacking.
Understand "wirf [dich] gegen [something]" as attacking.
Understand "wirf [dich] auf [something]" as entering.
Understand "wirf [dich] in [something]" as entering.
Understand "wirf [things] [weg]" as dropping.
Understand "wirf [other things] in [something] [hinein]" as inserting it into.
Understand "wirf [other things] unter [something] [darunter]" as inserting it into.
Understand "wirf [other things] [noun hinein]" as inserting it into.
Understand "wirf [other things] auf [something]" as putting it on.
Understand "wirf [other things] ueber [something]" as putting it on.
Understand "wirf [something preferably held] nach/auf/gegen/zu [something]" as throwing it at.
Understand "wirf [something] [something preferably held] zu" as throwing it at (with nouns reversed).
Understand "wirf [something] nieder" as attacking.
Understand the commands "werf" and "schmeiss" and "schleuder" as "wirf".

Understand "gib [something preferably held] [dativ] [someone]" as giving it to.
Understand "gib [something preferably held] an [someone]" as giving it to.
Understand "gib [dativ] [someone] [something preferably held]" as giving it to (with nouns reversed).
Understand "gib an [someone] [something preferably held]" as giving it to (with nouns reversed).
Understand the commands "geb" and "offerier" and "reich" and "uebertrag" and "ueberreich" and "uebergib" as "gib".

Understand "fuetter [someone alive] mit [dativ] [something preferably held]" as giving it to (with nouns reversed).
Understand "fuetter mit [dativ] [something preferably held] [someone]" as giving it to.
Understand "fuetter [something preferably held] an [someone]" as giving it to.
Understand "fuetter an [someone] [something preferably held]" as giving it to (with nouns reversed).
Understand "fuetter [something] mit [dativ] [other things]" as inserting it into (with nouns reversed).
Understand the commands "bezahl" and "zahl" as "fuetter".

Understand "biet [dativ] [someone] [something preferably held]" as giving it to (with nouns reversed).
Understand "biet [something preferably held] [dativ] [someone] an" as giving it to.
Understand "biet fuer [something]" as buying.

Understand "zeig [dativ] [someone] [something preferably held]" as showing it to (with nouns reversed).
Understand "zeig [something preferably held] [dativ] [someone]" as showing it to.
Understand "zeig [dativ] [someone] [something preferably held] vor" as showing it to (with nouns reversed).
Understand "zeig [something preferably held] [dativ] [someone] vor" as showing it to.
Understand "zeig inventar/besitz/eigentum" as taking inventory.
Understand the commands "praesentier" and "fuehr" as "zeig".

Understand "geh" or "geh umher/weg/fort" as going.
Understand "geh in [something] [hinein]" as entering.
Understand "geh durch [something] [hindurch]" as entering.
Understand "geh ueber [something] [hinueber]" as entering.
Understand "geh auf [something] [darauf]" as entering.
Understand "geh [direction]" as going.
Understand "geh nach [direction]" as going.
Understand "geh richtung [direction]" as going.
Understand "geh in richtung [direction]" as going.
Understand "geh nach draussen" as exiting.
Understand "geh raus/hinaus/heraus" as exiting.
Understand "geh rein/hinein/herein" as going into.
Understand the commands "lauf", "renn", "wander", "fluecht", "flieh", "schreit", and "spazier" as "geh".

Understand "verlass" as location-leaving.
Understand "verlass [someone alive]" as vaguely going from.
Understand "verlass [something]" as exiting from.
Understand "verlass ort/raum/platz/standort" as location-leaving.
Understand "verlass den/dies ort/raum/platz/standort" as location-leaving.
Understand "verlass [a room]" as location-leaving.

Understand "mach [something] zu" as closing.
Understand "mach [something] auf" as opening.
Understand "mach [someone alive] an" as attacking.
Understand "mach [something] an" as switching on.
Understand "mach [something] aus" as switching off.
Understand "mach [something] kaputt" as attacking.

Understand "inventar" as taking inventory.
Understand "inventar hoch/liste/lang" as tall taking inventory.
Understand "inventar quer/satz/breit" as wide taking inventory.
Understand "inventar als liste" as tall taking inventory.
Understand "inventar als satz" as wide taking inventory.
Understand the commands "i", "inv", "besitz" and "eigentum" as "inventar".

Understand "schau" or "schau [dich] um" or "schau herum/umher" as looking.
Understand "schau [something]" or "schau [dir] [something] an" as examining.
Understand "schau nach [dativ] [direction]" as examining.
Understand "schau in [dativ] [direction]" as examining.
Understand "schau durch [something] [hindurch]" as searching.
Understand "schau in [something] [hinein]" as searching.
Understand "schau aus [something] [heraus]" as searching.
Understand "schau in [dativ] [something] [nach]" as searching.
Understand "schau auf [dativ] [something] [nach]" as searching.
Understand "schau [noun hinein]" or "schau [noun hindurch]" as searching.
Understand "schau [noun darunter] [nach]" or "schau [noun dahinter] [nach]" as looking under.
Understand "schau unter [dativ] [something] [nach]" as looking under.
Understand "schau hinter [dativ] [something] [nach]" as looking under.
Understand "schau unter [dativ] [something] [darunter]" as looking under.
Understand "schau nach in [dativ] [something]" as searching.
Understand "schau nach auf [dativ] [something]" as searching.
Understand "schau nach [text] in [dativ] [something]" as consulting it about (with nouns reversed).
Understand "schau in [dativ] [something] unter [text] nach" as consulting it about.
Understand "schau in [dativ] [something] nach unter [text]" as consulting it about.
Understand "schau in [dativ] [something] ueber/ob/zu [text] nach" as consulting it about.
Understand "schau in [dativ] [something] [text] nach" as consulting it about.
Understand "schau [force nach in] [text] nach in [dativ] [something]" as consulting it about (with nouns reversed).
Understand "schau [force nach] [text] in [dativ] [something] nach" as consulting it about (with nouns reversed).
Understand the commands "seh" and "sieh" and "blick" and "lug" and "guck" and "kuck" as "schau".

Understand "lage" and "l" as looking.

Understand "lern nach/ob/ueber/von [text] in [dativ] [something]" as consulting it about (with nouns reversed).
Understand "lern nach/ob/ueber/von [text] aus [dativ] [something]" as consulting it about (with nouns reversed).
Understand "lern [text] in [dativ] [something]" as consulting it about (with nouns reversed).
Understand "lern [text] aus [dativ] [something]" as consulting it about (with nouns reversed).
Understand "lern in [dativ] [something] nach/ob/ueber/von [text]" as consulting it about.
Understand "lern aus [dativ] [something] nach/ob/ueber/von [text]" as consulting it about.
Understand the command "forsch" as "lern".

Understand "konsultier [something] ueber/bezueglich [text]" as consulting it about.

Understand "oeffne [something]" as opening.
Understand "oeffne mit [dativ] [something preferably held] [something]" as unlocking it with (with nouns reversed).
Understand "oeffne [something] mit [dativ] [something preferably held]" as unlocking it with.

Understand  "betritt [something]" as entering.
Understand the commands "durchquer" or "betret" as "betritt".

Understand "tritt [something]" as attacking.
Understand "tritt gegen [something]" as attacking.
Understand "tritt ein" as going into.
Understand "tritt aus/heraus/hinaus" as exiting.
Understand "tritt aus [dativ] [something] [heraus]" as exiting from.
Understand "tritt in [something] [hinein]" or "tritt ein in [something]" as entering.
Understand "tritt [noun hinein]" as entering.
Understand the command "tret" as "tritt".

[Solange die Reihenfolge der Grammar-Lines noch nicht beeinflusst werden kann,
werden die [dich]-Token in mehrdeutigen Satzmustern durch entsprechende
Check-Rules ersetzt.]

Understand "setz [dich] auf [something] [darauf]" or "setz [dich] in [something] [hinein]" as entering.
Understand "setz [dich] auf/in [something] nieder" as entering.
Understand "setz [dich] [noun hinein]" as entering.
Understand "setz [dich] [noun darauf]" as entering.

Understand "setz [things preferably held] ab/hin" as dropping.

Understand "setz [other things] in [something] [hinein]" as inserting it into.
Understand "setz [other things] in [dativ] [something] ab" as inserting it into.
Understand "setz [other things] [noun hinein]" as inserting it into.

Understand "setz [other things] auf [something] [darauf]" as putting it on.
Understand "setz [other things] auf [dativ] [something] ab" as putting it on.
Understand "setz [other things] [noun darauf]" as putting it on.

[Die vier folgenden Understand-Lines, die ein Dich-Token enthalten,
werden ebenfalls nicht korrekt geparst; zusätzliche Hilfs-Check-Rules sollen
Abhilfe schaffen.]

Understand "leg [dich] in [something] [hinein]" as entering.
Understand "leg [dich] auf [something] [darauf]" as entering.
Understand "leg [dich] auf [something] nieder" as entering.
Understand "leg [dich] in [something] nieder" as entering.

[Die folgenden drei Zeilen werden jedoch korrekt angeordnet.]

Understand "leg [dich] hin" as sleeping.
Understand "leg [dich] [noun hinein]" as entering.
Understand "leg [dich] [noun darauf]" as entering.

Understand "leg [a worn thing] ab" as taking off.
Understand "leg [things preferably held] hin" as dropping.
Understand "leg [things preferably held] [weg]" as dropping.
Understand "leg [other things] in [something] [hinein]" as inserting it into.
Understand "leg [other things] in [something] ab" as inserting it into.
Understand "leg [other things] [noun hinein]" as inserting it into.
Understand "leg [other things] auf [something] [darauf]" as putting it on.
Understand "leg [other things] auf [something] ab" as putting it on.
Understand "leg [other things] [noun darauf]" as putting it on.
Understand "leg [someone alive] um" as attacking.
Understand "leg [something preferably held] an/um" as wearing.

Understand "sitz auf [dativ] [something]" as entering.
Understand "sitz in [dativ] [something]" as entering.
Understand "sitz [noun darauf]" as entering.
Understand "sitz [noun hinein]" as entering.
Understand the command "lieg" as "sitz".

Understand "raus" as exiting.
Understand "raus aus [dativ] [something]" as exiting from.
Understand the commands "heraus", "hinaus" as "raus".

Understand "rein" as going into.
Understand "rein in [something]" as entering.
Understand the commands "hinein" and "herein" as "rein".


Understand "u [something]" as examining.
Understand "u ort/raum/platz/standort" as looking.
Understand "u den/dies ort/raum/platz/standort" as looking.
Understand "u [implicit up]" as going. [So kann man U für RAUF sagen, ohne dass "u [something]" beeinträchtigt wird.]

Understand "untersuch [something]" as examining.
Understand "untersuch ort/raum/platz/standort" as looking.
Understand "untersuch den/dies ort/raum/platz/standort" as looking.
Understand the commands "b", "x", "betracht", "beschreib", "begutacht", and "inspizier" as "untersuch".

Understand "durchsuch [something]" as searching.
Understand the commands "durchwuehl" and "durchstoeber" as "durchsuch".

Understand "lies [something]" as examining.
Understand "lies [things] auf" as taking.
Understand "lies in [dativ] [something]" as examining.
Understand "lies in [dativ] [something] nach" as examining.
Understand "lies nach in [dativ] [something]" as examining.
Understand "lies nach in [dativ] [something] ueber/von [text]" as consulting it about.
Understand "lies nach ueber [text] in [dativ] [something]" as consulting it about (with nouns reversed).
Understand "lies nach von [text] in [dativ] [something]" as consulting it about (with nouns reversed).
Understand "lies [force in] in [dativ] [something] ueber [text] [nach]" as consulting it about.
Understand "lies [force in] in [dativ] [something] von [text] [nach]" as consulting it about.
Understand "lies [force in] in [dativ] [something] nach ueber [text]" as consulting it about.
Understand "lies [force in] in [dativ] [something] nach von [text]" as consulting it about.
Understand "lies [force in] ueber [text] in [dativ] [something] [nach]" as consulting it about (with nouns reversed).
Understand "lies [force in] von [text] in [dativ] [something] [nach]" as consulting it about (with nouns reversed).
Understand "lies [force nach in] ueber [text] nach in [dativ] [something]" as consulting it about (with nouns reversed).
Understand "lies [force nach in] von [text] nach in [dativ] [something]" as consulting it about (with nouns reversed).
Understand "lies [force nach in] [text] nach in [dativ] [something]" as consulting it about (with nouns reversed).
Understand "lies [force nach] [text] in [dativ] [something] nach" as consulting it about (with nouns reversed).
Understand "lies [force in] [text] in [dativ] [something]" as consulting it about (with nouns reversed).
Understand the command "les" as "lies".

Understand "ja" or "j" or "jawohl" as saying yes.

Understand "nein" or "nee" or "noe" as saying no.

Understand "verzeih" or "verzeih mir" or "verzeih mir bitt" or "verzeih bitt" as saying sorry.
Understand the commands "entschuldigung" and "entschuldig" and "pardon" as "verzeih".

Understand the commands "scheiss" and "kack" and "arschloch" and "wichser" and "piss" and "verpiss" and "fick" as "fuck".

Understand "verdammt" or "mist" or "schiet" or "scheibenkl" or "depp" as swearing mildly.

[Auch bei "such" die in/auf/ab/hinter/neben-Schreibweise aufgelöst, um genauere
Nachfragen des Parsers zu erhalten.]

Understand "such in [dativ] [something]" as searching.
Understand "such auf [dativ] [something]" as searching.
Understand "such hinter [dativ] [something]" as searching.
Understand "such neben [dativ] [something]" as searching.

Understand "such [something] ab" as searching.
Understand "such unter [dativ] [something]" as looking under.
Understand "such hinter [dativ] [something]" as looking under.
Understand "such [noun darunter]" or "such [noun dahinter]" as looking under.
Understand "such in [dativ] [something] nach [text]" as consulting it about.
Understand "such nach [text] in [dativ] [something]" as consulting it about (with nouns reversed).
Understand the commands "steober" and "wuehl" as "such".

Understand "wink" as waving hands.
Understand "wink mit [dativ] [something]" as waving.
Understand "wink mit hand" or "wink mit der hand" as waving hands.
Understand "wink mit haende" or "wink mit den haende" as waving hands.

Understand "stell [dich] hin" as exiting.
Understand "stell [dich] auf [something] [darauf]" as entering.
Understand "stell [dich] in [something] [hinein]" as entering.
Understand "stell [dich] [noun hinein]" or "stell [dich] [noun darauf]" as entering.

Understand "stell [something]" as setting it.
Understand "stell [other things] in [something] [hinein]" as inserting it into.
Understand "stell [other things] auf [something] [darauf]" as putting it on.
Understand "stell [other things] [noun hinein]" as inserting it into.
Understand "stell [something] auf [text] ein" or "stell [something] auf [text]" as setting it to.
Understand "stell [something switchable] an/ein" as switching on.
Understand "stell [something switchable] ab/aus" as switching off.
Understand "stell [things preferably held] ab/weg/hin" as dropping.
Understand "stell [things preferably held] [weg]" as dropping.

Understand "zieh [something] [weg]" as pulling.
Understand "zieh an [dativ] [something]" as pulling.
Understand "zieh [a worn thing] ab/aus" as taking off.
Understand "zieh [something] aus [something] [heraus]" as removing it from.
Understand "zieh [something] [noun heraus]" as removing it from.
Understand "zieh [someone alive] aus" as undressing.
Understand "zieh [someone alive] an" as dressing.
Understand "zieh [something preferably held] an/ueber/auf" as wearing.
Understand "zieh [something] aus" as taking off.

Understand "reiss [something] weg" as pulling.
Understand "reiss [something] ab" as taking.
Understand "reiss an [dativ] [something]" as pulling.
Understand "reiss [other things] aus [something] [heraus]" as removing it from.
Understand "reiss [other things] [noun heraus]" as removing it from.
Understand the commands "zerr", "zupf", and "rupf" as "reiss".

Understand "kleid [someone alive]" or "kleid [something]" as dressing.
Understand "kleid [someone alive] an" or "kleid [something] an" as dressing.
Understand "kleid [dich] an mit [dativ] [something preferably held]" as wearing.
Understand "kleid [dich] mit [dativ] [something preferably held] an" as wearing.
Understand "kleid [dich] in [something preferably held]" as wearing.
Understand the commands "bekleid" and "schmueck" as "kleid".

Understand "entkleid [someone alive]" as undressing.

Understand "drueck [something]" as pushing.
Understand "drueck [something] [weg]" as pushing.
Understand "drueck [noun hinein]" and "drueck [noun dagegen]" as pushing.
Understand "drueck gegen [something]" as pushing.
Understand "drueck [something] [direction]" or "drueck [something] nach/richtung [direction]" as pushing it to.
Understand "drueck [something] aus/zusammen" as squeezing.
Understand "drueck [other things] in [something] [hinein]" as inserting it into.
Understand "drueck [something] auf" as opening.
Understand "drueck [something] zu" as closing.
Understand "drueck [something] hoch/hinauf/rauf" or "drueck [something] nach oben" as looking under.
Understand the commands "press", "beweg", "schieb" and "verschieb" as "drueck".

Understand "dreh [something]" or "dreh an [dativ] [something]" as turning.
Understand "dreh [something switchable] an/ein" as switching on.
Understand "dreh [something switchable] ab/aus" as switching off.
Understand "dreh [something] an/ein" as switching on.
Understand "dreh [something] ab/aus" as switching off.
Understand "dreh [something] auf [text]" as setting it to.
Understand "dreh [something] auf" as opening.
Understand "dreh [something] zu" as closing.
Understand the commands "schraub" and "rotier" as "dreh".

Understand "schalt [something switchable]" as switching on.
Understand "schalt [something switchable] an/ein" as switching on.
Understand "schalt [something switchable] ab/aus" as switching off.
Understand "schalt [something]" as switching on.
Understand "schalt [something] an/ein" as switching on.
Understand "schalt [something] ab/aus" as switching off.

Understand "schliess [something]" as closing.
Understand "schliess [a lockable thing] mit [dativ] [something preferably held]" as locking it with.
Understand "schliess [something] mit [dativ] [something preferably held]" as closing it with.
Understand "schliess [something] mit [dativ] [something preferably held] ab/zu" as locking it with.
Understand "schliess [something] ab mit [dativ] [something preferably held]" as locking it with.
Understand "schliess [something] mit [dativ] [something preferably held] auf" as unlocking it with.
Understand "schliess [something] auf mit [dativ] [something preferably held]" as unlocking it with.
Understand the command "sperr" as "schliess".

Understand "verschliess [a lockable thing] mit [dativ] [something preferably held]" as locking it with.
Understand "verschliess [something]" as closing.
Understand "verschliess [something] mit [dativ] [something preferably held]" as closing it with.
Understand the commands "verriegel", "veriegl" and "versperr" as "verschliess".

Understand "schlag [someone alive]" as attacking.
Understand "schlag [noun hinein]" as attacking.
Understand "schlag [something]" as attacking.
Understand "schlag auf [something] ein" as attacking.
Understand "schlag auf [something] [darauf]" as attacking.
Understand "schlag [something] um/ab/entzwei/kaputt" as attacking.
Understand "schlag in [something] [hinein]" as attacking.
Understand "schlag [someone alive] mit [dativ] [something preferably held]" as attacking it with.
Understand "schlag [something] mit [dativ] [something preferably held]" as attacking it with.
Understand "schlag mit [dativ] [something preferably held] gegen [something]" as attacking it with (with nouns reversed).
Understand "schlag [something preferably held] gegen [something]" as attacking it with (with nouns reversed).
Understand "schlag [something] auf" as opening.
Understand "schlag [something] zu" as closing.
Understand "schlag nach in [dativ] [something]" as examining.
Understand "schlag in [dativ] [something] [text] nach" or "schlag in [dativ] [something] ueber/unter/zu [text] nach" as consulting it about.
Understand "schlag [force nach in] ueber/unter/zu [text] nach in [dativ] [something]" as consulting it about (with nouns reversed).
Understand "schlag [force nach in] [text] nach in [dativ] [something]" as consulting it about (with nouns reversed).
Understand "schlag [force nach] [text] in [dativ] [something] nach" as consulting it about (with nouns reversed).

Understand "hau [someone alive]" as attacking.
Understand "hau [noun hinein]" as attacking.
Understand "hau [something]" as attacking.
Understand "hau auf [something] ein" as attacking.
Understand "hau auf [something] [darauf]" as attacking.
Understand "hau [something] um/ab/entzwei/kaputt" as attacking.
Understand "hau in [something] [hinein]" as attacking.
Understand "hau mit [dativ] [something preferably held] gegen [something]" as attacking it with (with nouns reversed).
Understand "hau [something preferably held] gegen [something]" as attacking it with (with nouns reversed).

Understand "brich [something]" or "brich [something] ab/auseinander" as attacking.
Understand "brich [something] ab/auseinander mit [dativ] [something preferably held]" as attacking it with.
Understand the command "brech" as "brich".

Understand "zerbrich [something]" as attacking.
Understand "zerbrich [something] mit [dativ] [something preferably held]" as attacking it with.
Understand the commands "vernicht", "zerstoer", "zerschlag", and "zertruemmer" as "zerbrich".

Understand "toet [someone alive]" as attacking.
Understand "toet [someone alive] mit [dativ] [something preferably held]" as attacking it with.
Understand "toet [something]" as attacking.
Understand "toet [something] mit [dativ] [something preferably held]" as attacking it with.
Understand the commands "attackier" and "ermord" and "mord" and "bekaempf" and "folter" and "quael" and "pruegel" as "toet".

Understand "kaempf mit [dativ] [someone alive]" as attacking.
Understand "kaempf mit [dativ] [something]" as attacking.
Understand "kaempf gegen [someone alive]" as attacking.
Understand "kaempf gegen [something]" as attacking.
Understand "kaempf mit [dativ] [something preferably held] gegen [someone alive]" as attacking it with (with nouns reversed).
Understand "kaempf mit [dativ] [something preferably held] gegen [something]" as attacking it with (with nouns reversed).
Understand "kaempf gegen [someone alive] mit [dativ] [something preferably held]" as attacking it with.
Understand "kaempf gegen [something] mit [dativ] [something preferably held]" as attacking it with.

Understand "wart" or "wart ab" as waiting.
Understand "verharr" or "verweil" as waiting.
Understand "harr aus" as waiting.

Understand "antwort" as vaguely communicating.
Understand "antwort [dativ] [someone alive] [text]" as answering it that.
Understand "antwort [text] zu [dativ] [someone alive]" as answering it that (with nouns reversed).
Understand "antwort [dativ] [something] [text]" as answering it that.
Understand "antwort [text] zu [dativ] [something]" as answering it that (with nouns reversed).
Understand the commands "sag" and "schrei" and "beantwort" as "antwort".

Understand "red" as vaguely communicating.
Understand "red zu [dativ] [someone alive] ueber [text]" as telling it about.
Understand "red mit [dativ] [something] ueber [text]" as telling it about.
Understand "red zu [dativ] [something] ueber [text]" as telling it about.
Understand "red mit [dativ] [someone alive]" as telling it about.
Understand "red zu [dativ] [someone alive]" as telling it about.
Understand "red mit [dativ] [something]" as telling it about.
Understand "red zu [dativ] [something]" as telling it about.
Understand "red [someone alive] ueber [text] an" as telling it about.
Understand "red [something] ueber [text] an" as telling it about.
Understand "red ueber [text] mit [dativ] [someone alive]" as telling it about (with nouns reversed).
Understand "red ueber [text] zu [dativ] [someone alive]" as telling it about (with nouns reversed).
Understand "red ueber [text] mit [dativ] [something]" as telling it about (with nouns reversed).
Understand "red ueber [text] zu [dativ] [something]" as telling it about (with nouns reversed).
Understand the commands "sprech" and "sprich" and "schwatz" and "schwaetz" as "red".

Understand "erzaehl" as vaguely communicating.
Understand "erzaehl [dativ] [someone alive] ueber/von [text]" as telling it about.
Understand "erzaehl [dativ] [something] ueber/von [text]" as telling it about.
Understand the commands "unterricht" and "bericht" and "erklaer" as "erzaehl".

Understand "frag" as vaguely communicating.
Understand "frag [someone alive] ueber/zu/nach/ob [text]" as asking it about.
Understand "frag [someone alive] ueber/zu/nach/ob [text] aus" as asking it about.
Understand "frag [something] ueber/zu/nach/ob [text]" as asking it about.
Understand "frag [something] ueber/zu/nach/ob [text] aus" as asking it about.
Understand the command "befrag" as "frag".

Understand "bitt [someone] um [something]" as asking it for.

Understand "iss [something preferably held]" as eating.
Understand the commands "ess" and "friss" and "verspeis" and "verzehr" as "iss".

Understand "schlaf" or "schlaf ein" as sleeping.
Understand the commands "nick" and "schlummer" and "does" as "schlaf".

Understand "streif [something]" as touching.
Understand "streif [a worn thing] ab" as taking off.
Understand "streif [something] ab" as taking off.

Understand "pfeif" or "traeller" or "jodel" or "sing" as singing.

Understand "kletter [something] hoch" as climbing.
Understand "kletter auf [something] [darauf]" as climbing.
Understand "kletter ueber [something] [hinueber]" as climbing.
Understand "kletter [noun darauf]" as climbing.
Understand "kletter in [something] [hinein]" as entering.
Understand "kletter [noun hinein]" as entering.
Understand "kletter heraus/raus/aus/ab" as exiting.
Understand "kletter [noun heraus]" as exiting from.
Understand "kletter aus [dativ] [something] [heraus]" as exiting from.
Understand "kletter runter/herunter" as exiting.
Understand "kletter [noun herunter]" as getting off.
Understand "kletter von [dativ] [something] [herunter]" as getting off.
Understand the commands "klettre" as "kletter".

Understand "steig [something] hoch" as entering.
Understand "steig auf [something] [darauf]" as entering.
Understand "steig ueber [something] [hinueber]" as entering.
Understand "steig [noun darauf]" as entering.
Understand "steig in [something] [hinein]" as entering.
Understand "steig [noun hinein]" as entering.
Understand "steig runter/herunter/aus/ab" as exiting.
Understand "steig [noun heraus]" as exiting from.
Understand "steig aus [dativ] [something] [heraus]" as exiting from.
Understand "steig [noun herunter]" as getting off.
Understand "steig von [dativ] [something] [herunter]" as getting off.

Understand "erklimm [something]" as climbing.
Understand the command "erkletter" as "erklimm".

Understand "kauf [something]" as buying.
Understand the commands "erwerb" and "erwirb" as "kauf".

Understand "quetsch [something]" as squeezing.
Understand the commands "zerdrueck" and "zerquetsch" as "quetsch".

Understand "schwing [dich] auf [something] [darauf]" as swinging.
Understand "schwing [dich] in [something] [hinein]" as swinging.
Understand "schwing auf/an [something]" as swinging.
Understand "schwing [dich] [noun darauf]" as swinging.
Understand "schwing [something]" or "schwing mit [dativ] [something]" as waving.
Understand "schwing mit hand" or "schwing mit der hand" as waving hands.
Understand "schwing mit haende" or "schwing mit den haende" as waving hands.
Understand the commands "schwenk", "wedel", "wedle", "baumle", and "baumel" as "schwing".

Understand "wach" or "wach auf" or "erwach" as waking up.

Understand "weck [someone]" or "weck [someone] auf" as waking.
Understand the command "erweck" as "weck".

Understand "kuess [someone]" as kissing.
Understand the commands "umarm" and "lieb" and "streichel" and "streichle" and "knutsch" and "liebkos" as "kuess".

Understand "denk" or "denk nach" as thinking.
Understand "denk ueber [text] nach" as thinking about it.
Understand "denk nach ueber [text]" as thinking about it.
Understand "denk an [text]" as thinking about it.

Understand "riech" as smelling.
Understand "riech [something]" or "riech an [dativ] [something]" as smelling.
Understand "riech [noun daran]" as smelling.
Understand the commands "schnueffl" and "schnueffel" and "schnupper" and "beschnupp" and "beschnuef" as "riech".

Understand "hoer" as listening to.
Understand "hoer [something]" or "hoer an [dativ] [something]" or "hoer [dativ] [something] zu" as listening to.
Understand "hoer [noun daran]" as listening to.
Understand the commands "horch" and "lausch" and "belausch" as "hoer".

Understand "schmeck [something]" or "schmeck an [dativ] [something]" as tasting.
Understand "schmeck [noun daran]" as tasting.
Understand the commands "leck" and "kost" and "probier" as "schmeck".

Understand "beruehr [something]" as touching.
Understand the commands "ertast" and "befuehl" and "betast" as "beruehr".

Understand "fuehl [something]" or "fuehl an/ueber/nach [dativ] [something]" or "fuehl [something] an" as touching.
Understand the command "tast" as "fuehl".

Understand "wisch [something]" or "wisch an [dativ] [something]" as rubbing.
Understand "wisch [something] mit [dativ] [something preferably held] [ab]" as rubbing it with.
Understand "wisch mit [dativ] [something preferably held] [something] [ab]" as rubbing it with.
Understand the commands "reinig" and "putz" and "reib" and "schrubb" and "saeuber" and "polier" and "glaett" and "schmirgel" and "buerst" as "wisch".

Understand "bind [something]" as tying it to.
Understand "bind [something] an [something]" as tying it to.
Understand "bind [something] mit [dativ] [something]" as tying it to.

Understand "zuend [something] an" as burning.
Understand "zuend [something] mit [dativ] [something preferably held] an" as burning it with.
Understand "zuend mit [dativ] [something preferably held] [something] an" as burning it with (with nouns reversed).
Understand the command "entzuend" and "entflamm" and "verbrenn" as "zuend".

Understand "brenn [something] an/ab/nieder" as burning.
Understand "brenn [something] mit [dativ] [something preferably held] an/ab/nieder" as burning it with.
Understand "brenn mit [dativ] [something preferably held] [something] an/ab/nieder" as burning it with (with nouns reversed).

Understand "trink [something]" as drinking.
Understand "trink [something] aus/leer" as drinking.
Understand the command "sauf" and "schluerf" and "schluck" as "trink".

Understand "schneid [someone alive]" as attacking.
Understand "schneid [something]" as cutting.
Understand the commands "trenn" and "spalt" and "teil" and "zertrenn" and "durchschneid" and "zerteil" and "zerschneid" as "schneid".

Understand "spring" or "spring hoch/herum/umher" as jumping.
Understand the command "huepf" as "spring".


Section - Saying - Names with definite articles

To say Der (obj - object): (- print (GDer) {obj}; -).
To say Des (obj - object): (- print (GDes) {obj}; -).
To say Dem (obj - object): (- print (GDem) {obj}; -).
To say Den (obj - object): (- print (GDen) {obj}; -).

To say der (obj - object): (- print (der) {obj}; -).
To say des (obj - object): (- print (des) {obj}; -).
To say dem (obj - object): (- print (dem) {obj}; -).
To say den (obj - object): (- print (den) {obj}; -).


Section - Saying - Names with indefinite articles

To say Ein (obj - object): (- print (GEin) {obj}; -).
To say Eines (obj - object): (- print (GEines) {obj}; -).
To say Einem (obj - object): (- print (GEinem) {obj}; -).
To say Einen (obj - object): (- print (GEinen) {obj}; -).

To say ein (obj - object): (- print (ein) {obj}; -).
To say eines (obj - object): (- print (eines) {obj}; -).
To say einem (obj - object): (- print (einem) {obj}; -).
To say einen (obj - object): (- print (einen) {obj}; -).

To say Kein (obj - object): (- print (GKein) {obj}; -).
To say Keines (obj - object): (- print (GKeines) {obj}; -).
To say Keinem (obj - object): (- print (GKeinem) {obj}; -).
To say Keinen (obj - object): (- print (GKeinen) {obj}; -).

To say kein (obj - object): (- print (kein) {obj}; -).
To say keines (obj - object): (- print (keines) {obj}; -).
To say keinem (obj - object): (- print (keinem) {obj}; -).
To say keinen (obj - object): (- print (keinen) {obj}; -).


Section - Saying - Names without articles

To say (obj - an object): (- WithoutArt({obj}); -).

To say (obj - an object) with (C - a case): (- WithoutArt({obj}, {C}-1); -).

To say (obj - an object) definite with (C - a case): (- WithoutArt({obj}, {C}-1, 1); -).
To say (obj - an object) indefinite with (C - a case): (- WithoutArt({obj}, {C}-1, 2); -).

To say (obj - an object) im (K - a Kasus): (- WithoutArt({obj}, {K}-1); -).

To say (obj - an object) bestimmt im (K - a Kasus): (- WithoutArt({obj}, {K}-1, 1); -).
To say (obj - an object) unbestimmt im (K - a Kasus): (- WithoutArt({obj}, {K}-1, 2); -).


Section - Saying - Personal pronouns

The previously named noun is a thing that varies.
The previously named noun variable translates into I6 as "pnn".

[Die I6-Variable pnn (previously named noun in I7) wird in |STANDARD_NAME_PRINTING_R|,
den Print-Routinen oder direkt vor der Ausgabe auf das angesprochene Objekt gesetzt.
Die Textersetzungen, die sich auf das letzte Objekt beziehen, benutzen pnn
für die Ausgabe.]

[ mit angegebenem Objekt: ]

To say Er (obj - object): (- print (GEr) {obj}; -).
To say Seiner (obj - object): (- print (GSeiner) {obj}; -).
To say Ihm (obj - object): (- print (GIhm) {obj}; -).
To say Ihn (obj - object): (- print (GIhn) {obj}; -).

[ aufs zuletzt genannte Hauptwort bezogen: ]

To say Er: (- print (GEr) pnn; -).
To say Seiner: (- print (GSeiner) pnn; -).
To say Ihm: (- print (GIhm) pnn; -).
To say Ihn: (- print (GIhn) pnn; -).

[ mit angegebenem Objekt: ]

To say er (obj - object): (- print (er) {obj}; -).
To say seiner (obj - object): (- print (seiner) {obj}; -).
To say ihm (obj - object): (- print (ihm) {obj}; -).
To say ihn (obj - object): (- print (ihn) {obj}; -).

[ aufs zuletzt genannte Hauptwort bezogen: ]

To say er: (- print (er) pnn; -).
To say seiner: (- print (seiner) pnn; -).
To say ihm: (- print (ihm) pnn; -).
To say ihn: (- print (ihn) pnn; -).

Section - Saying - Auxiliary verbs

[ mit angegebenem Objekt: ]

To say ist (obj - object): (- print (ist) {obj}; -).
To say hat (obj - object): (- print (hat) {obj}; -).
To say wird (obj - object): (- print (wird) {obj}; -).

[ aufs zuletzt genannte Hauptwort bezogen: ]

To say ist: (- print (ist) pnn; -).
To say hat: (- print (hat) pnn; -).
To say wird: (- print (wird) pnn; -).


Section - Saying - The universal suffix for all inflected adjectives


To say ^: (- print "@00"; -).


Section - Saying - Suffixes (Verbs)

[ mit angegebenem Objekt: ]

To say t (obj - object): (- print (___t) {obj}; -).
To say et (obj - object): (- print (___et) {obj}; -).
To say e (obj - object): (- print (___e) {obj}; -).

[ aufs zuletzt genannte Hauptwort bezogen: ]

To say t: (- print (___t) pnn; -).
To say et: (- print (___et) pnn; -).
To say e: (- print (___e) pnn; -).


Section - Saying - Suffixes (Nouns)

To say -n: (- print "@01"; -).
To say -en: (- print "@02"; -).
To say -s: (- print "@03"; -).
To say -es: (- print "@04"; -).


Section - Saying - Definite articles in proper names

To say der: (- print (string) LanguageArticles-->(1 + short_name_case * 4); -).
To say die: (- print (string) LanguageArticles-->(2 + short_name_case * 4); -).
To say das: (- print (string) LanguageArticles-->(3 + short_name_case * 4); -).
To say die plural: (- print (string) LanguageArticles-->(0 + short_name_case * 4); -).
To say -der-/-die-/-das- (obj - object):
	(- SetPreviouslyNamedNoun({obj}); print (string) LanguageArticles-->(Gender({obj}) + short_name_case * 4); -).


Section - Saying - Relative pronouns

[ mit angegebenem Objekt: ]

To say *der* (obj - object): (- SetPreviouslyNamedNoun({obj}); print (string) LanguageRelativePronouns-->(Gender({obj}) + Nom * 4); -).
To say *dessen-deren* (obj - object): (- SetPreviouslyNamedNoun({obj}); print (string) LanguageRelativePronouns-->(Gender({obj}) + Gen * 4); -).
To say *dessen-derer* (obj - object): (- SetPreviouslyNamedNoun({obj}); print (string) LanguageRelativePronouns-->(Gender({obj}) + Gen * 4 + 12); -).
To say *dem* (obj - object): (- SetPreviouslyNamedNoun({obj}); print (string) LanguageRelativePronouns-->(Gender({obj}) + Dat * 4); -).
To say *den* (obj - object): (- SetPreviouslyNamedNoun({obj}); print (string) LanguageRelativePronouns-->(Gender({obj}) + Akk * 4); -).

To say *welcher* (obj - object): (- SetPreviouslyNamedNoun({obj}); print (string) LanguageRelativePronouns-->(Gender({obj}) + Nom * 4 + 20); -).
To say *welchem* (obj - object): (- SetPreviouslyNamedNoun({obj}); print (string) LanguageRelativePronouns-->(Gender({obj}) + Dat * 4 + 20); -).
To say *welchen* (obj - object): (- SetPreviouslyNamedNoun({obj}); print (string) LanguageRelativePronouns-->(Gender({obj}) + Akk * 4 + 20); -).

[ aufs zuletzt genannte Hauptwort bezogen: ]

To say *der*: (- print (string) LanguageRelativePronouns-->(Gender(pnn) + Nom * 4); -).
To say *dessen-deren*: (- print (string) LanguageRelativePronouns-->(Gender(pnn) + Gen * 4); -).
To say *dessen-derer*: (- print (string) LanguageRelativePronouns-->(Gender(pnn) + Gen * 4 + 12); -).
To say *dem*: (- print (string) LanguageRelativePronouns-->(Gender(pnn) + Dat * 4); -).
To say *den*: (- print (string) LanguageRelativePronouns-->(Gender(pnn) + Akk * 4); -).

To say *welcher*: (- print (string) LanguageRelativePronouns-->(Gender(pnn) + Nom * 4 + 20); -).
To say *welchem*: (- print (string) LanguageRelativePronouns-->(Gender(pnn) + Dat * 4 + 20); -).
To say *welchen*: (- print (string) LanguageRelativePronouns-->(Gender(pnn) + Akk * 4 + 20); -).


Section - Saying - Capitalized "Du"

To say du: (- print "@20"; -).
To say dir: (- print "@21"; -).
To say dich: (- print "@22"; -).

To say dein: (- print "@23"; -).
To say deine: (- print "@24"; -).

To say deines: (- print "@25"; -).
To say deiner: (- print "@26"; -).

To say deinem: (- print "@27"; -).
To say deinen: (- print "@28"; -).

To set Du to upper-case: (- #ifdef CAPITAL_YOU; SetCapitalisedDu(1); #endif; -).
To set Du to lower-case: (- #ifdef CAPITAL_YOU; SetCapitalisedDu(0); #endif; -).


Section - Saying - The letters "ß" and "ss" (standard, traditional dialect, Swiss dialect)

To say ß: (- print "@30"; -).
To say ~ß: (- print "@31"; -).
To say ss: (- print "@31"; -).


Section - Saying - Debug messages

[Debug-Meldungen kennzeichnen: Idee von Erik Temple]

To say debug: (- #ifdef DEBUG; #ifdef DEBUG_MESSAGES; -).
To say end debug: (-  #endif; #endif; RunParagraphOn(); -).


Section - Saying - Saying lists of things with case

To list the contents of (O - object) with (C - a case),
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
	(- WriteListFromCase(child({O}), {phrase options}, {C}-1); -).

To say contents of (O - an object) with (C - a case)
	(deprecated):
	list the contents of O with C, as a sentence.

To say the contents of (O - an object) with (C - a case)
	(deprecated):
	list the contents of O with C, as a sentence, using the definite article.

To say a list of (OS - description of objects) with (C - a case):
	(- @push subst__v;
		objectloop (subst__v ofclass Object) if ({-bind-variable:OS})
		give subst__v workflag2; else give subst__v ~workflag2;
		WriteListOfMarkedObjects(ENGLISH_BIT, {C}-1);
		@pull subst__v; -).
To say A list of (OS - description of objects) with (C - a case):
	(- @push subst__v;
		objectloop (subst__v ofclass Object) if ({-bind-variable:OS})
		give subst__v workflag2; else give subst__v ~workflag2;
		WriteListOfMarkedObjects(ENGLISH_BIT+CFIRSTART_BIT, {C}-1);
		@pull subst__v; -).
To say list of (OS - description of objects) with (C - a case):
	(- @push subst__v;
		objectloop (subst__v ofclass Object) if ({-bind-variable:OS})
		give subst__v workflag2; else give subst__v ~workflag2;
		WriteListOfMarkedObjects(ENGLISH_BIT+NOARTICLE_BIT, {C}-1);
		@pull subst__v; -).
To say the list of (OS - description of objects) with (C - a case):
	(- @push subst__v;
		objectloop (subst__v ofclass Object) if ({-bind-variable:OS})
		give subst__v workflag2; else give subst__v ~workflag2;
		WriteListOfMarkedObjects(ENGLISH_BIT+DEFART_BIT, {C}-1);
		@pull subst__v; -).
To say The list of (OS - description of objects) with (C - a case):
	(- @push subst__v;
		objectloop (subst__v ofclass Object) if ({-bind-variable:OS})
		give subst__v workflag2; else give subst__v ~workflag2;
		WriteListOfMarkedObjects(ENGLISH_BIT+DEFART_BIT+CFIRSTART_BIT, {C}-1);
		@pull subst__v; -).
To say is-are a list of (OS - description of objects) with (C - a case):
	(- @push subst__v;
		objectloop (subst__v ofclass Object) if ({-bind-variable:OS})
		give subst__v workflag2; else give subst__v ~workflag2;
		WriteListOfMarkedObjects(ENGLISH_BIT+ISARE_BIT, {C}-1);
		@pull subst__v; -).
To say is-are list of (OS - description of objects) with (C - a case):
	(- @push subst__v;
		objectloop (subst__v ofclass Object) if ({-bind-variable:OS})
		give subst__v workflag2; else give subst__v ~workflag2;
		WriteListOfMarkedObjects(ENGLISH_BIT+ISARE_BIT+NOARTICLE_BIT, {C}-1);
		@pull subst__v; -).
To say is-are the list of (OS - description of objects) with (C - a case):
	(- @push subst__v;
		objectloop (subst__v ofclass Object) if ({-bind-variable:OS})
		give subst__v workflag2; else give subst__v ~workflag2;
		WriteListOfMarkedObjects(ENGLISH_BIT+DEFART_BIT+ISARE_BIT, {C}-1);
		@pull subst__v; -).
To say a list of (OS - description of objects) with (C - a case) including contents:
	(-  ignore_append_bit = true; ! *** Liste immer verschachtelt ausgeben
		@push subst__v;
		objectloop (subst__v ofclass Object) if ({-bind-variable:OS})
		give subst__v workflag2; else give subst__v ~workflag2;
		WriteListOfMarkedObjects(ENGLISH_BIT+RECURSE_BIT+PARTINV_BIT+
			TERSE_BIT+CONCEAL_BIT, {C}-1);
		@pull subst__v;
		ignore_append_bit = false; -).


Section - Replaced standard rules

The German print standard inventory rule is listed instead of
the print standard inventory rule in the carry out taking inventory rules.

Carry out taking inventory (this is the German print standard inventory rule):
	if inventory style is wide inventory:
		issue library message taking inventory action number 2; ["Du hast "]
		list the contents of the player with accusative, as a sentence, including contents,
			tersely, giving inventory information;
		issue library message taking inventory action number 4; [" bei dir."]
		if the non-nested lists option is active or the non-nested lists with separate paragraphs option is active:
			write the inventory sublists; [Leerzeichen, Zeilenumbruch]
		otherwise:
			say "[line break]";
	otherwise:
		issue library message taking inventory action number 2; ["Du hast "]
		issue library message taking inventory action number 3; ["Du hast Folgendes bei dir:"]
		list the contents of the player with accusative, with newlines, indented, including contents,
			giving inventory information, with extra indentation.

The German announce items from multiple object lists rule is listed instead of
the announce items from multiple object lists rule in the action-processing rules.

[Für Multi-Aktionen (z.B. NIMM ALLES): Damit es in der Liste der Gegenstände nicht
heißt "grüne Ball: In Ordnung.", sondern "grüner Ball: In Ordnung."]

This is the German announce items from multiple object lists rule:
	if the current item from the multiple object list is not nothing,
		say "[current item from the multiple object list with nominative]: [run paragraph on]".


[ Raumbeschreibungen anpassen ]


The German set pronouns from items in room descriptions rule is listed instead of
the set pronouns from items in room descriptions rule in the for printing a locale paragraph about rulebook.

[Hier die Option "Use manual pronouns." berücksichtigen. Die Pronomen werden bei der Ausgabe von Objekten in der Raumbeschreibung nicht automatisch gesetzt, wenn diese Option gewählt wurde.]

For printing a locale paragraph about a thing (called the item)
	(this is the German set pronouns from items in room descriptions rule):
	if the item is not mentioned and the manual pronouns option is not active, set pronouns from the item;
	continue the activity.

The German-you-can-also-see rule is listed instead of
the you-can-also-see rule in the for printing the locale description rulebook.

For printing the locale description (this is the German-you-can-also-see rule):
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
					if the domain is the location, say "Du siehst hier ";
					otherwise say "In [dem domain] siehst [du] ";
				otherwise if the domain is a supporter:
					say "Auf [dem domain] siehst [du] ";
				otherwise if the domain is an animal:
					say "Auf [dem domain] siehst [du] ";
				otherwise:
					say "In [dem domain] siehst [du] ";
				say "[if the locale paragraph count is greater than 0]au[ß]erdem [end if]";
				let the common holder be nothing;
				let contents form of list be true;
				repeat with list item running through marked for listing things:
					if the holder of the list item is not the common holder:
						if the common holder is nothing,
							now the common holder is the holder of the list item;
						otherwise now contents form of list is false;
					if the list item is mentioned, now the list item is not marked for listing;
				filter list recursion to unmentioned things;
				if contents form of list is true and the common holder is not nothing:
					list the contents of the common holder with accusative, as a sentence, including contents,
						giving brief inventory information, tersely, not listing
						concealed items, listing marked items only;
				otherwise:
					say "[a list of marked for listing things with accusative including contents]";
				say ".[paragraph break]";
				write the sublists; [ Non-nested lists ]
				unfilter list recursion;
			end the listing nondescript items activity with the domain;
	continue the activity.

The German use initial appearance in room descriptions rule is listed instead of
the use initial appearance in room descriptions rule in the for printing a locale paragraph about rulebook.

For printing a locale paragraph about a thing (called the item)
	(this is the German use initial appearance in room descriptions rule):
	if the item is not mentioned:
		if the item provides the property initial appearance and the
			item is not handled and the initial appearance of the item is
			not "":
			increase the locale paragraph count by 1;
			say "[initial appearance of the item]";
			say "[paragraph break]";
			if a locale-supportable thing is on the item:
				repeat with possibility running through things on the item:
					now the possibility is marked for listing;
					if the possibility is mentioned:
						now the possibility is not marked for listing;
				say "Auf [dem item] ";
				list the contents of the item with nominative, as a sentence, including contents,
					giving brief inventory information, tersely, not listing
					concealed items, prefacing with is/are, listing marked items only;
				say ".[paragraph break]";
				write the sublists; [ Non-nested lists ]
			now the item is mentioned;
	continue the activity.

The German describe what's on scenery supporters in room descriptions rule is listed instead of
the describe what's on scenery supporters in room descriptions rule in the for printing a locale paragraph about rules.

For printing a locale paragraph about a thing (called the item)
	(this is the German describe what's on scenery supporters in room descriptions rule):
	if the item is [not undescribed and the item is] scenery and
		the item does not enclose the player:
		set pronouns from the item;
		if a locale-supportable thing is on the item:
			repeat with possibility running through things on the item:
				now the possibility is marked for listing;
				if the possibility is mentioned:
					now the possibility is not marked for listing;
			increase the locale paragraph count by 1;
			say "Auf [dem item] ";
			list the contents of the item with nominative, as a sentence, including contents,
				giving brief inventory information, tersely, not listing
				concealed items, prefacing with is/are, listing marked items only;
			say ".[paragraph break]";
			write the sublists; [ Non-nested lists ]
	continue the activity.


Section - New actions and rules


[Inventar als Liste oder als Satz]

Invstyle is a kind of value. The invstyles are wide inventory and tall inventory.

The inventory style is an invstyle variable. The inventory style is tall inventory.

Wide taking inventory is an action applying to nothing.

Carry out wide taking inventory (this is the print wide inventory rule):
	now the inventory style is wide inventory;
	try taking inventory.

Tall taking inventory is an action applying to nothing.

Carry out tall taking inventory (this is the print tall inventory rule):
	now the inventory style is tall inventory;
	try taking inventory.

[-----------------------------------------------------------------------------]

["zieh [someone] an" geht nicht, weil das held-Token bevorzugt wird.]

[Lösungsvorschlag von Emily Short und JDC: Mit einer gefakten Definition können wir die Reihenfolge der
Grammar-Lines in I6 definieren. Das ist ein Workararound; irgendwann soll es in I7 vielleicht mal
eine Möglichkeit geben, die Reihenfolge der I6-Understand-Zeilen eleganter anzugeben.]

Definition: a person is alive: yes.

Definition: a thing is switchable if it is a device.

[ Dress: ZIEH DICH AN vs. ZIEH SCHUHE AN ]

Dressing is an action applying to one thing.
The Dressing action translates into I6 as "Dress".

Check an actor dressing (this is the block dressing rule):
	if the actor is the player:
		if the noun is the player, issue library message dressing action number 2;
		otherwise issue library message dressing action number 1 for the noun;
	otherwise:
		if the noun is the actor, issue actor-based library message dressing action number 3;
		otherwise issue actor-based library message dressing action number 4 for the noun.


[ Undress: ZIEH DICH AUS vs. ZIEH SCHUHE AUS ]

Undressing is an action applying to one thing.
The undressing action translates into I6 as "Undress".

Check an actor undressing (this is the block undressing rule):
	if the actor is the player:
		if the noun is the player, issue library message undressing action number 2;
		otherwise issue library message undressing action number 1 for the noun;
	otherwise:
		if the noun is the actor, issue actor-based library message undressing action number 3;
		otherwise issue actor-based library message undressing action number 4 for the noun.

Exiting from is an action applying to one thing.
Check an actor exiting from
	(this is the convert exiting from to exiting rule):
	convert to the exiting action on nothing.

The specification of the exiting from action is "This action converts to the exiting action when an actor tries to exit a supporter or container, e.g. STEIG VOM TISCH HERUNTER."

Closing it with is an action applying to two things.
Check closing it with
	(this is the convert closing it with to closing rule):
	convert to the closing action on the noun.

The specification of the closing it with action is "This action converts to the closing action when an actor tries to close a thing with something, e.g. SCHLIESS DIE KISTE MIT DEM STEMMEISEN."

Rubbing it with is an action applying to two things.
Check rubbing it with
	(this is the convert rubbing it with to rubbing rule):
	convert to the rubbing action on the noun.

The specification of the rubbing it with action is "This action converts to the rubbing action when an actor tries to rub a thing with something, e.g. REIBE DIE LAMPE MIT DEM TUCH."

Attacking it with is an action applying to two things.
Check attacking it with
	(this is the convert attacking it with to attacking rule):
	convert to the attacking action on the noun.

The specification of the attacking it with action is "This action converts to the attacking action when an actor tries to attack somebody with something, e.g. ERSCHLAGE DEN ORK MIT DEM SCHWERT."

Burning it with is an action applying to two things.
Check burning it with
	(this is the convert burning it with to burning rule):
	convert to the burning action on the noun.

The specification of the burning it with action is "This action converts to the burning action when an actor tries to burn a thing with something, e.g. ZÜNDE DEN OFEN MIT DER KERZE AN."

Going into is an action applying to nothing.
Check going into
	(this is the convert going into to going inside rule):
	convert to the going action on inside.

The specification of the going into action is "This action converts to the going action on the inside when commands like GEH REIN or TRITT EIN are used."

Vaguely going from is an action applying to one thing.
Check vaguely going from (this is the block vaguely going from rule):
	issue library message going action number 7.

The specification of the vaguely going from action is "This action fires when an actor tries to go away from a person, e.g. VERLASS SCARLETT."

Vaguely communicating is an action applying to nothing.
Check vaguely communicating (this is the block vaguely communicating rule):
	say "Bitte gib auch an, was [du] sagen oder fragen möchtest."

The specification of the vaguely communicating action is "This action fires when the player enters communication-related commands missing the interlocutor and/or the topic, e.g. FRAG, REDE, ANTWORTE."

Thinking about it is an action applying to one topic.
Check thinking about it (this is the block thinking about it rule):
	say "Dir fällt jetzt nichts dazu ein.".

The specification of the thinking about it action is "This action fires when an actor tries to think of or remember a topic, e.g. DENKE AN DEN LETZTEN URLAUB."

[------------------------------------------------------------------------------]

[Den aktuellen Standort VERLASSEN und BETRACHTEN vgl. Verbendefinition
für "verlass" und "untersuch".]

Location-leaving is an action applying to one object.

Rule for supplying a missing noun when location-leaving (this is the supply current location when location-leaving rule):
	[say "([den location])[command clarification break]";]
	now the noun is the location.

Carry out location-leaving (this is the leave current location rule):
	let N be 0;
	let target be nothing;
	repeat with D running through directions:
		if room-or-door D from the location is not nothing:
			increase N by 1;
			now target is D;
	if N is 0, issue library message going action number 3; ["Es gibt keine offensichtlichen Ausgänge."]
	if N is 1:
		now the noun is the target;
		issue library message going action number 4 for the noun; ["(nach <Richtung>"]
		convert to the going action on the noun;
	if N is greater than 1, issue library message going action number 5; ["Es gibt mehrere Ausgänge. ..."]

The specification of the location-leaving action is "This action enables the player to leave the current location by using the verb 'verlass'  if there is only one exit."

After deciding the scope of the player while location-leaving or examining (this is the location visibility rule):
	place the location in scope;

Instead of examining a room (this is the convert examine a room into looking rule):
	try looking.

[------------------------------------------------------------------------------]


[Die korrekte Priorisierung der [dich]-Token funktioniert nicht immer, da die
Reihenfolge der I6-Grammar-Lines noch nicht explizit angegeben werden kann.
Deshalb gibt es erstmal Krücken-Check-Rules, die das umgehen.]

[>LEG DICH AUF DAS SOFA]

Check an actor putting the player on
	(this is the convert putting the player on something into entering rule):
	convert to the entering action on the second noun.

[>LEG DICH IN DIE WANNE]

Check an actor inserting the player into
	(this is the convert inserting the player into something into entering rule):
	convert to the entering action on the second noun.

[------------------------------------------------------------------------------]

[Die Pronominaladverbien [noun heraus], usw. ergänzen das unvollständige
Satzmuster immer um das zuletzt angesprochene Objekt, das keine Person
ist. Beispiel:

>durchsuche schrank
In dem Schrank findest du eine Socke.

>nimm socke heraus [wird als "nimm socke aus dem schrank" verarbeitet]
Du nimmst die Socke aus dem Schrank.

Für den Parser ist das eine klare Sache, jedoch nicht unbedingt für den Spieler.
Der hat vielleicht gerade in einer Raumbeschreibung gelesen: "In dem Holster steckt
eine Pistole." und versucht nun

>nimm pistole heraus
Die Pistole ist aber gar nicht in der Socke.

obwohl das zuletzt angesprochene Objekt nicht der Holster war.

Die folgende Check-Rule versucht, ein mögliches Missverständnis aufzulösen
und gibt zur Verdeutlichung in Klammern aus, um welches Objekt die
Anweisung ergänzt wurde, wenn das Antezedens des Adverbialpronomens geändert
wurde.]


Check an actor removing something from
when a noun has been supplied by a pronominal adverb
(this is the adjust the pronominal adverb reference when removing rule):
	if the noun is not in anything and the noun is not on anything:
		say "[Der noun] [ist] aber gar nicht auf oder in irgend etwas.";
		stop the action;
	otherwise:
		let P be the holder of the noun;
		if P is not the second noun:
			if P is a supporter, say "(von [dem holder of the noun])[command clarification break]";
			if P is a container, say "(aus [dem holder of the noun])[command clarification break]";
			reset the pronominal adverb;
			try removing the noun from P;
			rule fails;

Section - Compound Heads and Compound Tails

Table of Compound Heads
head	n
text	a number

Table of Compound Tails
tail	n
text	a number


Section - German Final Question (in place of Section SR3/2 - Final Question in Standard Rules by Graham Nelson)

[The German print the final question rule is listed instead of
the print the final question rule in before handling the final question.]

This is the print the final question rule:
	let named options count be 0;
	repeat through the Table of Final Question Options:
		if the only if victorious entry is false or the story has ended finally:
			if there is a final response rule entry
				or the final response activity entry [activity] is not empty:
				if there is a final question wording entry, increase named options count by 1;
	if the named options count is less than 1, abide by the immediately quit rule;
	say "Möchtest [du] ";
	repeat through the Table of Final Question Options:
		if the only if victorious entry is false or the story has ended finally:
			if there is a final response rule entry
				or the final response activity entry [activity] is not empty:
				if there is a final question wording entry:
					say final question wording entry;
					decrease named options count by 1;
					if the named options count is 0:
						say "?[line break]";
					otherwise if the named options count is 1:
						[if the serial comma option is active, say ",";]
						say " oder ";
					otherwise:
						say ", ".

[The German standard respond to final question rule is listed instead of
the standard respond to final question rule in the for handling the final question rules.]

This is the standard respond to final question rule:
	repeat through the Table of Final Question Options:
		if the only if victorious entry is false or the story has ended finally:
			if there is a final response rule entry
				or the final response activity entry [activity] is not empty:
				if the player's command matches the topic entry:
					if there is a final response rule entry, abide by final response rule entry;
					otherwise carry out the final response activity entry activity;
					rule succeeds;
	issue miscellaneous library message number 8.


Section - German Final Question Options (in place of Section SR3/3 - Final question options in Standard Rules by Graham Nelson)

Table of Final Question Options
final question wording		only if victorious	topic		final response rule		final response activity
"einen NEUSTART"			false				"neustart"	immediately restart the VM rule	--
"einen Spielstand LADEN"	false				"laden"		immediately restore saved game rule	--
"im NACHWORT über lustige Dinge im Spiel erfahren"	true	"nachwort"	--	amusing a victorious player
"das Spiel BeENDEn"			false				"ende"		immediately quit rule	--
--							false				"undo"		immediately undo rule	--


Section - Check noun declinations - Not for release

Declining is an action out of world applying to one object.

Understand "deklinier [any thing]" as declining.
Understand "deklinier [any room]" as declining.

Report declining (this is the standard report declining rule):
	say "[Der noun], [des noun], [dem noun], [den noun].[line break][Ein noun], [eines noun], [einem noun], [einen noun]."


Section - Library Checking - Not for release

To check the/-- library definitions: (- PerformLibcheckAll(0, 1); -).
To silently check the/-- library definitions: (- PerformLibcheckAll(1, 1); -).

Library checking is an action out of world.
Carry out library checking: check library definitions.
Understand "libcheck" as library checking.

When play begins (this is the perform initial libcheck rule):
	if the skip libcheck option is inactive, silently check the library definitions.
	
	
[Ignore list to be continued by the author ...]

Table of blessed verb forms
Verb
"ausgaenge"


Section - Tables of special vocabulary

[Diese Tabelle kann der Autor mit Infinitiven von Verben, aus denen sich nicht
ohne Weiteres der Infinitiv rekonstruieren lässt, fortführen.]

Table of infinitives
Verb		Infinitive
""			""

[Diese Tabelle kann mit Verbformen, die auch als Objektsynonyme verwendet
werden können, fortgeführt werden. Kommandos, die mit diesen
Verben beginnen, werden auf jeden Fall in die Infinitiv-Prüfung geschickt.]

Table of verb-noun collisions
Verb
""



Section - German assembly components workaround

Rule for printing the name of a thing (called the item)
when the item is part of a person and the item is proper-named
(this is the German printing the name of a body part rule):
	let C be the current case;
	if the holder of the item is the player:
		if C is:
			-- nominative:
				if the gender of the item is:
					-- Mehrzahl: say "[deine]";
					-- männlich: say "[dein]";
					-- weiblich: say "[deine]";
					-- sächlich: say "[dein]";
			-- genitive:
				if the gender of the item is:
					-- Mehrzahl: say "[deiner]";
					-- männlich: say "[deines]";
					-- weiblich: say "[deiner]";
					-- sächlich: say "[deines]";
			-- dative:
				if the gender of the item is:
					-- Mehrzahl: say "[deiner]";
					-- männlich: say "[deinem]";
					-- weiblich: say "[deiner]";
					-- sächlich: say "[deinem]";
			-- accusative:
				if the gender of the item is:
					-- Mehrzahl: say "[deine]";
					-- männlich: say "[deinen]";
					-- weiblich: say "[deine]";
					-- sächlich: say "[dein]";
		set definite-mode suffixes from the item with C;
		say " [printed name of item]";
	otherwise:
		if the holder of the item is proper-named:
			set bare-mode suffixes from the item with C;
			say "[holder of item]s [printed name of item]";
		otherwise:
			set definite-mode suffixes from the item with C;
			say "[printed name of item] [des holder of item]";
	now the previously named noun is the item;


Part - Translations of built-in extensions 1

Section - German Rideable Vehicles (for use with Rideable Vehicles by Graham Nelson)

The German can't mount when mounted on an animal rule is listed instead of
the can't mount when mounted on an animal rule in the check mounting rules.

Check an actor mounting (this is the German can't mount when mounted on an animal rule):
	if the actor is carried by a rideable animal (called the steed):
		if the actor is the player, say "Du reitest schon auf [dem steed].";
		stop the action.

The German can't mount when mounted on a vehicle rule is listed instead of
the can't mount when mounted on a vehicle rule in the check mounting rules.

Check an actor mounting (this is the German can't mount when mounted on a vehicle rule):
	if the actor is on a rideable vehicle (called the conveyance):
		if the actor is the player, say "Du fährst schon mit [dem conveyance].";
		stop the action.

The German can't mount something unrideable rule is listed instead of
the can't mount something unrideable rule in the check mounting rules.

Check an actor mounting (this is the German can't mount something unrideable rule):
	if the noun is not a rideable animal and the noun is not a rideable vehicle:
		if the actor is the player, say "[Der noun] [ist] nicht dafür geeignet." instead;
		stop the action.

The German standard report mounting rule is listed instead of
the standard report mounting rule in the report mounting rules.

Report an actor mounting (this is the German standard report mounting rule):
	if the actor is the player:
		say "Du besteigst [den noun].";
		describe locale for the noun;
	otherwise:
		say "[Der actor] besteig[t] [den noun]." instead.

Unsuccessful attempt by someone trying mounting (this is the German mounting excuses rule):
	if the reason the action failed is the German can't mount when mounted on an animal rule,
		say "[Der person asked] reite[t] bereits auf [dem random rideable animal which carries the person asked].";
	if the reason the action failed is the German can't mount when mounted on a vehicle rule,
		say "[Der person asked] [if the person asked is plural-named]fahren[otherwise]fährt[end if] schon mit [dem random rideable vehicle which supports the person asked].";
	if the reason the action failed is the German can't mount something unrideable rule,
		say "[Der noun] [ist] nicht dafür geeignet.";

The German standard report dismounting rule is listed instead of
the standard report dismounting rule in the report dismounting rules.

Report an actor dismounting (this is the German standard report dismounting rule):
	if the actor is the player:
		say "Du steigst von [dem noun] herunter.[line break][run paragraph on]";
		produce a room description with going spacing conventions;
	otherwise:
		say "[Der actor] steig[t] von [dem noun]."


Understand the command "ride" as something new.
Understand the command "mount" as something new.

Understand "besteig [something]" as mounting.
Understand "fahr in [dativ] [something]" as mounting.
Understand "fahr auf [dativ] [something]" as mounting.
Understand "fahr mit [dativ] [something]" as mounting.
Understand "reit auf [dativ] [something]" as mounting.
Understand "reit in [dativ] [something]" as mounting.
Understand "reit mit [dativ] [something]" as mounting.

The German can't dismount when not mounted rule is listed instead of
the can't dismount when not mounted rule in the check dismounting rules. [']

Check an actor dismounting (this is the German can't dismount when not mounted rule):
	if the actor is not carried by a rideable animal and the actor is not on a rideable vehicle:
		if the actor is a player, say "Du bist dazu nicht in der Lage.";
		stop the action.

Understand the command "dismount" as something new.
Understand "sitz ab" or "steig ab" as dismounting.


Section - German Locksmith (for use with Locksmith by Emily Short)

[Volume 1 - Automatic locking and unlocking ...]

The opening doors before entering rule is not listed in any rulebook.

Before going through a closed door (called the blocking door) (this is the German opening doors before entering rule):
	if sequential action option is active:
		try opening the blocking door;
	otherwise:
		say "(Du öffnest zuerst [den blocking door].)[command clarification break]";
		silently try opening the blocking door;
	if the blocking door is closed, stop the action.


The closing doors before locking rule is not listed in any rulebook.

Before locking an open thing (called the door ajar) with something (this is the German closing doors before locking rule):
	if sequential action option is active:
		try closing the door ajar;
	otherwise:
		say "(Du schlie[ß]t zuerst [den door ajar].)[command clarification break]";
		silently try closing the door ajar;
	if the door ajar is open, stop the action.


The closing doors before locking keylessly rule is not listed in any rulebook.

Before locking keylessly an open thing (called the door ajar) (this is the German closing doors before locking keylessly rule):
	if sequential action option is active:
		try closing the door ajar;
	otherwise:
		say "(Du schlie[ß]t zuerst [den door ajar].)[command clarification break]";
		silently try closing the door ajar;
	if the door ajar is open, stop the action.


The unlocking before opening rule is not listed in any rulebook.

Before opening a locked thing (called the sealed chest) (this is the German unlocking before opening rule):
	if sequential action option is active:
		try unlocking keylessly the sealed chest;
	otherwise:
		say "(Du schlie[ß]t [den sealed chest] zuerst auf.)[command clarification break]";
		silently try unlocking keylessly the sealed chest;
	if the sealed chest is locked, stop the action.

[Volume 2 - Default locking and unlocking]

[Part 1 - The matching key rule]

The German standard printing key lack rule is listed instead of
the standard printing key lack rule in the for refusing keys rules.

Rule for refusing keys of something (called locked-thing) (this is the German standard printing key lack rule):
	say "Du hast keinen Schlüssel, der zu [dem locked-thing] passt."


[Part 2 - Unlocking]

[Section 1 - Regular unlocking]

Understand the command "unlock" as something new.
Understand the commands "open" and "uncover" and "unwrap" as something new.

Understand the commands "schliess" and "sperr" as something new.
Understand the command "oeffne" as something new.

Understand the commands "verriegel", "veriegl" and "versperr" as something new.


Understand "schliess [something] mit [dativ] [something] auf" as unlocking it with.
Understand "schliess [something] auf mit [dativ] [something]" as unlocking it with.
Understand "schliess [a locked lockable thing] mit [dativ] [something] auf" as unlocking it with.
Understand "schliess [a locked lockable thing] auf mit [dativ] [something]" as unlocking it with.
Understand "schliess [a lockable thing] mit [dativ] [something] auf" as unlocking it with.
Understand "schliess [a lockable thing] auf mit [dativ] [something]" as unlocking it with.
Understand the command "sperr" as "schliess".

Understand "oeffne [something]" as opening.
Understand "oeffne [something] mit [dativ] [something]" as unlocking it with.
Understand "oeffne mit [dativ] [something] [something]" as unlocking it with (with nouns reversed).
Understand "oeffne [a locked lockable thing] mit [dativ] [something]" as unlocking it with.
Understand "oeffne mit [dativ] [something] [a locked lockable thing]" as unlocking it with (with nouns reversed).
Understand "oeffne [a lockable thing] mit [dativ] [something]" as unlocking it with.
Understand "oeffne mit [dativ] [something] [a lockable thing]" as unlocking it with (with nouns reversed).

The German right second rule is listed instead of
the right second rule in the check unlocking it with rulebook.

This is the German right second rule:
	if the noun provides the property matching key:
		if the second noun is not the matching key of the noun, say "[Der second noun] [if second noun is plural-named]passen[otherwise]pa[ss]t[end if] nicht für [den noun]." instead;
	otherwise:
		say "[Der second noun] [if second noun is plural-named]passen[otherwise]pa[ss]t[end if] nicht für [den noun]." instead.

[Section 2 - Keylessly]

Understand "schliess [something] auf" as unlocking keylessly.
Understand "schliess [a locked lockable thing] auf" as unlocking keylessly.
Understand "schliess [lockable thing] auf" as unlocking keylessly.

Understand "entsperr [something]" as unlocking keylessly.
Understand "entsperr [a locked lockable thing]" as unlocking keylessly.
Understand "entsperr [lockable thing]" as unlocking keylessly.
Understand the command "entriegel" as "entsperr".

The German standard keylessly unlocking rule is listed instead of
the standard keylessly unlocking rule in the carry out unlocking keylessly rules.

Carry out unlocking keylessly (this is the German standard keylessly unlocking rule):
	if sequential action option is active, do nothing; otherwise say "(mit [dem matching key of the noun])[command clarification break]";
	try unlocking the noun with the matching key of the noun.


[Part 3 - Locking]

[Section 1 - Regular locking]

Understand "schliess [something] mit [dativ] [something] ab/zu" as locking it with.
Understand "schliess [something] ab/zu mit [dativ] [something]" as locking it with.

Understand "schliess [a locked lockable thing] mit [dativ] [something] ab/zu" as locking it with.
Understand "schliess [a locked lockable thing] ab/zu mit [dativ] [something]" as locking it with.

Understand "schliess [a lockable thing] mit [dativ] [something] ab/zu" as locking it with.
Understand "schliess [a lockable thing] ab/zu mit [dativ] [something]" as locking it with.

[Und auch noch das restliche, ebenfalls gelöschte, Vokabular für "schliess" wieder definieren]

Understand "schliess [something]" as closing.
Understand "schliess [something] mit [dativ] [something]" as closing it with.
Understand "schliess [something] mit [dativ] [something preferably held]" as closing it with.


[Section 2 - Keylessly]

Understand "schliess [something] ab/zu" as locking keylessly.
Understand "schliess [a locked lockable thing] ab/zu" as locking keylessly.
Understand "schliess [lockable thing] ab/zu" as locking keylessly.

Understand "verschliess [something]" as locking keylessly.
Understand "verschliess [a locked lockable thing]" as locking keylessly.
Understand "verschliess [lockable thing]" as locking keylessly.
Understand the commands "verriegel", "veriegl" and "versperr" as "verschliess".

The German standard keylessly locking rule is listed instead of
the standard keylessly locking rule in the carry out locking keylessly rules.

Carry out locking keylessly (this is the German standard keylessly locking rule):
	if sequential action option is active, do nothing; otherwise say "(mit [dem matching key of the noun])[command clarification break]";
	try locking the noun with the matching key of the noun.


[Volume 3 - The Passkey kind, needed only if you want keys to name themselves]

The German identify passkeys in inventory rule is listed instead of
the identify passkeys in inventory rule in the after printing the name rulebook.

After printing the name of an identified passkey (called the item) while taking inventory
(this is the German identify passkeys in inventory rule):
	say " (für [the list of things unbolted by the item with accusative])";
	stop the action.

The passkey description rule is not listed in any rulebook.

After examining an identified passkey (this is the German passkey description rule):
	say "[Der noun] öffne[t] [the list of things unbolted by the noun with accusative]."


[Volume 4 - The Keychain kind, needed only if you want a keychain]

The limiting keychains rule is not listed in any rulebook.

Instead of putting something which is not a passkey on a keychain (this is the German limiting keychains rule):
	say "[Der noun] [ist] kein Schlüssel."

Understand "steck [passkey] auf/an [keychain]" as putting it on.
Understand "haeng [passkey] auf/an [keychain]" as putting it on.
Understand "tu [passkey] auf/an [keychain]" as putting it on.


[Volume 5 - Support Materials]

The noun autotaking rule is not listed in any rulebook.

This is the German noun autotaking rule:
	if sequential action option is active:
		if the player is the person asked:
			try taking the noun;
		otherwise:
			try the person asked trying taking the noun;
	otherwise:
		if the player is the person asked:
			[say "(first taking [the noun])";]
			[vgl. Library-Message ##Miscellany, 26]
			say "(Dazu hebst [du] [den noun] erst auf.)";
			silently try taking the noun;
		otherwise:
			try the person asked trying taking the noun.

The second noun autotaking rule is not listed in any rulebook.

This is the German second noun autotaking rule:
	if sequential action option is active:
		if the player is the person asked:
			try taking the second noun;
		otherwise:
			try the person asked trying taking the second noun;
	otherwise:
		if the player is the person asked:
			[say "(first taking [the second noun])";]
			[vgl. Library-Message ##Miscellany, 26]
			say "(Dazu hebst [du] [den second noun] erst auf.)";
			silently try taking the second noun;
		otherwise:
			try the person asked trying taking the second noun.

The must hold the noun rule is not listed in any rulebook.

This is the German must hold the noun rule:
	if the person asked does not have the noun, follow the German noun autotaking rule;
	if the person asked does not have the noun, stop the action;
	make no decision.

The must hold the second noun rule is not listed in any rulebook.

This is the German must hold the second noun rule:
	if the person asked does not have the second noun, follow the German second noun autotaking rule;
	if the person asked does not have the second noun, stop the action;
	make no decision.

The must have accessible the noun rule is not listed in any rulebook.

This is the German must have accessible the noun rule:
	if the noun is not key-accessible:
		if the noun is on a keychain (called the containing keychain), now the noun is the containing keychain;
		follow the German noun autotaking rule;
	if the noun is not key-accessible:
		if the player is the person asked,
			say "Ohne [den noun] kannst [du] nichts machen.";
		stop the action;
	make no decision.

The must have accessible the second noun rule is not listed in any rulebook.

This is the German must have accessible the second noun rule:
	if the second noun is not key-accessible:
		if the second noun is on a keychain (called the containing keychain),
			now the second noun is the containing keychain;
		follow the German second noun autotaking rule;
	if the second noun is not key-accessible:
		if the player is the person asked,
			say "Ohne [den second noun] kannst [du] nichts machen.";
		stop the action;
	make no decision.


Section - German Basic Screen Effects (for use with Basic Screen Effects by Emily Short)

To pause the/-- game:
	say "[paragraph break]Bitte drücke die LEERTASTE, um fortzufahren.";
	wait for the SPACE key;
	clear the screen.


Part - Translations of built-in extensions 2 - Menus (for use with Menus by Emily Short)

[based on German Menus by Lukas Strahner.]

Section 1 (in place of Section 1 in Menus by Emily Short)

Menu depth is a number that varies. Menu depth is 0.

The endnode flag is a number that varies. The endnode flag is 0.

The current menu title is text that varies. The current menu title is "Optionen".

Table of Sample Options
title	subtable	description	toggle
"foo"	a table-name	"bar"	a rule

Current menu is a table-name that varies. The current menu is the Table of Sample Options.

Current menu selection is a number that varies. Current menu selection is 1.

[In der folgenden Tabelle P/p (80/112) um V/v (86/118) für "Vorheriges" ergänzt.]
[Q/q für "Quit" wurde um Z/z und B/b für "Zurück" und "Beenden" ergänzt.]

Table of Menu Commands
number	effect
78	move down rule
110	move down rule
80	move up rule
112	move up rule
86	move up rule
118	move up rule
81	quit rule
113	quit rule
66	quit rule
98	quit rule
90	quit rule
122	quit rule
13	select rule
32	select rule
130	move down rule
129	move up rule
27	quit rule

This is the quit rule:
	decrease the menu depth by 1;
	rule succeeds.

This is the move down rule:
	if current menu selection is less than the number of filled rows in the current menu, increase current menu selection by 1;
	reprint the current menu;
	make no decision.

This is the move up rule:
	if current menu selection is greater than 1, decrease current menu selection by 1;
	reprint the current menu;
	make no decision.

This is the select rule:
	choose row current menu selection in the current menu;
	if there is a toggle entry
	begin;
		follow the toggle entry; reprint the current menu;
	otherwise;
		if there is a subtable entry
		begin;
			now the current menu title is title entry;
			now the current menu selection is 1;
			now the current menu is subtable entry;
			show menu contents;
		otherwise;
			let the temporary title be the current menu title;
			now the current menu title is title entry;
			now the endnode flag is 1;
			redraw status line;
			now the endnode flag is 0;
			clear only the main screen;
			say "[variable letter spacing][description entry][paragraph	 break]";
			pause the game;
			now the current menu title is temporary title;
			reprint the current menu;
		end if;
	end if.


To redraw status line:
	(- DrawStatusLine(); -)

Displaying is an activity.

To reprint (selected menu - a table-name):
	redraw status line;
	say fixed letter spacing;
	let __index be 1;
	clear only the main screen;
	repeat through selected menu
	begin;
		if __index is current menu selection, say " >"; otherwise say "  ";
		say " [title entry][line break]";
		increase __index by 1;
	end repeat;
	say variable letter spacing;

To show menu contents:
	increase the menu depth by 1;
	let temporary depth be the menu depth;
	let temporary menu be the current menu;
	let temporary title be the current menu title;
	let __x be 0;
	let __index be 0;
	while __index is not 1
	begin;
		now the current menu is the temporary menu;
		let __n be 0;
		repeat through current menu
		begin;
			increase __n by 1;
			if title entry is current menu title, now current menu selection is __n;
		end repeat;
		now the current menu title is the temporary title;
		reprint current menu;
		let __x be the chosen letter;
		if __x is a number listed in the Table of Menu Commands
		begin;
			consider the effect entry;
			if temporary depth > menu depth
			begin;
				now __index is 1;
			end if;
		end if;
	end while.

Rule for displaying (this is the basic menu contents rule):
	now current menu selection is 1;
	show menu contents.

Rule for constructing the status line while displaying (this is the constructing status line while displaying rule):
	if the endnode flag is 0,
		fill status bar with Table of Deep Menu Status;
	otherwise fill status bar with Table of Shallow Menu Status;
	rule succeeds.

Table of Shallow Menu Status
left	central	right
""	"[current menu title]"	""


Table of Deep Menu Status
left	central	right
""	"[current menu title]"	""
""	""	" "
" N = Nächstes"	""	"[if menu depth > 1]Z = Zurück[otherwise]B = Beenden[end if]"
" V = Vorheriges"	""	"ENTER = Auswahl"

Table of Sample Hints
hint	used
"Beispielhinweis"	a number

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
	say "Drücke LEERTASTE, um zum Menü zurückzukehren oder H, um einen weiteren Hinweis anzuzeigen."


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
			say "Drücke LEERTASTE, um zum Menü zurückzukehren[if __index < number of rows in hint booklet] oder H, um einen weiteren Hinweis anzuzeigen[end if].";
			make no decision;
		end if;
	end repeat;
	say "Drücke LEERTASTE, um zum Menü zurückzukehren[if __index < number of rows in hint booklet] oder H, um einen weiteren Hinweis anzuzeigen[end if]."

This is the hint toggle rule:
	choose row current menu selection in the current menu;
	let the temporary title be the current menu title;
	now the current menu title is title entry;
	now the endnode flag is 1;
	redraw status line;
	now the endnode flag is 0;
	say known hints from the subtable entry;
	let __index be 0;
	while __index < 1
	begin;
		let __x be the chosen letter;
		if __x is 13 or __x is 31 or __x is 32, let __index be 1;
		if __x is 72 or __x is 104, say hints from the subtable entry;
	end while;
	now the current menu title is temporary title.



Part - I6 additions and replacements - unindexed

[Die deutschen Originalkommentare von Martin Oehm wurden übernommen.
Die Kommentare von Christian Blümke beginnen mit *** drei Sternchen.]

Section - Definitions

Include (-
Constant STUCK_PE     = 1;
Constant ANIMA_PE     = 2;
Constant UPTO_PE      = 3;
Constant NUMBER_PE    = 4;
Constant CANTSEE_PE   = 5;
Constant TOOLIT_PE    = 6;
Constant NOTHELD_PE   = 7;
Constant MULTI_PE     = 8;
Constant MMULTI_PE    = 9;
Constant VAGUE_PE     = 10;
Constant EXCEPT_PE    = 11;
Constant VERB_PE      = 12;
Constant SCENERY_PE   = 13;
Constant ITGONE_PE    = 14;
Constant JUNKAFTER_PE = 15;
Constant TOOFEW_PE    = 16;
Constant NOTHING_PE   = 17;
Constant ASKSCOPE_PE  = 18;
Constant NOTINCONTEXT_PE = 19;
Constant BLANKLINE_PE = 20; ! Not formally a parser error, but used by I7 as if
-) instead of "Parser Error Numbers" in "Definitions.i6t".

Include (-
!Constant LanguageVersion = "GerX 3";

Constant APPEND_BIT     32768;      ! Hängt die Inhalte der gelisteten Objekte
                                    ! an, anstatt sie in einem Nebensatz zu
                                    ! erwähnen
	                                ! *** Der Originalwert 8192 ist in I7 schon
                                    !     von EXTRAINDENT_BIT belegt

Global ignore_append_bit = false;   ! *** um das APPEND_BIT in |WillRecurs()|
                                    !     bei der Ausgabe von Listen mit
                                    !     Objektinhalt zu ignorieren.


Property special_article;			! *** I7 special indefinte article

Global max_wn;                      ! Höchster erreichter Wortmarker für
                                    ! das beste Satzmuster, in der Fehlerausgabe
                                    ! verwendet.

Global pronominal_adverb_flag = false; ! *** Gibt es ein Pronominaladverb im Satz?
                                       !     Und wenn ja, welches?

Global printing_command = false;    ! Krücke, um den Changing Gender auch bei
                                    ! Pluralen zu berücksichtigen.

Global pnn = selfobj;               ! *** previously named noun, für [ist] [hat] usw.
                                    !     ist das zuletzt in einer Textersetzung
                                    !     genannte Objekt


#Stub PreInformese      0;          ! *** Diese Einhänger in |LanguageToInformese()|
#Stub PostInformese     0;          !     können für die Erstellung von Extensions
                                    !     nützlich sein (vgl. z.B. German Mistype).
-) after "Definitions.i6t".


Section - Language

Include (-
Constant AGAIN1__WD   = 'again';
Constant AGAIN2__WD   = 'g//';
Constant AGAIN3__WD   = 'nochmal';
Constant OOPS1__WD    = 'oh';
Constant OOPS2__WD    = 'oops';
Constant OOPS3__WD    = 'huch';
Constant UNDO1__WD    = 'undo';
Constant UNDO2__WD    = 'zurueck';
Constant UNDO3__WD    = 'rueckgaengig';
Constant UNDO4__WD    = 'rueckgaengig';

! *** Ersetzt durch is_all_word()
Constant ALL1__WD     = 'all';
Constant ALL2__WD     = 'alles';
Constant ALL3__WD     = 'alles';
Constant ALL4__WD     = 'alles';
Constant ALL5__WD     = 'alles';

! *** Ersetzt durch is_but_word und is_and_word
Constant AND1__WD     = 'und';
Constant AND2__WD     = 'und';
Constant AND3__WD     = 'und';
Constant BUT1__WD     = 'ohne';
Constant BUT2__WD     = 'ausser';
Constant BUT3__WD     = 'ausser';
Constant ME1__WD      = 'mich';
Constant ME2__WD      = 'dich';
Constant ME3__WD      = 'mir';
Constant OF1__WD      = 'von';
Constant OF2__WD      = 'aus';
Constant OF3__WD      = 'von';
Constant OF4__WD      = 'von';
Constant OTHER1__WD   = 'anderer';
Constant OTHER2__WD   = 'andere';
Constant OTHER3__WD   = 'anderes';
Constant THEN1__WD    = 'dann';
Constant THEN2__WD    = 'sodann';
Constant THEN3__WD    = 'danach';

Constant NO1__WD      = 'n//';
Constant NO2__WD      = 'nein';
Constant NO3__WD      = 'nein';
Constant YES1__WD     = 'j//';
Constant YES2__WD     = 'ja';
Constant YES3__WD     = 'y//';

Constant AMUSING1__WD  = 'nachwort';
Constant AMUSING2__WD  = 'amusing';
Constant FULLSCORE1__WD = 'voll';
Constant FULLSCORE2__WD = 'punkte';
Constant QUIT1__WD    = 'e//';
Constant QUIT2__WD    = 'ende';
Constant RESTART__WD  = 'neustart';
Constant RESTORE__WD  = 'laden';

Constant LIT__TX        = "Licht spendend";

Constant AMUSING_PROVIDED 1;
Constant TASKS_PROVIDED   1;

!Default LIST_BUFFER_SIZE = 20; ! *** Wird über die Use-Option List buffer size gesetzt
Array list_buffer --> LIST_BUFFER_SIZE + 1;
Array list_depth  --> LIST_BUFFER_SIZE + 1;

!Constant LanguageVersion = "deform Release 6/11 (2010-01-31)";

Constant definite       = 1;  ! *** Dies sind zusätzliche I6-Entsprechungen der
Constant yours          = 2;  !     special articles DEFINITE, YOURS,
Constant no_article     = 3;  !     NO ARTICLE und PENDING.
Constant pending        = 4;

Property additive init;       ! Zur einfachen Initialisierung

#ifdef TARGET_ZCODE;
Constant CHAR_AE = 'ä';
Constant CHAR_OE = 'ö';
Constant CHAR_UE = 'ü';
Constant CHAR_SS = 'ß';
#ifnot;
Constant CHAR_AE = 228;
Constant CHAR_OE = 246;
Constant CHAR_UE = 252;
Constant CHAR_SS = 223;
#endif;

#ifdef TARGET_ZCODE;
Array orig_buffer -> 123;       ! Kopie der ursprünglichen Eingabe
Array orig_parse -> 65;         ! Kopie der ursprünglichen Wortpositionen
Array orig_position --> 17;     ! Wortreferenz, eventuell durch Synonyme
                                ! verschoben

[ OriginalAddress wordnum;
    if (wordnum > orig_position-->0)
        return orig_buffer + orig_buffer->1 + 1;
    wordnum = orig_position-->wordnum;
    return orig_buffer + orig_parse->(wordnum*4+1);
];

[ OriginalLength wordnum;
    if (wordnum > orig_position-->0) rfalse;
    wordnum = orig_position-->wordnum;
    return orig_parse->(wordnum*4);
];
#ifnot;

Array orig_buffer     buffer INPUT_BUFFER_LEN;
Array orig_parse --> PARSE_BUFFER_LEN;
Array orig_position --> MAX_BUFFER_WORDS + WORDSIZE;

[ OriginalAddress wordnum;
    if (wordnum > orig_position-->0)
        return orig_buffer + orig_buffer-->0 + 1;
    wordnum = orig_position-->wordnum;
    return orig_buffer + orig_parse-->(wordnum*3);
];

[ OriginalLength wordnum;
    if (wordnum > orig_position-->0) rfalse;
    wordnum = orig_position-->wordnum;
    return orig_parse-->(wordnum*3-1);
];
#endif;

[ PrintOriginal wordnum   buffer length i;
    buffer = OriginalAddress(wordnum);
    length = OriginalLength(wordnum);

    for (i = 0 : i < length : i++) print (char) buffer->i;
];

Global genitive_list = 0;             ! Flagge, ob ein Plural im Genitiv steht
                                      ! Das sollte eine lokale Flagge sein, aber
                                      ! in WriteListR waren keine mehr frei,
                                      ! und Plurale verschachteln sich nicht.
!Global dative_mode = 0;               ! Ist das nächste Token im Dativ?
Global article_word;                  ! Gibt an, ob und welches Wort als
                                      ! Artikel verstanden wurde.
Global parse_noun_from;               ! Gibt an, ab welchem Wort eine Noun
                                      ! Phrase untersucht wird.

Global short_name_case;

#ifdef CAPITAL_YOU;
[ SetCapitalisedDu cap;
    if (cap) {
        string 20 "Du";
	    string 21 "Dir";
	    string 22 "Dich";
	    string 23 "Dein";
	    string 24 "Deine";
	    string 25 "Deines";
	    string 26 "Deiner";
	    string 27 "Deinem";
	    string 28 "Deinen";
	} else {
	    string 20 "du";
	    string 21 "dir";
	    string 22 "dich";
	    string 23 "dein";
	    string 24 "deine";
	    string 25 "deines";
	    string 26 "deiner";
	    string 27 "deinem";
	    string 28 "deinen";
	}
];
#ifnot;
[ SetCapitalisedDu;
	string 20 "du";
	string 21 "dir";
	string 22 "dich";
	string 23 "dein";
	string 24 "deine";
	string 25 "deines";
	string 26 "deiner";
	string 27 "deinem";
	string 28 "deinen";
];
#endif; ! CAPITAL_YOU



[ LanguageInitialise    obj;

    ! *** (21.09.2010) Genus-Definitionen der Objekte, die mit "some" definiert
    !     wurden, bereinigen:
    
    objectloop (obj has pluralname
                && obj has neuter or male or female) {
	    give obj ~neuter;
	    give obj ~male;
	    give obj ~female;
    }
    
    ! *** (27.09.2010) Wörterbuch-Variablen für Glulx setzen. Für Z wird das
    !     in VM_Initialise gemacht.

    
    #ifdef TARGET_GLULX;
    dict_start = #dictionary_table + WORDSIZE;
    dict_entry_size = DICT_WORD_SIZE + 7;
    dict_end = dict_start + #dictionary_table-->0 * dict_entry_size;
    #endif;

#ifdef DIALECT_SWISS;
    string 30 "ss";
#ifnot;
    string 30 "ß";
#endif;
#ifdef DIALECT_TRADITIONAL;
    string 31 "ß";
#ifnot;
    string 31 "ss";
#endif;
#ifdef CAPITAL_YOU;
	SetCapitalisedDu(1); ! großes Du
#ifnot;
	SetCapitalisedDu(); ! kleines Du
#endif;

#Ifdef DEFORM_INIT_PROPERTY;
    objectloop (obj provides init) obj.init();
#endif;

];
-) instead of "Vocabulary" in "Language.i6t".

Include (-
Array LanguagePronouns table

   !  word       possible GNAs                   connected
   !             to follow:                      to:
   !             a     i
   !             s  p  s  p
   !             mfnmfnmfnmfn

      'er'     $$100000100000                    NULL   ! m-Nom
      'sie'    $$010111010111                    NULL   ! f-Nom/Akk
      'es'     $$001000001000                    NULL   ! n-Nom/Akk
      'ihn'    $$100000100000                    NULL   ! m-Akk
      'ihm'    $$101000101000                    NULL   ! m/n-Dat
      'ihr'    $$010000010000                    NULL   ! f-Dat
      'ihnen'  $$000111000111                    NULL   ! p/Dat
      'spez.'  $$000000111111                    NULL   ! Adverbialpron.
      'ihm/r'  $$000000111111                    NULL   ! Adverbialpron.
      ;
-) instead of "Pronouns" in "Language.i6t".

Include (-
#ifdef TRADITIONAL_DESCRIPTORS;

Array LanguageDescriptors table

   !  word       possible GNAs   descriptor      connected
   !             to follow:      type:           to:
   !             a     i
   !             s  p  s  p
   !             mfnmfnmfnmfn

      'der'    $$110111110111    DEFART_PK       NULL   ! m-Nom, f-Dat, f/p-Gen
      'die'    $$010111010111    DEFART_PK       NULL   ! f/p-Nom/Akk
      'das'    $$001000001000    DEFART_PK       NULL   ! n-Nom/Akk
      'dem'    $$101000101000    DEFART_PK       NULL   ! m/n-Dat
      'den'    $$100111100111    DEFART_PK       NULL   ! m-Akk, p-Dat
      'des'    $$101000101000    DEFART_PK       NULL   ! m/n-Gen

      'einen'  $$100000100000    INDEFART_PK     NULL   ! m-Akk
      'ein'    $$101000101000    INDEFART_PK     NULL   ! m/n-Nom, n-Akk
      'einem'  $$101000101000    INDEFART_PK     NULL   ! m/n-Dat
      'eine'   $$010000010000    INDEFART_PK     NULL   ! f-Nom/Akk
      'einer'  $$010000010000    INDEFART_PK     NULL   ! f-Dat/Gen
      'eines'  $$101000101000    INDEFART_PK     NULL   ! m/n-Gen

      'dies'   $$001000001000    POSSESS_PK      0      ! Demonstrativpronomen
      'diese'  $$010111010111    POSSESS_PK      0      ! für "hier"
      'dieser' $$110111110111    POSSESS_PK      0
      'diesem' $$101000101000    POSSESS_PK      0
      'diesen' $$100111100111    POSSESS_PK      0
      'dieses' $$101000101000    POSSESS_PK      0

      'jene'   $$010111010111    POSSESS_PK      1      ! Demonstrativpronomen
      'jener'  $$110111110111    POSSESS_PK      1      ! für "dort"
      'jenem'  $$101000101000    POSSESS_PK      1
      'jenen'  $$100111100111    POSSESS_PK      1
      'jenes'  $$101000101000    POSSESS_PK      1

      'mein'   $$101000101000    POSSESS_PK      0      ! Possesivpronomen
      'meine'  $$010111010111    POSSESS_PK      0
      'meiner' $$010111010111    POSSESS_PK      0
      'meinem' $$101000101000    POSSESS_PK      0
      'meinen' $$100111100111    POSSESS_PK      0
      'meines' $$101000101000    POSSESS_PK      0

      'dein'   $$101000101000    POSSESS_PK      1      ! Possesivpronomen
      'deine'  $$010111010111    POSSESS_PK      1
      'deiner' $$010111010111    POSSESS_PK      1
      'deinem' $$101000101000    POSSESS_PK      1
      'deinen' $$100111100111    POSSESS_PK      1
      'deines' $$101000101000    POSSESS_PK      1

      'sein'   $$001000001000    POSSESS_PK      'him'
      'seine'  $$010111010111    POSSESS_PK      'him'
      'seiner' $$110111110111    POSSESS_PK      'him'
      'seinem' $$101000101000    POSSESS_PK      'him'
      'seinen' $$100111100111    POSSESS_PK      'him'
      'seines' $$101000101000    POSSESS_PK      'him'

      'ihr'    $$001000001000    POSSESS_PK      'her'
      'ihre'   $$010111010111    POSSESS_PK      'her'
      'ihrer'  $$110111110111    POSSESS_PK      'her'
      'ihrem'  $$101000101000    POSSESS_PK      'her'
      'ihren'  $$100111100111    POSSESS_PK      'her'
      'ihres'  $$101000101000    POSSESS_PK      'her'


      'deren'  $$111111111111    POSSESS_PK      'them'
      'dessen' $$111111111111    POSSESS_PK      'it'
      ;

#ifnot;
Array LanguageDescriptors table

   !  Nur Dativ und Akkusativ werden berücksichtigt, da man (fast)
   !  nie Tokens im Nominativ und Genitiv braucht. (Der Nominativ
   !  wird zwar in der Anrede verwendet, aber vom Parser nicht
   !  gesondert behandelt.)

   !  word       possible GNAs   descriptor      connected
   !             to follow:      type:           to:
   !             a     i
   !             s  p  s  p
   !             mfnmfnmfnmfn

      'der'    $$010111010111    DEFART_PK       NULL   ! m-Nom, f-Dat, f/p-Gen
      'die'    $$010111010111    DEFART_PK       NULL   ! f/p-Nom/Akk
      'das'    $$001000001000    DEFART_PK       NULL   ! n-Nom/Akk
      'dem'    $$101000101000    DEFART_PK       NULL   ! m/n-Dat
      'den'    $$100111100111    DEFART_PK       NULL   ! m-Akk, p-Dat
      'des'    $$101000101000    DEFART_PK       NULL   ! m/n-Gen

      'einen'  $$100000100000    INDEFART_PK     NULL   ! m-Akk
      'ein'    $$001000001000    INDEFART_PK     NULL   ! m/n-Nom, n-Akk
      'einem'  $$101000101000    INDEFART_PK     NULL   ! m/n-Dat
      'eine'   $$010000010000    INDEFART_PK     NULL   ! f-Nom/Akk
      'einer'  $$010000010000    INDEFART_PK     NULL   ! f-Dat/Gen
      'eines'  $$101000101000    INDEFART_PK     NULL   ! m/n-Gen

      'dies'   $$000000000000    POSSESS_PK      0      ! Demonstrativpronomen
      'jene'   $$000000000000    POSSESS_PK      1      ! Demonstrativpronomen
      ;

#endif;

Array LanguageSynonyms table
    'am'        "an dem"
    'ans'       "an das"
    'aufs'      "auf das"
    'beim'      "bei dem"
    'durchs'    "durch das"
    'hinterm'   "hinter dem"
    'hinters'   "hinter das"
    'im'        "in dem"
    'ins'       "in das"
    'nebens'    "neben das"
    'uebers'    "ueber das"
    'ueberm'    "ueber dem"
    'unters'    "unter das"
    'unterm'    "unter dem"
    'vom'       "von dem"
    'vors'      "vor das"
    'vorm'      "vor dem"
    'zum'       "zu dem"
    'zur'       "zu der"
    'darin'     "in ihm/r"
    'damit'     "mit ihm/r"

    'beide'	    "zwei"
    'jede'	    "all"
    ;

Array LanguageTwins table
    'bis' 'auf'     "ausser"
    'nur' 'nicht'	"ausser"
    ;

!   Die Einträge in LanguageVerbPreps sind mögliche Kandidaten für den
!   zweiten Teil zusammengesetzter Verben: an-machen, zusammen-kleben,
!   fort-fahren, usw.

Array LanguageVerbPreps table
    "ab"          "an"          "auf"         "aus"
    "auseinander" "bei"         "darauf"      "daraus"
    "darein"      "drauf"       "durch"       "ein"
    "entzwei"     "fort"        "herauf"      "heraus"
    "herum"       "herunter"    "hin"         "hinauf"
    "hinaus"      "hinein"      "hinueber"    "hinweg"
    "hoch"        "kaputt"      "mit"         "nach"
    "nieder"      "rauf"        "raus"        "rein"
    "runter"      "ueber"       "um"          "umher"
    "unter"       "weg"         "zu"          "zusammen"
    ;
-) instead of "Descriptors" in "Language.i6t".

Include (-
Array LanguageNumbers table
    'eins' 1  'zwei' 2  'drei' 3  'vier' 4  'fuenf' 5
    'sechs' 6  'sieben' 7  'acht' 8  'neun' 9  'zehn'  10
    'elf' 11  'zwoelf' 12 'dreizehn' 13  'vierzehn' 14  'fuenfzehn' 15
    'sechzehn' 16  'siebzehn' 17  'achtzehn' 18  'neunzehn' 19  'zwanzig' 20
    'einundzwanzig' 21  'zweiundzwanzig' 22  'dreiundzwanzig' 23
    'vierundzwanzig' 24 'fuenfundzwanzig' 25  'sechsundzwanzig' 26
    'siebenundzwanzig' 27  'achtundzwanzig' 28 'neunundzwanzig' 29 'dreissig' 30
    'einundreissig' 31  'zweiunddreissig' 32  'dreiunddreissig' 33
    'vierunddreissig' 34  'fuenfunddreissig' 35  'sechsunddreissig' 36
    'siebenunddreissig' 37  'achtunddreissig' 38 'neununddreissig' 39
    'vierzig' 40  'einundvierzig' 41  'zweiundvierzig' 42  'dreiundvierzig' 43
    'vierundvierzig' 44  'fuenfundvierzig' 45  'sechsundvierzig' 46
    'siebenundvierzig' 47  'achtundvierzig' 48  'neunundvierzig' 49
    'fuenfzig' 50  'einundfuenfzig' 51  'zweiundfuenfzig' 52
    'dreiundfuenfzig' 53  'vierundfuenfzig' 54  'fuenfundfuenfzig' 55
    'sechsundfuenfzig' 56  'siebenundfuenfzig' 57  'achtundfuenfzig' 58
    'neunundfuenfzig' 59  'sechzig' 60
    ;

[ LanguageNumber n one_style       f;

!*** (03.12.2010): Die Ausgabe der großen Zahlen korrigiert. Dazu wurde
!    der Parameter one_style eingeführt, mit dem die Ausgabe von
!    "ein", "eins" und "eine" gesteuert wird.

  if (n==0) {
      print "null"; rfalse;
  }
  if (n<0) {
      print "minus "; n = -n;
  }

  #Iftrue (WORDSIZE == 4);
    if (n >= 1000000000) {
        if (f == 1) print " ";
    	LanguageNumber(n/1000000000, 2);
    	print " Milliarde"; if (n/1000000000 > 1) print "n";
    	n = n%1000000000; 
    	if (n>0) print " ";
    	f = 1;
    }
    if (n >= 1000000) {
        if (f == 1) print " ";
    	LanguageNumber(n/1000000, 2);
    	print " Million"; if (n/1000000 > 1) print "en";
    	n = n%1000000;
    	if (n>0) print " ";
    	f = 1;
    }
  #Endif;

  if (n>=1000) {
      LanguageNumber(n/1000, 1);
      print "tausend"; n=n%1000; f=1;
  }
  if (n>=100) {
      LanguageNumber(n/100, 1);
      print "hundert"; n=n%100;
  }
  
  if (n==0) rfalse;
  switch(n)
  {   1:  print "ein";
          switch (one_style) {
	          1: print "";        ! "einhundert, eintausend"
	          2: print "e";       ! "eine Million, eine Milliarde"
	          default: print "s"; ! "eins"
          }     
      2:  print "zwei";
      3:  print "drei";
      4:  print "vier";
      5:  print "fünf";
      6:  print "sechs";
      7:  print "sieben";
      8:  print "acht";
      9:  print "neun";
      10: print "zehn";
      11: print "elf";
      12: print "zwölf";
      13: print "dreizehn";
      14: print "vierzehn";
      15: print "fünfzehn";
      16: print "sechzehn";
      17: print "siebzehn";
      18: print "achtzehn";
      19: print "neunzehn";
      20 to 99:
          if (n%10 ~= 0) {
	          LanguageNumber(n%10, 1);
	          print "und";
          }
          switch(n/10)
          {  2: print "zwanzig";
             3: print "drei@30ig";
             4: print "vierzig";
             5: print "fünfzig";
             6: print "sechzig";
             7: print "siebzig";
             8: print "achtzig";
             9: print "neunzig";
          }

  }
];
-) instead of "Numbers" in "Language.i6t".

Include (-
[ LanguageTimeOfDay hours mins;
   if (hours < 0 || hours > 23 || mins < 0 || mins > 59) rfalse;
   print hours/10, hours%10, ":", mins/10, mins%10;
];

-) instead of "Time" in "Language.i6t".

Include (-
#ifdef TARGET_GLULX;
Array UmlautAux -> DICT_WORD_SIZE;
#ifnot;
Array UmlautAux -> 12;
#endif;

[ UmlautAddress i cap  letter next last skip start length;

    ! Vokabel auf Hilfsfeld schreiben
    #ifdef TARGET_GLULX;
    length = Glulx_PrintAnyToArray(UmlautAux, 24, i);
    start = 0;
    #ifnot;
    @output_stream 3 UmlautAux;
    print (address) i;
    @output_stream -3;
    length = UmlautAux-->0;
    start = 2;
    #endif;

    ! Vokabel mit ersetzten Umlauten ausgeben
    ! *** und wenn (cap==true) mit Großbuchstaben am Anfang
    for (i=0 : i < length : i++) {
        letter = UmlautAux->(i+start);
        if(i + 1 >= length) next = 0;
        else next = UmlautAux ->(i+start+1);

        if (letter == 'a' && next == 'e') {
            if (i==0 && cap) print "Ä"; else print "ä"; skip = true;
        } else if (letter == 'o' && next == 'e') {
            if (i==0 && cap) print "Ö"; else print "ö"; skip = true;
        } else if (letter == 'u' && next == 'e' && last ~= 'a' or 'e' or 'q') {
           if (i==0 && cap) print "Ü"; else print "ü"; skip = true;
        } else if (skip) skip = false;
        else if (i==0 && cap) print (char) VM_LowerToUpperCase(letter); else print (char) letter;
        last = letter;
    }
];

! *** |CUmlautAddress()|: Wie UmlautAddress, nur mit Großbuchstaben am Anfang.
!     (|CPrintOrRun(UmlautAddress(i))| funktioniert leider nicht so einfach.)
!
!     Das Großschreiben des Anfangsbuchstabens wird nun in |UmlautAddress()|
!     erledigt, wenn man als zweiten Parameter true übergibt.

[ CUmlautAddress i; UmlautAddress(i, true); ];

[ IsDirectionWord w    obj;
    objectloop (obj in Compass) {
        if (WordInProperty(w, obj, name)) return obj;
    }
    rfalse;
];

[ LastCharacterAddress i j        length start ch pos;

    ! Vokabel auf Hilfsfeld schreiben
    #ifdef TARGET_GLULX;
    length = Glulx_PrintAnyToArray(UmlautAux, 24, i);
    start = 0;
    #ifnot;
    @output_stream 3 UmlautAux;
    print (address) i;
    @output_stream -3;
    length = UmlautAux-->0;
    start = 2;
    #endif;

    pos = length-1+start-j;
    if (pos < start) return 0;
    ch = UmlautAux->(pos); ! *** letzes Zeichen - j
    return ch;
];

[ AddressInTable i tab start_row col       start n length1 length2 index match;

    ! *** Hier wird eine Vokabel i mit Text-Einträgen in einer I7-Tabelle
    !     tab verglichen. Wenn ein passendes Wort gefunden wurde, wird
    !     die Zeilennummer des gefundenen Wortes zurückgegeben. Wird keine
    !     Übereinstimmung festgestellt, ist das Ergebnis NULL.

    ! Vokabel auf Hilfsfeld schreiben
    #ifdef TARGET_GLULX;
    length1 = Glulx_PrintAnyToArray(UmlautAux, 24, i);
    start = 0;
    #ifnot;
    @output_stream 3 UmlautAux;
    print (address) i;
    @output_stream -3;
    length1 = UmlautAux-->0;
    start = 2;
    #endif;
    
    if (start_row == 0) start_row = 1;
    if (col == 0) col = 1;
    
    n = TableRows(tab);

    ! *** Die Tabelle tab nach der Vokabel i, deren Inhalt in das Hilfsfeld
    !     UmlautAux kopiert wurde, durchsuchen: Als Hilfsarray für die
    !     Tabelleneinträge wird HLAuxBuffer2 wiederverwendet, das auch für
    !     die Erzeugung der deutschen Default-Headline benutzt wird. 
    !     Erst wenn die Länge der Vokabel mit einem Tabelleneintrag 
    !     übereinstimmt, folgt ein Vergleich der einzelnen Zeichenketten.

    for (index = start_row : index <= n : index++) {
	    match = 0;
        length2 = VM_PrintToBuffer(HLAuxBuffer2, 24, TableLookUpEntry(tab, col, index));
        if (length1 == length2) {
            for (i = 0 : i < length1 : i++) {
                if (UmlautAux->(i + start) ~= HLAuxBuffer2->(i + WORDSIZE))
                    break;
                match++;
            }
            if (match == length1) return index;
        }
    }
    return 0;
];

[ CheckTableOfInfinitives i     tab index;

! *** Die Verben, die der Autor in die Tabelle "Table of Infinitives (continued)"
!     eingetragen hat, werden mit der Vokabel i abgeglichen.

	tab = (+ Table of infinitives +);
    index = AddressInTable(i, tab, 2); ! *** beginnt die Suche in Zeile 2
    if (index) {
        print (PrintText) TableLookUpEntry(tab, 2, index);
        rtrue;
    }
    rfalse;
];


[ LanguageVerb i    obj last;

    ! *** Table of Infinitives nach unregelmäigen
    !     Imperativ-Infinitv-Paarungen durchsuchen. Die Tabelle wird
    !     vom Autor selbst fortgesetzt. Zudem können in dieser
    !     Tabelle Änderungen an den Standard-Infinitven vorgenommen
    !     werden.

    if (CheckTableOfInfinitives(i)) return true;

    switch (i) {
        'l//': print "schauen";
        'z//': print "warten";
        'j//': print "ja";
        'x//','u//','b//': print "betrachten";
        'v//': print "verlassen";
        'i//', 'inv', 'inventar': print "Inventar anzeigen";
        'raus', 'hinaus', 'heraus': print "raus gehen";

        ! Wörter, die zu lang sind oder in denen ein ß ist

        'giess':         print "gie@30en";

        'ueberreich':    print "überreichen";
        'praesentier':   print "präsentieren";
        'konsultier':    print "konsultieren";
        'durchwuehl':    print "durchwühlen";
        'durchstoeber':  print "durchstöbern";
        'schliess':      print "schlie@30en";
        'verschliess':   print "verschlie@30en";
        'verriegel':     print "verriegeln";
        'zertruemmer':   print "zertrümmern";
        'unterricht':    print "unterrichten";
        'zerdrueck':     print "zerdrücken";
        'zerquetsch':    print "zerquetschen";
        'durchschneid':  print "durchschneiden";
        'zerschneid':    print "zerschneiden";

        ! Starke Verben (*** erweiterte Liste)

        'befiehl':       print "befehlen";
        'brich':         print "brechen";
        'betritt':       print "betreten";
        'birg  ':        print "bergen";
        'empfiehl':      print "empfehlen";
        'erschrick':     print "erschrecken";
        'erwirb':        print "erwerben";
        'ficht':         print "fechten";
        'friss':         print "fressen";
        'gib':           print "geben";
        'hilf':          print "helfen";
        'iss':           print "essen";
        'lies':          print "lesen";
        'miss':          print "messen";
        'nimm':          print "nehmen";
        'sei':           print "sein";
        'sieh':          print "sehen";
        'sprich':        print "sprechen";
        'stich':         print "stechen";
        'stiehl':        print "stehlen";
        'triff':         print "treffen";
        'tritt':         print "treten";
        'verdirb':       print "verderben";
        'vergiss':       print "vergessen";
        'wirb':          print "werben";
        'wirf':          print "werfen";
        'zerbrich':      print "zerbrechen";

        ! *** Imperative mit -le und -re

        'baumle':		 print "baumeln";
        'klettre':		 print "erklimmen";
        'streichle':     print "streicheln";
        'wedle': 		 print "wedeln";

        default:


        ! Himmelsrichtung

        obj = IsDirectionWord(i); if (obj) {
            print "nach ", (WithoutArt) obj, " gehen";
            rtrue;
        }

        ! Schwache Verben: Infinitiv ist Form ohne 'e' und '-en'
        ! *** oder auch mit 'e' und ohne 'n'.

        !*** Falls doch noch ein 'e' am Verb dranhängt wird nur ein "n"
        !    ausgegeben.
        !
        !    LastChracterAddress(wort, n); ermittelt das n-letzte Zeichen,
        !    um den Infinitiv etwas genauer rekonstruieren zu können.

        if(PrintVerb(i) == 0) {
            UmlautAddress(i);
            last = LastCharacterAddress(i); ! letztes Zeichen

            ! -e
            if (last == 'e') { print "n"; rtrue; }

            ! -el, -er
            if (last == 'l' or 'r'
                && LastCharacterAddress(i,1) == 'e') {

                ! -auel, -euel, -auer, -euer: +n
                if (LastCharacterAddress(i,2) == 'u'
                    && LastCharacterAddress(i,3) == 'a' or 'e')
                        { print "n"; rtrue; }

                ! -iel, -ier, -ael, -aer, -oel, -oer, -uel, -uer: +en
                ! Alle anderen Buchstaben vor -el oder -er: +n
                if (LastCharacterAddress(i,2) ~= 'i' or 'a' or 'o' or 'u')
                        { print "n"; rtrue; }
            }
            print "en";
        }
    }
];

! ----------------------------------------------------------------------------
!  LanguageVerbIsDebugging is called by SearchScope.  It should return true
!  if word w is a debugging verb which needs all objects to be in scope.
! ----------------------------------------------------------------------------

#Ifdef DEBUG;
[ LanguageVerbIsDebugging w;
    if (w == 'purloin' or 'tree' or 'abstract' or 'gonear'
                       or 'scope' or 'showobj' or 'dekl') rtrue;
    rfalse;
];
#Endif;

! ----------------------------------------------------------------------------
!  LanguageVerbLikesAdverb is called by PrintCommand when printing an UPTO_PE
!  error or an inference message.  Words which are intransitive verbs, i.e.,
!  which require a direction name as an adverb ('walk west'), not a noun
!  ('I only understood you as far as wanting to touch /the/ ground'), should
!  cause the routine to return true.
! ----------------------------------------------------------------------------

[ LanguageVerbLikesAdverb w;
    !w = w; rfalse;
    if (w == 'geh' or 'lauf' or 'renn' or 'wander'
                   or 'fluecht' or 'flieh' or 'schreit'
                   or 'spazier') rtrue;

    if (w == 'schau' or 'seh' or 'sieh'
                     or 'blick' or 'lug' or 'guck' or 'kuck') rtrue;


    rfalse;
];

! ----------------------------------------------------------------------------
!  LanguageVerbMayBeName is called by NounDomain when dealing with the
!  player's reply to a "Which do you mean, the short stick or the long
!  stick?" prompt from the parser. If the reply is another verb (for example,
!  LOOK) then then previous ambiguous command is discarded /unless/
!  it is one of these words which could be both a verb /and/ an
!  adjective in a 'name' property.
!
!  In deform wird das ganz pragmatisch gehandhabt: Alle möglichen Objekte sind
!  bekannt. Wenn das Wort zu dessen name-Einträgen gehört, so soll das Wort
!  nicht als Verb bahendelt werden, ansonsten schon. Das fängt keine komplexen
!  parse_name-Konstrukte ab, aber schließlich wird dies auch nur aufgerufen,
!  wenn w ein Verb sein kann. Außerdem ist die Abfrage so kontextsensitiv.
! ----------------------------------------------------------------------------

! *** number_matched schon hier deklarieren. (aus Match List Variables/Parser.i6t)
Global number_matched;              ! How many items in it?  (0 means none)

[ LanguageVerbMayBeName w    i;
    for (i=0 : i < number_matched : i++) {
        if (WordInProperty(w, match_list-->i, name)) rtrue;
    }
    rfalse;
];

! ----------------------------------------------------------------------------
!  LanguageIsVerb ist eine Krücke, um zu erkennen, ob ein Wort in buffer2, das
!  nicht informisiert wurde, ein Verb ist. Hier muss etwas gemacht werden, da
!  Verben mit Umlauten und die Form mit 'e' sonst nicht erkannt werden.
! ----------------------------------------------------------------------------

[ LanguageIsVerb b p wordnum    wa wl i zs ze;

    if (b == buffer or buffer2) {
        ! Zuerst die Umlaute herausfischen
        zs = WORDSIZE;
        #ifdef TARGET_ZCODE;
        ze = 2 + b->1;
        #ifnot; ! TARGET_GLULX
        ze = WORDSIZE + b-->0;
        #endif; ! TARGET_

        for (i = zs : i < ze : i++) {
            switch(b->i) {
                CHAR_AE: b->i = 'a'; LTI_Insert(i+1, 'e', b); ze++;
                CHAR_OE: b->i = 'o'; LTI_Insert(i+1, 'e', b); ze++;
                CHAR_UE: b->i = 'u'; LTI_Insert(i+1, 'e', b); ze++;
                CHAR_SS: b->i = 's'; LTI_Insert(i+1, 's', b); ze++;
            }
        }
        VM_Tokenise(b, p);

        ! Dann schauen, ob das Wort wordnum erkannt wird
        #ifdef TARGET_ZCODE;
        i = 2*wordnum - 1;
        #ifnot;
        i = 3*wordnum - 2;
        #endif;
        if (p-->i) return p-->i;

        #ifdef TARGET_ZCODE;
        wa = b + p->(wordnum*4 + 1);
        wl = p->(wordnum*4);
        #ifnot;
        wa = b + p-->(wordnum*3);
        wl = p-->(wordnum*3-1);
        #endif;

        ! Wenn nicht, ein 'e' abschneiden und nochmal schauen
        if (wa->(wl - 1) == 'e') {
            wa->(wl - 1) = ' ';
            VM_Tokenise(b, p);
            return p-->i;
        }
        ! *** oder nach einem 't' gucken
        else {
            if (wa->(wl-1) == 't') {
                i = DictionaryLookup(wa, wl - 1);
                if (i && (i->#dict_par1 & 1)) {
                    ! imperative_form = IMP_IHR; ! *** vorerst nicht nötig
                    return i;
                }
            }
        }
    }

    rfalse;
];
-) instead of "Commands" in "Language.i6t".

Include (-
[ PruneWord w    start length;
    wn = w; if (NextWord()) return;

    start = WordAddress(w);
    length = WordLength(w);

    if (start->(length - 1) == 'e' or 'n' or 's'
        && DictionaryLookup(start, length - 1)) {
        start->(length - 1) = ' ';
        VM_Tokenise(buffer, parse);
        return;
    }

    if (start->(length - 2) == 'e'
        && start->(length - 1) == 'm' or 'n' or 'r' or 's'
        && DictionaryLookup(start, length - 2)) {
        start->(length - 1) = ' ';
        start->(length - 2) = ' ';
        VM_Tokenise(buffer, parse);
        return;
    }
];

[ CheckIWantTo     wd;
    wn = verb_wordnum;
    if (NextWord() ~= 'ich') return verb_word;
    wd = NextWord();
    if (wd == comma_word) return verb_word;
    if (wd ~= 'will' or 'moechte') wn--;
    verb_wordnum = wn;
    wd = NextWordStopped();
    if (wd == -1 or THEN1__WD) return -1;
    return wd;
];

! *** (14.10.2010) Mögliche Kandidaten für eine Verb/Objektsynonym-Kollision
!     herausfischen.

[ IsCollisionCandidate v    tab;
    
    if (v == 'lade' or 'laden' or 'pack' or
             'sitz' or 'kleid' or 'schlag' or
             'antwort' or 'wisch') rtrue;

    tab = (+ Table of verb-noun collisions +);
    
    if (AddressInTable(v, tab, 2)) rtrue;
	rfalse;
];

[ CheckInfinitiveClause    ws we wd wl wa1 wa2 swap i j ll length olength;

!   Hier wird der Satz umgewandelt von "Tasche aufheben" in "heb tasche auf"
!   Das wird gemacht, bevor der Satz auf eine Himmelsrichtung ("> nw") hin
!   untersucht wird und bevor geprüft wird, ob ein Akteur angesprochen wird.
!
!   Die Infinitivkonstruktion hat eh einige Nachteile:
!
!   "> uschi, kein quatsch machen" wird richtig umgeleitet zu "> uschi,
!   machen kein quatsch", was interpretiert wird als Ansage an Uschi, sie
!   möge bitte keinen Quatsch machen, krude Grammatik hin oder her.
!   Das geht erst seit einem Fix, den mir Christian Blümke eingesandt
!   hat: Nicht nur das then-word, sondern auch das comma-word wird als
!   Kriterium fürs Beibehalten der Satzstruktur interpretiert.
!
!   "> ziegelstein, seidenhemd und rote pudelmütze nehmen" wird allerdings
!   mit "Du kannst nicht mit dem Ziegelstein reden" beschieden, und zwar
!   mit und ohne Komma als Knock-out-Kriterium.

    wn = ws = verb_wordnum;
    while (NextWordStopped() ~= THEN1__WD or -1 or comma_word);
    we = wn = wn - 2;
    if (we < ws) return verb_word;

    wd = NextWord();
    if (wd && ((wd->#dict_par1) & 1) ~= 0) {
        swap = true;
    } else {

        ll = LanguageVerbPreps-->0;
        olength = WordLength(we);
        for (i = 1 : i <= ll : i++) {
            wn = we;
            length = WordMatch(LanguageVerbPreps-->i);
            if (length == 0) continue;
            if (length == olength) continue;
            wa2 = WordAddress(we) - buffer;
            LTI_Insert(wa2 + length, ' ');
            we++;
            VM_Tokenise(buffer, parse);
            (orig_position-->0)++;
            (orig_position-->(orig_position-->0))--;
            for (j == NumberOfWords() : j > we : j-- ) {
                (orig_position-->j)++;
            }
            PruneWord(we);
            wn = we;
            wd = NextWord();
            if (wd && ((wd->#dict_par1) & 1) ~= 0) swap = true;
            else {
                ! *** Kein gültiges Verb? Dann alten Zustand wiederherstellen,
                !     damit Kommandos ohne Verb wie z.B.
                !
                !             Understand "[something]" as examining.
                !
                !     auch dann noch funktionieren, wenn Vokabeln mit
                !     einer der Präpositionen aus der Tabelle LanguageVerbPreps
                !     beginnen, wie z.B. "Eingang" oder "Ausgang".

                LTI_Delete(wa2 + length);
                we--;
                VM_Tokenise(buffer, parse);
                (orig_position-->0)--;
                (orig_position-->(orig_position-->0))++;
                for (j == NumberOfWords() : j > we : j-- ) {
                    (orig_position-->j)--;
                }
            }
            break;
        }
    }
    if (swap) {
        wa1 = WordAddress(ws) - buffer;
        wa2 = WordAddress(we) - buffer;
        wl = WordLength(we);
        LTI_Insert(wa1, ' ');
        i = wl;
        while (i-- ) LTI_Insert(wa1, LTI_Delete(wa2 + wl));
        VM_Tokenise(buffer, parse);
        wn = ws;

        ll = orig_position-->we;
        for (j = we : j > ws : j-- ) {
            orig_position-->j = orig_position-->(j - 1);
        }
        orig_position-->ws = ll;

        num_words = NumberOfWords();

        return NextWordStopped();
    }
    return verb_word;
];

Array SynonymBuffer string 24;

[ printSynonymBuffer s;
    #ifdef TARGET_ZCODE;
    @output_stream 3 SynonymBuffer;
    print (string) s;
    @output_stream -3;
    return SynonymBuffer-->0;
    #ifnot;
    return Glulx_PrintAnyToArray(Synonymbuffer, 24, s);
    #endif;
];

[ CheckSynonym w s   i n wd start length newlength offset;
    wn = w; wd = NextWord(); if (~~wd) return;
    #ifdef TARGET_ZCODE;
    offset = WORDSIZE;
    #ifnot;
    offset = 0;
    #endif;

    !   Die Tabelle durchackern
    n = (s-->0);
    for (i = 1 : i<=n : i = i + 2) {
        if (wd ~= s-->i) continue;
        start = WordAddress(w);
        length = WordLength(w);
        newlength = printSynonymBuffer(s-->(i+1));
        while (newlength > length) {
            LTI_Insert(start + length - buffer,
                SynonymBuffer->(offset + (--newlength)));
        }
        while (newlength < length) {
            start->(--length) = ' ';
        }
        for (i = 0 : i<length : i++) {
            start->i = SynonymBuffer->(offset + i);
        }
        ! Satz neu in Tokens ausfplitten
        length = NumberOfWords();
        VM_Tokenise(buffer, parse);

        ! Referenzpositionen merken
        n = NumberOfWords();
        length = length - n;
        for (w++ : w<=n : w++)
            orig_position-->w = orig_position-->w + length;
        orig_position-->0 = orig_position-->0 - length;
        return;
    }
];

[ CheckTwin w s   i n wd1 wd2 start length newlength offset;
    wn = w; wd1 = NextWord(); wd2 = NextWord();
    #ifdef TARGET_ZCODE;
    offset = WORDSIZE;
    #ifnot;
    offset = 0;
    #endif;
    if (~~wd1) return; if (~~wd2) return;

    !   Die Tabelle durchackern
    n = (s-->0);
    for (i = 1 : i<=n : i = i + 3) {
        if (wd1 ~= s-->i) continue;
        if (wd2 ~= s-->(i+1)) continue;
        start = WordAddress(w);
        length = WordAddress(w+1) + WordLength(w+1) - start;
        newlength = printSynonymBuffer(s-->(i+2));
        start->(newlength - 1) = ' ';
        while (newlength > length) {
            LTI_Insert(start + length - buffer,
                SynonymBuffer->(offset + (--newlength)));
        }
        while (newlength < length) {
            start->(--length) = ' ';
        }
        for (i = 0 : i<length : i++) {
            start->i = SynonymBuffer->(offset + i);
        }
        ! Satz neu in Tokens ausfplitten
        length = NumberOfWords();
        VM_Tokenise(buffer, parse);

        ! Referenzpositionen merken
        n = NumberOfWords();
        length = length - n;
        for (w++ : w<=n : w++)
            orig_position-->w = orig_position-->w + length;
        orig_position-->0 = orig_position-->0 - length;
        return;
    }
];


#ifdef COMPOUND_HEADS;
[ CheckCompoundHeads w   n i start length olength cheads;
    wn = w;

    cheads = (+ Table of Compound Heads +);

    !   Die Tabelle durchackern
    n = TableRows(cheads);
	 for (i = 2 : i<=n : i++) {
        olength = WordLength(wn);
        length = WordMatch(TableLookUpEntry(cheads, 1, i));
        if (length==0) continue;
        if (length==olength) continue;
        start = WordAddress(w);
        if (start->length == '-') {
            LTI_Insert(start + length - buffer + 1, ' ');
        } else {
            LTI_Insert(start + length - buffer, ' ');
            if (TableLookUpEntry(cheads, 2, i) == 0)
                LTI_Insert(start + length - buffer, '-');
        }

        ! Satz neu in Tokens aufsplitten
        VM_Tokenise(buffer, parse);

        ! Referenzpositionen merken
        length = -1;
        for (w++ : w<=16 : w++)
            orig_position-->w = orig_position-->w + length;
        orig_position-->0 = orig_position-->0 - length;

        ! Eventuell den Rest beschneiden
        PruneWord(wn);
        return;
    }
];
#endif;

#ifdef COMPOUND_TAILS;
[ CheckCompoundTails w   n i start length olength ctails;
    wn = w;

    ctails = (+ Table of Compound Tails +);

    !   Die Tabelle durchackern
    n = TableRows(ctails);

    for (i = 2 : i<=n : i = i + 1) {
        olength = WordLength(wn);
        length = WordMatch(TableLookUpEntry(ctails, 1, i), 0, olength);

        start = WordAddress(w);
        if (length == 0 && start->(olength - 1) == 'e' or 's' or 'n') {
            length = WordMatch(TableLookUpEntry(ctails, 1, i), 0, olength-1);
            if (length) olength--;
        }
        if (length == 0 && start->(olength - 2) == 'e'
            && start->(olength - 1) == 'm' or 'n' or 'r' or 's') {
            length = WordMatch(TableLookUpEntry(ctails, 1, i), 0, olength-2);
            if (length) olength = olength - 2;
        }

        if (length==0) continue;
        if (length==olength) continue;

        start = WordAddress(w) + olength - length;
        if ((start - 1)->0 == '-') {
            LTI_Insert(start - buffer, ' ');
        } else {
            LTI_Insert(start - buffer, ' ');
            if (TableLookUpEntry(ctails, 2, i)==0)
                LTI_Insert(start - buffer, '-');
        }

        ! Satz neu in Tokens ausfplitten
        VM_Tokenise(buffer, parse);

        ! Referenzpositionen merken
        length = -1;
        for (w++ : w<=16 : w++)
            orig_position-->w = orig_position-->w + length;
        orig_position-->0 = orig_position-->0 - length;

        ! Eventuell den Rest beschneiden
        PruneWord(wn);
        return;
    }
];
#endif;

[ NumberOfWords;
    #ifdef TARGET_ZCODE;
    return parse->1;
    #ifnot; ! TARGET_GLULX
    return parse-->0;
    #endif; ! TARGET_
];

[ LanguageToInformese    zs ze i;

!   (i)
!   Der Autor bekommt Kontrolle über die Informisierung

    if (PreInformese()) rtrue;

!   (ii)
!   Alle Umlaute und Eszetts in 'ae', 'oe', 'ue', 'ss' umwandeln

    zs = WORDSIZE;
    #ifdef TARGET_ZCODE;
    ze = 2 + buffer->1;
    #ifnot; ! TARGET_GLULX
    ze = WORDSIZE + buffer-->0;
    #endif; ! TARGET_

    for (i = zs : i < ze : i++) {

	    ! *** (01.09.2010) Im Glulx-Format müssen möglicherweise vorhandene
	    !     Großbuchstaben in der Spielereingabe vor Umwandlung der Umlaute
	    !     und Abschneiden der Endungen in Kleinbuchstaben umgewandelt
	    !     werden, damit groß geschriebene Umlaute und Endungen korrekt
	    !     verarbeitet werden können. Wir erledigen das an dieser Stelle
	    !     gleich mit.

	    #ifdef TARGET_GLULX;
	    buffer->i = VM_UpperToLowerCase(buffer->i);
	    #endif;

	    if (buffer->i > 128) {
            switch(buffer->i) {
                CHAR_AE: buffer->i = 'a'; LTI_Insert(i+1, 'e'); ze++;
                CHAR_OE: buffer->i = 'o'; LTI_Insert(i+1, 'e'); ze++;
                CHAR_UE: buffer->i = 'u'; LTI_Insert(i+1, 'e'); ze++;
                CHAR_SS: buffer->i = 's'; LTI_Insert(i+1, 's'); ze++;
            }
        }
    }
    VM_Tokenise(buffer, parse);

!   (iii)
!   Kopie der Originaleingabe (allerdings ohne Umlaute) anlegen

    for (i = 0 : i < ze : i++) orig_buffer->i = buffer->i;

    ze = NumberOfWords();

    #ifdef TARGET_ZCODE;
    for (i=1 : i<=ze*2 : i++) orig_parse-->i = parse-->i;
    #ifnot;
    for (i=1 : i<=ze*3 : i++) orig_parse-->i = parse-->i;
    #endif;
    orig_parse-->0 = parse-->0;

    #ifdef TARGET_GLULX;
    for (i=1 : i<=MAX_BUFFER_WORDS : i++) orig_position-->i = i;
    #ifnot;
    for (i=1 : i<=16 : i++) orig_position-->i = i;
    #endif;
    orig_position-->0 = ze;

!   (iv)
!   Endungen (-e, -em, -en, -er, -es, -n, -s) abschneiden. Hierbei wird so lange
!   abgeschnitten, bis ein gültiges Wort gefunden wird. Wenn es also eine
!   'laute' gibt, so wird "Laute" belassen, ansonsten wird das '-e' abgestrennt.
!
!   Das kann bei einigen Paarungen von Substantiven mit Adjektiven (jung/Junge)
!   oder Verben (pump/Pumpe) Konflikte geben. Dann muss das Vokabular angepasst
!   werden. (Nicht schön, aber praktikabel.)

    for (i=0 : i<ze : i++) PruneWord(i + 1);

!   (v)
!   Umwandeln der Synonyme, hauptsächlich Kontraktionen aus Präpositionen und
!   bestimmten Artikeln. Hierzu wird das Feld Synonyms herangezogen.

    for (i=0 : i<ze : i++) {
        #ifdef Synonyms;
        CheckSynonym(i + 1, Synonyms);
        #endif;
        CheckSynonym(i + 1, LanguageSynonyms);
        #ifdef TARGET_ZCODE;
        ze = parse->1;
        #ifnot; ! TARGET_GLULX
        ze = parse-->0;
       #endif; ! TARGET_
    }

    for (i=0 : i<ze-1 : i++) {
        #ifdef Twins;
        CheckTwin(i + 1, Twins);
        #endif;
        CheckTwin(i + 1, LanguageTwins);
        #ifdef TARGET_ZCODE;
        ze = parse->1;
        #ifnot; ! TARGET_GLULX
        ze = parse-->0;
        #endif; ! TARGET_
    }

    #ifdef COMPOUND_HEADS;
    for (i=0 : i<ze : i++) {
        CheckCompoundHeads(i + 1);
        #ifdef TARGET_ZCODE;
        ze = parse->1;
        #ifnot; ! TARGET_GLULX
        ze = parse-->0;
        #endif; ! TARGET_
    }
    #endif;

    #ifdef COMPOUND_TAILS;
    for (i=0 : i<ze : i++) {
        CheckCompoundTails(i + 1);
        #ifdef TARGET_ZCODE;
        ze = parse->1;
        #ifnot; ! TARGET_GLULX
        ze = parse-->0;
        #endif; ! TARGET_
    }
    #endif;

!   (vi)
!   Ausrufe- und Fragezeichen behandeln, falls gewünscht.

    !HandlePunctuation();

!   (vii)
!   Der Autor bekommt noch einmal Kontrolle über die Informisierung.

    if (PostInformese()) rtrue;
];
-) instead of "Translation" in "Language.i6t".

Include (-
Constant LanguageAnimateGender   = male;
Constant LanguageInanimateGender = neuter;

Constant LanguageContractionForms = 0;

[ LanguageContraction text;
    return 0;
];


Constant Nom = 0;
Constant Gen = 1;
Constant Dat = 2;
Constant Akk = 3;

Array LanguageArticles -->
    "die"    "der"    "die"    "das"     ! bestimmte Artikel
    "der"    "des"    "der"    "des"
    "den"    "dem"    "der"    "dem"
    "die"    "den"    "die"    "das"
    0        "ein"    "eine"   "ein"     ! unbestimmte Artikel
    0        "eines"  "einer"  "eines"
    0        "einem"  "einer"  "einem"
    0        "einen"  "eine"   "ein"
    "keine"  "kein"   "keine"  "kein"    ! verneinte
    "keiner" "keines" "keiner" "keines"  ! unbestimmte Artikel
    "keinen" "keinem" "keiner" "keinem"
    "keine"  "keinen" "keine"  "kein"
    ;

Constant def_article_base 0;
Constant indef_article_base 16;
Constant neg_article_base 32;

Array LanguageSuffixes -->
    "en"   "e"    "e"    "e"        ! mit bestimmtem Artikel
    "en"   "en"   "en"   "en"
    "en"   "en"   "en"   "en"
    "en"   "en"   "e"    "e"      
    "e"    "er"   "e"    "es"       ! mit unbestimmtem Artikel
    "er"   "en"   "en"   "en"
    "en"   "en"   "en"   "en"
    "e"    "en"   "e"    "es"
    "e"    "er"   "e"    "es"       ! ohne Artikel
    "er"   "en"   "er"   "en"
    "en"   "em"   "er"   "em"
    "e"    "en"   "e"    "es"
    "e"    "er"   "e"    "es"       ! Demonstrativpronomen.
    "er"   "es"   "er"   "es"
    "en"   "em"   "er"   "em"
    "e"    "en"   "e"    "es"
    "e"    ""     "e"    ""         ! Possessivpronomen
    "er"   "es"   "er"   "es"
    "en"   "em"   "er"   "em"
    "e"    "en"   "e"    ""
    ;

Constant def_suffix_base 0;
Constant indef_suffix_base 16;
Constant plain_suffix_base 32;
Constant demonstrative_suffix_base 48;
Constant possessive_suffix_base 64;

Array PersonalPronouns -->
    "sie"     "er"      "sie"     "es"
    "ihrer"   "seiner"  "ihrer"   "seiner"
    "ihnen"   "ihm"     "ihr"     "ihm"
    "sie"     "ihn"     "sie"     "es"
    ;
        
Array LanguageRelativePronouns -->
	"die"      "der"      "die"      "das"
	"deren"    "dessen"   "deren"    "dessen"
	"denen"    "dem"      "der"      "dem"
	"die"      "den"      "die"      "das"

	"derer"    "dessen"   "derer"    "dessen"

	"welche"   "welcher"  "welche"   "welches"
	0          0          0          0         ! *** keine Genitiv-Formen
	"welchen"  "welchem"  "welcher"  "welchem"
	"welche"   "welchen"  "welche"   "welches"
    ;

Constant MAX_CG_STACK = 8;

Array CG_buffer --> 2 * MAX_CG_STACK;
Global CG_pointer;

[ GenderChanged obj   i;
    for (i = 0 : i < MAX_CG_STACK : i++) {
        if (CG_buffer-->(2*i) == obj) return CG_buffer-->(2*i + 1);
    }
    rfalse;
];

[ GenderNotice obj g   i;

    ! Objekt und Genus löschen
    for (i=0 : i < MAX_CG_STACK : i++) {
        if (CG_buffer-->(2*i) == obj) {
            CG_buffer-->(2*i) = 0;
        }
    }

    if (g) {
        ! Objekt und Genus setzen
        CG_buffer-->(CG_pointer*2) = obj;
        CG_buffer-->(CG_pointer*2 + 1) = g;
        CG_pointer++;
        CG_pointer = CG_pointer % MAX_CG_STACK;
    }
];

[ Gender obj flag   g;

    if (obj == nothing) return;

    ! Wenn flag gesetzt ist, nach Gender-Änderungen schauen
    if (flag) {
        g = GenderChanged(obj);
        if (g) {
            switch (g) {
                pluralname: return 0;
                male:       return 1;
                female:     return 2;
                neuter:     return 3;
            }
        }
    }

    ! Genus zurücksetzen
    if (~~printing_command) GenderNotice(obj, 0);

    ! Übliches Verfahren nach Attributen
    if (obj has pluralname) return 0;
    if (obj has male) return 1;
    if (obj has female) return 2;
    return 3;
];
-) instead of "Articles" in "Language.i6t".

Include (-
Constant NKEY__TX     = "N = nächstes";
Constant PKEY__TX     = "V = voriges";
Constant QKEY1__TX    = "     Z = zurück";
Constant QKEY2__TX    = "     Z = zurück";
Constant RKEY__TX     = "EINGABE = Artikel lesen";

Constant NKEY1__KY      = 'N';
Constant NKEY2__KY      = 'n';
Constant PKEY1__KY      = 'V';
Constant PKEY2__KY      = 'v';
Constant QKEY1__KY      = 'Z';
Constant QKEY2__KY      = 'z';

Constant SCORE__TX      = "Punkte: ";
Constant MOVES__TX      = "Züge: ";
Constant TIME__TX       = "Zeit: ";
Global CANTGO__TX     = "Du kannst nicht in diese Richtung gehen.";
Global FORMER__TX     = "@23 früher@00 Ich";
Global YOURSELF__TX   = "@20";
Constant YOU__TX        = "@20";
Constant DARKNESS__TX   = "Dunkelheit";

Constant THOSET__TX     = "all das";
Constant THAT__TX       = "das";
Constant OR__TX         = " oder ";
Constant NOTHING__TX    = "nichts";
Constant NOTHING2__TX    = "Nichts";
Global IS__TX         = " ist";
Global ARE__TX        = " sind";
Global IS2__TX        = "ist ";
Global ARE2__TX       = "sind ";
Global IS3__TX        = "ist";
Global ARE3__TX       = "sind";
Constant AND__TX        = " und ";

Constant LISTAND__TX   = " und ";
Constant LISTAND2__TX  = " und ";

Constant WHOM__TX       = "";
Constant WHICH__TX      = "";
Constant COMMA__TX      = ", ";
-) instead of "Short Texts" in "Language.i6t".

Include (-
! *** Die Printed Inflections aus dem Original wurden komplett gestrichen
!     und durch neue Routinen ersetzt.

[ SetPreviouslyNamedNoun obj;
    ! *** nur I7/GerX: Für Textersetzungen, die sich auf das zuletzt genannte
    !     Objekt beziehen (z.B. [ist], [hat], [wird] usw.).
    pnn = obj;
];

[ GDer obj; CDefArt(obj, 0); ];
[ GDes obj; CDefArt(obj, 1); ];
[ GDem obj; CDefArt(obj, 2); ];
[ GDen obj; CDefArt(obj, 3); ];

[ der obj; DefArt(obj, 0); ];
[ des obj; DefArt(obj, 1); ];
[ dem obj; DefArt(obj, 2); ];
[ den obj; DefArt(obj, 3); ];

[ GEin obj;   CIndefArt(obj, 0); ];
[ GEines obj; CIndefArt(obj, 1); ];
[ GEinem obj; CIndefArt(obj, 2); ];
[ GEinen obj; CIndefArt(obj, 3); ];

[ ein obj;   IndefArt(obj, 0); ];
[ eines obj; IndefArt(obj, 1); ];
[ einem obj; IndefArt(obj, 2); ];
[ einen obj; IndefArt(obj, 3); ];

[ GKein obj;   RunCapitalised(NegativeArt, obj, 0); ];
[ GKeines obj; RunCapitalised(NegativeArt, obj, 1); ];
[ GKeinem obj; RunCapitalised(NegativeArt, obj, 2); ];
[ GKeinen obj; RunCapitalised(NegativeArt, obj, 3); ];

[ kein obj;   NegativeArt(obj, 0); ];
[ keines obj; NegativeArt(obj, 1); ];
[ keinem obj; NegativeArt(obj, 2); ];
[ keinen obj; NegativeArt(obj, 3); ];

[ er obj;     PersonalPron(obj, 0); ];
[ seiner obj; PersonalPron(obj, 1); ];
[ ihm obj;    PersonalPron(obj, 2); ];
[ ihn obj;    PersonalPron(obj, 3); ];

[ GEr obj;     RunCapitalised(PersonalPron, obj, 0); ];
[ GSeiner obj; RunCapitalised(PersonalPron, obj, 1); ];
[ GIhm obj;    RunCapitalised(PersonalPron, obj, 2); ];
[ GIhn obj;    RunCapitalised(PersonalPron, obj, 3); ];

[ ist obj;
    SetPreviouslyNamedNoun(obj);
    if (obj == 0) { print "ist"; return; }
    if (obj == player) { print "bist"; return; }
    if (obj has pluralname) print "sind"; else print "ist";
];

[ hat obj;
    SetPreviouslyNamedNoun(obj);
    if (obj == 0) { print "hat"; return; }
    if (obj == player) { print "hast"; return; }
    if (obj has pluralname) print "haben"; else print "hat";
];

[ wird obj;
    SetPreviouslyNamedNoun(obj);
    if (obj == 0) { print "wird"; return; }
    if (obj == player) { print "wirst"; return; }
    if (obj has pluralname) print "werden"; else print "wird";
];

[ ___t obj;
    SetPreviouslyNamedNoun(obj);
    if (obj == 0) { print "t"; return; }
    if (obj == player) { print "st"; return; }
    if (obj has pluralname) print "en"; else print "t";
];


[ ___et obj;
    SetPreviouslyNamedNoun(obj);
    if (obj == 0) { print "et"; return; }
    if (obj == player) { print "est"; return; }
    if (obj has pluralname) print "en"; else print "et";
];


[ ___e obj;
    SetPreviouslyNamedNoun(obj);
    if (obj == 0) { print "e"; return; }
    if (obj == player) { print "est"; return; }
    if (obj has pluralname) print "en"; else print "e";
];

[ plur pl sg obj;
    SetPreviouslyNamedNoun(obj);
    if (obj == 0) { print (string) sg; return; }
    if (obj has pluralname) print (string) pl; else print (string) sg;
];

[ auf obj; if (obj has supporter) print "auf"; else print "in"; ];

[ von obj; if (obj has supporter) print "von"; else print "aus"; ];

[ GAuf obj; if (obj has supporter) print "Auf"; else print "In"; ];

[ GVon obj; if (obj has supporter) print "Von"; else print "Aus"; ];


[ ParsedAuf  obj    i  w num_words entry_size;

! *** (03.02.2011) Hier wird geprüft, ob in der geparsten Spielereingabe eine
!     der Präpositionen "auf" oder "in" enthalten ist. Wenn ja, wird diese
!     ausgegeben; wenn nicht, richtet sich die Präposition nach der
!     Beschaffenheit des Objekts (supporter/container).

#ifdef TARGET_ZCODE;
    entry_size = 2;
    num_words = parse->1;
#ifnot;
    entry_size = 3;
    num_words = parse-->0;
#endif;
    
    for (i=0 : i < num_words: i++) {
       w = parse-->(i*entry_size + 1);
       if ( w == 'auf' or 'in' && (w->#dict_par1 & 8) )
                                   ! $1000 (8) ist das Flag für Präpositionen
           { print (address) w; return; }
    }
    print (auf) obj;
];

! ----------- Explizite Fehlermeldungen ---------------


[ WordIsKnown__    wd own k;
  ! Untersucht, ob das Wort an der Stelle wn dem parser bekannt ist.
  ! Der Autor kann mit dem Einhänger WordIsKnown() eingreifen, um
  ! zum Beispiel explizit mit WordMatch() geparste Strings abzufangen.

  own = wn; k = WordIsKnown(); wn = own;
  if (k >= 0) return k;

  wd = NextWord();
  wn = own;
  if (wd) rtrue;
  rfalse;
];

#ifndef WordIsKnown;
[ WordIsKnown; return -1; ];
#endif;

#ifdef EXPLICIT_ERROR_MESSAGES;

[ ExplicitError silent no_line_break;
    if (max_wn < 1) rfalse;
    if (max_wn > num_words) rfalse;
    if (silent) rtrue;

    wn = max_wn;

    if (WordIsKnown__()) {
        L__M(##Miscellany, 98);
    } else {
        L__M(##Miscellany, 99);
    }
    if (no_line_break == false) print "^";
    rtrue;
];

#ifnot; ! EXPLICIT

[ ExplicitError; rfalse; ];

#endif;
-) instead of "Printed Inflections" in "Language.i6t".

Include (-
[ LanguageLM n x1 x2;
  say__p = 1;
  Answer, Ask:
            "Keine Antwort.";
! Ask:      see Answer
  Attack:   "Gewalt ist keine Lösung.";
  Burn:     "Das ist gefährlich und wenig sinnvoll.";
  Buy:      "Hier gibt es nichts zu kaufen.";
  Climb:    "Damit wirst @20 nichts erreichen.";
  Close: switch (n) {
    1:  "Du kannst ", (den) x1, " nicht schlie@30en.";
    2:  print_ret (GDer) x1, " ", (ist) x1, " bereits geschlossen.";
    3:  "Du schlie@30t ", (den) x1, ".";
    4:  print (GDer) actor, " schlie@30", (___t) actor, " ", (den) x1, ".^";
    5:  print (GDer) x1, " schlie@30", (___t) x1, " sich.^";
    }
  Consult:  switch (n) {
        1:  "In ", (dem) x1, " findest @20 nichts Interessantes darüber.";
        2:  print (GDer) actor, " "; plur("sehen", "sieht", actor);
            print " sich ", (den) x1, " an.^";
    }
  Cut:      "Es bringt nichts, ", (den) x1, " zu zerschneiden.";
  Disrobe: switch (n) {
        1:  "Du trägst ", (den) x1, " gar nicht.";
        2:  "Du ziehst ", (den) x1, " aus.";
        3:  print (GDer) actor, " zieh", (___t) actor, " ", (den) x1, " aus.^";
    }
  Dress: switch (n) {
        1:  "Du lä@31t ", (den) x1, " besser wie ", (er) x1, " ", (ist) x1, ".";
        2:  "Das ist nicht nötig.";
        3:  print_ret (GDer) actor, " möcht", (___e) actor,
                " gerne bleiben wie ", (er) actor, " ", (ist) actor, ".";
        4:  print_ret (GDer) actor, "möcht", (___e) actor, " ",
                (den) x1, " nicht anziehen.";
    }
  Drink:    "Das kann man nicht trinken.";
  Drop: switch (n) {
        1:  print_ret (GDer) x1, " ", (ist) x1, " bereits hier.";
        2:  "Du hast ", (den) x1, " gar nicht.";
        3:  print "(Dazu ziehst @20 ", (den) x1, " erst aus.)^";
            say__p = 0; return;
        4:  "In Ordnung.";
        5:  "Es ist kein Platz mehr auf ", (dem) x1, ".";
        6:  "Es ist kein Platz mehr in ", (dem) x1, ".";
        7:  print (GDer) actor, " leg", (___t) actor, " ", (den) x1, " hin.^";
    }
  Eat: switch (n) {
        1:  print_ret (GDer) x1, " ", (ist) x1, " nicht e@31bar.";
        2:  "Du i@31t ", (den) x1, ". Nicht schlecht.";
        3:  print (GDer) actor, " "; plur("essen", "i@31t", actor);
            print " ", (den) x1, ".^";
    }
  Enter: switch (n) {
        1:  "Aber @20 bist doch schon ", (auf) x1, " ", (dem) x1, ".";
        2:  print "Du kannst ";
            switch (verb_word) {
              'stell', 'steh':  print_ret (ParsedAuf) x1, " ", (dem) x1, " nicht stehen.";
              'sitz', 'setz':   print_ret (ParsedAuf) x1, " ", (dem) x1, " nicht sitzen.";
              'lieg', 'leg':    print_ret (ParsedAuf) x1, " ", (dem) x1,  " nicht liegen.";
              default:          print_ret (den) x1, " nicht betreten.";
            }
        3:  "Du kannst nicht in ", (den) x1, " wenn ", (er) x1,
            " geschlossen ", (ist) x1, ".";
        4:  "Du kannst nur frei stehende Dinge betreten.";
        5:  switch (verb_word) {
              'stell', 'steh':  print "Du stellst @22 ";
              'sitz', 'setz':   print "Du setzt @22 ";
              'lieg', 'leg':    print "Du legst @22 ";
              default:          print "Du steigst ";
            }
            print_ret (auf) x1, " ", (den) x1, ".";
        6:  print "(Dazu steigst @20 erst ", (von) x1, " ", (dem) x1, ".)^";
            say__p = 0; return;
        7:  if (x1 has supporter || x1 has container)
                "(Du steigst zuerst ", (auf) x1, " ", (den) x1, ".)";
            "(Du betrittst zuerst ", (den) x1, ".)";
        8:  print (GDer) actor, " "; plur("betreten", "betritt", actor);
            print " ", (den) x1, ".^";
        9:  print (GDer) actor, " steig", (___t) actor, " ", (auf) x1, " ", (den) x1, ".^";

    }
  Examine: switch (n) {
        1:  "Es ist dunkel hier.";
        2:  "Du siehst nichts Besonderes an ", (dem) x1, ".";
        3:  print (GDer) x1, " ", (ist) x1, " im Moment ";
            if (x1 has on) "an."; else "aus.";
        4:  print (GDer) actor, " betracht", (___et) actor, " ", (den) x1, " genau.^";
        5:  "Du siehst nichts Unerwartetes in dieser Richtung.";
    }
  Exit: switch (n) {
        1:  "Aber @20 bist im Moment nirgendwo drin.";
        2:  "Du kannst ", (den) x1, " nicht verlassen, wenn ",
            (er) x1, " geschlossen ", (ist) x1, ".";
        3:  print "Du ";
            switch (verb_word) {
	            'verlass': "verlässt ", (den) x1, ".";
	            'kletter':       print "kletterst ";
	            'tritt', 'tret': print "trittst ";
	            default:         print "steigst ";
            }
            print_ret (von) x1, " ", (dem) x1, ".";
        4:  "Aber @20 bist gar nicht ", (auf) x1, " ", (dem) x1, ".";
        5:  print (GDer) actor, " steig", (___t) actor, " von ", (dem) x1, ".^";
        6:  print (GDer) actor, " steig", (___t) actor, " aus ", (dem) x1, ".^";

    }
  GetOff:   "Aber @20 bist gar nicht ", (auf) x1, " ", (dem) x1, ".";
  Give: switch (n) {
        1:  "Du hast ", (den) x1, " gar nicht.";
        2:  "Jetzt willst @20 es @21 aber mal richtig geben, was?";
        3:  print (GDer) x1; plur(" scheinen", " scheint", x1);
            " nicht besonders interessiert zu sein.";
        4:  print (GDer) x1, " ";
                print (ist) x1, " nicht";
                " in der Lage etwas anzunehmen.";
        5:  "Du gibst ", (dem) second, " ", (den) x1, ".";
        6: print (GDer) actor, " "; plur("geben", "gibt", actor);
           print " @21 ", (den) x1, ".^";
        7: print (GDer) actor, " "; plur("geben", "gibt", actor);
           print " ", (dem) second, " ", (den) x1, ".^";

    }
  Go: switch (n) {
        1:  "Das geht nicht, solange @20 noch ", (auf) x1, " ",
            (dem) x1, " bist.";
        2:  print_ret (string) CANTGO__TX;   ! "You can't go that way."
        !3:  "Du kannst nicht auf ", (den) x1, " klettern.";
        !4:  "Du kannst ", (den) x1, " nicht hinabsteigen.";
        !5:  "Das geht nicht, ", (der) x1, " ", (ist) x1, " im Weg.";
        ! *** 3-5 seit 6E59 gestrichen. ***
        ! *** wir benutzen diese jetzt wieder für die Aktion location-leaving.
        3: "Es gibt hier keine offensichtlichen Ausgänge.";
        4: print "(nach ", (WithoutArt) x1, ")^"; say__p = 0; return;
        5: "Es gibt mehrere Ausgänge. Bitte sage genau, wohin @20 gehen möchtest.";
        6:  print "Das geht nicht, ", (der) x1, " führ", (___t) x1, " nirgendwohin.";
	    7:  "Du mu@31t sagen, in welche Richtung @20 gehen möchtest.";
	    8:  print (GDer) actor, " geh", (___t) actor, " hinauf";
	    9:  print (GDer) actor, " geh", (___t) actor, " hinunter";
	    10: print (GDer) actor, " geh", (___t) actor, " nach ", (WithoutArt) x1;
	    11: print (GDer) actor, " komm", (___t) actor, " von oben herunter";
	    12: print (GDer) actor, " komm", (___t) actor, " von unten herauf";
	    13: print (GDer) actor, " komm", (___t) actor, " von ", (WithoutArt) x1;
	    14: print (GDer) actor, " komm", (___t) actor, " herein";
	    15: print (GDer) actor, " erreich", (___t) actor, " ", (den) x1, " von oben";
	    16: print (GDer) actor, " erreich", (___t) actor, " ", (den) x1, " von unten";
	    17: print (GDer) actor, " erreich", (___t) actor, " ", (den) x1, " von ", (WithoutArt) second;
	    18: print (GDer) actor, " geh", (___t) actor, " durch ", (den) x1;
	    19: print (GDer) actor, " komm", (___t) actor, " von ", (dem) x1;
	    20: print "auf ", (dem) x1;
	    21: print "in ", (dem) x1;
	    22: print ", ", (den) x1, " vor sich her schiebend, und @22 dazu";
	    23: print ", ", (den) x1, " vor sich her schiebend";
	    24: print ", ", (den) x1, " aus dem Weg schiebend";
	    25: print ", ", (den) x1, " hineinschiebend";
	    26: print ", @22 mitziehend";
	    27: print "(Dazu steigst @20 erst ", (von) x1, " ", (dem) x1, ".)^";
	        say__p = 0; return;
		28: print "(Du öffnest zuerst ", (den) x1, ".)^"; say__p = 0; return;
    }
  Insert: switch (n) {
        1:  "Du mu@31t ", (den) x1, " in der Hand halten, um ", (ihn) x1,
            " in etwas anderes legen zu können.";
        2:  print_ret (GDer) x1, " ", (ist) x1, " weder ein Behälter noch eine Ablage.";
        3:  print_ret (GDer) x1, " ", (ist) x1, " geschlossen.";
        4:  "Dazu mu@31t @20 ", (den) x1, " erst ausziehen.";
        5:  "Du kannst nichts in sich selbst legen.";
        6:  print "(Du ziehst ", (den) x1, " erst aus.)^";
            say__p = 0; return;
        7:  "Es ist kein Platz mehr ", (auf) x1, " ", (dem) x1, ".";
        8:  "In Ordnung.";
        9:  print "Du ";
            switch (verb_word) {
	            'setz':  print "setzt";
	            'stell': print "stellst";
	            default: print "legst";
            }
            " ", (den) x1, " ", (auf) second, " ", (den) second, ".";
        10:  print (GDer) actor, " leg", (___t) actor, " ", (den) x1,
                 " ", (auf) second, " ", (den) second, ".^";
    }
  Inv: switch (n) {
        1:  "Du hast nichts bei @21.";
        2:  print "Du hast "; short_name_case = Akk;
        3:  print "Folgendes bei @21:^";
        4:  print " bei @21.";
        5:  print (GDer) x1, " durchsuch", (___t) x1, " ";
            if (x1 has pluralname || x1 has female) print "ihre";
            else print "seine"; print " Habe.^";
    }
  Jump:     "Du springst etwas motivationslos auf der Stelle.";
  Kiss:     "Konzentrier @22 auf das Spiel.";
  Listen:   "Du hörst nichts Unerwartetes.";
  ListMiscellany: switch (n) {
        1:  print " (", (string) LIT__TX, ")";
        2:  print " (", (string) LanguageArticles-->(Gender(x1)),
                  " geschlossen ", (ist) x1, ")";
        3:  print " (geschlossen und ", (string) LIT__TX, ")";
        4:  print " (", (string) LanguageArticles-->(Gender(x1)),
                  " leer ", (ist) x1, ")";
        5:  print " (leer und ", (string) LIT__TX, ")";
        6:  print " (", (string) LanguageArticles-->(Gender(x1)),
                  " geschlossen und leer ", (ist) x1, ")";
        7:  print " (geschlossen, leer und ", (string) LIT__TX, ")";
        8:  print " (", (string) LIT__TX, " und angezogen";
        9:  print " (", (string) LIT__TX;
        10: print " (angezogen";
        11: print " (", (string) LanguageArticles-->(Gender(x1)), " ";
        12: print "offen ", (ist)x1;
        13: print "offen, aber leer ", (ist) x1;
        14: print "geschlossen ", (ist) x1;
        15: print "abgeschlossen ", (ist) x1;
        16: print " und leer ", (ist) x1;
        17: print " (", (string) LanguageArticles-->(Gender(x1)),
                  " leer ", (ist) x1, ")";
        18: print " (", (er) x1; plur(" enthalten ", " enthält ", x1);
        19: print " (darauf ";
        20: print ", darauf ";
        21: print " (darin ";
        22: print ", darin ";
    }
  LMode1:   " ist nun im knappen Modus, in dem Raumbeschreibungen nur beim
              ersten Betreten eines Raums angezeigt werden.";
  LMode2:   " ist nun im ausführlichen Modus, der immer die langen
              Raumbeschreibungen zeigt, auch wenn dieser schon einmal
              besucht wurde.";
  LMode3:   " ist nun im superknappen Modus, der immer nur die kurze
              Raumbeschreibung anzeigt, auch wenn dieser zum ersten Mal
              betreten wird.";
  Lock: switch (n) {
        1:  "Du kannst ", (den) x1, " nicht abschlie@30en.";
        2:  print_ret (GDer) x1, " ", (ist) x1, " schon abgeschlossen.";
        3:  "Du mu@31t ", (den) x1, " dazu erst zumachen.";
        4:  print (GDer) x1; plur(" passen", " pa@31t", x1); " nicht.";
        5:  "Du schlie@30t ", (den) x1, " ab.";
        6:  print (GDer) actor, " schlie@30", (___t) actor, " ", (den) x1, " ab.^";
    }
  Look: switch (n) {
        1:  print " (auf ", (dem) x1, ")";
        2:  print " (in ", (dem) x1, ")";
        3:  print " (als ", (object) x1, ")";
        4:  print "Auf ", (dem) x1, " ";
            WriteListFromCase(child(x1),
              ENGLISH_BIT + RECURSE_BIT + PARTINV_BIT + TERSE_BIT + CONCEAL_BIT
                          + ISARE_BIT, Nom, 1);
            print "."; if (WriteSublists()==0) "";
        5, 6:
            if (x1 ~= location)
                print (GAuf) x1, " ", (dem) x1, " siehst @20 ";
            else print "Du siehst hier ";
            if (n == 5) print "au@30erdem ";
            WriteListFromCase(child(x1),
              ENGLISH_BIT + RECURSE_BIT + PARTINV_BIT + TERSE_BIT + CONCEAL_BIT
              + WORKFLAG_BIT, Akk, 1);
            print "."; if (WriteSublists()==0) "";

        #ifdef NO_NESTED_LISTS;
        -2: ! -1 wird von Ron Newcombs Default Messages verwendet
            print (GAuf) x1, " ", (dem) x1, " "; ! *** In I7 wird ISARE_BIT ohne " " interpretiert.
            WriteListFromCase(child(x1),
              ENGLISH_BIT + RECURSE_BIT + PARTINV_BIT + TERSE_BIT + CONCEAL_BIT
              + ISARE_BIT, Nom, 1);
              ! Tiefe eins, um die Zeilenumbrüche zu steuern
            print "."; if (WriteSublists()==0) "";
        #endif;

        7:  "Dort siehst @20 nichts Au@30ergewöhnliches.";
        8:  print " (", (auf) x1, " ", (dem) x1, ")";
        9:  print (GDer) actor, " "; plur("sehen", "sieht", actor);
            print " sich um.^";
    }
  LookUnder: switch (n) {
        1:  "Aber es ist dunkel.";
        2:  "Du findest nichts Interessantes.";
        3:  print (GDer) actor, " "; plur("sehen", "sieht", actor);
            print " ", (den) x1, ".^";
    }
  Mild:     "So, so.";
  Miscellany: switch (n) {
        1:  "(Es werden nur die ersten sechzehn Objekte berücksichtigt.)^";
        2:  "Hier gibt es nichts zu tun!";
        3:  print " Du bist gestorben ";
        4:  print " Du hast gewonnen ";
        5:  print "^Möchtest @20 einen NEUSTART, einen vorher gespeicherten
                Spielstand LADEN";
            #Ifdef DEATH_MENTION_UNDO;
            print ", den letzten Zug mit UNDO rückgängig machen";
            #Endif;
            if (TASKS_PROVIDED == 0) print ", @24 Punkte KOMPLETT auflisten";
            if (deadflag == 2 && AMUSING_PROVIDED == 0)
                print ", im NACHWORT über lustige Dinge im Spiel erfahren";
            " oder das Spiel beENDEn?";
        6:  "[Dein Interpreter kann leider keine Spielzüge rückgängig machen.]";
            #Ifdef TARGET_ZCODE;
        7:  "Der Spielzug konnte nicht rückgängig gemacht werden.
             [Nicht alle Interpreter verfügen über diese Funktionalität.]";
            #Ifnot; ! TARGET_GLULX
        7:  "[Du kannst keine weiteren Spielzüge rückgängig machen.]";
            #Endif; ! TARGET_
        8:  "Bitte antworte mit einer der oben genannten Möglichkeiten.";
        9:  "Es ist nun stockfinster hier!";
        10: "Wie bitte?";
        11: "[Erst machen, dann rückgängig machen.]";
        12: "[Du kannst leider immer nur einen Zug in Folge rückgängig machen.]";
        13: "[Der letzte Zug wurde rückgängig gemacht.]";
        14: "Da gibt es leider nichts zu korrigieren.";
        15: "Denk @21 nichts weiter.";
        16: "Mit ~hoppla~ kann immer nur ein Wort korrigiert werden.";
        17: "Es ist stockfinster, @20 siehst nichts.";
        18: print_yourself();
        19: "Gutaussehend wie immer.";
        20: "Wenn @20 einen Befehl wie ~Häschen, hüpf~ wiederholen willst, sag
            ~nochmal~, nicht ~Häschen, nochmal~.";
        21: "Das kann man nicht wiederholen.";
        22: "Du kannst den Satz nicht mit einem Komma beginnen.";
        23: "Du möchtest wahrscheinlich jemandem eine Anweisung erteilen,
            aber mir ist nicht klar wem.";
        24: "Mit ", (dem) x1, " kann man nicht reden.";
        25: "Um mit jemandem zu reden, benutze bitte ~Jemand, hallo~.";
        26: print "(Dazu hebst @20 ", (den) x1, " erst auf.)^"; say__p = 0; return;
        27: if (ExplicitError()) return;
            "Diesen Satz habe ich nicht verstanden.";
        28: #IfDef EXPLICIT_ERROR_MESSAGES; if (ExplicitError()) rtrue;
                "Diesen Satz habe ich nicht verstanden.";
            #IfNot;
            print "Ich habe nur Folgendes verstanden: ";
            #Endif;
        29: "Diese Zahl habe ich nicht verstanden.";
        30: if (ExplicitError()) return;
            "So etwas kannst @20 hier nicht sehen.";
        31: "Du scheinst nicht alles gesagt zu haben!";
        32: "Aber das hast @20 nicht bei @21!";
        33: "Hier kannst @20 nur ein Objekt angeben.";
        34: "Du kannst in jedem Satz nur einmal Listen von Objekten angeben.";
        35: "Mir ist nicht klar, worauf sich ~", (address) pronoun_word,
            "~ bezieht.";
        36: "Du hast etwas ausgeschlossen, das gar nicht zur Ausgangsmenge gehört!";
        37: "Das kannst @20 nur mit Lebewesen sinnvoll machen.";
        38: if (ExplicitError()) return;
            "Ich habe dieses Verb nicht verstanden.";
        39: "Damit brauchst @20 @22 in diesem Spiel nicht zu beschäftigen.";
        40: "Du siehst ~", (address) pronoun_word, "~ (", (den) pronoun_obj,
            ") hier im Moment nicht.";
        41: "Das Satzende habe ich leider nicht verstanden.";
        42: if (x1 == 0) print "Nichts "; else print "Nur ", (number) x1;
            ! *** bei 1 "es" mit ausgeben, sonst würde es "Nur ein davon".
            if (x1 == 1) print "es";
            print " davon ";
            if (x1 <= 1) print "steht"; else print "stehen";
            " zur Verfügung.";
        43: "Es gibt hier nichts zu tun!";
        44: if (action==##Drop) "Du hast aber nichts.";
            if (second) print "Dort"; else print "Hier"; !" ist aber nichts!";
            " ist aber nichts, womit @20 das tun kannst.";
        45: print "Wen meinst @20, ";
        46: print "Was meinst @20, ";
        47: "Hier kannst @20 nur ein Objekt angeben. Welches?";
        48: PrintWemCommand();
        !49: PrintWomitCommand();
        ! *** der Kontext wird nicht ganz korrekt erkannt, deshalb die neue Variante:
        49: if (action_to_be==##Ask or ##Tell or ##Answer) PrintWemCommand(); else PrintWomitCommand();
        50: print "Du hast gerade ";
            if (x1 > 0) {
                print x1, " Punkt";
                if (x1 ~= 1) print "e";
                print " bekommen";
            } else {
                print -x1, " Punkt";
                if (x1 ~= -1) print "e";
                print " verloren";
            }
        51: "(Da etwas Dramatisches passiert ist, wurde die Liste @26
            Anweisungen nicht komplett ausgeführt.)";
        52: "^Bitte eine Nummer von 1 bis ", x1, " angeben, mit 0 die Anzeige
            auffrischen oder die EINGABETASTE drücken.";
        53: "^[Bitte die LEERTASTE drücken.]";
        54: "[Kommentar notiert.]";
        55: "[Kommentar NICHT notiert.]";
        56: print ".^";
        57: print "?^";
        58: print (GDer) actor, " "; plur("können", "kann", actor);
            print " das nicht tun.^";
        59: "Du mu@31t ein Hauptwort angeben.";
        60: "Du kannst kein Hauptwort angeben.";
        61: "Du mu@31t den Namen eines Objekts angeben.";
        62: "Hier kannst @20 keinen Namen eines Objekts angeben.";
        63: "Du mu@31t noch ein zweites Objekt angeben.";
        64: "Hier kannst @20 kein zweites Objekt angeben.";
        65: "Du mu@31t ein zweites Hauptwort angeben.";
        66: "Du kannst hier kein zweites Hauptwort angeben.";
        67: "Versuch es mit etwas, das mehr Substanz hat.";
        68: print "(", (GDer) actor, " "; plur("nehmen", "nimmt", actor);
            print " zuerst ", (den) x1, ".)^";
        69: "(Dazu hebst @20 ", (den) x1, " erst auf.)";
        70: "Die Verwendung von UNDO ist in diesem Spiel nicht erlaubt.";
        71: print (string) DARKNESS__TX;
        72: print_ret (GDer) x1, " ", (hat) x1, " Besseres zu tun.";
        73: "Dieses Hauptwort macht in diesem Zusammenhang keinen Sinn.";
        74: print "[", (GDer) x1, " kann keine ans Spiel gerichteten Anweisungen
            ausführen.]^";
        75: print " Ende ";
        76: print " oder ";
        97: print "willst @20";
        98: print "Ich verstehe das Wort ~", (PrintOriginal) wn,
                "~ in diesem Zusammenhang nicht."; rtrue;
        99: print "Ich kenne das Wort ~", (PrintOriginal) wn, "~ nicht."; rtrue;
    }
  No, Yes:  "Das war eine rhetorische Frage.";
  NotifyOff:
            "Meldungen bei Änderung des Punktestands aus.";
  NotifyOn: "Meldungen bei Änderung des Punktestands ein.";
  Open: switch (n) {
        1:  "Du kannst ", (den) x1, " nicht öffnen.";
        2:  print_ret (GDer) x1, " ", (ist) x1, " offenbar abgeschlossen.";
        3:  print_ret (GDer) x1, " ", (ist) x1, " bereits offen.";
        4:  print "Du öffnest ", (den) x1, " und findest ";
            if (WriteListFromCase(child(x1), ENGLISH_BIT
                + TERSE_BIT + CONCEAL_BIT, Akk) ~= 0) " darin.";
            "nichts.";
        5:  "Du öffnest ", (den) x1, ".";
        6:  print (GDer) actor, " öffn", (___et) actor, " ", (den) x1, ".^";
        7:  print (GDer) x1, " öffn", (___et) x1, " sich.^";
    }
  Pronouns: switch (n) {
        1:  print "Die Pronomen beziehen sich im Moment auf Folgendes:^";
        2:  print ": ";
        3:  print ": nicht gesetzt";
        4:  "Dieses Spiel kennt keine Pronomen. (Schade!)";
        5:  ".";
    }
  Pull,Push,Turn: switch (n) {
        1:  print_ret (GDer) x1, " ", (ist) x1, " fest.";
        2:  "Du bist nicht dazu in der Lage.";
        3:  "Nichts passiert.";
        4:  "Das wäre sehr unhöflich.";
        5:  print (GDer) actor, " zieh", (___t) actor, " ", (den) x1, ".^";
        6:  print (GDer) actor, " schieb", (___t) actor, " ", (den) x1, ".^";
        7:  print (GDer) actor, " dreh", (___t) " ", (den) x1, ".^";
    }
! Push: see Pull
  PushDir: switch (n) {
        1:  print_ret (GDen) x1, " kannst @20 nicht von einem Ort zum
            anderen schieben.";
        2:  "Das ist keine Richtung.";
        3:  "Nein, in diese Richtung geht das nicht.";
    }
  PutOn: switch (n) {
        1:  "Du mu@31t ", (den) x1, " in der Hand halten, um ", (ihn) x1,
            " auf etwas anderem ablegen zu können.";
        2:  "Du kannst nichts auf sich selbst ablegen.";
        3:  "Dinge auf ", (den) x1, " zu tun bringt vermutlich nichts.";
        4:  "Dir fehlt die nötige Geschicklichkeit.";
        5:  print "(Du ziehst ", (den) x1, " erst aus)^"; say__p = 0; return;
        6:  "Es ist kein Platz mehr auf ", (dem) x1, ".";
        7:  "In Ordnung.";
        8:  print "Du ";
            switch (verb_word) {
	            'setz':  print "setzt";
	            'stell': print "stellst";
	            default: print "legst";
            }
            print_ret " ", (den) x1, " auf ", (den) second, ".";
        9:  print (GDer) actor, " leg", (___t) actor, " ", (den) x1,
                " auf ", (den) second, ".^";
    }
  Quit: switch (n) {
        1:  print "Bitte antworte mit Ja oder Nein. ";
        2:  print "Möchtest @20 das Spiel wirklich beenden? ";
    }
  Remove: switch (n) {
        1:  print_ret (GDer) second, " ", (ist) second, " leider geschlossen.";
        2:  "Aber ", (der) x1, " ", (ist) x1, " gar nicht ", (auf) second, " ",
            (dem) second, ".";
        3:  "In Ordnung.";
    }
  Restart: switch (n) {
        1:  print "Möchtest @20 wirklich neu starten? ";
        2:  "Fehlgeschlagen.";
    }
  Restore: switch (n) {
        1:  "Laden des Spielstands fehlgeschlagen.";
        2:  "In Ordnung.";
    }
  Rub:      "Du erreichst dadurch nichts.";
  Save: switch (n) {
        1:  "Der Spielstand konnte nicht abgespeichert werden.";
        2:  "In Ordnung.";
    }
  Score: switch (n) {
        1:  if (deadflag) print "In diesem Spiel "; else print "Bislang ";
            print "hast @20 ", score, " von ", MAX_SCORE, " möglichen Punkten in ",
            turns; if (turns ~= 1) print " Zügen"; else print " Zug";
            print " erreicht";
        2:  "In diesem Spiel gibt es keine Punkte.";
        3:  print ", mit dem Rang ";
    }
  ScriptOff: switch (n) {
        1:  "Es wird gar kein Protokoll mitgeschrieben.";
        2:  "^Ende des Protokolls.";
        3:  "Der Versuch, das Protokoll zu schlie@30en, scheiterte.";
    }
  ScriptOn: switch (n) {
        1:  "Es wird bereits ein Protokoll mitgeschrieben.";
        2:  "Es wird nun ein Protokoll angelegt von";
        3:  "Der Versuch, ein Protokoll anzulegen, scheiterte.";
    }
  Search: switch (n) {
        1:  "Aber es ist dunkel.";
        2:  "Auf ", (dem) x1, " ist nichts.";
        3:  print "Auf ", (dem) x1, " siehst @20 ";
            WriteListFromCase(child(x1),
                ENGLISH_BIT + TERSE_BIT + CONCEAL_BIT, Akk);
            ".";
        4:  "Du findest nichts Interessantes.";
        5:  "Du kannst nicht hineinschauen, ", (der) x1, " ", (ist) x1,
            " geschlossen.";
        6:  print_ret (GDer) x1, " ", (ist) x1, " leer.";
        7:  print "In ", (dem) x1, " siehst @20 ";
            WriteListFromCase(child(x1), ENGLISH_BIT + TERSE_BIT + CONCEAL_BIT, Akk);
            ".";
        8:  print (GDer) actor, " durchsuch", (___t) actor, " ", (den) x1, ".^";
    }
  SetTo:    "Du kannst ", (den) x1, " nicht auf irgendetwas einstellen.";
  Show: switch (n) {
        1:  "Aber @20 hast ", (den) x1, " gar nicht.";
        2:  print_ret (GDer) x1, " ", (ist) x1, " nicht beeindruckt.";
    }
  Sing:     "Du singst. Nicht sehr schön.";
  Sleep:    "Du fühlst @22 nicht müde.";
  Smell:    "Du riechst nichts Unerwartetes.";
  Sorry:    "Schwamm drüber.";
  Squeeze: switch (n) {
        1:  "La@31 @24 Hände bei @21.";
        2:  "Das bringt nichts.";
        3:  print (GDer) actor, " quetsch", (___t) actor, " ", (den) x1, ".^";
    }
  Strong:   "Das stand so aber nicht in der Musterlösung.";
  Swing:    "Dort gibt es nichts zu schaukeln.";
  SwitchOff: switch (n) {
        1:  "Du kannst ", (den) x1, " nicht ausschalten.";
        2:  print_ret (GDer) x1, " ", (ist) x1, " bereits aus.";
        3:  "Du schaltest ", (den) x1, " aus.";
        4:  print (GDer) actor, " schalt", (___et) actor, " ", (den) x1, " aus.^";
    }
  SwitchOn: switch (n) {
        1:  "Du kannst ", (den) x1, " nicht einschalten.";
        2:  print_ret (GDer) x1, " ", (ist) x1, " bereits an.";
        3:  "Du schaltest ", (den) x1, " an.";
        4:  print (GDer) actor, " schalt", (___et) actor, " ", (den) x1, " an.^";
    }
  Take: switch (n) {
        1:  "In Ordnung.";
        2:  "Immer diese Selbstversessenheit.";
        3:  "Das würde ", (dem) x1, " bestimmt nicht gefallen.";
        4:  print "Dazu mü@31test @20 zunächst ", (von) x1, " ",
                (dem) x1; if (x1 has supporter) " herunter."; " heraus.";
        5:  "Du hast ", (den) x1, " bereits.";
        6:  print_ret (GDer) noun, " gehör", (___t) noun, " offenbar zu ",
                (dem) x1, ".";
        7:  print (GDer) noun, " ", (ist) noun, " offenbar ein Teil ";
            if (x1 has proper) print "von ", (dem) x1;
            else print (des) x1; ".";
        8:  print_ret (GDen) x1, " gibt es hier nicht.";
        9:  print_ret (GDer) x1, " ", (ist) x1, " nicht offen.";
        10: print_ret (GDen) x1, " kannst @20 nicht mitnehmen.";
        11: print_ret (GDer) x1, " ", (ist) x1, " fest.";
        12: "Du trägst bereits zu viele Dinge.";
        13: print "(Du verstaust ", (den) x1, " in ", (dem) x2,
            " um Platz zu schaffen.)^"; say__p = 0; return;
        14: "Du kannst nicht in ", (den) x1, " hineingreifen.";
        15: "Du kannst ", (den) x1, " nicht tragen.";
        16: print (GDer) actor, " "; plur("nehmen", "nimmt", actor);
            print " ", (den) x1, ".^";
    }
  Taste:    "Du schmeckst nichts Unerwartetes.";
  Tell: switch (n) {
        1:  "Du unterhältst @22 ein wenig und erzählst @21 alte Geschichten.";
        2:  "Keine Antwort.";
    }
  Think:    "Gute Idee!";
  ThrowAt: switch (n) {
        1:  "Witzlos.";
        2:  "Im kritischen Augenblick fehlen @21 die Nerven dazu.";
    }
  Tie:  "Dadurch würdest @20 nichts erreichen.";
  Touch: switch (n) {
        1:  "La@31 @24 Hände bei @21!";
        2:  "Du fühlst nichts Unerwartetes.";
        3:  "Wenn @20 meinst.";
        4:  print (GDer) actor, " berühr", (___t) actor, " sich selbst.^";
        5:  print (GDer) actor, " berühr", (___t) actor, " @22.^";
        6:  print (GDer) actor, " berühr", (___t) actor, " ", (den) x1, ".^";
    }
! Turn: see Pull.
  Undress: switch (n) {
        1:  "Du lä@31t ", (den) x1, " besser wie ", (er) x1, " ", (ist) x1, ".";
        2:  "Besser nicht.";
        3:  print (GDer) actor, " möchte";
            if (actor has pluralname) print "n";
            print " gerne bleiben wie ", (er) actor, " ist.^";
        4:  print (GDer) actor, " möcht", (___e) actor, " ",
                (den) x1, " nicht ausziehen.^";
    }
  Unlock:  switch (n) {
        1:  "Du kannst ", (den) x1, " nicht aufschlie@30en.";
        2:  print_ret (GDer) x1, " ", (ist) x1, " bereits aufgeschlossen.";
        3:  print_ret (GDer) x1, " pa@31", (___t) x1, " nicht.";
        4:  "Du schlie@30t ", (den) x1, " auf.";
        5:  print (GDer) actor, " schlie@30", (___t) actor, " ", (den) x1, " auf.^";
    }
  Verify: switch (n) {
        1:  "Die Spieldatei ist intakt.";
        2:  "Die Spieldatei ist korrupt.";
    }
  Wait: switch (n) {
    1:  "Die Zeit verstreicht.";
    2:  print (GDer) actor, " wart", (___et) actor, ".^";
    }
  Wake:     "Die bittere Wahrheit ist: Dies ist kein Traum.";
  WakeOther:"Das ist unnötig.";
  Wave: switch (n) {
    1:  "Du hast ", (den) x1, " gar nicht.";
    2:  "Es sieht blöd aus, wie @20 mit ", (dem) x1, " wedelst.";
    3:  print (GDer) actor, " wink", (___t) actor, " mit ", (dem) x1, ".^";
    }
  WaveHands: "Du winkst und fühlst @22 dabei etwas komisch.";
  Wear: switch (n) {
    1:  "Du kannst ", (den) x1, " nicht anziehen!";
    2:  "Du hast ", (den) x1, " gar nicht!";
    3:  "Du trägst ", (den) x1, " bereits!";
    4:  "Du ziehst ", (den) x1, " an.";
    5:  print (GDer) actor, " zieh", (___t) actor, " ", (den) x1, " an.^";
    }
! Yes:  see No.
];
-) instead of "Long Texts" in "Language.i6t".


Section - Parser

Include (-
[ Keyboard  a_buffer a_table  nw i w w2 x1 x2;
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
        if (is_oops_word(w)) {
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

        if ((is_undo_word(w)) && (nw==1)) {
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
];
-) instead of "Reading the Command" in "Parser.i6t".

Include (-
[ NounWord i j s;
    i = NextWord();
    if (i == 0) rfalse;
    if (is_me_word(i)) return 1;
    s = LanguagePronouns-->0;
    for (j=1 : j<=s : j=j+3)
        if (i == LanguagePronouns-->j)
            return j+2;
    if ((i->#dict_par1)&128 == 0) rfalse;
    return i;
];
-) instead of "NounWord" in "Parser.i6t".

Include (-
![ GetGender person;
    !!if (person hasnt female) rtrue;
    !!rfalse;
    !return Gender(person);
!];

[ GetGNAOfObject obj case gender;
    if (obj hasnt animate) case = 6;
    if (obj has male) gender = male;
        else if (obj has female) gender = female;
                 else if (obj has neuter) gender = neuter;
    if (gender == 0) {
        if (case == 0) gender = LanguageAnimateGender;
        else gender = LanguageInanimateGender;
    }
    if (gender == female)   case = case + 1;
    if (gender == neuter)   case = case + 2;
    if (obj has pluralname) case = case + 3;
    return case;
];
-) instead of "Gender" in "Parser.i6t".

Include (-
[ SetPronoun dword value x;
    for (x=1 : x<=LanguagePronouns-->0 : x=x+3)
        if (LanguagePronouns-->x == dword) {
            LanguagePronouns-->(x+2) = value; return;
        }
    RunTimeError(14);
];

[ PronounValue dword   x obj mask;
    for (x=1 : x<=LanguagePronouns-->0 : x=x+3)
        if (LanguagePronouns-->x == dword) {
            mask = LanguagePronouns-->(x+1);
            obj = LanguagePronouns-->(x+2);
            if (obj && obj ~= NULL) {
                if (mask & $$100000) GenderNotice(obj, male);
                if (mask & $$010000) GenderNotice(obj, female);
                if (mask & $$001000) GenderNotice(obj, neuter);
                if (mask & $$000111) GenderNotice(obj, pluralname);
            }
            return obj;
        }
    return 0;
];

[ ResetVagueWords obj; PronounNotice(obj); ];

[ GetGNAOfAttribute attr;
    if (attr == male)       return 0;
    if (attr == female)     return 1;
    if (attr == neuter)     return 2;
    return 3;
];

[ PronounNotice obj x bm;
    if (obj == player) return;

    ! Hier den changing_gender in einem Aufwasch miterledigen.

    bm = GenderChanged(obj);

    if (bm) {
        bm = PowersOfTwo_TB-->(GetGNAOfAttribute(bm));

        for (x=1 : x<=LanguagePronouns-->0 : x=x+3)
            if (bm & (LanguagePronouns-->(x+1)) ~= 0)
                LanguagePronouns-->(x+2) = obj;
    }

    bm = PowersOfTwo_TB-->(GetGNAOfObject(obj));

    for (x=1 : x<=LanguagePronouns-->0 : x=x+3)
        if (bm & (LanguagePronouns-->(x+1)) ~= 0)
            LanguagePronouns-->(x+2) = obj;
];

[ PronounNoticeHeldObjects x;
#IFNDEF MANUAL_PRONOUNS;
    objectloop(x in player) PronounNotice(x);
#ENDIF;
    x = 0; ! To prevent a "not used" error
    rfalse;
];
-) instead of "Pronoun Handling" in "Parser.i6t".

Include (-
[ I7_ExtendedTryNumber wordnum i j;
    i = wn; wn = wordnum; j = NextWordStopped(); wn = i;
    switch (j) {
        'einundzwanzig': return 21;
        'zweiundzwanzig': return 22;
        'dreiundzwanzig': return 23;
        'vierundzwanzig': return 24;
        'fuenfundzwanzig': return 25;
        'sechsundzwanzig': return 26;
        'siebenundzwanzig': return 27;
        'achtundzwanzig': return 28;
        'neunundzwanzig': return 29;
        'dreissig': return 30;
        default: return TryNumber(wordnum);
    }
];
-) instead of "Extended TryNumber" in "Parser.i6t".

Include (-
[ Refers obj wnum   wd k m;
    if (obj == 0) rfalse;

    if (wnum > max_wn) max_wn = wnum;

    #Ifdef LanguageRefers;
    k = LanguageRefers(obj,wnum); if (k >= 0) return k;
    #Endif; ! LanguageRefers

    k = wn; wn = wnum; wd = NextWordStopped(); wn = k;

    if (parser_inflection >= 256) {
        k = indirect(parser_inflection, obj, wd);
        if (k >= 0) return k;
        m = -k;
    }
    else
        m = parser_inflection;

    if (WordInProperty(wd, obj, m)) rtrue;
    rfalse;
];

[ WordInProperty wd obj prop k l m;
    k = obj.&prop; l = (obj.#prop)/WORDSIZE-1;
    for (m=0 : m<=l : m++)
        if (wd == k-->m) rtrue;
    rfalse;
];

[ WordMatch s exact reverse    sl wl sa wa;
    ! Prüft, ob das Wort wn mit dem String s übereinstimmt wenn es
    ! ein Treffer ist, wird wn weiterbewegt, ansonsten bleibt wn stehen.
    ! So kann man diese Routine mehrmals hintereinander, durch ||
    ! verknüpft, aufrufen. (Wenn die linke Seite von || wahr ist, wird
    ! die rechte nicht mehr ausgeführt. Mit exact==true kann man die
    ! genaue Wortlänge erzwingen, ansonsten wird nur so auf s geprüft.
    ! Wordmatch("die") erkennt also "Dieselkraftstoff"

    if (wn > num_words) rfalse;

    #ifdef TARGET_ZCODE;
    if (standard_interpreter ~= 0) {
        StorageForShortName-->0 = 40;
        @output_stream 3 StorageForShortName;
        print (string) s;
        @output_stream -3;
        sa = StorageForShortName + WORDSIZE;
        sl = StorageForShortName-->0;
    }
    #ifnot;
    sl = Glulx_PrintAnyToArray(StorageForShortName, 40, s);
    sa = StorageForShortName;
    #endif;

    wl = WordLength(wn);
    wa = WordAddress(wn);
    if (reverse) wa = wa + reverse - sl;
    if (wl < sl) rfalse;
    if (exact && wl ~= sl) rfalse;
    wl = sl;
    while (sl-- ) if ((sa++)->0 ~= (wa++)->0) rfalse;
    wn++; return wl;
];

#Ifdef TARGET_ZCODE;

[ DictionaryLookup b l i;
    for (i=0 : i<l : i++) buffer2->(2+i) = b->i;
    buffer2->1 = l;
    VM_Tokenise(buffer2,parse2);
    return parse2-->1;
];

#Ifnot; ! TARGET_GLULX

[ DictionaryLookup b l i;
    for (i=0 : i<l : i++) buffer2->(WORDSIZE+i) = b->i;
    buffer2-->0 = l;
    VM_Tokenise(buffer2,parse2);
    return parse2-->1;
];

#Endif; ! TARGET_

-) instead of "Refers" in "Parser.i6t".

[ *** Die Variable number_matched muss vor |LanguageVerbMayBeName()|
      definiert werden.]

Include (-
Array  match_list --> MATCH_LIST_WORDS;    ! An array of matched objects so far
Array  match_classes --> MATCH_LIST_WORDS; ! An array of equivalence classes for them
Array  match_scores --> MATCH_LIST_WORDS;  ! An array of match scores for them

! *** number_matched wird direkt VOR |LanguageVerbMayBeName()| deklariert
!Global number_matched;              ! How many items in it?  (0 means none)

Global number_of_classes;           ! How many equivalence classes?
Global match_length;                ! How many words long are these matches?
Global match_from;                  ! At what word of the input do they begin?
-) instead of "Match List Variables" in "Parser.i6t".


Include (-
[ NounDomain domain1 domain2 context    first_word i j k l
                                        answer_words marker;
    #Ifdef DEBUG;
    if (parser_trace >= 4) {
        print "   [NounDomain called at word ", wn, "^";
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
            if (is_and_word(i)==false && is_but_word(i)==false &&
                i ~=  comma_word or THEN1__WD or THEN2__WD or THEN3__WD) {
                if (lookahead == ENDIT_TOKEN) rfalse;
            }
        }
    }

    ! Now look for a good choice, if there's more than one choice...

    number_of_classes = 0;

    if (number_matched == 1) i = match_list-->0;
    if (number_matched > 1) {
	    i = true;
	    !if (number_matched > 1)
	    for (j=0 : j<number_matched-1 : j++)
			if (Identical(match_list-->j, match_list-->(j+1)) == false)
				i = false;
		if (i) dont_infer = true;
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
        if (dont_infer) return i;
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

    ! *** Wenn alle infrage kommenden Objekte belebt sind, lautet die
    !     Nachfrage des Parsers jetzt konsequenterweise "Wen meinst du, ..."
    !     und nicht "Was meinst du, ...". Danke an Christoph Winkler fürs
    !     Aufspüren und an Martin Oehm fürs Korrigieren dieser Ungereimtheit.
    !     Seit I7 Build 6E59 ist diese Lösung auch im Original enthalten.

    j = 1; marker = 0;
    for (i=1 : i<=number_of_classes : i++) {
        while (((match_classes-->marker) ~= i)
            && ((match_classes-->marker) ~= -i)) marker++;
        if (match_list-->marker hasnt animate) j = 0;
    }

    if (j) L__M(##Miscellany, 45); else L__M(##Miscellany, 46);

    ! if (context==CREATURE_TOKEN) L__M(##Miscellany, 45);
    ! else                         L__M(##Miscellany, 46);

    j = number_of_classes; marker = 0;
    for (i=1 : i<=number_of_classes : i++) {
        while (((match_classes-->marker) ~= i) && ((match_classes-->marker) ~= -i)) marker++;
        k = match_list-->marker;

        if (match_classes-->marker > 0) print (den) k; else print (einen) k;

        if (i < j-1)  print (string) COMMA__TX;
        if (i == j-1) print (string) OR__TX;
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

    if (is_all_word(first_word)) {
        if (context == MULTI_TOKEN or MULTIHELD_TOKEN or MULTIEXCEPT_TOKEN or MULTIINSIDE_TOKEN) {
            l = multiple_object-->0;
            for (i=0 : i<number_matched && l+i<MATCH_LIST_WORDS : i++) {
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
    for (j=buffer + buffer->0 - 1 : j>=buffer+k+l : j-- ) j->0 = 0->(j-l);
    for (i=0 : i<l : i++) buffer->(k+i) = buffer2->(2+i);
    buffer->(k+l-1) = ' ';
    buffer->1 = buffer->1 + l;
    if (buffer->1 >= (buffer->0 - 1)) buffer->1 = buffer->0;
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

]; ! end of NounDomain
-) instead of "Noun Domain" in "Parser.i6t".


Include (-
[ ParseTokenStopped x y;
    ! *** Damit das Gender-Token für den Changing Gender auch nach dem letzten
    !     Wort noch gelesen werden kann, muss hier zunächst geprüft werden,
    !     ob y ein solches Token ist (Änderung vorgeschlagen von Martin Oehm).
    if (y == CG_NEUTER_TOKEN or CG_FEMALE_TOKEN or CG_MALE_TOKEN or CG_PLURAL_TOKEN) {
        return ParseToken(x,y);
    }
    if (wn>WordCount()) return GPR_FAIL;
    return ParseToken(x,y);
];

Global parsetoken_nesting = 0;
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
];

[ ParseToken__ given_ttype given_tdata token_n token
    l o i j k and_parity single_object desc_wn many_flag
    token_allows_multiple prev_indef_wanted;

-) instead of "Parse Token" in "Parser.i6t".

Include (-

    ! Parse Token Letter A

    token_filter = 0;
    parser_inflection = name;

    switch (given_ttype) {
      ELEMENTARY_TT:
        switch (given_tdata) {
          SPECIAL_TOKEN:
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
            ! *** Wenn der Topic-Text mit einem oder mehreren Artikeln
            !     beginnt, werden diese überlesen
            Descriptors();
            consult_from = wn;
            if ((line_ttype-->(token_n+1) ~= PREPOSITION_TT) &&
               (line_token-->(token_n+1) ~= ENDIT_TOKEN))
                RunTimeError(13);
            do o = NextWordStopped();
            until (o == -1 || PrepositionChain(o, token_n+1) ~= -1);
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
        if (PrepositionChain(o, token_n) ~= -1) return GPR_PREPOSITION;
        return -1;

      GPR_TT:
        l = indirect(given_tdata);
        #Ifdef DEBUG;
        if (parser_trace >= 3) print "  [Outside parsing routine returned ", l, "]^";
        #Endif; ! DEBUG
        return l;

      SCOPE_TT:
        scope_token = given_tdata;
        scope_stage = 1;
        #Ifdef DEBUG;
        if (parser_trace >= 3) print "  [Scope routine called at stage 1]^";
        #Endif; ! DEBUG
        l = indirect(scope_token);
        #Ifdef DEBUG;
        if (parser_trace >= 3) print "  [Scope routine returned multiple-flag of ", l, "]^";
        #Endif; ! DEBUG
        if (l == 1) given_tdata = MULTI_TOKEN; else given_tdata = NOUN_TOKEN;

      ATTR_FILTER_TT:
        token_filter = 1 + given_tdata;
        given_tdata = NOUN_TOKEN;

      ROUTINE_FILTER_TT:
        token_filter = given_tdata;
        given_tdata = NOUN_TOKEN;

    } ! end of switch(given_ttype)

    token = given_tdata;

-) instead of "Parse Token Letter A" in "Parser.i6t".


[ PARSE TOKEN LETTER C. ]
[ MEx__WDs durch |is_me_word()| ersetzen, damit alle deutschen
  Me-Wörter benutzt werden können ]

Include (-
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
                if (o == LanguageDescriptors-->l) jump AssumeDescriptor;
            pronoun__word = pronoun_word; pronoun__obj = pronoun_obj;
            etype = VAGUE_PE;
            if (parser_trace >= 3) print "  [Stop: unset pronoun]^";
            return GPR_FAIL;
        }
    }

  .AssumeDescriptor;

    if (is_me_word(o)) { pronoun_word = o; pronoun_obj = player; }

    allow_plurals = true; desc_wn = wn;

  .TryAgain;

    ! First, we parse any descriptive words (like "the", "five" or "every"):
    l = Descriptors(token_allows_multiple);
    if (l ~= 0) { etype = l; return 0; }

  .TryAgain2;
-) instead of "Parse Token Letter C" in "Parser.i6t".

[ Parser Letter A ]
Include (-
if (held_back_mode == 1) {
        held_back_mode = 0;
        VM_Tokenise(buffer, parse);
        jump ReParse;
    }

  .ReType;

    cobj_flag = 0;
    BeginActivity(READING_A_COMMAND_ACT); if (ForActivity(READING_A_COMMAND_ACT)==false) {
        Keyboard(buffer,parse);
        players_command = 100 + WordCount();
        num_words = WordCount();
    } if (EndActivity(READING_A_COMMAND_ACT)) jump ReType;

  .ReParse;

    parser_inflection = name;

    ! Initially assume the command is aimed at the player, and the verb
    ! is the first word

    num_words = WordCount();
    wn = 1;

    max_wn = -1; ! *** max_wn schon hier initialisieren (siehe Parser Letter E)
    pronominal_adverb_flag = false;

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

    !if (verb_word == AGAIN2__WD or AGAIN3__WD) verb_word = AGAIN1__WD;
    !if (verb_word == AGAIN1__WD) {
    if (is_again_word(verb_word)) {
        if (actor ~= player) {
            L__M(##Miscellany, 20);
            jump ReType;
        }
        #Ifdef TARGET_ZCODE;
        if (buffer3->1 == 0) {
            L__M(##Miscellany, 21);
            jump ReType;
        }
        #Ifnot; ! TARGET_GLULX
        if (buffer3-->0 == 0) {
            L__M(##Miscellany, 21);
            jump ReType;
        }
        #Endif; ! TARGET_
        for (i=0 : i<INPUT_BUFFER_LEN : i++) buffer->i = buffer3->i;
        VM_Tokenise(buffer,parse);
        num_words = WordCount();
        players_command = 100 + WordCount();
        jump ReParse;
    }

    ! Save the present input in case of an "again" next time

    if (~~(is_again_word(verb_word)))
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
-) instead of "Parser Letter A" in "Parser.i6t".


Include (-

    ! Parser Letter B

    #Ifdef LanguageIsVerb;
    if (verb_word == 0) {
        i = wn; verb_word = LanguageIsVerb(buffer, parse, verb_wordnum);
        wn = i;
    }
    #Endif; ! LanguageIsVerb


    ! Schauen, ob man 'ich (will|moechte)' abschneiden kann

    if (verb_word == 0 || ((verb_word->#dict_par1) & 1) == 0) {
        verb_word = CheckIWantTo(); wn = verb_wordnum;
        if (verb_word == -1) {
            L__M(##Miscellany, 10);
            jump ReType;
        }
    }

    ! Bevor geschaut wird, ob eine Richtung gemeint sein kann, wird hier
    ! geprüft, ob das letzte Wort ein Infinitiv sein kann.
    
    ! *** (14.10.2010) Verben wurden bislang für den Infinitiv-Test
    !     übergangen, wenn sie gleichzeitig Synonyme für Objekte waren.
    !     (z.B. 'lade' oder 'pumpe'). Infinitve dieser Verben wurden nicht
    !     verstanden.

    !     In IsCollisionCandidate() wird jetzt geprüft, ob es sich um ein
    !     solches Verb handelt, wobei einige Standard-Wörter und die Tabelle
    !      "Table of verb-noun collisions", in die der Autor eigene Verb-Synonym-
    !     Kollisionen eintragen kann, herangezogen werden. Ist das Verb als
    !     Kollisionskandidat erkannt, wird es zur Infinitivprüfung zugelassen.
    
    if (verb_word == 0 || ((verb_word->#dict_par1) & 1) == 0
       || IsCollisionCandidate(verb_word)) {
        i = wn; verb_word = CheckInfinitiveClause(); wn = i;
    }

    ! If the first word is not listed as a verb, it must be a direction
    ! or the name of someone to talk to

    if (verb_word == 0 || ((verb_word->#dict_par1) & 1) == 0) {

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

-) instead of "Parser Letter B" in "Parser.i6t".

[ Parser Letter C. ]
[ AGAINx__WDs durch |is_again_word()| ersetzt ]

Include (-
        ! Only check for a comma (a "someone, do something" command) if we are
        ! not already in the middle of one.  (This simplification stops us from
        ! worrying about "robot, wizard, you are an idiot", telling the robot to
        ! tell the wizard that she is an idiot.)

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
            L__M(##Miscellany, 22);
            jump ReType;
        }

        ! Use NounDomain (in the context of "animate creature") to see if the
        ! words make sense as the name of someone held or nearby

        wn = 1; lookahead = HELD_TOKEN;
        scope_reason = TALKING_REASON;
        l = NounDomain(player,actors_location,6);
        scope_reason = PARSING_REASON;
        if (l == REPARSE_CODE) jump ReParse;
        if (l == 0) {
            if (verb_word && ((verb_word->#dict_par1) & 1)) jump NotConversation;
            L__M(##Miscellany, 23);
            jump ReType;
        }

      .Conversation2;

        ! The object addressed must at least be "talkable" if not actually "animate"
        ! (the distinction allows, for instance, a microphone to be spoken to,
        ! without the parser thinking that the microphone is human).

        if (l hasnt animate && l hasnt talkable) {
            L__M(##Miscellany, 24, l);
            jump ReType;
        }

        ! Check that there aren't any mystery words between the end of the person's
        ! name and the comma (eg, throw out "dwarf sdfgsdgs, go north").

        if (wn ~= j) {
            if (verb_word && ((verb_word->#dict_par1) & 1)) jump NotConversation;
            L__M(##Miscellany, 25);
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
            !if (NextWordStopped() == AGAIN1__WD or AGAIN2__WD or AGAIN3__WD) {
            if (is_again_word(NextWordStopped())) {
                L__M(##Miscellany, 20);
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


-) instead of "Parser Letter C" in "Parser.i6t".

[ Parser Letter E ]
Include (-

    line_address = syntax + 1;

    for (line=0 : line<=num_lines : line++) {

        for (i=0 : i<32 : i++) {
            line_token-->i = ENDIT_TOKEN;
            line_ttype-->i = ELEMENTARY_TT;
            line_tdata-->i = ENDIT_TOKEN;
        }

        ! Unpack the syntax line from Inform format into three arrays; ensure that
        ! the sequence of tokens ends in an ENDIT_TOKEN.

        line_address = UnpackGrammarLine(line_address);

        #Ifdef DEBUG;
        if (parser_trace >= 1) {
            if (parser_trace >= 2) new_line;
            print "[line ", line; DebugGrammarLine();
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

-) instead of "Parser Letter E" in "Parser.i6t".

[ Parser Letter G ]
Include (-
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
                while ((l >= GPR_NOUN) && (l < -1)) l = ParseToken(ELEMENTARY_TT, l + 256);
                scope_reason = PARSING_REASON;

                if (l == GPR_PREPOSITION) {
                    if (found_ttype~=PREPOSITION_TT && (found_ttype~=ELEMENTARY_TT ||
                        found_tdata~=TOPIC_TOKEN)) params_wanted--;
                    l = true;
                }
                else
                    if (l < 0) l = false;
                    else
                        if (l ~= GPR_REPARSE) {
                            if (l == GPR_NUMBER) {
                                if (nsns == 0) special_number1 = parsed_number;
                                else special_number2 = parsed_number;
                                nsns++; l = 1;
                            }
                            if (l == GPR_MULTIPLE) l = 0;
                            parser_results-->(parameters+INP1_PRES) = l;
                            parameters++;
                            pattern-->pcount = l;
                            l = true;
                        }

                #Ifdef DEBUG;
                if (parser_trace >= 3) {
                    print "  [token resulted in ";
                    if (l == REPARSE_CODE) print "re-parse request]^";
                    if (l == 0) print "failure with error type ", etype, "]^";
                    if (l == 1) print "success]^";
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
                        if (wn - 1 > max_wn) max_wn = wn - 1;
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
-) instead of "Parser Letter G" in "Parser.i6t".

[ Parser Letter I ]
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
        L__M(##Miscellany, 28);
        if (~~ExplicitError(true)) {
            for (m=0 : m<32 : m++) pattern-->m = pattern2-->m;
            pcount = pcount2; PrintCommand(0); L__M(##Miscellany, 56);
        }
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

[ Parser Letter K. ]
[ AGAINx__WDs durch |is_again_word| ersetzt ]

Include (-
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
        !if (i == AGAIN1__WD or AGAIN2__WD or AGAIN3__WD) {
        if (is_again_word(i)) {
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
-) instead of "Parser Letter K" in "Parser.i6t".

Include (-
[ CantSee  i w e;
    saved_oops=oops_from;

    if (scope_token ~= 0) {
        scope_error = scope_token; return ASKSCOPE_PE;
    }

    wn--; if (wn > max_wn) max_wn = wn; w = NextWord();

    e = CANTSEE_PE;

    ! *** Die nächste Zeile wurde geändert,
    !     um bei einem Cantsee-Fehler Folgendes zu vermeiden:
    !
    !     >leg dich in die grmpf ('grmpf' ist eine unbekannte Vokabel)
    !     Du siehst "dich" (dich) hier im Moment nicht.

    !if (w == pronoun_word) {
    if (w == pronoun_word && ~~is_me_word(w)) {
	    w = NextWordStopped(); wn--;
		if ((w == -1) || (line_token-->(pcount) ~= ENDIT_TOKEN)) {
	    	AnalyseToken(line_token-->(pcount-1));
			!DebugToken(pcount-1); print " ", found_ttype, "^";
			if (found_ttype == ROUTINE_FILTER_TT or ATTR_FILTER_TT)
				e = NOTINCONTEXT_PE;
			else {
				pronoun__word = pronoun_word; pronoun__obj = pronoun_obj;
				e = ITGONE_PE;
			}
		}
        pronoun__word = pronoun_word; pronoun__obj = pronoun_obj;
        e = ITGONE_PE;
    }

    if (etype > e) return etype;
    return e;
];
-) instead of "CantSee" in "Parser.i6t".

Include (-

#Ifndef ParseNoun;
! Constant Make__PN;
! #Endif;
! #Ifdef Make__PN;

[ ParseNoun obj; obj = obj; return -1; ];

#Endif;

[ TryGivenObject obj threshold k w j;
    #Ifdef DEBUG;
    if (parser_trace >= 5) print "    Trying ", (the) obj, " (", obj, ") at word ", wn, "^";
    #Endif; ! DEBUG

    dict_flags_of_noun = 0;

!  If input has run out then always match, with only quality 0 (this saves
!  time).

    if (wn > num_words) {
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

    if (obj.parse_name~=0) {
        parser_action = NULL; j=wn;
        k = RunRoutines(obj,parse_name);
        if (k > 0) {
            wn=j+k;

          .MMbyPN;
            if (wn - 1 > max_wn) max_wn = wn - 1;

            if (parser_action == ##PluralFound)
                dict_flags_of_noun = dict_flags_of_noun | 4;

            if (dict_flags_of_noun & 4) {
                if (~~allow_plurals) k = 0;
                else {
                    if (indef_mode == 0) {
                        indef_mode = 1; indef_type = 0; indef_wanted = 0;
                    }
                    indef_type = indef_type | PLURAL_BIT;
                    if (indef_wanted == 0) indef_wanted = INDEF_ALL_WANTED;
                }
            }

            #Ifdef DEBUG;
            if (parser_trace >= 5) print "    Matched (", k, ")-";
            #Endif; ! DEBUG
            MakeMatch(obj,k);
            return k;
        }
        if (k == 0) jump NoWordsMatch;
        wn = j;
    }

    ! The default algorithm is simply to count up how many words pass the
    ! Refers test:

    parser_action = NULL;

    w = NounWord();

    if (w == 1 && player == obj) { k=1; jump MMbyPN; }

    if (w >= 2 && w < 128 && (LanguagePronouns-->w == obj)) { k = 1; jump MMbyPN; }

    j=--wn;
    threshold = ParseNoun();
    #Ifdef DEBUG;
    if (threshold >= 0 && parser_trace >= 5) print "    ParseNoun returned ", threshold, "^";
    #Endif; ! DEBUG
    if (threshold < 0) wn++;
    if (threshold > 0) { k = threshold; jump MMbyPN; }

    if (threshold == 0 || Refers(obj,wn-1) == 0) {
      .NoWordsMatch;
        if (indef_mode ~= 0) {
            k = 0; parser_action = NULL;
            jump MMbyPN;
        }
        rfalse;
    }

    if (threshold < 0) {
        threshold = 1;
        dict_flags_of_noun = (w->#dict_par1) & $$01110100;
        w = NextWord();
        while (Refers(obj, wn-1)) {
            threshold++;
            if (w)
               dict_flags_of_noun = dict_flags_of_noun | ((w->#dict_par1) & $$01110100);
            w = NextWord();
        }
    }

    k = threshold;
    jump MMbyPN;
];
-) instead of "TryGivenObject" in "Parser.i6t".


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
    indef_cases = $$111111111111;
    indef_nspec_at = 0;
    article_word = 0;
    parse_noun_from = wn;
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

-) Instead of "Descriptors" in "Parser.i6t".

Include (-
[ Descriptors  o x flag cto type n;
    ResetDescriptors();
    if (wn > num_words) return 0;

    for (flag=true : flag :) {
        o = NextWordStopped(); flag = false;

       for (x=1 : x<=LanguageDescriptors-->0 : x=x+4)
            if (o == LanguageDescriptors-->x) {
                article_word = o;
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
                        if (indef_owner == NULL) indef_owner = InformParser;
                    }
                }

                if (type == light)  indef_type = indef_type | LIT_BIT;
                if (type == -light) indef_type = indef_type | UNLIT_BIT;
            }

        if (is_other_word(o)) {
            indef_mode = 1; flag = 1;
            indef_type = indef_type | OTHER_BIT;
        }
        if (is_all_word(o)) {
            ! flag = 2: wahrer Wert, jedoch nicht 'true',
            ! damit "nimm alles *vom* Tisch funktioniert

            ! *** indef_wanted wurde bis Build 5Z71 bei ALLES auf 100
            !     gesetzt. Dies wurde nun auf INDEF_ALL_WANTED (32767)
            !     abgeändert.
            indef_mode = 1; flag = 2; indef_wanted = INDEF_ALL_WANTED;

            if (take_all_rule == 1) take_all_rule = 2;
            indef_type = indef_type | PLURAL_BIT;
        }
        if (allow_plurals) {
            !n = TryNumber(wn-1);
            if (NextWordStopped() ~= -1) { wn--; n = TryNumber(wn-1); } else { n=0; wn--; }
            if (n == 1) { indef_mode = 1; flag = 1; }
            if (n > 1) {
                indef_guess_p = 1;
                indef_mode = 1; flag = 1; indef_wanted = n;
                indef_nspec_at = wn-1;
                indef_type = indef_type | PLURAL_BIT;
            }
        }
        if (flag == 1 && (~~is_of_word(NextWordStopped())))
            wn--;  ! Skip 'of' after these
                   ! Allerdings nur, wenn flag genau 1 ist, so dass bei
                   ! "nimm alles von", das "von" *nicht* übersprungen wird.
    }
    wn--;
    return 0;
];

[ SafeSkipDescriptors;
    @push indef_mode; @push indef_type; @push indef_wanted;
    @push indef_guess_p; @push indef_possambig; @push indef_owner;
    @push indef_cases; @push indef_nspec_at;

    Descriptors();

    @pull indef_nspec_at; @pull indef_cases;
    @pull indef_owner; @pull indef_possambig; @pull indef_guess_p;
    @pull indef_wanted; @pull indef_type; @pull indef_mode;
];

-) instead of "Parsing Descriptors" in "Parser.i6t".

Include (-
! ------------------------------------------------------------------------------
!   Die XXX__WDs aus der Original-Lib wurden durch Routinen ersetzt, die ich
!   flexibler finde. Kein Undo? Einfach is_undo_word ersetzen, so dass es immer
!   false zurckgibt. Auch Erweiterungen sind schnell möglich. Ausnahme sind die
!   THEN__WDs, da THEN1__WD oft als Synonym für den Punkt benutzt wird.
! ------------------------------------------------------------------------------

[ Is_again_word w;
    if (w=='nochmal') rtrue;
    if (w=='wieder') rtrue;
    if (w=='nm') rtrue;
    if (w=='wdh') rtrue;
    if (w=='g//') rtrue;
    rfalse;
];

[ Is_oops_word w;
    ! wird vor LTI geparst, Umlaute berücksichtigen
    if (w=='o//' && NumberOfWords()==2 && oops_from) rtrue;
    if (w=='oh') rtrue;
    if (w=='aeh') rtrue;
    if (w=='äh') rtrue;
    if (w=='oops') rtrue;
    if (w=='hoppla') rtrue;
    if (w=='huch') rtrue;
    rfalse;
];

[ Is_undo_word w;
    ! wird vor LTI geparst, Umlaute berücksichtigen
    if (w=='undo') rtrue;
    if (w=='rueckgaengig') rtrue;                  ! 'rueckgaen'
    if (w=='rueckgängig') rtrue;                   ! 'rueckg...'
    if (w=='rückgaengig') rtrue;                   ! 'rckga'
    if (w=='rückgängig') rtrue;                    ! 'rückg...'
    if (w=='zurueck') rtrue;
    if (w=='zurück') rtrue;
    rfalse;
];

[ Is_all_word w;
    if (w=='alles') rtrue;
    if (w=='all') rtrue;
    if (w=='saemtlich') rtrue;
    rfalse;
];

[ Is_but_word w;
    if (w=='ausser') rtrue;
    if (w=='ohne') rtrue;
    rfalse;
];

[ Is_other_word w;
    if (w=='andere') rtrue;
    if (w=='restlich') rtrue;
    if (w=='uebrig') rtrue;
    if (w=='verbleibend') rtrue;
    rfalse;
];

[ Is_me_word w;
    if (w=='ich') rtrue;
    if (w=='mich') rtrue;
    if (w=='mir') rtrue;
    if (actor==player) {
        if (w=='du') rtrue;
        if (w=='dich') rtrue;
        if (w=='dir') rtrue;
    }
    rfalse;
];

[ Is_of_word w;
    if (w=='von') rtrue;
    rfalse;
];

[ Is_and_word w;
    if (w=='und') rtrue;
    if (w=='sowie') rtrue;
    rfalse;
];

[ Is_yes_word w;
    if (w=='j//') rtrue;
    if (w=='ja') rtrue;
    if (w=='jawohl') rtrue;
    if (w=='y//') rtrue;
    rfalse;
];

[ Is_no_word w;
    if (w=='n//') rtrue;
    if (w=='nein') rtrue;
    rfalse;
];
-) after "Parser.i6t".

Include (-
[ BestGuess  earliest its_score best i j;
    earliest = 0; best = -1;
    for (i=0 : i<number_matched : i++ ) {
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

    ! *** Bei identischen Objekten den CG des ersten Objekts
    !     neu setzen, da die Information in CG_buffer möglicherweise
    !     überschrieben wurde (dies geschieht, wenn es mehr als
    !     MAX_CG_STACK/2 identische Objekte gibt).

    for (j = 0 : j < MAX_CG_STACK : j++ ) {
        if ( Identical(i, CG_buffer-->(2*j)) ) {
                 GenderNotice(i, CG_buffer-->(2*j + 1));
                 break;
        }
    }

    match_list-->earliest = -1;
    return i;
];
-) instead of "BestGuess" in "Parser.i6t".

Include (-
[ IsToken p t; ! *** hinzugefügt von CB

    ! *** IsToken() prüft, ob ein GPR-Token an Position p im
    !     Satzmuster vom Token-Typ t ist (GPR = General Parsing Routine).
    
    if (p < 0) rfalse;
    if (line_ttype-->(p) == GPR_TT && line_tdata-->(p) == t) rtrue;
    rfalse;
];

[ GWomit w dative_flag first;
    ! Das schreibt ein Fragewort, das nach einem indirekten Objekt fragt,
    ! wie das namengebende Womit, oder Woraus, Wonach, Worein. Das wird
    ! zusammen mit PrintCommand benutzt: "Woran möchtest du ziehen?"

    print "Wo";

    if (w=='in') {
        if (dative_flag) print "rin";
        else             print "rein";
        rtrue;
    }

    #ifdef TARGET_ZCODE;
    if (standard_interpreter ~= 0) {
        StorageForShortName-->0 = 16;
        @output_stream 3 StorageForShortName;
        print (address) w;
        @output_stream -3;
        first = StorageForShortName->2;
    }
    #ifnot;
    Glulx_PrintAnyToArray(StorageForShortName, 16, w);
    first = StorageForShortName->0;
    #endif;
    if (first == 'a' or 'e' or 'i' or 'o' or 'u') print "r";
    print (address) w;
];

[ PrintWomitCommand      x1 prep;
    x1 = pcount;
    if (pattern-->(pcount - 1) == PATTERN_NULL) pcount--;
        if (pattern-->(pcount - 1) > REPARSE_CODE) {
            ! Wenn das letzte Element eines unvollständigen Satzes eine
            ! Präposition, also eine Vokabel anstatt eines Objekts ist,
            ! dann soll sie als Fragewort ("Womit" usw. ) benutzt werden.
            ! pcount muss nachher wieder zurückgesetzt werden, damit die
            ! Antwort richtig analysiert werden kann.
            
            ! *** In Z-Code werden die Wörter im Satzmuster pattern durch ihre
            !     Record-Nummer repräsentiert und müssen erst einmal in eine
            !     Adresse umgewandelt werden, die an GWomit() übergeben werden
            !     kann.
            
            prep = VM_NumberToDictionaryAddress(pattern-->(pcount-1)-REPARSE_CODE);
            
            ! *** In GWomit() das Dativ-Token berücksichtigen, damit "worin"
            !     und "worein" unterschieden werden können.
            
            GWomit(prep, IsToken(pcount-1, DATIVE_TOKEN)); print " ";
            
            pcount--;
        } else print "Was ";
        if (actor ~= player) print "soll ", (der) actor, " ";
        else { L__M(##Miscellany, 97); print " "; } ! *** "willst du"
        PrintCommand(); print "?^";
        pcount = x1;
];

[ PrintWemCommand x1;
    x1 = pcount;
        if (pattern-->(pcount - 1) == PATTERN_NULL) pcount--;
        if (pattern-->(pcount - 1) > REPARSE_CODE) {
            ! Siehe Erklärung unter PrintWomitCommand.
            ! *** Großbuchstabe am Anfang
            CUmlautAddress(VM_NumberToDictionaryAddress(pattern-->(pcount-1)-REPARSE_CODE));
            print " wem ";
            pcount--;
        } else {
            if (IsToken(pcount-1, DATIVE_TOKEN)) print "Wem ";
            else print "Wen ";
        }
        if (actor ~= player) print "soll ", (der) actor, " ";
        else { L__M(##Miscellany, 97); print " "; }
        PrintCommand(); print "?^";
        pcount = x1;
];

! *** 27.03.2010: In |PrintInferredCommand| wird jetzt das Dativ-Token
!     berücksichtigt und an |PrintCommand| als Flag im zweiten Parameter
!     übergeben.


[ PrintInferredCommand from singleton_noun;
    singleton_noun = FALSE;
    if ((from ~= 0) && (from == pcount-1) &&
        (pattern-->from > 1) && (pattern-->from < REPARSE_CODE))
            singleton_noun = TRUE;

    if (singleton_noun) {
        BeginActivity(CLARIFYING_PARSERS_CHOICE_ACT, pattern-->from);
        if (ForActivity(CLARIFYING_PARSERS_CHOICE_ACT, pattern-->from) == 0) {
	        ! *** zusätzlich noch das Dativ-Flag an |PrintCommand| übergeben
            print "("; PrintCommand(from, IsToken(from-2, DATIVE_TOKEN)); print ")^";
        }
        EndActivity(CLARIFYING_PARSERS_CHOICE_ACT, pattern-->from);
    } else {
        ! *** zusätzlich noch das Dativ-Flag an |PrintCommand| übergeben
        print "("; PrintCommand(from, IsToken(from-2, DATIVE_TOKEN)); print ")^";
    }
];

[ PrintCommand from dative_flag           i k spacing_flag prep_before;
    printing_command = true;
    k = from;                   ! Das Verb wird als Infinitiv hintenangestellt
    if (k==0) k = 1;            ! und muss hier korrigiert werden.
    for ( : k<pcount : k++) {
        i = pattern-->k;
        if (i == PATTERN_NULL) {
            ! Token ohne eingelesenes Wort
            dative_flag = IsToken(k-1, DATIVE_TOKEN);
            continue;
        }
        if (spacing_flag) print (char) ' ';
        if (verb_word == 'no.verb') {
            if (i == 0 or 1) jump TokenPrinted;
        } else {
	        if (i == 0) { print (string) THOSET__TX; jump TokenPrinted; }
            if (i == 1) { print (string) THAT__TX;   jump TokenPrinted; }
        }
        if (i >= REPARSE_CODE) {
	        ! *** hier wird unterschieden zwischen "Platz nehmen" und "aufheben"
            if (IsToken(k-2, SUBSTANTIVE_TOKEN)) {
                print (CUmlautAddress) VM_NumberToDictionaryAddress(i-REPARSE_CODE);
                spacing_flag = true;
                prep_before = false;
            }
            else {
                print (UmlautAddress) VM_NumberToDictionaryAddress(i-REPARSE_CODE);
                spacing_flag = true;
                prep_before = true;
            }
            continue;
        } else {
            if (i ofclass (+ Direction +) && LanguageVerbLikesAdverb(verb_word))
                print "nach ", (LanguageDirection) i;
            else {
                ! *** "mit dem Ding etwas tun":
                !     verb_word ist 'no.verb', wenn für Aktionen gar kein
                !     Verb angegeben wurde, z.B. in
                !     Understand "[something]" as examining.

                if (verb_word == 'no.verb') { dative_flag = 1; print "mit "; }

                if (dative_flag) print (dem) i;
                else print (den) i;
                dative_flag = false;
            }
        }
        .TokenPrinted;
        spacing_flag = true;
        prep_before = false;
    }

    ! *** Hier wird das Dich-Token berücksichtigt, um Infintive für
    !     reflexive Verbformen zu schreiben:
    !     "Worauf willst du dich setzen?"
    if (IsToken(k-2, DICH_TOKEN)) {
        print "@22";
        spacing_flag = true; prep_before = false;
    }
    
    if (from == 0) {
	    if (verb_word == 'no.verb' && i == 0 or 1) spacing_flag = false;
        if (spacing_flag && ~~prep_before) print (char) ' ';
        i = verb_word;
        if (LanguageVerb(i) == 0)
            if (PrintVerb(i) == 0) print (address) i;
        from++;
    }
    printing_command = false;
];

-) instead of "Print Command" in "Parser.i6t".


Section - Output

Include (-

Object Compass "Windrose" has female concealed;

-) instead of "Compass" in "Output.i6t".

Include (-
{-log:Compiling I6 Verb directives}
{-call:Plugins::Parsing::Verbs::compile_all}

#IFTRUE ({-value:no_verb_verb_defined} == 1);
[ UnknownVerb; verb_wordnum = 0; return 'no.verb'; ];
[ PrintVerb v;
    if (v == 'no.verb') { print "etwas tun"; rtrue; }
                          ! *** für "mit dem Ding etwas tun":
                          !     Das vorangehende "mit dem Ding"
                          !     wird in PrintCommand() ausgegeben
    rfalse;
];
#Ifnot;
[ UnknownVerb; rfalse; ]; [ PrintVerb v; rfalse; ];
#ENDIF;
-) instead of "Grammar" in "Output.i6t".


Section - Time

Include (-
[ PrintTimeOfDay t h aop;
    if (t<0) { print "<keine Uhrzeit>"; return; }
    !if (t >= TWELVE_HOURS) { aop = "pm"; t = t - TWELVE_HOURS; } else aop = "am";
    h = t/ONE_HOUR; !if (h==0) h=12;
    print h, ":";
    if (t%ONE_HOUR < 10) print "0"; print t%ONE_HOUR; !, (string) aop;
];
-) instead of "Digital Printing" in "Time.i6t".

Include (-

[ PrintTimeOfDayEnglish t;
    PrintTimeOfDayGerman(t);
];

! *** PrintTimeOfDayGerman von CB

[ PrintDir dir;
    switch (dir) {
     1: print "nach";
    -1: print "vor";
    }
];

[ PrintTimeOfDayGerman t h m dir   x;
    h = (t/ONE_HOUR) % 12; m = t%ONE_HOUR; if (h==0) h=12;
    if (m==0) {
	    if (h==1) print "ein"; else print (number) h;
	    print " Uhr"; return;
	}
    dir = 1;
    if (m > HALF_HOUR) { m = ONE_HOUR-m; h = (h+1)%12; if (h==0) h=12; dir = -1; }
    switch(m) {
        QUARTER_HOUR: print "Viertel"; HALF_HOUR: print "halb";
        25: print "fünf"; ! "fünf vor halb" oder "fünf nach halb"
        default:
            if (m == 1) print "eine";
            else print (number) m;
            if (m%5 ~= 0) {
                if (m == 1) print " Minute"; else print " Minuten";
            }
    }
    print " ";
    if (m == HALF_HOUR) { h++;
        if (h > 12) h = h - 12;
    }
    else {
        if (m == 25) {
            dir = -dir; ! vertausche "vor" und "nach"
            PrintDir(dir); print " ";
            print "halb "; if (dir == -1) h++;
        }
        else { PrintDir(dir); print " "; }
    }
    if (h == 1) print "eins";
    else print (number) h;
];
-) instead of "Analogue Printing" in "Time.i6t".

Include (-
[ IstimeOfDayWord word;
    if (word == 'morgens') rtrue;
    if (word == 'mittags') rtrue;
    if (word == 'nachmittags') rtrue;
    if (word == 'abends') rtrue;
    if (word == 'nachts') rtrue;
    rfalse;
];

[ ConsiderTimeOfDay hour timeofday_word  halb add;
! *** um z.B. "3 uhr nachmittags" sagen zu können
	if (timeofday_word == -1) return hour;
	if (hour > 12) return hour;
	
	switch (timeofday_word) {
		'abends': ! *** Der Abend beginnt um 17:00 Uhr und endet um 0:00 Uhr
		    if (hour >= 5 && hour <= 12) return hour+12; else return hour;
		'nachts': ! *** Die Nacht beginnt um 21:00 Uhr und endet um 0:00 Uhr
			if (hour >= 9 && hour <= 12) return hour+12; else return hour;
	    'nachmittags', 'mittags': ! *** Der Nachmittag dauert von 13 bis 17 Uhr
	    	if (hour >= 1 && hour <=5) return hour+12; else return hour;
	    default: return hour;
    }
];

! *** (Februar 2011) Endlich auch ein deutsches Time-Token ...
    
[ TIME_TOKEN first_word second_word at length flag
	illegal_char offhour hr mn i original_wn
	viertelflag minuteflag timeofday_word;
	original_wn = wn;
{-call:Plugins::Parsing::Tokens::Values::time}
	wn = original_wn;
	first_word = NextWordStopped();
	switch (first_word) {
		'mitternacht':
		    parsed_number = 0; return GPR_NUMBER;
		'mittag', 'mittags':
		    parsed_number = TWELVE_HOURS; return GPR_NUMBER;
	}
	
	! Next try the format 12:02
	at = WordAddress(wn-1); length = WordLength(wn-1);
	for (i=0: i<length: i++) {
		switch (at->i) {
			':': if (flag == false && i>0 && i<length-1) flag = true;
			else illegal_char = true;
			'0', '1', '2', '3', '4', '5', '6', '7', '8', '9': ;
			default: illegal_char = true;
		}
	}
	if (length < 3 || length > 5 || illegal_char) flag = false;
	if (flag) {
		for (i=0: at->i~=':': i++, hr=hr*10) hr = hr + at->i - '0';
		hr = hr/10;
		for (i++: i<length: i++, mn=mn*10) mn = mn + at->i - '0';
		mn = mn/10;
		second_word = NextWordStopped();
		
		! 5:16 (Uhr) abends
		if (second_word == 'uhr')
		    second_word = NextWordStopped();
		if (IstimeOfDayWord(second_word)) {
			hr = ConsiderTimeOfDay(hr, second_word);
			second_word = NextWordStopped();
		}
		
		parsed_number = HoursMinsWordToTime(hr, mn);
		if (parsed_number == -1) return GPR_FAIL;
		if (second_word ~= 'uhr') wn--;
		return GPR_NUMBER;
	}
	
	! Lastly the wordy format
	offhour = -1; viertelflag = 0; minuteflag = false;
	timeofday_word = -1;
	
	if (first_word == 'null') offhour = 0; ! "Null Uhr"
	if (first_word == 'halb') { wn++; viertelflag = 2; }
	if (first_word == 'dreiviertel') { wn++; viertelflag = 3; }
	if (first_word == 'viertel') {
		second_word = NextWordStopped();
		! "Viertel nach acht", "Viertel vor zehn"
		if (second_word == 'vor' or 'nach') {
			offhour = QUARTER_HOUR;
			wn--;
		}
		! "Viertel neun (8:15)"
		else {
			viertelflag = 1;
		}
	}
	if (offhour < 0) offhour = TryNumber(wn-1);
	
	! Vor einem möglichen Abbruch Wortmarker für explizite Fehlermeldungen setzen.
	if (wn - 1 > max_wn) max_wn = wn - 1; 
	
	if (offhour < 0 || offhour >= ONE_HOUR) return GPR_FAIL;

	second_word = NextWordStopped();
	if (second_word == 'uhr') second_word = NextWordStopped();
	
	! "Viertel 8 und 3 Minuten" unterbinden ...
	if (viertelflag == 0) {
		! "sieben Uhr", "sieben Uhr dreißig"
		if (second_word == 'und') second_word = NextWordStopped();
		if (second_word == 'minute' or 'minuten') {
			minuteflag = true;
			second_word = NextWordStopped();
		}
	}
	
	! "zehn Uhr abends und drei Minuten"
	if (IstimeOfDayWord(second_word)) {
		timeofday_word = second_word;
		second_word = NextWordStopped();
		if (second_word == 'und') second_word = NextWordStopped();
	}
	switch (second_word) {
		! "sieben", "halb sieben"
		-1:
		    if (minuteflag) {
			    hr = 0; mn = offhour;
		    }
		    else {
			    if (timeofday_word ~= -1)
			        hr = ConsiderTimeOfDay(offhour, timeofday_word);
			    else hr = offhour;
				if (viertelflag > 0) {
					! viertelflag ist entweder 1 (Viertel), 2 (Halb) oder 3 (Dreiviertel)
					hr--;
					mn = viertelflag*QUARTER_HOUR;
				}
				if (wn - 1 > max_wn) max_wn = wn - 1;
				if (hr > 24) return GPR_FAIL;

			}
			
		! "Viertel vor sieben", "zwanzig nach Mitternacht"
		'vor', 'nach':
			mn = offhour; hr = TryNumber(wn);
			if (hr <= 0) {
				switch (NextWordStopped()) {
					'mittag': hr = 12;
					'mitternacht': hr = 0;
					default:
					    if (wn - 1 > max_wn) max_wn = wn - 1;
					    return GPR_FAIL;
				}
			}
			if (wn - 1 > max_wn) max_wn = wn - 1;
			if (hr >= 25) return GPR_FAIL;
			if (second_word == 'vor') {
				mn = ONE_HOUR-mn; hr--; if (hr<0) hr=23;
				if (offhour == QUARTER_HOUR) viertelflag = true;
			}
			wn++; second_word = NextWordStopped();
			
			if (second_word == 'uhr')
				second_word = NextWordStopped();
			
			! "Viertel vor neun (Uhr) Abends"
			if (IstimeOfDayWord(second_word)) {
				if (viertelflag) hr++;
				hr = ConsiderTimeOfDay(hr, second_word);
				if (viertelflag) hr--;
				second_word = NextWordStopped();
			}
						
		! "six thirty" (diese Form bleibt erhalten)
		default:
			if (timeofday_word ~= -1)
			    hr = ConsiderTimeOfDay(offhour, timeofday_word);
			else hr = offhour;
			mn = TryNumber(--wn); if (wn > max_wn) max_wn = wn;
			if (mn < 0 || mn >= ONE_HOUR) return GPR_FAIL;
			wn++; second_word = NextWordStopped();
	}

	if (second_word == 'uhr' or 'minute' or 'minuten')
		second_word = NextWordStopped();

	! "zwei uhr drei Minuten Nachmittags"
	if (IstimeOfDayWord(second_word)) {
		hr = ConsiderTimeOfDay(hr, second_word);
		second_word = NextWordStopped();
	}
	parsed_number = HoursMinsWordToTime(hr, mn);
    if (wn - 1 > max_wn) max_wn = wn - 1;
	if (parsed_number < 0) return GPR_FAIL;
	if (second_word ~= 'uhr' or 'minute' or 'minuten') wn--;
	return GPR_NUMBER;
];

[ HoursMinsWordToTime hour minute word x;
	if (hour > 24) return -1;
	if (minute >= ONE_HOUR) return -1;
	
	if (hour == 24) hour = 0;
	x = hour*ONE_HOUR + minute; if (hour > 12) return x;
	x = x % TWELVE_HOURS; !if (word == 'pm') x = x + TWELVE_HOURS;
	!if (word ~= 'am' or 'pm' && hour == 12) x = x + TWELVE_HOURS;
	if (hour == 12) x = x + TWELVE_HOURS;
	return x;
];
-) instead of "Understanding" in "Time.i6t".

Include (-
[ RELATIVE_TIME_TOKEN first_word second_word offhour mult mn original_wn;
	original_wn = wn;
	wn = original_wn;
	
	first_word = NextWordStopped(); wn--;
	!if (first_word == 'an' or 'a//') mn=1; else mn=TryNumber(wn);
	mn=TryNumber(wn);
	
    if (mn == -1000) {
		first_word = NextWordStopped();
		if (first_word == 'halb') offhour = HALF_HOUR;
		if (first_word == 'viertel') offhour = QUARTER_HOUR;
		if (offhour > 0) {
			second_word = NextWordStopped();
			!if (second_word == 'of') second_word = NextWordStopped();
			!if (second_word == 'an') second_word = NextWordStopped();
			if (second_word == 'stunde') {
				parsed_number = offhour;
				return GPR_NUMBER;
			}
		}
		return GPR_FAIL;
    }
	wn++;
	
	first_word = NextWordStopped();
	switch (first_word) {
		'minuten', 'minute': mult = 1;
		'stunden', 'stunde': mult = 60;
		default: return GPR_FAIL;
	}
	parsed_number = mn*mult;
	if (mult == 60) {
		mn=TryNumber(wn);
		if (mn ~= -1000) {
			wn++;
			first_word = NextWordStopped();
			if (first_word == 'minuten' or 'minute')
				parsed_number = parsed_number + mn;
			else wn = wn - 2;
		}
	}
	return GPR_NUMBER;
];
-) instead of "Relative Time Token" in "Time.i6t".


Section - Printing

Include (-
[ print_yourself k;
  switch (k) {
      0: print "@20";
      1: print "@26";
      2: print "@21";
      3: print "@22";
  }
  rtrue;
];
-) before "Object Names I" in "Printing.i6t".

Include (-
[ SetLowStrings k g;

!   Endungen für Substantive: @01 bis @04

    if (k==Dat || (g==1 && k~=Nom))
                string 1 "n"; else string 1 "";
    if (k~=Nom) string 2 "en"; else string 2 "";
    if (k==Gen) { string 3 "s"; string 4 "es"; }
    else        { string 3 "";  string 4 ""; }

!   Endungen für Adjektive: @00

    if (indef_mode==0) {
        switch(k*4 + g) {
            1, 2, 3, 14, 15:    string 0 "e";
            default:            string 0 "en";
        }
    } else if (indef_mode==1){
        switch(k*4 + g) {
            0, 2, 12, 14:       string 0 "e";
            1, 4:               string 0 "er";
            3, 15:              string 0 "es";
            default:            string 0 "en";
        }
    } else {
        switch(k*4 + g) {
            0, 2, 12, 14:       string 0 "e";
            1, 4, 6, 10:        string 0 "er";
            3, 15:              string 0 "es";
            9, 11:              string 0 "em";
            default:            string 0 "en";
        }
    }
];

! WriteListFromCase o style case depth                    old_case old_indef;
[ WriteListFromCase o style case depth no_action iter     old_case old_indef;
    !   Das ISARE_BIT ist nur sinnvoll, wenn man die Liste im Nominativ
    !   ausgibt, daher wird die Liste im Nominativ ausgegeben.
    if (case ~= Nom && style & ISARE_BIT) case = Nom;

    old_case = short_name_case; ! Alten Fall merken. (In ListWriteR gab es keine
    short_name_case = case;     ! freien lokalen Var. mehr, um case zu übergeben.)

    old_indef = indef_mode;

    if (style & DEFART_BIT) indef_mode = 0;
    else if (style & NOARTICLE_BIT) indef_mode = -1;
    else indef_mode = 1;

    #ifdef NO_NESTED_LISTS;
    if (~~ignore_append_bit) {
    	if ((style & RECURSE_BIT) && (style & ENGLISH_BIT)) style = style | APPEND_BIT;
	}
    #endif;

    WriteListFrom(o, style, depth, no_action, iter);

    short_name_case = old_case;
    indef_mode = old_indef;
];

#ifdef NO_NESTED_LISTS;
[ WriteSublists first force_line_break   o n ld;
    ! In der Liste gespeicherte Objekte noch abarbeiten.
    while (list_buffer-->0) {
        o = list_buffer-->(list_buffer-->0);
        ld = list_depth-->(list_buffer-->0);

        !*** 1: write the sublists;
        !    2: write the sublists with line break;
        !    3: write the sublists with paragraph break;
        !    4: write the sublists with space;
        !
        !    Innerhalb einer Listenebene wird zwischen den Unterlisten
        !    ein Leerzeichen oder ein Absatz geschrieben, je nachdem, ob
        !    "Use non-nested lists" oder "Use non-nested lists with separate
        !    paragraphs" gewählt wurde.

	    switch (first) {
	        1: print "";
	        2: print "^";
	        3: print "^^";
	        4: print " ";
	        default:
	            if (ld && NO_NESTED_LISTS == 0) print " ";
                else print "^^";
	    }

        (list_buffer-->0)--;
        L__M(##Look, -2, o);
        n++;
    }
    if (force_line_break && n==0) print "^";
    return n;
];
#ifnot;
[ WriteSublists; rfalse; ];
#Endif;

[ PrefaceByArticle o acode pluralise capitalise  g s;
    ! acode ist die von Inform vorgesehene Art des Artikels
    ! 0 "The ", 1 "the ", 2, "a(n) ". Das dieses System in deform
    ! abgeschafft ist, müssen wir uns was anderes überlegen.
    !
    ! capitalise gibt an, ob das Gedruckte groß geschrieben werden
    ! soll. Das wird in deform direkt in GDer() usw. festgelegt,
    ! diese Flagge wird also hier ignoriert.

    if (pluralise) {
        SetLowStrings(short_name_case, 0);
        if (acode < 2) {
            ! Modus ist 0 (best. artikel) und Genus ist auch 0 (Plural)

            s = LanguageArticles-->(short_name_case*4);

            if (capitalise) print (Cap) s;
            else            print (string) s;
            print " ";
        }
        ! *** Die Anzahl wird in PRINTING_A_NUMBER_OF_ACT/
        !     "Rule for printing a number of something"
        !     in |WriteSingleClassGroup| ausgegeben. Dort wird nun
        !     auch über die Großschreibung entschieden.
    } else {
        if (indef_mode >= 0) {
            g = Gender(o);
            s = LanguageArticles-->(indef_mode*16 + short_name_case*4 + g);
            if (s) {
	            if (capitalise) print (Cap) s;
	            else            print (string) s;
	            print " ";
            }
        }
        print (PSN__) o;
    }
    capitalise = 0;
];
-) instead of "Object Names II" in "Printing.i6t".



Include (-
[ IndefArt obj k    i g     art;
    if (obj == 0) return PrintNothing(k);
    i = indef_mode; indef_mode = true;
    g = Gender(obj);
    short_name_case = k;
    SetLowStrings(k, g);
    if (obj has proper) { indef_mode = NULL; print (PSN__) obj; indef_mode = i; return; }

    ! *** Um zu verhindern, dass die Property "article"
    !     doppelt vergeben wird, was zu einem Compiler-Fehler führt,
    !     werden die speziellen unbestimmten Artikel "definite", "yours" und
    !     "no article" in der Property sepecial_article definiert und
    !     nicht wie zuvor ebenfalls in article (in I7 kann eine Eigenschaft
    !     nur von einem einzigen Typ sein).
    !     Der "special indefinite article" dominiert einen möglicherweise
    !     vorhandenen "indefinite article".

    if ((obj provides article) && (obj.article ~= EMPTY_TEXT_VALUE)) art = obj.article;
    if ((obj provides special_article) && (obj.special_article ~= pending))
        art = obj.special_article;

    if (art) {
        if (art == definite) {
            return DefArt(obj, k);
        } else if (art == yours) {

            !*** Die Low-Strings für die Ausgabe des Plurals mit "dein" anpassen.
            !    Flektiert wird wie beim bestimmten Artikel:
            !    "nervige Nachbarn" vs. "deine nervigen Nachbarn"

            if (obj has pluralname) {
                indef_mode = false;
                SetLowStrings(k, g);
            }

            print "@23",
            (string) LanguageSuffixes-->(possessive_suffix_base + 4*k + g),
            " ", (PSN__) obj; indef_mode = i; return;
        } else if (art ~= no_article) {
            PrintOrRun(obj, article, 1); print " ";
        } else {
            indef_mode = -1;
            SetLowStrings(k, g);
        }
        print (PSN__) obj; indef_mode = i; return;
    }
    PrefaceByArticle(obj, 2); indef_mode = i;
];

[ CIndefArt obj k;
    if (obj == 0) return PrintNothing(k, CFIRSTART_BIT);
    RunCapitalised(IndefArt, obj, k);
];

[ DefArt obj k    i g;
    if (obj == 0) return PrintNothing(k);
    i = indef_mode; indef_mode = false;
    g = Gender(obj);
    short_name_case = k;
    SetLowStrings(k, g);
    if ((~~obj ofclass Object) || obj has proper) {
        indef_mode = NULL; print (PSN__) obj; indef_mode = i;
        return;
    }
    PrefaceByArticle(obj, 1); indef_mode = i;
];

[ CDefArt obj k;
    if (obj == 0) return PrintNothing(k, CFIRSTART_BIT);
    RunCapitalised(Defart, obj, k);
];

[ PrintShortName obj i;
    i = indef_mode; indef_mode = NULL;
    PSN__(obj); indef_mode = i;
];

[ WithoutArt obj k mode   i g;
    i = indef_mode;

    ! *** AUFGEBOHRT:
    !     Default ist indef_mode = -1; mode kann dazu verwendet werden,
    !     den bestimmten oder unbestimmten Modus zu setzen
    !     (1: bestimmt, 2: unbestimmt). Damit erhält man
    !     die Form wie mit bestimmtem/unbestimmten Artikel, nur eben ohne
    !     den dazugehörigen Artikel.
    !     Das wird z.B. bei den Say-Phrasen "[<Objekt> bestimmt im <Kasus>]",
    !     "[<Objekt> unbestimmt im <Kasus>]" usw. benutzt.

    indef_mode = mode - 1;

    g = Gender(obj);
    short_name_case = k;
    SetLowStrings(k, g);
    if ((~~obj ofclass Object) || obj has proper) {
        indef_mode = NULL; print (PSN__) obj; indef_mode = i;
        return;
    }
    if (indef_mode >= 0) { print (PSN__) obj; indef_mode = i; return; }
    PrefaceByArticle(obj, 1); indef_mode = i;
];

[ NegativeArt obj k;
    print (string) LanguageArticles-->(neg_article_base + 4*k + Gender(obj)), " ";

    ! *** Hier wird jetzt der Objektname in der
    !     unbestimmten Form (mode 2) mit ausgegeben
    WithoutArt(obj, k, 2);
];

[ PersonalPron obj k;
	SetPreviouslyNamedNoun(obj);
    print (string) PersonalPronouns-->(4*k + Gender(obj, true));
];

[ RunCapitalised a b c    i length;
!   Wie PrintCapitalised, nur für Routinen, so dass die Ausgabe von
!   a(b, c) am Anfang groß geschrieben wird.

    if (~~(a ofclass Routine)) return;
    VM_PrintToBuffer(StorageForShortName, 160, a, b, c);
    StorageForShortName->WORDSIZE = VM_LowerToUpperCase(StorageForShortName->WORDSIZE);
    length = StorageForShortName-->0;
    for (i=WORDSIZE: i<length+WORDSIZE: i++) print (char) StorageForShortName->i;
];
-) instead of "Object Names III" in "Printing.i6t".

Include (-
Global caps_mode = false;

[ STANDARD_NAME_PRINTING_R obj;
    obj = parameter_object;
    if (obj == 0) return PrintNothing();
    switch (metaclass(obj)) {
        Routine:  print "<routine ", obj, ">"; return;
        String:   print "<string ~", (string) obj, "~>"; return;
        nothing:  print "<illegal object number ", obj, ">"; return;
    }
    SetPreviouslyNamedNoun(obj); ! *** obj als "zuvor genanntes Objekt" merken
    if (obj == player) return print_yourself(short_name_case);

    #Ifdef LanguagePrintShortName;
    if (LanguagePrintShortName(obj)) return;
    #Endif; ! LanguagePrintShortName

    if (indef_mode && obj.&short_name_indef ~= 0 &&
        PrintOrRun(obj, short_name_indef, true) ~= 0) return;
    if (caps_mode &&
        obj.&cap_short_name ~= 0 && PrintOrRun(obj, cap_short_name, true) ~= 0) {
        caps_mode = false;
        return;
    }
    if (obj.&short_name ~= 0 && PrintOrRun(obj, short_name, true) ~= 0) return;
    print (object) obj;
];
-) instead of "Standard Name Printing Rule" in "Printing.i6t".

Include (-
! *** Eine deutsche Default-Headline (Original-Code von Martin Oehm)
!     und ein Default-Titel (CB)

Constant GERMAN_HEADLINE "Ein Textadventure";
Constant GERMAN_STORY "Willkommen";

Array HLAuxBuffer1 buffer 128;
Array HLAuxBuffer2 buffer  24;

[ __Print_Headline     l1 l2 i;
    VM_PrintToBuffer(HLAuxBuffer1, 128, Headline);
    VM_PrintToBuffer(HLAuxBuffer2, 24,
        "An Interactive Fiction");

    l1 = HLAuxBuffer1-->0;
    l2 = HLAuxBuffer2-->0;

    if (l1 ~= l2) {
        print (string) Headline;
        return;
    }
    for (i = 0 : i < l1 : i++) {
        if (HLAuxBuffer1->(i + WORDSIZE) ~= HLAuxBuffer2->(i + WORDSIZE)) {
            print (string) Headline;
            return;
        }
    }
    print (string) GERMAN_HEADLINE;
];

[ __Print_Story     l1 l2 i;
    VM_PrintToBuffer(HLAuxBuffer1, 128, Story);
    VM_PrintToBuffer(HLAuxBuffer2, 24, "Welcome");

    l1 = HLAuxBuffer1-->0;
    l2 = HLAuxBuffer2-->0;

    if (l1 ~= l2) {
        print (string) Story;
        return;
    }
    for (i = 0 : i < l1 : i++) {
        if (HLAuxBuffer1->(i + WORDSIZE) ~= HLAuxBuffer2->(i + WORDSIZE)) {
            print (string) Story;
            return;
        }
    }
    print (string) GERMAN_STORY;
];

[ Banner;
   BeginActivity(PRINTING_BANNER_TEXT_ACT);
   if (ForActivity(PRINTING_BANNER_TEXT_ACT) == false) {
        VM_Style(HEADER_VMSTY);
        !print (string) Story;
        __Print_Story();
        VM_Style(NORMAL_VMSTY);
        new_line;
        !print (string) Headline;
        __Print_Headline();
        #ifdef Story_Author;
        #ifdef NEW_LINE_BEFORE_AUTHOR;
        new_line;
        #ifnot;
        print " ";
        #endif; ! NEW_LINE_BEFORE_AUTHOR
        print "von ", (string) Story_Author;
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
-) instead of "Banner" in "Printing.i6t"


Section - List Writer

Include (-
Global MarkedObjectArray = 0;
Global MarkedObjectLength = 0;

[ WriteListOfMarkedObjects style case
    obj common_parent first mixed_parentage length;

    objectloop (obj ofclass Object && obj has workflag2) {
        length++;
        if (first == nothing) { first = obj; common_parent = parent(obj); }
        else { if (parent(obj) ~= common_parent) mixed_parentage = true; }
    }
    if (mixed_parentage) common_parent = nothing;
    
    ! *** Ausgabe von "nichts" durch PrintNothing() flexibler gemacht.
    
    if (length == 0) PrintNothing(case, style);
    else {

        @push MarkedObjectArray; @push MarkedObjectLength;
        MarkedObjectArray = RequisitionStack(length);
        MarkedObjectLength = length;
        if (MarkedObjectArray == 0) return RunTimeProblem(RTP_LISTWRITERMEMORY);

        if (common_parent) {
            ObjectTreeCoalesce(child(common_parent));
            length = 0;
            objectloop (obj in common_parent) ! object tree order
                if (obj has workflag2) MarkedObjectArray-->length++ = obj;
        } else {
            length = 0;
            objectloop (obj ofclass Object) ! object number order
                if (obj has workflag2) MarkedObjectArray-->length++ = obj;
        }

        !WriteListFrom(first, style, 0, false, MarkedListIterator);

        ! *** Hier wird das Listenschreiben erst einmal nach |WriteListFromCase()|
        !     umgelenkt. Damit die dann alles korrekt an die neue I7-|WriteListFrom()|
        !     übergeben kann, mussten wir zwei lokale Variablen hinzufügen.
        !     (siehe |WriteListFromCase()|).

        WriteListFromCase(first, style, case, 0, false, MarkedListIterator);
        FreeStack(MarkedObjectArray);
        @pull MarkedObjectLength; @pull MarkedObjectArray;
    }
    return;
];
-) instead of "WriteListOfMarkedObjects" in "ListWriter.i6t".


Include (-
[ PrintNothing case style;
	! *** Die Ausgabe von "nichts" flexibler gemacht:
	!     Großschreibung am Satzanfang ("Nichts"), vorangestelltes "ist" und
	!     der Genitiv ("Von/von nichts") werden entsprechend ausgegeben.
	!     Diese Routine wird in |WriteListFrom| und |WriteListOfMarkedObjects|
	!     verwendet.
	if ((style & CFIRSTART_BIT) && case ~= Gen) { print (string) NOTHING2__TX; rtrue; }
	if (style & ISARE_BIT) print (string) IS2__TX;
	else if (case == Gen) {
	    if (style & CFIRSTART_BIT) print "Von ";
	    else print "von ";
	}
	print (string) NOTHING__TX; rtrue;
];

[ WriteListFrom first style depth noactivity iter a ol;
	@push c_iterator; @push c_style; @push c_depth; @push c_margin;
    if (iter) c_iterator = iter; else c_iterator = ObjectTreeIterator;
    c_style = style; c_depth = depth;
	c_margin = 0; if (style & EXTRAINDENT_BIT) c_margin = 1;

	objectloop (a ofclass Object) {
		give a list_filter_permits;
		if ((list_filter_routine) && (list_filter_routine(a) == false))
			give a ~list_filter_permits;
	}

    first = c_iterator(first, depth, 0, START_ITF);
	if (first == nothing) {
        PrintNothing(short_name_case, style);
        if (style & NEWLINE_BIT ~= 0) new_line;
    } else {
		if ((noactivity) || (iter)) {
			WriteListR(first, c_depth, true);
			say__p = 1;
		} else {
			objectloop (ol provides list_together) ol.list_together = 0;
			CarryOutActivity(LISTING_CONTENTS_ACT, parent(first));
		}
	}

    @pull c_margin; @pull c_depth; @pull c_style; @pull c_iterator;
];

[ LanguageNotifySuffixes cap definite_mode;
    ! In dieser Routine wird das Drucken von list_together und plural
    ! vorbereitet, damit diese Properties auch die Kurzstrings benutzen
    ! können. Außerdem wird der Fall Zahl + Genitiv vorübergehend in
    ! "von" + Zahl + Dativ umgewandelt. (Zugegeben, ganz schön akademisch,
    ! das mit den Listen im Genitiv, und es funktioniert nicht immer.)

    ! *** Für das Schreiben von Genitiv-Listen in I7 werden jetzt mit
    !     den Flags cap und definite_mode Großschreibung und
    !     bestimmter/unbestimmter Artikel sinnvoll berücksichtigt:
    !     Nur mit unbestimmtem Artikel wird "von" + Anzahl + Dativ
    !     ("von fünf roten Bällen") geschrieben;
    !     mit bestimmtem Artikel heißt es jetzt "der fünf roten Bälle".

    if ((~~definite_mode) && (short_name_case == Gen)) {
        short_name_case = Dat; genitive_list = true;
        if (cap) print "Von ";
        else     print "von ";
    }
    ! Wichtig ist diese Zeile!
    SetLowStrings(short_name_case, 0);
];

[ LanguageUnnotifySuffixes;
    ! Hier wird der Fall wieder zurückgesetzt.
    if (~~genitive_list) rtrue;
    genitive_list = false; short_name_case = Gen;
];
-) instead of "WriteListFrom" in "ListWriter.i6t".


Include (-
[ STANDARD_CONTENTS_LISTING_R;
    WriteListFromCase(child(parameter_object), c_style, short_name_case, c_depth, true);
];
-) instead of "Standard Contents Listing Rule" in "ListWriter.i6t".


Include (-
[ ListEqual o1 o2;
    if ((o1.plural == 0) || (o2.plural == 0)) rfalse;
    if (child(o1) ~= 0 && WillRecurs(o1) ~= 0) rfalse;
    if (child(o2) ~= 0 && WillRecurs(o2) ~= 0) rfalse;
    if (c_style & (FULLINV_BIT + PARTINV_BIT) ~= 0) {
        if ((o1 hasnt worn && o2 has worn) || (o2 hasnt worn && o1 has worn)) rfalse;
        if ((o1 hasnt light && o2 has light) || (o2 hasnt light && o1 has light)) rfalse;
        if (o1 has container) {
            if (o2 hasnt container) rfalse;
            if ((o1 has open && o2 hasnt open) || (o2 has open && o1 hasnt open))
                rfalse;
        }
        else if (o2 has container)
            rfalse;
    }
    return Identical(o1, o2);
];

[ WillRecurs obj;
    if (c_style & ALWAYS_BIT ~= 0) rtrue;
    !if (c_style & RECURSE_BIT == 0) rfalse;
    if (c_style & (RECURSE_BIT | APPEND_BIT) == 0) rfalse;
    if ((obj has supporter) || ((obj has container) && (obj has open or transparent))) rtrue;
    rfalse;
];
-) instead of "Equivalence Relation" in "ListWriter.i6t".


Include (-
[ WriteMultiClassGroup cl memb depth partition_class_sizes q k2 l;
    ! Save the style, because the activity below is allowed to change it
    q = c_style;

    !if (c_style & INDENT_BIT ~= 0) PrintSpaces(2*(depth+c_margin));

    ! Inventory Indent und Inventory Bullet berücksichtigt
    ! *** Die zusätzliche Einrückung wird nur bei Aufzählungsebene
    !     größer 1 wirksam.
    if (c_style & INDENT_BIT) {
        if (depth == 1) PrintSpaces(2*(depth+c_margin));
		else PrintSpaces(INVENTORY_INDENT*(depth+c_margin));
        #ifdef INVENTORY_BULLET;
        print (string) INVENTORY_BULLET;
        #endif;
    }

    BeginActivity(GROUPING_TOGETHER_ACT, memb);

    if (ForActivity(GROUPING_TOGETHER_ACT, memb)) {
        c_style = c_style &~ NEWLINE_BIT;
    } else {

        if (memb.list_together ofclass String) {
            ! Set k2 to the number of objects covered by the group
            k2 = 0;
            for (l=0 : l<listing_size : l++) k2 = k2 + partition_class_sizes->(l+cl);
            ! Vor der Ausgabe die Endung @00 für den Plural setzen
            LanguageNotifySuffixes();

            EnglishNumber(k2); print " ";
            print (string) memb.list_together;
            if (c_style & ENGLISH_BIT ~= 0) print " (";
            if (c_style & INDENT_BIT ~= 0)  print ":^";
            LanguageUnnotifySuffixes();
        } else {
            inventory_stage = 1;
            parser_one = memb; parser_two = depth + c_margin;
            if (RunRoutines(memb, list_together) == 1) jump Omit__Sublist2;
        }

        c_margin++;
        @push lt_value; @push listing_together; @push listing_size;

        lt_value = memb.list_together; listing_together = memb;
        #Ifdef DBLW; print "^^DOWN lt_value = ", lt_value, " listing_together = ", memb, "^^";
        @push DBLW_no_classes; @push DBLW_no_objs; #Endif;
        WriteListR(memb, depth, false);
        #Ifdef DBLW; print "^^UP^^"; @pull DBLW_no_objs; @pull DBLW_no_classes; #Endif;

        @pull listing_size; @pull listing_together; @pull lt_value;
        c_margin--;

        if (memb.list_together ofclass String) {
            if (q & ENGLISH_BIT ~= 0) print ")";
        } else {
            inventory_stage = 2;
            parser_one = memb; parser_two = depth+c_margin;
            RunRoutines(memb, list_together);
        }
        .Omit__Sublist2;
    }

    EndActivity(GROUPING_TOGETHER_ACT, memb);

    ! If the NEWLINE_BIT has been forced by the activity, act now
    ! before it vanishes...
    if (q & NEWLINE_BIT ~= 0 && c_style & NEWLINE_BIT == 0) new_line;

    ! ...when the original style is restored again:
    c_style = q;
];
-) instead of "Write Multiple Class Group" in "ListWriter.i6t"


Include (-
[ WriteSingleClassGroup cl memb depth size q          capitalised_number_flag;
    q = c_style;

    ! Inventory Indent und Inventory Bullet berücksichtigt
    ! *** Die zusätzliche Einrückung wird nur bei Aufzählungsebene
    !     größer 1 wirksam.
    if (c_style & INDENT_BIT) {
        if (depth == 1) PrintSpaces(2*(depth+c_margin));
		else PrintSpaces(INVENTORY_INDENT*(depth+c_margin));
        #ifdef INVENTORY_BULLET;
        print (string) INVENTORY_BULLET;
        #endif;
    }

    if (size == 1) {
        if (c_style & NOARTICLE_BIT ~= 0) WithoutArt(memb, short_name_case);
        else {
            if (c_style & DEFART_BIT) {
                if ((cl == 1) && (c_style & CFIRSTART_BIT)) CDefArt(memb, short_name_case);
                else DefArt(memb, short_name_case);
            } else {
                if ((cl == 1) && (c_style & CFIRSTART_BIT)) CIndefArt(memb, short_name_case);
                else IndefArt(memb, short_name_case);
            }
        }
    } else {
        if (c_style & DEFART_BIT) {
            if ((cl == 1) && (c_style & CFIRSTART_BIT)) PrefaceByArticle(memb, 0, size, 1);
            else PrefaceByArticle(memb, 1, size);
        }
        if ((cl == 1) && (c_style & CFIRSTART_BIT)) {
	        if (c_style & DEFART_BIT) LanguageNotifySuffixes(1,1); ! *** Großschreibung, bestimmt
	        else { !*** Die Anzahl für die Ausgabe
	               !    mit Großbuchstaben vormerken ("Vier Bälle")
		           capitalised_number_flag = true;
	               LanguageNotifySuffixes(1); ! *** Großschreibung, unbestimmt
	        }
        }
        else {
	        if (c_style & DEFART_BIT) LanguageNotifySuffixes(0,1); ! *** Kleinschreibung, bestimmt
	        else LanguageNotifySuffixes(0);   ! *** Kleinschreibung, unbestimmt
        }

        ! *** Wenn capitalised_number_flag gesetzt ist, wird die Anzahl mit
        !     Großbuchstaben ausgegeben ("Vier Bälle"). Nur im Genitiv bleibt die Anzahl
        !     klein, weil in diesem Fall "Von drei Bällen/der drei Bälle"
        !     geschrieben wird. Das "Von" wird in |LanguageNotifySuffixes()|
        !     ausgegeben.

        @push listing_size; listing_size = size;
        if (capitalised_number_flag && ~~genitive_list)
	        RunCapitalised(CarryOutActivity, PRINTING_A_NUMBER_OF_ACT, memb);
        else CarryOutActivity(PRINTING_A_NUMBER_OF_ACT, memb);
        @pull listing_size;
        LanguageUnnotifySuffixes();
    }
    if ((size > 1) && (memb hasnt pluralname)) {
        give memb pluralname;
        WriteAfterEntry(memb, depth);
        give memb ~pluralname;
    } else WriteAfterEntry(memb, depth);
    c_style = q;
];
-) instead of "Write Single Class Group" in "ListWriter.i6t".


Include (-
[ PushListBuffer obj depth;
    if (list_buffer-->0 == LIST_BUFFER_SIZE) rfalse;
    (list_buffer-->0)++;
    list_buffer-->(list_buffer-->0) = obj;
    list_depth-->(list_buffer-->0) = depth;
    rtrue;
];

[ WriteAfterEntry obj depth stack_p
    p recurse_flag parenth_flag eldest_child child_count combo   old_case;

    inventory_stage = 2;
    if (c_style & PARTINV_BIT) {
        BeginActivity(PRINTING_ROOM_DESC_DETAILS_ACT);

        !if (o.invent && RunRoutines(o, invent))                 ! These lines
        !    if (c_style & NEWLINE_BIT) ""; else rtrue;          ! added

    if (ForActivity(PRINTING_ROOM_DESC_DETAILS_ACT) == false) {
            combo = 0;
            if (obj has light && location hasnt light) combo=combo+1;
            if (obj has container && obj hasnt open)     combo=combo+2;
            if ((obj has container && (obj has open || obj has transparent))
                && (child(obj)==0))                    combo=combo+4;
            if (combo) L__M(##ListMiscellany, combo, obj);
        }
        EndActivity(PRINTING_ROOM_DESC_DETAILS_ACT);
    }   ! end of PARTINV_BIT processing

    if (c_style & FULLINV_BIT) {
        !if (o.invent && RunRoutines(o, invent))
        !    if (c_style & NEWLINE_BIT) ""; else rtrue;

        if (obj has light && obj has worn) { L__M(##ListMiscellany, 8, obj);     parenth_flag = true; }
        else {
            if (obj has light)           { L__M(##ListMiscellany, 9, obj);  parenth_flag = true; }
            if (obj has worn)            { L__M(##ListMiscellany, 10, obj); parenth_flag = true; }
        }

        if (obj has container)
            if (obj has openable) {
                if (parenth_flag) print (string) AND__TX;
                else              L__M(##ListMiscellany, 11, obj);
                if (obj has open)
                    if (child(obj)) L__M(##ListMiscellany, 12, obj);
                    else          L__M(##ListMiscellany, 13, obj);
                else
                    if (obj has lockable && obj has locked) L__M(##ListMiscellany, 15, obj);
                    else                                L__M(##ListMiscellany, 14, obj);
                parenth_flag = true;
            }
            else
                if (child(obj)==0 && obj has transparent)
                    if (parenth_flag) L__M(##ListMiscellany, 16, obj);
                    else              L__M(##ListMiscellany, 17, obj);

        if (parenth_flag) print ")";
    }   ! end of FULLINV_BIT processing

    if (c_style & CONCEAL_BIT) {
        child_count = 0;
        objectloop (p in obj)
            if (p hasnt concealed && p hasnt scenery) { child_count++; eldest_child = p; }
    }
    else { child_count = children(obj); eldest_child = child(obj); }

    if (child_count && (c_style & ALWAYS_BIT)) {
        if (c_style & ENGLISH_BIT) L__M(##ListMiscellany, 18, obj);
        recurse_flag = true;
    }

    if (child_count && (c_style & RECURSE_BIT)) {
        if (obj has supporter) {
            if ((c_style & ENGLISH_BIT) && (c_style & APPEND_BIT)==0) {
                if (c_style & TERSE_BIT) L__M(##ListMiscellany, 19, obj);
                else                     L__M(##ListMiscellany, 20, obj);
                if (obj has animate)       print (string) WHOM__TX;
                else                     print (string) WHICH__TX;
            }
            recurse_flag = true;
        }
        if (obj has container && (obj has open || obj has transparent)) {
            if ((c_style & ENGLISH_BIT) && (c_style & APPEND_BIT)==0) {
                if (c_style & TERSE_BIT) L__M(##ListMiscellany, 21, obj);
                else                     L__M(##ListMiscellany, 22, obj);
                if (obj has animate)       print (string) WHOM__TX;
                else                     print (string) WHICH__TX;
            }
            recurse_flag = true;
        }
    }

    ! Auskommentiert, damit der Fall beibehalten werden kann.
    !
    ! if (recurse_flag && (c_style & ENGLISH_BIT))
    !    if (child_count > 1 || eldest_child has pluralname) print (string) ARE2__TX;
    !    else                                                print (string) IS2__TX;

    if (c_style & NEWLINE_BIT) new_line;

    if (recurse_flag) {
        if ((c_style & APPEND_BIT) && PushListBuffer(obj, depth)) rfalse;
        obj = child(obj);

        ! *** Die Inhaltslisten in Klammern stehen im Nominativ,
        !     unabhängig von dem Fall der Hauptliste. Bei Listen im
        !     Akkusativ wird aber auch der Inhalt im Akkusativ
        !     ausgegeben.

        old_case = short_name_case;
        if (old_case ~= Akk) short_name_case = Nom;

        @push lt_value; @push listing_together; @push listing_size;
        @push c_iterator;
        c_iterator = ObjectTreeIterator;
        lt_value = 0;   listing_together = 0;   listing_size = 0;
        WriteListR(obj, depth+1, true);
        @pull c_iterator;
        @pull listing_size; @pull listing_together; @pull lt_value;

        short_name_case = old_case;

        if (c_style & TERSE_BIT) print ")";
    }
];
-) instead of "Write After Entry" in "ListWriter.i6t".


Section - Z-Machine

Include (-
[ VM_CopyBuffer bto bfrom i;
    for (i=0: i<INPUT_BUFFER_LEN: i++) bto->i = bfrom->i;
];

[ VM_PrintToBuffer buf len a b c;
    @output_stream 3 buf;
    switch (metaclass(a)) {
        String: print (string) a;
        Routine: a(b, c);
        Object, Class: if (b) PrintOrRun(a, b, true); else print (name) a;
    }
    @output_stream -3;
    if (buf-->0 > len) print "Error: Overflow in VM_PrintToBuffer.^";
    return buf-->0;
];

[ VM_Tokenise b p; b->(2 + b->1) = 0; @tokenise b p; ];

!   Da man in LanguageIsVerb auch buffer2 verändern muss, habe ich mir
!   gedacht, ich lasse es zu, b als dritten Parameter zu übergeben.
!   buffer ist aber nach wie vor der Default.

[ LTI_Insert i ch b    y;

    ! Protect us from strict mode, as this isn't an array in quite the
    ! sense it expects
    if (b==0) b = buffer;

    ! Insert character ch into buffer at point i.
    ! Being careful not to let the buffer possibly overflow:
    y = b->1;
    if (y > b->0) y = b->0;

    ! Move the subsequent text along one character:
    for (y=y+2 : y>i : y-- ) b->y = b->(y-1);
    b->i = ch;

    ! And the text is now one character longer:
    if (b->1 < b->0) (b->1)++;
];

[ LTI_Delete i b    y ch;

    ! Protect us from strict mode, as this isn't an array in quite the
    ! sense it expects
    if (b==0) b = buffer;

    ! Insert character ch into buffer at point i.
    ! Being careful not to let the buffer possibly overflow:
    y = b->1;
    if (y > b->0) y = b->0;

    ! Move the subsequent text back one character:
    ch = b->i;
    for (i=i+1 : i<y+2 : i++) b->(i-1) = b->i;

    ! And the text is now one character shorter:
    if (b->1) (b->1)--;
    return ch;
];
-) instead of "Buffer Functions" in "ZMachine.i6t".


Section - Glulx

Include (-
Global dict_start;
Global dict_entry_size;
Global dict_end;
-) after "Variables and Arrays" in "Glulx.i6t".

Include (-
[ VM_CopyBuffer bto bfrom i;
    for (i=0: i<INPUT_BUFFER_LEN: i++) bto->i = bfrom->i;
];

[ VM_PrintToBuffer buf len a b c;
    if (b) {
        if (metaclass(a) == Object && a.#b == WORDSIZE
            && metaclass(a.b) == String)
            buf-->0 = Glulx_PrintAnyToArray(buf+WORDSIZE, len, a.b);
        else if (metaclass(a) == Routine)
            buf-->0 = Glulx_PrintAnyToArray(buf+WORDSIZE, len, a, b, c);
        else
            buf-->0 = Glulx_PrintAnyToArray(buf+WORDSIZE, len, a, b);
    }
    else if (metaclass(a) == Routine)
        buf-->0 = Glulx_PrintAnyToArray(buf+WORDSIZE, len, a, b, c);
    else
        buf-->0 = Glulx_PrintAnyToArray(buf+WORDSIZE, len, a);
    if (buf-->0 > len) buf-->0 = len;
    return buf-->0;
];

[ VM_Tokenise buf tab
    cx numwords len bx ix wx wpos wlen val res dictlen entrylen;
    len = buf-->0;
    buf = buf+WORDSIZE;

    ! First, split the buffer up into words. We use the standard Infocom
    ! list of word separators (comma, period, double-quote).

    cx = 0;
    numwords = 0;
    while (cx < len) {
        while (cx < len && buf->cx == ' ') cx++;
        if (cx >= len) break;
        bx = cx;
        if (buf->cx == '.' or ',' or '"') cx++;
        else {
            while (cx < len && buf->cx ~= ' ' or '.' or ',' or '"') cx++;
        }
        tab-->(numwords*3+2) = (cx-bx);
        tab-->(numwords*3+3) = WORDSIZE+bx;
        numwords++;
        if (numwords >= MAX_BUFFER_WORDS) break;
    }
    tab-->0 = numwords;

    ! Now we look each word up in the dictionary.

    dictlen = #dictionary_table-->0;
    entrylen = DICT_WORD_SIZE + 7;

    for (wx=0 : wx<numwords : wx++) {
        wlen = tab-->(wx*3+2);
        wpos = tab-->(wx*3+3);

        ! Copy the word into the gg_tokenbuf array, clipping to DICT_WORD_SIZE
        ! characters and lower case.
        if (wlen > DICT_WORD_SIZE) wlen = DICT_WORD_SIZE;
        cx = wpos - WORDSIZE;
        for (ix=0 : ix<wlen : ix++) gg_tokenbuf->ix = VM_UpperToLowerCase(buf->(cx+ix));
        for (: ix<DICT_WORD_SIZE : ix++) gg_tokenbuf->ix = 0;

        val = #dictionary_table + WORDSIZE;
        @binarysearch gg_tokenbuf DICT_WORD_SIZE val entrylen dictlen 1 1 res;
        tab-->(wx*3+1) = res;
    }
];

!   Da man in LanguageIsVerb auch buffer2 verändern muss, habe ich mir
!   gedacht, ich lasse es zu, b als dritten Parameter zu übergeben.
!   buffer ist aber nach wie vor der Default.

[ LTI_Insert i ch b    y;

    ! Protect us from strict mode, as this isn't an array in quite the
    ! sense it expects
    if (b==0) b = buffer;

    ! Insert character ch into buffer at point i.
    ! Being careful not to let the buffer possibly overflow:
    y = b-->0;
    if (y > INPUT_BUFFER_LEN) y = INPUT_BUFFER_LEN;

    ! Move the subsequent text along one character:
    for (y=y+WORDSIZE : y>i : y-- ) b->y = b->(y-1);
    b->i = ch;

    ! And the text is now one character longer:
    if (b-->0 < INPUT_BUFFER_LEN) (b-->0)++;
];

[ LTI_Delete i b    y ch;

    ! Protect us from strict mode, as this isn't an array in quite the
    ! sense it expects
    if (b==0) b = buffer;

    ! Insert character ch into buffer at point i.
    ! Being careful not to let the buffer possibly overflow:
    y = b-->0;
    if (y > INPUT_BUFFER_LEN) y = INPUT_BUFFER_LEN;

    ! Move the subsequent text back one character:
    ch = b->i;
    for (i=i+1 : i<y+WORDSIZE : i++) b->(i-1) = b->i;


    ! And the text is now one character shorter:
    if (b-->0) (b-->0)--;
    return ch;
];
-) instead of "Buffer Functions" in "Glulx.i6t".


Section - Out of World

Include (-
[ ANNOUNCE_PRONOUN_MEANINGS_R x y c d;
    c = (LanguagePronouns-->0)/3;
    if (player ~= selfobj) c++;

    if (c == 0) return GL__M(##Pronouns, 4);

    GL__M(##Pronouns, 1);
    for (x=1, d=0 : x<=LanguagePronouns-->0 : x = x+3) {
        if (LanguagePronouns-->x ~= 'spez.')
            print "    ~", (address) LanguagePronouns-->x, "~";
        else print "    ~damit~, ~darauf~, usw.";
        y = LanguagePronouns-->(x+2);
        if (y == NULL) L__M(##Pronouns, 3);
        else {
            GL__M(##Pronouns, 2);
            print (the) y;
        }
        d++;
        new_line;
    }
    if (player ~= selfobj) {
        print "~mich~/~mir~ "; GL__M(##Pronouns, 2);
        c = player; player = selfobj;
        print (the) c; player = c;
    }
];
-) instead of "Announce Pronoun Meanings Rule" in "OutOfWorld.i6t".


Section - Tests

[Die Ausgabe der Objekte wird ans Deutsche angepasst, nämlich
die Textersetzungen (the), (a) usw. durch ihre deutschen Pendants
(der), (ein) usw. ausgetauscht.]

[ShowMe]

Include (-
[ ShowMeSub t_0 na;
	t_0 = noun;
 	if (noun == nothing) noun = real_location;
 	if (ShowMeRecursively(noun, 0, (noun == real_location))) {
 		if (noun == real_location)
			print "* kennzeichnet Dinge, die nicht in Sicht sind^";
	}
 	if (t_0 ofclass K2_thing) {
 		print "Ort:"; ShowRLocation(noun, true); print "^";
 	}
 	indef_mode = -1;                  ! *** (11.11.2010) "bare mode" und
 	SetLowStrings(Nom, Gender(t_0));  !     Low-Strings neu setzen.
 	{-call:Plugins::Showme::compile_SHOWME_details}
];

[ ShowRLocation obj top;
	if (obj ofclass K1_room) return;
	print " ";
	if (parent(obj)) {
		if (obj has worn) print "als Kleidung getragen von ";
		else {
			if (parent(obj) has animate) print "getragen von ";
			if (parent(obj) has container) print "in ";
			if (parent(obj) ofclass K1_room) print "in ";
			if (parent(obj) has supporter) print "auf ";
		}
		print (dem) parent(obj);
		ShowRLocation(parent(obj));
	} else {
		if (obj.component_parent) {
			if (top == false) print ", ";
			print "ein Teil von ", (dem) obj.component_parent;
			ShowRLocation(obj.component_parent);
		}
		else print "nicht im Spiel";
	}
];

[ I7_German_Kind_Name k;
    if (k == K4_door or K5_container) {
	    switch (k) {
	        K5_container: print "er ";
	        K4_door: print "e ";
	        default: print " ";
	    }
    }
    switch (k) {
        K1_room: print "Raum (room)";
        K2_thing: print "Ding (thing)";
        K3_direction: print "Richtung (direction)";
        K4_door: print "Tür (door)";
        K5_container: print "Behälter (container)";
        K6_supporter: print "Ablage (supporter)";
        K7_backdrop: print "Kulisse (backdrop)";
        K8_person: print "Person (person)";
        K9_region: print "Region (region)";
        K10_man: print "Mann (man)";
        K11_woman: print "Frau (woman)";
        K12_animal: print "Tier (animal)";
        K13_device: print "Gerät (device)";
        K14_vehicle: print "Fahrzeug (vehicle)";
        K15_player_s_holdall: print "Allzwecktasche (player's holdall)";
        default:
            I7_Kind_Name(k);
    }
];

[ ShowMeRecursively obj depth f c i k;
	spaces(2*depth);
	if (f && (depth > 0) && (TestScope(obj, player) == false)) { print "*"; c = true; }
	print (ein) obj;
	if (depth > 0) {
		if (obj.component_parent) print " (ein Teil von ", (dem) obj.component_parent, ")";
		if (obj has worn) print " (angezogen)";
	}
	if (obj provides KD_Count) {
		k = KindHierarchy-->((obj.KD_Count)*2);
		if ((k ~= K2_thing) || (depth==0)) {
			print " - ";
			if (k == K4_door or K5_container) {
				if (obj has transparent) print "durchsichtig";
				if (obj has locked) print "abgeschlossen";
				else if (obj has open) print "offen";
				else print "geschlossen";
			}
			I7_German_Kind_Name(k);
		}
	}
	print "^";
	if (obj.component_child) c = c | ShowMeRecursively(obj.component_child, depth+2, f);
	if ((depth>0) && (obj.component_sibling))
		c = c | ShowMeRecursively(obj.component_sibling, depth, f);
	if (child(obj)) c = c | ShowMeRecursively(child(obj), depth+2, f);
	if ((depth>0) && (sibling(obj))) c = c | ShowMeRecursively(sibling(obj), depth, f);
	return c;
];

[ AllowInShowme pr;
	if (pr == workflag or concealed or mentioned) rfalse;
	rtrue;
];
-) instead of "ShowMe Command" in "Tests.i6t".

[Tree]

Include (-
[ XTreeSub i;
    if (noun == 0) {
        objectloop (i)
            if (i ofclass Object && parent(i) == 0) XObj(i);
    }
    else XObj(noun,1);
];

[ XObj obj f;
    if (parent(obj) == 0) print (WithoutArt) obj; else print (ein) obj;
    print " (", obj, ") ";
    if (f == 1 && parent(obj) ~= 0)
        print "(in ", (dem) parent(obj), " ", parent(obj), ")";
    new_line;
    if (child(obj) == 0) rtrue;
    if (obj == Class)
        WriteListFrom(child(obj), NEWLINE_BIT+INDENT_BIT+ALWAYS_BIT+NOARTICLE_BIT, 1);
    else
        WriteListFrom(child(obj), NEWLINE_BIT+INDENT_BIT+ALWAYS_BIT+FULLINV_BIT, 1);
];
-) instead of "Tree Command" in "Tests.i6t".


Section - Relations

[Die Ausgabe der Objekte wird ans Deutsche angepasst, nämlich
die Textersetzungen (the), (a) usw. durch ihre deutschen Pendants
(der), (ein) usw. ausgetauscht.]

Include (-
[ Relation_ShowVtoV relation sym x obj1 obj2 pr pr2 proutine1 proutine2 vtov_structure;
	vtov_structure = relation-->RR_STORAGE;
	pr = vtov_structure-->VTOVS_LEFT_INDEX_PROP;
	pr2 = vtov_structure-->VTOVS_RIGHT_INDEX_PROP;
	proutine1 = vtov_structure-->VTOVS_LEFT_PRINTING_ROUTINE;
	proutine2 = vtov_structure-->VTOVS_RIGHT_PRINTING_ROUTINE;
 
	if (pr && pr2) {
		objectloop (obj1 provides pr)
		  objectloop (obj2 provides pr2) {
				if (sym && obj2 > obj1) continue;
				if (Relation_TestVtoV(obj1, relation, obj2)) {
					if (x == 0) { print (string) relation-->RR_DESCRIPTION, ":^"; x=1; }
					print "  ", (GDer) obj1;
					if (sym) print "  <=>  "; else print "  >=>  ";
					print (den) obj2, "^";
				}
		  }
		return;
	}
	if (pr && (pr2==0)) {
		objectloop (obj1 provides pr)
		  for (obj2=1:obj2<=vtov_structure-->VTOVS_RIGHT_DOMAIN_SIZE:obj2++) {
				if (Relation_TestVtoV(obj1, relation, obj2)) {
					if (x == 0) { print (string) relation-->RR_DESCRIPTION, ":^"; x=1; }
					print "  ", (GDer) obj1, "  >=>  ";
					(proutine2).call(obj2);
					print "^";
				}
		  }
		return;
	}
	if ((pr==0) && (pr2)) {
		for (obj1=1:obj1<=vtov_structure-->2:obj1++)
		  objectloop (obj2 provides pr2) {
				if (Relation_TestVtoV(obj1, relation, obj2)) {
					if (x == 0) { print (string) relation-->RR_DESCRIPTION, ":^"; x=1; }
					print "  ";
					(proutine1).call(obj1);
					print "  >=>  ", (den) obj2, "^";
				}
		  }
		return;
	}
	for (obj1=1:obj1<=vtov_structure-->2:obj1++)
		  for (obj2=1:obj2<=vtov_structure-->VTOVS_RIGHT_DOMAIN_SIZE:obj2++)
			if (Relation_TestVtoV(obj1, relation, obj2)) {
				if (x == 0) { print (string) relation-->RR_DESCRIPTION, ":^"; x=1; }
				print "  ";
				(proutine1).call(obj1);
				print "  >=>  ";
				(proutine2).call(obj2);
				print "^";
		  }
];
-) instead of "Show Various to Various" in "Relations.i6t".

Include (-
[ Relation_ShowOtoO relation sym x relation_property t N obj1 obj2;
	relation_property = relation-->RR_STORAGE;
	t = KindBaseTerm(relation-->RR_KIND, 0); ! Kind of left term
	N = KOVDomainSize(t);
	if (t == OBJECT_TY) {
		objectloop (obj1 provides relation_property) {
			obj2 = obj1.relation_property;
			if (sym && obj2 < obj1) continue;
			if (obj2 == 0) continue;
			if (x == 0) { print (string) relation-->RR_DESCRIPTION, ":^"; x=1; }
			print "  ", (GDer) obj1;
			if (sym) print "  ==  "; else print "  >=>  ";
			if (sym) print (dem) obj2, "^";
			else print (den) obj2, "^";
		}
	} else {
		for (obj1=1: obj1<=N: obj1++) {
			obj2 = GProperty(t, obj1, relation_property);
			if (sym && obj2 < obj1) continue;
			if (obj2 == 0) continue;
			if (x == 0) { print (string) relation-->RR_DESCRIPTION, ":^"; x=1; }
			print "  ";
			PrintKindValuePair(t, obj1);
			if (sym) print "  ==  "; else print "  >=>  ";
			PrintKindValuePair(t, obj2);
			print "^";
		}
	}
];
-) instead of "Show One to One" in "Relations.i6t".

Include (-
[ Relation_RShowOtoO relation sym x relation_property obj1 obj2 t1 t2 N1 N2;
	relation_property = relation-->RR_STORAGE;
	t1 = KindBaseTerm(relation-->RR_KIND, 0); ! Kind of left term
	t2 = KindBaseTerm(relation-->RR_KIND, 1); ! Kind of right term
	if (t2 == OBJECT_TY) {
		if (t1 == OBJECT_TY) {
			objectloop (obj1) {
				objectloop (obj2 provides relation_property) {
					if (obj2.relation_property ~= obj1) continue;
					if (x == 0) { print (string) relation-->RR_DESCRIPTION, ":^"; x=1; }
					print "  ", (GDer) obj1;
					print "  >=>  ";
					print (den) obj2, "^";
				}
			}
		} else {
			N1 = KOVDomainSize(t1);
			for (obj1=1: obj1<=N1: obj1++) {
				objectloop (obj2 provides relation_property) {
					if (obj2.relation_property ~= obj1) continue;
					if (x == 0) { print (string) relation-->RR_DESCRIPTION, ":^"; x=1; }
					print "  "; PrintKindValuePair(t1, obj1);
					print "  >=>  ";
					print (den) obj2, "^";
				}
			}
		}
	} else {
		N2 = KOVDomainSize(t2);
		if (t1 == OBJECT_TY) {
			objectloop (obj1) {
				for (obj2=1: obj2<=N2: obj2++) {
					if (GProperty(t2, obj2, relation_property) ~= obj1) continue;
					if (x == 0) { print (string) relation-->RR_DESCRIPTION, ":^"; x=1; }
					print "  ", (GDer) obj1;
					print "  >=>  ";
					PrintKindValuePair(t2, obj2);
					print "^";
				}
			}
		} else {
			N1 = KOVDomainSize(t1);
			for (obj1=1: obj1<=N1: obj1++) {
				for (obj2=1: obj2<=N2: obj2++) {
					if (GProperty(t2, obj2, relation_property) ~= obj1) continue;
					if (x == 0) { print (string) relation-->RR_DESCRIPTION, ":^"; x=1; }
					print "  ";
					PrintKindValuePair(t1, obj1);
					print "  >=>  ";
					PrintKindValuePair(t2, obj2);
					print "^";
				}
			}
		}
	}
];
-) instead of "Show Reversed One to One" in "Relations.i6t".


Section - Unterstand Tokens

Include (-
! ----------------------------------------------------------------------------
! Spezielle Token:
!
! [prep_hinein]          Die prep-Tokens überlesen die Adverbialpronomen als
! [prep_heraus]          Präposition ohne Ergebnis. Ist ähnlich der Notation
! [prep_weg]             'weg'/'fort' und nützlich, wenn diese Wörter gesagt
!                        werden können, aber keine Information tragen wie bei
!                        "Schau in Kiste hinein/rein".
!
! [noun_hinein]          Die noun-Tokens überlesen ebefnfalls eine Reihe von
! [noun_heraus]          Wörtern jedoch als Adverbialpronomen. Das heißt es
! [noun_damit]           wird als Ergebnis das letzte Objekt, das nicht
! [noun_darauf]          'animate' ist zurückgegeben, oder ein Fehler, wenn
! ...                    es kein solches Objekt gibt. Hier haben die Wörter
!                        sehr wohl eine Information: "schau hinein" schaut
!                        in das zuletzt angegebene Objekt.
!
!                        (Diese Tokens heißen in der offiziellen Lib [hinein]
!                        [xdamit], [xhinweg] usw. Die Benutzung von x für ein
!                        Ergebnistoken war aber nicht eindeutig, so habe ich
!                        sie umbenannt.)
!
! [held_damit]           Die held-Tokens sind wie die noun-Tokens oben, nur
! ...                    dass sie zusätzlich verlangen, dass das Objekt beim
!                        Spieler ist und auch ein implizites ##Take versuchen.
!                        Dunmmerweise wird die Gültigkeit in Inform nur beim
!                        Token geprüft.
!
! [force_nach]           Prüft den gesamten Satz und lässt das Satzmuster
!                        nur zu, wenn es das Wort 'nach' enthält. Dies wird
!                        in Sätzen mit <topic>-Token verwendet, um fehler-
!                        hafte Eingaben wie >>schau xxx<< nicht fälschlich
!                        als Consult zu interpretieren.
!
! [force_in]             Dito, erzwingt 'in' im Satz.
!
! [force_nach_in]        Erzwingt 'nach', lässt den Satz aber nicht zu, wenn
!                        vor 'nach' ein 'in' gefunden wird. Das wird auch bei
!                        <topic> benötigt, um >>schau italien im atlas nach<<
!                        nicht "* topic 'nach' 'in' noun" zu überlassen - >>im
!                        atlas<< würde hier als Teil des <topic> überlesen,
!                        das Nachschalgewerk impliziert.
!
! [force_pronoun]        Kann in Kombination mit Präpositionen verwendet
!                        werden, zum Beispiel ist 'damit' [force_pronoun]
!                        dasselbe wie [noun_damit]. Die erste Variante kann
!                        aber nach einem [topic] verwendet werden, da einem
!                        Topic-Token nur Präpositionen oder das Satzende
!                        folgen können. Deshalb wird es hier auch nur als
!                        Krücke für ##Consult verwendet.
!
! [dativ]               Kennzeichnet ein nachfolgendes Token als Dativ.
!                        (Wird von der Lib nur zur Ausgabe von PrintCommand
!                        benutzt. Die Routine parse_name kann aber überprüfen,
!                        ob der dative_mode gesetzt ist.)
! ----------------------------------------------------------------------------


[ parse_pronomial_adverb a mode    w flag;
    ! Diese Routine überliest entweder Adverbialpronomen (mode==0) oder
    ! bildet sie auf das "Pronomen" 'spez.' ab, das passende Pronomen
    ! für Objekte, die nicht 'animate' sind. Aus der offiziellen Lib
    ! übernommen. Originalcode Toni Arnold?

    ! In deform erweitert, um [held] und [noun] zu unterscheiden.
    ! Der mode ist 0 für überspringen, 1 für [noun] und 2 für [held].

    w = NextWordStopped();
    if (w == -1 or THEN1__WD && mode == 0) {
        wn--; return GPR_PREPOSITION;
    }
    if (w == 'da' or 'dort' or 'hier') w = NextWordStopped();

    switch (a) {
        1: if (w == 'hinein' or 'rein' or 'darein' or 'herein') flag = -1;
        2: if (w == 'heraus' or 'hinaus' or 'raus' or 'daraus') flag = -1;
        3: if (w == 'hinweg' or 'weg' or 'fort' or 'ab') flag = -1;
        4: if (w == 'damit') flag = -1;
        5: if (w == 'darauf' or 'drauf' or 'herauf' or 'rauf' or 'hinauf') flag=-1;
        6: if (w == 'darunter' or 'drunter') flag=-1;
        7: if (w == 'dahinter') flag=-1;
        8: if (w == 'nach') flag=-1;
        9: if (w == 'durch' or 'hindurch') flag=-1;
        10: if (w == 'darueber' or 'hinueber' or 'drueber' or 'herueber') flag=-1;
        11: if (w == 'herunter' or 'hinunter' or 'runter') flag=-1;
        12: if (w == 'daran' or 'dran' or 'ran' or 'an') flag=-1;
        13: if (w == 'dagegen' or 'gegen') flag = -1;
        14: if (w == 'darum' or 'drum' or 'herum' or 'rum') flag = -1;
    }
    if (flag == -1) {
        if (mode == 0) return GPR_PREPOSITION;
        w = PronounValue('spez.');
        if (w == 0) return GPR_FAIL;
        if (TestScope(w, actor)) {
            if (mode == 1) { pronominal_adverb_flag = a+1; return w; }
            ! *** Hier wird a im pronominal_adverb_flag hinterlegt, um
            !     eventuell später feststellen zu können, welches
            !     Pronominaladverb verwendet wurde.

            if (mode == 2 && parent(w) ~= actor) {
                if (ForActivity(IMPLICITLY_TAKING_ACT, w)==true) {
                    etype = NOTHELD_PE;
                    return GPR_FAIL;
                }
                !not_holding = w;
            }
            return w;
        }
    }
    return GPR_FAIL;
];

[ PREP_HINEIN_TOKEN;   return parse_pronomial_adverb(1, 0); ];
[ PREP_HERAUS_TOKEN;   return parse_pronomial_adverb(2, 0); ];
[ PREP_WEG_TOKEN;      return parse_pronomial_adverb(3, 0); ];
[ PREP_DARAUF_TOKEN;   return parse_pronomial_adverb(5, 0); ];
[ PREP_DARUNTER_TOKEN; return parse_pronomial_adverb(6, 0); ];
[ PREP_NACH_TOKEN;     return parse_pronomial_adverb(8, 0); ];
[ PREP_HINDURCH_TOKEN; return parse_pronomial_adverb(9, 0); ];
[ PREP_HINUEBER_TOKEN; return parse_pronomial_adverb(10, 0); ];
[ PREP_HERUNTER_TOKEN; return parse_pronomial_adverb(11, 0); ];
[ PREP_DARAN_TOKEN;    return parse_pronomial_adverb(12, 0); ];
[ PREP_DAGEGEN_TOKEN;  return parse_pronomial_adverb(13, 0); ];
[ PREP_DARUM_TOKEN;    return parse_pronomial_adverb(14, 0); ];



[ NOUN_HINEIN_TOKEN;   return parse_pronomial_adverb(1, 1); ];
[ NOUN_HERAUS_TOKEN;   return parse_pronomial_adverb(2, 1); ];
[ NOUN_DAMIT_TOKEN;    return parse_pronomial_adverb(4, 1); ];
[ NOUN_DARAUF_TOKEN;   return parse_pronomial_adverb(5, 1); ];
[ NOUN_DARUNTER_TOKEN; return parse_pronomial_adverb(6, 1); ];
[ NOUN_DAHINTER_TOKEN; return parse_pronomial_adverb(7, 1); ];
[ NOUN_HINDURCH_TOKEN; return parse_pronomial_adverb(9, 1); ];
[ NOUN_DARUEBER_TOKEN; return parse_pronomial_adverb(10, 1); ];
[ NOUN_HERUNTER_TOKEN; return parse_pronomial_adverb(11, 1); ];
[ NOUN_DARAN_TOKEN;    return parse_pronomial_adverb(12, 1); ];
[ NOUN_DAGEGEN_TOKEN;  return parse_pronomial_adverb(13, 1); ];
[ NOUN_DARUM_TOKEN;    return parse_pronomial_adverb(14, 1); ];


[ HELD_HINEIN_TOKEN;   return parse_pronomial_adverb(1, 2); ];
[ HELD_DARAUF_TOKEN;   return parse_pronomial_adverb(5, 2); ];


[ force_prep required stop   w n;
    w = wn;
    if (stop == 0) stop = -1;
    wn = verb_wordnum + 1;
    n = NextWordStopped();
    while (n ~= -1) {
        if (n == stop) return GPR_FAIL;
        if (n == required) {
            wn = w;
            return GPR_PREPOSITION;
        }
        n = NextWordStopped();
    }
    return GPR_FAIL;
];

[ FORCE_NACH_TOKEN; return force_prep('nach'); ];
[ FORCE_NACH_IN_TOKEN; return force_prep('nach', 'in'); ];
[ FORCE_IN_TOKEN; return force_prep('in'); ];

[ FORCE_PRONOUN_TOKEN wd;
    wd = PronounValue('spez.');
    if (wd == 0) return GPR_FAIL;
    if (TestScope(wd, actor)) {
	    pronominal_adverb_flag = 1; ! *** 1: erzwungen, 2-15: vordefinierte
	    return wd;
    }
    return GPR_FAIL;
];


! Token, das das nachfolgende Token als Dativ kennzeichnet. So kann der
! Fall berücksichtigt werden (wird er aber noch nicht) und trotzdem bleibt
! der Scope des Tokens erhalten: dative noun, dative held, dative edible usw.

! *** Der Dativ wird bei der Ausgabe von Parser-Meldungen bei ergänzten
!     Satzmustern berücksichtigt.

[ DATIVE_TOKEN; return GPR_PREPOSITION; ];

[ SUBSTANTIVE_TOKEN; return GPR_PREPOSITION; ];


! Krücke für 'u' -> 'h', ohne 'u busch' zu beeinträchtigen

[ IMPLICIT_UP_TOKEN;
    #ifdef u_obj;
    return u_obj;
    #ifnot;
    return GPR_FAIL;
    #endif;
];


[ DICH_TOKEN;
    if (NextWord() == 'dich' or 'sich' or 'euch' or 'mich')
        return GPR_PREPOSITION;
    wn--; return GPR_FAIL;
];

[ DIR_TOKEN;
    if (NextWord() ~= 'dir' or 'sich' or 'mir' or 'uns') wn--;
    return GPR_PREPOSITION;
];
-) [after "Language.i6t". Das ist zu früh, weil u_obj an dieser Stelle noch nicht definiert ist, und deshalb das IMPLICIT_UP_TOKEN nicht korrekt funktioniert. Deshalb wird hier kein spezieller Ort für die Ersetzung angegeben.]


[-------------- Changing Gender -----------------]

Include (-
[ CG__Token gender;
    GenderNotice(self, gender);
    return GPR_PREPOSITION;
];

[ CG_MALE_TOKEN; return CG__Token(male); ];

[ CG_FEMALE_TOKEN; return CG__Token(female); ];

[ CG_NEUTER_TOKEN; return CG__Token(neuter); ];

[ CG_PLURAL_TOKEN; return CG__Token(pluralname); ];
-).


Section - Libcheck - Not for release

Include (-
#ifdef DEBUG;

Global LC_notice_printed = false;

Array LibcheckIgnoreVerbs table

! *** Dies sind alle von GerX vordefinierten Verben, die möglicherweise
!     auf 'e' oder 'en' enden. Diese werden beim Verben-Libcheck ignoriert,
!     damit nur die vom Autor neu hinzugefügten Verben geprüft werden.

    'baumle'    'durchstoeber' 'ende'    'klettre'     'konsultier'
    'lage'      'meldungen'    'nee'     'noe'         'oeffne'
    'pronomen'  'punkte'       'restore' 'save'        'schnueffel'
    'scope'     'score'        'showme'  'streichle'   'superbrief'
    'trace'     'tree'         'verbose' 'verschliess' 'wedle'
    'durchschneid'             'praesentier'           'zertruemmer'
    'lade'      'laden'

! *** Die Vokabeln der Standard-Lib, die Umlaute
!     enthalten, werden ebenfalls übergangen.

    'rueckgängig' 'rückgaengig' 'rückgängig' 'zurück'  'äh'
;

[ PerformLibcheckAll s i;
    if (~~s) ShowDictStat();
    XLibcheck(s, i); YLibcheck(s, i);
    LibcheckAnnounce(2);
];

[ UmlautCheck i letter length start invalid;
    !if (i < 256) return; ! für Changing Gender
    #ifdef TARGET_GLULX;
    length = Glulx_PrintAnyToArray(StorageForShortName, 24, i);
    start = 0;
    #ifnot;
    @output_stream 3 StorageForShortName;
    print (address) i;
    @output_stream -3;
    length = StorageForShortName-->0;
    start = 2;
    #endif;

    ! *** Vokabel nach Umlauten durchsuchen
    for (i=0 : i < length : i++) {
        letter = StorageForShortName->(i+start);
        if (letter == CHAR_AE or CHAR_OE or CHAR_UE or CHAR_SS) invalid = true;
    }
    return invalid;
];

[ DictWordCorrection i max    letter length start umlaute;
    #ifdef TARGET_GLULX;
    length = Glulx_PrintAnyToArray(StorageForShortName, 24, i);
    start = 0;
    #ifnot;
    @output_stream 3 StorageForShortName;
    print (address) i;
    @output_stream -3;
    length = StorageForShortName-->0;
    start = 2;
    #endif;
    umlaute = 0;

    if (max) length = max;
    
    ! *** Vokabel i nach Umlauten durchsuchen und mit Umschreibungen ausgeben
    for (i=0 : i < length : i++) {
	    
        letter = StorageForShortName->(i+start);
        #ifdef TARGET_ZCODE;
        if (letter == CHAR_AE or CHAR_OE or CHAR_UE or CHAR_SS) umlaute++;
        #endif;
        switch (letter) {
            CHAR_AE: print "ae";
            CHAR_OE: print "oe";
            CHAR_UE: print "ue";
            CHAR_SS: print "ss";
            default: print (char) letter;
        }
    }
    #ifdef TARGET_ZCODE;
    if (length == 9-(umlaute*3)) print "(...)";
    #ifnot;
    if (length == DICT_WORD_SIZE) print "(...)";
    #endif;
];

[ LibcheckAnnounce n newlines   i;
    say__p = 0;
    newlines = 2-newlines;
    switch (n) {
        1:  if (~~LC_notice_printed) {
                LC_notice_printed = true;
                print "LIBCHECK hat Probleme gefunden:";
                for (i=0 : i < newlines : i++) print "^";
            }
        2:  if (LC_notice_printed) {
                LC_notice_printed=false;
                print "^Hinweis: Mit dem Kommando LIBCHECK kann dieser Test
                    jederzeit während des Spiels ausgeführt werden. Mit der
                    Option ~Use skip libcheck.~ wird der automatische Libcheck
                    bei Spielbeginn übersprungen.
                     ^^
                    LIBCHECK ENDE.^^";
            }
    }
];

[ SuffixAddress dw mode     i letter start length;
    ! Vokabel auf Hilfsfeld schreiben
    #ifdef TARGET_GLULX;
    length = Glulx_PrintAnyToArray(UmlautAux, 24, dw);
    start = 0;
    #ifnot;
    @output_stream 3 UmlautAux;
    print (address) dw;
    @output_stream -3;
    length = UmlautAux-->0;
    start = 2;
    #endif;
    
    ! *** Vokabel mit abgesetzten Endungen ausgeb|en
    for (i=0 : i < length : i++) {
        letter = UmlautAux->(i+start);
        if (i == length-mode) print "|";
        print (char) letter;
    }
    print " [Korrekturvorschlag: ";
    DictWordCorrection(dw, length-mode);
    print "]";
];

[ ShowDictStat      dict_entries a i j 
                    verb_count meta_count noun_count prep_count;
    say__p = 0;
    
	dict_entries = (dict_start - dict_end)/dict_entry_size;
    if (dict_entries < 0) dict_entries = -dict_entries;

    for (a = 0 : a < dict_entries : a++ ) {
	    ! *** Adresse berechnen
	    i = dict_start + a*dict_entry_size;
        j = i->#dict_par1;
        if (j & 1) verb_count++;
        if (j & $$00000010) meta_count++;
        if (j & $$10000000) noun_count++;
        if (j & $$00001000) prep_count++;
    }
    
    print "Info: Maximale Länge der Wörterbucheinträge: ";
    #ifdef TARGET_ZCODE;
    print "9 Zeichen. Das Limit kann in Z-Code nicht erhöht
        werden. Umlaute und ß belegen jeweils 4 Zeichen
        einer Vokabel.";
    #ifnot;
    print DICT_WORD_SIZE, " Zeichen. Das Limit kann in Glulx
        erhöht werden: Use DICT_WORD_SIZE of <N>.";
    #endif;
    
    print "^^Das ";
    #ifdef TARGET_GLULX;
    print "Glulx";
    #ifnot;
    print "Z-Machine";
    #endif;
    print "-Wörterbuch enthält ", dict_entries, " Einträge. Davon sind ",
        verb_count, " als Verben, ", meta_count, " als Meta-Befehle, ",
         noun_count, " als Objektsynonyme und ", prep_count, " als
         Präpositionen gekennzeichnet.^^";
];

[ XLibCheck silent ignore_lib_verbs     o n errors i j synonyms_listed dict_entries
                                        a gender_error;

    say__p = 1;
    ! *** Gesamtliste aller Vokabeln mit Umlauten ohne Objektbezug erstellen,
    !     um auch die Vokabeln zu erwischen, die nicht in der name-Property
    !     eines Objekts stehen.
    
    ! *** Anzahl der Wörterbucheinträge ermitteln. Eine Schleife direkt über die
    !     Adressen kann wegen eines "signed integer overflows" fehlschlagen.
    dict_entries = (dict_start - dict_end)/dict_entry_size;
    if (dict_entries < 0) dict_entries = -dict_entries;

    for (a = 0 : a < dict_entries : a++ ) {
	    
	    ! *** Adresse berechnen
	    i = dict_start + a*dict_entry_size;
        
	    j = 0;      
        if (ignore_lib_verbs) {
                for (n = 1 : n <= LibcheckIgnoreVerbs-->0 : n++ )
                      if (LibcheckIgnoreVerbs-->n == i) { j = -1; break; }
                if (j==-1) continue; ! for a
        }
        if (UmlautCheck(i)) {
            errors++;
            if (errors == 1) {
	            LibcheckAnnounce(1);
	            print "Gesamtliste aller Vokabeln, die Umlaute
	                   oder 'ß' enthalten:^^";
            }
            j = i->#dict_par1;
            print errors, ": ", (address) i;
            if (j & 1) print " [Verb] [Korrekturvorschlag: siehe Verben-Check
                               weiter unten]^";
            else {
	            if (j & $$10000000) {
		            print " [Objekt-Synonym]";
		            synonyms_listed++;
	            }
	            if (j & $$00001000) print " [Präposition]";
	            if (j & $$00000010) print " [Meta-Verb]";
	            print " [Korrekturvorschlag: ", (DictWordCorrection) i, "]^";
            }
        }
    }
    if (errors) {
        print "^Hintergrund: Vokabeln (Verben und Präpositionen in Satzmustern
                sowie Synonyme für Objekte), die Umlaute (ä, ö, ü) oder
                Eszett (ß) enthalten, können vom GerX-Parser nicht korrekt mit der
                Eingabe des Spielers abgeglichen werden, da sämtliche Umlaute und ß
                in der Spielereingabe vor der Analyse durch Umschreibungen ersetzt werden.
                Umlaute und ß in Vokabeln müssen deshalb immer mit
                ae, oe, ue und ss umschrieben werden (siehe Korrekturvorschlag).
                Nur so werden alle Umlaute und ß sowie deren Umschreibungen
                in der Spielereingabe korrekt vom Spiel verstanden.^^";
    }
                
    errors = 0;

    objectloop (o ofclass Object) {
       if (o ofclass (+ room +)
         || o ofclass (+ thing +)
         || o ofclass (+ direction +)) {
            n = 0;
            if (o has male) n++;
            if (o has female) n++;
            if (o has neuter) n++;
            if (o has pluralname) n++;

            if (n ~= 1) {
                LibcheckAnnounce(1);
                print "Objekt ", o, " (", (der) o, ") hat ";
                if (n) print "keine eindeutige Genus/Numerus-Definition.^";
                else print "keine Angabe zum Genus/Numerus.^";
                errors++;
                gender_error = true;
            }
        }

        ! *** Vokabeln mit Umlauten und 'ß' in der name-Property eines
        !     Objekts identifizieren

        for (n = 0 : n<o.#name/WORDSIZE : n++) {
            if (UmlautCheck(o.&name-->n)) {
                LibcheckAnnounce(1);
                errors++;
                if (errors == 1) print "Objektdefinitionen:^^";
                print "Die Vokabel '", (address) o.&name-->n,
                	"' von Objekt ", o, " (", (der) o, ") enthält
                	Umlaute oder 'ß'.^";
            }
        }
    }
    if (errors == 0) {
        if (LC_notice_printed || ~~silent) {
            print "Keine";
            if (synonyms_listed) print " offensichtlichen";
        }
    }
    else if (errors) print "^", errors;
    if (LC_notice_printed || errors || (errors==0 && ~~silent) ) {
        print " Fehler bei den Objektdefinitionen.";	
        if (gender_error) { print "^Achtung: Mehrdeutige oder fehlende
            Genus-Definitionen sollten bei der ausschließlichen Verwendung
            von Inform-7-Code nicht vorkommen. Die Ursachen dafür könnten
            in eingebundenem Inform-6-Code liegen oder ein Fehler in
            GerX sein.^";
        }
        else {
	        if (errors) print " Siehe Korrekturvorschlag in der Gesamtliste
	                            weiter oben.";
	        print "^";
        }  
        if (synonyms_listed && (synonyms_listed ~= errors) ) {
	        print "^Achtung: ";
	        if (synonyms_listed==1) print "Es wurde ein Objektsynonym gefunden,
	        	das Umlaute/ß enthält";
	        else print "Es wurden ", synonyms_listed, " Objektsynonyme gefunden, die
	        	Umlaute/ß enthalten";
			print " (siehe
				Gesamtliste weiter oben). Objekte mit dem Attribut ~privately-named~
				oder gruppierten Vokabeln (~vokabel1/vokabel2/vokabel3~),
				die nicht automatisch geprüft werden können, sollten
				deshalb manuell auf ";
			if (synonyms_listed>1) print "die gelisteten Synonyme";
			else print "das gelistete Synonym";
			print " hin überprüft werden.^";
		}
    }
];

[ YLibcheck silent ignore_lib_verbs   i j k last last2 mode warnings dict_entries
                                      a suffix_warning;
    say__p = 1;
        
    dict_entries = (dict_start - dict_end)/dict_entry_size;
    if (dict_entries < 0) dict_entries = -dict_entries;

    ! *** Verben auf Endung 'e', 'n' (nach 'l') oder 'en' + Umlaute/ß prüfen:
    
    warnings = 0;
    suffix_warning = false;

    for (a = 0 : a < dict_entries : a++ ) {
        i = dict_start + a*dict_entry_size;
        j = i->#dict_par1;
        if (j & 1) {

            ! *** Verben in der Tabelle LibcheckIgnoreVerbs nur ignorieren,
            !     wenn ignore_lib_verbs wahr ist (ist es im Normalfall).

	        if (ignore_lib_verbs) {
                for (k = 1 : k <= LibcheckIgnoreVerbs-->0 : k++ )
                      if (LibcheckIgnoreVerbs-->k == i) j=-1;
                if (j==-1) continue; ! for i
            }

            ! *** Verbformen aus der I7-Tabelle "Table of blessed verb forms"
            !     immer ignorieren

            if (AddressInTable(i, (+ Table of blessed verb forms +) )) continue;

            last = LastCharacterAddress(i);
            last2 = LastCharacterAddress(i, 1);
            
            ! *** (22.02.2011) Verben, die  auf 'ae', 'ee', 'ie', 'oe' oder 'ue'
            !     enden, werden nicht angemeckert.
            if (last == 'e' && last2 == 'a' or 'e' or 'i' or 'o' or 'u') continue;

            if (last2 == 'l' && last == 'n') mode = 1;
            else if (last2 == 'e' && last == 'n') mode = 2;
            else if (last == 'e') mode = 1;

            if (mode || UmlautCheck(i)) {
	            if (mode) suffix_warning = true;
	            warnings++;
	            if (warnings == 1) {
    	            LibcheckAnnounce(1,1);
    	            print "^Folgende Verben haben Endungen und/oder enthalten Umlaute/ß:^^";
	            }
                print warnings, ": ";
                SuffixAddress(i, mode);
                print "^";
                mode = 0;
            }
        }
     }
     if (suffix_warning) {
        print "^Hintergrund: Verben sollten immer im Imperativ (der Befehlsform)
            für die 2. Person Singular angegeben werden, wobei der Spieler
            das Spiel konventionsgemäß duzt. Es empfiehlt sich, immer die
            knappste Form eines Verbs (~geh~) ohne Endungen zu definieren, damit
            möglichst viele Wortformen (~geh~, ~gehe~, ~gehen~, ~geht~)
            verstanden werden (siehe Korrekturvorschlag).
            Der Parser erkennt Endungen in der Spielereingabe, deshalb braucht
            man sie nicht extra anzugeben.";

        print "^^Tipp: Wenn das Verb auch ohne die Endung einen gültigen
            Imperativ darstellt, sollte die bestehende Definition geändert
            und ausschließlich die Form ohne Endung verwendet werden.
            ^^
            Sind Verben mit der Endung 'e', 'en' oder 'n'
            notwendig, weil sie entweder ohne Endung keine korrekte Form haben
            (z.B. 'knuddl' als ungültige Imperativ-Form des Verbs 'knuddeln') oder
            gar keine (deutschen) Verben sind (z.B. 'ausgaenge', 'analyze'),            
            kann man diese in einem Not-for-release-Abschnitt in die fortgesetzte
            Tabelle ~Table of blessed verb forms (continued)~ eintragen und
            somit abgsegnen; die Verben in dieser Tabelle werden beim nächsten
            Library-Check ignoriert und nicht mehr als Fehler gemeldet.
            ^^
            Es folgt ein Beispiel für eine Tabelle mit dem Verb 'knuddle' und
            dem englischen Verb 'analyze', deren Formen ohne 'e' keine gültigen
            Imperative sind und deshalb mit 'e' am Ende definiert werden sollten:
            ^^
            Section - Abgesegnete Verbformen - Not for release
            ^^Table of blessed verb forms (continued)^
            Verb^
            ~knuddle~^
            ~analyze~^";
      }
      if (warnings==0 && silent==false) {
	      print "^Keine Fehler bei den Verben-Definitionen.^";
	      if (~~LC_notice_printed) print "^";
      }   
];

       

#Endif; ! DEBUG
-).


[Section - Temporary bug fixes]




German ends here.

---- DOCUMENTATION ----

By including this German extension (GerX) you can make German the language of play.
The I6 code for German language processing is exclusively based on the deform library 6/11 by Martin Oehm.
GerX is, like I7 itself, a work in progress.

Please send bug reports, suggestions, and comments to

	"GerX@pageturner.de"

or post them in the German IF forum at

	"http://forum.ifzentrale.de"

Chapter: Willkommen

Section: Allgemeines

Mit dieser German-Extension (GerX) kann man deutschsprachige Textadventures mit Inform 7 (I7) schreiben. Das heißt, dass Ein- und Ausgabe des fertigen Spiels auf Deutsch stattfinden; der Inform-7-Quelltext wird weiterhin auf Englisch geschrieben.

GerX wurde von Banbury, Christian Blümke und Michael Baltes erstellt. Der Inform-6-Code, der für die spezielle Behandlung der deutschen Eingabe- und Ausgabetexte verantwortlich ist, wurde ausschließlich der deform-Bibliothek Release 6/11 von Martin Oehm entnommen und so behutsam wie möglich für die Benutzung mit Inform 7 angepasst. Danke an Martin Oehm für diese Steilvorlage!

GerX ist so ausgelegt, dass der Autor, wie beim englischen Original auch, alle Standard-Antworten ändern kann. Sehr bequem geht das z.B. mit der Extension Default Messages von Ron Newcomb in Kombination mit German Default Messages von Team GerX. Alle neuen Rules haben Namen, die man im Inform-Index nachschlagen kann. Über diese lassen sich die Rules ersetzen oder in ihrer Reihenfolge beeinflussen. Für die in Inform 7 enthaltenen Erweiterungen Rideable Vehicles von Graham Nelson sowie Locksmith, Menus und Basic Screen Effects von Emily Short bringt GerX schon Übersetzungen mit. Die Original-Erweiterungen müssen im Quelltext vor der deutschen Erweiterung eingebunden werden.

Um mit GerX arbeiten zu können, muss sich der Autor jedoch mit ein paar Besonderheiten vertraut machen. So gibt es zum Beispiel neue Methoden, Texte mit flexiblen Adjektiv- und/oder Substantiv-Endungen auszugeben. Es gibt auch einige Regeln für das Benennen von Dingen und Vokabeln, an die sich der Autor halten muss, damit das Spiel am Ende richtig funktioniert und der Spieler die größtmögliche Flexibilität bei der Eingabe seiner Anweisungen hat. All das wird im Folgenden erläutert werden.


Section: Dankeschön

Die Autoren dieser Erweiterung danken Martin Oehm, Emily Short, Marius Müller, Christoph Winkler, Martin Barth, Ingo Scharmann, Andrew Plotkin und allen Nutzern auf "forum.ifzentrale.de" und "rec.arts.int-fiction", die geholfen haben, diese Extension zu erstellen und zu verbessern.

Einer fehlt noch:

	Before thanking the above, try thanking Graham Nelson (this is the specially acknowledging the creator of Inform rule).

Chapter: Die ersten Schritte

Section: Einbinden der German-Extension

Um GerX zu benutzen, muss der Autor sie am Anfang seines Codes (nach dem Titel) einbinden.

	*: Include German by Team GerX.

Achtung: GerX Version 3 hat einen neuen Autorennamen (Team GerX) bekommen. Autoren, die schon mit älteren Versionen gearbeitet haben, müssen in ihren laufenden Projekten deshalb die Include-Zeile entsprechend anpassen, da ansonsten versucht wird, die vorige Version einzubinden.

Section: Bibliographische Daten

Titel und Autor können wie im englischen Original angegeben werden:

	"Sauwetter" by Lasse Regner

Wichtig ist, dass weiterhin "by" geschrieben wird. GerX macht bei der Ausgabe ein "von" daraus.

Der Autor sollte eine eigene story headline für sein Spiel angeben, weil ansonsten in den bibliographischen Metadaten (Datei "Metadata.iFiction" im Projektordner) die englische Standard-Headline "An Interactive Fiction" verzeichnet wird.

	The story headline is "Ein interaktives Beispiel".

Nun wird am Anfang des Spiels folgender Text ausgegeben:

	Sauwetter
	Ein interaktives Beispiel von Lasse Regner

Wenn keine story headline angegeben wird, heißt es im Titel-Banner des Spiels (aber eben nicht in den Metadaten):

	Sauwetter
	Ein Textadventure von Lasse Regner

Chapter: Vokabeln

Section: Was sind Vokabeln?

Vokabeln sind die Wörter im Lexikon eines Spiels, die mit der Spieler-Eingabe abgeglichen werden, um das Kommando zu verstehen. Dies sind zum einen die vordefinierten Verben, aber auch die vom Autor neu definierten Kommandos und Synonyme für Objekte. Damit auf Deutsch möglichst viele verschiedene Formen (Imperativ oder Infinitv für Verben, Adjektive und Substantive mit Endungen) verstanden werden können, wird die Eingabe des Spielers vor der Auswertung aufbereitet.

Zunächst wandelt der Parser die Umlaute (ä, ö, ü) nach "ae", "oe" und "ue" um; das Eszett (ß) wird zu "ss". Deshalb müssen sämtliche Vokabeln (Verben, Substantive, Adjektive, Präpositionen usw.) vom Autor ohne ä, ö, ü oder ß angegeben werden, wobei für Umlaute die Umschreibungen "ae", "oe" und "ue", für das Eszett "ss" zu verwenden sind. Vokabeln, die Umlaute enthalten, werden vom Spiel nicht verstanden.

Diese Einschränkung für das Definieren von Vokabeln wie "Baeume" ist leider nicht besonders intuitiv, sie hat aber den Vorteil, dass der Spieler sowohl "Bäume" als auch "Baeume" in seiner Anweisung schreiben kann. Mit der Testfunktion libcheck kann man prüfen, ob versehentlich Vokabeln mit Umlauten definiert wurden (s. Kap. 5.13: Überprüfen der Vokabel- und Genusdefinitionen).

Nach der Umwandlung der Umlaute werden sämtliche Flexionsendungen in der Eingabe so weit wie möglich abgeschnitten. Das heißt, der Parser beschneidet die einzelnen Wörter so lange, bis eine Wortform vorliegt, die im Lexikon des Spiels existiert. Deshalb empfiehlt es sich, bei der Definition von Vokabeln immer die knappste Form ohne Endungen zu wählen, damit möglichst viele Varianten verstanden werden können.

Intern werden nur die ersten 9 Zeichen einer Vokabel verarbeitet. Dies ist ein Relikt aus speicherarmen Zeiten und kann bei langen Wörtern zu Problemen führen. Zwei Möglichkeiten, wie man lange Vokabeln behandeln kann, sind beschrieben in Section 7.1: Wortköpfe und -schwänze (Compound Heads und Compound Tails) von langen Wörtern abtrennen.


Section: Hauptwörter und Adjektive (Synonyme für Objekte)

Nomen und Adjektive sollten immer ohne Endungen angegeben werden. Umlaute und "ß" werden umschrieben. Groß- und Kleinschreibung können bei der Definition von Vokabeln beliebig verwendet werden.

	Understand "Reisepass" and "Fuehrerschein" as Dokumente.
	Understand "gruen" as the Kobold.

Section: Verben und Satzmuster (Kommandos)

Bevor man ein neues Verb definiert, sollte man prüfen, ob das Verb mit dem dazugehörigen Satzmuster schon besteht und, falls ja, welche Aktion es auslöst. Sämtliche aktuell für ein Projekt existierenden Kommandos werden im Actions-Index von Inform 7 aufgelistet.

Verben sollten immer in der Imperativ-Form für die 2. Person Singular angegeben werden, wobei der Spieler das Spiel (und auch andere Personen im Spiel) konventionsgemäß duzt. Im Deutschen haben die regelmäßigen Verben meist zwei Imperativ-Formen, die sich nur durch ein angehängtes "e" unterscheiden ("denk" / "denke"). Das Kommando-Verb sollte nur in der Form ohne "e" angegeben werden, damit diese beiden Formen sowie der Imperativ für die 2. Person Plural ("denkt") und der Infinitiv ("denken") verstanden werden.

	Understand "blas" and "pust" as blowing. Understand "kneif" as pinching.

Kommandos müssen aber nicht unbedingt ohne "e" definiert werden, besonders wenn es keine echten Verben sind, sondern Substantive oder englische Verben ("punkte", "save"). Aber auch wenn die Form ohne "e" keinen gültigen Imperativ ergibt, wie z.B. bei "buddl", sollte ebenfalls ein "e" angehängt werden.

	Understand "buddle in [dativ] [something]" as digging.

In so einem Fall wird der Parser bei Rückfragen einen falschen Infinitiv konstruieren:

	>BUDDLE
	Worin willst du buddlen?

Um dem Programm bei Bedarf den korrekten Infinitv für unregelmäßige Imperativ-Infinitiv-Paare mitteilen zu können, gibt es die Tabelle "Table of infinitives", in die Imperative und die dazugehörigen Infinitive eingetragen werden können. Die Tabelle muss vom Autor mit dem Zusatz "(continued)" fortgesetzt werden, da sie von Haus aus schon eine Zeile enthält.

	Table of infinitives (continued)
	Verb		Infinitive
	"buddle"	"buddeln"

	>BUDDLE
	Worin willst du buddeln?

Natürlich ist es auch möglich, den Infinitiv eines anderes Verbs anzugeben:

	Table of infinitives (continued)
	Verb		Infinitive
	"buddle"	"graben"

	>BUDDLE
	Worin willst du graben?
	
In der Tabelle können auch bereits vordefinierte Verb-Infinitiv-Paare verändert werden.

	Table of infinitives (continued)
	Verb		Infinitive
	"nimm"		"dir aneignen"
	
	>NIMM
	Was willst du dir aneignen?


Section: Konflikte zwischen Vokabeln

In seltenen Fällen kann es vorkommen, dass sich Verben und Hauptwörter überschneiden.

	The Pumpe is a female thing.

	Pumping is an action applying to nothing. Understand "pump" as pumping.

Das Vorhandensein der Vokabel 'pumpe' verhindert, dass Spielereingaben auf "pump" heruntergekürzt werden, da bei "pumpe" Schluss ist. Gibt der Spieler etwa ">PUMPE" ein, so wird das nicht als "pump" verstanden, sondern als "pumpe". Hier muss man das Vokabular fürs Pumpen erweitern:

	Understand "pumpe" as pumping.
	
Oder auch:

	Understand the command "pumpe" as "pump".

Achtung: Der deform-Parser versteht grundsätzlich auch Infinitive (TASCHE AUFHEBEN wird intern nach "heb tasche auf" umgewandelt). Infinitiv-Konstruktionen mit einem Verb, das mit einem Objektsynonym kollidiert, werden nach der oben beschriebenen Anpassung nicht mehr verstanden:

	>PUMPE BETRACHTEN
	Ich habe nur Folgendes verstanden: pumpen.

In so einem Fall kann man das betreffende Wort in die fortgeführte Tabelle "Table of verb-noun collisions (continued)" eintragen, damit die Infinitiv-Konstruktion wieder korrekt funktioniert.

	Table of verb-noun collisions (continued)
	Verb
	"pumpe"
	
	>PUMPE BETRACHTEN
	Du siehst nichts Besonderes an der Pumpe.

Chapter: Das Definieren von Dingen

Section: Zwei unterschiedliche Methoden

Das Definieren von Dingen ist im englischen Inform 7 eine elegante Sache. Der Autor benennt ein Objekt und I7 macht aus diesem internen Namen gleich noch eine Vokabel, oder auch mehrere. Zudem wird der interne Name für die Anzeige im Spiel genutzt. Ein Beispiel:

	The book is a thing in the library.

Book ist nun der interne Bezeichner, mit dem der Autor in seinem Code auf das Objekt verweist. 'book' wird gleichzeitig als Vokabel definiert und der angezeigte Name, der printed name, wird als "book" angelegt.

Mit GerX stoßen wir mit dieser schönen Verzahnung von Programmier- und Spielsprache leider an Grenzen, da nur die Spielsprache ins Deutsche übertragen wird. Solange es keinen I7-Compiler gibt, der deutschen Quelltext versteht und nach Inform 6 übersetzt, muss man Kompromisse machen.

Es gibt zwei unterschiedliche Methoden zum Definieren von Objekten. Der Standard ist ein uneleganter Sprachen-Mix. Es gibt aber ein alternatives Verfahren, bei der Objektbezeichner und Vokabular nicht direkt zusammenhängen. Jede dieser Vorgehensweisen stellt einen Kompromiss mit unterschiedlichen Schwerpunkten dar; welche man bevorzugt, ist reine Geschmackssache, denn der Spieler wird den Unterschied später nicht merken.

Section: Methode I: Die Denglisch-Variante (Standard)

Es müssen deutsche Objektnamen und englische Arten-Bezeichnungen verwendet werden, was zu einem etwas unschönen Sprachen-Mix führt:

	The Keller is a male room.

	The Kiste is a female container in the Keller, fixed in place.

	The grün Apfel is a male edible thing in the Kiste. The printed name is "grün[^] Apfel". Understand "gruen" as the Apfel.

	The Oelkanne is a female thing in the Keller. The printed name is "Ölkanne".

	A Karotte is a kind of thing. It is female and edible. The printed plural name is "Karotten". Understand "Karotte" and "Moehre" as a Karotte. Understand "Karotten" and "Moehren" as the plural of Karotte.
	
	In the box are six Karotten.

Enthält der Objektname Umlaute oder ß, muss das Vokabular mit den Umschreibungen (ae, oe, ue, ss) angepasst werden(so wie bei "grün" im Beispiel). Benutzt man Umschreibungen im Objektnamen, muss der angezeigte Objektname, der printed name, nachgezogen werden (wie bei der "Ölkanne"). Der angezeigte Plural-Objektname (printed plural name) und das Plural-Vokabular für mehrere Objekte derselben Art (hier: die Karotten) müssen von Hand angepasst werden, wenn der Plural nicht wie im Englischen mit 's' am Ende gebildet wird.

Das Beispiel A "Die Jadestatue" im Anhang dieser Dokumentation benutzt die Denglisch-Methode zum Definieren von Objekten.


Section: Methode II: Die einsprachige Variante

Um den unschönen Sprachen-Mix zu vermeiden, kann man die Arten (kinds) "thing" und "room" als "privately-named" deklarieren (im Gegensatz zu "publically-named"). Das bedeutet, dass der interne Bezeichner nicht ans Vokabular weitergegeben wird. Das betrifft dann auch sämtliche Unter-Arten von "room" und "thing" ("supporter", "container" usw.). Man kann die Objekte in seinem Quelltext also nennen, wie man möchte, vor allem aber englische Bezeichner und Arten verwenden. Das hat den Vorteil, dass der Quelltext natürlicher wirkt; der Nachteil allerdings ist, dass der angezeigte Objektname (printed name) und die Synonyme explizit für jedes Objekt angegeben werden müssen. Bei mehreren Objekten derselben Art müssen zudem noch der angezeigte Plural-Objektname (printed plural name) und das Plural-Vokabular nachgeliefert werden.

	*: A thing is usually privately-named. A room is usually privately-named.

Beispiele:

	The basement is a male room. The printed name is "Keller". Understand "Keller" as the basement.

	The box is a male container in the basement, fixed in place. The printed name is "Kasten". Understand "Kasten" as the box.

	The green apple is a male edible thing in the box. The printed name is "grün[^] Apfel". Understand "gruen" and "Apfel" as the apple.

	A carrot is a kind of thing. It is female and edible. The printed name is "Karotte". The printed plural name is "Karotten". Understand "Karotte" and "Moehre" as a carrot. Understand "Karotten" and "Moehren" as the plural of a carrot.

	In the box are six carrots.

Bei Eigennamen muss nur das Vokabular nachgeliefert werden. Der angezeigte Objektname wird vom Bezeichner übernommen.

	Tina McKenzie is a woman in the saloon. Understand "Tina" and "McKenzie" as Tina.

Das Beispiel B "Der Mantel der Finsternis" im Anhang dieser Dokumentation benutzt die einsprachige Methode zum Definieren von Objekten.


Section: Angabe des grammatischen Geschlechts (Genus)

Für die drei Genera (Maskulinum, Femininum, Neutrum) stehen die Adjektive male, female und neuter zur Verfügung. Der Numerus eines Objekts ist standardmäßig Singular (singular-named). Für Objekte mit Namen im Plural ("die Wolken") ist das Adjektiv plural-named zu verwenden.


Personen werden wie gewohnt als man oder woman deklariert (man kann aber auch male person bzw. female person schreiben). Auch Räume können ein Geschlecht zugewiesen bekommen, was dann sinnvoll ist, wenn der Raumname mit Artikel in einem Say-Text ausgegeben werden soll.

	The Garten is a male room. The Bibliothek is female.

	The Kutsche is here. It is female.

	The Schreibtisch is a male supporter in the Büro, fixed in place.

	The Pergamonmuseum is a neuter backdrop in Berlin-Mitte.

	Frau Holle is a woman in the Märchenwald.

Wird kein Genus angegeben, wird ein Ding automatisch zum Neutrum erklärt. Personen, die nicht als "woman" oder "man" definiert wurden, sind ebenfalls, anders als im englischen Original, standardmäßig Neutren. So auch die Spielerfigur, wenn der Autor nichts Anderes festlegt.

Section: Angabe des Genus für Synonyme mit abweichendem Geschlecht (Changing Gender)

Häufig kommt es vor, dass Objekte Synonyme bekommen, die ein anderes Geschlecht als das Objekt selbst haben.

	The Anorak is a male wearable thing in the dressing room. The description is "Eine richtig dicke Winterjacke." Understand "Jacke" and "Winterjacke" as the Anorak.

Was passiert nun, wenn der Spieler den Anorak lieber "Jacke" nennt, und diese mit Pronomen ansprechen möchte?

	Du siehst hier einen Anorak.

	>U ANORAK
	Eine richtig dicke Winterjacke.

	>NIMM JACKE
	In Ordnung.

	>ZIEH SIE AN
	Mir ist nicht klar, worauf sich "sie" bezieht.

Oder noch unangenehmer:

	>ZIEH SIE AN
	(Dazu hebst du die Birne erst auf.)
	Du kannst die Birne nicht anziehen!


Um das zu vermeiden und die Pronomen korrekt zu setzen, kann man einzelnen Synonymen eines von vier Attributen folgen lassen, die das abweichende Geschlecht der Vokabel kennzeichnen. Diese Attribute sind:

	"[m]" (Maskulinum, männlich)
	"[f]" (Femininum, weiblich)
	"[n]" (Neutrum, sächlich)
	"[p]" (Plural)

Das Attribut wird nach der Vokabel, die gekennzeichnet werden soll, angegeben:

	The Anorak is a male wearable thing in the dressing room. The description is "Eine richtig dicke Winterjacke. Ein Erbstück."

	Understand "Parka", "Jacke [f]", "Winterjacke [f]" and "Erbstueck [n]" as the Anorak.

Nun sieht der Dialog so aus:

	>U ANORAK
	Eine richtig dicke Winterjacke. Ein Erbstück.

	>NIMM JACKE
	In Ordnung.

	>ZIEH SIE AN
	Du ziehst den Anorak an.

	>DURCHSUCHE ERBSTÜCK
	Du findest nichts Interessantes.

	>ZIEH ES AUS
	Du ziehst den Anorak aus.

Section: Feststellen und Anzeigen des grammatischen Geschlechts (Genus)

Das Geschlecht eines Objekts lässt sich direkt durch die Adjektive male, female, neuter und plural-named testen.

	if the person asked is male ...
	if the Kleidungsstück is plural-named ...

Möchte man aber den Genus als Wert benutzen, bietet sich die Phrase "the gender of" an. Die Werte der Genera sind "Mehrzahl", "männlich", "weiblich", "sächlich".

	if the gender of the noun is Mehrzahl, ...
	if the gender of the noun is männlich, ...
	if the gender of the noun is weiblich, ...
	if the gender of the noun is sächlich, ...

Die Phrase "the gender of" kann auch in Say-Texten verwendet werden:

	say "Der Genus von [dem noun] ist [the gender of the noun]."

Um den geänderten Genus (Changing Gender) einen Zug lang zu befragen, gibt es die Phrase "the changing gender of":

	if the changing gender of the box is sächlich, ...

Auch diese Phrase kann in Say-Texten verwendet werden:

	say "Der geänderte Genus von [dem noun] ist [the changing gender of the noun]."


Section: Sonderformen des unbestimmten Artikels: DEFINITE ARTICLE, YOURS, NO ARTICLE und PENDING

Bei der Ausgabe des Objektnamens mit unbestimmtem Artikel, z.B. per "[Ein <Objekt>]", "[ein <Objekt>]" oder in einer Liste, kann man eine Sonderform des unbestimmten Artikel (indefinite article), den special indefinite article, für ein Objekt angeben. Der special indefinite article ist im Gegensatz zum indefinite article kein Text, sondern einer der drei Werte DEFINITE ARTICLE, YOURS oder NO ARTICLE (können auch klein geschrieben werden). Der special indefinite article überschreibt einen möglicherweise schon vorhandenen indefinite article.

Man kann Objektnamen statt mit einem unbestimmten Artikel mit einem bestimmten Artikel anzeigen lassen:

	The special indefinite article of the Spaßmobil is DEFINITE ARTICLE.

	"Du siehst hier das Spaßmobil."

Dinge, die der Spielerfigur gehören, können bei der Ausgabe mit unbestimmtem Artikel mit dem korrekt flektierten Possessivartikel "dein" angezeigt werden:

	The special indefinite article of the Brieftasche is YOURS.

	"Du siehst hier deine Brieftasche."

Achtung: Der special indefintie article YOURS wird *nicht* für die Ausgabe mit bestimmtem Artikel verwendet. Soll der Name eines Objekts in jedem Fall mit "dein" ausgegeben werden, muss man in die Ausgabe des angezeigten Objektnamens eingreifen und ein flektierendes "dein" voranstellen:

	Maria is a woman.

	Before printing the name of Maria:
		if current case is:
			-- nominative: say "deine";
			-- genitive: say "deiner";
			-- dative: say "deiner";
			-- accusative: say "deine";
		say " Frau ".

Dinge können auch ohne Artikel angezeigt werden, so als hätte man sie als Eigennamen definiert. Der einzige Unterschied ist, dass das Objekt nicht das Attribut "proper-named" bekommt. Bei Dingen, die proper-named sind, werden nie Artikel verwendet, auch nicht bei der Ausgabe mit bestimmtem Artikel. Das kann man mit "no article" umgehen:

	The special indefinite article of the Milch is NO ARTICLE. The printed name is "frisch[^] Milch."

	"Du siehst hier frische Milch."

	Say "Du siehst hier [den Milch] von Bauer Henke."

	"Du siehst hier die frische Milch von Bauer Henke."

Jedes Objekt der Klasse "thing" und deren Unterklassen besitzt standardmäßig einen special indefinite article mit dem Wert PENDING. Dieser bleibt wirkungslos, bis dem special indefinite article einer der Werte DEFINITE ARTICLE, YOURS oder NO ARTICLE zugewiesen wird. Ein special indefinite article kann im weiteren Spielverlauf wieder unwirksam gemacht werden, indem man ihm den Wert PENDING zuweist.

	The Buch is a neuter thing.

	After examining the Buch for the first time:
		now the special indefinite article of the Buch is YOURS;
		say "Erst jetzt erkennst du, dass dies dein Tagebuch ist."

	After giving the Buch to Peter:
		now the special indefinite article of the Buch is PENDING;
		say "Du schenkst Peter dein Buch."

Section: Assemblies: Automatisch erzeugte Teile von Personen

Möchte man zum Beipiel Körperteile, sagen wir Nasen, für alle Personen erzeugen, geht das ganz einfach mit

	A Nase is a kind of thing. A Nase is female. The plural of Nase is Nasen.
	A Nase is part of every person.

Der Inform-Compiler erzeugt nun automatisch eine Nase für jede Person im Spiel, wobei die Bezeichner, die angezeigten Objektnamen und das zum Objekt gehörige Vokabular ebenfalls angelegt werden -- nur leider auf Englisch. In GerX ist ein Workaround enthalten, der zumindest den angezeigten Objektnamen auf Deutsch ausgibt ("deine Nase", "Nase des Polizisten", "Bennos Nase" usw.). Um das englische Vokabular zu unterbinden, müssen die erzeugten Teile privately-named sein und der printed name muss nachgereicht werden:

	A Nase is privately-named.
	The printed name of a Nase is "Nase".

Nun fehlt noch das deutsche Vokabular, um die Nasen entsprechend ihrer Besitzer ansprechen zu können:

	Understand "Nase von/des/der [something related by reversed incorporation]" as a Nase.
	Understand "Nase [something related by reversed incorporation]" as a Nase.
	Understand "[something related by reversed incorporation] Nase" as a Nase.
	Understand "dein/mein/unser/euer Nase" or "Nase von dir/mir/uns/euch" as your Nase.

Nun werden "deine Nase", "Bennos Nase", "Nase des Polizisten" und so weiter als die entsprechenden Nasen erkannt.


Chapter: Ausdrücke zur flexiblen Textausgabe

Section: Neue Textersetzungen müssen her

In einem Ausgabetext lässt sich auf Dinge und Werte Bezug nehmen, indem man eine Textersetzung in eckigen Klammern benutzt. Für die Ausgabe von Objektnamen mit bestimmtem bzw. unbestimmtem Artikel gibt es im englischen Original "[The noun]", "[the noun]", "[A noun]" oder "[a noun]". Diese enthalten aber keine Information über den benötigten Fall und stehen immer im Nominativ; dies gilt auch für die Textersetzungen, die in der Erweiterung Plurality von Emily Short definiert werden. Deshalb können wir sie für deutsche Ausgabetexte nicht flexibel einsetzen und müssen neue, fallspezifische Ausdrücke verwenden. Die neuen Textersetzungen, die auch die Benutzung der Erweiterung Plurality überflüssig machen, tragen jeweils den Namen des entsprechend flektierten männlichen Artikels (der, des, dem, den / ein, eines, einem, einen), weil dieser als Einziger den Kasus eindeutig repräsentiert.

Section: Objektnamen

Für die meisten Textersetzungen gibt es eine Variante mit großem Anfangsbuchstaben für Satzanfänge und eine mit kleinem Anfangsbuchstaben.

Objektnamen mit bestimmten Artikeln:

	"[Der <Objekt>] [Des <Objekt>] [Dem <Objekt>] [Den <Objekt>]"
	"[der <Objekt>] [des <Objekt>] [dem <Objekt>] [den <Objekt>]"

Objektnamen mit unbestimmten Artikeln:

	"[Ein <Objekt>] [Eines <Objekt>] [Einem <Objekt>] [Einen <Objekt>]"
	"[ein <Objekt>] [eines <Objekt>] [einem <Objekt>] [einen <Objekt>]"

Objektnamen mit Negativartikel:

	"[Kein <Objekt>] [Keines <Objekt>] [Keinem <Objekt>] [Keinen <Objekt>]"
	"[kein <Objekt>] [keines <Objekt>] [keinem <Objekt>] [keinen <Objekt>]"

Objektnamen ohne Artikel:

Im englischen Original reicht es, wenn man in Say-Texten Objektnamen ohne Artikel mit dem Objektnamen in eckigen Klammern ausgibt.

	The printed name of the Tisch is "klein[^] Tisch[-es]".

	say "[Tisch]";
	"kleiner Tisch"

Der so ausgegebene Objektname steht jedoch immer im Nominativ; um den jeweils benötigten Fall angeben zu können, gibt es folgende Möglichkeiten (mit deutschen und gleichbedeutenden englischen Phrasen):

	"[<Objekt> im <Kasus>]" (Kasus: Nominativ, Genitiv, Dativ, Akkusativ)
	"[<Object> with <case>]" (cases: nominative, genitive, dative, accusative)
	"kleiner Tisch / kleinen Tisches / kleinem Tisch / kleinen Tisch"

	"[<Objekt> bestimmt im <Kasus>]" (Ausgabe wie mit bestimmtem Artikel, nur ohne den Artikel)
	"[<Object> definite with <case>]"
	"kleine Tisch / kleinen Tisches / kleinen Tisch / kleinen Tisch"

	"[<Objekt> unbestimmt im <Kasus>]" (Ausgabe wie mit unbestimmtem Artikel, nur ohne den Artikel)
	"[<Object> indefinite with <case>]"
	"kleiner Tisch / kleinen Tisches / kleinen Tisch / kleinen Tisch."


Section: Pronomen, Hilfsverben und Verb-Endungen

Die Ausdrücke passen sich an Numerus und Genus des zuletzt genannten Objekts oder eines angegebenen Objekts an. Mit "zuletzt genanntem Objekt" ist das Objekt gemeint, das als letztes mit einer Textersetzung explizit angegeben wurde. Das zuletzt genannte Objekt heißt in GerX "previously named noun" und kann vom Autor in eigenen Name-Printing-Rules als Variable des Typs "Thing" befragt oder neu gesetzt werden.

Pronomen:

Auf das zuletzt genannte Objekt bezogen:

	"[Er] [Seiner] [Ihm] [Ihn]"
	"[er] [seiner] [ihm] [ihn]"


Mit angegebenem Objekt, falls es vom zuletzt genannten Objekt abweicht:

	"[Er <Objekt>] [Seiner <Objekt>] [Ihm <Objekt>] [Ihn <Objekt>]"
	"[er <Objekt>] [seiner <Objekt>] [ihm <Objekt>] [ihn <Objekt>]"

Hilfsverben:

Auf das zuletzt genannte Objekt bezogen:

	"[ist] [hat] [wird]"


Mit angegebenem Objekt, falls es vom zuletzt genannten Objekt abweicht:

	"[ist <Objekt>] [hat <Objekt>] [wird <Objekt>]"

Endungen für Verben:

Auf das zuletzt genannte Objekt bezogen:

	"[t] [et] [e]"


Mit angegebenem Objekt, falls es vom zuletzt genannten Objekt abweicht:

	"[t <Objekt>] [et <Objekt>] [e <Objekt>]"


Section: Relativpronomen

Zur Ausgabe von Relativpronomen, die sich an Genus und Numerus eines Objekts anpassen, stehen folgende Ausdrücke zur Verfügung:

	Auf das zuletzt genannte Objekt bezogen:

	"[*der*]"
	"[*dessen-deren*]"
	"[*dessen-derer*]" (für Präpositionen, die einen Genitiv verlangen)
	"[*dem*]"
	"[*den*]"

	"[*welcher*]"
	"[*welchem*]"
	"[*welchen*]"

	Mit angegebenem Objekt, falls es vom zuletzt genannten Objekt abweicht:

	"[*der* <Objekt>]"
	"[*dessen-deren* <Objekt>]"
	"[*dessen-derer* <Objekt>]" (für Präpositionen, die einen Genitiv verlangen)
	"[*dem* <Objekt>]"
	"[*den* <Objekt>]"

	"[*welcher* <Objekt>]"
	"[*welchem* <Objekt>]"
	"[*welchen* <Objekt>]"

Section: Wählbare Darstellung von "ß" und "ss"

Die Standard-Antworten der Library wurden so geschrieben, dass sich die Eszetts nachträglich anpassen lassen.

	Use Swiss dialect. veranlasst, dass alle "ß" als "ss" geschrieben werden.

	Use traditional dialect. (gemeint ist die alte deutsche Rechtschreibung) schreibt "ß" sowohl nach kurzem als auch langem Vokal.

Die Standardeinstellung ist die neue Schreibung: "ß" nach langem Vokal, "ss" nach einem kurzen.

	"[ß]": Eszett nach langem Vokal.

	"[ss]" oder "[~ß]" (gleichwertig): Eszett nach kurzem Vokal.

	Say "Au[ß]erdem ist der gesamte Fu[ß]boden na[ss]."

In der Schweiz:

	"Ausserdem ist der gesamte Fussboden nass."

In der alten Rechtschreibung:

	"Außerdem ist der gesamte Fußboden naß."

In der neuen Rechtschreibung (GerX-Standard):

	"Außerdem ist der gesamte Fußboden nass."

Im Normalfall wird ein Autor die Eszett-Phrasen wohl nicht benutzen, es sei denn, er plant, sein Spiel in unterschiedlichen Sprachfassungen herauszugeben (oder er schreibt eine Extension für die deutsche Extension).

Section: Exotisch: Wählbare Darstellung von "du"

	Use capitalized Du.

	oder

	Use capitalised Du.

veranlasst, dass alle Formen von "du" in den Standard-Texten groß geschrieben werden.

Will sich der Autor in seinen eigenen Say-Texten noch nicht sofort festlegen, ob er "du" groß oder klein schreiben soll, kann er die folgenden Ausdrücke benutzen:

	"[du]" "[dir]" "[dich]"
	"[dein]" "[deine]" "[deiner]" "[deines]" "[deinem]" "[deinen]"

	Say "Warum willst [du] denn unbedingt [deinen] Lesern alles verraten?"

Mit den Anweisungen

	Set Du to lower-case.
	Set Du to upper-case.

kann der Autor während des Spiels zwischen großem und kleinen Du wechseln.

Diese Textersetzungen werden wohl, wenn überhaupt, nur in Ausnahmefällen benutzt werden. Autoren von Extensions, die auf die deutsche Extension aufbauen, sollten ihre Standard-Antworten allerdings mit dem flexiblen "[du]" schreiben.


Section: Die universelle Endung für alle flektierten Adjektive

Zur korrekt flektierten Ausgabe von Endungen in angezeigten Objektnamen stehen Suffixe für Adjektive und Hauptworte zur Verfügung. Ob man alle Endungen für ein Ding korrekt angegeben hat, kann mit dem Debug-Befehl DEKLINIERE <DING> überprüft werden. Dieser Befehl steht nur während der Entwicklung zur Verfügung und wird beim Release entfernt.

Die universelle Adjektiv-Endung

	"[^]"

wird an den Stamm eines jeden flektierten Adjektivs, das Bestandteil des angezeigten Objektnamens ist, gehängt. Damit wird für jeden Fall die richtige Endung ausgegeben.

	The Tomate is a female thing. The printed name is "grün[^] Tomate". Understand "gruen" as the Tomate.

Die Adjektiv-Endung kann auch im indefinite article genutzt werden:

	The Murmeln are a plural-named thing in the playground. The printed name is "magisch[^] Murmeln". Understand "magisch" as the Murmeln.

	The indefinite article is "einig[^]".
	"Du siehst hier einige magische Murmeln."

Section: Endungen für Substantive

	"[-n]" für Plural-Substantive, die auf "e" enden. Im Dativ wird ein "n" angehängt.

	The printed name of the Zwerge is "Zwerge[-n]".
	"Die Zwerge, der Zwerge, den Zwergen, die Zwerge."

Die Endung kann auch für männliche Substantive, die auf "e" enden (der Affe, der Bote, der Bube, der Drache, der Hase, der Junge, der Knabe, der Kollege, der Kunde, der Löwe, der Neffe, der Russe usw.; Ausnahme: der Käse) benutzt werden.

	The printed name of the Affe is "Affe[-n]".
	"Der Affe, des Affen, dem Affen, den Affen."


	"[-en]" für männliche Substantive.

	The printed name of the Student is "Student[-en]".
	"Der Student, des Studenten, dem Studenten, den Studenten."


	"[-s]" für Substantive im Genitiv.

	The printed name of the Becken is "Becken[-s]".
	"Das Becken, des Beckens, dem Becken, das Becken."


	"[-es]" für Substantive im Genitiv.

	The printed name of the Haus is "Haus[-es]".
	"Das Haus, des Hauses, das Haus, dem Haus."

Section: Bestimmte Artikel

Möchte der Autor Namen wie "Karl der Große" verwenden, muss er besondere Ausdrücke für die bestimmten Artikel, nämlich "[der]", "[die]", oder "[das]", verwenden, damit der Artikel in Ausgabetexten flektiert wird. Für Plural-Artikel gibt es den Ausdruck "[die plural]", aber Plural-Namen mit Artikel kommen wohl eher selten vor.

	The printed name of Ivan is "Ivan[-s] [der] Schreckliche[-n]".
	The printed name of Gertrud is "Gertrud[-es] [die] Große[-n] von Helfta".
	The printed name of Hui Buh is "Hui Buh[-s] [das] Schlossgespenst[-s]".

Denkbar wäre auch der (eher unwahrscheinliche) Fall, dass man den Genus und den Numerus für den Artikel von einem bestimmten Objekt beziehen möchte. Dazu benutzt man dann folgende Form:

	The printed name of Gerd is "Graf[-en] Gerd [-der- Gerd] Mutige[-n]."

Jetzt wird der Genus von Gerd (Maskulinum) und der Numerus (Singular) für den Artikel herangezogen. Das ist in diesem Fall gleichbedeutend mit "[der]" (und eigentlich sinnlos). "[-der- Objekt]", "[-die- Objekt]" und "[-das- Objekt]" sind synonym zu verwenden. (Das wird normalerweise keiner benutzen, aber wenn man doch mal auf ein Objekt verweisen will, kann man das damit tun.)


Section: Manuelles Setzen der Suffixe

In manchen Situationen kann es notwendig sein, dass der Autor die Suffixe für ein Objekt manuell setzen muss, zum Beispiel bei Manipulationen der Ausgabe des Objektnamens vor, während oder nach der "printing the name of something activity" (Writing with Inform, Kap. 17.10).

	set <article mode> suffixes from <object> with <case>;

Setzt die Suffixe für ein Objekt in einem angegebenen Fall (case). Der article mode ist entweder bare-mode (für die Ausgabe ohne Artikel), definite-mode (mit bestimmtem Artikel) oder indefinite-mode (mit unbestimmtem Artikel).

Um den aktuellen Modus der Artikel zu bestimmen, gibt es folgenden Ausdruck:

	current article mode

Den aktuellen Artikelmodus verändert man mit

	set current article mode to <article mode>;
	

Section: Beispiele für die Verwendung von Textersetzungen und mögliche Ausgabetexte

In den folgenden Beispielen werden einige der Textersetzungen benutzt. Als Beispielobjekt dienen bunte Murmeln.

	The Murmeln are a plural-named thing. The printed name of the Murmeln is "bunt[^] Murmeln". Understand "bunt" as the Murmeln.

	Say "Hier [ist noun] nur [ein noun], [*der*] dich nicht so richtig überzeug[t]."
	Hier sind nur bunte Murmeln, die dich nicht so richtig überzeugen.


	Say "[Der noun], mithilfe [*dessen-derer*] du den Täter überführen könntest, [ist] verschwunden."
	Die bunten Murmeln, mithilfe derer du den Täter überführen könntest, sind verschwunden.


	Say "Du erinnerst dich an [den noun], [*dessen-deren*] Verbleib ungeklärt ist."
	Du erinnerst dich an die bunten Murmeln, deren Verbleib ungeklärt ist.


	Say "Wo [ist noun] nur [der noun], mit [*dem*] du den Staatsanwalt beeindrucken wolltest?"
	Wo sind nur die bunten Murmeln, mit denen du den Staatsanwalt beeindrucken wolltest?


	Say "'Haben Sie [den noun], [*den*] ich eben aufheben wollte, irgendwo gesehen?'"
	"Haben Sie die bunten Murmeln, die ich eben aufheben wollte, irgendwo gesehen?"


	Say "'Herr Staatsanwalt, [der noun], [*welcher*] vom Tatort entfernt wurd[e], bleib[t] unauffindbar.'"
	"Herr Staatsanwalt, die bunten Murmeln, welche vom Tatort entfernt wurden, bleiben unauffindbar."


	Say "Es ist sehr ärgerlich, dass [der noun] weg [ist], mit [*welchem*] du deine Kompetenz unter Beweis stellen wolltest."
	Es ist sehr ärgerlich, dass die bunten Murmeln weg sind, mit welchen du deine Kompetenz unter Beweis stellen wolltest.


	Say "Vielleicht kannst du [den noun], [*welchen*] du dringend brauchst, irgendwo wiederfinden."
	Vielleicht kannst du die bunten Murmeln, welche du dringend brauchst, irgendwo wiederfinden.

Section: Überprüfen der deklinierten angezeigten Objektnamen

Ob man alle Endungen und Artikel für das Objekt korrekt angegeben hat, kann mit dem Debug-Befehl DEKLINIERE <DING> überprüft werden. Dieser Befehl steht nur während der Entwicklung zur Verfügung und wird beim Release entfernt.

	Werther is an improper-named man in Wahlheim. The printed name is "jung[^] Werther[-s]". Understand "Werther" and "jung Werther" as Werther.

	The Pistole is a female thing carried by Werther. The printed name is "Pistole".

	>DEKLINIERE WERTHER
	Der junge Werther, des jungen Werthers, dem jungen Werther, den jungen Werther.
	Ein junger Werther, eines jungen Werthers, einem jungen Werther, einen jungen Werther.

	>DEKLINIER PISTOLE
	Die Pistole, der Pistole, der Pistole, die Pistole.
	Eine Pistole, einer Pistole, einer Pistole, eine Pistole.

In der ersten Zeile wird der Objektname mit den bestimmten Artikeln dekliniert, in der zweiten mit den unbestimmten Artikeln.

Und wir sehen, dass der junge Werther noch "ein junger Werther" sein kann. Doch Werther soll immer "der junge Werther" heißen. Also:

	The article of Werther is definite.

	>DEKLINIERE WERTHER
	Der junge Werther, des jungen Werthers, dem jungen Werther, den jungen Werther.
	Der junge Werther, des jungen Werthers, dem jungen Werther, den jungen Werther.

Jetzt ist alles richtig.


Section: Überprüfen der Vokabel- und Genusdefinitionen (Libcheck)

Im Debug-Modus (Not for release), also während der Entwicklung, werden bei Spielbeginn die Vokabel- und Genusdefinitionen von der Libcheck-Funktion automatisch auf Unstimmigkeiten geprüft. Objekte sollten nur einen einzigen Genus haben. Vokabeln sollten keine Umlaute und 'ß' enthalten, Verben möglichst ohne Endungen angegeben werden. Libcheck gibt bei Problemen einen Bericht mit Hinweisen zur Korrektur aus. Wenn alles in Ordnung ist, meldet sich Libcheck bei Spielbeginn überhaupt nicht zu Wort.

Die Überprüfung kann jederzeit mit dem Kommando LIBCHECK wiederholt werden. Möchte man den Test zu Spielbeginn niemals ausführen lassen, muss folgende Use-Option aktiviert werden:

	*: Use skip libcheck.

Während der Laufzeit kann der Test dann aber weiterhin mit dem Kommando LIBCHECK ausgeführt werden.


Section: Debug-Meldungen

Bei der Entwicklung von längeren Spielen kann es hilfreich sein, Debug-Meldungen in den Quelltext einzufügen, die dem Tester zeigen, an welcher Stelle des Quelltextes sich die Ausführung des Programms gerade befindet. Diese Meldungen werden nur angezeigt, wenn sich das Spiel im Debug-Modus befindet (zu erkennen am Kürzel "D" im Banner des Spiels) und zusätzlich noch die Option "Use debug messages." aktiviert wurde.

Die Debug-Meldungen werden mit "[debug]" eröffnet und mit "[end debug]" abgeschlossen. Die Idee zu diesem Verfahren stammt von Erik Temple.

Beispiel:

	Instead of drinking the Milch when it is sour:
		say "[debug]### Hier wird das Trinken der Milch abgefangen! ###[end debug]";
		say "Die Milch ist sauer, die kannst du nicht trinken.".

Chapter: Listen in einem bestimmten Kasus ausgeben

Section: Wie wird der Kasus angegeben?

Für das Schreiben von Listen gibt es in GerX erweiterte Phrasen, die die englischen Original-Phrasen ersetzen sollen. Letztere können weiterhin benutzt werden, sie geben jedoch alle Listen im Nominativ aus.

Listen mit Kasus werden analog zum englischen Inform ausgegeben, nur dass nach dem Objekt bzw. der Beschreibung der aufzulistenden Objekte auch noch der Fall angegeben wird. Dazu dient die Teilphrase "with <case>"; die cases sind nominative, genitive, dative, oder accusative.

Section: Den Inhalt eines Objekts auflisten

Als Anweisung:

	list the contents of <object> with <case>, <phrase options>;

Mögliche Phrasen-Optionen (phrase options), die kombiniert werden können:

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
	and/or with extra indentation

Als Say-Phrase:

	"[contents of <object> with <case>]" (unbestimmt)
	"[the contents of <object> with <case>]" (bestimmt)
	
	
Section: Unverschachtelte Inhaltslisten anhängen (Non-nested lists)

Bei Verwendung der Use-Option "non-nested lists" wird der Inhalt von Dingen in gesonderten Listen nach der Hauptinhaltsliste ausgeführt, wenn die Inhaltsliste mit der Listenoption "as a sentence" ausgegeben wird. Möchte man als Autor nun selbst unverschachtelte Inhaltslisten verwenden, fügt man nach dem Schreiben der Inhaltsliste eine der folgenden Phrasen hinzu:

	write the/-- sublists;
	
Schreibt die Sub-Listen direkt nach der Inhaltsliste. Dies ist die Standard-Variante.

	write the/-- sublists with line break;
	
Fügt vor die Sub-Listen einen Zeilenumbruch ein.

	write the/-- sublists with paragraph break;
	
Fügt vor die Sub-Listen einen Absatz ein.

	write the/-- sublists with space;
	
Fügt vor die Sub-Listen ein Leerzeichen ein.

	write the/-- inventory sublists;
	
Für die unverschachtelte Ausgabe des Inventars als Satz.

Ist die Option "non-nested lists" nicht aktiv, haben die aufgeführten Phrasen keinen Effekt.


Section: Einfache Listen

Mit unbestimmtem Artikel:

	"[a list of <description> with <case>]"
	"[A list of <description> with <case>]" (Großbuchstabe am Listenanfang)

Ohne Artikel:

	"[list of <description> with <case>]"

Mit bestimmten Artikel:

	"[the list of <description> with <case>]"
	"[The list of <description> with <case>]" (Großbuchstabe am Listenanfang)

Listen mit vorangestelltem "ist"/"sind":

	"[is-are a list of <description> with <case>]" (unbestimmt)
	"[is-are list of <description> with <case>]" (ohne Artikel)
	"[is-are the list of <description> with <case>]" (bestimmt)

Die Listen mit vorangestelltem "ist"/"sind" machen nur Sinn, wenn sie im Nominativ ausgegeben werden. Deshalb wird unabhängig vom angegebenen Fall der Nominativ zum Ausgeben der Liste herangezogen, womit sich die Phrasen genauso verhalten wie die Original-Phrasen ohne Kasus. Der Vollständigkeit halber werden die Phrasen mit Kasus aber trotzdem mit angeboten.

Section: Listen mit Objektinhalt

	"[a list of <description> with <case> including contents]"

Diese Phrase ignoriert eine aktivierte "Use non-nested lists"-Option und gibt die Liste immer verschachtelt aus. Die Inhaltslisten stehen im Nominativ, unabhängig vom Fall der Hauptliste; nur bei Akkusativ-Listen wird auch der Inhalt im Akkusativ ausgegeben.


Chapter: Neue Use-Optionen (Use options)

Section: Tiefere Einrückung und Aufzählungszeichen beim Inventar

	*: Use inventory indent.

Bewirkt eine tiefere Einrückung der einzelnen Ebenen (außer der ersten) bei der Anzeige des Inventars als Liste. Dies dient, besonders zusammen mit einer der folgenden zwei Optionen, der besseren Übersichtlichkeit des Inventars.

	*: Use inventory hyphen bullet.

Gibt vor jedem Eintrag im Inventar (als Liste) einen Spiegelstrich aus.

	*: Use inventory asterisk bullet.

Gibt vor jedem Eintrag im Inventar (als Liste) ein Sternchen aus.

Section: Listen nicht verschachtelt ausgeben

	*: Use non-nested lists.

Schreibt Listen nicht verschachtelt, sondern nacheinander. Anstelle der manchmal etwas unübersichtlichen Standard-Form

	Du siehst hier einen Holztisch (darauf einen Beutel (darin drei Bälle, eine Geldbörse (darin ein Knopf) und ein Bleistift) und einen Zettel), ...

wird die Liste so ausgegeben:

	Auf dem Holztisch sind ein Beutel und ein Zettel. In dem Beutel sind drei Bälle, eine Geldbörse und ein Bleistift. In der Geldbörse ist ein Knopf.

	*: Use non-nested lists with separate paragraphs.

Wie "Use non-nested lists.", nur werden die Unter-Listen in separaten Absätzen ausgegeben:

	Auf dem Holztisch sind ein Beutel und ein Zettel.

	In dem Beutel sind drei Bälle, eine Geldbörse und ein Bleistift.

	In der Geldbörse ist ein Knopf.

	*: Use list buffer size of at least <N>.

Klingt wie ein Minimum, meint jedoch einen Maximalwert. Damit kann man die Dimension der Listen-Puffer vergrößern, die für die Ausgabe der nicht verschachtelten Listen benutzt werden. Für <N> muss eine Zahl größer als der Default-Wert von 20 eingetragen werden, damit die Option Wirkung zeigt.

Section: Explizite Fehlermeldungen des Parsers

	*: Use explicit error messages.

Die Standard-Fehlermeldung "So etwas kannst du hier nicht sehen." wird durch explizite Meldungen ersetzt:

	>NIMM DEN GNARF
	Ich kenne das Wort "gnarf" nicht.

	>BETRACHTE ZETTEL BEUTEL
	Ich verstehe das Wort "beutel" in diesem Zusammenhang nicht.

Section: Manuelles Setzen der Pronomen

	*: Use manual pronouns.

Wird diese Option gewählt, werden die Pronomen nur auf Objekte gesetzt, die der Spieler direkt anspricht. Standardmäßig verweisen die Pronomen zunächst automatisch auf die in der Raumbeschreibung erwähnten Objekte.

Section: Eigene Debug-Meldungen anzeigen

	*: Use debug messages.

Aktiviert die Anzeige der Debug-Meldungen. Diese werden in Say-Texten mit "[debug] ... <Text> ... [end debug]" gekennzeichnet.

Section: Deskriptoren wie in der guten alten Zeit

	*: Use traditional descriptors.

Das volle Spektrum der Deskriptoren definieren, die überlesen werden. Diese Extension benutzt von Haus aus die reduzierten deform-Deskriptoren, d.h. es werden nur Artikel und 'dies' und 'jenes' überlesen. Das hat den Vorteil, dass der Autor die Possessivpronomen ('dein', 'mein', 'sein', 'ihr') als Vokabeln für ein Objekt angeben kann.

Section: "ß" und "ss": Schweizer Schreibweise oder alte Rechtschreibung

	*: Use traditional dialect.

Alte Rechtschreibung: Der Eszett-Platzhalter "[ss]" wird als "ß" ausgegeben.

	*: Use swiss dialect.

Die Eszett-Platzhalter "[ß]" und "[ss]" werden als "ss" ausgegeben.

Section: Exotisch: "Du" in den Standard-Texten immer groß ausgeben

Sollte der Autor darauf bestehen, dass alle Formen von "du" in den Standard-Meldungen groß geschrieben werden sollen ("Du", wie in Briefen), ist das mit der folgenden Option möglich.

	*: Use capitalized Du.

Die Textersetzungen "[du]", "[dein]", "[deinem]", "[deinen]", "[deiner]", "[dir]" und "[dich]", die der Autor für seine eigenen Say-Texte benutzen kann, sagen dann ebenfalls ein großes "Du".

Mit den Anweisungen

	Set Du to lower-case.
	Set Du to upper-case.

kann der Autor während des Spiels zwischen großem und kleinen Du wechseln.

Section: Das Abtrennen der Wortköpfe und -Schwänze aktivieren

	*: Use compound heads.

Benutzt die in der Tabelle "Table of compound heads (continued)" angegebenen Wortköpfe (s. nächstes Kapitel).

	*: Use compound tails.

Benutzt die in der Tabelle Table of compound tails (continued) angegebenen Wortschwänze (s. nächstes Kapitel).

Section: Zeilenumbruch vor dem Autorennamen im Banner des Spiels einfügen

	*: Use line break before printing the author's name.

Fügt einen Zeilenumbruch vor dem Autorennamen im Banner ein:

	AUF DER ÜBERHOLSPUR
	Ein schnelles Textabenteuer
	von Volker Rachow

anstatt

	AUF DER ÜBERHOLSPUR
	Ein schnelles Textabenteuer von Volker Rachow

Section: Die deform-Eigenschaft init benutzen

	*: Use init property.

Ermöglicht die Benutzung der deform-Eigenschaft init zum Initialisieren von Objekten mittels Einbindung von I6-Code.


Chapter: Neue oder erweiterte Standard-Aktionen und -Kommandos

Section: Einen Raum verlassen (room-leaving)

Viele Spieler versuchen intuitiv, den aktuellen Standort mit >VERLASSE RAUM oder ähnlichen Kommandos zu verlassen, was naheliegend ist. Trotzdem ist dies kein Standardverhalten des Inform-Weltmodells. In GerX ist das Verlassen eines Raums auf diese Weise möglich. Die neue Aktion, die dieses Verhalten bewirkt, heißt "room-leaving".

	>VERLASS
	>VERLASS (DEN/DIESEN) ORT/RAUM/PLATZ/STANDORT
	
Wenn ein Raum nur einen einzigen offensichtlichen Ausgang hat, wird ein Gehen in die entsprechende Richtung versucht. Gibt es mehrere Richtungen, in die man gehen kann, fragt das Spiel nach und bittet um genauere Richtungsangaben.

Der aktuelle Raum kann auch mit seinen Synonymen angesprochen werden. Dazu muss das Vokabular für den Raum definiert werden.

	The Lab is a neuter room. The printed name is "Labor". Understand "Labor" and "Laboratorium" as the Lab.
	
Nun kann man das Labor auch per

	>VERLASS LABOR/LABORATORIUM
	
verlassen.


Section: Inventar als Satz anzeigen

Im englischen Original-Inform wird das Inventar (die Dinge, die die Spielerfigur bei sich trägt) standardmäßig nur als Liste angezeigt. In GerX wird, genau wie in deform, eine Möglichkeit zum Umschalten zwischen der Anzeige als Liste und der Ausgabe als vollständiger Satz angeboten. Die zwei neuen Aktionen, die das Umschalten steuern, heißen "wide taking inventory" und "tall taking inventory".

Anstelle von I können in den folgenden Beispielen natürlich auch die synonymen Kommandos INVENTAR, INV, BESITZ oder EIGENTUM verwendet werden.

	>I QUER/SATZ/BREIT
	>I ALS SATZ

Nach Eingabe eines dieser Kommandos wird das Inventar als Satz angezeigt und der Inventar-Stil (dargestellt durch die Variable inventory style) auf "wide inventory" gesetzt. Beim nächsten einfachen Aufruf des Inventars z.B. per >I wird der aktuelle Stil zur Ausgabe benutzt. 

	>I
	Du hast ein Glas (darin Wasser) und einen Apfel bei dir.
	
Mit aktivierter Use-Option "non-nested lists" sieht es so aus:

	>I
	Du hast ein Glas und einen Apfel bei dir. In dem Glas ist Wasser.

Die Kommandos

	>I HOCH/LISTE/LANG
	>I ALS LISTE
	
zeigen das Inventar als Liste an (der Inform-Standard) und setzen den Inventar-Stil (inventory style) auf "tall inventory".

Es ist jederzeit möglich, die Variable inventory style auf einen der Werte "wide inventory" (Satz) oder "tall inventory" (Liste) zu setzen. Möchte man z.B. das Spiel standardmäßig mit der Einstellung "Inventar als Satz anzeigen" beginnen, kann die Variable gleich bei Spielbeginn geändert werden:

	When play begins: now inventory style is wide inventory.
	

Chapter: Spezielles Parsen

Section: Wortköpfe und -schwänze (Compound Heads und Compound Tails) von langen Wörtern abtrennen

Inform verarbeitet im Z-Code-Format nur die ersten neun Zeichen einer Vokabel. Auch im Glulx-Format ist das der Standard, die Länge der Lexikoneinträge lässt sich aber per

	Use DICT_WORD_SIZE of <N>.

ändern. Für Z-Code gibt es diese Möglichkeit leider nicht.

Bei der Verwendung von Vokabeln, die länger als 9 Zeichen sind, kann es also vorkommen, dass sich Objekte nicht unterscheiden lassen.

	Understand "Streichholz" as the Streichholz.
	Understand "Streichhoelzer" as the Packung Streichhölzer.

In dem Beispiel würden die Vokabeln für die zwei Objekte intern jeweils gleich lauten, nämlich 'streichho'. Der Parser kann das Streichholz deshalb nicht von den Streichhölzern unterscheiden. Um dieses etwas altertümliche Limit zu umgehen, kann man in GerX, wie in deform auch, Wortköpfe oder -schwänze von langen Wörtern abschneiden lassen, sodass der Parser mit zwei kürzeren Vokabeln arbeiten kann.

Der Autor definiert folgende Tabelle

	Table of compound heads (continued)
	Head    	n
	"streich"    	0

und aktiviert ihre Berücksichtigung beim Parsen mit der Use-Option "Use compound heads.".
Jetzt lassen sich Streichholz und Streichhölzer folgendermaßen definieren:

	The Packung Streichhölzer is a female container. Understand "streich-" and "hoelzer" as the Packung Streichhölzer.
	The Streichholz is a neuter thing. Understand "streich-" and "holz" as the Streichholz.

Wichtig ist der Trennstrich am Ende der Wortkopf-Vokabel. Analog zum Abschneiden der Köpfe kann man die Wörter auch vom Ende her abschneiden lassen.

	Table of compound tails (continued)
	Tail    	n
	"lampe"    	0

Jetzt kann man für jede Lampe auch noch "messing-", "taschen-" oder sonst irgendwas angeben. Auch hier muss der erste Wortbestandteil mit einem Trennstrich abgeschlossen werden.

Wichtig: Beide Tabellen benötigen pro Zeile zwei Einträge. Die Zahl n kann immer Null sein, da sie zurzeit noch keine Verwendung findet.


Section: Zwillinge und Synonyme (Twins und Synonyms)

Die deform-Arrays Twins und Synonyms lassen sich bislang nur als I6-Code einbinden:

	Include (-
		Array Twins table
		'mc'			'kenzie'	"mckenzie"
		;

		Array Synonyms table
		'fuers'				"fuer das"
		'vorsichtig' 		"";
	-) after "Definitions.i6t".

Wichtig ist in den I6-Arrays, dass die/das Ausgangswort/e in einfachen Hochkommas angegeben wird, das Zielwort jedoch in Anführungsstrichen.

Es gibt aber eine I7-Alternative:

	After reading a command:
	if the player's command includes "mc kenzie", replace the matched text with "mckenzie".

	After reading a command:
	if the player's command includes "fuers":
		replace the matched text with "fuer das";
	otherwise:
		if the player's command includes "vorsichtig", cut the matched text.


Section: Englische Richtungsabkürzungen verbieten

Die englischen Richtungsabkürzungen E (East), NE (Northeast), SE (Southeast), D (Down) und U (Up) stehen dem Spieler standardmäßig zur Verfügung. Um die Abkürzungen aus dem Vokabular zu entfernen, kann der Autor Folgendes schreiben:

	*: The up object translates into I6 as "up_object".

	EnglishShortDirections is a kind of value. The EnglishShortDirections are d, ne, se, and e.

	After reading a command (this is the block English abbreviated directions rule):
		if the player's command includes "[EnglishShortDirections]":
			if the explicit error messages option is active:
				say "Ich kenne das Wort '[matched text]' nicht.";
			otherwise:
				issue miscellaneous library message number 27;
			reject the player's command.

Das up object muss auf I6-Ebene von "u_obj" in irgendetwas Anderes umbenannt werden (hier: up_object), damit das I6-Implicit-Up-Token "u" nicht mehr als "up" versteht. Je nachdem, ob explizite oder allgemeine Parser-Fehlermeldungen verwendet werden, wird eine entsprechende Nachricht ausgegeben und die Spielereingabe abgewiesen.


Chapter: Spezielle Grammatik-Token (Understand tokens)

Section: Dich und dir

	"[dich]": "dich / mich / uns / euch"

	Understand "leg [dich] hin" as sleeping.

Dieses Token wird als "dich", "mich", "uns" oder "euch" verstanden. Das spart einiges an Arbeit, weil man nicht alle Möglichkeiten einzeln angeben muss.

	"[dir]": "dir / mir / uns / euch"

	Understand "nimm [dir] [things]" as taking.

Dies wird als optionales "dir" verstanden, das heißt, auf das "nimm" kann "dir", "mir", "uns" oder "euch" folgen, es muss aber nicht sein.

	>NIMM ZWEI BROTE

und

	>NIMM DIR ZWEI BROTE

werden gleichermaßen interpretiert.

Section: Ein Satzelement als Dativ kennzeichnen (Dativ-Token)

	"[dativ]" / "[dative]"

Kennzeichnet ein nachfolgendes Token als Dativ.

Wo kommt das zum Einsatz? Hier mal eine Definition ohne Dativ-Token für ein Verb, das den Dativ verlangt:

	Understand "stocher in [something] herum" as poking.

Wenn der Spieler nun bei der Eingabe das Objekt unterschlägt, fragt das Spiel nach:

	>STOCHER
	Worein willst du stochern?

Diese Frage ist nicht ganz korrekt, weil das Spiel nicht weiß, dass das Verb den Dativ verlangt. Also teilen wir es mit:

	Understand "stocher in [dativ] [something] herum" as poking.

Jetzt fragt das Spiel:

	>STOCHER
	Worin willst du stochern?

	>PUDDING
	Du stocherst in dem Pudding herum.

Vor dem Dativ-Token stehen oft Präpositionen. Um fehlerhafte oder unsinnige Parser-Nachfragen zu vermeiden, sollten mit Schrägstrich gruppierte Präpositionen aufgelöst werden. Ein Beispiel aus den vordefinierten Verben:

Die Defininition mit gruppierten Präpositionen:

	Understand "nimm platz auf/in [dativ] [something]" as entering.

	Im Spiel:

	>NIMM PLATZ
	Was willst du platz aufnehmen?

	>HÄ?

Korrekt ist es bei der Definition mit aufgelösten Präpositionen:

	Understand "nimm [substantiv] platz auf [dativ] [something]" as entering.
	Understand "nimm [substantiv] platz in [dativ] [something]" as entering.

	Im Spiel:

	>NIMM PLATZ
	Worauf willst du Platz nehmen?

Section: Ein Satzelement als Substantiv kennzeichnen (Substantiv-Token)

	"[substantiv]" / "[substantive]"

Kennzeichnet ein nachfolgendes Wort im Satzmuster als Substantiv. So kann der Parser bei Rückfragen den Infinitv besser rekonstruieren.

	Understand "nimm [substantiv] platz auf [dativ] [something]" as entering.

Jetzt wird der Infinitv korrekt als "Platz nehmen" gebildet. Ohne Substantiv-Token würde der Parser "platznehmen" schreiben.

	Im Spiel:

	>NIMM PLATZ
	Worauf willst du Platz nehmen?


Section: Optionale Präpositionen

Wenn in einem Satz Präpositionen verwendet werden können, aber nicht unbedingt vorhanden sein müssen, kann man das folgende Token verwenden. Für die Präposition werden auch die jeweiligen Alternativen verstanden.

	"[hinein]": "hinein / rein / darein / herein"

	Understand "geh in [something] [hinein]" as entering.


Die Anweisungen

	>GEH INS BETT

und

	>GEH INS BETT HINEIN

sind gleichwertig.

Weitere optionale Präpositionen:

	"[dagegen]": "dagegen" / "gegen"
	"[daran]": "daran" / "dran" / "ran" / "an"
	"[darauf]": "darauf" / "drauf" / "herauf" / "rauf" / "hinauf"
	"[darüber] oder [darueber]": "darüber" / "hinüber" / "drüber" / "herüber"
	"[darum]": "darum" / "drum" / "herum" / "rum"
	"[darunter]": "darunter" / "drunter"
	"[heraus]": "heraus" / "hinaus" / "raus" / "daraus"
	"[herunter]": "herunter" / "hinunter" / "runter"
	"[hindurch]": "hindurch" / "durch"
	"[hinüber] oder [hinueber]": "hinüber" / "darüber" / "drüber" / "herüber"
	"[nach]": "nach"
	"[weg]": "weg" / "hinweg" / "fort" / "ab"

Section: Erzwungene Präpositionen

	"[force nach]" / "[force in]"

Prüft den gesamten Satz und lässt das Satzmuster nur zu, wenn es das Wort "nach" bzw. "in" enthält.

	"[force nach in]"

Hier müssen "nach" und "in" im Satz vorhanden sein.


Section: Pronominaladverbien

Diese Token tragen "noun" als festen Bestandteil ihres Namens. Das ist nicht zu verwechseln mit der Variablen "noun", mit der man sich in Textausdrücken auf ein Objekt beziehen kann.

	"[noun dahinter]"

	Understand "schau [noun dahinter] [nach]" as looking under.

Dieses Token wird als Adverb verstanden, das sich auf das zuletzt angesprochene Objekt, das keine Person ist, bezieht. Dadurch wird folgende Art von Dialogen ermöglicht:

	>BETRACHTE BILDERRAHMEN
	Der Rahmen steht etwas von der Wand ab.

Jetzt ist der Bilderrahmen das zuletzt angesprochene Objekt und das Pronomen "dahinter" bezieht sich auf ihn.

	>SCHAU DAHINTER
	Hinter dem Bilderrahmen findest du einen Briefumschlag.

Weitere Pronomen:

	"[noun darunter]"
	"[noun dagegen]"
	"[noun darüber] / [noun darueber]"
	"[noun daran]"
	"[noun darum]"
	"[noun darauf]"
	"[noun damit]"
	"[noun herunter]"
	"[noun hindurch]"
	"[noun hinein]"


	"[held hinein]"
	"[held darauf]"

Die "[held ...]"-Token verhalten sich wie die noun-Token, nur dass sie verlangen, dass ein Ding beim Spieler ist und ein implizites Taking versuchen.

Pronomen erzwingen:

	"[force pronoun]"

Dieses Token kann in Verbindung mit Präpositionen verwendet werden; so ist z.B.

	Understand "spiel [force pronoun] damit" as playing.

gleichbedeutend mit

	Understand "spiel [noun damit]" as playing.
	
Neue, nicht vordefinierte, Pronominaladverbien können damit realisiert werden, wie z.B. "davor":

	Understand "knie [force pronoun] davor nieder" as genuflecting in front of it.
	
Das Wort im Satzmuster, das auf "[force pronoun]" folgt ("davor"), wird als Pronomen für das zuletzt angesprochene Substantiv, das keine Person ist, interpretiert. Nun ist folgende Art von Dialog möglich:

	>BETRACHTE ALTAR
	Ein alter Altar.
	
	>KNIE DAVOR NIEDER
	Du kniest dich vor den Altar.

Um zu prüfen, ob der Bezug zu einem Substantiv durch ein Pronominaladverb hergestellt wurde, benutzt man folgende Phrase:

	... whether/if the/a noun has been supplied by a pronominal adverb ...
	
Um den Bezug zu löschen, schreibt man

	reset the pronominal adverb;
	
Diese Phrasen werden beispielweise in der GerX-Rule "adjust the pronominal adverb reference when removing" benutzt.
	
	
Chapter: Die Extensions "Basic Screen Effects", "Locksmith", "Menus" und "Rideable Vehicles"

Für die in I7 integrierten Erweiterungen Rideable Vehicles von Graham Nelson sowie Locksmith, Menus und Basic Screen Effects von Emily Short bringt GerX schon deutsche Übersetzungen mit. Die Installation zusätzlicher Erweiterungen ist nicht notwendig. Die Original-Extensions müssen vor der German-Extension eingebunden werden, damit die englischen Standardmeldungen und Verbendefinitionen durch deutsche Entsprechungen ersetzt werden.

Das Beispiel C "John Malkovichs Toilette" demonstriert die Benutzung der Locksmith-Erweiterung.


Chapter: GerX-Entwicklung

Section: Updates

Die aktuellste Version der GerX-Erweiterung steht unter

	"http://ifiction.pageturner.de/inform7/"

zum Download bereit.

Fehlermeldungen und Verbesserungsvorschläge sind immer herzlich willkommen!

	"GerX@pageturner.de"

	"http://forum.ifzentrale.de"

Maintainer der GerX-Erweiterung sind Michael Baltes und Christian Blümke.


Section: Versionshistorie

Eine Übersicht über ältere Versionen und Änderungsprotokolle gibt es im GerX-Archiv:

	"http://ifiction.pageturner.de/inform7/archiv/index.html"


Example: * Die Jadestatue - Martin Oehms Jade-Beispiel für Inform 7. Die ausführlich kommentierte Version gibt es unter "http://www.martin-oehm.de/jade/i7-code.html". Dieses Beispiel benutzt die "Denglisch-Methode" zum Definieren von Objekten, die in Kapitel 4.2 beschrieben ist.

	*: "Die Jadestatue" by Martin Oehm

	The story headline is "Ein interaktives Exempel".

	The story description is "Das Jade-Beispiel für Inform 7".

	Include German by Team GerX.

	Lichtung im Dschungel is a room. "Du stehst auf einer Lichtung im dichten Dschungel. Im Norden steht ein alter, von Ranken überzogener Schrein. Im Süden führt ein schmaler Pfad zurück in die Zivilisation."

	Instead of going south in the Dschungel when the player has the Jadestatue: say "Du schaffst es, mit der Statue wieder zurück in die Zivilisation zu gelangen."; end the story saying "Du hast gewonnen".

	Instead of going south in the Dschungel, say "Nicht ohne die Statue!".

	Instead of going nowhere from the Dschungel, say "Dort ist der Dschungel zu dicht, es gibt keinen Pfad in diese Richtung."

	A faustgross Stein is in the Dschungel. It is male. "In der Nähe des Schreins liegt ein glatter, runder Stein im Gras." Instead of examining the Stein, say "Der Stein ist so groß wie eine Faust und außergewöhnlich glatt und rund." Understand "gross", "glatt" and "rund" as Stein. The printed name of the Stein is "faustgroß[^] Stein". The Stein is portable.
	
	The alt Schrein is scenery in the Dschungel. It is male. Instead of examining the Schrein, say "Der alte Toltekenschrein ist fast komplett mit Efeu überwuchert." Instead of entering the Schrein, try going north. Understand "toltekisch", "Efeu" and "Ranken [p]" as Schrein. The printed name of the Schrein is "alt[^] Schrein".
	
	Im Schrein is a room. It is north of the Dschungel. "In dem kleinen Schrein ist es dunkel, nur wenig Licht fällt durch das halb verfallene Dach. Ein großer Lichtstrahl fällt auf eine Steinsäule in der Mitte des Schreins.[paragraph break]Die Lichtung liegt im Süden." Outside from Im Schrein is the Dschungel.
	
	The Steinsaeule is a supporter in Im Schrein. It is female. The printed name is "Steinsäule". Instead of examining the Steinsaeule, say "Die Säule ist aus glattem Stein gehauen, etwas mehr als einen Meter hoch und oben flach, wie ein Podest." Understand "Saeule", "Podest [n]" and "Steinpodest [n]" as Steinsaeule.
	
	The Jadestatue is on the Steinsaeule. It is female and portable. Instead of examining the Jadestatue, say "Es ist die Statue einer toltekischen Gottheit, komplett aus grüner Jade geschnitzt. Sie glänzt und sieht sehr wertvoll aus." Understand "gruen", "klein", "Statue", "Figur", "Jadestatue" and "Jadefigur" as Jadestatue.
	
	Instead of taking the Jadestatue when the Jadestatue is on the Steinsaeule and the Stein is not on the Steinsaeule: say "Als du das Gewicht der Statue von der Säule nimmst, hörst Du ein klickendes Geräusch. Kurz darauf wirst du von Giftpfeilen durchbohrt."; end the story saying "Du bist gestorben".
	
	When play begins: say "Endlich! Nach tagelangem Suchen im Dschungel stößt du auf eine Lichtung. Und auf etwas mehr. Vielleicht ist dies der Ort, an dem sich die Jadestatue befindet?[paragraph break]".
	
	Test me with "s / u mich / i / nimm den Stein / untersuche ihn / i / n / lege Stein auf Säule / untersuche die Statue / nimm sie / i / s / s".


Example: * Der Mantel der Finsternis - Eine Übersetzung des Demo-Spiels "Cloak of Darkness" von Roger Firth, basierend auf der Inform-7-Version von Graham Nelson und Emily Short. Dieses Beispiel benutzt die "einsprachige Methode" zum Definieren von Objekten, die in Kapitel 4.3 beschrieben ist.

	*: "Der Mantel der Finsternis"

	The story headline is "Ein einfaches Demo-Textadventure."

	Include German by Team GerX.

	The maximum score is 2.

	A thing is usually privately-named. A room is usually privately-named.

	The Foyer of the Opera House is a room. The printed name is "Foyer der Oper". "Du stehst in einer großen, prächtig in Rot und Gold dekorierten Eingangshalle. Funkelnde Kronleuchter hängen von der Decke herab. Der Ausgang zur Straße liegt im Norden, weitere Türen befinden sich im Süden und Westen."

	Instead of going north in the Foyer, say "Du bist doch gerade erst angekommen, und draußen scheint das Wetter ohnehin nur noch schlechter zu werden."
	
	The Cloakroom is west of the Foyer. The printed name is "Garderobe". "An den Wänden dieses kleinen Raumes befanden sich offenbar einmal Reihen von Kleiderhaken aus Messing, von denen jetzt nur noch einer geblieben ist. Der Ausgang ist eine Tür im Osten."
	
	In the Cloakroom is a supporter called the small brass hook. It is a male scenery. The printed name is "klein[^] Messinghaken[-s]".
	
	Understand "klein", "haken", "messinghaken", "kleiderhaken" and "haekchen [n]" as the hook.
	
	The description of the hook is "Es ist nur ein einfacher Kleiderhaken aus Messing, [if something is on the hook]mit [a list of things on the hook with dative] daran[otherwise]der an die Wand geschraubt ist[end if]."
	
	The Bar is south of the Foyer. The printed name of the Bar is "Foyer-Bar". The Bar is dark. "Die Bar ist nicht halb so prächtig, wie du annahmst, nachdem du das Foyer im Norden gesehen hast. Sie ist völlig leer, bis auf das Sägemehl am Boden, in dem du eine hingekritzelte Nachricht erkennen kannst."
	
	The scrawled message is female scenery in the Bar. The printed name is "krakelig[^] Nachricht". Understand "krakelig", "gekrakelt", "gekitzelt", "Nachricht", "Botschaft", "Schrift", "Boden [m]", "Saegemehl [n]" as the message.
	
	Neatness is a kind of value. The neatnesses are neat, scuffed, and trampled.
	
	The message has a neatness. The message is neat.
	
	Instead of examining the message:
		increase score by 1;
		say "Die Nachricht, fein säuberlich in das Sägemehl geschrieben, lautet:";
		end the story saying "Du hast gewonnen".
	
	Instead of examining the trampled message:
		say "Die Nachricht wurde zertrampelt. Du kannst gerade noch folgende Worte entziffern:";
		end the story saying "Du hast verloren".
	
	Instead of doing something other than going in the bar when in darkness:
		if the message is not trampled, now the neatness of the message
		is the neatness after the neatness of the message;
		say "Im Dunkeln? Du könntest hier leicht etwas durcheinander bringen."
	
	Instead of going nowhere from the bar when in darkness:
		now the message is trampled;
		say "Es ist keine gute Idee, im Dunkeln hier herumzutappen."
	
	The velvet cloak is a male thing worn by the player. The printed name of the cloak is "Samtmantel[-s]". The cloak can be hung or unhung. Understand "dunkel", "schwarz", "benetzt", "Samtmantel", "Satinmantel", "Samt [n]", "Satin [n]", "Mantel", "Umhang", "Gewand [n]" as the cloak. The description of the cloak is "Ein schöner Samtmantel, mit Satin durchzogen und von Regentropfen leicht benetzt. Er ist so tief schwarz, dass es fast scheint, als entzöge er dem Raum jegliches Licht."
	
	Carry out taking the cloak:
		now the bar is dark.
	
	Carry out putting the unhung cloak on something in the cloakroom:
		now the cloak is hung;
		increase score by 1.
	
	Carry out putting the cloak on something in the cloakroom:
		now the bar is lit.
	
	Carry out dropping the cloak in the cloakroom:
		now the bar is lit.
	
	After putting the cloak on the hook:
		say "Du hängst den Mantel an den Haken."
	
	Instead of dropping or putting the cloak on when the player is not in the cloakroom:
		say "Dies ist nicht der richtige Ort, um einen so schönen Mantel herumliegen zu lassen."
	
	When play begins:
		say "[paragraph break]Du eilst durch die verregnete Novembernacht und bist froh, die strahlenden Lichter der Oper zu sehen. Es ist überraschend, dass hier nicht mehr Menschen sind, aber was erwartest du von so einem einfachen Beispiel ... ?"
	
	Understand "haeng [something preferably held] an/auf [something]" as putting it on.
	
	Test me with "s / n / w / inventar / häng mantel an haken / o / s / lies nachricht".


Example: * John Malkovichs Toilette - Eine Übersetzung des Beispiels "John Malkovich's Toilet" aus der in I7 enthaltenen Locksmith-Erweiterung von Emily Short. Es wird die "einsprachige Methode" zum Definieren von Objekten benutzt, die in Kapitel 4.3 beschrieben ist.


	*:"John Malkovichs Toilette"

	Include Locksmith by Emily Short.

	Include German by Team GerX.

	A thing is usually privately-named. A room is usually privately-named.

	The Bathroom is a room. The printed name is "Badezimmer".

	The bathroom door is a female door. It is north of the Bathroom and south of the Bedroom. It is lockable and locked. The printed name of the bathroom door is "Badezimmertür". Understand "Tuer", "Badezimmertuer" and "Tuer des/zum Badezimmer" as the bathroom door. The printed name of the bedroom is "Schlafzimmer".

	Before unlocking keylessly the bathroom door:
		if the bathroom door is unlocked, say "[Der bathroom door] ist schon unverriegelt." instead;
		try turning the latch instead.

	Before locking keylessly the bathroom door:
		if the bathroom door is locked, say "[Der bathroom door] ist sicher verriegelt." instead;
		try turning the latch instead.

	Before locking the bathroom door with something:
		say "Die Badezimemrtür lässt sich nur verrieglen und nicht mit einem Schlüssel abschließen." instead.

	Before unlocking the bathroom door with something:
		say "Die Badezimmertür ist verriegelt und lässt sich nicht mit einem Schlüssel öffnen." instead.

	The latch is part of the bathroom door. "Ein drehbarer Knopf, der die Tür verriegelt." Understand "Knopf", "Riegel" and "drehbar" as the latch. The description of the bathroom door is "Uninteressant bis auf den Knopf zum Verriegeln der Tür." The printed name of the latch is "drehbar[^] Riegel".

	Instead of turning the latch:
		if the bathroom door is locked begin;
			say "Klick! Du drehst den Knopf und die Tür ist entriegelt[if the door is open] und offen[end if].";
			now the bathroom door is unlocked;
		otherwise;
			say "Klick! Du drehst den Knopf und die Tür ist verriegelt[if the door is open], aber offen; das Schloss wird einschnappen, sobald du die Tür schließt[end if].";
			now the bathroom door is locked;
		end if.

	The little black oval door is a female door. It is west of the Bathroom and east of Oblivion. It is lockable and locked. The printed name is "klein[^] schwarz[^] oval[^] Tür". Understand "klein", "schwarz", "oval" and "Tuer" as the oval door. The description of the oval door is "Sie befindet sich in der Wand des Duschbereichs und lässt sich wer weiß wo öffnen. Du bist dir sicher, dass sie gestern noch nicht da war." The printed name of Oblivion is "Vergessenheit".

	The onyx key unlocks the oval door. It is in the Bedroom. The onyx key is male. "Auf dem Boden liegt kantig und schwarz von der Sonne beleuchtet [ein onyx key]." The printed name of the onyx key is "Onyxschlüssel". Understand "Schluessel", "Schluessel aus Onyx" and "Onyxschluessel" as the onyx key.

	Test me with " u badezimmertür / schließ ovale tür auf / schließ badezimmertür auf / g / gehe durch badezimmertür / nimm schlüssel / schließ badezimmertür ab / schließ badezimmertür / s / schließ badezimmertür mit dem onyxschlüssel ab / w"

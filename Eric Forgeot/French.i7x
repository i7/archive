Version 9/110414 of French by Eric Forgeot begins here.

"Quelques modifications des regles de base pour supporter le francais : To make French the language of play."

[designed for Inform7 6G60]


Part 1 - French specifics

Use French Language translates as (- Constant French; -). 
[Use French Language. ]
[Seconde personne du pluriel (politesse) au présent]

Use French 3PSPa Language translates as (- Constant French3PSPa; -).
[Use French 3PSPa Language.]
[troisième personne du singulier au passé]

Use French 1PSPa Language translates as (- Constant French1PSPa; -).
[Use French 1PSPa Language.]
[1ère personne du singulier au passé]

Use French 1PSPr Language translates as (- Constant French1PSPr; -).
[Use French 1PSPr Language.]
[1ère personne du singulier au présent]

Use French 3PSPr Language translates as (- Constant French3PSPr; -).
[Use French 3PSPr Language.]
[3ème personne du singulier au présent]

[utilisé pour : vous pouvez voir etc...]
To say personne du joueur:
	say "[if the French 3PSPa Language option is active or the French 3PSPr Language option is active]il[otherwise if the French Language option is active]vous[otherwise]je[end if]". 

To say personne du joueur en capital: [I don't use ''in title case'' because it takes too much memory just for this...]
	say "[if the French 3PSPa Language option is active or the French 3PSPr Language option is active]Il[otherwise if the French Language option is active]Vous[otherwise]Je[end if]". 

To say verbe pouvoir du joueur:
say "[if the French 3PSPa Language option is active]pouvait[otherwise if the French 3PSPr Language option is active]peut[otherwise if the French 1PSPa Language option is active]pouvais[otherwise if the French 1PSPr Language option is active]peux[otherwise]pouvez[end if]".


A thing can be female. A door can be female. [The indefinite article of a door is "la".]
[ pose pb : A device is always an Inform library supporter.]

[ 1=masculino, 2=femenino,
  3=masculino plural, 4= femenino plural ]

A thing has a number called the gender.

[TODO 5Z71 : Gender is a kind of value. The gender are single male, single female, plural male and plural female.]

[pose pb : The gender translates into Inform as "gender".]

[The description of a player-character is always "Vous êtes comme à votre habitude." ] 
  [doesn't work in the french lib, it must be set by the author]

The description of yourself is 
		"[if the French 3PSPa Language option is active]Il était comme d'habitude.
		[otherwise if the French 3PSPr Language option is active]Il est comme d'habitude.
		[otherwise if the French 1PSPa Language option is active]J[']étais comme d'habitude.
		[otherwise if the French 1PSPr Language option is active]Je suis comme d'habitude.
		[otherwise]Vous êtes comme d'habitude.
	[end if]"

Part 2 - French directions

A direction has a text called printed name.
The printed name of north is "nord".
The printed name of south is "sud".
The printed name of east is "est".
The printed name of west is "ouest".

The printed name of northeast is "nord-est".
The printed name of southwest is "sud-ouest".
The printed name of southeast is "sud-est".
The printed name of northwest is "nord-ouest".

The printed name of inside is "dedans".
The printed name of outside is "dehors".
The printed name of up is "en haut".
the printed name of down is "en bas".


Understand "gauche" as west.
Understand "ouest" as west.
Understand "o" as west.
Understand "droite" as east.
Understand "est" as east.

Understand "sud" as south.
Understand "nord" as north.	
Understand "bas" as down.
Understand "haut" as up.
Understand "remonter" as up.

Understand "nord-est/nordest" as northeast.
Understand the command "no" as something new.
Understand "nord-ouest/nordouest" or "no" as northwest. [toujours problème de 'saying no']
Understand "sud-ouest/sudouest" or "so" as southwest.
Understand "sud-est/sudest" or "se" as southeast.


Include (- has proper, -) when defining up. [para evitar 'el arriba']
Include (- has proper, -) when defining down.
Include (- has proper, -) when defining inside.
Include (- has proper, -) when defining outside.

Part 3 - Replacing English verbs

[I don't remove the english verbs yet, they could be useful to some players ?
I'll create a way to desactive them later anyway, when all the verbs in French will be working correctly.
Here is the list anyway...

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
Understand the command "sorry" as something new.
Understand the command "shit" as something new.
Understand the command "fuck" as something new.
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
Understand the command "kill" as something new.
Understand the command "punch" as something new.
Understand the command "thump" as something new.
Understand the command "wait" as something new.
Understand the command "z" as something new.
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
Understand the command "squash" as something new.
Understand the command "squeeze" as something new.

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
Understand the command "t aste" as something new.
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
Understand the command "f asten" as something new.
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

Understand the command "score" as something new.
Understand the command "full score" as something new.
Understand the command "quit" as something new.
Understand the command "q" as something new.
Understand the command "save" as something new.
Understand the command "restart" as something new.
Understand the command "restore" as something new.
Understand the command "" as something new.
Understand the command "version" as something new.
Understand the command "script" as something new.
Understand the command "transcript" as something new.
Understand the command "superbrief" as something new.
Understand the command "short" as something new.
Understand the command "verbose" as something new.
Understand the command "long" as something new.
Understand the command "brief" as something new.
Understand the command "normal" as something new.
Understand the command "nouns" as something new.
Understand the command "pronouns" as something new.
Understand the command "notify" as something new.
Understand the command "insert" as something new.
Understand the command "smash" as something new.
Understand the command "purchase" as something new.
Understand the command "squash" as something new.
Understand the command "taste" as something new.
Understand the command "fasten" as something new.
]

Part 4 - Grammar

Understand "utiliser [something]" as utiliser. [todo : developper par la suite]
Utiliser is an action applying to one thing.
Carry out utiliser: say "Veuillez indiquer un verbe plus précis.".

Understand the command "actionner" as utiliser.

[ note : 
blowing' action, intended for woodwind instruments and perhaps the occasional siphon, has been withdrawn from the built-in set: it no longer seems to us part of the essential core of actions. We have similarly removed praying, digging, jumping over, filling and swimming

à implémenter par la suite : 

After reading a command:
        if the player's command is a topic listed in the Table of Compound
Actions
        begin;
                try the specified action entry;
                reject the player's command;
        end if;

Table of Compound Actions
topic   specified action
"descend"       going down
"ascend"        going up
"diagnose"      examining yourself

]


Understand "quitter" as quitting the game.
Understand "sauver" or "sauvegarder" as saving the game.
Understand "recommencer" as restarting the game.
Understand "charger" or "restaure" as restoring the game.

[Understand "transcription" or "transcription on" as switching the story
	transcript on. 
Understand "script off" or "transcript off" as switching the story transcript off. "deja pris avec transcript = mot long]

Understand "mode court" as preferring abbreviated room descriptions.
Understand "mode long"  as preferring unabbreviated room descriptions.
Understand "mode normal" as preferring sometimes abbreviated room descriptions.
Understand "noms" or "pronoms" as requesting the pronoun meanings.
Understand "notifier" or "notification on" as switching score notification on.
Understand "notifier off" or "notification off" as switching score notification off.


Understand "entrer" as InGoing.
InGoing is an action applying to nothing.
Carry out InGoing: try going inside.

Understand "entrer dans/par [something]" or  "entrer [something]"  as entering.
Understand the command "rentrer" as "entrer".


Understand "asseoir vous [something]" or "asseoir vous dans/sur [something]" or "asseoir vous en haut de/du/des [something]" as entering.
Understand the command "allonger" or "coucher" as "asseoir".

Understand "descendre" as DownGoing.
DownGoing is an action applying to nothing.

	
Carry out DownGoing:
	if the player is on a supporter (called truc)
		begin;
			try getting off truc;
		otherwise;
			try going down;
	end if.


Understand "descendre de [something]" as getting off.
Understand "descendre du [something]" as getting off.
Understand "descendre des [something]" as getting off.

[todo : descendre vers etc]

Understand "sortir" or "sortir de la" or "sortir d'ici" or "dehors" as exiting.

Understand "sortir vers/a/au/de/du/des/d' [something]" as OutGoing.
OutGoing is an action applying to one thing.
Carry out OutGoing: try going outside.


Understand the command "partir" as "sortir".

Understand "aller ->/à/a/au/en/vers/par [direction]" or "aller [direction]" as going.
Understand "aller vers le bas" or "aller en bas" as DownGoing.

Understand "aller [something]" or "aller ->/à/a/au/en/vers/par/dans/sur/sous [something]" as entering.

Understand the command "marcher", "courir", "passer", "fuir", "suivre", "emprunter" and "franchir" as "aller".


UpStanding is an action applying to nothing.

Understand "debout" as UpStanding.
Understand "lever" or "lever vous" as UpStanding.

Carry out UpStanding: 
	if the player is in location
		begin;
			say "Inutile.";
		otherwise;
			[say "(sortir)";]
			try exiting;
		end if.


Understand "lever [something]" as taking.
Understand the command "relever" or "soulever" as "lever".

Understand "monter ->/à/a/au/en/vers/par/dans/sur/sous [something]" as entering.

Understand "boire [something]" or "boire de/dans [something]" or "boire du [something]" or "boire à/a/au/aux [something]" or "boire de l'[something]" as drinking.
Understand the command "avaler" and "siroter" as "boire".  [TODO : avaler => manger au lieu de boire?]

Understand "manger [something preferably held]" or "manger du [something preferably held]" as eating.
Understand the command "devorer", "grignoter", "mastiquer" et "ingerer" as "manger".

Understand "bruler [something]" or "mettre le feu à/a/au/aux [something]" as burning. [todo ? bruler [something] avec [held]]
Understand the command "embraser", "cramer" et "incendier" as "bruler".

Understand "attaquer [someone]" or "tuer [someone]" or "torturer [someone]" or "cogner [someone]" as attacking. [someone est redondant si on a something par ailleurs mais l'inverse n'est pas vrai]

Understand "attaquer [something]" or "attaquer a/au/contre [something]" or "attaquer à [something]" or "cogner [something]" as attacking.

Understand the command "frapper", "combattre", "briser", "detruire", or "casser" as "attaquer".

Understand "presser [device]" as pushing.
Understand "presser [something]" as squeezing.
Understand the command "tordre" and "ecraser" and "comprimer" as "squeeze".

[ruiner a ete retire]
[vider a ete retire]
[remplir/emplir a ete retire]

Understand "couper [something]" as cutting.
Understand the commands "decouper", "trancher" and "elager" as "couper".

[Understand "transferer [something] vers/dans/sur [something]" as transfering.]

Understand "prendre [things]" as taking.
Understand the command "pr", "ramasser", "decoller" and "cueillir" as "prendre".

Understand "prendre [direction]" or "prendre vers [direction]" as going.

Understand "deposer [things preferably held]" or "deposer [things preferably held] sur le sol" or "deposer [things preferably held] au sol" or "deposer [things preferably held] par terre" or "mettre [things preferably held] sur le sol" or "mettre [things preferably held] au sol" or "mettre [things preferably held] par terre" as dropping.
Understand "deposer [other things] dans [something]" or "mettre [other things] dans [something]" or "inserer [other things] dans [something]" as inserting it into.
Understand "deposer [other things] sur [something]" or "mettre [other things] sur [something]" as putting it on.

Understand the commands "placer" as "mettre".

Understand the command "poser" and "abandonner" and "lacher" and "laisser" and "laisser tomber"  as "deposer". 

[getting off : utilisé avec DownGoing sans doute]

Understand "enlever [things inside] de/du/des [something]" as removing it from.

Understand "enlever [something preferably held]" as taking off.

Understand the command "retirer" and "oter" as "enlever". 

Understand "lancer [something preferably held] sur/vers/contre [something]" or "lancer [something preferably held] en direction de [something]" or "lancer [something preferably held] en direction du [something]" or "lancer [something preferably held] dans [something]" as throwing it at.

Understand the command "jeter" as "lancer".

Understand "revetir [something preferably held]" or "mettre [something preferably held]" or "habiller vous de/du/des/avec [something preferably held]" as wearing. 

Understand "habiller vous" as a mistake ("Veuillez préciser avec quoi vous voulez vous habiller.")

Understand "regarder" or "regarder autour" as looking.
Understand "regarder [something]" as examining.
Understand "regarder dans/sur/derriere [something]" as searching.
Understand "regarder a l'interieur de [something]" as searching.
Understand "regarder a l'interieur du [something]" as searching.
Understand "regarder a travers [something]" as searching.
Understand "regarder sous [something]" as looking under.



Understand the command "examiner", "decrire", "observer", "r", "v" and "voir" as "regarder".


Understand "chercher [something]" or "chercher dans/sur [something]" as searching.
Understand the command "fouiller" as "chercher".

Understand "consulter [text] dans [something]" as consulting it about (with nouns reversed).
Understand "consulter [something] au sujet de [text]" or "consulter [something] à/a propos de [text]" as consulting it about.
[todo : voir si on peut améliorer consult, mais qui l'utilise ?]

Understand "sentir" as smelling. 
Understand "sentir [something]" as smelling.
Understand the command "renifler" as "sentir".

Understand "ecouter" as listening.
Understand "ecouter [something]" as listening.
Understand the command "entendre" as "ecouter".

Understand "gouter [something]" as tasting.

Understand "toucher [something]" as touching.
Understand the command "caresser" as "toucher".
Understand the command "tater" as "toucher".

Understand the command "read" as something new.
[Understand the command "lire" as something new.]

Reading is an action applying to one thing.
[will we keep this difference in the future ? TODO]

Understand "read [something]" or "lire [something]" as reading.
 

Carry out reading: 
	say "[if the French 3PSPa Language option is active]Il n[']y avait rien de spécial à lire ici.[otherwise if the French 1PSPa Language option is active]Je n'avais rien de spécial à lire ici.[otherwise if the French 1PSPr Language option is active]Je n'ai rien de spécial à lire ici.[otherwise]Il n[']y a rien de spécial à lire ici.[end if]".

Understand "consulter [something] sur [text]" or "consulter [something] a [text]" or "consulter [something] a propos de [text]" as consulting it about.

Understand "tirer [something]" as pulling.
Understand the command "trainer" as "tirer".

Understand "pousser [something]" as pushing.
Understand "pousser [something] vers [direction]" or "pousser [something] à/a/en [direction]" or "pousser [something] au [direction]" as pushing it to.
Understand the command "deplacer", "bouger" as "pousser". [TODO : and "presser" here ? = squeeze]

Understand "appuyer [something]" or "appuyer sur [something]" as pushing.

Understand "regler" as setting it to.
Understand "regler [something] to [text]" as setting it to.
Understand the command "ajuster" as "regler".

[Understand "tourner" as turning.]
Understand "tourner [something]" as turning.
Understand the command "devisser" and "visser" as "tourner".

Understand "eteindre [something]" as switching off.
Understand the command "arreter" as "eteindre".

Understand "allumer [something]" or "mettre [something] en marche/route" or "mettre en marche/route [something]" as switching on.
Understand the command "demarrer" and "commuter" as "allumer".

Understand "balancer [something]" or "balancer vous à/a/au/aux/sur [something]" as swinging.

Understand the command "pendre", "suspendre" and "osciller" as swing.

Understand "frotter [something]" as rubbing.

[-- ajout bibl. fr.]
Rubbing it with is an action applying to two things.
Carry out rubbing it with:
	say "[if the French 3PSPa Language option is active]Il n'arriva à rien ainsi.[otherwise if the French 1PSPa Language option is active]Je n'arrivai à rien comme ça.[otherwise if the French 1PSPr Language option is active]Je n'arrive à rien comme ça.[otherwise]Vous n'arrivez à rien comme ça.[end if]".

Understand "frotter [something] avec [something preferably held]" as rubbing it with.
Understand "frotter [something preferably held] sur [something]" as rubbing it with (with nouns reversed).

[-- fin ajout]		

Understand the commands "cirer", "astiquer", "balayer", "nettoyer", "depoussierer", "essuyer" and "recurer" as "frotter".

Understand ["nouer [something]" or] "nouer [something] ->/à/a/au/aux/avec/sur [something]" as tying it to. 
Understand the command "attacher", "fixer", "connecter" and "brancher" as "nouer".

[TODO : faire parler, dire etc ici]


Talking to is an action applying to one thing. 
Carry out talking to:
	say "[if the French 3PSPa Language option is active]Il ne sut pas quoi dire.[otherwise if the French 3PSPr Language option is active]Il ne sait pas quoi dire.[otherwise if the French 1PSPa Language option is active]Je ne savais pas quoi dire.[otherwise if the French 1PSPr Language option is active]Je ne sais pas quoi dire.[otherwise]Vous ne savez pas quoi dire.[end if]".

	
Understand "talk to [someone]" and "greet [someone]" and "speak to [someone]" and "parler ->/à/a/au/aux/avec [someone]" and "questionner [someone]" as talking to.

Understand "questionner [someone]" as talking to.

Understand "repondre [text] ->/à/a/au/aux [someone]" as answering it that (with nouns reversed).
[Understand the commands "say", "shout" and "speak" as "answer".]

[todo : Understand "raconter ->/à/a/au/aux [someone] a propos de [text]" as telling it about.]

Understand "questionner [someone] a propos de [text]" or "questionner [someone] à propos de [text]" or "questionner [someone] au sujet de [text]" or "questionner [someone] au sujet du/des [text]" or "questionner [someone] sur [text]" as asking it about.

Understand the command "interroger" as "questionner".


Understand "demander [something] ->/à/a/au/aux [someone]" as asking it for (with nouns reversed).  [todo : check reversed]

Understand "agiter les mains" or "agiter la main" as waving hands.
Understand "saluer" or "saluer avec la main" [or "saluer [someone]" or "saluer [someone] avec la main"] as waving hands. [todo: on ne peut ajouter un cod]

Waving hands to is an action applying to one thing. Understand "saluer [someone]" or "saluer [someone] avec la main" as waving hands to. 

Carry out waving hands to:
	say "[if the French 3PSPa Language option is active]Il salua [the noun].[otherwise if the French 3PSPr Language option is active]Il salue [the noun].[otherwise if the French 1PSPa Language option is active]Je saluai [the noun].[otherwise if the French 1PSPr Language option is active]Je salue [the noun].[otherwise]Vous saluez [the noun].[end if]".
	

Understand "agiter [something]" as waving.
Understand the command "brandir", "secouer" as "agiter".

Understand "montrer [something] ->/à/a/au/aux [someone]"  as showing it to.  
[something preferably held or not ? was not in french I6]
Understand the command "presenter" and "pointer" as "montrer".

Understand "reveiller vous" [or "se reveiller" : ne jamais mettre ainsi] or "reveiller le joueur" as waking up.
Understand "reveiller [someone]" as waking.
Understand the command "eveiller" as "reveiller".

Understand "embrasser [someone]" as kissing.
Understand the command "etreindre" as "embrasser".

Understand "chanter" as singing.
Understand the command "fredonner" as "chanter". 

[Understand "souffler dans [something preferably held]" or  "souffler [something preferably held]" as blowing. [blow non implemente dans I7...]]

Understand "attendre" or "a" or "patienter" as waiting.

[Understand "prier" as praying. Pas dans I7]

Understand "penser" as thinking.
Understand the command "reflechir" as "penser".

Understand "dormir" as sleeping.
Understand the command "somnoler" as "dormir"

Understand "oui" as saying yes.
Understand the command "yep" as "oui".

Understand "non" as saying no.

Understand "desole" as saying sorry.


Understand "zut" as swearing mildly.
Understand the commands "crotte", "mince" and "damned" as "zut".
Understand "merde" as swearing obscenely.
Understand the commands "putain" and "bordel" as "merde".


Understand "monter" as UpGoing.
UpGoing is an action applying to nothing.
Carry out UpGoing: try going up.



Understand "grimper [something]" or "grimper sur [something]" or "grimper par-dessus [something]" or "grimper a/au/aux/par/dans [something]" as climbing. 
Understand the command "gravir" and "escalader" as "grimper".

[jump over not in I7]
Understand "sauter" as jumping.
Understand the command "bondir" as "sauter".

Understand the command "swim" as something new.
Swimming is an action applying to nothing. Understand "swim" or "dive" or "nager" or "plonger" as swimming. 

Carry out swimming:
	say "[if the French 3PSPa Language option is active]Il n[']y avait pas assez d'eau pour nager dedans.[otherwise if the French 3PSPr Language option is active]Il n[']y a pas assez d'eau pour nager dedans.[otherwise if the French 1PSPa Language option is active]Il n[']y avait pas assez d'eau pour nager dedans.[otherwise if the French 1PSPr Language option is active]Il n[']y a pas assez d'eau pour nager dedans.[otherwise]Il n[']y a pas assez d'eau pour nager dedans.[end if]".


Understand "fermer [something]" as closing.

Understand "fermer [something] avec [something preferably held]" or "fermer [something] a cle" or "fermer [something] a clef" as locking it with.

Understand the command "verrouiller" as "fermer".

Understand "ouvrir [something]" as opening.

Understand "ouvrir [something] avec [something preferably held]" as unlocking it with.

Understand the command "deverrouiller" and "forcer" as "ouvrir".

Understand "inventaire" as taking inventory.          [todo : invtall et invwide]

Understand "acheter [something]" as buying.

Understand "donner [something preferably held] ->/à/a/au/aux [someone]" as giving it to. 
Understand "donner [someone] [something preferably held]" as giving it to (with nouns reversed).

Understand the commands "payer" and "offrir" and "remettre" as "donner".

Understand "nourrir [someone] avec [something preferably held]" as giving it to (with nouns reversed).

Understand "* [text]" or "*[text]" as a mistake ("[italic type][bracket]Commentaire noté.[close bracket][roman type]").
[utile pour transcripts, mais la version sans espace ne fonctionne pas]


Section 2 - Autres remplacements pour I6

Include (-
[ PrintTimeOfDay t h aop;
	if (t<0) { print "<pas d'heure>"; return; }
	if (t >= TWELVE_HOURS) { aop = "pm"; t = t - TWELVE_HOURS; } else aop = "am";
	h = t/ONE_HOUR; if (h==0) h=12;
	print h, ":";
	if (t%ONE_HOUR < 10) print "0"; print t%ONE_HOUR, " ", (string) aop;
];
-) instead of "Digital Printing" in "Time.i6t".


Include (-
[ PrintTimeOfDayEnglish t h m dir aop say_minutes quad;
! adapted the spanish version by Sebastian Arg
    quad = 1; ! =1 es la primera media hora, =2 es la segunda
    h = (t/60) % 12; m = t%60; if (h==0) h=12;
	if (m==0) { if(h==1) {print "une" ;print " heure"; return ;} else print (number) h;print " heures"; return; } !infsp hack
	dir = "heures";! infsp hack
	if (m > 30) { m = 60-m; h = (h+1)%12; if (h==0) h=12; dir = "heures moins"; quad=2;} !infsp hack
	switch(m) {
        1: say_minutes = "une";
        2: say_minutes = "deux";
        3: say_minutes = "trois";
        4: say_minutes = "quatre";
        5: say_minutes = "cinq";
        6: say_minutes = "six";
        7: say_minutes = "sept";
        8: say_minutes = "huit";
        9: say_minutes = "neuf";
        10: say_minutes = "dix";
        11: say_minutes = "onze";
        12: say_minutes = "douze";
        13: say_minutes = "treize";
        14: say_minutes = "quatorze";
	15: if (quad==2) say_minutes = "le quart"; else say_minutes = "et quart";
        16: say_minutes = "seize";
        17: say_minutes = "dix-sept";
        18: say_minutes = "dix-huit";
        19: say_minutes = "dix-neuf";
        20: say_minutes = "vingt";
        21: say_minutes = "vingt-et-une";
        22: say_minutes = "vingt-deux";
        23: say_minutes = "vingt-trois";
        24: say_minutes = "vingt-quatre";
        25: say_minutes = "vingt-cinq";
        26: say_minutes = "vingt-six";
        27: say_minutes = "vingt-sept";
        28: say_minutes = "vingt-huit";
        29: say_minutes = "vingt-neuf";
        30: say_minutes = "et demi";
		default: 
            if (quad == 2){
              print (number) m;
		      if (m%5 ~= 0) {
					if (m == 1) print " minute"; else print " minutes"; ! infsp hack
		      }
             ! if(h==1) print " para la una"; else print " ", "para las ", (number) h;!infsp hack

            }
            if (quad == 1){
              if(h==1) {print (number) h," heure "; print (number) m;} else print (number) h," heures "; print (number) m;
			  ! TODO reste problème : une heures (sic) moins douze etc.
		      if (m%5 ~= 0) {
					if (m == 1) print ""; else print ""; ! infsp hack
		      }
            }
        	return;
	}
	if(h==1) print "une"; else print (number) h; print " ",(string) dir, " ",(string) say_minutes;!infsp hack
];
-) instead of "Analogue Printing" in "Time.i6t".




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
		print " par ", (string) Story_Author;
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


Section 3 - French I7 replacements

The you-can-also-see rule is not listed in any rulebook.

For printing the locale description (this is the French-you-can-also-see rule):
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
					if the domain is the location, say "[personne du joueur en capital] ";
					otherwise say "Dans [the domain] [personne du joueur] ";
				otherwise if the domain is a supporter:
					say "Sur [the domain] [personne du joueur] ";
				otherwise if the domain is an animal:
					say "Sur [the domain] [personne du joueur] ";
				otherwise:
					say "Dans [the domain] [personne du joueur] ";
				say "[verbe pouvoir du joueur] [if the locale paragraph count is greater than 0]aussi [end if]voir ";
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
				[if the domain is the location, say " ici";] [supprimé de la version française car un peu lourd...]
				say ".[paragraph break]";
				unfilter list recursion;
			end the listing nondescript items activity with the domain;
	continue the activity.

The use initial appearance in room descriptions rule is not listed in any rulebook.

For printing a locale paragraph about a thing (called the item)
	(this is the French use initial appearance in room descriptions rule):
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
				say "Sur [the item] ";
				list the contents of the item, as a sentence, including contents,
					giving brief inventory information, tersely, not listing
					concealed items, prefacing with is/are, listing marked items only;
				say ".[paragraph break]";
			now the item is mentioned;
	continue the activity.

The describe what's on scenery supporters in room descriptions rule is not listed in any rulebook.

For printing a locale paragraph about a thing (called the item)
	(this is the French describe what's on scenery supporters in room descriptions rule):
	if the item is not undescribed and the item is scenery and the item does not enclose the player:
		if a locale-supportable thing is on the item:
			set pronouns from the item;
			repeat with possibility running through things on the item:
				now the possibility is marked for listing;
				if the possibility is mentioned:
					now the possibility is not marked for listing;
			increase the locale paragraph count by 1;
			say "Sur [the item] ";
			list the contents of the item, as a sentence, including contents,
				giving brief inventory information, tersely, not listing
				concealed items, prefacing with is/are, listing marked items only;
			say ".[paragraph break]";
	continue the activity.


The print the final question rule is not listed in any rulebook.
The French print the final question rule is listed in before handling the final question.
This is the French print the final question rule:
	let named options count be 0;
	repeat through the Table of French Final Question Options:
		if the only if victorious entry is false or the story has ended finally:
			if there is a final response rule entry
				or the final response activity entry [activity] is not empty:
				if there is a final question wording entry, increase named options count by 1;
	if the named options count is less than 1, abide by the immediately quit rule;
	say "Voulez-vous ";
	repeat through the Table of French Final Question Options:
		if the only if victorious entry is false or the story has ended finally:
			if there is a final response rule entry
				or the final response activity entry [activity] is not empty:
				if there is a final question wording entry:
					say final question wording entry;
					decrease named options count by 1;
					if the named options count is 0:
						say "?[line break]";
					otherwise if the named options count is 1:
						if the serial comma option is active, say ",";
						say " ou ";
					otherwise:
						say ", ";

The standard respond to final question rule is not listed in any rulebook.
The French standard respond to final question rule is listed last in for handling the final question.
This is the French standard respond to final question rule:
	repeat through the Table of French Final Question Options:
		if the only if victorious entry is false or the story has ended finally:
			if there is a final response rule entry
				or the final response activity entry [activity] is not empty:
				if the player's command matches the topic entry:
					if there is a final response rule entry, abide by final response rule entry;
					otherwise carry out the final response activity entry activity;
					rule succeeds;
	issue miscellaneous library message number 8.


Section 3 - Option pour la fin de jeu 
[(in place of Section SR2/12 - Final question options in Standard Rules by Graham Nelson)]


Table of French Final Question Options
final question wording	only if victorious	topic		final response rule		final response activity
"RECOMMENCER"				false				"recommencer"	immediately restart the VM rule	--
"CHARGER une partie sauvegardée"	false				"charger"	immediately restore saved game rule	--
"lire quelques suggestions amusantes (AMUSING)"	true	"amusing"	--	amusing a victorious player
"QUITTER"					false				"quitter"		immediately quit rule	--
--						false				"undo"		immediately undo rule	--



[-- end of this part-- ]



Part 6 - Redefinition of Languages_i6_t

Include (-

Constant LibReleaseFR      "5/080727";
Message		"[Compilé avec la version 5/080727 de la bibliothèque francophone.]";
!System_file;

! To keep compat with some french declarations. Should be replaced later probably. Was used in the outdated verblib.h
Default AMUSING_PROVIDED 1;
Default MAX_CARRIED      100;
Default MAX_SCORE        0;
Default NUMBER_TASKS     1;
Default OBJECT_SCORE     4;
Default ROOM_SCORE       5;
Default SACK_OBJECT      0;
Default TASKS_PROVIDED   1;



-)

[
** deprecated?
Include (-
Class   CompassDirection
  with  number 0, article "le",
        description [;
            if (location provides compass_look && location.compass_look(self)) rtrue;
            if (self.compass_look()) rtrue;
            L__M(##Look, 7, self);
        ],
        compass_look false,
  has   scenery;

Object Compass "compass" has concealed;

-) instead of "Compass" in "Output. i6t"
** deprecated?
]


Include (-
Constant AGAIN1__WD     = 'encore';
Constant AGAIN2__WD     = 'g//';
Constant AGAIN3__WD     = 'encore';
Constant OOPS1__WD      = 'oops';
Constant OOPS2__WD      = 'oops'; ! 'o//';
Constant OOPS3__WD      = 'euh';
Constant UNDO1__WD      = 'undo';
Constant UNDO2__WD      = 'annule';
Constant UNDO3__WD      = 'annuler';

Constant ALL1__WD     = 'tous';
Constant ALL2__WD     = 'toutes';
Constant ALL3__WD     = 'tout';
Constant ALL4__WD     = 'tout';
Constant ALL5__WD     = 'tout';
Constant AND1__WD     = 'et';
Constant AND2__WD     = 'et';
Constant AND3__WD     = 'et';
Constant BUT1__WD     = 'mais pas';
Constant BUT2__WD     = 'excepte';
Constant BUT3__WD     = 'sauf';
Constant ME1__WD      = 'moi';
Constant ME2__WD      = 'toi'; !*! nous ? moi-même ?
Constant ME3__WD      = 'vous';
Constant OF1__WD      = 'de';
Constant OF2__WD      = 'de';
Constant OF3__WD      = 'de';
Constant OF4__WD      = 'de';
Constant OTHER1__WD   = 'unautre';
Constant OTHER2__WD   = 'autre';
Constant OTHER3__WD   = 'autre';
Constant THEN1__WD    = 'alors';
Constant THEN2__WD    = 'puis';
Constant THEN3__WD    = 'ensuite';

Constant NO1__WD      = 'n//';
Constant NO2__WD      = 'non';
Constant NO3__WD      = 'non';
Constant YES1__WD     = 'o//';
Constant YES2__WD     = 'y//';
Constant YES3__WD     = 'oui';

Constant AMUSING__WD  = 'amusing';
Constant FULLSCORE1__WD = 'fullscore';
Constant FULLSCORE2__WD = 'full';
Constant QUIT1__WD    = 'quit'; !*! "q//" ?
Constant QUIT2__WD    = 'quitter';
Constant RESTART__WD  = 'recommencer';
Constant RESTORE__WD  = 'charger';
-) instead of "Vocabulary" in "Language.i6t".

Include (-
Array LanguagePronouns table

   !  word       possible GNAs                   connected
   !             to follow:                      to:
   !             a     i
   !             s  p  s  p
   !             mfnmfnmfnmfn                 

      ! Object pronouns
      '-le'    $$100000100000                    NULL
      '-la'    $$010000010000                    NULL
      '-les'   $$000110000110                    NULL
      '-lui'   $$110000110000                    NULL
      '-leur'  $$000110000110                    NULL        ! tirets remis
!      'le'    $$100000100000                    NULL        ! car l'article le/la/les vient parfois interférer
!      'la'    $$010000010000                    NULL        ! par exemple "mange la pomme" est compris comme "mange-la" si "pomme" est inconnu, d'où des messages d'erreur troublants pour le joueur
!      'les'   $$000110000110                    NULL
!      'lui'   $$110000110000                    NULL ! dans "donne-lui", "lui" est m ou f
!      'leur'  $$000110000110                    NULL
      
      ! Disjunctive pronouns
!*! ! féminin accepté pour 'luy' (mot bidon) pour traiter les cas 'dedans', 'dessus', 'l^'... (genre inconnu)
!   en fait, '-lui' pourrait jouer le même rôle
      'luy'    $$110000110000                    NULL ! "l'ouvrir" devient "ouvrir luy", "luy" étant m ou f
      'lui'    $$100000100000                    NULL
      'elle'   $$010000010000                    NULL
      'eux'    $$000110000110                    NULL
      'elles'  $$000010000010                    NULL;
-) instead of "Pronouns" in "Language.i6t".

Include (-
Array LanguageDescriptors table
   !  word       possible GNAs   descriptor      connected
   !             to follow:      type:           to:
   !             a     i
   !             s  p  s  p
   !             mfnmfnmfnmfn                 

      'mon'    $$100000100000    POSSESS_PK      0  !*! ce qui suit ne doit pas fonctionner souvent
      'ma'     $$010000010000    POSSESS_PK      0  !*! du moins je l'espère car mon/ma/mes devrait
      'mes'    $$000110000110    POSSESS_PK      0  !*! changer en fonction du type de parole
      'ton'    $$100000100000    POSSESS_PK      0  !*!
      'ta'     $$010000010000    POSSESS_PK      0  !*! (quoique ça a l'air tres tolerant)
      'tes'    $$000110000110    POSSESS_PK      0  !*!
      'notre'  $$110000110000    POSSESS_PK      0  !*!
      'nos'    $$000110000110    POSSESS_PK      0  !*!
      'votre'  $$110000110000    POSSESS_PK      0  !*!
      'vos'    $$000110000110    POSSESS_PK      0  !*!
      'son'    $$100000100000    POSSESS_PK      '-lui'        ! tirets remis
      'sa'     $$010000010000    POSSESS_PK      '-lui'
      'ses'    $$000110000110    POSSESS_PK      '-lui'
      'leur'   $$110000110000    POSSESS_PK      '-les'
      'leurs'  $$000110000110    POSSESS_PK      '-les'
!      'son'    $$100000100000    POSSESS_PK      'lui' 
!      'sa'     $$010000010000    POSSESS_PK      'lui'
!      'ses'    $$000110000110    POSSESS_PK      'lui'
!      'leur'   $$110000110000    POSSESS_PK      'les'
!      'leurs'  $$000110000110    POSSESS_PK      'les' 

      'le'     $$100000100000    DEFART_PK       NULL
      'la'     $$010000010000    DEFART_PK       NULL
      'l^'     $$110000110000    DEFART_PK       NULL
      'les'    $$000110000110    DEFART_PK       NULL
      'un'     $$100000100000    INDEFART_PK     NULL
      'une'    $$010000010000    INDEFART_PK     NULL
      'des'    $$000110000110    INDEFART_PK     NULL

     'allumé'  $$100000100000    light           NULL
     'allumée' $$010000010000    light           NULL
     'éteint'  $$100000100000    (-light)        NULL
     'éteinte' $$010000010000    (-light)        NULL;
-) instead of "Descriptors" in "Language.i6t".

Include (-
Array LanguageNumbers table
    'un' 1 'une' 1 'deux' 2 'trois' 3 'quatre' 4 'cinq' 5
    'six' 6 'sept' 7 'huit' 8 'neuf' 9 'dix' 10
    'onze' 11 'douze' 12 'treize' 13 'quatorze' 14 'quinze' 15
    'seize' 16 'dix-sept' 17 'dix-huit' 18 'dix-neuf' 19 'vingt' 20
    'vingt-et-un' 21 'vingt-deux' 22 'vingt-trois' 23 'vingt-quatre' 24
	'vingt-cinq' 25 'vingt-six' 26 'vingt-sept' 27 'vingt-huit' 28
	'vingt-neuf' 29 'trente' 30
;

[ LanguageNumber n f;
    if (n==0)    { print "zéro"; rfalse; }
    if (n<0)     { print "moins "; n=-n; }
    #Iftrue (WORDSIZE == 4);
    if (n >= 1000000000) {
        if (f == 1) print " ";
    	print (LanguageNumber) n/1000000000, " milliards"; n = n%1000000000; f = 1;
    }
    if (n >= 1000000) {
        if (f == 1) print " ";
    	print (LanguageNumber) n/1000000, " millions"; n = n%1000000; f = 1;
    }
#Endif;
    if (n >= 1000) {
        if (f == 1) print " ";
        if (n/1000 == 1) print "mille "; 
        	else print (LanguageNumber) n/1000, " mille"; 
        n = n%1000; f = 1;
    }
    if (n>=100)  { 
        if (f == 1) print " ";
        if (n/100 == 1) print " "; 
        	else print (LanguageNumber) n/100;
        	if (n%100 ~= 0) print " cent "; 
        		else print " cents";
        n=n%100; f = 1; 
    }
! TODO : améliorer cette partie.

    if (n==0) rfalse;
    switch(n)
    {
        1:  print "un";
        2:  print "deux";
        3:  print "trois";
        4:  print "quatre";
        5:  print "cinq";
        6:  print "six";
        7:  print "sept";
        8:  print "huit";
        9:  print "neuf";
        10: print "dix";
        11: print "onze";
        12: print "douze";
        13: print "treize";
        14: print "quatorze";
        15: print "quinze";
        16: print "seize";
        17: print "dix-sept";
        18: print "dix-huit";
        19: print "dix-neuf";
        20 to 99:
            switch(n/10)
            {
                2:  print "vingt";
                    if (n%10 == 1) {print " et un"; return; }
                3:  print "trente";
                    if (n%10 == 1) {print " et un"; return; }
                4:  print "quarante";
                    if (n%10 == 1) {print " et un"; return; }
                5:  print "cinquante";
                    if (n%10 == 1) {print " et un"; return; }
                6:  print "soixante";
                    if (n%10 == 1) {print " et un"; return; }
                7:  print "soixante";
                    if (n%10 == 1) {print " et onze"; return; } !*!
                    print "-"; LanguageNumber(10 + n%10); return;
                8:  if (n%10 == 0) {print "quatre vingts"; return; }
                    print "quatre-vingt";
                9:  print "quatre-vingt-"; LanguageNumber(10+ n%10); return;
            }
            if (n%10 ~= 0)
            {
                print "-"; LanguageNumber(n%10);
            }
    }
];
-) instead of "Numbers" in "Language.i6t".

Include (-
[ LanguageTimeOfDay hours mins;
    print hours/10, hours%10, "h", mins/10, mins%10;
];
-) instead of "Time" in "Language.i6t".

[
Include (-
[ LanguageDirection d;
print (name) d;
!    switch (d) {
!        n_to: print "nord";
!        s_to: print "sud";
!        e_to: print "est";
!        w_to: print "ouest";
!        ne_to: print "nord-est";
!        nw_to: print "nord-ouest";
!        se_to: print "sud-est";
!        sw_to: print "sud-ouest";
!        u_to: print "haut";
!        d_to: print "bas";
!        in_to: print "dedans";
!        out_to: print "dehors";
!      default: return RunTimeError(9,d);
!    }
];
-) instead of "Directions" in "Language.i6t".
]

Include (-
! LanguageToInformese
! ------------------------------------------------------------------------------
!   Part III.   Translation
! ------------------------------------------------------------------------------
!
! La fonction enleve_accents enlève les accents des mots qui n'ont pu être
! interprétés. De cette manière, le joueur peut utiliser les accents ou non.
! Pour cela le jeu doit définir les mots sans accent, par exemple :
! object set_of_keys "trousseau de clés"
! with name 'trousseau' 'cles'
!
! Si le joueur demande : "examiner cles", le mot est compris directement.
! S'il demande : "examiner clés" le mot n'est pas compris, ce qui déclenche 
! la suppression des accents et une nouvelle analyse.

! L'appel de cette fonction peut être désactivé avec la commande de
! deboguage "accents on" pour que les accents soient conservés.

global enleveaccents=1;

[ enleve_accents x i word at len;

    #Ifdef DEBUG; affiche_buffer(buffer, "  [ enleve_accents :^  - Buffer reçu : "); #Endif;

    for (x=0:x<NbMots():x++) ! pour chaque mot
    {
        word=Mot(x);
        at=PositionMot(x);
        len=LongueurMot(x);
        if (word==0) ! non compris
        {
#Ifdef DEBUG;
            if (parser_trace>=7)
            {
                print "    NON COMPRIS : |";
                for (i=at:i<at+len:i++) print (char) buffer->i;
                print "|^";
            }
#Endif;
            for (i=at:i<at+len:i++)
                if (buffer->i=='é') buffer->i='e'; 
                ! plutôt un switch ?

                else if(buffer->i=='à') buffer->i='a';
                else if(buffer->i=='è') buffer->i='e';
                else if(buffer->i=='ù') buffer->i='u';

                else if(buffer->i=='â') buffer->i='a';
                else if(buffer->i=='ê') buffer->i='e';
                else if(buffer->i=='î') buffer->i='i';
                else if(buffer->i=='ô') buffer->i='o';
                else if(buffer->i=='û') buffer->i='u';

                else if(buffer->i=='ä') buffer->i='a';
                else if(buffer->i=='ë') buffer->i='e';
                else if(buffer->i=='ï') buffer->i='i';
                else if(buffer->i=='ö') buffer->i='o';
                else if(buffer->i=='ü') buffer->i='u';

                else if(buffer->i=='ç') buffer->i='c';

            !Tokenise__(buffer,parse);
            VM_Tokenise(buffer,parse);
        }
    }

    #Ifdef DEBUG; affiche_buffer(buffer, "  - Buffer sans accents : "); #Endif;
];

! enlève le tiret de départ des mots qui ne sont pas dans le dictionnaire
[ enleve_tirets x i word at len;
    i=NULL; ! pour retirer warning a la compilation glulxe

    #Ifdef DEBUG; affiche_buffer(buffer, "  [ enleve_tirets :^  - Buffer reçu : "); #Endif;

    for (x=0:x<NbMots():x++) ! pour chaque mot
    {
        word=Mot(x);
        at=PositionMot(x);
        len=LongueurMot(x);
        if (word==0) ! non compris
        {
#Ifdef DEBUG;
            if (parser_trace>=7)
            {
                print "    NON COMPRIS : |";
                for (i=at:i<at+len:i++) print (char) buffer->i;
                print "|^";
            }
#Endif;

            if (buffer->at=='-') buffer->at=' ';
            !Tokenise__(buffer,parse);
            VM_Tokenise(buffer,parse);
        }
    }

    #Ifdef DEBUG; affiche_buffer(buffer, "  - Buffer sans tirets : "); #Endif;
];

[ NbMots; ! nombre de mots dans parse
#Ifdef TARGET_ZCODE;
    return parse->1;
#Ifnot; ! TARGET_GLULX
    return parse-->0;
#Endif; ! TARGET_
];

[ NbChars; ! nombre de chars dans buffer
#Ifdef TARGET_ZCODE;
    return buffer->1;
#Ifnot; ! TARGET_GLULX
    return buffer-->0;
#Endif; ! TARGET_
];

[ Mot n; ! valeur (dictionnaire) du mot numéro n de parse
#Ifdef TARGET_ZCODE;
    return parse-->(n*2 + 1);
#Ifnot; ! TARGET_GLULX
    return parse-->(n*3 + 1);
#Endif; ! TARGET_
];

[ PositionMot n; ! position dans buffer du mot numéro n de parse
#Ifdef TARGET_ZCODE;
    return parse->(n*4 + 5);
#Ifnot; ! TARGET_GLULX
    return parse-->(n*3 + 3);
#Endif; ! TARGET_
];

[ LongueurMot n;   ! longueur (en chars) dans buffer du mot numéro n de parse
#Ifdef TARGET_ZCODE;
    return parse->(n*4 + 4);
#Ifnot; ! TARGET_GLULX
    return parse-->(n*3 + 2);
#Endif; ! TARGET_
];

[ EcraseMot n i;        ! écrase avec des espaces dans buffer le mot numéro n
    for(i=0:i<LongueurMot(n):i++)
        buffer->(PositionMot(n)+i) = ' ';
];

[ DernierMot n; ! vrai si le mot numéro n est le dernier ou suivi d'un "point" (THEN1__WD, ...)
    if (n==NbMots()-1) ! le mot numéro n est-il le dernier ?
        return true;
    else        ! est-il suivi d'un "point" ?
        return (Mot(n+1) == THEN1__WD or THEN2__WD or THEN3__WD);
];

[ LanguageToInformese i word wordsuiv at b RangVerbe RangDernier;

    !Tokenise__(buffer,parse);
    VM_Tokenise(buffer,parse);
    #Ifdef DEBUG; affiche_buffer(buffer, "[ LanguageToInformese:^* Buffer reçu : "); #Endif;

    for (i=0:i<NbMots():i++) ! balayer toute la phrase
    {
         word = Mot(i);
         if (DernierMot(i)) wordsuiv=THEN1__WD; else wordsuiv=Mot(i+1);
         at = PositionMot(i); ! position du mot numéro i dans buffer
         if (word == 'dessus')
         {   LTI_Insert(at, ' '); ! remplace
             buffer->at     = 's';
             buffer->(at+1) = 'u';
             buffer->(at+2) = 'r';
             buffer->(at+3) = '-'; ! contrairement à 'lui', '-lui' peut être féminin !*! mais pas pluriel...
             buffer->(at+4) = 'l';
             buffer->(at+5) = 'u';
             buffer->(at+6) = 'i';
             !Tokenise__(buffer,parse);
             VM_Tokenise(buffer,parse);
             i = 0; continue;
         }
         if (word == 'dessous')
         {   LTI_Insert(at, ' '); ! remplace
             buffer->at     = 's';
             buffer->(at+1) = 'o';
             buffer->(at+2) = 'u';
             buffer->(at+3) = 's';
             buffer->(at+4) = '-'; ! contrairement à 'lui', '-lui' peut être féminin !*! mais pas pluriel...
             buffer->(at+5) = 'l';
             buffer->(at+6) = 'u';
             buffer->(at+7) = 'i';
             !Tokenise__(buffer,parse);
             VM_Tokenise(buffer,parse);
             i = 0; continue;
         }
!*! pas forcément une bonne idée car "dedans" est aussi une direction !*! mais "mets-le dedans" ?
!         if (word == 'dedans') !*! dehors ?
!         {   LTI_Insert(at, ' '); ! remplace
!             LTI_Insert(at, ' ');
!             buffer->at     = 'd';
!             buffer->(at+1) = 'a';
!             buffer->(at+2) = 'n';
!             buffer->(at+3) = 's';
!             buffer->(at+4) = ' ';
!             buffer->(at+5) = 'l';
!             buffer->(at+6) = 'u';
!             buffer->(at+7) = 'y';
!             !Tokenise__(buffer,parse);
!				VM_Tokenise(buffer,parse);
!             i = 0; continue;
!         }

         ! "nord-est" ou "nord est" devient "nordest"
         if ( (word=='nord-est'or'nord-ouest') || ((word=='nord')&&(wordsuiv=='est'or'ouest')) )
         {
             buffer->at     = ' '; ! décale
             buffer->(at+1) = 'n';
             buffer->(at+2) = 'o';
             buffer->(at+3) = 'r';
             buffer->(at+4) = 'd';
             !Tokenise__(buffer,parse);
             VM_Tokenise(buffer,parse);
             i = 0; continue;
         }
         ! "sud-est" ou "sud est" devient "sudest"
         if ( (word=='sud-est'or'sud-ouest') || ((word=='sud')&&(wordsuiv=='est'or'ouest')) )
         {
             buffer->at     = ' '; ! décale
             buffer->(at+1) = 's';
             buffer->(at+2) = 'u';
             buffer->(at+3) = 'd';
             !Tokenise__(buffer,parse);
             VM_Tokenise(buffer,parse);
             i = 0; continue;
         }
     }

    !  insertion d'un espace avant chaque tiret et après chaque apostrophe 
    for (i=WORDSIZE:i<WORDSIZE+NbChars():i++) {
        if (buffer->i == '-') LTI_Insert(i++, ' ');
        if (buffer->i == ''') LTI_Insert( ++i, ' ');  
    ! autre notation (interrogation) 'antislash'' par exemple (interrogation)
    }
    !Tokenise__(buffer,parse);
    VM_Tokenise(buffer,parse);

    ! Suppression de 'je' ou 'j^' en début de phrase.
    ! Par exemple, "je vais au nord" devient "vais au nord".
    if (Mot(0) == 'je' or 'j^') {
        EcraseMot(0);
        !Tokenise__(buffer,parse);
        VM_Tokenise(buffer,parse); 
    }

    ! ce qui suit ne tient pas bien compte des commandes s'adressant à quelqu'un ("machin, fais ceci")
    ! Transformation de phrases à l'infinitif commençant par un ou deux pronoms suivis d'un mot (verbe, probablement)
    ! Ex : "le lui donner" devient "donner -le -lui"
    ! Etape A : "le/la/l'/les" (suivi éventuellement de "lui/leur") passe après le verbe. Ex : "lui donner -le"
    word=Mot(0); ! 1er mot
    if ((NbMots()>=2)&&(Mot(1)=='lui'or'leur')) RangVerbe=2; else RangVerbe=1; 
    ! verbe = 2e ou 3e mot ?
    b=PositionMot(RangVerbe)+LongueurMot(RangVerbe); 
    
    ! juste après le verbe (egal) position du verbe (plus) longueur du verbe ne rien faire si la phrase ne comporte pas de verbe
     
     if (~~DernierMot(RangVerbe-1)) { 
       if (word == 'le')
        {
            EcraseMot(0);
            LTI_Insert(b, ' ');
            LTI_Insert(b+1, '-');
            LTI_Insert(b+2, 'l');
            LTI_Insert(b+3, 'e');
        }
        if (word == 'la')
        {
            EcraseMot(0);
            LTI_Insert(b, ' ');
            LTI_Insert(b+1, '-');
            LTI_Insert(b+2, 'l');
            LTI_Insert(b+3, 'a');
        }
        if (word == 'l^' or 'y//') ! exemple : "y aller" !*! 'y' à déplacer ?
        {
            EcraseMot(0); !*! imprécision : en fait 'l^' est équivalent à '-le' ou '-la'
            LTI_Insert(b, ' '); ! '-lui' est masculin ou féminin
            LTI_Insert(b+1, '-');
            LTI_Insert(b+2, 'l'); !*! 'y' donne '-y' ? et 'en' ?
            LTI_Insert(b+3, 'u');
            LTI_Insert(b+4, 'i');
        }
        if (word == 'les')
        {
            EcraseMot(0);
            LTI_Insert(b, ' ');
            LTI_Insert(b+1, '-');
            LTI_Insert(b+2, 'l');
            LTI_Insert(b+3, 'e');
            LTI_Insert(b+4, 's');
        }
    }
    !Tokenise__(buffer,parse);
    VM_Tokenise(buffer,parse);

    ! Etape B : "lui/leur" passe après le verbe. Ex : "lui donner -le" devient "donner -le -lui"
    word=Mot(0); ! 1er mot
    ! RangDernier est le rang du dernier mot du bloc : verbe + "-le/-la/-les"
    if ((NbMots()>=3)&&(Mot(2)=='-le'or'-la'or'-les' or'-lui')) RangDernier=2; else RangDernier=1; ! "-le/-la/-les" après le verbe ?
    b=PositionMot(RangDernier)+LongueurMot(RangDernier); 
    ! juste après bloc = position du dernier + longueur du dernier
    if (~~DernierMot(0)) { 
    	! ne rien faire si la phrase ne comporte pas de verbe
        if (word == 'lui')
        {
            EcraseMot(0);
            LTI_Insert(b, ' ');
            LTI_Insert(b+1, '-');
            LTI_Insert(b+2, 'l');
            LTI_Insert(b+3, 'u');
            LTI_Insert(b+4, 'i');
        }
        if (word == 'leur')
        {
            EcraseMot(0);
            LTI_Insert(b, ' ');
            LTI_Insert(b+1, '-');
            LTI_Insert(b+2, 'l');
            LTI_Insert(b+3, 'e');
            LTI_Insert(b+4, 'u');
            LTI_Insert(b+5, 'r');
        }
    }
    !Tokenise__(buffer,parse);
    VM_Tokenise(buffer,parse);

    if ( (word == 'me' or 'm^' or 'te' or 't^' or 'se' or 's^' or 'nous' or 'vous')
            && ~~DernierMot(0) ) ! sinon gènerait "se", abréviation de "sud-est"
    {
        EcraseMot(0);
        LTI_Insert(b, ' ');
        LTI_Insert(b+1, 'v');
        LTI_Insert(b+2, 'o');
        LTI_Insert(b+3, 'u');
        LTI_Insert(b+4, 's');
    }
    !Tokenise__(buffer,parse);
    VM_Tokenise(buffer,parse);
! TODO à retirer car pose pb avec I7 ? non : bien vérifier qu'il n'y a pas de verbe reflexif sans le mot 'vous' dedans, sinon cela provoque cette erreur.

    ! maintenant que les traitements sur l'infinitif ont été faits,
    ! enlever le tiret en début de mot pour ceux qui n'existent pas dans le dictionnaire
    ! (conserve '-lui','-le','-la'... et les mots prévus par le joueur)
    enleve_tirets();

    ! Avertir ceux qui oublient de mettre des traits d'union entre les pronons et le verbe
    ! à l'impératif et corriger les cas les plus simples : !*! le plus possible
    enleve_accents(); ! sinon "à" n'est pas reconnu !*! placer cette fonction encore plus en amont ?
    if ( ((NbMots()==2)&&(Mot(1)=='le'or'la'or'les'or'lui'or'leur')) || ! "parle lui" devient "parle-lui"
            ((NbMots()>=2)&&(Mot(1)=='lui')) || ! "donne lui la pomme" devient "donne-lui la pomme" (pas de confusion possible avec l'article)
            ((NbMots()>=4)&&(Mot(1)=='le'or'la'or'les'or'lui'or'leur')&&(Mot(2)=='a//'or'au'or'aux'or'de'or'du'or'des'or'dans'or'sur')) ) ! "donne le aux moutons" devient "donne-le aux moutons"
    {
        LTI_Insert(PositionMot(1), '-');
        print "[Mettez toujours un trait d'union entre le pronom et le verbe à l'impératif !]^";
    }
    if ((NbMots()==3)&&(Mot(1)=='le'or'la'or'les'or'-le'or'-la'or'-les')&&(Mot(2)=='lui'or'leur')) { ! "donne le lui" ou "donne-le lui" devient "donne-le-lui"
        if (Mot(1)=='le'or'la'or'les') LTI_Insert(PositionMot(1), '-');
        LTI_Insert(PositionMot(2), '-');
        print "[Mettez toujours un trait d'union entre chaque pronom et le verbe à l'impératif !]^";
    }

    ! remplacer "toi/vous/nous" en 2e position par "vous"
    if ((Mot(1) == 'moi' or 'toi' or 'nous')) !*! pas sûr encore, sert à gérer "réveillons nous" -> "réveillons vous"
    {
        EcraseMot(1); !*! fiable mais le buffer est agrandi de 3 ou 4 caractères : pas grave ?
        LTI_Insert(PositionMot(1)  , 'v');
        LTI_Insert(PositionMot(1)+1, 'o');
        LTI_Insert(PositionMot(1)+2, 'u');
        LTI_Insert(PositionMot(1)+3, 's');
    }

    !Tokenise__(buffer,parse);
    VM_Tokenise(buffer,parse);

    enleve_accents(); !*! déjà fait plus haut ? on ne sait jamais avec enleve_tirets() !*! rendre la suppression des accents systématique ? (dictionnaire ou pas)

    #Ifdef DEBUG; affiche_buffer(buffer, "* Buffer traduit en informese : "); #Endif;
];

#Ifdef DEBUG;
[ affiche_buffer buffer msg i len;
    if (parser_trace>=7)
    {
#Ifdef TARGET_ZCODE;
        len=buffer->1;
#Ifnot; ! TARGET_GLULX
        len=buffer-->0;
#Endif; ! TARGET_
        print (string) msg,"|";
              for(i=WORDSIZE:i<WORDSIZE+len:i++) print (char) buffer->i;
        print "|^";
    }
];
#Endif;


-) instead of "Translation" in "Language.i6t".

Include (-
Constant LanguageAnimateGender   = male;
Constant LanguageInanimateGender = male;

Constant LanguageContractionForms = 2;     ! French has two:
                                           ! 0 = starting with a consonant
                                           ! 1 = starting with a vowel
                                           !     or mute h
!*! ajouter d'autres voyelles (à accents) ?
[ LanguageContraction text;
    if (text->0 == 'a' or 'e' or 'é' or 'è' or 'i' or 'o' or 'u' or 'h'
                    or 'A' or 'E' or 'I' or 'O' or 'U' or 'H') return 1;
    return 0;
];

Array LanguageArticles -->

 !   Contraction form 0:     Contraction form 1:
 !   Cdef   Def    Indef     Cdef   Def    Indef

     "Le "  "le "  "un "     "L'"   "l'"   "un "          ! 0: masc sing
     "La "  "la "  "une "    "L'"   "l'"   "une "         ! 1: fem sing
     "Les " "les " "des "    "Les " "les " "des ";        ! 2: plural

                   !             a           i
                   !             s     p     s     p
                   !             m f n m f n m f n m f n                 

Array LanguageGNAsToArticles --> 0 1 0 2 2 2 0 1 0 2 2 2;

-) instead of "Articles" in "Language.i6t".

Include (-
[ LanguageVerb i;
    switch (i) {
      'i//','inv','inventaire':
               print "inventaire";
      'r//':   print "regarder";
      'x//':   print "examiner";
      'z//':   print "attendre";
      'v//':   print "regarder";
      'a//':   print "attendre";
      '!//':   print "dire";
      '?//':   print "demander";
      'q//':   print "quitter";
      'verrouiller': print "verrouiller";
      'deverrouiller': print "deverrouiller";
      default: rfalse;
    }
    rtrue;
];


[ LanguageVerbLikesAdverb w;
    if (w == 'look' or 'go' or 'push' or 'walk')
        rtrue;
    rfalse;
];

[ LanguageVerbMayBeName w;
    if (w == 'long' or 'short' or 'normal'
                    or 'brief' or 'full' or 'verbose')
        rtrue;
    rfalse;
];
-) instead of "Commands" in "Language.i6t".

Include (-

#Ifdef French1PSPr; ! Pour la 1ère personne du singulier présent

Constant NKEY__TX     = "S = suivant";
Constant PKEY__TX     = "P = précédent";
Constant QKEY1__TX    = "        Q = retour"; !huit espaces pour aligner à droite
Constant QKEY2__TX    = "Q = menu précédent";
Constant RKEY__TX     = "ENTREE = lire sujet";

Constant NKEY1__KY    = 'S';
Constant NKEY2__KY    = 's';
Constant PKEY1__KY    = 'P';
Constant PKEY2__KY    = 'p';
Constant QKEY1__KY    = 'Q';
Constant QKEY2__KY    = 'q';

Constant SCORE__TX    = "Score : ";
Constant MOVES__TX    = "Tours : ";
Constant TIME__TX     = "Heure : ";
Constant CANTGO__TX   = "Je ne peux pas aller dans cette direction.";
Constant FORMER__TX   = "moi - avant";
Constant YOURSELF__TX = "moi-même";
Constant YOU__TX        = "Je";
Constant DARKNESS__TX = "L'obscurité";

Constant THOSET__TX   = "ces choses-là";
Constant THAT__TX     = "cela";
Constant OR__TX       = " ou ";
Constant NOTHING__TX  = "rien";
Constant NOTHING2__TX    = "Rien"; 

Global IS__TX       = "est ";   ! utilisés par WriteListFrom
Global ARE__TX      = "sont ";  ! 
Global IS2__TX      = "";  ! dans/sur lequel " est"  => contenant/supportant
Global ARE2__TX     = "";  ! dans/sur lequel " sont" => contenant/supportant
Global IS3__TX       = "se trouve";  ! sur le lit se trouvait...
Global ARE3__TX      = "se trouvent";  ! 

Constant AND__TX        = " et ";
#ifdef I7_SERIAL_COMMA;
Constant LISTAND__TX   = ", et ";
Constant LISTAND2__TX  = " et ";
#ifnot;
Constant LISTAND__TX   = " et ";
Constant LISTAND2__TX  = " et ";
#endif; ! I7_SERIAL_COMMA
Constant WHOM__TX     = "";  ! dans/sur "lequel " est  => contenant/supportant
Constant WHICH__TX    = "";  ! dans/sur "lequel " est  => contenant/supportant
Constant COMMA__TX      = ", ";

#Endif; 
! Fin test French1PSPr

#Ifdef French1PSPa; ! Pour la 1ère personne du singulier passé

Constant NKEY__TX     = "S = suivant";
Constant PKEY__TX     = "P = précédent";
Constant QKEY1__TX    = "        Q = retour"; !huit espaces pour aligner à droite
Constant QKEY2__TX    = "Q = menu précédent";
Constant RKEY__TX     = "ENTREE = lire sujet";

Constant NKEY1__KY    = 'S';
Constant NKEY2__KY    = 's';
Constant PKEY1__KY    = 'P';
Constant PKEY2__KY    = 'p';
Constant QKEY1__KY    = 'Q';
Constant QKEY2__KY    = 'q';

Constant SCORE__TX    = "Score : ";
Constant MOVES__TX    = "Tours : ";
Constant TIME__TX     = "Heure : ";
Constant CANTGO__TX   = "Je ne pouvais pas aller dans cette direction.";
Constant FORMER__TX   = "moi - avant";
Constant YOURSELF__TX = "moi-même";
Constant YOU__TX        = "Je";
Constant DARKNESS__TX = "L'obscurité";

Constant THOSET__TX   = "ces choses-là";
Constant THAT__TX     = "cela";
Constant OR__TX       = " ou ";
Constant NOTHING__TX  = "rien";
Constant NOTHING2__TX    = "Rien"; 

Global IS__TX       = "était ";   ! utilisés par WriteListFrom
Global ARE__TX      = "étaient ";  ! 
Global IS2__TX      = "";  ! dans/sur lequel " est"  => contenant/supportant
Global ARE2__TX     = "";  ! dans/sur lequel " sont" => contenant/supportant
Global IS3__TX       = "se trouvait";  ! sur le lit se trouvait...
Global ARE3__TX      = "se trouvaient";  ! 

Constant AND__TX        = " et ";
#ifdef I7_SERIAL_COMMA;
Constant LISTAND__TX   = ", et ";
Constant LISTAND2__TX  = " et ";
#ifnot;
Constant LISTAND__TX   = " et ";
Constant LISTAND2__TX  = " et ";
#endif; ! I7_SERIAL_COMMA
Constant WHOM__TX     = "";  ! dans/sur "lequel " est  => contenant/supportant
Constant WHICH__TX    = "";  ! dans/sur "lequel " est  => contenant/supportant
Constant COMMA__TX      = ", ";

#Endif; 
! Fin test French1PSPa

#Ifdef French3PSPa; ! Pour la 3ème personne du singulier passé

Constant NKEY__TX     = "S = suivant";
Constant PKEY__TX     = "P = précédent";
Constant QKEY1__TX    = "        Q = retour"; !huit espaces pour aligner à droite
Constant QKEY2__TX    = "Q = menu précédent";
Constant RKEY__TX     = "ENTREE = lire sujet";

Constant NKEY1__KY    = 'S';
Constant NKEY2__KY    = 's';
Constant PKEY1__KY    = 'P';
Constant PKEY2__KY    = 'p';
Constant QKEY1__KY    = 'Q';
Constant QKEY2__KY    = 'q';

Constant SCORE__TX    = "Score : ";
Constant MOVES__TX    = "Tours : ";
Constant TIME__TX     = "Heure : ";


Global CANTGO__TX   = "Il ne put aller dans cette direction.";
Global FORMER__TX   = "son ancien lui";
Global YOURSELF__TX = "lui-même";



Constant YOU__TX        = "Il";
Constant DARKNESS__TX = "L'obscurité";

Constant THOSET__TX   = "ces choses-là";
Constant THAT__TX     = "ça";
Constant OR__TX       = " ou ";
Constant NOTHING__TX  = "rien";
Constant NOTHING2__TX    = "Rien"; 

Global IS__TX       = "était ";   ! utilisés par WriteListFrom
Global ARE__TX      = "étaient ";  ! 
Global IS2__TX      = "";  ! dans/sur lequel " est"  => contenant/supportant
Global ARE2__TX     = "";  ! dans/sur lequel " sont" => contenant/supportant
Global IS3__TX       = "se trouvait";   ! sur le lit se trouvait...
Global ARE3__TX      = "se trouvaient";  ! 


Constant AND__TX      = " et ";


#ifdef I7_SERIAL_COMMA;
Constant LISTAND__TX   = ", et ";
Constant LISTAND2__TX  = " et ";
#ifnot;
Constant LISTAND__TX   = " et ";
Constant LISTAND2__TX  = " et ";
#endif; ! I7_SERIAL_COMMA




Constant WHOM__TX     = "";  ! dans/sur "lequel " est  => contenant/supportant
Constant WHICH__TX    = "";  ! dans/sur "lequel " est  => contenant/supportant
Constant COMMA__TX      = ", ";

#Endif;
! fin test French3PSPa

#Ifdef French3PSPr; ! Pour la 3ème personne du singulier présent

Constant NKEY__TX     = "S = suivant";
Constant PKEY__TX     = "P = précédent";
Constant QKEY1__TX    = "        Q = retour"; !huit espaces pour aligner à droite
Constant QKEY2__TX    = "Q = menu précédent";
Constant RKEY__TX     = "ENTREE = lire sujet";

Constant NKEY1__KY    = 'S';
Constant NKEY2__KY    = 's';
Constant PKEY1__KY    = 'P';
Constant PKEY2__KY    = 'p';
Constant QKEY1__KY    = 'Q';
Constant QKEY2__KY    = 'q';

Constant SCORE__TX    = "Score : ";
Constant MOVES__TX    = "Tours : ";
Constant TIME__TX     = "Heure : ";


Global CANTGO__TX   = "Il ne peut aller dans cette direction.";
Global FORMER__TX   = "son ancien lui";
Global YOURSELF__TX = "lui-même";



Constant YOU__TX        = "Il";
Constant DARKNESS__TX = "L'obscurité";

Constant THOSET__TX   = "ces choses-là";
Constant THAT__TX     = "ça";
Constant OR__TX       = " ou ";
Constant NOTHING__TX  = "rien";
Constant NOTHING2__TX    = "Rien"; 

Global IS__TX       = "est ";   ! utilisés par WriteListFrom
Global ARE__TX      = "sont ";  ! 
Global IS2__TX      = "";  ! dans/sur lequel " est"  => contenant/supportant
Global ARE2__TX     = "";  ! dans/sur lequel " sont" => contenant/supportant
Global IS3__TX       = "se trouve";   ! sur le lit se trouvait...
Global ARE3__TX      = "se trouvent";  ! 


Constant AND__TX      = " et ";


#ifdef I7_SERIAL_COMMA;
Constant LISTAND__TX   = ", et ";
Constant LISTAND2__TX  = " et ";
#ifnot;
Constant LISTAND__TX   = " et ";
Constant LISTAND2__TX  = " et ";
#endif; ! I7_SERIAL_COMMA




Constant WHOM__TX     = "";  ! dans/sur "lequel " est  => contenant/supportant
Constant WHICH__TX    = "";  ! dans/sur "lequel " est  => contenant/supportant
Constant COMMA__TX      = ", ";

#Endif;
! fin test French3PSPr

#IfDef French;
!Ifnot; ! Pour la version 'normale' (2ème personne pluriel (vous) au présent)

Constant NKEY__TX     = "S = suivant";
Constant PKEY__TX     = "P = précédent";
Constant QKEY1__TX    = "        Q = retour"; !huit espaces pour aligner à droite
Constant QKEY2__TX    = "Q = menu précédent";
Constant RKEY__TX     = "ENTREE = lire sujet";

Constant NKEY1__KY    = 'S';
Constant NKEY2__KY    = 's';
Constant PKEY1__KY    = 'P';
Constant PKEY2__KY    = 'p';
Constant QKEY1__KY    = 'Q';
Constant QKEY2__KY    = 'q';

Constant SCORE__TX    = "Score : ";
Constant MOVES__TX    = "Tours : ";
Constant TIME__TX     = "Heure : ";

Global CANTGO__TX   = "Vous ne pouvez pas aller dans cette direction.";
Global FORMER__TX   = "votre ancien vous";
Global YOURSELF__TX = "vous-même";

Constant YOU__TX        = "Vous";
Constant DARKNESS__TX = "L'obscurité";

Constant THOSET__TX   = "ces choses-là";
Constant THAT__TX     = "cela";
Constant OR__TX       = " ou ";
Constant NOTHING__TX  = "rien";
Constant NOTHING2__TX    = "Rien"; 

Global IS__TX       = "est ";   ! utilisés par WriteListFrom
Global ARE__TX      = "sont ";  ! 
Global IS2__TX      = "";  ! dans/sur lequel " est"  => contenant/supportant
Global ARE2__TX     = "";  ! dans/sur lequel " sont" => contenant/supportant
Global IS3__TX       = "se trouve";  ! "sur le lit se trouve..."
Global ARE3__TX      = "se trouvent";  ! "sur le lit se trouvent..."

Constant AND__TX        = " et ";
#ifdef I7_SERIAL_COMMA;
Constant LISTAND__TX   = ", et ";
Constant LISTAND2__TX  = " et ";
#ifnot;
Constant LISTAND__TX   = " et ";
Constant LISTAND2__TX  = " et ";
#endif; ! I7_SERIAL_COMMA
Constant WHOM__TX     = "";  ! dans/sur "lequel " est  => contenant/supportant
Constant WHICH__TX    = "";  ! dans/sur "lequel " est  => contenant/supportant
Constant COMMA__TX      = ", ";
#Endif; ! Fin du test pour le temps et la personne
-) instead of "Short Texts" in "Language.i6t".

Include (-

#Ifdef French1PSPr; ! Pour la 1ère personne du singulier présent

![ ThatorThose obj;   ! ex : vous n'allez pas manger ça (accusatif) (utile ?)
!  print "ça";
!];
[ ItorThem obj; ! ex : avant de pouvoir vous/le/la/les poser... (accusatif ?)
  if (obj == player) { print "vous"; return; }  ! todo : a corriger en moi ?
  if (obj has pluralname)  { print "les"; return;}
  if (obj has female) { print "la"; return; }
  else { print "le"; return; }
];
[ IsorAre obj;
  if (obj has pluralname || obj == player) print "sont"; else print "est";
];
[ CThatorThose obj;   ! il/ils/elle/elles semble(nt) ouvert(e) (nominatif)
  ! if (obj == player) { print "Vous"; return; } !*! utile ?
  if (obj has pluralname) {
    if (obj has female) {print "Elles"; return; }
    else { print "Ils"; return; }
  }
  if (obj has female) { print "Elle"; return; }
  else { print "Il"; return; }
];
[ CTheyreorThats obj;
  if (obj == player) { print "Je suis"; return; }
  if (obj has pluralname) {
     if (obj has female) { print "Elles sont"; return; }
     else { print "Ils sont"; return; }
  }
  if (obj has female) { print "Elle est"; return; }
  else { print "Il est"; return; }
];

! Quelques fonctions additionnelles...
[ es obj; ! ex: fermé(es), ouvert(es)
  if (obj has female) print "e";
  if (obj has pluralname) print "s";
  !*! attention : pris, prise, pris, prises
];
[ s obj; ! ex: vide(s)
  if (obj has pluralname) print "s";
];
[ DeDuDes obj; ! ex : descendre... sortir...
  if (obj == player) { print "de moi"; return; }
  if (obj has pluralname)  { print "des ", (name) obj; return;}
  if (obj has female or proper) { print "de ", (the) obj; return;} ! ex : de la voiture, de Paris
  !*! test ci-dessous à effectuer avec @output_stream (ZCode) et avec PrintAnyToArray (Glulx) ?
  ! if ((the)obj="l'...") {print "de ", (the) obj; return;} ! ex : de l'avion
  print "du ", (name) obj; return; ! ex : du train, du Nautilus (le Nautilus ne doit donc pas être considéré comme proper !*!)
];
! (Stormi) Cette fonction permet d'afficher correctement "à la" "à l'" "au" ou "aux"
! selon le contexte.
[ to_the obj;
    if (obj has pluralname) {
        print "aux ", (name) obj;
    }
    else if (obj has proper) {
        print "à ", (name) obj;
    }
    else {
        ! Les lignes qui suivent sont copiées de la fonction PrefaceByArticle de parserm.h
        ! afin de connaître la valeur de LanguageContraction pour le nom affiché de l'objet
        ! Je suis le seul à trouver cela atrocement compliqué ?
#ifdef TARGET_ZCODE;
        StorageForShortName-->0 = 160;
        @output_stream 3 StorageForShortName;
        print (PSN__) noun;
        @output_stream -3;
        if (obj has male && LanguageContraction(StorageForShortName + 2)==0) {
             print "au ", (name) obj;
! ne semble pas fonctionner avec inform 7, aussi je rajoute 2 points après "à"
        }
        else {
            print "à : ", (the) obj;
        }
#ifnot; ! TARGET_GLULX;
		print "à quelqu'un : ", (name) obj;
#endif;
    }
];
[ nt obj; ! ex: semble(nt)
  if (obj has pluralname) print "nt";
  !*! attention :  paraît, paraissent (etc)
];
[ IsorAreNot obj;
  if (obj has pluralname || obj == player) print "ne sont pas";
                                      else print "n'est pas";
];

#Endif; ! Fin test French1PSPr


#Ifdef French1PSPa; ! Pour la 1ère personne du singulier passé

![ ThatorThose obj;   ! ex : vous n'allez pas manger ça (accusatif) (utile ?)
!  print "ça";
!];
[ ItorThem obj; ! ex : avant de pouvoir vous/le/la/les poser... (accusatif ?)
  if (obj == player) { print "vous"; return; }  ! todo : a corriger en moi ?
  if (obj has pluralname)  { print "les"; return;}
  if (obj has female) { print "la"; return; }
  else { print "le"; return; }
];
[ IsorAre obj;
  if (obj has pluralname || obj == player) print "étaient"; else print "était";
];
[ CThatorThose obj;   ! il/ils/elle/elles semble(nt) ouvert(e) (nominatif)
  ! if (obj == player) { print "Vous"; return; } !*! utile ?
  if (obj has pluralname) {
    if (obj has female) {print "Elles"; return; }
    else { print "Ils"; return; }
  }
  if (obj has female) { print "Elle"; return; }
  else { print "Il"; return; }
];
[ CTheyreorThats obj;
  if (obj == player) { print "J'étais"; return; }
  if (obj has pluralname) {
     if (obj has female) { print "Elles étaient"; return; }
     else { print "Ils étaient"; return; }
  }
  if (obj has female) { print "Elle était"; return; }
  else { print "Il était"; return; }
];

! Quelques fonctions additionnelles...
[ es obj; ! ex: fermé(es), ouvert(es)
  if (obj has female) print "e";
  if (obj has pluralname) print "s";
  !*! attention : pris, prise, pris, prises
];
[ s obj; ! ex: vide(s)
  if (obj has pluralname) print "s";
];
[ DeDuDes obj; ! ex : descendre... sortir...
  if (obj == player) { print "de moi"; return; }
  if (obj has pluralname)  { print "des ", (name) obj; return;}
  if (obj has female or proper) { print "de ", (the) obj; return;} ! ex : de la voiture, de Paris
  !*! test ci-dessous à effectuer avec @output_stream (ZCode) et avec PrintAnyToArray (Glulx) ?
  ! if ((the)obj="l'...") {print "de ", (the) obj; return;} ! ex : de l'avion
  print "du ", (name) obj; return; ! ex : du train, du Nautilus (le Nautilus ne doit donc pas être considéré comme proper !*!)
];
! (Stormi) Cette fonction permet d'afficher correctement "à la" "à l'" "au" ou "aux"
! selon le contexte.
[ to_the obj;
    if (obj has pluralname) {
        print "aux ", (name) obj;
    }
    else if (obj has proper) {
        print "à ", (name) obj;
    }
    else {
        ! Les lignes qui suivent sont copiées de la fonction PrefaceByArticle de parserm.h
        ! afin de connaître la valeur de LanguageContraction pour le nom affiché de l'objet
        ! Je suis le seul à trouver cela atrocement compliqué ?
#ifdef TARGET_ZCODE;
        StorageForShortName-->0 = 160;
        @output_stream 3 StorageForShortName;
        print (PSN__) noun;
        @output_stream -3;
        if (obj has male && LanguageContraction(StorageForShortName + 2)==0) {
             print "au ", (name) obj;
! ne semble pas fonctionner avec inform 7, aussi je rajoute 2 points après "à"
        }
        else {
            print "à : ", (the) obj;
        }
#ifnot; ! TARGET_GLULX;
		print "à quelqu'un : ", (name) obj;
#endif;
    }
];
[ nt obj; ! ex: semble(nt)
  if (obj has pluralname) print "nt";
  !*! attention :  paraît, paraissent (etc)
];
[ IsorAreNot obj;
  if (obj has pluralname || obj == player) print "n'étaient pas";
                                      else print "n'était pas";
];

#Endif; ! Fin test French1PSPa

#ifdef French3PSPa; ! Pour la 3ème personne du singulier passé
![ ThatorThose obj;   ! ex : vous n'allez pas manger ça (accusatif) (utile ?)
!  print "ça";
!];
[ ItorThem obj; ! ex : avant de pouvoir vous/le/la/les poser... (accusatif ?)
  if (obj == player) { print "il"; return; }
  if (obj has pluralname)  { print "les"; return;}
  if (obj has female) { print "la"; return; }
  else { print "le"; return; }
];
[ IsorAre obj;
  if (obj has pluralname || obj == player) print "étaient"; else print "était";
  ! if (obj has pluralname || obj == player) print "furent"; else print "fut";
];
[ CThatorThose obj;   ! il/ils/elle/elles semble(nt) ouvert(e) (nominatif)
  ! if (obj == player) { print "Il"; return; } !*! utile ?
  if (obj has pluralname) {
    if (obj has female) {print "Elles"; return; }
    else { print "Ils"; return; }
  }
  if (obj has female) { print "Elle"; return; }
  else { print "Il"; return; }
];
[ CTheyreorThats obj;
  if (obj == player) { print "Il était"; return; }
  if (obj has pluralname) {
     if (obj has female) { print "Elles étaient"; return; }
     else { print "Ils étaient"; return; }
  }
  if (obj has female) { print "Elle était"; return; }
  else { print "Il était"; return; }
];

! Quelques fonctions additionnelles...
[ es obj; ! ex: fermé(es), ouvert(es)
  if (obj has female) print "e";
  if (obj has pluralname) print "s";
  !*! attention : pris, prise, pris, prises
];
[ s obj; ! ex: vide(s)
  if (obj has pluralname) print "s";
];
[ DeDuDes obj; ! ex : descendre... sortir...
  if (obj == player) { print "de lui"; return; }
  if (obj has pluralname)  { print "des ", (name) obj; return;}
  if (obj has female or proper) { print "de ", (the) obj; return;} ! ex : de la voiture, de Paris
  !*! test ci-dessous à effectuer avec @output_stream (ZCode) et avec PrintAnyToArray (Glulx) ?
  ! if ((the)obj="l'...") {print "de ", (the) obj; return;} ! ex : de l'avion
  print "du ", (name) obj; return; ! ex : du train, du Nautilus (le Nautilus ne doit donc pas être considéré comme proper !*!)
];
[ nt obj; ! ex: semble(nt)
  if (obj has pluralname) print "nt";
  !*! attention :  paraît, paraissent (etc)
];
[ IsorAreNot obj;
  if (obj has pluralname || obj == player) print "n'étaient pas";
                                      else print "n'était pas";
];

! fin test French3PSPa

#EndIf;

#ifdef French3PSPr; ! Pour la 3ème personne du singulier présent
![ ThatorThose obj;   ! ex : vous n'allez pas manger ça (accusatif) (utile ?)
!  print "ça";
!];
[ ItorThem obj; ! ex : avant de pouvoir vous/le/la/les poser... (accusatif ?)
  if (obj == player) { print "il"; return; }
  if (obj has pluralname)  { print "les"; return;}
  if (obj has female) { print "la"; return; }
  else { print "le"; return; }
];
[ IsorAre obj;
  if (obj has pluralname || obj == player) print "sont"; else print "est";
];
[ CThatorThose obj;   ! il/ils/elle/elles semble(nt) ouvert(e) (nominatif)
  ! if (obj == player) { print "Il"; return; } !*! utile ?
  if (obj has pluralname) {
    if (obj has female) {print "Elles"; return; }
    else { print "Ils"; return; }
  }
  if (obj has female) { print "Elle"; return; }
  else { print "Il"; return; }
];
[ CTheyreorThats obj;
  if (obj == player) { print "Il est"; return; }
  if (obj has pluralname) {
     if (obj has female) { print "Elles sont"; return; }
     else { print "Ils sont"; return; }
  }
  if (obj has female) { print "Elle est"; return; }
  else { print "Il est"; return; }
];

! Quelques fonctions additionnelles...
[ es obj; ! ex: fermé(es), ouvert(es)
  if (obj has female) print "e";
  if (obj has pluralname) print "s";
  !*! attention : pris, prise, pris, prises
];
[ s obj; ! ex: vide(s)
  if (obj has pluralname) print "s";
];
[ DeDuDes obj; ! ex : descendre... sortir...
  if (obj == player) { print "de lui"; return; }
  if (obj has pluralname)  { print "des ", (name) obj; return;}
  if (obj has female or proper) { print "de ", (the) obj; return;} ! ex : de la voiture, de Paris
  !*! test ci-dessous à effectuer avec @output_stream (ZCode) et avec PrintAnyToArray (Glulx) ?
  ! if ((the)obj="l'...") {print "de ", (the) obj; return;} ! ex : de l'avion
  print "du ", (name) obj; return; ! ex : du train, du Nautilus (le Nautilus ne doit donc pas être considéré comme proper !*!)
];
[ nt obj; ! ex: semble(nt)
  if (obj has pluralname) print "nt";
  !*! attention :  paraît, paraissent (etc)
];
[ IsorAreNot obj;
  if (obj has pluralname || obj == player) print "ne sont pas";
                                      else print "n'est pas";
];

! fin test French3PSPr

#EndIf;

!Ifnot; ! Pour la version 'normale' (2ème personne pluriel (vous) au présent)

#IfDef French; 

![ ThatorThose obj;   ! ex : vous n'allez pas manger ça (accusatif) (utile ?)
!  print "ça";
!];
[ ItorThem obj; ! ex : avant de pouvoir vous/le/la/les poser... (accusatif ?)
    if (obj == player) { print "vous"; return; }
    if (obj has pluralname)  { print "les"; return;}
    if (obj has female) { print "la"; return; }
    else { print "le"; return; }
];
[ IsorAre obj;
    if (obj has pluralname || obj == player) print "sont"; else print "est";
];
[ CThatorThose obj;   ! il/ils/elle/elles semble(nt) ouvert(e) (nominatif)
    ! if (obj == player) { print "Vous"; return; } !*! utile ?
    if (obj has pluralname) {
        if (obj has female) {print "Elles"; return; }
        else { print "Ils"; return; }
    }
    if (obj has female) { print "Elle"; return; }
    else { print "Il"; return; }
    ];
[ CTheyreorThats obj;
    if (obj == player) { print "Vous êtes"; return; }
    if (obj has pluralname) {
        if (obj has female) { print "Elles sont"; return; }
        else { print "Ils sont"; return; }
    }
    if (obj has female) { print "Elle est"; return; }
    else { print "Il est"; return; }
];

! Quelques fonctions additionnelles...
[ es obj; ! ex: fermé(es), ouvert(es)
    if (obj has female) print "e";
    if (obj has pluralname) print "s";
    !*! attention : pris, prise, pris, prises
];
[ s obj; ! ex: vide(s)
    if (obj has pluralname) print "s";
];
[ DeDuDes obj; ! ex : descendre... sortir...
    if (obj == player) { print "de vous"; return; }
    if (obj has pluralname)  { print "des ", (name) obj; return;}
    if (obj has female or proper) { print "de ", (the) obj; return;} ! ex : de la voiture, de Paris
    !*! test ci-dessous à effectuer avec @output_stream (ZCode) et avec PrintAnyToArray (Glulx) ?
    ! if ((the)obj="l'...") {print "de ", (the) obj; return;} ! ex : de l'avion
    print "du ", (name) obj; return; ! ex : du train, du Nautilus (le Nautilus ne doit donc pas être considéré comme proper !*!)
];
! (Stormi) Cette fonction permet d'afficher correctement "à la" "à l'" "au" ou "aux"
! selon le contexte.
[ to_the obj;
    if (obj has pluralname) {
        print "aux ", (name) obj;
    }
    else if (obj has proper) {
        print "à ", (name) obj;
    }
    else {
        ! Les lignes qui suivent sont copiées de la fonction PrefaceByArticle de parserm.h
        ! afin de connaître la valeur de LanguageContraction pour le nom affiché de l'objet
        ! Je suis le seul à trouver cela atrocement compliqué ?
#ifdef TARGET_ZCODE;
        StorageForShortName-->0 = 160;
        @output_stream 3 StorageForShortName;
        print (PSN__) noun;
        @output_stream -3;
        if (obj has male && LanguageContraction(StorageForShortName + 2)==0) {
             print "au ", (name) obj;
        }
        else {
            print "à ", (the) obj;
        }
#ifnot; ! TARGET_GLULX;
		print "à quelqu'un : ", (name) obj;
#endif;
    }
];
[ nt obj; ! ex: semble(nt)
    if (obj has pluralname) print "nt";
    !*! attention :  paraît, paraissent (etc)
];
[ IsorAreNot obj;
    if (obj has pluralname || obj == player) print "ne sont pas";
                                        else print "n'est pas";
];
#Endif; ! Fin du test pour le temps et la personne
-) instead of "Printed Inflections" in "Language.i6t".

Include (-
! The standard messages are (will be) implemented in I7 source text, not here in
! I6 code. (for now)

![ ======================================================== )

#Ifdef French1PSPr; ! Pour la 1ère personne du singulier présent

[ LanguageLM n x1 x2;
 say__p = 1; ! responsable pour les sauts de lignes avant prompt !! (line break / paragraphe break)
  ! Answer, Ask:    "Mes tentatives ne lui arrachent aucune parole. ";  
Answer, Ask:    "Pas de réponse.";
! Ask:      see Answer
  Attack:         "La violence n'est pas forcément une solution.";
! Attack:         "Je n'ai nulle envie de me battre en cet instant. ";
! Blow:           "J'oublie rapidement cette idée insolite.";
  !Burn:           "Brûler ceci ? Cette idée me semble de plus en plus improbable à mesure que j'y réfléchis. ";
Burn:           "Je n'ai pas d'intérêt à brûler ceci.";
  Buy:            "Rien à vendre, ni à acheter par ici. ";
  Climb:          "Je n'ai nulle possibilité d'escalader ceci. ";
  Close: switch (n) {
               1: "Fermer cela me semble impossible. ";
               2: print (ctheyreorthats) x1, " déjà fermé";
                  if (x1 has female) "e.";
                  ".";
               3: "Je ferme ", (the) x1, ".";
    }
!   CommandsOff: switch (n) {
!         1: "[Enregistrement des commandes désactivé.]";
!         #Ifdef TARGET_GLULX;
!         2: "[Enregistrement des commandes déjà désactivé.]";
!         #Endif; ! TARGET_
!     }
!   CommandsOn: switch (n) {
!         1: "[Enregistrement des commandes activé.]";
!         #Ifdef TARGET_GLULX;
!         2: "[Les commandes sont actuellement en train d'être rejouées.]";
!         3: "[Enregistrement des commandes déjà activé.]";
!         4: "[Echec d'enregistrement des commandes.]";
!         #Endif; ! TARGET_
!     }
!   CommandsRead: switch (n) {
!         1: "[Rejouer les commandes.]";
!         #Ifdef TARGET_GLULX;
!         2: "[Les commandes sont déjà en train d'être rejouées.]";
!         3: "[Rejouer les commandes a échoué.  L'enregistrement des commandes est activé.]";
!         4: "[Rejouer les commandes a échoué.]";
!         5: "[Rejouer les commandes achevé.]";
!         #Endif; ! TARGET_
!     }
  Consult:        "Je ne trouve rien qui attire mon attention dans ", (the) x1, ".";
!   CrierSansPrecision : "Je crie ce qui me passait par la tête.";
  Cut:            "Je ne vois aucun intérêt à couper cela.";
!   Dig:            "Creuser... Cette idée ne me séduit pas.";
  Disrobe: switch (n) {
               1: "Je ne ", (itorthem) x1, " porte pas.";
               2: "J'enleve ", (the) x1, ".";
    }
  Drink:          "Nulle boisson ne s'offre à moi.";
  Drop: switch (n) {
               1: if (x1 has pluralname) print (The) x1, " sont ";
                  else print (The) x1, " est ";
                  "déjà ici.";
               2: "Je n'ai pas cela.";
               3: "(Je prend ", (the) x1, ")";
               4: "Voilà qui est fait.";
    }
  Eat: switch (n) {
              1: print_ret (ctheyreorthats) x1,
                  " non comestible, selon toute évidence.";
               2: "Je mange ", (the) x1, " sans envie ni appétit.";
    }
!   EmptyT: switch (n) {
!                1: print_ret (The) x1, " ne peut rien contenir.";
!                2: print_ret (The) x1, " ", (isorare) x1, " fermé",(es) x1,".";
!                3: print_ret (The) x1, " ", (isorare) x1, " déjà vide",(s) x1,".";
!                4: "Ceci ne vide rien.";
!     }
  Enter: switch (n) {
               1: print "Impossible, je suis déjà ";
                  if (x1 has supporter) print "sur "; else print "dans ";
                  print_ret (the) x1, ".";
        2:  print "Je ne peux pas ";
            switch (verb_word) {
                'entrer':    "y entrer.";
                'asseoir':    "m'y asseoir.";
                'allonger':    "m'y allonger.";
                'coucher':    "m'y coucher.";
                default:  "y aller."; ! plutôt que "y entrer." !*!
            }
               3: "Je ne peux pas entrer dans ", (the) x1, " fermé",(es) x1,".";
               4: print "Je ne peux pas ";
                  if (x1 has supporter) print "monter sur";
                                   else print "entrer dans";
                  " ceci.";
                               ! sur pieds, non encastré (freestanding)
               5: print "Je ";
                  if (x1 has supporter) print "monte sur "; else print "pénètre dans ";
                  print_ret (the) x1, ".";
               6: print "(";
                  if (x1 has supporter) print "descendant "; else print "sortant ";
                  print (the) x1; ")";
               7: if (x1 has supporter) "(montant sur ", (the) x1, ")^";
                  if (x1 has container) "(entrant dans ", (the) x1, ")^";
                  "(entrant dans ", (the) x1, ")^";
		8:	print (The) actor, " gets into ", (the) x1, ".^";
        9:  print (The) actor, " gets onto ", (the) x1, ".^";
    }
  Examine: switch (n) {
               1: "L'obscurité m'enveloppe de son linceul impénétrable.";
               2: "Rien de particulier concernant ", (the) x1, ".";
               3: print (The) x1, " ", (isorare) x1, " actuellement ";
                  if (x1 has on) "allumé",(es) x1,"."; else "éteint",(es) x1,".";
                  4:	print (The) actor, " looks closely at ", (the) x1, ".^";  
               5:  "En dépit de mes efforts, je ne vois rien de particulier dans cette direction.";
    }
  Exit: switch (n) {
              1: "Nulle sortie n'existe ici. ";
               2: print "Je ne peux pas sortir ";
                  print_ret (dedudes) x1, " fermé", (es) x1, ".";
               3: print "Je ";
                  if (x1 has supporter) print "descends "; else print "sors ";
                  print_ret (dedudes) x1, ".";
        4:  print "Je ne suis pas ";
            if (x1 has supporter) print "sur "; else print "dans ";
            print_ret (the) x1, ".";
    }
!   Fill:           "Aucun liquide ne pouvait répondre à mon idée.";
!   FullScore: switch(n) {
!                1: if (deadflag) print "Le score est ";
!                   else          print "Le score est ";
!                   "composé comme suit :^";
!                2: "trouver divers objets";
!                3: "visiter différents endroits";
!                4: print "total (sur ", MAX_SCORE; ")";
!            }
  GetOff:         "Je ne suis pas sur ", (the) x1, " en ce moment.";
  Give: switch (n) {
               1: "Je ne tiens pas ", (the) x1, ".";
               2: "Je soupèse ", (the) x1,
                  " pendant un moment, perdu dans mes pensées.";
               3: print (The) x1;
                  if (x1 has pluralname)
	             print " n'ont pas l'air intéressé";
                  else print " n'a pas l'air intéressé";
                  ".";
        4:  print (The) x1;
            if (x1 has pluralname) print " aren't";
            else print " isn't";
            " able to receive things.";
		5:	"You give ", (the) x1, " to ", (the) second, ".";
		6: print (The) actor, " gives ", (the) x1, " to you.^";
		7: print (The) actor, " gives ", (the) x1, " to ", (the) second, ".^";
    }
  Go: switch (n) {
               1: print "Je dois d'abord ";
                  if (x1 has supporter) print "descendre "; else print "sortir ";
                  print_ret (dedudes) x1, ".";
               2: "Je ne peux aller dans cette direction. ";
               3: "Je suis dans l'impossibilité de gravir ", (the) x1, ".";
               4: "Je ne peux descendre par ", (the) x1, ".";
               5: "Je ne peux pas, puisque ", (the) x1, " ", (isorare) x1,
                  " sur mon chemin.";
               6: print "Je ne le peux, puisque ", (the) x1;
                  if (x1 has pluralname) " ne mènent nulle part.";
                  " ne mène nulle part.";
                7:	"Vous devez dire quelle direction aller."; ! You'll have to say which compass direction to go in
                ! TODO le reste
		8:	print (The) actor, " goes up";
		9:	print (The) actor, " goes down";
		10:	print (The) actor, " goes ", (name) x1;
		11:	print (The) actor, " arrives from above";
		12:	print (The) actor, " arrives from below";
		13:	print (The) actor, " arrives from the ", (name) x1;
		14:	print (The) actor, " arrives";
		15:	print (The) actor, " arrives at ", (the) x1, " from above";
		16:	print (The) actor, " arrives at ", (the) x1, " from below";
		17:	print (The) actor, " arrives at ", (the) x1, " from the ", (name) x2;
		18:	print (The) actor, " goes through ", (the) x1;
		19:	print (The) actor, " arrives from ", (the) x1;
		20:	print "on ", (the) x1;
		21:	print "in ", (the) x1;
		22:	print ", pushing ", (the) x1, " in front, and you along too";
		23:	print ", pushing ", (the) x1, " in front";
		24:	print ", pushing ", (the) x1, " away";
		25:	print ", pushing ", (the) x1, " in";
		26:	print ", taking you along";
		27: print "(first getting off ", (the) x1, ")^"; say__p = 0; return;
                28: print "(ouvrant tout d'abord ", (the) x1, ")^"; say__p = 0; return;
    }
  Insert: switch (n) {
               1: "Il me faut tenir ", (the) x1,
                  " avant de pouvoir ", (itorthem) x1,
                  " mettre dans autre chose.";
               2: if (x1 has pluralname) 
                    print_ret (The) x1, " ne peuvent hélas pas contenir d'objet.";
                  else  
                    print_ret (The) x1, " ne peut hélas pas contenir d'objet.";
               3: print_ret (The) x1, " ", (isorare) x1, " fermé",(es) x1,".";
               4: "J'ai besoin de ", (itorthem) x1, " prendre d'abord.";
               5: "Je ne peux pas mettre ceci à l'intérieur de lui-même.";
               6: "(", (itorthem) x1, " prenant d'abord)^";
               7: "Il n'y a plus de place dans ", (the) x1, ".";
               8: "Voilà qui est fait.";
               9: "Je place ", (the) x1, " dans ", (the) second, ".";
    }
  Inv: switch (n) {
               !1: "Je n'ai rien sur moi, sauf quelques sonnantes et trébuchantes.";
 		1: "Je n'ai rien sur moi de particulier.";
               2: print "J'ai ";
        3:  print ":^";
        4:  print ".^";
    }
  Jump:           "Je sautille pour éprouver la teneur du sol, sans rien pouvoir en conclure. ";
!   JumpOver:  "Cette idée incongrue me désespère. ";
  Tie:  "Cette idée incongrue me désespère. ";
  Kiss:           "Je dois plutôt me concentrer sur le jeu.";
  Listen:         "Je n'entends rien de particulier. ";
  ListMiscellany: switch (n) {
               1: print " (allumé",(es) x1,")";
               2: print " (qui ", (isorare) x1, " fermé",(es) x1,")";
               3: print " (fermé",(es) x1," et allumé",(es) x1,")";
               4: print " (qui ", (isorare) x1, " vide",(s) x1,")";
               5: print " (vide",(s) x1," et allumé",(es) x1,")";
               6: print " (qui ", (isorare) x1, " fermé",(es) x1," et vide",(s) x1,")";
               7: print " (fermé",(es) x1,", vide",(s) x1," et allumé",(es) x1,")";
               8: print " (allumé",(es) x1," et porté",(es) x1;
               9: print " (allumé",(es) x1;
              10: print " (porté",(es) x1;
              11: print " (qui ", (isorare) x1, " ";
              12: print "ouvert",(es) x1;
              13: print "ouvert",(es) x1," mais vide",(s) x1;
              14: print "fermé",(es) x1;
              15: print "fermé",(es) x1," et verrouillé",(es) x1;
              16: print " et vide",(s) x1;
              17: print " (qui ", (isorare) x1, " vide",(s) x1,")";
              18: print " contenant ";
              19: print " (supportant "; ! " (sur ";
              20: print " supportant ";  ! " sur ";
              21: print " (contenant ";  ! " (dans ";
              22: print " contenant ";   ! " dans ";
    }
  LMode1:         " est passé en mode description normale ; seuls les lieux
                   visités pour la première fois sont décrits en détail.";
  LMode2:         " est passé en mode description longue ; tous les lieux,
                   même déjà visités, sont décrits en détail.";
  LMode3:         " est passé en mode description courte ; tous les lieux,
                   même non visités, sont décrits brièvement.";
  Lock: switch (n) {
               1: "Je ne peux pas verrouiller cela.";
               2: print_ret (ctheyreorthats) x1, " verrouillé en ce moment.";
               3: "Je doit fermer ", (the) x1, " d'abord.";
               4: "Cela ne rentre pas dans la serrure.";
               5: "Je verrouille ", (the) x1, ".";
    }
  Look: switch (n) {
               1: print " (sur ", (the) x1, ")";
               2: print " (dans ", (the) x1, ")";
               3: print " (comme ", (object) x1, ")";
               4: print "^Sur ", (the) x1, ", ";
                  WriteListFrom(child(x1),
                      ENGLISH_BIT + RECURSE_BIT + PARTINV_BIT
                      + TERSE_BIT + CONCEAL_BIT);
                  ".";
        5,6:
            if (x1 ~= location) {
                if (x1 has supporter) print "^Sur "; else print "^Dans ";
                print (the) x1, " je";
            }
            else print "^Je";
            print " peux voir ";
            if (n == 5) print "aussi ";
            WriteListFrom(child(x1),
              ENGLISH_BIT+RECURSE_BIT+PARTINV_BIT+TERSE_BIT+CONCEAL_BIT+WORKFLAG_BIT);
            ".";
        7:  "En dépit de mes efforts, je ne vois rien de particulier dans cette direction."; ! normalement obsolète
    }
  LookUnder: switch (n) {
               1: "Impossible, le noir absolu empêchant toute tentative en ce sens. ";
               2: "Mes recherches sont vaines.";
    }
  Mild:           "Assez.";
  Miscellany: switch (n) {
               1: "(affichage des seize premiers)^";
               2: "";
               3: print " C'est la fin. ";
               4: print " J'ai gagné ";
               5: print "^Souhaitais-je RECOMMENCER, CHARGER une partie";
                  #IFDEF DEATH_MENTION_UNDO;
                  print ", ANNULER ma dernière action ?";
                  #ENDIF;
                  if (TASKS_PROVIDED==0)
                      print ", obtenir le score détaillé pour cette partie (FULLSCORE)";
                  if (deadflag==2 && AMUSING_PROVIDED==0)
                      print ", lire quelques suggestions amusantes (AMUSING)";
                  " ou QUITTER ?^"; !*!
               6: "[Votre interpréteur ne permet pas d' ~annuler~. Désolé !]";
            #Ifdef TARGET_ZCODE;
               7: "~Annuler~ a échoué.  [Tous les interpréteurs ne le permettent pas.]";
            #Ifnot; ! TARGET_GLULX
               7:  "[Vous ne pouvez pas ~Annuler~ plus loin.]";
            #Endif; ! TARGET_
               8: "^Faites un choix parmi les propositions ci-dessus.^";
               9: "^A présent, l'obscurité est totale. ";
              10: "Mes pensées sont confuses. ";
              11: "[Impossible d'annuler alors que rien n'a encore été fait !]";
              12: "[Impossible d'annuler deux fois de suite. Désolé !]";
              13: "[Action précédente annulée.]";
              14: "Désolé, impossible de corriger.";
              15: "Impossible à envisager."; !*! "Think nothing of it."; !*!
              16: "~Oops~ ne peut corriger qu'un seul mot.";
              17: "L'obscurité est totale. ";
              18: print "moi-même";
              19: "Aussi beau que d'habitude.";
              20: "Pour répéter une commande comme ~grenouille, saute~, dîtes seulement
                   ~encore~, et pas ~grenouille, encore~.";
              21: "Impossible.";
              22: "Vous ne pouvez pas commencer par une virgule.";
              23: "Mes pensées sont confuses. ";
              24: "Je ne peux pas discuter avec ", (the) x1, ".";
                  ! "parler à" serait mieux mais délicat (ex: à l'oiseau)
              25: "Pour parler à quelqu'un, essayez ~quelqu'un, bonjour~ ou quelque chose dans le genre.";
             ! 26: "(je tente d'abord de prendre ", (the) not_holding, ")";
 		26: "(je tente d'abord de prendre cela.)";
              27: "Pardon ?";
              28: print "Merci de reformuler. Je n'ai compris que : ";
              29: "Je n'ai pas compris ce nombre.";
              30: "Je ne vois rien de tel, ou bien c'est sans grande importance.";
              31: "Il semble en avoir dit trop peu.";
              32: "Je ne l'ai pas en main. ";
              33: "Je ne peux pas employer le mot ~tout~ avec ce verbe.";
              34: "Je ne peux utiliser le mot ~tout~ qu'une fois par ligne."; !*!
              35: "Je ne suis pas certain de ce à quoi ~", (address) pronoun_word,
                  "~ se référait.";
              36: "Vous avez exclu quelque chose qui n'était de toute façon pas compris dans la liste !";
              37: "Je ne peux agir ainsi qu'avec une chose douée de conscience...";
              38: "Je ne connais pas ce verbe.";
              39: "Cela n'a pas la moindre importance.";
              40: "Je ne peux voir ~", (address) pronoun_word,
                  "~ (", (the) pronoun_obj, ") pour l'instant.";
              41: "Impossible de comprendre la fin de la phrase.";
              42: if (x1==0) print "Aucun de disponible.";
                  else print "Il en reste seulement ", (number) x1, ".";
              43: "Impossible. ";
              44: "Rien n'est disponible.";
              45: print "Précisez : "; !*!
              46: print "Précisez : "; !*!
              47: "Désolé, vous pouvez seulement utiliser un objet à la fois dans ce contexte. Lequel voulez-vous exactement ?";

              
              48: print "Pouvez-vous préciser qui est concerné par cette action ?^"; !*!
              49: print "Pouvez-vous préciser le nom de l'objet concerné par cette action ?^"; !*! remplacement de "à utiliser ?"
              50: print "Mon score vient ";
                  if (x1 > 0) print "d'augmenter"; else { x1 = -x1; print "de diminuer"; }
                  print " de ", (number) x1, " point";
                  if (x1 > 1) print "s";
              51: "(Comme quelque chose de dramatique vient de se produire,
                   la liste de commandes a été raccourcie.)";
              52: "^Tapez un nombre entre 1 et ", x1,
                  ", 0 pour réafficher ou appuyez sur ENTREE.^";
              53: "^[Appuyez sur ESPACE.]"; !*! SVP
        54: "[Commentaire enregistré.]";
        55: "[Commentaire NON enregistré.]";
        56: print ".^";
        57: print "?^";
        ! TODO le reste
        58: print (The) actor, " ", (IsOrAre) actor, " incapable de faire cela.^";
		59:	"Vous devez indiquer un nom après ce verbe.";
		60:	"Vous ne devez pas indiquer un nom avec ce verbe.";
		61:	"Vous devez indiquer un objet."; ! You must name an object
		62:	"Vous ne devez pas indiquer d'objet."; ! You may not name an object
		63:	"Vous devez indiquer un second objet."; ! You must name a second object
		64:	"Vous ne devez pas indiquer de second objet."; ! You may not name a second object
		65:	"Vous devez indiquer un second nom avec ce verbe.";
		66:	"Vous ne devez pas indiquer un second nom."; ! You may not supply a second noun
		67:	"Vous devez indiquer un nom plus précis."; !You must name something more substantial
		68:	print "(", (The) actor, " prenant d'abord ", (the) x1, ")^";
        69: "(prenant d'abord ", (the) x1, ")";
        70: "L'utilisation de UNDO n'est pas autorisée dans ce jeu.";
        71: print (string) DARKNESS__TX;
  		72: print (The) x1;
            if (x1 has pluralname) print " ont"; else print " a";
            " mieux à faire.";
        73: "Ce nom n'a pas de sens dans ce contexte."; ! That noun did not make sense in this context.
        74: print "[Cette commande demande de faire quelque chose en dehors du jeu, aussi elle n'a de sens que de vous à moi. Il ne peut être demandé de faire cela à ce ou ces personnes : ", (The) x1, "^"; ! print "[That command asks to do something outside of play, so it can only make sense from you to me. ", (The) x1, " cannot be asked to do this.]^";
        75:  print " Fin ";
    }
  Yes, No:        "Mmmh ?";
  NotifyOff:      "Notification du score désactivée.";
  NotifyOn:       "Notification du score activée.";
!   Objects: switch(n)
!            {   1: "Objets ayant été portés :^";
!                2: "Aucun.";
!                3: print "   (sur le corps)";
!                4: print "   (dans l'inventaire)";
!                5: print "   (abandonné",(es) x1,")";
!                6: print "   (", (name) x1, ")";
!                7: print "   (dans ", (the) x1, ")";
!                8: print "   (dans ", (the) x1, ")";
!                9: print "   (sur ", (the) x1, ")";
!               10: print "   (perdu",(es) x1,")";
!            }
  Open: switch (n) {
               1: "Je ne peux ouvrir cela.";
		2: if (x1 has pluralname) 
			{print (cthatorthose) x1," semblent être fermé",(es) x1," à clé.^";} 
			else 
			{print (cthatorthose) x1," semble être fermé",(es) x1," à clé.^";};
!               2: print_ret (cthatorthose) x1," semble",(nt) x1,
!                  " être fermé",(es) x1," à clé.";
               3: print (ctheyreorthats) x1, " déjà ouvert";
                  if (x1 has female) "e.";
                  ".";
               4: print "J'ouvre ", (the) x1, ", révélant ";
                  if (WriteListFrom(child(x1),
                      ENGLISH_BIT + TERSE_BIT + CONCEAL_BIT)==0) "rien du tout.";
                  ".";
               5: "J'ouvre ", (the) x1, ".";
    }
!   Order:          print (The) x1;
!                   if (x1 has pluralname) print " ont"; else print " a";
!                   " mieux à faire.";
!     ParlerIncorrect : "Soyez plus précis dans votre communication, ou reformulez.";
!     ParlerSansPrecision :   if (noun==player) "Je ne sais pas quoi me dire que je ne sache déjà.";
!                             else "Pas de réponse.";
!   Places: switch (n) {
!         1:  print "J'avais visité : ";
!         2:  print ".^";
!     }
!   Pray:           "Rien de concret ne résulte de ma prière.";
!   Prompt:   print "^>";
  Pronouns: switch (n) {
               1: print "En ce moment, ";
               2: print "signifie ";
               3: print "n'est pas défini";
               4: "aucun pronom n'est connu du jeu.";
        5:  ".";
    }
  Pull,Push,Turn: switch (n) {
               1: "C'est fixé sur place.";
               2: "J'en suis incapable.";
               3: "Rien d'évident ne se produit.";
               4: "Cela a été moins que courtois.";
    }
! Push: see Pull
  PushDir: switch (n) {
               1: "Cette idée fantasque disparait rapidement. ";
               2: "Ce n'est pas une direction.";
               3: "Je ne peux pas aller dans cette direction.";
    }
  PutOn: switch (n) {
               1: "Je dois avoir en main ", (the) x1,
                  " avant de pouvoir ", (itorthem) x1,
                  " mettre sur quelque chose d'autre.";
               2: "Je ne peux pas poser un objet sur lui-même.";
               3: "Poser des objets sur ", (the) x1, " ne mène à rien.";
               4: "Je manque de dextérité.";
               5: "(", (itorthem) x1, " prenant d'abord)^";
               6: "Il n'y a plus assez de place sur ", (the) x1, ".";
               7: "Ce que je fais.";
               8: "Je plaçce ", (the) x1, " sur ", (the) second, ".";
    }
  Quit: switch (n) {
               1: print "Répondez par oui ou par non, je vous prie.";
               2: print "Est-ce vraiment la fin ? (O/N) ";
    }
  Remove: switch (n) {
               1: if (x1 has pluralname)
		      print "Ils sont malheureusement fermés."; !*! elle(s)
		      else print "Il est malheureusement fermé."; !*!
               2: if (x1 has pluralname)
                      print "Mais ils ne sont pas";
                  else print "Mais ce n'est pas";
                  " ici maintenant.";
               3: "Très bien.";
    }
  Restart: switch (n) {
               1: print "Suis-je certain de vouloir recommencer ? ";
               2: "Raté.";
    }
  Restore: switch (n) {
               1: "Échec du chargement.";
               2: "^--- La partie a bien été restaurée ---^";
    }
  Rub:            "Je n'arrive à rien ainsi.";
  Save: switch (n) {
               1: "La sauvegarde a échoué.";
               2: "^--- La partie a bien été sauvegardée ---^";
    }
  Score: switch (n) {
        1: if (deadflag) print "Dans cette partie j'ai obtenu "; else print "J'ai jusqu'à présent obtenu ";
            print score, " sur un score possible de ", MAX_SCORE, ", en ", turns, " tour";
            if (turns ~= 1) print "s";
            return;
        2:  "Il n'y a pas de score dans cette histoire.";
    }
  ScriptOff: switch (n) {
               1: "Aucune transcription en cours.";
               2: "^Fin de transcription.";
               3: "Impossible de terminer la transcription.";
    }
  ScriptOn: switch (n) {
               1: "Transcription déjà en cours.";
               2: "Début d'une transcription de...";
               3: "Impossible de commencer la transcription.";
    }
  Search: switch (n) {
               1: "L'obscurité m'en empêche. ";
               2: "Il n'y a rien sur ", (the) x1, ".";
               3: print "Sur ", (the) x1, ", je vois ";
                  WriteListFrom(child(x1),
                      TERSE_BIT + ENGLISH_BIT + CONCEAL_BIT);
                  ".";
               4: if (x1 has animate) "Je sais tenir ses mains tranquilles !";
                  else "Je ne trouve rien d'intéressant.";
               5: "Je ne peux pas voir à l'intérieur, puisque ", (the) x1, " ",
                  (isorare) x1, " fermé",(es) x1,".";
               6: print_ret (The) x1, " ", (isorare) x1, " vide",(s) x1,".";
               7: print (The) x1;
                  if (x1 has pluralname) print " contiennent ";
                  else print " contient ";
                  WriteListFrom(child(x1),
                      TERSE_BIT + ENGLISH_BIT + CONCEAL_BIT);
                  ".";
    }
!   Set:            "Non, je ne peux pas ", (itorthem) x1, " régler.";
  SetTo:          "Non, je ne peux pas ", (itorthem) x1, " régler sur rien.";
  Show: switch (n) {
               1: "Je ne peux pas ", (the) x1, ".";
               2: print_ret (The) x1, " ", (isorare) x1, " peu impressionné",(es) x1,".";
    }
  Sing:           "J'aurais aimé, mais le coeur n'y est pas.";
  Sleep:          "Je n'ai pas particulièrement sommeil.";
  Smell:          "Aucune odeur particulière n'alerte ma conscience.";
  Sorry:          "Faute avouée est à moitié pardonnée.";
  Squeeze: switch (n) {
               1: "Inutile.";
               2: "Je ne suis arrivé à rien ainsi.";
    }
  Strong:         "Les vrais aventuriers n'emploient pas un tel langage.";
!     Swim:           "Il n'y a pas assez d'eau pour nager dedans.";
    Swing:          "Ce n'est pas une chose à laquelle il est utile de se balancer.";
  SwitchOff: switch (n) {
               1: "Je ne peux ni allumer, ni éteindre cela.";
               2: print_ret (ctheyreorthats) x1,
                  " déjà éteint",(es) x1,".";
               3: "J'éteins ", (the) x1, ".";
    }
  SwitchOn: switch (n) {
               1: "Je ne peux pas allumer cela.";
               2: print_ret (ctheyreorthats) x1,
                  " déjà allumé",(es) x1,".";
               3: "J'allume ", (the) x1, ".";
    }
	  Take:    switch(n)
           {   1: "Voilà qui est fait.";
               2: "Hélas, voilà une problématique relevant de la physique quantique.";
               3: "Cela ne semble pas être une bonne idée.";
               4: print "Je dois d'abord ";
                  if (x1 has supporter) print "descendre "; else print "sortir ";
                  print_ret (dedudes) x1, ".";
               5: "Je l'ai déjà.";
               6: if (noun has pluralname) print "Cela semble ";
                  else print "Cela semble ";
                  "appartenir ", (to_the) x1, ".";
               7: if (noun has pluralname) print "Cela semble ";
                  else print "Cela semble ";
                  "faire partie ", (dedudes) x1, ".";
               8: print_ret (Cthatorthose) x1, " ", (isorarenot) x1,
                  " disponible", (s) x1, ".";
               9: print_ret (The) x1, " ", (isorarenot) x1, " ouvert",(es) x1,".";
              10: "Ceci est trop difficile à transporter.";
              11: "C'est fixé sur place.";
              12: "Je transporte déjà trop d'objets.";
              13: "(je mets ", (the) x1, " dans ", (the) SACK_OBJECT,
                  " pour faire de la place)";
           }
    Taste:          "Je ne remarque rien de particulier.";
    Tell: switch (n) {
        1:  "Je discute avec moi-même pendant un bon moment...";
        2:  "Pas de réaction.";
    }
    Think:          "Quelle bonne idée.";
  ThrowAt: switch (n) {
               1: "Futile.";
               2: "J'hésite au moment crucial.";
    }
! Tie:  see JumpOver.
  Touch: switch (n) {
               1: "Je sais tenir mes mains tranquilles. ";
               2: "Je ne sens rien de particulier.";
               3: "Je n'y vois aucune utilité.";
    }
! Turn: see Pull.
  Unlock:  switch (n) {
               1: "Je ne peux pas déverrouiller cela.";
               2: print_ret (ctheyreorthats) x1,
                  " déjà déverrouillé", (es) x1, ".";
               3: "Cela ne rentre pas dans la serrure.";
               4: "Je déverrouille ", (the) x1, ".";
    }
!   VagueDo: "Il me faut être plus précis."; 
!   VagueGo:  "Il me faut peut-être préciser une direction. ";
  Verify: switch (n) {
               1: "Le fichier semble intact.";
               2: "Le fichier est certainement corrompu !";
    }
  Wait:           "Le temps passe...";
  Wake:           "Il ne s'agit pas d'un rêve.";
  WakeOther:      "Cela ne semble pas nécessaire.";
  Wave: switch (n) {
        1: "Mais je n'ai pas cela !";
        2: "J'ai l'air ridicule en agitant ", (the) x1, ".";
    }
    WaveHands:
        if (x1 == 0 || x1 == player) "J'agite mes mains devant moi.";
        else "Je salue ", (the) x1, ".";
  Wear: switch (n) {
               1: "Je ne peux pas mettre cela sur moi comme un vêtement !";
               2: "Je n'ai pas cela. ";
               3: "Je ", (itorthem) x1, " porte déjà.";
               4: "Je mets ", (the) x1, ".";
    }
! Yes:  see No.
];

#Endif; ! Fin test French1PSPr

![ ========================================================= ]

#Ifdef French1PSPa; ! Pour la 1ère personne du singulier passé

[ LanguageLM n x1 x2;
 say__p = 1; ! responsable pour les sauts de lignes avant prompt !! (line break / paragraphe break)
  ! Answer, Ask:    "Mes tentatives ne lui arrachaient aucune parole. ";  
Answer, Ask:    "Pas de réponse.";
! Ask:      see Answer
  Attack:         "La violence n'était pas forcément une solution.";
! Attack:         "Je n'avais nulle envie de me battre en cet instant. ";
! Blow:           "J'oubliai rapidement cette idée insolite.";
  !Burn:           "Brûler ceci ? Cette idée me semblait de plus en plus improbable à mesure que j'y réfléchissais. ";
Burn:           "Je n'avais pas d'intérêt à brûler ceci.";
  Buy:            "Rien à vendre, ni à acheter par ici. ";
  Climb:          "Je n'avais nulle possibilité d'escalader ceci. ";
  Close: switch (n) {
               1: "Fermer cela me semblait impossible. ";
               2: print (ctheyreorthats) x1, " déjà fermé";
                  if (x1 has female) "e.";
                  ".";
               3: "Je fermai ", (the) x1, ".";
    }
!   CommandsOff: switch (n) {
!         1: "[Enregistrement des commandes désactivé.]";
!         #Ifdef TARGET_GLULX;
!         2: "[Enregistrement des commandes déjà désactivé.]";
!         #Endif; ! TARGET_
!     }
!   CommandsOn: switch (n) {
!         1: "[Enregistrement des commandes activé.]";
!         #Ifdef TARGET_GLULX;
!         2: "[Les commandes sont actuellement en train d'être rejouées.]";
!         3: "[Enregistrement des commandes déjà activé.]";
!         4: "[Echec d'enregistrement des commandes.]";
!         #Endif; ! TARGET_
!     }
!   CommandsRead: switch (n) {
!         1: "[Rejouer les commandes.]";
!         #Ifdef TARGET_GLULX;
!         2: "[Les commandes sont déjà en train d'être rejouées.]";
!         3: "[Rejouer les commandes a échoué.  L'enregistrement des commandes est activé.]";
!         4: "[Rejouer les commandes a échoué.]";
!         5: "[Rejouer les commandes achevé.]";
!         #Endif; ! TARGET_
!     }
  Consult:        "Je ne trouvai rien qui attirât mon attention dans ", (the) x1, ".";
!   CrierSansPrecision : "Je criai ce qui me passait par la tête.";
  Cut:            "Je ne voyais nul intérêt de couper cela.";
!   Dig:            "Creuser... Cette idée ne me séduisait pas.";
  Disrobe: switch (n) {
               1: "Je ne ", (itorthem) x1, " portais pas.";
               2: "J'enlevai ", (the) x1, ".";
    }
  Drink:          "J'aurais bien bu, mais nulle boisson ne s'offrait à moi.";
  Drop: switch (n) {
               1: if (x1 has pluralname) print (The) x1, " étaient ";
                  else print (The) x1, " était ";
                  "déjà ici.";
               2: "Je n'avais pas cela.";
               3: "(Je pris ", (the) x1, ")";
               4: "Voilà qui était fait.";
    }
  Eat: switch (n) {
              1: print_ret (ctheyreorthats) x1,
                  " non comestible, selon toute évidence.";
               2: "Je mangeai ", (the) x1, " sans envie ni appétit.";
    }
!   EmptyT: switch (n) {
!                1: print_ret (The) x1, " ne pouvait rien contenir.";
!                2: print_ret (The) x1, " ", (isorare) x1, " fermé",(es) x1,".";
!                3: print_ret (The) x1, " ", (isorare) x1, " déjà vide",(s) x1,".";
!                4: "Ceci n'aurait rien vidé.";
!     }
  Enter: switch (n) {
               1: print "Impossible, j'étais déjà ";
                  if (x1 has supporter) print "sur "; else print "dans ";
                  print_ret (the) x1, ".";
        2:  print "Je ne pouvais pas ";
            switch (verb_word) {
                'entrer':    "y entrer.";
                'asseoir':    "m'y asseoir.";
                'allonger':    "m'y allonger.";
                'coucher':    "m'y coucher.";
                default:  "y aller."; ! plutôt que "y entrer." !*!
            }
               3: "Je ne pouvais pas entrer dans ", (the) x1, " fermé",(es) x1,".";
               4: print "Je ne pouvais pas ";
                  if (x1 has supporter) print "monter sur";
                                   else print "entrer dans";
                  " ceci.";
                               ! sur pieds, non encastré (freestanding)
               5: print "Je ";
                  if (x1 has supporter) print "montai sur "; else print "pénétrai dans ";
                  print_ret (the) x1, ".";
               6: print "(";
                  if (x1 has supporter) print "descendant "; else print "sortant ";
                  print (the) x1; ")";
               7: if (x1 has supporter) "(montant sur ", (the) x1, ")^";
                  if (x1 has container) "(entrant dans ", (the) x1, ")^";
                  "(entrant dans ", (the) x1, ")^";
    }
  Examine: switch (n) {
               1: "L'obscurité m'enveloppait de son linceul impénétrable.";
               2: "Rien de particulier concernant ", (the) x1, ".";
               3: print (The) x1, " ", (isorare) x1, " alors ";
                  if (x1 has on) "allumé",(es) x1,"."; else "éteint",(es) x1,".";
               4:	print (The) actor, " looks closely at ", (the) x1, ".^";  
               5:  "En dépit de mes efforts, je ne voyais rien de particulier dans cette direction.";
    }
  Exit: switch (n) {
              1: "Nulle sortie n'existait. ";
               2: print "Je ne pouvais pas sortir ";
                  print_ret (dedudes) x1, " fermé", (es) x1, ".";
               3: print "Je ";
                  if (x1 has supporter) print "descendis "; else print "sortis ";
                  print_ret (dedudes) x1, ".";
        4:  print "Je n'étais pas ";
            if (x1 has supporter) print "sur "; else print "dans ";
            print_ret (the) x1, ".";
    }
!   Fill:           "Aucun liquide ne pouvait répondre à mon idée."; !??? TODO ?
!   FullScore: switch(n) {
!                1: if (deadflag) print "Le score était ";
!                   else          print "Le score est ";
!                   "composé comme suit :^";
!                2: "trouver divers objets";
!                3: "visiter différents endroits";
!                4: print "total (sur ", MAX_SCORE; ")";
!            }
  GetOff:         "Je n'étais pas sur ", (the) x1, " à ce moment.";
  Give: switch (n) {
               1: "Je ne tenais pas ", (the) x1, ".";
               2: "Je soupesai ", (the) x1,
                  " pendant un moment, perdu dans mes pensées.";
               3: print (The) x1;
                  if (x1 has pluralname)
	             print " n'avaient pas l'air intéressé";
                  else print " n'avait pas l'air intéressé";
                  ".";
    }
  Go: switch (n) {
               1: print "Je devais d'abord ";
                  if (x1 has supporter) print "descendre "; else print "sortir ";
                  print_ret (dedudes) x1, ".";
               2: "Je ne pouvais aller dans cette direction. ";
               3: "J'étais dans l'impossibilité de gravir ", (the) x1, ".";
               4: "Je ne pouvais descendre par ", (the) x1, ".";
               5: "Je ne pouvais, puisque ", (the) x1, " ", (isorare) x1,
                  " sur mon chemin.";
               6: print "Je ne pouvais, puisque ", (the) x1;
                  if (x1 has pluralname) " ne menaient nulle part.";
                  " ne menait nulle part.";
                  		7:	"You'll have to say which compass direction to go in.";
		8:	print (The) actor, " goes up";
		9:	print (The) actor, " goes down";
		10:	print (The) actor, " goes ", (name) x1;
		11:	print (The) actor, " arrives from above";
		12:	print (The) actor, " arrives from below";
		13:	print (The) actor, " arrives from the ", (name) x1;
		14:	print (The) actor, " arrives";
		15:	print (The) actor, " arrives at ", (the) x1, " from above";
		16:	print (The) actor, " arrives at ", (the) x1, " from below";
		17:	print (The) actor, " arrives at ", (the) x1, " from the ", (name) x2;
		18:	print (The) actor, " goes through ", (the) x1;
		19:	print (The) actor, " arrives from ", (the) x1;
		20:	print "on ", (the) x1;
		21:	print "in ", (the) x1;
		22:	print ", pushing ", (the) x1, " in front, and you along too";
		23:	print ", pushing ", (the) x1, " in front";
		24:	print ", pushing ", (the) x1, " away";
		25:	print ", pushing ", (the) x1, " in";
		26:	print ", taking you along";
    }
  Insert: switch (n) {
               1: "Il me fallait tenir ", (the) x1,
                  " avant de pouvoir ", (itorthem) x1,
                  " mettre dans autre chose.";
               2: if (x1 has pluralname) 
                    print_ret (The) x1, " ne pouvaient hélas pas contenir d'objet.";
                  else  
                    print_ret (The) x1, " ne pouvait hélas pas contenir d'objet.";
               3: print_ret (The) x1, " ", (isorare) x1, " fermé",(es) x1,".";
               4: "J'avais besoin de ", (itorthem) x1, " prendre d'abord.";
               5: "Je ne pouvais pas mettre ceci à l'intérieur de lui-même.";
               6: "(", (itorthem) x1, " prenant d'abord)^";
               7: "Il n'y avait plus de place dans ", (the) x1, ".";
               8: "Voilà qui était fait.";
               9: "Je plaçai ", (the) x1, " dans ", (the) second, ".";
    }
  Inv: switch (n) {
               !1: "Je n'avais rien sur moi, sauf quelques sonnantes et trébuchantes.";
 		1: "Je n'avais rien sur moi de particulier.";
               2: print "J'avais ";
        3:  print ":^";
        4:  print ".^";
    }
  Jump:           "Je sautillai pour éprouver la teneur du sol, sans rien pouvoir en conclure. ";
!   JumpOver:  "Cette idée incongrue me désespéra. ";
Tie:  "Cette idée incongrue me désespéra. ";
  Kiss:           "Je devais plutôt me concentrer sur le jeu.";
  Listen:         "Je n'entendis rien de particulier. ";
  ListMiscellany: switch (n) {
               1: print " (allumé",(es) x1,")";
               2: print " (qui ", (isorare) x1, " fermé",(es) x1,")";
               3: print " (fermé",(es) x1," et allumé",(es) x1,")";
               4: print " (qui ", (isorare) x1, " vide",(s) x1,")";
               5: print " (vide",(s) x1," et allumé",(es) x1,")";
               6: print " (qui ", (isorare) x1, " fermé",(es) x1," et vide",(s) x1,")";
               7: print " (fermé",(es) x1,", vide",(s) x1," et allumé",(es) x1,")";
               8: print " (allumé",(es) x1," et porté",(es) x1;
               9: print " (allumé",(es) x1;
              10: print " (porté",(es) x1;
              11: print " (qui ", (isorare) x1, " ";
              12: print "ouvert",(es) x1;
              13: print "ouvert",(es) x1," mais vide",(s) x1;
              14: print "fermé",(es) x1;
              15: print "fermé",(es) x1," et verrouillé",(es) x1;
              16: print " et vide",(s) x1;
              17: print " (qui ", (isorare) x1, " vide",(s) x1,")";
              18: print " contenant ";
              19: print " (supportant "; ! " (sur ";
              20: print " supportant ";  ! " sur ";
              21: print " (contenant ";  ! " (dans ";
              22: print " contenant ";   ! " dans ";
    }
  LMode1:         " est passé en mode description normale ; seuls les lieux
                   visités pour la première fois sont décrits en détail.";
  LMode2:         " est passé en mode description longue ; tous les lieux,
                   même déjà visités, sont décrits en détail.";
  LMode3:         " est passé en mode description courte ; tous les lieux,
                   même non visités, sont décrits brièvement.";
  Lock: switch (n) {
               1: "Je ne pouvais verrouiller cela.";
               2: print_ret (ctheyreorthats) x1, " verrouillé à ce moment.";
               3: "Je devais fermer ", (the) x1, " d'abord.";
               4: "Cela ne rentrait pas dans la serrure.";
               5: "Je verrouillai ", (the) x1, ".";
    }
  Look: switch (n) {
               1: print " (sur ", (the) x1, ")";
               2: print " (dans ", (the) x1, ")";
               3: print " (comme ", (object) x1, ")";
               4: print "^Sur ", (the) x1, ", ";
                  WriteListFrom(child(x1),
                      ENGLISH_BIT + RECURSE_BIT + PARTINV_BIT
                      + TERSE_BIT + CONCEAL_BIT);
                  ".";
        5,6:
            if (x1 ~= location) {
                if (x1 has supporter) print "^Sur "; else print "^Dans ";
                print (the) x1, " je";
            }
            else print "^Je";
            print " pouvais voir ";
            if (n == 5) print "aussi ";
            WriteListFrom(child(x1),
              ENGLISH_BIT+RECURSE_BIT+PARTINV_BIT+TERSE_BIT+CONCEAL_BIT+WORKFLAG_BIT);
            ".";
        7:  "En dépit de mes efforts, je ne voyais rien de particulier dans cette direction.";
    }
  LookUnder: switch (n) {
               1: "Impossible, le noir absolu empêchant toute tentative en ce sens. ";
               2: "Mes recherches furent vaines.";
    }
  Mild:           "Assez.";
  Miscellany: switch (n) {
               1: "(affichage des seize premiers)^";
               2: "";
               3: print " C'était la fin. ";
               4: print " J'avais gagné ";
               5: print "^Souhaitais-je RECOMMENCER, CHARGER une partie";
                  #IFDEF DEATH_MENTION_UNDO;
                  print ", ANNULER ma dernière action ?";
                  #ENDIF;
                  if (TASKS_PROVIDED==0)
                      print ", obtenir le score détaillé pour cette partie (FULLSCORE)";
                  if (deadflag==2 && AMUSING_PROVIDED==0)
                      print ", lire quelques suggestions amusantes (AMUSING)";
                  " ou QUITTER ?^"; !*!
               6: "[Votre interpréteur ne permet pas d' ~annuler~. Désolé !]";
            #Ifdef TARGET_ZCODE;
               7: "~Annuler~ a échoué.  [Tous les interpréteurs ne le permettent pas.]";
            #Ifnot; ! TARGET_GLULX
               7:  "[Vous ne pouvez pas ~Annuler~ plus loin.]";
            #Endif; ! TARGET_
               8: "^Faites un choix parmi les propositions ci-dessus.^";
               9: "^A présent, l'obscurité était totale. ";
              10: "Mes pensées étaient confuses. ";
              11: "[Impossible d'annuler alors que rien n'a encore été fait !]";
              12: "[Impossible d'annuler deux fois de suite. Désolé !]";
              13: "[Action précédente annulée.]";
              14: "Désolé, impossible de corriger.";
              15: "Impossible à envisager."; !*! "Think nothing of it."; !*!
              16: "~Oops~ ne peut corriger qu'un seul mot.";
              17: "L'obscurité était totale. ";
              18: print "moi-même";
              19: "Aussi beau que d'habitude.";
              20: "Pour répéter une commande comme ~grenouille, saute~, dîtes seulement
                   ~encore~, et pas ~grenouille, encore~.";
              21: "Impossible.";
              22: "Vous ne pouvez pas commencer par une virgule.";
              23: "Mes pensées étaient confuses. ";
              24: "Je ne pouvais pas discuter avec ", (the) x1, ".";
                  ! "parler à" serait mieux mais délicat (ex: à l'oiseau)
              25: "Pour parler à quelqu'un, essayez ~quelqu'un, bonjour~ ou quelque chose dans le genre.";
             ! 26: "(je tentai d'abord de prendre ", (the) not_holding, ")";
 		26: "(je tentai d'abord de prendre cela.)";
              27: "Pardon ?";
              28: print "Merci de reformuler. Je n'ai compris que : ";
              29: "Je n'ai pas compris ce nombre.";
              30: "Je ne voyais rien de tel, ou bien c'était sans grande importance.";
              31: "Il semblait en avoir dit trop peu.";
              32: "Je ne l'avais pas en main. ";
              33: "Je ne peux pas employer le mot ~tout~ avec ce verbe.";
              34: "Je ne peux utiliser le mot ~tout~ qu'une fois par ligne."; !*!
              35: "Je ne suis pas certain de ce à quoi ~", (address) pronoun_word,
                  "~ se référait.";
              36: "Vous avez exclu quelque chose qui n'était de toute façon pas compris dans la liste !";
              37: "Je ne pouvais agir ainsi qu'avec une chose douée de conscience...";
              38: "Je ne connais pas ce verbe.";
              39: "Cela n'avait pas la moindre importance.";
              40: "Je ne pouvais voir ~", (address) pronoun_word,
                  "~ (", (the) pronoun_obj, ") pour l'instant.";
              41: "Impossible de comprendre la fin de la phrase.";
              42: if (x1==0) print "Aucun de disponible.";
                  else print "Il en restait seulement ", (number) x1, ".";
              43: "Impossible. ";
              44: "Rien n'était disponible.";
              45: print "Précisez : "; !*!
              46: print "Précisez : "; !*!
              47: "Désolé, vous pouvez seulement utiliser un objet à la fois dans ce contexte. Lequel voulez-vous exactement ?";

              
              48: print "Pouvez-vous préciser qui est concerné par cette action ?^"; !*!
              49: print "Pouvez-vous préciser le nom de l'objet concerné par cette action ?^"; !*! remplacement de "à utiliser ?"
              50: print "Mon score venait ";
                  if (x1 > 0) print "d'augmenter"; else { x1 = -x1; print "de diminuer"; }
                  print " de ", (number) x1, " point";
                  if (x1 > 1) print "s";
              51: "(Comme quelque chose de dramatique vient de se produire,
                   la liste de commandes a été raccourcie.)";
              52: "^Tapez un nombre entre 1 et ", x1,
                  ", 0 pour réafficher ou appuyez sur ENTREE.^";
              53: "^[Appuyez sur ESPACE.]"; !*! SVP
        54: "[Commentaire enregistré.]";
        55: "[Commentaire NON enregistré.]";
        56: print ".^";
        57: print "?^";
        ! TODO le reste
        58: print (The) actor, " ", (IsOrAre) actor, " incapable de faire cela.^";
		59:	"Vous devez indiquer un nom après ce verbe.";
		60:	"Vous ne devez pas indiquer un nom avec ce verbe.";
		61:	"Vous devez indiquer un objet."; ! You must name an object
		62:	"Vous ne devez pas indiquer d'objet."; ! You may not name an object
		63:	"Vous devez indiquer un second objet."; ! You must name a second object
		64:	"Vous ne devez pas indiquer de second objet."; ! You may not name a second object
		65:	"Vous devez indiquer un second nom avec ce verbe.";
		66:	"Vous ne devez pas indiquer un second nom."; ! You may not supply a second noun
		67:	"Vous devez indiquer un nom plus précis."; !You must name something more substantial
		68:	print "(", (The) actor, " prenant d'abord ", (the) x1, ")^";
        69: "(prenant d'abord ", (the) x1, ")";
        70: "L'utilisation de UNDO n'est pas autorisée dans ce jeu.";
        71: print (string) DARKNESS__TX;
  		72: print (The) x1;
            if (x1 has pluralname) print " ont"; else print " a";
            " mieux à faire.";
        73: "Ce nom n'a pas de sens dans ce contexte."; ! That noun did not make sense in this context.
        74: print "[Cette commande demande de faire quelque chose en dehors du jeu, aussi elle n'a de sens que de vous à moi. Il ne peut être demandé de faire cela à ce ou ces personnes : ", (The) x1, "^"; ! print "[That command asks to do something outside of play, so it can only make sense from you to me. ", (The) x1, " cannot be asked to do this.]^";
    }
  Yes, No:        "Mmmh ?";
  NotifyOff:      "Notification du score désactivée.";
  NotifyOn:       "Notification du score activée.";
!   Objects: switch(n)
!            {   1: "Objets ayant été portés :^";
!                2: "Aucun.";
!                3: print "   (sur le corps)";
!                4: print "   (dans l'inventaire)";
!                5: print "   (abandonné",(es) x1,")";
!                6: print "   (", (name) x1, ")";
!                7: print "   (dans ", (the) x1, ")";
!                8: print "   (dans ", (the) x1, ")";
!                9: print "   (sur ", (the) x1, ")";
!               10: print "   (perdu",(es) x1,")";
!            }
  Open: switch (n) {
               1: "Je ne pouvais ouvrir cela.";
		2: if (x1 has pluralname) 
			{print (cthatorthose) x1," semblaient être fermé",(es) x1," à clé.^";} 
			else 
			{print (cthatorthose) x1," semblait être fermé",(es) x1," à clé.^";};
!               2: print_ret (cthatorthose) x1," semblait",(nt) x1,
!                  " être fermé",(es) x1," à clé.";
               3: print (ctheyreorthats) x1, " déjà ouvert";
                  if (x1 has female) "e.";
                  ".";
               4: print "J'ouvris ", (the) x1, ", révélant ";
                  if (WriteListFrom(child(x1),
                      ENGLISH_BIT + TERSE_BIT + CONCEAL_BIT)==0) "rien du tout.";
                  ".";
               5: "J'ouvris ", (the) x1, ".";
    }
!   Order:          print (The) x1;
!                   if (x1 has pluralname) print " avaient"; else print " a";
!                   " mieux à faire.";
!     ParlerIncorrect : "Soyez plus précis dans votre communication, ou reformulez.";
!     ParlerSansPrecision :   if (noun==player) "Je ne savais pas quoi me dire que je ne sache déjà.";
!                             else "Pas de réponse.";
!   Places: switch (n) {
!         1:  print "J'avais visité : ";
!         2:  print ".^";
!     }
!   Pray:           "Rien de concret ne résulta de ma prière.";
!   Prompt:   print "^>";
  Pronouns: switch (n) {
               1: print "En ce moment, ";
               2: print "signifie ";
               3: print "n'est pas défini";
               4: "aucun pronom n'est connu du jeu.";
        5:  ".";
    }
  Pull,Push,Turn: switch (n) {
               1: "C'était fixé sur place.";
               2: "J'en étais incapable.";
               3: "Rien d'évident ne se produisit.";
               4: "Cela aurait été moins que courtois.";
    }
! Push: see Pull
  PushDir: switch (n) {
               1: "Cette idée fantasque disparut rapidement. ";
               2: "Ce n'était pas une direction.";
               3: "Je ne pouvais pas aller dans cette direction.";
    }
  PutOn: switch (n) {
               1: "Je devais avoir en main ", (the) x1,
                  " avant de pouvoir ", (itorthem) x1,
                  " mettre sur quelque chose d'autre.";
               2: "Je ne pouvais pas poser un objet sur lui-même.";
               3: "Poser des objets sur ", (the) x1, " n'aurait mené à rien.";
               4: "Je manquais de dextérité.";
               5: "(", (itorthem) x1, " prenant d'abord)^";
               6: "Il n'y avait plus assez de place sur ", (the) x1, ".";
               7: "Ce que je fis.";
               8: "Je plaçai ", (the) x1, " sur ", (the) second, ".";
    }
  Quit: switch (n) {
               1: print "Répondez par oui ou par non, je vous prie.";
               2: print "Était-ce vraiment la fin ? (O/N) ";
    }
  Remove: switch (n) {
               1: if (x1 has pluralname)
		      print "Ils étaient malheureusement fermés."; !*! elle(s)
		      else print "Il était malheureusement fermé."; !*!
               2: if (x1 has pluralname)
                      print "Mais ils n'étaient pas";
                  else print "Mais ce n'était pas";
                  " ici maintenant.";
               3: "Très bien.";
    }
  Restart: switch (n) {
               1: print "Étais-je certain de vouloir recommencer ? ";
               2: "Raté.";
    }
  Restore: switch (n) {
               1: "Échec du chargement.";
               2: "^--- La partie a bien été restaurée ---^";
    }
  Rub:            "Je n'arrivai à rien ainsi.";
  Save: switch (n) {
               1: "La sauvegarde a échoué.";
               2: "^--- La partie a bien été sauvegardée ---^";
    }
  Score: switch (n) {
        1: if (deadflag) print "Dans cette partie j'avais obtenu "; else print "J'avais jusqu'à présent obtenu ";
            print score, " sur un score possible de ", MAX_SCORE, ", en ", turns, " tour";
            if (turns ~= 1) print "s";
            return;
        2:  "Il n'y avait pas de score dans cette histoire.";
    }
  ScriptOff: switch (n) {
               1: "Aucune transcription en cours.";
               2: "^Fin de transcription.";
               3: "Impossible de terminer la transcription.";
    }
  ScriptOn: switch (n) {
               1: "Transcription déjà en cours.";
               2: "Début d'une transcription de...";
               3: "Impossible de commencer la transcription.";
    }
  Search: switch (n) {
               1: "L'obscurité m'en empêchait. ";
               2: "Il n'y avait rien sur ", (the) x1, ".";
               3: print "Sur ", (the) x1, ", je voyais ";
                  WriteListFrom(child(x1),
                      TERSE_BIT + ENGLISH_BIT + CONCEAL_BIT);
                  ".";
               4: if (x1 has animate) "Je savais tenir ses mains tranquilles !";
                  else "Je ne trouvai rien d'intéressant.";
               5: "Je ne pouvais pas voir à l'intérieur, puisque ", (the) x1, " ",
                  (isorare) x1, " fermé",(es) x1,".";
               6: print_ret (The) x1, " ", (isorare) x1, " vide",(s) x1,".";
               7: print (The) x1;
                  if (x1 has pluralname) print " contenaient ";
                  else print " contenait ";
                  WriteListFrom(child(x1),
                      TERSE_BIT + ENGLISH_BIT + CONCEAL_BIT);
                  ".";
    }
!   Set:            "Non, je ne pouvais pas ", (itorthem) x1, " régler.";
  SetTo:          "Non, je ne pouvais pas ", (itorthem) x1, " régler sur rien.";
  Show: switch (n) {
               1: "Je ne pouvais pas ", (the) x1, ".";
               2: print_ret (The) x1, " ", (isorare) x1, " peu impressionné",(es) x1,".";
    }
  Sing:           "J'eus aimé, mais le coeur n'y était pas.";
  Sleep:          "Je n'avais pas particulièrement sommeil.";
  Smell:          "Aucune odeur particulière n'alertait ma conscience.";
  Sorry:          "Faute avouée est à moitié pardonnée.";
  Squeeze: switch (n) {
               1: "Inutile.";
               2: "Je ne serais arrivé à rien ainsi.";
    }
  Strong:         "Les vrais aventuriers n'emploient pas un tel langage.";
!     Swim:           "Il n'y avait pas assez d'eau pour nager dedans.";
    Swing:          "Ce n'était pas une chose à laquelle il était utile de se balancer.";
  SwitchOff: switch (n) {
               1: "Je ne pouvais ni allumer, ni éteindre cela.";
               2: print_ret (ctheyreorthats) x1,
                  " déjà éteint",(es) x1,".";
               3: "J'éteignis ", (the) x1, ".";
    }
  SwitchOn: switch (n) {
               1: "Je ne pouvais pas allumer cela.";
               2: print_ret (ctheyreorthats) x1,
                  " déjà allumé",(es) x1,".";
               3: "J'allumai ", (the) x1, ".";
    }
	  Take:    switch(n)
           {   1: "Voilà qui fut fait.";
               2: "Hélas, voilà une problématique relevant de la physique quantique.";
               3: "Cela ne semblait pas être une bonne idée.";
               4: print "Je devais d'abord ";
                  if (x1 has supporter) print "descendre "; else print "sortir ";
                  print_ret (dedudes) x1, ".";
               5: "Je l'avais déjà.";
               6: if (noun has pluralname) print "Cela semblait ";
                  else print "Cela semblait ";
                  "appartenir ", (to_the) x1, ".";
               7: if (noun has pluralname) print "Cela semblait ";
                  else print "Cela semblait ";
                  "faire partie ", (dedudes) x1, ".";
               8: print_ret (Cthatorthose) x1, " ", (isorarenot) x1,
                  " disponible", (s) x1, ".";
               9: print_ret (The) x1, " ", (isorarenot) x1, " ouvert",(es) x1,".";
              10: "Ceci était trop difficile à transporter.";
              11: "C'était fixé sur place.";
              12: "Je transportais déjà trop d'objets.";
              13: "(je mis ", (the) x1, " dans ", (the) SACK_OBJECT,
                  " pour faire de la place)";
           }
    Taste:          "Je ne remarquai rien de particulier.";
    Tell: switch (n) {
        1:  "Je discutai avec moi-même pendant un bon moment...";
        2:  "Pas de réaction.";
    }
    Think:          "Quelle bonne idée.";
  ThrowAt: switch (n) {
               1: "Futile.";
               2: "J'hésitai au moment crucial.";
    }
! Tie:  see JumpOver.
  Touch: switch (n) {
               1: "Je savais tenir mes mains tranquilles. ";
               2: "Je ne sentis rien de particulier.";
               3: "Je n'y voyais aucune utilité.";
    }
! Turn: see Pull.
  Unlock:  switch (n) {
               1: "Je ne pouvais pas déverrouiller cela.";
               2: print_ret (ctheyreorthats) x1,
                  " déjà déverrouillé", (es) x1, ".";
               3: "Cela ne rentrait pas dans la serrure.";
               4: "Je déverrouillai ", (the) x1, ".";
    }
!   VagueDo: "Il me fallait être plus précis."; 
!   VagueGo:  "Il me fallait peut-être préciser une direction. ";
  Verify: switch (n) {
               1: "Le fichier semble intact.";
               2: "Le fichier est certainement corrompu !";
    }
  Wait:           "Le temps passait...";
  Wake:           "Il ne s'agissait pas d'un rêve.";
  WakeOther:      "Cela ne semblait pas nécessaire.";
  Wave: switch (n) {
        1: "Mais je n'avais pas cela !";
        2: "J'avais l'air ridicule en agitant ", (the) x1, ".";
    }
    WaveHands:
        if (x1 == 0 || x1 == player) "J'agitai mes mains devant moi.";
        else "Je saluai ", (the) x1, ".";
  Wear: switch (n) {
               1: "Je ne pouvais pas mettre cela sur moi comme un vêtement !";
               2: "Je n'avais pas cela. ";
               3: "Je ", (itorthem) x1, " portais déjà.";
               4: "Je mis ", (the) x1, ".";
    }
! Yes:  see No.
];

#Endif; ! Fin test French1PSPa

![ =======================================================]

#Ifdef French3PSPa; ! Pour la 3ème personne du singulier passé

[ LanguageLM n x1 x2;
 say__p = 1; 
  Answer, Ask:    "Pas de réponse.";
! Ask:      see Answer
  Attack:         "La violence n'était pas forcément une solution.";
!  Blow:           "Il ne pouvait pas utilement souffler dedans.";
  Burn:           "Cet acte dangereux n'aurait pas mené à grand-chose.";
  Buy:            "Il n'y avait rien à vendre, ici.";
  Climb:          "Il n'y avait aucun possibilité d'escalade ici.";
  Close: switch (n) {
               1: "Il ne put fermer cela.";
               2: print (ctheyreorthats) x1, " déjà fermé";
                  if (x1 has female) "e.";
                  ".";
               3: "Il ferma ", (the) x1, ".";
    }
!   CommandsOff: switch (n) {
!         1: "[Enregistrement des commandes désactivé.]";
!         #Ifdef TARGET_GLULX;
!         2: "[Enregistrement des commandes déjà désactivé.]";
!         #Endif; ! TARGET_
!     }
!   CommandsOn: switch (n) {
!         1: "[Enregistrement des commandes activé.]";
!         #Ifdef TARGET_GLULX;
!         2: "[Les commandes sont actuellement en train d'être rejouées.]";
!         3: "[Enregistrement des commandes déjà activé.]";
!         4: "[Echec d'enregistrement des commandes.]";
!         #Endif; ! TARGET_
!     }
!   CommandsRead: switch (n) {
!         1: "[Rejouer les commandes.]";
!         #Ifdef TARGET_GLULX;
!         2: "[Les commandes sont déjà en train d'être rejouées.]";
!         3: "[Rejouer les commandes a échoué.  L'enregistrement des commandes est activé.]";
!         4: "[Rejouer les commandes a échoué.]";
!         5: "[Rejouer les commandes achevé.]";
!         #Endif; ! TARGET_
!     }
  Consult:        "Il ne trouva rien d'intéressant dans ", (the) x1, ".";
  Cut:            "Couper cela n'aurait pas mené à grand-chose.";
!  Dig:            "Creuser n'aurait mené à rien ici.";
  Disrobe: switch (n) {
               1: "Il ne ", (itorthem) x1, " portait pas.";
               2: "Il enleva ", (the) x1, ".";
    }
  Drink:          "Il n'y avait rien de buvable ici.";
  Drop: switch (n) {
               1: if (x1 has pluralname) print (The) x1, " étaient ";
                  else print (The) x1, " était ";
                  "déjà ici.";
               2: "Il n'avait pas ça.";
               
        3:  print "(il prit d'abord ", (the) x1, "^"; say__p = 0; return;

              
               4: "D'accord."; ! ok.
    }
  Eat: switch (n) {
              1: print_ret (ctheyreorthats) x1,
                  " non-comestible",(s) x1,", selon toute évidence.";
               2: "Il mangea ", (the) x1, ". Pas mauvais.";
    }
!   EmptyT: switch (n) {
!                1: print_ret (The) x1, " ne pouvait rien contenir.";
!                2: print_ret (The) x1, " ", (isorare) x1, " fermé",(es) x1,".";
!                3: print_ret (The) x1, " ", (isorare) x1, " déjà vide",(s) x1,".";
!                4: "Ceci n'aurait rien vidé.";
!     }
  Enter: switch (n) {
               1: print "Mais il était déjà ";
                  if (x1 has supporter) print "sur "; else print "dans ";
                  print_ret (the) x1, ".";
               2: print "Il ne put ";
                  switch (verb_word) {
                      'entrer':    "y entrer.";
                      'asseoir':    "s'y asseoir.";
                      'allonger':    "s'y allonger.";
                      'coucher':    "s'y coucher.";
                      default:  "y aller."; ! plutôt que "y entrer." !*!
                  }
               3: "Il ne put entrer dans ", (the) x1, " fermé",(es) x1,".";
               4: print "Il ne put ";                  
                  if (x1 has supporter) print "y monter";
                                   else print "y entrer";
                  " si ce n'était pas posé."; 
                               ! sur pieds, non encastré (freestanding)
               5: print "Il ";
                  if (x1 has supporter) print "monta sur "; else print "entra dans ";
                  print_ret (the) x1, ".";
                  
                  
        6:  print "(getting ";
            if (x1 has supporter) print "descendant "; else print "sortant ";
            print (the) x1; print ")^"; say__p = 0; return;
        7:  say__p = 0;
            if (x1 has supporter) "(montant sur ", (the) x1, ")^";
            if (x1 has container) "(entrant dans ", (the) x1, ")^";
            "(entrant dans ", (the) x1, ")^";
        
        
                  
              
    }
  Examine: switch (n) {
               1: "Il ne put rien voir.";
               2: "Rien de particulier concernant ", (the) x1, ".";
               3: print (The) x1, " ", (isorare) x1, " alors ";
                  if (x1 has on) "allumé",(es) x1,"."; else "éteint",(es) x1,".";
                  4:	print (The) actor, " looks closely at ", (the) x1, ".^";  
               5:  "En dépit de ses efforts, il ne voyait rien de particulier dans cette direction.";
    }
  Exit: switch (n) {
              1: "Sortir d'où ?!";
               2: print "Il ne put sortir ";
                  print_ret (dedudes) x1, " fermé", (es) x1, ".";
               3: print "Il ";
                  if (x1 has supporter) print "descendit "; else print "sortit ";
                  print_ret (dedudes) x1, ".";
        4:  print "Mais il n'était pas ";
            if (x1 has supporter) print "sur "; else print "dans ";
            print_ret (the) x1, ".";
    }
!   Fill:           "Mais il n'y avait pas d'eau à porter ici."; ! "Cela ne vous avancerait pas."
!   FullScore: switch(n)
!            {   1: if (deadflag) print "Le score était ";
!                   else          print "Le score était ";
!                   "composé comme suit :^";
!                2: "trouver divers objets";
!                3: "visiter différents endroits";
!                4: print "total (sur ", MAX_SCORE; ")";
!            }
  GetOff:         "Mais il n'était pas sur ", (the) x1, " à ce moment.";
  Give: switch (n) {
               1: "Il n'avait pas en main ", (the) x1, ".";
               2: "Il jongla avec ", (the) x1,
                  " pendant un moment, mais n'arriva pas à grand-chose.";
               3: print (The) x1;
                  if (x1 has pluralname)
	             print " n'avaient pas l'air intéressé";
                  else print " n'avait pas l'air intéressé";
                  ".";
    }
  Go: switch (n) {
               1: print "Il dut d'abord ";
                  if (x1 has supporter) print "descendre "; else print "sortir ";
                  print_ret (dedudes) x1, ".";
               2: "Il ne put aller par là.";
               3: "Il fut incapable de gravir ", (the) x1, ".";
               4: "Il fut incapable de descendre par ", (the) x1, ".";
               5: "Il en fut incapable, puisque ", (the) x1, " ", (isorare) x1,
                  " sur son chemin.";
               6: print "Il en fut incapable, puisque ", (the) x1;
                  if (x1 has pluralname) " ne menaient nulle part.";
                  " ne menait nulle part.";
    }
  Insert: switch (n) {
               1: "Il devait avoir en main ", (the) x1,
                  " avant de pouvoir ", (itorthem) x1,
                  " mettre dans autre chose.";
               2: print_ret (Cthatorthose) x1, " ne pouvait pas contenir d'objet.";
               3: print_ret (The) x1, " ", (isorare) x1, " fermé",(es) x1,".";
               4: "Il avait besoin de ", (itorthem) x1, " prendre d'abord.";
               5: "Il n'était pas possible de mettre un objet à l'intérieur de lui-même.";
               6: "(", (itorthem) x1, " prenant d'abord)^";
               7: "Il n'y avait plus de place dans ", (the) x1, ".";
               8: "Fait.";
               9: "Il mit ", (the) x1, " dans ", (the) second, ".";
    }
  Inv: switch (n) {
               1: "Il n'avait rien.";
               2: print "Il avait";
        3:  print ":^";
        4:  print ".^";
    }
  Jump:           "Il sauta sur place, vainement.";
  ! JumpOver:  "Il n'arriverait à rien comme ça.";
  Tie:  "Il n'arriverait à rien comme ça.";
  Kiss:           "Il devrait plutôt se concentrer sur le jeu.";
  Listen:         "Il n'entendit rien de particulier.";
  ListMiscellany: switch (n) {
               1: print " (allumé",(es) x1,")";
               2: print " (qui ", (isorare) x1, " fermé",(es) x1,")";
               3: print " (fermé",(es) x1," et allumé",(es) x1,")";
               4: print " (qui ", (isorare) x1, " vide",(s) x1,")";
               5: print " (vide",(s) x1," et allumé",(es) x1,")";
               6: print " (qui ", (isorare) x1, " fermé",(es) x1," et vide",(s) x1,")";
               7: print " (fermé",(es) x1,", vide",(s) x1," et allumé",(es) x1,")";
               8: print " (allumé",(es) x1," et porté",(es) x1;
               9: print " (allumé",(es) x1;
              10: print " (porté",(es) x1;
              11: print " (qui ", (isorare) x1, " ";
              12: print "ouvert",(es) x1;
              13: print "ouvert",(es) x1," mais vide",(s) x1;
              14: print "fermé",(es) x1;
              15: print "fermé",(es) x1," et verrouillé",(es) x1;
              16: print " et vide",(s) x1;
              17: print " (qui ", (isorare) x1, " vide",(s) x1,")";
              18: print " contenant ";
              19: print " (supportant "; ! " (sur ";
              20: print " supportant ";  ! " sur "; 
              21: print " (contenant ";  ! " (dans ";
              22: print " contenant ";   ! " dans ";
    }
  LMode1:         " est passé en mode description normale ; seuls les lieux 
                   visités pour la première fois sont décrits en détail.";
  LMode2:         " est passé en mode description longue ; tous les lieux,
                   même déjà visités, sont décrits en détail.";
  LMode3:         " est passé en mode description courte ; tous les lieux,
                   même non visités, sont décrits brièvement.";
  Lock: switch (n) {
               1: "Il ne pouvait pas verrouiller cela.";
               2: print_ret (ctheyreorthats) x1, " verrouillé en ce moment.";
               3: "Il devait fermer ", (the) x1, " auparavant.";
               4: "Cela ne rentrait pas dans la serrure.";
               5: "Il verrouilla ", (the) x1, ".";
    }
  Look: switch (n) {
               1: print " (sur ", (the) x1, ")";
               2: print " (dans ", (the) x1, ")";
               3: print " (comme ", (object) x1, ")";
               4: print "^Sur ", (the) x1, ", ";
                  WriteListFrom(child(x1),
                      ENGLISH_BIT + RECURSE_BIT + PARTINV_BIT
                      + TERSE_BIT + CONCEAL_BIT);
                  ".";
        5,6:
            if (x1 ~= location) {
                if (x1 has supporter) print "^Sur "; else print "^Dans ";
                print (the) x1, " il";
            }
            else print "^Il";
            print " pouvait voir ";
            if (n == 5) print "aussi ";
            WriteListFrom(child(x1),
              ENGLISH_BIT+RECURSE_BIT+PARTINV_BIT+TERSE_BIT+CONCEAL_BIT+WORKFLAG_BIT);
            ".";
        7:  "Il ne vit rien de particulier dans cette direction.";
    }
  LookUnder: switch (n) {
               1: "Mais il faisait noir !";
               2: "Ces recherches furent vaines.";
    }
  Mild:           "Assez.";
  Miscellany: switch (n) {
               1: "(affichage des seize premiers)^";
               2: "Rien à faire !";
               3: print " C'était la fin. ";
               4: print " Il avait gagné ";
               5: print "^Voulez-vous RECOMMENCER,
                          CHARGER une partie sauvegardée";
                  #IFDEF DEATH_MENTION_UNDO;
                  print ", ANNULER votre dernière action";
                  #ENDIF;
                  if (TASKS_PROVIDED==0)
                      print ", obtenir le score détaillé pour cette partie (FULLSCORE)";
                  if (deadflag==2 && AMUSING_PROVIDED==0)
                      print ", lire quelques suggestions amusantes (AMUSING)";
                  " ou QUITTER ?"; !*!
               6: "[Votre interpréteur ne permet pas d' ~annuler~. Désolé !]";
            #Ifdef TARGET_ZCODE;
               7: "~Annuler~ a échoué.  [Tous les interpréteurs ne le permettent pas.]";
            #Ifnot; ! TARGET_GLULX
               7:  "[Vous ne pouvez pas ~Annuler~ plus loin.]";
            #Endif; ! TARGET_
               8: "Faites un choix parmi les propositions ci-dessus.";
               9: "^L'obscurité devint alors totale !";
              10: "Ses pensées étaient confuses.";
              11: "[Vous ne pouvez pas annuler alors que rien n'a encore été fait !]";
              12: "[Impossible d'annuler deux fois de suite. Désolé !]";
              13: "[Action précédente annulée.]";
              14: "Désolé, impossible de corriger.";
              15: "Impossible à envisager."; !*! "Think nothing of it."; !*!
              16: "~Oops~ ne peut corriger qu'un seul mot.";
              17: "L'obscurité était totale.";
              18: print "lui-même";
              19: "Aussi beau que d'habitude.";           
              20: "Pour répéter une commande comme ~grenouille, saute~, dîtes seulement
                   ~encore~, et pas ~grenouille, encore~.";
              21: "Impossible.";
              22: "Vous ne pouvez pas commencer une phrase par une virgule.";
              23: "Ses pensées étaient confuses.";
              24: "Il ne pouvait pas discuter avec ", (the) x1, ".";
                  ! "parler à" serait mieux mais délicat (ex: à l'oiseau)
              25: "Pour parler à quelqu'un, essayez ~quelqu'un, bonjour~ ou quelque chose dans le genre.";
!              26: "(il prit d'abord ", (the) not_holding, ")";
              26: "(il prit d'abord cela.)";
              27: "Je ne comprends pas cette phrase.";
!              28: print "Je n'ai compris que : ";
		28: "Merci de reformuler (éventuellement en retirant les articles). Je ne connais que : ";
              29: "Je n'ai pas compris ce nombre.";
              30: "Il ne vit rien de tel, à moins que cela ne fût sans grande importance."; ! Vous ne pouvez voir une telle chose
              31: "Il semblait en avoir dit trop peu !";
              32: "Il ne l'avait pas en mains !";
              33: "Vous ne pouvez pas employer le mot ~tout~ avec ce verbe.";
              34: "Vous ne pouvez utiliser le mot ~tout~ qu'une fois par ligne."; !*!
              35: "Je ne suis pas certain de ce à quoi ~", (address) pronoun_word,
                  "~ se réfère.";
              36: "Vous avez exclu quelque chose qui n'était de toute façon pas compris dans la liste !";
              37: "Il ne pouvait faire cela qu'à une chose animée.";
              38: "Je ne connais pas ce verbe.";
              39: "Cela n'avait pas la moindre importance.";
              40: "Il ne pouvait pas voir ~", (address) pronoun_word,
                  "~ (", (the) pronoun_obj, ") à ce moment.";
              41: "Impossible de comprendre la fin de la phrase.";
              42: if (x1==0) print "Aucun de disponible.";
                  else print "Il en restait seulement ", (number) x1, ".";
              43: "Rien à faire !";
              44: "Rien n'était disponible !";
              45: print "Il faudrait préciser : "; !*!
              46: print "Il faudrait préciser : "; !*!
              47: "Désolé, vous pouvez seulement avoir un objet ici. Lequel voulez-vous exactement ?";
!              48: print "Pouvez-vous préciser qui est concerné par cette action ?^";
!              48: print "Pouvez-vous préciser le nom de l'objet à utiliser ?^"; !*!
               48: print "Pouvez-vous préciser ce qui est concerné par cette action ?^";
!              49: print "Pouvez-vous préciser avec quoi ? (tapez le nom seul, sans la préposition 'avec')^";
              49: print "Pouvez-vous préciser ?^"; !*!
              50: print "Le score venait ";
                  if (x1 > 0) print "d'augmenter"; else { x1 = -x1; print "de diminuer"; }
                  print " de ", (number) x1, " point";
                  if (x1 > 1) print "s";
              51: "(Comme quelque chose de dramatique venait de se produire,
                   cette liste de commandes a été raccourcie.)";
              52: "^Tapez un nombre entre 1 et ", x1,
                  ", 0 pour réafficher ou appuyez sur ENTREE.";
              53: "^[Appuyez sur ESPACE.]"; !*! SVP
        54: "[Commentaire enregistré.]";
        55: "[Commentaire NON enregistré.]";
        56: print ".^";
        57: print "?^";
        ! TODO le reste
        58: print (The) actor, " ", (IsOrAre) actor, " incapable de faire cela.^";
		59:	"Vous devez indiquer un nom après ce verbe.";
		60:	"Vous ne devez pas indiquer un nom avec ce verbe.";
		61:	"Vous devez indiquer un objet."; ! You must name an object
		62:	"Vous ne devez pas indiquer d'objet."; ! You may not name an object
		63:	"Vous devez indiquer un second objet."; ! You must name a second object
		64:	"Vous ne devez pas indiquer de second objet."; ! You may not name a second object
		65:	"Vous devez indiquer un second nom avec ce verbe.";
		66:	"Vous ne devez pas indiquer un second nom."; ! You may not supply a second noun
		67:	"Vous devez indiquer un nom plus précis."; !You must name something more substantial
		68:	print "(", (The) actor, " prenant d'abord ", (the) x1, ")^";
        69: "(prenant d'abord ", (the) x1, ")";
        70: "L'utilisation de UNDO n'est pas autorisée dans ce jeu.";
        71: print (string) DARKNESS__TX;
  		72: print (The) x1;
            if (x1 has pluralname) print " avaient"; else print " avait";
            " mieux à faire.";
        73: "Ce nom n'a pas de sens dans ce contexte."; ! That noun did not make sense in this context.
        74: print "[Cette commande demande de faire quelque chose en dehors du jeu, aussi elle n'a de sens que de vous à moi. Il ne peut être demandé de faire cela à ce ou ces personnes : ", (The) x1, "^"; ! print "[That command asks to do something outside of play, so it can only make sense from you to me. ", (The) x1, " cannot be asked to do this.]^";
    }
  Yes, No:        "Mmmh ?";
  NotifyOff:      "Notification du score désactivée.";
  NotifyOn:       "Notification du score activée.";
!   Objects: switch(n)
!            {   1: "Objets ayant été portés :^";
!                2: "Aucun.";
!                3: print "   (sur le corps)";
!                4: print "   (dans l'inventaire)";
!                5: print "   (abandonné",(es) x1,")";
!                6: print "   (", (name) x1, ")";
!                7: print "   (dans ", (the) x1, ")";
!                8: print "   (dans ", (the) x1, ")";
!                9: print "   (sur ", (the) x1, ")";
!               10: print "   (perdu",(es) x1,")";
!            }
  Open: switch (n) {
               1: "Il ne pouvait pas ouvrir cela.";
		2: if (x1 has pluralname) 
			{print (cthatorthose) x1," semblaient être fermé",(es) x1," à clé.^";} 
			else 
			{print (cthatorthose) x1," semblait être fermé",(es) x1," à clé.^";};
!               2: print_ret (cthatorthose) x1," semblait",(nt) x1,
!                  " être fermé",(es) x1," à clé.";
               3: print (ctheyreorthats) x1, " déjà ouvert";
                  if (x1 has female) "e.";
                  ".";
               4: print "Il ouvrit ", (the) x1, ", révélant ";
                  if (WriteListFrom(child(x1),
                      ENGLISH_BIT + TERSE_BIT + CONCEAL_BIT)==0) "rien du tout.";
                  ".";
               5: "Il ouvrit ", (the) x1, ".";
    }
!   Order:          print (The) x1;
!                   if (x1 has pluralname) print " avaient"; else print " a";
!                   " mieux à faire.";
!   Places: switch (n) {
!         1:  print "Il avait visité : ";
!         2:  print ".^";
!     }
!   Pray:           "Rien de pratique ne résulta de cette prière.";
!   Prompt:   print "^>";
  Pronouns: switch (n) {
               1: print "En ce moment, ";
               2: print "signifiait ";
               3: print "était enlevé";
               4: "aucun pronom n'est connu du jeu.";
        5:  ".";
    }
  Pull,Push,Turn: switch (n) {
               1: "C'était fixé sur place.";
               2: "Il en était incapable.";
               3: "Rien d'évident ne se produisit.";
               4: "Cela aurait été moins que courtois.";
    }
! Push: see Pull
  PushDir: switch (n) {
               1: "Cette idée fantasque disparut rapidement";
               2: "Ce n'était pas une direction.";
               3: "Il ne pouvait pas aller dans cette direction.";
    }
  PutOn: switch (n) {
               1: "Il devait avoir en main ", (the) x1,
                  " avant de pouvoir ", (itorthem) x1,
                  " mettre sur quelque chose d'autre.";
               2: "Il ne pouvait pas poser un objet sur lui-même.";
               3: "Poser des objets sur ", (the) x1, " n'aurait mené à rien.";
               4: "Il manquait de dextérité.";
               5: "(", (itorthem) x1, " prenant d'abord)^";
               6: "Il n'y avait plus assez de place sur ", (the) x1, ".";
               7: "Cela fut fait.";
               8: "Il mit ", (the) x1, " sur ", (the) second, ".";
    }
  Quit: switch (n) {
               1: print "Répondez par oui ou par non, je vous prie.";
               2: print "Êtes-vous certain de vouloir quitter ? ";
    }
  Remove: switch (n) {
               1: if (x1 has pluralname)
		      print "Ils étaient malheureusement fermés."; !*! elle(s)
		      else print "Il était malheureusement fermé."; !*!
               2: if (x1 has pluralname)
                      print "Mais ils n'étaient pas";
                  else print "Mais ce n'étaient pas";
                  " ici maintenant.";
               3: "Très bien.";
    }
  Restart: switch (n) {
               1: print "Êtes-vous sûr de vouloir recommencer ? ";
               2: "Raté.";
    }
  Restore: switch (n) {
               1: "Échec du chargement.";
               2: "^--- La partie a bien été restaurée ---^";
    }
  Rub:            "Il n'arriva à rien ainsi.";
  Save: switch (n) {
               1: "La sauvegarde a échoué.";
               2: "^--- La partie a bien été sauvegardée ---^";
    }
  Score: switch (n) {
        1:  if (deadflag) print "Dans cette histoire il avait obtenu "; else print "Dans cette histoire il avait jusqu'à présent obtenu ";
            print score, " sur un score possible de ", MAX_SCORE, ", en ", turns, " tour";
            if (turns ~= 1) print "s";
            return;
        2:  "Il n'y avait pas de score dans cette histoire.";
    }
  ScriptOff: switch (n) {
               1: "Aucune transcription en cours.";
               2: "^Fin de transcription.";
               3: "Impossible de terminer la transcription.";
    }
  ScriptOn: switch (n) {
               1: "Transcription déjà en cours.";
               2: "Début d'une transcription de...";
               3: "Impossible de commencer la transcription.";
    }
  Search: switch (n) {
               1: "Mais il faisait noir !";
               2: "Il n'y avait rien sur ", (the) x1, ".";
               3: print "Sur ", (the) x1, ", il vit "; 
                  WriteListFrom(child(x1),
                      TERSE_BIT + ENGLISH_BIT + CONCEAL_BIT);
                  ".";
               4: if (x1 has animate) "Il savait tenir ses mains tranquilles !";
                  else "Il ne trouva rien d'intéressant.";
               5: "Il ne put voir à l'intérieur, puisque ", (the) x1, " ",
                  (isorare) x1, " fermé",(es) x1,".";
               6: print_ret (The) x1, " ", (isorare) x1, " vide",(s) x1,".";
               7: print (The) x1;
                  if (x1 has pluralname) print " contenaient ";
                  else print " contenait ";
                  WriteListFrom(child(x1),
                      TERSE_BIT + ENGLISH_BIT + CONCEAL_BIT);
                  ".";
    }
!  Set:            "Non, il ne pouvait pas ", (itorthem) x1, " régler.";
  SetTo:          "Non, il ne pouvait pas ", (itorthem) x1, " régler sur rien.";
  Show: switch (n) {
               1: "Il n'avait pas ", (the) x1, ".";
               2: print_ret (The) x1, " ", (isorare) x1, " peu impressionné",(es) x1,".";
    }
  Sing:           "Il ne savait pas chanter.";
  Sleep:          "Il n'avait pas particulièrement sommeil.";
  Smell:          "Il ne sentit rien de particulier.";
  Sorry:          "Faute avouée est à moitié pardonnée.";
  Squeeze: switch (n) {
               1: "Inutile.";
               2: "Il ne serait arrivé à rien ainsi.";
    }
  Strong:         "Les vrais aventuriers n'emploient pas un tel langage.";

!  Swim:           "Il n'y avait pas assez d'eau pour nager dedans.";  ! swim desactive par defaut dans I7

  Swing:          "Ce n'était pas une chose à laquelle il était utile de se balancer.";
  SwitchOff: switch (n) {
               1: "Il ne pouvait pas allumer ou éteindre cela.";
               2: print_ret (ctheyreorthats) x1,
                  " déjà éteint",(es) x1,".";
               3: "Il éteignit ", (the) x1, ".";
    }
  SwitchOn: switch (n) {
               1: "Il ne pouvait pas allumer cela.";
               2: print_ret (ctheyreorthats) x1,
                  " déjà allumé",(es) x1,".";
               3: "Il alluma ", (the) x1, ".";
    }
	  Take:    switch(n)
           {   1: "D'accord."; ! ok
               2: "Il était déjà lui-même.";
               3: "Cela ne semblait pas être une bonne idée.";
               4: print "Il devait d'abord ";
                  if (x1 has supporter) print "descendre "; else print "sortir ";
                  print_ret (dedudes) x1, ".";
               5: "Il l'avait déjà.";
               6: if (noun has pluralname) print "Cela semblait ";
                  else print "Cela semblait ";
                  "appartenir à ", (the) x1, ".";
               7: if (noun has pluralname) print "Cela semblait ";
                  else print "Cela semblait ";
                  "faire partie ", (dedudes) x1, ".";
               8: print_ret (Cthatorthose) x1, " ", (isorarenot) x1,
                  " disponible", (s) x1, ".";
               9: print_ret (The) x1, " ", (isorarenot) x1, " ouvert",(es) x1,".";
              10: "Trop difficile à transporter.";
              11: "C'était fixé sur place.";
              12: "Il transportait déjà trop d'objets.";
              13: "(il mit ", (the) x1, " dans ", (the) SACK_OBJECT,
                  " pour faire de la place)";
           }
  Taste:          "Il ne remarqua rien de particulier.";
  Tell: switch (n) {
               1: "Il discuta avec lui-même pendant un moment...";
               2: "Pas de réaction.";
    }
  Think:          "Quelle bonne idée.";
  ThrowAt: switch (n) {
               1: "Futile.";
               2: "Il hésita au moment crucial.";
    }
! Tie:  see JumpOver.
  Touch: switch (n) {
               1: "Il savait tenir ses mains tranquilles !";
               2: "Il ne sentit rien de particulier.";
               3: "Il n'y voyait aucune utilité.";
    }
! Turn: see Pull.
  Unlock:  switch (n) {
               1: "Il ne pouvait pas déverrouiller cela.";
               2: print_ret (ctheyreorthats) x1,
                  " déjà déverrouillé", (es) x1, ".";
               3: "Cela ne rentrait pas dans la serrure.";
               4: "Il déverrouilla ", (the) x1, ".";
    }
!  VagueGo:  "Il fallait donner une direction plus précise.";
  Verify: switch (n) {
               1: "Le fichier semble intact.";
               2: "Le fichier est certainement corrompu !";
    }
  Wait:           "Le temps passait...";
  Wake:           "Il ne dormait pas.";
  WakeOther:      "Cela ne semblait pas nécessaire.";
  Wave: switch (n) {
               1: "Mais il n'avait pas cela !";
               2: "Inutile.";
    }
  WaveHands:      "Il agita ses mains, sans résultat.";
  Wear: switch (n) {
               1: "Il ne pouvait pas porter cela !";
               2: "Il n'avait pas cela !";
               3: "Il ", (itorthem) x1, " portait déjà !";
               4: "Il mit ", (the) x1, ".";
    }
! Yes:  see No.
];

! fin test French3PSPa

#Endif; 

![ =======================================================]

#Ifdef French3PSPr; ! Pour la 3ème personne du singulier présent

[ LanguageLM n x1 x2;
 say__p = 1; 
  Answer, Ask:    "Pas de réponse.";
! Ask:      see Answer
  Attack:         "La violence n'est pas forcément une solution.";
!  Blow:           "Il ne peut pas utilement souffler dedans.";
  Burn:           "Cet acte dangereux ne mène pas à grand-chose.";
  Buy:            "Il n'y a rien à vendre, ici.";
  Climb:          "Il n'y a aucun possibilité d'escalade ici.";
  Close: switch (n) {
               1: "Il ne peut fermer cela.";
               2: print (ctheyreorthats) x1, " déjà fermé";
                  if (x1 has female) "e.";
                  ".";
               3: "Il ferme ", (the) x1, ".";
    }
!   CommandsOff: switch (n) {
!         1: "[Enregistrement des commandes désactivé.]";
!         #Ifdef TARGET_GLULX;
!         2: "[Enregistrement des commandes déjà désactivé.]";
!         #Endif; ! TARGET_
!     }
!   CommandsOn: switch (n) {
!         1: "[Enregistrement des commandes activé.]";
!         #Ifdef TARGET_GLULX;
!         2: "[Les commandes sont actuellement en train d'être rejouées.]";
!         3: "[Enregistrement des commandes déjà activé.]";
!         4: "[Echec d'enregistrement des commandes.]";
!         #Endif; ! TARGET_
!     }
!   CommandsRead: switch (n) {
!         1: "[Rejouer les commandes.]";
!         #Ifdef TARGET_GLULX;
!         2: "[Les commandes sont déjà en train d'être rejouées.]";
!         3: "[Rejouer les commandes a échoué.  L'enregistrement des commandes est activé.]";
!         4: "[Rejouer les commandes a échoué.]";
!         5: "[Rejouer les commandes achevé.]";
!         #Endif; ! TARGET_
!     }
  Consult:        "Il ne trouve rien d'intéressant dans ", (the) x1, ".";
  Cut:            "Couper cela ne mène pas à grand-chose.";
!  Dig:            "Creuser ne mene à rien ici.";
  Disrobe: switch (n) {
               1: "Il ne ", (itorthem) x1, " porte pas.";
               2: "Il enleve ", (the) x1, ".";
    }
  Drink:          "Il n'y a rien de buvable ici.";
  Drop: switch (n) {
               1: if (x1 has pluralname) print (The) x1, " sont ";
                  else print (The) x1, " est ";
                  "déjà ici.";
               2: "Il n'a pas ça.";
               
        3:  print "(il prend d'abord ", (the) x1, "^"; say__p = 0; return;

              
               4: "D'accord."; ! ok.
    }
  Eat: switch (n) {
              1: print_ret (ctheyreorthats) x1,
                  " non-comestible",(s) x1,", selon toute évidence.";
               2: "Il mange ", (the) x1, ". Pas mauvais.";
    }
!   EmptyT: switch (n) {
!                1: print_ret (The) x1, " ne peut rien contenir.";
!                2: print_ret (The) x1, " ", (isorare) x1, " fermé",(es) x1,".";
!                3: print_ret (The) x1, " ", (isorare) x1, " déjà vide",(s) x1,".";
!                4: "Ceci n'a rien vidé.";
!     }
  Enter: switch (n) {
               1: print "Mais il est déjà ";
                  if (x1 has supporter) print "sur "; else print "dans ";
                  print_ret (the) x1, ".";
               2: print "Il ne peut ";
                  switch (verb_word) {
                      'entrer':    "y entrer.";
                      'asseoir':    "s'y asseoir.";
                      'allonger':    "s'y allonger.";
                      'coucher':    "s'y coucher.";
                      default:  "y aller."; ! plutôt que "y entrer." !*!
                  }
               3: "Il ne peut entrer dans ", (the) x1, " fermé",(es) x1,".";
               4: print "Il ne peut ";                  
                  if (x1 has supporter) print "y monter";
                                   else print "y entrer";
                  " si ce n'est pas posé."; 
                               ! sur pieds, non encastré (freestanding)
               5: print "Il ";
                  if (x1 has supporter) print "monte sur "; else print "entre dans ";
                  print_ret (the) x1, ".";
                  
                  
        6:  print "(getting ";
            if (x1 has supporter) print "descendant "; else print "sortant ";
            print (the) x1; print ")^"; say__p = 0; return;
        7:  say__p = 0;
            if (x1 has supporter) "(montant sur ", (the) x1, ")^";
            if (x1 has container) "(entrant dans ", (the) x1, ")^";
            "(entrant dans ", (the) x1, ")^";
        
        
                  
              
    }
  Examine: switch (n) {
               1: "Il ne peut rien voir.";
               2: "Rien de particulier concernant ", (the) x1, ".";
               3: print (The) x1, " ", (isorare) x1, " alors ";
                  if (x1 has on) "allumé",(es) x1,"."; else "éteint",(es) x1,".";
                  4:	print (The) actor, " looks closely at ", (the) x1, ".^";  
               5:  "En dépit de ses efforts, il ne voit rien de particulier dans cette direction.";
    }
  Exit: switch (n) {
              1: "Sortir d'où ?!";
               2: print "Il ne peut sortir ";
                  print_ret (dedudes) x1, " fermé", (es) x1, ".";
               3: print "Il ";
                  if (x1 has supporter) print "descend "; else print "sort ";
                  print_ret (dedudes) x1, ".";
        4:  print "Mais il n'est pas ";
            if (x1 has supporter) print "sur "; else print "dans ";
            print_ret (the) x1, ".";
    }
!   Fill:           "Mais il n'y a pas d'eau à porter ici."; ! "Cela ne vous avancerait pas."
!   FullScore: switch(n)
!            {   1: if (deadflag) print "Le score est ";
!                   else          print "Le score est ";
!                   "composé comme suit :^";
!                2: "trouver divers objets";
!                3: "visiter différents endroits";
!                4: print "total (sur ", MAX_SCORE; ")";
!            }
  GetOff:         "Mais il n'est pas sur ", (the) x1, " en ce moment.";
  Give: switch (n) {
               1: "Il n'a pas en main ", (the) x1, ".";
               2: "Il jongle avec ", (the) x1,
                  " pendant un moment, mais n'arrive pas à grand-chose.";
               3: print (The) x1;
                  if (x1 has pluralname)
	             print " n'ont pas l'air intéressé";
                  else print " n'a pas l'air intéressé";
                  ".";
    }
  Go: switch (n) {
               1: print "Il doit d'abord ";
                  if (x1 has supporter) print "descendre "; else print "sortir ";
                  print_ret (dedudes) x1, ".";
               2: "Il ne peut aller par là.";
               3: "Il est incapable de gravir ", (the) x1, ".";
               4: "Il est incapable de descendre par ", (the) x1, ".";
               5: "Il en est incapable, puisque ", (the) x1, " ", (isorare) x1,
                  " sur son chemin.";
               6: print "Il en est incapable, puisque ", (the) x1;
                  if (x1 has pluralname) " ne mènent nulle part.";
                  " ne mène nulle part.";
    }
  Insert: switch (n) {
               1: "Il doit avoir en main ", (the) x1,
                  " avant de pouvoir ", (itorthem) x1,
                  " mettre dans autre chose.";
               2: print_ret (Cthatorthose) x1, " ne peut pas contenir d'objet.";
               3: print_ret (The) x1, " ", (isorare) x1, " fermé",(es) x1,".";
               4: "Il a besoin de ", (itorthem) x1, " prendre d'abord.";
               5: "Il n'est pas possible de mettre un objet à l'intérieur de lui-même.";
               6: "(", (itorthem) x1, " prenant d'abord)^";
               7: "Il n'y a plus de place dans ", (the) x1, ".";
               8: "Fait.";
               9: "Il met ", (the) x1, " dans ", (the) second, ".";
    }
  Inv: switch (n) {
               1: "Il n'a rien.";
               2: print "Il a";
        3:  print ":^";
        4:  print ".^";
    }
  Jump:           "Il saute sur place, vainement.";
  ! JumpOver:  "Il n'arrive à rien comme ça.";
  Tie:  "Il n'arrive à rien comme ça.";
  Kiss:           "Il doit plutôt se concentrer sur le jeu.";
  Listen:         "Il n'entend rien de particulier.";
  ListMiscellany: switch (n) {
               1: print " (allumé",(es) x1,")";
               2: print " (qui ", (isorare) x1, " fermé",(es) x1,")";
               3: print " (fermé",(es) x1," et allumé",(es) x1,")";
               4: print " (qui ", (isorare) x1, " vide",(s) x1,")";
               5: print " (vide",(s) x1," et allumé",(es) x1,")";
               6: print " (qui ", (isorare) x1, " fermé",(es) x1," et vide",(s) x1,")";
               7: print " (fermé",(es) x1,", vide",(s) x1," et allumé",(es) x1,")";
               8: print " (allumé",(es) x1," et porté",(es) x1;
               9: print " (allumé",(es) x1;
              10: print " (porté",(es) x1;
              11: print " (qui ", (isorare) x1, " ";
              12: print "ouvert",(es) x1;
              13: print "ouvert",(es) x1," mais vide",(s) x1;
              14: print "fermé",(es) x1;
              15: print "fermé",(es) x1," et verrouillé",(es) x1;
              16: print " et vide",(s) x1;
              17: print " (qui ", (isorare) x1, " vide",(s) x1,")";
              18: print " contenant ";
              19: print " (supportant "; ! " (sur ";
              20: print " supportant ";  ! " sur "; 
              21: print " (contenant ";  ! " (dans ";
              22: print " contenant ";   ! " dans ";
    }
  LMode1:         " est passé en mode description normale ; seuls les lieux 
                   visités pour la première fois sont décrits en détail.";
  LMode2:         " est passé en mode description longue ; tous les lieux,
                   même déjà visités, sont décrits en détail.";
  LMode3:         " est passé en mode description courte ; tous les lieux,
                   même non visités, sont décrits brièvement.";
  Lock: switch (n) {
               1: "Il ne peut pas verrouiller cela.";
               2: print_ret (ctheyreorthats) x1, " verrouillé en ce moment.";
               3: "Il doit fermer ", (the) x1, " auparavant.";
               4: "Cela ne rentre pas dans la serrure.";
               5: "Il verrouille ", (the) x1, ".";
    }
  Look: switch (n) {
               1: print " (sur ", (the) x1, ")";
               2: print " (dans ", (the) x1, ")";
               3: print " (comme ", (object) x1, ")";
               4: print "^Sur ", (the) x1, ", ";
                  WriteListFrom(child(x1),
                      ENGLISH_BIT + RECURSE_BIT + PARTINV_BIT
                      + TERSE_BIT + CONCEAL_BIT);
                  ".";
        5,6:
            if (x1 ~= location) {
                if (x1 has supporter) print "^Sur "; else print "^Dans ";
                print (the) x1, " il";
            }
            else print "^Il";
            print " peut voir ";
            if (n == 5) print "aussi ";
            WriteListFrom(child(x1),
              ENGLISH_BIT+RECURSE_BIT+PARTINV_BIT+TERSE_BIT+CONCEAL_BIT+WORKFLAG_BIT);
            ".";
        7:  "Il ne voit rien de particulier dans cette direction.";
    }
  LookUnder: switch (n) {
               1: "Mais il fait noir !";
               2: "Ces recherches sont vaines.";
    }
  Mild:           "Assez.";
  Miscellany: switch (n) {
               1: "(affichage des seize premiers)^";
               2: "Rien à faire !";
               3: print " C'est la fin. ";
               4: print " Il a gagné ";
               5: print "^Voulez-vous RECOMMENCER,
                          CHARGER une partie sauvegardée";
                  #IFDEF DEATH_MENTION_UNDO;
                  print ", ANNULER votre dernière action";
                  #ENDIF;
                  if (TASKS_PROVIDED==0)
                      print ", obtenir le score détaillé pour cette partie (FULLSCORE)";
                  if (deadflag==2 && AMUSING_PROVIDED==0)
                      print ", lire quelques suggestions amusantes (AMUSING)";
                  " ou QUITTER ?"; !*!
               6: "[Votre interpréteur ne permet pas d' ~annuler~. Désolé !]";
            #Ifdef TARGET_ZCODE;
               7: "~Annuler~ a échoué.  [Tous les interpréteurs ne le permettent pas.]";
            #Ifnot; ! TARGET_GLULX
               7:  "[Vous ne pouvez pas ~Annuler~ plus loin.]";
            #Endif; ! TARGET_
               8: "Faites un choix parmi les propositions ci-dessus.";
               9: "^L'obscurité devint alors totale !";
              10: "Ses pensées sont confuses.";
              11: "[Vous ne pouvez pas annuler alors que rien n'a encore été fait !]";
              12: "[Impossible d'annuler deux fois de suite. Désolé !]";
              13: "[Action précédente annulée.]";
              14: "Désolé, impossible de corriger.";
              15: "Impossible à envisager."; !*! "Think nothing of it."; !*!
              16: "~Oops~ ne peut corriger qu'un seul mot.";
              17: "L'obscurité est totale.";
              18: print "lui-même";
              19: "Aussi beau que d'habitude.";           
              20: "Pour répéter une commande comme ~grenouille, saute~, dîtes seulement
                   ~encore~, et pas ~grenouille, encore~.";
              21: "Impossible.";
              22: "Vous ne pouvez pas commencer une phrase par une virgule.";
              23: "Ses pensées sont confuses.";
              24: "Il ne peut pas discuter avec ", (the) x1, ".";
                  ! "parler à" serait mieux mais délicat (ex: à l'oiseau)
              25: "Pour parler à quelqu'un, essayez ~quelqu'un, bonjour~ ou quelque chose dans le genre.";
!              26: "(il prend d'abord ", (the) not_holding, ")";
              26: "(il prend d'abord cela.)";
              27: "Je ne comprends pas cette phrase.";
!              28: print "Je n'ai compris que : ";
		28: "Merci de reformuler (éventuellement en retirant les articles). Je ne connais que : ";
              29: "Je n'ai pas compris ce nombre.";
              30: "Il ne voit rien de tel, à moins que cela ne soit sans grande importance."; ! Vous ne pouvez voir une telle chose
              31: "Il semble en avoir dit trop peu !";
              32: "Il ne l'a pas en mains !";
              33: "Vous ne pouvez pas employer le mot ~tout~ avec ce verbe.";
              34: "Vous ne pouvez utiliser le mot ~tout~ qu'une fois par ligne."; !*!
              35: "Je ne suis pas certain de ce à quoi ~", (address) pronoun_word,
                  "~ se réfère.";
              36: "Vous avez exclu quelque chose qui n'était de toute façon pas compris dans la liste !";
              37: "Il ne peut faire cela qu'à une chose animée.";
              38: "Je ne connais pas ce verbe.";
              39: "Cela n'a pas la moindre importance.";
              40: "Il ne peut pas voir ~", (address) pronoun_word,
                  "~ (", (the) pronoun_obj, ") à ce moment.";
              41: "Impossible de comprendre la fin de la phrase.";
              42: if (x1==0) print "Aucun de disponible.";
                  else print "Il en reste seulement ", (number) x1, ".";
              43: "Rien à faire !";
              44: "Rien n'est disponible !";
              45: print "Il faudrait préciser : "; !*!
              46: print "Il faudrait préciser : "; !*!
              47: "Désolé, vous pouvez seulement avoir un objet ici. Lequel voulez-vous exactement ?";
!              48: print "Pouvez-vous préciser qui est concerné par cette action ?^";
!              48: print "Pouvez-vous préciser le nom de l'objet à utiliser ?^"; !*!
               48: print "Pouvez-vous préciser ce qui est concerné par cette action ?^";
!              49: print "Pouvez-vous préciser avec quoi ? (tapez le nom seul, sans la préposition 'avec')^";
              49: print "Pouvez-vous préciser ?^"; !*!
              50: print "Le score vient ";
                  if (x1 > 0) print "d'augmenter"; else { x1 = -x1; print "de diminuer"; }
                  print " de ", (number) x1, " point";
                  if (x1 > 1) print "s";
              51: "(Comme quelque chose de dramatique vient de se produire,
                   cette liste de commandes a été raccourcie.)";
              52: "^Tapez un nombre entre 1 et ", x1,
                  ", 0 pour réafficher ou appuyez sur ENTREE.";
              53: "^[Appuyez sur ESPACE.]"; !*! SVP
        54: "[Commentaire enregistré.]";
        55: "[Commentaire NON enregistré.]";
        56: print ".^";
        57: print "?^";
        ! TODO le reste
        58: print (The) actor, " ", (IsOrAre) actor, " incapable de faire cela.^";
		59:	"Vous devez indiquer un nom après ce verbe.";
		60:	"Vous ne devez pas indiquer un nom avec ce verbe.";
		61:	"Vous devez indiquer un objet."; ! You must name an object
		62:	"Vous ne devez pas indiquer d'objet."; ! You may not name an object
		63:	"Vous devez indiquer un second objet."; ! You must name a second object
		64:	"Vous ne devez pas indiquer de second objet."; ! You may not name a second object
		65:	"Vous devez indiquer un second nom avec ce verbe.";
		66:	"Vous ne devez pas indiquer un second nom."; ! You may not supply a second noun
		67:	"Vous devez indiquer un nom plus précis."; !You must name something more substantial
		68:	print "(", (The) actor, " prenant d'abord ", (the) x1, ")^";
        69: "(prenant d'abord ", (the) x1, ")";
        70: "L'utilisation de UNDO n'est pas autorisée dans ce jeu.";
        71: print (string) DARKNESS__TX;
  		72: print (The) x1;
            if (x1 has pluralname) print " ont"; else print " a";
            " mieux à faire.";
        73: "Ce nom n'a pas de sens dans ce contexte."; ! That noun did not make sense in this context.
        74: print "[Cette commande demande de faire quelque chose en dehors du jeu, aussi elle n'a de sens que de vous à moi. Il ne peut être demandé de faire cela à ce ou ces personnes : ", (The) x1, "^"; ! print "[That command asks to do something outside of play, so it can only make sense from you to me. ", (The) x1, " cannot be asked to do this.]^";
    }
  Yes, No:        "Mmmh ?";
  NotifyOff:      "Notification du score désactivée.";
  NotifyOn:       "Notification du score activée.";
!   Objects: switch(n)
!            {   1: "Objets ayant été portés :^";
!                2: "Aucun.";
!                3: print "   (sur le corps)";
!                4: print "   (dans l'inventaire)";
!                5: print "   (abandonné",(es) x1,")";
!                6: print "   (", (name) x1, ")";
!                7: print "   (dans ", (the) x1, ")";
!                8: print "   (dans ", (the) x1, ")";
!                9: print "   (sur ", (the) x1, ")";
!               10: print "   (perdu",(es) x1,")";
!            }
  Open: switch (n) {
               1: "Il ne peut pas ouvrir cela.";
		2: if (x1 has pluralname) 
			{print (cthatorthose) x1," semble être fermé",(es) x1," à clé.^";} 
			else 
			{print (cthatorthose) x1," semble être fermé",(es) x1," à clé.^";};
!               2: print_ret (cthatorthose) x1," semble",(nt) x1,
!                  " être fermé",(es) x1," à clé.";
               3: print (ctheyreorthats) x1, " déjà ouvert";
                  if (x1 has female) "e.";
                  ".";
               4: print "Il ouvre ", (the) x1, ", révélant ";
                  if (WriteListFrom(child(x1),
                      ENGLISH_BIT + TERSE_BIT + CONCEAL_BIT)==0) "rien du tout.";
                  ".";
               5: "Il ouvre ", (the) x1, ".";
    }
!   Order:          print (The) x1;
!                   if (x1 has pluralname) print " ont"; else print " a";
!                   " mieux à faire.";
!   Places: switch (n) {
!         1:  print "Il a visité : ";
!         2:  print ".^";
!     }
!   Pray:           "Rien de pratique ne résulte de cette prière.";
!   Prompt:   print "^>";
  Pronouns: switch (n) {
               1: print "En ce moment, ";
               2: print "signifie ";
               3: print "est enlevé";
               4: "aucun pronom n'est connu du jeu.";
        5:  ".";
    }
  Pull,Push,Turn: switch (n) {
               1: "C'est fixé sur place.";
               2: "Il en est incapable.";
               3: "Rien d'évident ne se produit.";
               4: "Cela est moins que courtois.";
    }
! Push: see Pull
  PushDir: switch (n) {
               1: "Cette idée fantasque disparaît rapidement";
               2: "Ce n'est pas une direction.";
               3: "Il ne peut pas aller dans cette direction.";
    }
  PutOn: switch (n) {
               1: "Il doit avoir en main ", (the) x1,
                  " avant de pouvoir ", (itorthem) x1,
                  " mettre sur quelque chose d'autre.";
               2: "Il ne peut pas poser un objet sur lui-même.";
               3: "Poser des objets sur ", (the) x1, " ne mène à rien.";
               4: "Il manque de dextérité.";
               5: "(", (itorthem) x1, " prenant d'abord)^";
               6: "Il n'y a plus assez de place sur ", (the) x1, ".";
               7: "Cela est fait.";
               8: "Il met ", (the) x1, " sur ", (the) second, ".";
    }
  Quit: switch (n) {
               1: print "Répondez par oui ou par non, je vous prie.";
               2: print "Êtes-vous certain de vouloir quitter ? ";
    }
  Remove: switch (n) {
               1: if (x1 has pluralname)
		      print "Ils sont malheureusement fermés."; !*! elle(s)
		      else print "Il est malheureusement fermé."; !*!
               2: if (x1 has pluralname)
                      print "Mais ils ne sont pas";
                  else print "Mais ce n'est pas";
                  " ici maintenant.";
               3: "Très bien.";
    }
  Restart: switch (n) {
               1: print "Êtes-vous sûr de vouloir recommencer ? ";
               2: "Raté.";
    }
  Restore: switch (n) {
               1: "Échec du chargement.";
               2: "^--- La partie a bien été restaurée ---^";
    }
  Rub:            "Il n'arrive à rien ainsi.";
  Save: switch (n) {
               1: "La sauvegarde a échoué.";
               2: "^--- La partie a bien été sauvegardée ---^";
    }
  Score: switch (n) {
        1:  if (deadflag) print "Dans cette histoire il a obtenu "; else print "Dans cette histoire il a jusqu'à présent obtenu ";
            print score, " sur un score possible de ", MAX_SCORE, ", en ", turns, " tour";
            if (turns ~= 1) print "s";
            return;
        2:  "Il n'y a pas de score dans cette histoire.";
    }
  ScriptOff: switch (n) {
               1: "Aucune transcription en cours.";
               2: "^Fin de transcription.";
               3: "Impossible de terminer la transcription.";
    }
  ScriptOn: switch (n) {
               1: "Transcription déjà en cours.";
               2: "Début d'une transcription de...";
               3: "Impossible de commencer la transcription.";
    }
  Search: switch (n) {
               1: "Mais il fait noir !";
               2: "Il n'y a rien sur ", (the) x1, ".";
               3: print "Sur ", (the) x1, ", il voit "; 
                  WriteListFrom(child(x1),
                      TERSE_BIT + ENGLISH_BIT + CONCEAL_BIT);
                  ".";
               4: if (x1 has animate) "Il sait tenir ses mains tranquilles !";
                  else "Il ne trouve rien d'intéressant.";
               5: "Il ne peut voir à l'intérieur, puisque ", (the) x1, " ",
                  (isorare) x1, " fermé",(es) x1,".";
               6: print_ret (The) x1, " ", (isorare) x1, " vide",(s) x1,".";
               7: print (The) x1;
                  if (x1 has pluralname) print " contiennent ";
                  else print " contient ";
                  WriteListFrom(child(x1),
                      TERSE_BIT + ENGLISH_BIT + CONCEAL_BIT);
                  ".";
    }
!  Set:            "Non, il ne peut pas ", (itorthem) x1, " régler.";
  SetTo:          "Non, il ne peut pas ", (itorthem) x1, " régler sur rien.";
  Show: switch (n) {
               1: "Il n'a pas ", (the) x1, ".";
               2: print_ret (The) x1, " ", (isorare) x1, " peu impressionné",(es) x1,".";
    }
  Sing:           "Il ne sait pas chanter.";
  Sleep:          "Il n'a pas particulièrement sommeil.";
  Smell:          "Il ne sent rien de particulier.";
  Sorry:          "Faute avouée est à moitié pardonnée.";
  Squeeze: switch (n) {
               1: "Inutile.";
               2: "Il n'arrive à rien ainsi.";
    }
  Strong:         "Les vrais aventuriers n'emploient pas un tel langage.";

!  Swim:           "Il n'y a pas assez d'eau pour nager dedans.";  ! swim desactive par defaut dans I7

  Swing:          "Ce n'est pas une chose à laquelle il est utile de se balancer.";
  SwitchOff: switch (n) {
               1: "Il ne peut pas allumer ou éteindre cela.";
               2: print_ret (ctheyreorthats) x1,
                  " déjà éteint",(es) x1,".";
               3: "Il éteint ", (the) x1, ".";
    }
  SwitchOn: switch (n) {
               1: "Il ne peut pas allumer cela.";
               2: print_ret (ctheyreorthats) x1,
                  " déjà allumé",(es) x1,".";
               3: "Il allume ", (the) x1, ".";
    }
	  Take:    switch(n)
           {   1: "D'accord."; ! ok
               2: "Il est déjà lui-même.";
               3: "Cela ne semble pas être une bonne idée.";
               4: print "Il doit d'abord ";
                  if (x1 has supporter) print "descendre "; else print "sortir ";
                  print_ret (dedudes) x1, ".";
               5: "Il l'a déjà.";
               6: if (noun has pluralname) print "Cela semble ";
                  else print "Cela semble ";
                  "appartenir à ", (the) x1, ".";
               7: if (noun has pluralname) print "Cela semble ";
                  else print "Cela semble ";
                  "faire partie ", (dedudes) x1, ".";
               8: print_ret (Cthatorthose) x1, " ", (isorarenot) x1,
                  " disponible", (s) x1, ".";
               9: print_ret (The) x1, " ", (isorarenot) x1, " ouvert",(es) x1,".";
              10: "Trop difficile à transporter.";
              11: "C'est fixé sur place.";
              12: "Il transporte déjà trop d'objets.";
              13: "(il met ", (the) x1, " dans ", (the) SACK_OBJECT,
                  " pour faire de la place)";
           }
  Taste:          "Il ne remarque rien de particulier.";
  Tell: switch (n) {
               1: "Il discute avec lui-même pendant un moment...";
               2: "Pas de réaction.";
    }
  Think:          "Quelle bonne idée.";
  ThrowAt: switch (n) {
               1: "Futile.";
               2: "Il hésite au moment crucial.";
    }
! Tie:  see JumpOver.
  Touch: switch (n) {
               1: "Il sait tenir ses mains tranquilles !";
               2: "Il ne sent rien de particulier.";
               3: "Il n'y voit aucune utilité.";
    }
! Turn: see Pull.
  Unlock:  switch (n) {
               1: "Il ne peut pas déverrouiller cela.";
               2: print_ret (ctheyreorthats) x1,
                  " déjà déverrouillé", (es) x1, ".";
               3: "Cela ne rentre pas dans la serrure.";
               4: "Il déverrouille ", (the) x1, ".";
    }
!  VagueGo:  "Il fallait donner une direction plus précise.";
  Verify: switch (n) {
               1: "Le fichier semble intact.";
               2: "Le fichier est certainement corrompu !";
    }
  Wait:           "Le temps passe...";
  Wake:           "Il ne dort pas.";
  WakeOther:      "Cela ne semble pas nécessaire.";
  Wave: switch (n) {
               1: "Mais il n'a pas cela !";
               2: "Inutile.";
    }
  WaveHands:      "Il agite ses mains, sans résultat.";
  Wear: switch (n) {
               1: "Il ne peut pas porter cela !";
               2: "Il n'a pas cela !";
               3: "Il ", (itorthem) x1, " porte déjà !";
               4: "Il met ", (the) x1, ".";
    }
! Yes:  see No.
];

! fin test French3PSPa

#Endif; 

![ ========================================================= ]


!Ifnot; ! Pour la version 'normale' (2ème personne pluriel (vous) au présent)
#IfDef French;

[ LanguageLM n x1 x2;
#ifdef NI_BUILD_COUNT; say__p = 1; #endif;
    Answer, Ask:    "Pas de réponse.";
!    Ask:      see Answer
    Attack:         "La violence n'est pas une solution ici.";
!    Blow:           "Vous ne pouvez pas utilement souffler dedans.";
    Burn:           "Cet acte dangereux ne mènerait pas à grand-chose.";
    Buy:            "Il n'y a rien à vendre, ici.";
    Climb:          "Je ne pense pas que l'on puisse arriver à grand-chose de cette manière.";
    Close: switch (n) {
        1:  "Vous ne pouvez pas fermer cela.";
        2:  print (ctheyreorthats) x1, " déjà fermé";
            if (x1 has female) "e.";
            ".";
        3:  "Vous fermez ", (the) x1, ".";
    }
   ! CommandsOff: switch (n) {
   !     1:  "[Enregistrement des commandes désactivé.]";
   !     #Ifdef TARGET_GLULX;
   !     2:  "[Enregistrement des commandes déjà désactivé.]";
   !     #Endif; ! TARGET_
   ! }
   ! CommandsOn: switch (n) {
   !     1:  "[Enregistrement des commandes activé.]";
   !     #Ifdef TARGET_GLULX;
   !     2:  "[Les commandes sont actuellement en train d'être rejouées.]";
   !     3:  "[Enregistrement des commandes déjà activé.]";
   !     4:  "[Echec d'enregistrement des commandes.]";
   !     #Endif; ! TARGET_
   ! }
   ! CommandsRead: switch (n) {
   !     1:  "[Rejouer les commandes.]";
   !     #Ifdef TARGET_GLULX;
   !     2:  "[Les commandes sont déjà en train d'être rejouées.]";
   !     3:  "[Rejouer les commandes a échoué.  L'enregistrement des commandes est activé.]";
   !     4:  "[Rejouer les commandes a échoué.]";
   !     5:  "[Rejouer les commandes achevé.]";
   !     #Endif; ! TARGET_
   ! }
   ! suite pb compil I7
    Consult:        "Vous ne trouvez rien d'intéressant dans ", (the) x1, ".";
!    CrierSansPrecision : "Vous criez ce qui vous passe par la tête.";
    Cut:            "Allons, ", (itorthem) x1, " couper ne mènerait pas à grand-chose.";
!    Dig:            "Creuser ne mènerait à rien ici.";
    Disrobe: switch (n) {
        1:  "Vous ne ", (itorthem) x1, " portez pas.";
        2:  "Vous enlevez ", (the) x1, ".";
    }
    Drink:          "Il n'y a rien de buvable ici.";
    Drop: switch (n) {
        1:  if (x1 has pluralname) print (The) x1, " sont ";
            else print (The) x1, " est ";
            "déjà ici.";
        2:  "Vous n'avez pas ça.";
        
        3:  print "(vous prenez d'abord en main ", (the) x1, ")^"; say__p = 0; return;
       
        4:  "D'accord."; ! ok
    }
    Eat: switch (n) {
        1:  print_ret (ctheyreorthats) x1,
            " non comestible",(s) x1,", selon toute évidence.";
        2:  "Vous mangez ", (the) x1, ". Pas mauvais.";
    }
!    EmptyT: switch (n) {
!       1:  print_ret (The) x1, " ne peut rien contenir."; ! TODO risque de poser pb si pluriel ?
 !       2:  print_ret (The) x1, " ", (isorare) x1, " fermé",(es) x1,".";
 !       3:  print_ret (The) x1, " ", (isorare) x1, " déjà vide",(s) x1,".";
 !       4:  "Ceci ne viderait rien.";
 !  }
 ! suite pb compil I7
  
    Enter: switch (n) {
        1:  print "Mais vous êtes déjà ";
            if (x1 has supporter) print "sur "; else print "dans ";
            print_ret (the) x1, ".";
        2:  print "Vous ne pouvez pas ";
            switch (verb_word) {
                'entrer':    "y entrer.";
                'asseoir':    "vous y asseoir.";
                'allonger':    "vous y allonger.";
                'coucher':    "vous y coucher.";
		'monter':    "y monter.";
                default:  "y aller."; ! plutôt que "y entrer." !*!
            }
        3:  "Vous ne pouvez entrer dans ", (the) x1, " fermé",(es) x1,".";
        4:  print "Vous ne pouvez pas ";                  
            if (x1 has supporter) print "y monter";
                             else print "y entrer";
            " si ce n'est pas posé."; 
                        ! sur pieds, non encastré (freestanding)
        5:  print "Vous ";
            if (x1 has supporter) print "montez sur "; else print "entrez dans ";
            print_ret (the) x1, ".";

        6:  print "(";
            if (x1 has supporter) print "descendant "; else print "sortant ";
            print (DeDuDes) x1; print ")^"; say__p = 0; return;
        7:  say__p = 0;
            if (x1 has supporter) "(montant sur ", (the) x1, ")^";
            if (x1 has container) "(entrant dans ", (the) x1, ")^";
            "(entrant dans ", (the) x1, ")^";
    }
    Examine: switch (n) {
        1:  "Vous ne pouvez rien voir.";
        2:  "Rien de particulier concernant ", (the) x1, ".";
        3:  print (The) x1, " ", (isorare) x1, " actuellement ";
            if (x1 has on) "allumé",(es) x1,"."; else "éteint",(es) x1,".";
            4:	print (The) actor, " looks closely at ", (the) x1, ".^";  
               5:  "En dépit de vos efforts, vous ne voyez rien de particulier dans cette direction.";
    }
    Exit: switch (n) {
        1:  "Sortir d'où ?!";
        2:  print "Vous ne pouvez pas sortir ";
            print_ret (dedudes) x1, " fermé", (es) x1, ".";
        3:  print "Vous ";
            if (x1 has supporter) print "descendez "; else print "sortez ";
            print_ret (dedudes) x1, ".";
        4:  print "Mais vous n'êtes pas ";
            if (x1 has supporter) print "sur "; else print "dans ";
            print_ret (the) x1, ".";
    }
!    Fill:           "Mais il n'y a pas d'eau à porter ici.";
!    FullScore: switch(n) {   
!        1:  if (deadflag) print "Le score était ";
!            else          print "Le score est ";
!            "composé comme suit :^";
!        2:  "trouver divers objets";
!        3:  "visiter différents endroits";
!        4:  print "total (sur ", MAX_SCORE; ")";
!    }
 ! suite pb compil I7
    GetOff:         "Mais vous n'êtes pas sur ", (the) x1, " en ce moment.";
    Give: switch (n) {
        1:  "Vous n'avez pas en main ", (the) x1, ".";
        2:  "Vous jonglez avec ", (the) x1,
            " pendant un moment, mais vous n'arrivez pas à grand-chose.";
        3:  print (The) x1;
            if (x1 has pluralname)
                print " n'ont pas l'air intéressé";
            else print " n'a pas l'air intéressé";
            ".";
    }
    Go: switch (n) {
        1:  print "Vous devez d'abord ";
            if (x1 has supporter) print "descendre "; else print "sortir ";
            print_ret (dedudes) x1, ".";
        2:  "Vous ne pouvez pas aller par là.";
        3:  "Vous êtes incapable de gravir ", (the) x1, ".";
        4:  "Vous êtes incapable de descendre par ", (the) x1, ".";
        5:  "Vous ne pouvez pas, puisque ", (the) x1, " ", (isorare) x1,
            " sur votre chemin.";
        6:  print "Vous ne pouvez pas, puisque ", (the) x1;
            if (x1 has pluralname) " ne mènent nulle part.";
            " ne mène nulle part.";
    }
    Insert: switch (n) {
        1: "Vous devez avoir en main ", (the) x1,
            " avant de pouvoir ", (itorthem) x1,
            " mettre dans autre chose.";
        2:  if (x1 has pluralname) 
            print_ret (The) x1, " ne peuvent pas contenir d'objet.";
            else  
            print_ret (The) x1, " ne peut pas contenir d'objet.";
        3:  print_ret (The) x1, " ", (isorare) x1, " fermé",(es) x1,".";
        4:  "Vous avez besoin de ", (itorthem) x1, " prendre d'abord.";
        5:  "Vous ne pouvez pas mettre un objet à l'intérieur de lui-même.";
        6:  "(", (itorthem) x1, " prenant d'abord)^";
        7:  "Il n'y a plus de place dans ", (the) x1, ".";
        8:  "Fait.";
        9:  "Vous mettez ", (the) x1, " dans ", (the) second, ".";
    }
    Inv: switch (n) {
        1:  "Vous n'avez rien.";
        2:  print "Vous avez";
        3:  print ":^";
        4:  print ".^";
    }
    Jump:           "Vous sautez sur place, vainement.";
   ! JumpOver:  "Vous n'arriverez à rien comme ça.";
    Tie:  "Vous n'arriverez à rien comme ça.";
    Kiss:           "Concentrez-vous sur le jeu.";
    Listen:         "Vous n'entendez rien de particulier.";
    ListMiscellany: switch (n) {
         1: print " (allumé",(es) x1,")";

		2: print " (fermé",(es) x1,")";
		4: print " (vide",(s) x1,")";
		6: print " (fermé",(es) x1," et vide",(s) x1,")";

		3: print " (fermé",(es) x1," et allumé",(es) x1,")";
		5: print " (vide",(s) x1," et allumé",(es) x1,")";
		7: print " (fermé",(es) x1,", vide",(s) x1," et allumé",(es) x1,")";
         8: print " (allumé",(es) x1," et porté",(es) x1;
         9: print " (allumé",(es) x1;
        10: print " (porté",(es) x1;
        11: print " (qui ", (isorare) x1, " ";
        12: print "ouvert",(es) x1;
        13: print "ouvert",(es) x1," mais vide",(s) x1;
        14: print "fermé",(es) x1;
        15: print "fermé",(es) x1," et verrouillé",(es) x1;
        16: print " et vide",(s) x1;
        17: print " (qui ", (isorare) x1, " vide",(s) x1,")";
        18: print " contenant ";
        19: print " (supportant "; ! " (sur ";
        20: print " supportant ";  ! " sur "; 
        21: print " (contenant ";  ! " (dans ";
        22: print " contenant ";   ! " dans ";
    }
    LMode1:         " est passé en mode description normale ; seuls les lieux 
                      visités pour la première fois sont décrits en détail.";
    LMode2:         " est passé en mode description longue ; tous les lieux,
                      même déjà visités, sont décrits en détail.";
    LMode3:         " est passé en mode description courte ; tous les lieux,
                      même non visités, sont décrits brièvement.";
    Lock: switch (n) {
        1:  "Vous ne pouvez pas verrouiller cela.";
        2:  print_ret (ctheyreorthats) x1, " verrouillé en ce moment.";
        3:  "Vous devez fermer ", (the) x1, " d'abord.";
        4:  "Cela ne rentre pas dans la serrure.";
        5:  "Vous verrouillez ", (the) x1, ".";
    }
    Look: switch (n) {
        1:  print " (sur ", (the) x1, ")";
        2:  print " (dans ", (the) x1, ")";
        3:  print " (comme ", (object) x1, ")";
        4:  print "^Sur ", (the) x1, ", ";
            WriteListFrom(child(x1),
                ENGLISH_BIT + RECURSE_BIT + PARTINV_BIT
                + TERSE_BIT + CONCEAL_BIT);
            ".";
        5,6:
            if (x1 ~= location) {
                if (x1 has supporter) print "^Sur "; else print "^Dans ";
                print (the) x1, " vous";
            }
            else print "^Vous";
            print " pouvez voir ";
            if (n == 5) print "aussi ";
            WriteListFrom(child(x1),
              ENGLISH_BIT+RECURSE_BIT+PARTINV_BIT+TERSE_BIT+CONCEAL_BIT+WORKFLAG_BIT);
            ".";
        7:  "Vous ne voyez rien de particulier dans cette direction.";
    }
    LookUnder: switch (n) {
        1:  "Mais il fait noir !";
        2:  "Ces recherches sont vaines.";
        !Cette action n'aboutit à aucune découverte notable.
    }
    Mild:           "Assez.";
    Miscellany: switch (n) {
        1:  "(affichage des seize premiers)^";
        2:  "Rien à faire !";
        3:  print " Vous êtes mort ";
        4:  print " Vous avez gagné ";
        5:  print "^Voulez-vous RECOMMENCER, CHARGER une partie sauvegardée";
            #IFDEF DEATH_MENTION_UNDO;
            print ", ANNULER votre dernière action";
            #ENDIF;
            if (TASKS_PROVIDED==0)
                print ", obtenir le score détaillé pour cette partie (FULLSCORE)";
            if (deadflag==2 && AMUSING_PROVIDED==0)
                print ", lire quelques suggestions amusantes (AMUSING)";
            " ou QUITTER ?"; !*!
        6:  "[Votre interpréteur ne permet pas d' ~annuler~. Désolé !]";
        #Ifdef TARGET_ZCODE;
        7:  "~Annuler~ a échoué.  [Tous les interpréteurs ne le permettent pas.]";
        #Ifnot; ! TARGET_GLULX
        7:  "[Vous ne pouvez pas ~Annuler~ plus loin.]";
        #Endif; ! TARGET_
        8:  "Faites un choix parmi les propositions ci-dessus.";
        9:  "^Vous êtes à présent plongé dans l'obscurité !";
        10: "Je vous demande pardon ?";
        11: "[Vous ne pouvez pas annuler alors que rien n'a encore été fait !]";
        12: "[Impossible d'annuler deux fois de suite. Désolé !]";
        13: "[Action précédente annulée.]";
        14: "Désolé, impossible de corriger.";
        15: "N'y pensez même pas."; !*! "Think nothing of it."; !*!
        16: "~Oops~ ne peut corriger qu'un seul mot.";
        17: "Il fait noir, et vous ne pouvez rien voir.";
        18: print "vous-même";
        19: "Aussi beau que d'habitude.";
        20: "Pour répéter une commande comme ~grenouille, saute~, dites seulement
            ~encore~, et pas ~grenouille, encore~.";
        21: "Vous pouvez difficilement répéter cela.";
        22: "Vous ne pouvez pas commencer par une virgule.";
        23: "Vous semblez vouloir parler à quelqu'un, mais je ne vois pas à qui.";
        24: "Vous ne pouvez pas discuter avec ", (the) x1, ".";
            ! "parler à" serait mieux mais délicat (ex: à l'oiseau)
        25: "Pour parler à quelqu'un, essayez ~quelqu'un, bonjour~ ou quelque chose dans le genre.";
       !  26: "(vous prenez d'abord ", (the) not_holding, ")";
        26: "(vous prenez d'abord cela.)";
        27: "Je ne comprends pas cette phrase.";
        28: print "Merci de reformuler. Je n'ai compris que : ";
        29: "Je n'ai pas compris ce nombre.";
        30: "Vous ne voyez rien de tel, à moins que cela ne soit sans grande importance.";
        31: "Vous semblez en avoir dit trop peu !";
        32: "Vous ne l'avez pas dans vos mains !";
        33: "Vous ne pouvez pas employer le mot ~tout~ (ou une liste) avec ce verbe.";
        34: "Vous ne pouvez utiliser le mot ~tout~ (ou une liste) qu'une fois par ligne.";
        35: "Je ne suis pas sûr de ce à quoi ~", (address) pronoun_word,
            "~ se réfère.";
        36: "Vous avez exclu quelque chose qui n'était de toute façon pas compris dans la liste !";
        37: "Vous ne pouvez agir ainsi qu'avec une chose animée.";
        38: "Je ne connais pas ce verbe.";
        39: "Ce n'est pas une chose à laquelle vous aurez à vous référer
            au cours du jeu.";
        40: "Vous ne pouvez voir ~", (address) pronoun_word,
            "~ (", (the) pronoun_obj, ") pour l'instant.";
        41: "Impossible de comprendre la fin de la phrase.";
        42: if (x1==0) print "Aucun de disponible.";
            else print "Il en reste seulement ", (number) x1, ".";
        43: "Rien à faire !";
        44: "Rien n'est disponible !";
        45: print "Précisez : "; !*!
        46: print "Précisez : "; !*!
        47: "Désolé, vous pouvez seulement avoir un objet ici. Lequel voulez-vous exactement ?";
        48: print "Pouvez-vous préciser ce qui est concerné par cette action ?^"; !*!
!        49: print "Pouvez-vous préciser le nom de l'objet à utiliser ?^"; !*!
		49: print "Pouvez-vous préciser ce qui est concerné par cette action ?^";
        50: print "Votre score vient ";
            if (x1 > 0) print "d'augmenter"; else { x1 = -x1; print "de diminuer"; }
            print " de ", (number) x1, " point";
            if (x1 > 1) print "s";
        51: "(Comme quelque chose de dramatique vient de se produire,
            votre liste de commandes a été raccourcie.)";
        52: "^Tapez un nombre entre 1 et ", x1,
            ", 0 pour réafficher ou appuyez sur ENTREE.^";
        53: "^[Appuyez sur ESPACE.]"; !*! SVP
        54: "[Commentaire enregistré.]";
        55: "[Commentaire NON enregistré.]";
        56: print ".^";
        57: print "?^";
        ! TODO le reste
        58: print (The) actor, " ", (IsOrAre) actor, " incapable de faire cela.^";
		59:	"Vous devez indiquer un nom après ce verbe.";
		60:	"Vous ne devez pas indiquer un nom avec ce verbe.";
		61:	"Vous devez indiquer un objet."; ! You must name an object
		62:	"Vous ne devez pas indiquer d'objet."; ! You may not name an object
		63:	"Vous devez indiquer un second objet."; ! You must name a second object
		64:	"Vous ne devez pas indiquer de second objet."; ! You may not name a second object
		65:	"Vous devez indiquer un second nom avec ce verbe.";
		66:	"Vous ne devez pas indiquer un second nom."; ! You may not supply a second noun
		67:	"Vous devez indiquer un nom plus précis."; !You must name something more substantial
		68:	print "(", (The) actor, " prenant d'abord ", (the) x1, ")^";
        69: "(prenant d'abord ", (the) x1, ")";
        70: "L'utilisation de UNDO n'est pas autorisée dans ce jeu.";
        71: print (string) DARKNESS__TX;
  		72: print (The) x1;
            if (x1 has pluralname) print " ont"; else print " a";
            " mieux à faire.";
        73: "Ce nom n'a pas de sens dans ce contexte."; ! That noun did not make sense in this context.
        74: print "[Cette commande demande de faire quelque chose en dehors du jeu, aussi elle n'a de sens que de vous à moi. Il ne peut être demandé de faire cela à ce ou ces personnes : ", (The) x1, "^"; ! print "[That command asks to do something outside of play, so it can only make sense from you to me. ", (The) x1, " cannot be asked to do this.]^";
    }
    Yes, No:        "Mmmh ?";
    NotifyOff:      "Notification du score désactivée.";
    NotifyOn:       "Notification du score activée.";
!    Objects: switch(n) {
!        1:  "Objets ayant été portés :^";
 !       2:  "Aucun.";
!        3:  print "   (sur le corps)";
!        4:  print "   (dans l'inventaire)";
!        5:  print "   (abandonné",(es) x1,")";
!        6:  print "   (", (name) x1, ")";
!        7:  print "   (dans ", (the) x1, ")";
!        8:  print "   (dans ", (the) x1, ")";
!        9:  print "   (sur ", (the) x1, ")";
!        10: print "   (perdu",(es) x1,")";
 !   }
 ! suite pb compil I7
    Open: switch (n) {
!        1: "Vous ne pouvez pas ouvrir cela.";
        1:  print_ret "Vous ne pouvez pas ouvrir ", (the) x1,".";
        2:  print_ret (cthatorthose) x1," semble",(nt) x1,
            " être fermé",(es) x1," à clé.";
        3:  print (ctheyreorthats) x1, " déjà ouvert";
            if (x1 has female) "e.";
            ".";
        4:  print "Vous ouvrez ", (the) x1, ", révélant ";
            if (WriteListFrom(child(x1),
                ENGLISH_BIT + TERSE_BIT + CONCEAL_BIT)==0) "rien du tout.";
            ".";
        5:  "Vous ouvrez ", (the) x1, ".";
    }
 !   Order:  print (The) x1;
 !           if (x1 has pluralname) 
 !               print " ont"; else print " a";
 !               " mieux à faire.";
  !  suite pb compil I7
  !  ParlerIncorrect : "Soyez plus précis dans votre communication, ou reformulez.";
  !  ParlerSansPrecision :   if (noun==player) "Vous ne savez pas quoi vous dire que vous ne sachiez déjà.";
   !                         else "Pas de réponse.";
  !  Places: switch (n) {
  !      1:  print "Vous avez visité : ";
  !      2:  print ".^";
  !  }
!    Pray:   "Rien de concret ne résulte de votre prière.";
 !   Prompt:   print "^>";
 ! I7
    Pronouns: switch (n) {
        1:  print "En ce moment, ";
        2:  print "signifie ";
        3:  print "n'est pas défini";
        4:  "aucun pronom n'est connu du jeu.";
        5:  ".";
    }
    Pull,Push,Turn: switch (n) {
        1:  "C'est fixé sur place.";
        2:  "Vous en êtes incapable.";
        3:  "Rien d'évident ne se produit.";
        4:  "Cela serait moins que courtois.";
        ! TODO
        5:	print (The) actor, " pulls ", (the) x1, ".^";
		6:	print (The) actor, " pushes ", (the) x1, ".^";
		7:	print (The) actor, " turns ", (the) x1, ".^";
    }
! Push: see Pull
    PushDir: switch (n) {
        1:  "Vous ne pouvez donc rien imaginer de mieux ?";
        2:  "Ce n'est pas une direction.";
        3:  "Vous ne pouvez pas aller dans cette direction.";
    }
    PutOn: switch (n) {
        1: "Vous devez avoir en main ", (the) x1,
            " avant de pouvoir ", (itorthem) x1,
            " mettre sur quelque chose d'autre.";
        2:  "Vous ne pouvez pas poser un objet sur lui-même.";
        3:  "Poser des objets sur ", (the) x1, " ne mènerait à rien.";
        4:  "Vous manquez de dextérité.";
        5:  "(", (itorthem) x1, " prenant d'abord)^";
        6:  "Il n'y a plus assez de place sur ", (the) x1, ".";
        7:  "C'est fait.";
        8:  "Vous mettez ", (the) x1, " sur ", (the) second, ".";
        ! TODO
        9:  print (The) actor, " puts ", (the) x1, " on ", (the) second, ".^";
    }
    Quit: switch (n) {
        1:  print "Répondez par oui ou par non, je vous prie.";
        2:  print "Êtes-vous sûr de vouloir quitter ? (O/N) ";
    }
    Remove: switch (n) {
        1:  if (x1 has pluralname)
                print "Ils sont malheureusement fermés."; !*! elle(s)
                else print "Il est malheureusement fermé."; !*!
        2:  if (x1 has pluralname)
                print "Mais ils ne sont pas";
            else print "Mais ce n'est pas";
            " ici maintenant.";
        3:  "D'accord."; ! Ok
    }
    Restart: switch (n) {
        1: print "Êtes-vous sûr de vouloir recommencer ? (O/N) ";
        2: "Raté.";
    }
    Restore: switch (n) {
        1: "Échec du chargement.";
        2: "^--- La partie a bien été restaurée ---^"; ! ok.
    }
    Rub:            "Vous n'arrivez à rien comme ça.";
    Save: switch (n) {
        1: "La sauvegarde a échoué.";
        2: "^--- La partie a bien été sauvegardée ---^"; ! ok.
    }
    Score: switch (n) {
        1:  if (deadflag) print "Dans cette partie vous avez obtenu "; else print "Vous avez jusqu'à présent obtenu ";
            print score, " sur un score possible de ", MAX_SCORE, ", en ", turns, " tour";
            if (turns ~= 1) print "s";
            return;
        2:  "Il n'y a pas de score dans cette histoire.";
         ! TODO
         3:	print ", vous donnant le niveau de ";
    }
    ScriptOff: switch (n) {
        1:  "Aucune transcription en cours.";
        2:  "^Fin de transcription.";
        3:  "Impossible de terminer la transcription.";
    }
    ScriptOn: switch (n) {
        1:  "Transcription déjà en cours.";
        2:  "Début d'une transcription de...";
        3:  "Impossible de commencer la transcription.";
    }
    Search: switch (n) {
        1:  "Mais il fait noir !";
        2:  "Il n'y a rien sur ", (the) x1, ".";
        3:  print "Sur ", (the) x1, ", vous voyez "; 
            WriteListFrom(child(x1),
                TERSE_BIT + ENGLISH_BIT + CONCEAL_BIT);
            ".";
        4:  if (x1 has animate) "Tenez donc vos mains tranquilles.";
            else "Vous ne trouvez rien d'intéressant.";
        5:  "Vous ne pouvez pas voir à l'intérieur, puisque ", (the) x1, " ",
            (isorare) x1, " fermé",(es) x1,".";
        6:  print_ret (The) x1, " ", (isorare) x1, " vide",(s) x1,".";
        7:  print (The) x1;
            if (x1 has pluralname) print " contiennent ";
            else print " contient ";
            WriteListFrom(child(x1),
                TERSE_BIT + ENGLISH_BIT + CONCEAL_BIT);
            ".";
    }
  !  Set:            "Non, vous ne pouvez pas ", (itorthem) x1, " régler.";
    SetTo:          "Non, vous ne pouvez pas ", (itorthem) x1, " régler sur rien.";
    Show: switch (n) {
        1:  "Vous n'avez pas ", (the) x1, ".";
        2:  print_ret (The) x1, " ", (isorare) x1, " peu impressionné",(es) x1,".";
    }
    Sing:           "Vous chantez un morceau de la première chanson qui vous vient à l'esprit.";
    Sleep:          "Vous n'avez pas particulièrement sommeil.";
    Smell:          "Vous ne sentez rien de particulier.";
    Sorry:          "Pas grave.";
    Squeeze: switch (n) {
        1:  "Surveillez vos mains.";
        2:  "Vous n'arriverez à rien ainsi.";
    }
    Strong:         "Les vrais aventuriers n'emploient pas un tel langage.";

!  Swim:           "Il n'y a pas assez d'eau pour nager dedans.";  ! swim desactive par defaut dans I7

    Swing:          "Ce n'est pas une chose à laquelle il est utile de se balancer.";
    SwitchOff: switch (n) {
        1:  "Vous ne pouvez pas allumer ou éteindre cela.";
        2:  print_ret (ctheyreorthats) x1,
            " déjà éteint",(es) x1,".";
        3:  "Vous éteignez ", (the) x1, ".";
    }
    SwitchOn: switch (n) {
        1:  "Vous ne pouvez pas allumer cela.";
        2:  print_ret (ctheyreorthats) x1,
            " déjà allumé",(es) x1,".";
        3:  "Vous allumez ", (the) x1, ".";
    }
    Take:    switch(n) {
        1:  "D'accord."; ! ok.
        2:  "Vous vous possédez vous-même. Voilà une problématique relevant de la physique quantique.";
        3:  "Cela ne semble pas être une bonne idée.";
        4:  print "Vous devez d'abord ";
            if (x1 has supporter) print "descendre "; else print "sortir ";
            print_ret (dedudes) x1, ".";
        5:  if (noun has pluralname) print "Vous les avez déjà.^";
            else print "Vous l'avez déjà.^";  
            ! TODO : faire de même pour les autres modes
        6:  "Cela semble appartenir ", (to_the) x1, ".";
        7:  if (noun has pluralname) print "Cela semble ";
            else print "Cela semble ";
            "faire partie ", (dedudes) x1, ".";
        8:  print_ret (Cthatorthose) x1, " ", (isorarenot) x1,
            " disponible", (s) x1, ".";
        9:  print_ret (The) x1, " ", (isorarenot) x1, " ouvert",(es) x1,".";
        10: "Trop difficile à transporter.";
        11: "C'est fixé sur place.";
        12: "Vous transportez déjà trop d'objets.";
        13: "(vous mettez ", (the) x1, " dans ", (the) SACK_OBJECT,
            " pour faire de la place)";
    }
    Taste:          "Vous ne remarquez rien de particulier.";
    Tell: switch (n) {
        1:  "Vous discutez avec vous-même pendant un bon moment...";
        2:  "Pas de réaction.";
    }
    Think:          "Quelle bonne idée.";
    ThrowAt: switch (n) {
        1:  "Futile.";
        2:  "Vous hésitez au moment crucial.";
    }
!    Tie:  see JumpOver.
    Touch: switch (n) {
        1:  "Tenez vos mains tranquilles !";
        2:  "Vous ne sentez rien de particulier.";
        3:  "Si vous pensez que ça peut aider.";
    }
!    Turn: see Pull.
    Unlock:  switch (n) {
        1:  "Vous ne pouvez pas déverrouiller cela.";
        2:  print_ret (ctheyreorthats) x1,
            " déjà déverrouillé", (es) x1, ".";
        3:  "Cela ne rentre pas dans la serrure.";
        4:  "Vous déverrouillez ", (the) x1, ".";
    }
!    VagueDo: "Soyez plus précis."; 
!    VagueGo: "Vous devez donner la direction dans laquelle aller.";
!    VagueDig: "Vous devez indiquer ce que vous souhaitez creuser, et si nécessaire, avec quoi vous voulez le faire.";
!    VagueUse: "Veuillez indiquer un verbe plus précis.";
    Verify: switch (n) {
        1: "Le fichier semble intact.";
        2: "Le fichier est certainement corrompu !";
    }
    Wait:           "Le temps passe...";
    Wake:           "Il ne s'agit pas d'un rêve."; !plus neutre que la formule précédente
    WakeOther:      "Cela ne semble pas nécessaire.";
    Wave: switch (n) {
        1: "Mais vous n'avez pas cela !";
        2: "Vous avez l'air ridicule en agitant ", (the) x1, ".";
    }
    WaveHands:    
        if (x1 == 0 || x1 == player) "Vous agitez vos mains devant vous.";
        else "Vous saluez ", (the) x1, ".";
    Wear: switch (n) {
        1: "Vous ne pouvez pas porter cela !";
        2: "Vous n'avez pas cela !";
        3: "Vous ", (itorthem) x1, " portez déjà !";
        4: "Vous mettez ", (the) x1, ".";
    }
!    Yes:  see No.
];

#Endif; ! Fin du test pour le temps et la personne

-) instead of "Long Texts" in "Language.i6t".

Include (-
Constant LIBRARY_FRENCH;       ! for dependency checking.
-)

French ends here.


---- DOCUMENTATION ----

Inform 7 permet de changer facilement de système de langue comme c'était le cas auparavant avec Inform 6.

Section: Utilisation

Pour utiliser les bibliothèques françaises, il suffit d'inclure dans la source du jeu :

		Include French by Eric Forgeot. 
		Use French Language. 
		(c'est à dire : Seconde personne du pluriel (politesse) au présent.)
		
		ou à la place de "Use French Language." :
		
		Use French 3PSPa Language. 
			(troisième personne du singulier au passé.)
		Use French 3PSPr Language. 
			(troisième personne du singulier au présent.)
		Use French 1PSPa Language. 
			(1ère personne du singulier au passé.)
		Use French 1PSPr Language. 
			(1ère personne du singulier au présent.)


En ayant bien auparavant installé cette extension "French" via la commande >Files>Install extensions d'Inform 7.


Section: Bugs connus

  - [probably somehow deprecated : Certaines rares répliques restent en anglais. Tout implémenter, cela impliquait de remplacer tous ces fichiers dans les définitions livrées avec Inform, juste pour traduire parfois une ou deux phrases, et refaire cela à chaque mise à jour d'inform : Actions.i6  ChooseObjects.i6  Lists.i6  Main.i6  Printing.i6  Relations.i6  Tables.i6  Time.i6  Verbs.i6]

  - Tous les verbes français n'ont pas encore été adapté en Inform 7, ce qui veut dire que si vous voulez en remplacer la définition dans votre jeu, cela produira un bug. Cette adaptation est en cours, pour le moment vous pouvez quand même redéfinir dans votre jeu des verbes comme "descendre", "attaquer", "boire", "manger", "fouiller". Vous pouvez bien entendu utiliser tous les autres verbes non adaptés, mais il ne sera pas possible de modifier leur définition de base pour le moment. (c'est à dire le contexte dans lequel ils seront appelés par le joueur)

  - traitement des heures incomplet (presque fini)

  - plus de * pour les commentaires en transcript

  - obligation de préciser : use french language (ou autre)


Section: Notes 

  (may be deprecated)
Pour utiliser Inform 7 uniquement en ligne de commande, on peut invoquer le compilateur ni avec :
                ./ni -rules ./Inform7/Extensions -package ./Projects/project.inform -extension=z8
                et le compilateur inform avec :
                ./inform-6.31-biplatform -v8 +language_name=French -wSD +include_path=Projects/project.inform/Build/auto.inf project.z8
                

   
Section: Remerciements 
     
Merci à Sarganar et à l'équipe de Rakontointeraktiva pour l'effort commun de nos traductions en différentes langues.
All hails to Sarganar and the Spanish translation team! (http://www.caad.es/informate/infsp/).

Eric Forgeot - http://ifiction.free.fr - http://informfr.tuxfamily.org/

        
Example: * Le Roi de Fihnargaia - Un petit exemple de jeu en français.

	*: "Le Roi de Fihnargaia" by Eric Forgeot

	The story genre is "Aventure".
	The story creation year is 2009.
	The story headline is "Une introduction à la fiction interactive".
	The story description is "La rencontre du héros et de la famille royale".

	Include French by Eric Forgeot.
	Use French Language.

	Use memory economy.
	Use no scoring.

	Use full-length room descriptions. 


	A person can be distracted. A person is usually not distracted.


	Petit Couloir is a room.



	The player is wearing a tablier. The poche is a part of tablier. The poche is a container. Inside poche is a cle. The cle is female. 


	Part 1 - Le Hall

	The Grand Hall de Fihnargaia is a room. "Le Grand Hall de Fihnargaia est luxueusement meublé[if unvisited], vous ne vous lassez jamais de ce spectable grandiose. Vous semblez attendu[end if]. L[']unique sortie est au sud."

	Some meubles are scenery in Grand Hall de Fihnargaia. Understand "meuble" or "meuble luxueux" or "meubles luxueux" as meubles.

	Some gardes are men in Grand Hall de Fihnargaia.

	Some meubles are scenery in Grand Hall de Fihnargaia. Understand "trone" or "trones" as meubles.

	The estrade is a female scenery in Grand Hall de Fihnargaia.

	Instead of opening meubles, say "Vous n[']êtes pas chez vous ici, et vous ne pouvez pas non plus vous permettre de faire comme chez vous devant la famille royales et ses nombreux gardes.".


	The Petit Couloir is south from Grand Hall de Fihnargaia. Petit Couloir is outside from Grand Hall de Fihnargaia.


	The description of Petit Couloir is "Les murs sont couverts de lampes brillant de mille feux. Au nord se trouve le grand hall où vous attend le roi, tandis que le couloir où vous vous trouvez actuellement oblique vers l[']est."


	The hall_decor is scenery in Petit Couloir. Understand "grand hall" or "hall" as hall_decor. The printed name of hall_decor is "hall".

	Some lampes are female device in Petit Couloir. 
	The lampes are undescribed.
	The lampes are fixed in place.
	The lampes are switched on.

	Understand "lampe" as lampes.


	The roi des nains is a man in Grand Hall de Fihnargaia.
	The reine des nains is a woman in Grand Hall de Fihnargaia. 

	The indefinite article of the roi des nains is "le".
	The indefinite article of the reine des nains is "la".

	Instead of examining the Roi des Nains, say "Le roi des nains vous regarde avec bienveillance.".

	Instead of talking to Roi des Nains for the first time, say "[italic type]'Bienvenue à toi Gjörfon, et merci de t'être présenté aussi promptement à ma requête. Si je t[']ai fait quérir, c[']est parce que je connais ton dévouement et ta fidélité en tant que cuisinier en chef de notre domaine. 
	Le mois dernier, tu nous avais servi un excellent hydromel lors de la fête de Räz-Trepft, et je viens d[']apprendre que l[']ambassadeur de la tribu des Flianglii devait venir ici à Fihnargaia en délégation spéciale, dès demain. 
	Pour le recevoir comme il se doit, je souhaite lui présenter cet hydromel qui représente tout notre savoir-faire artisanal.'[roman type][line break]"

	Instead of examining the Reine des Nains, say "La reine fixe les pierres du mur d[']en face.".

	Instead of doing something to pierres when Reine des Nains is not distracted and Roi des Nains is not distracted, say "Il serait inconvenant de tourner ainsi votre dos aux monarques.".

	Instead of throwing tablier at reine des nains:
		say "De rage mais sans raison apparente, vous jetez votre tablier à la figure de la Reine. Son époux, malgré sa bonhommie légendaire, s[']en offusque, et il vous fait jeter dans les cachots sombres de Fihnargaia. [Line Break]Six mois plus tard, vous revoilà devant lui.".

	Instead of kissing reine des nains:
		say "Sans raison apparente, vous vous jetez comme un malotru au cou de la Reine, et l[']embrassez sur la bouche. Le Roi, malgré sa bonhommie légendaire, s[']en offusque, et il vous fait jeter dans les cachots sombres de Fihnargaia. [Line Break]Six mois plus tard, vous revoilà devant lui.".

	Instead of waving hands to reine des nains:
		say "Vous saluez la Reine, mais sans le faire exprès, votre geste est pris pour un bras d[']honneur. Le Roi, malgré sa bonhommie légendaire, s[']en offusque, et il vous fait jeter dans les cachots sombres de Fihnargaia.[Line Break]Six mois plus tard, vous revoilà devant lui.".

	Instead of giving tablier to reine des nains:
		say "Vous détachez votre tablier pour le présenter à la Reine, mais maladroit comme vous l[']êtes, vous détachez en même temps votre pantalon qui tombe à vos pied. La Reine n[']a pas l[']air intéressé. Le Roi, malgré sa bonhommie légendaire, s[']en offusque (ou est vaguement jaloux), et il vous fait jeter dans les cachots sombres de Fihnargaia.[Line Break]Six mois plus tard, vous revoilà devant lui.".

	Before showing tablier to reine des nains for the first time:
		say "Vous détachez votre tablier pour le présenter à la Reine, mais maladroit comme vous l[']êtes, vous détachez en même temps votre pantalon qui tombe à vos pied.";
		try showing tablier to reine des nains;
	[continue the action;]
	[La Reine des nains est peu impressionnée. ]
		say "Le Roi, malgré sa bonhommie légendaire, s[']en offusque (ou est vaguement jaloux), et il vous fait jeter dans les cachots sombres de Fihnargaia.[Line Break]Six mois plus tard, vous revoilà devant lui.";
		stop the action.
	[TODO : faire test pour vérifier féminin : impressionnée etc]

	Instead of attacking reine des nains:
		say "Vous montez sur l[']estrade où se trouve le couple royal, mettez votre poing comme un marteau et l[']abattez de toute vos forces sur la tête de la reine. Malgré sa bonhommie légendaire, son époux s[']en offusque (ou est vaguement jaloux), et il vous fait jeter dans les cachots sombres de Fihnargaia.[Line Break]Six mois plus tard, vous revoilà devant lui.".

	Before giving or showing chope to reine des nains:
		if hydromel is inside chope
			begin;
				say "Vous tendez la chope à la royale souveraine, qui boit l[']hydromel d[']une seule traite. Elle se lève, titubante, et tombe ivre morte. Malgré sa bonhommie légendaire, son époux s[']en offusque, et il vous fait jeter dans les cachots sombres de Fihnargaia.[Line Break]Six mois plus tard, vous revoilà devant lui.";
				stop the action;
			otherwise;
				continue the action;
		end if.

	Instead of giving hydromel to reine des nains, try giving chope to reine des nains.


	Before giving or showing chope to roi des nains:
		if hydromel is inside chope
			begin;
				say "Vous tendez la chope à votre souverain, qui la porte a ses lèvres, et boit une longue rasade d[']hydromel d[']un air satisfait. Puis il passe la chope à son épouse pour qu'elle goûte également.";
				[Vous tendez la chope à votre souverain, qui boit l[']hydromel d[']un air satisfait, puis la passe à son épouse pour qu'elle goûte également.]
				now roi des nains is distracted;
				now reine des nains is distracted;
				say "[line break]Le couple royal est très satisfait, la prochaine fête sera une réussite, à n[']en pas douter !";
				end the story saying "Vous avez gagné";
				stop the action;
			otherwise;
				continue the action;
		end if.

	Instead of giving hydromel to roi des nains, try giving chope to roi des nains.



	Some pierres are scenery in Grand Hall de Fihnargaia. Understand "mur" or "murs" or "pierre" as pierres.


	Part 2 - La cuisine

	Cuisines is east from Petit Couloir. The description of cuisines is "Votre univers est continuellement empli de vapeurs et d[']effluves agréables, et une dizaines de commis s[']activent aux fourneaux ou derrière de succulentes pâtisseries.".

	Some commis are men in cuisines.
	Some fourneaux are scenery in cuisines.

	Some patisseries are in cuisines. Patisseries are edible and female. The printed name of patisseries is "pâtisseries".

	Instead of smelling patisseries, say "Une bonne odeur appétissante...".

	The grimoire is in cuisines. 

	Instead of consulting grimoire about "hydromel", say "Pour préparer de l[']hydromel, il faut mettre ensemble de l[']eau, du miel et des levures, et faire ensuite le rituel de Târ Ru Thrin, qui consiste à monter sur le tonneau et dire les phrases consacrées (seul un maître cuisinier peut le faire).".

	Instead of consulting grimoire about "l'hydromel", try consulting grimoire about "hydromel".

	Instead of examining grimoire, say "Ce sont des recettes de cuisine.".
	Instead of reading grimoire, say "Vous pouvez consulter le grimoire au sujet du sujet qui vous intéresse, mais c'est sans doute le thème de l[']hydromel qui vous préoccupe le plus en ce moment...".

	A tonneau is a container in cuisines. An eaux is female in tonneau. Understand "eau" as eaux. The printed name of eaux is "eau". The indefinite article of eaux is "de l[']".

	The description of tonneau is "Un gros tonneau grand deux fois comme vous, qui vous sert à brasser de la bière ou de l[']hydromel. Il y a un petit robinet à son extrémité.".

	Instead of unlocking tonneau with cle, say "Cela aurait vraiment été une bonne idée de pouvoir empêcher quiconque de se servir dans le tonneau, car parfois on croirait que ce qu'il contient à tendance à s[']évaporer, mais le tonnelier n[']était pas assez habile pour y poser un verrou.".

	Instead of swimming when eaux is in tonneau, say "Voilà ! C'est exactement à cela que sert l[']eau, et à cela uniquement. Par contre, il n[']y en a qu'un fond dans ce tonneau, et il servira malgré tout à brasser l[']hydromel.".

	Rule for printing the name of tonneau: 
	   say "tonneau"; 
	   omit contents in listing. 

	The robinet is a part of tonneau.

	An hydromel is a thing. The indefinite article of hydromel is "de l[']".

	Instead of drinking hydromel, say "Ce n[']est pas l[']envie qui vous en manque, mais le Roi préfèrerait être servi avant.".

	Instead of drinking eaux, say "Pouah ! Boire de l[']eau devant tout ce monde, et c'est l[']assurance d[']être la risée de Fihnargaia en très peu de temps. Il ne sera pas dit que Drâh Bar Ruhk s[']abreuve d[']eau !"

	Instead of climbing tonneau:
		say "Vous escaladez le grand tonneau et faites un peu le pitre dessus pour amuser vos employés, en dansant, chantant et grimaçant. Puis, la comédie terminée, vous redescendez au sol.";


	Instead of climbing tonneau when pot de miel is in tonneau and [when] pot de levures is in tonneau:
		say "Vous escaladez le grand tonneau et faites un peu le pitre dessus pour amuser vos employés, en dansant, chantant et grimaçant. Puis, le rituel terminé, vous redescendez au sol. La magie a sans doute opéré, comme d[']habitude.";
		remove pot de miel from play;
		remove eaux from play;
		remove pot de levures from play;
		move hydromel to tonneau.

	Instead of turning robinet when hydromel is not in tonneau:
		say "Vous vous êtes engagé à ne tourner ce robinet que quand du bon hydromel sera dedans.".

	Instead of turning robinet when hydromel is in tonneau:
		move hydromel to chope;
		move chope to player;
		say "Vous prenez une chope et la remplissez avec de l[']hydromel.".
		

	The grande armoire is a female container in cuisines. It is closed and openable. It is locked. 

	The cle unlocks grande armoire.

	Instead of pushing or pulling chaise, say "Cette chaise est bien là où elle est."

	The pot de miel is in armoire. The pot de levures is in armoire.

	The chope is female container in armoire.

	The chaise is a supporter in cuisines. The chaise is female and enterable.


	Instead of going east when location is Petit Couloir and [when] the grand Hall de Fihnargaia is not visited, say "Le Roi vous ayant convoqué, vous feriez bien de ne pas le faire attendre. Vous retournerez à vos cuisines ensuite.".

	Instead of talking to commis, say "Vous murmurez rapidement quelques ordres à vos commis pour arranger les derniers détails du repas en cours.".

	Instead of listening to commis, say "Ils chantonnent tout en travaillant, et parfois certains disent du mal de vous. Sans doute ne vous ont-il pas entendu arriver.".

	Test me with "ouvrir lampes/fermer lampes/allumer lampes/eteindre lampes/allumer lampes/aller au nord/examiner meubles/ouvrir meubles/saluer le roi/parler au roi/regarder la reine/laisser tablier/prendre tablier/mettre tablier/jeter tablier vers le roi/embrasser le roi/donner tablier au roi/donner tablier au roi/attaquer les gardes/attendre/inventaire/test bad/test cuisine".

	Test bad with "embrasser la reine/jeter tablier vers la reine/saluer la reine/donner tablier à la reine/montrer tablier à la reine/attaquer la reine"

	Test cuisine with "sud/est/sentir tonneau/pousser tonneau/tirer tonneau/pousser chaise/tirer chaise/tourner chaise/tourner robinet/grimper sur tonneau/boire eaux/nager/grimper sur armoire/verrouiller tonneau avec cle/verrouiller armoire avec cle/deverrouiller armoire avec cle/chanter/sentir patisseries/manger patisseries/x grimoire/lire grimoire/consulter grimoire au sujet de hydromel/ouvrir armoire/prendre miel/prendre levures/mettre miel dans tonneau/mettre levures dans tonneau/escalader tonneau/tourner robinet/ouest/nord/donner chope au Roi"




		



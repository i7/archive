Version 1/100916 of Spanish by Sebastian Arg begins here.

"Spanish agrupa el trabajo de traducción necesario para la programación y jugabilidad en español." 

"basada en InformATE! de Zak"

Part SL1 - Spanish Initials, Use options and Kinds

Include Version 2/090402 of the Standard Rules by Graham Nelson. [asegurarse que la version de base de I7 es la adecuada]

A thing can be female. [Habilita genero a inanimados, como containers, supporters, etc. Caracteristica necesaria en espanol]
A room can be female. [Habilita genero a habitaciones. Caracteristica necesaria (a veces) en espanol, sobre todo al listar las habitaciones.]
A room can be plural-named or singular-named. [spanish need: al listar rooms como 'las Escaleras']

The description of yourself is "Tan buen mozo como siempre."

[Gestion Dialectos]
Use Dialecto Castellano translates as (- Global dialecto_sudamericano = 0; Constant DIALECTO_SPANISH; !Set to Castellano -).
Use Dialecto Sudamericano translates as (- Global dialecto_sudamericano = 1; Constant DIALECTO_SPANISH; !Set to Sudamericano -).

To decide if Dialecto Sudamericano: (- dialecto_sudamericano -);
To decide if Dialecto Castellano: (- dialecto_sudamericano==0 -);


Use Manual Pronouns translates as (- Constant MANUAL_PRONOUNS; -).
Use Auto Pronouns translates as (- Constant AUTO_PRONOUNS; -).
[Use Auto Pronouns.] [ Activar actualizacion de pronombres al mencionar cosas. De fábrica viene comentariado]
To notice (o - an object): [actualizar pronombres. Ej:  Before printing the name of the cuchillo: notice the cuchillo. Permite usar correctamente >>COGELO,etc)]
	(- PronounNotice({o}); -). 
Before printing the name of something (called new_obj):
	If the Auto Pronouns option is active, notice the new_obj.[actualizar pronombres para ESE objeto]
	[If using the Auto Pronouns option, notice the new_obj.[actualizar pronombres para ESE objeto]]


To allow no response: (- PreguntaSiNo=1; -). 		[ admitir 'no' como respuesta y no como 'noroeste', english. Urba work ]
To permitir no como respuesta: (- PreguntaSiNo=1; -). 	[ admitir 'no' como respuesta y no como 'noroeste', spanish. Urba work ]


Part SL2 - Part Two

Section SL2/2 - Spanish Compass

[TODO Estas relaciones agregan rutinas parse_name (grandes) a los ocho objetos de la brujula. ¿Es para tanto? Pensar otra solucion]
Understand "norte" as north.
Understand "sur" as south.
Understand "este" as east.
Understand "o/oeste" as west.
Understand "no/noroeste" as northwest.
Understand "noreste" as northeast.
Understand "sureste" as southeast.
Understand "so/suroeste" as southwest.
Understand "arriba/sube/techo/lado/cielo" as up.
Understand "abajo/b/baja/suelo" as down.
Understand "adentro/dentro" as inside. ['entra' no funciona aqui pues se superpone con verbo 'entra..']
Understand "fuera/afuera" as outside.

A direction has a text called printed name. [Eric Forgeot]
The printed name of north is "norte".
The printed name of south is "sur".
The printed name of east is "este".
The printed name of west is "oeste".

The printed name of northeast is "noreste".
The printed name of southwest is "suroeste".
The printed name of southeast is "sureste".
The printed name of northwest is "noroeste".

The printed name of inside is "adentro".
The printed name of outside is "afuera".
The printed name of up is "arriba".
The printed name of down is "abajo".

Include (- has proper, -) when defining up. [para evitar 'el arriba', gracias RML]
Include (- has proper, -) when defining down.
Include (- has proper, -) when defining inside.
Include (- has proper, -) when defining outside.

The indefinite article of north is "el".[para imprimir el norte, gracias Johan]
The indefinite article of south is "el".
The indefinite article of east is "el".
The indefinite article of west is "el".
The indefinite article of northeast is "el".
The indefinite article of southwest is "el".
The indefinite article of southeast is "el".
The indefinite article of northwest is "el".

Section SL2/1 - Replacing English verbs

[ Propósito: Para no incluir el bloque de gramaticas (y verbos) ingleses en el fuente (optimiza memoria)]
[               Si deseas mantener alguno, solo comenta la linea correspondiente]

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
Understand the command "full score" as something new.
Understand the command "quit" as something new.
Understand the command "q" as something new.
Understand the command "save" as something new.
Understand the command "restart" as something new.
Understand the command "restore" as something new.
Understand the command "verify" as something new.
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
Understand the command "purchase" as something new.
Understand the command "squash" as something new.
Understand the command "taste" as something new.
Understand the command "fasten" as something new.


Part SL3 - Actions

[Old I6 Grammar.h file is dumped here, using I7 language]

[ Gramatica basada en InformATE! (I6) (by Zak)]
[ Verbos irregulares: filosofia usada en informATE!]
[ Para algunas acciones no estan permitidas ciertas variantes de la gramatica de informATE, como el uso de second noun como token.
  esto hace la respuesta del parser mucho mas tonta: Ej, corta el pan o corta el pan con el cuchillo. ToDo: podrá resolverse esto?]

Section SL3/0 - Grammar for Actions in the Game World

Understand "toma [things]" as taking. Understand the commands "coge" and "recoge" as "toma".
Understand "toma a [someone]" as taking.
Understand "toma [things inside] de [something]" as removing it from.

Understand "saca [things inside] de [something]" as removing it from.
Understand "saca a [someone] de [something]" as removing it from.

Understand "quita [things inside] de [something]" as removing it from.
Understand "quita a [someone] de [something]" as removing it from.
Understand "quita [things inside] a [something]" as removing it from.
Understand the command "quitale" as "quita".


[Understand "quita cerrojo/pestillo/cierre a [something]" as unlocking it with.] [TODO Unlock no soporta call sin segundo argumento 'second noun' y dice: 'You must supply a second noun.'] 
[Understand "quita el cerrojo/pestillo/cierre a [something]" as unlocking it with.]
Understand "quita cerrojo/pestillo/cierre a [something] con [something preferably held]" as unlocking it with. 
Understand "quita el cerrojo/pestillo/cierre a [something] con [something preferably held]" as unlocking it with.

Understand "sacate [something preferably held]" as taking off. Understand the commands "quitate","sacarse","quitarse","quitarte","sacarte","sacarme","quitarme","quitame" and "sacame" as "sacate".

Understand "ponte [something preferably held]" as wearing.
Understand "ponte con [something preferably held]" as wearing.
Understand the commands  "viste","vistete","ponerse","vestirse","ponerte","vestirte","ponerme","vestirme","ponme" and "visteme" as "ponte".

Understand "pon [other things] en [container]" as inserting it into. Understand the commands  "mete","echa","inserta" and "coloca"  as "pon".
Understand "pon [other things] en/sobre [something]" as putting it on. 
Understand "pon [other things] dentro de [something]" as inserting it into.
Understand "pon [something] a [text]" as setting it to.
Understand "pon a [someone] en [container]" as inserting it into.
Understand "pon a [someone] en [something]" as putting it on.
Understand "pon a [someone] dentro de [something]" as inserting it into.[todo no seria [container]?]
Understand "pon a [someone] sobre [something]" as putting it on. 
Understand "pon [other things] encima de [something]" as putting it on.
Understand "pon a [someone] encima de [something]" as putting it on.

Understand "pon cerrojo/pestillo/cierre a [something]" as locking it with.
Understand "pon el cerrojo/pestillo/cierre a [something]" as locking it with.
Understand "pon cerrojo/pestillo/cierre a [something] con [something preferably held]" as locking it with.
Understand "pon el cerrojo/pestillo/cierre a [something] con [something preferably held]" as locking it with.

Understand "deja [things preferably held]" as dropping. Understand the command "suelta" as "deja".
Understand "deja a [someone]" as dropping.
Understand "deja [other things] en [container]" as inserting it into.
Understand "deja [other things] en/sobre [something]" as putting it on.
Understand "deja [other things] dentro de [something]" as inserting it into.
Understand "deja [other things] encima de [something]" as putting it on.

Understand "lanza [something preferably held] a/por/contra [something]" as throwing it at. Understand the command "arroja" as "lanza". 
Understand "lanza a [someone] por/contra [something]" as throwing it at.

Understand "tira de [something]" as pulling.
Understand "tira [things preferably held]" as dropping.
Understand "tira a [things preferably held]" as dropping. [added]
Understand "tira [other things] en [container]" as inserting it into.
Understand "tira [other things] en/sobre [something]" as putting it on.
Understand "tira [other things] dentro de [something]" as inserting it into.
Understand "tira [other things] encima de [something]" as putting it on.
Understand "tira [something preferably held] a/contra [something]" as throwing it at.
Understand "tira [things preferably held] por [something]" as inserting it into. 

Understand "da [something preferably held] a [someone]" as giving it to.
Understand "da a [someone] [something preferably held]" as giving it to (with nouns reversed).
Understand "da [someone] [something preferably held]" as giving it to (with nouns reversed).
Understand "da una patada a [something]" as attacking.
Understand "da un punetazo a [something]" as attacking.
Understand "da un golpe a [something]" as attacking.
Understand the commands   "regala","dale","dase","ofrece" and "darse" as "da".

Understand "muestra [someone] [something preferably held]" as showing it to (with nouns reversed). Understand the command "ensena" as "muestra".
Understand "muestra a [someone] [something preferably held]" as showing it to (with nouns reversed).
Understand "muestra [something preferably held] a [someone]" as showing it to.

Understand "vete" as going. [TODO produce texto: You'll have to say which compass direction to go in. Esto reemplazaria la accion VagueGo. Traducir]
Understand "vete [direction]" as going. Understand the commands  "ve","camina","anda","corre","vuelve" and "ir" as "vete".
Understand "vete a/hacia [direction]" as going.
Understand "vete [something]" as entering.
Understand "vete a/hacia/por [something]" as entering.

Understand "pasa por [something]" as entering.

Understand "inventario" as taking inventory. Understand the commands "inv" and "i" as "inventario". [todo: falta el 'breve'/'estrecho'] 

Understand "look" as looking. Understand the commands "mira","m","l" and "ver" as "look".
Understand "look a [someone]" as examining.
Understand "look [something]" as examining.
Understand "look a/hacia [something]" as examining. [for compass]
Understand "look en/sobre/por [something]" as searching.
Understand "look dentro de [something]" as searching.
Understand "look bajo [something]" as looking under.
Understand "look debajo de [something]" as looking under.
Understand "look a traves de [something]" as searching.

Understand "consulta [someone] sobre [text]" as asking it about.
Understand "consulta a [someone] sobre [text]" as asking it about.
Understand "consulta sobre [text] a [someone]" as asking it about (with nouns reversed).
Understand "consulta [something] sobre [text]" as consulting it about.
Understand "consulta [something] acerca de [text]" as consulting it about.
Understand "consulta [text] en [something]" as consulting it about (with nouns reversed).

Understand "abre [something]" as opening.
Understand "abre a [someone]" as opening.
Understand "abre [something] con [something preferably held]" as unlocking it with.

Understand "cierra [something]" as closing.
Understand "cierra [something] con pestillo" as locking it with.
Understand "cierra [something] con [something preferably held]" as locking it with.

Understand "destapa [something]" as opening. Understand the command "descubre" as "destapa".

Understand "tapa [something]" as closing. Understand the command "cubre" as "tapa".

Entering to room is an action applying to nothing.
The specification of the entering to room action is "Esta acción se ejecuta con el comando
'entra', asumiendo que en realidad se quiere entrar a alguna localidad que se tenga enfrente, y que en
el juego esté correctamente mapeada de manera que corresponda al 'inside' de la localidad actual."
Carry out entering to room (this is the intentar entrar rule): try going inside.

Understand "entra" as entering to room.

Understand "entra en/por/a [something]" as entering. Understand the command "cruza" as "entra".
Understand "entra [something]" as entering.
Understand "entra dentro de [something]" as entering.

Understand "metete en/por [something]" as entering. Understand the commands "meterse","meterte","meterme" and "meteme" as "metete".

Understand "atraviesa [something]" as entering.

Understand "sienta en [something]" as entering. Understand the commands "echate","sientate","echarse","sentarse","echarte" and "sentarte" as "sienta".

Understand "sal" as exiting.
Understand "sal de [something]" as getting off.
[Understand "sal por [something]" as entering.] [comentariado en informate]
Understand "sal fuera/afuera" as exiting. Understand the commands "fuera","afuera","salte","bajate","levantate","bajarse","levantarse","salirse","bajarte","levantarte" and "salirte" as "sal".

Understand "examina [something]" as examining.
Understand "examina a [someone]" as examining. Understand the commands  "describe","inspecciona","observa","ex","x" as "examina".

Understand "lee [something]" as examining.
Understand "lee sobre [text] en [something]" as consulting it about (with nouns reversed).
Understand "lee [text] en [something]" as consulting it about (with nouns reversed).

Understand "si" or "sí" as saying yes. [TODO: arreglar unicode]
Understand "nx" as saying no.

Understand "sorry" as saying sorry. Understand the commands "perdon","perdona","siento","lamento" and "disculpa" as "sorry". [TODO no permite argumento 'topic']
Understand "lo siento/lamento" as saying sorry.
Understand "lo siento/lamento mucho" as saying sorry.

Understand "shit" as swearing obscenely. Understand the commands "mierda", "jode","joder","puta","cono","cabron","puto","damn" and "fuck" as "shit".
Insultando is an action applying to one topic. Understand "shit [text]" as insultando.
The specification of the insultando action is "En inglés existe la acción 'swearing obscenely' pero no permite
al jugador agregar texto después de una palabrota. Por ello, este 'insultando' sí lo permite (como lo hacía InformATE)."
Check insultando:
    say "Los verdaderos aventureros no usan ese vocabulario."


Understand "aburrido" as swearing mildly. Understand the commands "idiota","tonto" and "bobo" as "aburrido".
InsultandoSuave is an action applying to one topic. Understand "aburrido [text]" as insultandosuave.
The specification of the insultandosuave action is "En inglés existe la acción 'swearing mildly' pero no permite
al jugador agregar texto después de un insulto suave. Por ello, este 'insultando suave' sí lo permite (como lo hacía InformATE)."
Check insultandosuave:
    say "Bastante."

Understand "busca en [something]" as searching.
Understand "busca [text] en [something]" as consulting it about (with nouns reversed).
Understand "busca en [something] sobre [text]" as consulting it about.
Understand "busca en [something] [text]" as consulting it about.
Understand "busca en [something] acerca de [text]" as consulting it about.

Understand "registra a [someone]" as searching. Understand the command "rebusca" as "registra".
Understand "registra [something]" as searching.
Understand "registra en [something]" as searching.

Understand "ondea [someone]" as attacking. Understand the command "sacude" and "agita" as "ondea".
Understand "ondea a [someone]" as attacking.
Understand "ondea la mano" as waving hands.
Understand "ondea las manos" as waving hands.
Understand "ondea [something]" as waving.
Understand "gesticula" as waving hands.
Understand "saluda con la mano" as waving hands.
Understand "saluda" as waving hands. [new]

Understand "ajusta [something] en/a [text]" as setting it to. Understand the command "fija" and "set" as "ajusta".

Understand "pulsa [something]" as pushing.

Understand "empuja [something]" as pushing. Understand the command "mueve","desplaza" and "menea" as "empuja".
Understand "empuja a [someone]" as pushing.
Understand "empuja [something] hacia [direction]" or "empuja [something] [direction]" as pushing it to.

Understand "gira [something]" as turning. Understand the command  "atornilla" and "desatornilla" as "gira".

Understand "conecta [something]" as switching on.
Understand "conecta [something] a/con [something]" as tying it to.

Understand "enciende [a device]" as switching on. Understand the command "prende" as "enciende".
Understand "enciende [something]" as burning.

Understand "desconecta [something]" as switching off. Understand the command "apaga" as "desconecta".
Understand "desconecta a [someone]" as switching off.

Understand "rompe [something]" as attacking.
Understand "rompe a [someone]" as attacking.
Understand the commands "aplasta","golpea","destruye","patea" and "pisotea" as "rompe".

Understand "ataca a [someone]" as attacking.
Understand "ataca [something]" as attacking.
Understand the commands  "mata","asesina","tortura" and "noquea" as "ataca".
Understand "lucha con [someone]" as attacking.
Understand "lucha [someone]" as attacking.

Understand "espera" or "z" as waiting.

Understand "responde a [someone] [text]" as answering it that.
Understand "responde [text] a [someone]" as answering it that (with nouns reversed). [TODO ¿como es el orden correcto?]
Understand "responde [someone] [text]" as answering it that.
Understand the commands "di","grita" and "dile" as "responde".

Understand "cuenta [someone] de/sobre [text]" as telling it about.
Understand "cuenta [someone] [text]" as telling it about.
Understand "cuenta a [someone] de/sobre [text]" as telling it about.
Understand "cuenta a [someone] [text]" as telling it about.
Understand "cuenta con [someone] sobre/de [text]" as telling it about.
Understand "cuenta con [someone] acerca de [text]" as telling it about.
Understand "cuenta sobre [text] con [someone]" as telling it about (with nouns reversed).
Understand "cuenta acerca de [text] con [someone]" as telling it about (with nouns reversed).
Understand "cuenta de [text] con/a [someone]" as telling it about (with nouns reversed).
Understand "cuenta [text] a [someone]" as telling it about (with nouns reversed).
Understand the commands "narra","explica" and "habla" as "cuenta".
	
Understand "pregunta [someone] sobre/por [text]" as asking it about. Understand the command "interroga" as "pregunta".
Understand "pregunta a [someone] sobre/por [text]" as asking it about.
Understand "pregunta sobre/por [text] a [someone]" as asking it about (with nouns reversed).
Understand "pregunta [text] a [someone]" as asking it about (with nouns reversed).
Understand "pregunta a [someone] acerca de [text]" as asking it about.

Understand "pide a [someone] [something]" as asking it for. Understand the command "pidele" as "pide".
Understand "pide [something] a [someone]" as asking it for (with nouns reversed).

Understand "come [something preferably held]" as eating.
Understand the commands  "comete","traga","ingiere","mastica","comerse" and "comerte" as "come".	

Understand "duerme" or "ronca" or "descansa" as sleeping.

Understand "canta" as singing.

Understand "escala a [something]" as climbing. Understand the command "trepa" as "escala".
Understand "escala [something]" as climbing.
Understand "escala por [something]" as climbing.

Understand "baja [something]" as getting off.
Understand "baja de [something]" as getting off.

Understand "baja" as bajando.

Bajando is an action applying to nothing.
The specification of the bajando action is "Esta acción se ejecuta con el comando
'baja', asumiendo que en realidad se quiere bajar a alguna localidad que se tenga debajo, y que en
el juego esté correctamente mapeada de manera que corresponda al 'down' de la localidad actual."
Carry out bajando: try going down.

Understand "subete a/en [something]" as entering. Understand the command "subirse" and "subirte" as "subete".

Subiendo is an action applying to nothing.
The specification of the subiendo action is "Esta acción se ejecuta con el comando
'sube', asumiendo que en realidad se quiere subir a alguna localidad que se tenga arriba, y que en
el juego esté correctamente mapeada de manera que corresponda al 'up' de la localidad actual."
Carry out subiendo: try going up.

Understand "sube" as subiendo.
Understand "sube arriba" as subiendo.

Understand "sube [something]" as entering.
Understand "sube a/en/por [something]" as entering.
Understand "baja a/en/por [something]" as entering.

Understand "compra [something]" or "adquiere [something]" as buying.

Understand "retuerce [something]" as squeezing.
Understand "retuerce a [someone]" as squeezing.
Understand the commands "aprieta","estruja" and "tuerce" as "retuerce".

[Understand "nada" as swimming.] [Actions withdrawn]

Understand "balanceate en [something]" as swinging.
Understand the commands "columpiate","meneate","balancearse","columpiarse","menearse","balancearte","columpiarte" and "menearte" as "balanceate".

[Understand "sopla [something]" as blowing.] [Actions withdrawn]

[Understand "rezar" as praying.][ action withdrawn]

Understand "despierta" as waking up.
Understand "despierta [someone]" or "despierta a [someone]" as waking. Understand the command "espabila" as "despierta".

Understand "espabilate" or "espabilarse" or "espabilarte" as waking up.

Understand "besa [someone]" as kissing. Understand the command "abraza" as "besa".
Understand "besa a [someone]" as kissing.

Understand "piensa" as thinking.

Understand "huele" as smelling. Understand the command "olfatea" as "huele".
Understand "huele a [something]" as smelling.
Understand "huele [something]" as smelling.

Understand "escucha" as listening. Understand the command "oye" as "escucha".
Understand "escucha a [something]" as listening.
Understand "escucha [something]" as listening.

Understand "saborea [something]" as tasting. Understand the commands  "paladea","prueba" and "lame" as "saborea".
Understand "saborea a [something]" as tasting.

Understand "toca [something]" as touching. Understand the command "palpa" as "toca".
Understand "toca a [someone]" as touching.

Understand "lava [something]" as rubbing. Understand the commands "limpia","pule","abrillanta","friega" and "frota" as "lava".
Understand "lava a [someone]" as rubbing.

Understand "ata [something]" as tying it to. Understand the commands  "enlaza","enchufa" and "une" as "ata".
Understand "ata a [someone]" as tying it to.
Understand "ata a [someone] a [something]" as tying it to.
Understand "ata [something] a [something]" as tying it to.

Understand "quema [something]" as burning.
Understand "quema a [someone]" as burning.
[Understand "quema a [someone] con [something preferably held]" as burning.]
[Understand "quema [something] con [something preferably held]" as burning.] [TODO La accion Burn no contempla second noun]

Understand "bebe [something]" as drinking.

[Understand "llena [something]" as filling. Understand the command "rellena" as "llena".] [Actions withdrawn]

Understand "corta [something]" as cutting. Understand the command "rasga" as "corta".
[Understand "corta [something] con [something preferably held]" as cutting.] [TODO no contempla second noun]

Understand "salta" as jumping.
[Understand "salta [something]" as jumping over.] [Actions withdrawn]
Understand "salta a [something]" as entering.Understand the command "brinca" as "salta".
[Understand "salta sobre [something]" as jumping over.]
[Understand "salta por encima de [something]" as jumping over.]

[Understand "cava en [something]" as digging. Understand the command "excava" as "cava".] [Actions withdrawn]
[Understand "cava [something]" as digging.
Understand "cava [something] con [something preferably held]" as digging.
Understand "cava en [something] con [something preferably held]" as digging.]



Section SL3/1 - Grammar for Actions which happen out of world

Understand "score" or "puntos" or "puntuacion" as requesting the score.
[Understand "full score" or "fullscore" as requesting the full score.]
Understand "quit" or "q" or "terminar" or "fin" or "acabar" or "abandonar" as quitting the game.
Understand "save" or "guardar" or "salvar" as saving the game.
Understand "restart" or "reiniciar" as restarting the game.
Understand "restore" or "recuperar" or "cargar" or "load" or "restaurar" as restoring the game.
Understand "verify" or "verificar" as verifying the story file.
Understand "version" as requesting the story file version.
Understand "script" or "script on/si" as switching the story transcript on. Understand the command "transcripcion" as "script".
Understand "script off/no" as switching the story transcript off.
Understand  "noscript" or "unscript" or "notranscripcion" as switching the story transcript off.
Understand "superbreve" or "corto" as preferring abbreviated room descriptions.
Understand "verbose" or "largo" as preferring unabbreviated room descriptions.
Understand "breve" or "normal" as preferring sometimes abbreviated room descriptions.
Understand "pronombres" or "p" as requesting the pronoun meanings.
Understand "notify" or "notify on/si" as switching score notification on. Understand the commands "notificar" and "notificacion" as "notify".
Understand "notify off/no" as switching score notification off.

Section SL3/9 - Activities rules Spanish Replacement
[Spanish-output replacement for some Activities from Standar Rules]

The you-can-also-see rule is not listed in any rulebook.

For printing the locale description (this is the spanish-you-can-also-see rule):
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
					if the domain is the location, say "Puedes ";
					otherwise say "En [the domain] puedes ";
				otherwise if the domain is a supporter:
					say "Sobre [the domain] puedes ";
				otherwise if the domain is an animal:
					say "Sobre [the domain] puedes ";
				otherwise:
					say "En [the domain] puedes ";
				say "ver [if the locale paragraph count is greater than 0]también [end if]";
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
				if the domain is the location, say " aquí";
				say ".[paragraph break]";
				unfilter list recursion;
			end the listing nondescript items activity with the domain;
	continue the activity.


The use initial appearance in room descriptions rule is not listed in any rulebook.

For printing a locale paragraph about a thing (called the item)
	(this is the spanish use initial appearance in room descriptions rule):
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
				say "Sobre [the item] ";
				list the contents of the item, as a sentence, including contents,
					giving brief inventory information, tersely, not listing
					concealed items, prefacing with is/are, listing marked items only;
				say ".[paragraph break]";
			now the item is mentioned;
	continue the activity.


The describe what's on scenery supporters in room descriptions rule is not listed in any rulebook.

For printing a locale paragraph about a thing (called the item)
	(this is the spanish describe what's on scenery supporters in room descriptions rule):
	if the item is not undescribed and the item is scenery and
		the item does not enclose the player:
		if a locale-supportable thing is on the item:
			set pronouns from the item;
			repeat with possibility running through things on the item:
				now the possibility is marked for listing;
				if the possibility is mentioned:
					now the possibility is not marked for listing;
			increase the locale paragraph count by 1;
			say "Sobre [the item] ";
			list the contents of the item, as a sentence, including contents,
				giving brief inventory information, tersely, not listing
				concealed items, prefacing with is/are, listing marked items only;
			say ".[paragraph break]";
	continue the activity.


The print the final question rule is not listed in any rulebook.

The spanish print the final question rule is listed in before handling the final question.
This is the spanish print the final question rule:
	let named options count be 0;
	repeat through the Table of Spanish Final Question Options:
		if the only if victorious entry is false or the story has ended finally:
			if there is a final response rule entry
				or the final response activity entry [activity] is not empty:
				if there is a final question wording entry, increase named options count by 1;
	if the named options count is less than 1, abide by the immediately quit rule;
	say "¿Quieres ";
	repeat through the Table of Spanish Final Question Options:
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
						say " o ";
					otherwise:
						say ", ";
						
The standard respond to final question rule is not listed in any rulebook.

The spanish standard respond to final question rule is listed last in for handling the final question.
This is the spanish standard respond to final question rule:
	repeat through the Table of Spanish Final Question Options:
		if the only if victorious entry is false or the story has ended finally:
			if there is a final response rule entry
				or the final response activity entry [activity] is not empty:
				if the player's command matches the topic entry:
					if there is a final response rule entry, abide by final response rule entry;
					otherwise carry out the final response activity entry activity;
					rule succeeds;
	issue miscellaneous library message number 8.


Section SL3/10 - Final question options - Spanish Replacement

Table of Spanish Final Question Options
final question wording	only if victorious	topic		final response rule		final response activity
"REINICIAR"				false				"reiniciar"	immediately restart the VM rule	--
"RECUPERAR un juego guardado"	false				"recuperar"	immediately restore saved game rule	--
"ver algunas CURIOSIDADES"	true	"curiosidades"	--	amusing a victorious player
"TERMINAR"					false				"terminar"		immediately quit rule	--
"hacer UNDO del último comando"		false				"undo"		immediately undo rule	--

Section SL3/11 - Declaraciones VerboIrregular
[Hay problemas con los Unicode y los acentos. Tener cuidado al editar esto con editores no UTF-8]

Include (-
! Objetos VerboIrregular, necesarios para el parseo de verbos irregulares en espanol (Added by SL)
VerboIrregular "abandonar el juego" with imperativo 'q//' 'quit' 'terminar' 'fin' 'acabar' 'abandonar';
VerboIrregular "abrir" with imperativo 'abre';
VerboIrregular "activar la transcripcin a disco" with imperativo 'script' 'transcripcion';
VerboIrregular "adquirir" with imperativo 'adquiere';
VerboIrregular "ajustar" with imperativo 'set';
VerboIrregular "apretar" with imperativo 'aprieta';
VerboIrregular "atravesar" with imperativo 'atraviesa';
VerboIrregular "bajar" with imperativo 'bajate' 'bajarse' 'irte';
VerboIrregular "balancear" with imperativo 'balanceate' 'meneate' 'balancearse' 'menearse' 'balancearse' 'menearse';
VerboIrregular "cambiar a modo LARGO" with imperativo 'verbose' 'largo';
VerboIrregular "cambiar a modo NORMAL" with imperativo 'breve' 'normal';
VerboIrregular "cambiar a modo SUPERBREVE" with imperativo 'superbreve' 'corto';
VerboIrregular "cambiar el dialecto del juego" with imperativo 'dialecto';
VerboIrregular "cambiar el estado de la NOTIFICACION de PUNTOS" with imperativo 'notificar' 'notify';
VerboIrregular "cargar un juego previamente guardado en disco" with imperativo 'cargar' 'recuperar' 'load' 'restaurar' 'restore';
VerboIrregular "cerrar" with imperativo 'cierra';
VerboIrregular "columpiar" with imperativo 'columpiate' 'columpiarse' 'columpiarse';
VerboIrregular "comer" with imperativo 'comete' 'comerse' 'comerte';
VerboIrregular "ingerir" with imperativo 'ingiere';
VerboIrregular "conocer el número de VERSION del juego" with imperativo 'version';
VerboIrregular "conocer la puntuación" with imperativo 'score' 'puntos' 'puntuacion';
VerboIrregular "conocer la puntuación detallada" with imperativo 'total' 'pt';
VerboIrregular "contar" with imperativo 'cuenta';
VerboIrregular "cubrir" with imperativo 'cubre';
VerboIrregular "darle" with imperativo 'dale' 'dase' 'darse';
VerboIrregular "decir" with imperativo 'di' 'dile';
VerboIrregular "desactivar la transcripción a disco" with imperativo 'unscript' 'noscript' 'notranscripcion';
VerboIrregular "descubrir" with imperativo 'descubre';
VerboIrregular "despertar" with imperativo 'despierta' 'espabilate' 'espabilarse' 'espabilarte';
VerboIrregular "destruir" with imperativo 'destruye';
VerboIrregular "disculparte" with imperativo 'sorry' 'perdon';
VerboIrregular "dormir" with imperativo 'duerme' 'dormir';
VerboIrregular "echar" with imperativo 'echate' 'echarse';
VerboIrregular "encender" with imperativo 'enciende';
VerboIrregular "esperar" with imperativo 'z//';
VerboIrregular "examinar" with imperativo 'x//' 'describe' 'ex';
VerboIrregular "fregar" with imperativo 'friega';
VerboIrregular "guardar en disco el estado del juego" with imperativo 'save' 'guardar' 'salvar';
VerboIrregular "ir" with imperativo 've' 'vete' 'ir';
VerboIrregular "volver" with imperativo 'vuelve';
VerboIrregular "levantar" with imperativo 'levantate' 'levantarse' 'levantarte';
VerboIrregular "listar los lugares visitados" with imperativo 'places' 'lugares';
VerboIrregular "listar los objetos que se han tenido" with imperativo 'objects' 'objetos';
VerboIrregular "meter" with imperativo 'metete' 'meterse' 'meterte' 'meterme' 'meteme';
VerboIrregular "mirar" with imperativo 'l//' 'look' 'm//';
VerboIrregular "mostrar" with imperativo 'muestra';
VerboIrregular "mostrar inventario" with imperativo 'i//' 'inv' 'inventario';
VerboIrregular "mover" with imperativo 'mueve';
VerboIrregular "oir" with imperativo 'oye';
VerboIrregular "oler" with imperativo 'huele';
VerboIrregular "pedir" with imperativo 'pide' 'pidele';
VerboIrregular "pensar" with imperativo 'piensa';
VerboIrregular "poner" with imperativo 'pon' 'ponte' 'viste' 'vistete' 'ponerse' 'vestirse' 'ponerte' 'vestirte' 'ponerme' 'vestirme' 'ponme' 'visteme';
VerboIrregular "probar" with imperativo 'prueba';
VerboIrregular "pulir" with imperativo 'pule';
VerboIrregular "quitar" with imperativo 'sacate' 'quitate' 'sacarse' 'quitarse' 'quitarte' 'sacarte' 'sacarme' 'quitarme' 'quitame' 'sacame';
VerboIrregular "quitarle" with imperativo 'quitale';
VerboIrregular "reiniciar el juego" with imperativo 'reiniciar';
VerboIrregular "responder ~no~" with imperativo 'nx';
VerboIrregular "responder ~sí~" with imperativo 'si' 'y//';
VerboIrregular "sacudir" with imperativo 'sacude';
VerboIrregular "salir" with imperativo 'sal' 'fuera' 'afuera' 'salte' 'salirse' 'salirte';
VerboIrregular "sentar" with imperativo 'sienta' 'sientate' 'sentarse' 'echarte' 'sentarte';
VerboIrregular "soltar" with imperativo 'suelta';
VerboIrregular "subir" with imperativo 'sube' 'subete' 'subirse' 'subirte';
VerboIrregular "torcer" with imperativo 'tuerce';
VerboIrregular "retorcer" with imperativo 'retuerce';
VerboIrregular "transferir" with imperativo 'transfiere';
VerboIrregular "unir" with imperativo 'une';
VerboIrregular "ver el estado de los pronombres" with imperativo 'pronombres';
VerboIrregular "verificar la corrección del juego" with imperativo 'verificar';
VerboIrregular "mostrar las salidas" with imperativo 'salidas'; ! Urba touch
#ifdef DEBUG;
VerboIrregular "purloin" with imperativo 'purloin';
VerboIrregular "hacer con abstract" with imperativo 'abstract' 'xmueve';
VerboIrregular "hacer con gonear (indica lugar)" with imperativo 'gonear' 'xmueve';
#endif;
-).

Part SL4 - Spanish Phrasebook

Section SL4/0 - Spanish Saying, basados en la rutinas de impresión de InformATE!
[ Documentacion de esta seccion: DocumentATE: Descripciones y Parsing: Descripcion de objetos y lugares ]

[Articulos ]
To say el (something - object):	(- print (the) {something}; -).
To say El (something - object):	(- print (The) {something}; -).
To say un (something - object):	(- print (un) {something}; -).
To say Un (something - object):	(- print (_Un) {something}; -).
[To say nombre (something - object): [withdrawn: esto ya no deberia ser usado, simplemete poniendo [objeto] ya imprime el nombre corto en I7]
	(- print (name) {something}; -).]

To say del (something - object): (- print (del) {something}; -).
To say al (something - object):	(- print (al) {something}; -).
To say Al (something - object):	(- print (_Al) {something}; -).


[ Terminaciones para adjetivos ]
To say o (something - object): (- print (o) {something}; -).[say "Cogid[o noun]".]
To say s (something - object): (- print (s) {something}; -). [say "Ya no está[n noun] tan negro[s noun]."]
To say _s (something - object): (- print (_s) {something}; -).

[ Terminaciones para verbos ]
To say es (something - object): (- print (es) {something}; -).
To say Es (something - object): (- print (_Es) {something}; -).
To say n (something - object): (- print (n) {something}; -).
To say lo (something - object): (- print (lo) {something}; -). [say "Cóge[lo noun]".]
	

[ Verbo COGER/TOMAR segun dialecto ]
To say coge: (- coge(0); -).
To say Coge: (- Mcoge(0); -).
To say MMcoge: (- MMcoge(0); -).

[Misc]
To say (something - time) in spanish:			[decir la hora en español]
	(- print (PrintTimeOfDayEnglish) {something}; -).

[To say (something - time) con palabras:	            	[decir la hora en español] [vamos a dejar esto por un tiempo]
	(- print (PrintTimeOfDaySpanish) {something}; -).]


[ -------------------------------------------------------------------------------------------------------------------------- ]

[ hasta aquí cualquier aventurero puede circular. Pasando esta linea, oh curioso joven, 
   no puedo asegurarte el regreso a la cordura.......]

Part 5 - Redefinition of Language Template

Section 1 - Asuntos preliminares

Include (-

! =====================================================================
! INFSP (Spanish Inform Library)
! =====================================================================
!        Author: INFSP Task Team
!       Version: 0.9
!      Revision: 19 - Mayo - 2010
! Serial Number: 1005.23

Message "^Compilando con Spanish: Mensajes y rutinas de idioma [INFSP 0.9 MAYO 2010]";
Message "   Asegurate de estar corriendo I7 Build 6E59^";

! ---------------------------------------------------------------------------
!   Parte I.   Asuntos preliminares
! ---------------------------------------------------------------------------

Constant LanguageVersion = "  - Librería I6 Española 1005.23, basada en InformATE!";

! Definición de caractéres "baratos". Esto permite que estas letras
! ocupen menos bits en la máquina Z. No funciona si se intenta la
! compilación por módulos (viejo método)

#ifdef TARGET_ZCODE;
  Zcharacter 'á';                    ! a con acento
  Zcharacter 'é';                    ! e con acento
  Zcharacter 'í';                    ! i con acento
  Zcharacter 'ó';                    ! o con acento
  Zcharacter 'ú';                    ! u con acento
  Zcharacter 'ñ';                    ! n con virguilla
  Zcharacter 'Ñ';                    ! N con virguilla
  Zcharacter 'ü';                    ! u con dieresis
  Zcharacter '¿';                    ! abrir interrogación
  Zcharacter '¡';                    ! abrir exclamación
#endif;

!----------------------------------------------
! CONSTANTES Y CLASES ESPECIFICAS DE INFORMATE
!---------------------------------------------- 

Class VerboIrregular;

!------------------------------------
! Globales específicas de InformatE!
!------------------------------------

global PreguntaCualExactamente = 0;
	! Esta variable se pone a 1 cuando se le pregunta al jugador ¿Cuál
	! exactamente...? esto indica que puede ser necesario re-traducir la
	! respuesta que el jugador dé, ya que puede que simplemente el jugador
	! cambie de idea y en lugar de responder a nuestra pregunta introduzca
	! un comando completamente nuevo.

global PreguntaSiNo = 0;
	! Esta variable debe ponerse a 1 manualmente si queremos que el verbo
	! 'no' sea accesible como respuesta (y no como punto cardinal). La
	! variable sólo afecta a la siguiente respuesta del jugador y vuelve a
	! hacerse cero automáticamente.

Global quitacentos = 1;

Array  texto_impreso --> 52;

#ifndef NI_BUILD_COUNT;
Global dialecto_sudamericano = 0;
#ifnot;
    #ifndef DIALECTO_SPANISH; ! seteado desde el I7 environment
       Global dialecto_sudamericano = 0;
    #endif;
#endif;

!---------------------------------------------------------------------------
! Atributos y propiedades específicas de InformatE!, tambien usados en INFSP
!---------------------------------------------------------------------------

Property imperativo alias name;
Property irrelevante alias name;

-) after "Definitions.i6t". 


Include (-
! Definicion de bufferaux y parseraux, usados en DictionaryLookup [001115]
#ifdef TARGET_ZCODE;
  Array bufferaux -> 123;
  Array parseaux  buffer 63;
#ifnot; ! TARGET_GLULX
  Array  bufferaux    buffer INPUT_BUFFER_LEN;
  Array parseaux  --> PARSE_BUFFER_LEN;
#endif; ! TARGET_



! Tremendo bug corregido. Antes usaba el buffer buf2, el cual usa
! tambien el parser para leer commandos incompletos del estilo de "¿a
! cual te refieres exactamente?"
! Este bug estaba en la libreria original, pero nunca aparecia porque
! apenas se usa DictionaryLookup. En cambio InformATE lo usa para
! comprobar si quitando la R a un verbo se obtiene una palabra válida.
!
! [Gracias a Presi por detectarlo] 
[ DictionaryLookup texto longitud
    i;

	! copiar texto a bufferaux (copiado especial)
	for (i=0:i<longitud:i++) bufferaux->(WORDSIZE+i) = texto->i;
	! completar correctamente cabeceras de los buffers
	!	para la rutina Tokenise.
#ifdef TARGET_ZCODE;
	bufferaux->1 = longitud;
	bufferaux->0 = 120;
	parseaux-> 0 = 1;
#ifnot; ! TARGET_GLULX
	bufferaux-->0 = longitud;
#endif; ! TARGET_
#ifdef DEBUG;
    if (parser_trace>=9) { ! infsp debug
		print "    DictionaryLookup: texto a procesar: |";
        ImprimeTodoElBuffer(bufferaux);
        print "|^";
    }
#endif;
	VM_Tokenise(bufferaux,parseaux); ! procesar texto de bufferaux, el resultado está en parseaux-->1
	return parseaux-->1; ! retornar address del token encontrado (-1 si falla)
];

-) before "Vocabulary" in "Language.i6t".


Section 3 - Vocabulary

Include (-
Constant AGAIN1__WD = 'repetir';
Constant AGAIN2__WD = 're';
Constant AGAIN3__WD = 'g//';
Constant OOPS1__WD    = 'oops';
Constant OOPS2__WD    = 'epa';
Constant OOPS3__WD    = 'eepa';
Constant UNDO1__WD  = 'undo';
Constant UNDO2__WD  = 'deshacer';
Constant UNDO3__WD  = 'anular';

Constant ALL1__WD    = 'todos';
Constant ALL2__WD    = 'todas';
Constant ALL3__WD    = 'todo';
Constant ALL4__WD    = 'ambos';
Constant ALL5__WD    = 'ambas';
Constant AND1__WD    = 'y//';
Constant AND2__WD    = 'y//';
Constant AND3__WD    = 'e//';
Constant BUT1__WD   = 'excepto';
Constant BUT2__WD   = 'menos';
Constant BUT3__WD   = 'salvo';
Constant ME1__WD      = '-me';
Constant ME2__WD      = '-te';
Constant ME3__WD      = '-se';
Constant OF1__WD      = '.de';       ! no usados nunca, pues provocan
Constant OF2__WD      = '.de';       ! interferencia con la preposición "de"
Constant OF3__WD      = '.de';       ! usada por algunos verbos, como en
Constant OF4__WD      = '.de';       ! "saca objeto de la caja"
Constant OTHER1__WD    = 'otro';
Constant OTHER2__WD    = 'otra';
Constant OTHER3__WD    = 'otro';
Constant THEN1__WD = 'ydespues';
Constant DESPUES11_WD = 'despues';
Constant THEN2__WD = 'yluego';
Constant DESPUES21_WD = 'luego';
Constant THEN3__WD = 'yentonces';
Constant DESPUES31_WD = 'entonces';

Constant NO1__WD      = 'n//';
Constant NO2__WD      = 'no';
Constant NO3__WD      = 'no';
Constant YES1__WD      = 's//';
Constant YES2__WD      = 'si';
Constant YES3__WD      = 'sí';

Constant AMUSING__WD = 'curiosidades';
Constant FULLSCORE1__WD  = 'puntuacion';
Constant FULLSCORE2__WD  = 'punt';
Constant QUIT1__WD    = 'q//';
Constant QUIT2__WD    = 'terminar';
Constant RESTART__WD    = 'reiniciar';
Constant RESTORE__WD    = 'recuperar';
-) instead of "Vocabulary" in "Language.i6t".



Section 4 - Pronouns and Descriptors

Include (-
Array LanguagePronouns table

!   palabra  GNAs que pueden                conectado
!            seguirle:                      a:
!              a     i
!              s  p  s  p
!              mfnmfnmfnmfn

    '-lo'	$$101000100001                    NULL
    '-los'	$$000101000101                    NULL
    '-la'	$$010000010000                    NULL
    '-las'	$$000010000010                    NULL
    '-le'	$$110000110000                    NULL
    '-les'	$$000110000110                    NULL
    'él'		$$100000100000                    NULL
    'ella'	$$010000010000                    NULL
    'ellos'	$$000100000100                    NULL
    'ellas'	$$000010000010                    NULL;
-) instead of "Pronouns" in "Language.i6t".

Include (-
Array LanguageDescriptors table

    !palabra  GNAs que pueden     tipo de   conectado
    !              seguirles:	  descriptor:       con:
    !          a     i
    !          s  p  s  p
    !          mfnmfnmfnmfn                 
    
    'mi'	$$110110110110    POSSESS_PK      0
!    'este'	$$100000100000    POSSESS_PK      0 ! Mel Hython: para evitar problemas con direccion 'este'
    'estos'	$$000100000100    POSSESS_PK      0
    'esta'	$$010000010000    POSSESS_PK      0
    'estas'	$$000010000010    POSSESS_PK      0
    'ese'	$$100000100000    POSSESS_PK      1
    'esa'	$$010000010000    POSSESS_PK      1
    'esos'	$$000100000100    POSSESS_PK      1
    'esas'	$$000010000010    POSSESS_PK      1
    'su'	$$110000110000    POSSESS_PK      '-le'
    'sus'	$$000110000110    POSSESS_PK      '-le'
    'el'	$$100000100000    DEFART_PK       NULL
    'la'	$$010000010000    DEFART_PK       NULL
    'los'	$$000100000100    DEFART_PK       NULL
    'las'	$$000010000010    DEFART_PK       NULL
    'un'	$$100000100000    INDEFART_PK     NULL
    'una'	$$010000010000    INDEFART_PK     NULL
    'unos'	$$000100000100    INDEFART_PK     NULL
    'unas'	$$000010000010    INDEFART_PK     NULL
    'algún'	$$100000100000    INDEFART_PK     NULL
   'algunos' $$000100000100    INDEFART_PK     NULL
   'algunas' $$000010000010    INDEFART_PK     NULL
 'encendido' $$100000100000    light             NULL
 'encendida' $$010000010000    light             NULL
'encendidos' $$000100000100    light             NULL
'encendidas' $$000010000010    light             NULL
   'apagado' $$100000100000    (-light)          NULL
   'apagada' $$010000010000    (-light)          NULL
  'apagados' $$000100000100    (-light)          NULL
  'apagadas' $$000010000010    (-light)          NULL;
-) instead of "Descriptors" in "Language.i6t".


Section 5 - Numbers

Include (-
Array LanguageNumbers table
    'un' 1 'uno' 1 'una' 1 'dos' 2 'tres' 3 'cuatro' 4 'cinco' 5
    'seis' 6 'siete' 7 'ocho' 8 'nueve' 9 'diez' 10
    'once' 11 'doce' 12 'trece' 13 'catorce' 14 'quince' 15
    'dieciséis' 16 'diecisiete' 17 'dieciocho' 18 'diecinueve' 19
    'veinte' 20;

[ LanguageNumber n venti m f;
    if (n==0) { print "cero"; rfalse; }
    if (n<0) { print "menos "; n=-n; }
#Iftrue (WORDSIZE == 4);
    if (n >= 1000000000) {
        !if (f == 1) print ", ";
    	!print (LanguageNumber) n/1000000000, " billón"; n = n%1000000000; f = 1;
		if (n<2000000000) print "mil";
        else { LanguageNumber(n/1000000000,1); print " mil";} 
        n=n%1000000000; f = 1;
        if (n~=0) print " ";
    }
    if (n >= 1000000) {
    	print (LanguageNumber) n/1000000;
		if ((n<2000000) && (f==0)) print " millón";
        else { print " millones";} 
        n = n%1000000;
        if (n~=0) print " ";
    }
#Endif;
    if (n>=1000) { 
		if (n<2000) print "mil";
        else { LanguageNumber(n/1000,1); print " mil";} 
        n=n%1000; 
        if (n~=0) print " ";
    }
    if (n>=100)  { 
		CientosEspanol(n/100); 
        if (n%100~=0) print " ";
		n=n%100; 
    }
    if (n==0) rfalse;

    if (n<10) {
		DigitoEspanol(n); rfalse;
    }
    if (n>=20)
	{	m=n/10;
        if (n%10~=0) {
				if (m==2) print "veinti";
            } else {
				if (m==2) print "veinte";
            }
            if (m==3) print "treinta";
			if (m==4) print "cuarenta";
            if (m==5) print "cincuenta";
            if (m==6) print "sesenta";
            if (m==7) print "setenta";
            if (m==8) print "ochenta";
            if (m==9) print "noventa";
            if (n%10==0) rfalse;
            if (m>2) print " y "; 
            DigitoEspanol(n%10, (m==2)&&(venti==0)); rfalse;
        }
    if (n==10) { print "diez"; rfalse; }
    if (n==11) { print "once"; rfalse; }
    if (n==12) { print "doce"; rfalse; }
    if (n==13) { print "trece"; rfalse; }
    if (n==14) { print "catorce"; rfalse; }
    if (n==15) { print "quince"; rfalse; }
    if (n==16) { print "dieciséis"; rfalse; }
    if (n==17) { print "diecisiete"; rfalse; }
    if (n==18) { print "dieciocho"; rfalse; }
    print "diecinueve";
];

[ DigitoEspanol n venti;
    if (n==1) { print "un"; rfalse; }
    if (n==2) { 
         if (venti) {print "dós";} else {print "dos"; };
         rfalse; }
    if (n==3) { 
         if (venti) {print "trés";} else {print "tres"; };
         rfalse; }
    if (n==4) { print "cuatro"; rfalse; }
    if (n==5) { print "cinco"; rfalse; }
    if (n==6) { 
         if (venti) {print "séis";} else {print "seis"; };
         rfalse; }
    if (n==7) { print "siete"; rfalse; }
    if (n==8) { print "ocho"; rfalse; }
    if (n==9) { print "nueve"; rfalse; }
];

[ CientosEspanol n;
	if (n==1) { print "ciento"; rfalse; }
	if (n==2) { print "dos";}
	if (n==3) { print "tres";}
	if (n==4) { print "cuatro";}
	if (n==5) { print "quinientos"; rfalse;}
	if (n==6) { print "seis";}
	if (n==7) { print "sete";}
	if (n==8) { print "ocho";}
	if (n==9) { print "nove";}
	print "cientos"; rfalse;
];
-) instead of "Numbers" in "Language.i6t".


Section 6 - Translation

Include (-
! ---------------------------------------------------------------------------
!   Parte III.   Traducción
! ---------------------------------------------------------------------------

!------------------------------------
! Funciones de ayuda a la depuración
!------------------------------------

#ifdef DEBUG;
[ ImprimeBuffer b desde l i;
    for (i=desde:i<desde+l:i++)
    print (char) b->i;
];

[ ImprimeTodoElBuffer b;
#ifdef TARGET_ZCODE;
   ImprimeBuffer(b, 2, b->1);
#ifnot; !TARGET_GLULX
   ImprimeBuffer(b, WORDSIZE, b-->0);
#endif;
];

#endif; !DEBUG

#ifdef TARGET_GLULX; ! TARGET_GLULX
[ PasarAMinuscula buffer   ! [INFSP] Necesario en EspanolAInformes (en modo Glulx), para q el buffer
        i;                 !         sea reconocido (al usar infinitivo en mayuscula (EXAMINAR) o verbos pronominales (EXAMINALA)
    for (i=WORDSIZE:i<(WORDSIZE+(buffer-->0)):i++)
        buffer->i = VM_UpperToLowerCase (buffer->i);
    return buffer;
];
#endif; !TARGET_

!----------------------------------------------------------------
! [010515] Rutina nueva, que recibe una palabra de diccionario y un
! lugar donde buscar, y retorna "true" si alguno de los objetos de ese
! lugar tiene esa palabra en su campo nombre, name_f...
!
! Es usada por la rutina ArreglarLosY, pues se mira si la palabra que
! viene detrás de la Y es un nombre, y si lo es, si es aplicable a algún
! objeto cercano. Observar que fallará en los objetos que proporcionen
! su propio parse_name. 
!----------------------------------------------------------------
[ EncajeSimplon w donde i;
  objectloop(i in donde) {
    if (WordInProperty(w, i, name)) rtrue;

    if (children(i) && EncajeSimplon(w, i)) rtrue;
  }
  rfalse;
];


!----------------------------------------------------------------
! QuitarAcentos
!
! La siguiente función prueba a quitar los acentos de las palabras que
! no hayan podido ser interpretadas. De este modo, el jugador puede usar
! o no los acentos. Para ello el juego debe definir las palabras sin acentos
! por ejemplo:
! object sillon "sillón confortable"
! with name 'sillon' 'confortable'
!
! Si el jugador pone: "mira sillon", la palabra encaja directamente y es
! comprendida. Si pone "mira sillón", no es comprendida, de modo que se
! le quita el acento y se reintenta el parsing.
!
! Este caso no es especialmente importante, pues el programador
! siempre puede definir 'sillon' y 'sillón', ambos como nombres para
! el objeto. Pero el asunto es más importante para el caso de los
! verbos, ya que si el jugador teclea "cógelo" este es separado en
! "cóge" y "-lo" y el verbo "cóge" (con acento) no sería
! comprendido.
!
! La llamada a esta función puede desactivarse con el comando de
! debugging "acentos sí" de modo que los acentos que teclee el jugador
! no serán eliminados (con propósitos de depuración)

[ QuitarAcentos buf pars x i word at len;

#ifdef DEBUG;
    if (parser_trace >= 7) ! imprimir el buffer recibido
    {
          print "^[ QuitarAcentos:  ";
          print "Buffer recibido: |";
             ImprimeTodoElBuffer(buf);
          print "|^";
    } 
#endif;
    VM_Tokenise(buf, pars); 
    for (x=1:x<=tokenCount(pars):x++) ! para cada token
    {
	word = tokenDict (pars,x); !dictionary value of token 1,2,3...
	at = tokenPos (pars,x); ! position in buffer of token 1,2,3... 
	len = WordLength (x);! length in chars of token 1,2,3...

	if (word==0) ! no comprendida
       {
#ifdef DEBUG;
		if (parser_trace>=7)
		{
		    print "    QuitarAcentos:NO COMPRENDIDO: |";
			ImprimeBuffer(buf, at, len);
		    print "|^";
		}
#endif;
		for (i=at:i<at+len:i++)
		   switch(buf->i)
		  {
			'á': buf->i='a';
			'é': buf->i='e';
			'ë': buf->i='e';
			'í': buf->i='i';
			'ó': buf->i='o';
			'ú': buf->i='u';
			'ü': buf->i='u';
			'ñ': buf->i='n'; 
		!             '?': buf->i=' ';
		!             '¿': buf->i=' ';
		!             '!': buf->i=' ';
		!         '¡': buf->i=' ' ;    
		   }
        VM_Tokenise(buf, pars); 
        }
    }

#ifdef DEBUG;
    if (parser_trace>=7){
        print "    Buffer sin acentos: |";
        ImprimeTodoElBuffer(buf);
        print "|^";
    }
#endif;
];

! funciones de soporte para gestionar parse y buffer
!  From InformFAQ - Roger Firth

[ tokenDict pars w; ! dictionary value of token 1,2,3...
#Ifdef TARGET_ZCODE;
	return pars-->(2*w - 1);
#Ifnot; ! TARGET_GLULX
	return pars-->(3*w - 2);
#Endif; ! TARGET_
];
[ tokenLen pars w; ! length in chars of token 1,2,3...
#Ifdef TARGET_ZCODE;
	return pars->(4*w);
#Ifnot; ! TARGET_GLULX
	return pars-->(3*w - 1);
#Endif; ! TARGET_
];
[ tokenPos pars w; ! position in buffer of token 1,2,3...
#Ifdef TARGET_ZCODE;
	return pars->(4*w + 1);
#Ifnot; ! TARGET_GLULX
	return pars-->(3*w);
#Endif; ! TARGET_
]; 

[ tokenCount pars;
#Ifdef TARGET_ZCODE;
	return pars->1;
#Ifnot; ! TARGET_GLULX
	return pars-->0;
#Endif; ! TARGET_
];

!-----------------------------------------------------
! LanguageToInformese
!
! Esta parte es interesante. Debe separar los sufijos pronominales
! como en "cogela" "mirale", claro que no basta con ver si las dos
! últimas letras del verbo son "la" "le", etc, pues el verbo podría
! terminar de forma "natural" en esas letras (como en "habla"). Así
! que hay que separar el sufijo sólo si el verbo no ha sido hallado en
! el diccionario.
!
[ LanguageToInformese ;
    EspanolAInformes(buffer, parse);
];

! La función que verdaderamente hace la traducción es la siguiente. Ha
! sido separada de LanguageToInformese porque es llamada también desde
! LanguageIsVerb, pero recibe un buffer diferente para procesar. 

[ EspanolAInformes buf pars x i word at len romper_en siguiente retokenise at2; !    print "   EspanolAInformes called^"; ! infsp debug

   #ifdef TARGET_GLULX; ! TARGET_GLULX
    buf = PasarAMinuscula (buf); ![INFSP] Necesario para q no cazque al procesar infinitivos
   #endif;

    VM_Tokenise( buf, pars);     retokenise=0;
#ifdef DEBUG;
    if (parser_trace>=7) !imprimir el buf recibido
    {
          print "^[ EspanolAInformes:  ";
          print "Buffer recibido: |";
		ImprimeTodoElBuffer(buf);
          print "|^  ";
    } 
#endif;
    if (quitacentos) QuitarAcentos(buf, pars);

     for (x=1:x<=tokenCount(pars):x++) ! para cada token
    {
	word = tokenDict (pars,x); !dictionary value of token 1,2,3...
	at = tokenPos (pars,x); ! position in buffer of token 1,2,3... 
	len = tokenLen (pars,x);! length in chars of token 1,2,3...

#ifdef DEBUG;
	if (parser_trace>=7){
          print "Palabra ",x," : ";
          if (word==0)
            print "<no comprendida>";
          else 
            print (address) word," ^";
          print " ^";
        }        
#endif;

	if (dialecto_sudamericano && (word == 'coge'))
	{
	  ! Un poco bestia, pero funciona. En caso de dialecto sudamericano,
	  ! cambiar un par de letras convierte "coge" en "jode"
	  buf->(at)     = 'j';
	  buf->(at + 2) = 'd';
	  retokenise    = 1;
	  if (dialecto_sudamericano == 1)  ! [071030_git]
	  {
	    print "[Este juego utiliza por defecto el dialecto sudamericano,
		    por lo que aquí COGER es entendido como una palabra
		    malsonante. Por favor, utiliza TOMAR en su lugar, o bien
		    elige el dialecto castellano con DIALECTO CASTELLANO.]^";
	    dialecto_sudamericano = 2;
	  }
	}
    
    if (word=='del' or 'al')
    {
        buf->(at+len-1)=' ';    ! convertir "del" "al" en "de"
                                       ! "a" respectivamente
        retokenise=1;
    }
    

    ! Si el jugador ha escrito "no", y previamente el programador
    ! había puesto a 1 el flag "PreguntaSiNo" (que indica que
    ! acaba de hacerse una pregunta que podría admitir NO como
    ! respuesta), en ese caso cambiamos "no" por "xo". La
    ! gramática define el verbo "xo" para generar la acción NO
    ! (negar), y así lo distinguimos de la acción "Ir noroeste"
    if ((word=='no')&&(PreguntaSiNo==1))
    {
        buf->(at+len-1)='x';
        PreguntaSiNo=0;
        retokenise=1;
    }
        
        ! "pegar" las expresiones "y luego" "y despues" "y entonces"
        ! para que queden "yluego" "ydespues" "yentonces"
        ! que es como las reconoce el parser
     if (word=='y//')
    {
       siguiente= tokenDict (pars,x+1); ! palabra siguiente

	if (siguiente==DESPUES11_WD or DESPUES21_WD or DESPUES31_WD)
       {
	   at2 = tokenPos (pars,x+1); ! position in buffer of token 1,2,3... 
           for (i=0:i<tokenLen(pars,x+1):i++){
                   buf->(at2+i) = ' '; ! borrar palabra 'entonces' (pisándola con espacios)
	   }
           buf->(at+len)='l'; ! agregar 'luego' inmediatamente despues de 'y', formando 'yluego'
           buf->(at+len+1)='u';
           buf->(at+len+2)='e';
           buf->(at+len+3)='g';
           buf->(at+len+4)='o';
           retokenise=1;
#ifdef DEBUG;
           if (parser_trace>=7) !imprimir el buf recibido
	   {
		print "^[   YLUEGO:  ";
		print "Buffer recibido: |";
		ImprimeTodoElBuffer(buf);
		print "|^  ";
	    } 
#endif;
       }
    }     

    if (word==0) ! no comprendida
    {
#ifdef DEBUG;
        if (parser_trace>=7)
        {
            print "NO COMPRENDIDO: |";
            ImprimeBuffer(buf, at, len);
            print "|^";
        }
#endif;        
        if (len > 2) !sólo si tiene más de tres letras
        {
           romper_en=0;
           if ((buf->(at+len-1)=='s') &&
            (buf->(at+len-2)=='a' or 'o' or 'e') &&
            (buf->(at+len-3)=='l'))
            romper_en=3;
           if ((buf->(at+len-1)=='a' or 'o' or 'e') &&
            (buf->(at+len-2)=='l'))
            romper_en=2;
           if ((buf->(at+len-1)=='e') &&
            (buf->(at+len-2)=='m' or 't' or 's'))
            romper_en=2;  ! [001108] Antes ponía == ¡seré burro!
           if (romper_en) 
           {
            ! [990524]
            ! Antes de modificar el buffer, comprobemos si
            ! servirá para algo, es decir, si la palabra que
            ! queda una vez separado el sufijo existe en el
            ! diccionario y es un verbo
            i=DictionaryLookup(buf+at, len-romper_en);
            
              if (i) if ((i->#dict_par1)&1)
              {
                LTI_Insert(at+len-romper_en, '-', buf);
                LTI_Insert(at+len-romper_en, ' ', buf);
                VM_Tokenise(buf,pars);
               }
              if (QuitandoRFinal(buf+at, len-romper_en)||
                  BuscarEntreVerbosIrregulares(buf+at, len-romper_en))
              {
                LTI_Insert(at+len-romper_en, '-', buf);
                LTI_Insert(at+len-romper_en, ' ', buf);
                VM_Tokenise(buf,pars);
               }
             } ! if (romper_en
        } ! if (len > 2
    } ! if (word==0
    } ! for (x=0:

    if (retokenise==1) ! [INFSP] Agregado if, como en la seccion Glulx
       VM_Tokenise(buf, pars);

    ArreglarLosY(buf, pars);
    
    ! Como paso final, quitamos las palabras que aparezcan dos veces
    ! seguidas. Esto puede ocurrir si el jugador teclea un comando
    ! incompleto, como "MIRA HACIA", y el parser le pregunta "¿Hacia
    ! donde quieres mirar?" y el jugador responde "HACIA EL NORTE". En
    ! este caso se construiría la orden concatenada: "MIRA HACIA HACIA
    ! EL NORTE".
    if (PreguntaCualExactamente==1){
        PreguntaCualExactamente=0;
        EliminarDuplicados(buf, pars);
    }
    
#ifdef DEBUG;
    if (parser_trace>=7){
       print "Buffer traducido a informese: ^|";
        ImprimeTodoElBuffer(buf);
       print "| (", pars->1," palabras) ^";
    }
#endif;
];


[ ArreglarLosY buf pars
    word at len x i retoke;

    for (x=1:x<=tokenCount(pars):x++) ! para cada token
    {
 	word = tokenDict (pars,x); !dictionary value of token 1,2,3...
        if (word=='y//')
	{
		i = tokenDict (pars,x+1); ! palabra siguiente
        ! [010515] arreglado bug. at y len no apuntaban a la
        ! palabra siguiente, sino a la propia 'y', por lo que no
        ! eran reconocidos los verbos en infinitivo
		at = tokenPos (pars,x+1); ! position in buffer of token siguiente 
		len = tokenLen (pars,x+1);! length in chars of token siguiente

        ! [010515] Añadido. Si la palabra es noun, se retorna
        ! (aunque pueda ser también un verbo) de este modo, en
        ! COGE VINO Y CAVA, si el juego tiene un objeto llamado
        ! "cava", la frase será parseada como tratando de coger
        ! dos objetos, llamados "vino" y "cava". Si el juego no
        ! define el sustantivo "cava", la frase será parseada como
        ! dos acciones en secuencia <<Coger vino>> y <<Excavar>>
		if (i && (i->#dict_par1)&128) {
			if (EncajeSimplon(i, location)) continue;
		}
		if (i && ((i->#dict_par1)&1)||QuitandoRFinal(buf+at,len)||
			BuscarEntreVerbosIrregulares(buf+at, len))
		{
			at = tokenPos (pars,x); ! position in buffer of token siguiente 
			buf->(at)='.';
			retoke=true;
		}
	}
    }
    if (retoke) VM_Tokenise(buf, pars);
];

[ EliminarDuplicados buf pars
    word at len x i siguiente retokenise;

!    VM_Tokenise(buf, pars);
#ifdef DEBUG;
    if (parser_trace>=8) !imprimir el buffer recibido
    {
          print "^[ EliminarDuplicados:  ";
          print "Buffer recibido: |";
              ImprimeTodoElBuffer(buf);
          print "| (", pars->1, " palabras)^";
    } 
#endif;
    for (x=1:x<=tokenCount(pars):x++) ! para cada token
    {
	word = tokenDict (pars,x); !dictionary value of token 1,2,3...
	siguiente = tokenDict (pars,x+1); !dictionary value of token 1,2,3...
	at = tokenPos (pars,x); ! position in buffer of token 1,2,3... 
	len = tokenLen (pars,x);! length in chars of token 1,2,3...
    if ((word==siguiente) && (word~=0))
    {
#ifdef DEBUG;
        if (parser_trace>=8) print "Encontrados duplicados!:",
		(address) word, "=", (address) siguiente, ".^";
#endif;
        for (i=at:i<at+len:i++) buf->i=' ';
        retokenise=1;
    }
    }
    if (retokenise) 
    VM_Tokenise(buf, pars);

#ifdef DEBUG;
    if (parser_trace>=8) !imprimir el buffer recibido
    {
          print "Buffer resultante: |";
        ImprimeTodoElBuffer(buf);
          print "| (", pars->1, " palabras)^";
    } 
#endif;
];


! La siguiente función debe devolver si el verbo recibido es
! reconocido o no. Se recibe el buffer completo y "pos" indica qué
! palabra dentro del buffer "pars" es el supuesto verbo.
! Hay que devolver la dirección de diccionario del verbo en cuestión.
!
! Lo usamos para admitir infinitivos. El método es:
!   Si la palabra corresponde a una palabra de diccionario, no hacemos
!   nada (retornamos esa palabra, sin molestarnos en comprobar que sea
!   un verbo. Ya lo hará el parser).
!
!   Si la palabra no está en el diccionario, miramos si termina en
!   'r', y de ser así se la quitamos y re-tokenizamos. Si de este modo
!   se obtiene una palabra en el diccionario, retornamos su valor (sin
!   comprobar que sea un verbo, ya lo hará el parser).
!
!   Si tampoco de este modo se reconoce, comparamos la palabra dada
!   con todos los verbos irregulares conocidos. Si en uno de ellos
!   encontramos coincidencia, retornamos el primer elemento de la
!   propiedad "imperativo" del verbo en cuestión.
!
!   En el caso de la desambiguacion, puede darse que el jugador responda
!   con un verbo nuevo, pero con sufijo pronominal la/le/lo/me/te/se (ej. examinala)
!   Por ello se hace una llamada a EspanolAInformes

[ LanguageIsVerb buf pars pos
    i word at len;
    
#ifdef DEBUG;
    if (parser_trace>=7) !imprimir el buffer recibido
    {
	print "^[ LanguageIsVerb:  ";
	print "Buffer recibido: |";
		ImprimeTodoElBuffer(buf);
	print "|, pos=", pos, "^  ";
    } 
#endif;
    if (PreguntaCualExactamente) ! caso de desambiguación
	EspanolAInformes(buf, pars); ! revisar la existencia de sufijos pronominales la/le/lo/me/te/se
    word = tokenDict (pars,pos); !dictionary value of token 1,2,3...
    at = tokenPos (pars,pos); ! position in buffer of token 1,2,3... 
    len = tokenLen (pars,pos);! length in chars of token 1,2,3...

    ! Si la palabra se reconoce, devolverla sin más
     if (word~=0 && word->#dict_par1 & 1 ~= 0)
    {
#ifdef DEBUG;
	if (parser_trace>=7) print " la palabra ~", (address)
		word, "~ está en el diccionario.^";
#endif;
	return    (word);
    }

   
    ! Si no, probar a ver si se reconoce sin la 'r' final
    i=QuitandoRFinal(buf + at,len);

    ! Si no la ha reconocido, intentamos ver si es un verbo irregular
    if (i~=0)
    {
	if (parser_trace>=7) print "^ Verbo reconocido
		al quitarle la 'r' final.^";
    }
    else 
    {
	if (parser_trace>=7) print "^ Verbo no reconocido sin la
		'r'. ^Probando irregulares...";
 	i=BuscarEntreVerbosIrregulares(buf + at,len);
#ifdef DEBUG;
	if (parser_trace>=7) 
	{
		if (i==0) print "No reconocido como irregular.^";
		else print "      Reconocido como el verbo ", (address) i, "^";
	}
#endif;
    }     
       if (parser_trace>=7) 
        print " ^                   -- end LanguageIsVerb ]^";
    return i;    
];

[ QuitandoRFinal texto longitud
    i;

#ifdef DEBUG;
    if (parser_trace>=9) {
	print "^[ QuitandoRFinal: buffer recibido |";
		ImprimeBuffer(texto, 0, longitud);
	print "|^";
    }
#endif;	
	if (texto->(longitud-1)~='r')
    {
	if (parser_trace>=9) print "No termina en 'r'^";
	return 0;
    }
    
    i=DictionaryLookup(texto, longitud-1);     
    if (dialecto_sudamericano && (i == 'coge'))
    {
      if (dialecto_sudamericano == 1)  ! [071030] git
      {
        print "[Este juego utiliza por defecto el dialecto sudamericano,
                por lo que aquí COGER es entendido como una palabra
                malsonante. Por favor, utiliza TOMAR en su lugar, o bien
                elige el dialecto castellano con DIALECTO CASTELLANO.]^";
        dialecto_sudamericano = 2;
      }
      return 'jode';
    }     
     if ((i->#dict_par1)&1) return i;
    else 
    {
    if (parser_trace>=9) print "Está en el diccionario, pero no es verbo.^";
    return 0;
    }
];


[ BuscarEntreVerbosIrregulares texto longitud
    verbo i k;

    objectloop (verbo ofclass VerboIrregular)
    {
#ifdef DEBUG;
	if (parser_trace>=8) print "^[Bucando irregulares. Probando
		con ~", (name) verbo, "~.-->"; 	
#endif;
		k = VM_PrintToBuffer (texto_impreso,46,verbo);

    
        !Si sus longitudes no coinciden no es necesario seguir comparando
        if (k~=longitud) jump NoCoincide;
    
        !Si sus longitudes coinciden, miramos letra a letra
        for (i=0:i<k:i++)
            if ((texto->i)~=(texto_impreso->(i+WORDSIZE)))
        
	jump NoCoincide; ! si una sola letra no coincide,
	! Si ha pasado los test anteriores, hemos hallado una
	! coincidencia
	#ifdef DEBUG;if (parser_trace>=8) print "¡coincide!^";#endif;
	return (verbo.&imperativo-->0);

	.NoCoincide;
	#ifdef DEBUG;if (parser_trace>=8) print "no coincide^";#endif;
    }
    return 0;
];
-) instead of "Translation" in "Language.i6t".


Section 7 - Articles

Include (-
Constant LanguageAnimateGender   = male;
Constant LanguageInanimateGender = male;

Constant LanguageContractionForms = 1;     ! Para el español
! No se produce contracción del artículo. Sólo de las preposiciones
! como en "del" y "al", pero eso no está contemplado por el manual
! del traductor, por lo que es necesario otro tipo de truco

[ LanguageContraction ;
    return 0;
];

Array LanguageArticles -->
    ! Forma de contracción 0:
    ! Cdef   Def  Indef  
    "El " "el " "un "    
    "La " "la " "una "   
    "Los " "los " "unos "  
    "Las " "las " "unas ";

                   !             a           i
                   !             s     p     s     p
                   !             m f n m f n m f n m f n                 
Array LanguageGNAsToArticles --> 0 1 0 2 3 2 0 1 0 2 3 2;
-) instead of "Articles" in "Language.i6t".


Section 8 - Commands

Include (-
[ LanguageVerb i aux;

    if (ImprimirIrregular(i)==0){
        !print "^   LanguageVerb: Verbo no es irregular.^"; ! infsp debug
      
      ! Tatar de matchear con la brújula - 807.7 infsp
!      objectloop (aux ofclass CompassDirection){
      objectloop (aux in Compass){
        if (WordInProperty(i, aux, name)) {
          print "ir hacia algún lado";
!          !LanguageDirection (aux.door_dir); ! the direction name as adverb
          rtrue; ! no avanzar más en la rutina
        }    
       }
       
       ! Un ultimo intento, con una rutina stub a proveer por el autor
       if (PrintVerb(i)==0){
         print (address) i; print "r";
        }
    }

    if (i=='mete') rtrue;
    
#ifdef TARGET_ZCODE;
    ! Comprobemos si era un verbo reflexivo (-te)
    texto_impreso-->0 = 50;
    @output_stream 3 texto_impreso;
    print (address) i;
    @output_stream -3;
    aux=2;
!    print "^   LanguageVerb: i : ",(address) i,"^"; ! infsp debug
    if (texto_impreso->(texto_impreso->1+1)=='e')
     if (texto_impreso->(texto_impreso->1) == 't' or 's' or 'm')
     {
!     print "^   LanguageVerb:Verbo reflexivo."; ! infsp debug
       if (actor ~= player) print "se";
        else print (string) PARTICULA_TE; ! "te"
     }
#endif;
#ifdef TARGET_GLULX;
    aux=Glulx_PrintAnyToArray(texto_impreso, 50, i);
    if ((texto_impreso->(aux-1)=='e')&&
        (texto_impreso->(aux-2) == 't' or 's' or 'm')) 
    {
       if (actor ~= player) print "se";
        else print (string) PARTICULA_TE;
    }
#endif;
    rtrue;

];

[ ImprimirIrregular v i;
  ! Imprime los verbos irregulares (es decir, aquellos en los que no basta
  ! añadir una "r" al imperativo). Por ejemplo, si el jugador teclea "friega"
  ! la respuesta por defecto sería "¿Qué quieres friegar?"
  ! Para evitar esto, el programador debe definir un objeto de la clase
  ! VerboIrregular, con nombre "fregar" y propiedad name = "friega"
  ! Esta rutina busca entre los verbos así definidos, en el campo name
  ! y si encuentra una coincidencia imprime el nombre del objeto para
  ! el cual se halló.

  ! Para mayor flexibilidad aún, se permite que el programador incluya
  ! una rutina en la propiedad nombre_corto del verbo, por si el nombre
  ! del verbo a imprimir es variable según el momento en que se llame.
  ! Si existe nombre_corto para el verbo en cuestión, se ejecuta dicha rutina
  ! de lo contrario se imprime el nombre de ese verbo sin más.

  ! Ver SpanishG.h para ejemplos de declaración de verbos irregulares.

  objectloop (i ofclass VerboIrregular)
   if (WordInProperty(v, i, imperativo)) {
     if (i.&short_name~=0) return(PrintOrRun(i, short_name, 1));
     else { print (name) i; rtrue;}}
  rfalse;
];

!  LanguageVerbLikesAdverb is called by PrintCommand when printing an UPTO_PE
!  error or an inference message.  Words which are intransitive verbs, i.e.,
!  which require a direction name as an adverb ('walk west'), not a noun
!  ('I only understood you as far as wanting to touch /the/ ground'), should
!  cause the routine to return true.

[ LanguageVerbLikesAdverb w;
    if (w == 'vete' or 've' or 'camina' or
        'anda' or 'corre' or 'vuelve' or 'ir')
        rtrue;
    rfalse;
]; 

!  LanguageVerbMayBeName is called by NounDomain when dealing with the 
!  player's reply to a "Which do you mean, the short stick or the long
!  stick?" prompt from the parser. If the reply is another verb (for example,
!  LOOK) then then previous ambiguous command is discarded /unless/
!  it is one of these words which could be both a verb /and/ an
!  adjective in a 'name' property.

[ LanguageVerbMayBeName w;
    if (w == 'long' or 'short' or 'normal'
                    or 'brief' or 'full' or 'verbose')
        rtrue;
    rfalse;
];
-) instead of "Commands" in "Language.i6t".


Section 9 - Short Texts

Include (-
Constant NKEY__TX   = "S = Siguiente";
Constant PKEY__TX   = "    P=Previo";
Constant QKEY1__TX      = "Q=Volver al juego";
Constant QKEY2__TX      = "Q = Menú anterior";
Constant RKEY__TX       = "INTRO = leer este tema";

Constant NKEY1__KY  = 'S';
Constant NKEY2__KY  = 's';
Constant PKEY1__KY  = 'P';
Constant PKEY2__KY  = 'p';
Constant QKEY1__KY      = 'Q';
Constant QKEY2__KY      = 'q';

Constant SCORE__TX = "Punt.: ";
Constant MOVES__TX    = "Movim.: ";
Constant TIME__TX       = "Hora: ";
Global CANTGO__TX         = "No puedes ir por ahí.";
Global FORMER__TX         = "tu antiguo ~yo~";
Global YOURSELF__TX       = "ti mismo";
Constant YOU__TX            = "Tú";
Constant DARKNESS__TX  = "Oscuridad";

Constant PARTICULA_TE       = "te";

Constant THOSET__TX      = "esas cosas";
Constant THAT__TX        = "eso";
Constant OR__TX          = " o ";
Constant NOTHING__TX       = "nada";
Global IS__TX             = " ves";
Global ARE__TX            = " ves";
Global IS2__TX            = "ves ";
Global ARE2__TX           = "ves ";
Global IS3__TX        = "ves";
Global ARE3__TX       = "ves";
Constant AND__TX          = " y ";
#ifdef I7_SERIAL_COMMA;
Constant LISTAND__TX   = ", y ";
Constant LISTAND2__TX  = " y ";
#ifnot;
Constant LISTAND__TX   = " y ";
Constant LISTAND2__TX  = " y ";
#endif; ! I7_SERIAL_COMMA
Constant WHOM__TX      = "que ";  ! Al parecer, aquí sobraban los espacios
Constant WHICH__TX     = "que ";  ! de antes de los 'que'. [020423]
Constant COMMA__TX      = ", ";
-) instead of "Short Texts" in "Language.i6t".




Section 10 - Printed Inflections

Include (-
! Definimos una función para imprimir el verbo coger. Esto hace más fácil
! la adaptación de los juegos a los dialectos sudamericanos, en los
! que debe usarse "tomar" en lugar de "coger"
! 
! La variable global que elige el dialecto se fija en tiempo de
! ejecución con el meta-verbo "dialecto". También puede fijarse en
! Initialize para que su valor por defecto sea 1.
!
[ coge sufijo;
    if (dialecto_sudamericano)
      print "toma";
    else print "coge";
    if (sufijo ~= 0)
       print (string) sufijo;
!    #ifndef NI_BUILD_COUNT; print (string) sufijo;#endif; !desde I7 no puede usarse 'sufijo'
];

! La siguiente es la versión con la primera letra mayúscula

[ MCoge sufijo;
    if (dialecto_sudamericano)
    print "Toma";
    else print "Coge";
    if (sufijo ~= 0)
       print (string) sufijo;
!    #ifndef NI_BUILD_COUNT; print (string) sufijo;#endif; !desde I7 no puede usarse 'sufijo'
];

! Y finalmente una versión con todo mayúsculas

[ MMCoge sufijo;
    if (dialecto_sudamericano)
    print "TOMA";
    else print "COGE";
    if (sufijo ~= 0)
       print (string) sufijo;
!    #ifndef NI_BUILD_COUNT; print (string) sufijo;#endif; !desde I7 no puede usarse 'sufijo'
];
-) before "Printed Inflections" in "Language.i6t".

Include (-
! Funciones para manejar concordancias de género y número en los
! mensajes de respuesta genéricos.
!
! o -> escribe la terminación -o -a -os -as según el género y número
! del objeto recibido, para hacer concordar los adjetivos.
!
! n -> escribe la terminación -"" -n según el número del objeto, para
! hacer concordar el verbo en plural.
!
! esta -> escribe "está" o "están" según el número del objeto.
!
! del -> escribe "del" "de la" "de los" "de las" según el género y
! número del objeto. En realidad, determina qué artículo habría de ir
! y si éste es "el" realiza la contracción "del".
!
! al -> como del, pero con "al" "a la" "a los" "a las".
!
! lo -> Escribe "lo" "la" "le" "los" "las" "les" (proname) según el
! género y número del objeto y según sea animate o no.
!

[ o obj gna;

    gna=GetGNAOfObject(obj);
    switch(gna)
    {
     0,6: print "o";
     1,7: print "a";
     3,9: print "os";
     4,10: print "as";
    }
];    

[ e obj gna;

    gna=GetGNAOfObject(obj);
    switch(gna)
    {
     0,6: print "e";
     1,7: print "a";
     3,9: print "es";
     4,10: print "as";
    }
];


[ n obj;
    if (obj == player) print "s";
    else if (obj has pluralname) print "n";
];

[ s obj;
    if (obj has pluralname) print "s";
];

[ esta obj;
    print "está", (n) obj;
];

[ es obj;
    if (obj has pluralname) print "son";
    else print "es";
];

[ _Es obj;
    if (obj has pluralname) print "Son";
    else print "Es";
];

[ _s obj;
    if (obj has pluralname) print "es";
];

[ el_ obj;
    if (obj hasnt proper) PrefaceByArticle(obj,1,-1);
];

[ un_ obj;
    if (obj hasnt proper) PrefaceByArticle(obj,2,-1);
];


[ el obj;
    print (the) obj;
];

[ _El obj;
    print (The) obj;
];

![ un obj;
!    if (un_(obj)) print " ";
!    print (name) obj;
!];

[ un obj;
!  if (obj has proper) print "a "; ![infsp] ya se incluyó esta linea en el hackeo de Indefart.
  print (a) obj;
];

[ _Un obj; ! indefinido con la primera letra en mayuscula. -Eliuk Blau
  print (A) obj;
];


[ _nombre_ obj;
    print (name) obj;
];

[ numero obj;
    print (number) obj;
];


! "al" y "del" plantean un bonito problema. La contracción debe
! producirse si el artículo es "el", pero esto no se sabe consultando
! el GNA, pues hay palabras como "aguila" que son femeninas y no
! obstante usan "el" como artículo.
! El truquillo consiste en llamar a (the) para averiguar qué artículo
! se imprimiría (pero capturando la salida de ese print y guardándola
! en una variable). Si el artículo en cuestión empieza por 'e', se
! produce la contracción.
!
! Para capturar la salida a una variable, es necesario descender al
! lenguaje ensamblador de la Z machine. Este truco lo aprendí del
! Designers manual (respuesta al ejercicio 96, página 249)
!
[ del_ obj;
    if (obj has proper) {        ! 030305
            print "de ";
            rtrue;
    }
!print " (del) "; ! infsp debug
                
#ifdef TARGET_ZCODE;
    texto_impreso-->0 = 50;
    @output_stream 3 texto_impreso;
    print (the)obj;
    @output_stream -3;
    if (texto_impreso->2 == 'e') print "d";
    else print "de ";
#ifnot; !TARGET_GLULX
    Glulx_PrintAnyToArray(texto_impreso, 50, PrefaceByArticle, obj, 1, -1);
    if (texto_impreso->0 == 'e') print "d";
    else print "de ";
#endif;    
    if (obj hasnt proper) PrefaceByArticle(obj, 1, -1);
];

! Con "al" el truco es más complejo, ya que si el artículo impreso por
! el_ empieza por "e", hay que cambiar esta "e" por una "a". Y si no
! empieza por "e" hay que poner una "a" delante.
! Además debemos capturar el caso de que no se imprima artículo alguno
! (si el objeto proporciona una propiedad "articulos" con cadenas
! vacías).
!------------------------------------------------------------------------------
! ELIUK BLAU: He re-implementado la rutina para permitir que la primera letra
! se imprima en mayuscula si se activa el argumento 'flag' durante la llamada.
[ al_ obj flag; ! ELIUK: 'flag' es usado solo por rutina de impresion (_Al)
    #ifdef TARGET_ZCODE;
      texto_impreso-->0 = 50;
      @output_stream 3 texto_impreso;
      print (the) obj;
      @output_stream -3;
      ! print "^  ";for (i=2:i<50:i++) print (char)texto_impreso->i;print "   "; ! infsp debug
    #ifnot; !TARGET_GLULX
      ! PrintAnyToArray(texto_impreso, 50, PrefaceByArticle, obj, 1, -1);
      Glulx_PrintAnyToArray(texto_impreso, 50, Defart, obj);! 070809 infsp fix: corrige mal funcionamiento con Propios - gracias Eliuk
      ! print "^  ";for (i=0:i<2:i++) print (char)texto_impreso->i;print "   "; ! infsp debug
    #endif; !TARGET_
    
    ! ELIUK: aqui se decide si se pone mayuscula o no
    if (flag) { print "A"; } ! 'flag' activado
    else { print "a"; }      ! 'flag' desactivado

    ! ELIUK: completamos el resto del texto que se imprimira finalmente
    #ifdef TARGET_ZCODE;
      if (texto_impreso->2 == 'e') { print "l "; }
      else {
        print " ";
        if (obj hasnt proper) { PrefaceByArticle(obj, 1, -1); }
      }
    #ifnot; !TARGET_GLULX
      if (texto_impreso->0 == 'e') { print "l "; }
      else {
        print " ";
        if (obj hasnt proper) { PrefaceByArticle(obj, 1, -1); }
      }
    #endif; !TARGET_
];

[ del obj;
    print (del_) obj;
    print (name) obj;
];

[ al obj;
    print (al_) obj;
    print (name) obj;
];

! ELIUK BLAU: Rutina de impresion "A", "Al", "A la", "A los", "A las" con la primera
! letra en mayuscula. Se usa como base el funcionamiento de la rutina al_() de INFSP.
[ _Al obj;
    al_(obj,1); ! con 1 se activa 'flag' para imprimir primera letra en mayuscula
    print (name) obj;
    ! NOTA: SI POSTERIORMENTE SE INTENTA MEJORAR ESTA RUTINA, JUNTO CON al_(),
    ! LA SOLUCION JAMAS DEBE SER IMPRIMIR A UN BUFFER PORQUE LOS RESULTADOS
    ! PUEDEN SER INESPERADOS. LA PROPIA al_() YA IMPRIME A UN BUFFER, ASI QUE
    ! OTRO TRABAJO DEL MISMO TIPO IMPLICARIA TENER QUE CREAR UN NUEVO ARRAY
    ! CON EL QUE TRABAJAR O USAR EL ARRAY COMUN StorageForShortName DE LA
    ! PROPIA LIBRERIA INFORM. EN ESTE ULTIMO CASO ES CUANDO SE PRODUCEN LOS
    ! PROBLEMAS... POR OTRO LADO: CREAR UN NUEVO ARRAY SOLO PARA QUE LO USE
    ! ESTA RUTINA NO TIENE SENTIDO. POR ESO LA NECESIDAD DEL 'flag' EN al_()
];

[ lo obj gna;
    gna=GetGNAOfObject(obj);
    switch(gna)
    {
     0,6: print "lo";
     1,7: print "la";
     3,9: print "los";
     4,10: print "las";
    }
];

#ifdef NI_BUILD_COUNT;

[ IsOrAre obj;  !I7 stuffs, in Verbs.i6/GenericVerbSub
    if (obj == player)             { print "Eres"; return; }
    if (obj has pluralname)        { print "Son"; return; }
    print "Es";
];

#endif; ! NI_BUILD_COUNT

-) instead of "Printed Inflections" in "Language.i6t".


Section 11 - Long Texts - Mensajes de la libreria


Include (-

[ LanguageLM n x1 x2;
  say__p = 1;

  Answer, Ask : "No hay respuesta.";
 ! Ask:      see Answer
  Attack:    "La violencia no es la solución.";
  Burn:      "Con esa peligrosa acción no lograrías nada.";
  Buy:       "No hay nada en venta.";
  Climb:     "No creo que vayas a lograr nada así.";
  Close:    switch(n)    {
	1: print_ret "No es algo que pueda cerrarse.";
	2: "Ya estaba", (n) x1, " cerrad", (o)x1, ".";
	3: "Cierras ", (the) x1, ".";
	4:	print (The) actor, " cierra ", (the) x1, ".^";
	5:	print (The) x1, " se cierra.^";
    }
  Consult: switch (n) {
	1:	"No descubres nada interesante en ", (the) x1," sobre ese tema.";
  	2:	print (The) actor, " consulta ", (the) x1, ".^";
    }
  Cut:      "Cortándo", (lo) x1, " no lograrás gran cosa.";
  Disrobe:    switch(n)    {
	1: "No llevas puesto eso.";
	2: "Te quitas ", (the) x1, ".";
	3:	print (The) actor, " se quita ", (the) x1, ".^";
    }
  Drink:       "Eso no parece potable.";
  Drop:
    ! 2 mensajes de error, 1 aviso y 1 de éxito:
    !   1: Error, el objeto dejado no está en poder del jugador, pero
    !      está en la localidad.
    !   2: Error, el objeto dejado no está en poder del jugador ni en
    !      la localidad.
    !   3: Aviso, el objeto era una prenda que el jugador llevaba
    !      puesta y la librería va a quitarsela automáticamente para
    !      poder dejarla.
    !   4: Exito
    switch(n)
    {
	1: "Para dejar ", (the)x1, " deberías tener", (lo) x1, ".";
	2: "No ", (lo) x1, " tienes.";
        3:  print "(primero te quitas ", (the) x1, ")^"; say__p = 0; return;
	4: "Dejad", (o) x1, ".";
        5:	"No hay más lugar sobre ", (the) x1, ".";
        6:	"No hay más lugar en ", (the) x1, ".";
        7:	print (The) actor, " deja ", (the) x1, ".^";
    }
  Eat:
    !  1: Error, el objeto no tiene el atributo "comestible"
    !  2: Exito. [NOTA: la librería permite por defecto comerse
    !    cualquier cosa que tenga el atributo "comestible", pero la
    !    única acción que causa esto es que el objeto en cuestión
    !    desaparece del juego al ser comido]
    switch(n)
    {
	1: "Eso es simplemente incomestible.";
	2: "Te comes ", (the) x1, ". No está mal.";
        3:	print (The) actor, " se come ", (the) x1, ".^";
    }
  Enter: ! [infsp] GoIn (Meterse) se cambio por Enter.
    ! CUIDADO. La acción Meterse se genera en muy diversas
    ! circunstancias: VETE HACIA EL PUENTE, VETE AL PUENTE, VETE POR
    ! EL PUENTE, PASA POR EL PUENTE, ENTRA EN EL PUENTE, ENTRA AL
    ! PUENTE, CRUZA EL PUENTE, CRUZA POR EL PUENTE, METETE EN EL
    ! PUENTE, METETE POR EL PUENTE, ATRAVIESA EL PUENTE, BAJA POR EL
    ! PUENTE.  Todas ellas generarían la acción <Meterse Puente>
    !
    ! Además, los intentos de entrar en un "entrable", también, como
    ! por ejemplo: SIENTATE EN EL BANCO, ECHATE EN EL BANCO, SUBETE AL
    ! BANCO, SUBETE EN EL BANCO, SUBE AL BANCO, SUBE POR EL BANCO,
    ! SALTA AL BANCO. Todas ellas generarían <Meterse Banco>
    !
    ! Puesto que hay muchos verbos diferentes que dan lugar a la misma
    ! acción, es necesaria alguna forma de imprimir qué verbo concreto
    ! ha sido el que la ha desencadenado, para poder generar mensajes
    ! como "No puedes entrar ahi", "No puedes sentarte ahi", "No
    ! puedes subirte ahi", etc.. según el verbo usado. Para esto puede
    ! usarse una llamada a IdiomaVerbo(palabra_verbo). palabra_verbo
    ! contiene el verbo usado por el jugador (convertido en forma
    ! imperativa), y IdiomaVerbo lo que hace es imprimir la forma
    ! infinitiva.
    !
    ! Mensajes que puede generar esta acción:
    !  1: Error, el jugador ya está en/sobre el objeto en cuestión
    !  2: Error, el objeto al que intenta entrar/subirse/meterse no
    !     tiene el atributo "entrable"
    !  3: Error, el objeto en que intenta entrar/meterse/subirse, es
    !     un entrable y recipiente, pero está cerrado.
    !  4: Error, el objeto en que intenta entrar/meterse/subirse, está
    !     en poder del jugador
    !  5: Exito, el jugador sube/entra en el objeto
    !  6: Aviso, el jugador estaba en otro objeto, la librería
    !     intentará una acción <Salir> automática, antes de reintentar lo
    !     que el jugador le ha ordenado.
    !  7: Aviso, el objeto en que el jugador intenta meterse, está
    !     dentro de otros objetos. La librería intentará de forma
    !     automática meter al jugador en el objeto desde el cual pueda
    !     acceder al que el jugador ha indicado.
    switch(n) {
     1: print "Pero si ya estás ";
    if (x1 has supporter) print "sobre "; else print "en ";
    print_ret (the) x1, ".";
     2: print "No es algo donde puedas "; LanguageVerb(verb_word); ".";
     3: "No puedes entrar en ", (the) x1, " porque está", (n) x1,
        " cerrad", (o) x1, ".";
     4: print "No puedes "; LanguageVerb(verb_word);
        " ahí mientras no lo sueltes.";
     5:
    if (x1 has supporter) print "Subes ", (al) x1;
    else print "Entras en ", (the) x1;
    print_ret ".";
     6:
    if (x1 has supporter) print "(te bajas "; else print "(sales ";
    print (del) x1; ")";
            say__p = 0; return;

        7:  ! say__p = 0;
            if (x1 has supporter) "(te subes ", (al) x1, ")";
            if (x1 has container) "(te metes en ", (the) x1, ")";
            "(entras en ", (the) x1, ")";
	8:	print (The) actor, " se mete en ", (the) x1, ".^";
        9:  print (The) actor, " se sube a ", (the) x1, ".^";
    }
    
  Examine:
    !  1: Error, el jugador intenta examinar un objeto, pero está a
    !     oscuras.
    !  2: Exito, pero el objeto examinado no tiene descripcion
    !  3: Exito, pero el objeto examinado no tiene descripcion, aunque
    !     tiene el atributo conmutable, por lo que la librería genera
    !     este mensaje para indicar si está apagado o encendido.
    switch(n)
    {
     1: "Está demasiado oscuro, no puedes ver nada.";
     2: "No observas nada especial en ", (the) x1, ".";
     3: print (The) x1, " ", (esta) x1;
    if (x1 has on) " encendid", (o)x1, ".";
    else " apagad", (o)x1,".";
	4:	print (The) actor, " mira de cerca ", (al) x1, ".^";
	5:	"No ves nada en especial al mirar en esa dirección.";
    }

  Exit:
    ! 1: Error, el jugador no está subido/sentado/metido en ningún
    !    objeto. [Nota, si la localidad tiene la propiedad "afuera",
    !    entonces la acción Salir lo sacará de la localidad. En caso
    !    contrario es cuando se genera este error]
    ! 2: Error, el jugador está dentro de un recipiente cerrado.
    ! 3: Exito, el jugador sale/baja del objeto
    ! 4: Error, mas especifico. [6/11]
    switch(n)
    {
     1: print "No estás en ningún sitio del que debas ";
    LanguageVerb(verb_word); ".";
     2: "No puedes salir ", (del) x1, " porque está cerrad", (o)x1, ".";
     3: if (x1 has supporter) print "Bajas ";
    else print "Sales ";
    print_ret (del) x1, ".";
     4:  print "Pero es que no estás ";
            if (x1 has supporter) print "encima de  "; else print "dentro de ";
            print_ret (the) x1, ".";
	5:	print (The) actor, " sale ", (del) x1, ".^";
	6:	print (The) actor, " sale ", (del) x1, ".^";
    }

  GetOff:
    ! Esta acción se genera ante la frase SAL DEL ARMARIO o
    ! similares. Ante SAL a secas la acción es Salir.
    ! Si el jugador no está en el objeto indicado, se genera el
    ! siguiente mensaje de error. Si está, la librería generará una
    ! acción Salir, por lo que el mensaje de éxito será el de Salir.
    "Pero si no estás en ", (the) x1, ".";
  Give:
    ! 1: Error, el jugador intenta dar un objeto que no tiene
    ! 2: Error, el jugador se da el objeto a sí mismo
    ! 3: Aviso, se ha enviado la acción Dar al PNJ, pero este no ha
    !    respondido. En este caso ml_o apunta al PNJ y no al objeto
    !    que le hemos dado.
    ! [Observar que por defecto el objeto sigue en poder del
    ! jugador. Si queremos que el PNJ lo acepte, hay que programarlo
    ! como parte de su rutina Vida]
    switch(n)
    {
     1: "No tienes ", (the) x1, ".";
     2: "Manoseas ", (the) x1,
     " un ratito, pero no consigues gran cosa.";
     3: print_ret (The) x1, " no parece", (n) x1, " interesad", (o)x1, ".";
        4:  print (The) x1;
            if (x1 has pluralname) print " no pueden";
            else print " no puede";
            " recibir cosas.";
	5:	"Le das ", (the) x1, " a ", (the) second, ".";
	6: print (The) actor, " te da ", (the) x1, ".^";
	7: print (The) actor, " da ", (the) x1, " a ", (the) second, ".^";
    }
  Go:
    ! La acción Ir se genera si el jugador pone IR NORTE, o si pone
    ! simplemente NORTE.
    !   1: Error, el jugador está dentro/subido en un objeto del que
    !      tiene que salir antes
    !   2: Error, la localidad no tiene salida en esa dirección (y
    !      tampoco tiene la propiedad no_puedes_ir, ya que en este caso
    !      se habría impreso el valor de esa propiedad
    !   3: Error, el jugador ha intentado ir hacia arriba, pero allí
    !      hay una puerta cerrada
    !   4: Error, el jugador ha intentado ir hacia abajo, pero alli
    !      hay una puerta cerrada.
    !   5: Error, en la dirección que ha dicho el jugador hay una
    !      puerta cerrada
    !   6: Error, en la dirección que ha dicho el jugador hay una
    !      puerta, pero ésta no tiene una propiedad puerta_a
    !      (probablemente un error de programación del juego)
    switch(n)
    {
     1: print "Tienes que ";
         if (x1 has supporter) print "bajarte "; else print "salir ";
         print_ret (del) x1, " antes.";
     2: "No puedes ir por ahí.";
     !3: "Eres incapaz de trepar por ", (the) x1, ".";
     !4: "Eres incapaz de bajar por ", (the) x1, ".";
     !5: "No puedes pasar a través ", (del) x1, ".";
     6: "No puedes ir porque ", (the) x1, " no lleva", (n) x1, " a ningún sitio.";
	7:	"Tienes que especificar en qué dirección ir.";
	8:	print (The) actor, " se va hacia arriba";
	9:	print (The) actor, " se va hacia abajo";
	10:	print (The) actor, " se va hacia ", (the) x1;
	11:	print (The) actor, " llega desde arriba";
	12:	print (The) actor, " llega desde abajo";
!	13:	print (The) actor, " llega desde ", (name) x1;
	13:	print (The) actor, " llega desde ", (the) x1;
	14:	print (The) actor, " llega";
	15:	print (The) actor, " llega a ", (the) x1, " desde arriba";
	16:	print (The) actor, " llega a ", (the) x1, " desde abajo";
	17:	print (The) actor, " llega a ", (the) x1, " desde ", (name) x2;
	18:	print (The) actor, " se va por ", (the) x1;
	19:	print (The) actor, " llega desde ", (the) x1;
	20:	print "sobre ", (the) x1;
	21:	print "en ", (the) x1;
	22:	print ", llevando ", (the) x1, ", contigo dentro";
	23:	print ", llevando ", (the) x1;
	24:	print ", llevandose ", (the) x1;
	25:	print ", llevando ", (the) x1, " dentro";
	26:	print ", llevándote a ti también";
	27:	print "(saliendo primero de ", (the) x1, ")^"; say__p = 0; return;
	28:	print "(abriendo primero ", (the) x1, ")^"; say__p = 0; return;
       }
  Insert:
    ! 1: Error, el objeto no está en poder del jugador. [Nota,
    !    conviene mirar en este caso si el objeto es animado o no,
    !    para generar un mensaje más adecuado]
    ! 2: Error, el jugador intenta meter el objeto en otro que no
    !    tiene el atributo "recipiente"
    ! 3: Error, el jugador intenta meter el objeto en un recipiente
    !    cerrado.
    ! 4: Error, el objeto es una prenda que el jugador lleva puesta.
    !    [ESTE MENSAJE NO SE GENERA NUNCA, PARECE UN BUG DE LA
    !    LIBRERIA. Véase en su lugar el mensaje 6]
    ! 5: Error, se intenta poner un objeto dentro de sí mismo
    ! 6: Aviso, el objeto es una prenda puesta, la librería va a
    !    quitársela de forma automática antes de reintentar Meter.
    ! 7: Error, no queda sitio en el recipiente (el número de objetos
    !    que un recipiente puede contener se indica en su propiedad
    !    "capacidad").
    ! 8: Exito. Mensaje a mostrar para cada objeto metido cuando se
    !    meten muchos (ej: METE TODO EN LA BOLSA)
    ! 9: Exito. Mensaje a mostrar cuando se mete un solo objeto dentro
    !    de otro
    switch(n)
    {
     1:    
      if (x1 has animate) "Antes tendrías que ", (coge)"rl", (o) x1,
       " y no sé si se dejará",(n)x1,".";
      else
        "Necesitas tener ", (the) x1,
        " para poder meter", (lo) x1,
        " donde sea.";
     2: "No se pueden meter cosas dentro ", (del) x1, ".";
     3: print_ret (The) x1, " ", (esta) x1, " cerrad", (o) x1, ".";
     4: "Tienes que quitarte", (lo) x1, " antes.";
     5: "No puedes poner un objeto dentro de sí mismo.";
        #ifdef NI_BUILD_COUNT;
     6: "(primero te ", (lo) x1, " quitas)^"; say__p = 0; return;
     7: "No queda sitio en ", (the) x1, ".";
     8: "Hecho.";
     9: "Metes ", (the) x1, " dentro ", (del) second, ".";
	10:  print (The) actor, " pone ", (the) x1, " en ", (the) second, ".^";
    }

 Inv:
    ! Inventario
    !  1: Mensaje si el inventario está vacío
    !  2: Encabezado del inventario, antes de la lista de objetos
    !     generada por la librería
    !  3 y 4: [6/11]
    switch(n)
    {
     1: "No llevas nada.";
     2: print "Llevas";
     3:  print ":^";
     4:  print ".^";
	5:	print (The) x1, " consulta su inventario.^";
    }
  Jump:      "Saltas en el sitio, sin ningún resultado.";
  Kiss:         "No creo que debas.";
  Listen:      "No escuchas nada fuera de lo común.";
  ListMiscellany:
    ! Los siguientes mensajes se muestran como aclaraciones cuando se
    ! está listando el inventario del jugador, o los objetos que hay
    ! en una localidad. Junto a cada mensaje se comenta qué
    ! condiciones deben darse en ese objeto para que se muestre ese
    ! mensaje aclaratorio
    
    switch(n)
    {
     1: print " (alumbrando)";
    ! El objeto tiene "luz" y la localidad no
        2:  print " (cerrad", (o) x1, ")";
        4:  print " (vací", (o) x1, ")";
        6:  print " (cerrad", (o) x1, " y vací",(o) x1, ")";
     3: print " (cerrad", (o) x1, " y alumbrando)";
    ! Casos 2 y 1 juntos
     5: print " (vací", (o) x1, " y alumbrando)";
    ! Casos 1 y 4 juntos
     7: print " (cerrad", (o) x1, ", vací", (o) x1, " y
        alumbrando)";
    ! Casos 1 y 6 juntos

! Los casos siguientes son similares, pero se muestran cuando
! se solicita a la rutina EscribirListaDesde la opcion INFOTOTAL
! La librería puede combinar varios de estos mensajes, por eso no
! deben llevar el cerrar paréntesis al final, que lo añade la
! propia librería
! ************************************
!  NO SE ACONSEJA CAMBIAR ESTOS
! ************************************
    
     8: print " (alumbrando y que llevas puest", (o) x1;
    ! El objeto tiene "luz" y "puesto"
     9: print " (alumbrando";
    ! El objeto tiene "luz" pero no "puesto"
     10: print " (que llevas puest", (o) x1;
    ! El objeto tiene "puesto" pero no "luz"
        11: print " (";
     12: print "abiert", (o)x1;
    ! Objeto tiene "recipiente", "abrible" y "abierto" (y cosas dentro)
     13: print "abiert", (o)x1, " pero vací", (o) x1;
    ! Objeto tiene "recipiente", "abrible" y "abierto (pero vacio)
     14: print "cerrad", (o) x1;
    ! Objeto tiene "recipiente", "abrible"  y no "abierto"
     15: print "cerrad", (o) x1, " con llave";
    ! Objeto tiene "recipiente", "abrible" y "cerrojoechado" o "cerrojo"
     16: print " vací", (o) x1;
    ! Objeto tiene "recipiente", no "abrible" y "transparente"
        17: print " (vací", (o) x1, ")";
     18: print " que contiene ";
    ! encabezado a la lista de lo que hay dentro del objeto
     19: print " (sobre ", (el_) x1;
    ! Si el objeto tiene "soporte", la librería va a listar sus
    ! contenidos. Este es el encabezado de la lista
     20: print ", encima ", (del_) x1;
    ! Como el 19, pero en otra modalidad (que se activa si
    ! EscribirListaDesde es llamada sin el modo BREVE_BIT)
     21: print " (en ", (el_) x1;
    ! Si el contenido tiene "recipiente" y puede verse su interior
    ! y hay cosas, la librería va a mostrar sus contenidos. Este
    ! es el encabezado de la lista
     22: print ", dentro ", (del_) x1;
    ! Como el 21, pero en otra modalidad (que se activa si
    ! EscribirListaDesde es llamada sin el modo BREVE_BIT)
    }
    
 LMode1:
    ! La acción ModoM1 se genera ante el comando BREVE (o NORMAL). La
    ! librería imprime la constante Historia y a continuación este
    ! mensaje.
    " está ahora en su modo normal ~breve~, que da sólo descripciones
    largas de los lugares la primera vez que son visitados, y
    descripciones cortas en otro caso.";

 LMode2:
    ! La acción ModoM2 se genera ante el comando LARGO. La
    ! librería imprime la constante Historia y a continuación este
    ! mensaje.
    " está ahora en su modo ~largo~, que siempre da descripciones
    largas de los lugares (incluso si ya habías estado antes).";

 LMode3:
    ! La acción ModoM3 se genera ante el comando SUPERBREVE. La
    ! librería imprime la constante Historia y a continuación este
    ! mensaje.
    " está ahora en su modo ~superbreve~, que siempre da descripciones
    cortas de los lugares (incluso si nunca habías estado antes).";
    
   Lock:
    ! EcharCerrojo se genera con CIERRA <objeto> CON <objeto2>, o
    ! tambien ante ECHA CERROJO A <objeto>. (sin especificar un
    ! segundo objeto en este caso)
    !
    !  1: Error, el objeto que se intenta cerrar no tiene la propiedad
    !     "cerrojo".
    !  2: Error, el objeto que se intenta cerrar tiene la propiedad
    !     "cerrojo", pero ya tiene también "cerrojoechado
    !  3: Error, el objeto tiene "cerrojo", pero está "abierto". No se
    !     le puede echar el cerrojo hasta que no se cierre.
    !  4: Error, el <objeto2> especificado no coincide con el que el
    !     <objeto> indica en su propiedad "con_llave".
    !  5: Exito, el <objeto> es cerrado (con <objeto2> si este es
    !     specificado, el cual puede encontrarse en la variable
    !     "otro")
    switch(n)
    {
      1: "No parece", (n) x1, " tener ningún tipo de cerrojo.";
      2: if (x1 provides with_key)
      print_ret (The) x1, " ya estaba", (n) x1, " cerrad", (o) x1,
      " con llave.";
    else
      print_ret (The) x1, " ya tiene",(n) x1, " echado el cerrojo.";
      3: "Primero tendrás que cerrar ", (the) x1, ".";
      4: if (second) "No parece", (n) x1, " encajar en la cerradura.";
    "Necesitas algún tipo de llave.";
      5: if (second) "Cierras ", (the) x1," con ", (the) second, ".";
    "Echas el cerrojo ", (al) x1, ".";
	6:	print (The) actor, " echa cerrojo a ", (the) x1, ".^";
    }

 Look:
    ! La acción Look se genera cuando el player pone MIRAR, pero
    ! también de forma automática al entrar en una localidad nueva, o
    ! cuando el player sale/se baja de un objeto en el que estaba.
    !
    ! Algnouns de los mensajes que se definen aqui aparecen en el
    ! "título" de la localidad (lo que aparece en negrita before de la
    ! descripción de la localidad)
    !
    !  1: aclaración a añadir tras el título si el player está subido
    !     en un objeto
    !  2: aclaración a añadir tras el título si el player está dentro
    !     de un objeto
    !  3: aclaración a añadir tras el título si el player ha sido
    !     transformado en otro personaje, mediante una llamada a
    !     ChangePlayer(nuevo, 1); (si el 1, la librería no intentará
    !     mostrar este mensaje)
    !  4: Una vez que la librería ha mostrado la descrcipción de la
    !     localidad, si el player estaba encima de un supporter, la
    !     librería generará este mensaje 4 para mostrar qué más cosas
    !     hay sobre el supporter
    !  Restante: 5,6 [6/11] antes 'default'
    !     Son usados por la librería para listar los objetos "simples"
    !     que hay en la localidad. Son objetos "simples" los que no
    !     dan su propia auto-descrcipcion a través de la propiedad
    !     "describe" o "initial".
    !  7: Respuesta estandar para MirarHacia [6/11]
    switch(n)
    {
     1: print " (sobre ", (the) x1, ")";
     2: print " (en ", (the) x1, ")";
     3: print " (como ", (object) x1,")";
     4: print "Sobre ", (the) x1, " ";
    WriteListFrom(child(x1),
                      ENGLISH_BIT + RECURSE_BIT + PARTINV_BIT
                      + TERSE_BIT + ISARE_BIT + CONCEAL_BIT);
    ".";
     5,6:
         if (x1~=location)
         {      if (x1 has supporter) print "Sobre "; else print "En ";
                 print (the) x1;
                 print " puedes ver ";
         }
         else print "Puedes ver ";
         if (n==5) print "también ";
         WriteListFrom(child(x1),
                      ENGLISH_BIT + WORKFLAG_BIT + RECURSE_BIT
                      + PARTINV_BIT + TERSE_BIT + CONCEAL_BIT);
         if (x1~=location) ".";
         ".";
     7: "No observas nada más digno de mención al mirar hacia ", (the) x1, ".";![6/11]
     8:  if (x1 has supporter) print " (sobre "; else print " (en "; ! added in 6/11N 4U65
        	print (the) x1, ")";
	9:	print (The) actor, " mira alrededor.^";
    }

  LookUnder:
    ! Dos casos:
    !  1: Error, estamos a oscuras
    !  2: Exito, mensaje por defecto.
    switch(n)
    {
     1: "Está muy oscuro.";
     2: "No ves nada interesante.";
	3:	print (The) actor, " mira debajo ", (del) x1, ".^";
    }

  Mild:        "Bastante.";
  ! Y esta si usa como primera palabra algún insulto más suave
  
!================================================================
! MISCELANEA
!================================================================
! Esta es una falsa acción, que se usa simplemente para agrupar aquí
! todos los mensajes de error del parser, los mensajes ante algunos
! metacommandos, o algnouns mensajes de librería no relacionados con
! acción alguna. La asignación de números a mensajes es bastante
! caprichosa.

! Debajo de cada mensaje un comentario indica en qué condiciones se
! genera.

 Miscellany:
    switch(n)
    {
     1: "(Sólo considero los dieciséis primeros objetos)^";
    ! El player ha especificado objetos multiples, pero el parser
    ! tiene una lista que no admite más de 16, de modo que los
    ! restbefore objetos no serán procesados.

     2: "¡No sé a qué objetos te refieres!";
    ! El player ha usado objetos multiples, pero por alguna razón
    ! la lista del parser está vacía.

     3: 
!         TextoLlamativo(" Has muerto ");
         print " Has muerto ";
    ! Mensaje fin de juego. Has muerto.

     4: 
!          TextoLlamativo(" Has ganado ");
          print " Has ganado ";
    ! Mensaje fin de juego de victoria.

     5: ! Mensaje a mostrar tras el fin del juego, para pedir al
    ! player si quiere reniciar, recuperar, anular, puntuación,
    ! curiosidades o terminar.
       print "^¿Quieres REINICIAR, RECUPERAR un juego guardado";
       #IFDEF DEATH_MENTION_UNDO;
         print ", ANULAR tu último movimiento";
       #ENDIF;
       #ifdef I7_SERIAL_COMMA;
          print " ,";
       #endif;
      " o TERMINAR?";

     6: "[Tu intérprete no puede ~deshacer~ acciones, ¡lo siento!]";
    ! Error si el intérprete no tiene "undo"
            #Ifdef TARGET_ZCODE; ![6/11]
     7: "~deshacer~ falló. [No todos los intérpretes lo tienen.]";
            #Ifnot; ! TARGET_GLULX
     7:  "[No puedes ~deshacer~ más.]";
            #Endif; ! TARGET_
    ! Otro error si el intérprete no tiene "undo", pero no había
    ! sido detectado correctamente

     8: "Por favor, da una de las respuestas anteriores.";
    ! Si el player no responde correctamente a la pregunta del
    ! mensaje [Miscellany,5]

     9: "¡Te has quedado a oscuras!";
    ! Mensaje cuando se detecta, al final del turno, que ya no hay
    ! light.

     10: "¿Perdón?";
    ! Mensaje cuando el player introduce una linea en blanco (no
    ! llega a generarse acción alguna, por tanto no se consume
    ! turno ni se ejecutan daemons)

     11: "[No puedes ~deshacer~ lo que no has hecho.]";
    ! Si el player intenta "undo" al principio del juego

     12: "[No puedes ~deshacer~ dos veces seguidas. ¡Lo siento!]";
    ! Si el player pone "undo" dos veces

     13: "[Retrocediendo al turno anterior.]";
    ! Exito en el "undo"

     14: "Lo siento, eso no puede corregirse.";
    ! Si el player pone EEPA (verbo para corregir), pero el
    ! parser no recordaba ninguna palabra mal
    ! El commando EEPA se usa así, por ejemplo:
    !   > SACA MAZANA VERDE DE LA CESTA
    !   No veo eso por aquí
    !   > EEPA MANZANA
    !   Sacas la manzana verde de la cesta de mimbre.
    
     15: "No te preocupes.";
    ! Si el player pone EEPA sólo (sin especificar la palabra
    ! corregida)

     16: "~eepa~ sólo puede corregir una palabra.";
    ! Si el player pone EEPA seguido de dos o más palabras

     17: "Está muy oscuro y no puedes ver nada.";
    ! Descripción del objeto Oscuridad

     18: print "ti mism", (o) player;
    ! Nombre corto del objeto player

     19: "Tan buen aspecto como siempre.";
    ! Descripción del objeto player

     20: "Para repetir un comando como ~rana, salta~, escribe
    ~repite~, en lugar de ~rana, repite~.";
    ! Cuando el player pone PNJ, REPITE para que el PNJ haga otra
    ! vez la última acción.

     21: "No hay commando que repetir.";
    ! Cuando el player pone REPITE como primer commando del juego.

     22: "No puedes empezar la frase con una coma.";
    ! Cuando ha empezado la frase con una coma.

     23: "Parece que quieres hablar con alguien, pero no veo con
    quién.";
    ! Cuando el player pone PEPE, COGE HACHA, pero no hay un
    ! objeto que responda al name PEPE.

     24: "No puedes hablar con ", (the) x1, ".";
    ! Si el player intenta hablar con un objeto que no es
    ! "animate" ni "talkable" ("talkable" debe ponerse a objetos
    ! inanimates con los que se podría hablar, como un micrófono)

     25: "Para hablar con alguien intenta ~alguien, hola~ o algo
    así.";
    ! Si hay palabras no comprendidas entre el name del PNJ y
    ! la comma, como p.ej: PEPE XADASDGG, SALTA

     26: "(primero tratas de ", (coge)"r ", (the) x1, ")"; ! infsp I6

    ! Si la gramática especifica que una acción debe efectuarse
    ! sobre un objeto en poder del player (token "held"), pero el
    ! player lo intenta sobre un objeto que no tiene, pero que
    ! está accesible, el parser intentará automáticamente coger
    ! ese objeto antes de efectuar la acción. En este mensaje se
    ! avisa al player de esta intención.

! ================================================================    
! ERRORES DE PARSING
! Estos errores son generados por la librería, a menos que el
! programador proporcione su propia función ParserError para
! manejo de errores.

     27:! El parser se ha atascado. Es el tipo de error más
    ! genérico. Si el parser puede, dará un error más concreto
    ! (noun de los siguientes)
    "No entendí esa frase.";

     28:! Al parser le sobran palabras, aunque ha entendido gran parte
    ! de la orden. 
        
    print "Intenta de nuevo, porque sólo te pude entender: ";

     29: ! El parser esperaba un token de tipo número
    "No comprendí ese número.";

     30: ! El parser no ha comprendido el nombre del objeto al que se
    ! refiere el player, o ese objeto no está aquí.
    "No veo eso que dices.";

     31: ! Este error parece que no se genera nunca. Un posible bug de
    ! libreria, o restos de versiones arcaicas
     "¡Pareces haber dicho muy poca cosa!";

     32: ! El objeto que el player intenta usar no está en su
    ! poder. El parser ha intentado "cogerlo de forma automatica",
    ! pero ha fallado
    "¡No tienes eso!";

     33: ! El player ha intentado usar objetos múltiples (o "TODO")
    ! con un verbo que en su gramática no lo admite.
    "No puedes especificar objetos múltiples con ese verbo.";

     34: ! El player ha intentado objetos multiples para "noun" y para
    ! "second", como en METE TODO EN TODO.
     "Sólo puedes especificar objetos múltiples una vez en cada
    línea.";

     35: ! El player ha usado un proname, como COMELO, pero el
    ! parser no tiene asignado un valor a ese proname.
     "No estoy seguro de a qué se refiere ~", (address) pronoun_word,
     "~.";

     36: ! El player ha puesto una lista de objetos y ha usado la
    ! palabra EXCEPTO para exceptuar algo que no estaba incluido
    ! en la lista, por ejemplo: COGE TODAS LAS MONEDAS EXCEPTO EL
    ! SACO.
    "Has exceptuado algo que no estaba incluido.";

     37:! La gramática de un verbo obliga a que el objeto sobre el que
    ! se actúe sea animate (tiene un token de tipo "creature"),
    ! pero el player lo ha intentado sobre un objeto que no es
    ! animate.
    "Sólo puedes hacer eso con seres animados.";

     38: ! La primera palabra usada por el player es desconocida (o
    ! la primera palabra tras la comma, si se trata de una orden a
    ! un PNJ)
    "No conozco ese verbo.";

     39: ! El player intenta actiones sobre las palabras que están en
    ! la propiedad "irrelevante" de la localidad
     "Eso no es importante.";

     40: ! El player ha usado un proname, como EXAMINALO, pero el
    ! proname se refiere a un objeto que ya no está visible.
     "Ahora mismo no puedes ver lo que representa el pronombre ~",
      (address) pronoun_word,
     "~ (", (the) pronoun_obj, ").";

     41: ! Este error no sale nunca. Probablemente sigue aqui por
    ! razones de compatibilidad, o por despiste de Graham ¿Tal vez
    ! ha sido sustituido en versiones mas recients por el mensaje
    ! número 28?
    "No entendí la última parte de la orden.";

     42: ! El player ha solicitado un numero de objetos en una lista
    ! de objetos multiples, pero el parser no es capaz de
    ! encontrar tantos. Por ejemplo: COGE SEIS MONEDAS.
    ! En x1 se recibe el número de objetos hallados por el
    ! parser.
     if (x1==0) "No hay suficientes.";
         else if (x1==1){
     print "Aquí sólo hay un";
     if (multiple_object-->1) print (o) multiple_object-->1;
     else print "o";
     " disponible.";
        }
    else
       "Sólo hay ", (number) x1, " disponibles para esa acción.";

     43: ! El player ha puesto TODO como objeto múltiple, pero el
    ! parser no ha encontrado ningún objeto. En realidad este
    ! error parece no producirse nunca (second bug de librería) ya
    ! que el que siempre acaba generándose es el siguiente (44)
     "¡No encuentro nada para hacer eso!";

     44: ! El player ha intentado objetos múltiples usando TODO
         ! pero el parser no ha encontrado ninguno. Por ejemplo, COGE
         ! TODO o DEJA TODO si no hay nada cerca o en el inventario.
         ! Modificado en [020621] para dar un mensaje más coherente
         ! si el player tiene algún objeto en su inventario.
       if (action_to_be == ##Drop) {
         print "¡Pero si no llevas nada";
         if (children (player))
           " de eso!";
         else
           "!";
       }
       print "No hay nada para ";
       LanguageVerb(verb_word);
       ".";

     45:! El player ha nombrado un PNJ ambiguo (hay más de noun con el
    ! mismo name cerca). El parser le pide aclaración. Este
    ! mensaje es la primera parte de la pregunta, el resto lo pone
    ! el parser (que es la lista de PNJs entre los que
    ! duda). Debemos poner a 1 la variable PreguntaCualExactamente
    ! cuando se generan este tipo de preguntas aclaratorias.
     print "¿Quién concretamente, ";
    PreguntaCualExactamente=1;

     46:! El player ha nombrado un objeto ambiguo (hay más de noun con el
    ! mismo name cerca). El parser le pide aclaración. Este
    ! mensaje es la primera parte de la pregunta, el resto lo pone
    ! el parser (que es la lista de objetos entre los que
    ! duda). Debemos poner a 1 la variable PreguntaCualExactamente
    ! cuando se generan este tipo de preguntas aclaratorias.
     print "¿Cuál concretamente, ";
    PreguntaCualExactamente=1;

     47: ! El player ha respondido "TODOS" o "AMBOS" a una pregunta
    ! aclaratoria como la anterior, pero el verbo no admite
    ! objetos múltiples
    print "Lo siento, sólo puedes referirte a un objeto aquí. ¿Cuál
        exactamente?^";
    PreguntaCualExactamente=1;

     48: !El player ha escrito una frase u orden a PSI incompleta,
         !como BESA (verbo aplicado sobre PSIs normalmente).
         !El parser le pregunta para que complete la frase
     PreguntaCualExactamente=1;
!     print "Mensaje 48^"; ![infps] debug
    if (IniciarPregunta()==0) print "A quién";
    if (actor ~= player) print " tiene que ";
    else print " quieres ";
         IdiomaImprimirComando();
    if (actor~=player) print " ", (the) actor;
    print "?^";

     49: !El player ha escrito una frase u orden incompleta,
         !como COGE (verbo aplicado sobre objetos normalmente).
         !El parser le pregunta para que complete la frase
    PreguntaCualExactamente=1;
!     print "Mensaje 49^"; ![infps] debug
    if (IniciarPregunta()==0) print "Qué";
    if (actor ~= player) print " tiene que ";
    else print " quieres ";
         IdiomaImprimirComando();
    if (actor~=player) print " ", (the) actor;
    print "?^";

!#IFNDEF NO_PUNTUACION;
     50: ! El player acaba de realizar una acción que puntúa (la
    ! librería ha detectado que la variable score ha cambiado
    ! de valor). Se informa de ello al player. El parámetro x1
    ! contiene el incremento (o decremento) en la puntuación.
    print "Tu puntuación ha ";
    if (x1 > 0)
          print "aumentado";
        else {
          x1 = -x1;
          print "disminuido";
        }
    print " en ", (number) x1, " punto";
    if (x1 > 1) print "s";
!#ENDIF; ! NO_PUNTUACION

     51: ! El player ha intentado una acción con objeto múltiple
    ! (como COGE TODO). Esta acción es convertida por el parser en
    ! una serie de actiones COGE OBJETO1, COGE OBJETO2, etc... Si
    ! en la ejecución de alguna de estas actiones encuentra que la
    ! localidad del player ha cambiado, debe abortar el
    ! proceso. Este mensaje informa de ello al player.
    !
    "(Ya que ha ocurrido algo dramático, se ha recortado la lista
    de objetos sobre los que actuabas)";
    
     52: ! En los menús, se espera a que el player escriba un número
    ! para mostrar una entrada del menú. Si pulsa un numero
    ! incorrecto, se saca este mensaje. El parámetro x1 contiene
    ! el número más alto válido
    "^Escribe un número del 1 al ", x1,
     ", 0 para volver a mostrarlo, o pulsa Intro.";
    
     53: ! Mensaje que muestra el sistema de menús cuando espera una
    ! tecla
     "^[Por favor, pulsa ESPACIO]";
     ! [6/11] agregados:
     54: "[Comentario guardado]";
     55: "[Comentario NO guardado]";
     56: print ".^";
     57: print "?^";
        58: print (The) actor, " no puede hacer eso.^";
	59:	"Debes mencionar un objeto en concreto.";
	60:	"Puedes no mencionar un objeto en concreto.";
	61:	"Debes mencionar un objeto en concreto.";
	62:	"Puedes no mencionar un objeto en concreto.";
	63:	"Debes mencionar el segundo objeto en concreto.";
	64:	"Puedes no mencionar el segundo objeto en concreto.";
	65:	"Debes mencionar un segundo objeto.";
	66:	"Puedes no mencionar el segundo objeto en concreto.";
	67:	"Debes mencionar algo más concreto.";
	68:	print "(", (The) actor, " primero toma ", (the) x1, ")^";
        69: "(primero tomas ", (the) x1, ")";
        70: "No puedes usar UNDO en este juego.";
        71: print (string) DARKNESS__TX;
	72: print (The) x1, " tiene", (n) x1, " mejores cosas que hacer.";
        73: "Ese objeto no tiene sentido en ese contexto."; 
        74: print "[Esa es una orden fuera del mundo del juego, y solo tiene sentido para ti y el parser. No puedes ordenarle "
	, (al) x1, " que haga eso.]^";
        75:  print " Fin";
 }        
    
  No,Yes:      "Sólo era una pregunta retórica.";
  ! Cuando el jugador pone SI o NO, a secas, se genera esta
  ! acción. Está pensado por si el juego suelta una frase del estilo
  ! de "¿Pero tú eres tonto?" y el jugador responde NO.
  ! De todas formas, hay un problema, y es que NO es normalmente la
  ! acción Ir al noroeste. Si queremos que NO sea provisionalmente
  ! la acción No, entonces el juego debe poner un 1 en la variable
  ! PreguntaSiNo, antes de escribir el texto "¿Pero tú eres tonto?".
  ! En este caso, el parser interpretará "NO" como la acción No,
  ! pero sólo en el siguiente turno. Después recuperará su antiguo
  ! significado de Ir al Noroeste.

  NotifyOff:
    "Notificación de puntuación desactivada.";
    
  Open:
    !  1: Error, el objeto no tiene el atributo "abrible"
    !  2: Error, el objeto es abrible, pero tiene "cerrojoechado"
    !  3: Error, el objeto es abrible, pero ya tiene el atributo
    !     "abierto"
    !  4: Exito, el objeto se abre, y además era recipiente y tenía
    !     cosas dentro. Se muestra entoces la lista de objetos que
    !     había en su interior (si habia algo)
    !  5: Exito, el objeto se abre (pero no tiene nada en su
    !     interior, o no era recipiente).
    switch(n)
    {
     1: print_ret "No es algo que pueda abrirse.";
     2: "Está", (n) x1, " cerrad", (o) x1, " con llave.";
     3: "Ya estaba", (n) x1, " abiert", (o) x1, ".";
     4: print "Abres ", (the) x1, ", descubriendo ";
    if (WriteListFrom(child(x1),
                            ENGLISH_BIT + TERSE_BIT + CONCEAL_BIT)==0) "nada.";
    ".";
     5: "Abres ", (the) x1, ".";
	6:	print (The) actor, " abre ", (the) x1, ".^";
	7:	print (The) x1, " se abre.^";
    }

    
   Pronouns:
    ! Esta acción (generada por el verbo PRONOMBRES) muestra una lista
    ! de qué significa en ese momento para el parser cada proname
    ! -lo, -la, -los, -las...
    !
    !  1: Texto introductorio
    !  2: La palabra "es"
    !  3: texto a mostrar si el proname no está definido
    !  4: Si el juego no define pronames
    !  5: [6/11]
    switch(n)
    {
     1: print "En este momento, ";
     2: print "es ";
     3: print "no está definido";
     4: "el juego no conoce ningún pronombre.";
     5:  ".";
    }
    
  Pull, Push, Turn:
  ! Las acciones Tirar, Empujar y Girar generan todas ellas los
  ! mismos mensajes, pero pueden darse 4 casos:
  !   1: Que el objeto tenga el atributo 'estatico'
  !   2: Que el objeto tenga el atributo 'escenario'
  !   3: El objeto no tiene 'estatico' ni 'escenario'
  !   4: El objeto es un ser animado
  ! [Nota, si el objeto tiene ambos 'estatico' y 'escenario' se
  ! está también en el caso 1]
    switch(n)
    {
      1: "Está", (n)x1, " firmemente sujet", (o)x1, ".";
      2: "No eres capaz.";
      3: "No ocurre nada, aparentemente.";
      4: "Eso sería, como poco, maleducado.";
	5:	print (The) actor, " tira ", (del) x1, ".^";
	6:	print (The) actor, " empuja ", (the) x1, ".^";
	7:	print (The) actor, " gira ", (the) x1, ".^";
    }

! Push: see Pull    

  PushDir:
  ! La acción EmpujarDir se genera ante frases como EMPUJA EL COCHE
  ! HACIA EL NORTE. Hay 3 casos posibles:
  !   1: Si el juego no ha previsto la posibilidad de empujar ese
  !      objeto hacia una dirección (o sea, no llama a la rutina
  !      PermitirEmujarDir). Esta es la respuesta por defecto más
  !      habitual.
  !   2: Si el jugador pone tras HACIA algo que no es una dirección.
  !      (respuesta por defecto en este caso)
  !   3: Si intenta empujar hacia arriba o hacia abajo
    switch(n)
    {
     1: "No creo que empujar ", (the) x1, " sirva para nada.";
     2: "Eso no es una dirección.";
     3: "No, no puedes en esa dirección.";
    }
   
 PutOn:
    ! 1: Error, el objeto no está en poder del jugador. [Nota,
    !    conviene mirar en este caso si el objeto es animado o no,
    !    para generar un mensaje más adecuado]
    ! 2: Error, el jugador intenta poner un objeto sobre sí mismo
    ! 3: Error, el jugador intenta poner el objeto sobre otro que no
    !    tiene el atributo "soporte"
    ! 4: Error, el jugador intenta poner un objeto sobre el propio
    !    jugador.
    ! 5: Aviso, el objeto es una prenda puesta. La librería va a
    !    quitárselo automáticamente antes de reintentar la acción
    !    PonerSobre
    ! 6: Error, se intenta poner el objeto sobre otro en el que ya no
    !    queda sitio (el número de objetos que caben en el soporte se
    !    indica en su propiedad "capacidad")
    ! 7: Exito. Mensaje a mostrar para cada objeto puesto cuando se
    !    ponen muchos (ej: PON TODO SOBRE LA MESA)
    ! 8: Exito. Mensaje a mostrar cuando se pone un solo objeto sobre
    !    otro.
    switch(n)
    {
     1: if (x1 has animate)
     "Antes tendrías que", (coge) "rl", (o) x1, ", y no sé si se dejará",
         (n) x1, ".";
    else
           "Necesitas tener ", (the) x1,
         " para poder poner", (lo) x1,
         " donde sea.";
     2: "No puedes poner un objeto sobre sí mismo.";
     3: "Poner cosas sobre ", (the) x1, " no servirá de nada.";
     4: "Te falta destreza.";
     5:  print "(primero te ", (lo) x1, " quitas)^"; say__p = 0; return;
     6: "No queda sitio en ", (the) x1, " para poner nada más.";
     7: "Hecho.";
     8: "Colocas ", (the) x1, " sobre ", (the) second, ".";
	9:  print (The) actor, " pone ", (the) x1, " sobre ", (the) second, ".^";
    }
   
 Quit:
    !  1: Respuesta al comando FIN
    !  2: Respuesta si el jugador escribe algo distinto de "si" o "no"
    switch(n)
    {
     1: print "Por favor, responde sí o no.";
     2: print "¿Seguro que quieres abandonar el juego? ";
    }
    
 Remove:
    ! 2 mensajes de error y 1 de exito
    !   1: El recipiente que contiene el objeto que el jugador quiere
    !      sacar, está cerrado. (ml_o apunta al objeto, no al
    !      recipiente, el cual puede obtenerse con parent(ml_o))
    !   2: El objeto no está dentro del recipiente que el jugador ha
    !     dicho.
    !   3: Exito
    switch(n)
    {
     1: "Por desgracia ", (the) parent(x1), " ",(esta) parent(x1),
     " cerrad", (o) parent(x1), ".";
     2: if (second has animate)
     "¡Pero si no ", (lo) x1, " tiene", (n) second, "!";
    "¡Pero si no ", (esta) x1, " ahí ahora!";
     3: if (verb_word=='quita') "Quitad", (o)x1, ".";
    "Sacad", (o) x1, ".";
    }

 Restart:
    !  1: Respuesta al comando REINICIAR
    !  2: Si no se puede reiniciar
    switch(n)
    {
     1: print "¿Seguro que quieres reiniciar el juego? ";
     2: "Error.";
    }

 Restore:
    ! 1: Si no se pudo cargar la partida con LOAD
    ! 2: Exito (no llega a mostrarse, porque en caso de éxito el
    !    estado del juego cambia al momento en que se salvó. El "Ok"
    !    que se ve entonces es el del comando Salvar.
    switch(n)
    {
     1: "Error. No se pudo recuperar la partida.";
     2: "Ok.";
    }

 Rub:      "Ya ", (esta) x1, " bastante limpi", (o) x1, ".";

 Save:
    ! 1: Si no se pudo guardar el juego
    ! 2: Éxito
    switch(n)
    {
     1: "Error. No se pudo guardar.";
     2: "Ok.";
    }

    ! Puntuación del juego. Puede activarse porque el player lo pide
    ! (con el verbo "PUNTUACION") o porque el juego ha terminado. En
    ! este ultimo caso, la variable "deadflag" valdrá true.
    ! [6/11] agregado de (2)
  Score: switch (n) {
    1: if (deadflag) print "En este juego, tu puntuación ha sido ";
       else print "Hasta el momento tu puntuación es ";
       print score, " de un total de ", MAX_SCORE,
        ", en ", turns, " turno";
       if (turns>1) print "s"; return;
    2:  "Este juego no tiene conteo de puntuación.";
        3:	print ", logrando el rango de ";
    }

 ScriptOff:
    ! 1: Error ya estaba desactivada la transcrcipción
    ! 2: Exito
    switch(n)
    {
     1: "La transcripción ya estaba desactivada.";
     2: "^Fin de la transcripción.";
     3:  "Intento fallido de finalización de transcripción.";
    }

 ScriptOn:
    ! 1: Error, ya estaba activada la transcrcipción
    ! 2: Éxito (parte inicial del mensaje, la librería añade el título
    !    del juego obtenido de la constante Historia)
    switch(n)
    {
     1: "La transcripción ya estaba activada.";
     2: "Iniciando la transcripción de ";
     3:  "Intento fallido de comienzo de transcripción.";
    }

  Search:
    ! La acción BuscarEn se genera ante la frase MIRA EN RECIPIENTE,
    ! MIRA EN SOPORTE, REGISTRA OBJETO.
    !
    !  1: Error, estamos a oscuras.
    !  2: Éxito examinando soporte, pero no hay nada sobre él.
    !  3: Éxito examinando soporte, listar lo que hay.
    !  4: El objeto examinado no es soporte ni recipiente, mensaje
    !     estándar indicando que no se encuentra nada.
    !  5: Error, El objeto examinado es recipiente, pero está cerrado.
    !  6: Éxito, el objeto examinado es recipiente abierto, pero no
    !     tiene nada dentro.
    !  7: Éxito, el objeto examinado es recipiente abierto y tiene
    !     cosas dentro. Listarlas.
    switch(n)
    {
     1: "Está muy oscuro.";
     2: "No hay nada sobre ", (the) x1, ".";
     3: print "Sobre ", (the) x1, " ";
            WriteListFrom(child(x1), ENGLISH_BIT+TERSE_BIT+CONCEAL_BIT+ISARE_BIT);
            ".";
     4: "No encuentras nada interesante.";
     5: "No puedes ver lo que hay dentro ", (del) x1, " porque ",
     (esta) x1, " cerrad", (o)x1, ".";
     6: print_ret (The) x1, " ", (esta) x1, " vací", (o)x1,".";
     7: print "En ", (the) x1, " ";
            WriteListFrom(child(x1), ENGLISH_BIT+TERSE_BIT+CONCEAL_BIT+ISARE_BIT);
            ".";
	8:	print (The) actor, " busca ", (al) x1, ".^";
    }


  SetTo:      "Eso no puede regularse a ningún valor.";
  ! PonerA sale ante la frase AJUSTA DIAL A 23 o FIJA CONTROL EN
  ! ACTIVADO, o PON REGULADOR A 30
  
  Show:
    ! 1: Error, el jugador intenta mostrar un objeto que no tiene.
    ! 2: Aviso, se ha enviado la acción Mostrar al PNJ, pero este no
    !    ha respondido. En este caso ml_n apunta al PNJ y no al objeto
    !    que le hemos mostrado.
    switch(n)
    {
     1: "No tienes ", (the)x1, ".";
     2: print_ret (The) x1, " no muestra", (n) x1, " interés.";
    }
    
  Sing:         "Cantas fatal.";
  Sleep:         "No estás especialmente somnolient", (o) player, ".";
  Smell:          "No hueles nada extraño.";
  Sorry:    "Oh, no es necesario que te disculpes.";
  ! Esta acción se genera si el jugador pone "LO SIENTO",
  ! "PERDONA" o cosas similares.

 Squeeze:
    ! Dos casos:
    !  1: Tratar de retorcer un ser animado
    !  2: Cualquier otro objeto
    switch(n)
    {
     1: "¡Las manos quietas!";
     2: "No consigues nada haciendo eso.";
	3:	print (The) actor, " retuerce ", (the) x1, ".^";
    }

  Strong:       "Los verdaderos aventureros no usan ese vocabulario.";
  ! Y esta si usa como primera palabra (verbo) un taco.
  Swing:   "No es adecuad", (o) x1, " para columpiarse.";

  SwitchOff:
    !  1: Error, el objeto no tiene el atributo "conmutable"
    !  2: Error, el objeto ya tenia desactivado el atributo
    !    "encendido"
    !  3: Exito, el objeto tiene ahora desactivado "encendido"
    switch(n)
    {
     1: print_ret "No es algo que pueda apagarse.";
     2: print_ret "Ya estaba", (n) x1, " apagad", (o) x1, ".";
     3: "Apagas ", (the) x1, ".";
	4:	print (The) actor, " apaga ", (the) x1, ".^";
    }

  SwitchOn:
    ! Generada al intentar ENCIENDE OBJETO si el objeto tiene el
    ! atributo "conmutable". Observar que si no lo tiene, la acción
    ! que se genera será sin embargo Quemar.
    !
    !   1: Error, el objeto no es conmutable (este error no aparecerá
    !      si el jugador pone ENCIENDE OBJETO, ya que en este caso la
    !      acción generada será Quemar objeto, pero puede aparecer si
    !      pone CONECTA OBJETO)
    !   2: Error, el objeto ya tenía el atributo "encendido"
    !   3: Exito, el objeto tiene ahora activado "encendido".
    switch(n)
    {
     1: print_ret "No es algo que pueda encenderse.";
     2: print_ret "Ya estaba", (n) x1, " encendid", (o) x1, ".";
     3: "Enciendes ", (the) x1, ".";
	4:	print (The) actor, " enciende ", (the) x1, ".^";
    }
    
    Take:
    ! Hay 13 casos diferentes. Se trata de 1 mensaje de éxito y 11
    ! mensajes de error y un aviso
    !  1: Exito
    !  2: Error, el objeto cogido es el propio jugador
    !  3: Error, el objeto cogido es animado
    !  4: Error, el jugador está subido o metido en el objeto que
    !     intenta coger
    !  5: Error, el jugador ya tenía ese objeto
    !  6: Error, el objeto está en poder de un ser animado [ml_o
    !     apunta al ser, no al objeto, el cual puede obtenerse en la
    !     variable "uno"]
    !  7: Error, el objeto es un sub-objeto de otro (está dentro de un
    !     objeto que tiene el atributo "transparente", pero no tiene el
    !     atributo "recipiente" ni "soporte")
    !  8: Error, el objeto está dentro de otro, pero este otro no es
    !     recipiente ni soporte ni transparente (probablemente un error
    !     de programación)
    !  9: Error, el objeto está dentro de un recipiente cerrado.
    ! 10: Error, el objeto es escenario
    ! 11: Error, el objeto es estatico (no puede ser llevado de la
    !     localidad en que se halla)
    ! 12: Error, el jugador lleva demasiados objetos
    ! 13: Mensaje de aviso, la librería ha decidido mover objetos del
    !     inventario al "objeto saco" para hacer sitio y que el jugador
    !     pueda coger el objeto. [El objeto saco es uno que puede
    !     declarar el programador. Si el jugador lo coge y lo lleva
    !     consigo, la librería lo usará automáticamente como mochila
    !     para descargar al jugador cuando sea necesario]
    switch(n)
    {
!     1: "Hecho."; ! [infsp] fixed, no se pasa el objeto
     1: if (dialecto_sudamericano) print "Tomad";
     	else print "Cogid";
     	print_ret (o) noun, ".";
     2: "Siempre te tienes a ti mism", (o) player, ".";
     3: "No creo que ", (al) x1, " le", (s) x1, " gustara.";
     4: print "Tienes que ";
    if (x1 has supporter) print "bajarte "; else print "salirte ";
    print_ret (del) x1, " antes.";
     5: "Ya tienes ", (the) x1, ".";
     6:    "Parece que pertenece", (n) noun, " ", (al) x1, ".";
     7: "Parece", (n) noun, " formar parte ", (del) x1, ".";
     8: "No ", (esta) x1, " disponible", (s)x1, ".";
     9: print_ret (The) x1, " no ", (esta) x1, " abiert", (o) x1, ".";
     10: "Difícilmente podrías llevarte eso.";
     11: print_ret (The) x1, " está fij", (o) x1, " en el sitio.";
     12: "Ya llevas demasiadas cosas.";
        13: print "(colocas ", (the) x1, " en ", (the) SACK_OBJECT,
     " para hacer sitio)"; say__p = 0; return;
        14: "No alcanzas ", (the) x1, ".";
        15: "No puedes llevarte ", (the) x1, ".";
        16: print (The) actor, " toma ", (the) x1, ".^";
    }

   Taste:        "No saboreas nada inesperado.";
  
   Tell:
    ! Dos casos:
    !  1: El jugador habla consigo mismo
    !  2: Hablar con cualquier otro ser animado
    ! [Nota: Hablar con un objeto inanimado no está permitido por el
    ! parser, que da un error y no llega a generar la acción]
    ! [Los errores de parser se tratan en la sección "Miscelanea" de
    ! esta rutina, al final]
    switch(n)
    {
     1: "Hablas sol", (o) player, " durante un rato.";
     2: "No has provocado ninguna reacción.";
    }
    
   Think:        "Vaya. Qué buena idea.";
   ThrowAt:
    ! Dos casos:
    !  1: Lanzar cosas a objetos inanimados
    !  2: Lanzar cosas a objetos animados
    switch(n)
    {
     1: "No serviría de nada.";
     2: "En el último momento te echas atrás.";
    }
 Tie:  "No lograrás nada con eso.";
  Touch:
    ! Tocar genera tres mensajes diferentes
    !  1: Si se intenta tocar a un ser animado
    !  2: Tocar un objeto normal del juego
    !  3: Tocarse a si mismo
    switch(n)
    {
      1: "¡Las manos quietas!";
      2: "No notas nada extraño al tacto.";
      3: "Si crees que eso servirá de algo...";
	4:	print (The) actor, " se toca impúdicamente.^";
	5:	print (The) actor, " no puede reprimir el deseo de tocarte.^";
	6:	print (The) actor, " toca ", (al) x1, ".^";
    }
! Turn: see Pull.

  Unlock:
    ! QuitarCerrojo se genera ante ABRE <objeto> CON <objeto2>, o también
    ! ante QUITA CERROJO A <objeto> (en este segundo caso no se
    ! especifica la "llave" que abre la puerta).
    !
    !  1: Error, el objeto que se intenta abrir, no tiene el atributo
    !    cerrojo.
    !  2: Error, el objeto que se intenta abrir tiene atributo
    !     "cerrojo", pero no tiene atributo "cerrojoechado"
    !  3: Error, el <objeto2> que se intenta usar como llave, no
    !     coincide con la propiedad "con_llave" del <objeto> que
    !     intenta ser abierto.
    !  4: Exito. El <objeto> se abre (con <objeto2> si éste ha sido
    !     especificado, el cual podemos encontrarlo en la variable "otro"
    switch(n)
    {
     1: "No parece", (n) x1," tener ningún tipo de cerrojo.";
     2:    print_ret (The) x1, " ya tenía", (n) x1, " abierto el cerrojo.";
     3: if (second) "No parece", (n) x1, " encajar en la cerradura.";
    "Necesitas algún tipo de llave.";
     4: if (second) "Quitas el cerrojo ", (al) x1, " con ", (the) second, ".";
    "Quitas el cerrojo ", (al) x1, ".";
        5:	print (The) actor, " quita el cerrojo ", (al) x1, ".^";
    }

 Verify:
    ! 1: Éxito
    ! 2: Error en la verificación
    switch(n)
    {
     1: "Fichero de juego verificado e intacto.";
     2: "El fichero de juego no parece intacto, puede estar corrompido
    (a menos que estés jugando con un intérprete muy primitivo que
    no sea capaz de realizar la comprobación).";
    }
  Wait: switch (n) {
        1:  "Pasa el tiempo...";
        2:   print (The) actor, " deja pasar el tiempo.^";
    }
    Wake:   "La cruda realidad es que esto no es un sueño.";
   WakeOther: "No parece necesario hacer eso.";
   Wave:
  ! Agitar genera dos mensajes diferentes:
  !  1: Si se intenta agitar un objeto que no está en el inventario
  !  2: Si se agita un objeto que sí está en el inventario
    switch (n)
    {
      1: "No l",(o) x1, " tienes.";
      2: "Te sientes ridícul", (o) player, " agitando ", (the) x1, ".";
	3:	print (The) actor, " agita ", (the) x1, ".^";
    }
   WaveHands:  "Te ves ridícul", (o) player, " gesticulando así.";
  ! La acción Gesticular sale ante las frases "gesticula", "agita la
  ! mano", "sacude la mano", "saluda con la mano"...
   Wear:
    !  1: Error, el objeto no tiene el atributo "prenda"
    !  2: Error, el jugador no tiene el objeto
    !  3: Error, el objeto ya tiene el atributo "puesto"
    !  4: Exito.
    switch(n)
    {
     1: "¡No puedes ponerte eso!";
     2: "No ", (lo) x1, " tienes.";
     3: "¡Ya ", (lo) x1, " llevas puest", (o) x1, "!.";
     4: "Te pones ", (the) x1, ".";
	5:	print (The) actor, " se pone ", (the) x1, ".^";
    }
! Yes:  see No.
];

-) instead of "Long Texts" in "Language.i6t".


Section 12 - Otras rutinas

Include (-
! Cuando el usuario teclea un comando incompleto, es necesario que
! el parser genere un mensaje preguntando por lo que falta,
! pero la forma de preguntarlo depende del verbo. Por ej.:
!
! > coge
! ¿Qué quieres coger?
!
! > mete llave
! ¿Dónde quieres meter la llave?
!
! > orco, saca la botella
! ¿De dónde tiene que sacar el orco la botella?
!
! Cuando el parser tiene que imprimir una respuesta de estas,
! simplemente llama a MLIdioma con el número de mensaje Misc, 48 o
! 49. En esta versión de la librería (6/7) es responsabilidad de
! LanguageLM generar el mensaje completo.
!
! En nuestro caso hemos implementado estos mensajes de forma que
! llaman a IniciarPregunta para que escriba una partícula interrogativa
! como "Donde" "De donde", etc. Si no escribe nada, MLIdioma pone
! "Qué" o "A quién" según el tipo de error, a continuación se escribe
! "quieres" o "tiene que" según quién sea el actor. Se llama a
! LanguageVerb para que escriba el verbo, y finalmente se añade el
! name del objeto directo si lo había, para terminar la pregunta
! cerrando la interrogación.
!
! IniciarPregunta, lo que hace es: 
!
! 1) busca preposiciones en el patrón que ha encajado, si las
! encuentra, la pregunta debe comenzar por alguna partícula
! interrogativa. Por ejemplo, si la línea de gramática hallada era
! "saca" noun "de" noun, se hallará la preposición "de" que nos indica
! que la pregunta ha de comenzar con "¿De dónde ...".
!
! 2) Llama a la función "IdiomaPreguntarPrep" que recibe como
! parámetros la preposición y la acción en curso, para que imprima la
! partícula interrogativa adecuada. Esta función tan sólo debe
! escribir esa partícula.
!
! IdiomaPreguntarPrep llama a su vez a PreguntarPreposicion por si el
! programador añade verbos raros con preposiciones raras que no son
! correctamente manejados por esta rutina. Si PreguntarPreposicion
! existe y retorna distinto de cero, IdiomaPreguntarPrep asumirá
! que la partícula interrogativa ya ha sido escrita por
! PreguntarPreposicion y no hará nada más.
!
[ IdiomaPreguntarPrep prepos action;

    if (PreguntarPreposicion(prepos, action)) return;
!    print "^IPPrep: action: ", (DebugAction)action, "  Prepos: ",(address)prepos,"^"; ! infsp debug 
    switch (prepos)
    {
     'de': 				print "De dónde";
     'en', 'dentro', 'encima': 	print "Dónde";
     'bajo','debajo':		print "Debajo de qué";
     'sobre', 'acerca':		print "Sobre qué";
     'contra': 			print "Contra qué";
     'hacia':				print "Hacia dónde";
     'con':if (action==##Tell or ##Attack)  print "Con quién";
              else print "Con qué";
     'por':if (action==##Ask) 	print "Por qué";
              else print "Por dónde";
     'una', 'un' : 			print "A quién";
     'a//':  switch(action){
           ##Go:          	print "Hacia dónde";
           ##Climb:      	print "Dónde";
           ##ThrowAt, ##Give, ##Show, ##Answer, ##Tell, ##Ask:
				print "A quién";
           ##Search:		print "A través de qué";
           ##Tie: 	        print "A qué"; 
           ##Enter: 		print "A dónde";
           default:         print "A quién";
       };
    }
];


! A partir del patrón que ha construido el parser, se determina cuál
! es la primera preposición usada detrás del verbo.
! Esto será usado por la función IniciarPregunta y por LanguageIsVerb
! [INFSP] Recoding para un mejor comportamiento en caso de lineas de gramaticas complejas
! Ej: 'pon' noun 'en/sobre' noun . Antes usando 'sobre' (segundo token) no andaba.
! (devolvia NULL)

[ AveriguarPreposicion 
    i k p ;

!    print " ",pattern-->(pcount-1)," ^"; ![infsp] debug

    p = NULL;
    for (k=pcount:k>=1:k=k-1){ ! infsp tunnig, para evitar el menos menos que quiebra la sintaxis de Include
!        print "^AP: k:",k; ! infsp debug
       i=pattern-->k;
!        print "^ i:",(address)VM_NumberToDictionaryAddress(i-REPARSE_CODE); ! infsp debug 
       if ( i == PATTERN_NULL) continue;
       if (i>=REPARSE_CODE)
           p=VM_NumberToDictionaryAddress(i-REPARSE_CODE);
    }
    return p;

];


[ AveriguarPrimeraPreposicion
    i k p found;
    p=NULL;
    for (k=pcount:k>=1:k=k-1) ! infsp tunnig, para evitar el menos menos que quiebra la sintaxis de Include
    { 
!     print "^AP: k:",k; ! infsp debug
     i=pattern-->k;
!    print "^ i:",i; ! infsp debug 
   if (pattern-->k == PATTERN_NULL) continue;
!    i=pattern-->k;
        if (i>=REPARSE_CODE)
        {
        i=VM_NumberToDictionaryAddress(i-REPARSE_CODE);
        p=i;    ! nos quedamos con la primera
        found=k;
        }
    }
!    print "APP: Primera prep: ",(address) p; ! infsp debug
!    print " / found :",found; ! infsp debug
!    print " / pcount :",pcount,"^"; ! infsp debug
    
    if (found==(pcount -1)) return NULL;
    else return p;
];


! Averigua si es necesaria una partícula interrogativa. Llama a
! IdiomaPreguntarPrep para que la imprima.
!
! Retorna 1 si ha sido impresa la partícula interrogativa, y 0 en caso
! contrario, (y entonces la función que la llamó "LanguageLM", sabe
! que es necesario escribir "Qué" o "A quién" ya que en este caso lo
! que faltaba era el objeto directo en lugar del complemento.
!
[ IniciarPregunta
    p;

    print "¿";
    p=AveriguarPreposicion();
    if (p~=NULL) {
      IdiomaPreguntarPrep(p, action_to_be);
      return 1;
    }
    return 0;
    
];

[ IdiomaImprimirComando from i k spacing_flag prep;

  if (from==0)
  {   i=verb_word;
      LanguageVerb(i);
      from++; spacing_flag = true;
  }
  
! print "^Valor de from: ",from,"^"; ! infsp debug
! print "Valor de pcount: ",pcount,"^"; ! infsp debug
  
  for (k=from:k<pcount:k++){
     i=pattern-->k;
!     print "^IIC: i: ",  i, "^"; ! infsp debug
      if (i == PATTERN_NULL) continue;
!      if (spacing_flag) print (char) ' ';
      if (i == 0 ) { print " ",(string) THOSET__TX; jump TokenPrinted; }
      if (i == 1) { print " ",(string) THAT__TX;   jump TokenPrinted; }
      if (i >= REPARSE_CODE) continue;
      else {
            if (i in compass && LanguageVerbLikesAdverb(verb_word))
                LanguageDirection (i.door_dir); ! the direction name as adverb
            if (i==player) print "te";
            else  {
               prep=AveriguarPrimeraPreposicion();
               switch(prep){
                 'a//': print " ",(al) i;
                 'de': print " ",(del) i;
                 NULL: print " ",(the) i;
                 default: !print " ", (address) prep;
                           print " ",(the) i;
               }
            }
      continue;
      }
      .TokenPrinted;
      spacing_flag = true;
  } ! for
];


! ---------------------------------------------------------------------------
! Otras rutinas de soporte para el AUTOR de Aventuras 

[ TextoLlamativo txt;
    ! Imprime un texto rodeado de asteriscos y en negrita. 
    ! Puedes cambiarlo si quieres que aparezcan en otros formatos.
     VM_Style(ALERT_VMSTY);
!     print "***", (string) txt, "***"; ! [010508] Corregido bug (string)
     print (string) txt; ! infsp fix, los asteriscos ya se ponian en parserm.h
     VM_Style(NORMAL_VMSTY);
];


Constant LIBRARY_SPANISH;       ! for dependency checking.
-)

Section 13 - Otras Acciones


Include (-
! Esto era parte de SpanishG.h -(Gramatica.h) GRAMATICA: Gramática española

#Stub PreguntarPreposicion 0;

#ifdef DEBUG;
  [ ActivarAcentosSub;
    quitacentos = 0;
    "Los acentos no serán eliminados del comando recibido.";
  ];

  [ DesactivarAcentosSub;
    quitacentos = 1;
    "Los acentos serán eliminados del comando recibido, pero sólo en
      las palabras que de otro modo no serían comprendidas.";
  ];
#endif; ! DEBUG

! Elección del dialecto (afecta a la interpretación del
! verbo COGER únicamente)

[ DialectoSub;
  print "Actualmente estás jugando en el dialecto ";
  if (dialecto_sudamericano)
    print "sudamericano";
  else
    print "castellano";
  ". Puedes elegir dialecto usando el comando DIALECTO SUDAMERICANO \
    o bien DIALECTO CASTELLANO.";
];

[ DialectoSudSub;
  dialecto_sudamericano = 2; ! git
  "Elegido dialecto SUDAMERICANO.";
];    

[ DialectoCastSub;
  dialecto_sudamericano = 0;
  "Elegido dialecto CASTELLANO.";
];


[ QuitarSub;
    if (second) <<Remove noun second>>;
    if (noun in player) <<Disrobe noun>>;
    <<Take noun>>;
];

! Algunas lineas de gramatica no incluidas en las SR (lineas que son propias de InformATE)
! [TODO]: a la espera de ser 'transferidas' a SL (Spanish Localization I7 Extension)
! Actualizacion, ahora si andan las Extend, porque se cambio de lugar la inclusion de SpanishG
!   en el codigo de auto.inf (usando Foreign Language en SL y main.i6)

Verb meta 'dialecto'
  *                                   -> Dialecto
  * 'sudamericano'               -> DialectoSud
  * 'castellano'                    -> DialectoCast;

! GotoRoomSub: algunos momios de informATE estaban acotumbrados a hacer >xir 'nombre_habitacion'
! pero, despues de la Build 4S08 no fue posible sino la forma oficial
! >xir 'numero_habitacion' . Ese numero_habitacion se ve haciendo >tree
! Aqui agregamos una variante para poder seguir usando nuestro >xir 'nombre_habitacion'
! (de puro caprichosos que somos) 

#ifdef DEBUG;

[ GotoRoomSub x;  ! para funciones de debug
    x = noun;
    while (parent(x) ~= 0) x = parent(x);
!    print "   Moviendo a ",(the) x,"^";!infsp debug
    PlayerTo(x);
];   
  
 Verb meta 'acentos'
    *                                 -> ActivarAcentos
    * 'on'/'si'                          -> ActivarAcentos
    * 'off'/'no'                      -> DesactivarAcentos;

  Verb 'traza' = 'trace';

  Verb 'acciones' = 'actions';

  Verb 'aleatorio' 'predecible' = 'random' ;

  Verb 'xroba' = 'purloin';

  Verb meta 'xmueve'
	* scope=testcommandnoun ’a//’ scope=testcommandnoun -> XAbstract;

  Verb 'arboljuego' 'xarbol' = 'tree';

  Verb meta 'xir'
    * scope=testcommandnoun  -> GotoRoom;

  Verb 'irdonde' = 'gonear';

  Verb 'alcance' = 'scope' ;

  Verb 'xverbo' = 'showverb';

  Verb 'xobjeto' =  'showme';

  Verb 'relaciones'= 'relations';
  
  Verb 'reglas' = 'rules';
  
  Verb 'escenas' =  'scenes';
  
#endif;  ! DEBUG

-) after "Grammar" in "Output.i6t".


Section 14 - Hora en palabras


Include (-
! Spanish Version of the saying 'time of day in words'
![ PrintTimeOfDaySpanish t h m dir aop say_minutes quad;
[ PrintTimeOfDayEnglish t h m dir aop say_minutes quad;

!   t store the minutes from 0am until now
!  se tiene en cuenta: 8:40 nueve menos veinte
!                               8:15 ocho y cuarto
!                               8:53 7 minutos para las nueve
!	                    8:14 ocho horas y catorce minutos
!           		        1:20 una y veinte (y todas las variantes con 'una')

    quad = 1; ! =1 es la primera media hora, =2 es la segunda
    h = (t/60) % 12; m = t%60; if (h==0) h=12;
	if (m==0) { if(h==1) print "una"; else print (number) h;print " en punto"; return; } !infsp hack
	dir = "y";! infsp hack
	if (m > 30) { m = 60-m; h = (h+1)%12; if (h==0) h=12; dir = "menos"; quad=2;} !infsp hack
	switch(m) {
        5: say_minutes = "cinco";
        10:say_minutes = "diez";
		15: say_minutes = "cuarto";
        20: say_minutes = "veinte";
        25: say_minutes = "veinticinco";
        30: say_minutes = "media";
		default: 
            if (quad == 2){
              print (number) m;
		      if (m%5 ~= 0) {
					if (m == 1) print " minuto"; else print " minutos"; ! infsp hack
		      }
              if(h==1) print " para la una"; else print " ", "para las ", (number) h;!infsp hack

            }
            if (quad == 1){
              if(h==1) print "una y "; else print (number) h," horas "; print (number) m;
		      if (m%5 ~= 0) {
					if (m == 1) print " minuto"; else print " minutos"; ! infsp hack
		      }
            }
        	return;
	}
	if(h==1) print "una"; else print (number) h; print " ",(string) dir, " ",(string) say_minutes;!infsp hack
]; 
-) instead of "Analogue Printing" in  "Time.i6t".

[spanish version: minuto, hora, de, etc]
Include (-
[ RELATIVE_TIME_TOKEN first_word second_word offhour mult mn original_wn;
	original_wn = wn;
	wn = original_wn;
	
	first_word = NextWordStopped(); wn--;
!	if (first_word == 'an' or 'a//') mn=1; else mn=TryNumber(wn);
	if (first_word == 'una' or 'un') mn=1; else mn=TryNumber(wn);
	
    if (mn == -1000) {
		first_word = NextWordStopped();
		if (first_word == 'media') offhour = HALF_HOUR;
		if (first_word == 'cuarto') offhour = QUARTER_HOUR;
		if (offhour > 0) {
			second_word = NextWordStopped();
			if (second_word == 'de') second_word = NextWordStopped();
!			if (second_word == 'an') second_word = NextWordStopped();
			if (second_word == 'hora') {
				parsed_number = offhour;
				return GPR_NUMBER;
			}
		}
		return GPR_FAIL;
    }
	wn++;
	
	first_word = NextWordStopped();
	switch (first_word) {
		'minutos', 'minuto': mult = 1;
		'hora', 'horas': mult = 60;
		default: return GPR_FAIL;
	}
	parsed_number = mn*mult;
	if (mult == 60) {
		mn=TryNumber(wn);
		if (mn ~= -1000) {
			wn++;
			first_word = NextWordStopped();
			if (first_word == 'minutos' or 'minuto')
				parsed_number = parsed_number + mn;
			else wn = wn - 2;
		}
	}
	return GPR_NUMBER;
];
-) instead of "Relative Time Token" in  "Time.i6t".

Section 15 - Spanish Banner

[just replacement "by" --> "por"]

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
!print " by ", (string) Story_Author;
print " por ", (string) Story_Author;! infsp hack 'by' - INTER - LOCALISATION
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
-) instead of "Banner" in  "Printing.i6t". 

Section 16 - PrefaceByArticle Hacked

[for use of rutines [el_], [un_] ]

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


!    if (pluralise) {
! [infsp]: para q funcione con (el_), se agrego '>0' para el correcto funcionamiento (sino al final imprime el nombre de objeto cuando yo solo quiero imprimir su articulo)
    if (pluralise>0) { ![INFSP] ej, en ListMiscellany 19,[TODO] esto podria resolverse como los italianos
        if (i < 3 || (i >= 6 && i < 9)) i = i + 3;
    }
    i = LanguageGNAsToArticles-->i;

    artform = LanguageArticles
        + 3*WORDSIZE*LanguageContractionForms*(short_name_case + i*LanguageCases);

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

-) instead of "Object Names II" in  "Printing.i6t".

Section 17 - IndefArt Hacked

[! [infsp] Indefart: se agregó el "a " en caso de nombre propio " a Mamá"]

Include (-
Replace IndefArt;
-) after "Definitions.i6t". 

Include (-
[ IndefArt obj i;
	if (obj == 0) { print (string) NOTHING__TX; rtrue; }
    i = indef_mode; indef_mode = true;
    if (obj has proper) { indef_mode = NULL; print "a ",(PSN__) obj; indef_mode = i; return; }
    if ((obj provides article) && (obj.article ~= EMPTY_TEXT_VALUE)) {
        PrintOrRun(obj, article, true); print " ", (PSN__) obj; indef_mode = i;
        return;
    }
    PrefaceByArticle(obj, 2); indef_mode = i;
];
-) after "Object Names III" in "Printing.i6t".

Section 18 - Checkin I7 Build version - Not for release 

A startup rule:
	Check I7 Version.

To Check I7 Version: (- chkI7V(); -).

Include (-
#ifdef DEBUG;
Array  buffer_nversion string 7;    ! infsp debug: Buffers for cheking I7 IDE correct version
Array  buffer_bversion string 7;    ! See LanguageInitialise, below.

Constant NI_NEEDED_VERSION "6E72";
! LanguageInitialise: ojo que aqui aun no se seteo el I/O para Glulx (no andarian los prints y demás).

[ chkI7V;				!infsp debug : check correct I7 Build Version
!     print "LanguageInitialise^^"; 
   if ( ~~CheckI7version() ){
     print "^^^ INFSP ATENCION : Este juego fue compilado con una version distinta de
        Inform (distinta a la soportada por la extensión Spanish).^Asegurate de compilar con la ";
     ImprimeTodoElBuffer(buffer_nversion);
     print ". ^^^"; 
   }

];

[ CheckI7version	l i;
	l = VM_PrintToBuffer(buffer_nversion, 4, NI_NEEDED_VERSION);
	l = VM_PrintToBuffer(buffer_bversion, 4, NI_BUILD_COUNT);    
	for (i=WORDSIZE:i<WORDSIZE+4:i++)	! comparar caracter x caracter:
		if (buffer_bversion->i ~= buffer_nversion->i) rfalse;
		rtrue;
];
#endif; ! DEBUG
-) after "Definitions.i6t".

Spanish ends here.

---- DOCUMENTATION ----

Con esta extensión se pretende hacer posible el uso de I7 en la comunidad hispana de ficcion interactiva.
Y que se creen aventuras donde te pasen cosas chulas! 

Chapter: Cosas especificas que ofrece Spanish

Las puedes encontrar en:
	Index>>Phrases seccion 'From the extension Spanish'


Section: Actualizar pronombres

A veces, el parser asigna internamente un mapeo diferente de pronombres:
	>>o
	Cocina
	Estás en la cocina del castillo. Esto está lleno de cacerolas y de cacharros para cocinar. Hay un horno, un fregadero y un armario pequeño.

	Puedes ver un cuchillo.

	>>cogelo
	Difícilmente podrías llevarte eso.

	>>coge el cuchillo
	Cogido.

Puedes hacer que I7 actualice los pronombres activando la opcion:
	Use Auto Pronouns.

O puedes actualizar manualmente ante algun evento con "notice OBJETO"
	Before printing the name of the cuchillo: notice the cuchillo.

Desde la Build 5G67 parece que los mapeos de pronombres son correctos (no haria falta usar esto).

Section: InformATE - PreguntaSiNo

Esto es para que el parser no interprete una respuesta "NO" como noroeste, al hacer una pregunta retorica.
Se trata de "allow no response" o su equivalente "permitir no como respuesta". Solo funciona un turno.

	Instead of examining the anciana:
		say "La anciana al ver que te fijas en ella te dice '¡Hola guapo! ¿Quieres que te lea tu futuro
		amoroso?' dice sentada lujosamente en su puesto de la feria.";
		allow no response.

Mas detalles en el "INFSP 7 Manual.txt"

Section: Comando Salidas

Anteriormente, Spanish daba soporte al comando salidas (heredado de informATE). Pero la evolucion interna de I7 hizo imcompatible el código asociado. Es mucho mejor utilizar un par de extensiones que ya hacen ese trabajo, como la Exit Description by Matthew Fletcher (hay una edicion SP en las librerias INFSP7).

Section: Dialecto Sudamericano

El juego puede iniciar en modo sudamericano con la opcion:
	Use Dialecto Sudamericano.

En este modo, se interpretará a COGE como una palabra malsonante.
Puede consultarse el modo actual con el comando:
	>>DIALECTO

Y cambiarse con:
	>>DIALECTO SUDAMERICANO
	>>DIALECTO CASTELLANO

Tambien puedes decidir qué responder segun el modo activado:

	if Dialecto Sudamericano, say "Hola chamigo!".

Section: Gramatica hispana

Consulta la pestaña Index>>Actions

Section: La Hora

En ingles, existe la sustitucion "time of day in words" para decir la 'hora' con palabras:

		say "the [time of day in words]."

En español, se puede decir lo mismo con: (las dos formas funcionan en español)

		say "las [time of day in spanish]."

Section: Spanish Saying - Articulos y sufijos

En la salida de texto (funciones say "bla bla bla") pueden usarse las siguientes particulas de sustitucion.
El resultado será la impresión correcta del articulo y sufijo segun el genero o tiempo verbal.
Como son heredadas de informATE, puedes consultar tambien la seccion del DocumentATE: Descripciones y Parsing: Descripcion de objetos y lugares.

Articulos:
	el......."[el noun]"
	El......."[El noun]"
	Similares a the y The.

	un......."[un noun], puaj que asco."
	Similar a "[a noun]". Imprime el objeto, precedido por el artículo indefinido apropiado

	Un....."[_Un noun] avanza sin control"
	Como el anterior pero con la inicial en mayúscula, para empezar frase.

	del......say "Debes salir antes [del noun]."
	Imprime el nombre del objeto precedido por "del", "de la", "de los" o "de las" según su género y número. Observa que no serviría poner say "de [the noun]" ya que "de el" debe convertirse en "del". Si el obj no tiene artículos (o es nombre propio) se imprimirá "de" simplemente.

	al
	Al
	Imprime el nombre del objeto precedido por "al", "a la", "a los" o "a las" (o simplemente "a" si es nombre propio).

Terminaciones para adjetivo:
	o ........say "Cogid[o noun]"
	Imprime "o", "a", "os" o "as".  

	s......say "[The noun] ahora está[n noun] azul[s noun]." 
	Imprime "s" si es plural o bien nada si es singular (es decir, si el objeto es plural-named, como zapatos o pantalones)

	_s......say "[The noun] ahora está[n noun] azul[_s noun]." 
	Imprime "es" si es plural o bien nada si es singular. Pensado para hacer concordar en número a ciertos adjetivos que terminan en consonante (como azul).

Terminaciones para verbos:
	es.......say "No [es noun] nada importante." 
	Imprime "es" o "son" según el objeto sea singular o plural. Pensado para conjugar correctamente el verbo 'ser'. En el ejemplo, generará el mensaje "No es nada importante." o bien "No son nada importante.", según el número de noun.

	Es
	Como el anterior pero con la inicial en mayúscula, para empezar frase.

	n........say "[The noun] te mira[n noun]." 
	Imprime una "n" si el objeto es plural, o nada si es singular. Esto está pensado para hacer concordar el número de un verbo con su sujeto. En el ejemplo: dará lugar a algo como "Manolo te mira." si noun es manolo, o bien "Los cuervos te miran.", si el noun es un grupo de cuervos (que serán entonces objetos plural-named).

	lo........say "No puedes llevárte[lo noun]."
	Imprime el pronombre adecuado "lo", "la", "los", o "las".

Verbo COGER/TOMAR segun dialecto:
	coge....say "Vamos [coge]lo."
	Imprime "coge" o "toma" y detrás el sufijo que se especifique entre comillas. say "[coge]r" imprimiría "coger" o "tomar".
	
	Coge
	Como el anterior pero con la primera letra en mayúsculas.

	MMcoge
	Como el anterior pero con todas las letras en mayúsculas.

Chapter: Contact INFSP Team
	
	Web: www caad es/informate/infsp/
	Foro: www caad es/foro
	Wiki: wiki.caad.es/Inform7_Doc
	Main Developer: Sarganar
	Consultor / Tester: El Clerigo Urbatain
	Tester / Extensions: Mel Hython

	Feedbacks: sarganar (at) gmail (dot) com
	
	
	
Example: *	Cursillo Mini Juego - A little game from SPAC spanish webzine

	*: "Cursillo Mini Juego"

	[ Bienvenido al ejemplo del Cursillo Basico.
	Relajate y lee el codigo, tratando de imaginarte qué es lo que hace
	cada instrucción. Si amerita, en algunas porciones se han puesto las
	referencias al manual (luego de la palabra R) donde se dan más detalles.
	Usa la búsqueda (F3) para saltar a ellas o cualquier otra porción que no entiendas. ]


	[Include Spanish Localization by Sarganar.]
	[Include Spanish by Sarganar.]
	
	Include Spanish by Sebastian Arg.



	The story headline is "Un ejemplo práctico paso a paso, escrito por Sarganar." [R: Bibliographic data]

	[ Mensaje inicial]
	When play begins: say "Bienvenido al...[line break]".
 
	[ Siempre describir la habitacion cuando se llegue a ella]
	Use full-length room descriptions. [R: Use options]


	[*** LA CELDA INICIAL Y LOS OBJETOS QUE CONTIENE ***]

	The Celda is a room. The printed name is "En medio de ningún sitio".
	The description is "Estás en una especie de celda de paredes metálicas y
	lisas. Hacia el norte no hay pared y fuera puedes ver un paisaje
	soleado. Hacia el sur hay un pasadizo."

	[ La salida norte: Se debe examinar si el objeto puerta de cristal
	está cortado o no antes de decidir si el jugador puede
	pasar. Además, se debe mirar si el objeto cúpula ha
	disparado la alarma para ver si el jugador ha ganado
	o todavía no puede salir. ]

	Instead of going north in the Celda: [R:Going from, going to]
		if the pared is cortada begin;
			say  "Cruzas la puerta que tú mismo has creado en el muro
			de cristal y sales al exterior triunfante.";
			end the game in victory;[R:When play ends]
		otherwise;
			say "Ouch! ¿Qué es esto? Lo que habías tomado
			por ausencia de pared es en realidad un muro de cristal transparente.
			¡No puedes salir!";
		end if.

	Instead of going north in the Celda during Alarma:
		if the pared is cortada then say  "No puedes salir con esa alarma sonando.
		Te cogerían enseguida. Y te cogerán de todos modos si no la haces callar pronto.".


	[Los objetos]

	A cupula de cristal is here. The printed name is "cúpula de cristal".
	The description is "[if open]Está abierta.[otherwise]Examinando con
	detenimiento la cúpula descubres una especie de juntura. Parece
	una tapa que podría abrirse." [esto se muestra ante la orden EXAMINAR, segun la 
		cupula esté abierta o cerrada.R: Devices and descriptions]
	It is container, openable, closed and female.
	It is fixed in place and transparent.
	Understand "tapa" as cupula.

	[ Lo siguiente es una 'Activity' para modificar la descripción de la cupula
		mientras se describe la habitacion. ]
	Rule for printing room description details of cupula: [R:printing room description details]
	if the cupula is open begin;
		say " con la tapa abierta, ubicada en el centro de la habitación";
	otherwise if the diamante autentico is in the cupula;
		say " en cuyo interior refulge un increíble diamante" ;
	end if;
	omit contents in listing. [evitar el listado automatico del contenido]

	Instead of attacking or cutting the cupula, say "No es necesaria una acción
		tan drástica. La cúpula tiene una tapa."

	A diamante autentico is in the cupula.
	The description is "Tiene un brillo casi cegador, que no parece explicable
		por las leyes de la óptica."
	Understand "diamante increible/luminoso/autentico/refulgente/cegador/brillante" as diamante autentico.
	Instead of attacking the diamante autentico, say "No podría, es muy duro."
	Does the player mean doing something with the diamante autentico: it is likely. [para forzar la ambiguedad diamante autentico/falso inclinando la balanza al autentico. R:Does the player mean]
	
	Instead of examining the diamante autentico when the noun is inside the cupula, say "El diamante reposa sobre un cojín de terciopelo."


	[ Lo siguiente avisa al jugador del puzzle resuelto con el texto:
	"Consigues sacar [the noun] sin disparar la alarma."
	Para ello primero debe verificar la accion taking para ver si se está sacando
	algo de la cupula (poniendo la variable flagHolder a 1).
	Luego de que la acción tiene lugar (flagHolder nos dice si se ejecutó o no
	sobre la cupula), revisa si la cupula ya quedó vacía (aun pueden quedar más cosas).] 

	Definition: A container is empty if it does not contain something. 

	The flagHolder is a number that varies.

	Check an actor taking something inside the cupula:
	change flagHolder to 1.
	
	After taking something during Entire Game :
	if flagHolder is 1 begin;
		if the cupula is not empty begin;
		say "Consigues sacar [the noun] sin disparar la alarma.";
		otherwise;
		continue the action;
		end if;
		change flagHolder to 0;
	otherwise;
		continue the action;
	end if.      
	
	
	[ La pared de cristal (oculta, no se menciona 
	en la descripción de la habitación)
	Tiene una propiedad "cortada/lisa'' que hemos inventado para este
	objeto en particular. Ya que la librería no conoce esta propiedad
	debemos programar nosotros cómo cambia con las acciones del jugador
	El valor inicial es "lisa". Cambiará a "cortada" cuando
	el jugador haga la acción correcta.]
	
	The pared de cristal is here.
	The description is "La pared norte es de un cristal tan transparente que
		en un primer momento pensaste que no había pared."
	The pared can be lisa or cortada. The pared is lisa.[definicion de propiedad nueva]
	It is female and scenery.
	Understand "rectangulo", "puerta", "muro" as pared.
	
	Cutting it with is an action applying to one thing and one carried thing.
	Understand "corta [something] con/usando [something preferably held]" as cutting it with.
	Understand "rompe [something] con/usando [something preferably held]" as cutting it with.
	
	Instead of cutting the pared with something (called herramientita):
		if the herramientita is a diamante autentico begin;
			if the pared is lisa begin;[uso de propiedad nueva]   
			say "Usando el diamante cortas limpiamente un rectángulo en forma de puerta.";
			now the pared is cortada;
			end if;	
		otherwise if the herramientita is a diamante falso;
			say "Intentas cortar el cristal usando el diamante rayado,
		pero sólo logras rayarlo más. No creo que este diamante
		sea auténtico...";
		otherwise;
			say "El cristal de la pared es demasiado resistente y no
		tienes herramienta para cortarlo.";
		end if.
	
	[ Esto genera la acción de ir al norte.
	Está aqui por si el jugador pone
	ENTRA EN RECTANGULO o ATRAVIESA CRISTAL...
	PASA POR PUERTA...]
	Instead of exiting when the player is in the Celda:
		try going north.
	Instead of entering the pared:
		try going north.
	
	
	[ Escenas ]
	Alarma is a recurring scene. Alarma begins when the cupula is empty.
	Alarma ends happily when the cupula is not empty.
	Alarma ends sadly when the time since Alarma began is 4 minutes. 
	
	When Alarma begins:
		change contador to 0;
		if the noun is something, say "Al sacar [the noun] de la cúpula una alarma
		empieza a sonar en algún lugar del exterior."
	
	When Alarma ends happily:
		say "Ufff. La alarma ha parado. Creo que nadie la ha escuchado."
	
	When Alarma ends sadly:
		end the game saying  "Súbitamente un rayo de luz vertical
		aparece en la estancia y
		se ensancha hasta convertirse en un cilindro. Cuando el
		resplandor se apaga ves que en su lugar ha aparecido un
		guardia con equipamiento anti-disturbios. 'Hmm' dice, 'Te
		crees muy listo ¿eh? Me has sacado de la siesta con esa
		maldita alarma y eso es algo que no perdono.'"
	
	The contador is a number that varies.[definicion de variable numerica]
	[ ** Se ejecuta cada turno, si Alarma está activada: ]
	Every turn during Alarma:
		increase contador by 1;
		if contador is 2, say "La alarma sigue sonando fuera. Acabará por atraer a alguien.";
		if contador is 3, say "Definitivamente, esa alarma te está poniendo muy
		nervioso. Mejor devolvías el diamante a su sitio.".
	
	
	
	[*** LA SEGUNDA CELDA Y LOS OBJETOS QUE CONTIENE ****]
	
	[El Cubiculo]
	The Celda2 is south of the Celda. The printed name is "Cubículo".
	The description is "Estás en un cubículo de techo bajo. La única salida
		está al norte, por donde has entrado."
	Instead of going nowhere from Celda2, say "Te he dicho que no hay más salidas."
	
	
	
	The diamante falso is here.The printed name is "diamante rayado".
	The description is "No brilla mucho porque su superficie está rayada. Hum
		¿Un diamante rayado?"
	Understand "diamante rayado" as diamante falso.
	Instead of attacking the diamante falso, say "Es falso. Seguro que podría romperlo,
		pero ¿qué ganaría con ello?"
	
	[Comandos de testeo]
	Test me with "s / toma diamante / n / abre cupula / deja diamante rayado en cupula / toma diamante / rompe pared con diamante / sal". 
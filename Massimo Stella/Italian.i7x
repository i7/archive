Version 3/110105 of Italian by Massimo Stella begins here.

"Lavoro basato sull'espansione Custom Library Messages di David Fisher. Modifica i messaggi del parser, ora tradotti in italiano." 

"based on Custom Library Messages by David Fisher" 


Part 0 - Apostrophes

Include Punctuation Removal by Emily Short.

After reading a command:
remove apostrophes.

Part 1 - Definitions

Section 1.1 - Library Message values

Library message id is a kind of value.
The library message ids are defined by the table of library messages.

The main object is an object that varies.
The secondary object is an object that varies.
The numeric amount is a number that varies.
The library-message-id is a library message id that varies.
The before library messages rule is a rule that varies.
The after library messages rule is a rule that varies.

Tense is a kind of value. The tenses are past tense and present tense.
Grammatical number is a kind of value. The grammatical numbers are singular and plural.
Grammatical person is a kind of value. The grammatical persons are first person, second person and third person.
Gender is a kind of value. The genders are gender masculine, gender feminine and gender neuter.

The library message tense is a tense that varies.
The library message grammatical number is a grammatical number that varies.
The library message person is a grammatical person that varies.
The library message gender is a gender that varies.
Library_message_debug is a thing. Library_message_debug can be on or off.

Section 1.2 - Defaults

The library message tense is present tense.
The library message grammatical number is singular.
The library message person is second person.
The library message gender is gender masculine.
Library_message_debug is off.

Table of custom library messages
Message Id			Message Text
library message id		text

Section 1.3 - Before and After rules

The before library messages rule is the empty rule.
The after library messages rule is the empty rule.

This is the empty rule:
   do nothing.

Section 1.4 - Altering messages

When play begins:
   init library messages;
   add the custom library messages.

To add the custom library messages:
   repeat through the table of custom library messages begin;
      set the message id entry to the message text entry;
   end repeat.

To set (id_ - library message id) to (msg_ - text):
   update the row with id of id_ to msg_.

To update the row with id of (id_ - library message id) to (msg_ - text):
   let n1 be 1;
   let n2 be the number of rows in the table of library messages;
   while n1 <= n2 begin;
      let mid be n1 plus n2;
	  change mid to mid divided by 2;
	  choose row mid in the table of library messages;
	  if the message id entry is id_ begin;
	     change the message text entry to msg_;
		 change n1 to n2 + 1;
	  end if;
	  if the message id entry < id_, change n1 to mid plus 1;
      if the message id entry > id_, change n2 to mid minus 1;
   end while.

libmsg_3ps_changed is a number that varies. libmsg_3ps_changed is 0.

To set the library message third person text to (name_ - text):
	set the library message third person text to name_ / name_ / name_.

To set the library message third person text to (upper_ - text) / (lower_ - text):
   set the library message third person text to upper_ / lower_ / lower_.

To restore the library message third person text:
   set the library message third person text to "Egli" / "egli" / "lui";
   change libmsg_3ps_changed to 0.

To set the library message third person text to (upper_ - text) / (lower_ - text) / (dobj_ - text):
   change libmsg_3ps_changed to 1;
   repeat through the table of 'you' forms begin;
      if Gramm Person entry is third person and
	     Gramm Number entry is singular begin;
		 if Case entry is upper-case, change Word entry to upper_;
         otherwise change Word entry to lower_;
	  end if;
   end repeat;
   repeat through the table of 'you' dobj forms begin;
      if Gramm Person entry is third person and
	     Gramm Number entry is singular then
      change Word entry to dobj_;
   end repeat.

Part 2 - Messages

Section 2.1 - End of game messages

Table of library messages
Message Id				Message Text
LibMsg <you have died>			" E['] finita."
LibMsg <you have won>			" Hai vinto! "

Section 2.2 - Descriptions

[ The following rule supercedes LibMsg <player self description> (left in for backwards compatibility, but has no effect) ]

Rule for printing the name of the player: say "[yourself]".

Table of library messages (continued)
Message Id				Message Text
LibMsg <player self description>		"[yourself]"
LibMsg <unimportant object>		"Non è veramente niente di così tanto importante."

[
   Removed "LibMsg <player description>"
   - use "The description of the player is ..." instead.
]

Section 2.2 - Descriptions b

The description of the player is "La solita faccia di sempre."

Section 2.3 - Prompts and Input

Table of library messages (continued)
Message Id				Message Text
LibMsg <empty line>			"Cosa vorresti dire?"
LibMsg <confirm Quit>			"Sei sicuro di voler uscire?(s/n) "
LibMsg <yes or no prompt>		"Per piacere rispondi 'sì' o 'no'."
LibMsg <restrict answer>		"Per piacere rispondi con una delle opzioni suggerite."
LibMsg <page prompt>			"[/n][bracket]Premi SPAZIO per piacere[dot][close bracket]"
LibMsg <menu prompt>			"[/n]Scrivi un numero da 1 fino a [numeric amount], 0 per ristampare o premi INVIO."
LibMsg <comment recorded>		"[bracket]Commento registrato[dot][close bracket]"
LibMsg <comment not recorded>		"[bracket]Commento NON registrato[dot][close bracket]"

Section 2.4 - Undo

Table of library messages (continued)
Message Id				Message Text
LibMsg <undo succeeded>		"[bracket]Il turno precedente è stato annullato[dot][close bracket]"
LibMsg <undo failed>			"[apostrophe]Annullamento[apostrophe] fallito. [bracket]Non tutti gli interpreti lo supportano[dot][close bracket]"
LibMsg <undo not provided>		"[bracket]Il tuo interprete non supporta il comando [apostrophe]undo[apostrophe]. Mi dispiace[ExMark][close bracket]"
LibMsg <cannot undo nothing>		"[bracket]Non puoi [apostrophe]disfare[apostrophe] ciò che ancora non è stato fatto[ExMark][close bracket]"
LibMsg <cannot undo twice in a row>	"[bracket]Non puoi [apostrophe]disfare[apostrophe] per due volte consecutive. Mi dispiace[ExMark][close bracket]"
LibMsg <undo forbidden>			"Il comando UNDO non è abilitato in questa storia."

Section 2.5 - Oops

Table of library messages (continued)
Message Id				Message Text
LibMsg <oops failed>			"Scusami, non può essere corretto."
LibMsg <oops too many arguments>	"[apostrophe]Oops[apostrophe] può correggere solo una singola parola."
LibMsg <oops no arguments>		"Niente da fare, vero?"

Section 2.6 - Again

Table of library messages (continued)
Message Id				Message Text
LibMsg <cannot do again>		"Non ci sono possibilità di ripetizione."
LibMsg <again usage>			"Per ripetere un comando come [apostrophe]rana, salta[apostrophe], ti basta pronunciare [apostrophe]ancora[apostrophe], non [apostrophe]rana, ancora[apostrophe]."

Section 2.7 - Syntax Errors

Table of library messages (continued)
Message Id				Message Text
LibMsg <command not understood>	"Non ho compreso quella frase."
LibMsg <command partly understood>	"Ho capito solamente sino a "
LibMsg <command badly ended>		"Non ho compreso come è terminato il comando."
LibMsg <command incomplete>		"Sembra che tu abbia detto troppo poco!"
LibMsg <command cut short>		"(Poichè è accaduto qualcosa di drammatico, la tua lista di comandi è stata tagliata pesantemente.)"
LibMsg <number not understood>	"Non ho compreso quel numero."
LibMsg <cannot begin at comma>	"Non puoi iniziare un comando con una virgola."
LibMsg <extra words before comma>	"Per parlare a qualcuno, prova [apostrophe]qualcuno, ciao[apostrophe] o qualcosa del genere."

Section 2.8 - Illegal Commands

Table of library messages (continued)
Message Id					Message Text
LibMsg <unknown object>			"Non si vede niente del genere."
LibMsg <object not held>			"Al momento non l[genderity] stai portando con te!"
LibMsg <unknown verb>				"Scusami, non riesco a comprendere che verbo tu voglia intendere."
LibMsg <verb cannot have inanimate object>	"Si possono fare cose del genere solo ad oggetti animati."
LibMsg <noun needed>				"Devi fornire un nome."
LibMsg <noun not needed>			"Puoi evitare di fornire un nome."
LibMsg <object needed>				"Devi nominare un oggetto."
LibMsg <object not needed>			"Puoi evitare di nominare un oggetto."
LibMsg <second object needed>			"Devi fornire un secondo oggetto."
LibMsg <second object not needed>		"Puoi evitare di fornire un secondo oggetto."
LibMsg <second noun needed>			"Devi fornire un secondo nome."
LibMsg <second noun not needed>		"Puoi evitare di fornire un secondo nome."
LibMsg <something more substantial needed>	"Devi nominare qualcosa di più sostanziale."

Section 2.9 - Multiple Objects

Table of library messages (continued)
Message Id					Message Text
LibMsg <verb cannot have multiple objects>	"Non puoi usare oggetti multipli con quel verbo."
LibMsg <too many multiple objects>		"Puoi usare oggetti multipli una sola volta in una riga."
LibMsg <not that many available>		"[if the numeric amount is 0]Nessun di quest[genderity][otherwise]Solo [numeric amount] di quest[genderity] [is|are for numeric amount][end if] disponibile."
LibMsg <no objects available>			"Non ve ne sono di disponibili!"
LibMsg <zero multiple objects>			"Niente da fare!"
LibMsg <first N objects>				"(considerando solamente i primi sedici oggetti)"
LibMsg <excepted object not included anyway>	"Ti aspettavi qualcosa che comunque non era scontata!"

Section 2.10 - Implicit Actions

To say entering|getting onto-into:
   if main object is not a supporter and main object is not a container,
      say "entrando";
   otherwise say "[if main object is supporter]sali[otherwise]entri[end if] [onto|into]".

Table of library messages (continued)
Message Id						Message Text
LibMsg <report implicit take>				"(prima prendi [the % dobj])"
LibMsg <report npc implicit take>				"([the actor] prima prende [the % dobj])"
LibMsg <implicitly pass outwards through other barriers>	"(prendendo [off|out of] [the % dobj])"
LibMsg <implicitly pass inwards through other barriers>	"([entering|getting onto-into] [the % dobj])"
LibMsg <cannot drop clothes being worn>		"(prima togliendosi [the % dobj] )"
LibMsg <cannot insert clothes being worn>		"(prima togliendosi [the % dobj] )"
LibMsg <cannot put clothes being worn>			"(prima togliendosi [the % dobj] )"

Section 2.11 - Carrying Capacity

Table of library messages (continued)
Message Id						Message Text
LibMsg <cannot exceed carrying capacity>		"Stai portando già troppe cose."
LibMsg <use holdall to avoid exceeding carrying capacity>	"(metti [the % dobj] dentro [the player's holdall] per fare posto)"
LibMsg <cannot insert if this exceeds carrying capacity>	"Non vi è più spazio dentro [the % dobj]."
LibMsg <cannot put if this exceeds carrying capacity>	"Non vi è più spazio sopra [the % dobj]."

Section 2.12 - Disambiguation

Table of library messages (continued)
Message Id				Message Text
LibMsg <who disambiguation>		"Chi intendi, "
LibMsg <which disambiguation>		"Quale intendi, "
LibMsg <whom disambiguation>		"A chi vorresti fare tutto questo?"
LibMsg <what disambiguation>		"Cosa vuoi fare precisamente?"
LibMsg <single object disambiguation>	"Scusami, puoi averne solo un[genderity] qui. Esattamente quale?"

Section 2.13 - Pronouns

To say <space> at the moment:
   if lm_present, say " al momento"

Table of library messages (continued)
Message Id				Message Text
LibMsg <pronoun not set>		"Non sono sicuro a cosa [apostrophe][pronoun word][apostrophe] si riferisca."
LibMsg <pronoun absent>		"[You] [can't] vedere [apostrophe][pronoun word][apostrophe] ([the %])[<space> at the moment]."
LibMsg <Pronouns initial text>		"Attualmente, "
LibMsg <Pronouns -means- text>		"significa"
LibMsg <Pronouns -unset- text>		"non è predisposto"
LibMsg <no pronouns known>		"alcun pronome verrà riconosciuto nel corso del gioco."

Section 2.14 - Commanding People

Table of library messages (continued)
Message Id				Message Text
LibMsg <person ignores command>	"[The %] [has|have] cose migliori da fare."
LibMsg <cannot talk to absent person>	"Pare che tu voglia parlare con qualcuno, ma non saprei con chi."
LibMsg <cannot talk to inanimate object>	"Non puoi parlare ad un oggetto inanimato."
LibMsg <npc unable to do that>		"[The actor] non pare prestarti attenzione, al momento."

Section 2.15 - File Operations

Table of library messages (continued)
Message Id				Message Text
LibMsg <confirm Restart>			"Sei sicuro di voler ricominciare?(s/n)"
LibMsg <Restart failed>			"Fallito."
LibMsg <Restore failed>			"Caricamento Fallito."
LibMsg <Restore succeeded>		"Ok."
LibMsg <Save failed>			"Salvataggio Fallito."
LibMsg <Save succeeded>		"Ok."
LibMsg <Verify succeeded>		"Il file di gioco è stato riconosciuto come intatto."
LibMsg <Verify failed>			"Il file di gioco potrebbe essere corrotto."

Section 2.16 - Transcripts

Table of library messages (continued)
Message Id				Message Text
LibMsg <transcript already on>		"La riscrittura è già attivata."
LibMsg <transcript already off>		"La riscrittura è già disattivata."
LibMsg <start of transcript>		"Inizia la riscrittura di"
LibMsg <end of transcript>		"[/n]Fine della riscrittura."
LibMsg <transcript failed>		"Fallito il tentativo di iniziare la riscrittura."
LibMsg <end transcript failed>		"Fallito il tentativo di terminare la riscrittura."

Section 2.17 - Scoring

Table of library messages (continued)
Message Id				Message Text
LibMsg <Score command>		"[if game over]Nel gioco[otherwise]Sinora[end if] hai totalizzato [the score] su [maximum score], in [turn count] mosse"
LibMsg <score changed>		"Il tuo punteggio è [if numeric amount >= 0]incrementato di [the numeric amount in italian words][otherwise]diminuito [0 minus the numeric amount in italian words][end if] punti"
LibMsg <score notification turned on>	"Notifica del punteggio attivata."
LibMsg <score notification turned off>	"Notifica del punteggio disattivata."
LibMsg <no scoring>			"Non vi è alcun punteggio in questa storia."
LibMsg <score rank>			", conquistandoti il titolo di "

Section 2.18 - Inventory

Table of library messages (continued)
Message Id					Message Text
LibMsg <report npc taking inventory>	"[The actor] guarda tra le sue cose."
LibMsg <Inventory initial text>			"Stai portando"
LibMsg <Inventory no possessions>		"Non stai portando nulla."

Section 2.19 - Darkness

Table of library messages (continued)
Message Id					Message Text
LibMsg <entering darkness>			"[if lm_past]Improvvisamente si è fatto buio.[otherwise]Adesso è tutto avvolto dall[']oscurità![end if]"
LibMsg <dark description>			"C[']è un buio pesto e non riesci a vedere nulla."
LibMsg <examine while dark>			"Oscurità. L[']assenza di luce impedisce ogni osservazione."
LibMsg <search while dark>			"Ma è buio!"
LibMsg <look under while dark>			"Ma è tutto buio!"
LibMsg <dark room name>				"Buio"

Section 2.20 - Take

Table of library messages (continued)
Message Id					Message Text
LibMsg <report player taking>			"Fatto."
LibMsg <report npc taking>			"[The actor] raccoglie [the % dobj]."
LibMsg <cannot take yourself>			"Tecnicamente lo fai già quotidianamente."
LibMsg <cannot take other people>		"Non penso proprio che sia una cosa di cui occuparsi."
LibMsg <cannot take something you are within>	"Non puoi farlo finchè ci sei sopra."
LibMsg <cannot take something already taken>	"E['] già in tuo possesso."
LibMsg <cannot take possessions of others>	"[=> noun] Pare che appartenga a [the % dobj]."
LibMsg <cannot take component parts>		"[=> noun] Pare che sia una parte di [the % dobj]."
LibMsg <cannot take hidden parts>		"[That|those] non [isn't|aren't] disponibile."
LibMsg <cannot reach within closed containers>	"[The %] [isn't|aren't] apert[genderity]."
LibMsg <cannot take scenery>			"Potrebbe essere più difficile di quanto tu stia pensando."
LibMsg <cannot take something fixed>		"Niente da fare, non si muov[if the curr_obj is singular-named]e[otherwise]ono[end if] di un millimetro."
LibMsg <cannot reach within other places>	"Non puoi arrivarci."

[ See also:
  	LibMsg <cannot exceed carrying capacity>
	LibMsg <use holdall to avoid exceeding carrying capacity> ]

Section 2.21 - Remove

Table of library messages (continued)
Message Id					Message Text
LibMsg <report player removing>		"Rimozione completata."
LibMsg <report npc removing>			"[The actor] rimuove [the % dobj] da [the second noun]."
LibMsg <cannot remove from closed containers>	"[It|they] [is|are] sfortunatamente chius[genderity]."
LibMsg <cannot remove something not within>	"Ma non ce ne sono più, ora."

Section 2.22 - Drop

Table of library messages (continued)
Message Id						Message Text
LibMsg <report player dropping>				"Lasci [the % dobj] per terra."
LibMsg <report npc dropping>				"[The actor] mette giù [the % dobj]."
LibMsg <cannot drop something already dropped>	"[The %] [is|are] già [here]."
LibMsg <cannot drop not holding>			"Come puoi lasciar via qualcosa che non porti con te?"
LibMsg <cannot drop if this exceeds carrying capacity>	"Non vi è lo spazio necessario!"

[ See also:
  	LibMsg <cannot drop clothes being worn> ]

Section 2.23 - Insert

Table of library messages (continued)
Message Id						Message Text
LibMsg <report player inserting>				"Metti [the % dobj] dentro [the second noun]."
LibMsg <report npc inserting>				"[The actor] inserisce [the % dobj] nel [the second noun]."
LibMsg <cannot insert something not held>		"Non puoi inserire qualcosa che al momento ti manca."
LibMsg <cannot insert into something not a container>	"Non tutto può contenere degli oggetti."
LibMsg <cannot insert into closed containers>		"[The %] è chiuso."
LibMsg <need to take off before inserting>		"Avrai bisogno di toglierti di dosso il necessario, prima di proseguire."
LibMsg <cannot insert something into itself>		"Non puoi posizionare qualcosa al suo stesso interno."

[ See also:
  	LibMsg <cannot insert if this exceeds carrying capacity>
	LibMsg <cannot insert clothes being worn> ]

Section 2.24 - Put On

To say would achieve:
   say "would [if lm_past]have achieved[otherwise]achieve"

Table of library messages (continued)
Message Id						Message Text
LibMsg <report player putting on>			"Metti [the % dobj] dentro [the second noun]."
LibMsg <report npc putting on>				"[The actor] mette [the % dobj] sopra [the second noun]."
LibMsg <cannot put something not held>			"Non puoi posizionare qualcosa che al momento ti manca."
LibMsg <cannot put something on it-self>			"Non puoi posizionare qualcosa al di sopra di essa stessa."
LibMsg <cannot put onto something not a supporter>	"Posizionare oggetti in quella maniera sarebbe di scarsa utilità."
LibMsg <cannot put onto something being carried>	"Ci vuole una grande destrezza per certe cose. Evidentemente qui siamo un pò a corto, no?"

[ See also:
  	LibMsg <cannot put if this exceeds carrying capacity>
	LibMsg <cannot put clothes being worn> ]

Section 2.25 - Give

Table of library messages (continued)
Message Id					Message Text
LibMsg <report player giving>		"Consegni [the % dobj] a [=> second noun][the $ dobj]."
LibMsg <report npc giving to player>	"[The actor] ti consegna [the % dobj]."
LibMsg <report npc giving to npc>		"[The actor] consegna [the % dobj] al [=> second noun][the $ dobj]."
LibMsg <cannot give what you have not got>	"Non puoi dare via qualcosa che non possiedi nemmeno."
LibMsg <cannot give to yourself>			"Ci fantastichi un pò sopra, ma in pochi secondi realizzi l[']inutilità del tuo gesto."
LibMsg <block giving>				"La tua offerta non suscita alcun interesse."
LibMsg <unable to receive things>		"[The %] [isn't|aren't] ricevere oggetti."

Section 2.26 - Show

Table of library messages (continued)
Message Id					Message Text
LibMsg <cannot show what you have not got>	"Non puoi mostrare qualcosa che non è nemmeno in tuo possesso."
LibMsg <block showing>				"Le tue azioni non suscitano il benchè minimo interesse."

Section 2.27 - Enter

To say appropriate action for enter verb:
   (-
       if (verb_word == 'alzarsi') print "ti alzi";
       else if (verb_word == 'sedere') print "siedi";
       else if (verb_word == 'giacere') print "giaci";
       else print "enter";
   -).

Table of library messages (continued)
Message Id						Message Text
LibMsg <report player entering>			"[if the main object is a supporter]Sali[otherwise]Entri[end if] [=> %][onto|into] [the % dobj]."
LibMsg <report npc entering>				"[The actor] [if the main object is a supporter]sale[otherwise]entra[end if] [=> %][onto|into] [the % dobj]."
LibMsg <cannot enter something already entered>	"Lo hai già fatto!"
LibMsg <cannot enter something not enterable>		"E perché mai dovresti voler fare un'acrobazia del genere?"
LibMsg <cannot enter closed containers>			"Dovresti aprire ciò che è chiuso prima di potervi entrare."
LibMsg <cannot enter something carried>		"Non ti è permesso l[']accesso a qualcosa già custodita da altri."

[ See also:
	LibMsg <implicitly pass outwards through other barriers>
	LibMsg <implicitly pass inwards through other barriers> ]

Section 2.28 - Exit, Get Off

To say appropriate action for exit verb:
   (-
       if (verb_word == 'scendi') print "Scendi";
       else if (verb_word == 'alzati') print "Ti alzi";
       else print "Esci";
   -).

To say appropriate action for exits verb:
   (-
       if (verb_word == 'scendi') print "scende";
       else if (verb_word == 'alzati') print "si alza";
       else print "esce";
   -).

Table of library messages (continued)
Message Id						Message Text
LibMsg <report player exiting>				"[=> %][Appropriate action for exit verb] [dap the main object]."
LibMsg <report npc exiting>				"[The actor] [appropriate action for exits verb] [=> %][dap the main object]."
LibMsg <cannot exit when not within anything>		"Non puoi uscire da qualcosa in cui non ti trovi"
LibMsg <cannot exit closed containers>			"L[']uscita è chiusa al momento."
LibMsg <cannot get off things>				"Ma non puoi [the % dobj][<space> at the moment]."
LibMsg <cannot exit thing not within>			"Ma non puoi [if the main object is a supporter]scendere [otherwise]uscire [end if] [=> %][dap] [the % dobj]."

Section 2.29 - Go

Table of library messages (continued)
Message Id						Message Text
LibMsg <cannot go that way>				"Non puoi andare da quella parte."
LibMsg <cannot travel in something not a vehicle>	"Dovrai prima [=> %][dap] [the % dobj]."
LibMsg <cannot go through concealed doors>		"Non puoi andare da quella parte. Una porta sbarrata ti impedisce il passaggio."
LibMsg <cannot go up through closed doors>		"Non ti è mai stato facile [']scalare['] una porta chiusa."
LibMsg <cannot go down through closed doors>		"Non ti è mai stato facile [']strisciare['] sotto una porta chiusa."
LibMsg <cannot go through closed doors>		"Niente da fare. Un accesso sbarrato ti impedisce il passaggio."
LibMsg <nothing through door>				"Non puoi, visto che [the %] non porta da alcuna parte."
LibMsg <block vaguely going>				"Il movimento è regolato da alcune precise direzioni da seguire.[/r]"
LibMsg <say npc goes>					"[The actor] va a [%]"
LibMsg <say npc arrives>					"[The actor] arriva [dap the main object]"
LibMsg <say npc arrives from unknown direction>		"[The actor] arriva."
LibMsg <say npc arrives at>				"[The actor] arriva [ap] [the %] [dap the secondary object]"
LibMsg <say npc goes through>				"[The actor] va attraverso [the %]"
LibMsg <say npc arrives from>				"[The actor] arriva da [%]"
LibMsg <say npc vehicle>					"[sup] [the %]"
LibMsg <say npc pushing in front with player>		", spingendo [the %] di fronte, e anche te"
LibMsg <say npc pushing in front>				", spingendo [the %] di fronte"
LibMsg <say npc pushing away>				", spingendo [the %] via"
LibMsg <say npc pushing in>				", spingendo [the %] dentro"
LibMsg <say npc taking player along>			", portandoti appresso"

To say from (dir - a direction):
    say "da ";
    if dir is down, say "sotto";
    if dir is up, say "sopra";
    if dir is not down and dir is not up, say "[dir]".

Section 2.30 - Brief, Super Brief, Verbose

Table of library messages (continued)
Message Id						Message Text
LibMsg <brief look mode>				" al momento è nella modalità 'brief' di stampa, che fornisce lunghe descrizioni dei luoghi mai visitati e altre più sintetiche per ogni altra eventualità."
LibMsg <superbrief look mode>				" è al momento nella modalità 'superbrief', che fornisce perennemente descrizioni brevi di ogni locazione (anche di quelle mai visitate)."
LibMsg <verbose look mode>				" è ora nella modalità 'verbose', che fornisce sempre descrizioni lunghe (anche di locazioni già visitate)."

Section 2.31 - Look

Table of library messages (continued)
Message Id				Message Text
LibMsg <report npc looking>	"[The actor] si guarda intorno."
LibMsg <top line what on>		" ([sup] [the % dobj])"
LibMsg <top line what in>		" ([sup] [the % dobj])"
LibMsg <top line what as>		" (come [inform 6 short name of %])"
LibMsg <say things within>		"Dentro [the main object] noti [what's inside % part 2]"
LibMsg <say things also within>		"[what's inside % part 1] anche [what's inside % part 2]"
LibMsg <say things on>			"Sopra [the main object] noti [what's on %]."

To say what's on %:
   list the contents of the main object, as a sentence,
     including contents, giving brief inventory information,
	tersely, not listing concealed items.

To say what's inside % part 1:
   if main object is the location, say "[You]";
   otherwise say "Dentro [the main object] [you]";
   say " [can]"

To say what's inside % part 2:
  list the contents of the main object, as a sentence,
     including contents, tersely, not listing concealed items;
   if the main object is the location, say " [here]";
   say "."

Section 2.32 - Examine

Table of library messages (continued)
Message Id					Message Text
LibMsg <report npc examining>		"[The actor] scruta attentamente [the % dobj]."
LibMsg <examine undescribed things>		"Non ci trovi niente di particolare."
LibMsg <examine direction>			"Non osservi nulla di insolito in quella direzione."
LibMsg <examine devices>			"[The %] al momento [if the main object is switched on][otherwise]non[end if] [is|are] acces[genderity]."

[ See also:
	LibMsg <examine in darkness> ]

Section 2.33 - Search

Table of library messages (continued)
Message Id						Message Text
LibMsg <report npc searching>			"[The actor] ricerca [the % dobj]."
LibMsg <cannot search unless container or supporter>	"Non ci trovi nulla di interessante."
LibMsg <cannot search closed opaque containers>	"Non puoi vedere all[']interno di contenitori chiusi."
LibMsg <nothing found within container>			"Non ci trovi nulla dentro."
LibMsg <nothing found on top of>			"Non si trova niente sopra [the % dobj]."

[ See also:
	LibMsg <search in darkness> ]

Instead of searching a thing (called the item):
	if the item is not undescribed and the item does not enclose the player:
		set pronouns from the item;
		if the item is a supporter:
			if a thing is on the item:
				repeat with possibility running through things on the item:
					now the possibility is marked for listing;
				increase the locale paragraph count by 1;
				say "Sopra [the item] vi ";
				list the contents of the item, as a sentence, tersely, not listing
				concealed items, prefacing with is/are, listing marked items only;
				say ".[paragraph break]";
		if the item is a container:
			if the container is closed:
				say "(prima apri [the item])[line break]";
				now the item is open;
			if a thing is in the item:
				repeat with possibility running through things in the item:
					now the possibility is marked for listing;
				increase the locale paragraph count by 1;
				say "Dentro [the item] vi ";
				list the contents of the item, as a sentence, tersely, not listing
				concealed items, prefacing with is/are, listing marked items only;
				say ".[paragraph break]".

	
Section 2.34 - Look Under

Table of library messages (continued)
Message Id						Message Text
LibMsg <report npc looking under>		"[The actor] guarda sotto [the % dobj]."
LibMsg <look under>					"Non ci trovi nulla di veramente interessante."

[ See also:
	LibMsg <look under in darkness> ]

Section 2.35 - Open

Table of library messages (continued)
Message Id						Message Text
LibMsg <report player opening>				"Apri [the % dobj]."
LibMsg <report npc opening>				"[The actor] apre [the % dobj]."
LibMsg <report unseen npc opening>			"[The %] apre."
LibMsg <cannot open unless openable>			"Non è qualcosa che si possa aprire."
LibMsg <cannot open something locked>			"Devi prima trovare una chiave o qualcos'altro, per sbloccare [the % dobj]."
LibMsg <cannot open something already open>		"Non puoi aprire qualcosa già aperta."
LibMsg <reveal any newly visible exterior initial text>	"Apri [the % dobj], rivelando "
LibMsg <no newly visible exterior>			"il nulla."

Section 2.36 - Close

Table of library messages (continued)
Message Id						Message Text
LibMsg <report player closing>				"Chiudi [the % dobj]."
LibMsg <report npc closing>				"[The actor] chiude [the % dobj]."
LibMsg <report unseen npc closing>			"[The %] chiude."
LibMsg <cannot close unless openable>			"Non si può chiudere qualcosa che non sia almeno apribile."
LibMsg <cannot close something already closed>		"Non puoi chiudere qualcosa già chiusa."

Section 2.37 - Lock

Table of library messages (continued)
Message Id						Message Text
LibMsg <report player locking>				"[You] blocchi [the % dobj]."
LibMsg <report npc locking>				"[The actor] blocca [the % dobj]."
LibMsg <cannot lock without a lock>			"Non ha l[']aria di essere qualcosa di bloccabile."
LibMsg <cannot lock something already locked>		"E['] già bloccat[genderity][<space> at the moment]."
LibMsg <cannot lock something open>			"Non puoi bloccare qualcosa che è ancora aperta."
LibMsg <cannot lock without the correct key>		"Non sembra essere la chiave giusta per la serratura."

Section 2.38 - Unlock

Table of library messages (continued)
Message Id						Message Text
LibMsg <report player unlocking>			"La serratura fa un piccolo scatto. Riesci a sbloccare [the % dobj]."
LibMsg <report npc unlocking>				"[The actor] sblocca [the % dobj]."
LibMsg <cannot unlock without a lock>			"Non puoi bloccare qualcosa che non contenga almeno una serratura."
LibMsg <cannot unlock something already unlocked>	"Non puoi sbloccare qualcosa che al momento è già sbloccata."
LibMsg <cannot unlock without the correct key>		"Non sembra essere la chiave giusta per la serratura."

Section 2.39 - Switch On

Table of library messages (continued)
Message Id						Message Text
LibMsg <report player switching on>			"Accendi [the % dobj]."
LibMsg <report npc switching on>			"[The actor] accende [the % dobj]."
LibMsg <cannot switch on unless switchable>		"Non ha l[']aria di un interruttore."
LibMsg <cannot switch on something already on>		"Non puoi accendere qualcosa che sia già accesa."

Section 2.40 - Switch Off

Table of library messages (continued)
Message Id						Message Text
LibMsg <report player switching off>			"Spegni [the % dobj]."
LibMsg <report npc switching off>				"[The actor] spegne [the % dobj]."
LibMsg <cannot switch off unless switchable>		"Non ha l[']aria di un interruttore."
LibMsg <cannot switch off something already off>		"Non puoi spegnere qualcosa che sia già spenta."

Section 2.41 - Wear

Table of library messages (continued)
Message Id					Message Text
LibMsg <report player wearing>		"Indossi [the % dobj]."
LibMsg <report npc wearing>			"[The actor] indossa [the % dobj]."
LibMsg <cannot wear something not clothing>	"Non avrai intenzione di indossare quella roba!"
LibMsg <cannot wear not holding>		"Non puoi indossare qualcosa che non sia in tuo possesso!"
LibMsg <cannot wear something already worn>	"Stai già indossando ciò che hai chiesto!"

Section 2.42 - Take Off

Table of library messages (continued)
Message Id					Message Text
LibMsg <report player taking off>		"Ti togli [the % dobj]."
LibMsg <report npc taking off>			"[The actor] si toglie di dosso [the % dobj]."
LibMsg <cannot take off something not worn>	"Come potresti toglierti di dosso qualcosa che non stai indossando?"

Section 2.43 - Eating And Drinking, Senses

Table of library messages (continued)
Message Id					Message Text
LibMsg <report player eating>			"Dai un paio di morsi decisi. Il sapore non è niente male."
LibMsg <report npc eating>			"[The actor] mangia [the % dobj]."
LibMsg <cannot eat unless edible>		"Puoi mangiare solo cose commestibili."
LibMsg <block drinking>				"Pare non ci sia niente da bere qui."
LibMsg <block tasting>				"Non noti nessun gusto particolare o esotico."
LibMsg <block smelling>				"Non odori alcun olezzo caratteristico."
LibMsg <block listening>				"Tendi per un attimo l[']orecchio ma non ascolti nulla di particolare."

Section 2.44 - Touching

To say keep your hands to yourself:
   say "Tieni le mani a posto. Non è il momento per andare a toccare di qua e di là!"

To say Keep:
   say "[=> player]";
   if lm_p2 and lm_sing, say "Tieni";
   otherwise say "Dovresti tenere a posto"

Table of library messages (continued)
Message Id					Message Text
LibMsg <report player touching things>		"Non senti al tatto nulla di particolare."
LibMsg <report npc touching things>		"[The actor] tocca [the % dobj]."
LibMsg <report player touching self>		"Insomma...pensi potrebbe essere di aiuto?"
LibMsg <report npc touching self>		"[The actor] si tocca."
LibMsg <report player touching other people>	"[Keep your hands to yourself]"
LibMsg <report npc touching other people>	"[The actor] tocca [the % dobj]."

Section 2.45 - Rhetorical Commands

Table of library messages (continued)
Message Id					Message Text
LibMsg <block saying yes>			"Ovviamente era una domanda retorica."
LibMsg <block saying no>			"Quella era una domanda retorica."
LibMsg <block saying sorry>			"Oh, non ti scusare."
LibMsg <block swearing obscenely>		"I veri avventurieri non utilizzano questo tipo di linguaggio."
LibMsg <block swearing mildly>			"Insomma..."

Section 2.46 - Body Movement

Table of library messages (continued)
Message Id					Message Text
LibMsg <block climbing>				"Le scalate non sono mai state il tuo forte."
LibMsg <block jumping>				"Salti in alto ma la tua elevazione lascia parecchio a desiderare."
LibMsg <block swinging>			"Non puoi fare una cosa del genere. Contieni la tua rabbia."
LibMsg <block waving hands>			"Agiti le mani in aria per pochi secondi. Poi il tuo raziocinio, o quel che ne rimane, ha la meglio."

Section 2.47 - Physical Interaction

Table of library messages (continued)
Message Id					Message Text
LibMsg <block attacking>			"La violenza non è la risposta giusta per risolvere questa situazione."
LibMsg <block burning>				"Non si dovrebbe scherzare con il fuoco con tanta leggerezza. Potrebbero esserci soluzioni migliori."
LibMsg <block cutting>				"Nemmeno un buon taglio risolverebbe qualcosa."
LibMsg <block rubbing>				"Si tratta di uno sforzo inutile."
LibMsg <block setting to>			"Niente da fare purtroppo."
LibMsg <block tying>				"Quante energie da sprecare..."
LibMsg <report player waving things>		"Metti in evidenza il tuo aspetto bambinesco agitando [the % dobj]."
LibMsg <report npc waving things>		"[The actor] ondeggia [the % dobj]."
LibMsg <cannot wave something not held>	"Non puoi agitare per aria qualcosa che non è nemmeno in tuo possesso."
LibMsg <squeezing people>			"[Keep your hands to yourself]."
LibMsg <report player squeezing>		"Un gesto poco cortese e galante."
LibMsg <report npc squeezing>			"[The actor] spreme [the % dobj]."
LibMsg <block throwing at>			"Non riesci a tenere i nervi saldi per simili sciocchezze."
LibMsg <throw at inanimate object>	"Futile."

Section 2.48 - Push, Pull, Turn

To say nothing obvious happens:
   say "Non avviene niente di utile."

To say it is fixed in place:
   say "Niente da fare, non si muove."

To say you are unable to:
   say "Non sei proprio in grado."

To say that would be less than courteous:
   say "Non sarebbe un gesto galante."

Table of library messages (continued)
Message Id					Message Text
LibMsg <report player pushing>			"[nothing obvious happens]"
LibMsg <report npc pushing>			"[The actor] spinge [the % dobj]."
LibMsg <report player pulling>			"[nothing obvious happens]"
LibMsg <report npc pulling>			"[The actor] tira [the % dobj]."
LibMsg <report player turning>			"[nothing obvious happens]"
LibMsg <report npc turning>			"[The actor] gira [the % dobj]."
LibMsg <block pushing in directions>		"Non si tratta di qualcosa che possa essere spinta di qua e di là."
LibMsg <not pushed in a direction>		"Quella non è una direzione."
LibMsg <pushed in illegal direction>		"Quella direzione sarebbe un vicolo cieco."
LibMsg <cannot push something fixed in place>	"[It is fixed in place]"
LibMsg <cannot pull something fixed in place>	"[It is fixed in place]"
LibMsg <cannot turn something fixed in place>	"[It is fixed in place]"
LibMsg <cannot push scenery>			"[You are unable to]"
LibMsg <cannot pull scenery>			"[You are unable to]"
LibMsg <cannot turn scenery>			"[You are unable to]"
LibMsg <cannot push people>			"[That would be less than courteous]"
LibMsg <cannot pull people>			"[That would be less than courteous]"
LibMsg <cannot turn people>			"[That would be less than courteous]"

Section 2.49 - Speech / Interpersonal Actions

Table of library messages (continued)
Message Id					Message Text
LibMsg <block answering>			"Niente. Nessuna risposta."
LibMsg <block asking>				"Silenzio. Nessuna risposta."
LibMsg <block buying>				"Ma non hai con te la tua fidata carta di credito!"
LibMsg <block kissing>				"Ti piacerebbe farlo? Presta più attenzione alla storia, per piacere."
LibMsg <block singing>				"Le tue doti canore ti guadagnarono l[']ultimo posto al torneo di canto dello scorso anno."
LibMsg <block telling>				"Nulla. Nessuna risposta."
LibMsg <telling yourself>			"Parli tra te e te. Solo per qualche minuto."

Section 2.50 - Mental Actions

Table of library messages (continued)
Message Id				Message Text
LibMsg <block thinking>			"Che fantastica idea..."
LibMsg <block player consulting>		"Non trovi nulla di interessante nel [the % dobj]."
LibMsg <block npc consulting>		"[The actor] guarda verso il [the % dobj]."

Section 2.51 - Sleep And Waiting

Table of library messages (continued)
Message Id				Message Text
LibMsg <block sleeping>			"Ultimamente soffri di insonnia."
LibMsg <block waking up>		"La verità è terribile. Questo non è un sogno."
LibMsg <block waking other>		"Potrebbe essere imbarazzante ed inutile."
LibMsg <report player waiting>		"Il tempo passa. E non aspetta."
LibMsg <report npc waiting>		"[The actor] attende in religioso silenzio."

Section 2.52 - List Miscellany

Table of library messages (continued)
Message Id				Message Text
LibMsg <providing light>			"(al momento acces[genderity])"

Part 2.53a - Regole Grammaticali

To say genderity:
if the curr_obj is singular-named, say "[if the main object is male]o[otherwise]a[end if]";
if the curr_obj is plural-named, say "[if the main object is male]i[otherwise]e[end if].".

To decide which number is the artflag of (sostan - a thing):
	if the character number 1 in the printed name of sostan is "a/A/e/E/i/I/o/O/u/U", decide on 0;
	if the character number 1 in the printed name of sostan is "z/Z/x/X", decide on 1;
	if the character number 1 in the printed name of sostan is "s/S":
		if the character number 2 in the printed name of sostan is "a/A/e/E/i/I/o/O/u/U", decide on 2;
		decide on 1;
	if the character number 1 in the printed name of sostan is "p/P":
		if the character number 2 in the printed name of sostan is "s", decide on 1;
	if the character number 1 in the printed name of sostan is "g/G":
		if the character number 2 in the printed name of sostan is "n", decide on 1;
	decide on 2.

To decide which number is the artflag of (sostan - a room):
	if the character number 1 in the printed name of sostan is "a/A/e/E/i/I/o/O/u/U", decide on 0;
	if the character number 1 in the printed name of sostan is "z/Z/x/X", decide on 1;
	if the character number 1 in the printed name of sostan is "s/S":
		if the character number 2 in the printed name of sostan is "a/A/e/E/i/I/o/O/u/U", decide on 2;
		decide on 1;
	if the character number 1 in the printed name of sostan is "p/P":
		if the character number 2 in the printed name of sostan is "s", decide on 1;
	if the character number 1 in the printed name of sostan is "g/G":
		if the character number 2 in the printed name of sostan is "n", decide on 1;
	decide on 2.

Articulated preposition is a kind of value. Some articulated prepositions are defined by the Table of Prepositions. 

Table of Prepositions
Name	Il	Lo	La	I	Gli	Le	L
dip	"del"	"dello"	"della"	"dei"	"degli"	"delle"	"dell[']"
ap	"al"	"allo"	"alla"	"ai"	"agli"	"alle"	"all[']"
dap	"dal"	"dallo"	"dalla"	"dai"	"dagli"	"dalle"	"dall[']"
inp	"nel"	"nello"	"nella"	"nei"	"negli"	"nelle"	"nell[']"
conp	"con il"	"con lo"	"con la"	"con i"	"con gli"	"con le"	"con l[']"
sup	"sul"	"sullo"	"sulla"	"sui"	"sugli"	"sulle"	"sull[']"
perp	"per il"	"per lo"	"per la"	"per i"	"per gli"	"per le"	"per l[']"
trap	"tra il"	"tra lo"	"tra la"	"tra i"	"tra gli"	"tra le"	"tra l[']"

To say (p - an articulated preposition) the (obj - a thing):
	if obj is female:
		say "[if obj is plural-named][Le of p] [otherwise if artflag of obj is 0][L of p][otherwise][La of P] [end if]";
	otherwise if artflag of obj is 2:
		say "[if obj is plural-named][I of p] [otherwise][il of p] [end if]";
	otherwise:
		say "[if obj is plural-named][Gli of p] [otherwise if artflag of obj is 0][L of p][otherwise if artflag of obj is 1][Lo of p] [end if]";
	say "[obj]".

To say off|out of (obj - a thing):
	if obj is a supporter, say "[dap the obj]";
	otherwise say "fuori [dap the obj]".

Part 2.53b - Accessi Diretti a Inform 6

Include (-
[ LanguageTimeOfDay hours mins i;
    i = hours%12;
    if (i == 0) i = 12;
    if (i < 10) print " ";
    print i, ":", mins/10, mins%10;
    if ((hours/12) > 0) print " pm"; else print " am";
];
-) instead of "Time" in "Language.i6t".

Include (-
[ LanguageVerb i;
    switch (i) {
      'i//','inv','inventory':
               print "take inventory";
      'g//':   print "look";
      'x//':   print "examine";
      'z//':   print "wait";
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


Part 2.53b - Numeri

To say (count - a number) in italian words:
	if count >= 1000 and count <= 10000:
		let n be count / 1000;
		repeat through the Table of Numeri:
			if n is the threshold entry:
				say "[if n > 1][italian entry]mila[otherwise if n is 1]mille[otherwise][end if]";
		let m be the remainder after dividing count by 1000;
		change count to m;
	if count >= 100 and count <= 999:
		let n be count / 100;
		repeat through the Table of Numeri:
			if n is the threshold entry:
				say "[if n > 1][italian entry]cento[otherwise if n is 1]cento[otherwise][end if]";
		let m be the remainder after dividing count by 100;
		change count to m;
	if count >= 0 and count <= 21:
		repeat through the Table of Numeri:
			if count is the threshold entry:
				say "[italian entry]";
				rule succeeds;	
	otherwise if count > 21 and count <= 29:
		decrease count by 20;
		repeat through the Table of Numeri:
	 		if count is the threshold entry:
				say "[if count  is 8]vent[italian entry][otherwise]venti[italian entry][end if]";
				rule succeeds;
	otherwise if count >= 30 and count < 40:
		decrease count by 30;
		repeat through the Table of Numeri:
	 		if count is the threshold entry:
				say "[if count is 0]trenta[otherwise if count is 1 or count is 8]trent[italian entry][otherwise]trenta[italian entry][end if]";
				rule succeeds;
	otherwise if count >= 40 and count < 50:
		decrease count by 40;
		repeat through the Table of Numeri:
	 		if count is the threshold entry:
				say "[if count is 0]quaranta[otherwise if count is 1 or count is 8]quarant[italian entry][otherwise]quaranta[italian entry][end if]";
				rule succeeds;
	otherwise if count >= 50 and count < 60:
		decrease count by 50;
		repeat through the Table of Numeri:
	 		if count is the threshold entry:
				say "[if count is 0]cinquanta[otherwise if count is 1 or count is 8]cinquant[italian entry][otherwise]cinquanta[italian entry][end if]";
				rule succeeds;
	otherwise if count >= 60 and count < 70:
		decrease count by 60;
		repeat through the Table of Numeri:
	 		if count is the threshold entry:
				say "[if count is 0]sessanta[otherwise if count is 1 or count is 8]sessant[italian entry][otherwise]sessanta[italian entry][end if]";
				rule succeeds;
	otherwise if count >= 70 and count < 80:
		decrease count by 70;
		repeat through the Table of Numeri:
	 		if count is the threshold entry:
				say "[if count is 0]settanta[otherwise if count is 1 or count is 8]settant[italian entry][otherwise]settanta[italian entry][end if]";
				rule succeeds;
	otherwise if count >= 80 and count < 90:
		decrease count by 80;
		repeat through the Table of Numeri:
	 		if count is the threshold entry:
				say "[if count is 0]ottanta[otherwise if count is 1 or count is 8]ottant[italian entry][otherwise]ottanta[italian entry][end if]";
				rule succeeds;
	otherwise if count >= 90 and count < 100:
		decrease count by 90;
		repeat through the Table of Numeri:
	 		if count is the threshold entry:
				say "[if count is 0]novanta[otherwise if count is 1 or count is 8]novant[italian entry][otherwise]novanta[italian entry][end if]";
				rule succeeds.
	
Table of Numeri
threshold	italian
0		"zero"
1		"uno"
2		"due"
3		"tre"
4		"quattro"
5		"cinque"
6		"sei"
7		"sette"
8		"otto"
9		"nove"
10		"dieci"
11		"undici"
12		"dodici"
13		"tredici"
14		"quattordici"
15		"quindici"
16		"sedici"
17		"diciassette"
18		"diciotto"
19		"diciannove"
20		"venti"
21		"ventuno"

Part 2.53b - Data

To say (orario - a time) in italian words:
let h be the hours part of orario;
let m be the minutes part of orario;
say "[h in italian words][if m is 0] in punto[otherwise] e [m in italian words][end if]".

To say (orario - a time) in italian complete words:
let h be the hours part of orario;
let m be the minutes part of orario;
if m is 0, say "[h in italian words] in punto";
if m > 0 and m <= 30, say "[h in italian words] e [if m is 15]un quarto[otherwise if m is 30]e mezzo[otherwise][m in italian words][end if]";
if m > 30 and m < 60 , say "[h in italian words] meno [if m is 45]un quarto[otherwise][60 - m in italian words][end if]".


Part 3 - Implementation

Section 3.1 - Kinds - unindexed

[ upper and lower case ]

Letter case is a kind of value.
The letter cases are lower-case and upper-case.

Section 3.2 - The current object - unindexed

curr_obj is an object that varies.
curr_obj_inform6_value is an object that varies.

[ The current tense, number, person and gender for curr_obj;
  if curr_obj = the player, these are equal to the library message values,
  otherwise curr_obj_number is third person and the number and gender are
  determined by the object. ]

temporary_tense is a tense that varies.
use_temporary_tense is a truth state that varies.
use_temporary_tense is false.
curr_obj_number is a grammatical number that varies.
curr_obj_person is a grammatical person that varies.
curr_obj_gender is a gender that varies.

[ the subject of the sentence, initially assumed to be the actor ]

curr_subject is an object that varies.

[ change the current object ]

To set the current object to (x_ - an object) / (dbg_msg - text):
   if the main object is nothing, change the main object to the noun;
   if x_ is_nothing, change curr_obj to main object;	[ make sure it is always valid ]
   otherwise change curr_obj to x_;
   if curr_obj is_nothing, change curr_obj to the player; [last resort]
   if library_message_debug is on begin;
      say "{[dbg_msg]:obj=";
      if curr_obj is the player, say "player"; [infinite recursion if prints player!]
      otherwise say "[curr_obj]";
      say "}";
   end if;
   if curr_obj is the player or curr_obj is_nothing, use the player's GNP;
   otherwise use the object's GNP.

To use the player's GNP:
   change curr_obj_person to the library message person;
   change curr_obj_number to the library message grammatical number;
   change curr_obj_gender to the library message gender.

To use the object's GNP:
   change curr_obj_person to third person;
   if curr_obj acts plural, change curr_obj_number to plural;
   otherwise change curr_obj_number to singular;
   change curr_obj_gender to the gender of curr_obj.

To decide which gender is the gender of (x_ - an object):
   if x_ acts feminine, decide on gender feminine;
   if x_ acts neuter, decide on gender neuter;
   decide on gender masculine.

To decide whether (x_ - an object) is_nothing:
   (- {x_} == nothing -).

This is the get the curr_obj from Inform 6 rule:
   set the current object to curr_obj_inform6_value / "I6".

To say current object is (x_ - an object):
   set the current object to x_ / "say curr obj".

To make sure main object is set / (dbg_msg - text):
   if main object is nothing, change main object to the noun;
   set the current object to the main object / dbg_msg.

[ called from Inform 6 ]

This is the internal make main object the current object rule:
  set the current object to the main object / "internal".

Include (-
[ set_curr_obj x;
  (+curr_obj_inform6_value+) = x;
  (+get the curr_obj from Inform 6 rule+)();   ! notify Inform 7 about the change
];
-)

Section 3.3 - "Say object" rules

To say => present tense:
   change temporary_tense to present tense;
   change use_temporary_tense to true.

To say => past tense:
   change temporary_tense to past tense;
   change use_temporary_tense to true.

To say => default tense:
   change temporary_tense to the library message tense;
   change use_temporary_tense to false.

To say => %:
   set the current object to the main object / "=>%".

To say => actor:
   set the current object to the person asked / "=>actor".

[ same as saying "[current object is ...]" ]

To say => (obj_ - an object):
   set the current object to obj_ / "=>".

To say % => (obj_ - an object):
   change the main object to obj_;
   set the current object to the main object / "%=>".

To say %:
   make sure main object is set / "%";
   if the main object is the player, say "[you]";
   otherwise say "[main object]".

To say the %:
   make sure main object is set / "the %";
   if the main object is the player, say "[you]";
   otherwise say "[the main object]".

To say The %:
   make sure main object is set / "The %";
   if the main object is the player, say "[You]";
   otherwise say "[The main object]";
   change curr_subject to the main object.

To say the % dobj:
   make sure main object is set / "the % dobj";
   if the main object is the player, say "[you|yourself]";
   otherwise say "[the main object]".

To say % dobj:
   make sure main object is set / "% dobj";
   if the main object is the player, say "[you|yourself]";
   otherwise say "[main object]".

To say inform 6 short name of %:
   make sure main object is set / "I6 %";
   if the main object is the player, say "[you]";
   otherwise say "[main object]".   [ probably wrong; Inform 6 uses print_obj to print this ]

To say The $:
   if curr_obj is the player, say "[You]";
   otherwise say "[The curr_obj]";
   change curr_subject to curr_obj.

To say the $:
   if curr_obj is the player, say "[you]";
   otherwise say "[the curr_obj]".

To say $:
   if curr_obj is the player, say "[you]";
   otherwise say "[curr_obj]".

To say $ dobj:
   if curr_obj is the player, say "[you|yourself]";
   otherwise say "[curr_obj]".

To say the $ dobj:
   if curr_obj is the player, say "[you|yourself]";
   otherwise say "[the curr_obj]".

To say The actor:
   say "[=> actor][The $]".
To say the actor:
   say "[=> actor][the $]".

Section 3.5 - Genere

A thing can be female.

Section 3.4 - Decision rules - unindexed

[ The following rule was taken from Emily Short's "Plurality" extension ]

To decide whether (x_ - an object) acts plural:
   if x_ is plural-named, decide yes;
   otherwise decide no.

To decide whether (x_ - an object) does not act plural:
   if x_ acts plural, decide no;
   otherwise decide yes.

To decide whether (x_ - an object) acts feminine: 
   if x_ is female, decide yes;
   otherwise decide no.

To decide whether (x_ - an object) acts neuter: 
   (- {x_} has neuter || ({x_} hasnt animate && {x_} hasnt female) -).

To decide whether lm_present:
	if use_temporary_tense is true:
   		if temporary_tense is present tense, decide yes;
		decide no;
	otherwise:
   		if library message tense is present tense, decide yes;
		decide no;

To decide whether lm_past:
	if use_temporary_tense is true:
		if temporary_tense is past tense, decide yes;
		decide no;
	otherwise:
		if library message tense is past tense, decide yes;
		decide no.

To decide whether lm_plu:
   if curr_obj_number is plural, decide yes;
   otherwise decide no.
To decide whether lm_sing:
   if curr_obj_number is singular, decide yes;
   otherwise decide no.

To decide whether lm_p1:
   if curr_obj_person is first person, decide yes;
   otherwise decide no.
To decide whether lm_p2:
   if curr_obj_person is second person, decide yes;
   otherwise decide no.
To decide whether lm_p3:
   if curr_obj_person is third person, decide yes;
   otherwise decide no.

To decide whether lm_masc:
   if curr_obj_gender is gender masculine, decide yes;
   otherwise decide no.
To decide whether lm_not_masc:
   if curr_obj_gender is gender masculine, decide no;
   otherwise decide yes.
To decide whether lm_fem:
   if curr_obj_gender is gender feminine, decide yes;
   otherwise decide no.
To decide whether lm_neut:
   if curr_obj_gender is gender neuter, decide yes;
   otherwise decide no.

Section 3.5 - Grammatical tables

Table of 'you' forms 
Gramm Person	Gramm Number	Case	Word
first person	singular		upper-case 	"Io"
second person	singular		upper-case	"Tu"
third person	singular		upper-case	"Egli"
first person	plural		upper-case	"Noi"
second person	plural		upper-case	"Voi"
third person	plural		upper-case	"Essi"
first person	singular		lower-case 	"io"
second person	singular		lower-case	"tu"
third person	singular		lower-case	"egli"
first person	plural		lower-case	"noi"
second person	plural		lower-case	"voi"
third person	plural		lower-case	"essi"

Table of 'you' dobj forms
Gramm Person	Gramm Number	Word
first person	singular		"me"
second person	singular		"te"
third person	singular		"lui"
first person	plural		"essi"
second person	plural		"essi"
third person	plural		"essi"

Table of 'your' forms
Gramm Person	Gramm Number	Case	Word
first person	singular		upper-case 	"Mio"
second person	singular		upper-case	"Tuo"
third person	singular		upper-case	"Suo"
first person	plural		upper-case	"Nostro"
second person	plural		upper-case	"Vostro"
third person	plural		upper-case	"Loro"
first person	singular		lower-case 	"mio"
second person	singular		lower-case	"tuo"
third person	singular		lower-case	"suo"
first person	plural		lower-case	"nostro"
second person	plural		lower-case	"vostro"
third person	plural		lower-case	"loro"

Table of 'yourself' forms
Gramm Person	Gramm Number	Case	Word
first person	singular		upper-case 	"Me stesso"
second person	singular		upper-case	"Te stesso"
third person	singular		upper-case	"Egli stesso"
first person	plural		upper-case	"Noi stessi"
second person	plural		upper-case	"Voi stessi"
third person	plural		upper-case	"Loro stessi"
first person	singular		lower-case 	"me stesso"
second person	singular		lower-case	"te stesso"
third person	singular		lower-case	"egli stesso"
first person	plural		lower-case	"voi stessi"
second person	plural		lower-case	"noi stessi"
third person	plural		lower-case	"loro stessi"

Table of 'he' forms
Gender			Gramm Number	Case	Word
gender masculine	singular		upper-case	"Egli"
gender feminine		singular		upper-case	"Ella"
gender neuter		singular		upper-case	"Esso"
gender masculine	plural		upper-case	"Essi"
gender feminine		plural		upper-case	"Essi"
gender neuter		plural		upper-case	"Essi"
gender masculine	singular		lower-case	"egli"
gender feminine		singular		lower-case	"ella"
gender neuter		singular		lower-case	"esso"
gender masculine	plural		lower-case	"essi"
gender feminine		plural		lower-case	"essi"
gender neuter		plural		lower-case	"essi"

Table of 'his' forms
Gender			Gramm Number	Case	Word
gender masculine	singular		upper-case	"Suo"
gender feminine		singular		upper-case	"Suo"
gender neuter		singular		upper-case	"Suo"
gender masculine	plural		upper-case	"Loro"
gender feminine		plural		upper-case	"Loro"
gender neuter		plural		upper-case	"Loro"
gender masculine	singular		lower-case	"suo"
gender feminine		singular		lower-case	"suo"
gender neuter		singular		lower-case	"suo"
gender masculine	plural		lower-case	"loro"
gender feminine		plural		lower-case	"loro"
gender neuter		plural		lower-case	"loro"

Table of 'him' forms
Gender				Gramm Number	Case	Word
gender masculine	singular		upper-case	"Lui"
gender feminine		singular		upper-case	"Lei"
gender neuter		singular		upper-case	"Esso"
gender masculine	plural		upper-case	"Essi"
gender feminine		plural		upper-case	"Essi"
gender neuter		plural		upper-case	"Essi"
gender masculine	singular		lower-case	"lui"
gender feminine		singular		lower-case	"lei"
gender neuter		singular		lower-case	"esso"
gender masculine	plural		lower-case	"essi"
gender feminine		plural		lower-case	"essi"
gender neuter		plural		lower-case	"essi"

Table of 'himself' forms
Gender				Gramm Number	Case	Word
gender masculine	singular		upper-case	"Lui stesso"
gender feminine		singular		upper-case	"Lei stessa"
gender neuter		singular		upper-case	"Esso stesso"
gender masculine	plural		upper-case	"Essi stessi"
gender feminine		plural		upper-case	"Essi stessi"
gender neuter		plural		upper-case	"Essi stessi"
gender masculine	singular		lower-case	"lui stesso"
gender feminine		singular		lower-case	"lei stessa"
gender neuter		singular		lower-case	"essa stessa"
gender masculine	plural		lower-case	"essi stessi"
gender feminine		plural		lower-case	"essi stessi"
gender neuter		plural		lower-case	"essi stessi"

Table of 'you're' endings
Gramm Person	Gramm Number	Word
first person	singular	"[apostrophe]m"	
second person	singular	"[apostrophe]re"	
third person	singular	"[apostrophe]s"
first person	plural		"[apostrophe]re"
second person	plural		"[apostrophe]re"
third person	plural		"[apostrophe]re"

Table of 'you've' endings
Gramm Person	Gramm Number	Word
first person	singular		"[apostrophe]ve"
second person	singular		"[apostrophe]ve"
third person	singular		"[apostrophe]s"
first person	plural			"[apostrophe]ve"
second person	plural			"[apostrophe]ve"
third person	plural			"[apostrophe]ve"

Table of 'are' forms
Gramm Person	Gramm Number	Case	Word	Negative
first person	singular		upper-case 	"Sono"	"Non sono"
second person	singular		upper-case	"Sei"	"Non sei"
third person	singular		upper-case	"E[']"	"Non è"
first person	plural		upper-case	"Siamo"	"Non siamo"
second person	plural		upper-case	"Siete"	"Non siete"
third person	plural		upper-case	"Sono"	"Non sono"
first person	singular		lower-case 	"sono"	"non sono"
second person	singular		lower-case	"sei"	"non sei"
third person	singular		lower-case	"è"	"non è"
first person	plural		lower-case	"siamo"	"non siamo"
second person	plural		lower-case	"siete"	"non siete"
third person	plural		lower-case	"sono"	"non sono"

Table of 'were' forms
Gramm Person	Gramm Number	Case	Word	Negative
first person	singular		upper-case 	"Ero"	"Non ero"
second person	singular		upper-case	"Eri"	"Non eri"
third person	singular		upper-case	"Era"	"Non era"
first person	plural		upper-case	"Eravamo"	"Non eravamo"
second person	plural		upper-case	"Eravate"	"Non eravate"
third person	plural		upper-case	"Erano"	"Non erano"
first person	singular		lower-case 	"ero"	"non ero"
second person	singular		lower-case	"eri"	"non eri"
third person	singular		lower-case	"era"	"non era"
first person	plural		lower-case	"eravamo"	"non eravamo"
second person	plural		lower-case	"eravate"	"non eravate"
third person	plural		lower-case	"erano"	"non erano"

Table of 'have' forms
Gramm Person	Gramm Number	Case	Word	Negative
first person	singular		upper-case 	"Ho"	"Non ho"
second person	singular		upper-case	"Hai"	"Non hai"
third person	singular		upper-case	"Ha"	"Non ha"
first person	plural		upper-case	"Abbiamo"	"Non abbiamo"
second person	plural		upper-case	"Avete"	"Non avete"
third person	plural		upper-case	"Hanno"	"Non hanno"
first person	singular		lower-case 	"ho"	"non ho"
second person	singular		lower-case	"hai"	"non hai"
third person	singular		lower-case	"ha"	"non ha"
first person	plural		lower-case	"abbiamo"	"non abbiamo"
second person	plural		lower-case	"avete"	"non avete"
third person	plural		lower-case	"hanno"	"non hanno"

[ This table is for the verb "have", not the auxiliary eg. "have eaten" ]

Table of 'had' forms
Gramm Person	Gramm Number	Case	Word	Negative
first person	singular		upper-case 	"Avevo"		"Non avevo"
second person	singular		upper-case	"Avevi"		"Non avevi"
third person	singular		upper-case	"Aveva"		"Non aveva"
first person	plural		upper-case	"Avevamo"	"Non avevamo"
second person	plural		upper-case	"Avevate"	"Non avevate"
third person	plural		upper-case	"Avevano"	"Non avevano"
first person	singular		lower-case 	"avevo"		"non avevo"
second person	singular		lower-case	"avevi"		"non avevi"
third person	singular		lower-case	"aveva"		"non aveva"
first person	plural		lower-case	"avevamo"	"non avevamo"
second person	plural		lower-case	"avevate"	"non avevate"
third person	plural		lower-case	"avevano"	"non avevano"

Table of 'can' forms
Gramm Person	Gramm Number	Case	Word	Negative
first person	singular		upper-case 	"Posso"		"Non posso"
second person	singular		upper-case	"Puoi"		"Non puoi"
third person	singular		upper-case	"Può"		"Non può"
first person	plural		upper-case	"Possiamo"	"Non possiamo"
second person	plural		upper-case	"Potete"	"Non potete"
third person	plural		upper-case	"Possono"	"Non possono"
first person	singular		lower-case 	"posso"		"non posso"
second person	singular		lower-case	"puoi"		"non puoi"
third person	singular		lower-case	"può"		"non può"
first person	plural		lower-case	"possiamo"	"non possiamo"
second person	plural		lower-case	"potete"	"non potete"
third person	plural		lower-case	"possono"	"non possono"

Table of 'could' forms
Gramm Person	Gramm Number	Case	Word	Negative
first person	singular		upper-case 	"Potevo"	"Non potevo"
second person	singular		upper-case	"Potevi"		"Non potevi"
third person	singular		upper-case	"Poteva"	"Non poteva"
first person	plural		upper-case	"Potevamo"	"Non potevamo"
second person	plural		upper-case	"Potevate"	"Non potevate"
third person	plural		upper-case	"Potevano"	"Non potevano"
first person	singular		lower-case 	"potevo"	"non potevo"
second person	singular		lower-case	"potevi"		"non potevi"
third person	singular		lower-case	"poteva"	"non poteva"
first person	plural		lower-case	"potevano"	"non potevano"
second person	plural		lower-case	"potevate"	"non potevate"
third person	plural		lower-case	"potevano"	"non potevano"

Section 3.6 - Table operations - unindexed

[ get the "Word" entry from a grammatical table ]

To find (c_ - letter case) & (p_ - grammatical person) & (n_ - grammatical number)
  in (t_ - table-name):
  let r_ be 1;
  let num_ be the number of rows in t_;
  while r_ <= num_ begin;
     choose row r_ in t_;
     if Case entry is c_ and
	    Gramm Person entry is p_ and
	    Gramm Number entry is n_
	 begin;
	    say Word entry;
	    change r_ to num_ + 1;	[ to force the loop to end ]
	 otherwise;
	    change r_ to r_ + 1;
     end if;
  end while.

[ get the "Negative" entry from a grammatical table ]

To find negative (c_ - letter case) & (p_ - grammatical person) & (n_ - grammatical number)
  in (t_ - table-name):
  let r_ be 1;
  let num_ be the number of rows in t_;
  while r_ <= num_ begin;
     choose row r_ in t_;
     if Case entry is c_ and
	    Gramm Person entry is p_ and
	    Gramm Number entry is n_
	 begin;
	    say Negative entry;
	    change r_ to num_ + 1;	[ to force the loop to end ]
	 otherwise;
	    change r_ to r_ + 1;
     end if;
  end while.

[ for tables with gender instead of person, eg. 'he' ]

To find (c_ - letter case) & (g_ - gender) & (n_ - grammatical number)
  in (t_ - table-name):
  let r_ be 1;
  let num_ be the number of rows in t_;
  while r_ <= num_ begin;
     choose row r_ in t_;
     if Case entry is c_ and
	    Gender entry is g_ and
	    Gramm Number entry is n_
	 begin;
	    say Word entry;
	    change r_ to num_ + 1;	[ to force the loop to end ]
	 otherwise;
	    change r_ to r_ + 1;
     end if;
  end while.

[ for tables without "Case" columns ]

To find (p_ - grammatical person) & (n_ - grammatical number)
  in (t_ - table-name):
  let r_ be 1;
  let num_ be the number of rows in t_;
  while r_ <= num_ begin;
     choose row r_ in t_;
     if Gramm Person entry is p_ and
	    Gramm Number entry is n_
	 begin;
	    say Word entry;
	    change r_ to num_ + 1;	[ to force the loop to end ]
	 otherwise;
	    change r_ to r_ + 1;
     end if;
  end while.

Section 3.7 - "Say word" rules

To say (the_case - letter case) 'you':
   set the current object to the player / "'you'";
   if lm_p3 and lm_sing and libmsg_3ps_changed is 0, say the_case 'he';
   otherwise find the_case & curr_obj_person & curr_obj_number
     in the table of 'you' forms.

To say (the_case - letter case) 'your':
   set the current object to the player / "'your'";
   if lm_p3 and lm_sing, say the_case 'his';
   otherwise find the_case & curr_obj_person & curr_obj_number
     in the table of 'your' forms.

To say (the_case - letter case) 'you're':
   say the_case 'you';
   if lm_past, say " [are]";    [ will become "you were", etc ]
   otherwise find curr_obj_person & curr_obj_number
     in the table of 'you're' endings.

To say (the_case - letter case) 'you've' auxiliary:
   say the_case 'you';
   find curr_obj_person & curr_obj_number
     in the table of 'you've' endings.

To say (the_case - letter case) 'yourself':
   set the current object to the player / "'yourself'";
   if lm_p3 and lm_sing, find the_case & curr_obj_gender & curr_obj_number
     in the table of 'himself' forms;
   otherwise find the_case & curr_obj_person & curr_obj_number
     in the table of 'yourself' forms.

To say (the_case - letter case) 'himself':
   set the current object to main object / "'himself'";
   find the_case & curr_obj_gender & curr_obj_number
     in the table of 'himself' forms.

[ "you" as the direct object (always lower case), eg. "He saw you" ]

To say you dobj:
   set the current object to the player / "you dobj";
   if lm_p3 and lm_sing and libmsg_3ps_changed is 0, say "[him]";
   otherwise find curr_obj_person & curr_obj_number
     in the table of 'you' dobj forms.

To say you|yourself:
   if curr_subject is the player,    [ if the player is doing the action ]
      say "[yourself]";
   otherwise say you dobj.

To say (the_case - letter case) 'he':
   find the_case & curr_obj_gender & curr_obj_number
     in the table of 'he' forms.

To say (the_case - letter case) 'his':
   find the_case & curr_obj_gender & curr_obj_number
     in the table of 'his' forms.

To say (the_case - letter case) 'him':
   find the_case & curr_obj_gender & curr_obj_number
     in the table of 'him' forms.

To find (the_case - letter case) verb in (t_present - table-name) / (t_past - table-name):
   if lm_present, find the_case & curr_obj_person & curr_obj_number
     in t_present;
   otherwise find the_case & curr_obj_person & curr_obj_number
     in t_past.

To find (the_case - letter case) negative in (t_present - table-name) / (t_past - table-name):
   if lm_present, find negative the_case & curr_obj_person & curr_obj_number
     in t_present;
   otherwise find negative the_case & curr_obj_person & curr_obj_number
     in t_past.

To say (the_case - letter case) 'are' for (obj_ - object):
   set the current object to obj_ / "'are'";
   find the_case verb in the table of 'are' forms /
     the table of 'were' forms.

To say (the_case - letter case) 'aren't' for (obj_ - object):
   set the current object to obj_ / "'aren't'";
   find the_case negative in the table of 'are' forms /
     the table of 'were' forms.

To say (the_case - letter case) 'have' for (obj_ - object):
   set the current object to obj_ / "'have'";
   find the_case verb in the table of 'have' forms /
     the table of 'had' forms.

To say (the_case - letter case) 'haven't' for (obj_ - object):
   set the current object to obj_ / "'haven't'";
   find the_case negative in the table of 'have' forms /
     the table of 'had' forms.

To say (the_case - letter case) 'can':
   find the_case verb in the table of 'can' forms /
       the table of 'could' forms.

To say (the_case - letter case) 'can't':
   find the_case negative in the table of 'can' forms /
       the table of 'could' forms.

To say (the_case - letter case) 'have' auxiliary for (obj_ - object):
   set the current object to obj_ / "'have' aux";
   find the_case & curr_obj_person & curr_obj_number
     in the table of 'have' forms.

To say (the_case - letter case) 'haven't' auxiliary for (obj_ - object):
   set the current object to obj_ / "'haven't' aux";
   find negative the_case & curr_obj_person & curr_obj_number
     in the table of 'have' forms.

To say You: say upper-case 'you'; change curr_subject to the player.
To say Your: say upper-case 'your'.
To say You're: say upper-case 'you're'.
To say You've+: say upper-case 'you've' auxiliary.
To say Yourself: say upper-case 'yourself'.
To say He: say upper-case 'he'; change curr_subject to curr_obj.
To say His: say upper-case 'his'.
To say Him: say upper-case 'him'.
To say Himself: say upper-case 'himself'.

To say you: say lower-case 'you'; change curr_subject to the player.
To say your: say lower-case 'your'.
To say you're: say lower-case 'you're'.
To say you've+: say lower-case 'you've' auxiliary.
To say yourself: say lower-case 'yourself'.
[ To say you dobj: defined above ]
[ To say you|yourself: defined above ]
To say he: say lower-case 'he'; change curr_subject to curr_obj.
To say his: say lower-case 'his'.
To say him: say lower-case 'him'.
To say himself: say lower-case 'himself'.

[ 'do', 'are' and 'have' assume the player is the subject; if some other
  thing is the subject, use 'do|does' / 'is|are' / 'has|have' instead ]

To say Are: say upper-case 'are' for the player; change curr_subject to the player.
To say Aren't: say upper-case 'aren't' for the player; change curr_subject to the player.
To say Have: say upper-case 'have' for the player; change curr_subject to the player.
To say Haven't: say upper-case 'haven't' for the player; change curr_subject to the player.
To say Have+: say upper-case 'have' auxiliary for the player; change curr_subject to the player.
To say Haven't+: say upper-case 'haven't' auxiliary for the player; change curr_subject to the player.

To say are: say lower-case 'are' for the player.
To say aren't: say lower-case 'aren't' for the player.
To say have: say lower-case 'have' for the player.
To say haven't: say lower-case 'haven't' for the player.
To say have+: say lower-case 'have' auxiliary for the player.
To say haven't+: say lower-case 'haven't' auxiliary for the player.

To say Can: say upper-case 'can'.
To say Can't: say upper-case 'can't'.
To say can: say lower-case 'can'.
To say can't: say lower-case 'can't'.

To say It's: say "[/r]"; follow the upper-case 'it's' rule.
To say it's: say "[/r]";  follow the lower-case 'it's' rule.
To say There's: say "[/r]";  follow the upper-case 'there's' rule.
To say there's: say "[/r]";  follow the lower-case 'there's' rule.
To say comes|came: say "[/r]";  follow the lower-case 'comes' rule.

[ here/there, for contexts like "A dog is here" or "A dog was there" ]
To say here: say "[if lm_past]t[end if]qui".

This is the upper-case 'it's' rule:
   say "[if lm_present]E['][otherwise]Era".
This is the lower-case 'it's' rule:
   say "[if lm_present]è[otherwise]era".
This is the upper-case 'there's' rule:
   say "[if lm_present]C[']è[otherwise]C[']era".
This is the lower-case 'there's' rule:
   say "[if lm_present]c[']è[otherwise]c[']era".
This is the lower-case 'comes' rule:
   say "[if lm_present]viene[otherwise]veniva".

To say Is|Are: say upper-case 'are' for curr_obj; change curr_subject to curr_obj.
To say Has|Have: say upper-case 'have' for curr_obj; change curr_subject to curr_obj.
To say Isn't|Aren't: say upper-case 'aren't' for curr_obj; change curr_subject to curr_obj.
To say Hasn't|Haven't: say upper-case 'haven't' for curr_obj; change curr_subject to curr_obj.

To say is|are: say lower-case 'are' for curr_obj.
To say has|have: say lower-case 'have' for curr_obj.
To say isn't|aren't: say lower-case 'aren't' for curr_obj.
To say hasn't|haven't: say lower-case 'haven't' for curr_obj.

To say Is|Was:
   if lm_present, find upper-case & third person & singular in the table of 'are' forms;
   otherwise find upper-case & third person & singular in the table of 'were' forms.
To say Isn't|Wasn't:
   if lm_present, find negative upper-case & third person & singular in the table of 'are' forms;
   otherwise find negative upper-case & third person & singular in the table of 'were' forms.
To say is|was:
   if lm_present, find lower-case & third person & singular in the table of 'are' forms;
   otherwise find lower-case & third person & singular in the table of 'were' forms.
To say isn't|wasn't:
   if lm_present, find negative lower-case & third person & singular in the table of 'are' forms;
   otherwise find negative lower-case & third person & singular in the table of 'were' forms.

To print (word1_ - text) for singular or (word2_ - text) for plural:
   if curr_obj is the player, say "[if lm_p3 and lm_sing][word1_][otherwise][word2_]";
   otherwise say "[if curr_obj acts plural][word2_][otherwise][word1_]".

To say It|They:
   print "Esso" for singular or "Essi" for plural; change curr_subject to curr_obj.
To say It|Those:
   print "Esso" for singular or "Quelli" for plural; change curr_subject to curr_obj.
To say That|Those:
   print "Quello" for singular or "Quelli" for plural; change curr_subject to curr_obj.
To say That|They:
   print "Quello" for singular or "Essi" for plural; change curr_subject to curr_obj.
To say That's|They're:
   print "Quello è" for singular or "Essi sono" for plural; change curr_subject to curr_obj.

[ for the following group of "say" rules, assume main object is being referred to ]

To say it|they:
   set the current object to main object / "it|they";
   print "esso" for singular or "essi" for plural. 
To say it|them:
   set the current object to main object / "it|them";
   print "quello" for singular or "loro" for plural.
To say it|those:
   set the current object to main object / "it|those";
   print "quello" for singular or "quelli" for plural. 
To say that|those:
   set the current object to main object / "that|those";
   print "quello" for singular or "quelli" for plural.

To say is|are for (n_ - a number):
    if n_ is 1, say "è";
    otherwise say "sono".

To say off|out of:
  if curr_obj is a supporter, say "giù";
  otherwise say "fuori".
To say onto|into:
  if curr_obj is a supporter, say "sopra";
  otherwise say "dentro".
To say on|in:
  if curr_obj is a supporter, say "sopra";
  otherwise say "dentro".
To say On|In:
  if curr_obj is a supporter, say "Sopra";
  otherwise say "Dentro".

Section 3.10 - "Say symbol" rules

To say dot:
   say "[unicode 46]".
To say ExMark:
   say "[unicode 33]".
To say QMark:
   say "[unicode 63]".

Section 3.11 - Miscellaneous "say" rules

To say /n: say "[line break][run paragraph on]".
To say /p: say paragraph break.
To say /r: say run paragraph on.

To say the player's holdall:
   (- print (the) SACK_OBJECT; set_curr_obj(SACK_OBJECT); -)

To say story name:
   (- print (string) Story; -).

To say pronoun word:
   (- print (address) pronoun_word; -).

To say the last command:
    (- PrintCommand(); -).

Section 3.12 - Miscellaneous decision rules

To decide if game over:
   (- deadflag -).

To decide whether noun is living:
   (- noun has animate -).

To decide whether noun is doing the action:
   (- noun == actor -).

To decide whether noun is not doing the action:
   (- noun ~= actor -).

To decide whether player is doing the action:
   (- actor == player -).

To decide whether player is not doing the action:
   (- actor ~= player -).

[
To decide whether player can see the actor:
   (- I7_CanSee(player, actor) -).
]

To decide whether there are multiple objects:
   (- multiflag == 1 -).

To decide whether there are not multiple objects:
   (- multiflag ~= 1 -).

[ perform a binary search to quickly find the message id in the
  table of library messages (assumes the table has been sorted) ]

This is the print library message rule:
   change libmsg-was-empty to 1;
   let n1 be 1;
   let n2 be the number of rows in the table of library messages;
   while n1 <= n2 begin;
      let mid be n1 plus n2;
	  change mid to mid divided by 2;
	  choose row mid in the table of library messages;
	  if the message id entry is library-message-id begin;
	     if the message text entry is not "" begin;
		    say the message text entry;
			change libmsg-was-empty to 0;
	     end if;
		 change n1 to n2 + 1;	[ to force the loop to stop ]
	  end if;
	  if the message id entry < library-message-id, change n1 to mid plus 1;
      if the message id entry > library-message-id, change n2 to mid minus 1;
   end while.

libmsg-was-empty is a number that varies.

Part 4 - Inform 6 interface - unindexed

To init library messages:
(- InitLibraryMessages(); -)

[
  The following I6 code (in InitLibraryMessages) does not compile under
  Glulx (it says "Illegal backpatch marker in forward-declared symbol").
  To make a long story short ... the original PushDir problem seems
  to have gone away, but I am still suspicious, so I'll leave it in
  when compiling to Z code.
]

Include (-
  Constant LibraryMessages = (+I7_LibraryMessages+);

[ InitLibraryMessages n;

#Ifndef TARGET_GLULX;
  if ((+I7_LibraryMessages+).&before)
  {
      ! get rid of any other "before" routines
      for (n = 0 : n < (+I7_LibraryMessages+).#before / WORDSIZE : n++)
      {
          if ((+I7_LibraryMessages+).&before --> n ~= LibraryMessagesBefore)
              (+I7_LibraryMessages+).&before --> n = nothing;
      }
  }
#Endif; ! TARGET_GLULX
];
-) after "Definitions.i6t".

I7_LibraryMessages is a thing.
Include (-
  with before LibraryMessagesBefore,
-) when defining I7_LibraryMessages.

Include (-
[ LibraryMessagesBefore id temp isImplicitAction after_text;
    (+the numeric amount+) = lm_o;
    (+main object+) = lm_o;
    (+secondary object+) = lm_o2;
    (+curr_subject+) = actor;

    if (actor ~= player) { set_curr_obj(actor); }
    else if (lm_o > 0) { set_curr_obj(lm_o); }
    else { set_curr_obj(player); }

    id = -1;
    isImplicitAction = 0;
    after_text = "^";
-)

[ Note that there is no "Prompt:" section, since Inform 7 handles
  the prompt specially; see "Changing the command prompt" in the I7 manual ]

[*** Miscellany ***]

Include (-
Miscellany:
    switch (lm_n) {
       1: id = (+LibMsg <first N objects>+); after_text = "";
       2: id = (+LibMsg <zero multiple objects>+);
       3: id = (+LibMsg <you have died>+); after_text = "";
       4: id = (+LibMsg <you have won>+); after_text = "";
     ! 5 is "Would you like to restart ...", handled specially by Inform 7
       6: id = (+LibMsg <undo not provided>+);
       7: id = (+LibMsg <undo failed>+);
       8: id = (+LibMsg <restrict answer>+); after_text = "";
       9: id = (+LibMsg <entering darkness>+);
       10: id = (+LibMsg <empty line>+);
       11: id = (+LibMsg <cannot undo nothing>+);
       12: id = (+LibMsg <cannot undo twice in a row>+);
       13: id = (+LibMsg <undo succeeded>+);
       14: id = (+LibMsg <oops failed>+);
       15: id = (+LibMsg <oops no arguments>+);
       16: id = (+LibMsg <oops too many arguments>+);
       17: id = (+LibMsg <dark description>+);
       18: id = (+LibMsg <player self description>+); after_text = "";
     ! 19 was LibMsg <player description>, "As good-looking as ever"
	 ! - use "The description of the player is ..." instead.
       20: id = (+LibMsg <again usage>+);
       21: id = (+LibMsg <cannot do again>+);
       22: id = (+LibMsg <cannot begin at comma>+);
       23: id = (+LibMsg <cannot talk to absent person>+);
       24: id = (+LibMsg <cannot talk to inanimate object>+);
       25: id = (+LibMsg <extra words before comma>+);
       26: id = (+LibMsg <report implicit take>+);
       27: id = (+LibMsg <command not understood>+);
       28: id = (+LibMsg <command partly understood>+); after_text = "";
       29: id = (+LibMsg <number not understood>+);
       30: id = (+LibMsg <unknown object>+);
-)

Include (-
       31: id = (+LibMsg <command incomplete>+);
       32: id = (+LibMsg <object not held>+);
       33: id = (+LibMsg <verb cannot have multiple objects>+);
       34: id = (+LibMsg <too many multiple objects>+);
       35: id = (+LibMsg <pronoun not set>+);
       36: id = (+LibMsg <excepted object not included anyway>+);
       37: id = (+LibMsg <verb cannot have inanimate object>+);
       38: id = (+LibMsg <unknown verb>+);
       39: id = (+LibMsg <unimportant object>+);
       40: (+main object+) = pronoun_obj;
	 (+internal make main object the current object rule+)();
	 id = (+LibMsg <pronoun absent>+);
       41: id = (+LibMsg <command badly ended>+);
       42: id = (+LibMsg <not that many available>+);
       43: id = (+LibMsg <zero multiple objects>+); ! same as Miscellany #2 (?)
       44: id = (+LibMsg <no objects available>+);
       45: id = (+LibMsg <who disambiguation>+); after_text = "";
       46: id = (+LibMsg <which disambiguation>+); after_text = "";
       47: id = (+LibMsg <single object disambiguation>+);
       48: (+main object+) = actor;
	 (+internal make main object the current object rule+)();
	 id = (+LibMsg <whom disambiguation>+);
       49: (+main object+) = actor;
	 (+internal make main object the current object rule+)();
	 id = (+LibMsg <what disambiguation>+);
       50: id = (+LibMsg <score changed>+); after_text = "";
       51: id = (+LibMsg <command cut short>+);
       52: id = (+LibMsg <menu prompt>+); after_text = "";
       53: id = (+LibMsg <page prompt>+); after_text = "";
       54: id = (+LibMsg <comment recorded>+);
       55: id = (+LibMsg <comment not recorded>+);
     ! 56 = ".^"
     ! 57 = "?^"
       58: id = (+LibMsg <npc unable to do that>+);
       59: id = (+LibMsg <noun needed>+);
       60: id = (+LibMsg <noun not needed>+);
       61: id = (+LibMsg <object needed>+);
       62: id = (+LibMsg <object not needed>+);
       63: id = (+LibMsg <second object needed>+);
       64: id = (+LibMsg <second object not needed>+);
       65: id = (+LibMsg <second noun needed>+);
       66: id = (+LibMsg <second noun not needed>+);
       67: id = (+LibMsg <something more substantial needed>+);
       68: id = (+LibMsg <report npc implicit take>+);
       69: id = (+LibMsg <report implicit take>+);
       70: id = (+LibMsg <undo forbidden>+);
       71: id = (+LibMsg <dark room name>+);
       72: id = (+LibMsg <person ignores command>+);
            default: jump not_handled; }
    jump handled;
-)

[ The ListMiscellany rules ("providing light", etc) can be handled OK by Inform 7 ]

[*** Quit, Restart ***]

Include (-
Quit:
    switch (lm_n) {
       1: id = (+LibMsg <yes or no prompt>+); after_text = "";
       2: id = (+LibMsg <confirm Quit>+); after_text = "";
       default: jump not_handled; }
    jump handled;

Restart:
    switch (lm_n) {
       1: id = (+LibMsg <confirm Restart>+); after_text = "";
       2: id = (+LibMsg <Restart failed>+);
       default: jump not_handled; }
    jump handled;
-)

[*** File Operations ***]

Include (-

Restore:
    switch (lm_n) {
       1: id = (+LibMsg <Restore failed>+);
       2: id = (+LibMsg <Restore succeeded>+);
       default: jump not_handled; }
    jump handled;

Save:
    switch (lm_n) {
       1: id = (+LibMsg <Save failed>+);
       2: id = (+LibMsg <Save succeeded>+);
       default: jump not_handled; }
    jump handled;

Verify:
    switch (lm_n) {
       1: id = (+LibMsg <Verify succeeded>+);
       2: id = (+LibMsg <Verify failed>+);
       default: jump not_handled; }
    jump handled;
-)

[*** Transcripts ***]

Include (-
ScriptOn:
    switch (lm_n) {
       1: id = (+LibMsg <transcript already on>+);
       2: id = (+LibMsg <start of transcript>+); after_text = "";
       3: id = (+LibMsg <transcript failed>+);
       default: jump not_handled; }
    jump handled;

ScriptOff:
    switch (lm_n) {
       1: id = (+LibMsg <transcript already off>+);
       2: id = (+LibMsg <end of transcript>+);
       3: id = (+LibMsg <end transcript failed>+);
       default: jump not_handled; }
    jump handled;
-)

[*** Scoring ***]

Include (-
NotifyOn:
     id = (+LibMsg <score notification turned on>+);
     jump handled;

NotifyOff:
     id = (+LibMsg <score notification turned off>+);
     jump handled;

Score:
    switch (lm_n) {
       1: id = (+LibMsg <Score command>+); after_text = "";
       2: id = (+LibMsg <no scoring>+);
       3: id = (+LibMsg <score rank>+); after_text = "";
       default: jump not_handled; }
     jump handled;
-)

[*** Listing ***]

Include (-
Pronouns:
    switch (lm_n) {
       1: id = (+LibMsg <Pronouns initial text>+); after_text = "";
       2: id = (+LibMsg <Pronouns -means- text>+); after_text = " ";
       3: id = (+LibMsg <Pronouns -unset- text>+); after_text = "";
       4: id = (+LibMsg <no pronouns known>+);
       default: jump not_handled; }
    jump handled;

Inv:
    switch (lm_n) {
       1: id = (+LibMsg <Inventory no possessions>+);
       2: id = (+LibMsg <Inventory initial text>+); after_text = "";
     ! 3 is ":^" (used for list style NEWLINE_BIT)
     ! 4 is ".^" (used for list style ENGLISH_BIT)
       5: id = (+LibMsg <report npc taking inventory>+);
       default: jump not_handled; }
    jump handled;
-)

[*** Take, Remove ***]

Include (-
Take:
    switch (lm_n) {
       1: id = (+LibMsg <report player taking>+);
       2: id = (+LibMsg <cannot take yourself>+);
       3: id = (+LibMsg <cannot take other people>+);
       4: id = (+LibMsg <cannot take something you are within>+);
       5: id = (+LibMsg <cannot take something already taken>+);
       6: id = (+LibMsg <cannot take possessions of others>+);
       7: id = (+LibMsg <cannot take component parts>+);
       8: id = (+LibMsg <cannot take hidden parts>+);
       9: id = (+LibMsg <cannot reach within closed containers>+);
       10: id = (+LibMsg <cannot take scenery>+);
       11: id = (+LibMsg <cannot take something fixed>+);
       12: id = (+LibMsg <cannot exceed carrying capacity>+);
       13: id = (+LibMsg <use holdall to avoid exceeding carrying capacity>+);
             isImplicitAction = 1;
       14: id = (+LibMsg <cannot reach within other places>+);
     ! 15 doesn't seem to be produced anywhere ("You cannot carry ...")
       16: id = (+LibMsg <report npc taking>+);
       default: jump not_handled; }
    jump handled;

Remove:
    switch (lm_n)
    {  1: id = (+LibMsg <cannot remove from closed containers>+);
       2: id = (+LibMsg <cannot remove something not within>+);
       3: id = (+LibMsg <report player removing>+); ! TODO - not printed any more? ("Taken" instead)
      ! TODO (maybe): need 4 = LibMsg <report npc removing>
       default: jump not_handled; }
    jump handled;
-)

[*** Drop, Insert, Put ***]

Include (-
Drop:
    switch (lm_n) {
       1: id = (+LibMsg <cannot drop something already dropped>+);
       2: id = (+LibMsg <cannot drop not holding>+);
       3: id = (+LibMsg <cannot drop clothes being worn>+);
           isImplicitAction = 1;
       4: id = (+LibMsg <report player dropping>+);
       5,6: id = (+LibMsg <cannot drop if this exceeds carrying capacity>+);   ! 5 = supporter, 6 = container
       7: id = (+LibMsg <report npc dropping>+);
       default: jump not_handled; }
    jump handled;

Insert:
    switch (lm_n) {
       1: id = (+LibMsg <cannot insert something not held>+);
       2: id = (+LibMsg <cannot insert into something not a container>+);
       3: id = (+LibMsg <cannot insert into closed containers>+);
       4: id = (+LibMsg <need to take off before inserting>+);   ! (unused ?)
       5: id = (+LibMsg <cannot insert something into itself>+);
       6: id = (+LibMsg <cannot insert clothes being worn>+);
           isImplicitAction = 1;
       7: id = (+LibMsg <cannot insert if this exceeds carrying capacity>+);
       8,9: id = (+LibMsg <report player inserting>+);  ! 8 is for multiple objects
       10: id = (+LibMsg <report npc inserting>+);
       default: jump not_handled; }
    jump handled;

PutOn:
    switch (lm_n) {
       1: id = (+LibMsg <cannot put something not held>+);
       2: id = (+LibMsg <cannot put something on it-self>+);
       3: id = (+LibMsg <cannot put onto something not a supporter>+);
       4: id = (+LibMsg <cannot put onto something being carried>+);
       5: id = (+LibMsg <cannot put clothes being worn>+);
           isImplicitAction = 1;
       6: id = (+LibMsg <cannot put if this exceeds carrying capacity>+);
       7,8: id = (+LibMsg <report player putting on>+);  ! 7 is for multiple objects
       9: id = (+LibMsg <report npc putting on>+);
       default: jump not_handled; }
    jump handled;
-)

[*** Give, Show ***]

Include (-
Give:
    switch (lm_n) {
       1: id = (+LibMsg <cannot give what you have not got>+);
       2: id = (+LibMsg <cannot give to yourself>+);
       3: id = (+LibMsg <block giving>+);
       4: id = (+LibMsg <unable to receive things>+);
       5: id = (+LibMsg <report player giving>+);
       6: id = (+LibMsg <report npc giving to player>+);  
       7: id = (+LibMsg <report npc giving to npc>+);
      default: jump not_handled; }
    jump handled;

Show:
    switch (lm_n) {
       1: id = (+LibMsg <cannot show what you have not got>+);
       2: id = (+LibMsg <block showing>+);
       default: jump not_handled; }
    jump handled;
-)

[*** Enter, Exit, GetOff ***]

Include (-
Enter:
    switch (lm_n) {
       1: id = (+LibMsg <cannot enter something already entered>+);
       2: id = (+LibMsg <cannot enter something not enterable>+);
       3: id = (+LibMsg <cannot enter closed containers>+);
       4: id = (+LibMsg <cannot enter something carried>+);
       5: id = (+LibMsg <report player entering>+);
       6: id = (+LibMsg <implicitly pass outwards through other barriers>+);
          isImplicitAction = 1;
       7: id = (+LibMsg <implicitly pass inwards through other barriers>+);
           isImplicitAction = 1;
       8,9: id = (+LibMsg <report npc entering>+);  ! 8 = container, 9 = supporter
       default: jump not_handled; }
    jump handled;

Exit:
    switch (lm_n) {
       1: id = (+LibMsg <cannot exit when not within anything>+);
       2: id = (+LibMsg <cannot exit closed containers>+);
       3: id = (+LibMsg <report player exiting>+);
       4: id = (+LibMsg <cannot exit thing not within>+);
       5,6: id = (+LibMsg <report npc exiting>+);
       default: jump not_handled; }
    jump handled;

GetOff:
    id = (+LibMsg <cannot get off things>+);
    jump handled;
-)

[*** Go ***]

Include (-
Go:
    switch (lm_n) {
       1: id = (+LibMsg <cannot travel in something not a vehicle>+);
       2: id = (+LibMsg <cannot go that way>+);
          (+main object+) = noun;   ! the direction
       3: id = (+LibMsg <cannot go up through closed doors>+);
       4: id = (+LibMsg <cannot go down through closed doors>+);
       5: id = (+LibMsg <cannot go through closed doors>+);
       6: id = (+LibMsg <nothing through door>+);
       7: id = (+LibMsg <block vaguely going>+);
       8: id = (+LibMsg <say npc goes>+);
          (+main object+) = (+ up +);
       9: id = (+LibMsg <say npc goes>+);
          (+main object+) = (+ down +);
       10: id = (+LibMsg <say npc goes>+);
       11: id = (+LibMsg <say npc arrives>+);
          (+main object+) = (+ up +);
       12:  id = (+LibMsg <say npc arrives>+);
          (+main object+) = (+ down +);
       13:  id = (+LibMsg <say npc arrives>+);
       14: id = (+LibMsg <say npc arrives from unknown direction>+);
       15: id = (+LibMsg <say npc arrives at>+);
          (+secondary object+) = (+ up +);
       16: id = (+LibMsg <say npc arrives at>+);
          (+secondary object+) = (+ down +);
       17: id = (+LibMsg <say npc arrives at>+);
          ! secondary object already defined
       18: id = (+LibMsg <say npc goes through>+);
       19: id = (+LibMsg <say npc arrives from>+);
       20,21: id = (+LibMsg <say npc vehicle>+);
       22: id = (+LibMsg <say npc pushing in front with player>+);
       23: id = (+LibMsg <say npc pushing in front>+);
       24: id = (+LibMsg <say npc pushing away>+);
       25: id = (+LibMsg <say npc pushing in>+);
       26: id = (+LibMsg <say npc taking player along>+);
       default: jump not_handled; }
    if (lm_n >= 8) { after_text = ""; }   ! sentence fragment
    jump handled;
-)

[*** Verbosity Level ***]

Include (-
LMode1:
    id = (+LibMsg <brief look mode>+);
    jump handled;

LMode2:
    id = (+LibMsg <verbose look mode>+);
    jump handled;

LMode3:
    id = (+LibMsg <superbrief look mode>+);
    jump handled;
-)

[*** Look ***]

Include (-
Look:
    after_text = "";
    switch (lm_n) {
       1: id = (+LibMsg <top line what on>+);
       2: id = (+LibMsg <top line what in>+);
       3: id = (+LibMsg <top line what as>+);
       4: id = (+LibMsg <say things on>+);
       5: id = (+LibMsg <say things also within>+);
       6: id = (+LibMsg <say things within>+);
       7: id = (+LibMsg <examine direction>+);
       8: if (lm_o has supporter) id = (+LibMsg <top line what on>+);
          else id = (+LibMsg <top line what in>+);
       9: id = (+LibMsg <report npc looking>+);
       default: jump not_handled; }
    jump handled;
-)

[*** Examine, Search, LookUnder ***]

Include (-
Examine:
    switch (lm_n) {
       1: id = (+LibMsg <examine while dark>+);
       2: id = (+LibMsg <examine undescribed things>+);
       3: id = (+LibMsg <examine devices>+);
       4: id = (+LibMsg <report npc examining>+);
       5: id = (+LibMsg <examine direction>+);
       default: jump not_handled; }
    jump handled;

Search:
    switch (lm_n) {
       1: id = (+LibMsg <search while dark>+);
       2: id = (+LibMsg <nothing found on top of>+);
     ! 3 prints what is on a supporter; use I6 default behaviour
       4: id = (+LibMsg <cannot search unless container or supporter>+);
       5: id = (+LibMsg <cannot search closed opaque containers>+);
       6: id = (+LibMsg <nothing found within container>+);
       7: id = (+LibMsg <say things within>+);
       8: id = (+LibMsg <report npc searching>+);
       default: jump not_handled; }
    jump handled;

LookUnder:
   switch (lm_n) {
       1: id = (+LibMsg <look under while dark>+);
       2: id = (+LibMsg <look under>+);
       3: id = (+LibMsg <report npc looking under>+);
       default: jump not_handled; }
    jump handled;
-)

[*** Open, Close, Lock, Unlock ***]

Include (-
Open:
    switch (lm_n) {
       1: id = (+LibMsg <cannot open unless openable>+);
       2: id = (+LibMsg <cannot open something locked>+);
       3: id = (+LibMsg <cannot open something already open>+);
       4: id = -2; ! reveal any newly visible exterior
       5: id = (+LibMsg <report player opening>+);
       6: id = (+LibMsg <report npc opening>+);
       7: id = (+LibMsg <report unseen npc opening>+);
       default: jump not_handled; }
    jump handled;

Close:
    switch (lm_n) {
       1: id = (+LibMsg <cannot close unless openable>+);
       2: id = (+LibMsg <cannot close something already closed>+);
       3: id = (+LibMsg <report player closing>+);
       4: id = (+LibMsg <report npc closing>+);
       5: id = (+LibMsg <report unseen npc closing>+);
       default: jump not_handled; }
    jump handled;

Lock:
    switch (lm_n) {
       1: id = (+LibMsg <cannot lock without a lock>+);
       2: id = (+LibMsg <cannot lock something already locked>+);
       3: id = (+LibMsg <cannot lock something open>+);
       4: id = (+LibMsg <cannot lock without the correct key>+);
       5: id = (+LibMsg <report player locking>+);
       6: id = (+LibMsg <report npc locking>+);
       default: jump not_handled; }
    jump handled;

Unlock:
    switch (lm_n) {
       1: id = (+LibMsg <cannot unlock without a lock>+);
       2: id = (+LibMsg <cannot unlock something already unlocked>+);
       3: id = (+LibMsg <cannot unlock without the correct key>+);
       4: id = (+LibMsg <report player unlocking>+);
       5: id = (+LibMsg <report npc unlocking>+);
       default: jump not_handled; }
    jump handled;
-)

[*** Switch On / Off ***]

Include (-
SwitchOn:
    switch (lm_n) {
       1: id = (+LibMsg <cannot switch on unless switchable>+);
       2: id = (+LibMsg <cannot switch on something already on>+);
       3: id = (+LibMsg <report player switching on>+);
       4: id = (+LibMsg <report npc switching on>+);
       default: jump not_handled; }
    jump handled;

SwitchOff:
    switch (lm_n) {
       1: id = (+LibMsg <cannot switch off unless switchable>+);
       2: id = (+LibMsg <cannot switch off something already off>+);
       3: id = (+LibMsg <report player switching off>+);
       4: id = (+LibMsg <report npc switching off>+);
       default: jump not_handled; }
    jump handled;
-)

[*** Wear, Disrobe ***]

Include (-
Wear:
    switch (lm_n) {
       1: id = (+LibMsg <cannot wear something not clothing>+);
       2: id = (+LibMsg <cannot wear not holding>+);
       3: id = (+LibMsg <cannot wear something already worn>+);
       4: id = (+LibMsg <report player wearing>+);
       5: id = (+LibMsg <report npc wearing>+);
       default: jump not_handled; }
    jump handled;

Disrobe:
    switch (lm_n) {
       1: id = (+LibMsg <cannot take off something not worn>+);
       2: id = (+LibMsg <report player taking off>+);
       3: id = (+LibMsg <report npc taking off>+);
       default: jump not_handled; }
    jump handled;
-)

[*** Eating, Drinking, Senses ***]

Include (-
Eat:
    switch (lm_n) {
       1: id = (+LibMsg <cannot eat unless edible>+);
       2: id = (+LibMsg <report player eating>+);
       3: id = (+LibMsg <report npc eating>+);
       default: jump not_handled; }
    jump handled;
Drink:
    id = (+LibMsg <block drinking>+);
    jump handled;
Taste:
    id = (+LibMsg <block tasting>+);
    jump handled;
Smell:
    id = (+LibMsg <block smelling>+);
    jump handled;
Listen:
    id = (+LibMsg <block listening>+);
    jump handled;
Touch:
    switch (lm_n) {
       1: id = (+LibMsg <report player touching other people>+);
       2: id = (+LibMsg <report player touching things>+);
       3: id = (+LibMsg <report player touching self>+);
       4: id = (+LibMsg <report npc touching self>+);
	   ! 5 is for touching the player, 6 is for another NPC
       5,6: id = (+LibMsg <report npc touching other people>+);
       default: jump not_handled; }
    jump handled;
-)

[*** Rhetorical Commands ***]

Include (-
Yes:
    id = (+LibMsg <block saying yes>+);
    jump handled;
No:
    id = (+LibMsg <block saying no>+);
    jump handled;
Sorry:
    id = (+LibMsg <block saying sorry>+);
    jump handled;
Strong:
    id = (+LibMsg <block swearing obscenely>+);
    jump handled;
Mild:
    id = (+LibMsg <block swearing mildly>+);
    jump handled;
-)

[*** Body Movement  ***]

Include (-
Climb:
    id = (+LibMsg <block climbing>+);
    jump handled;
Jump:
    id = (+LibMsg <block jumping>+);
    jump handled;
Swing:
    id = (+LibMsg <block swinging>+);
    jump handled;
WaveHands:
    id = (+LibMsg <block waving hands>+);
    jump handled;
-)

[*** Physical Interaction ***]

Include (-
Attack:
    id = (+LibMsg <block attacking>+);
    jump handled;
Burn:
    id = (+LibMsg <block burning>+);
    jump handled;
Cut:
    id = (+LibMsg <block cutting>+);
    jump handled;
Rub:
    id = (+LibMsg <block rubbing>+);
    jump handled;
SetTo:
    id = (+LibMsg <block setting to>+);
    jump handled;
Tie:
    id = (+LibMsg <block tying>+);
    jump handled;

Wave:
    switch (lm_n) {
       1: id = (+LibMsg <cannot wave something not held>+);
       2: id = (+LibMsg <report player waving things>+);
       3: id = (+LibMsg <report npc waving things>+);
       default: jump not_handled; }
    jump handled;

Squeeze:
    switch (lm_n) {
       1: id = (+LibMsg <squeezing people>+);
       2: id = (+LibMsg <report player squeezing>+);
       3: id = (+LibMsg <report npc squeezing>+);
       default: jump not_handled; }
    jump handled;

ThrowAt:
    switch (lm_n) {
       1: id = (+LibMsg <throw at inanimate object>+);
       2: id = (+LibMsg <block throwing at>+);
       default: jump not_handled; }
    jump handled;
-)

[*** Push, Pull, Turn ***]

Include (-
Push:
    switch (lm_n) {
       1: id = (+LibMsg <cannot push something fixed in place>+);
       2: id = (+LibMsg <cannot push scenery>+);
       3: id = (+LibMsg <report player pushing>+);
       4: id = (+LibMsg <cannot push people>+);
     ! 5 does not apply to Push
       6:  id = (+LibMsg <report npc pushing>+);
       default: jump not_handled; }
    jump handled;

PushDir:
    switch (lm_n) {
       1: id = (+LibMsg <block pushing in directions>+);
       2: id = (+LibMsg <not pushed in a direction>+);
       3: id = (+LibMsg <pushed in illegal direction>+);
       default: jump not_handled; }
    jump handled;

Pull:
    switch (lm_n) {
       1: id = (+LibMsg <cannot pull something fixed in place>+);
       2: id = (+LibMsg <cannot pull scenery>+);
       3: id = (+LibMsg <report player pulling>+);
       4: id = (+LibMsg <cannot pull people>+);
       5: id = (+LibMsg <report npc pulling>+);
       default: jump not_handled; }
    jump handled;

Turn:
    switch (lm_n) {
       1: id = (+LibMsg <cannot turn something fixed in place>+);
       2: id = (+LibMsg <cannot turn scenery>+);
       3: id = (+LibMsg <report player turning>+);
       4: id = (+LibMsg <cannot turn people>+);
     ! 5,6 do not apply to Turn
       7: id = (+LibMsg <report npc turning>+);
       default: jump not_handled; }
    jump handled;
-)

[*** Speech / Interpersonal Actions ***]

Include (-
Answer:
    id = (+LibMsg <block answering>+);
    jump handled;
Ask:
    id = (+LibMsg <block asking>+);
    jump handled;
Buy:
    id = (+LibMsg <block buying>+);
    jump handled;
Kiss:
    id = (+LibMsg <block kissing>+);
    jump handled;
Sing:
    id = (+LibMsg <block singing>+);
    jump handled;
Tell:
    switch (lm_n) {
       1: id = (+LibMsg <telling yourself>+);
       2: id = (+LibMsg <block telling>+);
       default: jump not_handled; }
    jump handled;
-)

[*** Mental Actions ***]

Include (-
Think:
    id = (+LibMsg <block thinking>+);
    jump handled;
Consult:
    switch (lm_n) {
       1: id = (+LibMsg <block player consulting>+);
       2: id = (+LibMsg <block npc consulting>+);
    default: jump not_handled; }
    jump handled;
-)

[*** Sleep And Waiting ***]

Include (-
Sleep:
    id = (+LibMsg <block sleeping>+);
    jump handled;
Wait:
    switch (lm_n) {
       1: id = (+LibMsg <report player waiting>+);
       2: id = (+LibMsg <report npc waiting>+);
    default: jump not_handled; }
    jump handled;
Wake:
    id = (+LibMsg <block waking up>+);
    jump handled;
WakeOther:
    id = (+LibMsg <block waking other>+);
    jump handled;
-)

Include (-
default:
.not_handled;
    (+main object+) = nothing;
    rfalse;
.handled;
	if (id == -2)  {
        (+custom_internal_i6 reveal any newly visible exterior rule+)();
    }
    else {
		(+library-message-id+) = id;

        if ( (+before library messages rule+)() == 0)
        {
            (+print library message rule+)();

            if (isImplicitAction)
			{ say__p = 0; }

            if (after_text ~= nothing && (+libmsg-was-empty+) == 0)
			{ print (string) after_text; }

            (+after library messages rule+)();
        }
    }

    (+main object+) = nothing;
    rtrue;
];
-)


Part 5 - Rule handling - unindexed

Section 5.1 - Reporting rules - unindexed

To display (id_ - a library message id):
   display_part_1 for id_;
   follow the after library messages rule;
   display_part_2.

To display (id_ - a library message id) without 'after library messages':
   display_part_1 for id_;
   display_part_2.

To display_part_1 for (id_ - a library message id):
   change curr_subject to the person asked;	[ "actor" in Inform 6 ]
   change main object to the noun;
   set the current object to the main object / "set up";
   change library-message-id to id_;
   abide by the before library messages rule;
   follow the print library message rule.

To display_part_2:
   set_to_nothing main object;
   if libmsg-was-empty is 0 begin;
      if library-message-id is not LibMsg <reveal any newly visible exterior initial text>,
         say "[if there are not multiple objects][/n]";
   end if.

To set_to_nothing (x_ - an object):
   (- {x_} = nothing; -).

Section 5.2 - Internal rules - unindexed


[ the following rule is called from the i6 code ]

This is the custom_internal_i6 reveal any newly visible exterior rule:
   display LibMsg <reveal any newly visible exterior initial text> without 'after library messages';
   if there is no newly visible exterior begin;
       follow the after library messages rule;
       display LibMsg <no newly visible exterior>;
   otherwise;
       say ".[/r]";
       follow the after library messages rule;
       say "[/n]";
   end if.

[ need to test the return value of WriteListFrom(); not sure how to do this in Inform 7 ]

To decide whether there is no newly visible exterior:
   (- WriteListFrom(child(lm_o), ENGLISH_BIT+TERSE_BIT+CONCEAL_BIT) == 0 -).

[ Special handling for "go" without a direction ]

The block vaguely going rule is not listed in the for supplying a missing noun rules.

Rule for supplying a missing noun while going:
   display LibMsg <block vaguely going>;
   say " ".		[ if this isn't here, it says "You must supply a noun" ! ]

Instead of examining a closed container (called the item): 
	make sure main object is set / "% dobj";
     	say "[The item] attualmente [is|are] chius[genderity]."

Section 5.3 - Locale description - unindexed

[ The following code was supplied by Emily Short ]

The you can see more rule is listed instead of the you-can-also-see rule in the for printing the locale description rules. 

For printing the locale description (this is the you can see more rule): 
	let the domain be the parameter-object; 
	let the mentionable count be 0; 
	repeat with item running through things: 
		now the item is not marked for listing; 
	repeat through the Table of Locale Priorities: 
		[say "[notable-object entry] - [locale description priority 
entry].";] 
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
					if the domain is the location, say "Qui "; 
					otherwise say "Qui "; 
				otherwise if the domain is a supporter: 
					say "Sopra [the domain] [you] "; 
				otherwise: 
					say "Dentro [the domain] [you] "; 
				say "puoi [if the locale paragraph count is greater than 0]anche [end if]vedere "; 
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
					list the contents of the common holder, as a sentence, including contents, giving brief inventory information, tersely, not listing concealed items, listing marked items only; 
				otherwise say "[a list of marked for listing things including contents]"; 
				if the domain is the location, say ""; 
				say ".[paragraph break]"; 
				unfilter list recursion; 
			end the listing nondescript items activity with the domain; 
	continue the activity. 

Section 5.5a - Banner Iniziale

Rule for printing the banner text: say "-- [bold type][Story title][roman type] --[line break][italic type]Una avventura testuale di [story author].[roman type][line break]Versione: [Release number] -- Anno: [story creation year].[line break][Story description][paragraph break]"

Section 5.5 - Frasi Finali
[Il codice di questa sezione è basato sulle versioni di Sebastian Arg e di Eric Forgeot]

The print the final question rule is not listed in any rulebook.
The Italian print the final question rule is listed in before handling the final question.
This is the Italian print the final question rule:
	let named options count be 0;
	repeat through the Table of Italian Final Question Options:
		if the only if victorious entry is false or the game ended in victory:
			if there is a final response rule entry
				or the final response activity entry [activity] is not empty:
				if there is a final question wording entry, increase named options count by 1;
	if the named options count is less than 1, abide by the immediately quit rule;
	say "Cosa desideri fare: ";
	repeat through the Table of Italian Final Question Options:
		if the only if victorious entry is false or the game ended in victory:
			if there is a final response rule entry
				or the final response activity entry [activity] is not empty:
				if there is a final question wording entry:
					say final question wording entry;
					decrease named options count by 1;
					if the named options count is 0:
						say "?[line break]";
					otherwise if the named options count is 1:
						if using the serial comma option, say ",";
						say " o ";
					otherwise:
						say ", ".

The standard respond to final question rule is not listed in any rulebook.
The Italian standard respond to final question rule is listed last in for handling the final question.
This is the Italian standard respond to final question rule:
	repeat through the Table of Italian Final Question Options:
		if the only if victorious entry is false or the game ended in victory:
			if there is a final response rule entry
				or the final response activity entry [activity] is not empty:
				if the player's command matches the topic entry:
					if there is a final response rule entry, abide by final response rule entry;
					otherwise carry out the final response activity entry activity;
					rule succeeds;
	issue miscellaneous library message number 8.

Table of Italian Final Question Options
final question wording	only if victorious	topic		final response rule		final response activity
"RICOMINCIARE"				false				"ricominciare"	immediately restart the VM rule	--
"CARICARE una partita salvata"	false				"caricare"	immediately restore saved game rule	--
"scoprire gli Easter Eggs del gioco (AMUSING)"	true	"amusing"	--	amusing a victorious player
"USCIRE"					false				"uscire"		immediately quit rule	--
--						false				"undo"		immediately undo rule	--


The describe what's on scenery supporters in room descriptions rule is not listed in any rulebook.

For printing a locale paragraph about a thing (called the item)(this is the describe-what's-on-scenery-supporters-in-room-descriptions rule):
	if the item is not undescribed and the item is scenery and the item does not enclose the player:
		set pronouns from the item;
		if a locale-supportable thing is on the item:
			repeat with possibility running through things on the item:
				now the possibility is marked for listing;
				if the possibility is mentioned:
					now the possibility is not marked for listing;
			increase the locale paragraph count by 1;
			say "Sopra [the item] vi ";
			list the contents of the item, as a sentence, including contents,
				giving brief inventory information, tersely, not listing
				concealed items, prefacing with is/are, listing marked items only;
			say ".[paragraph break]";
	continue the activity.


[E' necessario definire una seconda regola per i generi presenti nelle descrizioni delle camere poiché attualmente non riesco a cambiare i soggetti di IF7 grazie alle regole di cui sopra]
To say gendu for (ogg - a thing):
	if ogg is singular-named: 
		say "[if ogg is male]o[otherwise]a[end if]";
	otherwise if ogg is plural-named: 
		say "[if ogg is male]i[otherwise]e[end if]".

Section 5.6 - Dettagli della list-miscellany

Definition : something is empty if it has nothing in it.
 
 Rule for printing a number of something (called the target) when the listing group size is greater than 1: 
    say "[the listing group size in italian words] "; 
    carry out the printing the plural name activity with the target. 
 
After printing the name of a lit thing (called the item) while taking inventory: 
       say " (che al momento è acces[gendu for the item])"; 
        omit contents in listing. 
After printing the name of an open container (called the item) while taking inventory: 
        if the item is singular-named, say " (apert[gendu for the item])"; 
        omit contents in listing. 
After printing the name of a closed container (called the item) while taking inventory: 
        say " (chius[gendu for the item])"; 
        omit contents in listing. 
After printing the name of an empty open container (called the item) while taking inventory: 
         omit contents in listing.
After printing the name of an open empty container (called the item) while printing the locale description: 
         omit contents in listing.
After printing the name of a closed container (called the item) while printing the locale description:
         say " (chius[gendu for the item])";
         omit contents in listing.
After printing the name of a wearable thing (called the item) while taking inventory: 
       say " (che al momento hai indosso)"; 
        omit contents in listing. 
After printing the name of a supporter (called the item) while printing the locale description: 
         if the item supports something, say " (su cui scorgi [a list of things on the item])";
         omit contents in listing.

Section 5.6a - Gli articoli e i generi

Include (-
Constant LanguageAnimateGender   = male;
Constant LanguageInanimateGender = male;
Constant LanguageContractionForms = 3;

[ LanguageContraction text;
  if (text->0 == 'p' or 'P')
  	if (text->1 == 's' or 'S') return 1;
  	else if (text->1 == 'r' or 'R') return 2;
  if (text->0 == 't' or 'T') return 2;
  if (text->0 == 'a' or 'e' or 'i' or 'o' or 'u' or 'A' or 'E' or 'I' or 'O' or 'U') return 0;
  if (text->0 == 'z' or 'Z' or 'x' or 'X') return 1;
  if (text->0 ~= 's' or 'S') 
	if (text->1 == 'a' or 'e' or 'i' or 'o' or 'u' or 'A' or 'E' or 'I' or 'O' or 'U') return 2;
	else return 1;
  return 2;
];

Array LanguageArticles -->
!  Contraction form 0:    Contraction form 1:     Contraction form 2:
!  Cdef   Def    Indef    Cdef   Def    Indef     Cdef   Def    Indef
   "L'"   "l'"  "un "     "Lo "  "lo "   "uno "    "Il "  "il "  "un "  
   "L'"   "l'"  "un'"     "La "  "la "   "una "    "La "  "la "  "una "
   "Gli " "gli " "degli " "Gli " "gli "  "degli "  "I "   "i "   "dei "  
   "Le "  "le " "delle "  "Le "  "le "   "delle "  "Le "  "le "  "delle ";
                   !             a           i
                   !             s     p     s     p
                   !             m f n m f n m f n m f n               

Array LanguageGNAsToArticles --> 0 1 0 2 3 0 0 1 0 2 3 0;
-) instead of "Articles" in "Language.i6t".


Section 5.7 - Evitiamo sovrapposizioni con il comando oops

Include (-
Constant AGAIN1__WD     = 'ancora';
Constant AGAIN2__WD     = 'an//';
Constant AGAIN3__WD     = 'ancora';
Constant OOPS1__WD      = 'oops';
Constant OOPS2__WD      = 'oo//';
Constant OOPS3__WD      = 'oops';
Constant UNDO1__WD      = 'undo';
Constant UNDO2__WD      = 'undo';
Constant UNDO3__WD      = 'undo';

Constant ALL1__WD       = 'ogni';
Constant ALL2__WD       = 'ognuno';
Constant ALL3__WD       = 'ognuna';
Constant ALL4__WD       = 'qualsiasi';
Constant ALL5__WD       = 'entrambi';
Constant AND1__WD       = 'e';
Constant AND2__WD       = 'e';
Constant AND3__WD       = 'e';
Constant BUT1__WD       = 'ma';
Constant BUT2__WD       = 'eccetto';
Constant BUT3__WD       = 'ma';
Constant ME1__WD        = 'me';
Constant ME2__WD        = 'me stesso';
Constant ME3__WD        = 'stesso';
Constant OF1__WD        = 'di';
Constant OF2__WD        = 'di';
Constant OF3__WD        = 'di';
Constant OF4__WD        = 'di';
Constant OTHER1__WD     = 'altri';
Constant OTHER2__WD     = 'altro';
Constant OTHER3__WD     = 'altra';
Constant THEN1__WD      = 'allora';
Constant THEN2__WD      = 'allora';
Constant THEN3__WD      = 'allora';

Constant NO1__WD        = 'n//';
Constant NO2__WD        = 'no';
Constant NO3__WD        = 'no';
Constant YES1__WD       = 's//';
Constant YES2__WD       = 'sì';
Constant YES3__WD       = 'sì';

Constant AMUSING__WD    = 'amusing';
Constant FULLSCORE1__WD = 'fullscore';
Constant FULLSCORE2__WD = 'full';
Constant QUIT1__WD      = 'q//';
Constant QUIT2__WD      = 'quit';
Constant RESTART__WD    = 'restart';
Constant RESTORE__WD    = 'restore';
-) instead of "Vocabulary" in "Language.i6t".

Section 5.8 - Altre sostituzioni utili

Include (-
Constant NKEY__TX       = "N = prossimo_argomento";
Constant PKEY__TX       = "P = precedente";
Constant QKEY1__TX      = "  Q = ritorna al gioco";
Constant QKEY2__TX      = "Q = menu precedente";
Constant RKEY__TX       = "RETURN = leggi argomento";

Constant NKEY1__KY      = 'N';
Constant NKEY2__KY      = 'n';
Constant PKEY1__KY      = 'P';
Constant PKEY2__KY      = 'p';
Constant QKEY1__KY      = 'Q';
Constant QKEY2__KY      = 'q';

Constant SCORE__TX      = "Punteggio: ";
Constant MOVES__TX      = "Mosse: ";
Constant TIME__TX       = "Ora: ";
Global CANTGO__TX     = "Non puoi andare da quella parte.";
Global FORMER__TX     = "te stesso";
Global YOURSELF__TX   = "te stesso";
Constant YOU__TX        = "Tu";
Constant DARKNESS__TX   = "Buio";

Constant THOSET__TX = " tutto quanto";
Constant THAT__TX = " quel";
Constant OR__TX = " o";
Constant NOTHING__TX = "nulla";
Constant NOTHING2__TX = "Niente";
Constant IS__TX = " è";
Constant ARE__TX = " sono";
Constant IS2__TX = "è ";
Constant ARE2__TX = "sono ";
Global IS3__TX = "è";
Global ARE3__TX = "sono";
Constant AND__TX = " e ";

Constant LISTAND__TX = " e ";
Constant LISTAND2__TX = " e ";

Constant WHOM__TX = "";
Constant WHICH__TX = "";
Constant COMMA__TX = ", ";
-) instead of "Short Texts" in "Language.i6t".


Section Finale - Traduzione dei Verbi
[Ho evitato di utilizzare sostituzioni del sesto per rendere più facilmente leggibili e modificabili gli Understand]

[Generali]
Understand "attacca [something]" or "attacca il/la/lo/i/le/gli/l/quei/quella/quello/quelle/quegli/quei/quell [something]" as attacking.
Understand "uccidi [something]" or "uccidi  il/la/lo/i/le/gli/l/quei/quella/quello/quelle/quegli/quei/quell [something]" as attacking.
Understand "prendi [something]" or "prendi  il/la/lo/i/le/gli/l/quei/quella/quello/quelle/quegli/quei/quell [something]" as taking.
Understand "mangia [something]" or "mangia  il/la/lo/i/le/gli/l/quei/quella/quello/quelle/quegli/quei/quell [something]" as eating.
Understand "bacia [something]" or "bacia  il/la/lo/i/le/gli/l/quei/quella/quello/quelle/quegli/quei/quell [something]" as kissing.
Understand "canta" as singing.
Understand "tocca [something]" or "tocca  il/la/lo/i/le/gli/l/quei/quella/quello/quelle/quegli/quei/quell [something]" as touching.
Understand "brucia [something]" or "brucia  il/la/lo/i/le/gli/l/quei/quella/quello/quelle/quegli/quei/quell [something]" as burning.
Understand "odora" as smelling.
Understand "bevi [something]" or "bevi  il/la/lo/i/le/gli/l/quei/quella/quello/quelle/quegli/quei/quell [something]" as drinking.
Understand "compra [something]" or "compra il/la/lo/i/le/gli/l/quei/quella/quello/quelle/quegli/quei/quell [something]" as buying.
Understand "dormi" as sleeping.
Understand "salta" as jumping.
Understand "svegliati" as waking up.
Understand "taglia [something]" or "taglia il/la/lo/i/le/gli/l/quei/quella/quello/quelle/quegli/quei/quell [something]" as burning.
Understand "agita le mani" as waving hands.
Understand "colpisci il/la/lo/i/le/gli/l/quei/quella/quello/quelle/quegli/quei/quell [something]" or "colpisci [something]" as swinging.
Understand "spremi [someone]" or "spremi il/la/lo/i/le/gli/l/quei/quella/quello/quelle/quegli/quei/quell [something]" as squeezing.
Understand "ascolta" as listening.
Understand "verifica" as verifying the story file.
Understand "pensa" or "ricorda" as thinking.
Understand "rompi il/la/lo/i/le/gli/l/quei/quella/quello/quelle/quegli/quei/quell [something]" as attacking.
Understand "merda" or "cazzo" or "troia" or "puttana" or "vaffanculo" as swearing obscenely.

[Visione]
Understand "guarda [something]" or "guarda il/la/lo/i/le/gli/l/quei/quella/quello/quelle/quegli/quei/quell [something]" as examining.
Understand "leggi [something]" or "leggi il/la/lo/i/le/gli/l/quei/quella/quello/quelle/quegli/quei/quell [something]" as examining.
Understand "guarda dentro [something]" or "guarda dentro il/la/lo/i/le/gli/l/quei/quella/quello/quelle/quegli/quei/quell [something]" or "guarda in/nel/nello/nella/negli/nelle/nell [something]" as searching.
Understand "esamina [something]" or "esamina il/la/lo/i/le/gli/l/quei/quella/quello/quelle/quegli/quei/quell [something]" as examining.
Understand "guarda" or "g" as looking.
Understand "guarda sotto il/la/lo/i/le/gli/l/quei/quella/quello/quelle/quegli/quei/quell/al/alla/allo/all/ai/alle/agli [something]" as looking under.
Understand "descrivi il/la/lo/i/le/gli/l/quei/quella/quello/quelle/quegli/quei/quell [something]" as examining.

[Interazione Fisica]
Understand "calcia [something]" or "calcia il/la/lo/i/le/gli/l/quei/quella/quello/quelle/quegli/quei/quell [something]" as attacking.
Understand "accendi [something]" or "accendi il/la/lo/i/le/gli/l/quei/quella/quello/quelle/quegli/quei/quell [something]" as switching on.
Understand "spegni [something]" or "spegni il/la/lo/i/le/gli/l/quei/quella/quello/quelle/quegli/quei/quell [something]" as switching off.
Understand "spingi [something]" or "spingi il/la/lo/i/le/gli/l/quei/quella/quello/quelle/quegli/quei/quell [something]" as pushing.
Understand "indossa [something]" or "indossa il/la/lo/i/le/gli/l/quei/quella/quello/quelle/quegli/quei/quell [something]" as wearing.
Understand "togliti il/la/lo/i/le/gli/l/quei/quella/quello/quelle/quegli/quei/quell [something]" as taking off.
Understand "lascia [something]" or "lascia il/la/lo/i/le/gli/l/quei/quella/quello/quelle/quegli/quei/quell [something]" as dropping.
Understand "mostra [something] a [something]" or "mostra il/la/lo/i/le/gli/l/quei/quella/quello/quelle/quegli/quei/quell [something] al/alla/allo/all/ai/agli/alle/a [something]" as showing it to.
Understand "poggia [something] su [something]" or "poggia il/la/lo/i/le/gli/l/quei/quella/quello/quelle/quegli/quei/quell [something] sul/sullo/sulla/sulle/sugli/sopra/sull [something]" as putting it on.
Understand "inserisci [something] dentro [something]" or "inserisci il/la/lo/i/le/gli/l/quei/quella/quello/quelle/quegli/quei/quell [something] nel/nello/nella/nei/negli/nelle/nell [something]" as inserting it into.
Understand "metti [something] dentro [something]" or "metti il/la/lo/i/le/gli/l/quei/quella/quello/quelle/quegli/quei/quell [something] nel/nello/nella/nei/negli/nelle/nell [something]" as inserting it into.
Understand "cerca il/la/i/le/lo/l/gli/nel/nello/nell/nella/nelle/negli/nei/dentro/sul/sullo/sull/sulla/sugli/sulle/sui [something]" or "perquisisci  il/la/lo/i/le/gli/l [something]" as searching.
Understand "lega il/la/i/le/lo/gli/l [something]  a/al/alla/alle/agli/ai/allo/all [something]" as tying it to.
Understand "taglia  il/la/lo/i/le/gli/l/quei/quella/quello/quelle/quegli/quei/quell [something]" as cutting.
Understand "pulisci il/la/lo/i/le/gli/l/quei/quella/quello/quelle/quegli/quei/quell [something]" as rubbing.

[Dialoghi]
Talking to is an action applying to one visible thing.
Understand "parla [something]" or "parla col/colla/colle/con/coll [something]" or "parla al/alla/allo/all/agli/ai/a/alle/all [something]" or "parla con il/la/lo/i/le/gli/l/quei/quella/quello/quelle/quegli/quei/quell [something]" as talking to.
Understand "chiedi a [something] di [text]" or "chiedi al/alla/allo/all/a/ai/alle/agli [something] di/del/dei/dello/della/degli/dell/delle/dei/riguardo/circa [text]" as asking it about.
Understand "parla a/al/alla/alle/agli/ai/allo/all [something] riguardo/di/del/della/dello/delle/degli/dell [text]" as telling it about.
Understand "interroga il/la/i/le/lo/gli/l [something] riguardo il/la/i/le/lo/gli/l [text]" as telling it about.
Understand "chiedi a/al/alla/alle/agli/ai/allo/all [something] riguardo/di/del/della/dello/delle/degli/dell [text]" as telling it about.
Understand "chiedi a/al/alla/alle/agli/ai/allo/all [something] il/la/i/le/l/gli/quei/quella/quello/quelle [something]" as asking it for.
Understand "chiedi a/al/alla/alle/agli/ai/allo/all [something] riguardo/di/del/della/dell/dello/delle/degli [text]" as asking it about.
Understand "rispondi a/al/alla/alle/agli/ai/allo/agli/all [someone] riguardo/di/del/della/dell/dello/delle/degli [text]" as answering it that.

[Chiavi]
Understand "apri [something]" or "apri il/la/lo/i/le/gli/l/quei/quella/quello/quelle/quegli/quei/quell [something]" as opening.
Understand "chiudi [something]" or "chiudi il/la/lo/i/le/gli/l/quei/quella/quello/quelle/quegli/quei/quell [something]" as closing.
Understand "sblocca [something] con [something]" or "sblocca il/la/lo/i/le/gli/l/quei/quella/quello/quelle/quegli/quei/quell [something] con il/la/lo/i/le/gli/l/quei/quella/quello/quelle/quegli/quei/quell [something]" as unlocking it with.
Understand "apri [something] con [something]" or "apri il/la/lo/i/le/gli/l/quei/quella/quello/quelle/quegli/quei/quell [something] con  il/la/lo/i/le/gli/l/quei/quella/quello/quelle/quegli/quei/quell [something]" as unlocking it with.
Understand "chiudi [something] con [something]" or "chiudi il/la/lo/i/le/gli/l/quei/quella/quello/quelle/quegli/quei/quell [something] con  il/la/lo/i/le/gli/l/quei/quella/quello/quelle/quegli/quei/quell [something]" as locking it with.
Understand "rimuovi [something] da [something]" or "rimuovi il/la/lo/i/le/gli/l/quei/quella/quello/quelle/quegli/quei/quell [something] da/dalle/dalla/dagli/dai/dall [something]" as removing it from.

[Descrizioni]
Understand "brevi" as preferring sometimes abbreviated room descriptions.

[Inventario]
Understand "inventario" or "inv" or "i" as taking inventory.

[Movimento]
Understand "vai [something]" or "vai a [something]" as going.
Understand "scendi dalla/dal/da/dai/dalle/dagli/dall [something]" as getting off.
Understand "sali sul/sullo/sulla/sulle/sugli/sui/sull [something]" as entering.
Understand "entra nello/nella/in/nel/nei/negli/nelle/nell [something]" as entering.
Understand "o" as west.
Understand "ovest" as west.
Understand "sud" as south.
Understand "est" as east.
Understand "nord" as north.
Understand "nordovest" as northwest.
Understand "sudovest" as southwest.
Understand "sudest" as southeast.
Understand "nordest" as northeast.
Understand "su" as up.
Understand "giù" as down.
[Carica/Salva/Esci]
Understand "punti" or "punteggio" as requesting the score.
Understand "sipunti" or "sipunteggio" or "notifica" as switching score notification on.
Understand "nopunti" or "nopunteggio" or "notifica off" as switching score notification off.
Understand "esci" as quitting the game.
Understand "salva" as saving the game.
Understand "carica" as restoring the game.
[Direzioni]
The printed name of north is "nord". 
The printed name of  northeast is "nord-est". 
The printed name of east is "est". 
The printed name of southeast is "sud-est". 
The printed name of  south is "sud". 
The printed name of  southwest is "sud-ovest".
The printed name of  west is "ovest". 
The printed name of  northwest is "nord-ovest". 
The printed name of up is "su". 
The printed name of down is "giù". 
The printed name of  inside is "dentro". 
The printed name of  outside is "fuori".  

Italian ends here.

---- DOCUMENTATION ----

Italian è una estensione adibita alla traduzione del parser inglese in lingua italiana.
La versione attuale è la 2.

Per cambiare i messaggi del parser in italiano basta includere la libreria nel preambolo del listato in Inform 7 :
	
	Include Italian by Massimo Stella.

La libreria si basa in parte sul lavoro portato avanti da David Fisher, Custom Library Messages, che a sua volta offre la possibilità di personalizzare le risposte del parser.
Per far ciò basta copiare, al termine del listato in IF, una delle sezioni 2.X e modificarne le risposte tra trattini. Si faccia attenzione, anche per modificare una sola voce di una sezione, è necessario copiarne l'intero blocco.
Si segua l'esempio seguente, inserendo le seguenti righe direttamente nel nostro codice :
	
	Section 2.50 - Mental Actions

	Table of library messages (continued)
	Message Id				Message Text
	LibMsg <block thinking>			"Solo questo messaggio è stato modificato per esempio..."
	LibMsg <block player consulting>		"Non trovi nulla di interessante nel [the % dobj]."
	LibMsg <block npc consulting>		"[The actor] guarda verso il [the % dobj]."

Per ulteriori informazioni sulla libreria Custom Library Messages, si rimanda alla sua documentazione sul sito di IF 7.

Il riconoscimento del genere e del numero proprio della grammatica italiana viene definito nel codice personale in IF 7, attraverso i comandi seguenti :
[singular-named] - per il singolare
[plural-named] - per il plurale
[male] - per il maschile
[female] - per il maschile.

La definizione del genere e del numero di un oggetto è consigliabile che avvenga al momento della sua dichiarazione. Si scriverà dunque :

	The palla is a female singular-named thing in the Cortile.

Si noti che l'esempio di sopra avrà un risultato differente dalla scrittura :

	Palla is a female singular-named thing in the Cortile.

poichè in questo ultimo caso il parser stamperà il nome della palla in maiuscolo, riconoscendola come una persona, secondo le regole grammaticali dei nomi propri. A tal proposito si rimanda alla sezione 5.2 della Documentazione Inglese di IF7 sull'uso degli articoli determinativi e indeterminativi. Si faccia ancora attenzione che all'attuale non è possibile stampare liste in cui si usino insieme queste due tipologie di articoli:

	say "[a list of things in the Salotto]";
	...
	Una palla, un fermacapelli e un cappello.

	say "[the list of things in the Salotto]";
	...
	La palla, il fermacapelli e il cappello.
Mentre invece non è possibile ottenere il seguente output:
	
	La palla, un fermacapelli e il cappello.

Qualora qualcuno trovasse il trucco pratico è invitato a farmelo sapere e verrà citato in questa libreria! 
Per ovviare a questo e ad altre piccole imprecisioni nella traduzione, è possibile cambiare manualmente come più ci aggrada il nome di un certo oggetto stampato, come nell'esempio seguente :

	Palle is a female plural-named thing in the Cortile. The printed name of the palla is "delle palle".

Italian offre anche alcune piccole peculiarità come la funzione di scrivere a parole un numero compreso non strettamente tra 0 e 9999. Il comando da memorizzare è "say a number in italian words", differente dallo standard di IF 7, "say a number in words".
Chiarificatore è l'esempio seguente:

	say "[a random number from 1 to 2000 in italian words]";

Italian implementa anche la possibilità di esprimere l'orario in due modi diversi. I comandi :

	say "[the time of day in italian words]";
	say "[the time of day in italian complete words]";

stamperanno rispettivamente un orario tipo "le nove e trenta" oppure "le nove e mezzo". Ci si può divertire a verificare le sfumature di output dei due programmi.

Finalmente sono state aggiunte le preposizioni articolate. Il loro funzionamento è molto semplice, ad esempio:

	Carta is a female thing in the Interrogation Chamber.

	Brian is in the Interrogation Chamber."Brian vede il marchio [dip the carta]." Brian carries a quantity of plastic explosive. The explosive is secret.

Nel primo rigo si afferma che l'oggetto Carta (attenzione, una dichiarazione "Carta is..." è diversa da "The carta is...") è un oggetto di genere femminile nella stanza IC. Quando vogliamo richiamare l'uso di una preposizione articolata possiamo utilizzare il comune richiamo ad oggetto con all'interno il nome della preposizione semplice seguito da p (di "preposition"). Questa accortezza farà declinare al parser la preposizione articolata corretta (di default gli oggetti sono al singolare, dunque la risposta del parser dovrebbe essere "della Carta").

Si noti che è possibile cambiare le informazioni su titolo, autore, storia, etc. copiando nel nostro codice personale e modificando le seguenti diciture :

	The story title is "Atto 0". 
	The story author is "Massimo Stella". 
	The story headline is "Una avventura testuale interattiva". 
	The story genre is "---". 
	The release number is 100. 
	The story description is "Inserire una descrizione." 
	The story creation year is 2008. 

Alcuni comandi utili sono i seguenti :
	- salva
	- carica
	- i (di inventario)
	- g (per guardare)
	- esci

NOTA : essendo la versione attuale la prima release ufficiale, testata su un numero limitato di IF, potrebbero essere presenti ancora bugs o imprecisioni di traduzione. Si prega di mandare una email, senza recriminazioni o peggio, all'autore, che provvederà celermente a riparare eventuali imprecisioni. Ad esempio all'attuale, l'uso degli apostrofi è piuttosto complicato. L'indirizzo dell'autore è arlian34@yahoo.com.

Si ringraziano per il beta testing : Tristano Ajmone, Alex Nicotera, Leonardo Boselli (http://apocalyx.sf.net) e Gabriele Lazzara. Senza di loro, Italian avrebbe avuto molti più bug di quanti non ne abbia attualmente! 

Segue un esempio per provare le possibilità di Italian.

- - - - - - - -

Example: * Atto 0 - Una avventura thriller per Inform 7 di Massimo Stella.

	*: "Atto 0" by Massimo Stella

	Include Italian by Massimo Stella.
	Include Basic Screen Effects by Emily Short.

	When play begins:
	turn the background black;
	clear the screen;
	center "[white letters]'P-pronto?'";
	center "'C[']è un caso per te, Bruno. Un professore ammazzato.'";
	center "'C-capo...ma che ora è?'";
	center "'E['] ora di iniziare a vederci chiaro, ragazzo.'";
	wait for any key;
	clear the screen;
	center "[red letters]- Atto 0 -";
	center "[red letters]Una Tech Demo Investigativa per Inform 7";
	center "[white letters]Di Massimo Stella";
	wait for any key;
	clear the screen;
	remove the investigatore from play;
	say "[white letters]Guidi per diversi minuti sotto la pioggia battente prima di giungere all[']università della seconda Divisione della tua città. Che razza di tempo, pensi mentre scendi dalla macchina. Cerchi di ripararti con il tuo impermeabile grigio e ti fiondi 	subito all[']entrata della facoltà di scienze.";
	wait for any key.
	
	A person can be medic or detective. A person is usually detective.
	
	Portineria is a room. The description is "La portineria dell[']università. E['] piuttosto angusta e spoglia. Puoi notare alcune teche contenenti vecchi strumenti in ottone e in bronzo. C[']è un silenzio spettrale. Nella guardiola non c[']è anima viva, eppure sono le 	[the time of day in italian words] altrimenti dette [the time of day in italian complete words]. Ad ovest si apre l[']accesso alla sala comune."
	The sedia di velluto is an enterable supporter in the Portineria. The sedia di velluto is a female thing. 
	The comodino is a container, closed, openable, male. The comodino is in Portineria.

	Guardiola is scenery in the portineria. The description is "La guardiola è vuota, non c[']è nessuno dentro."
	Teche is scenery in the portineria. The description is "Le teche contengono alcuni strumenti antichi. Tra questi riconosci una macchina per generare elettricità." The printed name of the Teche is "delle teche di vetro".
	Macchina is scenery in the portineria. The description is "Si tratta di una specie di nastro di pelle che girando sfrega continuamente un disco di vetro. Non ne sai molto ma per sfregamento si dovrebbe generare una certa carica elettrostatica." Understand 	"strumenti/macchine" as macchina.
	
	The foglio is a thing in the Portineria. The description is "La solita robaccia. Un volantino con alcuni numeri di telefono: [a random number from 1 to 9999 in italian words]". 
	The guardaroba is a singular-named thing in the Portineria. On the guardaroba is a scatoletta.  Scatoletta is a female thing.
	The pasticcino is an edible thing in the Portineria. The description of the pasticcino is "Dall[']aspetto sembrerebbe proprio gustoso e abbondantemente farcito di crema." 
	
	Instead of showing the pasticcino to the poliziotto:
	say "'No, grazie [if the player is detective]detective[otherwise]dottore[end if]. Sono a dieta, sa?'".
	
	Poliziotto is a man in the Portineria. "Un poliziotto dall[']aria arcigna ti scruta." The description is "Indossa un cappotto nero e pare piuttosto nervoso." Understand "uomo/'uomo/guardia" as Poliziotto. The printed name of poliziotto is "poliziotto".
	
	Instead of talking to the portinaia:
	say "'Buongiorno a lei. Sono così sconvolta per quello che è successo...'".
	
	Instead of talking to the poliziotto:
	say "[if the player is detective]'Finalmente siete arrivato detective. Il medico legale è già qui e sta terminando il suo rilievo.'[line break]'Dove si trova la scena del delitto?'[line break]'Le basterà attraversare un paio di stanze. Giri a destra e poi vada sempre 	dritto. Il fattaccio è avvenuto in un lungo corridoio.'[otherwise]'Buongiorno, dottor Reri. Ho appena indirizzato il detective verso la scena del delitto, lo avete incontrato?'[/n]'Sì, certo, grazie.'[end if]"
	
	Sala comune is west of Portineria. The description is "Una saletta piccola e angusta, immersa nella penombra. A nord si trova un lungo corridoio."

	The grata is a female closed door. Grata is south of the Corridoio. Through it is the Sala Comune. Grata is openable and lockable and locked. "Una grata di acciaio grigio regola gli accessi al corridoio. Al momento[if the grata is closed] è chiusa.[otherwise]è	 aperta.[end if]". The description is "Una grata di acciaio grigio molto robusta." The matching key of the grata is the chiave di bronzo.
	
	Corridoio is north of the Sala comune. The description is "Un corridoio molto lungo. A sinistra noti una lunga serie di neon spenti, mentre la parete a destra è ricoperta da numerose finestre di legno massiccio. A nord puoi vedere una grata di acciaio. Qui è 	avvenuto l[']omicidio. Il cadavere di un uomo sulla trentina è accasciato a terra, riverso in una [red letters]pozza di sangue[white letters]. Non noti molti [red letters]schizzi[white letters] sul pavimento verdino."
	
	Rilievo is a kind of value. The rilievoes are prendendo alcune impronte, scattando alcune foto dei particolari del cadavere, osservando la forma di alcuni schizzi di sangue, guardando il proprio orologio, prelevando un campione di sangue, osservando meglio la 	scena del crimine, rivedendo le foto scattate.
	
	Neon is scenery in the Corridoio. The description is "Dei lunghi tubi al neon affissi alla parete e distanziati di circa un metro. Non vi noti nulla di particolare.".
	Finestre is scenery in the Corridoio. The description is "Delle finestre vecchio stile, ora completamente coperte da una miriade di goccioline. Al momento sta piovendo intensamente. [if the player is medic]Le gocce di pioggia ti danno da pensare...sono una 	vera infinità...tante...moltissime...un numero forse pari a quello delle persone morte violentemente...una moltitudine di dolore...rassegnatasi ad una fine cruenta in tempi più brevi della caduta a terra della pioggia. Ticchettante.[otherwise]Non hai mai amato il 	clima umido della tua città.[end if]".
	
	The medico is a man in the Corridoio. "Il medico legale sta [a random rilievo].".The description is "Jacob. Il tuo migliore amico. E anche uno dei migliori medici legali del Distretto. E['] un pò più piccolo di te, ha solo ventotto anni, ma si è sempre rivelato 	essere di grande aiuto nelle indagini." The printed name of the medico is "medico legale".
	Understand "Jacob/collega/legale" as medico.

	Cadavere is a thing in the Corridoio. It is fixed in place. The description of the cadavere is "Il professore Lant era vestito in maniera non insolita per un docente universitario: giacca e cravatta. Sul petto riportava i segni evidenti di un[']arma da perforazione di 	medie dimensioni, che doveva averlo colpito almeno otto volte." The printed name of the cadavere is "un cadavere supino per terra".
	Understand "professore/Lant/professor Lant/professore Lant/vittima/uomo" as cadavere.
	
	Vestiti is scenery in the Corridoio. The description is "Una giacca verdina di cotone e un paio di pantaloni del medesimo colore. Ora tutti imbrattati di rosso." Understand "vestiti/giacca/cravatta" as vestiti.
	Segni is scenery in the Corridoio. The description is "Otto tagli sul torso lunghi circa sette o otto centimetri.[if the player is detective] L[']arma del delitto potrebbe essere uno spuntone o un coltellaccio. Le ferite ti appaiono tuttavia così profonde da indurti 	a pensare che il colpevole sia dotato di una ottima prestanza fisica. Eppure qualcosa non quadra...questo tipo di ferite spiega bene la [red letters]chiazza di sangue[white letters] in cui si trova il cadavere ma non la relativa penuria di schizzi, visto che i colpi 	sono stati inferti in coincidenza delle principali arterie del tronco.[otherwise][end if]". Understand "ferite/tagli/petto/torace" as segni.
	Chiazza is scenery in the Corridoio. The description is "Il cadavere si trova riverso in una grande [red letters]pozzanghera vermiglia[white letters]. Probabilmente la vittima ha continuato a sanguinare abbondantemente dopo il crimine. Sulle pareti circostanti alla 	chiazza si trovano pochi [red letters]schizzi rubicondi[white letters]. Che sia stata una morte rapida e indolore?" Understand "pozzanghera/sangue/chiazza di sangue/pozza" as chiazza.
	Schizzi is scenery in the Corridoio. The description is "Ci sono troppi pochi [red letters]schizzi di un rosso vivace[white letters] sulle pareti verdine.[if the player is detective] Qualcosa non quadra. Se l[']omicidio fosse avvenuto qui, la scena del delitto non 	sarebbe così relativamente in ordine e pulita. Devi parlare a Jacob del luogo dell[']omicidio.[otherwise][end if]".
	
	The borsa is a female wearable openable container in the Corridoio. "La borsa del professore giace a terra. [if open]E['] aperta.[otherwise]E['] chiusa.[end if]". The borsa is closed. The borsa is lockable and locked. The printed name of the borsa is "borsa".
	
	The torcia elettrica is a female device in the Borsa. "Una torcia elettrica, stranamente accesa." Torcia elettrica is lit. The printed name of the torcia elettrica is "torcia elettrica".
	
	The chiave is a female thing in the Corridoio. The description is "Una piccola chiave luccicante, con sopra il numero [30 in italian words]." The printed name of chiave is "chiave". The chiave unlocks the borsa.
	
	Laboratorio di informatica is a dark room. It is east of the Corridoio. "Un laboratorio di informatica con evidenti segni di colluttazione."
	The computer is a device in the Laboratorio. Computer is switched off. The description of the computer is "Un computer vecchio modello. Attualmente è [if computer is switched off]spento.[otherwise]acceso.[end if]". The printed name of the computer 	is "computer".
	The brandello is a thing in the Laboratorio. "Noti un piccolo brandello di stoffa nera." The description is "Ha la medesima consistenza del pile. Con un pizzico di fortuna potrebbe contere capelli o altre tracce del suo possessore."
	The printed name of the chiavetta di bronzo is "chiavetta di bronzo".
	Monopattini is a plural-named male thing in the Laboratorio di Informatica. The printed name of the monopattini is "dei monopattini".
	The tavolo is a supporter in the Laboratorio di Informatica. It is scenery. The chiavetta di bronzo is a female thing on the tavolo. The printed name of the tavolo is "tavolo".
	
	Inves is a number that varies. Inves is 0.
	
	Instead of talking to the medico:
	if inves is 0 begin;
	say "- Mi hanno chiamato verso le otto. Il capo mi ha detto di un caso urgente e sono corso qui all’università appena ho potuto - esordisci.[line break]";  
	wait for any key;
	say "- L’ha trovato la portinaia che apre le stanze della facoltà ogni mattina. Dai documenti dovrebbe trattarsi di Francis Lant, docente di Chimica Fisica qui all’Università da ormai 5 anni – risponde il medico legale, senza guardarti negli occhi."; 
	wait for any key;
	say "- E['] conciato male – [/n]Usavi spesso questa frase di fronte ai cadaveri dei tuoi casi. Raramente però dicevi quelle parole per pietà o commiserazione. Si trattava più di un arco riflesso ormai, visto che avevi già lavorato a oltre cinquanta incarichi simili a 	quello : una vittima pugnalata a morte e ritrovata cadavere in un lago di [red letters]sangue[white letters].";  
	wait for any key;
	say "- Non ti fa più tanto effetto, vero? -[/n]Il medico legale Jacob era totalmente diverso da te. Aveva innanzitutto un animo sensibile, che forse mai si sarebbe abituato a scene così cruente. Questa sensibilità gli derivava in parte da un passato piuttosto 	turbolento e in altra parte da una componente intima del suo carattere."; 
	wait for any key;
	say "- Mi farà più effetto quando troveremo il colpevole di questo scempio. Sembrerebbero esserci state sette o otto pugnalate diverse. Hai già registrato la temperatura corporea del corpo? -[/n]- Ieri un gruppo di alunni ha detto di aver avuto lezione con il 	professor Lant fino alle quattordici. La temperatura del cadavere mi fa pensare che il decesso sia avvenuto dalle diciotto alle ventuno di ieri sera. Vista l’ampia quantità di [red letters]sangue[white letters] perso però non è un dato attendibile. –"; 
	wait for any key; 
	change inves to 1;
	say "[italic type][/n]E['] giunto il momento di investigare. Osserva minuziosamente la scena del delitto e cerca di giungere alla giusta conclusione. Quando ne saprai abbastanza potrai chiedere un parere a Jacob.[roman type][/n]";
	otherwise;
	say "'Non so Bruno...c[']è qualcosa che non mi convince. La posizione del cadavere non ti pare troppo innaturale? E quegli schizzi... Ti prego, dagli un[']occhiata, per piacere.";
	end if.
	
	Instead of asking the medico about "luogo/schizzi":
	say "- Sembra fin troppo pulito. Forse l’omicidio non si è consumato qui. Nonostante ci sia una larga [red letters]chiazza di sangue[white letters] scuro mancano gli [red letters]schizzi brillanti[white letters] di sangue arterioso. E questa cos’è? - indichi una 	monetina da cinque centesimi di euro.[/n]"; wait for any key;
	say "- L’hanno catalogata come prova. Molto probabilmente l’ha lasciata qui l’assassino, visto che la vittima aveva il portafogli conservato in borsa - [/n]"; wait for any key;
	say "- Un segno dell’omicida, ne analizzeremo le impronte. Cos’altro sai dirmi? - [/n]- Il decesso è avvenuto principalmente per emorragia interna, la seconda pugnalata ha colpito l’arteria aorta. Deve essere stata una morte molto dolorosa. Ecco, prendi la 	macchina fotografica, ci sono le foto che ho scattato - "; wait for any key;
	say "Detto questo Jacob si avvicina al volto della vittima, contratto in un’ultima smorfia di dolore, sussurrando - Chi ti ha fatto questo? -"; wait for any key;
	clear the screen;
	say "...";
	wait for any key;
	clear the screen;
	say "[/n]Come medico legale avevi uno stretto rapporto con i cadaveri. Il tuo obiettivo principale era sempre scoprire cosa avesse portato ad un massacro o cosa si nascondesse dietro un’apparente morte naturale. Ti chiedevi sempre cosa avessero sentito i 	tuoi 'clienti' poco prima di morire. La tua però non era solo una passione di tipo professionale."; 
	say "[italic type][/n]E['] giunto il momento di rivedere alcune scene del passato. Tu, Jacob, a volte riesci ad avere delle strane visioni. Potresti osservare dei flashbacks del passato toccando alcuni oggetti specifici sulla scena del delitto.[roman type][/n]";	
	remove the medico from play;
	now all the things carried by the player are carried by the investigatore;
	move the investigatore to the Corridoio;
	now the player is medic.
	
	Instead of showing the brandello to the investigatore:
	say "'Ottimo lavoro, Jacob. Hai già prelevato un campione di capelli della vittima? In questo modo avremo la possibilità di escluderla da eventuali futuri riscontri.'"
	
	Investigazione is a kind of value. The investigaziones are scorrendo le foto fatte alla scena del crimine, rimuginando in direzione della finestra, guardando la posizione del cadavere, cercando altri dettagli importanti.
	
	Investigatore is a man in the Corridoio. "L[']investigatore Bruno sta [a random investigazione]." The description is "Bruno. Un uomo all[']apparenza un pò scorbutico. Sicuramente un grande investigatore, con più di un centinaio di casi risolti a soli trentanni. 	Probabilmente è l[']unica persona con la quale tu abbia legato un rapporto di amicizia solido.". The printed name of the Investigatore is "Bruno". Understand "Bruno/ispettore/piedipiatti" as investigatore.
	
	Instead of talking to the investigatore:
	say "'Jacob hai già preso un campione di capelli della vittima? Potrebbe esserci utile per analizzare i campioni di sangue sulla scena.' [/n]'Certo, provvedo immediatamente.'[/n]"
	
	Instead of asking the investigatore about "indagini/omicidio/assassinio/schizzi/cadavere":
	say "'E['] veramente una brutta storia, ma finora ho visto altri casi più cruenti di questo. Credi che mi stia...abituando a tutto questo, Jacob?'[line break]'Non saprei cosa dirti, Bruno.'".
	
	Campione is scenery in the Corridoio. The description is "Un piccolo capello del professor Lant."
	Understand "capello" as campione.
	
	Instead of taking the campione :
	say "Sfiori il capello. E in quel momento il passato ti si ripresenta di fronte agli occhi.";
	wait for any key;
	turn the background white;
	clear the screen;
	center "[black letters]Atto 0 - Concluso.[/n]";
	say "[italic type]Ci sono momenti in cui non sentiamo la nostra vita scorrere ma percepiamo chiaramente il passare del tempo. Un flusso perpetuo e continuo, simile ad un pugno di sabbia che scappa via dalla nostra presa. -- Un lavoro di Massimo Stella[roman 	type]";
	show the current quotation;
	wait for any key;
	end the game in victory.
	
	Persuasion rule for asking someone to try doing something: persuasion succeeds. 
	The block giving rule is not listed in the check giving it to rules. 
	
	Instead of touching the borsa while the player is medic:
	turn the background white;
	clear the screen;
	say "[black letters]...Francis stava tornando dalla mensa universitaria. In pomeriggio avrebbe dovuto lavorare in laboratorio. Quel giorno tirava un forte vento e il cielo era talmente grigio da far prevedere un sicuro acquazzone...[white letters]"; wait for any 	key;
	turn the background black;
	clear the screen.
	
	Instead of touching the computer while the player is medic:
	turn the background white;
	clear the screen;
	say "[black letters]...Il sole era ormai tramontato da un pezzo quando Francis e il suo studente uscirono dalla camera pulita. I due si salutarono e presero due strade opposte. Il professore si diresse verso il lungo corridoio buio che dava sul parcheggio esterno. 	Vide l’orologio con le lancette fosforescenti che portava al polso. Segnava le sette e nove minuti...[white letters]"; wait for any key;
	turn the background black;
	clear the screen.
	
	Instead of touching the cadavere while the player is medic:
	turn the background white;
	clear the screen;
	say "[black letters]...Il corridoio che aveva davanti a sé era estremamente lungo, percorrendolo anche velocemente non ci si poteva impiegare meno di cinque minuti buoni. Inoltre, sul lato sinistro, vi erano diverse finestre che normalmente permettevano alla 	luce argentea della luna di illuminare i contorni di quel passaggio. Quella sera era luna nuova.[white letters]"; wait for any key;
	turn the background black;
	clear the screen.
	
	Instead of touching the brandello while the player is medic:
	turn the background white;
	clear the screen;
	say "[black letters]...Il professore prese a camminare con passo svelto e falcata ampia. Sentiva il ronzio dei macchinari dei laboratori adiacenti. Oltre a questo il silenzio. Avvertiva una certa sensazione di disagio. Ad un tratto la porta in fondo al corridoio si aprì 	lentamente, cigolando. Francis, ancora lontano da essa, si irrigidì per un momento. Poi pensò che comunque non era molto tardi e poteva benissimo esserci un suo collega ancora in laboratorio. Finito quel cigolio quasi spettrale, il professore intravide una 	figura scura e alta venirgli incontro con passo lento...[white letters]"; wait for any key;
	turn the background black;
	clear the screen.
	
	The portinaia is a woman in the Portineria.
	The gatta is a female animal in the Portineria. 
	The lampadina tascabile is a female lit thing in the Portineria.
	Instead of switching on the lampadina tascabile:
	say "E['] già accesa, perchè dovresti mai fare una cosa del genere?".
	
	Helping is an action applying to nothing.
	Instead of helping:
	say "Seguono alcuni suggerimenti.[paragraph break]Per salvare o caricare una partita usa i comandi 'salva' o 'carica'.[paragraph break]Per chiedere un oggetto ad un personaggio non giocante usa il comando :[line break]> Bruno, lascia la chiave[line break]o 	altri al modo imperativo.[line break]Puoi anche interagire con gli altri personaggi, attraverso il comando :[line break]>parla a Jacob di argomento".
	Understand "aiuto" or "help" or "hint" or "aiuti" as helping.

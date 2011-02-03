Version 7 of Modelli di Conversazione by Massimo Stella begins here.

"Permette di sostenere brevi conversazioni a scelte multiple, di salutare, annuire, dissentire o pronunciare semplici frasi agli NPC."

"based on Conversation Framework by Eric Eve"

Book 0 - Includes

Include Italian by Massimo Stella.
Include Epistemology by Eric Eve.

Book  1 - Actions for asking and telling about things

Chapter  1 - Definitions

Section 1 - New actions and grammar

Requesting it for is an action applying to two visible things.
Imploring it for is an action applying to one visible thing and one topic.

Understand the command "ask" as something new.

Understand "chiedi al/alla/allo/all/a/ai/alle/agli [someone] di/del/dei/dello/della/degli/dell/delle/dei/riguardo/circa [text]" as asking it about.
Understand "domanda al/alla/allo/all/a/ai/alle/agli [someone] di/del/dei/dello/della/degli/dell/delle/dei/riguardo/circa [any known thing]" as requesting it for.
Understand "implora [someone] per il/la/lo/i/le/gli/l/quei/quella/quello/quelle/quegli/quei/quell [text]" or "implora il/la/lo/i/le/gli/l [someone] per il/la/lo/i/le/gli/l/quei/quella/quello/quelle/quegli/quei/quell [text]" or "implora [someone] di [text]" as imploring it for.

Quizzing it about is an action applying to two visible things.

Understand "interroga il/la/lo/i/le/gli/l/quei/quella/quello/quelle/quegli/quei/quell [someone] sul/sullo/sulla/sui/sulle/sugli/sull [any known thing]" or "interroga [someone] sul/sullo/sulla/sui/sulle/sugli/sull [any known thing]" as quizzing it about.
Informing it about is an action applying to two visible things.

Understand "informa il/la/lo/i/le/gli/l [someone] riguardo il/la/lo/i/le/gli/l [any known thing]" or "informa il/la/lo/i/le/gli/l [someone] di/del/della/dell/dello/delle/degli [any known thing]" as informing it about.

Section 2 - Specifications

The specification of the quizzing it about action is "Questa azione corrisponde a comandi come INTERROGA SPUTAFUOCO SUL CIRCO, dove CIRCO è qualcosa definito nel gioco, invece che un topic di conversazione."

The specification of the informing it about action is "Questa azione corrisponde a comandi come INFORMA IL PESCATORE DELLE TROTE, dove TROTE è qualcosa definito nel gioco, invece che un topic di conversazione."

The specification of the requesting it for action is "Questa azione corrisponde a comandi come DOMANDA AL CAPO DEL LAVORO, ma a differenza del comando originale 'chiedi' essa non è equivalente a CAPO, DAMMI DEL LAVORO. L'oggetto domandato può essere qualsiasi cosa nota al giocatore e gli esiti di questa azione potranno essere cambiati arbitrariamente."

The specification of the imploring it for action is "Questa azione corrisponde a comandi come IMPLORA ANNA DI BACIARTI, dove BACIARTI è qualcosa definito nel gioco, invece che un topic di conversazione."


Chapter  2 - Some useful default rules

Report informing someone about something (this is the block informing rule):
  say "Niente. Nessuna risposta."

Report quizzing someone about something (this is the block quizzing rule):
  say "Niente. Nessuna risposta."

Instead of asking a woman about "di lei" (this is the asking a woman about herself rule):
  try quizzing the noun about the noun.

Instead of asking a man about "di lui" (this is the asking a man about himself rule):
  try quizzing the noun about the noun.


Book  2 - Abbreviated commands for addressing the current interlocutor

The current interlocutor is an object that varies.
The current interlocutor is nothing.

Implicit-asking is an action applying to one topic.

Understand "chiedi riguardo il/la/lo/i/le/gli/l [text]" or "d [text]" as implicit-asking.

implicit-telling is an action applying to one topic.

Understand "p [text]" as implicit-telling.

implicit-quizzing is an action applying to one visible thing.
  Understand "interroga riguardo il/la/lo/i/le/gli/l [any known thing]" or "i [any known thing]" as implicit-quizzing.

implicit-informing is an action applying to one visible thing.
  Understand "p [any known thing]" or "p di/del/della/dello/dei/degli/delle/dell [any known thing]" as implicit-informing.

implicit-requesting is an action applying to one visible thing.
  Understand "domanda di/del/della/dello/dei/degli/delle/dell [any known thing]" as implicit-requesting.

implicit-imploring is an action applying to one topic.
  Understand "implora di [text]" as implicit-imploring.

implicit-asking is implicit-conversing. 
implicit-telling is implicit-conversing. 
implicit-quizzing is implicit-conversing. 
implicit-informing is implicit-conversing.
implicit-requesting is implicit-conversing.
implicit-imploring is implicit-conversing.

Before implicit-conversing when the current interlocutor is nothing (this is the implicit-conversing needs current interlocutor rule):
let np be the number of visible people who are not the player;
if np is 0 then say "Non c'è nessuno con cui parlare qui.";
if np > 1 then say "Devi specificare a chi poter parlare.";
if np is not 1 then stop the action;
let the interlocutor be a random visible person who is not the player;
 if the interlocutor is a person begin;
   say "(ti rivolgi [ap the interlocutor])";
   let sn be the second noun;
   implicitly greet the interlocutor;
   change the second noun to sn;
 otherwise ;
  say "Non stai parlando a nessuno.";
  stop the action;
end if.

Before implicit-conversing when the current interlocutor is not visible and the current interlocutor is not nothing  (this is the can't converse with absent interlocutor rule):
  say "[The current interlocutor] non è qui al momento.";
  reset the interlocutor instead.

Instead of implicit-asking:
  try asking the current interlocutor about it.

Instead of implicit-telling:
  try telling the current interlocutor about it.

Instead of implicit-quizzing:
  try quizzing the current interlocutor about the noun.

Instead of implicit-informing:
  try informing the current interlocutor about the noun.

Instead of implicit-requesting:
  try requesting the current interlocutor for the noun.

Instead of implicit-imploring:
  try imploring the current interlocutor for it.

[
After reading a command when the player's command matches "a [thing]" and the current interlocutor is not a person:
  if the number of visible people who are not the player > 1 begin;
     say "Whom do you want to ask?";
     reject the player's command;
  end if.
]

Book 3 - Greeting Protocols

Chapter 1 - Definitions

Asking someone about something is conversing.
Telling someone about something is conversing.
Quizzing someone about something is conversing.
Informing someone about something is conversing.
Answering someone that something is conversing.
Asking someone for something is conversing.
Requesting someone for something is conversing.
Imploring someone for something is conversing.

Requesting someone for something is speaking.
Asking someone about something is speaking.
Telling someone about something is speaking.
Quizzing someone about something is speaking.
Informing someone about something is speaking.
Answering someone that something is speaking.
Asking someone for something is speaking.
Imploring someone for something is speaking.


Saying yes is speaking.
Saying no is speaking.
Saying sorry is speaking.


Chapter  2 - Greeting


Before conversing when the noun is not the current interlocutor (this is the greet a new interlocutor rule):
  implicitly greet the noun;
  if the noun is not the current interlocutor then stop the action.

Before showing something to someone when the second noun is not the current interlocutor (this is the showing needs an interlocutor rule):        
  implicitly greet the second noun;
  if the second noun is not the current interlocutor then stop the action.
 
Before giving something to someone when the second noun is not the current interlocutor (this is the giving needs an interlocutor rule):
  if the current interlocutor is not a person then abide by the implicit-conversing needs current interlocutor rule;
  implicitly greet the second noun;
  if the second noun is not the current interlocutor then stop the action.

Before asking someone to try doing something when the person asked is not the current interlocutor (this is the giving orders needs an interlocutor rule):
  implicitly greet the person asked;
  if the person asked is not the current interlocutor then stop the action.

To implicitly greet (character - a thing):
  change the greeting type to implicit;
  try saying hello to the character.


Saying hello to is an action applying to one visible thing.

Understand "saluta [something]" or "rivolgi la parola a/alla/all/alle/ai/agli/allo/alla [something]" as saying hello to.

Check saying hello to a person when the noun is the current interlocutor (this is the can't greet current interlocutor rule):
    if the noun is the player, say "Parlare con te stesso è poco stimolante." instead;
    say "Stai già parlando [ap the noun]." instead.


Carry out saying hello to a person (this is the note current interlocutor when greeted rule):
  change the current interlocutor to the noun.

Report saying hello to something that is not a person (this is the can't greet inanimate objects rule):
  say "[The noun] non [if the noun is not plural-named]risponde[otherwise]rispondono[end if]."

Report saying hello to someone when the greeting type is explicit (this is the default greeting rule):
  say "Saluti [the noun]."

Hailing is an action applying to nothing.

Understand "ciao" or "salve" or "saluta" as hailing.

Before asking someone to try hailing (this is the change greeting command to greeting rule):  
  change the greeting type to explicit;
  try saying hello to the person asked;
  rule succeeds.

The change greeting command to greeting rule is listed before the giving orders needs an interlocutor rule in the before rules.

Check hailing (this is the check what's being hailed rule):
  if the current interlocutor is a visible person then
    say "Stai già parlando [ap the current interlocutor]." instead;
  change the noun to a random visible person who is not the player;
  if the noun is a person and the noun is not yourself and the noun is not the player then 
    say "(ti rivogli [ap the noun])";
  otherwise say "Sei completamente solo." instead.

Carry out hailing (this is the standard hailing rule):
  try saying hello to the noun.
  

Persuasion rule for asking people to try hailing (this is the allow hailing rule): persuasion succeeds.

A protocol type is a kind of value. The protocol types are implicit and explicit.

Greeting type is a protocol type that varies. Greeting type is explicit.

When play begins: reset the interlocutor.

Chapter 2  - Saying Goodbye

Farewell type is a protocol type that varies. Farewell type is explicit.

[ This is the only way I could figure to effectively change the current interlocutor to no one]

To reset the interlocutor:
  change the current interlocutor to nothing. [a random person who is not a person]

Leavetaking is an action applying to nothing.

Understand "addio" or "arrivederci" or "a presto" or "congedati" as leavetaking.

Saying goodbye to is an action applying to one visible thing.

Understand "dì ciao/addio/arrivederci a/al/alla/alle/agli/ai/allo/agli/all [someone]" as saying goodbye to.

Check saying goodbye to something when the noun is not the current interlocutor (this is the can't say goodbye to someone you're not talking to rule):
  say "Non ti stai rivolgendo [ap the noun]." instead.

Carry out saying goodbye to something (this is the reset interlocutor on saying goodbye rule):   
  reset the interlocutor.

Check leavetaking when the current interlocutor is not a visible person (this is the don't allow saying goodbye to no-one rule):
  say "Non stai parlando a nessuno." instead.

Carry out leavetaking (this is the standard leavetaking rule):
  try saying goodbye to the current interlocutor.

Persuasion rule for asking people to try leavetaking (this is the alllow leavetaking rule): persuasion succeeds.

Carry out someone trying leavetaking (this is the convert npc leavetaking to player leavetaking rule):
  try saying goodbye to the person asked.

Report saying goodbye to someone when the farewell type is explicit (this is the default saying goodbye rule):
   say "Saluti [the noun]."

This is the say goodbye when moving rule:
    if the current interlocutor is a person in the location begin;
        change the farewell type to implicit;
        try saying goodbye to the current interlocutor;
   end if.


The say goodbye when moving rule is listed first in the carry out going rules.


[
Before going from somewhere when the current interlocutor is a person in the location (this is the say goodbye when moving rule):
  change the farewell type to implicit;
  try saying goodbye to the current interlocutor.  

The say goodbye when moving rule is listed first in the before rules.
]

Chapter 3 - Reset protocol each turn

Every turn (this is the reset protocol rule):
  Change the farewell type to explicit;
  Change the greeting type to explicit.

Book 4 - Yes, No and Sorry

saying yes is implicit-conversing.
saying no is implicit-conversing.
saying sorry is implicit-conversing.

Before asking someone to try saying yes (this is the greet before saying yes rule):
  if the person asked is not the current interlocutor, implicitly greet the person asked;
  try saying yes instead.

Before asking someone to try saying no (this is the greet before saying no rule):
  if the person asked is not the current interlocutor, implicitly greet the person asked;
  try saying no instead.

Before asking someone to try saying sorry (this is the greet before saying sorry rule):
  if the person asked is not the current interlocutor, implicitly greet the person asked;
  try saying sorry instead.

Before answering someone that "sì" (this is the change answering yes to saying yes rule):
  try saying yes instead.

Before answering someone that "no" (this is the change answering no to saying no rule):
  try saying no instead.

Before answering someone that "scusa" (this is the change answering sorry to saying sorry rule):
  try asking the noun to try saying sorry instead.

Understand "rispondi a/al/alla/alle/agli/ai/allo/agli/all [someone] di [text]" as answering it that. Understand "rispondi a/al/alla/alle/agli/ai/allo/agli/all [someone] che [text]" as answering it that.


Book 4 - Limiting what can be spoken about

Check quizzing someone about something unknown (this is the block asking about something unknown rule):
  abide by the block asking rule.

Check informing someone about something unknown (this is the block telling about something unknown rule):
  abide by the block telling rule.

To say make (obj - a thing) known:
  change obj to familiar.


Modelli di Conversazione ends here.


---- DOCUMENTATION ----

Vai a vedere la documentazione di Conversation Framework by Eric Eve su inform7.com!
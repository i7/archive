Version 9 of Quips Interattive by Massimo Stella begins here.

"Una libreria utile per le interazioni e i dialoghi con NPC attraverso righe e scelte multiple."

"based on Version 9 of Reactable Quips by Michael Martin".

[Version 9 - Updated for 5T18, correcting run-time problems and ducking some library bugs.]
[Version 8 - Made it cleaner for clients to check whether or not RQ is active.  Cleaned up the parser errors a little.]
[Version 7 - Remove the ugly hack from version 6 that copes with the 4X60 bug.]
[Version 6 - Add > SAY X syntax to match QBC. Allow delivery of nested quips. Make example clickable.  Basic quipping rule changed to be compatible with 4X60.]
[Version 5 - Made a procedural rule static.]
[Version 4 - Cleanups for indexing.  Rule ordering bugfix.  Removed redundant rules.  Permit current quip to change in a "before quipping" rule.  Reset the number understood when necessary to duck a parser issue.  Add a specification for quips.  Removed ugly hacks to make parser asides work right in versions of Inform predating version 4S08.]
[Version 3 - Replaced parentheses with brackets where appropriate, as is traditional for parser asides.  Removed the "wait silently" action by using conditional "understand" statements instead -- this produces sensible error messages in all circumstances as of version 3T38 of Inform 7.  Expanded documentation to show how default ask and tell quips can be individually universally redefined.  ]
[Version 2 - Modified "if index is the noun" to "if index is the number understood" to compensate for Inform 7's improved type checking in 3R85.  Improved the output of REPEAT, and added RECAP as a synonym.]
[Version 1 - Initial release.]

Include Italian by Massimo Stella.

Section 1 - Quips

A quip is a kind of value.  The quips are defined by the Table of Quip Texts.  The specification of quip is "La 'quip' è una linea di dialogo. Diverse quips possono essere collegate per simulare un dialogo realistico."

The current quip is a quip that varies. The current quip is quip_null.
The pertinent quip is a quip that varies.  The pertinent quip is quip_null.

A person has a quip called default ask quip. The default ask quip of a person is usually quip_null.
A person has a quip called default tell quip. The default tell quip of a person is usually quip_dtell.

Quipping is an activity.  The last for quipping rule (this is the basic quipping rule): say "[quiptext of the current quip][paragraph break]";

To deliver the (q - quip) quip:
	change the current quip to q;
	carry out the quipping activity;
	let rq_index be 0;
	repeat through Table of Quip Followups:
		if the current quip is the quip entry:
			increase rq_index by 1;
			say "[bracket][rq_index][close bracket] [option entry][line break]";
	if rq_index is not 0:
		change the pertinent quip to the current quip;
		change the number understood to 0;
	otherwise:
		change the pertinent quip to quip_null.

To nest the (q - quip) quip:
	let x be the current quip;
	change the current quip to q;
	carry out the quipping activity;
	change the current quip to x.

To decide whether RQ is active:
	If the pertinent quip is quip_null, no;
	yes.

Requesting a recap is an action out of world applying to nothing.  Understand "ripeti" or "ricapitola" as requesting a recap when RQ is active.

Carry out requesting a recap (this is the perform recap rule):
	let rq_index be 0;
	repeat through Table of Quip Followups:
		if the quip entry is the pertinent quip:
			increase rq_index by 1;
			if rq_index is 1, say "Le opzioni disponibili sono:[paragraph break]";
			say "[bracket][rq_index][close bracket] [option entry][line break]";
	if rq_index is 0, say "[bracket]Non ci sono risposte disponibili al momento.[close bracket][paragraph break]".

Responding with is an action applying to one number.
Understand "[number]" or "scegli [number]" as responding with when RQ is active.

[This rule Can't Run, as the Understand commands stand..]
[Carry out responding with when the pertinent quip is quip_null (this is the can't talk out of conversations rule): 
  say "[bracket]BUG: Responded despite there being no conversation options available![close bracket]".]

[Likewise, this test is redundant.]
Carry out responding with [when the pertinent quip is not quip_null] (this is the perform responding rule):
	let rq_index be 0;
	repeat through Table of Quip Followups:
		if the quip entry is the pertinent quip:
			increase rq_index by 1;
			if rq_index is the number understood:
				deliver the result entry quip;
				rule succeeds;
	say "[bracket]I numeri validi vanno da 1 a [rq_index].  Scrivi RIPETI per rivedere le opzioni.[close bracket][paragraph break]".

Before doing something [other than requesting a recap or responding with] when the pertinent quip is not quip_null (this is the force conversation rule):
	unless the current action is requesting a recap or the current action is responding with:
		say "[bracket]E['] necessaria una scelta per proseguite.  Inserisci un numero o usa il comando RIPETI per rivedere le opzioni disponibili.[close bracket][paragraph break]";
		stop the action.

The force conversation rule is listed first in the before rules.

A procedural rule when RQ is active:
	ignore the every turn stage rule;
	ignore the timed events rule;
	ignore the advance time rule;
	ignore the update chronological records rule.

Section 2 - Hitword-based conversation

Instead of asking someone about something: 
	repeat through Table of Ask Results:
		if the noun is the NPC entry:
			if the topic understood includes topic entry:
				deliver the result entry quip;
				rule succeeds; 
	if the noun is a person:
		say "[quiptext of the default ask quip of the noun][paragraph break]"; 
		rule succeeds; 
	say "Parole gettate al vento.".

Telling someone about something is reactable quips speech.
Answering someone that something is reactable quips speech.

Instead of reactable quips speech: 
	repeat through Table of Tell Results:
		if the noun is the NPC entry:
			if the topic understood includes topic entry:
				deliver the result entry quip;
				rule succeeds; 
	if the noun is a person:
		say "[quiptext of the default tell quip of the noun][paragraph break]"; 
		rule succeeds; 
	say "Parole gettate al vento.".

Section 3 - Quip Tables

Table of Quip Texts
quip		quiptext
quip_null	"Non ti viene in mente nulla a riguardo."
quip_dtell	"Non ti viene in mente nulla a riguardo."

Table of Quip Followups
quip		option		result
a quip		text		a quip

Table of Ask Results
NPC		topic		result
a person		a topic		a quip

Table of Tell Results
NPC		topic		result
a person		a topic		a quip

Section 4 - Straightening out the parser

Before printing a parser error when RQ is active and the latest parser error is the didn't understand that number error:
    now the latest parser error is the didn't understand error.

Quips Interattive ends here.

---- DOCUMENTATION ----

Visita la documentazione online di Reactable Quips by Michael Martin su inform7.com!
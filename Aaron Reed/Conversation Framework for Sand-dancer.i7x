Version 2 of Conversation Framework for Sand-dancer by Aaron Reed begins here.

"A unified package for conversation in Sand-dancer (the example game for the book Creating Interactive Fiction with Inform 7). This is a modified and streamlined version of Eric Eve's Conversation Framework and Conversation Suggestions."

"based on Conversation Framework and Conversation Suggestions by Eric Eve"

[History:
 v2: Named all rules to make the extension easier to modify.]

Volume - Conversation Framework version 7

[Part of the motivation for creating a custom extension rather than directing people to download Eric's versions is the need to lock a certain version of the extensions into sync with the non-mutable contents of the book. Though the original extensions will hopefully continue to evolve and improve, the book cannot (barring future editions) and compatibility issues could seriously frustrate future readers. So first we must preserve these two extensions as they existed at the time of the book's release.]

Book 0 - Includes

Include Epistemology by Eric Eve.

Book  1 - Actions for asking and telling about things

Chapter  1 - Definitions

Section 1 - New actions and grammar

Requesting it for is an action applying to two visible things.
Imploring it for is an action applying to one visible thing and one topic.

Understand the command "ask" as something new.

Understand "ask [someone] about [text]" as asking it about.

Understand "ask [someone] for [any known thing]" as requesting it for.
Understand "ask [someone] for [text]" as imploring it for.

Quizzing it about is an action applying to two visible things.

Understand "ask [someone] about [any known thing]" as quizzing it about.

Informing it about is an action applying to two visible things.

Understand the command "tell" as something new. Understand the command "answer" as something new.

Understand "tell [someone] about [any known thing]" as informing it about.

Section 2 - Specifications

The specification of the quizzing it about action is "This action responds to commands like ASK FRED ABOUT BOAT, where BOAT is a thing defined in the game, rather than a topic."

The specification of the informing it about action is "This action responds to commands like TELL FRED ABOUT BOAT, where BOAT is a thing defined in the game, rather than a topic."

The specification of the requesting it for action is "This action effectively replaces the library's asking it for action. Like asking it for it matches ASK BOB FOR SOMETHING, but unlike asking it for it makes no assumptions that this is equivalent to BOB, GIVE ME SOMETHING. Instead it can match any object known to the player, and the response can be anything we care to define."

The specification of the imploring it for action is "This action provides handling for ASK SOMEONE ABOUT SOMETHING where SOMETHING is a topic rather than a thing, e.g. ASK BILL FOR ADVICE."


Chapter  2 - Some useful default rules

Report informing someone about something (this is the block informing rule):
  say "There is no reply."

Report quizzing someone about something (this is the block quizzing rule):
  say "There is no reply."

Understand "himself/herself" as a person. 


Book  2 - Abbreviated commands for addressing the current interlocutor

The current interlocutor is an object that varies.
The current interlocutor is nothing.

[We remove implicit-asking and implicit-telling from Eric's original, since our game never uses the original versions of ASK or TELL.]

implicit-quizzing is an action applying to one visible thing.
  Understand "ask about [any known thing]" or "a [any known thing]" as implicit-quizzing.

implicit-informing is an action applying to one visible thing.
  Understand "t [any known thing]" or "talk about [any known thing]" as implicit-informing.

implicit-requesting is an action applying to one visible thing.
  Understand "ask for [any known thing]" as implicit-requesting.

implicit-imploring is an action applying to one topic.
  Understand "ask for [text]" as implicit-imploring.

implicit-quizzing is implicit-conversing. 
implicit-informing is implicit-conversing.
implicit-requesting is implicit-conversing.
implicit-imploring is implicit-conversing.

Before implicit-conversing when the current interlocutor is nothing (this is the implicit-conversing needs current interlocutor rule):
let np be the number of visible people who are not the player;
if np is 0,  say "There's no one here to talk to.";
if np > 1,  say "You need to specify who you want to speak to.";
if np is not 1, stop the action;
let the interlocutor be a random visible person who is not the player;
 if the interlocutor is a person begin;
   say "(addressing [the interlocutor])";
   let sn be the second noun;
   implicitly greet the interlocutor;
   now the second noun is sn;
 otherwise ;
  say "You're not talking to anyone.";
  stop the action;
end if.

Before implicit-conversing when the current interlocutor is not visible and the current interlocutor is not nothing  (this is the can't converse with absent interlocutor rule):
  say "[The current interlocutor] isn't here.";
  reset the interlocutor instead.

Instead of implicit-quizzing:
  try quizzing the current interlocutor about the noun.

Instead of implicit-informing:
  try informing the current interlocutor about the noun.

Instead of implicit-requesting:
  try requesting the current interlocutor for the noun.

Instead of implicit-imploring:
  try imploring the current interlocutor for it.


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
  if the noun is not the current interlocutor, stop the action.

[We remove the rules here for showing and giving, since these actions do not appear in Sand-dancer.]

Before asking someone to try doing something when the person asked is not the current interlocutor (this is the giving orders needs an interlocutor rule):
  implicitly greet the person asked;
  if the person asked is not the current interlocutor, stop the action.

To implicitly greet (character - a thing):
  now the greeting type is implicit;
  try saying hello to the character.


Saying hello to is an action applying to one visible thing.

Understand "greet [something]" or "say hello/hi to [something]" or "talk to [something]" as saying hello to.

Check saying hello to a person when the noun is the current interlocutor (this is the can't greet current interlocutor rule):
    if the noun is the player, say "Talking to yourself is unrewarding." instead;
    say "You are already talking to [the noun]." instead.


Carry out saying hello to a person (this is the note current interlocutor when greeted rule):
  now the current interlocutor is the noun.

Report saying hello to something that is not a person (this is the can't greet inanimate objects rule):
  say "[The noun] do[if the noun is not plural-named and the noun is not the player]es[end if] not respond."

Report saying hello to someone when the greeting type is explicit (this is the default greeting rule):
  say "You say hello to [the noun]."

Hailing is an action applying to nothing.

Understand "hello" or "hi" or "say hello/hi" as hailing.

Before asking someone to try hailing (this is the change greeting command to greeting rule):  
  now the greeting type is explicit;
  try saying hello to the person asked;
  rule succeeds.

The change greeting command to greeting rule is listed before the giving orders needs an interlocutor rule in the before rules.

Check hailing (this is the check what's being hailed rule):
  if the current interlocutor is a visible person, 
    say "You are already talking to [the current interlocutor]." instead;
  now the noun is a random visible person who is not the player;
  if the noun is a person and the noun is not yourself and the noun is not the player,  
    say "(addressing [the noun])";
  otherwise say "There's no one here but you." instead.

Carry out hailing (this is the standard hailing rule):
  try saying hello to the noun.
  

Persuasion rule for asking people to try hailing (this is the allow hailing rule): persuasion succeeds.

A protocol type is a kind of value. The protocol types are implicit and explicit.

Greeting type is a protocol type that varies. Greeting type is explicit.

When play begins: reset the interlocutor.

Chapter 2  - Saying Goodbye

Farewell type is a protocol type that varies. Farewell type is explicit.

[ This is the only way I could figure to effectively change the current interlocutor to no one. --Eric]

To reset the interlocutor:
  now the current interlocutor is nothing. [a random person who is not a person]

Leavetaking is an action applying to nothing.

Understand "bye" or "goodbye" or "cheerio" or "farewell" as leavetaking.

Saying goodbye to is an action applying to one visible thing.

Understand "say bye/goodbye/farewell/cheerio to [someone]" as saying goodbye to.

Check saying goodbye to something when the noun is not the current interlocutor (this is the can't say goodbye to someone you're not talking to rule):
  say "You're not talking to [the noun]." instead.

Carry out saying goodbye to something (this is the reset interlocutor on saying goodbye rule):   
  reset the interlocutor.

Check leavetaking when the current interlocutor is not a visible person (this is the don't allow saying goodbye to no-one rule):
  say "You're not talking to anyone." instead.

Carry out leavetaking (this is the standard leavetaking rule):
  try saying goodbye to the current interlocutor.

Persuasion rule for asking people to try leavetaking (this is the alllow leavetaking rule): persuasion succeeds.

Carry out someone trying leavetaking (this is the convert npc leavetaking to player leavetaking rule):
  try saying goodbye to the person asked.

Report saying goodbye to someone when the farewell type is explicit (this is the default saying goodbye rule):
   say "You say goodbye to [the noun]."

This is the say goodbye when moving rule:
    if the current interlocutor is a person in the location begin;
        now the farewell type is implicit;
        try saying goodbye to the current interlocutor;
   end if.


The say goodbye when moving rule is listed first in the carry out going rules.



Chapter 3 - Reset protocol each turn

Every turn (this is the reset protocol rule):
  now the farewell type is explicit;
  now the greeting type is explicit.

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

Before answering someone that "yes" (this is the change answering yes to saying yes rule):
  try saying yes instead.

Before answering someone that "no" (this is the change answering no to saying no rule):
  try saying no instead.

Before answering someone that "sorry" (this is the change answering sorry to saying sorry rule):
  try asking the noun to try saying sorry instead.



Book 4 - Limiting what can be spoken about

Check quizzing someone about something unknown (this is the block asking about something unknown rule):
  abide by the block asking rule.

Check informing someone about something unknown (this is the block telling about something unknown rule):
  abide by the block telling rule.

To say make (obj - a thing) known:
  now obj is familiar.

Volume - Conversation Suggestions version 3

Book 1 - Includes

Include Plurality by Emily Short.

Book 2 - Definitions

Part 1 - Suggestion Lists for People

A person has a list of objects called ask-suggestions.
A person has a list of objects called tell-suggestions.
A person has a list of objects called other-suggestions.

Part 2 - The misc-suggestion Kind

A misc-suggestion is a kind of thing. An misc-suggestion is usually proper-named. 
A misc-suggestion is usually familiar. 
A misc-suggestion has a number called seqno. The seqno of an misc-suggestion is usually 100.

The specification of misc-suggestion is "An misc-suggestion is an object for use in an other-suggestions list. It is used to suggest topics for conversation other than those the player might ask about or tell about (e.g. SAY YES or GIVE HIM THE BOOK). The printed name of an misc-suggestion should be something that would make sense following 'You could '. An misc-suggestion can be given a seqno in order to place it in an appropriate place in the sequence of misc-suggestions."

yes-suggestion is a misc-suggestion. The printed name is "say yes". The seqno is 10.
no-suggestion is a misc-suggestion. The printed name is "say no." The seqno is 12.
yes-no-suggestion is a misc-suggestion. The printed name is "say yes or no". The seqno is 10.

self-suggestion is a familiar thing. The printed name is "[it-them of the current interlocutor][if the current interlocutor acts plural]selves[otherwise]self[end if]"

Part 3 - Global Variables

sugg-list-ask is a list of objects that varies.
sugg-list-tell is a list of objects that varies.
sugg-list-other is a list of objects that varies.
suggest-on-greeting is a truth state that varies.
suggest-on-greeting is true.

Topic-request is a protocol type that varies. Topic-request is explicit.



Book 2 - Some Useful Phrases

To say remove  (obj - a thing) tell suggestion:
   remove obj from the tell-suggestions of the appropriate-suggestion-database, if present.

To say remove (obj - a thing) ask suggestion:
   remove obj from the ask-suggestions of the appropriate-suggestion-database, if present.

To say remove (obj - a thing) other suggestion:
  remove obj from the other-suggestions of the appropriate-suggestion-database, if present.

To say add (obj - a thing) tell suggestion:
   add obj to the tell-suggestions of the appropriate-suggestion-database, if absent.

To say add (obj - a thing) ask suggestion:
   add obj to the ask-suggestions of the appropriate-suggestion-database, if absent.
  
To say add (obj - a thing) other suggestion:
  add obj to the other-suggestions of the appropriate-suggestion-database, if absent.

To decide which object is the appropriate-suggestion-database:
  decide on the current interlocutor.

Book 3 - Rules

Part 1 - Suggestion List Construction Rules


The suggestion list construction rules are a rulebook.

The first suggestion list construction rule (this is the use the current interlocutor's suggestion lists rule):
  now sugg-list-other is the other-suggestions of the current interlocutor;
  now sugg-list-ask is the ask-suggestions of the current interlocutor;
  now sugg-list-tell is the tell-suggestions of the current interlocutor.

The last suggestion list construction rule (this is the exclude unknown items from suggestions rule):
 Let u-list be the list of unknown things;
 remove u-list from sugg-list-ask, if present;
 remove u-list from sugg-list-tell, if present;
 if the number of entries in sugg-list-other > 0 begin;
   remove u-list from sugg-list-other, if present;
  sort sugg-list-other in seqno order;
end if.

The last suggestion list construction rule (this is the refer to current interlocutor as him-herself in suggestions rule):
  if the current interlocutor is listed in sugg-list-ask begin;
    remove the current interlocutor from sugg-list-ask;
    add self-suggestion at entry 1 in sugg-list-ask;
 end if;
 if the current interlocutor is listed in sugg-list-tell begin;
    remove the current interlocutor from sugg-list-tell;
    add self-suggestion at entry 1 in sugg-list-tell;
 end if.



Part 2 - The Listing Suggested Topics Action

Listing suggested topics is an action applying to nothing.

Understand "topics" as listing suggested topics.

Check listing suggested topics when the current interlocutor is not a person:
  say "You aren't talking to anyone right now." instead.

[ Following the suggestion in Matt Wigdahl's article at http://www.wigdahl.net/quern/2009/12/23/inform-7-development-implementing-single-keyword we use the printed name of  the interlocutor in the following to say phrase, rather than just the current interlocutor, to avoid any custom formatting that may have been applied to topic names in a rule for printing the name of ... when suggestion topics --Eric]

To say nothing specific:
   say "You have nothing specific in mind to discuss with [the printed name of the current interlocutor] right now.";

Chapter 1a -  Listing Suggested Topics (for use with Complex Listing by Emily Short)

[ This version uses Complex Listing to end the list with "or" rather than "and" --Eric]

Section 1 - Carry Out Listing

Carry out listing suggested topics:
	consider the suggestion list construction rules;
	let ask-suggs be the number of entries in sugg-list-ask;
	let tell-suggs be the number of entries in sugg-list-tell;
	let other-suggs be the number of entries in sugg-list-other;
	if ask-suggs + tell-suggs + other-suggs is 0 begin;
		say "[nothing specific]";
		rule succeeds;
	end if;
	say "[if topic-request is implicit]([end if]You could ";
	if other-suggs > 0, 
		say "[sugg-list-other in topic format][if tell-suggs + ask-suggs > 0]; or [end if]";
	if ask-suggs > 0, 
		say "ask [it-them of the current interlocutor] about [sugg-list-ask in topic format][if tell-suggs > 0]; or [end if]";
	if tell-suggs > 0, 
		say "tell [it-them of the current interlocutor] about [sugg-list-tell in topic format]";
	say "[if topic-request is implicit].)[paragraph break][otherwise].[end if]";
 
Section 2 - Carry Out Listing Support Routines

To say (l - a list of objects) in topic format:
	set up l for topic printing;
	say "[the prepared list delimited in disjunctive style]";
 
To set up (l - a list of objects) for topic printing:
	repeat with item running through l:
		now the item is marked for special listing;
	register things marked for listing.

Chapter 1b -  Listing Suggested Topics (for use without Complex Listing by Emily Short)

[ This version uses regular expression substitution in indexed text to end the list with "or" rather than "and" --Eric]

Carry out listing suggested topics:
  consider the suggestion list construction rules;
  let ask-suggs be the number of entries in sugg-list-ask;
  let tell-suggs be the number of entries in sugg-list-tell;
  let other-suggs be the number of entries in sugg-list-other;
  if ask-suggs + tell-suggs + other-suggs is 0 begin;
     say "[nothing specific]";
     rule succeeds;
  end if;
  let sugg-rep be an indexed text;
  say "[if topic-request is implicit]([end if]You could ";
  if other-suggs > 0 begin;
     let sugg-rep be "[sugg-list-other]";
     replace the regular expression "\band\b" in sugg-rep with "or";
     say "[sugg-rep][if tell-suggs + ask-suggs > 0]; or [end if]";
  end if;
  if ask-suggs > 0 begin;
      let sugg-rep be "[sugg-list-ask with definite articles]";
      replace the regular expression "\band\b" in sugg-rep with "or";
      say "ask [it-them of the current interlocutor] about [sugg-rep][if tell-suggs > 0]; or [end if]";
 end if;
 if tell-suggs > 0 begin;    
     let sugg-rep be "[sugg-list-tell with definite articles]";
     replace the regular expression "\band\b" in sugg-rep with "or";
     say "tell [it-them of the current interlocutor] about [sugg-rep]";
end if;
say "[if topic-request is implicit].)[paragraph break][otherwise].[end if]"


Part 3 - Automatic Topic Suggestions

carry out saying hello to someone when suggest-on-greeting is true and greeting type is explicit (this is the display topic suggestions on explicit greeting rule) :
  the topic list displays in 0 turns from now.

At the time when the topic list displays:
  Show the topic suggestions implicitly.

To show the/-- topic suggestions implicitly:
    now topic-request is implicit;
    try listing suggested topics;
    now topic-request is explicit.


Volume - Modifications for Sand-dancer

[Below, we make the changes to produce our customized system for Sand-dancer.]

Section - Redirect yes and no to informing

[To simplify the number of different concepts that must be explained, we redirect saying yes and saying no to informing about the topics created for yes and no by Eric's extension. This way we do not need to introduce the saying yes and saying no actions in the book, or remember that the syntax for matching them would differ from matching other topics.]

Instead of saying yes, try informing the current interlocutor about yes-suggestion. 
Instead of saying no, try informing the current interlocutor about no-suggestion. 

Section - Prevent leaving conversation early

[Since Sand-dancer's conversations are tightly scripted events, we disallow player movement while one is underway.]

Can't leave conversation early is a truth state that varies. Can't leave conversation early is usually true.

Saying goodbye to someone is finishing conversation. Going is finishing conversation.
Instead of finishing conversation when current interlocutor is a person and can't leave conversation early is true (this is the Conversation Framework for Sand-dancer can't normally leave conversation rule): say "You have a feeling this conversation isn’t over."

Section - Show topics after every turn in conversation

[We want the topics list to be displayed after every turn, not just when requested.]

Show topics every turn is a truth state that varies. Show topics every turn is true.

Every turn when current interlocutor is a person and show topics every turn is true (this is the Conversation Framework for Sand-dancer show topics after every turn rule): try listing suggested topics.


Section - Extend the grammar line

[The freeform nature of our topic titles sometimes implies additional syntaxes not supported by the default extension.]

Understand "ask [any known thing]" or "ask him [any known thing]" or "ask her [any known thing]" as implicit-quizzing.
Understand "tell [any known thing]" or "tell him [any known thing]" or "tell her [any known thing]" as implicit-informing.

Section - Clear all topics

[We often want to remove all currently available topics, to move the conversation on to a new subject. Here's a shortcut phrase.]

To clear all topics:
	truncate ask-suggestions of current interlocutor to 0 entries;
	truncate tell-suggestions of current interlocutor to 0 entries;
	truncate other-suggestions of current interlocutor to 0 entries.

Section - Scope

[Eric's extension requires manually setting topics as familiar or unfamiliar. Since our topics are matched to individual characters (who never have visible inventory), we simplify this by having a character hold all the topics he can say, and making all held topics familiar when a conversation begins. ]

Carry out saying hello to a person (called the conversant) (this is the Conversation Framework for Sand-dancer make held things familiar on hello rule):
	now every thing held by the conversant is familiar.
	
Carry out saying goodbye to a person (called the conversant) (this is the Conversation Framework for Sand-dancer make held things unfamiliar on goodbye rule):
	now every thing held by the conversant is unfamiliar.

Section - Remove conversation topics after discussion

[Eric's topics are by default repeatable; ours are not.]

First after informing somebody about something (called the thread) (this is the Conversation Framework for Sand-dancer auto remove tell suggestions rule):
	say "[remove thread tell suggestion][run paragraph on]";
	continue the action.

First after quizzing somebody about something (called the thread) (this is the Conversation Framework for Sand-dancer auto remove ask suggestions rule):
	say "[remove thread ask suggestion][run paragraph on]";
	continue the action.

Section - Italicized Topics List

[We style the topics list to make it stand out more from the surrounding text.]

Before listing suggested topics (this is the Conversation Framework for Sand-dancer italicize listed topics rule): say "[italic type][run paragraph on]". After listing suggested topics (this is the Conversation Framework for Sand-dancer end italicize listed topics rule): say "[roman type][run paragraph on]".

Section - Can't talk to yourself

[We fix what's arguably a bug in the original extension.]

Instead of saying hello to yourself (this is the Conversation Framework for Sand-dancer can't say hello to yourself rule): say "You know you're crazy when you start talking to yourself.". 

Instead of hailing (this is the Conversation Framework for Sand-dancer ignore hailing rule): do nothing.


Conversation Framework for Sand-dancer ends here.

---- DOCUMENTATION ----

This extension is a modified version of Eric Eve's Conversation Framework and Conversation Suggestions extensions, designed for use with the game "Sand-dancer." For full details, see the documentation for the above two extensions (which are not required, but included within this extension). Below are the ways this extension differs from the default.

Section - Saying yes and no

Conversation Framework routes all the alternate ways the player might say yes and no to the saying yes and saying no actions. This extension then converts these to "informing someone about yes-suggestion" and no-suggestion, for greater parity with other rules.

Section - Prevent leaving a conversation early

A truth state, "can't leave conversation early," when true will prevent the player from saying goodbye or moving to a new location until the conversation ends (which must be triggered by the NPC, not the player.)

Section - Show topics after every turn

A truth state, "show topics every turn," when true will display the list of possible topics after every turn during a conversation, rather than only in response to the TOPICS command.

Section - Extend the grammar line

The extension understands commands like "ask him what he means" or "ask why," using the implicit-quizzing action to direct this to the appropriate partner.

Section - clear all topics

A new phrase, "clear all topics," will reset the ask-suggestions, tell-suggestions, and other-suggestions of the current interlocutor, which is good for moving the conversation forward to a new state.

Section - scope

By default, the author must both add a new topic to a conversation list and make sure it is in scope. This extension simplifies this by allowing for an NPC to be carrying any topics that are unique to that NPC, and bringing all those topics into and out of scope when the conversation begins and ends.




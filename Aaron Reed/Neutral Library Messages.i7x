Version 2/110709 of Neutral Library Messages by Aaron Reed begins here.

"Replaces the most misleading and narratively-voiced parser messages with more instructive or neutral versions."

[Version history
2: Fixed bug in misc message 72 to use "the person asked" instead of "the noun"; clarified documentation
]

[Future work: modify to work with Custom Library Messages, too.]

Chapter - Compatibility

Section - Inclusions

Include Version 2 of Default Messages by Ron Newcomb. Include Version 8 of Plurality by Emily Short.


Chapter - Messages

Section - Better Instruction

[Some messages do not give the player enough information about why their command failed, or what the expected input form is.]

Table of custom library messages (continued)
library-action	library-message-id	library-message-text
--	14	"[as the parser]Nothing to correct. 'Oops' or 'O' followed by a word corrects a single misunderstood word in the last command.[as normal]" ["Sorry, that can't be corrected."]
--	16	"[as the parser]Too many words. 'Oops' or 'O' corrects a single misunderstood word in the last command.[as normal]" ["'Oops' can only correct a single word."]
--	23	"[as the parser]In some stories, you can type CHARACTER, COMMAND to give someone else an order; but I couldn't understand what you said in that context.[as normal]" ["You seem to want to talk to someone, but I can't see whom."]
--	25	"[as the parser]In some stories, you can type CHARACTER, COMMAND to give someone else an order; but I couldn't understand some of what you said before the comma in that context.[as normal]" ["To talk to someone, try 'someone, hello' or some such."]
--	28	"[as the parser]I can't understand your entire command, although the first part matched the action [ignore library line break]" ["I only understood you as far as wanting to [ignore library line break]" NOTE: This message is usually (always?) generated now by the special rules in "Section - Only as far as" ]
--	29	"[as the parser]I can't understand your entire command, although the first part matched an action I expected to include a number.[as normal]" ["I didn't understand that number."]
--	44	"[as the parser][if command includes except]That excludes everything.[otherwise]There is nothing available to [the quoted verb].[as normal]" ["There are none at all available!" <!-- TAKE ALL or TAKE X EXCEPT Y]
--	67	"[as the parser]Part of your command is not a physical part of the story world, so you can't act on it in that way.[as normal]"  ["You must name something more substantial."]
Exiting action	1	"[as the parser]You're not inside something. To leave this location, try a direction or 'out'.[as normal]" ["But you aren't in anything at the moment."]
climbing action	1	"[as the parser][That-Those of noun] can't be climbed in that way. Sometimes a direction like 'up' or 'down' works instead.[as normal]" ["I don't think much is to be achieved by that." <-- This is to help address a common problem in poorly implemented works with something like a staircase and no support for CLIMBing it.]
taking action	10	"[as the parser][That-those of noun] [is-are] just scenery, and can't be taken.[as normal]" ["That's hardly portable."]

To decide whether command includes except: if the player's command includes "but" or the player's command includes "except", decide yes.

Section - Generic action rejections

[Some actions, such as taking, directly interface with the world model and thus can fail with specific explanations as to why. But actions without a detailed world model supporting them can't know whether the player's request is categorically impossible (>DRINK SKY), plausible but not implemented (>DRINK STREAM), or simply not being tried with the correct grammar (>DRINK FROM STREAM).

Unfortunately, many of the default messages attempt to guess which of these situations has arisen, sometimes leading to messages that are counterfactual ("That's plainly inedible") or, more dangerously, misleading ("Violence isn't the answer to this one"). Ideally, these messages should refuse the command without implying anything about the possibility or desirability of the requested action. In addition, since we don't know anything about the author's usage of the verb in question, we can't recommend a better command to try.

Ideally, of course, an author implementing a non-standard verb will replace the default message with his own instructions, but we can't rely on that.
 ]

Table of custom library messages (continued)
library-action	library-message-id	library-message-text
attacking action	1	"[as the parser]Attacking [the noun] would have no effect[can't-addendum].[as normal]" ["Violence isn't the answer to this one."]
burning action	1	"[as the parser]You can't burn [the noun][can't-addendum].[as normal]" ["This dangerous act would achieve little."]
buying action	1	"[as the parser]You can't buy [the noun][can't-addendum].[as normal]" ["Nothing is on sale."]
Cutting action	1	"[as the parser]You can't cut [the noun][can't-addendum].[as normal]" ["Cutting that up would achieve little."]
Drinking action	1	"[as the parser][if noun is player]You can't drink yourself.[otherwise if noun is a person]You can't normally consume other characters.[otherwise]You can't consume [the noun][can't-addendum].[end if][as normal]" ["There's nothing suitable to drink here."]
Eating action	1	"[as the parser][if noun is player]You can't eat yourself.[otherwise if noun is a person]You can't normally consume other characters.[otherwise]You can't consume [the noun][can't-addendum].[end if][as normal]" ["There's nothing suitable to drink here."]
Jumping action	1	"[as the parser]Jumping would have no effect[can't-addendum].[as normal]" ["You jump on the spot, fruitlessly."]
rubbing action	1	"[as the parser]Rubbing [the noun] would have no effect[here-addendum].[as normal]" ["You achieve nothing by this."]
pushing action	1	"[as the parser]Pushing [the noun] would have no effect[here-addendum].[as normal]" ["It is fixed in place."]
setting it to action	1	"[as the parser]You can't set [the noun] to that[can't-addendum].[as normal]" ["No, you can't set that to anything."]
singing action	1	"[as the parser]Singing would have no effect[here-addendum].[as normal]" ["Your singing is abominable."]
swinging action	1	"[as the parser]You can't swing [the noun][can't-addendum].[as normal]" ["There's nothing sensible to swing here."]
taking action	11	"[as the parser][The noun] [is-are]n't portable.[as normal]" ["That's fixed in place." <-- statues, odors, and clouds usually aren't literally fixed in place, you just can't pick them up.]
throwing it at action	2	"[as the parser]Throwing [the noun] at [the second noun] would have no effect[here-addendum].[as normal]" ["You lack the nerve when it comes to the crucial moment."]
Tying it to action	1	"[as the parser]You can't tie [the noun] to [that-those of second noun][can't-addendum].[as normal]" ["You would achieve nothing by this."]

To say can't-addendum: say ", or that's not the way to do so".
To say here-addendum: say " in these circumstances".

Section - NPC action rejections

[Using verbs on people is problematic, since player expectations are so much higher. For this reason the library blocks many actions that are allowed on other objects. Lacking a valid physical objection, these messages fall back on social ones, like "That would be less than courteous." But these messages make assumptions about the player character which may not be appropriate.]

Table of custom library messages (continued)
library-action	library-message-id	library-message-text
pulling action	4	"[as the parser]You can't normally pull [yourself-or-other].[as normal]" ["That would be less than courteous."]
taking action	3	"[as the parser]You can't normally pick up other characters.[as normal]" ["I don't suppose Bob would care for that."]
Turning action	4	"[as the parser]You can't normally turn [yourself-or-other].[as normal]" ["That would be less than courteous."]
showing it to action	2	"[as the parser]You can't show [the noun] to [the second noun][can't-addendum].[as normal]"  ["Bob is unimpressed."]
giving it to action	3	"[as the parser]You can't give [the noun] to [the second noun][can't-addendum].[as normal]" ["Bob doesn't seem interested."]
pushing action	4	"[as the parser]You can't normally push [yourself-or-other].[as normal]" ["That would be less than courteous."]
touching action	1	"[as the parser]You can't touch [the noun][can't-addendum].[as normal]" ["Keep your hands to yourself!"]
squeezing action	1	"[as the parser]You can't squeeze [the noun][can't-addendum].[as normal]" ["Keep your hands to yourself."]
Kissing action	1	"[as the parser]You can't kiss [the noun][can't-addendum].[as normal]" ["Keep your mind on the game."]
Waking action	1	"[as the parser][if noun is player]As far as you know, you're already awake.[otherwise]You can't wake [the noun][can't-addendum].[end if][as normal]" ["That seems unnecessary."]
--	72	"[as the parser]You can't order [the person asked] to do that[can't-addendum].[as normal]" ["Bob has  better things to do."]


To say yourself-or-other: say "[if noun is player]yourself[otherwise]other characters".

Section - Generic action acceptance messages

[Some actions succeed by default. We want to take care to describe these successes in the vaguest possible terms, so as not to contradict any author-written text. Even the cautious default for some of these, "Nothing obvious happens," seems too suggestive that something non-obvious might be happening elsewhere. The default examining message has been very slightly softened, to reduce the incongruity of rare objects being called "nothing special," and to bring it in line with the other default sensory messages.

Conversation actions that succeed mean the parser must admit the action took place, without implying anything about the NPC's reaction: "The detective is unimpressed" can be particularly misleading if you've just shown him a bloody weapon. The solution adopted here is to narrate the player's action, not the NPC's response.]

Table of custom library messages (continued)
library-action	library-message-id	library-message-text
squeezing action	2	"You squeeze [the noun]." ["You achieve nothing by this."]
pushing action	3	"You push [the noun]." ["Nothing obvious happens." <-- for portable objects.]
pulling action	3	"You pull [the noun]." ["Nothing obvious happens."]
turning action	3	"You turn [the noun]." ["Nothing obvious happens."]
examining action	2	"You see nothing unexpected about [the noun]." ["You see nothing special about Bob."]
thinking action	1	"Time passes." ["What a good idea."]
asking it about action	1	"You learn nothing new."  ["There is no reply."]
telling it about action	2	"You learn nothing new." ["This provokes no reaction."]
asking it for action	1	"You aren't successful." ["There is no reply."]
answering it that action	1	"You speak." ["There is no reply."]

Section - You Can't See Any Such Thing 

[This famous message has frustrated many. Part of the difficulty is the wide variety of circumstances it can appear under. From the player's perspective, this message appears when she tries to use a verb with
	a) something neither mentioned nor implemented (like the sky)
	b) something mentioned in descriptive text but not implemented
	c) something implemented but not given the specific word used as a synonym
	d) a misspelled word
	e) a word mistakenly understood as part of the direct object, rather than part of the grammar line, as in >TAKE INVENTORY NOW which is matched as {take | inventory now}.
	f) something that exists but has never been seen and is not in scope
	g) something previously seen but no longer in scope, perhaps without the player realizing it's no longer available

In nearly all of these cases, the player believes the object they're referring to should exist, meaning the message is often frustrating. 

Distinguishing between these subtle cases can be difficult. For instance, short of capturing all text output and analyzing it, there is no way to distinguish A from B. Perhaps the easiest distinction to make is between commands containing dictionary words and those that don't, which separates A-D from E-G. Some IF systems implement this by telling the player when she's used an invalid word: this is the approach we adopt below.

Several additional extensions can help break things down further. "Remembering" carves off G from E-F, while "Poor Man's Mistype" can sometimes address D. "Smarter Parser" can sometimes offer helpful messages for certain types of A command related to body parts and common environmental features like the sky. Eric Eve's Text Capture could be a tool in distinguishing A from B.
]

Use traditional can't see any such thing translates as (- Constant TRADITIONAL_CANT_SEE; -).

Table of custom library messages (continued)
library-action	library-message-id	library-message-text
--	30	"[as the parser][if the traditional can't see any such thing option is active]You can't see any such thing.[otherwise if the misunderstood word is known elsewhere and position of non-dictionary word is 0]That's not something you can see now, or I misunderstood you.[otherwise if the misunderstood word is known elsewhere]I didn't [recogniz]e all of the words in that command.[otherwise]You don't need to use the word '[the misunderstood word]' in that way.[end if][as normal]" ["You can't see any such thing."]

[Here are some things you can see: [the list of visible things which are not the player].]
["The word 'sky' doesn't refer to anything right now" is a pretty good alternative, from TADS3.]

Section - Personality-neutral parser

[Many parser messages are written in too strong of a narrative voice, which can clash with the author's prose. ]

Table of custom library messages (continued)
library-action	library-message-id	library-message-text
--	9	"[as the parser]You can't see anything.[as normal]" ["It is now pitch dark in here!"]
--	10	"[as the parser]No command given.[as normal]" ["I beg your pardon?"]
--	11	"[as the parser]Can't 'undo' on the first turn.[as normal]" ["[You can't 'undo' what hasn't been done!]"]
--	12	"[as the parser]Can't 'undo' twice in succession.[as normal]" ["Can't 'undo' twice in succession. Sorry!"]
--	15	"[as the parser]Nothing to correct. 'Oops' or 'O' followed by a word corrects a single misunderstood word in the last command.[as normal]" ["Think nothing of it."]
--	19	"[as the parser]As expected.[as normal]" ["As good-looking as ever." <--- although this message does not seem to be used any more, see Section - Player Description below.]
--	21	"[as the parser]There is not a command to repeat.[as normal]" ["You can hardly repeat that."]
--	70	"[as the parser]You can't 'undo' in this story.[as normal]" [The use of UNDO is forbidden in this game."]
Eating action	2	"You eat [the noun]." ["You eat the noun. Not bad."]
Entering action	1	"[as the parser]You're already [if noun is a supporter]on[otherwise]in[end if] [the noun].[as normal]" [But you're already in the car.]
Examining action	1	"It's too dark to examine [that-them of noun]." ["Darkness, noun. An absence of light to see by."]
Giving it to action	2	"[as the parser]You're already holding [it-them of noun].[as normal]" ["You juggle [the noun] for a while, but don't achieve much."]
Looking under action	1	"It's too dark to look under [that-them of noun]." ["But it's dark."]
pushing it to action	3	"[as the parser]There is no exit in that direction.[as normal]" ["Not that way you can't."]
putting it on action	3	"[as the parser][The second noun] doesn't need to hold anything in this story.[as normal]" ["Putting things on the car would achieve nothing."]
putting it on action	4	"[as the parser][if we are dropping]You can't drop yourself.[else]You can't put anything on [the second noun] while you're holding [it-them of second noun].[as normal]" ["You lack the dexterity." <-- Also runs in the "can't drop yourself" rule.]
removing it from action	1	"[as the parser]You can't, because [it-they of noun] [is-are] closed.[as normal]" [It is unfortunately closed.]
searching action	1	"It's too dark to search [that-them of noun]." ["But it's dark."]
sleeping action	1	"You can't sleep right now." ["You aren't feeling especially drowsy."]
taking action	2	"[as the parser]You can't take yourself.[as normal]" ["You are always self-possessed."]
telling it about action	1	"[as the parser]You can't tell yourself about something.[as normal]" ["You talk to yourself a while."]
throwing it at action	1	"[as the parser]You can't throw [that-them of noun], or can't do so in that way.[as normal]" ["Futile." <-- for inanimate objects]
touching action	3	"As expected." ["If you think that'll help." <-- for TOUCH SELF]
Waking up action	1	"As far as you know, you're already awake." ["The dreadful truth is, this is not a dream."]
waving action	2	"You wave [the noun]." ["You look ridiculous waving [the noun]."]
waving hands action	1	"You wave." ["You wave, feeling foolish."]


Section - Performance

[This small set of verbs normally produce jokey or out-of-character responses. These may be read as something the player is directing his character to say, or something he's expressing himself. Here, we simply say that the action does nothing under the current circumstances. ]

Table of custom library messages (continued)
library-action	library-message-id	library-message-text
saying yes action	1	"[as the parser]Saying yes here has no effect.[as normal]" ["That was a rhetorical question."]
saying no action	1	"[as the parser]Saying no here has no effect.[as normal]" ["That was a rhetorical question."]
saying sorry action	1	"[as the parser]Saying sorry here has no effect.[as normal]" ["Oh, don't apologise."]
swearing mildly action	1	"[as the parser]Swearing here has no effect.[as normal]" ["Quite."]
swearing obscenely action	1	"[as the parser]Swearing here has no effect.[as normal]" ["Real adventurers do not use such language."]


Section - Less Excited parser

[Some of the default messages end with exclamation points, which can make the parser seem breathless on occasion. Most of these messages are replaced elsewhere, but for the remainder:]

Table of custom library messages (continued)
library-action	library-message-id	library-message-text
--	31	"[as the parser]You seem to have said too little.[as normal]" [This error may possibly be deprecated now, since I can't find where in the library the error type TOOLIT_PE is ever assigned.]
--	32	"[as the parser]You aren't holding that.[as normal]"
--	36	"[as the parser]You excepted something not included anyway.[as normal]"
--	43	"[as the parser]Nothing to do.[as normal]"
wearing action	1	"[as the parser][if noun is a person]You can't normally wear other characters.[otherwise]You can't wear [that-those of noun].[as normal]"
wearing action	2	"[as the parser]You're not holding [that-those of noun].[as normal]"
wearing action	3	"[as the parser]You're already wearing [that-those of noun].[as normal]"

Section - Story, not Game

[Modern terminology prefers calling an IF a story, not a game. This has been adopted in the main I7 structures, but not yet these messages.]

Table of custom library messages (continued)
library-action	library-message-id	library-message-text
requesting the pronoun meanings action	4	"no pronouns are set.[as normal]"
requesting the score action	1	"[if the story has ended]You scored [otherwise]You have so far scored [end if][score] out of a possible [the maximum score], in [turn count] turn[s][ignore library line break]"
requesting the score action	2	"There is no score in this story" [These two messages are not parser-styled for fiddly reasons specified below.]
Verifying the story file action	1	"The story file has verified as intact."
Verifying the story file action	2	"The story file did not verify as intact, and may be corrupt."

Section - Parser-styled action messages

[Here are the remaining messages not replaced already that should be styled as from the parser. Whether a message comes from the parser or the narrator is something of an existential or aesthetic question in some cases: is "But you aren't on the sofa at the moment" a parser objection or a narrator observation? My general rule of thumb here is that the parser deals with commands rejected for logical reasons (as in the prior example), and the narrator with commands rejected for story/character reasons (as well as the successful commands). So "Dropped" or "You hear nothing unexpected" are narrator messages, but "You aren't holding the apple" is a parser message. ]

Table of custom library messages (continued)
library-action	library-message-id	library-message-text
Closing action	1	"[as the parser][Cap That's-They're of noun] not something you can close.[as normal]"
Closing action	2	"[as the parser][Cap That's-They're of noun] already closed.[as normal]"
Dropping action	1	"[as the parser][The noun] [is-are] already here.[as normal]"
Dropping action	2	"[as the parser]You haven't got [that-those of noun].[as normal]"
Entering action	2	"[as the parser][Cap That's-They're of noun] not something you can [quoted verb posture].[as normal]"
Entering action	3	"[as the parser]You can't get into the closed [noun].[as normal]"
Entering action	4	"[as the parser]You can only get into something free-standing.[as normal]"
Exiting action	2	"[as the parser]You can't get out of the closed [library message object].[as normal]"
Getting off action	1	"[as the parser]But you aren't on [the library message object] at the moment.[as normal]"
Giving it to action	1	"[as the parser]You aren't holding [the noun].[as normal]"
Giving it to action	4	"[as the parser][The second noun] [is-are]n't able to receive things.[as normal]"
Going action	7	"[as the parser]You'll have to say which compass direction to go in.[as normal]"
Inserting it into action	1	"[as the parser]You need to be holding [the noun] before you can put [it-them] into something else.[as normal]"
Inserting it into action	2	"[as the parser][Cap That-Those of noun] can't contain things.[as normal]"
Inserting it into action	3	"[as the parser][The second noun] [is-are] closed.[as normal]"
Inserting it into action	4	"[as the parser]You'll need to take [it-them of noun] off first.[as normal]"
Inserting it into action	5	"[as the parser]You can't put something inside itself.[as normal]"
Locking it with action	1	"[as the parser][Cap That-Those of noun] do[es]n't seem to be something you can lock.[as normal]"
Opening action	1	"[as the parser][Cap That's-They're of noun] not something you can open.[as normal]"
Opening action	3	"[as the parser][Cap That's-They're of noun] already open.[as normal]"
Pushing it to action	1	"[as the parser][The noun] cannot be pushed from place to place.[as normal]"
Pushing it to action	2	"[as the parser]That's not a direction.[as normal]"
Putting it on action	1	"[as the parser]You need to be holding [the noun] before you can put [it-them] on top of something else.[as normal]"
Putting it on action	2	"[as the parser]You can't put something on top of itself.[as normal]"
Showing it to action	1	"[as the parser]You aren't holding [the noun].[as normal]"
Switching off action	1	"[as the parser][Cap That's-They're of noun] not something you can switch.[as normal]"
Switching on action	1	"[as the parser][Cap That's-They're of noun] not something you can switch.[as normal]"
Taking action	5	"[as the parser]You already have [that-those of noun].[as normal]"
Taking action	4	"[as the parser]You'd have to get [if noun is a supporter]off[otherwise]out of[end if] [the noun] first.[as normal]"
Taking action	8	"[as the parser][Cap That-Those of library message object] [is-are]n't available.[as normal]"
Unlocking it with action	1	"[as the parser][Cap That-Those of noun] do[es]n't seem to be something you can unlock.[as normal]"


Section - Parser-styled misc messages

Table of custom library messages (continued)
library-action	library-message-id	library-message-text
--	27	"[as the parser]I didn't understand that sentence.[as normal]" 
--	45	"[as the parser]Who do you mean, [ignore library line break]"
--	46	"[as the parser]Which do you mean, [ignore library line break]"
--	56	".[as normal]"
--	57	"?[as normal]"
--	2	"[as the parser]Nothing to do![as normal]"
--	6	"[as the parser]This platform does not provide 'undo'. Sorry![as normal]"
--	7	"[as the parser]You cannot 'undo' any further.[as normal]"
--	8	"[as the parser]Please give one of the answers above.[as normal]"
--	13	"[as the parser]Previous turn undone.[as normal]"
--	20	"[as the parser]To repeat a command like 'frog, jump', just say 'again', not 'frog, again'.[as normal]"
--	22	"[as the parser]You can't begin with a comma.[as normal]"
--	24	"[as the parser]You can't talk to [the library message object].[as normal]"
--	33	"[as the parser]You can't use multiple objects with that verb.[as normal]"
--	34	"[as the parser]You can only use multiple objects once on a line.[as normal]"
--	35	"[as the parser]I'm not sure what '[pronoun dictionary word]' refers to.[as normal]"
--	37	"[as the parser]You can only do that to something animate.[as normal]"
--	38	"[as the parser]That's not a verb I [recogniz]e.[as normal]"
--	39	"[as the parser]That's not something you need to refer to in the course of this game.[as normal]"
--	40	"[as the parser]You can't see '[pronoun dictionary word]' ([pronoun reference object]) at the moment.[as normal]"
--	41	"[as the parser]I didn't understand the way that finished.[as normal]"
--	42	"[as the parser][if library message amount is 0]None[otherwise]Only [library message amount] of those[end if] [is-are] available.[as normal]"
--	47	"[as the parser]Sorry, you can only have one item here. Which exactly?[as normal]"
--	48	"[as the parser]Whom do you want[if the person asked is not the player] [the person asked][end if] to [recap of command]?[as normal]"
--	49	"[as the parser]What do you want[if the person asked is not the player] [the person asked][end if] to [recap of command]?[as normal]"
--	51	"[as the parser]Since something dramatic has happened, your list of commands has been cut short.[as normal]"
--	52	"[line break][as the parser]Type a number from	1	to [library message amount],	0	to redisplay or press ENTER.[as normal]"
--	53	"[line break][as the parser]Please press SPACE.[as normal]"
--	54	"[as the parser]Comment recorded.[as normal]"
--	55	"[as the parser]Comment NOT recorded.[as normal]"
--	58	"[as the parser][The person asked] [is-are] unable to do that.[as normal]"
--	59	"[as the parser]You must supply a noun.[as normal]"
--	60	"[as the parser]You may not supply a noun.[as normal]"
--	61	"[as the parser]You must name an object.[as normal]"
--	62	"[as the parser]You may not name an object.[as normal]"
--	63	"[as the parser]You must name a second object.[as normal]"
--	64	"[as the parser]You may not name a second object.[as normal]"
--	65	"[as the parser]You must supply a second noun.[as normal]"
--	66	"[as the parser]You may not supply a second noun.[as normal]"
--	73	"[as the parser]That noun did not make sense in this context.[as normal]"
--	74	"[as the parser]That command asks to do something outside of play, so it can only make sense from you to me. [The person asked] cannot be asked to do this.[as normal]"


Section - Unreplaced Messages

[Finally, we include all the untouched library messages. This is so we can easily remove all the old versions of the messages to reclaim memory, see below. NOTE: this is disabled in this release, since despite being copied straight from Default Messages some of these errors were producing problems. Hopefully I will have the time to dig into this more in the future; in the meantime, z-authors are free to replace this section and copy and paste the below into their code to experiment.]

[
Table of custom library messages (continued)
library-action	library-message-id	library-message-text
--	1	"(considering the first sixteen objects only)[ignore library line break]"
--	101	" (providing light)"
--	102	" (closed)"
--	103	" (closed and providing light)"
--	104	" (empty)"
--	105	" (empty and providing light)"
--	106	" (closed and empty)"
--	107	" (closed, empty and providing light)"
--	108	" (providing light and being worn"
--	109	" (providing light"
--	110	" (being worn"
--	111	" ("
--	112	"open"
--	113	"open but empty"
--	114	"closed"
--	115	"closed and locked"
--	116	" and empty"
--	117	" (empty)"
--	118	" containing "
--	119	" (on "
--	120	", on top of "
--	121	" (in "
--	122	", inside "
--	17	"It is pitch dark, and you can't see a thing."
--	18	"yourself"
--	26	"(first taking [the noun])[ignore library line break]"
--	3	" You have died [ignore library line break]"
--	4	" You have won [ignore library line break]"
--	5	"Would you like to [ignore library line break]"
--	50	"Your score has just gone [if library message amount > 0]up by [library message amount][otherwise]down by [0 - library message amount][end if] point[s]"
--	68	"([The person asked] first taking [the noun])"
--	69	"(first taking [the noun])"
--	71	"Darkness"
--	75	" The End [ignore library line break]"
--	76	" or "
Closing action	3	"You close [the noun]."
Closing action	4	"[The person asked] close[s] [the noun]."
Closing action	5	"[The noun] close[s]."
Consulting it about action	1	"You discover nothing of interest in [the noun]."
Consulting it about action	2	"[The person asked] look[s] at [the noun]."
Dropping action	3	"(first taking [the noun] off)[ignore library line break]"
Dropping action	4	"Dropped."
Dropping action	5	"There is no more room on [the noun]."
Dropping action	6	"There is no more room in [the noun]."
Dropping action	7	"[The person asked] put[s] down [the noun]."
Eating action	3	"[The person asked] eat[s] [the noun]."
Entering action	5	"You get [if noun is a supporter]onto[otherwise]into[end if] [the noun]."
Entering action	6	"(getting [if the library message object is a supporter]off[otherwise]out of[end if] [the library message object])[ignore library line break]"
Entering action	7	"[if the noun is a supporter](getting onto [the noun])[otherwise if the noun is a container](getting into [the noun])[otherwise](entering [the noun])[end if][ignore library line break]"
Entering action	8	"[The person asked] get[s] into [the noun]."
Entering action	9	"[The person asked] get[s] onto [the noun]."
Examining action	3	"[The noun] [is-are] currently switched [if noun is switched on]on[otherwise]off[end if]."
Examining action	4	"[The person asked] look[s] closely at [the noun]."
Examining action	5	"You see nothing unexpected in that direction."
Exiting action	3	"You get [if library message object is a supporter]off[otherwise]out of[end if] [the library message object]."
Exiting action	4	"But you aren't [if library message object is a supporter]on[otherwise]in[end if] [the library message object]."
Exiting action	5	"[The person asked] get[s] off [the library message object]."
Exiting action	6	"[The person asked] get[s] out of [the library message object]."
Giving it to action	5	"You give [the noun] to [the second noun]."
Giving it to action	6	"[The person asked] give[s] [the noun] to you."
Giving it to action	7	"[The person asked] give[s] [the noun] to [the second noun]."
Going action	1	"You'll have to get [if library message object is a supporter]off[otherwise]out of[end if] [the library message object] first."
Going action	10	"[The person asked] go[es] [noun]"
Going action	11	"[The person asked] arrive[s] from above"
Going action	12	"[The person asked] arrive[s] from below"
Going action	13	"[The person asked] arrive[s] from the [library message object]"
Going action	14	"[The person asked] arrive[s]"
Going action	15	"[The person asked] arrive[s] at [the library message object] from above"
Going action	16	"[The person asked] arrive[s] at [the library message object] from below"
Going action	17	"[The person asked] arrive[s] at [the library message object] from the [second library message object]"
Going action	18	"[The person asked] go[es] through [the library message object]"
Going action	19	"[The person asked] arrive[s] from [the library message object]"
Going action	2	"You can't go that way."
Going action	20	"on [the library message object]"
Going action	21	"in [the library message object]"
Going action	22	", pushing [the library message object] in front, and you along too"
Going action	23	", pushing [the library message object] in front"
Going action	24	", pushing [the library message object] away"
Going action	25	", pushing [the library message object] in"
Going action	26	", taking you along"
Going action	27	"(first getting off [the library message object])[ignore library line break]"
Going action	28	"(first opening [the library message object])[ignore library line break]"
Going action	6	"You can't, since [the library message object] lead[s] nowhere."
Going action	8	"[The person asked] go[es] up"
Going action	9	"[The person asked] go[es] down"
Inserting it into action	10	"[The person asked] put[s] [the noun] into [the second noun]."
Inserting it into action	6	"(first taking [it-them of noun] off)[ignore library line break]"
Inserting it into action	7	"There is no more room in [the noun]."
Inserting it into action	8	"Done."
Inserting it into action	9	"You put [the noun] into [the second noun]."
Listening to action	1	"You hear nothing unexpected."
Locking it with action	2	"[Cap That's-They're of noun] locked at the moment."
Locking it with action	3	"First you'll have to close [the noun]."
Locking it with action	4	"[Cap That-Those of noun] do[es]n't seem to fit the lock."
Locking it with action	5	"You lock [the noun]."
Locking it with action	6	"[The person asked] lock[s] [the noun]."
Looking action	1	" (on [the library message object])[ignore library line break]"
Looking action	2	" (in [the library message object])[ignore library line break]"
Looking action	3	" (as [library message object])[ignore library line break]"
Looking action	4	"On [the library message object] [list the contents of library message object with as a sentence list option + tersely list option + not listing concealed items list option + is-are list option + including contents list option + giving brief inventory information list option + listing marked items only list option]."
Looking action	5	"[if library message object is not the location and library message object is a supporter]On [the library message object] you[otherwise if library message object is not the location and library message object is a container]In [the library message object] you[otherwise]You[end if] can also see [list the contents of library message object with as a sentence list option + tersely list option + not listing concealed items list option + including contents list option + giving brief inventory information list option + listing marked items only list option][if library message object is not the location].[otherwise] here."
Looking action	6	"[if library message object is not the location and library message object is a supporter]On [the library message object] you[otherwise if library message object is not the location and library message object is a container]In [the library message object] you[otherwise]You[end if] can see [list the contents of library message object with as a sentence list option + tersely list option + not listing concealed items list option + including contents list option + giving brief inventory information list option + listing marked items only list option][if library message object is not the location].[otherwise] here."
Looking action	7	"You see nothing unexpected in that direction."
Looking action	8	"[if the library message object is a supporter] (on [otherwise] (in [end if][the library message object])[ignore library line break]"
Looking action	9	"[The person asked] look[s] around."
Looking under action	2	"You find nothing of interest."
Looking under action	3	"[The person asked] look[s] under [the noun]."
Opening action	2	"[Cap It-They of noun] seem[s] to be locked."
Opening action	4	"You open [the noun], revealing [if the number of not undescribed not scenery things in the noun is zero]nothing[otherwise][list the contents of noun with the as a sentence list option + the tersely list option + the not listing concealed items list option][end if]."
Opening action	5	"You open [the noun]."
Opening action	6	"[The person asked] open[s] [the noun]."
Opening action	7	"[The noun] open[s]."
Pulling action	1	"[Cap It-Those of noun] [is-are] fixed in place."
Pulling action	2	"You are unable to."
Pulling action	5	"[The person asked] pull[s] [the noun]."
Pushing action	2	"You are unable to."
Pushing action	6	"[The person asked] push[es] [the noun]."
Putting it on action	5	"(first taking [it-them of noun] off)[ignore library line break]"
Putting it on action	6	"There is no more room on [the noun]."
Putting it on action	7	"Done."
Putting it on action	8	"You put [the noun] on [the second noun]."
Putting it on action	9	"[The person asked] put[s] [the noun] on [the second noun]."
Quitting the game action	1	"Please answer yes or no."
Quitting the game action	2	"Are you sure you want to quit? "
Removing it from action	2	"But [it-they of noun] [is-are]n't there now."
Removing it from action	3	"Removed."
Restarting the game action	1	"Are you sure you want to restart? "
Restarting the game action	2	"Failed."
Restoring the game action	1	"Restore failed."
Restoring the game action	2	"Ok."
Saving the game action	1	"Save failed."
Saving the game action	2	"Ok."
Searching action	2	"There is nothing on [the noun]."
Searching action	3	"On [the noun] [list the contents of noun with as a sentence list option + tersely list option + not listing concealed items list option + is-are list option]."
Searching action	4	"You find nothing of interest."
Searching action	5	"You can't see inside, since [the noun] [is-are] closed."
Searching action	6	"[The noun] [is-are] empty."
Searching action	7	"In [the noun] [list the contents of noun with as a sentence list option + tersely list option + not listing concealed items list option + is-are list option]."
Searching action	8	"[The person asked] search[es] [the noun]."
Smelling action	1	"You smell nothing unexpected."
Squeezing action	3	"[The person asked] squeeze[s] [the noun]."
Switching off action	2	"[Cap That's-They're of noun] already off."
Switching off action	3	"You switch [the noun] off."
Switching off action	4	"[The person asked] switch[es] [the noun] off."
Switching on action	2	"[Cap That's-They're of noun] already on."
Switching on action	3	"You switch [the noun] on."
Switching on action	4	"[The person asked] switch[es] [the noun] on."
Taking action	1	"Taken."
Taking action	12	"You're carrying too many things already."
Taking action	13	"(putting [the library message object] into [the current player's holdall] to make room)[ignore library line break]"
Taking action	14	"You can't reach into [the library message object]."
Taking action	15	"You cannot carry [the library message object]."
Taking action	16	"[The person asked] pick[s] up [the noun]."
Taking action	6	"[Cap That-Those of noun] seem[s] to belong to [the library message object]."
Taking action	7	"[Cap That-Those of noun] seem[s] to be a part of [the library message object]."
Taking action	9	"[The library message object] [is-are]n't open."
Taking inventory action	1	"You are carrying nothing."
Taking inventory action	2	"You are carrying[ignore library line break]"
Taking inventory action	3	":[line break]"
Taking inventory action	4	"."
Taking inventory action	5	"[The person asked] look[s] through [its-their] possessions."
Taking off action	1	"You're not wearing [that-those of noun]."
Taking off action	2	"You take off [the noun]."
Taking off action	3	"[The person asked] takes off [the noun]."
Tasting action	1	"You taste nothing unexpected."
Touching action	2	"You feel nothing unexpected."
Touching action	4	"[The person asked] touch[es] [it-them of noun]self."
Touching action	5	"[The person asked] touch[es] you."
Touching action	6	"[The person asked] touch[es] [the noun]."
Turning action	1	"[Cap It-Those of noun] [is-are] fixed in place."
Turning action	2	"You are unable to."
Turning action	7	"[The person asked] turn[s] [the noun]."
Unlocking it with action	2	"[Cap That's-They're of noun] unlocked at the moment."
Unlocking it with action	3	"[Cap That-Those of second noun] do[es]n't seem to fit the lock."
Unlocking it with action	4	"You unlock [the noun]."
Unlocking it with action	5	"[The person asked] unlock[s] [the noun]."
Waiting action	1	"Time passes."
Waiting action	2	"[The person asked] wait[s]."
Waving action	1	"But you aren't holding [that-those of noun]."
Waving action	3	"[The person asked] wave[s] [the noun]."
Wearing action	4	"You put on [the noun]."
Wearing action	5	"[The person asked] put[s] on [the noun]."
preferring abbreviated room descriptions action	1	" is now in its 'superbrief' mode, which always gives short descriptions of locations (even if you haven't been there before)."
preferring sometimes abbreviated room descriptions action	1	" is now in its normal 'brief' printing mode, which gives long descriptions of places never before visited and short descriptions otherwise."
preferring unabbreviated room descriptions action	1	" is now in its 'verbose' mode, which always gives long descriptions of locations (even if you've been there before)."
requesting the pronoun meanings action	1	"At the moment, "
requesting the pronoun meanings action	2	"means "
requesting the pronoun meanings action	3	"is unset"
requesting the pronoun meanings action	5	"." [Note: while this looks reassuring, the Standard Rules do not actually use this to end the line.]
requesting the score action	3	", earning you the rank of "
switching score notification off action	1	"Score notification off."
switching score notification on action	1	"Score notification on."
switching the story transcript off action	1	"Transcripting is already off."
switching the story transcript off action	2	"[line break]End of transcript."
switching the story transcript off action	3	"Attempt to end transcript failed."
switching the story transcript on action	1	"Transcripting is already on."
switching the story transcript on action	2	"Start of a transcript of"
switching the story transcript on action	3	"Attempt to begin transcript failed."

Section - player's holdall

The current player's holdall is a player's holdall that varies.
The current player's holdall variable translates into I6 as "SACK_OBJECT".

Section - List the Contents of Something, with added options

To say list the contents of (X - object) with (N - number): (- WriteListFrom(child({X}), {N}); -) .
The as a sentence list option is a number that varies. The as a sentence list option variable translates into I6 as "ENGLISH_BIT".
The tersely list option is a number that varies. The tersely list option variable translates into I6 as "TERSE_BIT".
The is-are list option is a number that varies. The is-are list option variable translates into I6 as "ISARE_BIT".
The suppressing all articles list option is a number that varies. The suppressing all articles list option variable translates into I6 as "NOARTICLE_BIT".
The using the definite article list option is a number that varies. The using the definite article list option variable translates into I6 as "DEFART_BIT".
The capitalise first article list option is a number that varies. The capitalise first article list option variable translates into I6 as "CFIRSTART_BIT".
With newlines list option is a number that varies. The with newlines list option variable translates into I6 as "NEWLINE_BIT".
The indented list option is a number that varies. The indented list option variable translates into I6 as "INDENT_BIT".
With extra indentation list option is a number that varies. The with extra indentation list option variable translates into I6 as "EXTRAINDENT_BIT".
The giving brief inventory information list option is a number that varies. The giving brief inventory information list option variable translates into I6 as "PARTINV_BIT".
The giving inventory information list option is a number that varies. The giving inventory information list option variable translates into I6 as "FULLINV_BIT".
The including contents list option is a number that varies. The including contents list option variable translates into I6 as "RECURSE_BIT".
The including all contents list option is a number that varies. The including all contents list option variable translates into I6 as "ALWAYS_BIT".
The not listing concealed items list option is a number that varies. The not listing concealed items list option variable translates into I6 as "CONCEAL_BIT".
The listing marked items only list option is a number that varies. The listing marked items only list option variable translates into I6 as "WORKFLAG_BIT".

Section - Delist original library messages

Include (- [ LanguageLM; #ifdef DEBUG; print "{ "; if (lm_act == ##Miscellany or ##ListMiscellany) print "library message"; else print (SayActionName) lm_act, " action"; print " #", lm_n, " }"; #endif; ]; -) instead of "Long Texts" in "Language.i6t".

]

Chapter - Hacks

Section - Fixing the Score

[As an exercise in masochism, we roll up our sleeves for the unpleasant plumbing involved in making the score command be styled correctly. Since the standard rules hard-code printing a period and line break into the obscure PrintRank routine, of all places, we have to do some ugly trickery to make this work.]

[Note: Technically, "verifying the story file" and "requesting the pronoun meanings" need a similar enema, but in lieu of an army of clones who don't mind doing difficult work for almost zero benefit I've chosen to simply leave those messages unstyled for now.]

[Further note: SAVE, TRANSCRIPT, UNDO are also tricky to fix, but since it's not safe to change the display style during these commands since they can have drastic changes on turn order etc., we feel better about leaving these messages unstyled as well.]

To #if ranking table is active: (- #ifdef RANKING_TABLE; -). 
To #PrintRank: (- PrintRank(); -).
To #if not: (- #Ifnot; -).
To #end if: (- #endif; -). 

The Neutral Library Messages announce the score rule is listed instead of the announce the score rule in the carry out requesting the score rulebook.

This is the Neutral Library Messages announce the score rule:
	if actor is the player:
		repeat through the table of custom library messages in reverse order:
			if there is a library-action entry and the library-action entry is the requesting the score action:
				if the no scoring option is active and the library-message-id entry is 2:
					parser say "[the library-message-text entry].";
					stop;
				otherwise if the no scoring option is not active and the library-message-id entry is 1:
					#if ranking table is active;
					say the library-message-text entry;
					#PrintRank;
					#if not;
					parser say "[the library-message-text entry].";
					#end if;
					stop;
	follow the announce the score rule. [Fallback to normal behavior if these messages are omitted from the table, for some reason.]
	
Section - Fixing Other Miscellaneous Messages

[Happily, it's a little easier to replace some of the other messages that print unusual information within themselves and thus can't be replaced via the normal mechanisms.]

The Neutral Library Messages report preferring abbreviated room descriptions rule is listed instead of the standard report preferring abbreviated room descriptions rule in the report preferring abbreviated room descriptions rulebook.

This is the Neutral Library Messages report preferring abbreviated room descriptions rule: if actor is the player, parser say "[story title] is now in its 'superbrief'  mode, which always gives short descriptions of locations (even if you haven't been there before)."

The Neutral Library Messages report preferring unabbreviated room descriptions rule is listed instead of the standard report preferring unabbreviated room descriptions rule in the report preferring unabbreviated room descriptions rulebook.

This is the Neutral Library Messages report preferring unabbreviated room descriptions rule: if actor is the player, parser say "[story title] is now in its normal 'verbose'  mode, which always gives long descriptions of locations (even if you've been there before)."

The Neutral Library Messages report preferring sometimes abbreviated room descriptions rule is listed instead of the standard report preferring sometimes abbreviated room descriptions rule in the report preferring sometimes abbreviated room descriptions rulebook.

This is the Neutral Library Messages report preferring sometimes abbreviated room descriptions rule: if actor is the player, parser say "[story title] is now in its 'brief' printing mode, which gives long descriptions of places never before visited and short descriptions otherwise."


Section - Player Description (in place of Section SR1/11 - People in Standard Rules by Graham Nelson) 

[Authors can easily override the description of the player, but extension authors can't without tromping on the final author's ability to (since you can't have two "usually" or two "is" lines). Bother. The only line changed in this block is the description of yourself property. ]

The specification of person is "Despite the name, not necessarily
a human being, but anything animate enough to envisage having a
conversation with, or bartering with."

A person can be female or male. A person is usually male.
A person can be neuter. A person is usually not neuter.

A person has a number called carrying capacity.
The carrying capacity of a person is usually 100.

Include (-
	has transparent animate
	with before NULL,
-) when defining a person.

The yourself is an undescribed person. The yourself is proper-named.

The description of yourself is usually "You see nothing unexpected about yourself." ["As good-looking as ever."]

The yourself object translates into I6 as "selfobj".
Include (-
	with saved_short_name "yourself",
 -) when defining yourself.


Section - Only as far as

[We want to be careful about using something like "the quoted verb" here, because we might get a message like "I expect you wanted to i."]

For printing a parser error when the latest parser error is the only understood as far as error (this is the Neutral Library Messages understood as far as rule):
	parser say "I can't understand your entire command: the first part might be an action I know, but I don't know the word '[misunderstood word]'." 
	
For printing a parser error when the latest parser error is the only understood as far as error and the misunderstood word is known elsewhere (this is the Neutral Library Messages understood as far as supplemental rule):
	parser say "I can't understand your entire command: the first part might be an action I know, but I didn't expect the word '[misunderstood word]' next." 
	

Chapter - Misc Helpers 

Section - British/American Spellings (for use without Keyword Interface by Aaron Reed)

To say recogniz: if the American dialect option is active, say "recogniz"; else say "recognis". 


Section - Extensions to Plurality

To say that-them of (item - a thing):   
    now the prior named noun is the item;
	mark prior named noun in output;
    if the item acts plural
    begin;
    	say "them"; 
    otherwise if the item is the player;
		 say "yourself";
	otherwise if the item is male and item is not neuter;
   		say "him";
    otherwise if the item is female and item is not neuter;
    	say "her";
    otherwise; 
    	say "that";
    end if.

To say Cap That's-They're of (item - a thing):   
    now the prior named noun is the item;
	mark prior named noun in output;
    if the item acts plural
    begin;
    	say "They're"; 
    otherwise if the item is the player;
		 say "You're";
	otherwise if the item is male and item is not neuter;
   		say "He's";
    otherwise if the item is female and item is not neuter;
    	say "She's";
    otherwise; 
    	say "That's";
    end if.

To say Cap It-Those of (item - a thing):   
    now the prior named noun is the item;
	mark prior named noun in output;
    if the item acts plural
    begin;
    	say "Those"; 
    otherwise if the item is the player;
		 say "You";
	otherwise if the item is male and item is not neuter;
   		say "He";
    otherwise if the item is female and item is not neuter;
    	say "She";
    otherwise; 
    	say "It";
    end if.

Section - Posture

To decide which text is (quoted word - a snippet) posture:
     if the quoted word matches "stand", decide on "stand on";
     if the quoted word matches "sit", decide on "sit down on";
     if the quoted word matches "lie", decide on "lie down on";
     otherwise decide on "enter".


Chapter - Parser Style

Section - Parser Speak (for use without Keyword Interface by Aaron Reed)

To say as the parser: say "[italic type][bracket]".
To say as normal: say "[close bracket][roman type]".

Section - Parser Say

[This gets around an issue with line breaks after periods, and is the best way for authors to invoke the parser style in their own text.]

To parser say (txt - an indexed text):
	say "[as the parser][txt][run paragraph on][as normal][line break]".

Chapter - Utility Functions
	
To decide which snippet is the misunderstood word: 
	(- (((wn - 1) * 100) + 1) -).

To decide if the misunderstood word is known elsewhere: 
	(- (wn--, NextWord() ~= 0) -).

To decide which snippet is the quoted verb:
	(- ((verb_wordnum * 100) + 1) -) .

To decide what number is position of non-dictionary word:
	(- (FindUnknownWordToken(2)) -).

[To decide which snippet is what was misunderstood: 
	(- (((wn - 1) * 100) + (WordCount() - 2)) -).]
	
[To say show matched action: (- show_matched_action(); -).]



Include (-
[ show_matched_action m;
	for (m=0 : m<32 : m++) pattern-->m = pattern2-->m;
	pcount = pcount2;
	PrintCommand(0);
];
-).

[Code from Unknown Word Error by Neil. Thanks!!]

Include (-
[ FindUnknownWordToken wordnum     w twn numwds;
	#ifdef TARGET_GLULX;
	numwds = parse-->0;
	#ifnot;
	numwds = parse->1;
	#endif; ! TARGET_GLULX;
	! Throw out invalid word numbers
	if (wordnum <= 0 || wordnum > numwds) rfalse;
	twn=wn; ! save the value of wn so it can be restored
	wn=wordnum;
	while (1) {
		w=NextWordStopped();
		if (w == -1) { wn=twn; rfalse; }
		if (w == 0 && TryNumber(wn-1) == -1000) {
			wordnum=wn-1;
			wn=twn;
			return wordnum; 
		}
	}
];
-)


Neutral Library Messages ends here.

---- DOCUMENTATION ----

Every Inform project contains dozens of sentences of text not written by the project's author, which explain the results of actions or refuse to carry out commands that aren't understood or that contradict the world model. The default set of these library messages, which have accumulated like barnacles on the interactive fiction community since its maiden voyages in the 1970s, contains many misleading, distracting, or unhelpful texts that experienced players see past but newcomers stumble over. This extension replaces the worst offenders with more neutral or helpful variations.

Simply including the extension is all that is necessary. Read on only if you're interested in the gory details.

Section: Rationale

The main complaints levied against the standard library messages are:

	They sometimes imply a certain tone of wry amusement which descends from the Infocom/text adventure era, and which is not always appropriate to modern works of IF.
	
	There is not a clear distinction between messages narrating story world events and those giving parser refusals, leading to a muddying of the difference between the author's voice and the default system messages.
	
	Error messages often do not contain information instructing players how to better restate their command.
	
	They can sometimes contradict the story world, as in the assumption "That's plainly inedible," or mislead the player about a course of action, as in "This dangerous act would achieve little."
	
	Inconsistencies in style, such as whether command examples are given in CAPS or 'quotes', or which messages are wrapped in square brackets and what that signifies.

The extension attempts to address all of these concerns as much as possible. Jokes or insults have been replaced by more neutral messages. Out-of-world messages are given a unique visual style (in a way compatible with the Keyword Interface extension, which allows players to adjust this style). Many error messages have been rephrased to more clearly state what confused the parser or instruct the player towards a better command to try. Messages that make assumptions about the player's intentions or the world model have been softened so as not to appear incongruous with the story. And all command examples are now given in 'quote' format, with all parser messages wrapped in brackets (by default).

Section: Parser versus Narrator

Whether a message comes from the parser or the narrator is something of an existential or aesthetic question in some cases: is "But you aren't on the sofa at the moment" a parser objection or a narrator observation? My general rule of thumb is that the parser deals with anything out of world, including commands rejected for logical reasons (as above), and the narrator with commands rejected for story/character reasons (as well as, of course the successful commands). So "Dropped" or "You hear nothing unexpected" are narrator messages, but "You aren't holding the apple" is a parser message.

Section: Overriding Messages

This extension is based on Default Messages by Ron Newcomb, and all the parser messages it changes can be further changed by authors in the same manner as with that extension. You need to continue the Table of Custom Library Messages, like this:

	Table of custom library messages (continued)
	library-action	library-message-id	library-message-text
	--	21	"[as the parser]There's nothing to repeat![as normal]" 
	dropping action	4	"Okay, you drop it."

Messages from the parser should be wrapped in the [as the parser] and [as normal] tags, as seen in the first line above. Messages from the narrator can omit these tags.

The best way to determine the action and number of a message is to open the extension and search for a few consecutive words in the text. (Keep in mind some words like "You" or "their" may be procedurally generated and thus not searchable.) Doing so will also demonstrate the say statements needed to appropriate generate the right text (such as [Cap That's-They're noun], which prints "That's" or "They're" based on whether the noun in question is singular or plural).
 
Section: You can't see...

The message "You can't see any such thing." is traditionally printed in several circumstances, which NLM splits into distinct messages. The most controversial split is that the extension explicitly tells the player if a word they typed is not in the story's dictionary. The classic argument against this, that sneaky players can use it to figure out the existence of yet-unseen objects, seems less relevant today than it did when puzzles comprised most IF content (not to mention having something of a nanny-state quality, like a novelist hovering around ensuring readers don't flip ahead and see IMPORTANT NOUNS they aren't supposed to know about yet). Perhaps a more relevant objection is that messages of this sort can make the parser seem primitive ("I don't know the word 'love.'")

I believe the benefit to players of knowing that a command didn't work because a certain word isn't important (rather than wondering if it's just not in scope, or they misspelled it, or they typed it in the wrong spot in the grammar line) outweighs these concerns, and I've attempted to make the message prescriptive rather than expository: "You don't need to use the word 'love' in that way." However, if you'd like to restore the traditional behavior, you can do so with:

	Use traditional can't see any such thing.

Section: Parser style

By default, parser messages are styled in italics and wrapped in brackets. To override this, use code like the following:

	To say as the parser: say "[bold type]The parser says: '".
	To say as normal: say "'[roman type]".
	
These say statements may be used in your own text to style parser messages, but due to issues with line breaks, a better alternative is using the safe phrase "parser say":

	Instead of getting ye flask: parser say "Thorns are deprecated; use 'th'."

If you don't want parser messages to be styled differently from other library messages:

	To say as the parser: do nothing.
	To say as normal: do nothing.

Example: * The Ringer - An array of different types of messages, both from the parser and the narrator.

	*: "The Ringer"

	Include Neutral Library Messages by Aaron Reed.

	To say as the parser: say "<<".
	To say as normal: say ">>".

	Stage is a room. A big cat and a small cat and a bat are in Stage. A platform is an enterable supporter in Stage. A box is a closed openable container on platform. In the box is an apple. The player wears an ascot.

	Check singing when player does not hold platform: instead parser say "You can't sing in this extension demo!".
	Before jumping when player is on platform: say "Before jumping, you stop and think about something.".
	Before sleeping when player is on platform: say "You can't."; parser say "You might try MOVE or TILT."
	Before listening when player is on platform: parser say "That's totally impossible."; say "But you do it anyway."

	test me with "get bat / jump / get cat / big / wait / oops / listen to platform now / get on platform / look / remove all from cat / eat platform / open box / eat apple / g / take / bat / drop all but rat / drop all but bat / drop all but / sing / jump / sleep / listen / examine cat and rat / drop ascot / score". 

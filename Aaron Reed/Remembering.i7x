Version 8/110322 of Remembering by Aaron Reed begins here.

"Replaces 'You can't see any such thing' for a seen but out-of-scope noun with a message acknowledging that the parser recognizes the object. With Glulx, also keeps track of where the player last saw that object."

[Changelog:
 -- Version 8: Made reporting remembered locations into an activity.
 -- Version 7: updated rule names to be consistent
 -- Version 6: Added second example; Updated for Player Experience Upgrade compatibility; altered disambiguation rejection message to be more helpful; updated the default reference to a prior location to stop pretending it can generate natural-sounding English with the wide variety of possible room names; removed broken code trying to skip a disambiguation question. 
 -- Version 5: Included all grammar lines for examine, get, and drop. Understand "look for" or "find" something.
 -- Version 4: Updated to use no deprecated features
 -- Version 3: Updated for build 6859

]

Chapter - Compatibility

Section - Inclusions

Include Version 6 of Epistemology by Eric Eve. Include Version 8 of Plurality by Emily Short. 

Section - Parser Speak (for use without Keyword Interface by Aaron Reed)

To say as the parser: do nothing. To say as normal: do nothing.

Chapter - Responses

Table of Remembering Messages
rule name	message
Remembering generic report remembering rule	"[as the parser]You can't see [the noun] any more.[as normal][line break]"
Remembering don't disambiguate while remembering rule	"[as the parser]That's not something you can see now.[as normal][line break]"

To say was-were: if noun acts plural, say "were"; otherwise say "was".


Chapter - Remembering Main

Section - Grammar Line

[Future: any way to make this work for any reference to an object?]

Understand
"examine [any seen thing]" or
"x [any seen thing]" or
"look at/for [any seen thing]" or
"take [any seen thing]" or
"get [any seen thing]" or
"pick up [any seen thing]" or
"pick [any seen thing] up" or
"drop [any seen thing]" or
"put down [any seen thing]" or
"put [any seen thing] down" or
"drop [any seen thing] away" or
"drop away [any seen thing]" or
"find [any seen thing]" or
"where is/are [any seen thing]" as remembering.

Section - The Remembering Action

Remembering is an action applying to one thing.

The allow remembering faraway things rule is listed instead of the basic accessibility rule in the action-processing rules.

This is the allow remembering faraway things rule:
	unless remembering, abide by the basic accessibility rule.

Report remembering (this is the Remembering generic report remembering rule): say the message corresponding to a rule name of Remembering generic report remembering rule in Table of Remembering Messages.

Chapter - Fixes

Section - Fix in this context message

[ Since we've used an "any" grammar token, we'll get the "That noun did not make sense in that context." message for any unrecognized word or not visible noun. Restore this to the normal behavior. Note: if your game features other uses of "any" tokens, you'll need to replace this rule. ]

Rule for printing a parser error when the latest parser error is the noun did not make sense in that context error (this is the Remembering replace did not make sense in that context rule):
	now the latest parser error is the can't see any such thing error;
	make no decision.

Section - Avoiding Disambiguation

 [In practice, it doesn't really matter which of several unavailable items the player was referring to; it's quite annoying to be asked which one you meant and then told it isn't there anyway. Unfortunately, there's no easy way to bypass the disambiguation process since it's hard-coded into the Inform 6 templates. Here we do a trick, simply printing a refusal message instead of the disambiguation question. This mostly works, EXCEPT if the player tries to type a direction word: since directions aren't understood as verbs, the parser tries to insert the command into the misunderstood line, leading to "You can't see any such thing."]

Rule for asking which do you mean while remembering (this is the Remembering don't disambiguate while remembering rule): say the message corresponding to a rule name of Remembering don't disambiguate while remembering rule in Table of Remembering Messages.


Chapter - Keeping Track (for Glulx only)

Section - The Remembered Location

Every thing has an object called the remembered location. The remembered location of a thing is usually nothing.

Section - Rules

Last when play begins (this is the Remembering update remembered positions for first turn rule):
	follow the Remembering update remembered positions of things rule.

Every turn (this is the Remembering update remembered positions of things rule):
	unless in darkness:
		repeat with item running through things that are enclosed by the location:
			if remembered location of item is not holder of item:
				if item is visible:
					now the remembered location of item is the holder of item.

First report remembering (this is the Remembering specific report remembering rule):
	if remembered location of noun is nothing, continue the action;
	say the message corresponding to a rule name of Remembering specific report remembering rule in Table of Remembering Messages;
	stop the action. 
	
Section - The Message
		
Table of Remembering Messages (continued)
rule name	message
Remembering specific report remembering rule	"[as the parser]The last time you saw [the noun], [it-they of noun] [was-were] [at the remembered location of noun].[as normal][line break]"

To say at the (place - an object):
	carry out the saying the location name activity with place.

Section - The Activity
	
saying the location name of something is an activity on objects.

For saying the location name of a room (this is the Remembering saying room name rule): say "at '[the item described]'".

For saying the location name of the location (this is the Remembering saying current location name rule): say "right here".

For saying the location name of a person (this is the Remembering saying person name rule): say "in the possession of [the item described]".

For saying the location name of a person who is the player (this is the Remembering saying player name rule): say "in your possession".

For saying the location name of a container (this is the Remembering saying container name rule): say "in [the item described]".

For saying the location name of a supporter (this is the Remembering saying supporter name rule): say "on [the item described]".


Remembering ends here.

---- DOCUMENTATION ----

The parser message "You can't see any such thing." is used both when the player types a noun the game does not understand, and when he types one that is not currently visible. This extension replaces the message in the latter case (if the player knows about the object in question) with a message acknowledging that the game knows that object exists. In Glulx games, the extension also tracks where each object was last seen and shares that info with the player.

We do this with a new internal verb, "to remember," which is triggered by any attempt to examine, take, or drop a "seen" but not visible noun. ("Seen" is defined in the required Epistemology by Eric Eve extension; Plurality by Emily Short is also required for reporting.) 

Disambiguation questions during remembering are usually fairly pointless, since the command isn't going to succeed anyway. We replace them with a generic "You can't see that" style message that doesn't reference a specific noun. If you *do* want to ask disambiguation questions while remembering, add the following line to your code:

	The don't disambiguate while remembering rule is not listed in any rulebook.

In Glulx games, the message additionally reports the last thing the player witnessed enclosing the item, be it a room, supporter/container, or person. To describe the parent of the remembered item, a new activity is provided called "saying the location name of something". Rooms, for instance, are by default described like "at 'Stage'" (since it's difficult to know whether authors have given their rooms names that will make sense in a natural-language sentence). You can override this for specific rooms by creating a more specific rule:

	For saying the location name of Stage: say "on the main stage".
	
...or for all rooms by replacing the original rule:

	The Remembering saying room name rule is not listed in the for saying the location name rulebook.
	
	For saying the location name of a room: say "in [the item described]".
	
You could also (for instance) make rules to describe items remembered to be in the possession of certain groups of people:

	For saying the location name of a person who is a thief: say "pilfered by [the item described]".
	
(See the Rules tab of the Index pane or the final section of the extension itself for a list of the built-in rules.)

All other text generated by the extension is listed in the Table of Remembering Messages: to overwrite this, amend this table with a "rule name" of the rule whose text you want to change, and a "message" of the next text. (See "Table Amendments" in the docs and the "Responses" section in this extension for more information.)

Note: this functionality should work for most games, but assumes that the player character does not change, that time is sequential over the course of the game, and that the player does not observe objects moving in unusual ways (such as during a cut scene). If any of these assumptions are incorrect for your game, you'll need to replace or adjust this chapter.

A final note: if your game makes use of "any" tokens in your Understand lines, you may want to replace the "Remembering replace did not make sense in that context" rule with one that works for your game. (This rule ensures that the "You can't see any such thing" message is still printed for unrecognized words, or nouns which haven't been encountered yet.)

Example: * Memory Lane - A simple example.

	*: "Memory Lane" 

	Include Remembering by Aaron Reed.

	l964 is a room. A 7-inch reel of tape is in l964. The Ghost of Audio Mediums Future is a man in l964. "A hooded figure, the Ghost of Audio Mediums Future, beckons forward into a cellophane-shrouded future." Understand "forward" or "future" as north. Understand "back" or "past" as south.

	North of l964 is l975. Some eight-track tapes are in l975. l980 is north of l975. A double album is in l980. l986 is north of l980. Some cassette tapes are in l986. l991 is north of l986. A compact disc is in l991. l999 is north of l991. Some Napstered MP3s are in l999. Circa 2006 is north of l999. The printed name of Circa 2006 is "2006". An iPod Nano is in Circa 2006.
   
	Test me with "future / x reel / future / x tapes / x ghost / future / future / x tapes".

	Section - Remembering Room Names (for Glulx only)

	The Remembering saying room name rule is not listed in any rulebook. For saying the location name of a room (this is the new saying room name rule): say "in [the item described]".

Example: * A Happening - A more confusing example testing the more complex Glulx reporting capabilities.

	*: "A Happening"

	Include Remembering by Aaron Reed.
	
	A room called Southwest Corner is south of a room called Northwest Corner. A room called Northeast Corner is east of Northwest Corner and north of Southeast Corner. Southeast Corner is east of Southwest Corner. 
	
	Alice and Diana are women in Northwest Corner. Bob, Carl, and Earl are men in Southeast Corner. The pedestal is a fixed in place supporter in Northwest Corner. On the pedestal is an open transparent container called the glass bowl. The miniature train is an enterable vehicle in Southeast Corner. A birdcage, a jar of marmalade, and a mitten are in Northeast Corner. The birdcage is an openable closed transparent container. In the birdcage is a rosary. A weather vane, a jar of peanut butter, and a croquet mallet are in Southwest Corner.
	
	Every turn:
		repeat with char running through people who are not the player:
			let decision be a random number between 1 and 3;
			if decision is 1:
				let item be a random portable thing enclosed by location of char;
				if item is a thing and char can see item:
					if item is openable and item is closed and a random chance of 2 in 3 succeeds:
						try char opening item;
					otherwise if item is openable and item is open and a random chance of 2 in 3 succeeds:
						try char closing item;
					try char taking item;
				otherwise:
					now decision is 2;
			if decision is 2:
				let item be a random thing held by char;
				if item is a thing:
					let resting place be a random supporter enclosed by location of char;
					if resting place is a supporter and char can see resting place:
						try char putting item on resting place;
					otherwise:
						now resting place is a random open container enclosed by location of char;
						if resting place is a container and char can see resting place:
							try char inserting item into resting place;
						otherwise: 
							try char dropping item;
				otherwise:
					now decision is 3;
			if decision is 3:
				if char is not enclosed by a vehicle and char can see a vehicle (called conveyance) which does not enclose a person who is not the player:
					try char entering conveyance;
				otherwise if char is enclosed by a vehicle and a random chance of 1 in 2 succeeds:
					try char exiting;
				let current space be location of char;
				let next space be a random room which is adjacent to current space;
				let way be best route from current space to next space;
				try char going way.
				
	Test me with "n / z / e / z / s / z / w / x bowl / x marmalade / x mitten / x bob / x rosary / x diana"
	
	Section - Better descriptions (for Glulx only)

	First for saying the location name of a container: say "fancifully situated within [the item described]".

	First for saying the location name of a supporter: say "positioned rather artistically atop [the item described]".

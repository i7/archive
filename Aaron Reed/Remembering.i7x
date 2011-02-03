Version 3 of Remembering by Aaron Reed begins here.

"Replaces 'You can't see any such thing' with a message reminding the player where they last saw the item they're trying to interact with."

[Changelog:
 -- Version 3: Updated for build 6859

]

[Bug: trying to go a direction after a remembering disambiguation q isn't understood, because the directions aren't understood as verbs, so Inform tries to insert the command into the misunderstood line.]


Section - Inclusions

Include Epistemology by Eric Eve. Include Plurality by Emily Short. To say was-were: if noun acts plural, say "were"; otherwise say "was".

Section - Grammar Line

Understand "examine [any seen thing]" or "x [any seen thing]" or "look at [any seen thing]" or "take [any seen thing]" or "get [any seen thing]" or "drop [any seen thing]" as remembering.

Section - The Remembering Action

Remembering is an action applying to one thing.

A procedural rule while remembering (this is the allow remembering faraway things rule): ignore the basic accessibility rule.

The remembering action has a room called the remembered spot.

Carry out remembering:
	if noun is a person:
		if there is a character of noun in Table of Remembered NPC Locations:
			change the remembered spot to the area corresponding to a character of noun in Table of Remembered NPC Locations;
	otherwise:
		change the remembered spot to location of noun.

Report remembering:     
	if the remembered spot is a room:
		say "The last time you saw [it-them of noun], [the noun] [was-were] [if remembered spot is location]right here[otherwise][remembered spot][end if].";
	otherwise:
		say "You aren't sure where [the noun] [is-are] at the moment.".

Rule for printing the name of a room (called area) while remembering (this is the printing the name of a room while remembering rule): say "at [the printed name of area]".

[ Since we've used an "any" grammar token, we'll get the "That noun did not make sense in that context." message for any unrecognized word or not visible noun. Restore this to the normal behavior. Note: if your game features other uses of "any" tokens, you'll need to replace this rule. ]

Rule for printing a parser error when the latest parser error is the noun did not make sense in that context error (this is the replace did not make sense in that context rule):
	say "You can't see any such thing."

Section - Avoiding Disambiguation

 [In practice, it doesn't really matter which of several unavailable items the player was referring to; it's quite annoying to be asked which one you meant and then told it isn't there anyway. Since the parser expects the next move after asking a disambiguation question to be a response, we silently perform an invisible action before returning control to the player.] 

Rule for asking which do you mean while remembering (this is the don't disambiguate while remembering rule):
	say "You can't see that any more.";
	now skip-command is true.
 
skip-command is a truth state that varies.

Rule for reading a command when skip-command is true (this is the prevent remembering disambiguation problems rule):
	now skip-command is false;
	change the text of the player's command to "do#nothing".
	
Doing-nothing is an action out of world applying to nothing. Understand "do#nothing" as doing-nothing. Carry out doing-nothing: do nothing.  

Section - People and Animals

Definition: a person is nonplayer if it is not the player.

Every turn when at least one nonplayer person is visible (this is the note position of remembered people rule):
	repeat with chap running through visible nonplayer persons:
		if there is a character of chap in Table of Remembered NPC Locations:
			choose row with a character of chap in Table of Remembered NPC Locations;
			change area entry to location;
		otherwise:
			if the number of blank rows in Table of Remembered NPC Locations is at least 1:
				choose a blank row in Table of Remembered NPC Locations;
				change character entry to chap;
				change area entry to location.

Table of Remembered NPC Locations
character	area
a person		a room
with 20 blank rows.

Remembering ends here.

---- DOCUMENTATION ----

The parser message "You can't see any such thing." is used both when the player types a noun the game does not understand, and when he types one that is not currently visible. This extension replaces the message in the latter case (if the player has seen the object in question) with a more intelligent-seeming reminder of where it is.

We do this with a new internal verb, "to remember," which is triggered by any attempt to examine, take, or drop a "seen" but not visible noun. ("Seen" is defined in the required Epistemology by Eric Eve extension; the built-in Plurality by Emily Short is also required for reporting.) 

We keep track of where people and animals were last seen, since they are prone to moving around. For other types of items, however, we assume they aren't mobile and just print their current location.

In most cases, disambiguation questions during remembering are fairly pointless, since the command isn't going to succeed anyway. By default, they are disabled, and "You can't see that any more." is printed. If you *do* want to ask disambiguation questions while remembering, add the following line to your code:

	The don't disambiguate while remembering rule is not listed in any rulebook.

To print the name of a room, the extension will by default say "at [the printed name of the room]". You can override this for all rooms or specific rooms only like so:

	The printing the name of a room while remembering rule is not listed in any rulebook. Rule for printing the name of a room (called area) while remembering: say "in the vicinity of [printed name of area]".

	Rule for printing the name of The Stage while remembering: say "on the main stage".

To change the wording of the messages themselves, you'll need to replace the Report remembering rule (for normal messages), or the don't disambiguate while remembering rule (for a refusal to disambiguate). View the extension source code to see how these rules should be structured.

A final note: if your game makes use of "any" tokens in your Understand lines, you'll probably want to swap out the "replace did not make sense in that context" rule for one which works for your game. (This ensures that "You can't see any such thing" is still printed for unrecognized words, or nouns which haven't been encountered yet.)

Example: * Memory Lane - A simple example.

	*: "Memory Lane" 

	Include Remembering by Aaron Reed.

	l964 is a room. A 7-inch reel of tape is in l964. The Ghost of Audio Mediums Future is a man in l964. "A hooded figure, the Ghost of Audio Mediums Future, beckons forward into a cellophane-shrouded future." Understand "forward" or "future" as north. Understand "back" or "past" as south.

	North of l964 is l975. Some eight-track tapes are in l975. l980 is north of l975. A double album is in l980. l986 is north of l980. Some cassette tapes are in l986. l991 is north of l986. A compact disc is in l991. l999 is north of l991. Some Napstered MP3s are in l999. Circa 2006 is north of l999. The printed name of Circa 2006 is "2006". An iPod Nano is in Circa 2006.
   
	The printing the name of a room while remembering rule is not listed in any rulebook. Rule for printing the name of a room (called area) while remembering: say "in [printed name of area]".  

	Test me with "future / x reel / future / x tapes / x ghost / future / future / x tapes".

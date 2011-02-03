Player-Character Requires Persuasion by Ron Newcomb begins here.

"The Persuasion rules will be consulted for the player-character.  Intended for works in which the author does not wish to conflate the player with the player-character."

Last persuasion rule for looking (this is the always allow looking rule): rule succeeds.

Last Persuasion rule for doing something except looking (this is the default PC behavior rule): say "[italic type]I have better things to do[roman type]." instead. 

The all actions require persuasion rule is listed instead of the requested actions require persuasion rule in the action-processing rulebook.

The all actions require persuasion rule translates into I6 as "PC_REQUIRES_PERSUASION".

Include (-
[ PC_REQUIRES_PERSUASION;
	if ((actor == player) || (act_requester)) { 
		@push say__p; 
		say__p = 0; 
		ProcessRulebook(PERSUADE_RB); 
		if (RulebookSucceeded() == false) { 
			if (say__p == FALSE) L__M(##Miscellany, 72, actor); 
			RulebookFails(); rtrue; 
		} 
		@pull say__p; 
	} 
	rfalse; 
]; 
-).

Player-Character Requires Persuasion ends here.


---- DOCUMENTATION ----

Normally in interactive fiction, the player is intended to literally be the protagonist in the narrative, as evidenced by the use of second-person viewpoint.  But there may be some narrative possibilities worth exploring if we keep the protagonist -- the player-character -- as a separate entity from the player. 

This extension ensures the Persuasion rules, usually used for commands like "BOB, GO WEST", will be consulted for all commands.  The only exception is looking, which puts readable text to the screen.  This can be overridden by additional persuasion rules intercepting look, or it can be completely revoked by:

	*: The always allow looking rule is not listed in the persuasion rules. 

Like NPCs, the default behavior for the protagonist is to refuse everything the player requests of him/her.  This should be overridden in the same way, by creating a new "persuasion succeeds" rule.  The default error message for the PC's refusal is printed by:

	*: The default PC behavior rule is not listed in the persuasion rules.

The extension Custom Library Messages by David Fisher is recommended but not required, as Inform's built-in messages are in second person.

Example: * The Magic Word is not XYZZY - Our protagonist is a stickler on manners.

	*: "The Magic Word is not XYZZY"
	
	Include Player-Character Requires Persuasion by Ron Newcomb.
	
	A Quiet Spot is room. Bob is a man in the spot. 

	Persuasion rule for doing something when said please is true: persuasion succeeds. 

	Persuasion rule for asking Bob to try sleeping or waiting: say "'I'm already trying to, thanks.'" instead.

	Test me with "sleep / bob, sleep / wait / please wait / bob, wait / jump / bob, jump / please jump / inventory / inventory please / bob, take inventory ".

	Said please is a truth state that varies.

	After reading a command:
		now said please is false; 
		if the player's command includes "please" begin;
			now said please is true; 
			cut the matched text;
		end if.


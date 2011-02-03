Version 2 of Restrictions by Jon Ingold begins here.

"Provides for environments in which the player's actions are quickly and easily restricted."

Section - Rooms can be restrictive

A room can be currently restrictive. A room is seldom currently restrictive.

To decide if restricted in (r - a room): if r is currently restrictive, yes; no.

Section - Place the rule in the accessibility rulebook

The check restrictions rule is listed before the access through barriers rule in the accessibility rulebook.

Definition: a thing is unreachable if it is not enclosed by the player and it is not the player.

The last before rule (this is the check restrictions rule):
	if the person asked is the player and not examining and the location is currently restrictive:
		consider the restricted before rules;
		if rule succeeded:
			say "[run paragraph on]"; 
			continue the action;	
		if the rule failed:
			if the action requires a touchable noun and the noun is an unreachable thing, say "[Can't reach the noun]." instead;
			if the action requires a touchable second noun and the second noun is a unreachable thing, say "[Can't reach the second noun]." instead;
			consider the restricted instead rules;
			if rule succeeded:
				say "[run paragraph on]"; 
				continue the action;
		stop the action.

To say Can't reach (n - a thing):
	say "You can't reach [the n]";
	if the location has a nonzero restriction message, say ", because you are [restriction message of the location]";

Section - describe the restriction 

After printing the name of the location when the location is currently restrictive (this is the print restriction message rule):
	if the location has a nonzero restriction message, say " ([restriction message of the location])".

To decide if (r - a room) has a nonzero restriction message: if the restriction message of r is not "", yes; no.

A room has some text called restriction message. The restriction message of a room is usually "".


Section - the rules

The restricted before rules are a rulebook. 
The restricted instead rules are a rulebook. 

The restricted before rulebook have a room called the restricting-location (matched as "in").
The restricted instead rulebook have a room called the restricting-location (matched as "in").

The last restricted before rule: rule fails.
The last restricted instead rule: say "You can't[if the location has a nonzero restriction message], because you are [restriction message of the location][end if]." instead.

Restrictions ends here.

---- DOCUMENTATION ----

Prevents player from interacting with anything he's not carrying when the location is "currently restrictive", for use when hanging on to ladders or pinned up against the wall by a policeman, and so forth. Two rulebooks are provided for describing what happens.

"Restricted before" is always called in restrictive environments (and should end with "instead" if the action is finished with, "rule succeeded" to continue without and further restriction checks, and "rule failed" if the action should continue to the restricted instead phase where the action will fail.)

"Restricted instead" occurs after a default check that the player is carrying everything he intends to touch, and fails the action if he is not. These rules should supply different and specific failure messages, otherwise a default message will be supplied ( "You can't, because you are .... "). If an instead rule manages to succeed, the action will be allowed after all.

Therefore, if the player is "clinging to the hook on the ceiling" he will need a restricted before rule that says "if the noun or second noun is the hook, rule succeeds" to prevent the player begin told he can't reach the hook. The game will then automatically reject any attempts to interact (other than by examining) objects which are not directly enclosed by the player himself. Finally the "restricted instead" rulebook can be used to supply any outcomes which are specific to the restricted situation: such as telling the player that now is not the best time to be tying his shoelaces or attempting to juggle.

Locations can have a "restriction message", printed in the status line and as a reason from why things can't be reached. (eg. "clinging to the hook", "climbing the ladder").

Rules can be applied "in" the location that's doing the restrictiing:

	Restricted before rule in the Narrow Space when jumping
	Restricted instead rule in the Rope Bridge when cutting the ropes with the sword

and we can test
	
	if restricted in the location...
	if restricted in the Catwalk...



Example: ** Catwalk - Your average catwalk-dangling situation.

	*: "Cliffhanger"

	Include Restrictions by Jon Ingold.

	The Catwalk is a room. "The catwalk hovers far above the dusty floor below[if the location is currently restrictive]. So do you[end if]." The restriction message of the Catwalk is "clinging to the railing". The railing is scenery in the Catwalk. The dusty floor below is a supporter and scenery in the catwalk. The description of the dusty floor is "[if the floor supports something]On the floor below is [the list of things on the dusty floor][otherwise]The floor is a long, long way down[end if].".Instead of doing something other than examining to the dusty floor, say "It's too far away."

	The player is carrying a apple and a hat. The apple is edible. The hat is wearable.

	Before climbing railing when not restricted in the Catwalk, try jumping instead.

	[ The player can jump, and suddenly the location is restrictive! ]

	Instead of jumping in the catwalk when the catwalk is not currently restrictive:
	now the catwalk is currently restrictive;
	say "You fling yourself over the railing, only catching your fall with one hand."

	[ Actions involving the railing -- and snacking -- are allowed. That means their before routines succeed. ]

	Restricted before rule in the Catwalk when eating the apple: rule succeeds.

	Restricted before rule in the Catwalk when the noun is the railing: 
	rule succeeds.

	[ We can pull ourselves back, or let go: these are interactions with the railing so they're handled using normal "instead" rules. Note the "when restricted in the Catwalk" condition. ] 

	Instead of pulling the railing when restricted in the Catwalk: 
	now the location is not currently restrictive;
	say "You haul yourself back over the railing." instead.

	Instead of dropping the railing when restricted in the Catwalk: 
	end the game saying "You plummet to your death." instead.

	[ And for things which we are restricted from doing, we can supply new error messages in the "restricted instead rules". If we don't, we'll just get the "both hands"... message. ]

	Restricted instead rule when in the catwalk:
	say "You're using both hands just to hold on." instead.

	Restricted instead of dropping something held by the player in the catwalk:
	move the noun to the dusty floor;
	say "You relinquish [the noun] and it disappears to the floor below." instead;

	Test me with "jump / pull railing / jump / eat apple / wear hat / drop hat / drop railing".




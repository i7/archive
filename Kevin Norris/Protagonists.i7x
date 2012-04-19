Version 1/120327 of Protagonists (for Z-machine version 8 or Glulx only) by Kevin Norris begins here.

"Playable characters, followers, and basic orders."

Include Plurality by Emily Short.

Section P1 - Player characters

A person can be playable.  A person is seldom playable.
Definition: A person is available for play if it is playable and it is not the player and it is on-stage.
After deciding the scope of the player while possessing (this is the allow player to see playable characters rule):
	Repeat with P running through available for play people:
		Place P in scope, but not its contents.
Possessing is an action out of world applying to one visible thing.
The specification of the possessing action is "Changes the player to the noun.  The noun must be a person, and must be designated as 'playable.'  The viewpoint of the story will be changed using the phrase 'Now the player is <someone>'.  This will not have any in-game effect, other than changing who the command prompt is directed at.  See the Recipe book for advice on dealing with multiple player characters.  For convenience, players marked as playable will follow instructions (ALICE, GO WEST) and accept gifts (GIVE THE WIDGET TO BOB) automatically, but you could always change the relevant rules (see the persuasion and check giving it to rulebooks)."
Understand "possess [someone]" or "play as [someone]" or "become [someone]" as possessing.
Does the player mean possessing something which is not a person (this is the very unlikely to possess non-person rule):
	It is very unlikely.
Does the player mean possessing a playable person (this is the likely to possess playable characters rule):
	It is likely.
The possessing action has an object called the person possessing. ["the actor" might suffice, but this seems less ambiguous]
Setting action variables for possessing (this is the store possessor rule):
	Now the person possessing is the player. 
Check possessing the player (this is the can't possess yourself rule):
	Say "You are already playing as [the printed name of the player]." instead.
Check possessing (this is the can only possess available people rule):
	Unless the noun is available for play:
		Say "Right now, [unless the player can see an available for play person]you can only play as yourself ([the printed name of the player])[otherwise]in addition to yourself ([the printed name of the player]), you can play as [the list of visible available for play people][end if]." instead.
Carry out possessing (this is the standard carry out possessing rule):
	Now the player is the noun.
Report an actor possessing (this is the standard report possessing rule):
	Say "OK, you are now [the printed name of the noun].";
	Unless the location of the player is the location of the person possessing:
		Try looking.
Persuasion rule when the person asked is playable (this is the playable characters are obliging rule): [realistically, if you can play as them, you should be able to give them instructions]
	Persuasion succeeds.

Check an actor giving something to (this is the block giving to NPCs rule): [the block giving rule is supposed to simulate refusal of the gift... see above]
	If the second noun is the player, continue the action; [the player should not refuse gifts in most cases]
	If the second noun is not playable:
		abide by the block giving rule.
The block giving to NPCs rule is listed instead of the block giving rule in the check giving it to rulebook. [this is better than a procedural rule]

Chapter P1.5 - Unindexed

Follow pending is a truth state that varies.  Follow pending is false. [tracks whether other actions are a direct result of following, for reporting purposes]
The stragglers are a list of people that varies.  The stragglers are {}. [tracks who actually followed us, as opposed to who was trying to]

Chapter P2 - The party

Use smart following translates as (- Constant PROTAG_PATHFINDING; -).

Listing relates a value (called T) to a list of values (called L) when T is listed in L.
The verb to include (it includes, they include, it included, it is included) implies the reversed listing relation.
To say list-based s of (L - a list of things):
	Unless L is empty, now the prior named noun is entry the number of entries in L of L;
	If the number of entries in L is 1:
		If entry 1 of L is ambiguously plural and the american dialect option is active:
			Say "s";
		Otherwise if entry 1 of L is singular-named:
			Say "s".
To say list-based is-are of (L - a list of things):
	Unless L is empty, now the prior named noun is entry the number of entries in L of L;
	If the number of entries in L is 1:
		If entry 1 of L is ambiguously plural: 
			If the american dialect option is active:
				Say "is";
			Otherwise:
				Say "are";
		Otherwise if entry 1 of L is singular-named:
			Say "is";
		Otherwise if entry 1 of L is plural-named:
			Say "are";
	Otherwise:
		Say "are".
Every turn (this is the followers housekeeping rule):
	If follow pending is true: [can't happen]
		Say "[italic type]Warning: Can't happen in extension Protagonists by Kevin Norris: the follow pending flag was improperly set or never unset.  This should [roman type]never[italic type] happen, so please tell someone![roman type][paragraph break]";
	Now follow pending is false; [but we might as well fix it anyway]
	Now the stragglers are {}.
Every turn when there is an on-stage ready to follow person which is not enclosed by the location and the smart following option is active (this is the smart following rule):
	Repeat with P running through on-stage ready to follow people which are not enclosed by the location:
		While the holder of P is not the location of P:
			Try P exiting;
			If rule failed:
				Break;
		Let thataway be the best route from the location of P to the location of the player, using doors;
		If thataway is a direction:
			If the door thataway from the location of P is a closed openable unlocked door (called D): 
				Try P opening D;
			Try P going thataway.
A person can be ready to follow.  A person is seldom ready to follow.
First carry out going (this is the going autofollow rule):
	Now follow pending is true;
	Repeat with P running through ready to follow people:
		If P is the player, next;
		If P cannot see the player, next;
		If P is not in the holder of the player, next; [NB: this also blocks people from following if they're in containers/supporters]
		If going by something which encloses P, next; [skip vehicles which carry us]
		Try P going the noun;
	Now follow pending is false.
Report going when the stragglers is not empty (this is the list followers going rule):
	Say "[The list of things included by the stragglers] follow[list-based s of stragglers] you."
First report someone going when follow pending is true (this is the capture reports of followers going rule):
	Add the actor to the stragglers;
	Rule succeeds.
First carry out exiting (this is the exiting autofollow rule):
	Now follow pending is true;
	Repeat with P running through ready to follow people:
		If P is the player, next;
		If P cannot see the player, next;
		If the holder of P is not the holder of the player, next;
		Try P exiting;
	Now follow pending is false.
Report exiting when the stragglers is not empty (this is the list followers exiting rule):
	Say "[The list of things included by the stragglers] exit[list-based s of stragglers] [the container exited from] behind you."
The list followers exiting rule is listed after the standard report exiting rule in the report exiting rulebook.
First report someone exiting when follow pending is true (this is the capture reports of followers exiting rule):
	Add the actor to the stragglers;
	Rule succeeds.
First carry out entering (this is the entering autofollow rule):
	Now follow pending is true;
	Repeat with P running through ready to follow people:
		If P is the player, next;
		If P cannot see the player, next;
		If P cannot see the noun, next; [this probably isn't strict enough, but strictness here is more harmful than leniancy]
		Try P entering the noun;
	Now follow pending is false.
Report entering when the stragglers is not empty (this is the list followers entering rule):
	Say "[The list of things included by the stragglers] [if the noun is a supporter]get[else]enter[end if][list-based s of stragglers][if the noun is a supporter] onto[end if] [the noun] behind you."
The list followers entering rule is listed after the standard report entering rule in the report entering rulebook.
First report someone entering when follow pending is true (this is the capture reports of followers entering rule):
	Add the actor to the stragglers;
	Rule succeeds.
First carry out getting off (this is the getting off autofollow rule):
	Now follow pending is true;
	Repeat with P running through ready to follow people:
		If P is the player, next;
		If P cannot see the player, next;
		If the holder of P is not the holder of the player, next;
		Try P getting off the noun;
	Now follow pending is false.
Report getting off when the stragglers is not empty (this is the list followers getting off rule):
	Say "[The list of things included by the stragglers] get[list-based s of stragglers] off [the noun] behind you."
The list followers getting off rule is listed after the standard report getting off rule in the report getting off rulebook.
First report someone getting off when follow pending is true (this is the capture reports of followers getting off rule):
	Add the actor to the stragglers;
	Rule succeeds.
For writing a paragraph about a person (called P) while P is listed in the stragglers (this is the skip redundant followers rule):
	Now P is mentioned.

Chapter P3 - The following action

Following is an action applying to one visible thing.  Understand "follow [someone]" or "follow" as following.
For supplying a missing noun while an actor following (this is the default to follow the player rule):
	Now the noun is the player.
The specification of the following action is "Marks the actor as ready to follow.  A ready to follow person will automatically follow the player when (s)he GOes, ENTERs something, EXITs, or GETs OFF something; note that going is quite versatile but may not catch every edge case; if the noun is strange or transient, you may have problems.  For pragmatic reasons, the player cannot do this; if you also want to allow the player to follow NPCs, you'll need to supply your own rules.  Furthermore, the default report rule is somewhat awkward; you should probably override it with 'after' rules, since adding a new follower will likely be a relatively rare occurrence.  

Instructing a person to WAIT will have the opposite effect: they will stop following.  Since the WAIT command traditionally does nothing, some authors may wish to unlist the responsible rule, if that is their preference.  Keep in mind, however, that there is no other way for a player to ask a follower to stop following; any alternative action would inevitably conflict with WAIT for understanding."
Check following (this is the block player following rule):
	Say "You're really more of a leader." instead.
Check someone following (this is the can only follow the player rule):
	If the noun is not the player, stop the action.
Carry out someone following (this is the standard follow the player rule):
	Now the actor is ready to follow.
Report someone following (this is the standard report following rule):
	Say "[The person asked] [is-are] now following you.  Lead on."
Carry out someone waiting (this is the waiting ends following rule):
	Now the actor is not ready to follow.
Understand "wait here" or "stop" or "stop here" as waiting.

Chapter P4 - Giving orders (for use with Questions by Michael Callaghan)

An order is a kind of value.  The orders are defined by the table of orders.  The specification of the order is "Represents an order that can be given by the player."

Table of Orders
Order			Printed description				Targeted people		
null-order		"Do nothing."					Description of people	
stop			"Stop here for now."				--						
regroup			"Regroup."						--					
continue		"Travel as a group."				--				

When play begins (this is the initialize table of orders rule):
	Target stop at visible obedient ready to follow other people;
	Target regroup at visible obedient other people who are not in the location of the player;
	Target continue at visible obedient other not ready to follow people who are held by the holder of the player.
To target (O - an order) at (D - a description of people):
	Now the targeted people of O is D;
	If O is an order listed in the table of orders: [otherwise can't happen]
		Now targeted people entry is D.
The obedience rules are a person based rulebook.
An obedience rule for a playable person (this is the playable characters are obedient rule):
	Rule succeeds.
The last obedience rule (this is the most characters are not obedient rule):
	Rule fails.
Definition: A person (called P) is obedient:
	Consider the obedience rules for P;
	If the rule succeeded, yes;
	No.
To decide whether (P - a person) is a target of (O - an order):
	If P is not visible or P is not obedient or P is the player, no;
	Let D be the targeted people of O;
	Decide on whether or not P matches D.
[The ordering a group to rules are an order based rulebook with default success.]
Targeting relates an order (called O) to a person (called P) when P is a target of O.
The verb to target (it targets, they target, it targeted, he is targeted, it is targeting) implies the targeting relation.
Definition: A person is other if it is not the player.

Section P4.1 - Internals unindexed

The available orders are a list of orders that varies.

Section P4.2 - Ordering action and related activities

Printing the failure to comply of something is an activity on people.
Printing the compliance list of something is an activity on lists of people.
Ordering a group to something is an activity on orders.
The relevant order is an order that varies.
The relevant order is null-order.
The order prompt is some text that varies.  The order prompt is "Order what action?"
Ordering is an action out of world applying to nothing.
The specification of the ordering action is "Prompts the player for an order and then passes it off to the ordering a group to activity, with a brief detour to the menu question rules.  The prompt will automatically advance the turn counter (or not, as appropriate), so this action is out of world.  The check rules decide which orders to present to the player; if there are no available orders or no obedient people present in the first place, this is reported."
Understand "order" or "give order/orders" or "orders" as ordering.
The ordering action has a list of people called the people ordered.
Setting action variables for ordering (this is the decide who to order rule):
	Now the people ordered is the list of visible obedient other people;
	Now the available orders is {}.
Check ordering (this is the can't order what you can't see rule):
	If the people ordered is empty, say "You can't see anyone willing to take your orders." instead.
Last check ordering (this is the can't give orders that aren't reasonable rule):
	Repeat with O running through orders:
		If O targets someone, add O to the available orders;
	If the available orders is empty, say "None of the available orders seem to make much sense right now." instead.

Carry out ordering (this is the ask what to order rule):
	Now the current question is the order prompt;
	Let L be a list of texts;
	Repeat with O running through the available orders:
		Add the printed description of O to L;
	Now the current question menu is L;
	Ask an open question, in menu mode.
A menu question rule when the current question is the order prompt (this is the default order handling rule):
	Let the selected order be entry the number understood of the available orders;
	Carry out the ordering a group to activity with the selected order;
	Exit.
The giving an order to rules are a person based rulebook.
The giving an order to rulebook has outcomes it is complied with (success), it is not complied with (failure), it is silently ignored (failure), and it is incomplete (no outcome - default).
Giving an order to someone (called P) when the relevant order is stop (this is the standard ordering it to stop rule):
	Silently try P waiting;
	If P is ready to follow, it is not complied with;
	Otherwise it is complied with.
Giving an order to someone (called P) when the relevant order is continue (this is the standard ordering it to continue rule):
	Silently try P following the player;
	If P is ready to follow, it is complied with;
	Otherwise it is not complied with.
Giving an order to someone (called P) when the relevant order is regroup (this is the standard ordering it to regroup rule):
	While the holder of P is not the location of P:
		Silently try P exiting;
		If rule failed, it is not complied with;
	It is complied with.

[To actively print (prefix - some text) then (X - a value of kind K) then (suffix - some text) via (A - an activity on K):
	Begin the A activity with X;
	If handling A activity:
		Say prefix;
		Say X;
		Say suffix;
	End the A activity with X.
To actively print (prefix - some text) then (X - a list of values of kind K) then (suffix - some text) via (A - an activity on lists of K):
	Begin the A activity with X;
	If handling A activity and X is not empty:
		Now the current list length is the number of entries in X;
		Say prefix;
		Say X;
		Say suffix;
	End the A activity with X.
The current list length is a number that varies.]
Last for printing the failure to comply of someone (called P) when the relevant order is stop (this is the standard print failure to stop rule):
	Say "For some reason, [the P] do[es] not seem amenable to this."
Last for printing the failure to comply of someone (called P) when the relevant order is continue (this is the standard print failure to continue rule):
	Say "For some reason, [the P] do[es] not seem amenable to this."
Last for printing the failure to comply of someone (called P) when the relevant order is regroup (this is the standard print failure to regroup rule):
	Say "[The P] appears to be stuck."
Last for printing the compliance list of a list of people (called A) when the relevant order is stop (this is the standard print stop list rule):
	Say "[The list of things which are included by A] wait[list-based s of A].";
Last for printing the compliance list of a list of people (called A) when the relevant order is continue (this is the standard print continue list rule):
	Say "[The list of things which are included by A] [list-based is-are of A] now following you."
Last for printing the compliance list of a list of people (called A) when the relevant order is regroup (this is the standard print regroup list rule):
	Say "[The list of things which are included by A] regroup[list-based s of A], out in the open."
First before ordering a group to an order (called O) (this is the set relevant order rule):
	Now the relevant order is O.
Last after ordering a group to an order (called O) (this is the unset relevant order rule):
	Now the relevant order is null-order.
For ordering a group to null-order (this is the null-order does nothing rule):
	Do nothing.
Last for ordering a group to an order (called O) (this is the group ordering rule):
	Let L be a list of people;
	Repeat with P running through people targeted by O:
		Add P to L;
	Let A be L;
	Repeat with P running through L:
		Consider the giving an order to rules for P;
		Let X be the outcome of the rulebook;
		If X is the it is not complied with outcome:
			remove P from A;
			Begin the printing the failure to comply activity with P;
			If handling the printing the failure to comply activity with P, say "For some reason, [P] do[es] not seem amenable to this.";
			End the printing the failure to comply activity with P;
		Otherwise if X is the it is silently ignored outcome:
			remove P from A;
	If A is not empty:
		Begin the printing the compliance list activity with A;
		If handling the printing the compliance list activity with A, say "[A] obey[list-based s of A] the order to [O].";
		End the printing the compliance list activity with A.
	
Protagonists ends here.

---- DOCUMENTATION ---- 

This is a relatively simple extension designed to make it easy for a game to have multiple protagonists.  The player can POSSESS, BECOME, or PLAY AS any person designated as playable, although you may limit this by writing additional Check rules.  Note that possession is an action out of world; it is not subject to Before, Instead, or After rules.  
Independent of possession, the NPCs can also follow the player, making it easier to keep the party together.  Simply designate an NPC as ready to follow, and they will.  The player can also ask anyone who can be persuaded to follow him.  Waiting cancels following.

If Questions by Michael Callaghan is included, the player can also give group orders to anyone who will listen, by typing ORDERS and choosing an option.

For most purposes, it is enough to include this extension and designate some people as playable (including the player).  However, this extension is quite flexible; if you need to modify the behavior of this extension, or are merely curious, read on.

Chapter: Possession

Possessing is an action out of world applying to a visible person.  By default, any playable characters are placed in scope, in addition to whatever the player can see.  Playability is determined by a flag:

	Alice is playable.  
	Bob is not playable. [the default]
	At the time when the situation worsens:
		Say "Bob looks concerned for a moment.  'Let me help you,' he says.";
		Now Bob is playable.
	At the time when Alice is captured:
		Now Alice is not playable.

If the player tries to possess an NPC, the game will respond with a list of playable characters.  If no characters are playable, the game will report this.  Otherwise, the game will set the named person as the player.  If the new player is not in the same location as the old player, a look action will also be generated.

Note that in the last example, if Alice was the player, she will still be the player after the flag is turned off.  You must manually change the player if this happens.  Although there won't be any serious problems from having a non-playable player, in most practical circumstances you will want to avoid this situation.  

Keep in mind that, by default, the player is not playable; if you want to allow the player to get back to their body after possessing someone else, you'll need to mark them as playable.

By default, persuasion succeeds for any playable character.  The block giving rule has also been modified to allow the player and NPCs to give things to playable characters, and to make the player accept any gifts offered.  See the giving it to action under the index if you want to change this.

Chapter: Following

If the persuasion rules allow it, the player can ask NPCs and fellow PCs to follow him.  This following is relatively simplistic; characters will only follow the player if they are in the same place as the player, and following people other than the player is not possible.  It is implemented as the following action, which can be looked up in the index for more details.  It is tracked with the "ready to follow" flag.

By default, waiting will unset the following.  This goes somewhat against the tide of historical IF, so the following limitations are placed on it:

1. It won't happen if the player waits.

2. It can be prevented entirely by unlisting the "waiting ends following rule".

3. The report waiting rulebook is unchanged; the default text "Alice waits." (which, admittedly, does seem a little strange for the standard Inform world model) will have to do.

Of course, you can override these limitations, or extend them, if you see fit.

If the player tries one of these actions and makes it to the carry out rules, followers will generally try to follow the player:

1. Going

2. Entering

3. Exiting

4. Getting off (of something)

If the player moves via some other mechanism, followers won't follow automatically; you will need to add rules for this.  Followers *do not* use any form of path-finding; if they become separated from the player, they won't know how to find them again.  This is intended to be realistic, but if you would prefer to enable path-finding, it is available:
	
	Use smart following.

If the holder of the player is not the holder of the NPC, they generally won't try, except for entering, which is (perhaps) a little too lenient: it will be tried as long as the NPC can see the noun.

There are a few other restrictions on who can follow and when, mostly common sense things.  In particular, if the NPC cannot see the player, no following will take place.

Technically, the NPC arrives in the destination slightly ahead of the player, but if you write an instead rule such as 

	Instead of an actor going to the Ballroom:
		...

it will catch the player first.  Here's a timeline:

	1. Player types e.g. GO WEST.
	2. Player passes before, instead, and check stages.
	3. Player begins carry out stage.
		3.1 NPC(s) tries/try to go west.
			3.1.1 NPC passes before, instead, check, and carry out stages.
			3.1.2 NPC hits special report rule which captures ordinary report OR some other after rule prevents both the ordinary report and the capture.
		3.2 Player is moved to the west.
	4. Player begins after/report stage.
		4.1 Captured NPC reports are consolidated into a single report.  Reports which were not captured are presumed to have been narrated elsewhere, and omitted.
		4.2 Player completes report stage (incl. e.g. VERBOSE room description printing).
		
As you can see, although the NPC will technically arrive first, the player will hit before/instead rules before the NPC does, so this is mostly invisible.

If you write after rules applying to NPCs, note that they will suppress an ordinary follow report in addition to the usual reporting rules.

Chapter: Orders

Firstly, if you do not include Questions by Michael Callaghan, the following features will not be present at all.

The player can issue orders to followers and anyone deemed 'obedient' by the obedience rules.  A few notes about the obedience rules and orders in general:

1. They are different from the persuasion rules.  The persuasion rules are action-based, while the obedience rules are person-based.

2. They are, by default, entirely independent of the persuasion rules.  Neither rulebook's outcome will have any effect on the other's.

3. The obedience rules are consulted to determine *which people* want to follow the player's orders.  Persuasion is done to determine *whether* a specific person follows the instructions.

4. Orders apply to whole groups of people at once, but are more structured and less flexible than persuasion.  However, as the author you can define additional orders.

5. Persuasion is done as a single command such as ALICE, WEST.  Orders are given by first typing ORDERS and then selecting an order from a menu.

6. Persuasion is targeted at a specific person.  Orders automatically target visible obedient people; individual orders may be more discriminating.

The following orders are included, and new ones may be defined by following the instructions in the next section:

Stop causes NPCs to wait, which causes them to stop following.

Regroup causes NPCs to attempt to reach the location by repeatedly generating exit actions; this usually groups them together for further ordering.

Continue is the opposite of stop; it causes NPCs to follow the player.

Null-order is a placeholder.  It is never an applicable order, and will do nothing if it is somehow activated anyway.

Targeting specifies which people an order affects.  It relates an order to a person if the person is targeted by the order in question.  Each order has a description of people which "decides" which people to target.

Orders will never target the player, invisible people (i.e. people who are not visible), or non-obedient people.  If you must affect them as well, you can hang specific behavior on certain activities to override this; see the next paragraph.

The player gives orders by typing ORDERS or GIVE ORDERS.  The game will then decide which of the defined orders, if any, make sense in the current context, and prompt the player to select an order, using an open menu-based question (see the Questions documentation for what this means).  The selected order will then be passed to the Ordering a group to... activity, which will set and unset the global variable "the relevant order".  Those rules are responsible for executing and reporting the order, using the "Giving an order to" rulebook on people to execute and the "Printing the compliance list" activity on lists of people to report; if someone in the group fails to do what they're ordered, these rules will generically narrate that as well, though this may be overridden with the "Printing the failure to comply" activity on people.  Obviously, these activities are designed to have special behavior hung on them.

Section: Defining a new order

A person is 'obedient' if the obedience rules succeed for them.  By default, playable characters are obedient, but other people are not.

The orders are defined in the table of orders, which by default looks like this:
	
	Table of Orders
	Order			Printed description				Targeted people		
	null-order		"Do nothing."					Description of people	
	stop			"Stop here for now."				--					
	regroup			"Regroup."						--					
	continue		"Travel as a group."				--					
	
Note that the "Targeted people" column is empty.  This is necessary for the game to compile (this is bug 889 in Inform; see <http://inform7.com/mantis/view.php?id=889>).  However, it's more useful when it's filled, so let's look at what the table ought to look like:

	Table of Orders
	Order			Printed description				Targeted people		
	null-order		"Do nothing."					Description of people	
	stop			"Stop here for now."				visible obedient ready to follow other people					
	regroup			"Regroup."						visible obedient other people who are not in the location of the player					
	continue		"Travel as a group."				visible obedient other not ready to follow people who are held by the holder of the player					

Since we cannot have any non-blank entries in the targeted people column, we insert these entries when play begins.  However, this is a little trickier than it sounds, since we must also update the actual order values, so we use a phrase:
	
	Target (O - an order) at (D - a description of people)
	
The Giving an order to rulebook is where most of the logic lies.  Write a rule like this:

	Giving an order to someone (called P) when the relevant order is...:

You can use the outcomes "It is complied with" and "It is not complied with" to indicate what happened (whether the order was successfully followed).  You may also use "It is silently ignored" if you need to prevent anything from being printed for this person (e.g. if you've printed something yourself as a special case).  Note that you should not be worrying about obedience at this point; the person is already following the order.  Instead, you need to worry about whether the action succeeds.  In general, you should use "Try silently" (or "Silently try") to make things happen within these rules.
	
For finesse and completeness, add reporting rules:
	
	For printing the failure to comply of someone (called P) when the relevant order is...:
	
	For printing the compliance list of a list of people (called A) when the relevant order is...:
		Say "[The list of things included by A] obey[list-based s of A]."
	
Note that Plurality currently does not support list-like things.  So we provide the tokens "[list based s of A]" and "[list based is-are of A]", which behave much like "[is-are]" and "[s]", but for variable numbers of entries.  Note that these will behave slightly differently depending on whether or not the american dialect option is active (ambiguously plural things are considered singular in American English but (often) plural in British English, and this extension respects that).

Also note the rather peculiar circumlocution "[The list of things included by A]".  This is mostly because "[A with definite articles]" doesn't capitalize and there's no obvious alternative.  A list includes something if the something in question is listed in the list.

Chapter: Miscellaneous

I may be contacted directly at nykevin.norris@gmail.com.  While I do check my email religiously, I may not have time to respond promptly; if you have a general question about Inform or interactive fiction, it might be better to post it at http://www.intfiction.org/forum instead.

In the future, bug reporters and beta testers will be listed here; at the time of this writing, I've yet to receive any significant feedback.  Bug reports are always welcome.

Finally, please note that there is a good chance of later versions altering some of the details documented above (for example, in version 2, following might hypothetically be converted into a general relation, and the adjective 'ready to follow' would then be withdrawn as redundant); this could result in compatibility issues for the unprepared.  This will generally only happen for major versions (version 1, 2, and so on); I will try to maintain backwards compatibility for minor releases (e.g. 1/120327 versus a later date within version 1).

Example: * Revised Terror of the Sierra Madre - Recipe book example modified to use Protagonists.

This is based on Example 121 from Chapter 5.6 of the Recipe Book (8.1 in Writing with Inform).  In the original example, the viewpoint alternated between two people.  We're going to allow the player to choose who to play as.

	*:"Revised Terror of the Sierra Madre"

	Include Protagonists by Kevin Norris.
	
	The Hay-Strewn Corridor is a room. "[if the player is Maleska]The horse stalls are empty: you have already drained the animals, and carried off their corpses. The house will not long sustain you now.

	The window throws on the floor a bright square of malevolent sunlight[otherwise]The stalls for horses run down one side of the room, but the house has long stood empty. A square window without shutters looks out over the ranch, away toward the Sierras[end if]."

	Teresa is a playable woman in the Hay-Strewn Corridor. "Teresa stands opposite you[if Teresa carries something], her fingers wrapped tightly around [a list of things carried by Teresa][end if]." Teresa carries a bulb of garlic and a cross.

	Maleska is a playable man in the Hay-Strewn Corridor. "Maleska watches you from eyes entirely black." Maleska carries a skull.

	The player is Maleska.

	Every person has a number called strength. The strength of Teresa is 3. The strength of Maleska is 5.

	When play begins:
		now the command prompt is "[bold type][player][roman type] > ";
		now the left hand status line is "[player]";
		now the right hand status line is "STR: [strength of the player]".

	
	Rule for printing the name of Teresa: say "Teresa".

	Rule for printing the name of Maleska: say "Maleska".

	Test me with "look / i / play as teresa / look / i / play as teresa / play as maleska".

Example: *** Flight - Defining a new order.

Here's most of an implementation for a new order "flee", which would cause fearful followers to flee the room, possibly scattering them to many different rooms:
	
	*:"Flight"
	
	Include Protagonists by Kevin Norris.
	Include Questions by Michael Callaghan.
	
	Section 1 - The "flee" order
	
	Definition: A person is afraid if it can see the beast
	
	Table of Orders (continued)
	Order			Printed description				Targeted people
	flee				"Run away."						--
	
	When play begins:
		Target flee at visible obedient other afraid people.
	
	Giving an order to someone (called P) when the relevant order is flee:
		Let place be a random adjacent room;
		If place is a room:
			Let thataway be the best route from the location of P to place;
			If thataway is a direction:
				Silently try P going thataway;
				If rule succeeded:
					Silently try P waiting;
					It is complied with;
		It is not complied with.
	For printing the failure to comply of someone (called P) when the relevant order is flee:
		Say "[The P] appear[s] to be stuck here."
	For printing the compliance list of a list of people (called A) when the relevant order is flee:
		Say "[The list of things included by A] flee[list-based s of A] the area."
	
	Section 2 - The Scenario

	The Canyon is a room. "You are at the bottom of a canyon.  There is a passage to the south."
	Alice is a playable woman in the canyon.
	Bob is a playable man in the canyon.
	Carol is a playable woman in the canyon.
	David is a playable man in the canyon.
	The player carries a lamp.  The lamp is a device.
	Carry out switching off the lamp:
		Now the lamp is not lit.
	Carry out switching on the lamp:
		Now the lamp is lit.
	Instead of burning the lamp:
		Try switching on the lamp.
	The Cave is a dark room. "Your lamplight casts hundreds of shadows all over the cave.  There are exits in the four cardinal directions."
	The Narrow passage is north of the cave. "The passage extends north and south." The narrow passage is dark.
	South of the canyon is the narrow passage.
	The Dead end is west of the cave. "You can only return to the east."  It is dark.
	The Twisty passage is east of the cave. "This passage twists around and confuses your sense of direction.  It looks like you can go north and south from here."  It is dark.
	North of the twisty passage is the cave.
	West of the twisty passage is nowhere.
	The Curved passage is south of the cave. "This passage is a straightforward curve from the north to the east."  It is dark.
	East of the curved passage is south of the twisty passage.
	The Beast is an animal in the cave.
	Test me with "light lamp / order / 1 / s / s / order / 2 / n / s / w / e / s / e / n"

Note that this does not cause the player to flee when the order is given.  This is because orders never target the player.  However, in this case it may be a good idea to have the player comply as well:
	
	*:After ordering a group to flee:
		Let place be a random adjacent room;
		If Place is a room:
			Let thataway be the best route from the location to place;
			If thataway is a direction:
				Try going thataway. 

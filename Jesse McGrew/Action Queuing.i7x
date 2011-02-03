Version 3 of Action Queuing by Jesse McGrew begins here.

"Allows actions to be stored in a queue and run later, for the player or any other actor. Includes an example of a team of movers placing objects around a house."

Use queued action debugging translates as (- Constant QA_DEBUG; -).

Table of Queued Actions
index		actor		action-number		noun			second
a number	a person		a number	a miscellaneous-value	a miscellaneous-value
with 99 blank rows.

To queue (act - action):
	(- Queue{act} -).

To queue (act - action) immediately:
	(- FQueue{act} -).

To queue (x - person) trying the current action:
	(- QueueI7_TryAction(0, {x}, action, noun, second); -).

To queue (x - person) trying the current action immediately:
	(- FQueueI7_TryAction(0, {x}, action, noun, second); -).

To perform the next queued action, following unsuccessful attempt rules:
	repeat through Table of Queued Actions in index order
	begin;
		let actE be the action-number entry; let actorE be the actor entry; let nE be the noun entry; let sE be the second entry;
		blank out the whole row;
		if following unsuccessful attempt rules, perform the queued action actE by actorE with nE and sE, following unsuccessful attempt rules;
		otherwise perform the queued action actE by actorE with nE and sE;
		stop;
	end repeat.

To perform the next queued action for (x - person), following unsuccessful attempt rules:
	repeat through Table of Queued Actions in index order
	begin;
		if the actor entry is x
		begin;
			let actE be the action-number entry; let nE be the noun entry; let sE be the second entry;
			blank out the whole row;
			if following unsuccessful attempt rules, perform the queued action actE by x with nE and sE, following unsuccessful attempt rules;
			otherwise perform the queued action actE by x with nE and sE;
			stop;
		end if;
	end repeat.

To perform the next queued action for every person, following unsuccessful attempt rules:
	repeat with x running through people
	begin;
		if any actions are queued for x
		begin;
			if following unsuccessful attempt rules, perform the next queued action for x, following unsuccessful attempt rules;
			otherwise perform the next queued action for x;
		end if;
	end repeat.

To delete the first queued action for (x - person):
	repeat through Table of Queued Actions in index order
	begin;
		if the actor entry is x
		begin;
			blank out the whole row;
			stop;
		end if;
	end repeat.

To delete the last queued action for (x - person):
	repeat through Table of Queued Actions in reverse index order
	begin;
		if the actor entry is x
		begin;
			blank out the whole row;
			stop;
		end if;
	end repeat.

To delete all queued actions for (x - person):
	repeat through Table of Queued Actions
	begin;
		if the actor entry is x, blank out the whole row;
	end repeat.

To clear the action queue:
	repeat through Table of Queued Actions
	begin;
		blank out the whole row;
	end repeat.

To perform the queued action (action - number) by (x - object) with (noun - miscellaneous-value) and (second - miscellaneous-value), following unsuccessful attempt rules:
	(- UnsuccI7_TryAction({phrase options}, 0, {x}, {action}, {noun}, {second}); -).

To decide which number is number of actions queued for (x - person):
	let N be 0;
	repeat through Table of Queued Actions
	begin;
		if the actor entry is x, increase N by 1;
	end repeat;
	decide on N.

To decide whether any actions are queued for (x - person):
	if the number of actions queued for x is 0, decide no;
	otherwise decide yes.

To decide whether no actions are queued for (x - person):
	if the number of actions queued for x is 0, decide yes;
	otherwise decide no.

To decide whether (act - action) is queued:
	(- (CheckQ{act}{-delete}{-delete}, 1)) -).

To decide whether (act - action) is not queued:
	(- (CheckQ{act}{-delete}{-delete}, 1)==false) -).

To decide whether (act - action) is queued next for (x - object):
	(- (CheckQNext{act}{-delete}{-delete}, {x})) -).

To decide whether (act - action) is not queued next for (x - object):
	(- (CheckQNext{act}{-delete}{-delete}, {x})==false) -).

To decide whether (act - action) is queued at least (N - number) times:
	(- (CheckQ{act}{-delete}{-delete}, {N})) -).

To decide whether (act - action) is not queued at least (N - number) times:
	(- (CheckQ{act}{-delete}{-delete}, {N})==false) -).

Include (-

Constant queued_actions = (+Table of Queued Actions+);
Global next_qa_index = 1;
Global next_fqa_index = 0;

#Ifdef QA_DEBUG;
[ ActionName ac  i;
	i=FindAction(ac);
	if (i==0) "(bad action)";
	print (string) ActionData-->(i+4);
	if (ActionData-->(i+6)~=$ffff) {
		print " it ";
		print (string) ActionData-->(i+6);
	}
];
#Endif;

[ QueueI7_TryAction req by ac n s  row;
	if (TableBlankRows(queued_actions)==0) {
		print "[*** No space left for actions. Add more blank rows to the Table of Queued Actions. ***]^";
		rfalse;
	}
	#Ifdef QA_DEBUG; print "[queuing action (", req, ", ", (name) by, ", ", (ActionName) ac, ", ", (name) n, ", ", (name) s, ")]^"; #Endif;
	row = TableBlankRow(queued_actions);
	TableLookUpEntry(queued_actions, 1, row, 1, next_qa_index++);
	TableLookUpEntry(queued_actions, 2, row, 1, by);
	TableLookUpEntry(queued_actions, 3, row, 1, ac);
	TableLookUpEntry(queued_actions, 4, row, 1, n);
	TableLookUpEntry(queued_actions, 5, row, 1, s);
	return row;
];

[ FQueueI7_TryAction req by ac n s  row;
	row = QueueI7_TryAction(req, by, ac, n, s);
	if (row==0) rfalse;
	--next_qa_index;
	TableLookUpEntry( queued_actions, 1, row, 1, next_fqa_index-- );
	return row;
];

[ UnsuccI7_TryAction opt req by ac n s;
  #Ifdef QA_DEBUG; print "[performing queued action (", opt, ", ", req, ", ", (name) by, ", ", (ActionName) ac, ", ", (name) n, ", ", (name) s, ")]^"; #Endif;
  if (opt==0) return I7_TryAction(req, by, ac, n, s);
  @push actor; @push act_requester; @push inp1; @push inp2;
  actor = by; if (req) act_requester = player; else act_requester = 0;
!  print inp1, inp2, "^";
  by = FindAction(ac);
  if (by) {
      if (ActionData-->(by+2) == 7) inp1 = n; else inp1 = 1;
      if (ActionData-->(by+3) == 7) inp2 = s; else inp2 = 1;
  }
!  print "Made by ITA: ", inp1, inp2, "^";
  if (InformLibrary.begin_action(ac, n, s)==false && actor~=player) {
    @push action; @push noun; @push second;
    action=ac; noun=n; second=s;
    ProcessRulebook(UNABLE_RB);
    @pull second; @pull noun; @pull action;
  }
!  <(ac) n s>;
!  print inp1, inp2, "^";
  @pull inp2; @pull inp1; @pull act_requester; @pull actor;
];

[ CheckQI7_TryAction req by ac n s count  i max v;
	if (count==0) rtrue;
	max=TableRows(queued_actions);
	for ( i=1:i<=max:i++ ) {
		if (CheckQRow(i, by, ac, n, s)) {
			! this one matches..
			if ( --count==0 ) rtrue;
		}
	}
	rfalse;
];

[ CheckQNextI7_TryAction req by0 ac n s by  i v;
	for ( i=TableNextRow(queued_actions, 1, 0, 1): i: i=TableNextRow(queued_actions, 1, i, 1) ) {
		v=TableLookUpEntry(queued_actions, 2, i);
		if (metaclass(by)==Routine) {
			if (by(v)==false) continue;
		} else {
			if (by~=v) continue;
		}
		return CheckQRow(i, by, ac, n, s);
	}
	rfalse;
];

[ CheckQRow i by ac n s  v;
	if (TableRowIsBlank(queued_actions, i)) rfalse;
	v=TableLookUpEntry(queued_actions, 2, i);
	if (metaclass(by)==Routine) {
		if (by(v)==false) rfalse;
	} else {
		if (by~=v) rfalse;
	}
	v=TableLookUpEntry(queued_actions, 3, i);
	if (metaclass(ac)==Routine) {
		if (ac(v)==false) rfalse;
	} else {
		if (ac~=v) rfalse;
	}
	v=TableLookUpEntry(queued_actions, 4, i);
	if (metaclass(n)==Routine) {
		if (n(v)==false) rfalse;
	} else {
		if (n~=v) rfalse;
	}
	v=TableLookUpEntry(queued_actions, 5, i);
	if (metaclass(s)==Routine) {
		if (s(v)==false) rfalse;
	} else {
		if (s~=v) rfalse;
	}
	rtrue;
];

-).

Action Queuing by Jesse McGrew ends here.

---- DOCUMENTATION ----

This extension provides a queue which can store up to 100 actions for various actors. Using the phrases explained below, we can add actions to the queue, remove them, and perform them. We can store and perform actions for any actor, even the player, although queuing them for non-player characters is probably more useful.

ADDING TO THE QUEUE

Using the action queue is similar to performing an action with "try":

	queue opening the brown door;
	queue the monkey trying eating the banana;

Normally, actions are added to the end of the queue, so if there are any other actions queued, the new one will be performed after them. If we want the new action to run first, we can use the word "immediately":

	queue the monkey trying attacking the player immediately;

We can also write "trying the current action" to have someone mimic the player's action:

	queue the mime trying the current action;
	queue the mime trying the current action immediately;

PERFORMING FROM THE QUEUE

To animate our NPCs using the action queue, we'll need to run actions from the queue on a regular basis. If the game has more than one NPC, we can write this in an "every turn" rule:

	perform the next queued action for every person;

Normally, if an NPC's action fails, nothing will happen. We can react to a failed attempt by writing an "unsuccessful attempt" rule for the action, and using a special option (which works with any of these "perform" phrases):

	perform the next queued action for every person, following unsuccessful attempt rules;

If we only want to run one action at a time, we can name a specific actor, or just run the next queued action for whichever actor is scheduled to perform next:

	perform the next queued action for Arnold;
	perform the next queued action;

CHECKING THE QUEUE

We can use these conditions to check about certain actions:

	if eating the cupcake is queued, ...
	if the monkey trying eating the banana is queued, ...
	if waiting is queued at least 5 times, ...

Or certain actors:

	if any actions are queued for Arnold, ...
	if the number of actions queued for Arnold is greater than 5, ...

Or we can use this syntax to check only the very next action for a particular person:

	if eating the banana is queued next for the monkey, ...

DELETING FROM THE QUEUE

Actions are automatically removed from the queue as soon as they're performed, but we can also remove them without performing them:

	delete the first queued action for Eliza;
	delete the last queued action for Eliza;
	delete all queued actions for Eliza;

Or empty the whole queue:

	clear the action queue;

Example: *** Moving In - Actors move various items between rooms.

	"Moving In"

	Include Action Queuing by Jesse McGrew and Case Management by Emily Short.

	Moving Furniture is a scene. Moving Furniture begins when play begins.

	Living Room is a room. "Hauling furniture is such a pain. Good thing you [if Moving Furniture is happening]don't[otherwise]didn't[end if] have to do it yourself![line break]Your bedroom is to the east, your kitchen is west, and the street is outside to the north."

	Street is north of Living Room. "The front door of your new house is to the south." Outside of the living room is the street. Bedroom is east of Living Room. "Your living room is to the west." Kitchen is west of Living Room. "Your living room is to the east."
	
	The counter is a supporter in the kitchen, fixed in place.

	The house is a region. The bedroom, the living room, and the kitchen are in the house.

The movers will bring in a bunch of items from their truck.

	A vehicle called the moving truck is in the street. In the truck are a kitchen table, a TV stand, a television, a couch, a bed frame, a mattress, a bookcase, a night stand, a microwave oven, a toaster, a refrigerator, a box of spices, a box of silverware, a box of sheets, and a box of books. The night stand, the TV stand, the kitchen table, and the bed frame are portable supporters.

	Instead of opening something, say "You can work on that later." Instead of taking something, say "If you felt like carrying anything today, you wouldn't have hired the movers!"

	The bill is a thing. The description of the bill is "$500. Ouch!"

	When play begins: set up the big items queue; set up the small items queue.

Bruno will move the large items.

	Bruno is a transparent person in the street.

	To set up the big items queue:
		have Bruno move the refrigerator to the kitchen;
		have Bruno move the kitchen table to the kitchen;
		have Bruno move the television onto the TV stand in the living room;
		have Bruno move the mattress onto the bed frame in the bedroom;
		have Bruno move the bookcase to the bedroom;
		have Bruno move the box of books to the bedroom.

Chuck will move the small items. He can move two at once.

	Chuck is a transparent person in the street.

	To set up the small items queue:
		have Chuck move the spices and the silverware onto the kitchen table in the kitchen;
		have Chuck move the TV stand to the living room;
		have Chuck move the toaster and the microwave onto the counter in the kitchen;
		have Chuck move the night stand and the sheets to the bedroom;
		have Chuck move the bed frame to the bedroom.

Now we'll need some phrases to queue a group of actions for moving:

	To have (actor - person) move (x - thing) to (destination - room):
		queue actor trying taking x;
		let L be the location of the actor;
		plan a route for actor from L to destination;
		queue actor trying dropping x;
		plan a route for actor from destination to the street.
	
	To have (actor - person) move (x - thing) and (y - thing) to (destination - room):
		queue actor trying taking x;
		queue actor trying taking y;
		let L be the location of the actor;
		plan a route for actor from L to destination;
		queue actor trying dropping x;
		queue actor trying dropping y;
		plan a route for actor from destination to the street.

	To have (actor - person) move (x - thing) onto (base - supporter) in (destination - room):
		queue actor trying taking x;
		let L be the location of the actor;
		plan a route for actor from L to destination;
		queue actor trying waiting for the base;
		queue actor trying putting x on the base;
		plan a route for actor from destination to the street.

	To have (actor - person) move (x - thing) and (y - thing) onto (base - supporter) in (destination - room):
		queue actor trying taking x;
		queue actor trying taking y;
		let L be the location of the actor;
		plan a route for actor from L to destination;
		queue actor trying waiting for the base;
		queue actor trying putting x on the base;
		queue actor trying putting y on the base;
		plan a route for actor from destination to the street.

	To plan a route for (actor - person) from (loc - room) to (destination - room):
		while loc is not the destination
		begin;
			let way be the best route from loc to destination;
			queue actor trying going the way;
			let loc be the room the way from loc;
		end while.

We'll need a "waiting for" action when one mover is waiting for the other to bring a supporter. We can requeue the action immediately to keep him waiting until it arrives.

	Coworking relates one person to another (called the coworker). The verb to be employed with implies the coworking relation. Bruno is employed with Chuck.

	A thing can be delayed. A thing is usually not delayed.

	Waiting for is an action applying to one visible thing.

	Carry out someone trying waiting for something:
		if the noun is in the location of the person asked, perform the next queued action for the person asked instead;
		if the noun is not delayed and the player can see the person asked
		begin;
			say "[The person asked] looks around and says, 'Why's [the coworker of the person asked] taking so long with that [noun]?'";
			now the noun is delayed;
		end if;
		if the noun is not delayed and the person asked is in a room adjacent to the location
		begin;
			let X be the location of the person asked;
			say "You hear [the person asked] mumbling about [the coworker of the person asked] in the [X in lower case].";
			now the noun is delayed;
		end if;
		queue the person asked trying waiting for the noun immediately.

	Definition: a person is other if it is not the player.

	Instead of examining an other person (called mover):
		if the mover is carrying something, say "[The mover] is carrying [a list of things carried by the mover][if the mover is waiting for a supporter], looking frustrated as he waits for [the coworker of the mover] to bring [the particular supporter].";
		otherwise say "[The mover] is [if no actions are queued for the mover]standing here lazily.[otherwise]busy."
		
	To decide whether (mover - person) is waiting for a supporter:
		repeat with x running through supporters
		begin;
			change the particular supporter to x;
			if waiting for x is queued next for the mover, decide yes;
		end repeat;
		decide no.

	The particular supporter is a supporter which varies.	

	A person can be yappy or quiet. A person is usually quiet.	

	Every turn:
		repeat with mover running through other people
		begin;
			let griping be 0;
			let orker be the coworker of the mover;
			if orker is in the location of the mover and the mover is waiting for a supporter and the particular supporter is not in the location of the mover
			begin;
				if the mover is not yappy and the player can see the mover
				begin;
					if the orker is carrying the particular supporter, say "[The mover] says, 'Gee thanks, [orker]. It's about time you brought that [particular supporter]!'";
					otherwise say "[The mover] says, 'C'mon, [orker], what are you doing[if the orker is carrying something] with that [random thing carried by the orker][end if]? Bring in [the particular supporter]!'";
					now the mover is yappy;
				end if;
				if the mover is not yappy and the mover is in a room adjacent to the location
				begin;
					let X be the location of the mover;
					say "You hear [the mover] yelling at [the orker] in the [X in lower case].";
					now the mover is yappy;
				end if;
				let griping be 1;
			end if;
			if griping is 0, now the mover is quiet;
		end repeat.

We'll run the queued actions every turn.

	First every turn rule: perform the next queued action for every person.

The game ends once everything is moved and the player reads the bill.

	Moving Furniture ends when no actions are queued for Bruno and no actions are queued for Chuck.

	When Moving Furniture ends:
		if the player can see Chuck, say "Chuck hands you the bill.";
		otherwise say "Chuck steps [if the player is in the street]out of your house[otherwise]in[end if] and hands you the bill.";
		move Chuck to the location;
		now the player carries the bill.

	After examining the bill: end the game saying "You have moved in".

	Test me with "w/z/z/z/z/x chuck/z/z/z/z/z/z/e/z/z/z/z/z/z/z/z/e/w/z/z/z/z/z/z/e/z/z/z/z/z/z/z/z/z/w/n/z/z/z/s/z/z/z/z/e/w/z/read bill".

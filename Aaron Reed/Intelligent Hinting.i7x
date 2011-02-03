Version 5 of Intelligent Hinting by Aaron Reed begins here.

"Encodes knowledge about puzzles into the game's code, allowing it to know which puzzle the player is currently on, and even suggest the next move to be taken."

[
Version history:
Version 5: Updated for build 6E59.
Version 4: Cleaned up documentation.
Version 3: Fixed some bugs in the extension and examples & made some cosmetic changes, all suggested by Ron Newcomb; many thanks! Most notably, changed "do the action of" to "do the action of the person asked", which should make it user to use Intelligent Hinting with actors other than the player. Also fixed some bugs in Slay Doctor Lucky caught by Mark Tilford.
Version 2:
 -- Added "changes" debug command.
 -- Various documentation corrections and bug fixes. 
 -- Moved the test for "whether it seems (act - a stored action) is unfinished" to the new puzz-unfinished rulebook, so checks for new actions can be added. Ditto for "whether it seems (act - a stored action) is possible".
]

Use MAX_EXPRESSION_NODES of 300.
Use slow route-finding. [Due to a bug in Inform 5Z71.]

Book - Definitions


Part - Use Options

suggestion_disabled is a truth state that varies.

To suspend suggestion hinting: now suggestion_disabled is true.
To reinstate suggestion hinting: now suggestion_disabled is false.

To decide whether suggestion hinting is currently disallowed:
	if suggestion_disabled is true, decide yes;
	decide no.


Part - Puzzles and Tasks

Chapter - Puzzles

A puzzle is a kind of thing. 

Requiring relates one thing (called the requiree) to various things [puzzles or tasks]. The verb to require (he requires, they require, he required, it is required, he is requiring) implies the requiring relation.

A puzzle can be sequential. A puzzle is usually sequential. A puzzle is usually privately-named. [The children of a sequential puzzle must be solved in the order they are defined in the source; the children of a not sequential puzzle can be solved in any order.]

Chapter - Tasks


A task is a kind of thing. A task is usually privately-named. [A task is the atomic unit of a puzzle, and consists of a series of actions, which sometimes must be performed at a certain spot or under certain conditions. Tasks are marked complete by hand.]

A task has an object called the venue. The venue of a task is usually nothing. [The venue is the room we must be in before attempting to perform the actions in this task. Why an object and not a room? Because we can't have a null value for a room, which we need in case a puzzle requires no location.]

A task has a list of stored actions called the action-sequence. A task has a number called the action-position. [The action-sequence stores the actions, in order, that must be taken to complete this task. action-position keeps track, from turn to turn, of where we are in this sequence. Normally, authors will use the "do the action of..." procedure for modifying this list. ]

A task has a list of indexed texts called the command-sequence. [For specific strings to be input which cannot be represented by stored actions.]

A task has a list of objects called the apropos-list. [Either rooms or things not mentioned in the action-sequence which are nevertheless related to that task. Useful in not sequential puzzles to help the extension guess which puzzle the player is currently working on.]

A task can be reversible or irreversible. A task is usually irreversible. [A reversible task is eternally complete once it is marked as such; an irreversible task's definition is checked every turn.]

The red flag rules are an object-based rulebook. [Can prevent a task from being attempted until a certain condition is met.]

Section - Task Completion

[Just before reading a command (to avoid "last every turn" issues), check all rules that we've defined to see if any tasks should change to complete or incomplete. If this affects the saved endeavor, which is used to keep track of what we're working on, adjust it as necessary. ]

The list of cached-solved tasks is a list of things that varies.

To update the task status cache:
	repeat with item running through tasks:
		if item is reversible and item is solved and item is incomplete:
			let tmpitem be item;
			while tmpitem is not Winning-The-Game and tmpitem is listed in list of cached-solved tasks:
				if puzzle-testing changes or puzzle-testing all:
					say "(task [tmpitem] is now unsolved)";
					if the number of incomplete tasks in requiree of tmpitem is 1, say "(hence [requiree of tmpitem] now unsolved)";
				remove tmpitem from list of cached-solved tasks;
				now tmpitem is requiree of tmpitem; 
		otherwise if item is unsolved and item is complete:
			let tmpitem be item;
			while tmpitem is not Winning-The-Game and tmpitem is not listed in list of cached-solved tasks:
				if puzzle-testing changes or puzzle-testing all:
					say "(task [tmpitem] is now solved)";
					if requiree of tmpitem is solved, say "(hence [requiree of tmpitem] now solved)";
				add tmpitem to list of cached-solved tasks, if absent;
				let myctr be 0;
				repeat with reqs running through things required by requiree of tmpitem:
					if reqs is unsolved, increase myctr by 1;
				if myctr is 0, now tmpitem is requiree of tmpitem;
[	say "**l: [list of cached-solved tasks]**";]
	while saved endeavor is not nothing:
		if saved endeavor is Winning-The-Game:
			now saved endeavor is nothing;
			break;
		if saved endeavor is unsolved: 
[			say "(**it seems [saved endeavor] is unsolved: ";]
[			repeat with item running through things required by saved endeavor:
				if item is a task, say "[item]: [if item is complete]complete[end if]/[if item is incomplete]incomplete[end if]/[if item is solved]solved[end if]/[if item is unsolved]unsolved[end if])";
				otherwise say "[item] (not a task)";]
			break;
		now saved endeavor is requiree of saved endeavor;
[		say "(**now saved endeavor is [saved endeavor]**)";]
		if saved endeavor is unsolved:
			break;
	repeat with item running through list of cached-solved tasks:
		if item is a task and the action-position of item is not 0, now action-position of item is 0.

[It may not seem at first glance that it is strictly necessary to do this each turn, as opposed to each turn when a suggestion is requested; but since irreversible tasks might be true for only a single turn, and due to complexities involving the parsing of command-sequences, we always need to do this.]

Before reading a command (this is the keep task completion up to date rule):
	update the task status cache.

Definition: a task is incomplete if it is not complete. [Each task defines its own criteria for being "complete," but we can define a global negation. ]
			


Section - Assigning Actions to Tasks

[Define the procedure for assigning actions to tasks.]

Requirements rules is an object-based rulebook.

The temporary task is a thing that varies.

To do (chore - stored action):
	add chore to the action-sequence of the temporary task.

When play begins (this is the setting up requirements of tasks rule):
	repeat with item running through tasks:
		now the temporary task is item;
		follow the requirements rules for item.


Chapter - Miscellany

Definition: a thing is solved rather than unsolved if it is listed in the list of cached-solved tasks.

Definition: a thing is actionably-closed if it is closed and it is openable.

Winning-The-Game is a puzzle.

Platonic-Task is a task. Definition: Platonic-Task is complete: yes. [For the extension to compile before adding puzzles and tasks, we must indicate that "complete" is a valid adjective.]

Book - Initial Setup

Chapter - Puzzle Assocation Tables

[When play begins, we create an index that allows us to quickly see which nouns and locations are related to which tasks. This is only useful if there are any non-sequential puzzles and we'll need to make a guess as to what is the most relevant one to tackle next. If you want to change puzzle definitions in mid-stream, you'll need to "follow the setting up puzzle association tables rule" again. ]

When play begins (this is the setting up puzzle association tables rule):
	unless the number of not sequential puzzles is 0:
		repeat through Table of Puzzle Reference:
			blank out the whole row;
		generate puzzle lookup tables for Winning-The-Game.

The setting up puzzle association tables rule is listed last in the when play begins rules. [This is so that actions are associated before we create our lookup tables.]

To generate puzzle lookup tables for (problem - a puzzle):
	repeat with req running through unsolved tasks required by problem:
		repeat with step running through action-sequence of req:
			unless the noun part of step is nothing, associate noun part of step with req in candidates;
			unless the second noun part of step is nothing, associate second noun part of step with req in candidates;
		unless the venue of req is nothing:
			associate venue of req with req in candidates;
		repeat with item running through apropos-list of req:
			associate item with req in candidates;
	repeat with req running through unsolved puzzles required by problem:
		generate puzzle lookup tables for req.	

To associate (tchotchke - an object) with (req - a task) in candidates:
	if the number of blank rows in Table of Puzzle Reference > 0:
		choose a blank row in Table of Puzzle Reference;
		change item entry to tchotchke;
		change job entry to req.

Table of Puzzle Reference
job		item
a task	a thing
with 200 blank rows.


Book - Bookkeeping Routines

Chapter - Keeping Track of Player's History

The list of in-focus items is a list of things that varies. [We store the last ten objects the player has interacted with, to consult and get a sense of what the player is currently concerned with.]

Every turn (this is the Intelligent Hinting note the player's action rule):
	truncate the list of in-focus items to the last 9 entries;
	if current action is suggesting or current action is solving:
		unless noun part of relevant action is nothing or noun part of relevant action is a direction:
			add noun part of relevant action to the list of in-focus items;
		unless second noun part of relevant action is nothing or second noun part of relevant action is a direction:
			add second noun part of relevant action to the list of in-focus items;
	otherwise:
		unless noun part of current action is nothing or noun part of current action is a direction:
			add noun part of current action to the list of in-focus items;
		unless second noun part of current action is nothing or second noun part of current action is a direction:
			add second noun part of current action to the list of in-focus items.

The list of stored venues is a list of rooms that varies.

Every turn (this is the Intelligent Hinting note player's location rule):
	truncate the list of stored venues to the last 9 entries;
	add location to the list of stored venues, if absent.

The saved endeavor is an object that varies. [This can be a puzzle or a task.]

Book - Tools For Deciding Which Not Sequential Puzzle Is Next


To scour recent input for puzzle suggestions:
	repeat through the Table of Temp Task Rankings:
		blank out the whole row;
	if puzzle-testing all, say "(Last 10 interacted-with items: [list of in-focus items])";
	if puzzle-testing all, say "(Last 10 visited locations: [list of stored venues])";
	[Iterate through each unique puzzle/object correspondence.]
	repeat through table of Puzzle Reference:
		if job entry is solved, next; [not interested in tasks that already solved.]
		if item entry is a room:
			[If we've recently been in this location, score points for the associated task.]
			let ctr be 0;
			repeat with loc running through list of stored venues:
				increase ctr by 1;
				if item entry is loc, score ctr puzzle points for job entry;
		otherwise:
			[If the object here matches a recently interacted-with object, score points based on how long ago the interaction occurred. ]
			let ctr be 0;
			repeat with obj running through list of in-focus items:
				increase ctr by 1;
				if item entry is obj, score ctr puzzle points for job entry;
		[Finally, if any nouns in this puzzle's task are visible or held, score more points for that task.]
		if item entry is a thing and item entry is not nothing and ( item entry is visible or item entry is held ) : 
			if job entry is unsolved, score 11 puzzle points for job entry. [slowdown?]

To decide what object is the best choice of the ranked puzzles under (problem - a puzzle):
	sort Table of Temp Task Rankings in reverse puzz-rank order; [most likely first]
	let candidate be nothing;
	while candidate is nothing and there is a job in row 1 of Table of Temp Task Rankings:
		choose row 1 in Table of Temp Task Rankings;
		[reject any options that aren't parts of the puzzle we're currently considering. ]
		if the number of steps via the requiring relation from problem to job entry >= 0:
			let candidate be job entry;
		otherwise:
			blank out the whole row;
			sort Table of Temp Task Rankings in reverse puzz-rank order;
	if puzzle-testing all:
		repeat through table of Temp Task Rankings:
			say "[line break]-->[job entry] : [puzz-rank entry] points";
		say line break;
	if candidate is nothing: [no way to guess; so just pick one at random.]
		if puzzle-testing inferences, say "(no matches found; choosing at random)";
		now candidate is a random unsolved thing required by problem;	 
	[if what we picked is part of something unsolved, pick that instead.]
	let parent be requiree of candidate;
	while parent is sequential and parent is unsolved and parent is not problem and problem is not required by parent:
		now candidate is parent;
		now parent is requiree of candidate;
	decide on candidate.

To score (points - a number) puzzle points for (selectee - a task):
	if there is a job of selectee in Table of Temp Task Rankings:
		choose row with a job of selectee in Table of Temp Task Rankings;
		now puzz-rank entry is puzz-rank entry + points;
	otherwise:
		if the number of blank rows in Table of Temp Task Rankings > 0:
			choose a blank row in Table of Temp Task Rankings;
			now job entry is selectee;
			now puzz-rank entry is points.	

Table of Temp Task Rankings
job		puzz-rank
a task	a number
with 20 blank rows.	


Book - Suggesting

Fake-actioning is an action out of world applying to nothing. [By default, a newly created stored action is set to "waiting." This creates difficulties for our purposes, as we need a value that means "no real action" to determine whether we've found one yet or not; so here it is.]

The relevant location is a room that varies. The relevant action is a stored action that varies. The relevant-direction is a direction that varies. Actually-down is a truth state that varies. [These global variables are used to store guesses by the routines below. The last variable tracks whether we mean "default down" (of a newly created direction variable) or "actually down".]

The macguffin-queue is a list of objects that varies. [Currently, it's not computationally feasible to identify locked doors along a route between an origin and destination. As a result, we can't discover an interposing locked door until we bump into it. Happily, however, this plays into the philosophy of showing not telling; so we'll blithely head towards a locked door without the key, and once we've "discovered" the troublesome door, note that we're looking for the key now in this list. The extension attempts to acquire anything in the macguffin-queue before proceeding to the next action.]

Chapter - Suggesting

[suggesting is an out of world action that merely prints its recommendation of the next action, without taking it.]

Understand "suggest" as suggesting. Suggesting is an action out of world applying to nothing.

Check suggesting when suggestion hinting is currently disallowed (this is the check whether suggest is currently allowed rule):
	print IH message for suggestions-disallowed instead.

Carry out suggesting:
	now relevant action is the suggested action;
	unless relevant action is the action of the person asked fake-actioning:
		process appropriate action.


Chapter - Solving

[Solving actually performs the action for the player.]

Understand "solve" as solving. Solving is an action applying to nothing.

Check solving when suggestion hinting is currently disallowed (this is the check whether solve is currently allowed rule):
	print IH message for suggestions-disallowed instead.

Carry out solving:
	now relevant action is the suggested action;
	unless relevant action is the action of the person asked fake-actioning:
		process appropriate action, actually performing.


Chapter - Determining the Suggested Action

To decide which stored action is the suggested action:
	if Winning-The-Game is solved:
		print IH message for all-puzzles-solved;
		decide on the action of the person asked fake-actioning;
	[we can't just assume saved endeavor because something earlier might have become incomplete.]
	let puzz be next task in Winning-The-Game; [This will recurse down through required puzzles as needed.]
	if puzzle-testing selection, say "(Next incomplete task: [puzz])";
	if venue of puzz is not nothing and venue of puzz is not a room:
		say "(Error in Intelligent Hinting puzzle definition: [puzz] has a venue of [venue of puzz], which does not seem to me to be a room.)";
		decide on the action of the person asked fake-actioning;
	now relevant location is venue of puzz;
	let ctr be 1;
	repeat with portion running through action-sequence of puzz:
		if it seems portion is unfinished:
			if ctr > action-position of puzz and a move is implied by portion:
				decide on relevant action;
		otherwise:
			if puzzle-testing inferences, say "(It seems [portion] is finished; skipping)";
			if action-position of puzz < ctr, increase action-position of puzz by 1;
		increase ctr by 1;
	if relevant location is not nothing and location is not venue of puzz:	
		if puzzle-testing inferences, say "([location] is not venue of [puzz] ([venue of puzz]))";
		if we can move to relevant location:
			decide on relevant action;
	consider the red flag rules for puzz;
	if the rule failed:
		if puzzle-testing selection, say "(failed red flag rule)";
		now relevant action is the action of the person asked waiting;
		decide on relevant action;
	[Deal with the command-sequence (literal strings to be tried as commands) first. To save creating a second variable to track our position in this sequence, we use negative numbers: -1 corresponds to the first command, -2 the 2nd, and so on.]
	if number of entries in command-sequence of puzz > 0 and ( action-position of puzz >= number of entries in action-sequence of puzz ) or ( action-position of puzz is 0 and number of entries in action-sequence of puzz is 0 ) , now action-position of puzz is -1;
	if action-position of puzz < 0 and ( -1 * action-position of puzz ) > the number of entries in command-sequence of puzz, now action-position of puzz is 0;
	if action-position of puzz < 0 and the number of entries in command-sequence of puzz >= ( -1 * action-position of puzz ) :
		let temppos be -1 * action-position of puzz;
		if puzzle-testing selection, say "(trying step [temppos] of command-sequence)";
		now relevant command is entry temppos in command-sequence of puzz;
		if we are suggesting:
			process appropriate action, as a command;
		otherwise:
			process appropriate action, as a command, actually performing;
			decrease action-position of puzz by 1;
		decide on the action of the person asked fake-actioning;
	[If we've got a positive action-position, we must be using the more typical action-sequence.]
	if action-position of puzz >= number of entries in action-sequence of puzz, now action-position of puzz is 0;
	if action-position of puzz + 1 is at most the number of entries in action-sequence of puzz :
		let candidate be entry ( action-position of puzz + 1 ) in action-sequence of puzz;
		if candidate is entering something actionably-closed ( called portal ) :
			if puzzle-testing inferences, say "(trying to enter something actionably-closed ([portal]))";
			if shut portal causes surmountable difficulties:
				decide on relevant action;
			now relevant action is the action of the person asked opening portal;
			decide on relevant action;
		if candidate is inserting something into something actionably-closed ( called parent ) :
			if puzzle-testing inferences, say "(trying to insert something into something actionably-closed ([portal]))";
			if shut parent causes surmountable difficulties:
				decide on relevant action;
			now relevant action is the action of the person asked opening parent;
			decide on relevant action;
		if noun part of candidate is a person (called partner) and partner is not visible:
			if puzzle-testing inferences, say "(trying to track down [partner])";
			if we can move to location of partner:
				decide on relevant action;
			now relevant action is the action of the person asked waiting;
			decide on relevant action;
		if second noun part of candidate is a person (called partner) and partner is not visible:
			if puzzle-testing inferences, say "(trying to track down [partner])";
			if we can move to location of partner:
				decide on relevant action;
			now relevant action is the action of the person asked waiting;
			decide on relevant action;
		now relevant action is entry ( action-position of puzz + 1 ) in action-sequence of puzz;
	unless it seems relevant action is possible:
		if puzzle-testing selection, say "(it seems [relevant action] is not possible; waiting instead.)";
		now relevant action is the action of the person asked waiting;
	increase action-position of puzz by 1;
	if puzzle-testing all, say "(action-position of [puzz] is now [action-position of puzz])";
	decide on relevant action.


[ This is the good chef's rule: Before acting, ensure that we have gathered all the necessary ingredients first. If there are items we've determined are necessary to *get* the items that are necessary (like keys), deal with those first. ]

To decide whether a move is implied by (act - a stored action):
	if act is going, decide no;
	now relevant action is the action of the person asked fake-actioning;
	now actually-down is false;
	if the number of entries in macguffin-queue > 0 and steps must be taken to acquire entry ( number of entries in macguffin-queue ) of macguffin-queue, decide yes; 
	unless the noun part of act is nothing:
		if steps must be taken to acquire noun part of act, decide yes; [Note: can't reject "taking something" at this point because steps must be taken checks for too many things held, moving to location, etc.]
	unless the second noun part of act is nothing:
		if steps must be taken to acquire second noun part of act, decide yes;
	decide no.

[Finally, here are two routines encapsulating some common-sense knowledge about the library, used to try to guess whether something has already been solved, or whether something seems currently possible, to the best of the library's knowledge. Authors can add this knowledge for other verbs by creating new unfinished rules in their code.]

Puzz-unfinished is a rulebook.

To decide whether it seems (act - a stored action) is unfinished:
	now temp-act is act;
	consider the puzz-unfinished rules;
	if rule failed, decide no;
	decide yes.

temp-act is a stored action that varies.

A puzz-unfinished rule:
	if temp-act is opening something and noun part of temp-act is open, rule fails;
	if temp-act is closing something and noun part of temp-act is closed, rule fails;
	if temp-act is unlocking something with something and noun part of temp-act is unlocked, rule fails;
	if temp-act is locking something with something and noun part of temp-act is locked, rule fails;
	if temp-act is switching on something and noun part of temp-act is switched on, rule fails;
	if temp-act is switching off something and noun part of temp-act is switched off, rule fails;
	if temp-act is taking something and noun part of temp-act is held, rule fails;
	if temp-act is dropping something and noun part of temp-act is not held, rule fails;
	if temp-act is entering something and player is enclosed by noun part of temp-act, rule fails;
	if temp-act is getting off something and player is not enclosed by noun part of temp-act, rule fails;
	if temp-act is trying wearing something and noun part of temp-act is worn, rule fails;
	if temp-act is taking off something and noun part of temp-act is not worn, rule fails;
	if temp-act is putting something on something and second noun part of temp-act encloses noun part of temp-act, rule fails;
	if temp-act is removing something from something and noun part of temp-act is not enclosed by second noun part of temp-act, rule fails.

Puzz-possibility is a rulebook.

To decide whether it seems (act - a stored action) is possible:
	now temp-act is act;
	consider the puzz-possibility rules;
	if rule failed, decide no;
	decide yes.

A puzz-possibility rule:
	if ( temp-act is opening something or temp-act is closing something or temp-act is switching on something or temp-act is switching off something or temp-act is taking something ) and noun part of temp-act is not touchable, rule fails;
	if temp-act is unlocking something with something and ( second noun part of temp-act is not held or noun part of temp-act is not visible ) , rule fails;
	if temp-act is locking something with something and ( second noun part of temp-act is not held or noun part of temp-act is not visible ) , rule fails;
	if temp-act is dropping something and noun part of temp-act is not held, rule fails;
	if temp-act is taking off something and noun part of temp-act is not worn, rule fails;
	if temp-act is putting something on something and ( noun part of temp-act is not held or second noun part of temp-act is not visible ) , rule fails;
	if temp-act is removing something from something and ( noun part of temp-act is not touchable or second noun part of temp-act is not visible ) , rule fails.


Section - Finding the Next Task 


To decide which task is next task in (problem - a puzzle):
	if problem is sequential:
		if puzzle-testing all, say "(checking sequential puzzle [problem])";
		repeat with req running through things required by problem:
			if req is a task and req is unsolved:
[				say "(**deciding on [req]**)";]
				decide on req; 
			otherwise if req is a puzzle and req is unsolved:
[				say "(**deciding on next task in [req]**)";]
				decide on next task in req;
	otherwise: [problem is not sequential ]
		if puzzle-testing all, say "(checking not sequential puzzle [problem])";
		unless saved endeavor is nothing: [problem is not sequential & something it requires is our saved endeavor.]
[			say "(saved endeavor: [saved endeavor])";]
			let tmptask be saved endeavor;
			unless problem is tmptask:
				while tmptask is not required by problem:
					now tmptask is requiree of tmptask;
[			say "(**[tmptask]**)";]
			if tmptask is a task:
[				say "**tmptask deciding on [tmptask]**";]
				decide on tmptask;
			otherwise if problem is not tmptask:
[				say "**tmptask deciding on next task in [tmptask]**";]
				decide on next task in tmptask;
[		say "**made it this far**";]
		[If we've made it this far, we need to choose a new thing to do.]
		if puzzle-testing inferences, say "(no saved endeavor: looking for recent actions/moves related to [problem])";
		scour recent input for puzzle suggestions;
		let candidate be the best choice of the ranked puzzles under problem;
		if puzzle-testing inferences, say "(choosing [candidate])";
		[If we've ended up with a task, we're solved; otherwise save our progress and recurse.]
		if candidate is a task and candidate is unsolved:
			now saved endeavor is candidate;
			decide on candidate;
		otherwise if candidate is a puzzle and ( candidate requires something unsolved or candidate requires something unsolved ) :
			now saved endeavor is nothing;
			now saved endeavor is next task in candidate;
			decide on saved endeavor.

Section - Displaying and Carrying out Results


Suggestion flag is a truth state that varies. [Useful if code ever needs to determine if an action being tried was the result of a "suggest" command or not.]

Saved parent is an object that varies. [A recursion-loop checking variable.]

To process appropriate action, actually performing and/or as a command: 
	if as a command:
		if actually performing:
			print IH message for command-solving;
			now reparse flag is true;
		otherwise:
			print IH message for command-suggesting;
	otherwise:
		now saved parent is nothing; 
		if relevant action is the action of the person asked going down:
			if actually-down is false:
				if relevant-direction is a direction, now relevant action is the action of the person asked going relevant-direction;
				otherwise now relevant action is the action of the person asked waiting;
		otherwise if relevant action is the action of the person asked fake-actioning:
			print IH message for no-action-found;
			now relevant action is the action of the person asked waiting;
		if actually performing:
			print IH message for action-solving;
			now suggestion flag is true;
			try relevant action;
			now suggestion flag is false;
		otherwise:
			print IH message for action-suggesting.

Table of Intelligent Hinting Messages
msg							txt
action-solving			"([relevant action])[line break]"
action-suggesting		"Try [relevant action].[line break]"
command-solving		"(trying: [relevant command])"
command-suggesting	"Try typing [relevant command].[line break]"
no-action-found			"(Can't find an action to take.)"
all-puzzles-solved		"(All puzzles are solved.)"
suggestions-disallowed	"(I am not able to make suggestions at the moment.)"

IH message is a kind of value. The IH messages are action-solving, action-suggesting, command-solving, command-suggesting, no-action-found, all-puzzles-solved, suggestions-disallowed. 

To print IH message for (ihmsg - an IH message):
	if there is a msg of ihmsg in Table of Intelligent Hinting Messages:
		choose row with a msg of ihmsg in Table of Intelligent Hinting Messages;
		say txt entry.

[To perform a stored command (as indexed text), we need to be slightly trickier, since we can't change the player's input at this late stage. We'll skip to the next turn and override the normal procedure for reading a command from the player, replacing it with our stored text.]

The relevant command is an indexed text that varies. Reparse flag is a truth state that varies.

Rule for reading a command when reparse flag is true:
	now reparse flag is false;
	replace the player's command with "[relevant command]".


Section - Getting Around Locked Barriers

[ If we ever need to open something, check first to see if it's locked; if so, whether there's an accessible key; if so, note that the key has become our first priority instead. ]

To decide whether shut (parent - a thing) causes surmountable difficulties: 
	if puzzle-testing all, say "(deciding whether shut [parent] causes surmountable difficulties)";
	if parent is saved parent: [We've recursed back to here, possibly because the key to a locked thing in our way is on the other side of the locked thing; so give up entirely.]
		now relevant action is the action of the person asked fake-actioning;
		decide yes;
	now saved parent is parent;
	if parent is locked and parent provides the property matching key and matching key of parent is on-stage:
		if player holds matching key of parent:
			now relevant action is the action of the person asked unlocking parent with matching key of parent;
			decide yes;
		if steps must be taken to acquire matching key of parent:
			if matching key of parent is listed in macguffin-queue: [another recursion check, which catches circular loops of lock/key dependencies.]
				now relevant action is the action of the person asked fake-actioning;
				decide yes;
			add matching key of parent to macguffin-queue;
			now relevant action is the action of the person asked opening parent; [We know it won't work, but we try it anyway, to demonstrate to the player that it's locked.]
			decide yes;
	decide no.

Section - Acquiring Unheld Objects

[This next bit determines the next logical step to acquire an item; moving through the map, and retrieving keys for and opening locked doors and containers in the way. If taking the item would exceed the player's carrying capacity, we try to make room for it by using a hold-all or dropping something we guess is unimportant. ]

To decide whether steps must be taken to acquire (macguffin - an object):
	if puzzle-testing inferences, say "(deciding whether steps must be taken to acquire [macguffin])";
	if macguffin is nothing, decide no;
	if macguffin is off-stage, decide no;
	if macguffin is a person, decide no;
	if macguffin is a door, decide no;
	if the player encloses macguffin, decide no;
	if macguffin is portable and macguffin is not part of something:
		if macguffin is touchable:
			if the number of things held by player < carrying capacity of player:
				now relevant action is the action of the person asked taking macguffin;
				remove macguffin from macguffin-queue, if present;
				decide yes;
			otherwise:
				if a player's holdall is touchable:
					now relevant action is the action of the person asked inserting macguffin into a random touchable player's holdall;
					decide yes;
				[no holdall, so we'll have to drop something instead.]
				repeat with item running through probably-uncrucial things held by player:
					now relevant action is the action of the person asked dropping item;
					decide yes;
				[nothing we're confident dropping, so fail.]
				decide no;
		if macguffin is enclosed by location:
			if holder of macguffin is closed and holder of macguffin is openable:
				if shut ( holder of macguffin ) causes surmountable difficulties, decide yes;
				if holder of macguffin is locked and holder of macguffin provides the property matching key and matching key of ( holder of macguffin ) is off-stage, decide no;
				now relevant action is the action of the person asked opening ( holder of macguffin ) ;
				decide yes;
			if holder of macguffin is open and holder of macguffin is enterable and macguffin is not touchable:
				now relevant action is the action of the person asked entering holder of macguffin;
				decide yes;
	if location is location of macguffin, decide no;
	if we can move to location of macguffin, decide yes;
	decide no.

[The following definition is crude at best, but exists to give the extension an idea of what not to drop if it must drop something. In most cases, you'll want to program any necessary inventory management yourself.]

Definition: a thing is probably-uncrucial: 
	if it is lit, decide no;
	if it is a player's holdall, decide no;
	if it encloses something, decide no;
	if it is worn by player, decide no;
	if it is part of something held by player, decide no;
	decide yes.

Section - Moving To Venues

[Attempt to move to a location, first checking for open pathways, then looking for routes through locked doors. If the latter are found, checked for locked doors in the way and deal with them, otherwise try to move one room towards our destination. ]

To decide whether we can move to (area - a room):
	if puzzle-testing inferences, say "(deciding whether we can move to [area])";
	let way be the best route from location to area;
	if way is a direction:
		if puzzle-testing all, say "(open way: [way])";
		now relevant action is the action of the person asked going way; 
		if way is down, now actually-down is true; 
		decide yes;
	[We didn't find an open route, so we'll checked closed ones. Note that ideally there would be a third check here preferring closed but unlocked doors, but in practice even two pathfinding calls causes a significant slowdown for all but the smallest games. ]
	let way be the best route from location to area, using even locked doors;
	if way is a direction:
		if puzzle-testing all, say "(way through a door: [way])";
		if holder of player is not a room:
			now relevant action is the action of the person asked exiting;
			decide yes;
		repeat with portal running through visible closed doors:
			if the other side of portal is the room way from the location:
				if puzzle-testing all, say "([the portal] is in our way)";
				if portal is not openable, decide no;
				if shut portal causes surmountable difficulties, decide yes;
				now relevant action is the action of the person asked opening portal;
				decide yes;
		now relevant action is the action of the person asked going down;
		now relevant-direction is way;
		if way is down, now actually-down is true;  [We can't say just "going"; so "going down" stands in as a surrogate, and "necessary direction" holds the temporary value. We don't want to try to make necessary direction part of the stored action just yet, since if something goes wrong with the pathfinding we'd get a run-time error for trying to put a non-direction there.]
		decide yes;
	decide no.


Part - Debugging Verbs 

Puzzle-debug-status is a number that varies. 

To decide whether puzzle-testing selection: if puzzle-debug-status is 1 or puzzle-debug-status is 4, decide yes; decide no.

To decide whether puzzle-testing inferences: if puzzle-debug-status is 2 or puzzle-debug-status is 4, decide yes; decide no.

To decide whether puzzle-testing changes: if puzzle-debug-status is 3 or puzzle-debug-status is 4, decide yes; decide no.

To decide whether puzzle-testing all: if puzzle-debug-status is 4, decide yes; decide no.


Chapter - Listing Puzzles - Not For Release


Listing requirements is an action out of world applying to nothing. Understand "plist" or "puzzle list" as listing requirements.

Carry out listing requirements:
	show puzzle tree for Winning-The-Game with indent 0.

To say (N - a number) spaces: 
	repeat with index running from 1 to N:
		say " ".

To show puzzle tree for (problem - a puzzle) with indent (indent - a number):
	say indent spaces;
	say "[bold type][problem][roman type] [if problem is solved](solved) [end if][if problem is not sequential](not sequential)[end if] [if problem is saved endeavor]***[end if][line break]";
	repeat with puzz running through things required by problem:
		if puzz is a puzzle:
			show puzzle tree for puzz with indent ( indent + 4 ) ;
		otherwise:
			say ( indent + 4 ) spaces;
			say "[puzz] [if puzz is complete](complete)[end if] [if puzz is saved endeavor]***[end if][line break]".

Chapter - Puzzle Debugging - Not For Release


Puzzle debugging is an action out of world applying to one topic. Understand "puzzle [text]" as puzzle debugging. Understand "puzzle" as a mistake ("[puzzle-debug-explanation]"). To say puzzle-debug-explanation: say "-- Type PUZZLE SELECTION to show info on why certain tasks are selected as the next action[line break]-- Type PUZZLE INFERENCES to show detail on inferred actions resulting from tasks[line break]-- PUZZLE ALL shows both of the above plus more detailed information[line break]-- PUZZLE CHANGES notifies you when any tasks become solved or unsolved[line break]-- PUZZLE LIST shows the current puzzle tree for Winning-The-Game[line break]-- PUZZLE OFF turns off puzzle debugging information."

After reading a command:
	if the player's command includes "puzzle":
		if the player's command includes "off":
			now puzzle-debug-status is 0;
		otherwise if the player's command includes "selection":
			now puzzle-debug-status is 1;
		otherwise if the player's command includes "inferences":
			now puzzle-debug-status is 2;
		otherwise if the player's command includes "changes":
			now puzzle-debug-status is 3;
		otherwise if the player's command includes "all":
			now puzzle-debug-status is 4;
		unless the player's command matches "puzzle" or the player's command includes "list", say "(Puzzle debug status is now [if puzzle-debug-status is 1]show selection info[otherwise if puzzle-debug-status is 2]show inferences info[otherwise if puzzle-debug-status is 3]showing changes info[otherwise if puzzle-debug-status is 4]showing all info[otherwise]off[end if].)".


Intelligent Hinting ends here.



---- DOCUMENTATION ----

Inform's world model provides detailed internal knowledge of the positions of objects, rooms, and characters in a game, but very little knowledge of the puzzles an author may have built around those objects. Intelligent Hinting allows an author to encode that knowledge, making puzzles easier to test, hint, and document. Players benefit with a set of command which provide hints of what to do next, much like the similar feature in many computer chess programs.

In addition to the small examples included within the extension, the author has converted the 350-point Crowther/Woods "Adventure" to make use of Intelligent Hinting, and examples from this are frequently used here. You can find this code at http://aaronareed.net/if/advent-hint.txt. (The extension-related code is all at the bottom: search for "Part - Puzzles" in the Adventure source to jump to it.)

Chapter: Puzzles

Section: Defining Puzzles

For the purposes of this extension, we can define a puzzle as "a goal that must be accomplished to move the game towards completion." This concept is embodied here in a new kind of object, the "puzzle". Puzzles represent not specific actions but conceptual building blocks, the big-picture steps needed to finish the game.

Large puzzles are sometimes comprised of smaller puzzles. The new "requiring" relation is used to emulate this. If one puzzle requires another, it means the second must be solved before the first can be considered as such. In fact, this is the definition of solved: if everything a puzzle requires is solved, it itself is solved. We can check whether a puzzle is "solved" or "unsolved", but cannot set this by hand. (We'll explain later how puzzles do become solved.)

Intelligent Hinting defines one puzzle by default, "Winning-The-Game," which must require a sequence of puzzles broadly outlining the necessary steps to finish the game from beginning to (one) ending. 

For the standard IF example game, Cloak of Darkness, we might define three puzzles:

	Winning-The-Game requires Noticing-The-Dark-Room, Hanging-The-Cloak, and Reading-The-Message. 

(Hyphenating puzzle names is not required, but is a useful habit to adopt, since puzzle names often involve the names of objects or rooms and therefore can easily confuse Inform.)

Crowther and Woods' classic, Adventure, contains many, many more puzzles; but on the highest level, the overview is almost as simple:

	Winning-The-Game requires Entering-The-Cave, Staying-Alive, Finding-Most-Treasures, Final-Treasures, and Solving-The-Master-Level.

Finding-Most-Treasures is broken down into a group of puzzles like Mt-King-Area-Treasures, Plover-Treasures, etc., and some of those in turn require additional puzzles detailing the steps needed to complete each of those sequences.

By default, the order in which we list the required puzzles is the order they must be solved in. We can change this by declaring a single puzzle to be "not sequential," in which case the steps it requires may be solved in any order. A puzzle is "sequential" by default.


Chapter: Tasks


Section: Defining Tasks


Puzzles can also require another new object, the "task." We might call a task "the specific step needed to advance its parent puzzle towards a solution," or, perhaps, "the action the designer wishes the player to take next." Tasks cannot require anything and are always internally sequential.

A task represents a series of actions to be performed. In addition, a task may define a room where those actions must take place in. In fact, both values are optional, though at least one must be present: if no venue is specified, the actions take place wherever the player happens to be, while if there are no actions, the task merely requires being in a certain place.

Again, from Cloak of Darkness:

	Noticing-The-Dark-Room is a task. The venue is The Bar. [Note that while this is not strictly necessary to winning the game, it demonstrates the logic of why the later actions are performed, and is thus useful both for testing the clue and so later actions make sense to a player requesting hints.]

	Hanging-The-Cloak is a task. The venue is Cloakroom. Requirements for Hanging-The-Cloak: do the action of putting the cloak on the hook.  

	Reading-The-Message is a task. The venue is The Bar. Requirements for Reading-The-Message: do the action of examining the scrawled message. 

Or, from Adventure:

	Catching-The-Bird is a task with venue In_Bird_Chamber. Requirements for Catching-The-Bird: do the action of taking cage; do the action of catching bird. 

Note the syntax for adding actions. An object-based rulebook, the "requirements" rules, is processed when play begins to generate the list of actions necessary to complete the task, which are added via the "do (a stored action)" routine. Actions are performed in the order they are defined in. This could be useful to create kinds of actions which always require a certain first or last step, as in "First requirements for an eating task: do the action of the person asked taking the fork." (Note that it is always "requirements" even if there is only one.)

It might seem like a great deal of work to define each individual action that must be taken to solve the game in this way. Fortunately, Intelligent Hinting will automatically perform preliminary actions necessary for the commands in our requirements rule to make sense, to the limits of the standard library's world model. This means that it will move to venues via pathfinding and gather any required portable objects along the way. If the venue or a required object is behind a locked barrier, Intelligent Hinting first attempts to locate the necessary key(s) before continuing, and will unlock or open as necessary; if taking an item would exceed the player's carrying capacity, it first tries to drop or put into a holdall the least recently taken thing. It is also smart enough to skip steps that have already been taken: it will not try to wear something that's already worn, or enter something the player is already inside.

Another example from Adventure illustrates:

	Recharging-Lantern is a task. Requirements for Recharging-Lantern: do the action of inserting coins into vending machine; do the action of taking fresh batteries; do the action of inserting fresh batteries into lantern.

That's it. We don't need to track down the various items (the coins, the lantern), since the extension will do that for us, and we don't need to specify a venue, since it can see the vending machine is fixed in place and at Dead_End_13, and will navigate the maze on its own.

The result of this is that puzzles can concern themselves less with common-sense actions like opening doors, and more with actions that produce specific changes in our story.

Section: Completing Tasks

To tell Intelligent Hinting that a task has been accomplished, we need to provide a definition for when it is "complete." This should be a condition that is true immediately after the final step in its action sequence succeeds:

	Noticing-The-Dark-Room is a task. The venue is The Bar. Definition: Noticing-The-Dark-Room is complete: if location is The Bar, yes.

	Slaying-The-Gorgon is a task. Requirements for Slaying-The-Gorgon: do the action of averting eyes; do the action of pointing mirror at Medusa. Definition: Slaying-The-Gorgon is complete: if Medusa is dead, yes.

This works fine for tasks that end in irrevocable actions such as the two above. However, some tasks can be reversed by the player, NPCs, or changing conditions. In Adventure or Zork, the overriding goal is to return a series of treasures to a central location. If a player (or a thief) takes a returned treasure and moves it somewhere else, the extension needs to know that this task is now incomplete again.

To indicate this, a task can optionally be "reversible" (the default and opposite condition is "irreversible"). Once an irreversible task is complete, its definition is never bothered with again; but a reversible task is checked for completion (or lack thereof) on every turn. 

	Returning-The-Jewels is a reversible task with venue Inside_Building. Requirements for Returning-The-Jewels: do the action of dropping jewels. Definition: Returning-The-Jewels is complete if jewels are in Inside_Building.

Since we've specified the above as a reversible task, we need to take care that our definition specifies the conditions for both a complete *and* an incomplete state.

Completion definitions for reversible tasks must be defined carefully. For example, think of catching the bird in Adventure. This must be a reversible task, since the bird is later used to drive off the snake, and if we release it before that happens we'd need to re-capture it). So at first you might think something like this would do the job:

	Definition: Catching-The-Bird is complete if bird is in cage.

But after the snake is driven off, it no longer matters whether the bird is in the cage or not, and now we *don't* want Intelligent Hinting to try to re-capture it. The correct definition is thus:

	Definition: Catching-The-Bird is complete if snake is off-stage or bird is in cage.

Another example from Adventure: we need to fill the bottle to water the beanstalk to get to a region containing treasures. Thinking through these consequences carefully, we arrive at:

	Definition: Getting-Water is complete if Giant-Area-Treasures is solved or  size of plant is huge or ( water_in_bottle is in bottle and player holds bottle ) .

If we've retrieved all the necessary treasures, it no longer matters whether we have the water or not; if the plant has grown so that we *can* retrieve those treasures, it also no longer matters. Only if both of those conditions are false is it important for us to check whether the player has filled and carries the bottle.

As with puzzles, we can check whether a task is complete or incomplete, but we cannot set these values other than through a definition.


Section: Red Flag Rules

Sometimes it is useful to add a third component to the specification of the task: the notion of a inhibitor that prevents the task from being performed until a certain condition is met. For this purpose, Intelligent Hinting defines a rulebook called the "red flag rules"; adding a rule for a task and causing it to fail under certain conditions will prevent that task from being attempted.

As it happens, Adventure never needs to make use of this, but here's a hypothetical example from "Beyond Zork," where we take a ride on a scenic tram and need to jump out at a certain support tower to explore the jungle below:

	Reaching-The-Jungle is a task with venue Jungle Skyway. Requirements for Reaching-The-Jungle: do the action of exiting. A red flag rule for Reaching-the-Jungle: if first support tower is not visible, rule fails.

If the rule fails, the extension will try to "wait" until a move where the red flag rule succeeds.

Section: The Command-Sequence

As an alternative to giving a task a list of stored actions to try, we can instead give it a "command-sequence" (a list of indexed texts). This is useful to represent commands like "take all" that can't be stored actions, or for input that is parsed differently than the norm, like responses to questions in a custom conversation system.

	Preparing-For-Plover-Room is a task with venue In_Alcove and command-sequence {"drop all"}. 

The Plover Room puzzle in Adventure requires that the player not be carrying anything before they enter. Since we have no way of knowing what specific items the player might be carrying at this particular moment, we can't issue individual "drop" commands; but we can give the task a command-sequence of the string "drop all". Adventure also uses this for the "fee, fie, foe, foo" sequence of magic words in the Giant Room.

Note that none of the automatic key-finding, opening or unlocking code will function when using a command-sequence, as Intelligent Hinting can't pick out the nouns from the string; these things will have to be taken care of by hand, perhaps with a standard task just before.

Section: The Apropos-List

As mentioned earlier, some puzzles can be "not sequential", meaning they can be solved in any order, as is common in parts of many treasure-hunting games like Zork and Adventure. When asked to recommend an action while in the midst of a puzzle that's not sequential, Intelligent Hinting will automatically make a good guess as to which potential task the player is currently most involved with, by comparing recent input and visited locations to every noun and venue mentioned in the various tasks required by the current puzzle. 

If necessary, we can assist the extension by adding to a task a list of objects called the "apropos-list". These can be either rooms or things. If the player has recently been located in or interacted with any of these, tasks involving them will be more likely to be selected when determining the next move to suggest. Here's an example from Adventure, the first task of Giant-Area-Treasures, itself a member of Finding-Most-Treasures, which is not sequential:

	Getting-Water is a task with venue In_Pit. Requirements for Getting-Water: do the action of the person asked filling bottle. The apropos-list is {the stream, At_West_End_Of_Twopit_Room, plant, beanstalk_top, hole-above-pit}. 

The bottle and the location In_Pit are automatic indicators that the player may be stuck on this puzzle. In addition, we add the stream (since it's just an inferred part of the "filling" action) and a list of other props and locations that a player stuck on this puzzle might be interacting with, making the extension very likely to select the correct puzzle if asked for a hint.

Chapter: Structuring Tasks

Section: Helpful Info

A key point to think about when structuring task objects is this: What steps are actions with consequences not built in to the standard Inform library? "Searching" is a common one: a hidden key is often represented by moving the key object to the map "instead of searching" some object. "Instead" is a giveaway here: the library has no conception that the object and the key are in any way related. For this reason, both "search object" and "take key" should be manually added to the task; the library has no idea that searching the object will result in the key appearing, and so neither does Intelligent Hinting.

If possible, it's best to structure objects involved in puzzles such that they *do* correspond to the world model. For an example of this, see the gold chain in "Adventure," which cannot be removed from the bear until after he is fed and it is unlocked. It would be easy to just implement this with an "Instead of taking the chain" rule, but to make things closer to the world model, we give the chain "fixed in place" by default, and change it to "portable" at the appropriate time. This prevents Intelligent Hinting from attempting to take the chain before unlocking it, which it would do if an instead rule was used, since it would have no way of knowing the chain can't be taken.

Care must be taken, also, with long action-sequences in single tasks. For example: if a puzzle requires dropping a held item and then doing something to it, and these are both part of the same task, the extension will set the item down and then try to pick it up again, since it thinks it needs to be holding it to perform the second action-- and next it will drop the item again since it sees the "dropping" action is incomplete. In a case like this, the event could be split into two tasks: one for dropping, and the next for performing the action.


Chapter: Interfaces

Section: Commands

By default, two commands are provided for the player to make use of Intelligent Hinting's functionality. "Suggest" (the suggesting action) will print to the screen the recommended next move; "Solve" (the solving action) will go a step further and actually perform the action for the player. The author is free to make only one or neither of these verbs available to the player by altering the Understand lines:

	Understand the command "hint" as "suggest".
	Understand the command "solve" as something new.

An author can toggle the suggest/solve functionality on or off temporarily with:

	suspend suggestion hinting
	reinstate suggestion hinting

Section: Display

All the messages Intelligent Hinting produces can be adjusted by amending the table below. See "Table Amendments" in the Inform docs for more details.

	Table of Intelligent Hinting Messages
	msg						txt
	action-solving			"([relevant action])[line break]"
	action-suggesting		"Try [relevant action].[line break]"
	command-solving		"(trying to [relevant command])"
	command-suggesting	"Try typing [relevant command].[line break]"
	no-action-found			"(Can't find an action to take.)"
	all-puzzles-solved		"(All puzzles are solved.)"
	suggestions-disallowed	"(I am not able to make suggestions at the moment.)"

Section: Internal Access

In addition to the player, an author can request access to the suggested move by asking for "the next incomplete task in Winning-The-Game" (or any other puzzle), or "the suggested action". The results could be used to construct a more verbose hinting system, for instance. Note, however, that's it's probably a bad idea to put multiple requests like these in "every turn" rules, or execution will slow down considerably.

Section: Debugging Verbs

To help in debugging puzzle and task definitions, several debugging verbs are defined in non-released games. "puzzle changes" will print a notification when any puzzle becomes solved or not solved, or any task becomes complete or incomplete. "puzzle selection" will print details when suggesting occurs as to how it was determined which puzzle to try. "puzzle inferences" gives info on implied actions (like taking things not held or finding keys). "puzzle all" will show both of these, plus give additional details on both. Finally, "puzzle off" disables puzzle debugging.

In addition, "puzzle list" will show a tree representing the current structure of puzzles and tasks, along with info about which are complete/solved.

Chapter: Gotchas and Snafus

Section: Notes

*Glulx probably necessary*. Other than for shorter games, Intelligent Hinting might require the use of Glulx rather than z-code, as the objects, tables and lists it uses quickly eat up the limited space in a z5 or z8 story. "Adventure," not that huge a game by today's standards, is large enough to require Glulx when compiled with Intelligent Hinting.

*"Something other than" clauses*. If any rules like "Instead of doing something other than opening the door" are defined, code will need to be rewritten to add "or solving", or the "solve" action will be blocked as well. ("Solve" can't be an action out of world like "suggest", since then any actions it generates are in turn out of world, and no time would pass or rules would fire upon their execution.) 

*Puzzles with multiple solutions*. If there are multiple ways to solve a single puzzle, either one or all of them can be encoded as puzzle and task objects. Only one is strictly necessary, but adding both makes for more intelligent hints if the player is working on the other solution. If multiple solutions are used, ensure that both define each other as complete when either is solved. 

*Puzzles with uncertain timing*. If there are random events that aren't predictable (basically anything that would prevent a printed walkthrough of commands from working 100% of the time), a reversible task can be created to deal with the situation at the start of the earliest puzzle which that situation could occur in. The definition of the task should specify that it is not complete whenever the situation arises. (For an example, see "Killing-A-Dwarf" in Adventure, which is triggered whenever a dwarf appears; it's placed early on in "Winning-The-Game," as it can occur at almost any time.)

*Puzzles with uncertain venue*. The venue field is optional in a task. If omitted, the game will try to move to the location of any people, scenery or fixed-in-place objects mentioned in the action-sequence. If none are present, it will just perform the actions wherever the player happens to be. If a specific but variable location is required, code could always manually change the value of "venue" for that task during play.

*Light and dark*. Since the world model has no way of knowing whether something is capable of being lit-- just whether it currently emits light or not-- Intelligent Hinting does not attempt to automatically find portable light sources to take into dark areas. Include the finding and activating of any such items in puzzle definitions, if necessary.

*Non-standard input*. Intelligent Hinting can not currently deal with any non-standard input, such as conversation menus or "if the player consents" questions. The player can still answer them, but the extension can not do it for them.

*Compatibility with other auto-action extensions*. Intelligent Hinting is compatible with Implicit Actions by Eric Eve, or Locksmith by Emily Short, both of which automatically try to unlock and open things for the player. The "suggest" commands will not make use of this functionality, but the player is still free to.

*But isn't this cheating?* The astute will note that a lazy player could just continually type "solve" until the game finished itself. The more astute will note that this is no more a problem than the fact that the reader of a novel is free to flip forward through the pages at any time, or for crossword puzzlers to have the answers at the back of the newspaper. The even more astute will realize that a skein full of "solve" commands provides an auto-updating, adaptable, and maintenance-free method of testing whether a game is winnable.

Example: * Cloak Of Darkness - The standard IF example game, with Intelligent Hinting support added.

Cloak Of Darkness is a very simple game that has long been used to demonstrate functionality in various IF languages. This is a somewhat streamlined version with comments and extraneous features removed; it is otherwise the same as the standard Inform 7 version, except for the final section.

	*: "Cloak Of Darkness"

	Foyer of the Opera House is a room.  "You are standing in a spacious hall, splendidly decorated in red and gold, with glittering chandeliers overhead. The entrance from the street is to the north, and there are doorways south and west." Instead of going north in the Foyer, say "You've only just arrived, and besides, the weather outside seems to be getting worse."

	The Cloakroom is west of the Foyer. "The walls of this small room were clearly once lined with hooks, though now only one remains. The exit is a door to the east." In the Cloakroom is a supporter called the small brass hook. The hook is scenery. Understand "peg" as the hook. The description of the hook is "It's just a small brass hook, [if something is on the hook]with [a list of things on the hook]hanging on it[otherwise]screwed to the wall[end if]." Understand "hang [something preferably held] on [something]" as putting it on.     

	The Bar is south of the Foyer. The printed name of the bar is "Foyer Bar". The Bar is dark. "The bar, much rougher than you'd have guessed after the opulence of the foyer to the north, is completely empty. There seems to be some sort of message scrawled in the sawdust on the floor."    

	The scrawled message is scenery in the Bar. Understand "floor" or "sawdust" as the message. Neatness is a kind of value. The neatnesses are neat, scuffed, and trampled. The message has a neatness. The message is neat.

	Instead of examining the message: say "The message, neatly marked in the sawdust, reads..."; end the game in victory. Instead of examining the trampled message: say "The message has been carelessly trampled, making it difficult to read. You can just distinguish the words..."; end the game saying "You have lost". 

	Instead of doing something other than going or solving in the bar when in darkness: if the message is not trampled, change the neatness of the message to the neatness after the neatness of the message; say "In the dark? You could easily disturb something." Instead of going nowhere from the bar when in darkness: now the message is trampled; say "Blundering around in the dark isn't a good idea!"

	The player wears a velvet cloak. The cloak can be hung or unhung. Understand "dark" or "black" or "satin" as the cloak. The description of the cloak is "A handsome cloak, of velvet trimmed with satin, and slightly splattered with raindrops. Its blackness is so deep that it almost seems to suck light from the room." 	Instead of dropping or putting the cloak on when the player is not in the cloakroom: say "This isn't the best place to leave a smart cloak lying around."

	Carry out taking the cloak: now the bar is dark. Carry out putting the unhung cloak on something in the cloakroom: now the cloak is hung. Carry out putting the cloak on something in the cloakroom: now the bar is lit. Carry out dropping the cloak in the cloakroom: now the bar is lit.

	When play begins: say "[paragraph break]Hurrying through the rainswept November night, you're glad to see the bright lights of the Opera House. It's surprising that there aren't more people about but, hey, what do you expect in a cheap demo game...?"

	[Now for the puzzle definitions.]

	 Section - Hints  

	Include Intelligent Hinting by Aaron Reed.    

	Winning-The-Game requires Noticing-The-Dark-Room, Hanging-The-Cloak, and Reading-The-Message.

	Noticing-The-Dark-Room is a task with venue The Bar. Definition: Noticing-The-Dark-Room is complete if the player has been in the bar. 

	[Strictly speaking, Noticing-The-Dark-Room is not necessary to winning; it's more of a clue. It takes a bit more work, but it's a good idea to incorporate the discovery of clues into your puzzle structure, both to more thoroughly test your game and to help players using "suggest" to see the logic of the puzzles.]

	Hanging-The-Cloak is a reversible task. The venue is Cloakroom. Requirements for Hanging-The-Cloak: do the action of putting the cloak on the hook. Definition: Hanging-The-Cloak is complete if cloak is hung. 

	Reading-The-Message is a task. The venue is The Bar. Requirements for Reading-The-Message: do the action of examining the scrawled message.

	Test me with "solve / solve / solve / solve / solve / solve / solve".

Seven moves and Cloak of Darkness neatly solves itself. Not much of a feat, but hey, what do you expect from a cheap extension example?

Example: ** Slay Doctor Lucky - A more complex scenario showing off Intelligent Hinting's action inference abilities.

To test out Intelligent Hinting more thoroughly, let's create a small project reminiscent of a popular indie board game. Trapped in the mansion of the smarmy Doctor Lucky with a bunch of fellow revenge-seekers, your goal is murder. The catch is, the deed must be done when no one else is in sight.

	*: "Slay Doctor Lucky"
 
	Use full-length room descriptions. Include Plurality by Emily Short. The maximum score is 80. 

	When play begins: say "You slip into the foyer of the mansion quietly, but before you can wonder where everyone is, that scoundrel [a random suspect who is not Doctor Lucky] is whispering in your ear: 'Late as usual. The best weapons are already taken, of course. May the best killer win.'[paragraph break]As [it-they] creeps away, you are left with only your murderous desire to...".

	[We'll quickly create a map of the manor and populate it with pithy randomly generated descriptions.]

	Foyer is a room. Solarium is north of Billiard Room and west of Trophy Room. Library is east of Trophy Room and north of Studio. North Hall is south of Trophy Room and west of Studio. Gazebo is south of Studio and north of Drawing Room. Drawing Room is east of South Hall. Study is north of South Hall, south of North Hall, and east of Foyer. Foyer is south of Billiard Room and north of Kitchen. Kitchen is west of South Hall. 

	The description of a room is usually "[one of]Only the finest[or]Ridiculously expensive[or]Posh[or]Fashionably antique[in random order][one of] furnishings[or] cabinets[or] furniture[or] centerpieces[in random order] and[one of] tasteful[or] outrageous[or] postmodern[or] sophisticated[in random order] [one of]carpeting[or]wall panelling[or]oak floorboards[or]chandeliers[in random order]. The exits are [exitflag][the list of adjacent rooms][exitflag].".

	exit flag is a truth state that varies. To say exitflag: if exit flag is true, now exit flag is false; otherwise now exit flag is true.

	Before printing the name of a room (called target) when exit flag is true: 
		let way be the best route from location to target;
		unless way is nothing, say "[way] to the ".

	[Next, let's add the other characters.]

	A suspect is a kind of person. Professor Ochre is a male suspect in Studio. Madam Fuchsia is a female suspect in Study. Headmistress Periwinkle is a female suspect in Solarium. Cardinal Violet is a male suspect in South Hall. Doctor Lucky is a male suspect in Billiard Room. 

	Every turn (this is the NPC movement rule):
		repeat with subject running through on-stage suspects:
			if a random chance of 3 in 4 succeeds:
				let current space be location of subject;
				let next space be a random accessible room which is adjacent to current space;
				if subject is visible:
					if subject is Doctor Lucky, say "[one of]With a wink[or]Stepping lightly[or]Humming something to himself[in random order]";
					otherwise say "[one of]Sniffling[or]Eyeing you suspiciously[or]Slyly[or]Quietly[in random order]";
					say ", [the subject] heads to the [next space][if subject holds alibi], taking [its-their] unbeatable alibi with [it-them][end if].[paragraph break]";
				move subject to next space;
				if subject is visible:
					if subject is Doctor Lucky, say "[one of]With a smile and a nod[or]Strolling gaily through the doorway[or]Twirling his mustache playfully[in random order]";
					otherwise say "[one of]Unexpectedly[or]Moving cautiously[or]Glancing at you angrily[in random order]";
					say ", [the subject] arrives from the [current space][if subject holds alibi], sporting an enviable alibi[end if].[paragraph break]".

	[We'll give them some annoying behavior, to justify our later seemingly cold-blooded actions:]

	Every turn when player holds something (called loot) and a random chance of 1 in 6 succeeds and no suspects are visible and location is not in Off-Limits:
		move loot to a random accessible room;
		say "Suddenly [the loot] is snatched from your hands by [a random on-stage suspect], appearing from nowhere. 'I'll just be taking this,' [it-they] chortles, and slips away before you can react.".

	[Let's add a few locks and keys preventing us from immediately finding a murder weapon, to make things more challenging.]

	Off-Limits is a region. Definition: a room is accessible if it is not regionally in Off-Limits. Master Bedroom is a room in Off-Limits. Some french doors are a door. They are south of South Hall and north of Master Bedroom. They are locked, closed and openable. Understand "door" as doors.

	A display case is a fixed in place transparent openable closed container in Master Bedroom. The lead trophy is in display case. The description is "A 15-pound lead ball on a base just big enough for a solid grip."

	A cupboard is in Kitchen. It is fixed in place, openable, closed, locked, and lockable. A brass key is in cupboard. The brass key unlocks french doors. A lectern is fixed in place in Library. A small iron key is on lectern. A small iron key unlocks the cupboard.

	[Next, the foul act itself:]

	Understand the command "murder" as something new. Murdering it with is an action applying to two things. Understand "murder [someone] with [something]" as murdering it with. 		

	Instead of attacking, say "A simple attack won't do. No. This is a night... for murder.". Instead of murdering: say "That's hardly a suitable murder weapon.".

	Instead of murdering when at least 2 suspects are visible: let nearby chaps be the list of visible suspects; remove noun from nearby chaps; say "Not in the sight of [the nearby chaps]!". 

	Instead of murdering something (called victim) with the lead trophy:
		say "You viciously murder [victim] with [the second noun]!";
		if victim holds alibi:
			move alibi to player;
			say "[line break]You pocket the convenient alibi dearly departed [victim] was carrying.";
		award 13 points;
		if victim is Doctor Lucky:
			say "[line break]You taste the hot red needle of victory. At last, your nemesis is defeated. For now...";
			end the game in victory;
		otherwise: 			
			say "[line break]You stash the body [one of]under a handy chaise longue[or]inside a nearby Louis XIV[or]behind a dumbwaiter hatch[in random order].";
			remove victim from play.

	[For simplicity's sake, we assume that the other suspects are perpetually unsuccessful in their attempts to bump off the doctor.]

	[Finally, let's add two more obstacles that must be completed before the murder can take place: disposing some incriminating papers, and finding a somewhat whimsical alibi, which the other suspects are all trying to catch too:]

	A roaring fireplace is fixed in place in Drawing Room. Some blackmail material is in Trophy Room. Instead of inserting material into fireplace: remove material from play; award 7 points; say "You burn the hateful papers in the fire. Now there will be nothing to link you to the Doctor.".

	Instead of murdering Doctor Lucky with something when blackmail material is on-stage: say "First you must dispose of the blackmail material.".

	An alibi is a thing in Solarium.
	
	Every turn when alibi is on-stage:
		if location of alibi contains at least 1 suspect and alibi is not held by someone and a random chance of 3 in 4 succeeds:
			let holder be a random suspect enclosed by location of alibi; 
			now holder holds alibi;
			if holder is visible, say "[one of]With a crafty smile[or]With a cunning grin[or]With swift fingers[in random order], [holder] snatches the alibi.";
		otherwise if someone (called holder) holds alibi and a random chance of 1 in 4 succeeds: 
			move alibi to location of holder;
			if holder is visible, say "[one of]Distracted by noise in a neighboring room[or]Carelessly[in random order], [the holder] drops [its-their] alibi.". 

	Instead of taking alibi when a suspect holds alibi: say "[A random person holding alibi] jerks it away from your grasp with a nasty smile.". 

	After taking alibi: remove alibi from play; award 8 points; say "You snatch the alibi gratefully, and slip it carefully into your jacket until you need it.".

	Instead of murdering Doctor Lucky with something when alibi is on-stage: say "First you'd better find a decent alibi.".

	[And that's our scenario. Finally, we'll upgrade it for Intelligent Hinting:]

	Section - Puzzles

	Include Intelligent Hinting by Aaron Reed. 

	Winning-The-Game requires Taking-Care-Of-Business and Killing-The-Doctor.

	Taking-Care-Of-Business is a not sequential puzzle. It requires Destroying-The-Evidence and Finding-An-Alibi.

	[These can be solved in either order, so we make the parent puzzle "not sequential."]

	Destroying-The-Evidence is a task with venue Drawing Room. Requirements for Destroying-The-Evidence: do the action of inserting blackmail materials into fireplace. Definition: Destroying-The-Evidence is complete if materials are off-stage.

	Finding-An-Alibi is a task. Requirements for Finding-An-Alibi: do the action of taking alibi. A red flag rule for Finding-An-Alibi: if alibi is held by someone, rule fails. Definition: Finding-An-Alibi is complete if alibi is off-stage.

	[Once we've burned the materials or taken the alibi, the acts can't be undone, so neither of these tasks need to be reversible. Note that if a suspect snatches the materials (or any other objects in the scenario), Intelligent Hinting automatically tracks them down again before continuing.]

	[We specify not to try taking the alibi if someone else holds it. Note that red flag rules are *always* for a specific task.]

	Killing-The-Doctor is a task. Requirements for Killing-The-Doctor: do the action of murdering Doctor Lucky with lead trophy. A red flag rule for Killing-The-Doctor: if the number of visible suspects > 1, rule fails.

	Test me with "e / n / n / suggest / take material / e / s / s / s / suggest".

And that's it. Note that there is nothing in here about all of those locks and keys we mentioned earlier: Intelligent Hinting automatically deals with these obstacles, including the additional annoyance of suspects occasionally stealing them and hiding them somewhere else.

For simplicity's sake, we haven't included the optional killing of the other suspects in the puzzle definition: you'll have to take matters into your own hands to score the full 80 points (equal to the number of mystery novels written by Agatha Christie, coincidentally.) This illustrates that Intelligent Hinting should always encode the path to one solution, but it does not necessarily have to be a perfect solution.

Example: **** Adventure - A full-length adventure game implemented with Intelligent Hinting.

The full source is not included here, as it would more than double the size of the extension, but the 350-point Crowther/Woods "Adventure" has been fully implemented with Intelligent Hinting. It can be downloaded at http://aaronareed.net/if/advent-hint.txt.

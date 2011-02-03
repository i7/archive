Version 2 of Repeat Through Actions by Ron Newcomb begins here.

"Allows us to write a repeat loop that steps through all actions in the game, or all the actions belonging to a kind-of-action.  Also allows us to ask if an action is out of world, and if a kind-of-action involves an action-name."

Book - the Repeat Through Actions extension

Chapter - Small technical needs

Section - typecasting between number and action-name

To decide what number is (acn - an action-name) as the/an/a/-- number:
(- GetNumForActionname({acn}) -).

To decide what action-name is (n - a number) as the/an/a/-- action-name:
(- GetActionnameForNum({n}) -).

Include (-
[ GetActionnameForNum n;
	if (n < 1) return ##Wait;
	n--;  ! Inform 7 counts from 1; Inform 6 counts from 0
	n = (n * AD_RECORD_SIZE) + 1 + AD_ACTION;
	if (n > ActionData-->0) return ##Wait;
	return ActionData-->n;
];

[ GetNumForActionname acn;
	return 1 + (FindAction(acn) / AD_RECORD_SIZE);
];

-).

Section - is action out-of-world

To decide whether (acn - a action-name) is out of world:
	(- (((ActionData-->(FindAction({acn}) + AD_REQUIREMENTS )) & 32) ~= 0) -).

To decide whether action (n - a number) is out of world:
	(- (((ActionData-->(({n} * AD_RECORD_SIZE) + AD_REQUIREMENTS + 1)) & 32) ~= 0) -).


Chapter - asking if an action-name is involved with a particular stored action or kind-of-action

Section - if stored actions or kinds of action involve the action-name

[ if this condition looks a bit funny, know that it ensures calling RestoreActionName() even if short-circuit evaluation is used by the Inform optimizer ]
To decide whether (C - a condition) involves/involve (acn - an action-name):
(- ((SaveActionName({acn}) && {C} && RestoreActionName()) || (~~RestoreActionName())) -).

Include (- Global save_action_for_cond; -) after "Definitions.i6t".

Include (-
[ SaveActionName acn;  save_action_for_cond = action; action = acn; rtrue; ];
[ RestoreActionName;     action = save_action_for_cond; rtrue; ]; 
-).

[To debug I6-action-saving: (-  print "(", (SayActionName) action, ") "; -).]

Section - reversed involves

[ if this condition looks a bit funny, know that it ensures calling RestoreActionName() even if short-circuit evaluation is used by the Inform optimizer ]
To decide whether (acn - an action-name) involves/involve (C - a condition):
(- ((SaveActionName({acn}) && {C} && RestoreActionName()) || (~~RestoreActionName())) -).


Chapter - the Loops

Section - repeat through all actions

To repeat with (loopvar - nonexisting action-name variable) running through/thru all/every/each/-- the/-- action/actions begin -- end: 
(-	{-allocate-storage:LoopingThruActions} ! {-advance-counter:LoopingThruActions} ! don't delete this comment; it actually still advances the counter, which is important because  -->0  means something way different than  -->1  or  -->2
	I7_ST_LoopingThruActions-->{-counter:LoopingThruActions} = 1;
	for (   {loopvar} = ActionData-->((I7_ST_LoopingThruActions-->{-counter:LoopingThruActions}) + AD_ACTION)
		: (I7_ST_LoopingThruActions-->{-counter:LoopingThruActions}) <= ActionData-->0
		: I7_ST_LoopingThruActions-->{-counter:LoopingThruActions} = (I7_ST_LoopingThruActions-->{-counter:LoopingThruActions}) + AD_RECORD_SIZE
			, {loopvar} = ActionData-->(((I7_ST_LoopingThruActions-->{-counter:LoopingThruActions}) % ActionData-->0)+AD_ACTION)
	)
-).


Section - repeat through a kind of action

To repeat with (loopvar - nonexisting action-name variable) running through/thru all/every/each/the/-- kind/kinds/action/actions of/in/from/-- (C - a condition) action/actions/-- begin -- end: 
(-	{-allocate-storage:LoopingThruActions} ! {-advance-counter:LoopingThruActions} ! don't delete this comment; it actually still advances the counter, which is important because  -->0  means something way different than  -->1  or  -->2
	I7_ST_LoopingThruActions-->{-counter:LoopingThruActions} = 1;
	for (   {loopvar} = ActionData-->((I7_ST_LoopingThruActions-->{-counter:LoopingThruActions}) + AD_ACTION)
		: (I7_ST_LoopingThruActions-->{-counter:LoopingThruActions}) <= ActionData-->0
		: I7_ST_LoopingThruActions-->{-counter:LoopingThruActions} = (I7_ST_LoopingThruActions-->{-counter:LoopingThruActions}) + AD_RECORD_SIZE
			, {loopvar} = ActionData-->(((I7_ST_LoopingThruActions-->{-counter:LoopingThruActions}) % ActionData-->0)+AD_ACTION)
	)  if ((SaveActionName({loopvar}) && {C} && RestoreActionName()) || (~~RestoreActionName())) 
-).

To repeat with (loopvar - nonexisting action-name variable) running through/thru all/every/each/the/an/a/-- (C - a condition) action/actions begin -- end: 
(-	{-allocate-storage:LoopingThruActions} ! {-advance-counter:LoopingThruActions} ! don't delete this comment; it actually still advances the counter, which is important because  -->0  means something way different than  -->1  or  -->2
	I7_ST_LoopingThruActions-->{-counter:LoopingThruActions} = 1;
	for (   {loopvar} = ActionData-->((I7_ST_LoopingThruActions-->{-counter:LoopingThruActions}) + AD_ACTION)
		: (I7_ST_LoopingThruActions-->{-counter:LoopingThruActions}) <= ActionData-->0
		: I7_ST_LoopingThruActions-->{-counter:LoopingThruActions} = (I7_ST_LoopingThruActions-->{-counter:LoopingThruActions}) + AD_RECORD_SIZE
			, {loopvar} = ActionData-->(((I7_ST_LoopingThruActions-->{-counter:LoopingThruActions}) % ActionData-->0)+AD_ACTION)
	)  if ((SaveActionName({loopvar}) && {C} && RestoreActionName()) || (~~RestoreActionName())) 
-).


Repeat Through Actions ends here.

---- DOCUMENTATION ----

This extension allows us to write repeat phrases that step through a game's actions.  The most general runs through every action defined in the game.  Incidentally, we can also ask if the action is out-of-world. 
	*: Instead of thinking:
		say "The possibilities are practically endless.";
		repeat with possibility running through every action begin;
			say "[The possibility][if the possibility is out of world] (out of world)[end if].";
		end repeat.

A second form steps through a kind of action.
	*: Kissing is unmaidenly behavior.
	Touching is unmaidenly behavior.
	Drinking is unmaidenly behavior.
	Accusing of is unmaidenly behavior. 
	
	Instead of asking someone about "etiquette/manners":
		say "There are some things that a lady should never do.  ";
		repeat with taboo running through every kind of unmaidenly behavior begin;
			say "[one of]Like[or]Or[stopping] [taboo].  ";
		end repeat;


Remember that these deal with abstract actions, not with specific examples of actions.  (Specific examples are called stored actions.)  So, if we wish to insert these into a table, or pass them to To phrases, we use the action-name type. 
	*: A characteristic is a kind of value. Some characteristics are inquisitive, socialized.
	
	Table of Traits & Moods
	reaction	       				trait
	an action-name     			a characteristic
	the saying sorry action			socialized
	the asking it about action		inquisitive


We may ask if a kind of action "involves" an abstract action.
	let taboo be the reaction entry;
	if the taboo involves undoglike behavior, say "But if you do this, you'll tip them off that you're not really a dog.";


Finally, and least importantly, we may convert abstract actions to and from numbers.
	say "The 5th action is [5 as an action-name].  The Removing It From action is action #[the removing it from action as a number].";


If we include the extension Editable Stored Actions, we can directly modify the action-name part of a stored action.
	*: Include Repeat Through Actions by Ron Newcomb, Editable Stored Actions by Ron Newcomb.
	
	Place is a room. A mysterious gizmo is a thing in place.
	
	Examining is usual I-F.
	Taking is usual I-F.
	Dropping is usual I-F.
	Waving is usual I-F.
	Switching on is usual I-F.
	
	Instead of examining:
		let the suggested command be the action of examining the noun;
		say "A few things to try with the [noun]:  ";
		repeat with possibility running through the usual I-F actions begin;
			change the action-name part of the suggested command to the possibility;
			say "[one of][or], [stopping][the suggested command]";
		end repeat;
		say ".";

Example: * Discover Yourself - Introduces actions to the player via bolded text

	*: "Discover Yourself"
	
	Include Repeat Through Actions by Ron Newcomb.
	
	When play begins:
		repeat with act running through every initially allowed action begin;
			choose a blank row in the table of allowed actions;
			change the possibility entry to the act;
		end repeat.
		
	Looking is initially allowed.
	Examining is initially allowed.
	
	Table of allowed actions
	possibility
	an action-name
	with 100 blank rows. 
	
	Before doing something when the action-name part of the current action is not a possibility listed in the table of allowed actions, say "You haven't learned that ability yet." instead.
	
	Test me with " i / x me / x me / i / think / i / think / wake / look / x me"
	
	Dreamland is a room.
	
	Instead of examining yourself for the first time, say "Ah!  You have a body!  And a mind!  Might [introduce a thinking action] or [introduce the waking up action] now be possible?"
	
	Instead of thinking for the first time, say "What a great idea!  Thinking seems very useful.  You can use it for [introduce the taking inventory action] of yourself, and your possessions."
	
	Instead of thinking:
		say "You think about all the things you've learned recently:  ";
		repeat through the table of allowed actions begin;
			say "[possibility entry], ";
		end repeat;
		say "and who knows what the future may hold!"
	
	Instead of waking up for the first time: change the printed name of Dreamland to "Your Bed"; say "You awaken.  [Introduce A Looking Action] around is almost destined."
	
	To say introduce (act - an action-name):
		say "[bold type][act][roman type]";
		if act is not a possibility listed in the table of allowed actions begin;
			choose a blank row in the table of allowed actions;
			change the possibility entry to the act;
		end if.
	

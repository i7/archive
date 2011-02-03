Version 4 of Repeat Through a Rulebook by Ron Newcomb begins here.

"Allows us to write a repeat loop that steps through all the rules in a rulebook, to count those rules, to pick a random rule, and to ask if a rule is currently listed in a given rulebook."

Use Repeat Through a Rulebook debugging translates as (- Constant LOOP_THRU_RULEBOOKS; -).
Use Repeat Through a Rulebook count debugging translates as (- Constant LOOP_THRU_RULEBOOKS_C; -).
Use Repeat Through a Rulebook find debugging translates as (- Constant LOOP_THRU_RULEBOOKS_F; -).
Use Repeat Through a Rulebook endpoint debugging translates as (- Constant LOOP_THRU_RULEBOOKS_E; -).


Section - Rules by Number 

[ TODO: test to see if "rulebook variable" versions are needed ]

To decide which rule is rule number/-- (n - number) of/in/for the/a/an/-- unmodified (ar - a rulebook): 
	(- (NthOfUnmodifiedRulebook({n},{ar})) -).

To decide which rule is rule number/-- (n - number) of/in/for the/a/an/-- modified/-- (ar - a rulebook): 
	(- (NthOfRulebook({n},{ar})) -).

To decide which rule is the/a/an/any/-- random rule/member/members in/for/of/from/-- (RB - a rulebook):
	decide on rule number (a random number from 1 to the number of rules in RB) in RB.

To decide which number is number of rulebooks: (- NumberOfRulebooks() -).
To decide which rulebook is (n - a number) as rulebook: (-{n}-).
To decide which text is printed name of/for rulebook number/-- (x - a number): (- GetRulebookName({x}) -).

Include (-
[ NthOfUnmodifiedRulebook n ar;
	if (n < 1) return LITTLE_USED_DO_NOTHING_R;
	if (n > NumberOfRulesInUnmodRulebook(ar)) return LITTLE_USED_DO_NOTHING_R;
	return (rulebooks_array-->(ar))-->(n-1); 
];

[ NthOfRulebook n ar temp;
	if (n < 1) return LITTLE_USED_DO_NOTHING_R;
	if (n > NumberOfRulesInRulebook(ar)) return LITTLE_USED_DO_NOTHING_R;
	temp = (rulebooks_array-->(ar))-->(n-1); 
	PseudoProcessRulebook(temp,0,0,0,(+directly invoked+));
	return temp;
];

[ NumberOfRulebooks; return {-value:NUMBER_CREATED(rulebook)} - 1; ];

-).


Section - The Nothing Rule

The little-used do nothing rule translates into I6 as "LITTLE_USED_DO_NOTHING_R".

To decide whether (r - a rule) is/are  a/an/the/--  valid/rule/rules  valid/rule/rules/--:
	if r is the little-used do nothing rule, decide no; else decide yes.

To decide whether (r - a rule) is/are  a/an/the/--   invalid/not   a/an/the/--   valid/rule/rules/--   valid/rule/rules/--:
	decide on whether or not r is the little-used do nothing rule.

To decide whether (r - a rule) isn't/aren't    a/an/the/--    valid/rule/rules   valid/rule/rules/--:
	decide on whether or not r is the little-used do nothing rule.


Section - Reasons

A rule-reason is a kind of value. The rule-reasons are directly invoked, moved before, moved after, ignored, and substituted.

The reason the rule ran is a rule-reason that varies. [translates as (- Global Rule_reason; -).]

[ this is only so I6 can print it ]
Include (-
[ PrintRuleReason R;
	switch (R) {
	(+moved before+): print "moved before";
	(+moved after+): print "moved after";
	(+ignored+): print "ignored";
	(+substituted+): print "substituted";
	default: print "directly invoked";
	} 
];
-).


Section - Rule Loops, unmodified

[ the adjective "unmodified" means ignoring the procedural rules, and is not optional if you want this variation ]

To repeat with (loopvar - nonexisting rule variable) running through/thru the/a/an/--  unmodified (ar - a rulebook) begin -- end: 
(-	{-allocate-storage:LoopingThruRulebooks} ! {-advance-counter:LoopingThruRulebooks} ! don't delete this comment; it actually still advances the counter, which is important because  -->0  means something way different than  -->1  or  -->2
	I7_ST_LoopingThruRulebooks-->{-counter:LoopingThruRulebooks} = 0;
	for (  {loopvar} = (rulebooks_array-->{ar})-->(I7_ST_LoopingThruRulebooks-->{-counter:LoopingThruRulebooks})
		: {loopvar} ~= NULL
		: {loopvar} = (rulebooks_array-->{ar})-->(++(I7_ST_LoopingThruRulebooks-->{-counter:LoopingThruRulebooks}))
		) -). 

To repeat with (loopvar - nonexisting rule variable) running through/thru the/a/an/--  unmodified (ar - a rulebook variable) begin -- end: 
(-	{-allocate-storage:LoopingThruRulebooks} ! {-advance-counter:LoopingThruRulebooks} ! don't delete this comment; it actually still advances the counter, which is important because  -->0  means something way different than  -->1  or  -->2
	I7_ST_LoopingThruRulebooks-->{-counter:LoopingThruRulebooks} = 0;
	for (  {loopvar} = (rulebooks_array-->{ar})-->(I7_ST_LoopingThruRulebooks-->{-counter:LoopingThruRulebooks})
		: {loopvar} ~= NULL
		: {loopvar} = (rulebooks_array-->{ar})-->(++(I7_ST_LoopingThruRulebooks-->{-counter:LoopingThruRulebooks}))
		) -). 

To decide if (R - a rule) is/are currently/-- listed in/for the/a/an/-- unmodified (rb - a rulebook): 
	(-IsRuleInUnmodifiedRulebook({R}, {rb})-).

To decide if (R - a rule) is/are currently/-- not currently/-- listed in/for the/a/an/-- unmodified (rb - a rulebook): 
	if R is listed in the unmodified rb, decide no; otherwise decide yes.

To decide which number is number of rules of/in/for the/an/a/-- unmodified (rb - a rulebook):
	(- (NumberOfRulesInUnmodRulebook({rb})) -).

Include (-
[ IsRuleInUnmodifiedRulebook r ar i; 
	for(i = 0: (rulebooks_array-->ar)-->i ~= NULL: i++)
		if (r == (rulebooks_array-->ar)-->i) 
			rtrue;
	rfalse;
];

[ NumberOfRulesInUnmodRulebook ar i;
	for (i = 0 : (rulebooks_array-->ar)-->i ~= NULL : i++);
	return i;
];
-).



Section - Rule Loops, modified

To repeat with (loopvar - nonexisting rule variable) running through/thru the/a/an/-- modified/-- (ar - a rulebook) begin -- end: 
(-	{-allocate-storage:LoopingThruRulebooks} ! {-advance-counter:LoopingThruRulebooks} ! don't delete this comment; it actually still advances the counter, which is important because  -->0  means something way different than  -->1  or  -->2
	I7_ST_LoopingThruRulebooks-->{-counter:LoopingThruRulebooks} = 0;
	for (  {loopvar} = NextRuleAfterRule({ar},{ar}) 
		: {loopvar} ~= NULL
		: {loopvar} = NextRuleAfterRule({loopvar}, {ar})
		) -). 

To repeat with (loopvar - nonexisting rule variable) running through/thru the/a/an/-- modified/-- (ar - a rulebook variable) begin -- end: 
(-	{-allocate-storage:LoopingThruRulebooks} ! {-advance-counter:LoopingThruRulebooks} ! don't delete this comment; it actually still advances the counter, which is important because  -->0  means something way different than  -->1  or  -->2
	I7_ST_LoopingThruRulebooks-->{-counter:LoopingThruRulebooks} = 0;
	for (  {loopvar} = NextRuleAfterRule({ar},{ar}) 
		: {loopvar} ~= NULL
		: {loopvar} = NextRuleAfterRule({loopvar}, {ar})
		) -). 

To decide if (R - a rule) is/are currently/-- listed in/for the/a/an/-- modified/-- (rb - a rulebook): 
	(-IsRuleInRulebook({R}, {rb})-).

To decide if (R - a rule) is/are currently/-- not currently/-- listed in/for the/a/an/-- modified/-- (rb - a rulebook): 
	if R is listed in rb, decide no; otherwise decide yes.

To decide which number is number of rules of/in/for/from the/a/an/-- modified/-- (rb - a rulebook):
	(- (NumberOfRulesInRulebook({rb})) -).

Include (-
Global LookingForRuleInRulebook = NULL; ! set to a Rule when looking for a rule in a modified rulebook; if found, set to NULL;  if not found, leave as-is;  initialized back to NULL before returning
Global CountRulesInRulebook = 0; 
Global DoneSearchingRulebooks = 0;
Global ReasonForIterating; ! 1 = NextRuleAfterRule;  2 = NumberOfRules;  3 = IsRuleIn

[ IsRuleInRulebook r ar i;  ! also nicknamed case (3)
	DoneSearchingRulebooks = 0;
	CountRulesInRulebook = 0;  
	ReasonForIterating = 3;
	LookingForRuleInRulebook = r;
	PseudoProcessRulebook(ar,0,0,(+directly invoked+));
	if (LookingForRuleInRulebook == NULL) rtrue;  ! being found is indicated by this variable having been set back to NULL
	rfalse;
];

[ NumberOfRulesInRulebook ar;  ! also nicknamed case (2)
	DoneSearchingRulebooks = 0;
	CountRulesInRulebook = 0;
	ReasonForIterating = 2;
	LookingForRuleInRulebook = LITTLE_USED_DO_NOTHING_R;
	PseudoProcessRulebook(ar,0,0,(+directly invoked+));
	return CountRulesInRulebook;
];

[ NextRuleAfterRule r ar;  ! also nicknamed case (1)
	DoneSearchingRulebooks = 0;
	CountRulesInRulebook = 0;
	ReasonForIterating = 1;
	LookingForRuleInRulebook = r;
#ifdef LOOP_THRU_RULEBOOKS_F;
	print "[SEARCHING for the rule that comes after ~", (RulePrintingRule) r, "~]^";
#endif;
	PseudoProcessRulebook(ar,0,0,(+directly invoked+));
	if (LookingForRuleInRulebook == r) return NULL;  ! meaning there isn't a Next Rule after the one we entered
	return LookingForRuleInRulebook;
];
-).

Section - Repeat Through a Single Rule

[ catches the case where a user has a rule-that-varies which usually has a rulebook in it, but accidentally puts a rule in it. The repeat loop will just loop once for that rule. ]
To repeat with (loopvar - nonexisting rule variable) running through/thru the/a/an/--  modified/-- (ar - a rule) begin -- end: 
(-	{loopvar} = {ar};
	if (IsRuleInRulebook({loopvar}, {ar}))  -). 

To repeat with (loopvar - nonexisting rule variable) running through/thru the/a/an/--  unmodified (ar - a rule) begin -- end: 
(-	{loopvar} = {ar};
	if (true) -). 

Section - Testing commands - unindexed - not for release 

[ When play begins: try debugging-rulebooks "carry out looking rulebook". ]

The previously debugged rulebook name is some indexed text that varies. The previously debugged rulebook name is usually "Every turn rulebook".
The previously debugged rulebook is a rulebook that varies. The previously debugged rulebook is usually the Every turn rulebook.

Understand "rulebook" as a mistake ("[book-debug]").

Understand "rulebook [number]" as debugging-rulebooks-by-number.  debugging-rulebooks-by-number is an action out of world applying to one number.  
Check debugging-rulebooks-by-number when the number understood < 0 or the number understood > the number of rulebooks: say "Rulebooks are numbered from 0 to [number of rulebooks].  Usually the first 362 of them comprise the Standard Rules." instead.
Carry out debugging-rulebooks-by-number: now the previously debugged rulebook is the number understood as rulebook; say book-debug.

Understand "[text] rulebook" or "[text] rules" as debugging-rulebooks.  Debugging-rulebooks is an action out of world applying to one topic.  
Check debugging-rulebooks when using the memory economy option: say "Rulebook names are unavailable when using memory economy." instead.
Carry out debugging-rulebooks:
	if the player's command includes "rules", replace the matched text with "rulebook";
	change the previously debugged rulebook name to the player's command;
	replace the regular expression "^\s*the\s+" in the previously debugged rulebook name with ""; 
	repeat with RB-num running from 0 to the number of rulebooks begin;
		if the printed name of rulebook RB-num matches the text previously debugged rulebook name, case insensitively begin;
			now the previously debugged rulebook is RB-num as rulebook;
			say book-debug;
			rule succeeds;
		end if;
	end repeat;
	say "Can't find '[previously debugged rulebook name]'.  Find its name with RULEBOOKS or ALL RULEBOOKS."

To say book-debug:
	say "The [previously debugged rulebook]";
	if the number of rules in the previously debugged rulebook is 0 begin;
		say " currently has no rules.";
	otherwise;
		say ":[line break]";
		let rulenum be one;
		repeat with previously debugged rulebook's item running through the previously debugged rulebook begin;
			say "[rulenum]: [previously debugged rulebook's item].";
			now rulenum is rulenum plus one;
		end repeat;
	end if.

Understand "all rulebooks" as a mistake ("There are [number of rulebooks] rulebooks:[line break][rulebook-list 0][run paragraph on]").
Understand "rulebooks" as a mistake ("New rulebooks are numbered from 363 to [number of rulebooks]:[line break][rulebook-list 363][run paragraph on]").
To say rulebook-list (N - a number): (- PrintAllRulebooks({N}); -).
Include (-
#IFDEF MEMORY_ECONOMY;
[ PrintNoRulebookNames; print "Rulebook names are unavailable when using memory economy."; ];
#ENDIF;

[ PrintAllRulebooks N i;
#IFNDEF MEMORY_ECONOMY;
	for (i = N: i < {-value:NUMBER_CREATED(rulebook)}: i++)
		print i, ": ", (string) RulebookNames-->i, "^"; 
#ENDIF;
#IFDEF MEMORY_ECONOMY;
	PrintNoRulebookNames();
#ENDIF;
];

[ GetRulebookName i;
#IFNDEF MEMORY_ECONOMY;
	return  RulebookNames-->i; 
#ENDIF;
#IFDEF MEMORY_ECONOMY;
	PrintNoRulebookNames();
#ENDIF;
];

-).


Section - PseudoProcessRulebook and PseudoDB_Rule


[ PseudoProcessRulebook IS CALLED FOR 3 DIFFERENT PURPOSES:
	(1): enumerating each rule in a modified rulebook for a REPEAT loop:  repeat with R running through Rulebook X
	(2): counting the number of rules in a modified rulebook:  the number of rules in Rulebook X
	(3): searching to see if a particular rule will be considered when a particular modified rulebook is called under the currently in effect Procedural rules:  if R is listed in Rulebook X
]

Include (-

[ PseudoDB_Rule n R rreason;
#ifdef LOOP_THRU_RULEBOOKS;
	if (R==0) return;
	print "@31[Rule ~", (RulePrintingRule) R, "~ ", (string) n;
	if (rreason ~= (+directly invoked+)) print " because it was ", (PrintRuleReason) rreason;
	print ".]^";
#endif;
	rfalse;
];


!  This is a recursive routine, and will return TRUE if it was a subcall finishing. The top-level call returns FALSE
[ PseudoProcessRulebook rulebook bits rv rreason
	x frame_base substituted_rule usage rbaddress ra gc ga;

	(+The reason the rule ran+) = rreason;
#ifdef LOOP_THRU_RULEBOOKS_E;
	print "[Considering ~", (RulePrintingRule) rulebook, "~";
	if (rreason ~= (+directly invoked+)) print " because it was ", (PrintRuleReason) rreason;
	print "...]^";
#endif;
	if (rulebook == LITTLE_USED_DO_NOTHING_R)
		 rfalse;
	if (bits)
		bits = RS_ACTIVITY | RS_NOSKIPS;
	if (rule_frames<0) 
		rfalse; 

! find beginning of rule change stack and stick it in X  (so, X = usage ("ignore", "substitute", etc.), X+1 = rulebook 1,   X+2 = rulebook2
	for (x = rulechange_sp-3: x>=0: x = x - 3) 
	{
		usage = rulechange_stack-->x;
		if (usage == RS_FRAME) 
		{ 
			x=x+3; 
			break; ! whoops, too far!  back up and then we're done, X = beginning of rule change stack
		}  
		if (rulechange_stack-->(x+1) == rulebook) 
		{
			bits = bits | RS_AFFECTED_BIT;
			if (usage == RS_MOVEBEFORE or RS_MOVEAFTER) 
				bits = bits | RS_MOVED_BIT; 
		}
		if (rulechange_stack-->(x+2) == rulebook) 
			bits = bits | RS_AFFECTED_BIT; 
	} 
	if (x<0) 
		x=0;
	frame_base = x;
	! now X and frame_base are safely at bottom of the current rule stack

	! if the rulebook we're processing is the victim (not anchor) of a MOVE, skip it (the calling PseudoProcessRulebook() sets rv to true to exempt the anchor)
	if ((bits & RS_MOVED_BIT) && (rv == false))
		return PseudoDB_Rule("would have been moved away", rulebook, rreason);

	bits = bits | RS_ACTIVE_BIT | RS_USERESULT_BIT;             ! assume each rule is instated and its result (if any) would be used
	substituted_rule = rulebook;	          ! substituted_rule will hold the rule to execute -- including the original if nothing is substituted in

	if (bits & RS_AFFECTED_BIT) ! OPTIMIZATION: only process proc. rules if our rule(book) was affected by one
		! Step through the rule stack, from bottom to top, using the bits to see which Procedural Rule is the most current. 
		for (: x<rulechange_sp: x = x + 3) 
		{
			usage = rulechange_stack-->x;
			if (rulechange_stack-->(x+1) == rulebook)
			{
				switch (usage)
				{
				RS_DONOTRUN:	bits = bits &	(~RS_ACTIVE_BIT);
				RS_RUN:			bits = bits |	(  RS_ACTIVE_BIT);
				RS_DONOTUSE:	bits = bits &	(~RS_USERESULT_BIT);
				RS_USE:			bits = bits |	(  RS_USERESULT_BIT);
				RS_SUBSTITUTE:	substituted_rule = rulechange_stack-->(x+2);
				}
			}
			! if another rulebook was "moved before" the rule(book) we're running, run that now!
			if ((usage == RS_MOVEBEFORE) && (rulechange_stack-->(x+2) == rulebook)) 
			{
				!PseudoDB_Rule("has a rule(book) ~moved before~", rulebook, rreason);
				PseudoProcessRulebook(rulechange_stack-->(x+1), (bits & RS_ACTIVITY ~= 0), true, (+moved before+));
			}
		} ! end FOR loop

	! if the rule(book) we're processing has been "ignored" then return; we won't run it (or any rule that was "moved after" it)
	if ((bits & RS_ACTIVE_BIT) == 0) 
		return PseudoDB_Rule("would be ignored", rulebook, rreason); 

	! otherwise, let's execute this rule(book) !

!!!!!!!!!!!!!!!!!!!
	! here we differentiate between (1) repeating through a rulebook, (2) counting rules, and (3) answering IS LISTED IN 
	if ((ReasonForIterating == 1) && (LookingForRuleInRulebook == NULL)) 
	{  !   if the rule we're Looking To Follow is NULL, that means it was just previously found, and so *this* rule is the Next Rule After.  Return it
#ifdef LOOP_THRU_RULEBOOKS_F;
		print "[FOUND ~", (RulePrintingRule) substituted_rule, "~].^";
#endif;
		LookingForRuleInRulebook = substituted_rule; 
		DoneSearchingRulebooks = 1;
		rfalse;  ! (1) returns in triumph!
	} 
	
	! at this point, if it's (1) it still has some searching to do
	if (LookingForRuleInRulebook == substituted_rule)   ! if the rule we're looking for is this current rule, then IS LISTED IN will return immediately, but NEXTAFTER will know the next rule is the one it's searching for
	{
		LookingForRuleInRulebook = NULL;  ! found it! inform this function and the Calling funciton  via clearing its variable
		if (ReasonForIterating == 3)  ! if  IS CURRENTLY LISTED IN, return in triumph
		{	
			DoneSearchingRulebooks = 1;
			rfalse;
		}
	}
!!!!!!!!!!!!!!!!!!!

	! if substituted_rule (or the original rule, which may be in that variable!!)  is valid... execute every rule within it
	if ((substituted_rule >= 0) && (substituted_rule < {-value:NUMBER_CREATED(rulebook)}))   ! if substituted_rule is a rulebook, not a rule (specifically, it is the Inform 6 ID# for a rulebook, 0 thru 380+)
	{  !  "ra" means "rule address" -- the rule itself
		rbaddress = rulebooks_array-->substituted_rule; ! each rulebook is an array of rules; get it
		x = 0; ! index to step through each rule 
		ra = rbaddress-->0; ! get the first entry of that array, which is a Rule, a NULL, or SPECIAL
		PseudoDB_Rule("would apply all of its rules", rulebook, rreason);
		if (ra == NULL) ! then we have an empty rulebook
			jump RulebookPseudoprocessed;
		rv = (bits & RS_ACTIVITY ~= 0); 
		if (ra ~= (-2)) !  then ra is the first rule
		{
			for ( : ra ~= NULL : x++, ra = rbaddress-->x) 
			{
				PseudoProcessRulebook(ra, rv, false, (+directly invoked+)); 
				if (DoneSearchingRulebooks == 1) 
					rfalse;
			}
		}
		else ! (ra == -2) !  ra is SPECIAL; I don't know what that is, but some extra info is spliced into the array
		{
			x = 1;  !  index of the first rule
			for (ra = rbaddress-->x : ra ~= NULL : x++, ra = rbaddress-->x) 
			{
					if (gc == 0) 
					{ 
						ga = ra;   ! supposed to be another -2, or an action
						x++; 
						gc = rbaddress-->x;  ! supposed to be the length of the spliced-in info, in the range 1 -- 31
						if ((gc<1) || (gc>31)) 
						{ 
							gc = 1; ! if out of bounds, set to length 1, and -->x will not be the Rule Address
							x--;
						} 
						x++; 
						ra = rbaddress-->x; 
					} 
					gc--;   ! countdown on the length
					!if (ga ~= (-2) or action)
					!	continue; 
				PseudoProcessRulebook(ra, rv, false, (+directly invoked+));
				if (DoneSearchingRulebooks == 1) 
					rfalse;
			}
		}
	} 
	else  ! substituted rule is a rule, not a rulebook
	{
#ifdef LOOP_THRU_RULEBOOKS_C;
		print "[Rulecount++ on ", (RulePrintingRule) substituted_rule, ".]^";
#endif;
		CountRulesInRulebook++;
		PseudoDB_Rule("would apply", rulebook, rreason);
	}
	.RulebookPseudoprocessed;

	! step through rulechange stack top-to-bottom, executing rule(s) that were "moved after" the rule(book) we're currently running
	if (bits & RS_AFFECTED_BIT) ! same Optimization
		for (x=rulechange_sp-3: x>=frame_base: x = x-3) 
		{
			if ((rulechange_stack-->x == RS_MOVEAFTER) && (rulechange_stack-->(x+2) == rulebook)) 
			{
				PseudoDB_Rule("has a rule(s) ~moved after~", rulebook, rreason);
				PseudoProcessRulebook(rulechange_stack-->(x+1), (bits & RS_ACTIVITY ~= 0), true, (+moved after+));
			}
		}

	rulechange_stack-->rulechange_sp = 0;
#ifdef LOOP_THRU_RULEBOOKS_E;
	print "    [~", (RulePrintingRule) rulebook, "~ considered.]^";
#endif;
	rfalse;
];

-).


Repeat Through a Rulebook ends here.


---- DOCUMENTATION ----

This extension allows us a few basic rulebook operations:  to write a repeat phrase that runs through each of the rules in a rulebook, to ask for the number of rules in a rulebook, to ask for a random rule from a rulebook, and to ask if a particular rule is currently listed in a particular rulebook.  All of these operations honor the procedural rules, but we can also do them on an "unmodified" rulebook.  As with the caution about changing the contents of a list while repeating through it, unusual behaviour may result if procedural phrases shuffle rules while repeating through that rulebook.

	*: Carry out asking Einstein about "light":
		say "He replies, 'There are [the number of rules in the carry out looking rulebook] basic laws of optics:  ";
		repeat with the law of optics running through the carry out looking rules begin;
			say "the [law of optics]";  
			if the law of optics is listed in the check taking rules, say " (also in the check taking rules because it was [the reason the rule ran])";
			say ", ";
		end repeat.

	*: Carry out asking Einstein about "Newton":
		say "He replies, 'In Newton's world there were [the number of rules in the unmodified carry out looking rules] laws of optics:  ";
		repeat with the law of optics running through the unmodified carry out looking rules begin;
			say "the [law of optics], ";  
		end repeat;
		say ". . . but my favorite was the [random rule from the unmodified carry out looking rules].".


We can also ask for "the reason the rule ran", which is useful in debugging why a rule appears in a loop when we don't expect it.  It is of the kind "rule-reason", and the reasons are "directly invoked", "moved before", "moved after", "ignored", and "substituted".  Each reflects a procedural phrase except "directly invoked", which is the default case.  (This also includes the case when a rule is called because its enclosing rulebook was called).  Each reason is worded to follow "it was". 

Occasionally we may have edge cases where no valid rule exists.  Uninitialized rules-that-vary default to the "little-used do nothing rule".  It isn't actually a rule any more than "nothing" is an object, and we cannot set a rule-that-varies to it.  But we can test for it, or simply ask if a rule is (or isn't) valid (or invalid):
	*: if R is the little-used do nothing rule,
	if R is a valid rule,
	if R is invalid,
	if R isn't valid,


For great fun, we can ask for a random rule:

	*: The current plan is a rule that varies.  [can't initialize to a random rule]
	The current repetoire is a rulebook that varies.  The current repetoire is usually the repetoire of Machiavelli.
	When play begins: now the current plan is a random rule in the current repetoire.

For cases where rules and/or rulebooks aren't named, we can refer to them by number.  A rule may not have a name if an author or extension writer forgets to name it; a rulebook is only unnamed during a game compiled with the use option memory economy.  Rules are numbered consecutively from 1 in the order they would currently execute, and Procedural rules can change the numbering.  Rulebooks are numbered from zero up to "the number of rulebooks".  Typically, the Standard Rules define the first 362 rulebooks.  (Remember that Actions and Activities are implemented using three rulebooks apiece.) 

	now R is rule 2 in the carry out looking rulebook;
	now R is rule 2 in the unmodified carry out looking rules;

	repeat with ID num running from 0 to the number of rulebooks begin;
		say "[ID num as rulebook] has [number of rules in ID num as rulebook] rules.";
	end repeat;


We have new testing commands available to us. Enter a rulebook's name to list the rules currently in it, numbered accordingly.  Afterward, RULEBOOK alone reprints that.  Enter RULEBOOKS (the plural) for the newer rulebooks, or ALL RULEBOOKS for the whole list of 360+ in the work.  Finally, when using memory economy, we may only enter RULEBOOK and the ID number for abbreviated information.
	> THE CARRY OUT LOOKING RULES
	The carry out looking rulebook:
	1: room description heading rule.
	2: room description body text rule.
	3: room description paragraphs about objects rule.
	4: check new arrival rule.

	> RULEBOOK
	The carry out looking rulebook:
	1: room description heading rule.
	2: room description body text rule.
	3: room description paragraphs about objects rule.
	4: check new arrival rule.

	> RULEBOOKS
	363: check debugging-rulebooks rulebook
	364: carry out debugging-rulebooks rulebook
	(etc.)

	> ALL RULEBOOKS
	0: Procedural rulebook
	1: Startup rulebook
	2: Turn sequence rulebook
	(etc.)

	> RULEBOOK 0
	The Procedural rulebook currently has no rules.


Finally, a quick clarification on procedural rules and the phrases they use.  Though the Inform 7 manual implies otherwise, in fact any rulebook can use the procedural phrases (listed in 18.14 "Phrases concerning rules").  The effects will only exist downstream from the phrase, as opposed to being in effect the moment a player's action is begun.  This means a rulebook can ignore, substitute, etc., its own rules as well as any other rulebook's which it Considers (but not Follows).  (This is also true for the procedural rulebook itself -- a procedural rule can ignore a later procedural rule!) 

[Version History

Version 1: initial release

Version 2: repeat loops can now take a rulebook-that-varies; testing commands added; the word "currently" can optionally be used with "is listed in"; random rules; cleaned up numbered rules 

Version 3:  repeat loops now work for a single rule -- not rulebook -- given to them!  Fixed bug that 5T18 had in ProcessRulebook().  Simplified the Nothing Rule section.  Random now requires the word "rule/member" to follow it to prevent a clash.

Version 4:  the is/are before "currently" in the "listed in" phrases is no longer optional, to prevent a clash with Topic's "...is a <column-name> listed in the Table of...";  no longer used R as a temp variable to prevent namespace clashes

]

Example: * "Rulebook Repeat Test" - Try it out!
  
	*: "Rulebook Repeat Test"

	Include Repeat Through a Rulebook by Ron Newcomb. 
	
	Test me with " l / take rule / l / take rule / l / x oddball / take rule / l / x oddball ".
	
	Spot is room.  "This is a rather bizarre place.  Try taking a rule." An oddball is in spot.  Understand "rule" as an oddball.
	
	X is a number that varies.    
	
	Last carry out looking (this is the Test Rulebook Loop rule):
		say "The Carry Out Looking rules currently has [the number of rules in the carry out looking rules] rules:[line break]";
		repeat with the law of optics running through the carry out looking rules begin;
			say "* [the law of optics]";  
			if the law of optics is listed in the check taking rules, say " (also in the check taking rules because it was [the reason the rule ran])";
			say line break;    
		end repeat.
	
	The Test Rulebook Loop rule is listed in the check taking rules.	
	
	Instead of taking the oddball: 
		say "Removing the next Look rule.";
		now x is x + 1;
		if x is 2, say "Moving the paragraphs-about-objects rule to last place.".  	
	
	Instead of examining the oddball: 
		say "Every combination of Check Taking with Carry Out Looking:[line break]"; 
		repeat with the law of optics running through the carry out looking rules begin;
			repeat with the physical reality rule running through the check taking rules begin;
				say "[the law of optics], [the physical reality rule].";
			end repeat; 
		end repeat.
	   
	Procedural rule:
		if x > 0, ignore the room description heading rule;
		if x > 1 begin; 
			ignore the room description body text rule;
			move the room description paragraphs about objects rule to after the Test Rulebook Loop rule; [ after that rule in both rulebooks ]
		end if;
		if x > 2, ignore the room description paragraphs about objects rule;
		if x > 3, ignore the check new arrival rule.

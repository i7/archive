Version 2 of Ignored Rules by Ron Newcomb begins here.

"Temporarily ignore and later reinstate rules by way of a more efficient method than the procedural rulebook.  Also, ignored rules stay ignored until reinstated -- a new turn does not automatically reinstate them."

Include (-
Global RuleIterator; 
Global RBinquestion; 

[ ReinstateRuleForRulebook  R RB temprule;
	RBinquestion = rulebooks_array-->RB;
	for(RuleIterator = 0 : (I7_ST_IgnoredRules-->RuleIterator ~= R) && (RuleIterator < 100): RuleIterator++);
	if (RuleIterator < 100) 
	{
		temprule = (RBinquestion)-->(I7_ST_IgnoredRulesIndex-->(RuleIterator));
		if (temprule == R or LITTLE_USED_DO_NOTHING_R) 
		{
			RBinquestion-->(I7_ST_IgnoredRulesIndex-->(RuleIterator)) = I7_ST_IgnoredRules-->RuleIterator;
			I7_ST_IgnoredRules-->RuleIterator = LITTLE_USED_DO_NOTHING_R;
		} else {
			print "*** Run-time error: you wrote ~reinstate the ", (RulePrintingRule) R, " in the ", (RulePrintingRule) RB, "~, but it seems ";
			if (temprule <= 0) print "to be the wrong rulebook.^";
			else print "the ", (RulePrintingRule) temprule, " belongs there.^";
		}
	}
];
-) after "Definitions.i6t".	

To ignore (R - a rule) for/from/to/in/into (RB - rulebook): (-
	{-allocate-storage:IgnoredRules}  {-allocate-storage:IgnoredRulesIndex}
	RBinquestion = rulebooks_array-->{RB};
	for(RuleIterator = 0 : (RBinquestion)-->(RuleIterator) ~= NULL : RuleIterator++)
	{
		if ((RBinquestion)-->(RuleIterator) == {R}) {
			I7_ST_IgnoredRules-->({-advance-counter:IgnoredRules}) = {R};
			I7_ST_IgnoredRulesIndex-->({-advance-counter:IgnoredRulesIndex}) = RuleIterator;
			(RBinquestion)-->(RuleIterator) = LITTLE_USED_DO_NOTHING_R;
			break;
		}
	}
-).

To reinstate (R - a rule) for/from/to/in/into (RB - rulebook): 
(- {-allocate-storage:IgnoredRules}  {-allocate-storage:IgnoredRulesIndex} ReinstateRuleForRulebook({R}, {RB}); -).

To repeat with (R - a nonexisting rule variable) running through (RB - a rulebook) begin -- end: (-
	for(RuleIterator = 0, {R} = (rulebooks_array-->{RB})-->(RuleIterator) : {R} ~= NULL : RuleIterator++, {R} = (rulebooks_array-->{RB})-->(RuleIterator))
-).

Include (-
#ifndef I7_ST_IgnoredRules;
Array I7_ST_IgnoredRules --> 1;
Array I7_ST_IgnoredRulesIndex --> 1;
#endif;
-) before "Flex.i6t".  [ to cure an I6 compiler error when the extension is included w/out using its phrases ]

Ignored Rules ends here.

---- DOCUMENTATION ----

This extension allows us to ignore, and later reinstate, rules. There are three differences between these and the procedural rules.  One, multiple ignored rules do not slow game speed.  Two, ignored rules are NOT automatically reinstated at the beginning of the turn. Finally, we must provide the phrases with the rulebook affected.

	*: When play begins, ignore the room description heading rule in the carry out looking rulebook.
	
	*: Before waking up for the first time, reinstate the room description heading rule in the carry out looking rulebook.

Example: * Early Bird Gets The Room Heading - As above.

	*: "Early Bird Gets The Room Heading"

	Include Ignored Rules by Ron Newcomb.

	Right Here is a room.

	When play begins, ignore the room description heading rule from the carry out looking rulebook.

	Before waking up for the first time, reinstate the room description heading rule from the carry out looking rulebook.

	Test me with "look / wake up / look".


Example: ** Straightforward Test - Also showcases a repeat statement for rulebooks

	*: "Ignore and Reinstate"
	
	Include Ignored Rules by Ron Newcomb.
	
	Right here is a room.
		
	When play begins:
		say "The Carry out looking rulebook now contains:[line break]";
		repeat with R running through the carry out looking rules:
			say "[R].";
		;
		ignore the room description heading rule from the carry out looking rulebook;
		;
		say "[line break]The Carry out looking rulebook now contains:[line break]";
		repeat with R running through the carry out looking rules:
			say "[R].";
		; 
		reinstate the room description body text rule in the carry out looking rules;
		;
		say "[line break]The Carry out looking rulebook now contains:[line break]";
		repeat with R running through the carry out looking rules:
			say "[R].";
		; 
		reinstate the room description heading rule in the check looking rules;
		;
		say "[line break]The Carry out looking rulebook now contains:[line break]";
		repeat with R running through the carry out looking rules:
			say "[R].";
		; 
		reinstate the room description heading rule in the carry out looking rules;
		;
		say "[line break]The Carry out looking rulebook now contains:[line break]";
		repeat with R running through the carry out looking rules:
			say "[R].";
		; 
		reinstate the room description heading rule in the check looking rules;
		;
		say "[line break]The Carry out looking rulebook now contains:[line break]";
		repeat with R running through the carry out looking rules:
			say "[R].";
		;
		ignore the room description heading rule from the carry out looking rulebook;
		ignore the check new arrival rule from the carry out looking rulebook;
		;
		say "[line break]The Carry out looking rulebook now contains:[line break]";
		repeat with R running through the carry out looking rules:
			say "[R].";
		;
		reinstate the check new arrival rule from the carry out looking rulebook;
		;
		say "[line break]The Carry out looking rulebook now contains:[line break]";
		repeat with R running through the carry out looking rules:
			say "[R].";

		
	
	



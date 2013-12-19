Version 1 of Event Chains by William S Martin begins here.

Checker rules is a rulebook.

Toggle rules is a rulebook.

To step through chain (current table - a table name), terminating:
	let N be the number of filled rows in the current table;
	let K be 0;
	repeat through the current table:
		increment K;
		unless N is K and not terminating:
			if there is checker entry:
				follow the checker entry;
				if rule succeeded:
					blank out the whole row;
					next;
				else if rule failed:
					if there is a subtable entry:
						step through chain subtable entry;
						break;
					if there is a reply entry:
						say the reply entry;
						say paragraph break;
					if there is a toggle entry:
						follow the toggle entry;
						if the rule succeeded:
							blank out the toggle entry;
					break;
				else:
					next;
			else:
				if there is a subtable entry:
					step through chain subtable entry;
					break;
				if there is a reply entry:
					say the reply entry;
					say paragraph break;
				if there is a toggle entry:
					follow the toggle entry;
					if rule succeeded:
						blank out the toggle entry;
				blank out the whole row;
				break;
		else:
			if there is a subtable entry:
				step through chain subtable entry;
				break;
			if there is a reply entry:
				say the reply entry;
				say paragraph break;
			if there is a toggle entry:
				follow the toggle entry;
				if rule succeeded:
					blank out the toggle entry;
			break.

Table of Null Chain
checker	toggle	subtable	reply
a rule	a rule	a table name	a text


Event Chains ends here.


---- DOCUMENTATION ----

Event Chains is a small extrension that doesn't add any new functionality into the game. Instead, it provides an alternative way to order events through a table, as opposed to rules or lengthy IF...ELSE IF statements. It was especially made for conversations, but it can be applied to any set of complex events.

Event Chains was intended for situations where one specific trigger could produce a variety of different effects, depending on a wide variety of conditions in a specific order. For example, talking to someone at different points in the game will produce different replies, perhaps triggering events under certain conditions, or when there's a timed event that triggers rules. Event Chains is a little complex to use casually. It will save a considerable amount of time and space, however for very complicated interactions, and very useful when you want things considered in a very specific order.

Take this example:

	Instead of talking to Hugh while the player is not carrying the luggage and Hugh is not carrying luggage: say "'Sir, I need your luggage.'"

	After talking to Hugh when the player has the luggage:
		now Hugh is carrying the luggage;
		say "'Thank you, sir,' he says, taking your bag."

	After talking to Hugh when Hugh is carrying the luggage: say "'Thank you, sir.'"

	After talking to Hugh when Hugh is carrying the luggage for the fifth time:
		say "In a fit of rage, Hugh punches you in the face.";
		now the player is bruised.
		
This would work, however, it uses many rules, and if we have a conversation-heavy game, our conditions are probably going to get ever more arcane, like "After talking to Hugh when Susie is in the parking lot and Hugh is carrying the luggage and the player carries the airplane ticket which is stamped for the fifth time during scene10".

In response, our author might write the following:

	Counter is a number that varies.
	
	After talking to Hugh:
		if Hugh is not carrying the luggage and the player is not carrying the luggage:
			say "'Sir I need your luggage.'";
		else if the player is carrying the luggage:
			say "'Thank you, sir,' he says, taking your bag.";
			now Hugh is carrying the luggage;
		else:
			increment the counter;
			if the counter is not 5:
				say "'Thank you, sir.'";
			else:
				say "In a fit of rage, Hugh punches you in the face.";
				now the player is bruised.

Which would work also, but would be rather awkward, and it isn't modular.

Event Chains provides an elegant, modular solution to situations like these.

Section: How it works

Event chains provide a phrase that moves down a table, stopping when it meets the first row it can access. Here's a breakdown:

1) Starting from top, it looks for a non-blank table row,

2) When it finds one, it looks to see if there's a checker entry, which is a rule that tests for conditions.
--if it doesn't have a checker entry, it stops there, follows the rule in the toggle entry, says the reply entry, and then blanks out the entire row.
--if it does, it tests the checker entry, moving to step 3.

3) The event chain checks the checker entry.
--if the checker rule succeeds, it moves to step 5.
--if there is no outcome, it moves onto the next entry without blanking out the row.
--if the rule fails, the event chain stops, following step 4.

4) This step should only be considered when the check rule failed. When that happens, chain stops on that row, follows the toggle rule and says the reply entry, if there is one or both.

5) This step is considered when the check rule succeeds, or if there is no checker rule. The chain stops on this row, follows the toggle rule, says the reply entry, then blanks the row out, never following it again.

Using this system, the examples above would look something like this:

*:
	After talking to Hugh:
		step through chain Table of Hugh Conversation.
	
	Table of Hugh Conversation
	checker	toggle	reply
	chk001 rule	--	"'Sir, I need your luggage.'"
	--	tg001 rule	"'Thank you sir,' he says, taking your luggage."
	--	--	"'Thank you sir.'"
	--	--	"'Thank you sir.'"
	--	--	"'Thank you sir.'"
	--	--	"'Thank you sir.'"
	--	tg002 rule	"In a fit of rage, Hugh punches you in the face."
	--	--	"'Thank you sir'"
	
	Checker rule (this is the chk001 rule):
		if the player is carrying the luggage:
			rule succeeds;
		else:
			rule fails.
	
	Toggle rule (this is the tg001 rule):
		now Hugh is carrying the luggage.
	
	Toggle rule (this is the tg002 rule):
		now the player is bruised.

This is functionally identical to the other two examples aboves, except 1) it functions using only one After rule, decreasing the chance of a conflict with other rules, or things happening in the order that you don't want them to occur, and 2) it doesn't require the use of a counter.

One caveat: an Event Chain will never delete the last row of a table, unless you use the "terminating" phrase option, which can delete the last row. So saying:

	step through chain Table of Hugh Conversation, terminating

will cause the Event Chain to delete even the last row if the Checker rule doesn't fail.

Whether Event Chains is useful is entirely subjective. Personally, I feel as though Event Chains has helped my code get cleaner, is less likely to have a bug and much more likely to do things in the order that I want them done, but that is entirely my experience alone. Event Chains in different situations can be more work, and it isn't designed to be a total replacement for the rule-based system. While you could, theoretically, run an entire action using an event chain alone by use a STEP THROUGH CHAIN phrase during a CHECK rule, it isn't recommended.

The checker and toggle rulebooks are purely to organize rules. You should never run through the rulebook, as in ABIDE BY THE CHECKER RULES.

Section: Subtables

Event Chains provides support for sub-tables (or sub-chains). If a chain has a subtable entry, it will follow that entry, as in:

Table of First Chain
toggle	checker	reply	subtable
--	--	"First subtable chain."	Table of Second Chain

Table of Second Chain
toggle	checker	reply	subtable
--	--	"Second subtable chain."	--

Subtable support is untested, it is provided as is for people who are interested.

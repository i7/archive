Version 4 of Empty Transfer by Emily Short begins here.

"Adds actions for emptying containers."

Include Locksmith by Emily Short. 

Understand "empty [container]" as emptying. Understand "empty [something]" as emptying.

This is the noun must be open rule:
	if the noun is closed:
		follow the noun autoopening rule;
	if the noun is closed:
		stop the action; 
	make no decision.

This is the second noun must be open rule:
	if the second noun is closed:
		follow the second noun autoopening rule;
	if the second noun is closed:
		stop the action;
	make no decision. 
	
This is the noun autoopening rule:
	if the sequential action option is active:
		if the player is the person asked:
			try opening the noun;
		otherwise:
			try the person asked trying opening the noun;
	otherwise:
		if the player is the person asked:
			say "(first opening [the noun])[command clarification break]";
			silently try opening the noun;
		otherwise:
			try the person asked trying opening the noun; 

This is the second noun autoopening rule:
	if the sequential action option is active:
		if the player is the person asked:
			try opening the second noun;
		otherwise:
			try the person asked trying opening the second noun;
	otherwise:
		if the player is the person asked:
			say "(first opening [the second noun])[line break]";
			silently try opening the second noun;
		otherwise:
			try the person asked trying opening the second noun.

Emptying is an action applying to one thing. 

Check an actor emptying something (this is the can't empty what's not a container rule):
	if the noun is not a container:
		if the player is the person asked:
			say "You can't empty [a noun].";
		stop the action.

Check an actor emptying (this is the can't empty what's closed rule):
	abide by the noun must be open rule.
	
Check an actor emptying (this is the can't empty what's empty rule):
	if the noun does not contain something:
		if the player is the person asked:
			say  "There is nothing in [the noun].";
		stop the action;   
	
Carry out an actor emptying (this is the move emptied items rule):
	now every thing is unmarked for listing;
	repeat with item running through things in the noun:
		if the person asked is the player:
			silently try taking the item; 
		otherwise:
			silently try the person asked trying taking the item;
		if the person asked carries the item:
			if the person asked is the player:
				silently try dropping the item;
			otherwise:
				silently try the person asked trying dropping the item;
			if the person asked does not carry the item:
				now the item is marked for listing;  

Report an actor emptying (this is the standard empty report rule):
	if the number of marked for listing things is 0:
		say "Nothing comes out of [the noun]." instead;
	if the player is the person asked:
		say "You empty ";
	otherwise:
		say "[The person asked] empties ";
	say "[the list of marked for listing things] from [the noun].";
	now every thing is unmarked for listing. 
	
Understand "empty [container] into/in [container]" as transferring it into. Understand "empty [something] into/in [something]" as transferring it into. Understand the command "dump" as "empty".

Transferring it into is an action applying to two things. 

Check an actor transferring something into something (this is the can't transfer what's not a container rule): 
	abide by the can't empty what's not a container rule.

Check an actor transferring something into something  (this is the can't transfer from closed containers rule): 
	abide by the noun must be open rule.

Check an actor transferring something into something  (this is the can't transfer from empty containers rule): 
	abide by the can't empty what's empty rule.

Check an actor transferring something into something  (this is the can't transfer into what's not a container rule): 
	if the second noun is not a container:
		if the player is the person asked:
			say "[The second noun] cannot contain things.";
		stop the action.

Check an actor transferring something into something  (this is the can't transfer to closed containers rule):
	abide by the second noun must be open rule.
	
Check an actor transferring something into something  (this is the can't transfer something within itself rule):
	if the noun encloses the second noun:
		abide by the must hold the second noun rule.
	
Carry out an actor transferring something into something (this is the move transferred items rule):
	now every thing is unmarked for listing;
	repeat with item running through things in the noun:
		if the player is the person asked:
			silently try taking the item;
		otherwise:
			silently try the person asked trying taking the item;
		if the person asked carries the item:
			if the person asked is the player:
				try silently inserting the item into the second noun;
			otherwise:
				silently try the person asked trying inserting the item into the second noun;
			if the item is in the second noun:
				now the item is marked for listing.

Report an actor transferring something into something (this is the standard transfer report rule):
	if the number of marked for listing things is 0:
		say "Nothing comes out of [the noun]." instead;
	if the player is the person asked:
		say "You empty ";
	otherwise:
		say "[The person asked] empties ";
	say "[the list of marked for listing things] from [the noun] ";
	if the second noun is a container:
		say "into";
	otherwise:
		say "onto";
	say " [the second noun][if something is in the noun]. [The list of things in the noun] remain[s] in [the noun][end if].";
	now every thing is unmarked for listing.


Understand "empty [container] on/onto [supporter]" as dumping it onto. Understand "empty [something] on/onto [something]" as dumping it onto.

Dumping it onto is an action applying to two things.

Check an actor dumping something onto something (this is the can't dump from unheld containers rule):
	abide by the must hold the noun rule.

Check an actor dumping something onto something (this is the can't dump from non containers rule): 
	abide by the can't empty what's not a container rule.

Check an actor dumping something onto something (this is the can't dump from closed containers rule): 
	abide by the noun must be open rule.

Check an actor dumping something onto something (this is the can't dump empty containers rule): 
	abide by the can't empty what's empty rule.

Check an actor dumping something onto something (this is the can't dump onto what's not a supporter rule): 
	if the second noun is not a supporter:
		if the player is the person asked, say "[The second noun] cannot support things.";
		stop the action; 
	
Check an actor dumping something onto something (this is the can't dump onto itself rule):
	abide by the can't transfer something within itself rule.  
	 
Carry out an actor dumping something onto something (this is the move dumped items rule):
	now every thing is unmarked for listing;
	repeat with item running through things in the noun:
		if the player is the person asked:
			silently try taking the item;
		otherwise:
			silently try the person asked trying taking the item;
		if the person asked carries the item:
			if the person asked is the player:
				try silently putting the item on the second noun;
			otherwise:
				silently try the person asked trying putting the item on the second noun;
			if the item is on the second noun:
				now the item is marked for listing. 
	
Report an actor dumping something onto something (this is the standard report dumping rule):
	follow the standard transfer report rule. 

Empty Transfer ends here.

---- Documentation ----

This extension adds three actions: emptying something (for emptying a container onto the floor); transferring something into something (for moving the contents of a container into another container); and dumping something onto something (for moving the contents of a container onto a table). All three actions are implemented for non-player characters as well as for the player.

If an object in a container should not be movable, it is enough to supply an "instead of taking" rule (and another "instead of someone trying taking..." rule, if other characters than the player are going to interact with the object). These insteads will be honored in the process of emptying. (A note of warning: because of the way messages are printed, the results may be infelicitous if we rely on making the contained object "fixed in place" rather than writing an instead of taking rule. In that case, Inform may print "That's fixed in place." at a point in the action where it is unclear what "That" refers to.) 

Example: * Sorting - A test case with boxes and enclosed items.

	*: "Sorting"

	Include Empty Transfer by Emily Short.	

	 Start Room is a room. 

	The grey box, the silver box, the blue box, and the white box are openable open containers in the Start Room. The grey box contains an apple, an orange, a chocolate, and a mint. The white box contains a napkin. The blue box contains an anchovy and a key. The silver box contains a sense of wonder.

	The pedestal is a supporter in the Start Room.

	Clark is a man in the Start room. A persuasion rule: persuasion succeeds.

	Instead of taking the mint: say "The mint has melted in place." Instead of someone trying taking the mint: say "[The person asked] tries to pry the mint from place, but it is melted there."

	Instead of taking something which is in the silver box: say "You can't reach into the silver box." Instead of someone trying taking something which is in the silver box: say "[The person asked] cannot fit a hand into the silver box."

	Test empty with "empty grey / put all in grey / close grey / empty grey / empty apple / empty silver box".

	Test transfer with "empty grey into white / dump white into grey / put white in grey / empty grey into white / get all / put all in white / get grey / empty white into grey / dump grey into blue / dump blue onto pedestal".

	Test Clark1 with "get grey / drop grey / put all but grey in grey / close grey / clark, empty grey / clark, get orange and apple / clark, put orange and apple in grey / clark, empty silver box/ clark, drop grey / get grey / put all in grey / clark, empty grey".

	Test Clark2 with "clark, empty grey into white / clark, get white / clark, put orange into white / clark, empty white onto pedestal / clark, empty silver box".
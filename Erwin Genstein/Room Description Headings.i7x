Version 1/090620 of Room Description Headings by Erwin Genstein begins here.

"Provides additional options for controlling room description headings, including the list of things enclosing the player, prepositions and punctuation."

Part RDH/I - Describing Enclosures

[Herein we define an easy means of later overriding " (on the X)" and " (in the X)" after room descriptions without all the tedious mucking about that this extension exhibits. We also allow easy display of similar text of when neither on/in anything, or when in the dark, as desired.]

Section RDH/I/1 - Things That Vary

The player's enclosure is an object that varies.
The described enclosure is an object that varies.
The enclosure ancestry count is a number that varies.
The enclosure ancestry index is a number that varies.
The apparent location is an object that varies.

Section RDH/I/2 - New Activities

Room description headings is an activity.
Naming the apparent location is an activity.
Listing enclosures is an activity.
Describing the player's enclosure is an activity.
Describing the player's enclosure ancestry is an activity.
Printing an enclosure description is an activity.
Opening an enclosure description is an activity.
Printing an enclosure preposition is an activity.
Describing an enclosure is an activity.
Closing an enclosure description is an activity.
Listing enclosures from scratch is an activity.

Section RDH/I/3 - Rules For New Activities

Rule for room description headings (this is the embolden the apparent location rule):
	say bold type;
	continue the activity.

Rule for room description headings (this is the name the apparent location rule):
	carry out the naming the apparent location activity;
	continue the activity.
	
Rule for room description headings (this is the stop emboldening the apparent location rule):
	say roman type;
	continue the activity.
	
Rule for room description headings (this is the list enclosures after the apparent location rule):
	carry out the listing enclosures activity;
	continue the activity.
	
Rule for room description headings (this is the line break after the room description heading rule):
	say line break;
	continue the activity;
	
Rule for room description headings (this is the run paragraph on after the room description heading rule):
	say run paragraph on with special look spacing;
	continue the activity.
	
Rule for naming the apparent location (this is the we might appear to be in darkness rule):
	if the apparent location is nothing:
		begin the printing the name of a dark room activity;
		if handling the printing the name of a dark room activity,
			issue miscellaneous library message number 71;
		end the printing the name of a dark room activity;
	continue the activity.

Rule for naming the apparent location (this is the we might appear to be in the location rule):
	if the apparent location is the location:
		say "[apparent location]";
	continue the activity.
		
Rule for naming the apparent location (this is the we might appear to be in something rule):
	if the apparent location is not nothing and the apparent location is not the location:
		say "[Rdh the apparent location]";
	continue the activity.

To deduce the enclosure ancestry count:
	let the current enclosure be the player's enclosure;
	now the enclosure ancestry count is zero;
	while the current enclosure is not the apparent location and the current enclosure is not nothing:
		now the current enclosure is the visibility-holder of the current enclosure;
		if the current enclosure is not the apparent location and the current enclosure is not nothing:
			increase the enclosure ancestry count by one.

The last for listing enclosures rule (this is the default listing enclosures rule):
	deduce the enclosure ancestry count;
	carry out the describing the player's enclosure activity;
	carry out the describing the player's enclosure ancestry activity.

The last for describing the player's enclosure rule (this is the default describing the player's enclosure rule):
	if the player's enclosure is not the apparent location:
		now the described enclosure is the player's enclosure;
		now the enclosure ancestry index is zero;
		carry out the printing an enclosure description activity.

The last for describing the player's enclosure ancestry rule (this is the default describing the player's enclosure ancestry rule):
	now the enclosure ancestry index is zero;
	now the described enclosure is the player's enclosure;
	while the described enclosure is not the apparent location and the described enclosure is not nothing:
		now the described enclosure is the visibility-holder of the described enclosure;
		increase the enclosure ancestry index by one;
		if the described enclosure is not the apparent location and the described enclosure is not nothing:
			carry out the printing an enclosure description activity.

The last for printing an enclosure description rule (this is the default printing an enclosure description rule):
	carry out the opening an enclosure description activity;
	carry out the printing an enclosure preposition activity;
	carry out the describing an enclosure activity;
	carry out the closing an enclosure description activity.

The last for opening an enclosure description rule (this is the open enclosure descriptions with a parenthesis rule):
	say " (";

The last for closing an enclosure description rule (this is the close enclosure descriptions with a parenthesis rule):
	say ")";

The last for printing an enclosure preposition rule (this is the default printing an enclosure preposition rule):
	if the described enclosure is a container or the described enclosure is a room:
		say "in ";
	otherwise if the described enclosure is a supporter:
		say "on ";
	otherwise:
		say "in ".

To say rdh the (obj - an object): say "[the obj]".
To say Rdh the (obj - an object): say "[The obj]".
	
The last for describing an enclosure rule (this is the default describing an enclosure rule):
	say "[rdh the described enclosure]".

Section RDH/I/4 - A New Room Description Heading Rule

[We replace the standard rule description heading rule with our own, with the listing enclosures activity taking the place of repeated issuance of library message looking action number 8.]
The room description heading rule is not listed in the carry out looking rulebook.
The first carry out looking rule (this is the room description heading with enclosures rule):
	[Deleted Code Begins --
	say bold type;
	if the visibility level count is 0:
		begin the printing the name of a dark room activity;
		if handling the printing the name of a dark room activity,
			issue miscellaneous library message number 71;
		end the printing the name of a dark room activity;
	otherwise if the visibility ceiling is the location:
		say "[visibility ceiling]";
	otherwise:
		say "[Rdh the visibility ceiling]";
	say roman type;
	--Deleted Code Ends]
	[New Code Begins--]
	if the visibility level count is 0:
		now the player's enclosure is nothing;
		now the apparent location is nothing;
	otherwise:
		now the player's enclosure is the visibility-holder of the actor;
		now the apparent location is the visibility ceiling;
	carry out the room description headings activity;
	[--New Code Ends]
	[Deleted Code Begins--
	let intermediate level be the visibility-holder of the actor;
	repeat with intermediate level count running from 2 to the visibility level count:
		issue library message looking action number 8 for the intermediate level;
		let the intermediate level be the visibility-holder of the intermediate level;
	say line break;
	say run paragraph on with special look spacing.
	--Deleted Code Ends]

The last for listing enclosures from scratch rule (this is the default listing enclosures from scratch rule):
	calculate visibility ceiling at low level;
	let visibility-level-count be the visibility ceiling count calculated;
	let visibility-ceiling be the visibility ceiling calculated;
	if the visibility-level-count is 0:
		now the player's enclosure is nothing;
		now the apparent location is nothing;
	otherwise:
		now the player's enclosure is the visibility-holder of the player;
		now the apparent location is the visibility-ceiling;
	carry out the listing enclosures activity.

To say the player's enclosures from scratch:
	carry out the listing enclosures from scratch activity.

To say the player's surroundings with enclosures:
	say "[the player's surroundings][the player's enclosures from scratch]".

Room Description Headings ends here.

---- DOCUMENTATION ----

Chapter: About This Extension

Section: Introduction

The room description heading customarily consists of the name of the room, in bold type. If the player is enclosed by something, which we'll call the player's enclosure, it is usually printed afterwards in parentheses as in " (on the chair)". If that thing, in turn, is enclosed by something, it appears next; and so on.

This list can be hard to control, since it is composed by the standard rules' "room description heading rule" and its component parts are handed by issuing library messages (library message looking action number 8, to be more specific). This extension allows this list to be augmented, reformatted or suppressed entirely; it also allows similar text to be displayed when the player is not enclosed by anything (other than the location), or when the player is in darkness. It does so through a series of activities which are perhaps more intuitively named and easier to control.

This extension uses the following terminology.

	Enclosure - some thing which encloses something else.

	The player's enclosure - the thing which most immediately encloses the player, be that an object or the location.

	The player's enclosure ancestry - the list of things which enclose the player's enclosure, if any.

	Enclosure description - an item in the list which follows the room name in the room description heading, such as in "Bedroom (on the chair) (on the table)".

Section: New Activities

The following new activities are provided by this extension.

	Room description headings
	Naming the apparent location
	Listing enclosures
	Describing the player's enclosure
	Describing the player's enclosure ancestry
	Printing an enclosure description
	Opening an enclosure description
	Printing an enclosure preposition
	Describing an enclosure
	Closing an enclosure description

These call each other, as in the following example when displaying the room description heading,"Factory (in the box) (on the conveyor belt) (on the platform)":

	Room description headings
		"[bold type]"
		Naming the apparent location "Factory"
		"[roman type]"
		Listing enclosures
			Describing the player's enclosure
				Printing an enclosure description
					Opening an enclosure description " ("
					Printing an enclosure preposition "in "
					Describing an enclosure "the box"
					Closing an enclosure description ")"
			Decribing the player's enclosure ancestry
				Printing an enclosure description
					Opening an enclosure description " ("
					Printing an enclosure preposition "on "
					Describing an enclosure "the conveyor belt"
					Closing an enclosure description ")"
				Printing an enclosure description
					Opening an enclosure description " ("
					Printing an enclosure preposition "on "
					Describing an enclosure "the platform"
					Closing an enclosure description ")"
		"[line break]"
		"[run paragraph on with special look spacing]"

Section: New Variables
 
The following new variables are provided by this extension, for use in the new activities. 

Note that these variables are not intended for use outside the new activities.

	The apparent location (a thing that varies)
	The player's enclosure (a thing that varies)
	The described enclosure (a thing that varies)
	The enclosure ancestry count (a number that varies)
	The enclosure ancestry index (a number that varies)

"The apparent location" indicates the thing whose name appears in bold as the room description heading. This is often the location, but not always: if the player is inside a closed container, that will be the apparent location; if the player is in darkness, the apparent location will be nothing.

"The player's enclosure" indicates the thing which most immediately encloses the player. If the player is simply standing in a room, then the player's enclosure is that room (the location). If the player is in darkness, it is set to nothing.

"The described enclosure" varies during the course of the "listing enclosures" activity. It always indicates the enclosure which is currently being described. It is always set correctly prior to carrying out the "printing an enclosure description" activity. In the example from the previous section, it will first be the box, then the conveyor belt, then the platform.

"The enclosure ancestry count" is set up when the "listing enclosures" activity begins. It indicates the number of things which will appear in the list of enclosures after the player's enclosure. In the example from the previous section, it will be two, since two things are listed after the player's enclosure.

"The enclosure ancestry index" varies during the course of the "listing enclosures" activity. It is zero when describing the player's enclosure; one when describing the thing, if any, which encloses that; two when describing the thing, if any, which in turn encloses that; and so on. In the example from the previous section, it is zero when printing an enclosure description for the box; one when printing an enclosure description for the conveyor belt; and two when printing an enclosure description for the platform.

Chapter: Using This Extension

Section: Removing Parentheses

To remove the parentheses from enclosure descriptions, perhaps in favour of commas, simply override the relevant rules:

	Rule for opening an enclosure description: say ", ".
	Rule for closing an enclosure description: rule succeeds.

"Rule succeeds" prevents the remaining (default) rule for closing an enclosure description from being executed.

This would result in enclosure descriptions such as "Bedroom, on the chair" or "Bedroom, on your chair, on the table".

One might equally do the following:

	The open enclosure descriptions with a parenthesis rule is not listed in any rulebook.
	The close enclosure descriptions with a parenthesis rule is not listed in any rulebook.

Though since it is the first of these which prints a space between enclosure descriptions, and after the room name, this would result in enclosure descriptions such as "Bedroomon the chairon the table". It is likely that some rule for opening enclosure descriptions is desirable, even if it only prints a space:

	The open enclosure descriptions with a parenthesis rule is not listed in any rulebook.
	The close enclosure descriptions with a parenthesis rule is not listed in any rulebook.
	Rule for opening an enclosure description: say " ".

Section: Changing Enclosure Prepositions

To change the preposition used for a particular thing as part of its enclosure description:

	Rule for printing an enclosure preposition when the described enclosure is the table: say "lying on".

Though this could lead to both "Bedroom (lying on the table)" and "Bedroom (on the chair) (lying on the table)". To avoid the latter, we'd want to only replace the preposition when the table is the player's enclosure (and so not when it is part of the player's enclosure ancestry):

	Rule for printing an enclosure preposition when the described enclosure is the player's enclosure and described enclosure is the table: say "lying on ".

To change the prepositions uses for all containers and supporters, we might do the following:

	Rule for printing an enclosure preposition when the described enclosure is the player's enclosure and the described enclosure is a supporter: say "perched on ".
	Rule for printing an enclosure preposition when the described enclosure is the player's enclosure and the described enclosure is a container: say "squatting in ".

Section: Describing Enclosures Differently

We might want to describe the enclosures themselves differently, without changing the rest of the enclosure description:

	Rule for describing an enclosure: say "your [described enclosure]".

This would result in enclosure descriptions such as "Bedroom (on your chair)" or "Bedroom (on your chair) (on your table)".

Or rather more unhelpfully:

	Rule for describing an enclosure: say "something".

This would result in enclosure descriptions such as "Bedroom (on something)" or "Bedroom (on something) (in something)", and so is unlikely to be any use in practice.

Section: Augmenting Enclosure Descriptions

We might want to augment enclosure descriptions, still within their opening and closing brackets, as in this - admittedly whimsical - example:

	After opening an enclosure description when the described enclosure is the player's enclosure: say "relaxing ".
	Before closing an enclosure description when the player is carrying something and when the described enclosure is the player's enclosure: say ", waving [a random thing carried by the player]".

This would result in enclosure descriptions such as "Bedroom (relaxing on the chair, waving a pencil)".

Section: Enclosure Descriptions When Not Enclosed By Anything

We might want to print something passing for an enclosure description even if the player is neither on nor in anything, but is simply standing in a room; perhaps to indicate their mood. This is easily achieved:

	Rule for describing the player's enclosure when the player's enclosure is the location: say " (wandering aimlessly)".

This would result in enclosure descriptions such as "Bedroom (wandering aimlessly)".

Section: Enclosure Descriptions When In Darkness

We might want to print something passing for an enclosure description when the player is in darkness, as follows:

	Rule for describing the player's enclosure when in darkness: say " (fretting about grues)".

This would result in the following when in the dark: "Darkness (fretting about grues)".

Section: Simplifying Or Omitting Enclosure Descriptions

We might decide that enclosure descriptions such as "Factory (in the box) (on the conveyor belt) (on the platform)" are simply too lengthy, and that we want to only describe the player's enclosure, not its ancestry:

	The default describing the player's enclosure ancestry rule is not listed in any rulebook.

This simplifies the above to "Factory (in the box)". After getting out of the box, the description would be "Factory (on the conveyor belt)".

We might want to omit enclosure descriptions altogether, perhaps because we have arranged that they are included in the main body of the room description:

	The default listing enclosures rule is not listed in any rulebook.

This would also omit any additional enclosure descriptions we have applied, such as when in darkness. To retain those, but not display the default enclosure descriptions:

	The default describing the player's enclosure rule is not listed in any rulebook.
	The default describing the player's enclosure ancestry rule is not listed in any rulebook.

Section: Naming the Apparent Location

We might want to skip the bold type around the name of the apparent location:

	The embolden the apparent location rule is not listed in any rulebook.
	
We might not like "Darkness" as the name of dark locations; perhaps in the a location such as the Cellar we'd prefer "A Dark and Gloomy Cellar":

	Rule for naming the apparent location when the apparent location is nothing: say "A Dark and Gloomy [location]".

Section: Overall Room Description Heading Control

Perhaps we don't like the line break between the room description heading and the room description:

	The line break after the room description heading rule is not listed in any rulebook.
	The last for room description headings rule: say "...[run paragraph on with special look spacing]".
	
We might want to omit the entire room description heading, including the room name and any enclosure descriptions:

	The first for room description headings rule: rule succeeds.

Example: * Bombast - Excessive use of enclosure descriptions.

	*: "Bombast"

	Include Room Description Headings by Erwin Genstein.

	The Hall is a room. "This room is all hustle and bustle as party guests flit to and fro. A small doorway lies to the east.". 

	The Kitchen is east of the Hall. "At last, some peace and quiet. A small doorway leads back to the party to the west, and an even smaller doorway leads down." 

	The glowing champagne flute is in the kitchen. "Some tedious partygoer has left a champagne flute here. You are hardly surprised, given the nature of the company, that it is emitting a weary, gentle glow. Doubtless somebody's idea of a 'neat trick'." It is lit. Understand "glow" and "light" and "glass" as the flute.

	The chair is an enterable supporter in the Kitchen. 

	The Cellar is down from the Kitchen. It is dark. "A dank, dark cellar. Though the noise and bluster still wafts in from above, you may have finally found the most peaceful part of the building.". 

	The vast cardboard box is an open, openable, enterable container in the Cellar. The large cardboard box is an open, openable, enterable container. It is in the vast cardboard box. 

	The player carries an empty glass, a cheap cigar and an invitation. 

	Rule for opening an enclosure description: say ", ".

	Rule for closing an enclosure description: rule succeeds.

	Rule for describing the player's enclosure when the player's enclosure is the location: say ", wandering aimlessly".

	[Rule for describing the player's enclosure when the apparent location is not the location and when not in darkness: say ", depressingly confined"; make no decision.]

	Rule for describing the player's enclosure when in darkness: say ", fretting about grues".

	After opening an enclosure description when the described enclosure is the player's enclosure: say "joylessly ".

	Before closing an enclosure description when the player is carrying something and the described enclosure is the player's enclosure: say ", waving [a random thing carried by the player]".

	Rule for printing an enclosure preposition when the described enclosure is the player's enclosure and the described enclosure is a supporter: say "perched on ".

	Rule for printing an enclosure preposition when the described enclosure is the player's enclosure and the described enclosure is a container: say "squatting in ".

	Rule for describing an enclosure: say "someone else's [described enclosure]".

	Test me with "e / sit in chair / look / get up / down / up / get flute / down / enter vast / look / drop flute / enter large / look / close vast / look / close large / look".


Version 1/110709 of Shipboard Directions by Samuel Byron begins here.

"Extends the features found in Mikael Segercrantz's extension of the same name, automating several common tasks and providing built-in disambiguation between compass and shipboard directions."


Section 1 - Creating the directions

The aft is a direction. The opposite of aft is fore. Understand "a" as aft.
The fore is a direction. The opposite of fore is aft. Understand "f" as fore.
The port is a direction. The opposite of port is starboard. Understand "p" as port.
The starboard is a direction. The opposite of starboard is port. Understand "s" as starboard.

The port bow is a direction. The opposite of port bow is starboard quarter. Understand "pb" and "p b" and "p bow" and "port b" as port bow.
The port quarter is a direction. The opposite of port quarter is starboard bow. Understand "pq" and "p q" and "p quarter" and "port q" as port quarter.
The starboard bow is a direction. The opposite of starboard bow is port quarter. Understand "sb" and "s b" and "s bow" and "starboard b" as starboard bow.
The starboard quarter is a direction. The opposite of starboard quarter is port bow. Understand "sq" and "s q" and "s quarter" and "starboard q" as starboard quarter.

Does the player mean going port: it is likely.
Does the player mean examining port: it is likely.
Does the player mean pushing something to port: it is likely.
Does the player mean entering port: it is likely.

Does the player mean going starboard:
	if onboard ship, it is very likely;
	otherwise it is likely.
Does the player mean examining starboard:
	if onboard ship, it is very likely;
	otherwise it is likely.
Does the player mean pushing something to starboard:
	if onboard ship, it is very likely;
	otherwise it is likely.
Does the player mean entering starboard:
	if onboard ship, it is very likely;
	otherwise it is likely.

The verb to be abaft of implies the mapping aft relation.
The verb to be abaft from implies the mapping aft relation.
The verb to be mapped abaft of implies the mapping aft relation.
The verb to be mapped abaft from implies the mapping aft relation.
The verb to be astern of implies the mapping aft relation.
The verb to be astern from implies the mapping aft relation.
The verb to be mapped astern of implies the mapping aft relation.
The verb to be mapped astern from implies the mapping aft relation.

The verb to be forward of implies the mapping fore relation.
The verb to be forward from implies the mapping fore relation.
The verb to be mapped forward of implies the mapping fore relation.
The verb to be mapped forward from implies the mapping fore relation.
The verb to be ahead of implies the mapping fore relation.
The verb to be ahead from implies the mapping fore relation.
The verb to be mapped ahead of implies the mapping fore relation.
The verb to be mapped ahead from implies the mapping fore relation.

Index map with aft mapped as south.
Index map with fore mapped as north.
Index map with port mapped as west.
Index map with starboard mapped as east.

Index map with port bow mapped as northwest.
Index map with port quarter mapped as southwest.
Index map with starboard bow mapped as northeast.
Index map with starboard quarter mapped as southeast.

Section 2 - Overriding compass directions

Use shipboard directions translates as (- Constant DIRECTIONS_SHIP; -).

A direction can be universal, compass, or shipboard. A direction is usually universal.
North, south, east, west, northeast, northwest, southeast, and southwest are compass.
Aft, fore, port, starboard, port bow, port quarter, starboard bow, and starboard quarter are shipboard.

The specification of the direction conditions is "Essentially a kind of direction. Compass directions are not allowed to be used onboard ships or shipboard directions on land, but universal directions (like 'up' and 'out') can be used anywhere."

The shipboard-only warning is some text that varies. The shipboard-only warning is "The compass directions have no meaning here.[paragraph break]".
The compass-only warning is some text that varies. The compass-only warning is "The shipboard directions have no meaning here.[paragraph break]".

To decide if onboard ship:
	if the shipboard directions option is active, decide yes;
	decide no.

Rule for clarifying the parser's choice of south: do nothing.
Rule for clarifying the parser's choice of starboard: do nothing.

Does the player mean going south:
	if onboard ship, it is unlikely;
	otherwise it is very likely.
Check an actor going (this is the going shipboard directions rule):
	if the noun is a direction:
		if onboard ship:
			if the noun is compass:
				say "[shipboard-only warning]";
				stop the action;
		otherwise:
			if the noun is shipboard:
				say "[compass-only warning]";
				stop the action.
The going shipboard directions rule is listed before the can't go that way rule in the check going rulebook.

Does the player mean examining south:
	if onboard ship, it is unlikely;
	otherwise it is very likely.
Check examining (this is the examining shipboard directions rule):
	if the noun is a direction:
		if onboard ship:
			if the noun is compass:
				say "[shipboard-only warning]";
				stop the action;
		otherwise:
			if the noun is shipboard:
				say "[compass-only warning]";
				stop the action.

Does the player mean pushing something to south:
	if onboard ship, it is unlikely;
	otherwise it is very likely.
Check an actor pushing something to (this is the pushing shipboard directions rule):
	if the second noun is a direction:
		if onboard ship:
			if the noun is compass:
				say "[shipboard-only warning]";
				stop the action;
		otherwise:
			if the noun is shipboard:
				say "[compass-only warning]";
				stop the action.

Does the player mean entering south:
	if onboard ship, it is unlikely;
	otherwise it is very likely.


Shipboard Directions ends here.

---- DOCUMENTATION ----

Like Mikael Segercrantz's original, this extension creates eight directions modeled on those found onboard ships: port, starboard, fore, aft, port bow, port quarter, starboard bow, and starboard quarter (the intermediate directions are unhyphenated in this adaption) and defaults to indexing the map so that the bow of the ship points north, though this can be changed by specifying "Use ship mapping direction of ___". Additionally, it adds the synonyms abaft/astern and forward/ahead for mapping aft and fore, respectively--the second in each group traditionally refers to something in front of or behind the boat.

For the player, Shipboard Directions still provides the same abbreviations for port ("p" for port; "pb", "p b", "port b", and "p bow" for port bow; "pq", "p q", "port q", and "p quarter" for port quarter), but the "sb" shortcut for starboard has been shortened even further to "s". To avoid conflicts with "south", you will need to manually tell Inform to read that as starboard, either by saying "Use shipboard directions" to change it for the entire game or by writing your own "To decide if onboard ship:" phrase (see below for an example). This will also affect which set of directions is allowed; "north" will not be allowed when the player is determined to be on a ship, for example. You can customize the error message printed when the player tries to go in an inapplicable direction by changing the "shipboard-only warning" and "compass-only warning" text variables.

Example: ** All Ashore! - Creating a ship that avoids using the traditional compass directions

	*: "All ashore!"

	Include Shipboard Directions by Samuel Byron.

	The Cabin is a room. "The captain normally works in here, but he's ashore now, along with the rest of the crew--you're the only one on the ship."

	The Aft deck is a room. "This is the rear of the ship. From here, you can see the city bustling with people." Inside from the aft deck is the cabin.

	The Mid-deck is ahead of the aft deck. "The mast rises from the center of the ship, and from here it seems just as large as when you are at the top."

	The Rail is starboard of the mid-deck. "As you lean against the rail, you can see the docks stretching before you. There is no lack of ships, either." 

	The Fore deck is fore from the mid-deck. "The sides of the ship come to a point just in front of you, and, beyond, you can see the ocean stretching to the horizon."

	The Dock is port of the mid-deck. "Your feet hit the dock with muffled thumps. Your ship is to the east, and the city rises to the south." The mid-deck is east of the dock.
	West of the mid-deck is nothing.

	The City is outside of the dock. "There is so much to do here, after your long stint at sea. You suppose that, maybe, the first thing to do is catch up with some old friends."

	To decide if onboard ship:
		if the location is the dock, decide no;
		if the location is the city, decide no;
		decide yes.

	Test me with "out / fore / s / port / w / p / starboard / out".
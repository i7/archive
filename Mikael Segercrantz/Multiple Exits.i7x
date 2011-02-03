Version 4/080915 of Multiple Exits by Mikael Segercrantz begins here.

"Adding multiple randomized exits in a direction."


Part 1 - Generalia

Chapter 1a - Modifications

Section 1a1 - Room

A room has a table-name called exits north. The exits north of a room are usually the Table of No Exits.
A room has a table-name called exits northeast. The exits northeast of a room are usually the Table of No Exits.
A room has a table-name called exits east. The exits east of a room are usually the Table of No Exits.
A room has a table-name called exits southeast. The exits southeast of a room are usually the Table of No Exits.
A room has a table-name called exits south. The exits south of a room are usually the Table of No Exits.
A room has a table-name called exits southwest. The exits southwest of a room are usually the Table of No Exits.
A room has a table-name called exits west. The exits west of a room are usually the Table of No Exits.
A room has a table-name called exits northwest. The exits northwest of a room are usually the Table of No Exits.
A room has a table-name called exits inside. The exits inside of a room are usually the Table of No Exits.
A room has a table-name called exits outside. The exits outside of a room are usually the Table of No Exits.
A room has a table-name called exits up. The exits up of a room are usually the Table of No Exits.
A room has a table-name called exits down. The exits down of a room are usually the Table of No Exits.

Section 1a2 - More room (for use with Shipboard Directions by Mikael Segercrantz)

A room has a table-name called exits fore. The exits fore of a room are usually the Table of No Exits.
A room has a table-name called exits starboard. The exits starboard of a room are usually the Table of No Exits.
A room has a table-name called exits aft. The exits aft of a room are usually the Table of No Exits.
A room has a table-name called exits port. The exits port of a room are usually the Table of No Exits.
A room has a table-name called exits port-bow. The exits port-bow of a room are usually the Table of No Exits.
A room has a table-name called exits port-quarter. The exits port-quarter of a room are usually the Table of No Exits.
A room has a table-name called exits starboard-bow. The exits starboard-bow of a room are usually the Table of No Exits.
A room has a table-name called exits starboard-quarter. The exits starboard-quarter of a room are usually the Table of No Exits.


Chapter 1b - Globals

Section 1b1 - The Table of No Exits

Table of No Exits
loci
a room


Part 2 - Rules

Chapter 2a - Before going

Section 2a1 - Before going north

Before going north:
	let table-of-exits be exits north of the location;
	if the number of filled rows in table-of-exits is 0, continue the action;
	modify the north exit of the location according to table-of-exits.

Section 2a2 - Before going northeast

Before going northeast:
	let table-of-exits be exits northeast of the location;
	if the number of filled rows in table-of-exits is 0, continue the action;
	modify the northeast exit of the location according to table-of-exits.

Section 2a3 - Before going east

Before going east:
	let table-of-exits be exits east of the location;
	if the number of filled rows in table-of-exits is 0, continue the action;
	modify the east exit of the location according to table-of-exits.

Section 2a4 - Before going southeast

Before going southeast:
	let table-of-exits be exits southeast of the location;
	if the number of filled rows in table-of-exits is 0, continue the action;
	modify the southeast exit of the location according to table-of-exits.

Section 2a5 - Before going south

Before going south:
	let table-of-exits be exits south of the location;
	if the number of filled rows in table-of-exits is 0, continue the action;
	modify the south exit of the location according to table-of-exits.

Section 2a6 - Before going southwest

Before going southwest:
	let table-of-exits be exits southwest of the location;
	if the number of filled rows in table-of-exits is 0, continue the action;
	modify the southwest exit of the location according to table-of-exits.

Section 2a7 - Before going west

Before going west:
	let table-of-exits be exits west of the location;
	if the number of filled rows in table-of-exits is 0, continue the action;
	modify the west exit of the location according to table-of-exits.

Section 2a8 - Before going northwest

Before going northwest:
	let table-of-exits be exits northwest of the location;
	if the number of filled rows in table-of-exits is 0, continue the action;
	modify the northwest exit of the location according to table-of-exits.

Section 2a9 - Before going inside

Before going inside:
	let table-of-exits be exits inside of the location;
	if the number of filled rows in table-of-exits is 0, continue the action;
	modify the inside exit of the location according to table-of-exits.

Section 2a10 - Before going outside

Before going outside:
	let table-of-exits be exits outside of the location;
	if the number of filled rows in table-of-exits is 0, continue the action;
	modify the outside exit of the location according to table-of-exits.

Section 2a11 - Before going up

Before going up:
	let table-of-exits be exits up of the location;
	if the number of filled rows in table-of-exits is 0, continue the action;
	modify the up exit of the location according to table-of-exits.

Section 2a12 - Before going down

Before going down:
	let table-of-exits be exits down of the location;
	if the number of filled rows in table-of-exits is 0, continue the action;
	modify the down exit of the location according to table-of-exits.

Section 2a13 - Before going fore (for use with Shipboard Directions by Mikael Segercrantz)

Before going fore:
	let table-of-exits be exits fore of the location;
	if the number of filled rows in table-of-exits is 0, continue the action;
	modify the fore exit of the location according to table-of-exits.

Section 2a14 - Before going starboard (for use with Shipboard Directions by Mikael Segercrantz)

Before going starboard:
	let table-of-exits be exits starboard of the location;
	if the number of filled rows in table-of-exits is 0, continue the action;
	modify the starboard exit of the location according to table-of-exits.

Section 2a15 - Before going aft (for use with Shipboard Directions by Mikael Segercrantz)

Before going aft:
	let table-of-exits be exits aft of the location;
	if the number of filled rows in table-of-exits is 0, continue the action;
	modify the aft exit of the location according to table-of-exits.

Section 2a16 - Before going port (for use with Shipboard Directions by Mikael Segercrantz)

Before going port:
	let table-of-exits be exits port of the location;
	if the number of filled rows in table-of-exits is 0, continue the action;
	modify the port exit of the location according to table-of-exits.

Section 2a17 - Before going port-quarter (for use with Shipboard Directions by Mikael Segercrantz)

Before going port-quarter:
	let table-of-exits be exits port-quarter of the location;
	if the number of filled rows in table-of-exits is 0, continue the action;
	modify the port-quarter exit of the location according to table-of-exits.

Section 2a18 - Before going port-bow (for use with Shipboard Directions by Mikael Segercrantz)

Before going port-bow:
	let table-of-exits be exits port-bow of the location;
	if the number of filled rows in table-of-exits is 0, continue the action;
	modify the port-bow exit of the location according to table-of-exits.

Section 2a19 - Before going starboard-quarter (for use with Shipboard Directions by Mikael Segercrantz)

Before going starboard-quarter:
	let table-of-exits be exits starboard-quarter of the location;
	if the number of filled rows in table-of-exits is 0, continue the action;
	modify the starboard-quarter exit of the location according to table-of-exits.

Section 2a20 - Before going starboard-bow (for use with Shipboard Directions by Mikael Segercrantz)

Before going starboard-bow:
	let table-of-exits be exits starboard-bow of the location;
	if the number of filled rows in table-of-exits is 0, continue the action;
	modify the starboard-bow exit of the location according to table-of-exits.


Chapter 2b - Special rules

Section 2b1 - To modify the way exit of place according to tbl

To modify the (way - a direction) exit of (place - a room) according to (tbl - a table-name):
	let count be the number of filled rows in tbl;
	let current be 0;
	let chosen be a random number between 1 and count;
	repeat through tbl:
		if there is a loci entry:
			increase current by 1;
			if current is chosen, change the way exit of place to the loci entry.


Multiple Exits ends here.

---- DOCUMENTATION ----

Chapter: Introduction

Multiple Exits is an extension to allow one exit to lead to multiple destinations, depending solely on random chance.

As of version 3 of this extension, it no longer depends upon the Shipboard Directions extension, but will work together with it, due to the new interoperability between extensions.

Chapter: Usage

Section: The Table of No Exits

This extension provides one table, the Table of No Exits, that is used as a marker on the room properties, described below, to note that there are no multiple exits from this room into this direction. It is necessary that we leave this table alone, since otherwise every exit of every room, unless defined to use another table, leads to any rooms in the Table of No Exits.

Section: The Properties

This extension provides 20 properties on rooms, each pointing to a table. By default, these properties point to the Table of No Exits. The properties are:

	exits north
	exits northeast
	exits east
	exits southeast
	exits south
	exits southwest
	exits west
	exits northwest
	exits inside
	exits outside
	exits up
	exits down
	exits fore
	exits starboard
	exits aft
	exits port
	exits port-quarter
	exits port-bow
	exits starboard-quarter
	exits starboard-bow

To use these properties, simply create a table according to the structure described below, and then tell the room to use the table as one of these properties.

Section: The Tables of Multiple Exits

The tables of multiple exits need only one column, loci, which contains the name of the location. The extension is not limited to a certain amount of lines in the tables.

Please see the example below on how to declare the tables.


Example: * The Forest of Adventure - A part of the above ground section of the Crowther & Woods classic, with some changes.

	*: "The Forest of Adventure"

	Include Version 2 of Multiple Exits by Mikael Segercrantz.

	Use full-length room descriptions.

Let us declare the rooms first:

	In_Forest_1 is a room with printed name "In Forest". "You are in open forest, with a deep valley to one side. Not far is a large billboard."

	In_Forest_2 is a room with printed name "In Forest". "You are in open forest, near both a valley and a road."

	In_Forest_3 is a room with printed name "In Forest". "You are in dense forest, with a hill to one side. The trees appear to thin out towards the north and east."

	In_Forest_4 is a room with printed name "In Forest". "You are in dense forest, stretching all around you."

Now we create the normal exits between the rooms:

	South of In_Forest_1 is In_Forest_1. West of In_Forest_1 is In_Forest_4.
	South of In_Forest_2 is In_Forest_1.
	South of In_Forest_3 is In_Forest_1.
	East of In_Forest_4 is In_Forest_3.

Let's remove the unnecessary exits:

	West of In_Forest_3 is nowhere. North of In_Forest_1 is nowhere.

And then the tables:

	Table of North Exits from In_Forest_1
	loci
	In_Forest_1
	In_Forest_2

	Table of North Exits from In_Forest_4
	loci
	In_Forest_2
	In_Forest_3

	Table of South Exits from In_Forest_4
	loci
	In_Forest_2
	In_Forest_4

	Table of West Exits from In_Forest_4
	loci
	In_Forest_3
	In_Forest_4

Let's attach them to the properties:

	The exits north of In_Forest_1 is the Table of North Exits from In_Forest_1.
	The exits north of In_Forest_4 is the Table of North Exits from In_Forest_4.
	The exits south of In_Forest_4 is the Table of South Exits from In_Forest_4.
	The exits west of In_Forest_4 is the Table of West Exits from In_Forest_4.

Since there's so much that is random, we do not provide a test command.

Version 3/080915 of Shipboard Directions by Mikael Segercrantz begins here.


Chapter 1 - Declaring the directions

Section 1a - Creating the directions

The aft is a direction. The opposite of aft is fore. Understand "a" as aft.
The fore is a direction. The opposite of fore is aft. Understand "f" as fore.
The port is a direction. The opposite of port is starboard. Understand "p" as port.
The starboard is a direction. The opposite of starboard is port. Understand "sb" as starboard.

The port-bow is a direction. The opposite of port-bow is starboard-quarter. Understand "pb" and "p bow" and "p b" and "port b" and "port bow" as port-bow.
The port-quarter is a direction. The opposite of port-quarter is starboard-bow. Understand "pq" and "p quarter" and "p q" and "port q" and "port quarter" as port-quarter.
The starboard-bow is a direction. The opposite of starboard-bow is port-quarter. Understand "sbb" and "sb bow" and "sb b" and "starboard b" and "starboard bow" as starboard-bow.
The starboard-quarter is a direction. The opposite of starboard-quarter is port-bow. Understand "sbq" and "sb quarter" and "sb q" and "starboard q" and "starboard quarter" as starboard-quarter.


Shipboard Directions ends here.

---- DOCUMENTATION ----

In this extension, we define four new directions; aft, fore, port and starboard; as well as the directions between (port-quarter, port-bow, starboard-quarter and starboard-bow). The new directions are created in the new manner of creating directions as from Inform 7 version 5U95.

Example: *** Land Ohoy! - Creating a ship from which the player can disembark when next to land

	*: "Land Ohoy!"

	Include Version 2 of Shipboard Directions by Mikael Segercrantz.

	Beside land is a truth state that varies. Beside land is false.

	The Time of Day is 2:45 PM.

	At 2:50 PM:
		say "The lookout shouts 'Land Ohoy!' from somewhere up the main mast."

	At 2:55 PM:
		say "The ship gently lurches against the beach, the anchor being lowered into the water.";
		change beside land to true.

	At 3:00 PM:
		if the location is not the inviting beach
		begin;
			say "You are gently but definitely ushered off the ship, just as it sets sail back for England.";
			change beside land to false;
			move the player to the inviting beach;
		end if;
		change beside land to false.

	The Mid-deck is a room. "You're about half-way across the deck, measured from the fore to the aft. You could visit the fore deck or the aft deck[if beside land is true], or you could disembark to the port[end if]."

	The Fore Deck is a room. "Standing at the fore of the ship, you can see [if beside land is true]the inviting beach along with [end if]the river mouth." It is fore of the mid-deck.

	The Aft Deck is a room. "Standing at the aft of the ship, you can see [if beside land is true]along with the inviting beach the [end if]vast ocean behind you." It is aft of the mid-deck.

	Instead of going up: say "You wouldn't know how to climb the ropes to the masts, being a land-lubber as you are."

	The Inviting Beach is a room. "An inviting beach, with [if beside land is true]a ship nearby, just to the north[otherwise]people looking in awe at the new world[end if]." It is port of the mid-deck. Starboard of the inviting beach is nowhere. North of the inviting beach is the mid-deck. South of the mid-deck is nowhere.

	Instead of going port from the mid-deck when beside land is false, say "You wouldn't want to swim all the way back to shore, being the land-lubber you are."

	Instead of going north from the inviting beach when beside land is false, say "What, and swim back to the ship? No thank you."

	When play begins, change right hand status line to "[time of day]".

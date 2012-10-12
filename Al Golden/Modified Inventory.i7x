Modified Inventory by Al Golden begins here.

"This extension displays your inventory and  the inventory of any NPCs who are visible
in two separated listings of carried and worn."

to say /l: say line break.

instead of taking inventory:
follow the self-inventory rule.

after examining yourself:
follow the self-inventory rule.

this is the self-inventory rule:
	if yourself carries something and yourself wears something:
		say "You are carrying: [/l]";
		repeat with item running through things carried by yourself:
			say "a [item] [/l]";
		say "[/l]You are wearing: [/l]";
		repeat with item running through things worn by yourself:
			say "a [item] [/l]";
	otherwise if yourself carries something and yourself wears nothing:
		say "You are carrying: [/l]";
		repeat with item running through things carried by yourself:
			say "a [item] [/l]";
	otherwise if yourself wears something and yourself carries nothing:
		say "You are wearing: [/l]";
		repeat with item running through things worn by yourself:
			say "a [item] [/l]";
	otherwise if yourself carries nothing and yourself wears nothing:
		say "You are neither carrying or wearing anything.".

after examining someone who is not yourself:
follow the NPC-Inventory rule


This is the NPC-Inventory rule:
	if the noun carries something and the noun wears something:
		say "[The noun] is carrying: [/l]";
		repeat with item running through things carried by the noun:
			say "a [item] [/l]";
		say "[/l][The noun] is wearing: [/l]";
		repeat with item running through things worn by the noun:
			say "a [item] [/l]";
	otherwise if the noun carries something and the noun wears nothing:
		say "[The noun] is carrying: [/l]";
		repeat with item running through things carried by the noun:
			say "a [item] [/l]";
	otherwise if the noun wears something and noun carries nothing:
		say "[The noun]is wearing: [/l]";
		repeat with item running through things worn by the noun:
			say "a [item] [/l]";
	otherwise if the noun wears nothing and the noun carries nothing:
		do nothing.

Modified Inventory ends here.


---- DOCUMENTATION ----

Modified Inventory is new way of listing inventorys both for the player and NPCS.

It will show your possessions being carried and worn in 2 separate listings.

It also  does the same for any NPCs who are currently visible.


Example: * "Inventory Test" - a short game showing the extension features.

	*: "Inventory Test"

	Include Modified Inventory by Al Golden.

	Starter is a room.

	yourself is wearing a suit and carrying a gold nugget.


	Bob is a  man in Starter.

	Bob is wearing  Bob's uniform and carrying Bob's rifle.

	Bill is a man in Starter.

	Bill  is wearing  Bill's uniform and carrying Bills's rifle.

	test me with "x me/x bob/x bill"







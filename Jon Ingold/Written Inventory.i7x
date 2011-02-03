Version 3 of Written Inventory by Jon Ingold begins here.

"Provides a framework for listing inventories in natural sentences. Separates carried and worn objects, followed by objects that contains other objects. What's listed in the third section is customisable via a rulebook."  

Encasement relates a thing (called X) to a thing (called Y) when X is part of Y or X is held by Y. The verb to be encased by implies the encasement relation.

Definition: a container is empty if the number of things in it is zero. 
Definition: a supporter is empty if the number of things on it is zero. 
Definition: a thing is empty if the number of things encased by it is zero.

Definition: a thing is non-empty if it is not empty. 

Inventory listing the contents of something is an activity. 

The print empty inventory rule   is not listed in the carry out taking inventory rules.
The print standard inventory rule  is not listed in the carry out taking inventory rules.

The first carry out taking inventory rule (this is the intro list rule):
	say "You're [run paragraph on]";

Carry out taking inventory when the number of things had by the player is zero (this is the new empty inventory rule): 
	 say "carrying nothing." instead;

Carry out taking inventory when the number of things carried by the player is greater than zero (this is the basic carrying inventory rule): 
	say "carrying [a list of things carried by the player][if the player wears something], and you're [end if][run paragraph on]";

Carry out taking inventory when the number of things worn by the player is greater than zero (this is the basic wearing inventory rule): 
	if the number of things worn by the player is greater than zero, say  "wearing [a list of things worn by the player][run paragraph on]";

Carry out taking inventory (this is the set up second-level inventory list rule):
	now everything is unmentioned; 
	now the player is mentioned; 

Carry out taking inventory (this is the deliver second-level inventory list rule):
	let item be a random unmentioned non-empty thing encased by something mentioned;
	while item is a thing begin;
		carry out the inventory listing the contents activity with the item;
		now the item is mentioned;
		let item be a random unmentioned non-empty thing encased by something mentioned;
	end while;
	say "."  

Rule for inventory listing the contents of an open container (called the item):
	say ". In [the item] [is-are a list of things in the item][run paragraph on]" instead;

Rule for inventory listing the contents of a supporter (called the item):
	say ". On [the item] [is-are a list of things on the item][run paragraph on]" instead;

Rule for inventory listing the contents of a thing (called the item):
	do nothing instead;

Written Inventory  ends here.

---- DOCUMENTATION ----

Provides a wide, prose-style, customisable inventory listing, of the following form:

	You are carrying a briefcase and a lemon, and wearing the old top hat. In the briefcase is a folder of papers. The folder of papers contains a map of Slovakia.

This works by printing objects directly carried and worn first (if there are any). It then runs an activity on any objects one level lower, called the "inventory listing the contents of" activity. By default this will provide the "In the briefcase..." style sentence above, but it can be customised:

	Rule for inventory listing the contents of the folder of papers: say ". The folder of papers contains [list of things in the folder of papers]";

Note the period at the start of the rule's output, and the lack of one at the end.

Should we want to suppress something's contents from an inventory listing, use a "do nothing rule":
	
	Rule for inventory listing the contents of the lemon: do nothing instead.

Note, that this will produce a list of the contents of the contents of the lemon (so it may append "In the pips of the lemon is the genetic material necessary for a new lemon tree"). To eradicate this, give the lemon's contents the "mentioned" property:

	Rule for inventory listing the contents of the lemon: 
		now everything enclosed by the lemon is mentioned; do nothing instead.

A final note: the extension automatically describes containers and supporters, and considers anything which contains a component part, but by default this third type of object prints nothing (since most of the time printing the parts of an object is unhelpful). This does provide an entry-point should you want an object to comment on its parts:

	Rule for inventory listing the contents of the ring-tailed lemur:
		say ". The lemur's extraordinary tail is coiled around your neck";

...and should any of those parts be containers or supporters themselves, they will be considered even if the part itself it ignored. (Therefore a player wearing a coat with a deep pocket should be told he is wearing the jacket, and the contents of the pocket will be listed, without being told separately that the pocket is part of the coat).

Note the extension provides one relation and two adjectives: "empty" and "non-empty" describe containers and supporters appropriately, and other things will be declared non-empty if and only if they have no component parts. (But a supporter with component parts may be empty if there is nothing on it). The relation is called "encasement" and describes direct enclosure. (That is, containment, carrying, wearing, or incorporation). 

Example: ** The Magician - An example of the layout, including varying the way contents are listed.

	*: Include Written Inventory by Jon Ingold.

	The Stage is a room. "The crowd watch with baited breath and the drum roll grows louder..."

	The player is wearing a top hat. The player is carrying a cane. The cane is a container. Inside the cane is the narrow sword. The hat is a container. Inside the hat is a white dove. The wide brim is part of the top hat. 

	Rule for inventory listing the contents of the cane: 
		say ". The cane carries its usual deadly apparatus" instead.

	Rule for inventory listing the contents of the top hat when the hat is worn:
		say ". Under the hat [is-are a list of things inside the hat]";
	[but the wide brim is never mentioned.]

	Report taking the dove: say "You put your hand into the hat and withdraw something..." instead.

	Every turn when the player is carrying the white dove:
		remove dove from play;
		say "The dove flutters out of your hands, much to the audience's delight!";
		end the game in victory.

	test me with "i/doff hat/i/take sword/i/take dove".


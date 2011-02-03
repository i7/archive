Version 1 of Permadeath (for Glulx only) by Victor Gijsbers begins here.

"Implements Rogue-like permanent death."

Include Default Messages by Ron Newcomb.

Section - Setting up the table

[We use an external file to which we write the following table. Here, the first three numbers together make up the ID of the current play-through. Save-ID identifies the current save file. Saving-state is used internally to check whether we are saving or restoring.]

Table of Adventurers
ID-1 (a number)	ID-2 (a number)	ID-3 (a number)	Save-ID (a number)	Saving-state (a number)
0					0					0				0					0
with 1000 blank rows


Section - Declaring variables

First ID, Second ID and Third ID are numbers that vary.

Have-ID is a truth state that varies. Have-ID is false.

Unique-save-ID is a number that varies.


Section - Saving

[We need to set these number to something once the game is first saved. (We could also do this when play begins, but that might fill the Table of too quickly.) By the way, File of Adventurers is defined by the game itself.]

First check saving the game (this is the set up save IDs rule):
	if Have-ID is false:
		now First ID is a random number between 1 and 20000;
		now Second ID is a random number between 1 and 20000;
		now Third ID is a random number between 1 and 20000;
		now Unique-save-ID is a random number between 1 and 20000;
		now Have-ID is true;	
		if File of Adventurers exists:
			read File Of Adventurers into Table of Adventurers;
		choose a blank row in Table of Adventurers;
		now ID-1 entry is First ID;
		now ID-2 entry is Second ID;
		now ID-3 entry is Third ID;
		now Save-ID entry is Unique-save-ID;
		write File Of Adventurers from the Table of Adventurers.

[If the file doesn't exits, something has gone wrong and we stop saving.]
		
Check saving the game (this is the something gone wrong with saving rule):
	consider the safe saving allowed rules;
	if rule failed:	
		unless File of Adventurers exists:
			say "Unfortunately, something seems to have gone wrong with the saving mechanism." instead.
		
[Finally, we set a new unique number for Save-ID and write away the new table. On restoring, we will check whether the Save-ID from the table is equal to the Unique-Save-ID from the game's internal memory.]
		
Last check saving the game (this is the permadeath saving rule):
	consider the safe saving allowed rules;
	if rule failed:	
		now Unique-save-ID is a random number between 1 and 20000;
		read File Of Adventurers into Table of Adventurers;
		repeat through the Table of Adventurers:
			if the ID-1 entry is First ID and the ID-2 entry is Second ID and the ID-3 entry is Third ID:
				now Saving-state entry is 1;
				now Save-ID entry is Unique-save-ID;
				write File Of Adventurers from the Table of Adventurers.

[That was _before_ saving; now we handle what happens after saving. Save-failed is defined below; it is true if saving failed, so this rule will only run if saving succeeded. It will also only run if safe saving was not allowed.]


Report saving the game (this is the permadeath report saving rule):
	if save-failed is false:
		consider the safe saving allowed rules;
		if rule failed:		
			if File of Adventurers exists:
				read File Of Adventurers into Table of Adventurers;
				repeat through the Table of Adventurers:
					if the ID-1 entry is First ID and the ID-2 entry is Second ID and the ID-3 entry is Third ID:
						if the Saving-state entry is 1: [this means we are saving]
							now the Saving-state entry is 0;
							write File Of Adventurers from the Table of Adventurers;
							try fast quitting; [Putting 'immediately end the game' here will stop the previous lines from being carried out.]
						otherwise: [this means we are restoring]
							if the Save-ID entry is 0:
								consider the killed-before rules;
							otherwise if Unique-save-ID is not Save-ID entry:
								consider the wrong Save-ID rules;
			otherwise:
				consider the missing-adventurer rules.
		

[All this stuff is relegated to rules and rulebooks so you can easily customise it.]

The killed-before rules are a rulebook.

A killed-before rule (this is the standard killed before rule):
	end the game saying "This character is already dead.".

The missing-adventurer rules are a rulebook.

A missing-adventurer rule (this is the standard missing adventurer rule):
	end the game saying "A vital file appears to be missing!".

The wrong Save-ID rules are a rulebook.

A wrong Save-ID rule (this is the standard wrong Save-ID rule):
	end the game saying "This save game is too far in the past.";


[Did saving fail or succeed?]

	


Table of custom library messages (continued)
library-action		library-message-id		library-message-text
saving the game action		1					"Saving failed.[save failed]"
saving the game action		2					"[save success message][save succeeded]"

Save-failed is a truth state that varies. Save-failed is false.

To say save failed:
	now save-failed is true.

To say save succeeded:
	now save-failed is false.

To say save success message:
	consider the safe saving allowed rules;
	if rule failed:
		say "Saved. Thanks for playing!";
	otherwise:
		say "Saved.[run paragraph on]".

	
	
Section - Safe saving

[There might be circumstances during which you want to player to be able to save normally. If so, all you need to is make sure that the safe saving allowed rule evaluate to true.]

The safe saving allowed rules are a rulebook.

Last safe saving allowed rule (this is the safe saving not normally allowed rule):
	rule fails.


Section - Quitting, restarting, restoring

[Quitting, restarting and restoring are all suicidal, unless you can safely save.]

Check quitting the game (this is the permadeath check quitting rule):
	consider the safe saving allowed rules;
	if rule failed:
		consider the suicide rules;
		if rule succeeded:
			try fast quitting;
		if rule failed:
			stop the action.

Check restarting the game (this is the permadeath check restarting rule):
	consider the safe saving allowed rules;
	if rule failed:
		consider the suicide rules;
		if rule failed:
			stop the action.
	
Check restoring the game (this is the permadeath check restoring rule):
	consider the safe saving allowed rules;
	if rule failed:
		consider the suicide rules;
		if rule failed:
			stop the action.

The suicide rules are a rulebook.

A suicide rule (this is the standard suicide rule):
	say "Do you wish to commit suicide? (You will [bold type]not[roman type] be able to continue with this character, even if you have saved the game earlier.) ";
	if player consents:
		permanently kill the player;
		rule succeeds;
	otherwise:
		rule fails.

Fast quitting is an action out of world.

Carry out fast quitting (this is the standard carry out fast quitting rule):
	immediately end the game.
		
To immediately end the game: (- quit; -).


Section - Killing the player

[When the PC dies, you always ought to "permanently kill the player".]

To permanently kill the player:
	if File of Adventurers exists:
		read File Of Adventurers into Table of Adventurers;
		repeat through the Table of Adventurers:
			if the ID-1 entry is First ID and the ID-2 entry is Second ID and the ID-3 entry is Third ID:
				now Save-ID entry is 0;
		write File Of Adventurers from the Table of Adventurers.
	


Section - Final Undo
	
[We probably don't want people to be asked whether they want to undo.]	

When play begins (this is the remove undo from table of final questions rule):
	choose row with a final response rule of immediately undo rule in the Table of Final Question Options;
	delete the final question wording entry.




Permadeath ends here.


---- DOCUMENTATION ----

Section: Introduction

The Permadeath extension implements permanent death as it occurs in Rogue-like games such a Rogue, NetHack and Dungeon Crawl. This means that (1) the player can save the game whenever he or she wants, but saving immediately results in quitting; (2) every saved game can only be restored once; and (3) when the player dies, his previous save game becomes unusable. In other words, you can only save to "pause" the game, but never use it to undo something that has happened. This makes for very tense games, as death is final.

Think very carefully before using this extension. Unless having permanent death makes your game more fun, players will very much resent its inclusion. There are less pervasive ways to limit saving and undoing!

Section: Using Permadeath

In order to use Permadeath, you need to include the extension and then define a "File of Adventurers". This file must have a name that is unique to your game. It will be used to store information about save games, and you do not want other people's games to interfere with yours! Please note that deleting this file will make all the user's saves useless, so you might want to warn him or her against this.

	Include Permadeath by Victor Gijsbers.
	The File of Adventurers is called "EdenSaves".

Additionally, you ought to ensure that whenever the player character dies, you "permanently kill the player". This will make the previous save unusable.

	After eating the apple:
		say "It was poisonous. You have died...";
		permanently kill the player;
		end the story saying "Be more careful next time!".

Permadeath also allows you to define conditions under which normal saving is possible. For instance, if you have a city and a monster-infested dungeon beneath it, you might want to allow the player to make normal saves in the city. These could then be restored at any time, even if the player later dies in the dungeon. Whether the player can save safely, or whether permadeath mode is turned on, is decided by the "safe saving allowed rules", which default to "rule fails". If you want to allow safe saving in the Church, say, simply state:

	A safe saving allowed rule (this is the you can save in the church rule):
		if the player is enclosed by the Church:
			rule succeeds.

Finally, in order to use this extension you need to have installed the Default Messages extension by Ron Newcomb; and you need to compile your game to Glulx, since z-code doesn't allow the use of external files.

Section: The Limits of Permadeath

Permadeath cannot completely ensure that players will not be able to resurrect their dead characters. Anyone who backs up the File of Adventurers will be able to later restore it and thus re-enable the save games. (This behaviour is known as "save scumming" and frowned upon by all.) Even those who have not backed up their File of Adventurers can change it back to its previous state using a text editor -- however, in order to find out the randomly generated number they would need to do this, they either need to hack into the save game or randomly guess a number between 1 and 20.000.

Permadeath, then, doesn't make it impossible to cheat, but it does make it very hard to cheat after you have died. Since the temptation to resurrect your fallen character is far stronger after than before his or her demise, this will protect most people from indulging in un-rogue-like behaviour.

Section: Additional Tips

When you are using Permadeath, you probably also want to disable Undo:

	Use Undo Prevention.

Since restoring a game counts as killing off your current character (unless you can save safely), and shows a prompt asking whether you really want to do this, it might be a good idea to start the game with a menu from which one can restore without going through this hassle. A simple way to get such a menu is by including "Title Page" by Jon Ingold":

	Include Title Page by Jon Ingold.

Example: * Garden of Eden - Permanent death in safe and unsafe areas.

	*: "Garden of Eden" by Victor Gijsbers

	Include Permadeath by Victor Gijsbers.
	The File of Adventurers is called "EdenSaves".

	Include Title Page by Jon Ingold.

	Use Undo Prevention.

	The Garden of Eden is a room. "Stairs up lead to Heaven."
 
	The apple is here. The apple is edible.

	After eating the apple:
		say "It was poisonous. You have died...";
		permanently kill the player;
		end the story saying "Be more careful next time!".

	Heaven is up from Garden of Eden. "You have the feeling you could safely save here."

	A safe saving allowed rule (this is the you can save in heaven rule):
		if the player is enclosed by Heaven:
			rule succeeds.

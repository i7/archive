Version 1/080105 of Simple Debugger by Michael Hilborn begins here.

"Easy debugging mechanisms for authors and play testers."

Section 1 - Global values

[First, we want every object to be debugged, so we give the basic THING kind an either/or value called 'being debugged'.]
A thing can be being debugged. A thing is usually not being debugged.

[A player can decide whether or not to view general debugging information. We accomplish this extraordinary task by setting the 'general debugging flag'.]
The general debugging flag is a truth state that varies. The general debugging flag is false.

Section 2 - Phrases

[The phrase "initialize debugger" permits the author to enable debugging from with the source.]
To initialize debugger, activating general debugging and/or activating object-debugging:
	if activating general debugging, set general debugging "on";
	if activating object-debugging, set debugging for all objects "on".

[A simple phrase to use while writing our game (rather than typing "if the general debugging flag is true/false" all the time.]
To decide whether we're debugging:
	if the general debugging flag is true, decide yes;
	decide no.

[Here we define a phrase for activating the debugging properties of every single THING in the game.]
To set debugging for all objects (parameter - text):
	if the parameter is "on" begin;
		now everything is being debugged;
		say "Every 'thing' is now being debugged. Type 'debug things off' to turn this feature off.";
	otherwise;
		now everything is not being debugged;
		say "Every 'thing' is no longer being debugged.";
	end if.

[And here we define a phrase to activate and deactivate general debugging.]	
To set general debugging (parameter - text):
	if the parameter is "on" begin;
		now the general debugging flag is true;
		say "General debugging on. Type 'debug off' to turn it off.";
	otherwise;
		now the general debugging flag is false;
		say "General debugging off.";
	end if.

[Finally, we create a phrase to activate and deactivate everything.]
To set ultra debugging (parameter - text):
	if the parameter is "on" begin;
		set debugging for all objects "on";
		set general debugging "on";
	otherwise;
		set debugging for all objects "off";
		set general debugging "off";
	end if.

Section 3 - Verbs - Not for release

[Now we'll define our actions. There are two commands a player may type: "debug", which turns all object-debugging on, and "debug [something], which activates the debugging properties of only that particular object. First, we define the "debug" command.]
General debugging is an action applying to nothing.

Understand "debug" as general debugging.

Carry out general debugging:
	set general debugging "on".

[And now we'll define the "debug [something]" command.]
object-debugging is an action applying to one thing.

Understand "debug [any thing]" as object-debugging.

[Remember, we want to be able to debug objects that the player can't touch, see, etc. So before we debug an object, we need to ignore Inform's standard accessibility rules.]
Before object-debugging:
	ignore the basic accessibility rule.

Carry out object-debugging:
	if the noun is being debugged begin;
		now the noun is not being debugged;
		say "No longer debugging [the noun].";
	otherwise;
		now the noun is being debugged;
		say "Debugging [the noun]. Type 'debug [the noun]' to turn it off.";
	end if.

[We also want the debug command to operate like the internal Inform 7 utilities; that is, "debug" and "debug on" both activate general debugging, and "debug off" turns it off.]
Debugging with option is an action applying to one topic.

Understand "debug [text]" as debugging with option.

[On a personal note, I hate this if..., if..., if... syntax, but this seems to be a limitation of using natural language--or, perhaps, a limitation of a professional programmer attempting to write with a natural language.]
Carry out debugging with option:
	if the player's command matches "debug on" begin;
		set general debugging "on";
		rule succeeds;
	end if;
	if the player's command matches "debug off" begin;
		set general debugging "off";
		rule succeeds;
	end if;
	if the player's command matches "debug things" or the player's command matches "debug things on" begin;
		set debugging for all objects "on";
		rule succeeds;
	end if;
	if the player's command matches "debug things off" begin;
		set debugging for all objects "off";
		rule succeeds;
	end if;
	if the player's command matches "debug everything" or the player's command matches "debug everything on" begin;
		set ultra debugging "on";
		rule succeeds;
	end if;
	if the player's command matches "debug everything off" begin;
		set ultra debugging "off";
		rule succeeds;
	end if;
	say "You entered an invalid debug option. Valid commands are 'debug', 'debug [bracket]on|off[close bracket]', 'debug things [bracket]on|off[close bracket]', 'debug [bracket]thing[close bracket]', and 'debug everything [bracket]on|off[close bracket]'".



Simple Debugger ends here.

---- DOCUMENTATION ----

Chapter: Introduction

Inform 7 provides a variety of helpful debugging utilities, such as the RULES, ACTIONS, and SHOWME commands. Unfortunately, there comes a time when we, the authors, will need more guidance in cleaning up our own mess. Simple Debugger allows us to create customized debugging messages that appear while we are play-testing our game.

Chapter: Adding debugging information to your game

Suppose your game has a timer that quietly counts down in the background while the player goes about his business. When debugging the game, it's often handy to display this counter to (a) make certain it is actually counting down, and (b) ensure that the proper event fires off when the counter ends. 

Here's an example of how you might handle the first part with Simple Debugger, assuming that the timer is stored in a numerical value called "counter":

	Every turn:
		change counter to counter - 1;
		if we're debugging, say "// The countdown is now [counter]."

The phrase "we're debugging" is true when the debugger has been activated by the player (in a moment, we'll demonstrate how a player can do this), and false when the debugger has been turned off. In essence, any code following an "if we're debugging" condition only gets executed if the debugger has been activated.

This leads to the question about how a player can activate the debugger. It's easy enough. As long as the extension is installed and as long as a player is using a *debug build* of the game, a player simply types "debug" or "debug on" at the game's command line. Once the debugger has been activated, the player can turn it off with "debug off". If a player does not have access to the debug build (that is, the player is using the final release of the game), the debug commands are no longer available.

Chapter: Debugger modes - General and object mode

What has just been described is one of three modes available in Simple Debugger. This particular mode is labeled "General Mode" because it's most useful for displaying general information. Unfortunately, this mode can get quite messy during play-testing should you liberally decorate your source code with debugging information. Usually, it's better to concentrate on one aspect--or more to the point, on one *object*--of the game. Fortunately, Inform 7 is a language about objects, and Simple Debugger permits you to debug individual objects. This is referred to as "Object Mode". 

Suppose you want to track the movements of a thief as he flits from room to room, waiting to ambush the player. Normally, the game wouldn't display any information regarding the thief until the designated ambush, but while debugging your game, it's helpful to know where the thief is at all times... especially when he doesn't ambush the player when he's supposed to.

Here's how you might go about tracking the thief after he has successfully moved:

	Report the thief trying going a direction:
		if the thief is being debugged, say "// The thief is now in [the location of the thief]."

Note the description, "is being debugged". When Simple Debugger is included in your source, this description applies to *any* Inform object:

	if the fiery geyser is being debugged, ...
	if the rodent of unusual size is being debugged, ...

A player can toggle an object's debug mode by typing "debug [thing]". To debug the elusive thief, the player would type "debug thief". To turn off the thief's debugging mode, you would type "debug thief" again.

A player can activate the debugging mode of *all* objects in your game by typing "debug things" or "debug things on". Again, this activates the debug mode of every, single object within your game, so players should use this command with caution. Players can always turn object-debugging off with "debug things off".

One additional command, "debug everything" or "debug everything on", does exactly what its name implies: It turns on "General Mode", as well as the "Object Mode" of every object in game. This functionality is known as "Ultra Mode", for lack of a better term. To turn Ultra Mode off, type "debug everything off".

Again, these commands are only available within debug builds. Full releases of your game will deactivate these commands.

Chapter: Activating the debugger from within the source

Normally, you will want to reserve the activation of the debugger for the player. There are times, however, when you might want to activate the debugger as soon as it is initialized. You can do so with the "initialize debugger" phrase options, "activating general debugging" and "activating object-debugging". For example:

	When play begins:
		initialize debugger, activating object-debugging, activating general debugging.

You can also explicitly activate and deactivate the various debugging modes with the following phrases (you still need to *initialize* the debugger before using these phrases):

	set general debugging "on";
	set general debugging "off";
	now [a thing] is being debugged;
	now [a thing] is not being debugged;
	set debugging for all objects "on";
	set debugging for all objects "off";
	set ultra debugging "on";
	set ultra debugging "off";

Typically, you will want to include the "initialize debugger" and other phrases in a "Not for release" header of your source. This will prevent players from having access to all of your dirty little secrets while they're enjoying your otherwise flawless game.

Chapter: The boolean value (truth state)

Originally, Simple Debugger provided you with a new kind of value, the boolean, which is commonly used by programmers for binary states. These are no longer available because they have been replaced by Inform's own value called the 'truth state'. For example, the following no longer works:

	The surrender flag is a boolean that varies.
	[later in our code...]
	if the surrender flag is false, say "Never give up, never surrender!";
	if the surrender flag is true, say "We surrender!";

Instead, replace it with:

	The surrender flag is a truth state that varies.
	[later in our code...]
	if the surrender flag is false, say "Never give up, never surrender!";
	if the surrender flag is true, say "We surrender!";

Chapter: Contact me

And that's all there is to this extension... except for some examples and any future additions. If you have any questions or bugs to report, please feel free to email the author:

	Michael D. Hilborn
	mhilborn@biggles2k.com

Example: ** Firefly - Using the simple debugger to track Inform 7 counters and events.

	*: "Firefly"

	Include Simple Debugger by Michael Hilborn.

	[When writing interactive fiction, we almost invariably want some kind of timing mechanism or counter to go off. Inform provides this ability, but there is no way to view how many turns or minutes are left in a counter. Here we demonstrate how the debugging tool can do this for us. It takes some effort.

	Here's the scenario: The player is trapped in a cell where the lights go off every five turns. Fortunately, the firefly in the player's possession lights up the room until the power comes back on in another five turns.] 

	[At the beginning of play, we activate the debugger and schedule the first power outage.]
	When play begins:
	[initialize debugger, activating object debugging, activating general debugging;]
		schedule the power outage.

	[The counter is a global variable tracks and resets the number of turns left before the power goes on or off.]
	Counter is a number that varies.

	[When scheduling a power outage, we first reset the counter to 5. If we're debugging, then we print a message stating that the power is going to go out.]
	To schedule the power outage:
		change counter to 5;
		if we're debugging begin;
			say "// Power goes out in 5 turns.";
		end if;
		the power goes out in four turns from now.

	[When the power goes out, we reset the counter and, if we are debugging, print an alert. The rest of the code darkens the room, ignites the firefly, and sets the power to come on in five more turns.]
	At the time when the power goes out:
		change counter to 5;
		if we're debugging begin;
			say "// Restarting the power in five turns.";
		end if;
		say "The lights flicker, then go out... again. The firefly, however, fills the room with a green glow.";
		now the firefly is lit;
		now the Cell is dark;
		the power goes on in four turns from now.
	
	[When the power	goes out, we print the appropriate message, turn the lights on, turn off the firefly, then schedule another power outage.]
	At the time when the power goes on:
		say "The lights of the cell flare back on.";
		now the firefly is unlit;
		now the Cell is lighted;	
		schedule the power outage.

	[During each turn, we need to decrement the global counter, then, if we're debugging, print out that counter to show the player how many turns are left until the counter times out.]
	Every turn:
		change the counter to counter - 1;
		if we're debugging, say "// Countdown: [counter]."

	[And the rest is mostly window dressing.]		
	Every turn when the firefly is lit:
		say "The firefly casts a pale green glow."

	Cell is a room. "This is where the crew tossed you after they discovered you hiding in the cargo bay. The big guy wanted to shoot you, but the doctor and the engineer would have nothing to do with it. That engineer--she's a cute one, and obviously doing something with the ship's engine. The lights flicker out every five minutes or so."

	The player is holding the specimen jar. The specimen jar is closed.

	The firefly is an animal in the specimen jar. The specimen jar is transparent. The firefly can be lit. The firefly is unlit.

	Instead of examining the firefly:
		say "A small insect that ignites its posterior when the lights go out. Very rare on some planets. And very priceless.";
			
	Test me with "debug / i / x jar / x firefly / wait / g / g / g / g / g".


Example: *** Mark II - A recreation of a legendary event in computer history.

	*:"Mark II"

	Include Simple Debugger by Michael Hilborn.

	[A common myth of computer lore is that the term "computer bug" was first coined by Admiral Grace Hopper on September 9, 1945 after discovering that a glitch in the Harvard Mark II machine was caused by an errant moth. Although the glitch was indeed the fault of the insect, there are several inaccuracies in this modern legend. First, the year was 1947, not 1945. Second, Hopper did not discover the bug; it was discovered by one of her colleagues, William "Bill" Burke--Hopper just enjoyed retelling the tale. Finally, the term "bug", as applied to electronic defects, had been around since the late nineteenth century.

	It is true that the insect in question was taped to a logbook and annotated, "first actual case of bug being found."

	In this example, we re-imagine what might have happened that fateful day...

	]

	[Here we seed the random number generator, then initialize and activate the debugger. The objects that we will be debugging in this example are the moth and the tape dispenser.]
	When play begins:
		seed the random-number generator with 1234;
		initialize debugger, activating object-debugging.

	[First, we create the lab and some scenery.]
	The east lab is a room with the printed name "Harvard Mark II (East)". "The Harvard Mark II computer dominates the north side of the lab. Its metal array of switches and dials extends off to the west[if the dead moth is on the relay panels], from which emanates the unpleasant smell of something burning[end if][if the Harvard Mark II is not working]. The computer lies dormant[end if]."

	The west lab is a room with the printed name "Harvard Mark II (West)". The west lab is west of the east lab. "The Harvard Mark II computer dominates the north side of the lab. Its metal array of switches and dials extends off to the east. Among the maze of metal and wire are some relay panels[if the dead moth is on the relay panels], among which a wisp of smoke emanates[end if][if the Harvard Mark II is not working]. The computer lies dormant[end if]."

	The desk is a supporter in the the east lab.

	Rule for writing a paragraph about the desk: say "A metal desk sits against the southern wall[if something is on the desk]. On the desk [is-are a list of things on the desk][end if]."

	Instead of examining the desk when something is on the desk:
		say "Since there are no drawers, it's actually more of a solid, metal table. On the desk [is-are a  list of things on the desk]."

	The logbook is on the desk. The description of the logbook is "A plethora of notes. The last two entries are:[paragraph break]    1100 - Started Cosine Tape (Sine check)[paragraph break]    1525 - Started Multi+Adder Test."

	[Now we create the Harvard Mark II and its relay panels. It has two states: working or, if the moth has flown or crawled into the relay panels, not working.]
	The Harvard Mark II is a backdrop. It can be working. It is working. It is in the east lab and the west lab. Understand "switches", "computer", "dials", and "array" as the Harvard Mark II.

	The description of the Harvard Mark II is "A marvel of modern computing! Its width spans all 55 feet of the lab's northern wall, and it towers over the tallest of men. With its 3000 decimal storage reels, 1400 rotary dial switches, and 500 miles of wire... this computer only takes a few seconds to perform a single multiplication operation![status]".

	To say status:
		if the Harvard Mark II is not working begin;
			say "[line break]Unfortunately, the 5 tons of computational machinery appears to have shut down[if the player is in the west lab and the dead moth is on the relay panels], possibly as a result of whatever is causing the wisp of smoke to emanate from the relay panels[end if].";
		end if.
	

	The relay panels are scenery. They are a supporter. The relay panels are in the west lab. "It's these electromagnetic relays that make the Harvard Mark II a 'relay computer' and so much faster than its mechanical predecessor, the Mark I[if the dead moth is on the relay panels]. The unfortunate remains of an errant moth smolder on one the relays (relay 70, panel F, to be precise)[end if]."

	Instead of putting something on the relay panels:
		say "Sticking something in the relay panels would inevitably cause a glitch in the system."

	[Here we define the moth.]
	The moth is an animal. The moth can be flying. The moth is either living or dead. The moth is living. The moth is in the west lab. "[if the moth is flying]A moth flutters about the lab[otherwise]A moth is crawling over the switches and panels of the computer[end if]."

	The description of the moth is "[if the moth is living]It's small, soft, and white... and very curious about all the lights.[otherwise]Burnt to a crisp.[end if]"

	Rule for printing the name of the dead moth:
		say "poor moth, burnt to a crisp".
	
	Instead of taking the living moth:
		say "It flits out of your reach.";
		if the moth is not flying, now the moth is flying.

	Instead of taking the dead moth:
		say "You pick up the poor, burnt moth.";
		move the moth to the player.

	[The mother either crawls along the computer, or flits about the room. If it's flying, there's a one in three chance that the moth will land on the computer.]
	Every turn when the living moth is flying:
		if the moth is being debugged, say "// Rolling the dice for the flying moth...";
		if a random chance of 1 in 3 succeeds begin;
			now the moth is not flying;
			if the player can see the moth, say "The moth settles among the switches of the computer.";
			if the moth is being debugged, say "// The moth is no longer flying.";
		end if.
	
	[Once it's landed, there's a chance it'll crawl into the relay panels and fry itself and the computer. ]			
	Every turn when the living moth is not flying:
		if the moth is being debugged, say "// Rolling the dice for the crawling moth...";
		if a random chance of 1 in 3 succeeds, fry the moth.
	
	To fry the moth:
		if the moth is being debugged, say "// The moth has crawled into the relay panels.";
		now the moth is dead;
		now the moth is on the relay panels;
		now the Harvard Mark II is not working;
		if the player can see the moth begin;
			say "The moth disappears among the relay panels. A moment later a sharp electrical crack, followed by a wisp of smoke, emanates from within the computer. A moment after that, the computer shuts down.";
		otherwise;
			say "A distant, electrical pop preludes the sudden shutdown of the computer.";
		end if.

	[To win the game, the player must tape the moth to the logbook. We'll first create the tape and tape dispenser.]
	The plural of piece of tape is pieces of tape. A piece of tape is a kind of thing. 

	The tape dispenser is a container on the desk. In the tape dispenser are five pieces of tape.

	Instead of examining the tape dispenser:
		if the tape dispenser is being debugged, say "// There are now [number of pieces of tape in the tape dispenser] pieces of tape in the dispenser.";
		if the tape dispenser contains exactly one piece of tape begin;
			say "It appears there is only enough tape for you to take one more piece.";
		otherwise if the tape dispenser contains at least two pieces of tape;
			say "It contains a roll of tape.";
		otherwise;
			say "The dispenser is empty.";
		end if.

	Instead of taking a piece of tape when the noun is in the tape dispenser:
		say "You rip a piece of tape off the dispenser.";
		move the noun to the player;
		if the tape dispenser is being debugged, say "// There are now [number of pieces of tape in the tape dispenser] pieces of tape in the dispenser."
	
	Instead of inserting something into the dispenser:
		say "You can't put anything back into the dispenser."

	[Finally, we create a verb that will enable the player to tape the bug to the logbook.]
	Understand "tape [something] to [something]" as taping it to.
	Taping it to is an action applying to one thing and one visible thing.

	Check taping it to (this is the you need tape rule):
		if the player is not carrying one piece of tape, say "You need to be carrying a piece of tape first." instead.

	Check taping it to (this is the block taping rule):
		say "There is no point in taping [the noun] to [the second noun]." instead.

	Carry out taping it to (this is the successful taping rule):
		let x be a random piece of tape which is carried by the player;
		remove x from play;

	Report taping it to:
		say "Successful taping!"

	
	Instead of taping the dead moth to the logbook:
		abide by the you need tape rule;
		say "You tape the moth to the logbook, and annotate it with 'First actual case of bug being found.'";
		end the game saying "You have made history"	

	[Instead of inserting the dead moth into the logbook:
		try taping the dead moth to the logbook;
	]

	Test me with "w/take moth/x moth/x panels/take moth/e/x logbook/take piece of tape/tape moth to logbook".
Version 1 of Basic IF Help by Andrew Plotkin begins here.

"Provides a HELP (TOPIC) command which gives tutorial information about IF."

A help-topic is a kind of thing. The printed name is usually "help topic".

A help-topic can be visited.

To say para -- running on:
	(- DivideParagraphPoint(); new_line; -).
To say br -- running on:
	(- new_line; -).

To say help-style -- running on:
	(- print "~"; style bold; -).
To say /help-style -- running on:
	(- style roman; print "~"; -).

To say help-thing -- running on:
	(- style roman; print " "; style underline; print "thing"; style roman;  -).
To say help-thing- -- running on:
	(- style roman; print " "; style underline; print "thing"; style roman; print " "; style bold;  -).
To say help-this -- running on:
	(- style roman; print " "; style underline; print "this"; style roman; print " "; style bold;  -).
To say help-that -- running on:
	(- style roman; print " "; style underline; print "that"; style roman;  -).

To say help-person -- running on:
	(- style roman; print " "; style underline; print "person"; style roman;  -).
To say help-person- -- running on:
	(- style roman; print " "; style underline; print "person"; style roman; print " "; style bold;  -).
To say help-word -- running on:
	(- style roman; print " "; style underline; print "word"; style roman;  -).
To say help-word- -- running on:
	(- style roman; print " "; style underline; print "word"; style roman; print " "; style bold;  -).
To say help-topic -- running on:
	(- style roman; print " "; style underline; print "topic"; style roman;  -).

To decide what action name is the action-to-be:
	(- action_to_be -).

Rule for printing a parser error when the latest parser error is the noun did not make sense in that context error and action-to-be is the help-invoking action:
	say "There is no help information on that subject. Type [help-style]help[/help-style] for subjects you can learn about.";

Bare-help-invoking is an action out of world applying to nothing.
Move-help-invoking is an action out of world applying to one visible thing.
Help-invoking is an action out of world applying to one visible thing.

Understand "help" as bare-help-invoking.
Understand "help [any direction]" as move-help-invoking.
Understand "help [any help-topic]" as help-invoking.

Check bare-help-invoking:
	instead try help-invoking bare-help.

Check move-help-invoking:
	instead try help-invoking help-movement.

Carry out help-invoking a help-topic:
	say line break;
	say the description of the noun;
	say line break;
	now the noun is visited.

Bare-help is a help-topic.
Understand "me", "please" as bare-help.

The bare-help has some text called game-specific help. The game-specific help of bare-help is "All of these topics are [italic type]general[roman type] information on playing IF. If you are stuck on a particular puzzle in [italic type][story title][roman type], you're on your own."

The description is "This tutorial has lots of built-in help on how to play text adventures. To read more, type [help-style]help[/help-style] followed by whatever it is you want to get help on, and then hit enter[if not visited]. For example, you can type [help-style]help basics[/help-style] to see the most important IF commands[end if].[para]Topics you can get help on:
[para][help-style]help basics[/help-style]: The most important IF commands
[br][help-style]help commands[/help-style]: Some more common commands
[br][help-style]help talking[/help-style]: Commands for talking to other characters
[br][help-style]help system[/help-style]: Saving and loading games, quitting, and other system commands
[br][help-style]help special[/help-style]: Useful odds and ends (which may work differently in different games)
[br][help-style]help strategy[/help-style]: Figuring out what to do, when you're stuck
[para][game-specific help]"

Help-basics is a help-topic.
Understand "basic", "basics", "fundamental", "important" as help-basics.

The description is "These are the commands you will use most often.
[para][help-style]look[/help-style] or [help-style]l[/help-style]: Look around the room -- repeat the description of everything you see.
[br][help-style]examine[/help-style] or [help-style]x[/help-style]: Look more closely at something -- learn more about it.
[br][help-style]inventory[/help-style] or [help-style]i[/help-style]: List everything you're carrying.
[br][help-style]north[/help-style], [help-style]south[/help-style], [help-style]east[/help-style], [help-style]west[/help-style], etc., or [help-style]n[/help-style], [help-style]s[/help-style], [help-style]e[/help-style], [help-style]w[/help-style], etc.: Walk in some direction.
[para]For more about these commands -- or any command used in this game -- type [help-style]help[/help-style] followed by the command word. For example, [help-style]help look[/help-style][if not visited]. You might want to start by looking at the help information for all of these basic commands.[para]For even more help topics and commands, just type [help-style]help[/help-style][end if]."

Help-movement is a help-topic.
Understand "movement", "moving", "travel", "move", "go", "walk", "run" as help-movement.

The description is "[help-style]north[/help-style], [help-style]south[/help-style], [help-style]east[/help-style], [help-style]west[/help-style], [help-style]up[/help-style], [help-style]down[/help-style], [help-style]northeast[/help-style], [help-style]northwest[/help-style], [help-style]southeast[/help-style], [help-style]southwest[/help-style]: Move around.
[para]You can abbreviate these movement commands to one or two letters: [help-style]n[/help-style], [help-style]s[/help-style], [help-style]e[/help-style], [help-style]w[/help-style], [help-style]u[/help-style], [help-style]d[/help-style], [help-style]ne[/help-style], [help-style]nw[/help-style], [help-style]se[/help-style], [help-style]nw[/help-style].
[para]These commands let you move around. You will walk out of the room, and into a nearby room, in the given direction.
[para]If the game replies 'You can't go that way,' then there is no exit in that direction. Try [help-style]look[/help-style] to see what directions you can go."

Help-look is a help-topic.
Understand "look", "l" as help-look.

The description is "[help-style]look[/help-style]: Look around the room.
[para](You can abbreviate this as [help-style]l[/help-style].)
[para]Take a look around. This repeats the description of the room, and lists everything you see nearby.
[para]If you are having trouble understanding where you are, or what's going on in the game, it never hurts to [help-style]look[/help-style].
[para]Remember, you also can [help-style]examine[/help-style] anything you see, to inspect it in more detail."

Help-examine is a help-topic.
Understand "examine", "x" as help-examine.

The description is "[help-style]examine[/help-style]: Look more closely at something.
[para](You can abbreviate this as [help-style]x[/help-style].)
[para]Inspect an object carefully. You can do this to anything you're carrying, and anything nearby -- most anything you encounter in the game.
[para]You will often learn more about things if you [help-style]examine[/help-style] them. However, if the game replies 'You see nothing special about that,' then it's probably not important. If the game replies 'You can't see any such thing,' then it's definitely not important.
[para]You can even examine yourself: [help-style]x myself[/help-style] or [help-style]x me[/help-style]. This may tell you more about yourself -- information to help you understand the character you are playing. Then again, it may not."

Help-inventory is a help-topic.
Understand "inventory", "i", "inv" as help-inventory.

The description is "[help-style]inventory[/help-style]: List everything you're carrying.
[para](You can abbreviate this as [help-style]i[/help-style].)
[para]In some games, you start out empty-handed. In others, you are already holding things when you begin. It's a good idea to look these over; they will almost certainly be important later.
[para]And, of course, if you forget what you're holding, you can always repeat this command, to remind yourself.
[para]Remember, you also can [help-style]examine[/help-style] the objects you're carrying, to inspect them in more detail."

Help-system is a help-topic.
Understand "system", "meta" as help-system.

The description is "These commands help you manage your playing experience. (They're not actions you take [italic type]inside[roman type] the game world.)
[para]For more about these commands, type [help-style]help[/help-style] followed by the command word.
[para][help-style]save[/help-style] Save a file containing your current game position.
[br][help-style]restore[/help-style]: Restore a saved game; return to the saved position.
[br][help-style]quit[/help-style]: End the game.
[br][help-style]restart[/help-style]: Start the game over from the beginning.
[br][help-style]undo[/help-style]: Take back your last move.
[br][help-style]again[/help-style]: Repeat your last move.
[br][help-style]script[/help-style]: Begin saving a transcript file of your game session.
[br][help-style]script off[/help-style]: Turn off [help-style]script[/help-style] mode."

Help-quit is a help-topic.
Understand "quit", "q" as help-quit.

The description is "[help-style]quit[/help-style]: End the game.
[para](You can abbreviate this as [help-style]q[/help-style].)
[para]The game will ask you whether you mean it. (Type [help-style]y[/help-style] or [help-style]n[/help-style] and hit enter.) If you answer 'yes', the game will end and the program will shut down.
[para]You should type [help-style]save[/help-style] to save your progress before you [help-style]quit[/help-style]!"

Help-restart is a help-topic.
Understand "restart" as help-restart.

The description is "[help-style]restart[/help-style]: Start the game over from the beginning.
[para]The game will ask you whether you mean it. (Type [help-style]y[/help-style] or [help-style]n[/help-style] and hit enter.) If you answer 'yes', the game will start over. You will find yourself back at the beginning, carrying only those items you had when the game started."

Help-loadsave is a help-topic.
Understand "save", "restore", "load", "saving" as help-loadsave.

The description is "[help-style]save[/help-style]: Save a file containing your current game position.
[br][help-style]restore[/help-style]: Restore a saved game; return to the saved position.
[para]When you type [help-style]save[/help-style], the game will prompt you to create a save file. (You can put this anywhere on your computer.) A save file contains the entire state of the game -- your position, your possessions, all the progress you have made.
[para]When you type [help-style]restore[/help-style], the game will prompt you to load a save file back in. This restores you to the exact position of the save file. You will find everything just as you left it.
[para]You can [help-style]save[/help-style] as many different files as you want. You can also [help-style]restore[/help-style] from a given file as many times as you want.
[para]You will probably want to [help-style]save[/help-style] before you [help-style]quit[/help-style] (say, if you're about to shut down your computer). You might also want to [help-style]save[/help-style] before you try something dangerous or uncertain in a game. (If a dragon gnaws your arm off, it's nice to be able to [help-style]restore[/help-style] a file that you saved before you walked into its lair.)"

Help-undo is a help-topic.
Understand "undo" as help-undo.

The description is "[help-style]undo[/help-style]: Take back your last move.
[para]When you type [help-style]undo[/help-style], the game un-does your last move. Your position, your possessions, and all the rest of the game are restored just as they were before your previous command.
[para]Depending on the capabilities of your IF interpreter, you may not be able to [help-style]undo[/help-style] more than one move in a row. If you want to go back to an earlier point in the game, you'll have to use [help-style]save[/help-style] and [help-style]restore[/help-style], instead of [help-style]undo[/help-style]."

Help-again is a help-topic.
Understand "again", "g" as help-again.

The description is "[help-style]again[/help-style]: Repeat your last move.
[para](You can abbreviate this as [help-style]g[/help-style].)
[para]Repeat your last move, just as if you'd typed it again."

Help-script is a help-topic.
Understand "script/transcript", "script/transcript on/off", "unscript"  as help-script.

The description is "[help-style]script[/help-style]: Begin saving a transcript file of your game session.
[br][help-style]restore[/help-style]: Turn off [help-style]script[/help-style] mode.
[para]When you type [help-style]script[/help-style], the game will prompt you to create a transcript file. (You can put this anywhere on your computer.)
[para]The transcript is a text file. As you play, everything that the game displays -- your commands and the game's responses -- are logged to the transcript. (The transcript begins at the point you typed [help-style]script[/help-style], not at the beginning of the game.)
[para]Type [help-style]script off[/help-style] to stop the logging and close the transcript file. You can then view it with any text editor."

Help-commands is a help-topic.
Understand "command", "commands" as help-commands.

The description is "These are the most common ways of interacting with the game's world. It's usually worth trying these, in almost any situation. You never know what might happen -- or what you might learn.
[para]These commands do what they say. Common sense applies. There are many more possibilities -- every game has its own variations, depending on what actions make sense in a particular situation. For more information, type [help-style]help[/help-style] followed by any command word.
[para][help-style]get[help-thing][/help-style],
[help-style]drop[help-thing][/help-style]
[br][help-style]put[help-this]in[help-that][/help-style], 
[help-style]put[help-this]on[help-that][/help-style], 
[help-style]throw[help-this]at[help-that][/help-style]
[br][help-style]push[help-thing][/help-style],
[help-style]pull[help-thing][/help-style],
[help-style]turn[help-thing][/help-style]
[br][help-style]open[help-thing][/help-style],
[help-style]close[help-thing][/help-style]
[br][help-style]lock[help-this]with[help-that][/help-style], 
[help-style]unlock[help-this]with[help-that][/help-style]
[br][help-style]touch[help-thing][/help-style],
[help-style]smell[help-thing][/help-style],
[help-style]listen to[help-thing][/help-style]
[br][help-style]eat[help-thing][/help-style],
[help-style]drink[help-thing][/help-style]
[br][help-style]wear[help-thing][/help-style],
[help-style]remove[help-thing][/help-style]
[br][help-style]search[help-thing][/help-style],
[help-style]look in[help-thing][/help-style]
[help-style]look under[help-thing][/help-style],
[help-style]look behind[help-thing][/help-style]
[br][help-style]enter[help-thing][/help-style],
[help-style]sit on[help-thing][/help-style],
[help-style]climb[help-thing][/help-style]
[br][help-style]get in[help-thing][/help-style],
[help-style]get off[help-thing][/help-style],
[help-style]get out of[help-thing][/help-style]
[br][help-style]break[help-thing][/help-style],
[help-style]cut[help-thing][/help-style],
[help-style]crush[help-thing][/help-style]
[br][help-style]wait[/help-style]"


Help-getdrop is a help-topic.
Understand "get", "take", "drop" as help-getdrop.

The description is "[help-style]get[/help-style] or [help-style]take[/help-style]: Pick something up.
[br][help-style]drop[/help-style]: Put something down.
[para]You will certainly encounter objects which you'll want to take with you. Every adventurer is a collector at heart. Type [help-style]get[/help-style] (followed by the object's name) to pick it up.
[para]Of course, many things are anchored in place, or too large to carry.
[para]To put things down again, use the [help-style]drop[/help-style] command. (This generally puts an item down on the floor. To place it somewhere special, try [help-style]put[help-this]in[help-that][/help-style] or [help-style]put[help-this]on[help-that][/help-style].)
[para]To see what you're carrying, type [help-style]inventory[/help-style], or just [help-style]i[/help-style]."

Help-putthrow is a help-topic.
Understand "put/throw", "put/throw on/in/onto/into/at" as help-putthrow.

The description is "[help-style]put[help-this]in[help-that][/help-style]: Place something into a container.
[br][help-style]put[help-this]on[help-that][/help-style]: Place something onto a surface.
[br][help-style]throw[help-this]at[help-that][/help-style]: Hurl something at a target.
[para]When you discover a container, such as a sack or chest or drawer, you can say [help-style]put object in container[/help-style] to place something into it. (Of course, if the container has a lid, you'd want to [help-style]open[/help-style] it first.)
[para]For tables, pedestals, and other such pieces of flat-on-top furniture, the command [help-style]put object on supporter[/help-style] is more appropriate.
[para]And for targets out of reach, you may occasionally want to try [help-style]throw object at target[/help-style]. This is less commonly used; you tend to miss."

Help-pushpull is a help-topic.
Understand "push", "pull", "turn", "turn on/off/to", "set/switch", "set/switch on/off/to" as help-pushpull.

The description is "[help-style]push[help-thing][/help-style]: Give it a shove.
[br][help-style]pull[help-thing][/help-style]: Give it a yank.
[br][help-style]turn[help-thing][/help-style]: Give it a twist.
[para]All sorts of things can be pushed, pulled, turned, or moved. Levers, buttons, and heavy crates are for pushing. Ropes and levers can be pulled. (Yes, some levers go both ways.) Knobs and dials and wheels are frequently turned.
[para]Sometimes you'll want to use variations of these commands. If you find a lightswitch, you could type [help-style]turn on switch[/help-style] or [help-style]turn switch on[/help-style]. If a dial has numbers on it, like a combination lock, it may be helpful to say [help-style]turn dial to 8[/help-style] or [help-style]set dial to 8[/help-style].
[para]Occasionally you find an object which is too heavy to lift, but not too heavy to be pushed around. Try [help-style]push object north[/help-style] to direct it."

Help-enter is a help-topic.
Understand "enter", "sit", "climb", "exit", "out", "in" as help-enter.
Understand "sit/climb on/in/onto/into" as help-enter.
Understand "get in/out/off/on", "get out/off of" as help-enter.

The description is "[help-style]enter[help-thing][/help-style] or [help-style]get in[help-thing][/help-style]: Get into, say, a car.
[br][help-style]sit on[help-thing][/help-style]: Sit down on, for example, a chair.
[br][help-style]climb[help-thing][/help-style]: Climb, perhaps, a ladder.
[br][help-style]get off[help-thing][/help-style] or [help-style]get out of[help-thing][/help-style]: Leave, e.g., a car or a chair. Or a cage. Or a chasm. Or...
[para]These commands are good for moving around, if the simple directions ([help-style]north[/help-style], [help-style]south[/help-style], etc.) aren't what you want.
[para]Don't be intimidated by the many variations. If you encounter an automobile, you can probably type [help-style]enter car[/help-style], [help-style]get in car[/help-style], [help-style]sit in car[/help-style], or [help-style]climb into car[/help-style]. In a well-written text game, any of the obvious possibilities will work.
[para](However, for a car or a cage, you might have to use the [help-style]open[/help-style] command first.)
[para]You can often abbreviate [help-style]get out of[help-thing][/help-style] as [help-style]exit[/help-style] or [help-style]out[/help-style]. Similarly, if you're standing outside a building, [help-style]in[/help-style] may work."

Help-openclose is a help-topic.
Understand "open", "close" as help-openclose.

The description is "[help-style]open[help-thing][/help-style]: Open something.
[br][help-style]close[help-thing][/help-style]: Close something.
[para]These commands are good for boxes, doors, wardrobes, windows, wallets, and dozens of other exciting uses.
[para]If you not sure whether something is opened or closed, [help-style]examine[/help-style] it. If a container is open, you can probably [help-style]search[/help-style] or [help-style]look into[/help-style] it.
[para]In some circumstances, [help-style]open[/help-style] will happen automatically. If there is a closed door to the north, and you type [help-style]north[/help-style], the game may tell you that you have opened the door and walked through. Or not -- you may have to type [help-style]open door[/help-style]. It depends on the style of the game, the nature of the door, and the mood of the author.
[para]On the other hand, you may find that the door is locked. If so, consider the [help-style]unlock[/help-style] command."

Help-lockunlock is a help-topic.
Understand "lock/unlock", "lock/unlock with" as help-lockunlock.

The description is "[help-style]lock[help-this]with[help-that][/help-style]: Secure what is free.
[br][help-style]unlock[help-this]with[help-that][/help-style]: Loose what is bound.
[para]Many things can be opened and closed; some can also be locked and unlocked. You will meet a lot of locked doors in adventure games. They are hazards of the course.
[para]Typically a lock requires a key. (Although you never know.) Usually you have to [help-style]close[/help-style] a door or box before you [help-style]lock[/help-style] it -- although, again, there may be exceptions. Always examine what you find, and consider well its nature.
[para]In some games, you can just type [help-style]unlock door[/help-style] instead of [help-style]unlock door with key[/help-style]. If you have the correct key, the game will probably understand that you mean to use it.
[para]On the other hand, if you don't [italic type]know[roman type] which key is correct, the game may leave it up to you. Trial and error, too, is a hazard of the course."

Help-sensory is a help-topic.
Understand "touch/smell/listen/hear/taste" as help-sensory.
Understand "listen to" as help-sensory.

The description is "[help-style]touch[help-thing][/help-style]: Feel something gently.
[br][help-style]smell[help-thing][/help-style]: Consider its scent.
[br][help-style]listen to[help-thing][/help-style]: What does it sound like?
[para]A close investigation is often rewarded. You've already used [help-style]examine[/help-style] on everything in sight; but perhaps you haven't tried [help-style]touch[/help-style] or [help-style]feel[/help-style] on everything in reach; or [help-style]listen to[/help-style] on everything in earshot; or [help-style]smell[/help-style] on everything in... er... noseblow?
[para](You can even try [help-style]taste[/help-style], although this may wind up being the same as [help-style]eat[/help-style].)
[para]You can also try just [help-style]listen[/help-style] or [help-style]smell[/help-style], with no nouns, to get a general sense of your surroundings."

Help-eatdrink is a help-topic.
Understand "eat", "drink" as help-eatdrink.

The description is "[help-style]eat[help-thing][/help-style]: Consume food.
[br][help-style]drink[help-thing][/help-style]: Consume a beverage.
[para]Just what you think. Whether it's a tasty sandwich or a moldy old mushroom, you can try to [help-style]eat[/help-style] it. (Whether this is a good idea is another question entirely. Remember what happened to Alice.)
[para]Similarly, you can [help-style]drink[/help-style] a glass of water, a flagon of wine, or a vial of quintessential potion. Potions may have strange and magical effects. Then again, so may the mushrooms.
[para]You may have to [help-style]get[/help-style] something before you can eat or drink it."

Help-wearremove is a help-topic.
Understand "wear", "remove", "don", "doff", "disrobe", "take off" as help-wearremove.

The description is "[help-style]wear[help-thing][/help-style] or [help-style]put on[help-thing][/help-style]: Put on an article of clothing.
[br][help-style]remove[help-thing][/help-style] or [help-style]take off[help-thing][/help-style]: Take it off again.
[para]Clothing is meant to be worn -- be it a dinner jacket or a space suit. Then there are items of personal adornment, like helmets, crowns, necklaces, and rings. (Magical? Who can tell?) Use the [help-style]wear[/help-style] and [help-style]remove[/help-style] commands. You can also [help-style]drop[/help-style] something you're wearing, which will both remove it and drop it on the floor.
[para](Type [help-style]inventory[/help-style] or [help-style]i[/help-style] to see if you're wearing something or just carrying it around.)
[para]Your ordinary everyday clothes are usually [italic type]not[roman type] listed in your inventory; and you can't take them off or discard them. Don't worry about them unless the game specifically refers to them."

Help-search is a help-topic.
Understand "search", "look/l in/under/through/behind" as help-search.

The description is "[help-style]search[help-thing][/help-style] or [help-style]look in[help-thing][/help-style]: Look through the contents of something.
[br][help-style]look under[help-thing][/help-style]: Check underneath it.
[br][help-style]look behind[help-thing][/help-style]: Check behind it.
[para]The [help-style]search[/help-style] command is an extremely thorough version of [help-style]examine[/help-style]. Searching something may reveal nothing more than examining it; but if you see a drawer full of papers, or a heap of junk, a careful [help-style]search[/help-style] can turn up hidden secrets. It may even be worth searching several times in a row.
[para]The [help-style]look under[/help-style] and [help-style]look behind[/help-style] commands are less commonly used, but they are helpful now and then."

Help-hit is a help-topic.
Understand "break/cut/crush/attack/hit/stab", "break/cut/crush/attack/hit/stab with" as help-hit.

The description is "[help-style]hit[help-thing][/help-style]: Employ violence.
[br][help-style]hit[help-this]with[help-that][/help-style]: Employ violence with a particular tool.
[para]There are many things you might want to destroy, in IF, and many reasons to destroy them. The window, to break; the rope, to cut; the magical crystal, to shatter; the foul monster, to stab and slice and attack.
[para]These commands vary from game to game. All the words mentioned above can work. They tend to be somewhat interchangeable: the game will not quibble about whether you want to [help-style]fight[/help-style] or [help-style]attack[/help-style] the troll. And you'll certainly get the same result whether you [help-style]break[/help-style] the delicate vase or [help-style]hit[/help-style] it.
[para]In some games, you may need to specify a weapon: [help-style]hit troll with sword[/help-style]. In others, the game may assume you intend to use whatever sharp pointy thing you're carrying around. If you have none, you'd better be good with your fists.
[para]Sometimes, though, it matters which tool you use. [help-style]break wall with pickaxe[/help-style] is more likely to work than [help-style]break wall with dagger[/help-style]. If you just type [help-style]break wall[/help-style] the game may not guess correctly. Be specific, if you think it matters.
[para]In some games, by the way, violence is frowned on. A warrior in a goblins['] lair is going to be hitting a lot of goblins. But if the game is set in your home, you probably don't want to smash everything in sight. Look for other solutions."

Help-wait is a help-topic.
Understand "wait", "z" as help-wait.

The description is "[help-style]wait[/help-style]: Do nothing.
[para](You can abbreviate this as [help-style]z[/help-style].)
[para]A text adventure is played in turns. You can think (and read) for as long as you want, while you're entering your command. The game only progresses when you hit enter.
[para]If you want to actually [italic type]do nothing,[roman type] and let the game progress on its own, type [help-style]wait[/help-style]. One turn will pass.
[para]Is it ever useful to do nothing? Certainly. You may meet people, animals, or machines which act on their own. Waiting and watching may be the key to understanding how they behave."

Help-specials is a help-topic.
Understand "special", "specials" as help-specials.

The description is "This is a somewhat miscellaneous grab-bag of commands which help you in playing a game. Not all games will support all of them, or handle them all the same way!
[para]For more information on any of these commands, type [help-style]help[/help-style] followed by the command word.
[para][help-style]about[/help-style]: Read a brief introduction to the game.
[br][help-style]verbose[/help-style]: See a detailed description of each room you enter, every time.
[br][help-style]brief[/help-style]: Abbreviate room descriptions that you've seen before.
[br][help-style]score[/help-style]: Measure your progress in the game.
[br][help-style]help[/help-style]: Learn about playing interactive fiction."

Help-about is a help-topic.
Understand "about" as help-about.

Help-about can be game-available.
Help-about has some text called game-specific help. The game-specific help of help-about is "[if game-available] (including this one!)[else],[end if]"

The description is "[help-style]about[/help-style]: Read a brief introduction to the game.
[para]In some games[game-specific help] typing [help-style]about[/help-style] will give you a short blurb about the game. It might introduce the game, give a few notes from the author, or tell you about special commands which are different -- or important -- in the game.
[para]Even if you're familiar with IF, it's a good idea to try [help-style]about[/help-style] when you start a game you've never played before."

Help-verbose is a help-topic.
Understand "verbose", "brief" as help-verbose.

The description is "[help-style]verbose[/help-style]: See a detailed description of each room you enter, every time.
[br][help-style]brief[/help-style]: Abbreviate room descriptions that you've seen before.
[para]Some text games start in [help-style]brief[/help-style] mode. This means that when you enter a room for the first time, you will see a full description of the room and its contents. But if you leave the room and come back, you will only see a brief description. This consists of the room's name, and a list of portable objects -- but no description, nor major room features such as exits.
[para]If you want, you can type [help-style]verbose[/help-style] to change this. In [help-style]verbose[/help-style] mode, you will see a complete description every time you enter a room.
[para](Of course, you can type [help-style]look[/help-style] or [help-style]l[/help-style] at any time to repeat the complete room description. But [help-style]verbose[/help-style] is very convenient. I recommend you use it whenever you play IF.)
[para]The [help-style]verbose[/help-style] mode remains in place for the rest of the game, unless you turn it off by typing [help-style]brief[/help-style]. It is also saved in [help-style]save[/help-style] files. However, if you [help-style]restart[/help-style] the game, it will be reset.
[para]Note that many games (including this one) start out in [help-style]verbose[/help-style] mode automatically."

Help-score is a help-topic.
Understand "score" as help-score.

Help-score has some text called game-specific help. The game-specific help of help-score is "[italic type][story title][roman type] [if the no scoring option is active]does not have[else]has[end if] a [help-style]score[/help-style] command."

The description is "[help-style]score[/help-style]: Measure your progress in the game.
[para]In some games, [help-style]score[/help-style] will tell you how far you've advanced through the game. This is usually measured in points -- although different games will report your progress differently.
[para]Some games also let you type [help-style]full score[/help-style] to see a detailed list of your achievements.
[para][game-specific help]"

Help-help is a help-topic.
Understand "help" as help-help.

The description is "[help-style]help[/help-style]: Learn about playing interactive fiction.
[para]The [help-style]help[/help-style] command gives you general help on playing IF. For example, typing [help-style]help command[/help-style] will describe the [help-style]command[/help-style] command. For example, typing [help-style]help help[/help-style] will show you this very message!"

Help-talking is a help-topic.
Understand "talking", "people", "character", "conversation", "interaction", "dialog", "dialogue", "communication" as help-talking.

The description is "Communicating with other characters is a tricky topic. Different games handle it in different ways. One approach is to present you with a menu -- when you meet someone, you can choose what to say from a list of phrases or questions.
[para]Other games leave the interaction up to you. The game tells you that there's another person in the room, and then presents you with the usual command prompt. The possible commands will vary from game to game, but these are usually available:
[para][help-style]talk to[help-person][/help-style]
[br][help-style]ask[help-person-]about[help-topic][/help-style]
[br][help-style]tell[help-person-]about[help-topic][/help-style]
[br][help-style]say[help-word-]to[help-person][/help-style]
[br][help-style]ask[help-person-]for[help-thing][/help-style]
[br][help-style]give[help-thing-]to[help-person][/help-style]
[br][help-style]show[help-thing-]to[help-person][/help-style]
[para]You can also talk to a person by typing [help-style]person, phrase[/help-style]. (The comma is important.) For example, to answer a question, you could type [help-style]morgan, yes[/help-style] or [help-style]morgan, no[/help-style]. Saying [help-style]pirate, hello[/help-style] can begin an interesting conversation -- or a deadly one. To order someone around, you could use a command like [help-style]jeeves, get my umbrella[/help-style] or [help-style]ensign rosen, stop the ship[/help-style]. (Naturally, not everyone will be willing to obey your commands!)"

Help-talk is a help-topic.
Understand "talk", "talk to" as help-talk.

The description is "[help-style]talk to[help-person][/help-style]: Begin a conversation.
[para]This command indicates that you want to talk, without specifying a topic. The game may choose an inoffensive opening gambit, or it may present you with a menu of choices to talk about."

Help-ask is a help-topic.
Understand "ask", "ask about", "ask for" as help-ask.

The description is "[help-style]ask[help-person-]about[help-topic][/help-style]: Inquire about a topic.
[br][help-style]ask[help-person-]for[help-thing][/help-style]: Request a gift.
[para]Not all games incorporate the [help-style]ask about[/help-style] command, but if it works, you will want to use it often. The topic can be anything you've seen, heard, or read about in the game -- anything the character might know about. You can gather a lot of information this way.
[para]The [help-style]ask for[/help-style] command is different. You would use this to request a particular object which the other person is holding. (Another way to phrase this is [help-style]jeeves, give umbrella to me[/help-style].)"

Help-tell is a help-topic.
Understand "tell", "tell about" as help-tell.

The description is "[help-style]tell[help-person-]about[help-topic][/help-style]: Impart information about a topic.
[para]This command lets you offer information about a topic to another character. Obviously, it should be a topic that person cares about -- something he does not know, but would want to learn. If you go around telling random things to arbitrary people, they likely won't care."

Help-say is a help-topic.
Understand "say", "say to", "hello" as help-say.

The description is "[help-style]say[help-word][/help-style] or [help-style]say[help-word-]to[help-person][/help-style]: Say a particular word.
[para]This command allows you to say a specific word. You can greet someone by saying 'hello'; you can answer questions with 'yes' or 'no'. This command is also handy for passwords, magic words, voice-activated code words, and other such speech acts."

Help-give is a help-topic.
Understand "give", "give to" as help-give.

The description is "[help-style]give[help-thing-]to[help-person][/help-style]: Offer a gift to someone.
[para]This simply hands an object -- something you're holding -- over to someone else. The recipient may be delighted, disgusted, or apathetic.
[para](If you want to display something, without necessarily giving it away, use the [help-style]show[/help-style] command.)"

Help-show is a help-topic.
Understand "show", "show to" as help-show.

The description is "[help-style]show[help-thing-]to[help-person][/help-style]: Display a possession to someone.
[para]This lets you show off something you're holding. You're not necessarily handing it over. (Use the [help-style]give[/help-style] command to do that.)"

Help-strategy is a help-topic.
Understand "strategy", "playing" as help-strategy.

The description is "Every text adventure is different. But here are some simple ideas which will help you in nearly any game.
[para]* Examine everything. (Type [help-style]examine[/help-style] for more on this command.) Even if there are many things in the room, try to examine each one, at least once. Be systematic.
[para]* Notice which objects the game is focussing your attention on, and which seem to be background or scenery. (If it looks like the most important thing in the room, it probably is. If the game says it's not important, it probably isn't.)
[para]* Try to interact with things. Use common sense. If you see a button, push it. If you find a flute, play it. And [help-style]take[/help-style] anything that you can possibly lift.
[para]* If you try a command on an object, and you get a distinctive response, your ears should perk up. It means you're on the right track. Maybe you have to try a related command, or change something else in the environment, or bring a second object in somehow. Maybe you won't be able to complete the action until later in the game. But it's important.
[para]* Notice when the game is leading you towards a specific command. If the game says 'You could probably bend the bars,' then [help-style]bend bars[/help-style] is worth trying.
[para]* Pay attention to common elements. If you find rubies and emeralds, look for red and green places to sell, put, or drop them. If a machine is made of brass, look for a brass part to add to it. If a door is barred by shimmering silver light, look for anything that magically glows with a similar light.
[para]* When you find something which moves by itself, hang out and watch it for a while. You may need to understand its entire range of movement.
[para]And remember, the game world is a [italic type]world[roman type]. It has its own logic -- whimsy or dream logic perhaps, but still sense. Find the game's time and reason, and follow it. You will find a way through."

Help-use is a help-topic.
Understand "use" as help-use.

The description is "There is no 'use' command in most text adventures. (If there were, what would be the point in providing any other commands?) Instead, try a command which is appropriate to whatever you're doing. If you have a key, try [help-style]unlock[/help-style] something. If you have a book, try to [help-style]read[/help-style] it. If you find a lever, try to [help-style]pull[/help-style] or [help-style]push[/help-style] it.
[para]If you have no idea what to try, start with [help-style]examine[/help-style]. Then [help-style]feel[/help-style], and perhaps [help-style]listen to[/help-style] or [help-style]smell[/help-style] it. If that doesn't give you any leads, it can't hurt to [help-style]push[/help-style], [help-style]pull[/help-style], or [help-style]move[/help-style] it. Well -- it might hurt. But probably not too much."

Basic IF Help ends here.

---- DOCUMENTATION ----

This extension defines a "help" verb, which offers a variety of help topics covering the common IF commands and conventions. Typing "help" by itself offers a list of topics; "help TOPIC" gives more detailed information.

These topics are based directly on the Tutorial Voice feature in my game "The Dreamhold". However, this extension does not try to provide Dreamhold's interactive guidance. (That sort of handholding is too game-specific to be bundled into an extension; it has to be built directly into the game.)

I have not attempted to update Dreamhold's (2004) help text, so it may be a little out of step with modern IF. (For a start, I consistently refer to "games" and "text adventures", rather than "stories" and "interactive fiction".) The one concession I've made is to acknowledge that modern games default to "verbose" mode.

You may want to add synonyms for "help". I have not done this, to avoid colliding with verbs you might have defined already in your game. But you might add:

	Understand the commands "hint", "hints", "about", "info" as "help".

Functionally, this extension creates a set of help-topic objects (which are always off-stage -- don't try to bring them into the game world). Each help-topic has a name (defined in the usual I7 way) and a description (ditto).

To define a completely new topic, you could write (for example):

	Help-jumping is a help-topic.
	Understand "jump", "leap" as help-jumping.
	The description is "Jump! With great power."

To customize any of the existing topics, you could write:

	When play begins:
		now the description of help-wait is "Waiting is boring. Don't do it."

A few of the topics have some customization already in place. For example, the top-level "help" topic ends with the line:

	All of these topics are *general* information on playing IF. If you are stuck on a particular puzzle in STORY TITLE, you're on your own.

(The story title is taken from the game itself.) You can change this line by setting a property of the bare-help object:

	When play begins:
		now the game-specific help of bare-help is "All of these topics are [italic type]general[roman type] information on playing IF. For hints, see my web site."

Similarly, the "help score" topic ends with one of the lines:

	STORY TITLE has a "score" command.
	STORY TITLE does not have a "score" command.

...depending on whether you "use no scoring". You can customize this line by setting the game-specific help property of the help-score object.

Finally, the "help about" topic contains the line:

	In some games, typing "about" will give you a short blurb about the game.

If you write:

	When play begins:
		now help-about is game-available.

...this will change to:

	In some games (including this one!) typing "about" will give you a short blurb about the game.


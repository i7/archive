Version 2 of Landmark Events by Jon Ingold begins here.

"Provides a system for tracking events which have occured, and testing how recently they occured. Also includes some simple phrases for comparing times."

Section 1 - The Table of Events and Times

A landmark is a kind of value.  

Game-start-landmark is a landmark. When play begins: this is game-start-landmark.

Table of Landmark-Times
landmark-name	time achieved
a landmark	a time
with 29 blank rows.

Section 2 - Signposting a landmark

To say this is (e - a landmark) -- running on: this is e;

To this is (e - a landmark):
	if e has happened, stop;
	if the number of blank rows in The Table of landmark-Times is zero begin;
		say "(Problem -- There are no rows left in The Table of landmark-Times! Please 'ennumerate landmarks' for advice on how to rectify this. If this is a released game, please inform the game's author of the problem).";
	otherwise;		
		choose a blank row in The Table of landmark-Times;
		change the landmark-name entry to e;
		change the time achieved entry to the time of day;
	end if;

Section 3 - Deciding what has happened

To decide if (e - a landmark) has happened:
	if there is a landmark-name of e in The Table of landmark-Times, yes;
	no.

To decide if (e - a landmark) has not happened: if e has happened, no; yes.

Section 4 - Comparing times, in general

To decide if (prior time - a time) is more than (time difference - a
time) ago:
       let test time be the prior time plus time difference;
       if test time is less than the time of day, decide yes;
       decide no.

To decide if (prior time - a time) is less than (time difference - a
time) ago:
       let test time be the prior time plus time difference;
       if test time is greater than the time of day, decide yes;
       decide no.

To decide if (prior time - a time) is (time difference - a time) ago:
       let test time be the prior time plus time difference;
       if test time is the time of day, decide yes;
       decide no.

Section 5 - Comparing events

To decide what time is the time (e - a landmark) occurred:
	if e has not happened, decide on 9 AM;	[ This is the best failsafe we've got.  Better to use "happened" first! ]
	decide on the time achieved corresponding to a landmark-name of e in The Table of landmark-Times;

To decide if (e -  a landmark) happened after (f - a landmark):
	if e has not happened or f has not happened, no;
	if the time e occurred is after the time f occurred, yes;
	no.

To decide if (e - a landmark) happened before (t - a time):
	if e has not happened, no;
	if the time e occurred is before t, yes;
	no.

To decide if (e - a landmark) happened before (f - a landmark):
	if e has not happened or f has not happened, no;
	if f happened after e, yes;
	no.

To decide if (e - a landmark) and (f - a landmark) happened together:
	if e has not happened or f has not happened, no;
	if the time e occurred is the time f occurred, yes;
	no.

To decide if (e - a landmark) happened last turn:
	if e has not happened, no;
	if the time e occurred is one minute ago, yes;
	no.
	
Section 6 - numerical comparison of events

To decide if (e - a landmark) happened more than (t - a time) ago:
	if e has not happened, no;
	if the time e occurred is more than t ago, yes;
	no.

To decide if (e - a landmark) happened less than (t - a time) ago:
	if e has not happened, no;
	if the time e occurred is less than t ago, yes;
	no.

To decide if (e - a landmark) happened (t - a time) ago:
	if e has not happened, no;
	if the time e occurred is t ago, yes;
	no.	

To decide if (e - a landmark) happened more than (n - a number) turns ago:
	if e has not happened, no;
	if the time e occurred is more than n minutes ago, yes;
	no.

To decide if (e - a landmark) happened less than (n - a number) turns ago:
	if e has not happened, no;
	if the time e occurred is less than n minutes ago, yes;
	no.

To decide if (e - a landmark) happened (n - a number) turns ago:
	if e has not happened, no;
	if the time e occurred is n minutes ago, yes;
	no.	

Section 7 - Debugging verb - not for release

Ennumerating landmarks is an action out of world. Understand "ennumerate landmarks" as ennumerating landmarks.
Report ennumerating landmarks:
	let k be the number of landmarks;
	let g be the number of rows in The Table of landmark-Times;
	say "Your game contains [k] landmarks. ";
	if k times two is less than g, say "Therefore you have ample space left for more landmarks." instead;
	if k plus ten is greater than g and k is at most g, say "Therefore you have almost reached the internal limit on the number of landmarks and will soon need to continue the internal table." instead;
	if k is at most g, say "Therefore you have space left for more landmarks." instead;
	say "Therefore you need to continue The Table of landmark-Times by";
	if g is greater than 30, say " a further [k - g] row[s] to a total of";
	say " [k - 30] blank row[s]. See the extension's documentation for how to do this.";

To decide which landmark is the first landmark:
	let lll be a random landmark; [ inelegant, but it'll have to do for now ]
	while the landmark before lll is less than lll repeatedly let lll be the landmark before lll;
	decide on lll;

To decide what number is the number of landmarks:
	let lcount be one;
	let llandmark be the first landmark; 
	while the landmark after llandmark is not first landmark begin;
		increase lcount by one;
		let llandmark be the landmark after llandmark;
	end while;
	decide on lcount;

Section 8 - Removing a landmark

To forget about (e - a landmark):
	if there is a landmark-name of e in the Table of landmark-Times begin;
		choose row with a landmark-name of e in The Table of landmark-Times;
		blank out the whole row;
	end if.

Landmark Events ends here.

---- DOCUMENTATION ----

Chapter: Overview

Landmark Events is an extension to extend Inform 7's ability to track past events. This isn't done very elegantly: you need to define events (known as "landmarks") and then note in your source when they occur. Landmarks are values and can be defined as and when you need them...

	Emerging from the forest is a landmarks. Reaching the city walls and singing for joy are landmarks.

You then tell the game when these landmarks are reached. These calls can be made either in say substitutions or phrases. The same landmark can occur as many times as you like within your code but the landmark will .

	Every turn when the city walls are visible: this is reaching the city walls.
	Every turn when the player is not in the Forest:
		say "[this is emerging from the forest]Finally, you are clear of the trees!"
	Check singing when emerging from the forest has happened or reaching the city walls has happened:	
		this is singing for joy; say "You holler with happiness at your success!"

Section: Recording Landmarks

Landmarks will only be recorded the first time they are reached. You can locate the time a landmark was hit by using the "time (landmark) occurred" phrase. Furthermore, we can test the following:

	if reaching the city walls has happened ...
	if emerging from the forest has not happened ...

	if emerging from the forest happened after reaching the city walls ... 	(or before)
	if singing for joy and emerging from the forest happened together ... (ie. on the same turn)

Note that comparisons are made by the game clock, so two events happening on the same turn will fail a "before" or "after" test, but pass a "together" test.

Section: Phrases

We can also consider when the landmark happened relative to the current time:

	if emerging from the forest happened last turn ...
	if reaching the city walls happened more than four turns ago ...
	if emerging from the forest happened three minutes ago ...

The extension also provides some phrases for comparing times, which may be useful even if the landmark system isn't used.

	if (time) is more than/less than (n) minutes ago
	if (time) is (n) minutes ago

Note, landmarks are often going to look like actions, but cannot actually be actions -- you will need to choose names that don't conflict with other things in Inform.

Section: Remembering and Forgetting Landmarks

We can also forget landmarks, though this might lead to some confusion as things might start to loop:

	forget about emerging from the forest;

The extension supports a maximum of 30 landmarks occuring in any one game. Once that is reached, an error will be produced. In order to find out if extra rows are needed a debugging-only verb "ennumerate landmarks" is provided. Type this at the game prompt for advice on how much space the table requires. If it tells you that you have exceeded the internal limit you will need to extend the table in your source using a table continuation, as follows:

	Table of landmark-Times (continued)
	landmark		time achieved
	a landmark		a time
	with 10 blank rows.

...where the number of blank rows will be advised by the debugging verb.

Chapter: Changelog

Version 2 of Landmark Event repeals the defining-in-a-table procedure: the latest builds of Inform cannot compile certain typed expressions without instances of those types existing (so the extension will hang if it does not contain at least one landmark. So that landmark is provided, which thereby forces one style of definition over the other. Apologies, and maybe this will be changed in later builds of the compiler).

Example: * Pet the Dog - A dog, which the player must sing to before he can pet.

	*: "Spike"

	Include landmark Events by Jon Ingold.

	Touching the dog, singing to the dog and two turns after singing are landmarks.

	The Kennel is a room. The dog is a thing in the Kennel. The description of the dog is "The dog seems friendly, and has enormous, music-loving ears."

	Instead of touching the dog when singing to the dog has happened and two turns after singing has not happened:
	say "The dog looks at you shiftly, making up its mind."

	Instead of touching the dog when two turns after singing has not happened:
	say "The dog squirms away from you."

	Instead of touching the dog when touching the dog has not happened:
	say "[this is touching the dog]The dog wriggles under your fingers."

	Instead of touching the dog: say "The dog is quite happy with you."	

	Instead of singing when singing to the dog has happened:
	say "The dog is still enjoying it, incredibly enough."

	Instead of singing when singing to the dog has not happened:
	say "[this is singing to the dog]The dog's ears prick up and its tail start to wag."

	Every turn when singing to the dog happened two turns ago:
	this is two turns after singing;
	say "The dog scurries over to you and starts rubbing itself against your leg.".

	test me with "touch the dog / examine the dog / sing / wait / wait / touch the dog".
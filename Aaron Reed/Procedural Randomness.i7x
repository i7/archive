Version 2 of Procedural Randomness by Aaron Reed begins here.

"Adds a say option, 'with procedural randomness,' that will reliably choose the same text as long as its seed is set to the same number or game object."

[Log:
Version 2: fixed a bug with "a procedurally random number from X to Y."]

Section - Variables

Procedural seed is a number that varies. Procedural seed is 28471. [Normally this would be 0, which would make all returned values 0 if the author forgets to set the seed before using our function. ]

Section - Commands in I7

To set seed to (item - an object): (- setProcSeed({item}); -).

To set seed to (num - a number): (- setProcSeed({num}); -).

To decide which number is a procedurally random number from/between (N - a number) to/and (M - a number): (- pRandomNumber({N}, {M}); -).

To decide whether a procedurally random chance of (N - a number) in (M - a number) succeeds: (- (pRandomNumber(1, {M}) <= {N}) -).

Section - I6 routines

Include (-
[ setProcSeed item;
	(+ procedural seed +) = ~ ( item * 27923 ) ;
]; 

[ varySeed x;
	x = (+ procedural seed +);
	x = x * 21739;
	x = ~ x;
	if (x < 0) x = x * -1;
	(+ procedural seed +) = x;
]; 

[ normalizedSeed sd;
 	sd = sd * 16747;
	sd = ~ sd;
	if (sd < 0) sd = sd * -1;
	return sd;
]; 

[ pRandomNumber n m   s seed choice; 
	if (n==m) return n; 
	if (n>m) { s = n; n = m; m = s; } 
	seed = normalizedSeed((+ procedural seed +));
	choice = ( seed % (m-n+1) ) + n;
	varySeed();
	return choice; 
];
-).

Section - With Procedural Randomness

To say with procedural randomness -- ending say_one_of with marker I7_SOO_PRAN: 
    (- {-close-brace} -).


Include (-
[ I7_SOO_PRAN oldval count   seed choice; 
    	if (count <= 1) return count;
	seed = normalizedSeed((+ procedural seed +));
	choice = ( seed % count ) + 1;
	if (choice < 0) choice = choice * -1;
	varySeed();
	return choice;
 ]; 
-)

Procedural Randomness ends here.

---- DOCUMENTATION ----

In some games, you may discover a need for text that seems to randomly vary, but will consistently display the same thing in the same circumstances. For instance, you may want to add to a room description a bit of random flavor text that stays the same until the player moves to another location.

To enable this, Procedural Randomness defines a new say phrase "with procedural randomness" that can be used as the ending to a "one of" clause. This will make the pattern of options chosen consistent until you change the extension's seed.

You may set the seed to either a number, or, more usefully, an object in the game. 

	set seed to 45
	set seed to location

You can then invoke procedural randomness as follows:

	say "[one of]blue[or]red[or]green[with procedural randomness]";

If you call "with procedural randomness" multiple times without changing the seed, the same pattern of choices will be selected.

We can also generate procedurally random numbers, again being assured the number or sequence of numbers will be identical given the same starting seed:

	if a procedurally random chance of 3 in 10 succeeds
	let num be a procedurally random number from 1 to 100

A final note about VMs: if using a numeric seed, the maximum z-machine value is 32,767; on Glulx, it's 2,147,483,647. Note that switching from one VM to the other will cause the same seed to generate different results.

Example: * Weather Or Not - Add a bit of weather-related color to every room description which doesn't vary until the player moves.

	*: "Weather Or Not"

	Include Procedural Randomness by Aaron Reed.

	Trailhead is below Lonely Meadow. Lonely Meadow is below Forested Slope. Precarious Trail is below Mountain Peak and above Forested Slope.

	Weather bit is a number that varies. Before going: now weather bit is a random number from 1 to 10000.
	
	After looking:
		set seed to weather bit;
		say "The air is [one of]hazy [or]clear [or]windy [or]cool [with procedural randomness] and the sky is [one of]cloudless[or]scudding with white clouds[or]angry with dark clouds[with procedural randomness].".

	Test me with "up / up / z / z / look / up / down".

This is certainly not the most accurate bit of weather simulation, but we can see how at the least it prevents the weather from changing drastically every time the player types "look".

Example: ** Château Générique - Randomized but sticky room descriptions.

Say we wanted to create unimportant details for a large number of rooms with some randomized text. It would seem strange for this text to change every time we returned to the room or typed "look," breaking our suspension of disbelief in the constancy of the world.

Here we create a 5x5 grid of rooms with names and descriptions that are random, but consistently so: when we return to a room we find everything precisely as we left it.

	*: "Château Générique".

	Include Procedural Randomness by Aaron Reed.

	R1 is west of R2 and north of R6. R2 is west of R3 and north of R7. R3 is west of R4 and north of R8. R4 is west of R5 and north of R9. R5 is north of R10. R6 is west of R7 and north of R11. R7 is west of R8 and north of R12. R8 is west of R9 and north of R13. R9 is west of R10 and north of R14. R10 is north of R15. R11 is west of R12 and north of R16. R12 is west of R13 and north of R17. R13 is west of R14 and north of R18. R14 is west of R15 and north of R19. R15 is north of R20. R16 is west of R17 and north of R21. R17 is west of R18 and north of R22. R18 is west of R19 and north of R23. R19 is west of R20 and north of R24. R20 is north of R25. R21 is west of R22. R22 is south of R17 and west of R23. R23 is west of R24 and south of R18. R24 is west of R25 and south of R19.

	Rule for printing the name of a room:
		set seed to location;
		say "[one of]Spacious [or]Crooked [or]Blue [or]Wide [or]Open [or]French [or]Carpeted [or]Lonely [or]Grand [or]Master [or]Guest [with procedural randomness]";
		say "[one of]Bedroom [or]Hall [or]Ballroom [or]Kitchen [or]Foyer [or]Dining Room [or]Library [or]Study [or]Game Room [or]Corridor [or]Spare Room [or]Den [with procedural randomness]".
	
	The description of a room is usually "[special-desc].".

	To say special-desc: 
		set seed to location;
		say "[one of]Only the finest[or]Ridiculously expensive[or]Posh[or]Fashionably antique[with procedural randomness][one of] furnishings[or] cabinets[or] furniture[or] centerpieces[with procedural randomness] and[one of] tasteful[or] outrageous[or] postmodern[or] sophisticated[with procedural randomness] [one of]carpeting[or]wall panelling[or]oak floorboards[or]chandeliers[with procedural randomness]";
		say "[if a procedurally random chance of 1 in 3 succeeds]; [one of]but strangely drafty[or]quintessentially in vogue[or]a faint smell of must lingers[with procedural randomness][end if]. ";
		say "The exits are to [a list of viable directions]".
	
	Definition: a direction is viable if the room it from the location is a room.  

	Test me with "south / east / north / west".

Example: ** Call Center - Random names consistently associated with telephone numbers.

In this example, we're going to set up 10,000 phone numbers with consistent names and voicemail messages at each one.

	*: "Call Center".

	Include Procedural Randomness by Aaron Reed.

	Call Center is a room. "Sales have certainly been down in the years since call screening began. Still, you do have to call all these numbers. (Say DIAL and a 4-digit number to make a call.)".

	Understand "dial [a number]" as dialing. dialing is an action applying to one number.

	Check dialing:
		if the number understood < 0 or the number understood > 9999, say "Only four digit numbers are valid.".

	Carry out dialing:
		set seed to the number understood;
		say "After a few rings, you get voicemail. 'This is [one of]Alec [or]Bob [or]Cathy [or]Dennis [or]Eric [or]Frank [or]Gary [or]Henrietta [or]Irma [or]Jane [or]Karl [or]Laura [or]Morris [or]Nathan [or]Omar [or]Petunia [or]Quinn [or]Russel [with procedural randomness]";
		say "[one of]Adams [or]Beckerson [or]Cordwood [or]Dansbury [or]Eggerson [or]Fleetmeyer [or]Garrison [or]Hardy [or]Iglesias [or]Jones [or]Kurtz [or]Laurence [or]Michaels [or]Norris [or]Openheimer [or]Princeton [or]Quagmire [or]Roberts [with procedural randomness]";
		say ". [one of]Sorry I can't take your call[or]I'm not available[or]I'm not here right now[or]I don't have my phone on[or]I'm unable to answer the phone right now[with procedural randomness], but ";
		say "[one of]if you leave a name and number I'll be happy to get back to you[or]leave a message and I'll ring you back[or]say your contact info at the tone and I'll return your call[or]I'll return your call later[or]record a message and I'll get back to you later[with procedural randomness].' You hang up at the tone.".
		
	Test me with "dial 2938 / dial 9837 / dial 5000 / dial 2938".


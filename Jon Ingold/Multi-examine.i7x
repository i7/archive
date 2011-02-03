Version 3 of Multi-examine by Jon Ingold begins here.

"Allows us to provide descriptions to cover groups of objects, based on their kinds within the I7 structure. Also provides a framework for easily adding new non-list-based multiple actions and some handles for doing this neatly."


Chapter 1 - Editing general multi-actions

The representative-item is a thing that varies.
Multi-action-done is a truth state that varies.

Before reading a command: now multi-action-done is false.

Section - To prevent list output for multiple actions, and to prevent extra output after a representative has been selected

The silently announce items from multiple object lists rule is listed instead of the announce items from multiple object lists rule in the action-processing rules. 

This is the silently announce items from multiple object lists rule: 
	unless a multiple action:
		if the current item from the multiple object list is not nothing, say "[current item from the multiple object list]: [run paragraph on]";
	if multi-action-done is true:
		let L be the multiple object list;
		let N be the number of entries in L;
		if the current item from the multiple object list is entry N from L, say " "; [ seems to guarantee line-breaking works; no idea why. ]
		stop the action.

Section - crashing out of a multiple action

To forget remaining objects:
	now multi-action-done is true.

Section - checking the multi-list

To decide if considering only (D - a description):
	let possibles be the list of D;
	repeat with item running through multiple object list:
		if item is not listed in possibles, no;
	yes.

To decide if really doing a multiple action: if the number of entries in the multiple object list is at least two, yes; no.

Chapter 2 - Multi-examining

Multiexamining is an action applying to one thing. Multiexamining is a multiple action.

Section - grammar

Understand "examine [things]" as multiexamining.
Understand "x [things]" as multiexamining.
Understand "look at [things]" as multiexamining.

Section - check rules prevent all except homogeneous non-empty classes

Check an actor multiexamining when not really doing a multiple action (this is the divert to examine rule):
	try the actor examining the noun instead.

Check an actor multiexamining (this is the check classes rule):
	if we can't find a representative, say "Those are quite different. You'll have to be more specific." instead.



Section  - carry out the group description property, or simply a numerical count

A thing has some text called group description.

Report an actor multiexamining (this is the print group description rule):
	if the actor is the player and we can print a group description for the representative object, rule succeeds;
	say "[The actor] can see [the number of entries in the multiple object list in words] [the plural for representative object]." instead.



Chapter 3 - i6  routines

Section - entry point for class searching

To decide if we can't find a representative: (- (~~RunMultiClassCompare()) -).

Include (- 

[ RunMultiClassCompare i rep;
	(+ multi-action-done +) = (+true+);
	(+representative-item+) = MultiClassRepObject();
	if ((+representative-item+) ==0) rfalse;
	rtrue;
];

 -).


section 2 - The class tree


[ Relying on I7's single-dependancy class-chain, we find the highest valued class for the first object in the multiple object list, and then check that all the others belong to this class, and that they don't belong to anything further. ]


Include (-

[ MultiClassRepObject	i j	maxclass;

objectloop(i ofclass Class && i >= K4_door && multiple_object-->1 ofclass i)
{	for (j = 2: j <= multiple_object-->0 : j++)
		if (~~(multiple_object-->j ofclass i)) return maxclass;
	maxclass = i;
}
return maxclass;
];
-).

Section 3 - retrieving properties from i6 class objects

To decide if we can print (p - a property) for the/-- representative object:
	let N be indexed text;
	let N be "[p for representative object]";
	if N exactly matches the text "", no;
	say "[N][line break]";
	yes.

To say the plural for the/-- representative object: 
(- 	PrintFromClass(plural);	-).


To say (p - an object) for the/-- representative object:
(-	PrintFromClass({p}); 	-).

Include (-

[ PrintFromClass prop;
	PrintText((multiple_object-->1).(+representative-item+)::prop); 
];

-).




Multi-examine  ends here.

---- DOCUMENTATION ----

Section: Overview

Provides a system for examining plural objects. 

Multiple examining is useful for when we have groups of identical objects which are naturally considered as a group, like a pad of nine buttons, or a bag of coins. The way it's implemented here is to take a collection of objects specified by the player and deduce the most specific kind to which they all belong. If you want more flexible behaviour - but possibily requiring more specification - see "The Left Hand of Autumn" in the I7 Recipe Book.


Chapter: The Multiexamining Action

The code will search for a kind that satisfies everything in the set of objects supplied, and pick the most specific it can. If that's "thing", it'll give up and print an error message, telling the player that the objects in question are too varied to be looked at all at once. Otherwise, it'll fire the "group description" property of this kind.

The following examples show the decisions the logic will make:

	Examining a door, a man and a woman	-> No general kind
	Examing two men and three women -> General kind is "person"
	Examining a container, and a jar (which is a kind of container) -> General kind is container
	Examining a staircase (a kind of door) and a ladder (a kind of staircase) -> General kind is staircase.
	Examining three magpies (a kind of bird, which is a kind of animal) and a rockweiler (a kind of animal) -> General kind is animal

and so on.

Note that the group description is the only entry point to change what happens: because multiexamining can consider the objects in any order, and because the object it decides on is actually the "kind" object itself (which I7 generally has no access to whatsoever at run-time), checking and carrying out don't make sense. 

Section: Before and Instead rules

You can prevent multiexamining taking place using "Before" and "Instead" rules but you need to use these with caution. A rule like:

	Before multiexamining apples: examine the orchard instead.

will fire on "EXAMINE ALL APPLES" but also "EXAMINE APPLE AND MONKEY" and not on "EXAMINE MONKEY AND APPLE". Better would be

	Before multiexamining when considering nothing but apples: examine the orchard instead.

where the phrases "considering only <a description>" is a new one defined by this extension.


Section: Group Descriptions

To provide a description for examining members of a kind, the "group description" property is used:

	A key is a kind of thing. The group description of a key is "A bunch of brass keys."
	
	A dog is a kind of animal. The group description of a dog is "A pack of wild dogs, all slavering at the teeth."

Note, it will only be printed in response to plural enquires, so you are safe to hard-pluralise the response.


Section: WARNING

Defining multiple actions seems to always supercede the libraries standard grammar, despite the fact it should be less specific. For now, that means you need to redefine your actions or redirect them in the case when the multiple object list empty. The multiexamining rules includes:

	Check multiexamining when not really doing a multiple action (this is the divert to examine rule):
		try examining the noun instead.

using the phrase "not really doing a multiple action", which checks to see if there really are two or more objects under consideration.
 
Chapter: Designing other multiple actions.

The extension leaves the door open for other similar actions. To define them you need something which mirrors the top of this extension: an action definition, a "multiple action" declaration, and some action rules.

	Multilistening to is an action applying to one thing. Multilistening to is a multiple action.	

The second sentence here tells the extension to subvert normal multiple action behaviour, and deal with the whole group on one line without printing the "Item 1: ...  Item 2: ...." lists that follow a "TAKE ALL" command.

Next, provide some multiple-action grammar:

	Understand "listen to [things]" as multilistening to.

From here you can write rules as for a normal actions, but you should bear in mind that these rules will be called once for every object matched in the list. To prevent this, use the phrase "forget further objects" first time around, to ensure later objects are ignored.

If you want to select a representative and use the same machinery as the multiexaming action, then write the following Check rule:

	Check multilistening (this is the check listening classes rule): 
		if we can't find a representative, say "Those are making quite different noises. You'll have to be more specific." instead.

or we could even divert to another action

	Check multilistening (this is the check listening classes rule): 
		if we can't find a representative, try listening to the location instead.

Further objects will be forgotten after a representative search regardless of outcome. 

If the representative search succeeded, we're then free to use the phrase "if we can print <a property> of the representative object" to print text and variable text strings about this representative. But note, this is all we can do: you can't "try examining ..." the representative found as the representation is a kind object and not a thing. There may not even be an object of just that kind in the model world at all to use as a better representative - for example, when examining all the people in the room, there's no native "person" to use as a representative of this kind because everyone is either a man or a woman. So we're limited to printing the text phrase associated with the kind.

So the multiexamining rule has the following report line:

	Report multiexamining (this is the print group description rule):
		if we can print a group description for the representative obect, rule succeeds;
		say "You can see [the number of entries in the multiple object list in words] [the plural for representative object]." instead.

And we could write

	A thing has some text called group sound.

	Percussion is a kind of thing. The group sound of percussion is "Banging and clattering."
	Brass is a kind of thing. The group sound of brass is "Crisp and golden."

	Report multilistening (this is the print group sound rule):
		if we can print a group sound for the representative object, rule succeeds;
		try listening to the location instead.

And remember, we're going to need:

	Check multilistening when not really doing a multiple action  (this is the divert to listen rule):
		try listening to the noun instead.

Section: otherwise...

Remember, you don't need to use the representative system. You can get access to the full list of multiple objects using the "multiple object list" and so long as you trigger "forget further objects", the action will only happen once.

Example: * Always One... - A barrel containing ten apples and one rotten one.

	*: The Galley is a room. 

	Include Multi-Examine by Jon ingold.

	The barrel is a container in the Galley. An apple is a kind of thing. The barrel contains ten apples. The rotten one is an apple in the barrel. the group description of the apples is "They look like a lovely bunch of fruit right now."


Example: * Santa's Shed - A brief example showing some sets of objects - and also demonstrating the parser's slightly strange choice of plural defaulting when there are names duplicates and specifically named items in a location (in this case, pairs of antlers and Rudolph's own pair.)

	*: Santa's Shed is a room.

	Include Multi-examine by Jon Ingold.

	A reindeer is a kind of animal. The group description of a reindeer is "A herd of fine reindeer, with fine antlers lined with bells." 

	A pair of antlers is a kind of thing. An pair of antlers is part of every reindeer. The plural of pair of antlers is pairs of antlers.

	A bell is a kind of thing. The group description of a bell is "The bells make a charming tinkling noise as the animals shuffle about." Four bells are part of every pair of antlers.

	Rudolph is a reindeer. The description of Rudolph is "One reindeer has a very shiny red nose."

	The shiny nose is part of Rudolph. The shiny nose has description "Painfully bright."

	In the Shed are six reindeer. In the Shed is Rudolph. 

	Every turn when a random chance of 1 in 2 succeeds: say "The animals pace and chew the ground."

	Test me with "x reindeers/x rudolph/x bells/x bell/x a pair of antlers/x all antlers/x all".

Example: *** Tuning Up - An orchestra with sections that can be listened to individually.

	*:  "Tuning Up"

	Include Multi-examine by Jon Ingold.
	
	The Pit is a room. "How a large orchestra fits into such a tiny box never ceases to be amazing. Sound fills the tiny space - squawks and warbles from the various sections: the brass, the strings, the woodwind and the percussion."

	In the pit is a lectern. On the lectern is a manuscript score. The player is carrying a baton.

	When play begins: say "The opera is about to begin. Time for a final tune up - your players begin to test their notes, listening all the while to the sound of the oboe..."

	An instrument is a kind of thing. The group description of instruments is "A fine collection of players, the very best there are." Understand "player" as an instrument. Understand "players" as the plural of instrument.

	Brass is a kind of instrument. The group description of brass is "All the brass players are men the size of winnebagoes." Understand "brass" as the plural of brass.

	Woodwind is a kind of instrument. The group description of woodwind is "The wind players are a mixture of men and women, all huffing and puffing their cheeks. Most unprofessional." Understand "wind/woodwind" as the plural of woodwind.

	Percussion is a kind of instrument. The group description of percussion is "The percussion set is strimmed down for the space to just a gong and a big bass drum for the exciting parts." Understand "percussion" as the plural of percussion.

	A stringed instrument is a kind of instrument. The plural of stringed instrument is strings. Understand "strings" as the plural of stringed instruments. The group description of stringed instruments is "Fine ladies wearing long evenings dresses, hair sweeping down over their bows. And one man with thick glasses and a worried expression."

	A trumpet, a trombone and a tuba are brass in the pit.
	A violin, a cello and a double bass are stringed instruments in the pit.
	An oboe, a clarinet and a flute are woodwind in the pit.
	A gong and a bass drum are percussion in the pit.

An example of intervening in the usual process.

	*: An instrument can be soprano, alto or bass-clef. An instrument is usually bass-clef.

	The violin, oboe, flute and trumpet are soprano.
	The cello, trombone and clarinet are alto.

	Instead of multiexamining when considering only soprano instruments:
		let L be a list of objects;
		let L be the multiple object list;
		say "The [L] are twittering away like sparrows.";
		forget remaining objects.

A new multiple action, so we can solve the puzzle of tuning up:

	*: Multilistening is an action applying to one thing. Multilistening is a multiple action.
	Understand "listen to [things]" as multilistening.

	Check multilistening when not really doing a multiple action  (this is the divert to listen rule):
		try listening to the noun instead.

	Check multilistening (this is the check listening classes rule): 
		if we can't find a representative, try listening to the location instead.

	A thing has some text called group sound.

	The group sound of percussion is "The percussion don't have anything to tune. They're just hitting things for fun."
	The group sound of brass is "The trombone is sharp. As always.[sharp-brass]".
	The group sound of strings is "The strings all seem fine."
	The group sound of woodwind is "They're shrill and unpleasant, obviously, but they're all perfectly in tune."
	The group sound of instruments is "You should listen to each section in turn until you find who's playing out of tune."

	Report multilistening (this is the print group sound rule):
		if we can print a group sound for the representative object, rule succeeds;
		try listening to the location instead.

	Instead of listening to the Pit:
		say "Someone is quite clearly out of tune, but who?"
	
	Instead of listening to an instrument in the Pit:
		say the group sound of the noun instead.
	
	To say sharp-brass:
		end the game saying "You found the culprit".

	Test me with "x players / x brass / x strings / x flute and oboe / x woodwind / x lectern and oboe / listen / listen to violin / listen to brass".
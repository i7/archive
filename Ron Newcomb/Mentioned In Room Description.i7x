Mentioned In Room Description by Ron Newcomb begins here.

"Objects, items, and people mentioned in square brackets within the room description or room heading will no longer be re-described later in the LOOK command."

"with special thanks to Erik Temple and Aaron Reed"


Section - Initialise the 'mentioned' property much earlier in the locale-printing process

The initialise locale description rule is not listed in the before printing the locale description rules.

The initialise locale description rule is listed first in the carry out looking rules.

First before printing the locale description of something while not looking (this is the initialise non-look locale description rule):
	consider the initialise locale description rule.


Section - a small optimization

The don’t mention player’s supporter in room descriptions rule is not listed in any rulebook. 
[ The rule is redundant, as the player's supporter is mentioned by default in the room's heading, which this extension now catches.  If the heading is changed so it isn't mentioned, the rest of the LOOK command will know that, and subsequently mention it. ]


Section - Here and Elsewhere as Adjectives

Definition: an object is here rather than elsewhere if it is in the location. 


Section - 'Mentioned Below'

[ The variations are necessary to preserve any article and capitalisation used in their invocation. ]
[ The "A"/"a" variation is smartest.  When in doubt, "A" or "a" will use the definition's form. ]

To say (item - an object) mentioned below:
	say item;
	now the item is not mentioned.
	
To say the (item - an object) mentioned below:
	say the item;
	now the item is not mentioned.
	
To say The (item - an object) mentioned below:
	say The item;
	now the item is not mentioned.
	
To say a (item - an object) mentioned below:
	say a item;
	now the item is not mentioned.
	
To say A (item - an object) mentioned below:
	say A item;
	now the item is not mentioned.
	
To say an (item - an object) mentioned below:
	say an item;
	now the item is not mentioned.
	
To say An (item - an object) mentioned below:
	say An item;
	now the item is not mentioned.


Section - the capitalised name of a thing

A thing has a text called printed capitalised name.  The printed capitalised name property translates into I6 as "cap_short_name".  The printed capitalised name of a thing is usually "[the item described as capitalised]".


Section - if capitalisation is needed

To decide if capitalization/capitalisation is needed: (- CapsNeeded() -).	


Section - suggesting capitalisation

To say uc/^: (- SetCapsNeeded(1); -).


Section - plural problems

[ the I7 property "printed plural name" (I6 = "plural") is only printed from the Activity, and that activity is only called from the Printing Number Of activity. Since *that* activity always runs first, the plural name is always preceded by another word, negating the need for a capitalised plural name in Inform's prosegen.  So, we add the following rule just in case someone (i.e., another extension improving handling of plurals) calls the activity from elsewhere. ]

A thing has a text called printed capitalised plural name.  The printed capitalised plural name of a thing is usually "[the printed plural name of the item described as capitalised]".

Rule for printing the plural name of something (called the item) when capitalisation is needed (this is the printing the capitalised plural name rule):  say "[the printed plural name of the item as capitalised]".   


Section - I6 internals - unindexed

Include (-
[ CapsNeeded;          return caps_mode;  ];
[ SetCapsNeeded x;  caps_mode = x;      ];
-) after "Printing.i6t".

[ these don't set "mentioned" or anything; they aren't intended for public use ]
To say (O - an object) as capitalised/capitalized:  (- CPrintOrRun({O}, short_name); SetCapsNeeded(0); -).  [ short_name or plural; how to know? Can't? ]
To say (T - some text) as capitalised/capitalized:  (-  CPrintOrRun({T}, 0); SetCapsNeeded(0); -).


Section - Look After Going

Include (-
[ LookAfterGoing; 
    GoingLookBreak(); 
    TryAction(0, player, ##Look, 0, 0);  ! was  AbbreviatedRoomDescription(); 
];
-) instead of "Look After Going" in "Actions.i6t".


Mentioned In Room Description ends here.


---- DOCUMENTATION ----

Section : The Room Description

This extension modifies Inform so that room descriptions which have their objects in square brackets, like this -- 

	Warehouse is a room. "The room is filled by [the ENIAC computing machine]."

-- will no longer be mentioned later in LOOK, such as the you-can-also-see line or a paragraph dedicated to the item.  Likewise, objects mentioned in the room's heading, such as the supporter a player stands upon, will also be considered already mentioned.  

Traditionally, a room description was completely static text, describing the setting that the player has just walked into.  As most locations do not appreciably change between visits -- buildings and landscape are themselves fairly static -- this is appropriate.  Subsequent paragraphs list the portable items and movable actors with which you actually interact.  But increasingly the "room description" is co-opted for other purposes.  Either the setting itself changes with time and weather, or immobile but interactive things are best presented within the room description (as in the case of scenery), or a portable item or character spends a great deal of time in a particular room necessitating personalisation, or a strongly narrative work uses rooms as single-use set pieces containing plot or scene information. 

In such cases this extension allows the author to more easily coordinate the mentioning of objects between the room description and the rest of LOOK's generated prose, because a single guideline will apply:  mention objects only once, regardless of where.


Section : 'Here' and 'Elsewhere' as Adjectives

When we write portable items and people into the room description, an appropriate if-statement is likely needed to check that the item or person is still in the room.  This extension defines "here" and "elsewhere" as adjectives for asking if an object is currently in the room being described.  They can combine with other adjectives to ascertain several truths at once.

	*: The Catskills is a room. "Here is a lovely, secluded fold in the mountains, far from civilization[if Rip Van Winkle is here asleep]: as though to prove it, [Rip Van Winkle] is sleeping under a tree[end if]."
	
	Rip Van Winkle is a man in the Catskills. "Rip Van Winkle [if Rip is asleep]sleeps nearby[otherwise]stands here, looking mightily confused[end if]."


The statement "if Rip is here asleep" ensures that Rip's description combines with the room's description only if both conditions are true.  If he is awake, Rip gets a paragraph to himself.  In other rooms, he gets a paragraph to himself regardless his state of consciousness. Only in that particular and presumably usual circumstance is the description of setting and character blended.


Section : 'Mentioned Below'

If an object is mentioned in the room description but the author still wishes LOOK to automatically describe it anyway, there are three ways to accomplish this.  The first is simply not to enclose the object in square brackets to begin with, though if the name of the object changes such a change won't be reflected automatically.  The second way is via the say phrase "mentioned below".  The third way is via a rule. 

	Warehouse is a room. "The room is filled by the ENIAC computing machine."
	
	Warehouse is a room. "The room is filled by [the ENIAC computing machine mentioned below]."
	
	Before printing the locale description of the warehouse: now the ENIAC machine is unmentioned. 


Section : 'If Capitalisation is Needed' and 'uc'

"Mentioned below" preserves the article and capitalisation of its object as many Inform say phrases do.  Meaning, it knows and respects the difference between "[The wrench]" and "[the wrench]" and "Eddie's [wrench]".  But occasionally we don't wish to lead the mention of a common noun with an article, and in those cases we must explicitly tell Inform to capitalise the object's name with either the "[uc]" proofreading mark, or synonymously, the caret "[^]".

	The description of the cave is "[uc][Water] drips from above."
	The description of the cave is "[^][Water] drips from above."

In cases where capitalisation is rather complex, we can explicitly define what the capitalised name of something is.  
	*: The printed capitalised name of the iPod is "iPod".
	The printed capitalised plural name of the iPod is "iPods".

The state of capitalisation can be queried with "if capitalisation is needed".  This may be useful within the Printing The Name Of activity.

	*: Rule for printing the name of the player when the player is in the teleportation chamber:
		if capitalisation is needed, say "Flickering as if insubstantial, you";
		otherwise say "your ghostly self". 

When we use other indefinite articles, such as "some" as in "some water", we can call it forth by using the indefinite article "a", as in "[A Water] drips from the ceiling," or "There is [a water] here." Whichever article (if any) the object used in its definition will be printed.  For more information on this aspect of the indeterminate article, see 3.18, "Articles and proper names", and Chapter 5.2, "Text which names things", in the Writing With Inform manual.  See the built-in extension Plurality, by Emily Short, for further handling of "these/those", pronouns, and so on.


Section : A Full Look After Going, Exiting

With an increased reliance on room descriptions, we must take care with how the commands BRIEF and SUPERBRIEF will affect the work.  These commands suppress the room description on subsequent visits, or permanently, respectively.  The BRIEF listing, also called an abbreviated listing, is also used during VERBOSE mode after a character changes location via going, entering, or exiting, for example.  For consistancy, this extension changes the default behavior so that a full LOOK is done after movement, removing this edge case and its small burden from the author. 

The author must still consider how the prose will lay if the player specifically enters the BRIEF or SUPERBRIEF commands.  Generally, if a work requires a lot of backtracking, these modes are conveniences to the player, as he needs only room headings while running around to fetch keys and whatnot.  But if the work provides a GO TO command which deposits the player at his destination in a single turn, it may be acceptable to disallow these modes completely.

	*: Check preferring sometimes abbreviated room descriptions: say "I'm sorry, but [italic type][the story title][roman type] does not support BRIEF mode." instead.
	
	 Check preferring abbreviated room descriptions: say "I'm sorry, but [italic type][the story title][roman type] does not support SUPERBRIEF mode." instead.




Example: * Notable Machines - One machine to use a name, one machine to move around its mention.  Comes with instructions.

	*: "Notable Machines"

	Include Mentioned in Room Description by Ron Newcomb.

	The laboratory is a room. "This room is completely nondescript but for [the Hieronymus machine], the massive bulk of which fills nearly every corner."
	
	The Hieronymus machine is a fixed in place device in the laboratory. "Because the room description does not wrap an if-statement around the object's mention, and the machine cannot be moved to another room, this text is only seen by the player when the room description is wholly suppressed, such as after the player uses the BRIEF command."
	
	A teleport chamber is an enterable fixed in place container in the laboratory.  "A teleport chamber glows gently, inviting entry.  Doing so will teleport the chamber's mention to the room heading."
	
	Test me with " look / x machine / x chamber / enter chamber / look / exit / look ".


Example: * Rip - A re-implementation of standard example 335, in which a character's description is blended into the room's, at least until he wakes.

The original example required a less than obvious rule in order to solve difficulties in wrapping Rip Van Winkle's description in the room description.  Here, we allow Rip to move around, napping in various places.  But when he naps in his original location, his description is once again weaved into the room description. 

	*: "Rip Van Winkle" 

	Include Mentioned in Room Description by Ron Newcomb.

	Section 1 - Original Example

	A person can be asleep.

	The Catskills is a room. "Here is a lovely, secluded fold in the mountains, far from civilization[if Rip Van Winkle is here asleep]: as though to prove it, [Rip Van Winkle] is sleeping under a tree[end if]."

	A tree is scenery in the Catskills.

	Rip Van Winkle is a man in the Catskills. "Rip Van Winkle [if Rip is asleep]is sleeping again[otherwise]stands here, looking mightily confused[end if]."  Rip Van Winkle is asleep.

	Instead of waiting:
		say "Rip Van Winkle wakes up with a snort.";
		now Rip Van Winkle is not asleep.
		
	Test me with "look / z / look / rip, down / look / down / nap / look / z / rip, up / look / up / nap / look".
	
	Section 2 - Additions
	
	Instead of sleeping: 
		say "Rip Van Winkle nods off again.";
		now Rip is asleep.
	
	Down the valley is below the Catskills.  "A creek tumbles over pebbles and roots, enroute to the rest of the world."
	
	Persuasion: rule succeeds.

	   

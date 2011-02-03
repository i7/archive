Version 1 of Senses by ShadowChaser begins here.

"This short extension implements the senses of touch, taste, smell and hearing."

Section 1 - Includes

Include Plurality by Emily Short.

Section 2 - Touch

A thing has some text called feeling. The feeling of a thing is usually "normal".

After touching something:
	 say "[The noun] feel[s] [the feeling of the noun].".

Section 3 - Taste

A thing has some text called flavour. The flavour of a thing is usually "normal".  

The block tasting rule is not listed in the check tasting rules. 

carry out tasting something:
    say "[The noun] taste[s] [the flavour of the noun].".

Instead of tasting a room (called the tastedRoom): 
   	 if the flavour of the tastedRoom is not "normal" begin;
		say "[The tastedRoom] tastes [the flavour of the tastedRoom].";
   	 otherwise;
		say "Thre is nothing unusual to taste here.";
    	end if.

Section 4 - Smell

A thing has some text called odour. The odour of a thing is usually "normal". A thing can be strong_smelling or weak_smelling. A thing is usually weak_smelling.

A room has some text called odour. The odour of a room is usually "normal".

The block smelling rule is not listed in the check smelling rules. 

carry out smelling something:
    say "[The noun] smell[s] [the odour of the noun].".

Instead of smelling a room (called the smeltRoom): 
   	 if the odour of the smeltRoom is not "normal" begin;
		say "[The smeltRoom] smells [the odour of the smeltRoom].";
	end if;
    	if a pungent thing can be touched by the player begin; 
		repeat with item  running through visible pungent things which can be touched by the player begin;		
			say "Inside [the smeltRoom], [the item] smell[s] [the odour of the item].";
		end repeat;
		repeat with item  running through invisible pungent things which can be touched by the player begin;
           			say "Something in [the smeltRoom] smells [the odour of the item].";
		end repeat;
   	 otherwise;
		 if the odour of the smeltRoom is "normal", say "There are no unusual smells here.";
    	end if.

Definition: a thing is pungent if it is strong_smelling.

Section 5 - Hearing

A thing has some text called sound. The sound of a thing is usually "silence". A thing can be loud_sounding or soft_sounding. A thing is usually soft_sounding.

The block listening rule is not listed in the check listening to rules. 

Carry out listening to something: 
    say "From [the noun] you hear [the sound of the noun]." 

Instead of listening to a room: 
	if a noisy thing can be touched by the player begin;
		repeat with item  running through visible noisy things which can be touched by the player begin;		
			say "Inside [the location of the player], From [the item] you hear [the sound of the item].";
		end repeat;
		repeat with item  running through invisible noisy things which can be touched by the player begin;
           			say "From somewhere inside [the location of the player] you hear [the sound of the item].";
		end repeat;
	 else;
		 say "Nothing of note.";
	end if.

Definition: a thing is audible if the sound of it is not "silence".
Definition: a thing is noisy if it is loud_sounding.

Section 6 - Automatically smelling and hearing

After looking:
	if the odour of the location of the player is not "normal" begin;
		say "[The location of the player] smells [the odour of the location of the player].";
	end if;
    	if a pungent thing can be touched by the player begin; 
		repeat with item  running through visible pungent things which can be touched by the player begin;		
			say "Inside [the location of the player], [the item] smell[s] [the odour of the item].";
		end repeat;
		repeat with item  running through invisible pungent things which can be touched by the player begin;
           			say "Something in [the location of the player] smells [the odour of the item].";
		end repeat;
	end if;
	if a noisy thing can be touched by the player begin;
		repeat with item  running through visible noisy things which can be touched by the player begin;		
			say "Inside [the location of the player], from [the item] you hear [the sound of the item].";
		end repeat;
		repeat with item  running through invisible noisy things which can be touched by the player begin;
           			say "From somewhere inside [the location of the player] you hear [the sound of the item].";
		end repeat;
	end if.
	
Senses ends here.

---- DOCUMENTATION ---- 

This short extension implements the senses of touch, taste, smell and hearing.

Each object in the game has the following properties feeling, flavour, odour, and sound. These properties can be used to add sensory information about objects. For example:-

	The odour of the perfume is "fragrant".

This will produce the response:
	
	>smell perfume

	The perfume smells fragrant.

The standard inform commands of touch, taste, smell, and listen to (or hear) have been altered to implement reporting these properties to the player.

In addition to this, an object can be strong_smelling or weak_smelling (the default is weak smelling). An object can also be loud_sounding or soft_sounding (the default is soft_sounding).

An audible object is defined by the game as one that has a sound other than the default of "silence". A noisy object is one that is loud_sounding.

A pungent object is defined by the game as one that is strong_smelling. 

Pungent objects have their smell reported in the location of the room after a "look". The same goes for any noisy objects.

Example: ** Silk And Cheese Time - A small extension providing some objects with sensory information for you to play around with.

	*: "Silk And Cheese Time" by ShadowChaser

	Include Senses by ShadowChaser.

	The White Room is a room. "You are in a plain white room.".

	The mouldy cheese is in the White Room. "A piece of mouldy cheese lies on the floor.". The odour is "cheesy". The flavour is "rancid". The feeling is "oily". The description is "This is very mouldy.". The cheese is strong_smelling.

	The silk scarf is in the White Room. "On the floor is a slik scarf.". The odour is "faintly of perfume". The feeling is "soft".

	The metronome is in the White Room. "A metronome sits here.". The sound is "tick tock".

	The alarm clock is in the White Room. "An alarm clock is here.". The sound is "ringing". The alarm clock is loud_sounding.

	Test me with "smell cheese / taste cheese / touch cheese / listen to cheese / touch scarf / taste scarf / smell scarf / listen to scarf / taste clock / taste metronome / touch clock / touch metronome / smell clock / smell metronome / listen to clock / listen to metronome".

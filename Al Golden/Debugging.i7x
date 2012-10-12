Version 10 of Debugging by Al Golden begins here.

placing is an action applying to nothing.
understand "places" as placing.

before placing: 
say "You have visited the following rooms:[paragraph break]". 

carry out placing:
	repeat with item running through visited rooms:	
		say "[item] [line break]";
	
objecting  is an action applying to nothing.
understand "objects" as objecting

instead of objecting:
	say  "You have handled the following items: [line break]";
	repeat with obj running through  handled things:
		say "the [obj]";
		
After printing the name of something (called item) while objecting: 
if the location of the item is nothing 
begin; 
say " (lost)[line break]"; 
otherwise if the player carries the item; 
say " (carried)[line break]";  
otherwise if the player wears the item;
say " (worn)[line break]"; 
otherwise; 
say " (in [the location of the item])[line break]";   
end if. 

Section New Debug Features Not For Release

rooming is an action applying to nothing.
understand "rooms" as rooming.

report rooming:	
	say "List of rooms in the game: [line break]";
	repeat with rm running through rooms:	
		say "[rm] [line break]";
		
thinging is an action applying to nothing .
understand "objects" or "things" as thinging.

report thinging:
	say "[line break]List of objects in the game: [line break]";
	repeat with obj running through things which are not a person:
		say "[obj]";
		
mnpcing is an action applying to nothing.
understand "men" or "males"  as mnpcing.

wnpcing is an action applying to nothing.
understand "women" or "females"  as wnpcing.

report mnpcing:
	say "list of Male NPCs in the game: [line break]";
	repeat  with m running through things which are a man:
		say "[m]";

after printing the name of a man (called guy) while mnpcing:
say " (in [the location of the guy])[line break]";   
		
report wnpcing:
	say "list of Female NPCs in the game: [line break]";
	repeat  with w running through things which are a woman:
		say "[w]";

after printing the name of a woman (called gal) while wnpcing:
say " (in [the location of the gal])[line break]";   
		
After printing the name of something (called item) while thinging: 
if the location of the item is nothing 
begin; 
say " (lost)[line break]"; 
otherwise if the player carries the item; 
say " (carried)[line break]";  
otherwise if the player wears the item;
say " (worn)[line break]"; 
otherwise; 
say " (in [the location of the item])[line break]";   
end if. 

backdropping is an action applying to nothing.
understand "backdrops" as backdropping.

report backdropping:
	say "list of backdrops in the game: [line break]";
	repeat with bd running through backdrops:
		say "[bd] [line break]"

regeing is an action applying to nothing.
understand "regions" as regeing.

report regeing:
	say "list of regions in the game. [line break]";
	repeat with r running through regions:
		say "[r] [line break]"

conting is an action applying to nothing.
understand "containers" as conting.

report conting:
	say "list of containers in the game: [line break]";
	repeat with c running through containers:
		say "[c]"

after printing the name of a container (called receptacle) while conting:
say " (in [the location of the receptacle])[line break]";  

supping is an action applying to nothing.
understand "supporters" as supping

report supping:
	say "list of supporters in the game: [line break]";
	repeat with su running through supporters:
		say "[su][line break]"
 	

crittering is an action applying to nothing.
understand "animals" as crittering.

report crittering:
	say "list of animals in the game: [line break]";
	repeat with c running through animals:
		say "[c][line break]"
 
	
Debugging ends here.

---- DOCUMENTATION ----

Changes to Version 10

The record-replay function has been stripped out of this extension.
If you want those features then install Record-Replay by Al Golden.

IN addition a "supporters" verb has been added to list supporters 
for the author during the debugging process which like the others
will not be used in a release version. 

This version adds the following that will NOT be included in released games: 
a list of rooms,a list of objects and locations,
a list of male NPCs and locations  
and a list of female NPCs and locations.

To see the rooms: Type "ROOMS"

To see the objects: type "THINGS".

To see Male NPCs: type "MEN" or "MALES"

To see Female NPCs: type "WOMEN" or "FEMALES" 

Tp see animals: type "ANIMALS"

To see containers: type "CONTAINERS"

To see supporters: type "SUPPORTERS"

To see backdrops: type "BACKDROPS"

To see regions: type "REGIONS"

Example: ** Debug Test - a small program for testing the extension.

	*: "Debug Test"

	include Debugging by Al Golden.

	rule for deciding whether all includes a person:it does not.

	Starter is a room.

	a man called Joe is in Starter.
	a woman called Flo is in Starter.
	a box, a lox, and a pox are in Starter.
	the box is a container.
	a supporter called a platform is in Starter.

	Ender is north of Starter. 
	a man called Mike is in Ender. 
	a woman called Betty is in Ender.
	a dog, a frog, and a log are in Ender.
	a container called a chest is in Ender.
	a supporter called a stage is in Ender.

	Easter is east of Starter. 
	a man called Bart is in Easter. 
	a woman called Mary is in Easter.
	a pill, a hill, and a thrill are in Easter.
	a container called a basket is in Easter.
	a supporter called a chair is in Easter.

	Wester is west of Starter. 
	a man called Steve is in Wester.
	a woman called Celia is in Wester.
	a fish, a wish, and a dish are in Wester.
	a container called a barrel is in Wester.
	a supporter called a couch is in Wester.

	test rooms with "rooms".

	test things with "things".

	test men with "men".

	test women with "women".

	test places with "places".
	
	test objects with "objects".
	
	test containers with "containers".

	test supporters with "supporters"

	test 1 with "rooms/places".

	test 2 with "things/objects".

	test 3 with "containers".

	test 4 with "supporters".

	test 5 with "men/women".





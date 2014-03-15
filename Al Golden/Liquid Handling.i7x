Version 8 of Liquid Handling by Al Golden begins here.

"A device for the handling of liquids"

Include Version 34 of Supplemental Actions by Al Golden.

a thing is either wet,dry, or sticky.                [*aka viscous] 
a thing is either either soaked or unsoaked. [*for absorbents]
a thing is either absorbent or unabsorbent.
a thing is either floatable or unfloatable.
a thing is either floating or unfloating.
a thing is either drinkable or undrinkable.
a thing is either mixed or unmixed. 

a thing is either mopped or unmopped.
a thing is usually unmopped.

a thing is either safe or dangerous.
a thing is usually safe.

a thing is usually unsoaked. 
a thing is usually unabsorbent. 
a thing is usually dry. 
a thing is usually unmixed. 
a thing is usually unfloatable.
a thing is usually unfloating.

a thing is usually undrinkable.

a liquid is a kind of thing. 
a liquid is usually safe.
a liquid is usually wet.
a liquid is usually undrinkable.

a liquid is either poisonous or non-poisonous.
a liquid is usually non-poisonous. 

a powder is a kind of thing. 
a powder is usually dry.
a powder is usually edible.
a powder is never drinkable.

there is a container called a mixture.

a bc is a kind of container. [bc stands for bad container]
a bc is always open.
the description is
"[The noun] is totally worthless for holding anything solid or liquid."

report emptying something into a bc:
say "[The second noun] is so badly damaged that it can't contain anything.";
stop.

report inserting something into a bc:
say "[The second noun] is so badly damaged that it can't contain anything.";
stop.

report pouring something into a bc:
say "[The second noun] is so badly damaged that it can't contain anything.";
stop.

report emptying a bc:
say "The [noun] is empty since it can hold absolutely nothing.".

report emptying an open container into a bc:
say "[The second noun] is incapable of handing the contents of [the noun]".

report emptying a closed container into a bc:
say "[The noun] isn't open, and besides that,[the second noun] is incapable of 
handing the contents of [the noun]".

instead of opening a mixture,
say "Don't be ridiculous!".

instead of closing a mixture,
say "Don't be ridiculous!".

report eating a liquid which is safe:
say "Why not try drinking [the noun] instead.";
stop the action.

an absorber is a kind of container.
an absorber is usually absorbent.
an absorber is always open.

the description of an absorber is 
"Used in wiping up spilled liquids. [The noun] is [if absorber is unsoaked]dry.[otherwise]soaked with [list of things in the noun].[end if]". 

instead of opening an absorber,
say "Don't be ridiculous!".

instead of closing an absorber,
say "Don't be ridiculous!".

instead of drinking a safe thing:
say "You drink [the noun]."

instead of drinking a poisonous thing:
say "You drink [the noun] which is not conducive to your health!"; 
end the game in death;

instead of drinking a container:
say "Try drinking from the container instead.".

instead of drinking something which is not a liquid:
say "You can't drink [the noun].".

instead of drinking a liquid from a container:
if the liquid is safe begin;
say "You take a drink of [the noun] from [the second noun].";
otherwise;
say "You take a drink of [the noun] from [the second noun]. it
is poison and you are dead!";
end if.

report drinking a powder:
say "Why not try eating [the noun] instead.".

report drinking a poisonous mixture:
say "You drink [the noun] which is not conducive to your health!"; 
end the game in death.

report drinking a poisonous liquid:
say "You drink [the noun] which is not conducive to your health!"; 
end the game in death.

report drinking a safe liquid:
say "You glug down a good portion of [the noun].".

report drinking a safe liquid from a container:
say "You glug down a good portion of [the noun].".

report drinking a safe mixture:
say "You glug down a good portion [the noun].".

report drinking a poisonous mixture:
say "You drink the poisonous [noun] which is not conducive to your health.";
end the game in death.

report drinking something from a second noun:
if the noun is safe begin;
say "You glug down a good portion of [the noun].";
otherwise;
say "You have died since [the noun] was poisoned!";
end the game in death;
end if.

before drinking an undrinkable liquid:
say "You are unable to drink [the noun] for some reason." instead.

report drinking a safe liquid:
say "You drink [the noun]." instead.

report drinking a safe liquid which is in an open container:
say "You drink [the noun]." instead.

report drinking a poisonous liquid:
if the noun is in a second noun,
say "You drink the poisonous [noun] which is not conducive to your health.";
end the game in death.
 
report drinking a poisonous thing:
say "You drink the poisonous [noun] which is not conducive to your health.";
end the game in death.

report drinking a poisonous liquid from a second noun:
if the noun is in a second noun,
say "You drink the poisonous [noun] which is not conducive to your health.";
end the game in death.
 
report drinking a thing from a second noun:
say "You drink the poisonous [noun] which is not conducive to your health.";
end the game in death.
 
a container can be either watertight or leaky.
a container is usually watertight.

instead of inserting something into a closed container, 
say "[The second noun] ain't open!".

instead of inserting a floatable thing into a liquid: 
now the second noun is floating; 
now the noun is in the location; 
say "You put [the noun] into [the second noun] 
where it floats to the surface.".

instead of inserting a floatable thing into an open container: 
if a liquid is in the container, 
now the noun is in the second noun; 
now the second noun is floating; 
say "You put [the noun] into [the second noun] 
where it floats to the surface.".

instead of inserting a floatable thing into an open container:
if a liquid is not in the container, 
now the noun is in the second noun; 
say "You put [the noun] into [the second noun].".

instead of emptying a liquid into a leaky container:
say "You pour [the noun] into the [second noun] 
where it leaks out onto the floor.";
now the noun is in the location.

instead of emptying a powder into a leaky container:
say "You pour [the noun] into the [second noun] 
where it leaks out onto the floor.";
now the noun is in the location.

instead of emptying a container into a leaky container:
say "You pour [the noun] into the [second noun]. 
The [list of things in the noun] leaks out onto the floor.";
now every thing in the noun is in the location.

instead of emptying a container when a mixture is in the container:
now every thing in the container is in the location;
say "You pour the mixture onto the floor.".

instead of emptying a bc,
say "[The noun] is incapable of holding anything. You were told that!".

instead of inserting a liquid into a leaky container:
say "You pour [the noun] into the [second noun] 
where it leaks out onto the floor.";
now the noun is in the location.

instead of inserting a powder into a leaky container:
say "You pour [the noun] into the [second noun] 
where it leaks out onto the floor.";
now the noun is in the location.

instead of dropping a powder into a leaky container:
say "You drop [the noun] into [the second noun] 
and it leaks out onto the floor.";
now the noun is in the location.

instead of emptying something into a leaky container:
if the noun is not a liquid,
say "You can't do that.";

instead of emptying something into a leaky container:
if the noun is not a powder,
say "You can't do that.";

instead of emptying something into a leaky container:
if the noun is not a container,
say "You can't do that.";

instead of emptying a closed container 
into a leaky container:
say "[The noun] ain't open!".

instead of emptying a closed container 
into a watertight container:
say "[The noun] ain't open!".

squeezing out is an action applying to one thing. 

understand "squeeze out [something]" as squeezing. 
understand "squeeze [something] out" as squeezing. 
understand "wring out [something]" as squeezing. 
understand "wring [something] out" as squeezing.

squeezing it into is an action applying to two things.
understand "squeeze [something] in/into[something]" as squeezing it into. 
understand "wring [something] in/into [something]"  as squeezing it into.

squeezing it onto is an action applying to two things. 
understand "squeeze [something] on/onto [something]" as squeezing it onto. 
understand "wring [something] on/onto [something]" as squeezing it onto.

mopping is an action applying to one thing. 
understand "mop [something]" as mopping.
understand "mop up [something]" as mopping. 
understand "mop [something] up" as mopping.

instead of mopping something,
say "What do you want to mop [the noun] with?".

mopping it with is an action applying to two things. 
understand "mop [something] with [something]" as mopping it with.
understand "sop [something] with [something]" as mopping it with.  
understand "mop up [something] with [something]" as mopping it with. 

understand "sop up [something] with [something]" as mopping it with. 

understand "mop [something] up with [something]" as mopping it with.
understand "sop [something] up with [something]" as mopping it with.
understand "wipe [something] with [something]" as mopping it with. 
understand "wipe up [something] with [something]" as mopping it with. 
understand "wipe [something] up with [something]" as mopping it with.

wetting is an action applying to one thing. 

instead of inserting an absorber into a liquid:
try mopping the second noun with the noun. 

instead of wetting something,
say "What do you want to wet [the noun] with?".

wetting it with is an action applying to two things.

understand "moisten [something] in [something]" as wetting it with. 
understand "moisten [something] with [something]" as wetting it with.
understand "wet [something] in [something]" as wetting it with.
understand "wet [something] with [something]" as wetting it with.
understand "dip [something] in/into [something]" as wetting it with.
understand "dampen [something] in  [something]" as wetting it with. 
understand "dampen [something] with [something]" as wetting it with.
understand "soak [something] in [something]" as wetting it with. 
understand "soak up [something] with [something]" as wetting it with. 
understand "soak [something] up with [something]" as wetting it with.

instead of mopping something with an unabsorbent thing, 
say "[The noun] can not be mopped up with [the second noun].".

instead of mopping something which is mopped with an absorbent thing,
say "You've already mopped up [the noun].".

instead of mopping something in a container 
which is not an absorber with an absorbent thing:
say "But [the noun] hasn't been spilled!";
stop the action.

instead of mopping something with an absorber:
now the second noun is soaked; 
now the noun is in the second noun;
now the noun is mopped; 
say "You mop up [the noun] with [the second noun].".

instead of mopping a powder with something: 
say "You can not mop up powders.".

instead of mopping something with an unabsorbent thing, 
say "[The second noun] is not capable of mopping [the noun].".

instead of wetting an absorber which is unsoaked with something:
now the noun is soaked; 
now the second noun is in the noun; 
say "You wet [the noun] with [the second noun].".

instead of wetting an unabsorbent thing with something, 
say "You can't wet that.".

instead of wetting an absorber with a liquid:
now the noun is soaked;
now the second noun is in the noun;
say "You wet [the noun] with the [second noun]".

instead of squeezing an unsoaked absorber:
say "There is nothing in [the noun] to squeeze out.".

instead of squeezing an unsoaked absorber into an open container:
if the noun is unsoaked,
say "There is nothing in [the noun] to squeeze out.".

before taking something which is a liquid:
say "[The noun] runs thru your fingers.";
stop the action.

report squeezing something which is a liquid:
say "[The noun] runs thru your fingers.".

report squeezing something which is a powder:
say "[The noun] runs thru your fingers.".

instead of squeezing something which is not an absorber:
if the noun is not a liquid and the noun is not a powder,
say "You squeeze [the noun] but nothing happens.".

instead of squeezing a soaked absorber:
now the noun is unsoaked;
now every thing in the noun is unmopped; 
say "You squeeze [the list of things in the noun] out onto the floor."; 
now every thing in the noun is in the location.

instead of squeezing a soaked absorber into an open container: 
now the noun is unsoaked;
now every thing in the noun is unmopped; 
say "You squeeze [the noun] into [the second noun]."; 
now every thing in the noun is in the second noun.

instead of squeezing a soaked absorber into a closed container, 
say "[The second noun] ain't open!".

instead of squeezing a soaked absorber onto something:
if the second noun is not a supporter,
say "[The second noun] can not hold the contents of the [noun].".
instead of squeezing a soaked absorber onto a supporter: 
now the noun is unsoaked;
now every thing in the noun is unmopped; 
now every thing in the noun is on the second noun; 
say "You squeeze [the noun] onto [the second noun]."; 

Liquid Handling ends here.

---- DOCUMENTATION ----

This extension is for handling of liquids:

Basically mixing,drinking,and transfering from 
one container to another container or a location.

It now requires Version 34 of Supplemental Actions also by myself.

INSTRUCTIONS:

You will need to denote that a substance is a liquid and 
the liquid is either wet or dry. A dry liquid is termed a powder.

Liquids need to made drinkable otherwise they can't be drunk.

Absorbent things like sponges need to be called absorbers.

An example of this is as follows:

An absorber called a sponge is in the Closet. 

if you want to mix more than two liquids or powders together
you need to do it in stages. See the Example "A Bunch of Goodies"

What you basically do is call the first mixture a "cocktail"
or whatever name you want to give it, then you can mix the "cocktail"
with the third liquid. If more liquids are desired to be mixed you
need to mix the "new cocktail" with the next liquid you desire etc.

If you want an object to float then designate it as "floatable".

If you want a leakable container you need to designate it as "leaky".

a container that will hold absolutely nothing needs to be designated a "bc",
and you will not be able to insert or pour anything into it. 
It remains perpetually
empty.

A mixture of two or more things can be either poisonous or safe.

Things are safe, but can be poisonous if so designated by the author.

It is highly advised to print out this entire extension and study it.

Comments,suggestions etc can be posted to raif and I'll respond accordingly.

Example: * A Bunch of Goodies - 1st example for testing the extension.

	*:"A Bunch of Goodies"

	Include Liquid Handling by Al Golden.

	use full-length room descriptions, American dialect, 
	no scoring, and the serial comma.

	rule for printing room description details:stop.

	after printing the name of an open container,
	omit contents in listing.

	after printing the name of a supporter:
	omit contents in listing.

	an absorber called a sponge is carried by the player.

	Starter is a room.
	a bc called a veebler is in Starter.

	a supporter called a table is in Starter.  
	the description of the table is "Its a plain table." 
	
	an open transparent container called a glass is on the table.

	an open container called a bottle is on the table.
	an open container called a carafe is on the table. 
	an open container called a carton is on the table.
	an open container called a canister is on the table.

	a safe drinkable liquid called the water is in the bottle. 
	the indefinite article of the water is "some". 
	the description of the water is "Plain old H2O.".	

	a safe drinkable liquid called the seltzer is in the carafe. 
	the indefinite article of the seltzer is "some".
	the description of the seltzer is "Bubbly water.".

	a drinkable liquid called the soda is in the carton.
	the indefinite article of the soda is "some". 
	the description of the soda is 
	"Tastes like orange soda but is colored pukey green.".

	a poisonous drinkable liquid called the poison is in the canister.
	the printed name is "rat poison".
	understand "rat" as the the poison.
	the description of the poison is "Rat poison in liquid form.". 
	the indefinite article of the poison is "some".

	a poisonous edible powder called the mystery powder is on the table. 
	the indefinite article of the mystery is "some". 
	the description of the powder is "It appears to be toxic ".

	instead of smelling the mystery, say "Your eyes tear up when you try to smell it.".

	an edible powder called the grape ade is on the table. 
	the description of the grape ade is "This purple powder is used to mix into Kool-Aid.". 
	the indefinite article of the grape is "some".

	a trailmix is on the table. 
	understand "trail" and "mix" as the trailmix.
	the trailmix is poisonous and edible.
	the description of the trailmix is "Nuts,fruits and poisonous berries.". 
	the indefinite article of the trail is "some".

	a delimix is on the table. 
	the printed name of the delimix is "deli mix".
	understand "deli" and "mix"as the delimix. 
	the delimix is edible.
	the description of the delimix is "Salami,baloney, pastrami, and corned beef.".
	the indefinite article of the delimix is "some".

	before eating the delimix:
	say "You nibble some of the deli mix."instead.
	
	Storage is a room. 
	a drinkable liquid called a cocktail is in Storage.
	understand "mixture" as the cocktail.

	before drinking from the glass when the cocktail is in the glass,
	try drinking the cocktail.

	instead of examining or searching the cocktail, 
	say "It's made up of [list of things in the cocktail].".

	instead of mixing the mystery powder with the poison:
	now the poison is in the cocktail;
	now the mystery is in the cocktail;
	now the cocktail is poisonous;
	now the cocktail is in the glass;
	say "You mix the powder and the poison into an even more poisonous
	cocktail and place it in the glass.".

	instead of mixing the delimix with the water:
	move the delimix to the cocktail;
	move the water to the cocktail;
	now the cocktail is safe;
	move the cocktail to the glass;
	say "You mix the delimix  and the water together into a toxic cocktail
	and place it in the glass.".
	
	instead of mixing the delimix with the soda:
	move the delimix to the cocktail;
	move the soda to the cocktail;
	now the cocktail is safe;
	move the cocktail to the glass;
	say "You mix the delimix and the soda together into a toxic cocktail
	and place it in the glass.".	

	instead of mixing the delimix with the seltzer:
	move the delimix to the cocktail;
	move the seltzer to the cocktail;
	now the cocktail is safe;
	move the cocktail to the glass;
	say "You mix the delimix and the seltzer together  into a toxic cocktail
	and place it in the glass.".

	instead of mixing the delimix with the mystery powder:
	move the delimix to the cocktail;
	move the mystery powder to the cocktail;
	now the cocktail is poisonous;
	move the cocktail to the glass;
	say "You mix the delimix and the mystery powder together into a dubious mixture
	and place it in the glass.".

	instead of mixing the trailmix with the mystery powder:
	move the trailmix to the cocktail;
	move the mystery powder to the cocktail;
	now the cocktail is poisonous;
	move the cocktail to the glass;
	say "You mix the trailmix and the mystery powder together into a dubious mixture
	and place it in the glass.".

	instead of mixing the trailmix with the water:
	move the trailmix to the cocktail;
	move the water to the cocktail;
	now the cocktail is poisonous;
	move the cocktail to the glass;
	say "You mix the trailmix  and the water together into a toxic cocktail.
	and place it in the glass.".

	instead of mixing the grape ade with the water:
	move the water to the cocktail;
	move the grape to the cocktail;
	now the cocktail is safe;
	move the cocktail to the glass;
	say "You mix the grape ade with the water into a Kool-Aid type mix.".

	instead of mixing the grape ade with the soda:
	move the soda to the cocktail;
	move the grape to the cocktail;
	now the cocktail is safe;
	move the cocktail to the glass;
	say "You mix the grape ade with the soda into a dubious mix.".

	instead of mixing the grape ade with the seltzer:
	move the seltzer to the cocktail;
	move the grape to the cocktail;
	now the cocktail is safe;
	move the cocktail to the glass;
	say "You mix the grape ade with the seltzer into a fizzy grape drink.".

	instead of mixing the mystery with the water:
	move the mystery  to the cocktail;
	move the water to the cocktail;
	now the cocktail is poisonous;
	move the cocktail to the glass;
	say "You mix the mystery powder and the water together into a toxic cocktail
	and place it in the glass.".

	instead of mixing the mystery with the soda:
	move the mystery  to the cocktail;
	move the soda to the cocktail;
	now the cocktail is poisonous;
	move the cocktail to the glass;
	say "You mix the mystery powder and the soda together into a toxic cocktail
	and place it in the glass.".

	instead of mixing the mystery with the seltzer:
	move the mystery  to the cocktail;
	move the seltzer to the cocktail;
	now the cocktail is poisonous;
	move the cocktail to the glass;
	say "You mix the mystery powder and the seltzer together into a toxic cocktail
	and place it in the glass.".
	
	instead of mixing the trail with the soda:
	move the trailmix to the cocktail;
	move the soda to the cocktail;
	now the cocktail is poisonous;
	move the cocktail to the glass;
	say "You mix the delimix and the soda together into a toxic cocktail 
	and place it in the glass.".	

	instead of mixing the trail with the seltzer:
	move the delimix to the cocktail;
	move the seltzer to the cocktail;
	now the cocktail is poisonous;
	move the cocktail to the glass;
	say "You mix the delimix and the seltzer together into a toxic cocktail
	and place it in the glass.".

	instead of mixing the grape ade  with the poison:
	now the poison is in the cocktail;
	now the grape ade is in the cocktail;
	now the cocktail is poisonous;
	now the cocktail is in the location;
	say "You mix the powder and the poison into an even more poisonous
	cocktail and place it in the glass.".

	instead of mixing the soda with the poison: 
	move the soda to the cocktail; 
	move the poison to the cocktail; 
	now the cocktail is poisonous; 
	move the cocktail to the glass; 
	say "You mix the soda and the poison into a deadly cocktail and place it in the glass!".

	instead of mixing the water with the poison: 
	move the water to the cocktail;
	move the poison to the cocktail; 
	now the cocktail is poisonous;  
	move the  cocktail to the location; 
	say  "You mix the water and the poison into a deadly cocktail  and place it in the glass!";

	instead of mixing the seltzer with the poison: 
	move the seltzer to the cocktail; 
	move the  poison to the cocktail;
	now the cocktail is poisonous;  
	move  the cocktail to the glass; 
	say  "You mix the seltzer and the poison into a deadly cocktail and place it in the glass!".
	instead of mixing the water with the seltzer: 
	move the water to the cocktail; 
	move the seltzer to the cocktail; 
	now the cocktail is safe; 
	move the cocktail to the glass;
	say "You mix the water with the seltzer into a bland cocktail and place it in the glass.".

	instead of mixing the water with the soda: 
	move the water to the cocktail; 
	move the soda to the cocktail; 
	now the cocktail is safe; 
 	move the cocktail to the glass;
	say "You mix the water with the soda into a bland cocktail and place it in the glass.".

	instead of mixing the seltzer with the soda: 
	move the seltzer to the cocktail; 
	move the soda to the cocktail; 
	now the cocktail is safe; 
	move the cocktail to the glass; 
	say "You mix the seltzer with the soda into a bland cocktail and place it in the glass.".

	instead of mixing a safe cocktail with something which is poisonous: 
	now the second noun is in the cocktail; 
	now the cocktail is poisonous;
	say "You mix [the second noun] into the cocktail.".

	instead of mixing a safe cocktail with something which is safe: 
	now the second noun is in the cocktail;
	say "You mix [the second noun] into the cocktail.".

	instead of mixing a poisonous cocktail with something: 
	now the second noun is in the cocktail; 
	say "You mix [the second noun] into the cocktail.".

	instead of mixing something with the cocktail, 
	try mixing the cocktail with the noun.

	instead of mixing the water with the grape ade,
	try mixing the grape ade with the water.

	instead of mixing the soda with the grape ade,
	try mixing the grape ade with the soda.

	instead of mixing the seltzer with the grape ade,
	try mixing the grape ade with the seltzer.

	instead of mixing the water with the mystery powder,
	try mixing the mystery powder with the water.

	instead of mixing the seltzer with the mystery powder,
	try mixing the mystery powder with the seltzer.

	instead of mixing the soda with the mystery powder,
	try mixing the mystery powder with the soda.

	instead of mixing the poison with the soda, 
	try mixing the soda with the poison.

	instead of mixing the poison with the seltzer, 
	try mixing the seltzer with the poison.

	instead of mixing the poison with the grape ade,
	try mixing the grape ade with the poison.

	instead of mixing the poison with the water, 
	try mixing the water with the poison.

	instead of mixing the poison with the mystery powder,
	try mixing the mystery with the poison.

	instead of mixing the seltzer with the water, 
	try mixing the water with the seltzer.

	instead of mixing the soda with the water, 
	try mixing the water with the soda.

	instead of mixing the soda with the seltzer,
	try mixing the seltzer with the soda.

	instead of mixing the water with the delimix,
	try mixing the delimix with the water.

	instead of mixing the soda with the delimix,
	try mixing the delimix with the soda.

	instead of mixing the seltzer with the delimix,
	try mixing the delimix with the seltzer.

	instead of mixing the water with the trailmix,
	try mixing the trailmix with the water.

	instead of mixing the soda with the trailmix,
	try mixing the trailmix with the soda.

	instead of mixing the seltzer with the trailmix,
	try mixing the trailmix with the seltzer.

	instead of mixing the mystery powder with the trailmix, 
	try mixing the trailmix with the mystery powder.

	instead of mixing the mystery powder with the delimix, 
	try mixing the delimix with the mystery powder.

	test look with "x poison/x water/x seltzer/x soda/x powder/smell powder/x grape ade/x trail/x deli".

	test drink with "drink soda/drink water/ drink seltzer/drink powder/eat powder".

	test eat with "x deli/x trail/eat delimix/eat glass/eat water/eat soda/ eat seltzer/eat trailmix".

	test mix1 with "mix trail/mix trail with deli/mix seltzer with water/drink cocktail".

	test mix2 with "purloin water,soda,seltzer/mix seltzer with soda/ drink cocktail/ purloin soda,water,seltzer/ 
	mix seltzer with water/drink cocktail/ purloin soda,water,seltzer/mix water with poison/ drink cocktail".

Example: ** A Coke & A Smile - 2nd example for testing.

	*: "A Coke & A Smile"

	use full-length room descriptions.

	Include Liquid Handling by Al Golden.

	rule for printing room description details: 
	stop the action.

	after printing the name of an open container: 
	omit contents in listing.

	instead of examining a closed container,
	say "[The noun] is closed.".

	instead of eating the sandwich: 
	remove the sandwich from play; 
	say "Delicious!".

	instead of eating a liquid: 
	say "Try DRINKING [the noun] instead.".

	Starter is a room. the printed name is "Start Room". 
	"Your standard every day start room with NO exits.".

	a supporter called a table is in Starter.

	the wall chart is a fixed in place thing in Starter.
	"You see a wall chart here".

	the description of the wall chart is 
	"A chart that tells the combinations that you can make from the items in this room."


	instead of reading the chart, say "[line break]C O M B I N A T I O N   C H A R T

	Items For Mixing

	Bleach,Cola,Potato Flakes,Kool-Aid,Oil

	***********************************

	2-item Mixtures

	bleach-cola                  -> Poison [line break] 
	bleach-flakes               -> Poison [line break] 
	bleach-Kool-Aid           -> Poison [line break] 
	bleach-oil                    -> Poison [line break] 
	cola-flakes                   -> Safe [line break] 
	cola-Kool-Aid               -> Safe [line break] 
	cola-oil                        -> Poison [line break]
	flakes-Kool-Aid           -> Safe [line break] 
	flakes-oil                     -> Poison [line break] 
	Kool-Aid-oil                -> Poison 

	***********************************

	combinations with single items

	Safe with bleach                       -> Poison[line break] 
	Safe with oil                             -> Poison[line break]
	Poison with cola                      -> Poison[line break] 
	Poison with Kool-Aid                -> Poison[line break] 
	Poison with flakes                    -> Poison[line break]".

	an open transparent container called a glass is in Starter.

	a drinkable liquid called the cola is in the glass. 
	the printed name is "Coke". 
	the indefinite article of the cola is "some". 
	the coke is edible. 
	understand "Coca-Cola" or "coke" as the cola. 
	the description of the cola is "Coca-Cola! Brown and sugary, 
	just as it's always been for 131 years. 
	[if glass is floating] There is a cork floating in the Coke[end if]".

	a leaky container called a sieve is in Starter. 
	understand "strainer" as the sieve. 

	the description of the sieve is 
	"It has a lot of holes in it and can not really hold liquids or even powders.".

	a thing called a cork is in Starter. the cork is floatable. 
	the description of the cork is "A cork from a champagne bottle .".

	instead of smelling the cork, say "It smells of expensive champagne.".

	an absorber called a sponge is in Starter.

	an absorber called a paper towel is in Starter. 

	an absorber called a Handi-Wipe is in Starter. 

	instead of emptying the sponge, 
	say "Try squeezing it instead.".

	instead of emptying the towel, 
	say "Try squeezing it instead.".

	instead of emptying the Handi-Wipe, 
	say "Try squeezing it instead.".

	a pipe wrench is in Starter. 
	the description of the wrench is 
	"Used for tightening and loosening things.".

	an edible thing called a ham sandwich is in Starter. 
	the description of the sandwich is 
	"A slab of ham between two pieces of white bread.".
	understand "white" or "bread" or "slab" as the sandwich.

	instead of eating something which is not edible, 
	say "That can't be eaten.".

	check drinking from a container: 
	if the number of things in the noun is 0, 
	say "The [noun] is empty." instead.

	instead of drinking when the noun is the can,
	try drinking the oil.

	instead of drinking when the noun is the bottle,
	try drinking the bleach.

	instead of drinking when the noun is the glass,
	try drinking the cola.

	instead of drinking the oil from the can, 
	try drinking the oil.

	instead of drinking the bleach from the bottle, 
	try drinking the bleach.

	instead of drinking the cola from the glass, 
	try drinking the cola.

	instead of drinking from the can when the oil is in the can,
	try drinking the oil.

	instead of drinking from the can when the bleach is in the can, 
	try drinking the bleach.

	instead of drinking from the can when the cola is in the can, 
	try drinking the cola.

	instead of drinking from the can when the wetmix is in the can, 
	try drinking the wetmix.

	instead of drinking from the glass when a wetmix is in the glass, 
	try drinking the wetmix.

	instead of drinking from the glass when the oil is in the glass, 
	try drinking the oil.

	instead of drinking from the glass when the bleach is in the glass,
	try drinking the bleach.

	instead of drinking from the glass when the cola is in the glass, try drinking the cola.

	instead of drinking from the bottle when a wetmix is in the bottle, 
	try drinking the wetmix.

	instead of drinking from the bottle when the oil is in the bottle,
	try drinking the oil.

	instead of drinking from the bottle when the bleach is in the bottle, 
	try drinking the bleach.

	instead of drinking from the bottle when the cola is in the bottle, 
	try drinking the cola.

	instead of drinking the cola: remove the cola from play; 
	say "You finish off the cola. Boy did that ever hit the spot!".

	a closed, openable container called a bottle is in Starter.

	instead of examining the bottle when the bottle is closed: 
	say "The label reads 'Clorox' and is closed.".

	instead of examining the bottle when the bottle is open: 
	say "The label reads 'Clorox' and is open. 
	[line break] Inside the bottle is [list of things in the bottle].".

	instead of drinking from the bottle when the bottle is open 
	and the bleach is in the bottle, try drinking the bleach.

	instead of drinking from the bottle when the bottle is open 
	and the wetmix is in the bottle, try drinking the wetmix.

	instead of drinking from the bottle when the bottle is open 
	and the drymix is in the bottle, try drinking the drymix.

	instead of drinking from the bottle when the bottle is closed,
	say "The bottle ain't open!".

	instead of drinking from the can when the can is open 
	and the oil is in the can, try drinking the oil.

	instead of drinking from the can when the can is open 
	and the wetmix is in the can, try drinking the wetmix.

	instead of drinking from the can when the can is open 
	and the drymix is in the can, try drinking the drymix.

	instead of drinking from the can when the can is closed, 
	say "The can ain't open!".

	an edible liquid called the bleach is in the bottle. 
	the bleach is poisonous and drinkable. 
	the indefinite article of the bleach is "some".
	understand "Clorox" as the bleach.

	the description of the bleach is 
	"Some of Clorox's finest bleach. 
	[if bottle is floating] There is a cork floating in the bleach.[end if]".

	instead of smelling the bottle when the bottle is closed, 
	say "You detect the faint odor of bleach.".

	instead of smelling the bottle when the bottle is open, 
	try smelling the bleach.

	a closed openable container called a can is in Starter. 
	instead of examining the can, 
	say "[if closed]It says Pennzoil on the outside. [otherwise] It says 
	Pennzoil on the outside. [line break] 
	Inside you see [a list of things in the can][end if].".

	a drinkable, poisonous liquid called the motor oil is in the can. 
	the indefinite article of the oil is "some". 
	the description of the oil is "Pennzoil 30 weight 
	[if can is floating] There is a cork floating in the oil.[end if]".

	a powder called some French's Potato Flakes is in Starter.
	the flakes is edible. 
	the description of the flakes is "Potatos turned into powdery form.". 
	understand " powder" as the flakes.

	instead of smelling the sandwich, 
	say "Pork flavor.".

	instead of smelling the Kool-Aid, 
	say "Grape flavor.".

	instead of smelling the bleach, 
	say "It stinks highly of ammonia!".

	instead of smelling the cola, 
	say "It smells just like Coca Cola!".

	instead of smelling the flakes, 
	say "They smell just like potatoes! Duuuh!";

	instead of smelling the can when the can is closed, 
	say "You detect the faint smell of something like gasoline.".

	instead of smelling the can when the can is open, 
	say "It smells almost like gasoline.".

	instead of smelling the oil, 
	say "It smells almost like gasoline.".

	instead of smelling the wetmix when the wetmix is safe, 
	say "It has a fruity flavor to it.".

	instead of smelling the wetmix when the wetmix is poisonous, 
	say "It stinks highly of ammonia and gasoline!".

	an edible powder called a Kool-Aid is in Starter.
	the indefinite article of the Kool-Aid is "some". 
	understand "powder" as the Kool-Aid.
	the description of the Kool-Aid is "Grape-flavored powder.".

	instead of eating the Kool-Aid, 
	say "You'd better mix it with something wet instead.".

	instead of eating the Flakes, 
	say "You'd better mix it with something wet instead.".

	instead of mixing the cola with the bleach, 
	try mixing the bleach with the cola.

	instead of mixing the flakes with the bleach,
	try mixing the bleach with the flakes.

	instead of mixing the oil with the bleach, 
	try mixing the bleach with the oil.

	instead of mixing the Kool-Aid with the bleach,
	try mixing the bleach with the Kool-Aid.

	instead of mixing the flakes with the cola, 
	try mixing the cola with the flakes.

	instead of mixing the Kool-Aid with the cola, 
	try mixing the cola with the Kool-Aid.

	instead of mixing the oil with the cola, 
	try mixing the cola with the oil.

	instead of mixing the flakes with the Kool-Aid,
	try mixing the Kool-Aid with the flakes.

	instead of mixing the oil with the wetmix, 
	try mixing the wetmix with the oil.

	instead of mixing the bleach with the wetmix, 
	try mixing the wetmix with the bleach.

	instead of mixing the cola with the wetmix, 
	try mixing the wetmix with the cola.

	instead of mixing the Kool-Aid with the wetmix, 
	try mixing the wetmix with the Kool-Aid.

	instead of mixing the flakes with the wetmix, 
	try mixing the wetmix with the flakes.

	instead of mixing the oil with the drymix,
	try mixing the drymix with the oil.

	instead of mixing the bleach with the drymix, 
	try mixing the drymix with the bleach.

	instead of mixing the cola with the drymix, 
	try mixing the drymix with the cola.

	instead of mixing the Kool-Aid with the drymix,
	try mixing the drymix with the Kool-Aid.

	instead of mixing a mixed thing with a mixed thing,
	say "You've already mixed those two things together.".

	instead of mixing the drymix with the wetmix, 
	try mixing the wetmix with the drymix.

	instead of drinking the drymix,
	say "You might try mixing it with something wet before doing that;".

	instead of mixing the bleach with the cola: 
	move the bleach to the wetmix;
	move the second noun to the wetmix; 
	now the second noun is mixed; 
	now the wetmix is poisonous;
	move the wetmix to the glass; 
	say "You mix the bleach and [the second noun] 
	together and now have a deadly cocktail which you place in the glass.".

	instead of mixing the bleach with the flakes: 
	move the bleach to the wetmix; 
	move the second noun to the wetmix; 
	now the second noun is mixed; 
	now the noun is mixed; 
	now the wetmix is poisonous; 
	move the wetmix to the glass; 
	say "You mix the bleach and [the second noun]
	together and now have a deadly cocktail which you place in the glass.".

	instead of mixing the bleach with the Kool-Aid: 
	move the bleach to the wetmix; 
	move the second noun to the wetmix; 
	now the second noun is mixed; 
	now the noun is mixed; now the wetmix is poisonous;
	move the wetmix to the glass; 
	say "You mix the bleach and [the second noun] together 
	and now have a deadly cocktail which you place in the glass.".

	instead of mixing the bleach with the oil: 
	move the bleach to the wetmix; 
	move the second noun to the wetmix; 
	now the second noun is mixed; 
	now the noun is mixed; 
	now the wetmix is poisonous; 
	move the wetmix to the glass; 
	say "You mix the bleach and [the second noun] 
	together and now have a deadly cocktail which you place in the glass.".

	instead of mixing the cola with the flakes:
	move the cola to the wetmix; 
	move the second noun to the wetmix; 
	now the second noun is mixed; 
	now the noun is mixed; now the wetmix is safe; 
	move the wetmix to the glass; 
	say "You mix the cola and the [second noun] 
	together and now have a terrible but drinkable 
	cocktail which you place in the glass.".

	instead of mixing the cola with the Kool-Aid: 
	move the cola to the wetmix; 
	move the second noun to the wetmix; 
	now the second noun is mixed; 
	now the wetmix is safe; 
	move the wetmix to the glass; 
	say "You mix the cola and [the second noun] 
	together and now have a terrible but drinkable cocktail which you place in the glass.".

	instead of mixing the cola with the oil: 
	move the cola to the wetmix; 
	move the second noun to the wetmix; 
	now the second noun is mixed; 
	now the wetmix is poisonous; 
	move the wetmix to the glass; 
	say "You mix the cola and [the second noun] 
	together and now have a deadly cocktail which you place in the glass.".

	instead of mixing the Kool-Aid with the oil: 
	move the Kool-Aid to the wetmix; 
	move the second noun to the wetmix; 
	now the second noun is mixed; 
	now the wetmix is poisonous; 
	move the wetmix to the glass; 
	say "You mix the bleach and [the second noun] 
	together and now have a deadly cocktail which you place in the glass.".

	instead of mixing the Kool-Aid with the flakes:
	move the Kool-Aid to the drymix; 
	move the second noun to the drymix; 
	move the drymix to the glass; 
	say "You mix the Kool-Aid and the potato flakes 
	together, and have an drinkable blend in the glass.".

	instead of mixing the wetmix with the oil: 
	remove the oil from play; 
	now the wetmix is poisonous; 
	move the wetmix to the glass; 
	say "You mix the cocktail and the oil together
	and now have an even deadlier cocktail which you place in the glass.".

	instead of mixing a wetmix with the bleach: 
	move the bleach to the wetmix; 
	now the wetmix is poisonous; 
	move the wetmix to the glass; 
	say "You mix the cocktail and the bleach 
	together and now have an even deadlier 
	cocktail which you place in the glass.".

	instead of mixing a poisonous wetmix 
	with the cola: move the cola to the wetmix; 
	move the wetmix to the glass; 
	say "You mix the cocktail and the cola together 
	and now have an even deadlier cocktail which you place in the glass.".

	instead of mixing a safe wetmix with the cola:
	move the cola to the wetmix; 
	move the wetmix to the glass; 
	say "You mix the cocktail and the cola together 
	and now have an even nastier drinkable concoction which you place in the glass.".

	instead of mixing a poisonous wetmix with the Kool-Aid: 
	move the Kool-Aid to the wetmix; 
	move the wetmix to the glass; 
	say "You mix the cocktail and the Kool-Aid together 
	and now have an even deadlier cocktail which you place in the glass."

	instead of mixing a safe wetmix with the Kool-Aid: 
	move the Kool-Aid to the wetmix;
	move the wetmix to the glass;
	say "You mix the cocktail and the Kool-Aid together 
	and now have an even nastier drinkable concoction
	which you place in the glass.".

	instead of mixing a poisonous wetmix with the flakes: 
	move the flakes to the wetmix;
	move the wetmix to the glass; 
	say "You mix the cocktail and the flakes together 
	and now have an even deadlier cocktail which you place in the glass.".

	instead of mixing a safe wetmix with the flakes:
	move the flakes to the wetmix; 
	move the wetmix to the glass; 
	say "You mix the cocktail and the flakes together 
	and now have an even nastier drinkable 
	concoction which you place in the glass.".

	the wetmix is a container. 
	the wetmix is drinkable.  
	the wetmix is safe.
	the printed name is "cocktail". 
	understand "wet" or "deadly" or "cocktail" as the wetmix.

	the drymix is a container. 
	the drymix is undrinkable. 
	the printed name is "dry blend". 
	understand "dry" or "blend" as the drymix.

	instead of examining the the drymix when the drymix is in the glass: 
	say "You have an undrinkable combination of [list of things in the drymix] in the glass.".

	instead of examining the wetmix, 
	say "A dubious cocktail of [list of things in the wetmix].".
	instead of drinking the wetmix when the wetmix is safe: 
	remove the wetmix from play; 
	say "You hold your nose and glug the wetmix down.";

	instead of drinking the wetmix when the wetmix is poisonous: 
	say "You drank a real deadly potion!"; 
	end the game in death;

	instead of mixing the drymix with the oil: 
	move the second noun to the wetmix; 
	move the Kool-Aid to the wetmix; 
	move the flakes to the wetmix; 
	remove the drymix from play; 
	move the wetmix to the glass; 
	now the wetmix is poisonous; 
	say "You combine the dry concoction with 
	[the second noun] and place it in the glass.".

	instead of mixing the drymix with the bleach: 
	move the second noun to the wetmix; 
	move the Kool-Aid to the wetmix; 
	move the flakes to the wetmix; 
	remove the drymix from play; 
	move the wetmix to the glass; 
	now the wetmix is poisonous; 
	say "You combine the dry concoction with 
	[the second noun] and place it in the glass.".

	instead of mixing the drymix with the cola: 
	move the second noun to the wetmix; 
	move the Kool-Aid to the wetmix; 
	move the flakes to the wetmix; 
	remove the drymix from play; 
	move the wetmix to the glass; 
	now the wetmix is safe; 
	say "You combine the dry concoction 
	with [the second noun] and place it in the glass.".

	instead of mixing the drymix with the Kool-Aid: 
	move the second noun to the wetmix; 
	move the Kool-Aid to the wetmix; move the flakes to the wetmix; 
	remove the drymix from play; move the wetmix to the glass;  
	now the wetmix is safe; say "You combine the dry concoction 
	with [the second noun] and place it in the glass.".

	instead of mixing the wetmix with the drymix: 
	now every thing in the drymix is in the wetmix; 
	say "You mix the dry blend into the cocktail.".

	test look with "x chart/read chart/x sandwich,x glass /x cork/ 

	x bottle/ x can/x towel/x sponge/x handi-wipe.".

	test smell with "smell sandwich/smell glass/smell cork/smell bottle/ 
	open bottle/smell bottle/smell Kool-Aid/smell flakes/smell can/
	open can/smell can/smell oil".

	test leaky with "pour cola into sieve/ open bottle/ 
	open can/pour oil into sieve/pour bleach into sieve".

	test mop with "empty cola/mop cola with towel/open bottle/ 
	empty bottle/mop bleach with  sponge/ x towel/
	x Handi-Wipe/squeeze sponge into glass/ squeeze towel into bottle".

	test mix with "open bottle/open can/mix oil with bleach/
	mix flakes with Kool-Aid/ 
	mix cola with cocktail/mix blend with cocktail".

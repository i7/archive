Version 34 of Supplemental Actions by Al Golden begins here.

"This extension adds 12 separated actions, 10 expanded actions, and 22 new actions.
It also allows an NPC to be given something, and the player to ask for items carried or worn by the NPC."

use authorial modesty.

use MAX_ACTIONS of 900.

To say verbword: (- print (address) verb_word; -).

a thing is either emptyable or unemptyable.
a thing is usually unemptyable.

a thing is either broken or unbroken.
a thing is usually unbroken.

a thing is either folded or unfolded.
a thing is usually unfolded.

a thing is either climbable or unclimbable.
a thing is usually unclimbable.

a thing is either diggable or undiggable.
a thing is usually undiggable. 

a thing is either fillable or unfillable. 
a thing is usually unfillable. 

a thing is either filled or unfilled.
a thing is usually unfilled.

a thing is either inflated or deflated. 
a thing is usually deflated.

a thing is either inflatable or uninflatable.
a thing is usually uninflatable.

a thing is either safe or dangerous.
a thing is usually safe.

a thing is either poisonous or non-poisonous.
a thing is usually non-poisonous.

a thing is either swimmable or unswimmable.
a thing is usually unswimmable.

a thing is either empty or unempty.
a thing is usually empty.

definition: a supporter is empty if the number of things on it is 0.
definition: a supporter is unempty if the number of things on it is not 0.

definition: a container is empty if the number of things in it is 0.
definition: a container is unempty if the number of things in it is not 0.

Part 01 - Attacking (expanded)

understand the command "attack" as something new. 

understand "attack [something]" as attacking.
understand "attack [someone]" as attacking. 
understand "bash [something]" as attacking.
understand "bash [someone]" as attacking. 
understand "belt [something]" as attacking.
understand "belt [someone]" as attacking.
understand "hit [something]" as attacking. 
understand "hit [someone]" as attacking.
understand "hurt [something]" as attacking. 
understand "hurt [someone]" as attacking.
understand "injure [something]" as attacking.
understand "injure [someone]" as attacking.
understand "pummel [something]" as attacking.
understand "pummel[someone]" as attacking.
understand "pound [something]" as attacking.
understand "pound [someone]" as attacking.
understand "punch [something]" as attacking. 
understand "punch [someone]" as attacking. 
understand "slap [something]" as attacking.
understand "slap [someone]" as attacking.
understand "slug [something]" as attacking.
understand "slug [someone]" as attacking.
understand "sock [something]" as attacking.
understand "sock [someone]" as attacking.
understand "smack [something]" as attacking.
understand "smack [someone]" as attacking.
understand "thwack [something]" as attacking.
understand "thwack [someone]" as attacking.
understand "wack [something]" as attacking.
understand "wack [someone]" as attacking.
understand "wallop [something]" as attacking.
understand "wallop [someone]" as attacking.
understand "wound [something]" as attacking.
understand "wound [someone]" as attacking.

attacking it with is an action applying to two things.

understand "attack [something] with [something]" as attacking it with.
understand "attack [someone] with [something]" as attacking it with. 
understand "bash [something] with [something]" as attacking it with.
understand "bash [someone] with [something]" as attacking it with. 
understand "belt [something] with [something]" as attacking it with.
understand "belt [someone] with [something]" as attacking it with.
understand "hit [something] with [something]" as attacking it with. 
understand "hit [someone] with [something]" as attacking it with.
understand "hurt [something] with [something]" as attacking it with. 
understand "hurt [someone] with [something]" as attacking it with.
understand "injure [something] with [something]" as attacking it with.
understand "injure [someone] with [something]" as attacking it with.
understand "pummel [something] with [something]" as attacking it with.
understand "pummel[someone] with [something]" as attacking it with.
understand "pound [something] with [something]" as attacking it with.
understand "pound [someone] with [something]" as attacking it with.
understand "punch [something] with [something]" as attacking it with. 
understand "punch [someone] with [something]" as attacking it with. 
understand "slap [something] with [something]" as attacking it with.
understand "slap [someone] with [something]" as attacking it with.
understand "slug [something] with [something]" as attacking it with.
understand "slug [someone] with [something]" as attacking it with.
understand "sock [something] with [something]" as attacking it with.
understand "sock [someone] with [something]" as attacking it with.
understand "smack [something] with [something]" as attacking it with.
understand "smack [someone] with [something]" as attacking it with.
understand "thwack [something] with [something]" as attacking it with.
understand "thwack [someone] with [something]" as attacking it with.
understand "wack [something] with [something]" as attacking it with.
understand "wack [someone] with [something]" as attacking it with.
understand "wallop [something] with [something]" as attacking it with.
understand "wallop [someone] with [something]" as attacking it with.
understand "wound [something] with [something]" as attacking it with.
understand "wound [someone] with [something]" as attacking it with.

report attacking something (this is the first attacking rule): 
let verbword be word number 1 in the player's command; 
say "You can't [verbword] [the noun].".

report attacking something with a second noun 
(this is the second attacking rule):
let verbword be word number 1 in the player's command; 
say "You can't [verbword] [the noun] with [the second noun].".

Part 02 - Blowing (new)

blowing is an action applying to one thing. 
blowing in is an action applying to one thing. 
blowing on is an action applying to one thing. 
blowing out is an action applying to one thing. 
blowing up is an action applying to one thing.

understand "blow [something]" as blowing.
understand "blow on [something]" as blowing on.

understand "blow out [something]" as blowing out. 
understand "blow [something] out" as blowing out.

report blowing something
(this is the blowing rule):
say "You can't blow [the noun]." 

report blowing on something
(this is the blowing on something rule):
say "You can't blow on [the noun]."

Part 03 - Breaking (separated)

breaking is an action applying to one thing.

understand the command "break" as something new. 
understand the command "crack" as something new.
understand the command "crush" as something new. 
understand the command "damage" as something new. 
understand the command "destroy" as something new. 
understand the command "fracture" as something new.
understand the command "ruin" as something new. 
understand the command "shatter" as something new.
understand the command "smash" as something new. 
understand the command "snap" as something new.
understand the command "trash" as something new.
understand the command "wreck" as something new. 
understand the command "vandalize" as something new.

understand "break [something]" as breaking. 
understand "crack [something]" as breaking.
understand "crush [something]" as breaking.
understand "damage [something]" as breaking. 
understand "destroy [something]" as breaking.
understand "fracture [something]" as breaking.
understand "ruin [something]" as breaking. 
understand "shatter [something]" as breaking.
understand "smash [something]" as breaking.
understand "snap [something]" as breaking.
understand "trash [something]" as breaking. 
understand "vandalize [something]" as breaking. 
understand "wreck [something]" as breaking.

breaking it with is an action applying to two things.
understand "break [something] with [something]" as breaking it with.
understand "crack [something] with [something]" as breaking it with.
understand "crush [something] with [something]" as breaking it with.
understand "damage [something] with [something]" as breaking it with. 
understand "destroy [something] with [something]" as breaking it with.
understand "fracture [something] with [something]" as breaking it with.
understand "ruin [something] with [something]" as breaking it with.
understand "shatter [something] with [something]" as breaking it with.
understand "smash [something] with [something]" as breaking it with.
understand "snap [something] with [something]" as breaking it with.
understand "trash [something] with [something]" as breaking it with. 
understand "vandalize [something] with [something]" as breaking it with. 
understand "wreck [something] with [something]" as breaking it with.

report breaking something
(this is the breaking rule):
say "You can't [verbword] [the noun].".

report breaking something with a second noun
(this is the second breaking rule):
say "You can't [verbword] [the noun] with [the second noun].".

Part 04 - Burning

burning it with is an action applying to two things.
understand "burn [something] with [something]" as burning it with.

report burning something with a second noun
(this is the burning something with something rule):
say "You can't burn [the noun] with [the second noun].".

Part 05 - Buying and Selling (new)

buying it from is an action applying to two things.
understand "buy [something] from [something]" as buying it from.
understand "purchase [something] from [something]" as buying it from.

selling is an action applying to one thing.
understand "sell [something]" as selling.

selling it to is an action applying to two things.
understand "sell [something] to [something]" as selling it to.

report buying something
(this is the buying rule):
say "You can't buy [the noun].".

report buying something from a second noun:
say "Don't be ridiculous! You can't buy [the noun] from [the second noun]!".

report selling something
(this is the first selling rule):
say "Who do you want to sell [the noun] to?".

report selling something to something
(this is the second  selling rule):
say "You can't sell [the noun] to [the second noun].".

Part 06 - Cleaning (separated)

understand the command "clean" as something new.
understand the command "dust" as something new.
understand the command "polish" as something new.
understand the command "rub" as something new.
understand the command "scrub" as something new.
understand the command "shine" as something new.
understand the command "sweep" as something new.
understand the command "wipe" as something new.

understand "clean [something]" as cleaning.
understand "dust [something]" as dusting.
understand "polish [something]" as polishing.
understand "rub [something]" as rubbing.
understand "scrub [something]" as scrubbing.
understand "shine [something]" as shining.
understand "sweep [something]" as sweeping.
understand "wipe [something]" as wiping.

cleaning is an action applying to one thing.
dusting is an action applying to one thing.
polishing is an action applying to one thing.
scrubbing is an action applying to one thing.
shining is an action applying to one thing.
sweeping is an action applying to one thing.
wiping is an action applying to one thing.

cleaning it with is an action applying to two things.
dusting it with is an action applying to two things.
polishing it with is an action applying to two things.
rubbing it with is an action applying to two things.
scrubbing it with is an action applying to two things.
shining it with is an action applying to two things.
sweeping it with is an action applying to two things.
wiping it with is an action applying to two things.

understand "clean [something] with [something]" as cleaning it with.
understand "dust [something] with [something]" as dusting it with.
understand "polish [something] with [something]" as polishing it with.
understand "rub [something] with [something]" as rubbing it with.
understand "scrub [something] with [something]" as scrubbing it with.
understand "shine [something] with [something]" as shining it with.
understand "sweep [something] with [something]" as sweeping it with.
understand "wipe [something] with [something]" as wiping it with.

report cleaning something
(this is the cleaning rule):
say "You can't clean [the noun].".

report dusting something
(this is the dusting rule):
say "You can't dust [the noun]."

report polishing something
(this is the polishing rule):
say "You can't polish [the noun]."

report rubbing something
(this is the rubbing rule):
say "You can't rub [the noun]."

report scrubbing something
(this is the scrubbing rule):
say "You can't scrub [the noun]."

report shining something
(this is the shining rule):
say "You can't shine [the noun]."

report sweeping something
(this is the sweeping rule):
say "You can't sweep [the noun]."

report wiping something
(this is the wiping rule):
say "You can't wipe [the noun]."

report cleaning something with something
(this is the cleaning something with something rule):
say "You can't clean [the noun] with [the second noun]."

report dusting something with something
(this is the dusting something with something rule):
say "You can't dust [the noun] with [the second noun]."

report polishing something with something
(this is the polishing something with something rule):
say "You can't polish [the noun] with [the second noun]."

report rubbing something with something
(this is the rubbing something with something rule):
say "You can't rub [the noun] with [the second noun]."

report scrubbing something with something
(this is the scrubbing something with something rule):
say "You can't scrub [the noun] with [the second noun]."

report shining something with something
(this is the shining something with something rule):
say "You can't shine [the noun] with [the second noun]."

report sweeping something with something
(this is the sweeping something with something rule):
say "You can't sweep [the noun] with [the second noun]."

report wiping something with something
(this is the wiping something with something rule):
say "You can't wipe [the noun] with [the second noun].".

Part 07 - Clearing (separated)

understand the command "clear" as something new.
clearing is an action applying to one thing.
understand "clear [something]" as clearing.

clearing it from is an action applying to two things.
understand "clear [something] from [something]" as clearing it from.
understand "clear [something] out of [something]" as clearing it from.


report clearing something
(this is the clearing rule):
say "You can't clear [the noun].".

report clearing something from a second noun
(this is the second clearing rule):
say "You can't clear [the noun] from [the second noun].".

Part 08 - Climbing (expanded)

understand the command "climb" as something new.

climbing in is an action applying to one thing.
climbing on is an action applying to one thing.
climbing out is an action applying to one thing.
climbing up is an action applying to one thing.
climbing down is an action applying to one thing.
climbing over is an action applying to one thing.
climbing through is an action applying to one thing.
climbing under is an action applying to one thing.

understand "climb [something]" as climbing.
understand "climb in/into [something]" as climbing in.
understand "climb on/onto [something]" as climbing on.
understand "climb through [something]" as climbing through.
understand "climb thru [something]" as climbing through.
understand "climb out [something]" as climbing out.
understand "climb out of [something]" as climbing out.
understand "get out of [something]" as climbing out.

understand "climb up [something]" as climbing up.
understand "climb down [something]" as climbing down.
understand "climb over [something]" as climbing over.
understand "climb under [something]" as climbing under.

report climbing (this is the climbable rule):
say "You climb [the noun]."

report climbing over a climbable thing
(this is the climb over a climbable thing rule):
say "You  climb over [the noun].";

report climbing under something
(this is the climb under something rule):
say "You climb under [the noun].";

report climbing in an enterable container
(this is the climbing in an enterable container rule):
	if the noun is open:
		say "You climb into [the noun].";
		now yourself is in the noun;
	otherwise:
		say "You need to open [the noun] before you can do that.".

report climbing on an enterable supporter
(this is the climbing on an enterable supporter rule):
say "You climb onto [the noun].";
now yourself is on the noun.

report climbing in something
(this is the climbing in something rule):
	if the noun is not enterable:
		say "You can't climb into [the noun].".

report climbing on something
(this is the climbing on something rule):
	if the noun is not enterable:
		say "You can't climb onto [the noun].".

report climbing an unclimbable thing
(this is the unclimbable thing rule):
say "You can't climb [the noun]." .

report climbing up an unclimbable thing
(this is the climbing up an unclimbable thing rule):
say "You can't climb up [the noun].".

report climbing down an unclimbable thing
(this is the climbing down an unclimbable thing rule):
say "You can't climb down [the noun].".

report climbing through an unclimbable thing
(this is the climbing through an unclimbable thing rule):
say "You can't climb through [the noun].".

report climbing out something
(this is the climbing out rule):
say "You  climb out of [the noun].";
now yourself is in the holder of the noun.


Part 09 - Cutting (expanded) 

understand the command "cut" as something new.
understand the command "chop" as something new.
understand the command "slice" as something new.
understand the command "nick" as something new.
understand the command "prune" as something new.
understand the command "sever" as something new.
understand the command "slit" as something new.
understand the command "slash" as something new.
understand the command "lacerate" as something new.
understand the command "lance" as something new.
understand the command "pierce" as something new.
understand the command "scratch" as something new.
understand the command "graze" as something new.
understand the command "incise" as something new.

cutting is an an action applying to one thing.
chopping is an action applying to one thing.
slicing is an action applying to one thing.
nicking is an action applying to one thing.
pruning is an action applying to one thing.
severing is an action applying to one thing.
slitting is an action applying to one thing.
slashing is an action applying to one thing.
lacerating is an action applying to one thing.
lancing is an action applying to one thing.
piercing is an action applying to one thing.
scratching is an action applying to one thing.
grazing is an action applying to one thing.
incising is an action applying to one thing.

understand "cut [something]" as cutting.
understand "chop [something]" as cutting.
understand "slice [something]" as cutting.
understand "nick [something]" as cutting.
understand "prune [something]" as cutting.
understand "sever [something]" as cutting.
understand "slit [something]" as cutting.
understand "slash [something]" as cutting.
understand "lacerate [something]" as cutting.
understand "lance [something]" as cutting.
understand "pierce [something]" as cutting.
understand "scratch [something]" as cutting.
understand "graze [something]" as cutting.
understand "nick [something]" as cutting.
understand "incise [something]" as cutting.

cutting it with is an action applying to two things.
understand "cut [something] with [something]" as cutting it with. 
understand "chop [something] with [something]" as cutting it with. 
understand "slice [something] with [something]" as cutting it with. 
understand "nick [something] with [something]" as cutting it with.
understand "prune [something] with [something]" as cutting it with. 
understand "sever [something] with [something]" as cutting it with. 
understand "slit [something] with [something]" as cutting it with. 
understand "slash [something] with [something]" as cutting it with.
understand "lacerate [something] with [something]" as cutting it with. 
understand "lance [something] with [something]" as cutting it with.
understand "pierce [something] with [something]" as cutting it with.
understand "scratch [something] with [something]" as cutting it with. 
understand "graze [something] with [something]" as cutting it with. 
understand "nick  [something] with [something]" as cutting it with. 
understand "incise [something] with [something]" as cutting it with. 

report cutting something:
let verbword be word number 1 in the player's command; 
say "You can't [verbword] [the noun].".

report cutting something with a second noun:
let verbword be word number 1 in the player's command; 
say "You can't [verbword] [the noun] with [the second noun].".

report deflating an inflated thing:
now the noun is deflated;
say "You deflate [the noun]." instead.

report deflating an uninflatable thing:
say "Since [the noun] is uninflatable to begin with, 
that's not possible." instead.

Part 10 - Digging (new)

digging is an action applying to one thing. 
understand "dig [something]" as digging.
understand "excavate [something]" as digging.

digging it with is an action applying to two things. 
understand "dig [something] with[something]" as digging it with. 

digging it in is an action applying to two things.
understand "dig [something] in [something]" as digging it in.

digging in is an action applying to one thing.
understand "dig in [something]" as digging in.

report digging an undiggable thing
(this is the digging an undiggable thing rule):
say "You can't dig [the noun]." instead.

report digging in an undiggable thing
(this is the digging in an undiggable thing rule):
 say "You can't dig in [the noun]." instead.

report digging an undiggable thing with something
(this is the digging an undiggable thing with something rule):
say "You can't dig [the noun] with [the second noun]." instead.

report digging something which is diggable 
(this is the digging a diggable thing rule):
say "You can't dig [the noun].".
 
report digging a diggable thing with something
(this is the digging a diggable thing with something rule):
say "You can't dig [the noun] with the [second noun]."

report digging something in a second noun
(this is the digging something in a second noun rule):
say "You can't dig [a noun] in [the second noun].".

Part 11 - Diving (new)

diving is an action applying to nothing.
understand "dive" as diving.

diving in is an action applying to one thing.
diving off is an action applying to one thing.

diving from is an action applying to one thing.

understand "dive in/into [something]" as diving in.
understand "dive off [something]" as diving off.
understand "dive off of [something]" as diving off.
understand "dive from [something]" as diving from.

report diving (this is the diving rule):
say "You can't dive." instead.

report diving in something (this is the diving in rule):
say "You can't dive into [the noun]." 

report diving off something (this is the diving off rule):
say "You can't dive off [the noun]."  

report diving from something (this is the diving from rule):
say "You can't dive from [the noun]." 

Part 12 - Drinking (expanded)

drinking from is an action applying to one thing.
understand "drink from [something]" as drinking from.

drinking it from is an action applying to two things.
understand "drink [something] from [something]" as drinking it from.

report drinking from something
(this is the drinking from something rule):
say "You can't drink from [the second noun].".

report drinking something from a second noun 
(this is the drinking from a second noun rule):
say "You can't drink [the noun] from [the second noun].". 

instead of drinking something
(this is the can't drink rule):
say "You can't drink that.".

Part 13 - Dropping (expanded)

understand the command "drop" as something new.
understand "drop [things preferably held]" as dropping.

instead of dropping something:
now the noun is in the location;
say "Dropped."

dropping it into is an action applying to two things. 
understand "drop [things preferably held] in/into [something]" as dropping it into.

dropping it onto is an action applying to two things. 
understand "drop [things preferably held] on/onto [something]" as dropping it onto.

dropping it down is an action applying to two things. 
understand "drop [things preferably held] down [something]" as dropping it down.

dropping it under is an action applying to two things.
understand "drop [things preferably held] under [something]" as dropping it under.

report dropping something into a second noun
(this is the dropping something into a second noun rule):
say "You can't drop [the noun] into [the second noun].".

report dropping something onto a second noun
(this is the droppng something onto a second noun rule):
say "You can't drop [the noun] into [the second noun].".

report dropping something down a second noun
(this is the dropping something down a second noun rule):
say "You can't drop [the noun] down [the second noun].".

report dropping something under a second noun
(this is the dropping something under second noun rule):
say "You can't drop [the noun] under [the second noun].".
				
Part 14 - Eating (no longer requires holding)
		
understand the command "eat" as something new.
understand "eat [things]" as eating.

report eating something (this is the eating rule):
say "You can't eat that!"

Part 15 - Emptying (new)

emptying is an action applying to one thing.
understand "empty [something]" as emptying.
understand "empty [container]" as emptying.
understand "empty [something] out" as emptying. 
understand "empty [container] out" as emptying. 
understand "empty out [something]" as emptying.
understand "empty out [container]" as emptying.

emptying it into is an action applying to two things. 
understand "empty [container] in/into [something]" as emptying it into. 
understand "empty [something] in/into [something]" as emptying it into.

emptying it onto is an action applying to two things. 
understand "empty [container] on/onto [something]" as emptying it onto. 
understand "empty [something] on/onto [something]" as emptying it onto.
emptying it from is an action applying to two things. 

understand "empty [things] from [something]" as emptying it from.
understand "empty [things] from [container]" as emptying it from.

emptying it out of is an action applying to two things.
understand "empty [things] out of [something]" as emptying it out of.
understand "empty [things] out of [container]" as emptying it out of.

understand the command "dump" as "empty".

before emptying a closed container
(this is the can't empty a closed container rule):
say "You need to open [the noun] before you can empty it." instead.

before emptying something which is not a container
(this is the can't empty a non-container rule):
say "Since [the noun] isn't a container, you can't empty it." instead.

before emptying an emptyable thing
(this is the first unemptyable rule):
say "You can't empty [the noun]." instead.

before emptying an emptyable thing onto a second noun
(this is the second unemptyable rule):
say "You can't empty [the noun] onto [the second noun]." instead.

before emptying an emptyable thing into a second noun
(this is the third unemptyable rule):
say "You can't empty [the noun] into [the second noun]." instead.

before emptying an empty container
(this is the can't empty an empty container rule):
say "[The noun] has nothing in it to empty." instead.

before emptying something out of an empty container
(this is the first can't empty something which is not in a container rule):
if the noun is not in the second noun,
say "The [noun] isn't in [the second noun]." instead.

before emptying something from an empty container
(this is the second can't empty something which is not in a container rule):
if the noun is not in the second noun,
say "The [noun] isn't in [the second noun]." instead.

before emptying an unempty container into a second noun
(this is the second noun isn't a container rule):
if the second noun is not a container,
say "Since [the second noun] isn't a container, it can't hold anything." instead

before emptying an unempty container into a second noun
(this is the first emptying it into rule):
if the noun is closed,
say "[The noun] isn't open." instead.

before emptying an unempty container into a second noun
(this is the second emptying it into rule):
if the second noun is closed,
say "[The second noun] isn't open." instead.

before emptying an unempty container into a second noun
(this is the third emptying it into rule):
say "You empty [the list of things in the noun] into [the second noun] .";
now all the things in the noun are in the second noun instead.

before emptying an unempty container onto a second noun
(this is the second noun isn't a supporter rule):
if the second noun is not a supporter,
say "Since [the second noun] isn't a supporter, it can't hold anything." instead.

before emptying an unempty container onto a second noun
(this is the second noun is a supporter rule):
if the second noun is  a supporter,
say "You empty the [list of things in the noun] onto [the second noun].";
now everything in the noun is on the second noun instead.
		
before emptying something from an unempty container 
(this is the first emptying an unempty container rule):
	if the number of things in the second noun is 1:
		say "You [verbword] the last item out of the [noun]. It's now empty.";
		now the second noun is empty instead;	
		now the noun is in the location;
	otherwise:
		now the noun is in the location;
		say "You [verbword] the [the noun] from [the second noun]. 
		There are still other things left in [the second noun]." instead.	
					
after inserting something into an open container:
now the second noun is unempty;
say "You [verbword] [the noun] into [the second noun].";

check inserting something into a closed container:
say "[The second noun] isn't open!" instead.
	
before emptying an open unempty emptyable container
(this is the second emptying an unempty container rule):
say "You [verbword] [the list of things in the noun] out onto the ground.";
now the noun is empty;
now all the things in the noun are in the location instead.

Part 16 - Extinguishing (new)

extinguishing is an action applying to one thing. 
understand "extinguish [something]" as extinguishing. 
understand "put [something] out" as extinguishing.
understand "put out [something]" as extinguishing.
understand "douse [something]" as extinguishing. 
understand "ext [something]" as extinguishing.

report extinguishing something
(this is the extinguishing noun rule):
say "You can't extinguish [the noun].".

Part 17 - Feed (separated)

understand the command "feed" as something new.
feeding is an action applying to one thing.
understand "feed [something]" as feeding.
understand "feed [someone]" as feeding.

feeding it to is an action applying to two things.
understand "feed [something] to [something]" as feeding it to.
understand "feed [something] to [someone]" as feeding it to.
understand "feed [someone] to [something]" as feeding it to.

feeding it with is an action applying to two things.
understand "feed [something] with [something]" as feeding it with.
understand "feed [something] with [someone]" as feeding it with.
understand "feed [someone] with [something]" as feeding it with.

report feeding
(this is the feeding rule):
say "You can't feed [the noun].".

report feeding something to a second noun
(this is the feeding something to something rule):
say "You can't feed [the noun] to [the second noun]. " instead

report feeding something with a second noun
(this is the feeding something with something rule):
say "You can't feed [the noun] with [the second noun]." instead. 

Part 18 - Filling (new)

understand the command "fill" as something new.
filling is an action applying to one thing. 

understand "fill [something]" as filling.

check filling a closed container
(this is the can't fill a closed container rule):
say "Since [the noun] is closed, you can't fill it." instead.

check filling a supporter
(this is the can't fill a supporter rule):
say "For the most part, supporters can't be filled." instead.

check filling a fillable thing
(this is the what do you want to fill rule):
say "What do you want to fill [the noun] with?" instead

check filling an unfillable thing
(this is the can't fill an unfillable thing rule):
say "[The noun] can't be filled." instead.

check filling an unfillable thing with something 
(this is the can't fill an unfillable thing with something rule):
say "You can't fill [the noun]." instead.

check filling an unfillable thing from something
(this is the can't fill an unfillable thing from something rule): 
say "You can't fill [the noun]." instead.

check filling a filled thing from something
(this is the first already filled rule):
say "[The noun] is already filled" instead.

check filling a filled thing with something
(this is the second already filled rule):
say "[The noun] is already filled with [a list of things in the noun].";

filling it from is an action applying to two things. 
understand "fill [something] from [something]" as filling it from.

filling it with is an action applying to two things. 
understand "fill [something] with [something]" as filling it with.

instead of filling an unfilled thing with something
(this is the filling an unfilled thing with something rule):
now the noun is filled;
now the second noun is in the noun;
now the second noun is filled;
say "You fill [the noun] with [the second noun]."

instead of filling an unfilled thing from something
(this is the filling an unfilled thing from something rule):
now the noun is filled;
now everything in the second noun is in the noun;
say "You fill [the noun] from [the second noun]."

Part 19 - Fixing (new) 

understand the command "fix" as something new.
fixing is an action applying to one thing.
understand "fix [something]" as fixing.
understand "repair [something]" as fixing.
understand "mend [something]" as fixing.

fixing it with is an action applying to two things.
understand "fix [something] with [something]" as fixing it with.
understand "repair [something] with [something]" as fixing it with.
understand "mend [something] with [something]" as fixing it with.

report fixing something:
say "You can't [verbword] [the noun]."

report fixing something with a second noun:
say "You can't [verbword] [the noun] with [the second noun].".


Part 20 - Folding/Unfolding (new)

folding is an action applying to one thing.
understand "fold [something]" as folding.

unfolding is an action applying to one thing.
understand "unfold [something]" as unfolding.
	
check folding a folded thing
(this is the already folded rule):
say "[The noun] is already folded." instead.
	
check unfolding an unfolded thing
(this is the already unfolded rule):
say "[The noun] is already unfolded." instead.

report folding something
(this is the folding rule):
say "You can't fold [the noun].".

report unfolding something
(this is the unfolding rule):
say "You can't unfold [the noun].".

Part 21 - Give and Asking For (allows NPC to give and take)

understand the command "give" as something new.
understand the command "hand" as something new.

understand "give [things] to [something]" as giving it to.
understand "give [things] to [someone]" as giving it to.
understand "hand [things] to [something]" as giving it to.
understand "hand [things] to [someone]" as giving it to.
understand "give [someone] [things]" as giving it to (with nouns reversed).
understand "hand [someone] [things]" as giving it to  (with nouns reversed).

report giving something to a second noun
(this is the giving something to a person rule):
say "You can't give [the noun] to [the second noun].";

handing it over to is an action applying to two things.
understand "hand [something] over to [something]" as handing it over to.

instead of handing something over to a second noun
(this is the handing it over to someone rule):
say "You can't hand [the noun] over to [the second noun].";

instead of asking a person (called the requestee) for something (called the target)
(this is the asking someone for something rule):
if the target is enclosed by the requestee begin;
say "[The requestee] refuses to give you [the target]." instead;
otherwise;
say "[The requestee] hasn't got the [target]." instead;
end if.

Part 22 - Inflating and Deflating (new)

Section 1 - Inflating

inflating is an action applying to one thing. 
understand "inflate [something]" as inflating. 
understand "pump up [something]" as inflating.
understand "pump [something] up" as inflating.

understand "blow in [something]" as inflating.
understand "blow up [something]" as inflating. 
understand "blow [something] up" as inflating.

inflating it with is an action applying to two things. 
understand "inflate [something] with [something]" as inflating it with. 
understand "pump up [something] with [something]" as inflating it with. 
understand "pump [something] up with [something]" as inflating it with. 
understand "blow up [something] with [something]" as inflating it with. 
understand "blow [something] up with [something]" as inflating it with. 

report inflating an uninflatable thing 
(this is the can't inflate uninflatables rule):
say "You can't inflate [the noun]." instead.

report inflating a deflated inflatable thing
(this is the inflating a deflated thing rule):
now the noun is inflated;
say "You inflate [the noun]." instead.


report inflating a deflated inflatable thing with something
(this is the inflating an inflatable thing with a second noun rule):
now the noun is inflated;
say "You inflate [the noun] with [the second noun]." instead.

report inflating an inflated thing
(this is the first already inflated rule):
say "[The noun] is already inflated." instead.


report inflating something with something
(this is the second already inflated rule):
if the noun is inflated,
say "[The noun] is already inflated." instead.

report inflating an uninflatable thing with something
(this is the can't inflate thing with a second noun rule):
	if the noun is uninflatable: 
		say "You can't inflate [the noun] with [the second noun]." instead.

Section 2 - Deflating

deflating is an action applying to one thing. 
understand "deflate [something]" as deflating.
understand "let air out of [something]" as deflating.

deflating it with is an action applying to two things.
understand "deflate [something] with [something]" as deflating it with.

report deflating a deflated thing
(this is the first deflating rule):
say "[The noun] is already deflated." instead.

report deflating a deflated thing with a second noun
(this is the second deflating rule):
say "[The noun] is already deflated." instead.

Part 23 - Jumping (expanded)

jumping from is an action applying to one thing.
understand "jump from [something]" as jumping from.

jumping in is an action applying to one thing. 
understand "jump in/into [something]" as jumping in. 

jumping on is an action applying to one thing. 
understand "jump on/onto [something]" as jumping on.

jumping down is an action applying to one thing.
understand "jump down [something]" as jumping down.

jumping off is an action applying to one thing.
understand "jump off [something]" as jumping off.
understand "jump off of [something]" as jumping off.

jumping out of is an action applying to one thing.
understand "jump out of [thing]" as jumping out of.

jumping over is an action applying to one thing. 
understand "jump over [something]" as jumping over.

jumping through is an action applying to one thing. 
understand "jump through[something]" as jumping through.
understand "jump thru [something]" as jumping through.

jumping under is an action applying to one thing. 
understand "jump under [something]" as jumping under.

report jumping in something
(this is the jumping in rule):
say "You can't jump into [the noun].".

report jumping on something
(this is the jumping on rule):
say "You can't jump onto [the noun].".

report jumping out of something
(this is the jumping out rule):
say "You can't jump out of [the noun].".

report jumping down something
(this is the jumping down rule):
say "You can't jump down [the noun].".

report jumping over something
(this is the jumping over rule):
say "You can't jump over [the noun].";

report jumping off something
(this is the jumping off rule):
say "You can't jump off of [the noun].".

report jumping through something
(this is the jumping through rule):
say "You can't jump through [the noun].";

instead of jumping under something
(this is the jumping under rule):
say "You can't jump under [the noun].";

Part 24 - Killing (expanded and synonyms)

understand the command "kill" as something new.
killing is an action applying to one thing. 
killing it with is an action applying to two things.

understand "murder [someone]" as killing. 
understand "murder [something]" as killing. 
understand "kill [someone]" as killing. 
understand "kill [something]" as killing. 
understand "stab [someone]" as killing. 
understand "stab [something]" as killing. 
understand "torture[someone]" as killing.
understand "torture[something]" as killing.

understand "kill [someone] with [something]" as killing it with.
understand "kill [something] with [something]" as killing it with. 
understand "murder [someone] with [something]" as killing it with. 
understand "murder [something] with [something]" as killing it with.
understand "stab [someone] with [something]" as killing it with. 
understand "stab [something] with [something]" as killing it with.
understand "torture [someone] with [something]" as killing it with. 
understand "torture [something] with [something]"as killing it with. 

report killing
(this is the first killing rule):
say "You can't [verbword] [the noun]."

report killing something with a second noun
(this is the second killing rule):
say "You can't [verbword] [the noun] with [the second noun].".

Part 25 - Loading and Unloading (new)

Section 1 - Loading

loading is an action applying to one thing.
understand "load [something]" as loading.

loading it into is an action applying to two things.
understand "load [something] into [something]" as loading it into.

loading it onto is an action applying to two things.
understand "load [something] onto [something]" as loading it onto.

loading it with is an action applying to two things.
understand "load [something] with [something]" as loading it with.

loading it from is an action applying to two things.
understand "load [something] from [something]" as loading it from.

report loading something
(this is the loading rule):
say "You can't load [the noun]."

report loading something with a second noun
(this is the loading something with a second noun rule):
say "You can't load [the noun] with [the second noun]."

Section 2 - Unloading 

unloading is an action applying to one thing.
understand "unload [something]" as unloading.

unloading it into is an action applying to two things.
understand "unload [something] into [something]" as unloading it into.

unloading it onto is an action applying to two things.
understand "unload [something] onto [something]" as unloading it onto.

unloading it with is an action applying to two things.
understand "unload [something] with [something]" as unloading it with.

unloading it from is an action applying to two things.
understand "unload [something] from [something]" as unloading it from.

report unloading something
(this is the unloading rule):
say "You can't unload [the noun]."

report unloading something with a second noun
(this is the unloading something with a second noun rule):
say "You can't unload [the noun] with [the second noun]."

check unloading something with something
(this is the can't unload something with nothing rule):
if the second noun is not carried by the player,
say "You don't have [the second noun]." instead.

check unloading something from a second noun
(this is the second noun is empty rule):
if the number of things in the second noun is 0,
say "There's nothing in [the second noun] to unload." instead.

check unloading something into a second noun
(this is the can't unload a non-container rule):
if the second noun is not an open container,
say "[The second noun] is not capable of holding [the noun]." instead.

check unloading something onto a second noun
(this is the can't unload a non-supporter rule):
if the second noun is not a supporter,
say "[The second noun] is not capable of supporting [the noun]." instead.

instead of unloading something with a second noun
(this is the loading with a second noun rule):
say "You unload [the noun] with [the second noun].";
now the second noun is in the location.

instead of unloading into a second noun
(this is the loading into a second noun rule):
say "You unload [the noun] into [the second noun].";
now the second noun is in the noun;

instead of unloading something onto a second noun
(this is the loading onto a second noun rule):
say "You unload [the noun] onto a [the second noun].";
now the second noun is on the noun;

instead of unloading something from a second noun
(this is the loading from a second noun rule):
say "You unload [the noun] from [the second noun].";
now the second noun is in the location.

Part 26 - Looking (expanded)

looking behind is an action applying to one thing.
understand "look behind [something]" as looking behind.

looking north is an action applying to nothing.
looking south is an action applying to nothing.
looking east is an action applying to nothing.
looking west is an action applying to nothing.
looking northeast is an action applying to nothing.
looking northwest is an action applying to nothing.
looking southeast is an action applying to nothing.
looking southwest is an action applying to nothing.
looking up is an action applying to nothing.
looking down is an action applying to nothing.

understand "look north" or "look n" as looking north.
understand "look south" or "look s" as looking south.
understand "look east" or "look e" as looking east.
understand "look west" or "look w" as looking west.
understand "look northeast" or "look ne" as looking northeast.
understand "look northwest" or "look nw" as looking northwest.
understand "look southeast" or "look se" as looking southeast.
understand "look southwest" or "look sw" as looking southwest.
understand "look up" or "l u" or "lu" as looking up.
understand "look down" or "l d" or "ld" as looking down.
understand "look behind [something]" as looking behind.
understand "l b [something]" or "lb [something]" as looking behind.

report looking north
(this is the looking north rule):
say "You can't look to the north."

report looking south
(this is the looking south rule):
say "You can't look to the south."

report looking east
(this is the looking east rule):
say "You can't look to the east."

report looking west
(this is the looking west rule):
say "You can't look to the west."

report looking northeast
(this is the looking northeast rule):
say "You can't look to the northeast."

report looking northwest
(this is the looking northwest rule):
say "You can't look to the northwest."

report looking southeast:
say "You can't look to the southeast."

report looking southwest:
say "You can't look to the southwest."

report looking up
(this is the looking up rule):
say "You can't look up.".

report looking down
(this is the looking down rule):
say "You can't look down.".

report looking behind something 
(this is the looking behind rule):
say "You can't look behind [the noun].".

Part 27 - Mixing (new)

mixing is an action applying to one thing.
understand "mix [something]" as mixing.

mixing it with is an action applying to two things. 
understand "mix [something] with [something]" as mixing it with.

report mixing
(this is the first mixing rule):
say "What do you want to mix [the noun] with?"

report mixing something with a second noun
(this is the second mixing rule):
say "You can't mix [the noun] with [the second noun].".

Part 28 - Moving (separated)

understand the command "shove" as "push".
understand the command "move" as something new.

moving is an action applying to one thing.
understand "move [something]" as moving.

report moving something
(this is the moving rule):
say "You can't move [the noun].".

Part 29 - Offering (separated)

Section 1 

understand the command "offer" as something new.
offering it to is an action applying to two things.
understand "offer [something] to [someone]" as offering it to.
understand "offer [something] to [something]" as offering it to.

report offering something to a second noun
(this is the offering rule):
say "You can't offer [the noun] to [the second noun].";

Part 30 - Bribing (new)

bribing is an action applying to one thing.
understand "bribe [someone]" as bribing.

bribing it with is an action applying to two things.
understand "bribe [someone] with [something]" as bribing it with.

report bribing
(this is the first bribing rule):
say "You can't bribe [the noun].";

report bribing someone with a second noun
(this is the second bribing rule):
say "You can't bribe [the noun] with [the second noun].".

Part 31 - Paying (separated)

understand the command "pay" as something new.
paying is an action applying to one thing.
understand "pay [something]" as paying. 
understand "pay [someone]" as paying.

paying it to is an action applying to two things.
understand "pay [something] to [something]" as paying it to.
understand "pay [something] to [someone]" as paying it to.

paying it for is an action applying to two things.
understand "pay [someone] for [something]" as paying it for.

report paying
(this is the first paying rule):
say "You can't pay [the noun].";

report paying something to a second noun
(this is the second paying rule): 
say "You can't pay [the noun] to [the second noun].";

report paying someone for something
(this is the third paying rule):
say "You can't pay [the noun] for [the second noun].".

Part 32 - Positions (Sitting,Standing,Lieing)

understand the command "lie" as something new.

lieing in is an action applying to one thing.
understand "lie in [something]" as lieing in. 

lieing on is an action applying to one thing.
understand "lie on [something]" as lieing on.

lieing under is an action applying to one thing.
understand "lie under [something]" as lieing under.

report lieing under something
(this is the lieing under rule):
say "You can't lie under [the noun].".

report lieing on something
(this is the lieing on rule):
say "You can't lie on [the noun].".

report lieing in something
(this is the lieing in rule):
say "You can lie in [the noun].".

understand the command "sit" as something new.

sitting is an action applying to nothing.
understand "sit" or "sit down" as sitting.

report sitting:
say "You can't sit.";

sitting on is an action applying to one thing.
understand "sit on [something]" as sitting on.
understand "sit on top of [something]" as sitting on.

sitting in is an action applying to one thing.
understand "sit in [something]" as sitting in.

sitting under is an action applying to one thing.
understand "sit under [something]" as sitting under.

sitting behind is an action applying to one thing.
understand "sit behind [something]" as sitting behind.

report sitting behind something
(this is the sitting behind something rule):
say "You can sit behind [the noun].".

report sitting under something
(this is the sitting under something rule):
say "You can't sit under [the noun]." instead.

report sitting on something
(this is the sitting on rule):
say "You can't sit on [the noun]." instead.

report sitting in something
(this is the sitting in rule):
say "You can't sit in [the noun]." instead.

understand the command "stand" as something new.
standing is an action applying to nothing.
understand "stand" as standing.
understand "stand up" as exiting.

standing on is an action applying to one thing.
understand "stand on [something]" as standing on.

understand "stand on top of [something]" as standing on.
understand "step on [something]" as standing on.

standing in is an action applying to one thing.
understand "stand in [something]" as standing in.

standing under is an action applying to one thing.
understand "stand under [something]" as standing under.

standing behind is an action applying to one thing.
understand "stand behind[something]" as standing behind.

report standing on something
(this is the standing on something rule):
say "You can't stand on [the noun]."

report standing in something
(this is the standing in rule):
say "You can't stand in [the noun]."

report standing under something
(this is the standing under rule):
say "You can't stand under [the noun]."

report standing behind something
(this is the standing behind rule):
say "You can't stand behind [the noun]."

Part 33 - Pouring (new)

pouring is an action applying to one thing.
understand "pour [something]" as pouring.
understand "pour [something] out" as pouring.

understand "pour out [something]" as pouring.
understand "pour [container]" as pouring.
understand "pour [container] out" as pouring.
understand "pour out [container]" as pouring.

understand the command "spill" as "pour".

pouring it into is an action applying to two things. 
understand "pour [something] in/into [something]" as pouring it into.
understand "pour [container] in/into [something]" as pouring it into.

pouring it onto is an action applying to two things. 
understand "pour [something] on/onto [something]" as pouring it onto.
understand "pour [container] on/onto [something]" as pouring it onto.

pouring it out of is an action applying to two things.
understand "pour [something] out of [something]" as pouring it out of.
understand "pour [container] in/into [something]" as pouring it into.

pouring it from is an action applying to two things. 
understand "pour [something] from [something]" as pouring it from.

report pouring something which is not a container
(this is the pouring a non-container rule):
say "You can't pour [the noun]." instead.

report pouring a container
(this is the pouring a container rule):
say "You can't pour [the noun]." instead.

report pouring something which is not a container into something
(this is the pouring a non-container into something rule):
say "You can't pour [the noun] into [the second noun]." .

report pouring a container into something
(this is the pouring a container into something rule):
say "You can't pour [the noun] into [the second noun]." .

report pouring something which is not a container onto something
(this is the pouring a non-container onto a second noun rule):
say "You can't pour [the noun] onto [the second noun]." .

report pouring a container onto something
(this is the pouring a container onto a second noun rule):
say "You can't pour [the noun] onto [the second noun].". 

report pouring something out of a second noun
(this is the pouring something out of something rule):
say "You can't pour [the noun] out of [the second noun]." 

report pouring something from a second noun
(this is the pouring something from a container rule):
say "You can't pour [the noun] from [the second noun]." 



Part 34 - Praying (expanded)

praying is an action applying to nothing. 
understand "pray" as praying.

praying to is an action applying to one thing.
understand "pray to [something]" as praying to.

praying for is an action applying to one thing. 
understand "pray for [something]" as praying for.

report praying
(this is the first praying rule):
say "Your prayers go unanswered." 

report praying to something
(this is the second praying rule):
say "You can't pray to the [noun]." 

report praying for something
(this is the third praying rule):
say "You can't pray for [the noun]." 

Part 35 - Reading (separated)

understand the command "read" as something new.
reading is an action applying to one thing.

understand "read [something]" as reading.

report reading
(this is the reading rule):
say "You can't read [the noun]."


Part 36 - Screwing (separated)

Section 1 - Screwing

understand the command "screw" as something new.
screwing is an action applying to one thing.
understand "screw [something]" as screwing.

screwing it with is an action applying to two things.
understand "screw [something] with [something]" as screwing it with.

screwing it into is an action applying to two things.
understand "screw [something] in/into [something]" as screwing it into.

report screwing something
(this is the first screwing rule):
say "You can't screw [the noun].".

report screwing something with something
(this is the second screwing rule):
say "You can't screw [the noun] with [the second noun].".

report screwing something into a second noun
(this is the third screwing rule):
say "You can't screw [the noun] into [the second noun].".

Section 2 - Unscrewing (new)

understand the command "unscrew" as something new.

unscrewing is an action applying to one thing.
understand "unscrew [something]" as unscrewing.

unscrewing it with is an action applying to two things.
understand "unscrew [something] with [something]" as unscrewing it with.

unscrewing it from is an action applying to two things.
understand "unscrew [something] from [something]" as unscrewing it from.

report unscrewing something
(this is the first unscrewing rule):
say "You can't unscrew [the noun].".

report unscrewing something with something
(this is the second unscrewing rule):
say "You can't unscrew [the noun] with [the second noun].".

report unscrewing something from a second noun
(this is the third unscrewing rule):
say "You can't unscrew [the noun] from [the second noun].".

Part 37 - Shifting (separated)

understand the command "shift" as something new.
shifting is an action applying to one thing.

understand "shift [something]" as shifting.

report shifting something
(this is the shifting rule):
say "You can't shift [the noun]."

Part 38 - Shooting (new)

shooting is an action applying to one thing.
understand "shoot [something]" as shooting .
understand "shoot [someone]" as shooting.
understand "fire [something]" as shooting.

check shooting something
(this is the can't shoot what you ain't got rule):
if the noun is not carried by the player,
say "You don't have [the noun]." instead.

shooting it with is an action applying to two things.
understand "shoot [something] with [something]" as shooting it with.
understand "shoot [someone] with [something]" as shooting it with.

shooting it at is an action applying to two things.
understand "shoot [something] at [things]" as shooting it at. 
understand "shoot [something] at [someone]" as shooting it at. 
understand "fire [something] at [things]" as shooting it at. 
understand "fire [something] at [someone]" as shooting it at. 

report shooting something
(this is the shooting rule):
say "You can't [verbword] [the noun].";

report shooting something with something
(this is the shooting something with something rule):
say "You can't shoot [the noun] with [the second noun].";

report shooting something at something
(this is the shooting at rule):
say "You can't [verbword] [the noun] at [the second noun].";

Part 39 - Stealing (new)

stealing is an action applying to one thing.

understand "steal [something]" as stealing.
understand "rob [something]" as stealing.
understand "swipe [something]" as stealing.
understand "snatch [something]" as stealing.
understand "grab [something]" as stealing.
understand "rip off [something]" as stealing.
understand "liberate [something]" as stealing.
understand "filch [something]" as stealing.
understand "pinch [something]" as stealing.
understand "heist [something]" as stealing.

stealing it from is an action applying to two things.

understand "steal [something] from [something]" as stealing it from.
understand "rob [something] from [something]" as stealing it from.
understand "swipe [something] from [something]" as stealing it from.
understand "snatch [something] from [something]" as stealing it from.
understand "grab [something] from [something]" as stealing it from.
understand "rip off [something] from [something]" as stealing it from.
understand "liberate [something] from [something]" as stealing it from.
understand "filch [something] from [something]" as stealing it from.
understand "pinch [something] from [something]" as stealing it from.
understand "heist [something] from [something]" as stealing it from.

check stealing something 
(this is the can't take your own goods rule):
if the noun is carried by the player,
say "You've already got [the noun]!" instead.

check stealing something from a second noun
(this is the can't steal an empty-handed person rule):
if the second noun encloses nothing,
say "[The second noun] hasn't got [the noun]." instead.

report stealing
(this is the result of stealing rule):
say "You can't steal [the noun].";

report stealing something from a second noun
(this is the steal something from some-on-thing rule):	
say "You can't steal [the noun] from [the second noun].";
now the noun is carried by the player;

Part 40 - Striking (new)

striking is an action applying to one thing. 

understand "strike [something]" as striking. 
understand "ignite [something]" as striking.

report striking
(this is the striking rule):
say "You can't [verbword] [the noun]."

Part 41 - Swimming (new)

swimming is an action applying to nothing. 
swimming in is an action applying to one thing.
swimming across is an action applying to one thing. 
swimming under is an action applying to one thing. 
swimming over is an action applying to one thing. 
swimming around is an action applying to one thing. 
swimming through is an action applying to one thing.

understand "swim" as swimming. 
understand "swim in [something]" as swimming in. 
understand "swim across [something]" as swimming across. 
understand "swim under [something]" as swimming under. 
understand "swim over [something]" as swimming over. 
understand "swim around [something]" as swimming around. 
understand "swim through [something]" as swimming through.
understand "swim thru [something]" as swimming through.

report swimming
(this is the swimming rule):
say "You can't swim."

report swimming in an unswimmable thing 
(this is the swimming in an unswimmable thing rule):
say "You can't swim in [the noun].".

report swimming over an unswimmable thing
(this is the swimming over an unswimmable thing rule):
say "You can't swim over [the noun]."

report swimming under an unswimmable thing
(this is the swimming under an unswimmable thing rule):
 say "You can't swim under [the noun].".

report swimming around an unswimmable thing
(this is the swimming around an unswimmable thing rule):
say "You can't swim around [the noun]."

report swimming across an unswimmable thing
(this is the swimming across unswimmable thing rule):
say "You can't swim across [the noun]."

report swimming through an unswimmable thing
(this is the swimming through an unswimmable thing rule):
say "You can't swim through [the noun]."

report swimming in a swimmable thing
(this is the swimming in a swimmable thing rule):
say "You swim in [the noun].".

report swimming over a swimmable thing
(this is the swimming over a swimmable thing rule):
say "You swim over [the noun].".

report swimming under a swimmable thing
(this is the swimming under a swimmable thing rule): 
say "You swim under [the noun].".	

report swimming around a swimmable thing
(this is the swimming around a swimmable thing rule): 
say "You swim around [the noun].".

report swimming across a swimmable thing
(this is the swimming across a swimmable thing rule):: 
say "You swim across [the noun].".

report swimming through a swimmable thing
(this is the swimming through a swimmable thing rule): 
say "You swim through [the noun].".

Part 42 - Talking and Shouting (new)

understand the command "speak" as something new.

talking is an action applying to nothing.
understand "talk" as talking.

talking to is an action applying to one thing.
understand "talk to [something]" as talking to.
understand "speak to [something]" as talking to.
understand "talk to [someone]" as talking to.
understand "speak to [someone]" as talking to.

report talking 
(this is the first talking rule):
say "Who do you want to talk to?".

report talking to something
(this is the second talking rule):
say "You can't [verbword] to [the noun].".

understand the command "shout" as something new.
shouting is an action applying to nothing.
understand "shout" as shouting.
understand "yell" as shouting.
understand "scream" as shouting.
understand "holler" as shouting.
understand "bellow" as shouting.
understand "screech" as shouting.
understand "howl"   as shouting.
understand "yowl"    as shouting.. 
understand "wail"      as shouting. 
understand "shriek"  as shouting. 
understand "yelp"     as shouting.
understand "squeal" as shouting. 

shouting at is an action applying to one thing.
understand "shout at [something]" as shouting at.
understand "yell at [something]" as shouting at.
understand "scream at [something]" as shouting at.
understand "holler at [something]" as shouting at.
understand "bellow at [something]" as shouting at.
understand "screech at [something]" as shouting at.
understand "howl at [something]" as shouting at.
understand "yowl at [something]" as shouting at.
understand "wail at [something]" as shouting at.
understand "shriek at [something]" as shouting at. 
understand "yelp at [something]" as shouting at.
understand "squeal at [something]" as shouting at. 

shouting to is an action applying to one thing.

understand "shout to [something]" as shouting to.
understand "yell to [something]" as shouting to.
understand "scream to [something]" as shouting to.
understand "holler to [something]" as shouting to.
understand "bellow to [something]" as shouting to.
understand "screech to [something]" as shouting to.
understand "howl to [something]" as shouting to.
understand "yowl to [something]" as shouting to.
understand "wail to [something]" as shouting to.
understand "shriek to [something]" as shouting to.
understand "yelp to [something]" as shouting to.
understand "squeal to [something]" as shouting to. 

shouting it at is an action applying to two things.

understand "shout [something] at [something]" as shouting it at.
understand "yell [something] at [something]" as shouting it at.
understand "scream [something] at [something]" as shouting it at.
understand "holler [something] at [something]" as shouting it at.
understand "bellow [something] at [something]" as shouting it at.
understand "screech [something] at [something]" as shouting it at.
understand "howl to [something] at [something]" as shouting it at.
understand "yowl to [something]  at [something]" as shouting it at.
understand "wail to [something] at [something]" as shouting it at.
understand "shriek to [something] at [something]" as shouting it at.
understand "yelp to [something] at [something]" as shouting it at.
understand "squeal to [something] at [something]" as shouting it at.

shouting it to is an action applying to two things.

understand "shout [something] to [something]" as shouting it to.
understand "yell [something] to [something]" as shouting it to.
understand "scream [something] to [something]" as shouting it to.
understand "holler [something] to [something]" as shouting it to.
understand "bellow [something] to [something]" as shouting it to.
understand "screech [something] to [something]" as shouting it to.
understand "howl to [something]  to [something]" as shouting it to.
understand "yowl to [something]  to [something]" as shouting it to.
understand "wail to [something]  to [something]" as shouting it to.
understand "shriek to [something]  to [something]" as shouting it to.
understand "yelp to [something] to [something]" as shouting it to.
understand "squeal to [something]  to [something]" as shouting it to.

report shouting
(this is the shouting rule): 
say "You can't [verbword].";

report shouting at something
(this is the shouting at rule):
say "You can't [verbword] at [the noun].".

report shouting to something
(this is the shouting to rule): 
say "You can't [verbword] to [the noun].".	

report shouting something at something
(this is the shouting something at something rule): 
say "You can't [verbword] [the noun] at [the second noun].".

report shouting something to something
(this is the shouting something to something rule): : 
say "You can't [verbword] [the noun] to [the second noun].".	

Part 43 - Throwing (expanded)

understand the command "throw" as something new.

throwing is an action applying to one thing.
understand "chuck [things]" as throwing. 
understand "heave [things]" as throwing. 
understand "throw [things]" as throwing.
understand "toss [things]" as throwing.
understand "hurl [things]" as throwing. 
understand "pitch [things]" as throwing.

understand "throw [something] at [something]" as throwing it at.
understand "chuck [things] at[something]"  as throwing it at.
understand "heave [things] at [something]" as throwing it at.
understand "throw [things] at [something]"  as throwing it at. 
understand "toss [things]  at [something]"  as throwing it at.
understand "hurl [things] at[something]"    as throwing it at.
understand "pitch [things] at [something]"  as throwing it at.

throwing it into is an action applying to two things.
understand "chuck [things] in/into [something]" as throwing it into. 
understand "heave [things] in/into [something]" as throwing it into. 
understand "throw [things] in/into [something]" as throwing it into. 
understand "toss [things] in/into [something]" as throwing it into. 
understand "hurl [things] in/into [something]" as throwing it into. 
understand "pitch [things] in/into [something]" as throwing it into.

throwing it onto is an action applying to two things. 
understand "chuck [things] on/onto [something]" as throwing it onto.
understand "heave [things] on/onto [something]" as throwing it onto. 
understand "throw [things] on/onto [something]" as throwing it onto. 
understand "toss [things] on/onto [something]" as throwing it onto. 
understand "hurl [things] on/onto [something]" as throwing it onto. 
understand "pitch [things] on/onto [something]" as throwing it onto.

throwing it down is an action applying to two things.
understand "chuck [things] down [something]" as throwing it down. 
understand "throw [things] down [something]" as throwing it down. 
understand "heave [things] down [something]" as throwing it down. 
understand "toss [things] down [something]" as throwing it down. 
understand "hurl [things] down [something]" as throwing it down.
understand "pitch [things] down [something]" as throwing it down.

throwing it off is an action applying to two things.
understand "chuck [things] off [something]" as throwing it off. 
understand "heave [things] off [something]" as throwing it off. 
understand "throw [things] off [something]" as throwing it off. 
understand "toss [things] off [something]" as throwing it off. 
understand "hurl [things] off [something]" as throwing it off.
understand "pitch [things] off [something]" as throwing it off.

throwing it out of is an action applying to two things.
understand "chuck [things] out/out of [something]" as throwing it out of. 
understand "heave [things] out/out of [something]" as throwing it out of. 
understand "throw [things] out/out of [something]" as throwing it out of. 
understand "toss [things] out/out of [something]" as throwing it out of. 
understand "hurl [things] out/out of [something]" as throwing it out of.
understand "pitch [things] out/ouf of [something]" as throwing it out of.

throwing it over is an action applying to two things.
understand "chuck [things] over [something]" as throwing it over. 
understand "throw [things] over [something]" as throwing it over. 
understand "heave [things] over [something]" as throwing it over. 
understand "toss [things] over [something]" as throwing it over. 
understand "hurl [things] over [something]" as throwing it over. 
understand "pitch [things] over [something]" as throwing it over. 

throwing it under is an action applying to two things.
understand "chuck [things] under [something]" as throwing it under. 
understand "throw [things] under [something]" as throwing it under. 
understand "heave [things] under [something]" as throwing it under. 
understand "toss [things] under [something]" as throwing it under. 
understand "hurl [things] under [something]" as throwing it under. 
understand "pitch [things] under [something]" as throwing it under. 

throwing it through is an action applying to two things.
understand "chuck [things] through [something]" as throwing it through. 
understand "throw [things] through [something]" as throwing it through. 
understand "heave [things] through [something]" as throwing it through. 
understand "toss [things] through [something]" as throwing it through. 
understand "hurl [things] through [something]" as throwing it through.
understand "pitch [things] through [something]" as throwing it through.

check throwing something at a second noun
(this is the can't throw what you don't have rule):
if the noun is not carried by the player,
say "You don't have [the noun]." instead.

report throwing something
(this is the throwing rule):
say "You can't throw [the noun].".

report throwing something into something
(this is the throwing something into something rule) :
say "You can't [verbword] [the noun] into [the second noun].".

report throwing something onto something
(this is the throwing something onto something rule) :
say "You can't [verbword] [the noun] onto [the second noun].".

report throwing something off a second noun
(this is the throwing something off something rule) ::
say "You can't [verbword] [the noun] off [the second noun].". 

report throwing something over something
(this is the throwing something over something rule) ::
say "You can't [verbword] [the noun] over [the second noun].". 

report throwing something under a second noun
(this is the throwing something under something rule) ::
say "You can't [verbword] [the noun] under [the second noun].". 

report throwing something down a second noun
(this is the throwing something down something rule) ::
say "You can't [verbword] [the noun] down [the second noun].". 

report throwing something through a second noun
(this is the throwing something through something rule) ::
say "You can't [verbword] [the noun]through [the second noun].". 

report throwing something out of a second noun
(this is the throwing something out of something rule) ::
say "You can't [verbword] [the noun] out of [the second noun]."

Part 44 - Checking Separated from Look

understand the command "check" as something new.
checking is an action applying to one thing.
understand "check [something]" as checking.

checking it with is an action applying to two things.
understand "check [something] with [something]" as checking it with.

report checking
(this is the first checking rule): 
say "You can't check [the noun].".

report checking something with a second noun
(this is the second checking rule):
say "You can't check [the noun] with [the second noun].".


Part 45 - Crawl Action (new)

understand the command "crawl" as something new.

crawling is an action applying to nothing.
understand "crawl" as crawling.

crawling around is an action applying to one thing.
crawling behind is an action applying to one thing.
crawling in front of is an action applying to one thing.
crawling on is an action applying to one thing.
crawling over is an action applying to one thing.
crawling under is an action applying to one thing.
crawling through is an action applying to one thing.

understand "crawl around [something]" as crawling around.
understand "crawl behind [something]" as crawling behind.
understand "crawl in front of [something]" as crawling in front of.
understand "crawl on [something]" as crawling on.
understand "crawl over [something]" as crawling over.
understand "crawl under [something]" as crawling under.
understand "crawl through [something]" as crawling through.

report crawling
(this is the crawling rule):
say "You can't crawl.".

report crawling around something
(this is the crawl around something rule):
say "You can't crawl around [the noun].".

report crawling behind something
(this is the crawl behind something rule):
say "You can't crawl behind [the noun].".

report crawling in front of something
(this is the crawl in front of something rule):
say "You can't crawl in front of [the noun].".

report crawling on something
(this is the crawl on something rule):
say "You can't crawl on [the noun].".

report crawling over something
(this is the crawl over something rule):
say "You can't crawl over [the noun].".

report crawling under something
(this is the crawl under something rule):
say "You can't crawl under [the noun].".

report crawling through something
(this is the crawl through something rule):
say "You can't crawl through [the noun].".

Part 46 - Run and Walk (separated out from 'Go')

Section 1 - Running

understand the command "run" as something new.

running is an action applying to nothing.
understand "run" as running.
	
running around is an action applying to one thing.
running behind is an action applying to one thing.
running in front of is an action applying to one thing.
running on is an action applying to one thing.
running over is an action applying to one thing.
running under is an action applying to one thing.
running through is an action applying to one thing.

understand "run around [something]" as running around.
understand "run behind [something]" as running behind.
understand "run in front of [something]" as running in front of.
understand "run on [something]" as running on.
understand "run over [something]" as running over.
understand "run under [something]" as running under.
understand "run through [something]" as running through.

report running
(this is the runing rule):
say "You can't run.".

report running around something
(this is the run around something rule):
say "You can't run around [the noun].".

report running behind something
(this is the run behind something rule):
say "You can't run behind [the noun].".

report running in front of something
(this is the run in front of something rule):
say "You can't run in front of [the noun].".

report running on something
(this is the run on something rule):
say "You can't run on [the noun].".

report running over something
(this is the run over something rule):
say "You can't run over [the noun].".

report running under something
(this is the run under something rule):
say "You can't run under [the noun].".

report running through something
(this is the run through something rule):
say "You can't run through [the noun].".

Section 2 - Walking

understand the command "walk" as something new.

walking is an action applying to nothing.
understand "walk" as walking.

walking around is an action applying to one thing.
walking behind is an action applying to one thing.
walking in front of is an action applying to one thing.
walking on is an action applying to one thing.
walking over is an action applying to one thing.
walking under is an action applying to one thing.
walking through is an action applying to one thing.

understand "walk around [something]" as walking around.
understand "go around [something]" as walking around.

understand "walk behind [something]" as walking behind.
understand "go behind [something]" as walking behind.

understand "walk in front of [something]" as walking in front of.
understand "go in front of [something]" as walking in front of.

understand "walk on [something]" as walking on.
understand "go on [something]" as walking on.

understand "walk over [something]" as walking over.
understand "go over [something]" as walking over.

understand "walk under [something]" as walking under.
understand "go under [something]" as walking under.

understand "walk through [something]" as walking through.

report walking (this is the walking rule):
say "You can't walk.".

report walking around something
(this is the walking around rule):
say "You can't walk around [the noun].".

report walking behind something
(this is the walking behind rule):
say "You can't walk behind [the noun].".

report walking in front of something
(this is the walking in front of rule):
say "You can't walk in front of [the noun].".

report walking on something
(this is the walking on rule):
say "You can't walk on [the noun].".

report walking over something
(this is the walking over rule):
say "You can't walk over [the noun].".

report walking under something
(this is the walking under rule):
say "You can't walk under [the noun].".

report walking through something
(this is the walking through rule):
say "You can't walk through [the noun].".

Supplemental Actions ends here.

---- DOCUMENTATION ----

Section 1 : Actions covered 

This extension adds the actions listed above so that you don't have to.

Section 2 : Warnings

Note: This extension can not be used with either of the following 2 Emily Short 
extensions:Empty Transfer and Measured Liquids.

Also you need to set the output file to at least a .z8 setting or you will get
an error during compilation.

Section 3 : Contacting the Author

It is highly recommended that you print out this code so that you can consult 
it for actions and default responses which you may override with your own.

Questions and comments to: radical1@evcohs.com

Section 4 : New Properties Required

For the emptying function add this line: the (NOUN) is emptyable.

For the climbing function add this line: the (NOUN) is climbable.

For the inflating function add this line: the (NOUN) inflatable.

For the swimming function add this line: the (NOUN) is swimmable.

For the digging function add this line: the (NOUN) is diggable.

For the filling function add this line: the (NOUN) is fillable.

where (NOUN) is the object you have coded.

Note: Version 29 removes the (NOUN) IS BLOWABLE function. It didn't make
much sense really and can be custom programmed by the author.

Section 5 : New Commands (Actions)

Version 34  added a property to containers for emptying. EMPTYABLE and UNEMPTYABLE.

Version 33 adds a few new synoyms to the SHOUT command.

Version 32 corrected a few errors in the 'Silliness" example

Version 31 now has a few more synonyms for ATTACK and a small bug regarding the EMPTY verb was fixed.

Version 30 makes some minor corrections to several verbs that were overlooked originally.

Version 29 adds a new action: CRAWL. You can crawl, crawl around, behind, in front of,on,over,under, and through something.

Some example Code:

Instead of crawling through the pipe: say "You crawl through the drainpipe to the other side.".

Instead of crawling around the room: say "You crawl around the room.".

Instead of crawling behind the stove: say "You crawl behind the stove and find some things you dropped.".

Instead of crawling under something: say "You crawl under [the noun] and feel foolish for doing so.".

Instead of crawling in front of the TV: say "You crawl in front of the TV for no apparent reason." 

instead of crawling over the fence: say "You'd rather jump over it.".

Version 27 adds a new action: STEAL and STEALING IT FROM.

There are 2 new DIVING commands called DIVE OFF/FROM (NOUN) and DIVE IN/INTO (NOUN).

BRIBE is a new verb. You can BRIBE (someone) or BRIBE (someone) WITH (something).

SWIM is a new command. SWIM, SWIM IN, SWIM ACROSS, SWIM THROUGH,SWIM UNDER, 
SWIM AROUND,and SWIM OVER.

Commands for JUMPING IN,JUMPING ON,JUMPING OVER and JUMPING THROUGH 
(something) have been added.

Commands for CLIMBING IN, CLIMBING OUT(OF),CLIMBING UP,CLIMBING DOWN,
CLIMBING OVER and CLIMBING UNDER have been added.

Commands for LIEING ON/IN (SOMETHING) have also been added.

Section 6 : Synonyms

ATTACK,BASH,BELT,HIT,INJURE,PUNCH,PUMMEL,POUND,SMACK,WHACK,WALLOP and WOUND are now all synonyms.

SLASH, LACERATE, SEVER, SLIT, PIERCE, WOUND, SCRATCH, GRAZE, NICK, INCISE, and LANCE are 
now new synonyms for CUT along with CHOP AND SLICE.

BREAK, CRACK,CRUSH, DAMAGE, DESTROY, FRACTURE, RUIN,SHATTER, SMASH, 
SNAP,TRASH, WRECK, AND VANDALIZE are now synonyms for breaking things.

SCREAM,YELL,HOLLER, BELLOW, and SCREECH are now synonyms for SHOUT

There are now TALK and TALK TO verbs implemented. 
SPEAK is now a synonym for TALK

As of version 19, SYNONYMS are echoed. The game will now automatically echo the correct verb.

Section 7 : Separated Actions

Version 29 now separates "run" and "walk" from "go".

You can now RUN, RUN AROUND, RUN BEHIND,RUN IN FRONT OF,RUN ON, RUN OVER,
RUN UNDER, AND RUN THROUGH SOMETHING.

Some example Code:

Instead of running through the pipe: say "You run through the drainpipe to the other side.".

Instead of running around the room: say "You run around the room.".

Instead of running behind the stove: say "You run behind the stove and find some things you dropped.".

Instead of running under something: say "You run under [the noun] and feel foolish for doing so.".

Instead of running in front of the TV: say "You run in front of the TV for no apparent reason." 

instead of running over the fence: say "You'd rather jump over it."

Instead of walking through the pipe: say "You walk through the drainpipe to the other side.".

Instead of walking around the room: say "You walk around the room.".

Instead of walking behind the stove: say "You walk bejomd the stove and find some things you dropped.".

Instead of walking under something: say "You craw under [the noun] and feel foolish for doing so.".

Instead of walking in front of the TV: say "You walk in front of the TV for no apparent reason." 

instead of walking over the fence: say "You'd rather jump over it."

Version 28 separates "check" from "look". There are 2 new separated commands "check" and "checking it with".

SHOUT has been separated from ANSWER and SPEAK.

THROW and DROP commands have been separated.

In addition you can now throw something over, under, onto something and off something as well.

As of version 25 CLEAR and SHIFT are now separated.

PUSH and PRESS remain the same.

RUB,CLEAN,DUST,POLISH,SCRUB,SHINE,SWEEP,and WIPE are all separate commands now.

SHOUT AND SPEAK have been separated from ANSWER and SAY. 

FEED,FEEDING IT TO,and FEEDING IT WITH are now separated from GIVE and PAY.

PAY is now a separate verb that stands alone. PAYING IT TO and PAYING IT FOR are extensions of PAY.

The THROW and DROP commands have been separated.

As of version 25 the commands SHIFT,CLEAR,and MOVE have now been separated.

PUSH and PRESS remain the same. 

SIT,STAND, AND LIE are now separate commands from ENTER.

SCREW AND UNSCREW are now separate commands from TURN.

As of version 26 the command FIX has been separated from TIE. 

REPAIR and MEND are also synonyms for FIX.
FIXING IT WITH is also added for fixing something with a second noun.

OFFER is now a separate verb. OFFERING IT TO is a new verb.

Section 8 : New Features

You can now also look in directions: LOOK (UP) (DOWN) (BEHIND) (NORTH) (SOUTH)
(EAST)(WEST)(NORTHEAST) (NORTHWEST) (SOUTHEAST) (SOUTHWEST)

You can Now BURN (SOMETHING) WITH (SOMETHING) and CUT (SOMETHING) WITH (SOMETHING).

You can now GIVE THING or THINGS to an NPC or to an inanimate object.

ASKING an NPC for something will automatically give you the object IF the NPC has it.

Example: * "Silliness" - a short game showing the extension features.

	*: "Silliness"

	Include Supplemental Actions by Al Golden.

	rule for printing room description details: stop.

	after printing the name of an open container: 
	omit contents in listing.

	rule for deciding whether all includes scenery: it does not.
	rule for deciding whether all includes backdrops: it does not.
	rule for deciding whether all includes something fixed in place: it does not.
	rule for deciding whether all includes a person: it does not.

	understand "go through [window]" as a mistake 
	("Try climbing in or climbing out the window instead.").

	understand "go through [something]" as a mistake 
	("You can't go through [the noun]!").

	report giving something to someone:
	now the second noun carries the noun;
	say "You give [the noun] to [the second noun].".

	Idyllic Scene is a room.
	"The best way to describe this place is 'Heaven On Earth'!".

	before going east when the player is in Idyllic:
	try entering the house instead.

	before going inside when the player is in Idyllic:
	try entering the house instead.

	before entering the house when the player is in Idyllic:
	if the window is open begin;
	now the player is in Kitchen instead;
	otherwise;
	say "The window isn't open." instead;
	end if.

	the player is carrying a polishing cloth, a knife, and a testing machine.
	the description of the testing machine is "It can be used to test things.".

	instead of cleaning or dusting or rubbing or polishing or scrubbing
	or shining or sweeping or wiping something:
	say "You [verbword] [the noun]."

	instead of cleaning something with something:
	say "You [verbword] [the noun] with [the second noun]."

	instead of dusting something with something:
	say "You [verbword] [the noun] with [the second noun]."

	instead of rubbing something with something:
	say "You [verbword] [the noun] with [the second noun]."

	instead of scrubbing something with something:
	say "You [verbword] [the noun] with [the second noun]."

	instead of polishing something with something:
	say "You [verbword] [the noun] with [the second noun]."

	instead of shining something with something:
	say "You [verbword] [the noun] with [the second noun]."

	instead of sweeping something with something:
	say "You [verbword] [the noun] with [the second noun]."

	instead of wiping something with something:
	say "You [verbword] [the noun] with [the second noun]."

	instead of breaking a unbroken thing:
	now the noun is broken;
	let verbword be word number 1 in the player's command;
	say "You [verbword] [the noun].".

	instead of breaking a unbroken thing with a second noun:
	now the noun is broken;
	let verbword be word number 1 in the player's command;
	say "You [verbword] [the noun] with [the second noun].".

	instead of breaking a broken thing:
	say "But the [noun] is already broken.".

	instead of breaking a broken thing with a second noun:
	say "But the [noun] is already broken.".

	report feeding something:
	say "You can't feed [the noun]."
	
	report feeding something with something:
	say "You can't feed [the noun] with [the second noun]."

	instead of fixing a broken thing:
	now the noun is unbroken;
	let verbword be word number 1 in the player's command;
	say "You [verbword] [the noun].".

	instead of fixing a broken thing with a second noun:
	now the noun is unbroken;
	let verbword be word number 1 in the player's command;
	say "You [verbword] [the noun] with [the second noun].".

	instead of fixing a unbroken thing:
	say "But [the noun] isn't broken!".

	instead of fixing a unbroken thing with a second noun:
	say "But [the noun] isn't broken!".

	instead of walking or crawling or running:
	say "You [verbword].".

	instead of walking around:
	say "You [verbword] around [the noun].".

	instead of walking behind:
	say "You [verbword] behind [the noun].".

	instead of walking on:
	say "You [verbword] on [the noun].".

	instead of walking over:
	say "You [verbword] over [the noun].".

	instead of walking under:
	say "You [verbword] under [the noun].".

	instead of walking through:
	say "You [verbword] through [the noun].".

	instead of walking in front of:
	say "You [verbword] in front of [the noun].".

	instead of running around:
	say "You [verbword] around [the noun].".

	instead of running behind:
	say "You [verbword] behind [the noun].".

	instead of running on:
	say "You [verbword] on [the noun].".

	instead of running over:
	say "You [verbword] over [the noun].".

	instead of running under:
	say "You [verbword] under [the noun].".

	instead of running through:
	say "You [verbword] through [the noun].".

	instead of running in front of:
	say "You [verbword] in front of [the noun].".

	instead of crawling around:
	say "You [verbword] around [the noun].".

	instead of crawling behind:
	say "You [verbword] behind [the noun].".

	instead of crawling on:
	say "You [verbword] on [the noun].".

	instead of crawling over:
	say "You [verbword] over [the noun].".

	instead of crawling under:
	say "You [verbword] under [the noun].".

	instead of crawling through:
	say "You [verbword] through [the noun].".

	instead of crawling in front of:
	say "You [verbword] in front of [the noun].".

	instead of sitting in something:
		if the noun is an enterable container:
			say "You sit in [the noun].";
			now yourself is on the noun;
		otherwise:
			say "You can't sit on [the noun]."

	instead of sitting on something:
		if the noun is an enterable supporter:
			say "You sit on [the noun].";
			now yourself is on the noun;
		otherwise:
			say "You can't sit on [the noun]."

	instead of sitting under something:
			say "You sit under [the noun]."	

	instead of sitting behind something:
			say "You sit behind [the noun]."

	instead of standing on something:
		if the noun is an enterable supporter:
			say "You stand on [the noun].";
			now yourself is on the noun;
		otherwise:
			say "You can't stand on [the noun]."

	instead of standing in something:
		if the noun is an enterable container:
			say "You stand in [the noun].";
			now yourself is in the noun;
		otherwise:
			say "You can't stand in [the noun]."

	instead of standing behind something:
			say "You stand behind [the noun]."

	instead of standing under something:
			say "You stand under [the noun]."

	instead of lieing on something:
		if the noun is an enterable supporter:
			say "You lie on [the noun].";
			now yourself is on the noun;
		otherwise:
			say "You can't lie on [the noun]."

	instead of lieing in something:
		if the noun is an enterable container:
			say "You lie in [the noun].";
			now yourself is in the noun;
		otherwise:
			say "You can't lie in [the noun]."

	instead of lieing under something:
	say "You lie under [the noun]."
		
	instead of pushing or moving or shifting a portable thing:
	say "You [verbword] [the noun].";

	instead of attacking something which is not the lifeguard:
	say "You [verbword] [the noun].";

	instead of attacking something which is not the lifeguard with something:
	say "You [verbword] [the noun] with [the second noun]." 

	instead of buying the idol from the lifeguard:
		say "He won't part with it for any price.".

	instead of bribing the lifeguard:
		say "He's too honest for that.".

	instead of offering something to the lifeguard:
		say "He doesn't want it.".
			
	instead of pushing or moving or shifting something which is fixed in place:
	say "Impossible!".

	a match is in Idyllic. the description is
	"A plain old sulphur match.".
	the match is either lit or unlit.
	the match is either struck or unstruck.
	the match is unstruck and unlit.

	the match can be extinguished.

	a piece of paper is in Idyllic.
	the paper is unfolded.
	the description of the piece of paper is
	"The paper is [if folded]folded.
	[otherwise]unfolded.[end if]".

	instead of unfolding the paper:
		if the paper is folded:
			now the paper is unfolded;
			say "You unfold the paper.";
		otherwise:
			say "The paper is already unfolded.".

	instead of folding the paper:
		if the paper is unfolded:
			now the paper is folded;
			say "You fold the paper.";
		otherwise:
			say "The paper is already folded.".

	instead of burning the paper:
	try burning the paper with the match.

	instead of burning the paper with the match:
	if the match is lit begin;
	remove the paper from play;
	say "You burn the paper and it disappears into the ether.";
	otherwise;
	say "Not till you strike the match.";
	end if.

	a piece of rope is in Idyllic.
	the description is "Used to tie things with.".

	a major league baseball is in Idyllic.
	the description of the baseball is
	"You caught this at a White Sox-Yankees game.".
	understand "ball" as the baseball.

	instead of throwing the baseball through an open unbroken window 
	when the player is in Idyllic:
	now the baseball is in Kitchen;
	say "You throw the ball through the open window. The ball lands in the kitchen.".
	
	instead of throwing the baseball through a closed unbroken window 
	when the player is in Idyllic:
	now the window is open;
	now the window is broken;
	now the baseball is in Kitchen;
	say "You throw the ball through the closed window, breaking it. The ball lands in the kitchen.".

	instead of throwing the baseball through an open unbroken window 
	when the player is in Kitchen:
	now the baseball is in Idyllic;
	say "You throw the ball through the open window. The ball lands back outside.";
	
	instead of throwing the baseball through a closed unbroken window 
	when the player is in Kitchen:
	now the window is open;
	now the window is broken;
	now the baseball is in Idyllic;
	say "You throw the ball through the closed window, breaking it. The ball lands back outside.";

	instead of throwing the baseball out of an open unbroken window when the player is in Kitchen:
	now the baseball is in Idyllic;
	say "You throw the ball out of the open window. The ball lands back outside.";

	instead of throwing the baseball out of a closed unbroken window when the player is in Kitchen:
	now the window is open;
	now the window is broken;
	now the baseball is in Idyllic;
	say "You throw the ball out of the closed window, breaking it. The ball lands back outside.";

	instead of throwing the baseball out of an open unbroken window when the player is in Idyllic:
	say "You're not in the Kitchen.";

	instead of throwing the baseball out of a closed unbroken window when the player is in Idyllic:
	say "You're not in the Kitchen.";
		
	a machinegun is in Idyllic.
	the printed name is "machine gun".
	understand "gun" or "machine gun" as the machinegun.
	the machinegun is either loaded or unloaded.
	the machinegun is unloaded.
	the description of the machinegun is
	"A 1920's style Eliot Ness model in .45 caliber. It is currently[if loaded] loaded.[otherwise] unloaded.[end if]".

	after loading an unloaded machinegun:
	now the machinegun is loaded;
	now the bullet drum is part of the machinegun;
	say "You load the gun with the bullet drum	
	which is now attached to it.";
	
	before loading a loaded machinegun:
	say "The gun is already loaded." instead.
	
	instead of loading the drum:
	try loading the machinegun.

	instead of loading the machinegun with the drum:
	try loading the machinegun;

	before loading the drum:
	say "Try loading the machine gun instead." instead.
	
	carry out unloading the machinegun:
	if the machinegun is loaded begin;
	now the bullet drum is carried by the player;
	now the machinegun is unloaded;
	say "You unload the drum from the gun.";
	otherwise;
	say "The gun isn't loaded.";
	end if.

	instead of unloading the drum,
	try unloading the machinegun.

	before removing the drum from the machinegun:
	try unloading the machinegun instead.

	before shooting something:
		if the machinegun is not carried by the player:
			say "You haven't got the gun!" instead.
	
	before shooting something when the machinegun is unloaded:
	say "The gun ain't loaded." instead.
		
	before shooting an unloaded machinegun:
	say "The gun ain't loaded." instead.
	
	before shooting something with an unloaded machinegun:
	say "The gun ain't loaded." instead.
	
	before shooting an unloaded machinegun at something:
	say "The gun ain't loaded." instead.
	
	instead of shooting the machinegun:
		if the machinegun is loaded:
			say "You fire the machine gun into the air and make a hell of a racket while doing so.";
		otherwise:
			say "The gun ain't loaded.".	

	instead of shooting something which is not the machinegun:
		if the machinegun is not carried by yourself:
			say "You haven't got the gun.";
		otherwise if yourself is carrying an unloaded machinegun:
			say "The Gun ain't loaded!";
		otherwise:
			remove the noun from play;
			say "You fire the gun at [the noun] and it disintegrates into nothingness.".
		
	before shooting the pool:
		if the machinegun is loaded:
			say "You send a wave of bullets into the water." instead;
		otherwise:
			say "The gun isn't loaded." instead.

	instead of shooting the pool with the machinegun:
	try shooting the pool.
	
	instead of shooting the machinegun at the pool:
	try shooting the pool.

	instead of shooting the poolwater with the machinegun:
	try shooting the pool.

	instead of shooting the machinegun at the poolwater:
	try shooting the pool.

	before shooting the machinegun at the machinegun:
	say "Impossible!" instead.
	
	instead of shooting the machinegun at the lifeguard:
	try killing the lifeguard.

	instead of shooting the lifeguard with the machinegun:
	try killing the lifeguard.

	instead of shooting the lifeguard:
	try killing the lifeguard.

	instead of killing something which is not a person:
	say "How the hell can you [verbword] an inanimate object?";

	instead of shooting the trashcan when yourself is in the trashcan:
	if the machinegun is loaded begin;
	say "You'd kill yourself in the process if you did so.";
	otherwise;
	say "The gun ain't loaded!";
	end if.

	instead of shooting the machinegun at the trashcan:
	try shooting the trashcan.

	instead of shooting the machinegun at something which is not the player:
	say "You fire the gun at [the second noun] and it disintegrates into nothingness.";
	remove the second noun from play;
		
	instead of shooting something which is not the player with the machinegun:
	remove the second noun from play;
	say "You fire the gun at [the second noun] and it disintegrates into nothingness.";
		
	before shooting the player:
	if the machinegun is loaded begin;
	say "You are not suicidal." instead;
	otherwise;	
	say "The gun ain't loaded and besides you're not suicidal.";
	end if.
	
	instead of killing the player:
	try shooting the player.

	instead of shooting the player with the machinegun,
	try shooting the player.

	instead of shooting the machinegun at the player,
	try shooting the player.

	a bullet drum is in Idyllic. 
	understand "bullets" as the bullet drum.
	the description is 
	"A bullet drum with infinite amount of bullets.".

	after taking the drum when the machinegun is loaded:
	now the machinegun is unloaded;
	now the drum is carried by the player;
	say "You remove the drum from the gun.".

	a bicycle pump is a thing in Idyllic.
	the description is "Handy for inflating stuff.".

	before checking the pool:
	say "You check the pool and find it full of water." instead.

	before checking the pool with the testing machine:
	say "You don't need the machine to check the pool. You can
	clearly see it's filled to the brim." instead.

	before checking the idol with the testing machine:
	say "The machine reveals some kind of treasure hidden within it." instead.

	a hula hoop is in Idyllic.

	after jumping through something 
	that is not the hula hoop:
	say "You can't jump through [the noun].";
	
	a balloon is in Idyllic.
	the balloon is inflatable.
	The description is
	"The balloon is [if deflated]deflated.[otherwise]inflated.[end if]".

	instead of inflating a deflated balloon with the pump:
		if the pump is broken:
			say "The [second noun] is broken, you'll have to fix it.";
		otherwise:
			now the balloon is inflated;
			say "You inflate the balloon with the bicycle pump."

	instead of blowing in a deflated balloon:
	now the balloon is inflated;
	say "You inflate the balloon.";
	
	instead of burning the match:
	try striking the match.

	instead of striking the match 
	when the match is extinguished:
	say "The match can no longer be struck.";
	
	instead of striking the match:
	if the match is unstruck begin;
	now the match is lit;
	now the match is struck;
	say "You strike the match and it 
	provides heat and light.";
	otherwise;
	say "The match has already been struck.";
	stop;
	end if.

	instead of extinguishing the match:
	try blowing out the match.

	instead of blowing the match:
	try blowing out the match.

	instead of blowing on the match:
	try blowing out the match.

	after blowing out the match when the 
	match is extinguished:
	say "The match is already extinguished.";
	
	instead of blowing out the match when the match is lit:
	now the match is extinguished;
	now the match is unlit;
	say "You blow out the lit match."

	after blowing out the match when the match is unstruck:
	say "The match isn't lit!.";

	after striking the match when the match is extinguished:
	say "The match can no longer be struck.".	
	
	a warning is part of yourself.

	the dirt is scenery in Idyllic.
	the indefinite article of the dirt is "a pile of".
	the dirt is diggable.
	the description is "
	[if hole is dug]A pile of dirt. [otherwise]What dirt?[end if]"

	the hole is an enterable container and scenery in Idyllic.

	the hole is either dug or undug.
	the hole is undug, fillable, and diggable.	

	instead of examining the hole:
	if the hole is undug begin;
	say "What hole?";
	otherwise;
	say "You see a hole dug in the ground here.";
	end if.

	before emptying an undug hole:	
	say "What hole?" instead.
	
	before emptying the hole:	
	if the poolwater is in the hole begin;	
	remove the poolwater from play;	
	say "You [verbword] the water in the hole back into the pool.";	
	stop;	
	otherwise;	
	say "The hole is empty.";	
	stop;	
	end if.

	check emptying the swimming pool:
	say "Impossible!" instead.
	
	carry out emptying the hole when the poolwater is not in the hole	
	and the number of things in the hole is not 0:
	remove the poolwater from play;
	say "You [verbword] the [list of things in the hole] back onto the ground";	
	now all the things in the hole are in Idyllic;
	
	check inserting something into the hole when the poolwater is in the hole: 
	say "The hole is already filled with water." instead.

	carry out inserting something into an empty hole:
	now the noun is in the hole;
	say "You put [the noun] into the hole.".

	before inserting something into an unempty hole:
	say "The hole is already filled with [the list of things in the hole]." instead.

	check inserting something into the trashcan when the canwater is in the trashcan: 
	say "The can is already filled with water." instead.
	
	before inserting something into the trashcan:
	if the canwater is in the trashcan,
	say "The can is already filled with water." instead.

	instead of inserting something into the trashcan:
	if the noun is in the trashcan begin;
	say "[The noun] is already in the trashcan.";
	otherwise;
	say "You put [the noun] into the trashcan.";
	now the noun is in the trashcan;
	end if.

	instead of emptying the trashcan:
	if the canwater is in the trashcan,
	remove the canwater from play;
	say "You [verbword] the water from the pool onto the ground where it evaporates.".

	instead of emptying the trashcan into the pool when the canwater is in the trashcan:
	remove the canwater from play;
	say "You [verbword] the water from the can back into the pool.".

	instead of emptying an unempty trashcan into the pool:
	say "You [verbword] [the list of things in the trashcan] into the pool.";
	now all the things in the trashcan are in the pool. 

	instead of emptying an unempty trashcan into the hole:
	say "You [verbword] [the list of things in the trashcan] into the hole.";
	now all the things in the trashcan are in the hole.

	instead of emptying an unempty trashcan:
	say "You [verbword] [the list of things in the trashcan] out onto the ground.";
	now every thing in the trashcan is in the location instead.

	instead of emptying the trashcan into the pool when the canwater is in the trashcan:
	remove the canwater from play;
	say "You [verbword] the water in the can back into the pool.".

	instead of emptying an unempty trashcan:
	now all the things in the trashcan are in the location;
	say "You [verbword] the trashcan onto the ground." instead.	
	
	report searching the hole:	
	if the hole is dug begin;	
	say "[if the number of things in the hole is 0]		
	The hole is empty.[otherwise]In the hole you see [a list of things in the hole].[end if]";	
	stop;	
	otherwise;	
	say "What hole?";	
	stop;	
	end if.

	after searching the trashcan:	
	say "[if the number of things in the trashcan is 0]The trashcan is empty.
	[otherwise]In the trashcan you see [a list of things in the trashcan]. [end if]";		

	after climbing in the hole when the player is in the hole:
	say "But you're already in the hole.";
	
	report climbing out the hole when the player is not in the hole:
	say "But you're not in the hole.";
	
	before taking the hole:
	say "When you figure that out, 
	I'll give you a billion bucks." instead.

	before filling a dug hole:
	now the hole is undug;
	now the hole is filled;
	say "You fill the hole with dirt and it disappears." instead.
	
	report filling an undug hole:
	say "There is no hole here to fill." 	

	check filling an undug hole with something:	
	say "There is no hole here to fill." instead
		
	before filling a dug hole with the dirt:
	now the hole is filled;
	now the hole is undug;
	say "You fill the hole with dirt and it disappears." instead.
	
	report filling an undug hole with something:
	say "There is no hole here to fill.";
	
	report filling an undug hole from the swimming pool:
	say "There is no hole here to fill.";
	
	instead of filling the hole from the swimming pool:
	if the poolwater is not in the hole begin;
	now the hole is filled; 
	now the poolwater is in the hole;
	say "You fill the hole with some water from the pool.";
	otherwise;
	say "The hole is already filled with water.";
	end if.

	instead of filling the hole with the poolwater,
	try filling the hole from the swimming pool.

	a shovel is in Idyllic.

	the ground is scenery in Idyllic.
	the ground is diggable.
	the rain is scenery in Idyllic.

	a fixed in place thing called an idol is in Idyllic.
	the description of the idol is "This is the great Idol of Rain".

	instead of throwing or taking the idol:
	say "It's much too heavy for you to pick up.".

	after attacking something with the idol:
	say "You aren't strong enough to lift it.";
	
	a feather is in Idyllic.
	the description of the feather is "A feather from a bird.".

	instead of blowing on the feather:
	if the feather is not carried by yourself begin;
	say "You blow on the feather it lands a short distance away from you.";
	otherwise;
	say "You blow on the feather and it sways between your fingers.";
	end if.

	an open enterable container called a swimming pool is in Idyllic.
	the pool is swimmable and fixed in place.
	the description of the pool is
	"How they managed to place such a large pool in this area is beyond me! A diving board sits at the end of the pool. There are thousands of gallons of water in the pool.".

	instead of searching the pool:
	if the number of things in the pool is greater than 1 begin;
	say "In the pool in additon to the water, you see [a list of things in the pool].";
	otherwise;
	say "It's filled with thousands of gallons of chlorinated water.";
	end if.

	a bunch of leaves is in the swimming pool.
	the description is "You don't understand how these leaves got here
	since there are no trees in the immediate vicinity.".

	instead of clearing a portable thing:
	say "Not right now!".

	instead of clearing the pool,
	try clearing the leaves from the swimming pool.
	
	instead of clearing the leaves from the pool:
	now the leaves is in Idyllic;
	say "You clear the leaves from the pool and drop them on the ground."

	instead of jumping in an undug hole:
	say "What hole?" 

	instead of jumping in something which is not a container:
	say "Kinda hard to do that since [the noun] ain't a container.".

	instead of jumping in a container:
	say "You jump into [the noun].";
	now yourself is in the noun.

	instead of jumping on something:
	say "You jump on the [noun].".

	instead of jumping over something:
	say "You jump over [the noun]."

	instead of jumping under something:
	say "You jump under [the noun]."

	instead of jumping through something:
	say "You jump through [the noun]."

	before jumping off something which is not the diving board:
	say "You jump off the noun." instead.

	before jumping off the pool: 
	say "Ridiculous!" instead.
	
	before jumping off the diving board:
		if yourself is on the board: 
			say "You jump off the board into the pool.";
			now the player is in the swimming pool instead;
		otherwise:
			say "You're not on the diving board." instead.

	before jumping from the diving board:
		if yourself is on the board: 
			say "You jump off the board into the pool.";
			now the player is in the swimming pool instead;
		otherwise:
			say "You're not on the diving board." instead.
	
	instead of throwing something into the pool:
	if the noun is not carried by the player begin;
	say "You haven't got [the noun].";
	otherwise;
	now the noun is in the swimming pool;
	say "You [verbword] [the noun] into the pool.";
	end if.

	before filling the pool:
	try filling the pool with the poolwater.
	
	before filling the pool with the poolwater:
	say "It's already filled with water. Get some glasses!" instead..

	instead of filling the pool with the dirt:
	if the hole is dug begin;
	say "Filling the pool with the dirt would be highly counterproductive!";
	otherwise;
	say "What dirt?";
	end if.

	report standing on the pool:
	say "When you learn to walk on water, let me know.";
	
	instead of sitting in the poolwater:
	try sitting in the pool.

	instead of standing in the poolwater:
	try standing in the pool.

	the diving board is an enterable scenery supporter in Idyllic.
	the description is "A plain low board which allows the user to dive into the pool.".

	poolwater is a fixed in place thing in the pool.
	the indefinite article of the poolwater is "some".
	the poolwater is swimmable.
	the description is "Chlorinated H2O.".
	the printed name is "water from the pool".
	understand "water" or "pool water" or "water from the pool" as the poolwater.

	canwater is a thing.
	the printed name is "water from the trashcan".
	understand "water" or "can water" or "water from the trashcan" as the canwater.
	the description is "This is the water you transfered from the pool.".

	instead of swimming in the canwater:
	say "Don't be silly!".

	instead of sitting in the poolwater:
	try sitting in the pool.

	instead of standing in the poolwater:
	try standing in the pool.

	before emptying the pool:
	say "You have no place to store the water." instead.
	
	instead of emptying the poolwater from the pool,
	try emptying the pool.

	instead of emptying the poolwater out of the pool,
	try emptying the pool.

	before taking the poolwater:
	say "Unfortunately it slips through your fingers." instead.

	report smelling the poolwater:
	say "It smells highly of chlorine.".

	understand "taste [something]" as eating.
	understand "taste [something]" as drinking.

	report tasting the poolwater:
	try drinking the poolwater.

	instead of unloading something:
	say "You unload [the noun].";
	
	instead of drinking the pool:
	try drinking the poolwater.

	instead of drinking from the swimming pool,
	try drinking the poolwater.

	instead of drinking the poolwater from the pool,
	try drinking the poolwater.

	instead of drinking the poolwater:
	say "The chlorine would poison you to death!"

	a closed openable enterable container called a trashcan is in Idyllic.
	the trashcan is fillable and emptyable.
	understand "barrel" or "can" or "trash" as the trashcan.

	before filling a closed trashcan:
	say "You need to open the trashcan before doing that." instead.

	before filling a closed trashcan with something:
	say "You need to open the trashcan before doing that." instead.

	instead of filling the trashcan from the swimming pool:
	try filling the trashcan with the poolwater.

	instead of filling the trashcan with the poolwater:
	if the canwater is not in the trashcan and the trashcan is unfilled begin;
	now the trashcan is filled;
	now the canwater is in the trashcan;
	say "You fill the trash can with some water from the pool.";
	otherwise;
	say "The trashcan is either already filled with water or has something in it.";
	end if.
	
	instead of sitting in the trashcan,
	say "You'd smell like garbage if you did so.".

	instead of sitting on the trashcan,
	say "It has no lid.".
	
	report blowing out the feather:
	say "Impossible!" instead.
	
	report inflating the feather:
	say "You're being totally ridiculous!" instead.
	
	report inflating the feather with something:
	say "You're being totally ridiculous!" instead.
	
	report praying to the idol:
	say "The idol appears not to have heard you." instead.
	
	report praying for rain:
	say "You are in an area where there is no chance of that." instead.
	
	check praying for something which is not rain:
	say "Don't be silly!" instead.

	check praying to something which is not the idol:
	say "Don't be silly!" instead.
	
	a portable enterable supporter called a lounge chair is in Idyllic.
	the description is "Just the thing for lying out at the pool!".

	instead of lieing in the chair,
	try lieing on the chair.

	instead of sitting in the chair,
	try sitting on the chair.

	Kitchen is a room.
	"This kitchen looks like something out of Zork 1 with the exception that the table, sack and bottle are holograms.".

	instead of exiting when yourself is in Kitchen:
	if the window is closed begin;
	say "The window isn't open.";
	otherwise;
	say "You climb out of the window and are now back in . . .";
	now yourself is in Idyllic;
	end if.

	instead of going west when yourself is in Kitchen:
	if the window is closed begin;
	say "The window isn't open.";
	otherwise;
	say "You climb out of the window and are now back in . . .";
	now yourself is in Idyllic;
	end if.

	a thing can be hologramic.

	a table, a bottle and a sack are in Kitchen.

	the table,bottle, and the sack are hologramic.

	instead of taking a hologramic thing in the Kitchen:
	say "Your hand passes right through it."
	
	the window is a door.
	the window is east of Idyllic and west of Kitchen.
	the window is closed, openable, scenery, and climbable.

	instead of breaking the window:
		if the window is unbroken:
			now the window is broken;
			now the window is open;
			say "You [verbword] the window and the glass disappears into smithereens.";
		otherwise if the window is broken:
			say "You can't break it any more than you already have." 

	before climbing in a closed window when yourself is in Idyllic:
	say "The window is closed." instead.

	before climbing out a closed window when yourself is in Kitchen:
	say "The window is closed." instead.

	before climbing out an open window when yourself is in Idyllic:
	say "Try climbing in the window from this location." instead.
	
	before climbing in an open window when yourself is in Kitchen:
	say "Try climbing out the window from this location." instead.

	before climbing in a broken window when yourself is in Idyllic:
	say "You climb in the broken window into the . . .";
	now yourself is in Kitchen instead;

	before climbing out a broken window when yourself is in Kitchen:
	say "You climb out the broken window back into . . .";
	now yourself is in Idyllic instead;

	before climbing through a broken window when yourself is in Idyllic:
	say "You climb through the broken window into the . . .";
	now yourself is in Kitchen instead;

	before climbing through a broken window when yourself is in Kitchen:
	say "You climb through the broken window back into . . .";
	now yourself is in Idyllic instead;

	instead of closing a broken window:
	say "How can you close a window with glass in it?".

	instead of examining a closed unbroken window:
	say "The window is closed.".

	Instead of examining a broken window:
	say "The window is totally broken and no glass remains." 

	instead of examining an open unbroken window:
	say "The window is open.".

	instead of looking north: say "You look to the north.".
	
	instead of looking south: say "You look to the south.".

	instead of looking east: say "You look to the east.".

	instead of looking west: say "You look to the west.".

	instead of looking northeast: say "You look to the northeast.".

	instead of looking northwest: say "You look to the northwest.".

	instead of looking southeast: say "You look to the southeast.".

	instead of looking southwest: say "You look to the southwest.".

	instead of looking up: say "You look up.".

	instead of looking down: say "You look down.".

	instead of looking behind something:
	say "You look beind the [noun].".

	instead of climbing through the window,
	try climbing in the window.

	instead of climbing through the window when the player is in Idyllic,
	try climbing in the window.

	instead of climbing through the window when the player is in Kitchen,
	try climbing out the window.

	report climbing in a unbroken closed window:
	say "The window is closed.";
	
	report climbing out the window when the window is closed:
	say "The window is closed.";
	
	report climbing in the window when the player is in Kitchen:
	try climbing out the window;
	
	report climbing in the window when the window 
	is open and the player is in Idyllic:
	say "You climb into the window and are now in . . .";
	now the player is in Kitchen;	

	report climbing out the window when the window is 
	open and the player is in Kitchen:
	say "You climb out of the window and are now back in . . .";
	now the player is in Idyllic;
	
	report climbing out the window when the player 
	is in Idyllic and the window is open:
	say "Try climbing in or through the window instead.";
	
	instead of exiting when the player is in Kitchen 
	and the window is open:
	try climbing out the window.

	instead of going inside when the player is in 
	Idyllic and the window is open:
	try climbing in the window.

	the side of a house is fixed in place in Idyllic.
	the indefinite article of the house is "the".
	the description of the house is
	"It appears to be a back wall of the house. 
	The other three walls are not	
	present. [if window is closed]A closed window 
	is several feet up the wall. 
	[otherwise]	An open window is several feet up 
	the wall.[end if]".

	instead of entering the house when the window is closed:
	try climbing in the window.

	instead of entering the house when the window is open,
	try climbing in the window.

	a fixed in place thing called a fence is in Idyllic.
	the fence is climbable.
	the description is "It consists of vertical slats and is	
	NOT a corral type fence which can be climbed under.".

	report climbing under the fence:
	say "Read the description! [line break]	
	You can't climb under this particular fence.";
	
	report climbing over the fence:
	say "You climb over the fence and after looking around	
	for awhile decide to go back where you came from.";
	
	the tree is a backdrop.
	the tree is in Idyllic and TreeTop.
	the tree is climbable.
	the description is "A very very tall oak.".

	report climbing up the tree when the player is in Idyllic:
	say "You climb to the top of the tree.";
	now the player is in TreeTop;
	
	instead of going up when the player is in Idyllic,
	try climbing up the tree.

	instead of climbing the tree when the player is in Idyllic,
	try climbing up the tree.

	instead of climbing up the tree when the player is in Idyllic,
	now the player is in TreeTop.

	instead of climbing down the tree when the player is in TreeTop:
	say "You climb back down the tree.";
	now the player is in Idyllic;
	
	instead of climbing the tree when the player is in TreeTop,
	try climbing down the tree.

	instead of going down when the player is in TreeTop,
	try climbing down the tree.

	TreeTop is a room. "From here you can see vast distances far beyond.
	[paragraph break]Below you, you see [a list of not scenery things in Idyllic].".

	after deciding the scope of yourself when yourself is in TreeTop:
	place Idyllic in Scope.

	before going down in TreeTop:
	say "You climb down the tree.";

	after reading a command when yourself is in TreeTop:
		if the player's command includes "down" or the player's command includes "climb down":
			say "You climb down the tree.";
			now yourself is in Idyllic;
			stop;
		else if the player's command matches "drop all":
			say "You drop [the list of things carried by yourself] down on the ground.";
			now everything carried by yourself is in Idyllic;
			stop;
		else if the player is carrying nothing:
			say "You aren't carrying anything.";
			stop.

	a man called the lifeguard is in Idyllic.
	understand "guard" or "man" as the lifeguard.
	the description of the lifeguard is
	"Although his jacket sports the title 'Lifeguard' he can't even swim a lick.".

	instead of shouting at the lifeguard:
	say "You [verbword] at the lifeguard.".

	the lifeguard wears a jacket.
	the description of the jacket is "It says 'L I F E G U A R D' on the back of it in big gaudy letters."

	after examining the lifeguard:
	say "He is wearing [a list of things worn by the lifeguard] and carrying [a list of things carried by the lifeguard].".

	Instead of giving something to the lifeguard:
	now the noun is carried by the lifeguard;
	say "The lifeguard reluctantly accepts your offer of [the noun].".

	instead of paying something:
	say "You pay [the noun]."

	instead of paying something to a second noun:
	say "You pay [the noun] to [the second noun].".

	instead of paying something for something:
	say "You pay [the noun] for [ the second noun].".

	instead of shouting the warning to the lifeguard:
	say "You shout: 'Look out' to the lifeguard.".	
	
	instead of shouting the warning at the lifeguard:
	say "You shout: 'The pool is overflowing!' at the lifeguard.".

	instead of throwing something into something:
	if the second noun is an open container begin;
	now the noun is in the second noun;
	say "You [verbword] [the noun] into [the second noun].";
	otherwise;
	if the second noun is a closed container,
	say "[The second noun] isn't open.";
	end if.

	instead of throwing something at something:
	now the noun is in the location;
	say "You [verbword] [the noun] at [the second noun].".

	instead of throwing something onto something:
	if the second noun is a supporter begin;
	now the noun is in the second noun;
	say "You [verbword] [the noun] onto the [second noun].";
	otherwise;
	say "The [second noun] is not a supporter, so that won't fly here.";
	end if.

	instead of throwing something down something:
	if the second noun is a container begin;
	now the noun is in the second noun;
	say "You [verbword] [the noun] down the [second noun].";
	otherwise;
	say "The [second noun] is not a container so that won't fly here.";
	end if.

	instead of throwing something over something:
	say "You [verbword] [the noun] over [the second noun].";

	instead of throwing something under something:
	say "You [verbword] [the noun] under [the second noun].";

	instead of throwing something through something:
	say "You [verbword] [the noun] through [the second noun].";

	instead of killing or attacking the lifeguard:
	say "Leave the poor fellow alone! What[']s he ever done to you?".

	report kissing the lifeguard:
	say "He refuses your amorous advances.";
	
	instead of digging the ground,	
	try digging the hole.

	instead of digging the ground with the shovel,	
	try digging the hole.
	
	instead of digging the ground with something which is not the shovel:
	say "Don't be silly, you need a shovel to dig the ground.";
	
	instead of digging the hole with something which is not the shovel:
	say "Don't be silly, you need a shovel to dig the ground.";	
	
	instead of digging the hole when the shovel is not carried by the player:	
	say "You need the shovel for that.".
	instead of digging a dug hole,	
	say "You've already dug the hole."

	instead of digging an undug hole,	
	try digging the hole with the shovel.

	instead of digging the hole in the ground:	
	if the hole is undug begin;
	now the hole is dug;	
	say "You dig in the ground and remove some dirt from a hole that is formed.";
	otherwise;
	say "You've already dug the hole.";	
	end if.
	
	instead of digging the hole with the shovel:
	if the hole is undug begin;
	now the hole is dug;	
	say "You dig in the ground and remove some dirt from a hole that is formed.";	
	otherwise;
	say "You've already dug the hole.";	
	end if.
	
	before diving in the pool when the player is in the pool:
	say "You're already in the pool." instead.

	before diving off the board when the player is in the pool:
	say "You're already in the pool." instead.

	before diving in the pool when the player is not on the board and the player is not in the pool:
	say "You dive into the pool from the side.";
	now the player is in the pool instead.
	
	before diving in the pool when the player is on the board
	and the player is not in the pool:
	say "You dive into the pool from the board.";
	now the player is in the pool instead.

	before diving in the pool when the 
	player is on the board:
	say "You dive into the pool from the diving board.";
	now the player is in the pool instead.

	before diving off the board when the player is on the board:
	say "You dive off the board into the pool.";
	now the player is in the pool instead.

	before diving off the board when the player is not on the board and
	the player is not in the pool:
	say "You're not on the diving board." instead.

	report killing something which is not a person:
	say "How the hell can you [verbword]a non-living thing.?";
	
	report lieing on the swimming pool:
	say "Try entering it instead.";
	
	report lieing in the swimming pool:
	say "Try entering it instead.";
	
	instead of swimming in the poolwater:
	say "You swim in the water.".

	before swimming:
		if yourself is not in the pool:
			say "You need to enter the pool first." instead;	
		otherwise:
			say "You swim in the pool." instead.
		
	before swimming in the pool:
		if yourself is not in the pool: 
			say "You need to enter the pool first." instead;	
		otherwise:
			say "You swim in the pool." instead.

	before swimming around the pool:
		if yourself is not in the pool:
			say "You need to enter the pool first." instead;
		otherwise:
			say "You swim around the pool." instead.

	before swimming across the pool:
		if yourself is not in the pool:
			say "You need to enter the pool first." instead;
		otherwise:
			say "You swim across the pool." instead.

	report swimming over the pool:
	say "Don't be ridiculous!";

	report swimming under the pool:
	say "Don't be ridiculous!";

	instead of swimming under the poolwater:
	say "You dive under water and swim around till your 
	lungs give out then you surface.".

	instead throwing something which is held by yourself into the pool:
	now the noun is in the pool;
	say "You throw [the noun] into the pool.".

	instead of throwing something which is not held into the pool:
	say "You haven't got [the noun].".

	[Test Scripts]

	test attack with "attack chair/hit chair/belt chair/punch chair/smack chair/
attack pump/whack chair/wallop chair/hit idol with chair/ hit idol with trashcan".

	test blow with "blow feather/take feather/blow feather/drop feather/ blow in balloon/
deflate balloon/inflate balloon with pump/deflate balloon/pump up balloon with pump/
deflate balloon/x match/strike match/blow out match/strike match/blow out match".

	test clean with "i/clean chair/rub chair/dust chair with cloth/
	scrub pool/ rub feather/polish balloon/sweep pool/shine chair with cloth/wipe idol/
wipe idol with cloth".

	test break with "break balloon/crack feather/crush chair/damage pump/destroy idol/
fracture fence/ruin chair/shatter idol/smash house/snap guard/trash feather/wreck fence/
vandalize pool"

	test bribe with "bribe guard/bribe guard with rain/bribe guard with chair".

	test buy with "buy idol/buy idol from guard"

	test check with "check pool/check pool with machine/check chair/check idol/
check idol with machine.".

	test clear with "clear can/clear chair/clear idol/clear pool/clear leaves from pool".

	test climb with "climb over fence/climb under fence/climb up tree/ climb down tree/
climb in can/climb out can/climb in can/climb out of can/ climb in window/open window/
climb in window/climb out window/climb through window/climb thru window".

	test crawl with "crawl/crawl around pool/crawl behind chair/crawl in front of chair/
	crawl on chair/crawl over fence/crawl under idol/crawl through pool"

	test cut with "cut rope/slash rope/slice rope/slit rope/nick rope/prune rope/lacerate rope/
scratch rope/cut rope with knife/slash rope with knife/slit rope with knife/slash rope with knife/scratch rope with knife/graze rope with knife/cut cloth with knife".

	test dig with "dig ground/dig ground with match/take shovel/ dig ground with shovel/
fill hole with dirt/dig ground with shovel/fill hole with dirt/dig hole in ground."

	test dive with "dive into pool/exit/stand on board/dive into pool/g/exit/ stand on board/
dive off board/dive into pool/exit.".

	test drink with "drink water/drink pool/drink from pool/drink water from pool".

	test drop with "take all/drop all but feather/take all/drop all in pool/take all from pool/
drop all but can in can/take all from can/drop all/look".

	test empty with "take all/open can/put all in can/empty can/take all/put all in can/empty can into pool".
	
	test examine with "x match/x paper/x machine gun/x bullet drum/x bicycle pump/x hula hoop/x balloon/
x shovel/x idol/x feather/x pool/x trashcan/x chair/x house/x fence/x tree/x lifeguard".

	test feed with "feed idol/feed guard/feed guard with rain/feed guard to idol/feed water to idol/
feed guard with water/feed idol with water/feed can with chair".

	test fill with "take shovel/dig hole/fill hole from pool/fill hole with water/fill can with water/open can/fill can with water/
empty can/take shovel/dig hole/fill hole with dirt".	
	
	test fix with "fix balloon/repair feather/mend chair/fix pump/fix pool with idol/mend chair with pool/ 
fix pool with chair/ repair idol/repair idol with pump"
	
	test fold with "x paper/fold paper/g/unfold paper/g".

	test give with "take chair/hand chair over to guard/ask guard for chair/give chair to guard"

	test inflate with "blow in balloon/deflate balloon/smash pump/inflate balloon with pump/
fix pump/inflate ballon with pump/deflate balloon/pump up balloon with pump/deflate balloon"

	test jump with "jump over chair/jump over idol/jump in pool/exit/ jump through hoop/
jump on chair/take shovel/dig ground/
	jump in hole/exit/fill hole with dirt/jump in hole/stand on board/jump on board/jump off 
board/exit/jump from board".

	test kill with "kill me/kill lifeguard/murder lifeguard/torture lifeguard/kill idol/kill feather/kill balloon".

	test lie with "lie on chair/open can/lie in trashcan/lie on idol/lie in pool/lie under chair/lie under idol/lie under tree".

	test load with "take gun/take drum/load gun/unload gun/load gun with bullets/load trashcan with gun/
unload gun from can/take feather/load chair with feather.".

	test look with "look north/look south/look east/look west/look northeast/look northwest/look southeast/
look southwest/look up/look down/look behind idol/look behind chair.".

	test move with "move chair/move can/move idol/move pool".

	test offer with "offer chair to guard/offer idol to gaurd/offer pool to guard"

	test pay with "pay guard/pay guard for water/pay idol/pay chair to idol/pay chair to idol".
	
	test push with "push chair/push can/push idol/push pool".

	test run with "run/run around pool/run behind chair/run in front of chair/run on chair/
run over fence/run under idol/run through pool"
	
	test sell with "sell idol to guard"

	test shoot with "shoot gun/take gun/shoot gun/load gun/shoot pool/shoot guard/shoot idol/
shoot match/shoot paper/shoot hoop/shoot shovel/
	shoot gun at gun/shoot pump/shoot feather/shoot gun at pool/shoot trashcan/shoot chair/shoot balloon".

	test shout with "shout at lifeguard/scream at lifeguard/yell at lifeguard/holler at lifeguard/
bellow at lifeguard/shout warning at lifeguard/shout warning to lifeguard".

	test sit with "sit on chair/sit on lifeguard/sit in trashcan/sit on trashcan/sit in chair/
sit on idol/sit behind idol/sit under idol".

	test stand with "stand on chair/stand on idol/stand on lifeguard/stand on trashcan/
stand in pool/stand in trashcan/stand under idol/stand behind idol".

	test talk with "talk to lifeguard/speak to lifeguard".

	test swim with "swim in feather/swim in chair/swim under balloon/swim over idol/
enter pool/swim in pool/swim across pool/
	swim in water/swim under water/swim through water/swim under pool/swim over pool/
swim around pool/exit".

	test pray with "pray/pray to idol/pray for idol/pray to pool/pray for match/
pray for rain/pray for me/pray to me".
	
	test shift with "shift pool/shift leaves/shift idol/shift guard"
		
	test steal with "give ball to guard/take ball/steal jacket/ steal ball from guard/
give hoop to guard/steal hoop.".

	test throw with "take all/ toss pump in pool/pitch balloon in pool/heave feather in pool/
hurl match in pool/throw gun in pool/toss shovel in pool/
	pitch hoop in pool/ throw drum in pool/heave chair in pool".

	test throwover with "take ball/ throw ball over pool/take ball/ throw ball over trashcan/
take ball/throw ball over idol/take ball/throw ball over trashcan".

	test throwout with "open window/enter enter window/throw ball out of window"

	test throwthru with "take ball/x ball/throw ball through window/open window/	
throw ball through window/east/take ball/throw ball through window/west/x ball/take ball".

	test throwunder with "take ball/throw ball under pool/take ball/throw ball under idol/
take ball/throw ball under chair/take ball/throw ball under trashcan".

	test unload with "load gun/unload drum/unload gun/load gun with bullets/unload gun/
load drum/unload gun".	

	test unfold with "x paper/unfold paper/g/fold paper/g".

	test walk with "walk/walk around pool/walk behind chair/walk in front of chair/
walk on chair/walk over fence/walk under idol/walk through pool"



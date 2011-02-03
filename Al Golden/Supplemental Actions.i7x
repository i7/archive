Version 28 of Supplemental Actions by Al Golden begins here.

"This extension adds 11 separated actions, 9 expanded actions, and 21 new actions.
It also allows an NPC to be given something,and the player to ask for carried items
owned by the NPC."

use MAX_ACTIONS of 900.

To say verbword: (- print (address) verb_word; -).

a thing is either blowable or unblowable.
a thing is usually unblowable. 

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

a thing is either safe or poisonous.
a thing is usually safe.

a thing is either swimmable or unswimmable.
a thing is usually unswimmable.

a thing is either vacated or unvacated.
a thing is usually vacated.

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
understand "injure [something]" as attacking.
understand "injure [someone]" as attacking.
understand "pummel [something]" as attacking.
understand "pummel[someone]" as attacking.
understand "pound [something]" as attacking.
understand "pound [someone]" as attacking.
understand "punch [something]" as attacking. 
understand "punch [someone]" as attacking. 
understand "smack [something]" as attacking.
understand "smack [someone]" as attacking.
understand "wack [something]" as attacking.
understand "wack [someone]" as attacking.
understand "wallop [something]" as attacking.
understand "wallop [someone]" as attacking.
understand "wound [something]" as attacking.
understand "wound [someone]" as attacking.

attacking it with is an action applying to two things.
understand "attack [someone] with [something]"   as attacking it with.
understand "attack [something] with [something]" as attacking it with.
understand "bash [someone] with [something]"   as attacking it with.
understand "bash [something] with [something]" as attacking it with.
understand "belt [someone] with [something]"   as attacking it with.
understand "belt [something] with [something]" as attacking it with.
understand "hit [something] with [something]"  as attacking it with. 
understand "hit [someone] with [something]"    as attacking it with.
understand "injure [something] with something" as attacking it with.
understand "injure [someone] with something" as attacking it with.

understand "pummel [something] with [something]" as attacking it with.
understand "pummel [someone] with [something]" as attacking it with.
understand "pound [something] with [something]" as attacking it with.
understand "pound [someone] with [something]" as attacking it with.
understand "punch [something] with [something]" as attacking it with.
understand "punch [someone] with [something]" as attacking it with.
understand "smack [something] with [something]" as attacking it with. 
understand "smack [someone] with [something]" as attacking it with.
understand "wack [something] with [something]" as attacking it with. 
understand "wack [someone] with [something]" as attacking it with.
understand "wallop [something] with [something]"as attacking it with. 
understand "wallop [someone] with [something]"  as attacking it with.
understand "wound [something] with [something]" as attacking it with.
understand "wound [someone] with [something]" as attacking it with.

carry out attacking something 
(this is the attacking something rule):
let verbword be word number 1 in the player's command; 
say "You [verbword] [the noun].";

carry out attacking something with a second noun
(this is the the attack it with something rule):
let verbword be word number 1 in the player's command; 
say "You [verbword] [the noun] with [the second noun].".

Part 02 - Blowing (new)

blowing is an action applying to one thing. 
blowing in is an action applying to one thing. 
blowing on is an action applying to one thing. 
blowing out is an action applying to one thing. 
blowing up is an action applying to one thing.

understand "blow [something]" as blowing.
understand "blow in [something]" as blowing in.
understand "blow on [something]" as blowing on.
understand "blow up [something]" as blowing up. 
understand "blow [something] up" as blowing up.
understand "blow out [something]" as blowing out. 
understand "blow [something] out" as blowing out.


check blowing up something (this is the can't blowup rule):
if the noun is unblowable,
say "You can't blow up [the noun]." instead.

check blowing up an inflated thing
(this is the already blown up thing rule):
say "[The noun] is already inflated." instead. 

carry out blowing up something:
if the noun is inflatable begin;
now the noun is inflated;
say "You blow up [the noun].";
otherwise;
say "[The noun] can't be inflated.";
end if.

check blowing something (this is the can't blow rule):
if the noun is unblowable,
say "You can't blow [the noun]." instead.

check blowing in something (this is the can't blow in rule):
if the noun is unblowable,
say "You can't blow in [the noun]." instead.


check  blowing in an inflated inflatable thing
(this is the already inflated rule):
say "[The noun] is already inflated." instead.

check blowing out something (this is the can't blow out rule): 
if the noun is unblowable,
say "You can't blow [the noun] out." instead.

report  blowing on something:
say "You blow on [the noun]."

report blowing in a blowable thing: 
say "You blow in [the noun]."

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

report breaking something:
say "You [verbword] [the noun].".

report breaking something with a second noun:
say "You [verbword] [the noun] with [the second noun].".

Part 04 - Burning

burning it with is an action applying to two things.
understand "burn [something] with [something]" as burning it with.

report burning something with a second noun
(this is the burning it with rule):
say "You burn [the noun] with [the second noun].".


Part 05 - Buying and Selling (new)

check buying:
say "You need to buy [the noun] from someone." instead.

buying it from is an action applying to two things.
understand "buy [something] from [something]" as buying it from.
understand "purchase [something] from [something]" as buying it from.

carry out buying something from something
(this is the buying it from rule):
say "You buy [the noun] from [ the second noun] at a fair price. 
Now you are the proud owner  of  a slightly-used [noun].";
now the noun is carried by yourself.

selling is an action applying to one thing.
understand "sell [something]" as selling.

report selling
(this is the report selling rule):
 say "Please rephrase that as sell [noun] to (someone).".

check buying a person from something
(this is the check buying a person rule):
say "Don't be ridiculous! You can't buy [the noun] from [the second noun]!" instead.
	
check selling a person to something
(this is the check selling a person rule):
say "Don't be ridiculous! You can't sell [the noun] to [the second noun]!" instead.

selling it to is an action applying to two things.
understand "sell [something] to [something]" as selling it to.

carry out selling something (called the goods) to something (called the mark)
(this is the selling it to rule):
now the goods is carried by the mark;	
say "You sell [the goods] to [the mark]." instead.

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

report cleaning something (this is the report cleaning rule):
say "You clean [the noun]."

report polishing something (this is the report polishing rule):
say "You polish [the noun]."

instead of rubbing something (this is the report rubbing  rule):
say "You rub [the noun]."

report scrubbing something
(this is the report scrubbing  rule):
say "You scrub [the noun]."

report shining something
(this is the report shining  rule):
say "You shine [the noun]."

report  sweeping something
(this is the report sweeping  rule):
say "You sweep [the noun]."

report wiping something
(this is the report wiping rule):
say "You wipe [the noun]."

report cleaning something with something
(this is the report cleaning something with something rule):
say "You clean [the noun] with [the second noun]."

report  dusting something with something
(this is the report dusting something with something rule):
say "You dust [the noun] with [the second noun]."

report  polishing something with something
(this is the report polishing something with something rule):
say "You polish [the noun] with [the second noun]."

report rubbing something with something
(this is the report rubbing something with something rule):
say "You rub [the noun] with [the second noun]."

report  scrubbing something with something
(this is the report scrubbing something with something rule):
say "You scrub [the noun] with [the second noun]."

report shining something with something
(this is the report shining something with something rule):
say "You shine [the noun] with [the second noun]."

report sweeping something with something
(this is the report sweeping something with something rule):
say "You sweep [the noun] with [the second noun]."

report wiping something with something
(this is the report wiping something with something rule):
say "You wipe [the noun] with [the second noun].";

Part 07 - Clearing (separated)

understand the command "clear" as something new.
clearing is an action applying to one thing.
understand "clear [something]" as clearing.

clearing it from is an action applying to two things.
understand "clear [something] from [something]" as clearing it from.
understand "clear [something] out of [something]" as clearing it from.

report clearing something
(this is the report clearing rule):
say "You clear [the noun].".

report clearing something from a second noun
(this is the report clearing something from something rule):
say "You clear [the noun] from [the second noun].".

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
understand "climb in/into [something]"  as climbing in.
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

check climbing an unclimbable thing 
(this is the unclimbable object rule):
say "[The  noun] can not be climbed." instead.

check climbing up an unclimbable thing 
(this is the can't climb up rule):
say "[The  noun] can not be climbed." instead.

check  climbing down an unclimbable thing 
(this is the can't climb down rule):
say "[The  noun] can not be climbed." instead.

check climbing in something which is not an enterable container
(this is the can't climb in an non-enterable container rule):
say "You are unable to climb into [the noun]." instead

check climbing on something which is not an enterable supporter
(this is the can't climb on an non-enterable supporter rule):
say "You are unable to climb onto [the noun]." instead.

report climbing over something:
say "You climb over [the noun].";

report climbing under something:
say "You climb under [the noun].";

report climbing a climbable thing:
say "You climb [the noun].";

report climbing up a climbable thing:
say "You climb up [the noun].";

report climbing down a climbable thing:
say "You climb down [the noun].";

report climbing in an enterable container:
say "You climb into [the noun].";
now the player is in the noun;

report climbing through something:
say "You climb through [the noun].".

report climbing out something:
say "You climb out of [the noun].";
now the player is in the location;

report climbing on an enterable supporter:
now the player is on the noun;
say "You climb onto [the noun]."

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
understand "cut   [something] with [something]" as cutting it with. 
understand "chop  [something] with [something]" as cutting it with. 
understand "slice [something] with [something]" as cutting it with. 
understand "nick  [something] with [something]" as cutting it with.
understand "prune [something] with [something]" as cutting it with. 
understand "sever [something] with [something]" as cutting it with. 
understand "slit  [something] with [something]" as cutting it with. 
understand "slash [something] with [something]"  as cutting it with.
understand "lacerate [something] with [something]"  as cutting it with. 
understand "lance [something] with [something]" as cutting it with.
understand "pierce [something] with [something]" as cutting it with.
understand "scratch [something] with [something]"  as cutting it with. 
understand "graze   [something] with [something]"  as cutting it with. 
understand "nick    [something] with [something]"  as cutting it with. 
understand "incise [something] with [something]"  as cutting it with. 

report cutting something:
let verbword be word number 1 in the player's command; 
say "You [verbword] [the noun].";

report cutting something with a second noun:
let verbword be word number 1 in the player's command; 
say "You [verbword] [the noun] with [the second noun].";

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

check digging something which is undiggable
(this is the can't dig an undiggable thing rule): 
say "You can't dig [the noun]." instead.

check digging in something which is undiggable
(this is the can't dig in an undiggable thing rule): 
say "You can't dig in [the noun]." instead.

check digging something which is undiggable with something
(this is the can't dig an undiggable thing with something rule): 
say "You can't dig [the noun]." instead.

report digging something which is diggable: 
say "You dig [the noun].";
 
report digging something which is diggable with something: 
say "You dig [the noun] with the [second noun].";

report digging something in a second noun:
say "You dig [a noun] in [the second noun]."

Part 11 - Diving (new)

diving in  is an action applying to one thing.
diving off is an action applying to one thing.

understand "dive in/into [something]" as diving in.
understand "dive off [something]" as  diving off.
understand "dive off of [something]" as diving off.
understand "dive from [something]" as diving off.

check diving in something which is not a container
(this is the can't dive into a non-container rule):
say "You can't dive into [the noun]." instead

check diving off something
(this is the can't dive off a non-supporter rule):
if the player is not on a supporter,
say "You're not on something that you can dive off of." instead. 

Part 12 - Drinking (expanded)

drinking from is an action applying to one thing.
understand "drink from [something]" as drinking from.

report drinking from something (this is the drinking from rule):
say "You drink from [the second noun].".

drinking it from is an action applying to two things.
understand "drink [something] from [something]" as drinking it from.

report drinking something from a second noun 
(this is the drinking something from a second noun rule):
say "You drink [the noun] from [the second noun].". 

Part 13 - Dropping (expanded)

understand the command "drop" as something new.


understand "drop [things preferably held]" as dropping. 

dropping it into is an action applying to two things. 
understand "drop [things] in/into [something]" as dropping it into.

dropping it onto is an action applying to two things. 
understand "drop [things] on/onto [something]" as dropping it onto.

dropping it down is an action applying to two things. 
understand "drop [things] down [something]" as dropping it down.


check dropping something into a second noun
(this is the non-held drop in container rule):
if the noun is not carried by the player,
say "You haven't got [the noun]." instead.

check dropping something onto something
(this is the can't drop what's not held onto a supporter rule):
if the noun is not carried by the player,
say "You haven't got [the noun]." instead.

check dropping something down a container
(this is the can't drop what's not held down a container rule):
if the noun is not carried by the player,
say "You haven't got [the noun]." instead.

check dropping something into a second noun
(this is the can't drop  into a non-container rule):
if the second noun is not a container,
say "You can't drop [the noun] into [the second noun]." instead.

check dropping something onto a second noun
(this is the can't drop onto a non-supporter rule):
if the second noun is not a supporter,
say "You can't drop [the noun] into [the second noun]." instead.


carry out dropping something carried by the player into a container 
(this is the dropping into a container rule):
say "You drop [the noun] into the [second noun].";
now the noun is in the second noun;

carry out dropping something carried by the player onto something
(this is the dropping onto a supporter rule): 
say "You drop [the noun] onto the [second noun]."; 
now the noun is on the second noun;

carry out dropping something carried by the player down a container
(this is the dropping down a  container rule):
say "You drop [the noun] down [second noun] where it becomes lost.";
remove the noun from play;

after reading a command
(this is the check dropping all rule when nothing is held by you rule):	
	if the player's command includes "drop all" and the player is carrying nothing:
		say "You aren't carrying anything.";		
		reject the player's command.

Part 14 - Eating (no longer requires holding)
		
understand the command "eat" as something new.
weating is an action applying to one thing.
understand "eat [things]" as weating.

check weating something which is not edible
(this is the check eating an inedible thing rule): 
say "That's not edible." instead.

instead of weating something which is poisonous
(this is the eating a poisonous thing rule):
say "You eat [the noun] which is not 
conducive to your health.";
end the game in death.

after weating something which is safe:
remove the noun from play;

Part 15 - Emptying (new)

definition: a container is unfilled if the number of things in it is 0.
definition: a container is vacated if the number of things in it is 0.
definition: a supporter is vacated if the number of things on it is 0.

emptying is an action applying to one thing.
understand "empty [something]" as emptying.
understand "empty [container]" as emptying.
understand "empty [something]" as emptying. 
understand "empty out [container]" as emptying. 
understand "empty [container] out" as emptying.
understand "empty [something] out" as emptying. 
understand "empty out [something]" as emptying.

understand the command "dump" as "empty".

emptying it into is an action applying to two things. 
understand "empty [container] in/into [something]" as emptying it into. 
understand "empty [container] in/into [container]" as emptying it into. 
understand "empty [something] in/into [something]" as emptying it into.

emptying it onto is an action applying to two things. 
understand "empty [container] on/onto [something]" as emptying it onto. 
understand "empty [something] on/onto [something]" as emptying it onto.

emptying it from is an action applying to two things. 

understand "empty [something] from [something]" as emptying it from.
understand "empty [something] out of [something]" as emptying it from.

check emptying a closed container
(this is the can't empty a closed container rule):
say "[The noun] isn't open." instead.

check emptying a closed container into something
(this is the can't empty a closed container into something rule): 
say "[The noun] isn't open." instead.

check emptying a closed container onto something
(this is the can't empty a closed container onto something rule):
say "[The noun] isn't open." instead.

check emptying a vacated container onto something
(this is the can't empty a vacated container onto something rule):
say "[The noun] is empty." instead.

check emptying a vacated container
(this is the can't empty a vacated container rule):
say "[The noun] is empty." instead.

check emptying a vacated supporter
(this is the can't empty a vacated supporter rule): 
say "There is nothing on [the noun] to empty." instead.

check emptying a vacated supporter into something
(this is the can't empty a vacated supporter into something rule):
say "[The noun] is empty." instead.

check emptying a vacated supporter onto something
(this is the can't empty a vacated supporter onto something  rule):
say "[The noun] is empty." instead.

check emptying a supporter onto something which is not a supporter
(this is the can't empty a supporter onto a non-supporter rule):
say "[The second noun] is not capable of holding the contents of [the noun]." instead.

check emptying a supporter onto a second noun
(this is the can't empty a vacated  supporter onto a supporter rule):
if the number of things on the noun is 0,
say "[The noun] is empty." instead.

check emptying something into a closed container
(this is the can't empty something into a closed container rule):
say "[The second noun] isn't open." instead.

check emptying a container into a second noun
(this is the can't empty something into a filled container rule):
if the second noun is filled or the number of things in the second noun is not 0,
say "Either [the second noun] is filled with something, 
or the [second noun] has something in it already" instead.

before emptying a container (this is the emptying a container rule):
if the number of things in the noun is not 0 begin;
now the noun is vacated;
say "You empty [the list of things in the noun] onto the floor.";
now everything in the noun is in the location instead;
otherwise;
say "[The noun] is empty." instead;
end if.

carry out emptying a supporter
(this is the emptying a supporter rule):
if the number of things on the noun is not 0 begin;
now the noun is vacated;
say "You empty [the list of things on the noun] onto the floor.";
now all the things on the noun are in the location;
otherwise;
say "There's nothing on [the noun].";
end if.


carry out emptying a supporter into something
(this is the emptying a supporter into something rule):
if the number of things on the noun is not 0,
say "You empty [the list of things on the noun] 
from [the noun] into [the second noun].";
now the noun is vacated;
now the noun is unfilled;
now all the things on the noun are in the second noun;

carry out emptying a container into a second noun
(this is the emptying a container into something rule):
say "You empty [the list of things in the noun] 
from [the noun] into [the second noun].";
now all the things in the noun are in the second noun;
now the noun is vacated;
now the second noun is filled

carry out emptying a container onto something
(this is the emptying a container onto something rule):
if the number of things in the noun is not 0,
now the noun is unfilled;
now the noun is vacated;
say "You empty [the list of things in the noun] from [the noun] 
onto [the second noun].";
now all the things in the noun are on the second noun;

carry out emptying something
(this is the 1st emptying contents of a container rule):
if the noun is not a container and the noun is in a container,
now the holder of the noun is vacated;
now the holder of the noun is unfilled;
say "You empty [the noun] out onto the floor.";
now the noun is in the location; 

carry out emptying something into something
(this is the 2nd emptying contents of a container rule):
if the noun is not a container and the noun is in a container, 
say "You empty [the noun] into [the second noun]."; 
now the noun is in the second noun.

carry out emptying something onto something
(this is the 3rd emptying contents of a container rule):
if the noun is not a container and the noun is in a container, 
say "You empty [the noun] onto the [second noun]."; 
now the noun is on the second noun;

carry out emptying something from a second noun
(this is the emptying something from a container rule):
say "You empty [the noun] from the [second noun] out onto the ground.";
now the noun is in the location.

Part 16 - Extinguishing (new)

extinguishing is an action applying to one thing. 
understand "extinguish [something]" as extinguishing. 
understand "put [something] out"  as extinguishing.
understand "put out [something]" as extinguishing.
understand "douse [something]" as extinguishing. 
understand "ext [something]" as extinguishing.

report extinguishing something:
say "You extinguish [the noun].".

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
(this is the first feeding rule):
say "You feed [the noun]." instead.

report feeding something to a second noun
(this is the feed it to something rule):
say "You feed [the noun] to [the second noun]." instead. 

after feeding something with a second noun
(this is the feeding it with rule):
say "You feed [the noun] with [the second noun].". 

Part 18 - Filling (new)

understand the command "fill" as something new.
filling is an action applying to one thing. 

understand "fill [something]" as filling.

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

check filling a filled thing  from something
(this is the first already filled rule):
say "[The noun] is already filled" instead.

check filling a filled thing with something
(this is the second already filled rule):
say "[The noun] is already filled with [a list of things in the noun].";

filling it from is an action applying to two things. 
understand "fill [something] from [something]" as filling it from.

filling it with is an action applying to two things. 
understand "fill [something] with [something]" as filling it with.

carry out filling an unfilled thing with something
(this is the filling report rule):
now the noun is filled;
now the second noun is in the noun;
now the second noun is filled;
say "You fill [the noun] with [the second noun].";

Part 19 - Fixing (separated) 

understand the command "fix" as something new.
fixing is an action applying to one thing.
understand "fix [something]" as fixing.
understand "repair [something]" as fixing.
understand "mend [something]" as fixing.

fixing it with is an action applying to two things.
understand "fix [something] with [something]" as fixing it with.
understand "repair [something] with [something]" as fixing it with.
understand "mend [something] with [something]" as fixing it with.

Part 20 - Folding/Unfolding (new)

a thing is either folded or unfolded.
a thing is usually unfolded.

folding is an action applying to one thing.
understand "fold [something]" as folding.

unfolding is an action applying to one thing.
understand "unfold [something]" as unfolding.

carry out folding something that is unfolded
(this is the folding an unfolded thing rule):
now the noun is folded;
say "You fold [the noun].";
	
after unfolding something that is folded
(this is the after unfolding rule):
now the noun is unfolded;
say "You unfold [the noun].";
	
check folding a folded thing
(this is the already folded rule):
say "[The noun] is already folded." instead.
	
check unfolding an unfolded thing
(this is the already unfolded rule):
say "[The noun] is already unfolded." instead.

Part 21 - Give and Asking For (allows NPC to give and take)

understand the command "give" as something new.
understand the command "hand" as something new.

understand "give [things] to [something]" as giving it to.
understand "give [things] to [someone]" as giving it to.

carry out giving something to a second noun
(this is the giving something to a person rule):
say "You give [the noun] to [the second noun].";
now the noun is carried by the second noun.

handing it over to is an action applying to two things.
understand "hand [something] over to [something]" as handing it over to.

carry out  handing something over to a second noun
(this is the handing it over to someone rule):
say "You hand [the noun] over to [the second noun].";
now the noun is carried by the second noun.

instead of asking a person  (called the requestee) for something (called the target)
(this is the asking someone for something rule):
if the requestee carries the target begin;
now the target is carried by the player;
say "[The requestee] gives you [the target]." instead;
otherwise;
say "[The requestee]  hasn't got the [target]." instead;
end if.

Part 22 - Inflating and Deflating (new)

Section 1 - Inflating

inflating is an action applying to one thing. 
understand "inflate [something]" as inflating. 
understand "pump up [something]" as inflating.
understand "pump [something] up" as inflating.

inflating it with is an action applying to two things. 
understand "inflate [something] with [something]" as inflating it with. 
understand "pump up [something] with [something]" as inflating it with. 
understand "pump [something] up with [something]" as inflating it with. 
understand "blow up [something] with [something]" as inflating it with. 
understand "blow [something] up with [something]" as inflating it with. 

check inflating an uninflatable thing
 (this is the can't inflate rule): 
say "You can't inflate [the noun]." instead.

check  inflating an inflated thing 
(this is the first already inflated rule):
say "[The noun] is already inflated." instead.

check inflating something which is inflated with something
 (this is the second already inflated rule):
say "[The noun] is already inflated." instead.

check inflating an uninflatable thing with something 
(this is the third inflatable rule): 
say "You can't inflate [the noun]." instead.

carry out inflating a deflated thing
(this is the someone inflating rule):
now the noun is inflated; 
say "You inflate [the noun].".

carry out inflating a deflated inflatable thing with something
(this is the someone inflating something with something rule):
now the noun is inflated;
say "You inflate [the noun] with [the second noun].".

Section 2 - Deflating

deflating is an action applying to one thing. 
understand "deflate [something]" as deflating.
understand "let air out of [something]" as deflating.

deflating it with is an action applying to two things.
understand "deflate [something] with [something]" as deflating it with.

carry out deflating an inflated thing:
now the noun is deflated;
say "You deflate [the noun].".


check deflating a deflated thing 
(this is the first already deflated rule):
say "[The noun] is already deflated." instead.

check deflating something  with a second noun 
(this is the second already deflated rule):
say "[The noun] is already deflated." instead.


Part 23 - Jumping (expanded)

jumping from is an action applying to one thing.
understand "jump from [something]" as jumping from.

jumping in is an action applying to one thing. 
understand "jump in/into [something]" as jumping in. 

check jumping in something that is not a container
(this is the can't jump into a non-container rule):
say "You can't jump into [the noun].";

carry out jumping in something
(this is the jumping in rule):
say "You jump into [the noun]."; 
now the player is in the noun;

jumping on is an action applying to one thing. 
understand "jump on/onto [something]" as jumping on.

carry out jumping on something
(this is the jumping on rule):
say "You jump on [the noun]."

jumping down is an action applying to one thing.
understand "jump down [something]" as jumping down.

report jumping down something
(this is the jumping down rule):
say "You jump down [the noun].".

jumping off is an action applying to one thing.
understand "jump off [something]" as jumping off.

understand "jump off of [something]" as jumping off.

carry out jumping off something
(this is the jumping off rule):
say "You jump off of [the noun].";
now the player is in the location;

jumping over is an action applying to one thing. 
understand "jump over [something]" as jumping over.

report jumping over something
(this is the jumping over rule):
say "You jump over [the noun].";

jumping through is an action applying to one thing. 
understand "jump through[something]" as jumping through.
understand "jump  thru [something]" as jumping through.

report jumping through something
(this is the jumping through rule):
say "You jump through [the noun].";

jumping under is an action applying to one thing. 
understand "jump under [something]" as jumping under.

report jumping under something
(this is the jumping under rule):
say "You jump under [the noun].";

Part 24 - Killing (expanded and synonyms)

understand the command "kill" as something new.
killing is an action applying to one thing. 
killing it with is an action applying to two things.

understand "kill [someone] with [something]"    as killing it with.
understand "kill [something] with [something]"  as killing it with. 
understand "murder [someone] with [something]"   as killing it with. 
understand "murder [something] with [something]" as killing it with.
understand "stab [someone] with [something]"   as killing it with. 
understand "stab [something] with [something]" as killing it with.
understand "torture [someone] with [something]"  as killing it with. 
understand "torture [something] with [something]"as killing it with. 

understand "murder [someone]" as killing. 
understand "murder [something]" as killing. 
understand "kill [someone]" as killing. 
understand "kill [something]" as killing. 
understand "stab [someone]" as killing. 
understand "stab [something]" as killing. 
understand "torture[someone]" as killing.
understand "torture[something]" as killing.

report killing (this is the report killing rule):
say "You [verbword] [the noun]."

report killing something with a second noun
(this is the report killing with something rule):
say "You [verbword] [the noun] with [the second noun].";

Part 25 - Loading and Unloading (new)

Section 1 - Loading

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

check loading something with something
(this is the can't load something with nothing rule):
if the second noun is not carried by the player,
say "You don't have [the second noun]." instead.

check loading something into a second noun
(this is the can't load a non-container rule):
if the second noun is not an open container,
say "[The second noun] is not capable of holding [the noun]." instead.

check loading something onto a second noun
(this is the can't load a non-supporter rule):
if the second noun is not a supporter,
say "[The second noun] is not capable of supporting [the noun]." instead.

check loading something from a second noun
(this is the can't load from an empty container rule):
if the number of things in the second noun is 0,
say "[The second noun] is empty." instead.

carry out loading something from a second noun
(this is the report loading from a second noun rule):
say "You load [the noun] from [the second noun].";
now the second noun is in the noun;

carry out loading something with a second noun
(this is the report loading with a second noun rule):
say "You load [the noun] with [the second noun].";
now the second noun is in the noun;

carry out loading into a second noun
(this is the report loading into a second noun rule):
say "You load [the noun] with [the second noun].";
now the second noun is in the noun;

carry out loading something onto a second noun
(this is the report loading onto a second noun rule):
say "You load [the noun] onto a [the second noun].";
now the second noun is on the noun;

report loading something
(this is the loading something rule):
say "You load [the noun].";

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

carry out unloading something with a second noun
(this is the loading with a second noun rule):
say "You unload [the noun] with [the second noun].";
now the second noun is in the location.

carry out unloading into a second noun
(this is the loading into a second noun rule):
say "You unload [the noun] into [the second noun].";
now the second noun is in the noun;

carry out unloading something onto a second noun
(this is the loading onto a second noun rule):
say "You unload [the noun] onto a [the second noun].";
now the second noun is on the noun;


carry out unloading something from a second noun
(this is the loading from a second noun rule):
say "You unload [the noun] from [the second noun].";
now the second noun is in the location.

report unloading something
(this is the report loading rule):
say "You unload [the noun].";

Part 26 - Looking (expanded)

looking behind is an action applying to one thing.
understand "look behind [something]" as looking behind.

report looking behind something (this is the look behind rule):
say "You look behind [the noun].".

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
understand "look east" or "look e" as  looking east.
understand "look west" or "look w" as  looking west.
understand "look northeast" or "look ne" as  looking northeast.
understand "look northwest" or "look nw" as  looking northwest.
understand "look southeast" or "look se" as  looking southeast.
understand "look southwest" or "look sw" as  looking southwest.
understand "look up" or "l u" or "lu"  as looking up.
understand "look down" or "l d" or "ld" as looking down.
understand "look behind [something]" as looking behind.
understand "l b [something]" or "lb [something]" as looking behind.

report looking north (this is the looking north rule):
say "You see nothing to the north.".

report looking south (this is the looking south rule):
say "You see nothing to the south.".

report looking east  (this is the looking east rule):
say "You see nothing to the east.".

report looking west (this is the looking west rule):
say "You see nothing to the west.".

report looking northeast (this is the looking northeast rule):
say "You see nothing to the northeast.".

report looking northwest (this is the looking northwest rule):
say "You see nothing to the northwest.".

report looking southeast (this is the looking southeast rule):
say "You see nothing to the southeast.".

report looking southwest (this is the looking southwest rule):
say "You see nothing to the southwest.".

report looking up (this is the looking up rule):
say "You see the sky.".

report looking down (this is the looking down rule):
say "You see the ground.".

report looking behind something (this is the looking behind rule):
say "You see nothing behind [the noun].".

Part 27 - Mixing  (new)

mixing is an action applying to one thing.
understand "mix [something]" as mixing.

mixing it with is an action applying to two things. 
understand "mix [something] with [something]" as mixing it with.

report mixing
(this is the report mixing rule):
say "What do you want to mix [the noun] with?"

report mixing something with a second noun
(this is the report mixing together rule):
say "You mix [the noun] with [the second noun].".

Part 28 - Moving (separated)

understand the command "shove" as "push".

understand the command "move" as something new.
moving is an action applying to one thing.
understand "move [something]" as moving.

report moving something
(this is the moving report rule):
say "You move [the noun].".

Part 30 - Offering (separated)

understand the command "offer" as something new.
offering it to is an action applying to two things.
understand "offer [something] to [someone]" as offering it to.
understand "offer [something] to [something]" as offering it to.

report offering something to a second noun
(this is the offering it to someone rule):
say "You offer [the noun] to [the second noun].";

Section 1 - Bribing (new)

bribing is an action applying to one thing.
understand "bribe [someone]" as bribing.

bribing it with is an action applying to two things.
understand "bribe [someone] with [something]" as bribing it with.

report bribing
(this is the bribing rule):
say "You bribe [the noun].";

report bribing someone with a second noun
(this is the bribing someone with something rule):
say "You bribe [the noun] with [the second noun].";

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
(this is the paying rule):
say "You pay [the noun].";

after paying something to a second noun 
(this is the paying something to rule):
say "You pay [the noun] to [the second noun].";

after paying someone for something
 (this is the paying someone for rule):
say "You pay [the noun] for [the second noun].".

Part 30 - Positions (Sitting,Standing,Lieing)

understand the command "lie" as something new.

lieing in is an action applying to one thing.
understand "lie in [something]" as lieing in. 

lieing on is an action applying to one thing.
understand "lie on [something]" as lieing on.

lieing under is an action applying to one thing.
understand "lie under [something]" as lieing under.

check lieing on something which is not enterable
(this is the can't lie on a non-supporter rule):
say "You can't lie on [the noun]." instead.

check lieing in something which is not enterable
(this is the can't lie in a non-container rule) :
say "You can't lie in [the noun]." instead.

carry out lieing under something
(this is the lie under rule):
say "You lie in [the noun].";
 
carry out lieing on an enterable supporter
(this is the lie on rule):
say "You lie on the [noun].";
now the player is on the noun.

carry out lieing in an enterable container
(this is the lie in rule):
say "You lie in the [noun].";
now the player is in the noun.

understand the command "sit" as something new.

sitting on is an action applying to one thing.
understand "sit on [something]" as sitting on.
understand "sit on top of [something]" as sitting on.

sitting in is an action applying to one thing.
understand "sit in [something]" as sitting in.

sitting under is an action applying to one thing.
understand "sit under [something]" as sitting under.

sitting behind is an action applying to one thing.
understand "sit behind [something]" as sitting behind.

check sitting on something
(this is the can't sit on a non-enterable supporter rule):
if the noun is not an enterable supporter,
say "You can't sit on [the noun].";

check sitting in something
(this is the can't sit in a non-enterable container rule)::
if the noun is not an enterable container,
say "You can't sit in [the noun].";

carry out sitting in an enterable container:
say "You sit in [the noun].";
now the player is in the noun;

report sitting under something
(this is the sit under rule):
say "You sit under [the noun]."  instead.

report sitting behind something
(this is the sit behind rule):
say "You sit behind [the noun]." instead.

carry out sitting on an enterable supporter
(this is the sit on rule):
say "You sit on [the noun].";
now the player is on the noun;

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

carry out standing on an enterable supporter
(this is the 1st standing on a supporter rule):
say "You stand on [the noun].";
now the player is on the noun;

carry out standing in an enterable container
(this is the standing in rule):
say "You stand in [the noun].";
now the player is in the noun;

report standing on something
(this is the 2nd report standing on a supporter rule):
say "You stand on [the noun].";

check standing on something
(this is the can't stand on an non-enterable supporter rule):
if the noun is not an enterable supporter,
say "You can't stand on [the noun]." instead.

check standing in something
(this is the can't stand in an non-enterable container rule):
if the noun is not an enterable container,
say "You can't stand in [the noun]." instead.

report standing in something
(this is the report standing in rule):
say "You stand in [the noun].".

report standing under something
(this is the report standing under rule):
say "You stand under [the noun].".

report standing behind something
(this is the report standing behind rule):
say "You stand behind [the noun].".

Part 32 - Pouring (new)

pouring is an action applying to one thing.
understand "pour [something]" as pouring.
understand "pour [container]" as pouring.
understand "pour [something]" as pouring. 
understand "pour out [container]" as pouring. 
understand "pour [container] out" as pouring.
understand "pour [something] out" as pouring. 
understand "pour out [something]" as pouring.

understand the command "spill" as "pour".

pouring it into is an action applying to two things. 
understand "pour [container] in/into [something]" as pouring it into. 
understand "pour [container] in/into [container]" as pouring it into. 
understand "pour [something] in/into [something]" as pouring it into.

pouring it onto is an action applying to two things. 
understand "pour [container] on/onto [something]" as pouring it onto. 
understand "pour [something] on/onto [something]" as pouring it onto.

pouring it from is an action applying to two things. 
understand "pour [something] from [something]" as pouring it from.
understand "pour [something] out of [something]" as pouring it from.

check pouring a closed container 
(this is the can't pour a closed container rule):
say "[The noun] isn't open." instead.

check pouring a closed container into something
(this is the can't pour a closed container into something rule):
say "[The noun] isn't open." instead.

check pouring a closed container onto something
(this is the can't pour a closed container onto something rule):
say "[The noun] isn't open." instead.

carry out pouring an open container when the number of things in the container is not 0
:
now the noun is unfilled;
say "You pour the [list of things in the noun] onto the floor.";
now everything in the noun is in the location;

check pouring a vacated open container
(this is the can't pour a vacated container rule):
say "[The noun] is empty.";

check pouring an unfilled container
(this is the can't pour an unfilled container rule):
say "[The noun] is empty." instead.

check pouring a vacated container
(this is the can't pour an empty container rule): 
say "[The noun] is empty." instead.

check pouring something into a closed container
(this is the can't pour into a closed container rule):
say "[The second noun] isn't open." instead.

check pouring a container into something which is filled
(this is the can't pour into a filled container rule):
say "[The second noun] is already filled with [list of things in the second noun].";

carry out pouring a supporter when the number
of things on the supporter is not 0
(this is the pouring a supporter out rule):
say "You pour the [list of things on the noun] onto the floor.";
now all the things on the noun are in the location;
now the noun is unfilled;
now the noun is vacated;

carry out pouring a container into something
(this is the pouring a container into something rule):
say "You pour the [list of things in the noun] from [the noun] 
into [the second noun].";
now the second noun is filled;
now the noun is unfilled;
now the noun is vacated;
now all the things in the noun are in the second noun;

carry out pouring a supporter into something
(this is the pouring a supporter into  something rule):
say "You pour the [list of things on the noun] into [the second noun].";
now all the things on the noun are in the second noun;
now the noun is unfilled;
now the noun is vacated;

carry out pouring a filled thing onto something
(this is the pouring a filled thing onto something rule):
say "You pour the [list of things in the noun] onto [the second noun].";
now the noun is unfilled;
now the noun is vacated;
now all the things in the noun are on the second noun;

carry out pouring something
(this is the pouring something in a container onto something rule):
if the noun is not a container and the noun is in a container,
say "You pour [the noun] out onto the floor."; 
now the noun is in the location;
 
carry out pouring something into something
(this is the pouring something in a container into something rule):
if the noun is not a container and the noun is in a container, 
say "You pour [the noun] into [the second noun]."; 
now the noun is in the second noun;

carry out pouring something onto something
(this is the pouring someting in a  container onto something rule):
if the noun is not a container and the noun is in a container, 
say "You pour [the noun] onto the [second noun]."; 
now the noun is on the second noun;

Part 33 - Praying (expanded)

praying is an action applying to nothing. 
understand "pray" as praying.

praying to is an action applying to one thing.
understand "pray to [something]" as praying to.

praying for is an action applying to one thing. 
understand "pray for [something]" as praying for.

report praying
(this is the first praying rule):
say "Your prayers go unanswered." instead.

report praying to something
(this is the second  praying rule):
say "You pray to the [noun]." instead.

report praying for something
(this is the third praying rule):
say "You pray for [the noun]." instead.

Part 34 - Reading (separated)

understand the command "read" as something new.
reading is an action applying to one thing.
understand "read [something]" as reading.

report reading
(this is the reading rule):
say "You read [the noun]."

Part 35 - Screwing (separated)

understand the command "screw" as something new.
screwing is an action applying to one thing.
understand "screw [something]" as screwing.


screwing it with is an action applying to two things.
understand "screw [something] with [something]" as screwing it with.

report screwing something
(this is the 1st screwing output rule):
say "You screw [the noun].".

report screwing something with something
(this is the 2nd screwing output rule):
say "You screw [the noun] with [the second noun]."

Section 1 - Unscrewing (new)

understand the command "unscrew" as something new.
unscrewing is an action applying to one thing.
understand "unscrew [something]" as unscrewing.

report unscrewing something
(this is the 1st unscrewing output rule):
say "You unscrew [the noun].".

unscrewing it with is an action applying to two things.
understand "unscrew [something] with [something]" as unscrewing it with.

report unscrewing something with something
(this is the 2nd unscrewing output rule):
say "You unscrew [the noun] with [the second noun]."

Part 36 - Shifting (separated)

understand the command "shift" as something new.
shifting is an action applying to one thing.

understand "shift [something]" as shifting.

report shifting something
(this is the report shifting rule):
say "You shift [the noun].".

Part 37 - Shooting (new)

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
understand "shoot [something] at [something]" as shooting it at. 
understand "shoot [something] at [someone]" as shooting it at. 
understand "fire [something] at [something]" as shooting it at. 
understand "fire [something] at [someone]" as shooting it at. 

report shooting something
(this is the first shooting rule):
say "You shoot [the noun].";

report shooting something with something
(this is the the 2nd shooting rule):
say "You shoot [the noun] with [the second noun].";

report shooting something at something
(this is the the 3rd shooting rule):
say "You shoot [the noun] at [the second noun].";

Part 38 - Stealing (new)

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

carry out stealing
(this is the result of stealing rule):
say "You steal [the noun].";
now the noun is carried by the player.

carry out stealing something from a second noun
(this is the steal something from some one-thing rule):	
say "You steal [the noun] from [the second noun].";
now the noun is carried by the player;

Part 39 - Striking (new)

striking is an action applying to one thing. 

understand "strike [something]" as striking. 
understand "ignite [something]" as striking.

report striking
(this is the striking output rule):
say "You [verbword] [the noun]."

Part 40 - Swimming (new)

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

check swimming around something which is unswimmable
(this is the can't swim around an unswimmable thing rule):
say "You can't swim around [the noun].";

check swimming over something which is unswimmable
(this is the can't swim over an unswimmable thing rule):
say "You can't swim around [the noun]." instead 

check swimming under something which is unswimmable
(this is the can't swim under an unswimmable thing rule):
say "You can't swim around [the noun]." instead 

check swimming across something which is unswimmable
(this is the can't swim across an unswimmable thing rule):
say "You can't swim around [the noun]." instead 

check swimming in something which is unswimmable
(this is the can't swim in an unswimmable thing rule):
say "You can't swim around [the noun]." instead 

report swimming
(this is the 1st swimming report rule):
say "You take a swim."

report swimming in a swimmable thing
(this is the swimming in rule): 
say "You swim in [the noun]."

report swimming under a swimmable thing
(this is the swimming under rule): 
say "You swim under [the noun]."
 
report swimming over a swimmable thing
(this is the swimming over rule): 
say "You swim over [the noun]."

report swimming around a swimmable thing
(this is the swimming around rule): 
say "You swim around [the noun]."

report swimming across a swimmable thing
(this is the swimming across rule): 
say "You swim across [the noun]."

report swimming through a swimmable thing
(this is the swimming through rule): 
say "You swim through [the noun]."

report swimming in something which is unswimmable
(this is the swimming in an unswimmable thing rule): 
say "You can't swim in [the noun]."

Part 41 - Talking and Shouting (new)

understand the command "speak" as something new.

talking is an action applying to nothing.
understand "talk" as talking.

talking to is an action applying to one thing.
understand "talk to [something]" as talking to.
understand "speak to [something]" as talking to.
understand "talk to [someone]" as talking to.
understand "speak to [someone]" as talking to.

understand the command "shout" as something new.
shouting is an action applying to nothing.
understand "shout" as shouting.
understand "yell" as shouting.
understand "scream" as shouting.
understand "holler" as shouting.
understand "bellow" as shouting.
understand "screech" as shouting.

shouting at is an action applying to one thing.
understand "shout at [something]" as shouting at.
understand "yell at [something]" as shouting at.
understand "scream at [something]" as shouting at.
understand "holler at [something]" as shouting at.
understand "bellow at [something]" as shouting at.

understand "screech at [something]" as shouting at.

shouting to is an action applying to one thing.

understand "shout to [something]" as shouting to.
understand "yell to [something]" as shouting to.
understand "scream to [something]" as shouting to.
understand "holler to [something]" as shouting to.
understand "bellow to [something]" as shouting to.

understand "screech to [something]" as shouting to.

shouting it at is an action applying to two things.
understand "shout [something] at [something]" as shouting it at.
understand "yell [something] at [something]" as shouting it at.
understand "scream [something] at [something]" as shouting it at.
understand "holler [something] at [something]" as shouting it at.
understand "bellow [something] at [something]" as shouting it at.
understand "screech [something] at [something]" as shouting it at.

shouting it to is an action applying to two things.
understand "shout [something] to [something]" as shouting it to.
understand "yell [something] to [something]" as shouting it to.
understand "scream [something] to [something]" as shouting it to.
understand "holler [something] to [something]" as shouting it to.
understand "bellow [something] to [something]" as shouting it to.
understand "screech [something] to [something]" as shouting it to.

report shouting
(this is the shouting rule): 
say "You [verbword].";

report shouting at something
(this is the shouting at rule): 
say "You [verbword] at [the noun].".

report shouting to something
(this is the shouting to rule): 
say "You [verbword] to [the noun].".	

report shouting something at something
(this is the shouting something at something rule): 
say "You [verbword] [the noun] at [the second noun].".

report shouting something to something
(this is the shouting something to something rule): 
say "You [verbword] [the noun] to [the second noun].".

report talking to someone
(this is the talking to someone rule):
say "You [verbword] to [the noun].".


Part 42 - Throwing (expanded)

understand the command "throw" as something new.

throwing is an action applying to one thing.
understand "chuck [things]" as throwing. 
understand "heave [things]" as throwing. 
understand "throw [things]" as throwing.
understand "toss  [things]" as throwing.
understand "hurl  [things]" as throwing. 
understand "pitch [things]" as throwing.

understand "throw [something] at [something]" as throwing it at.

throwing it into is an action applying to two things.
understand "chuck [things] in/into [something]" as throwing it into. 
understand "heave [things] in/into [something]" as throwing it into. 
understand "throw [things] in/into [something]" as throwing it into. 
understand "toss  [things] in/into [something]" as throwing it into. 
understand "hurl  [things] in/into [something]" as throwing it into. 
understand "pitch [things] in/into [something]" as throwing it into.

throwing it onto is an action applying to two things. 
understand "chuck [things] on/onto [something]" as throwing it onto.
understand "heave [things] on/onto [something]" as throwing it onto. 
understand "throw [things] on/onto [something]" as throwing it onto. 
understand "toss  [things]  on/onto [something]" as throwing it onto. 
understand "hurl  [things]  on/onto [something]" as throwing it onto. 
understand "pitch [things]  on/onto [something]" as throwing it onto.

understand "chuck [things] on/onto [something]" as throwing it onto.
understand "heave [things] on/onto [something]" as throwing it onto. 
understand "throw [things] on/onto [something]" as throwing it onto. 
understand "toss  [things]  on/onto [something]" as throwing it onto. 
understand "hurl   [things]  on/onto [something]" as throwing it onto. 
understand "pitch [things]  on/onto [something]" as throwing it onto.

throwing it down is an action applying to two things.

understand "chuck [things] down [something]" as throwing it down. 
understand "throw [things] down [something]" as throwing it down. 
understand "heave [things] down [something]" as throwing it down. 
understand "toss  [things] down [something]" as throwing it down. 
understand "hurl  [things] down [something]" as throwing it down.
understand "pitch [things] down [something]" as throwing it down.

throwing it off is an action applying to two things.

understand "chuck [things] off [something]" as throwing it off. 
understand "heave [things] off [something]" as throwing it off. 
understand "throw [things] off [something]" as throwing it off. 
understand "toss  [things] off [something]" as throwing it off. 
understand "hurl  [things] off [something]" as throwing it off.
understand "pitch [things] off [something]" as throwing it off.

throwing it over is an action applying to two things.

understand "chuck [things] over [something]" as throwing it over. 
understand "throw [things] over [something]" as throwing it over. 
understand "heave [things] over [something]" as throwing it over.  
understand "toss  [things] over [something]" as throwing it over. 
understand "hurl  [things] over [something]" as throwing it over. 
understand "pitch [things] over [something]" as throwing it over. 

throwing it under is an action applying to two things.

understand "chuck [things] under [something]" as throwing it under. 
understand "throw [things] under [something]" as throwing it under. 
understand "heave [things] under [something]" as throwing it under.  
understand "toss  [things] under [something]" as throwing it under. 
understand "hurl  [things] under [something]" as throwing it under. 
understand "pitch [things] under [something]" as throwing it under. 

throwing it through is an action applying to two things.
understand "chuck [things] through [something]" as throwing it through. 
understand "throw [things] through [something]" as throwing it through. 
understand "heave [things] through [something]" as throwing it through. 
understand "toss  [things] through [something]" as throwing it through. 
understand "hurl  [things] through [something]" as throwing it through.
understand "pitch [things] through [something]" as throwing it through.

check throwing something into a closed container
(this is the can't throw into a closed container rule):
say "[The second noun] isn't open." instead.

check throwing something at a second noun
(this is the first can't throw what you don't have rule):
if the noun is not carried by the player,
say "You don't have [the noun]." instead.

check throwing something into a closed container
(this is the second can't throw what you don't have rule):
if the noun is not carried by the player,
say "You haven't got [the noun]." instead.

check throwing something over a second noun
(this is the third can't throw what you don't have rule):
if the noun is not carried by the player,
say "You don't have [the noun]." instead.

check throwing something over a second noun
(this is the fourth can't throw what you don't have rule):
if the noun is not carried by the player,
say "You don't have [the noun]." instead.

check throwing something under a second noun
(this is the fifth can't throw what you don't have rule):
if the noun is not carried by the player,
say "You don't have [the noun]." instead.

check throwing something down a second noun
(this is the sixth can't throw what you don't have rule):
if the noun is not carried by the player,
say "You don't have [the noun]." instead.

check throwing something through a second noun
(this is the seventh can't throw what you don't have rule):
if the noun is not carried by the player,
say "You don't have [the noun]." instead.

check throwing something into a second noun
(this is the throwing something into something rule):
if the second noun is not a open  container,
say "[The second noun] can't hold anything." instead.

report throwing something over a second noun
(this is the throwing something over something rule):
now the noun is in the location;
say "You throw [the noun] over [the second noun].";

report throwing something into a second noun
(this is the report throwing something into something rule):
now the noun is in the second noun;
say "You [verbword] [the noun] into [the second noun].".

carry out throwing something under a second noun
(this is the throwing something under something rule):
now the noun is in the location;
say "You throw [the noun] under [the second noun].".

carry out throwing something down a second noun
(this is the throwing something down something rule):
now the noun is in the location;
say "You throw [the noun] under [the second noun].".


Part 43 - Checking Separated from Look

understand the command "check" as something new.

checking is an action applying to one thing.
understand "check [something]" as checking.

checking it with is an action applying to two things.
understand "check [something] with [something]" as checking it with.

report checking (this is the first checking rule): 
say "You check [the noun].".

report checking something with a second noun
(this is the second checking rule):
say "You check [the noun] with [the second noun].".

Supplemental Actions ends here.

---- DOCUMENTATION ----

Chapter 1: Actions covered 

This extension adds the actions listed above so that you don't have to.

Chapter 2: Warnings

Note: This extension can not be used with either of the following 2 Emily Short 
extensions:Empty Transfer and Measured Liquids.

Also you need to set the output file to at least a .z8 setting or you will get
an error during compilation.

Chapter 3: Contacting the Author

It is highly recommended that you print out this code so that you can consult 
it for actions and default responses which you may over ride with your own.

Questions and comments to: radical1@evcohs.com

Chapter 4: New Properties Required

For the blowing function add this line: the (NOUN) is blowable.

For the climbing function add this line: the (NOUN) is climbable.

For the swimming function add this line: the (NOUN) is swimmable.

For the digging function add this line: the (NOUN) is diggable.

For the filling function add this line: the (NOUN) is fillable.

where (NOUN) is the object you have coded.

Chapter 5: New Commands (Actions)

version 27 adds a new action: STEAL and STEALING IT FROM.

There are 2 new DIVING commands called DIVE OFF/FROM (NOUN) and DIVE IN/INTO (NOUN).

BRIBE is a new verb. You can BRIBE (someone) or BRIBE (someone) WITH (something).

SWIM is a new command. SWIM, SWIM IN, SWIM ACROSS, SWIM THROUGH,SWIM UNDER, 
SWIM AROUND,and SWIM OVER.

Commands for JUMPING IN,JUMPING ON,JUMPING OVER and JUMPING THROUGH 
(something) have been added.

Commands for CLIMBING IN, CLIMBING OUT(OF),CLIMBING UP,CLIMBING DOWN,
CLIMBING OVER and CLIMBING UNDER have been added.

Commands for LIEING ON/IN (SOMETHING) have also been added.

Chapter 6: Synonyms

ATTACK,BASH,BELT,HIT,INJURE,PUNCH,PUMMEL,POUND,SMACK,WACK,WALLOP and WOUND are now all synonyms.

SLASH, LACERATE, SEVER, SLIT, PIERCE,  WOUND, SCRATCH, GRAZE, NICK, INCISE, and LANCE are 
now new synonyms for CUT along with CHOP AND SLICE.

BREAK, CRACK,CRUSH, DAMAGE, DESTROY, FRACTURE, RUIN,SHATTER, SMASH, 
SNAP,TRASH, WRECK, AND VANDALIZE are now synonyms for breaking things.

SCREAM,YELL,HOLLER, BELLOW, and SCREECH are now synonyms for SHOUT

There are now  TALK and TALK TO verbs implemented. 
SPEAK is now a synonym for TALK

As of version 19, SYNONYMS are echoed. The game will now automatically echo the correct verb.

Chapter 7: Separated Actions

Version 28 separates "check" from "look". There are 2 new separated commands
"check" and "checking it with".

SHOUT has been separated from ANSWER and SPEAK.

THROW and DROP commands have been separated.

As of version 25 CLEAR and SHIFT are now separated.

PUSH and PRESS remain the same.

RUB,CLEAN,DUST,POLISH,SCRUB,SHINE,SWEEP,and WIPE are all separate commands now.

SHOUT AND SPEAK have been separated from ANSWER and SAY. 

FEED,FEEDING IT TO,and FEEDING IT WITH are now separated from GIVE and PAY.

PAY is now a separate verb that stands alone. 
PAYING IT TO and PAYING IT FOR are extensions of PAY.

The THROW and DROP commands have been separated.

As of version 25 the commands SHIFT,CLEAR,and MOVE have now been separated.

PUSH and PRESS remain the same. 

SIT,STAND, AND LIE are now separate commands from ENTER.

SCREW AND UNSCREW are now separate commands from TURN.

As of version 26 the command FIX has been separated from TIE. 
REPAIR and MEND are also synonyms for FIX.
FIXING IT WITH is 
also added for fixing something with a second noun.

OFFER is now a separate verb. OFFERING IT TO is a new  verb.

Chapter 8: New Features

You can now also look in directions: LOOK (UP) (DOWN) (BEHIND) (NORTH) (SOUTH)
(EAST)(WEST)(NORTHEAST) (NORTHWEST) (SOUTHEAST) (SOUTHWEST)

You can Now BURN (SOMETHING) WITH (SOMETHING) and CUT (SOMETHING) WITH (SOMETHING).

You can now GIVE THING or THINGS to an NPC or to an inanimate object.

ASKING an NPC for something will automatically give you the object IF the NPC has it.

Example: ** Silliness - a small program for testing the extension.

	*: "Silliness"

	Include Supplemental Actions by Al Golden.

	use full-length room descriptions.

	rule for printing room description details: stop.

	after printing the name of an open container: 
	omit contents in listing.

	rule for deciding whether all includes scenery: 
	it does not.
	rule for deciding whether all includes backdrops: 
	it does not.
	rule for deciding whether all includes something fixed in place: 
	it does not.
	rule for deciding whether all includes a person: 
	it does not.

	report giving something to someone:
	now the second noun carries the noun;
	say "You give [the noun] to [the second noun].".

	Idyllic Scene is a room.
	"The best way to describe this place is 'Heaven On Earth'!".

	the player is carrying a polishing cloth, a knife, and a testing machine.
	the description of the testing machine is "It can be used to test things.".

	a thing is either broken or whole.
	a thing is usually whole.

	instead of breaking a whole thing:
	now the noun is broken;
	let verbword be word number 1 in the player's command;
	say "You [verbword] [the noun].".

	instead of breaking a whole thing with a second noun:
	now the noun is broken;
	let verbword be word number 1 in the player's command;
	say "You [verbword] [the noun] with [the second noun].".

	instead of breaking a broken thing:
	say "But the [noun] is already broken.".

	instead of breaking a broken thing with a second noun:
	say "But the [noun] is already broken.".

	instead of fixing a broken thing:
	now the noun is whole;
	let verbword be word number 1 in the player's command;
	say "You [verbword] [the noun].".

	instead of fixing a broken thing with a second noun:
	now the noun is whole;
	let verbword be word number 1 in the player's command;
	say "You [verbword] [the noun] with [the second noun].".

	instead of fixing a whole thing:
	say "But [the noun] isn't broken!".

	instead of fixing a whole thing with a second noun:
	say "But [the noun] isn't broken!".
	
	instead of clearing or pushing or moving or shifting  something:
	if the noun is portable begin;
	say "You push [the noun].";
	otherwise;
	say "Impossible!";
	end if.

	report attacking something which is not the lifeguard:
	say "You [verbword] [the noun].";
		
	instead of clearing or pushing or moving or shifting 
	something which is fixed in place:
	say "Impossible!".

	a match is in Idyllic. the description is
	"A plain old sulphur match.".
	the match is blowable.
	the match is either lit or unlit.
	the match is either struck or unstruck.
	the match is unstruck and unlit.

	the match can be extinguished.

	a piece of paper is in Idyllic.
	the description of the piece of paper is
	"The paper is [if folded]folded.
	[otherwise]unfolded.[end if]".

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

	after throwing the baseball through the window
	when the player is in Idyllic and the window
	is closed:
	Say "You'd break the glass of the closed window.";
	

	after throwing the baseball through the window 
	when the player is in Idyllic
	and the window is open:
	now the baseball is in Kitchen;
	say "You throw the ball through the window 
	where it lands in the kitchen.";
	

	after throwing the baseball through the 
	window when the player
	is in Kitchen and the window is closed:
	Say "You'd break the glass of the closed window.";
	

	after throwing the baseball through the 
	window when the player is in Kitchen:
	now the baseball is in Idyllic;
	say "You throw the ball through the window 
	where it lands outside.";
	
	a machinegun is in Idyllic.
	the printed name is "machine gun".
	understand "gun" or "machine gun" as the machinegun.
	the machinegun is either loaded or unloaded.
	the machinegun is unloaded.
	the description of the machinegun is
	"A 1920's style Eliot Ness model in .45 calibre. It is currently[if loaded] loaded.[otherwise] unloaded.[end if]".

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

	instead of removing the drum from the machinegun,
	try unloading the machinegun.

	before shooting something when the machinegun is not 
	carried by the player:
	say "You haven't got the gun!" instead.
	
	before shooting something when the machinegun is unloaded:
	say "The gun ain't loaded." instead.
		
	before shooting an unloaded machinegun:
	say "The gun ain't loaded." instead.
	
	before shooting something with an unloaded machinegun:
	say "The gun ain't loaded." instead.
	
	before shooting an unloaded machinegun at something:
	say "The gun ain't loaded." instead.
	
	report shooting the machinegun:
	if the machinegun is loaded begin;
	say "You fire the machine gun into the air and make a 
	hell of a racket while doing so.";
	otherwise;
	say "The gun ain't loaded.";
	end if.
	
	before shooting the pool:
	if the machinegun is loaded begin;
	say "You send a wave of bullets into the water.";
	stop;
	otherwise;
	say "The gun isn't loaded.";
	stop;
	end if.

	instead of shooting the pool with the machinegun:
	try shooting the pool.
	
	instead of shooting the machinegun at the pool:
	try shooting the pool.

	instead of shooting the water with the machinegun:
	try shooting the pool.

	instead of shooting the machinegun at the water:
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

	after shooting the machinegun at something which is not the player:
	say "You fire the gun at [the second noun]	
	and it disintegrates into nothingness.";
	remove the second noun from play;
	
	after shooting something which is not the player:
	remove the noun from play;
	say "You shoot [the noun] and it disintegrates into nothingness.";
	
	after shooting something which is not the player with the machinegun:
	remove the noun from play;
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
	the balloon is blowable and inflatable.
	The description is
	"The balloon is [if deflated]deflated.[otherwise]inflated.[end if]".

	after blowing in a deflated balloon:
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
	
	a warning is scenery in Idyllic.

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
	say "You empty the water in the hole back into the pool.";	
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
	say "You empty the [list of things in the hole] back onto the ground";	
	now all the things in the hole are in Idyllic;
	
	check inserting something into the hole when the poolwater is in the hole: 
	say "The hole is already filled with water." instead.

	carry out inserting something into an vacated hole:
	now the noun is in the hole;
	say "You put [the noun] into the hole.".

	check inserting something into the trashcan when the poolwater is in the trashcan: 
	say "The can is already filled with water." instead.
	
	instead of emptying the trashcan when the canwater is in the trashcan:
	remove the canwater from play;
	say "You empty the water from the pool on to the ground where it evaporates."	.

	carry out emptying the trashcan into the pool when the canwater is in the trashcan:
	remove the canwater from play;
	say "You empty the water in the can back into the pool.".

	check emptying the trashcan:
	if the number of things in the trashcan is 0,
	say "The can is empty." instead.

	before emptying the trashcan:
	say "You empty [the list of things in the trashcan] out onto the ground.";
	now every thing in the trashcan is in the location instead.

	report emptying the trashcan when the poolwater is in the trashcan:
	remove the poolwater from play;
	say "You empty the water in the trashcan into the pool.".

	before emptying the trashcan:	
	if the canwater is in the trashcan,	
	remove the canwater from play;	
	say "You empty the water from the pool on to the ground where it evaporates."	;
	stop;

	carry out emptying the trashcan into the pool when the canwater is in the trashcan:	
	remove the canwater from play;	
	say "You empty the water in the can back into the pool.".	
			
	carry out emptying the trashcan:	
	now all the things in the trashcan are in the location;	
	say "You empty the trashcan onto the ground.";	
	
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
	say "[if the number of things in the trashcan  is 0]The trashcan is empty.
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
	now the  hole is filled;
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

	instead of filling the hole with the water,
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
	the feather is blowable.
	the description of the feather is "A feather from a bird.".

	an open enterable container called 
	a swimming pool is in Idyllic.
	the pool is swimmable and fixed in place.
	the description of the pool is
	"How they managed to place such a large pool in this area 
	is beyond me! A diving board sits at the end of the pool.".

	a bunch of leaves is in the swimming pool.
	the description is "You don't understand how these leaves got here
	since there are no trees in the immediate vicinity.".

	instead of clearing the pool,
	try clearing the leaves from the swimming pool.
	
	instead of clearing the leaves from the pool:
	now the leaves is in Idyllic;
	say "You clear the leaves from the pool and drop them on the ground."

	instead of throwing something into the pool:
	if the noun is not carried by the player begin;
	say "You haven't got [the noun].";
	otherwise;
	now the noun is in the swimming pool;
	say "You [verbword] [the noun] into the pool.";
	end if.

	report filling the pool:
	say "It's already filled with water. Get some glasses!";
	
	instead of filling the pool with water:
	try filling the pool.

	report standing on the pool:
	say "When you learn to walk on water, let me know.";
	
	instead of sitting in the water:
	try sitting in the pool.

	instead of standing in the water:
	try standing in the pool.

	the diving board is scenery and an enterable supporter in Idyllic.
	the description is "A plain low board which allows 
	the user to dive into the pool.".

	the water is a fixed in place thing in the pool.
	the indefinite article of the water is "some".
	the water is swimmable.
	the description of the water is "Chlorinated H2O".

	the poolwater is a thing.
	the printed name is "some water from the pool".
	
	understand "water" as the poolwater.
	understand "pool water" as the poolwater.
	the description is "some water from the pool".

	the canwater is a thing.
	the printed name is "some water from the pool".	
	understand "water" or "can water" as the canwater.
	the description is "some water from the pool".

	instead of sitting in the water:
	try sitting in the pool.

	instead of standing in the water:
	try standing in the pool.

	before emptying the pool:
	say "You have no place to store the water." instead.
	
	instead of emptying the water from the pool,
	try emptying the pool.

	before taking the water:
	say "Unfortunately it slips through your fingers." instead.

	report smelling the water:
	say "It smells highly of chlorine.".

	understand "taste [something]" as eating.
	understand "taste [something]" as drinking.

	report tasting the water:
	try drinking the water.

	instead of unloading something:
	say "You unload [the noun].";
	
	instead of drinking the pool:
	try drinking the water.

	instead of drinking from the swimming pool,
	try drinking the water.

	instead of drinking the water from the pool,
	try drinking the water.

	instead of drinking the water:
	say "The chlorine would poison you to death!"

	an open enterable container called a trashcan is in Idyllic.
	the trashcan  is fillable.
	understand "barrel" or "can" or "trash" as the trashcan.

	instead of filling the trashcan from the swimming pool:
	if the poolwater is not in the trashcan and the trashcan is unfilled begin;
	now the trashcan is filled;
	now the poolwater is in the trashcan;
	say "You fill the trash can with some water from the pool.";
	otherwise;
	say "The trashcan is either filled with water 
	or has something in it.";
	end if.

	instead of filling the trashcan with the water:	
	if the poolwater is not in the trashcan and the trashcan is unfilled begin;
	now the trashcan is filled;
	now the poolwater is in the trashcan;
	say "You fill the trash can with some water from the pool.";
	otherwise;
	say "The trashcan is either filled with water or has something in it.";
	end if.

	
	instead of sitting in the trashcan,
	say "You'd smell like garbage if you did so.".

	instead of sitting on the trashcan,
	say "It has no lid.".

	report blowing on the feather when the feather 
	is not carried by the player:
	say "You blow on the feather and it lands a 
	short distance away from you." instead.
	
	report blowing on the feather when the feather 
	is carried by the player:
	say "You blow on the feather and it sways between your fingers." instead.
	
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

	check  praying to something which is not the idol:
	say "Don't be silly!" instead.
	
	a portable enterable supporter called a lounge chair is in Idyllic.
	the description is "Just the thing for lying out at the pool!".

	instead of lieing in the chair,
	try lieing on the chair.

	instead of sitting in the chair,
	try sitting on the chair.

	Kitchen is a room.
	"This kitchen looks like something out of Zork 1	
	with the exception that the table, sack and bottle are holograms.".

	a table, a bottle and a sack are in Kitchen.
	
	the table is a supporter.

	report taking something in the Kitchen:
	say "Your hand passes right through it.";
	

	the window is a door.
	the window is east of Idyllic and west of Kitchen.
	the window is closed, openable, scenery, and climbable.

	instead of climbing through the window,
	try climbing in the window.

	instead of climbing through the window when the player is in Idyllic,
	try climbing in the window.

	instead of climbing through the window when the player is in Kitchen,
	try climbing out the window.

	report climbing in the window when the window is closed:
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

	carry out climbing down the tree when the player is in TreeTop:
	say "You climb back down the tree.";
	now the player is in Idyllic;
	
	instead of climbing the tree when the player is in TreeTop,
	try climbing down the tree.

	instead of going down when the player is in TreeTop,
	try climbing down the tree.

	TreeTop is a room. "From here you can see vast 
	distances far beyond 	.	
	[paragraph break] Below you, you see [a list of things in Idyllic].".

	a man called a lifeguard is in Idyllic.
	understand "guard" or "man" as the lifeguard.
	the description of the lifeguard is
	"Although his jacket sports the title 'Lifeguard' he can't even swim a lick.".

	instead of shouting the warning to the lifeguard:
	say "You shout: 'Look out' to the lifeguard.".	
	
	instead of shouting the warning at the lifeguard:
	say "You shout: 'The pool is overflowing!' at the lifeguard.".

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

	before jumping off the diving board when the player is on the board:
	say "You jump off the board into the pool.";
	now the player is in the swimming pool instead.

	report jumping from the diving board 
	when the player is on the diving board:
	say "You jump from the board into the pool.";
	now the player is in the swimming pool.

	report jumping off the diving board 
	when the player is not on the board:
	say "You're not on the diving board.";

	report jumping from the diving board 
	when the player is not on the diving board:
	say "You're not on the diving board.";

	report killing something which is not a person:
	say  "How the hell can you [verbword]a non-living thing.?";
	
	report lieing on the swimming pool:
	say "Try entering it instead.";
	
	report lieing in the swimming pool:
	say "Try entering it instead.";
	
	report swimming in the water:
	try swimming in the pool;
	
	check swimming when the player is not in the pool:
	say "You need to enter the pool first." instead.
	
	report swimming when the player is in the pool:
	say "You swim in the pool.";

	report swimming in the pool:
	say "You swim in the pool.";
	
	before swimming around the pool 
	when the player is not in the pool:
	say "You need to enter the pool first.";
	
	report swimming around the pool:
	say "You swim around the pool.";
	
	report swimming over the pool:
	say "Don't be ridiculous!";
	
	report swimming under the pool:
	say "Don't be ridiculous!";
	
	report swimming under the water:
	say "You dive under water and swim around 
	till your lungs give out then you surface.";
	
	after throwing something:
	say "You throw [the noun].";
	
	report throwing something at the second noun:
	say "You throw [the noun] at the [second noun]."

	carry out throwing something which is held into the pool:
	now the noun is in the pool; 
	say "You throw [the noun] into the pool.".

	report throwing something which is not held into the pool:
	say "You haven't got [the noun].".

	[Test Scripts]

	test attack with "attack chair/hit chair/belt chair/punch chair/ 
	smack chair/	
	damage pump/wack chair/wallop chair/hit idol with chair/ 
	hit idol with trashcan".

	test blow with "blow feather/take feather/blow feather/
	drop feather/ blow in balloon/
	deflate balloon/inflate balloon with pump/deflate balloon/ 
	pump up balloon with pump	
	/deflate balloon/x match/strike match/blow out match/
	strike match/blow out match".

	test clean with "i/clean chair/rub chair/dust chair with cloth/
	scrub pool/ rub feather	
	/polish balloon/sweep pool/shine chair with cloth/wipe idol/ 
	wipe idol with cloth".

	test break with "break balloon/break feather/damage chair/smash pump/trash idol/
	smash house/fracture fence"

	test bribe with "bribe guard/bribe idol with rain/
	bribe idol with chair".

	test buy with "buy idol/buy idol from guard"

	test sell with "sell idol to guard"

	test check with "check pool/check pool with machine/check chair/check idol/check idol with machine.".

	test clear with "clear can/clear chair/clear idol/clear pool/clear leaves from pool".

	test climb with "climb over fence/climb under fence/climb up tree/ 
	climb down tree/climb in can/climb out can/climb in can/
	climb out of can/ climb in window/open window/
	climb in window/climb out window/climb through window/
	climb thru window".

	test cut with "cut rope/slash rope/slice rope/slit rope/
	nick rope/prune rope/lacerate rope/scratch rope/cut rope with knife/
	slash rope with knife/slit rope with knife/slash rope with knife/
	scratch rope with knife/graze rope with knife/cut cloth with knife".

	test dig with "dig ground/dig ground with match/take shovel/ 
	dig ground with shovel/fill hole with dirt/dig ground with shovel/
	fill hole with dirt/dig hole in ground."

	test dive with "dive into pool/exit/stand on board/
	dive into pool/g/exit/ 
	stand on board/dive off board/dive into pool/exit.".

	test drink with "drink water/drink pool/drink from pool/
	drink water from pool".

	test drop with "take all/drop all but feather/take all/
	drop all in pool/take all from pool/drop all but can in can/
	take all from can/drop all/look".

	test empty with "take all but idol, can,pool,guard/
	put all in can/empty can/take all 
	but idol,can,pool,guard/put all in can/empty can into pool".

	test examine with "x match/x paper/x machine gun/
	x bullet drum/x bicycle pump/x hula hoop/x balloon/x shovel/
	x idol/x feather/x pool/x trashcan/x chair/x house/x fence/
	x tree/x lifeguard".

	test feed with "feed idol/feed guard/feed guard with rain/
	feed guard to idol/feed water to idol/feed guard with water/
	feed idol with water/feed can with chair".

	test fill with "take shovel/dig hole/fill hole from pool/
	fill hole with water/fill can with water/fill can with dirt/
	empty can/take shovel/dig hole/fill hole
	with dirt".	
	
	test fix with "fix balloon/repair feather/mend chair/fix pump/fix pool with idol/
	mend chair with pool/ fix pool with chair/ repair idol/repair idol with pump"
	
	test fold with "x paper/fold paper/g/unfold paper/g".

	test jump with "jump over chair/jump over idol/jump in pool/
	exit/ jump through hoop/jump through chair/take shovel/
	dig ground/jump in hole/exit/ stand on board/	
	jump from board/exit/stand on board/jump off board".

	test kill with "kill me/kill lifeguard/murder lifeguard/
	torture lifeguard/kill idol/kill feather/kill balloon".

	test lie with "lie on chair/lie in trashcan/lie on idol/
	lie in pool/lie under chair/lie under idol/lie under tree".

	test load with "take gun/take drum/load gun/unload gun/
	load gun with bullets/load trashcan with gun/unload gun from can/load take feather/load chair with feather.".

	test look with "look north/look south/look east/look west/	
	look northeast/look northwest/look southeast/
	look southwest/look up/look down/look behind idol/
	look behind chair.".

	test move with "move chair/move can/move idol/move pool".

	test offer with "offer chair to guard/ offer rain to idol"

	test pay with "pay guard/pay guard for water/ 
	pay idol/pay chair to idol/pay chair to idol".
	
	test push with "push chair/push can/push idol/push pool".
	
	test shoot with "shoot gun/take gun/shoot gun/load gun/
	shoot pool/shoot guard/shoot idol/shoot match/shoot paper/shoot hoop/
	shoot shovel/shoot gun at gun/shoot pump/shoot feather/
	shoot gun at pool/shoot trashcan/shoot chair/shoot balloon".

	test shout with "shout at lifeguard/scream at lifeguard/yell at lifeguard/
	holler at lifeguard/bellow at lifeguard/shout warning at lifeguard/
	shout warning to lifeguard".

	test sit with "sit on chair/sit on lifeguard/sit in trashcan/
	sit on trashcan/sit in chair/sit on idol/sit behind idol/sit under idol".

	test stand with "stand on chair/stand on idol/stand on lifeguard/ 
	stand on trashcan/stand in pool/stand in trashcan/
	stand under idol/stand behind idol".

	test talk with "talk to lifeguard/speak to lifeguard".

	test swim with "swim in feather/swim in chair/swim under balloon/ 
	swim over idol/enter pool/swim in pool/swim across pool/swim in water/
	swim under water/swim through water/swim under pool/
	swim over pool/swim around pool/exit".

	test pray with "pray/pray to idol/pray for idol/pray to pool/
	pray for match/pray for rain/pray for me/pray to me".
	
	test shift with "shift pool/shift leaves/shift idol/shift guard"
		
	test steal with "give ball to guard/take ball/ 
	steal ball from guard/give hoop to guard/steal hoop.".

	test throw with "take all/ toss pump in pool/
	pitch balloon in pool/heave feather in pool/ 
	hurl match in pool/throw gun in pool/	
	toss shovel in pool/pitch hoop in pool/ 
	throw drum in pool/heave chair in pool".

	test throwover with "take ball/ throw ball over pool/
	take ball/ throw ball over trashcan/	
	take ball/throw ball over idol/take ball/ 
	throw ball over trashcan".

	test throwthru with "take ball/x ball/
	throw ball through window/open window/	
	throw ball through window/east/
	take ball/throw ball through window/west/	
	x ball/take ball".

	test throwunder with "take ball/throw ball under pool/
	take ball/throw ball under idol/
	take ball/throw ball under chair/
	take ball/throw ball under trashcan".

	test unload with "load gun/unload drum/
	unload gun/load gun with bullets/	
	unload gun/load drum/unload gun".


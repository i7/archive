Version 8 of Debugging by Al Golden begins here.

Include (- 
Verb meta 'recording' *          -> CommandsOn 
                                  * 'on'   -> CommandsOn 
                                  * 'off'  -> CommandsOff;

Verb meta 'replay'     *       -> CommandsRead;

#ifdef TARGET_ZCODE;

[ CommandsOnSub;
    @output_stream 4;
    xcommsdir = 1;
    "[Command recording on.]";
];

[ CommandsOffSub;
    if (xcommsdir == 1) @output_stream -4;
    xcommsdir = 0;
    "[Command recording off.]";
];

[ CommandsReadSub;
    @input_stream 1;
    xcommsdir = 2;
    "[Replaying commands.]^^";
];

#ifnot; ! TARGET_GLULX

[ CommandsOnSub fref;
    if (gg_commandstr ~= 0) {
        if (gg_command_reading) "[Commands are currently replaying.]";
        else "[Command recording already on.]";
    }
    ! fileref_create_by_prompt
    fref = glk($0062, $103, $01, 0);
    if (fref == 0) "[Command recording failed.]";
    gg_command_reading = false;
    ! stream_open_file
    gg_commandstr = glk($0042, fref, $01, GG_COMMANDWSTR_ROCK);
    glk($0063, fref); ! fileref_destroy
    if (gg_commandstr == 0) return L__M(##CommandsOn, 4);
    "[Command recording on.]";
];

[ CommandsOffSub;
    if (gg_commandstr == 0) "[Command recording already off.]";
    if (gg_command_reading) "[Command replay complete.]";
    glk($0044, gg_commandstr, 0); ! stream_close
    gg_commandstr = 0;
    gg_command_reading = false;
    "[Command recording off.]";
];

[ CommandsReadSub fref;
    if (gg_commandstr ~= 0) {
        if (gg_command_reading) "[Commands are already replaying.]";
        else "[Command replay failed.  Command recording is on.]";
    }
    ! fileref_create_by_prompt
    fref = glk($0062, $103, $02, 0);
    if (fref == 0) "[Command replay failed.]";
    gg_command_reading = true;
    ! stream_open_file
    gg_commandstr = glk($0042, fref, $02, GG_COMMANDRSTR_ROCK);
    glk($0063, fref); ! fileref_destroy
    if (gg_commandstr == 0) return L__M(##CommandsRead, 4);
    "[Command replay complete.]";
];

#endif; ! TARGET_

 -).

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
	
Debugging ends here.

---- DOCUMENTATION ----

Since the recording/replay/objects/places functions 
of Inform 6 are not currently handled by Inform 7, 
this short extension allows those 4 functions.

Typing "RECORDING ON" starts a transcript.

Typing "RECORDING OFF" terminates said transcript.

Typing "OBJECTS" lists the objects the player has handled.

Typing "PLACES" list the places the player has visited.

This version adds the following that will NOT be included in released games: 
a list of rooms,a list of objects and locations,
a list of male NPCs and locations  
and a list of female NPCs and locations.

To see the rooms: Type "ROOMS"

To see the objects: type "THINGS".

To see Male NPCs: type "MEN" or "MALES"

To see Female NPCs: type "WOMEN" or "FEMALES" 

To see containers: type "CONTAINERS"

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

	Ender is north of Starter. 
	a man called Mike is in Ender. 
	a woman called Betty is in Ender.
	a dog, a frog, and a log are in Ender.
	a container called a chest is in ender.

	Easter is east of Starter. 
	a man called Bart is in Easter. 
	a woman called Mary is in Easter.
	a pill, a hill, and a thrill are in Easter.
	a container called a basket is in Easter

	Wester is west of Starter. 
	a man called Steve is in Wester.
	a woman called Celia is in Wester.
	a fish, a wish, and a dish are in Wester.
	a container called a barrel is in Wester.

	test rooms with "rooms".
	test things with "things".
	test men with "men".
	test women with "women".

	test places with "places".
	test objects with "objects".
	test containers with "containers".

	test 1 with "rooms/places".
	test 2 with "things/objects".
	test 3 with "containers".
	test 4 with "men/women".





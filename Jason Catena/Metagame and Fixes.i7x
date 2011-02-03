Version 1/080708 of Metagame and Fixes by Jason Catena begins here.

"Fix parts of environment.  Provide destination, hint, credit, and sidenote properties as out of world spoilers, and commands to use them: credit, hint, recall, sidenote, teleport with (not for release) and travel with."

Section - Glulx - attempt to fix Glulx italics (for Glulx only)

Before starting the virtual machine: initialize emphasis style.
To initialize emphasis style:
(-
glk_stylehint_set(wintype_TextBuffer,style_Emphasized,stylehint_Weight,0);
glk_stylehint_set(wintype_TextBuffer,style_Emphasized,stylehint_Oblique,1);
-).

Section - Beta Testing

After reading a command (this is the ignore beta-comments rule): 
    if the player's command matches the regular expression "^\p" begin; 
      say "(Noted.  Please send your transcript to jason.catena@gmail.com.)"; 
      reject the player's command; 
    end if. 

Section - Credits

A room has some text called credit.  A thing has some text called credit.

Definition: a room is credited if the credit of it is not "".  Definition: a thing is credited if the credit of it is not "".
Definition: a room is uncredited if the credit of it is "".  Definition: a thing is uncredited if the credit of it is "".

All crediting is an action out of world, applying to nothing.  Understand "credits" as all crediting.

Report all crediting (this is the report all credits rule):
    repeat with place running through credited visited rooms begin;
      say "	[place] from [credit of place]";
      repeat with item running through credited seen things enclosed by place begin;
        say "	In [place], [item] from [credit of item]";
      end repeat;
    end repeat;
    repeat with place running through uncredited visited rooms begin;
      repeat with item running through credited seen things enclosed by place begin;
        say "	In [place], [item] from [credit of item]";
      end repeat;
    end repeat;
    say "[paragraph break]".

Crediting is an action out of world, applying to one thing.  Understand "credit [something seen]" as crediting.  Understand "credit [any visited room]" as crediting.

Report crediting somewhere (called place) (this is the report place credit rule): say "[credit of place][paragraph break]".

Report crediting something (called item) (this is the report item credit rule): say "[credit of item][paragraph break]".

Section - Hints

A room has some text called hint.  A thing has some text called hint.

Hinting is an action out of world, applying to one thing.  Understand "hint [something seen]" as hinting.  Understand "hint [any visited room]" as hinting.

Report hinting somewhere (called place) (this is the report place hint rule):
    if hint of place is "" begin;
      say "Maybe [the place] has nothing clever about it?  Good luck with it.";
    otherwise;
      say "[hint of place][paragraph break]";
    end if.

Report hinting something (called item) (this is the report item hint rule):
    [where to go]
    if destination of the item is not nothing and location is not destination of the item begin;
      if destination of the item is visited begin;
        say "Check out [destination of the item].";
      otherwise;
        say "Keep wandering, to find where [the item] belongs.";
      end if;
    end if;
    [what to do]
    if hint of item is "" begin;
      say "Maybe [the item] is nothing special?  Good luck, in any event.";
    otherwise;
      say "[hint of item][paragraph break]";
    end if.

Section - Recalling

A thing can be examined or unexamined. A thing is usually unexamined. Carry out examining something (this is the do examining rule): now the noun is examined. 

A thing can be searched or unsearched. A thing is usually unsearched. Carry out searching something (this is the do searching rule): now the noun is searched; if the noun is part of something (called the holder), now the holder is searched. [Works because we don't say the search was complete.]

A thing can be seen or unseen. A thing is usually unseen. The player is seen.  After printing the name of something (called target) (this is the see printed rule): now the target is seen.  [After taking inventory (this is the see inventory rule): now all things enclosed by the player are seen.]

Definition: a thing is other if it is not yourself and yourself does not have it.  Definition: a thing is empty if the number of things enclosed by it is 0.

Recalling is an action out of world, applying to nothing.  Understand "recall" as recalling.

Carry out recalling (this is the recall everything rule):
    if the number of things enclosed by player is not 0, say "In your possession, you left unexamined [the list of unexamined seen things enclosed by player].  You examined [the list of examined things enclosed by player].  Searches found items in [the list of searched things enclosed by player].[paragraph break]";
    repeat with place running through visited not empty rooms begin;
      if the number of things enclosed by place is not 0, say "You left unexamined [the list of unexamined seen other things enclosed by place] in [bold type][place][roman type].  You examined [the list of examined other things enclosed by place].  Searches found items in [the list of searched other things enclosed by place].[paragraph break]";
    end repeat.


Section - Sidenotes

A room has some text called sidenote.  A thing has some text called sidenote.

Definition: a room is sidenoted if the sidenote of it is not "".  Definition: a thing is sidenoted if the sidenote of it is not "".
Definition: a room is unsidenoted if the sidenote of it is "".  Definition: a thing is unsidenoted if the sidenote of it is "".

All sidenoting is an action out of world, applying to nothing.  Understand "sidenotes" as all sidenoting.

Report all sidenoting (this is the report all sidenotes rule):
    repeat with place running through sidenoted visited rooms begin;
      say "	[place]: [sidenote of place]";
      repeat with item running through sidenoted seen things enclosed by place begin;
        say "	In [place], [item]: [sidenote of item]";
      end repeat;
    end repeat;
    repeat with place running through unsidenoted visited rooms begin;
      repeat with item running through sidenoted seen things enclosed by place begin;
        say "	In [place], [item]: [sidenote of item]";
      end repeat;
    end repeat;
    say "[paragraph break]".

Sidenoting is an action out of world, applying to one thing.  Understand "sidenote [something seen]" as sidenoting.  Understand "sidenote [any visited room]" as sidenoting.

Report sidenoting somewhere (called place) (this is the report place sidenote rule): if the sidenote of place is not "", say "[sidenote of place][paragraph break]".

Report sidenoting something (called item) (this is the report item sidenote rule): if the sidenote of item is not "", say "[sidenote of item][paragraph break]".

Section - Travel with

A thing has a room called destination.  The destination of a thing is usually nothing.

[One step at a time.]
Traveling is an action applying to one thing.  Understand "travel with [something]" as traveling.  Understand "guide by [something]" as traveling.

The traveling action has a direction called the guided dir. 

Setting action variables for traveling something (called item) (this is the define traveling variables rule):
    change the guided dir to the best route from the location of the player to the destination of the item.

Check an actor traveling something (called item) (this is the check actor traveling rule):
    if the destination of the item is nothing begin;
      if the actor is the player begin; say "[The item] doesn't belong anywhere.";
      otherwise; say "[The actor] remains."; end if;
      stop the action;
    end if;
    if the destination of the item is the location of the player begin;
      if the actor is the player begin; say "[The item] seems to belong here.";
      otherwise; say "[The actor] remains."; end if;
      stop the action;
    end if;
    [player can't cheat by giving the item to someone else and following it to a place not yet visited]
    if the destination of the item is not visited begin;
      if the actor is the player begin; say "[The item] doesn't belong anywhere you've been.";
      otherwise; say "[The actor] remains."; end if;
      stop the action;
    end if;
    if the actor is the player, say "[The item] leads you [guided dir]."

Carry out an actor traveling something (called item) (this is the do actor traveling rule):
    try the actor going the guided dir.

Section - Teleport with - not for release

[Just go there.]
Teleporting is an action applying to one thing.  Understand "teleport with [something]" as teleporting.  Understand "zip by [something]" as teleporting.

Check an actor teleporting something (called item) (this is the check actor teleporting rule):
    if the destination of the item is nothing begin;
      if the actor is the player begin; say "[The item] doesn't belong anywhere." ;
      otherwise; say "[The actor] remains."; end if;
      stop the action;
    end if;
    if the destination of the item is the location of the actor begin;
      if the actor is the player begin; say "[The item] seems to belong here." ;
      otherwise; say "[The actor] remains."; end if;
      stop the action;
    end if;  
    if the actor is the player begin;
      say "Your surroundings shift in and out of focus.  You feel momentarily disoriented and slightly nauseous.  Your vision settles with too-sharp clarity in[paragraph break]";
    otherwise;
      say "[The actor] disappears.";
    end if;

Carry out an actor teleporting something (called item) (this is the do actor teleporting rule):
    move the actor to the destination of the item.

Section - Text Presentation

To say /p: say paragraph break.
To say /l: say line break.

Metagame and Fixes ends here.

---- DOCUMENTATION ----

For Glulx, fix italics.

A text-presentation nicety: in square brackets, recognize /p and /l as kinds of paragraph and line breaks.  They're actually not completely interchangeable with paragraph break and line break, so you may want to play with them a bit.

For beta-testers, any leading punctuation (>?TOO CONFUSING) is rejected as a comment in the transcript.  If you use this feature you should change the printed message to contain your own email address.

RECALL lists things seen in rooms visited, so a player can more easily remember what went where.  Especially useful with stores, large maps, or limited player inventory.

Three new properties help players work with the game: a destination (room) for each thing; and a hint (some text) and a credit (some text), for each seen thing and visited room.  A few new actions work with these.

TELEPORT WITH ...  (or ZIP BY ...) takes you immediately to the destination of a thing, even if you have not been there.  This is a game breaker, so is set "not for release".  TRAVEL WITH ... (or GUIDE BY ...) takes you one step towards a thing's destination, to provide a literal step in the right direction for stuck or lost players.

HINT ...  displays the hint property, and notes whether you are at, have visited, or have not found where the thing belongs.  The hint itself should be coded so that it detects whether the thing has been used, and displays something like "You solved it."  if you're done with the thing.

CREDIT ..., for one specific thing, and CREDITS, for everything seen so far, lets you shout out to your sources.

SIDENOTE ..., for one specific thing, and SIDENOTES, for everything seen so far, lets you provide extra, development, or out-of-game information on something.

Example: * Stalling the Steward - Present out-of-world information and perform in-game actions.

	*: "Stalling the Steward"

	Include Metagame and Fixes by Jason Catena.

	Stall is a room.

	A container called ceramic toilet is in stall.

	toilet paper is in stall.  The hint is "[if toilet paper is in the ceramic toilet]Now flush.[otherwise]Guess where this goes?[end if]".  The destination is stall.  The credit is "Charming is the squeeziest!"  The sidenote is "Visible in restroom."

	A room called Restroom is outside of stall.

	Steward is a person in Restroom.

	A persuasion rule for asking Steward to try doing something: persuasion succeeds.

	Test me with "recall/x paper/recall/hint paper/credit paper/sidenote paper/out/hint paper/in/get paper/recall/put paper in ceramic toilet/l/recall/hint paper/out/steward, in/in/steward, get paper/recall/steward, out/out/steward, teleport with paper/l/in/steward, out/out/steward, travel with paper/l/in/recall/steward, put paper in ceramic toilet/recall".

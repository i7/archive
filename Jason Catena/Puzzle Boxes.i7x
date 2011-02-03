Version 1/080710 of Puzzle Boxes by Jason Catena begins here.

"Provide templates for pushbutton-combination puzzle boxes via a few examples."

Section - Puzzle Boxes

A puzzle box is a kind of container.

A puzzle side is a kind of device.

Rule for printing the name of a puzzle side (called side) while examining a puzzle box (this is the printing puzzle side rule):
    say "[if side is switched off][italic type]moved[roman type] [end if][printed name of side]".

Section - Elements puzzle box

the Elements puzzle box is a puzzle box.  It is locked.  The description is "A small rectangular construct of wood and stone, with six faces which move: [scorched wood], [woven bamboo], [smooth stone], [layered stone], [lacquered black wood], and [bleached driftwood]."

A puzzle side called scorched wood is part of Elements puzzle box.  It is switched on.  The description is "Fingertips rub off minute particles of charcoal."

A puzzle side called woven bamboo is part of Elements puzzle box.  It is switched on.  The description is "Tightly pressed bands of thick dried grass yield to the touch."

A puzzle side called smooth stone is part of Elements puzzle box.  It is switched on.  The description is "Once mossy as well, worn by water and pressure."

A puzzle side called layered stone is part of Elements puzzle box.  It is switched on.  The description is "Compressed freckled pastel bands wave and tumble across its polished surface."

A puzzle side called lacquered black wood is part of Elements puzzle box.  It is switched on.  The description is "A dark reflection."

A puzzle side called bleached driftwood is part of Elements puzzle box.  It is switched on.  The description is "Pale and light, stripped of anything soluble."

Definition: the Elements puzzle box is arranged if scorched wood is switched on and woven bamboo is switched on and smooth stone is switched off and layered stone is switched on and lacquered black wood is switched off and bleached driftwood is switched on.

[switched off means put out of default position]
Instead of an actor pushing a puzzle side (called side) part of the Elements puzzle box (this is the moving Elements puzzle side rule):
    if the Elements puzzle box is open begin;
      say "It won't move.";
      stop the action;
    end if;
    if side is switched off begin;
      silently try switching on the side;
      say "The [side] shifts to its initial arrangement.";
    otherwise;
      silently try switching off the side;
      say "The [side] shifts to another position.";
    end if.

Unlocked Elements is a recurring scene.  

Unlocked Elements begins when Elements puzzle box is arranged and Elements puzzle box is locked.

When Unlocked Elements begins:
    say "Something shifts inside the [Elements puzzle box].";
    now Elements puzzle box is unlocked.

Unlocked Elements ends when Elements puzzle box is not arranged and Elements puzzle box is closed.

When Unlocked Elements ends:
    say "Something shifts inside the [Elements puzzle box].";
    now the Elements puzzle box is locked.

Section - Twilight puzzle box

the Twilight puzzle box is a puzzle box.  It is locked.  The description is "A small rectangular construct of wood, with images inlaid on its faces: [Mount Fuji], [torii gate], [bamboo grove], [dense woods], [river inlet], [standing crane], [marsh reeds], [shoin house], [stooped peasant], [burdened ox], [junk boat], and [cherry tree]."

A puzzle side called Mount Fuji is part of Twilight puzzle box.  It is switched on.  The description is "Dominant, purple and white, broad, massive even from a distance."

A puzzle side called torii gate is part of Twilight puzzle box.  It is switched on.  The description is "Bright red borders of paths to holy places."

A puzzle side called bamboo grove is part of Twilight puzzle box.  It is switched on.  The description is "Engraved swaying in a captured wind."

A puzzle side called dense woods is part of Twilight puzzle box.  It is switched on.  The description is "Hardwoods lightly taken for building material."

A puzzle side called river inlet is part of Twilight puzzle box.  It is switched on.  The description is "A delta of grey rippled waves."

A puzzle side called standing crane is part of Twilight puzzle box.  It is switched on.  The description is "Bright white, standing solemnly with tucked foot."

A puzzle side called marsh reeds is part of Twilight puzzle box.  It is switched on.  The description is "Tan and dense where waves lap land."

A puzzle side called shoin house is part of Twilight puzzle box.  It is switched on.  The description is "Refuge and solace from hard farm work."

A puzzle side called stooped peasant is part of Twilight puzzle box.  It is switched on.  The description is "Bent and haggard, weary from planting paddies."

A puzzle side called burdened ox is part of Twilight puzzle box.  It is switched on.  The description is "Bright white bony shoulders balance a yoke of fresh water."

A puzzle side called junk boat is part of Twilight puzzle box.  It is switched on.  The description is "A segmented yellow sail floating above grey ripples."

A puzzle side called cherry tree is part of Twilight puzzle box.  It is switched on.  The description is "Pink with fragrant blossoms."

Definition: the Twilight puzzle box is primed if burdened ox is switched off.

Definition: the Twilight puzzle box is arranged if cherry tree is switched off.

[switched off means put out of default position]
Instead of an actor pushing a puzzle side (called side) part of the Twilight puzzle box (this is the moving Twilight puzzle side rule):
    if the Twilight puzzle box is open begin;
      say "It won't move.";
      stop the action;
    end if;
    if side is switched off begin;
      silently try switching on the side;
      say "The [side] shifts to its initial arrangement.";
    otherwise;
      silently try switching off the side;
      say "The [side] shifts to another position.";
    end if.

Primed Twilight is a recurring scene.  

Primed Twilight begins when Twilight puzzle box is primed and Twilight puzzle box is locked.

When Primed Twilight begins:
    say "Something shifts inside the [Twilight puzzle box]."

Primed Twilight ends when Twilight puzzle box is not primed and Twilight puzzle box is closed.

When Primed Twilight ends:
    say "Something shifts inside the [Twilight puzzle box]."

Unlocked Twilight is a recurring scene.  

Unlocked Twilight begins when Twilight puzzle box is arranged and Twilight puzzle box is locked and Primed Twilight has happened.

When Unlocked Twilight begins:
    say "Something shifts inside the [Twilight puzzle box].";
    now Twilight puzzle box is unlocked.

Unlocked Twilight ends when Twilight puzzle box is not arranged and Twilight puzzle box is closed.

When Unlocked Twilight ends:
    say "Something shifts inside the [Twilight puzzle box].";
    now the Twilight puzzle box is locked.

Puzzle Boxes ends here.

---- DOCUMENTATION ----

The Elements puzzle box has 64 combinations: enough to be discouraging, but still exhaustively tried by a lore-averse player.  The Twilight puzzle box, by contrast, has 4096 combinations per arrangement, far more than anyone sane should sit and try by hand.  It gets this many combinations by specifying a switched on/off device state for each side.

The definitions of [bold type]arranged[roman type] for each box set the combinations, so you can easily change the combination.  You can also make the puzzle box significantly easier by not specifying the state of certain sides.  So the Elements box can have as few as 6 possible combinations to try, and the Twilight box as few as 12, if you only specify the state of one side.

You can also make the puzzle box more dastardly by requiring the player pass through multiple arrangements before reaching the unlocking arrangement.  The Twilight box actually has from 24 to 8192 combinations, since it gets primed by one arrangement, and then repeatedly locked and unlocked by a second, different arrangement after the priming arrangement happens once.

Example: * You Have Ascended - Oh, that's where it is.

	*: "You Have Ascended"

	Include Puzzle Boxes by Jason Catena.

	Chapel of Crom is a room.  bloodstained altar is a supporter in Chapel of Crom.

	Elements puzzle box is on bloodstained altar.  A thing called The Amulet of Yendor is in Elements puzzle box.

	Twilight puzzle box is on bloodstained altar.  A thing called The One Ring is in Twilight puzzle box.

	Test elem with "scenes/open Elements/unlock Elements/l in Elements/x Elements/x scorched/x woven/x smooth/x layered/x black/x bleached/push woven/x Elements/move black/press smooth/move woven/open Elements/get amulet/press black/close Elements/x Elements/push smooth/open Elements".

	Test vill with "open Twilight/unlock Twilight/x Twilight/x fuji/x gate/x grove/x woods/x inlet/x crane/x reeds/x house/x peasant/x ox/x boat/x tree/press cherry/press cherry/press ox/open Twilight/press cherry/open Twilight/press ox/close Twilight/press ox/open Twilight/close Twilight/press cherry/open Twilight"

	Test me with "test elem/test vill"

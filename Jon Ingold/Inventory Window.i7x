Version 6 of Inventory Window (for Glulx only) by Jon Ingold begins here.

"An extension providing a inventory window, and optionally, a graphics panel."

Include Flexible Windows by Jon Ingold.
Include Simple Graphical Window by Emily Short.

Use Flexible window-style definitions translates as (- Constant FLEXI_WIN; -).

Chapter - Defining Windows

section - the windows

The inventory-window is a g-window spawned by the main-window.
The minimum size of the inventory-window is 15.

The graphics-window is a g-window spawned by the inventory-window. The type of the graphics-window is g-graphics. 

The graphics window proportion is 40.
The graphics window position is g-above.

Section - undoing Simple Graphics

 the graphics window construction rule is not listed in the when play begins rules.
the default removing reference to picwin rule is not listed in the glulx zeroing-reference rules.
 the default choosing picwin rule is not listed in the glulx resetting-windows rules.
the default arranging behavior rule is not listed in the glulx arranging rules.
the default redrawing behavior rule is not listed in the glulx redrawing rules.
 the automatic redrawing window rule is not listed in the glulx object-updating rules.

To decide which g-window-position is the newpos of (g - glulx window position):
	if g is g-left, decide on g-placeleft;
	if g is g-right, decide on g-placeright;
	if g is g-above, decide on g-placeabove;
	if g is g-below, decide on g-placebelow;

Before constructing when pending g-window is the graphics-window:
	if not using flexible window-style definitions option begin;
	now the position of the graphics-window is the newpos of graphics window position;
	if the graphics window proportion is greater than zero begin;
		now the measurement of the graphics-window is the graphics window proportion;
		now the scale method of the graphics-window is g-proportional;
	otherwise;
		now the measurement of the graphics-window is the graphics window pixel count;
		now the scale method of the graphics-window is g-fixed-size;
	end if;
	end if.

Chapter -  Default Window behaviour 

Section - inventory

A window-drawing rule for the inventory-window (this is the default print inventory to inventory window rule): 
     move focus to inventory-window, clearing the window;
     say paragraph break;
     try taking inventory;
     return to main screen.

Before reading a command when the inventory-window is g-present: 
	follow the window-drawing rules for the inventory-window.

Section - graphics

After constructing when the pending g-window is the graphics-window:
	set picwin to graphics-window.

To set picwin to (g - a g-window): (- gg_picwin = {g}.ref_number; -).

A window-drawing rule for the graphics-window: 
	follow the current graphics drawing rule.

Inventory Window ends here.

---- DOCUMENTATION ----

This extension is a corollary to Flexible Windows, which is a system designed to allow the author to open and close multiple windows throughout the course of the game. This extension provides an Inventory window (in fact, a side window which could be used for any text purposes, but by default displays the inventory), and the necessary functionality for including a graphical panel as well, by using Emily Short's Simple Graphical Window. 

An inventory window is created automatically by including the extension. Its look can be specified using three properties of the inventory-window g-window object:

	The scale method of the inventory-window...	either g-proportional or g-fixed-size
	The measurement of the inventory-window...	either a proportion (%) of the main window, or a width/depth in characters
	The minimum size of the inventory-window...	a minimum width/depth the window will never go below (regardless of proportional size)

By default a window is proportional at 40% with minimum size 15.

Further properties available:
	
	The position of the inventory-window...		g-above, g-left, g-below, g-right. Defines where the window is placed.
	The back-colour of the inventory-window...	From the table included in the extension: values such as g-green. 

A window can be made bordered, by declaring

	The inventory-window is a bordered g-window.
	The border-colour of the inventory-window...	A colour, as above
	The border-measure of the inventory-window...	A depth, in pixels

Defining the graphical window follows the same lines as Simple Graphical Window, despite the overlap between the two, and setting the above properties for the graphics-window will have no effect (they will be overwritten), unless the use option

	Using Flexible Window-style definitions

is declared.

Controlling the graphical output is exactly the same as with the original Simple Graphical Window extension.

----

Neither window will open automatically. To place the inventory-window and the graphics-window, declare

	open up the inventory-window
	open up the graphics-window

It can be closed again by writing

	shut down the inventory-window

The same applies for the graphical panel although the graphical panel is a subwindow of the inventory window. If you require just a graphics panel, use Simple Graphical Window or defined the measurement of the graphics-window to be 100. (But to affect its placing, you'll need to change the position of the inventory-window, not the graphics-window!)

The default behaviour of the inventory window is to reprint the player's inventory at the end of every turn. This is done by the "default print inventory to inventory window rule". If you wanted to change this behaviour, you can unlist this rule, and write a new "window-drawing rule for the inventory-window" to do whatever you like.

The replacement rule should always start with the instruction

	set focus to inventory-window, clearing the window 	

(Comma'd option is optional, of course). Then finish with
	
	return to main window.

In case where rules vary depending on where we are printing, we can test for the name of the "current g-window".





Version 2 of Title Page by Jon Ingold begins here.

"Provides an intro panel to the game, offering a menu, a restore and restart prompt, a quotation and (under Glulx) a picture."

section 1 - inclusions

Include Menus by Emily Short. 
Include Basic Screen Effects by Emily Short. 

section 2 - definitions

Use menus translates as (- Constant USE_MENUS; -). 
Use skip intro translates as (- Constant Skip_Intro; -).

[The quotation is some text that varies. The quotation is "[story headline]".]

To say quotation: say story headline.

The intro menu is a table-name that varies. The intro menu is the Table of Sample Options.

To centre (t - an indexed text), bold or italic:
	let N be the number of characters in T;
	say spaces to centre N;
	if bold, say bold type;
	if italic, say italic type;
	say T;
	say roman type.

To say spaces to centre (n -  a number) -- running on:
(- 	print "^"; spaces (((VM_ScreenWidth() - {n})/2)-1); 
-)

Section 3 - cover art (for Glulx only)

Include Glulx Image Centering by Emily Short. 
Figure opening figure is the file "cover.jpg".
To display art if appropriate: 	display figure opening figure centered;

Section 3b - no cover art (for Z-machine only)

To display art if appropriate: do nothing.

Section 4a - title screen rule


The first when play begins rule (this is the title screen rule):
while 1 is 1 begin;
	clear the screen;
	redraw status line;
	centre "[story title]", bold;
	centre "   by [story author]";
	say paragraph break;
	display art if appropriate;
	say line break;
	say fixed letter spacing;
	centre "[quotation]", italic;
	say roman type;
	say paragraph break;
	say fixed letter spacing;
	if using the menus option, 
		say "   Display help menu                       :       M[line break]";
	say "   Start the story - from the beginning    :    (SPACE)[line break]";
	say "                   - from a saved position :       R[line break]";
	say "   Quit                                    :       Q[line break]";  
	say variable letter spacing;       
	let k be 0;
	while k is 0 begin;
		let k be the chosen letter;
	end while;
	if k is 13 or k is 31 or k is 32 begin;
		clear the screen; 
		make no decision;
	otherwise if k is 113 or k is 81;
		stop game abruptly;
	otherwise if k is 82 or k is 114;
		follow the restore the game rule;
	otherwise if k is 109 or k is 77;
		if using the menus option begin;
			change the current menu to the intro menu;
			carry out the displaying activity;
		end if;
	end if;
	pause the game;
end while;



Section 5 - the debug option - not for release

A procedural rule when using the skip intro option: 
	ignore the title screen rule.

Title Page ends here.

---- DOCUMENTATION ----

Title Page inserts a intro page to your project. This prints the name and by-line of the game, followed by a quotation - by default this is the game's "headline", but you can change it by declaring:

	To say quotation:
		say "...."

This needs to come after the extension is included. (Note: you must declare exactly "To say quotation", with no "the").

If you're compiling a Glulx project, Title Page will also display the cover.jpg file as stored in the "Materials" folder of the project.

It then provides a menu of options: start a new game, restore a saved game and quit. You can also make it display a "show menu" option by setting the menus option and setting the intro menu.

	Use menus.
	The intro menu is the Table of Introductory Information.

Note that the extension always includes the extension Menus that ships with Inform, and so this framework should be used for writing Menu tables.

Finally, for debug project (specifically, those in the testing panel) it can be tedious to start the game with an intro panel every time (and indeed, the "restore" option doesn't work in the test pane of the I7 application). Therefore an option is provided to skip the intro on debug versions, but still include it on released versions. 

	Use skip intro.



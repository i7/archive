German Basic Screen Effects by Lukas Strahner begins here.

Use authorial modesty.

Include Basic Screen Effects by Emily Short. 

Section 1 - German Spacing and Pausing (in place of Section 1 - Spacing and Pausing in Basic Screen Effects by Emily Short)

Include (-

[ KeyPause i; 
	i = VM_KeyChar(); 
	rfalse;
];

[ SPACEPause i;
	while (i ~= 13 or 31 or 32)
	{
		i = VM_KeyChar();	
	}
];

[ GetKey i;
	i = VM_KeyChar(); 
	return i;
];

-)

To clear the/-- screen:
	(- VM_ClearScreen(0); -)

To clear only the/-- main screen:
	(- VM_ClearScreen(2); -)

To clear only the/-- status line:
	(- VM_ClearScreen(1); -).

To wait for any key:
	(- KeyPause(); -)

To wait for the/-- SPACE key:
	(- SPACEPause(); -)

To decide what number is the chosen letter:
	(- GetKey() -)

To pause the/-- game: 
	say "[paragraph break]Drücke LEERTASTE um fortzufahren.";
	wait for the SPACE key;
	clear the screen.

To center (quote - text-routine):
	(- CenterPrintComplex({quote}); -);

To center (quote - text):
	(- CenterPrintComplex({quote}); -);
 
To center (quote - text-routine) at the/-- row (depth - a number):
	(- CenterPrint({quote}, {depth}); -);

To center (quote - text) at the/-- row (depth - a number):
	(- CenterPrint({quote}, {depth}); -);
	
To stop the/-- game abruptly:
	(- quit; -)
	
To show the/-- current quotation:
	(- ClearBoxedText(); -);


Include (-

#ifndef printed_text;
Array printed_text buffer 256;
#endif;

[ CenterPrint str depth i j;
	font off;
	i = VM_ScreenWidth();
			VM_PrintToBuffer(printed_text, 63, str);
	j = (i-(printed_text-->0))/2; 
	j = j-1;
	VM_MoveCursorInStatusLine(depth, j);
	print (I7_string) str; 
	font on;
];

[ CenterPrintComplex str i j;
	font off;
	print "^"; 
	i = VM_ScreenWidth();
			VM_PrintToBuffer(printed_text, 63, str);
	j = (i-(printed_text-->0))/2; 
	spaces j-1;
	print (I7_string) str; 
	font on;
];

-)

To decide what number is screen width:
	(- VM_ScreenWidth() -);

To decide what number is screen height:
	(- I7ScreenHeight() -);

Include (-

[ I7ScreenHeight i screen_height;
	i = 0->32;
		  if (screen_height == 0 or 255) screen_height = 18;
		  screen_height = screen_height - 7;
	return screen_height;
];

-)

To deepen the/-- status line to (depth - a number) rows:
	(- DeepStatus({depth}); -);

To move the/-- cursor to (depth - a number):
	(- I7VM_MoveCursorInStatusLine({depth}); -)

To right align the/-- cursor to (depth - a number):
	(- RightAlign({depth}); -)

Include (- 

[ DeepStatus depth i screen_width;
	VM_StatusLineHeight(depth);
	screen_width = VM_ScreenWidth(); style reverse;
			#ifdef TARGET_GLULX;
			  VM_ClearScreen(1);
			#ifnot;
	  for (i=1:i<depth+1:i++)
			  {
	 	@set_cursor i 1;
	 	spaces(screen_width);
	  } 
		   #endif;
];

[ I7VM_MoveCursorInStatusLine depth;
	VM_MoveCursorInStatusLine(depth, 1);
];

[ RightAlign depth screen_width o n;
	screen_width = VM_ScreenWidth(); 
	n = (+ right alignment depth +);
	o = screen_width - n;
	VM_MoveCursorInStatusLine(depth, o);
];

-)

Table of Ordinary Status
left	central	right
"[location]"	""	"[score]/[turn count]" 

Status bar table is a table-name that varies. Status bar table is the Table of Ordinary Status.

To fill status bar with (selected table - a table-name):
	let __n be the number of rows in the selected table;
	deepen status line to __n rows;
	let __index be 1;
	repeat through selected table
	begin;
		move cursor to __index; 
		say "[left entry]";
		center central entry at row __index;
		right align cursor to __index;
		say "[right entry]";
		change __index to __index + 1;
	end repeat.

Right alignment depth is a number that varies. Right alignment depth is 14.

German Basic Screen Effects ends here.

---- DOCUMENTATION ----

Die German Basic Screen Effects sind eine direkte Übersetzung von Emily Short's gleichnamiger Extension. Es wurden lediglich alle Texte ins Deutsche übersetzt. (in diesem Fall nur ein Satz)

Diese Extension benötigt die Extension "Basic Screen Effects" von Emily Short und bindet sie automatisch in das Projekt ein.

Für die weitere Handhabung, siehe Emily Short's Dokumentation zu Basic Screen Effects.
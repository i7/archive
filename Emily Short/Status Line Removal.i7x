Version 4 of Status Line Removal by Emily Short begins here.

"Removes the status line entirely, for Z-machine or Glulx games where none is desired."

Use authorial modesty.


Section - Replacement of DrawStatusLine()

Include (-

Replace DrawStatusLine;


-) after "Definitions.i6t".

Include (-

[ DrawStatusLine;
]; 

-) after "Definitions.i6t".


Section - InitGlkWindow entry point (for use without Flexible Windows by Jon Ingold)

Include (-

#ifdef TARGET_GLULX;

  [ InitGlkWindow winrock;

     switch (winrock) {

! do not create a status window. 
     GG_STATUSWIN_ROCK: rtrue;

     }
     rfalse;  
  ];
#endif;

-) after "Definitions.i6t".


Section - Use Flexible Windows' InitGlkWindow routine (for use with Flexible Windows by Jon Ingold)

Use no status line.


Status Line Removal ends here.

---- Documentation ----

A very simple, single-purpose extension: include it if you wish to eliminate the status line from your game. (This may be useful when compiling a game to display on Zplet or another web-based interpreter where the status line looks bad with the web page's framing effects.)

Note that this extension may not be compatible with some Glulx windowing extensions.
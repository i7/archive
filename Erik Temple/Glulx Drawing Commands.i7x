Version 1/090629 of Glulx Drawing Commands (for Glulx only) by Erik Temple begins here.

"Provides wrappers for the basic Glulx drawing commands, allowing authors to draw 'stroked' and filled rectangles as well as image files to a graphical window without dropping into I6. Compatible with both Simple Graphical Window and Flexible Windows."


Section - Routines to determine image size

To decide what number is the pixel-width of (img - a figure-name):
	(- FindImageWidth({img}); -)
	
To decide what number is the pixel-height of (img - a figure-name):
	(- FindImageHeight({img}); -)

Include (-

[ FindFigureWidth  img result img_width;
	result = glk_image_get_info(img, gg_arguments, gg_arguments+WORDSIZE);
             		img_width  = gg_arguments-->0;
	return img_width;
];

[ FindFigureHeight  img result img_height;
	result = glk_image_get_info(img, gg_arguments, gg_arguments+WORDSIZE);
             		img_height  = gg_arguments-->1;
	return img_height;
];

-)


Section - Simple Graphical Window (for use with Simple Graphical Window by Emily Short)

To draw a/-- rectangle with (color - a glulx color value) stroke of (strok - a number) pixel/pixels from/at --/coordinates (gleft - a number) by/and (gupper - a number) to (gright - a number) by/and (glower - a number), outlining:
	(- DrawRectangle({color}, {strok}, {gleft}, {gupper}, {gright}, {glower}, {phrase options}); -)
	
To draw a/-- (color - a glulx color value) filled rectangle from/at --/coordinates (gleft - a number) by/and (gupper - a number) to (gright - a number) by/and (glower - a number):
	(- DrawFilledRect({color}, {gleft}, {gupper}, {gright}, {glower}); -)

To draw a/-- square with (color - a glulx color value) stroke of (strok - a number) pixel/pixels at/from --/coordinates (gleft - a number) by/and (gupper - a number) with size (rect_size - a number), outlining:
	if outlining:
		draw a rectangle with color stroke of strok pixels from gleft by gupper to (gleft + rect_size) by (gupper + rect_size), outlining;
	otherwise:
		draw a rectangle with color stroke of strok pixels from gleft by gupper to (gleft + rect_size) by (gupper + rect_size);

To draw a/-- (color - a glulx color value) filled square at/from --/coordinates (gleft - a number) by/and (gupper - a number) with size (rect_size - a number):
	draw a color filled rectangle from gleft by gupper to rect_size by rect_size;

To draw the/-- image/-- (ID - a figure-name) at/from coordinates/-- (x - a number) by/and (y - a number):
	(- DrawImage({ID}, {x}, {y}); -)
	
To draw the/-- image/-- (ID - a figure-name) at/from coordinates/-- (x - a number) by/and (y - a number) with dimensions (image_x - a number) and/by (image_y - a number):
	(- DrawImage({ID}, {x}, {y}, {image_x}, {image_y}); -)
	
Include (-

[ DrawFilledRect color left upper right lower ;
	if (gg_picwin) {
		color = ColVal(color);
		glk_window_fill_rect(gg_picwin, color, left, upper, (right - left), (lower - upper) );
	}
];

[ DrawRectangle color stroke left upper right lower outlining ;
! Draws four rectangles that outline the coordinates given as input on the I7 level.
	if (gg_picwin) {
		color = ColVal(color);
		if (~~outlining) {
			glk_window_fill_rect(gg_picwin, color, left, upper, right - left, stroke);
			glk_window_fill_rect(gg_picwin, color, right - stroke, upper, stroke, lower - upper);
			glk_window_fill_rect(gg_picwin, color, left, lower - stroke, right - left, stroke);
			glk_window_fill_rect(gg_picwin, color, left, upper, stroke, lower - upper);
		}
		if (outlining) {
			glk_window_fill_rect(gg_picwin, color, left - stroke, upper - stroke, stroke + right - left, stroke);
			glk_window_fill_rect(gg_picwin, color, right, upper - stroke, stroke, stroke + lower - upper);
			glk_window_fill_rect(gg_picwin, color, left - stroke, lower, stroke + stroke + right - left, stroke);
			glk_window_fill_rect(gg_picwin, color, left - stroke, upper - stroke, stroke, stroke + lower - upper);
		}
	}
];

[DrawImage ID win x y ;
	if (gg_picwin) {
		glk_image_draw(gg_picwin, ID, x, y);
	}
];  

[DrawImageScaled ID x y image_x image_y ;
	if (gg_picwin) {
		glk_image_draw_scaled(gg_picwin, ID, x, y, image_x, image_y);
	}
];  

Constant glulx_colour_table = (+Table of Common color Values+);
! From Jon Ingold's Flexible Windows - provides I6 interface to Glulx Text Effects color table
[ ColVal c i max;
	max=TableRows(glulx_colour_table);
	for ( i=1:i<=max:i++ ) {
		if (TableLookUpEntry(glulx_colour_table, 1, i) ==  c) 
			return TableLookUpEntry(glulx_colour_table, 2, i);
	} 
];

-).


Section - Flexible Windows drawing commands (for use with Flexible Windows by Jon Ingold)

To draw a/-- rectangle with (color - a glulx color value) stroke of (strok - a number) pixel/pixels in (win - a g-window) from/at --/coordinates (gleft - a number) by/and (gupper - a number) to (gright - a number) by/and (glower - a number), outlining:
	(- DrawRectangle({color}, {strok}, {win}, {gleft}, {gupper}, {gright}, {glower}, {phrase options}); -)
	
To draw a/-- (color - a glulx color value) filled rectangle in (win - a g-window) from/at --/coordinates (gleft - a number) by/and (gupper - a number) to (gright - a number) by/and (glower - a number):
	(- DrawFilledRect({color}, {win}, {gleft}, {gupper}, {gright}, {glower}); -)

To draw a/-- square with (color - a glulx color value) stroke of (strok - a number) pixel/pixels in (win - a g-window) at/from --/coordinates (gleft - a number) by/and (gupper - a number) with size (rect_size - a number), outlining:
	if outlining:
		draw a rectangle with color stroke of strok pixels in win from gleft by gupper to (gleft + rect_size) by (gupper + rect_size), outlining;
	otherwise:
		draw a rectangle with color stroke of strok pixels in win from gleft by gupper to (gleft + rect_size) by (gupper + rect_size);

To draw a/-- (color - a glulx color value) filled square in (win - a g-window) at/from --/coordinates (gleft - a number) by/and (gupper - a number) with size (rect_size - a number):
	draw a color filled rectangle in win from gleft by gupper to (rect_size + gleft) by (rect_size + gupper);

To draw the/-- image/-- (ID - a figure-name) in (win - a g-window) at/from coordinates/-- (x - a number) by/and (y - a number):
	(- DrawImage({ID}, {win}, {x}, {y}); -)
	
To draw the/-- image/-- (ID - a figure-name) in (win - a g-window) at/from coordinates/-- (x - a number) by/and (y - a number) with dimensions (image_x - a number) and/by (image_y - a number):
	(- DrawImageScaled({ID}, {win}, {x}, {y}, {image_x}, {image_y}); -)

	
Include (-

[ DrawFilledRect color win left upper right lower ;
	if (win.ref_number) {
		color = ColVal(color);
		glk_window_fill_rect(win.ref_number, color, left, upper, (right - left), (lower - upper) );
	}
];

[ DrawRectangle color stroke win left upper right lower outlining ;
! Draws four rectangles that outline the coordinates given as input on the I7 level.
	if (win.ref_number) {
		color = ColVal(color);
		if (~~outlining) {
			glk_window_fill_rect(win.ref_number, color, left, upper, right - left, stroke);
			glk_window_fill_rect(win.ref_number, color, right - stroke, upper, stroke, lower - upper);
			glk_window_fill_rect(win.ref_number, color, left, lower - stroke, right - left, stroke);
			glk_window_fill_rect(win.ref_number, color, left, upper, stroke, lower - upper);
		}
		if (outlining) {
			glk_window_fill_rect(win.ref_number, color, left - stroke, upper - stroke, stroke + right - left, stroke);
			glk_window_fill_rect(win.ref_number, color, right, upper - stroke, stroke, stroke + lower - upper);
			glk_window_fill_rect(win.ref_number, color, left - stroke, lower, stroke + stroke + right - left, stroke);
			glk_window_fill_rect(win.ref_number, color, left - stroke, upper - stroke, stroke, stroke + lower - upper);
		}
	}
];

[DrawImageScaled ID win x y image_x image_y ;
	if (win.ref_number) {
		glk_image_draw_scaled(win.ref_number, ID, x, y, image_x, image_y);
	}
];  

[DrawImage ID win x y ;
	if (win.ref_number) {
		glk_image_draw(win.ref_number, ID, x, y);
	}
];  

-).

Glulx Drawing Commands ends here.

---- DOCUMENTATION ----

Glulx Drawing Commands exposes all of the inputs to the main Glulx drawing commands at the I7 level. When used with either Simple Graphical Window or Flexible Windows, this enables authors to write their own drawing rules without any I6 inclusions. Glulx Drawing Commands also includes a couple of derivative commands, including commands to draw a "stroke" of variable weight around a rectangular area of the screen, and to draw squares using a slightly more concise syntax

The extension implements the Glulx commands glk_image_draw, glk_image_draw_scaled, and glk_window_fill_rect. It does not include the glk_window_erase_rect command, since this is easily imitated using the "draw a rectangle" command provided together with the background color attributes provided by the Simple Graphical Window and Flexible Windows extensions it is designed to work with.

Glulx Drawing Commands requires either Emily Short's Simple Graphical Window or Jon Ingold's Flexible Windows, and provides equivalent functions with either. Since these two extensions are incompatible, Glulx Drawing Commands cannot be used with both at the same time!

Glulx Drawing Commands provides the following drawing phrases (as written with Simple Graphical Window; see below for Flexible Windows syntax):

	(1) draw the image Figure of Cover at coordinates 10 by 10;
	(2) draw the image Figure of Cover at coordinates 10 by 10 with dimensions 20 by 40;
	(3) draw a g-red filled rectangle at coordinates 10 by 10 to 20 by 40;
	(4) draw a g-red filled square at coordinates 10 by 10 with size 20;
	(5) draw a rectangle with g-red stroke of 2 pixels from coordinates 10 by 10 to 20 by 40, outlining;
	(6) draw a square with g-red stroke of 2 pixels from coordinates 10 by 10 with size 20, outlining;

Command 1 draws an image file (previously defined as Figure of...) with its upper left corner at a set of given coordinates, without scaling. Command 2 scales also draws and image, but fits it to the dimensions provided. Command 3 draws a rectangle of a given color, with its upper left corner at the first provided pair of coordinates, and its lower right corner at the second pair. Colors for the drawing commands must be defined in the Table of Common Color Values, (provided by the Glulx Text Effects extension). Command 4 simplifies the drawing of a square by allowing us to provide just the coordinate of the upper left corner of the shape, followed by the length (in pixels) of its sides.

Commands 5 and 6 draw a rectangular outline with lines ("stroke" in the parlance of graphic art) of a given width (provided in pixels). If we append the "outlining" phrase option, these lines will be drawn outside the rectangular area we've defined; otherwise, the lines will be drawn on the interior of the rectangle.

The syntax for drawing commands is relatively forgiving, and phrases can be shortened significantly, e.g.:

	draw Figure of Cover at 10 by 10;
	draw Figure of Cover at 10 by 10 with dimensions 20 by 40;
	draw a g-red filled rectangle at 10 by 10 to 20 by 40;
	draw a square with g-red stroke of 2 pixels from 10 by 10 with size 20;

To use these commands with Flexible Windows, we must also supply the name of the g-window we wish to draw to (we need to have set up and opened this g-window prior to drawing to it):

	draw the image Figure of Cover in the graphics-window at coordinates 10 by 10;
	(2) draw the image Figure of Cover in the graphics-window at coordinates 10 by 10 with dimensions 20 by 40;
	(3) draw a g-red filled rectangle in the graphics-window at coordinates 10 by 10 to 20 by 40;
	(4) draw a g-red filled square in the graphics-window at coordinates 10 by 10 with size 20;
	(5) draw a rectangle with g-red stroke of 2 pixels in the graphics-window from coordinates 10 by 10 to 20 by 40, outlining;
	(6) draw a square with g-red stroke of 2 pixels in the graphics-window from coordinates 10 by 10 with size 20, outlining;

The phrase "in the (g-window)" should be placed just before the coordinates are given.

Finally, with both Simple Graphical Window and Flexible Windows, the dimensions of a figure can be queried using these terms:

	pixel-width
	pixel-height

This is especially useful if we want to scale an image to fit the window. Brief usage:

	let X be the pixel-width of Figure of Cover;
	let Y be the pixel-width of Figure of Cover;
	draw the image Figure of Cover in the graphics-window at coordinates 10 by 10 with dimensions X and Y;

Simple Graphical Window provides these terms to query the size of the graphics window:

	current graphics window width
	current graphics window height

If we are using Flexible Windows, we will want to use these terms:

	width of (a g-window)
	height of (a g-window)





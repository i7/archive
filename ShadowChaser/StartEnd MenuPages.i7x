Version 1 of StartEnd MenuPages by ShadowChaser begins here.

"This is based loosely on Title Page by Jon Ingold. It does a similar thing, but it has a differently styled menu system, and contains some generic help text. Because I also like to include mature content, it also optionally allows for an initial warning page, offering the player the option of quitting before showing any of a game's content. Finally, I have added an End of Game menu also."

Section 1 - inclusions

Include Menus by Emily Short. 
Include Basic Screen Effects by Emily Short. 
Include Useful Functions by ShadowChaser.

Section 2 - blank text

To decide if (s - text) has contents : if s is "", decide no; decide yes.

Section 3 - definitions

Use menus translates as (- Constant USE_MENUS; -). 
Use skip intro translates as (- Constant Skip_Intro; -).
Use mature content warning translates as (- Constant mature_content; -).
Use no title page translates as (- Constant no_title_page; -).
Use credits translates as (-Constant USE_CREDITS; -).
Use progress translates as (-Constant USE_PROGRESS; -).

The disclaimer, game_title, start_quotation, end_quotation, start_footer_text, end_footer_text, game_credits and game_progress are text variables.

To say the_disclaimer:
	say "[if disclaimer  has contents][disclaimer][else]Warning. This game contains mature content that is unsuitable for minors, and that some people may find disturbing. Do not continue if you are likely to be offended by such material.[end if]".

To say the_game_title:
	say "[if game_title has contents][game_title][else][story headline][end if]".

To say the_start_quotation:
	say "[if start_quotation has contents][start_quotation][else]That is not dead which can eternal lie.[line break]And in strange eons even death may die.[paragraph break]- The Necronimicon.[end if]".

To say the_end_quotation:
	say "[if end_quotation has contents][end_quotation][else]It's better to burn out, than to fade away![paragraph break]- Kurgan (Highlander).[end if]".

To say the_start_footer_text:
	say "[if start_footer_text has contents][start_footer_text][else]The characters and events portrayed in this work of interactive fiction are purely fictitious, and any resemblance to persons living, dead, or undead are purely coincidental.[end if]".

To say the_end_footer_text:
	say "[if end_footer_text has contents][end_footer_text][else]The characters and events portrayed in this work of interactive fiction are purely fictitious, and any resemblance to persons living, dead, or undead are purely coincidental.[end if]".

To say the_game_credits:
	say "[if game_credits has contents][game_credits][else]This game was written by [story author].[end if]".

To say the_game_progress:
	say "[if game_progress has contents][game_progress][else]GAME OVER.[end if]".

The intro_menu is a table-name that varies. The intro_menu is usually The Table of Sample Options.

The game_started is a number that varies. The game_started is 0.

Section 3 - menu art and music (for Glulx only)

Include Glulx Image Centering by Emily Short. 
Figure openingFigure is the file "startpicture.jpg".
To display_start_art: 	display figure openingFigure centered.

Figure closingFigure is the file "endpicture.jpg".
To display_end_art: 	display figure closingFigure centered.

Sound of startingMusic is the file "startmusic.ogg".
To play_start_music: 	play the sound of startingMusic.

Sound of endingMusic is the file "endmusic.ogg".
To play_end_music: 	play the sound of endingMusic.

Section 3b - no cover art or music (for Z-machine only)

To display_start_art: do nothing.
To display_end_art:  do nothing.
To play_start_music: do nothing.
To play_end_music: do nothing.

Section 4 - the title screen rule

The first when play begins rule (this is the title screen rule):
	if using the mature content warning option and the game_started is 0 begin;
		let continue_val be 0;
		while continue_val is 0 begin;
			clear the screen;
			redraw status line;
			say paragraph break;
			say "[the_disclaimer]";
			say paragraph break;
			let answer be yesno_answer_with_question "Do you wish to continue (Y / N)?"; 
			if answer is "NO" begin;
				stop game abruptly;
			otherwise;
				if answer is "YES" begin;
					let continue_val be 1;
					now the game_started is 1;
				end if;
			end if;
		end while;
	end if;
	while not using the no title page option begin;
		clear the screen;
		redraw status line;
		play_start_music;
		say paragraph break;
		display_start_art;
		say line break;
		say "[the_game_title]";
		say paragraph break;
		say "[the_start_quotation]";
		say paragraph break;
		say "Please choose one of the following options:";
		say paragraph break;
		say fixed letter spacing;
		if using the menus option begin;
			say "Help menu            : M[line break]";
		end if;
		say "Start the game       : (SPACE)[line break]";
		say "Restore a saved game : R[line break]";
		say "Quit                 : Q";
		say variable letter spacing; 
		say paragraph break;      
		say "[the_start_footer_text]";
		say paragraph break;
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
				change the current menu to the intro_menu;
				carry out the displaying activity;
			end if;
			pause the game;
		end if;
	end while.

Section 5 - the end game menu

The infinate_loop is a number that varies. The infinate_loop is 1.

The last when play ends rule (this is the game ending rule):
	while the infinate_loop is 1  begin;
		clear the screen;
		redraw status line;
		play_end_music;
		say paragraph break;
		display_end_art;
		say paragraph break;
		say "[the_end_quotation]";
		say paragraph break;
		say "Please choose one of the following options:";
		say paragraph break;
		say fixed letter spacing;
		if using the credits option begin;
			say "Display credits        : C[line break]";
		end if;
		if using the progress option begin;
			say "Show your progress     : P[line break]";
		end if;
		say "Restart the game       : (SPACE)[line break]";
		say "Restore a saved game : R[line break]";
		say "Quit                   : Q";
		say variable letter spacing; 
		say paragraph break;      
		say "[the_end_footer_text]";
		say paragraph break;
		let k be 0;
		while k is 0 begin;
			let k be the chosen letter;
		end while;
		if k is 13 or k is 31 or k is 32 begin;
			 clear the screen; 
			 try silently restarting the game;
		otherwise if k is 113 or k is 81;
			stop game abruptly;
		otherwise if k is 99 or k is 67;
			if using the credits option begin;
				clear the screen;
				Say "[the_game_credits]";
				pause_clear;
			end if;
		otherwise if k is 82 or k is 114;
			follow the restore the game rule;
		otherwise if k is 112 or k is 80;
			if using the progress option begin;
				clear the screen;
				Say "[the_game_progress]";
				pause_clear;
			end if;
		end if;
	end while.

Section 6 - the debug option - not for release

A procedural rule when using the skip intro option: 	ignore the title screen rule.

StartEnd MenuPages ends here.

---- DOCUMENTATION ----

Section: Description 

This is based loosely on Title Page by Jon Ingold. It does a similar thing in providing an intro panel to the game, offering a menu, a restart and restore prompt, a quotation and (under Glulx) a picture, but it has a differently styled menu system, and contains some generic help text. Because I also like to include mature content, it also optionally allows for an initial warning page, offering the player the option of quitting before showing any of a game's content. Finally, I have added an End of Game menu also

Section: Dependencies

The following extensions are used and loaded by this one:

Menus by Emily Short. 

Basic Screen Effects by Emily Short. 

Useful Functions by ShadowChaser.

Section: Usage

When the intro page is displayed it prints the game title, followed by a quotation. 

By default the game title is the game's "headline", but you can change it by declaring:

	The game_title is " .... ".
	
The default quotation is a famous quote from a fictional book created by a famous horror writer. The quotation can be changed by declaring:

	The start_quotation is " .... ".
	
If you're compiling a Glulx project, the intro page will also display the file startpicture.jpg, and play the file startmusic.ogg, as stored in the "Materials" folder of the project.

It then provides a menu of options: start a new game, restore a saved game and quit. You can also make it display a "show menu" option by setting the menus option and setting the intro menu.

	Use menus.
	The intro_menu is the Table of Introductory Information.

Note that the extension always includes the extension Menus that ships with Inform, and so this framework should be used for writing Menu tables.

After displaying the menu, it displays some footer text. By default this is a disclaimer similar to the ones given at the end of movies. It can be changed by declaring:

	The start_footer_text is " .... ".

Because I often like to add mature content to my game it is possible at the start of the game to display a mature content disclaimer. If you opt to use this option then before the title page is displayed the software will display a disclaimer text warning the player that the game contains mature content. It will then ask them if they want to continue. If, and only if, they pres the Y key, will the game start and the title page be displayed.

To use this option declare:

	Use mature content warning.
	
The content disclaimer can be customised by declaring:

	The disclaimer is " .... ".

If you only want to display the disclaimer without the title page afterward, declare:

	Use no title page.

Finally, for debug project (specifically, those in the testing panel) it can be tedious to start the game with a disclaimer and intro panel every time (and indeed, the "restore" option doesn't work in the test pane of the I7 application). Therefore an option is provided to skip the intro on debug versions, but still include it on released versions. 

	Use skip intro.

When the end page is displayed it prints the ending quotation.  The quotation can be changed by declaring:

	The end_quotation is " .... ".
	
If you're compiling a Glulx project, the end page will also display the file endpicture.jpg, and play the file endmusic.ogg, as stored in the "Materials" folder of the project.

It then provides a menu of options: restart the game, restore a saved game and quit. You can also make it display a "show credits" option by setting the credits option and setting the game_credits text.

	Use credits.
	The game_credits is " .... ".

You can also make it display a "show progress" option by setting the progress option and setting the game_progress text. 
	
	Use progress.
	The game_progress is " .... ".

After displaying the end menu, it displays some footer text. It can be changed by declaring:

	The end_footer_text is " .... ".




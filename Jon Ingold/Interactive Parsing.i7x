Version 3 of Interactive Parsing (for Glulx only) by Jon Ingold begins here.

"Provides real-time suggestions for the player's input based on what they've typed so far, using the parser itself to ensure these suggestions are sensible."


[
	ISSUES:

		* Auto-build two-letter verb table (Might be slow? Might not help much?)

		* Ambiguous input goes to the main screen, followed by a prompt for more info. Would be better if this prompt was in the input line.

		* Similarly, would be better if parser errors stayed on the input line too.


]

[
	NOTES:

		Print Inferred Command -
		- currently clobbered by a "clarifying the parser's choice of..." rule
		- should actually print inference in blue after typed text, if all words AOK etc.
		- (But shouldn't print PRESS RETURN if there's an inference???)

]



Book 1 - Establish System


Chapter 1 - Set up the Game Interface

Section 1 - Inclusions

Include Basic Screen Effects by Emily Short.
Include Flexible Windows by Jon Ingold. 
Include Text Window Input-Output Control by Erik Temple.

Section 1a - Options

Use interactive parsing override translates as (- Constant USE_INTERACTIVE_PARSER_OVERRIDE; -).

Use debug advance parsing translates as (- Constant DEBUG_ADVANCE_PARSING; -).
Use show interim parser errors translates as (- Constant SHOW_PARSER_ERRORS; -).

Use long word check report translates as (- Constant LONG_WORD_CHECK_REPORT; -).


[
	Use debug advance parsing. 
]


Section 1b - Constants

Use maximum dictionary size of at least 1000 translates as (- Constant MAX_WORDS = {N}; -).
Use average word length of at least 6 translates as (- Constant AV_WORD_LENGTH = {N}; -).

Use maximum words in scope of at least 256 translates as (- Constant MAX_WORD_IN_SCOPE = {N}; -).
Use maximum verb words of at least 300 translates as (- Constant MAX_VERB_NAMES = {N}; -).
Use maximum compass names of at least 35 translates as (- Constant MAX_COMPASS_NAMES =  {N}; -).

Section 2 - Set up basic windows

The key-window is a text-grid g-window spawned by the main-window. The position of the key-window is g-placebelow. The measurement of the key-window is 10.

The border-window is a graphics g-window spawned by the main-window. The position is g-placebelow. The scale method is g-fixed-size. The measurement is 2. The back-colour is g-dark-grey.

When play begins:
	if the interactive parsing override option is inactive:
		open up the key-window as the main text input window;

[ The border window has been disabled so that games work for Quixe. ]
[	open up the border-window;]

Section 3 - Using Text IO Control to read in command in a sub-window

Before printing the command prompt when the current text input window is the key-window:
	clear the current text input window.

Before reading a command when the current action is restarting the game or the current action is quitting the game:
	say line break.	
	
After reading a command when not Inputstyling:
	shut down the echo stream of the main-window;
	say ">[player's command in upper case][command clarification break]";
	echo the stream of the main-window to the transcript.

The command-pasting terminator is "[run paragraph on][if we are writing a transcript][echo stream of current text input window][line break][stream of current text input window][end if]". 

Section 3b - Line breaks after parser interruptions

After printing a parser error: say line break.
After asking which do you mean: say line break.

Section 4 - Toggling Input Style

Inputstyling is an action out of world.

Understand "inputchange" as Inputstyling.

Carry out Inputstyling:
	if the interactive parsing override option is inactive:
		if the current text input window is the main-window:
			open up the key-window as the main text input window;
		else:
			now the current text input window is the main-window;
			shut down the key-window.





Chapter 2 - Hook into new input system

Section 1 - Keyboard Primitive diverted to a new input routine

Include (-

[ KeyboardPrimitive a_buffer a_table;
#Ifdef DEBUG; #Iftrue ({-value:NUMBER_CREATED(test_scenario)} > 0);
	return TestKeyboardPrimitive(a_buffer, a_table);
#Endif; #Endif;

! We should only use this input routine if our mode is on. 
! Incidentally, we should be careful with Disambiguation questions, too, which will come through here.

#ifndef USE_INTERACTIVE_PARSER_OVERRIDE;
	if ((+current text input window+) == (+key-window+))
		return New_Key_Input(a_buffer, a_table);
	else
		return VM_ReadKeyboard(a_buffer, a_table);
#ifnot;
	return VM_ReadKeyboard(a_buffer, a_table);
#endif;

];

-) instead of "Keyboard Primitive" in "Parser.i6t".


Section 2 - Read in the input line using keystrokes

Include (-

Global prompted_word = 0;

Constant PENDING = 1;
Constant PROCESSING = 2;
Constant PERFORMED = 3;

Global current_analysis_stage = PENDING;

Constant TIME_SKIP = 1;
Constant MAX_TESTS = 50;

Global interrupt_keypress = 0;

Global cursor_position = 0;

[ New_Key_Input
	a_buffer a_table
	key
	terminated 
	rv
	character_press_engaged
	;

InitialiseCommandRecall();

	! set up the line : initialise variables

	terminated = false;
	cursor_position = 0;
	a_buffer-->0 = 0;

	
	! set up the window: clear prompts and suggestions
	
	glk_cancel_char_event((+key-window+).ref_number);

	! build some quick look-up tables of verbs, in-scope nouns and prepositions, and the compass
	! The compass list could be built once at the start of the game, but it's fast, and done here
	! in case the game changes the names of directions at any point.

	WorkThroughScope(location, word_in_scope_list, MAX_WORD_IN_SCOPE, EX_PREPOSITION, 0, "visible scoped nouns", "maximum words in scope");
	
	WorkThroughScope(Compass, word_for_verb_list, MAX_VERB_NAMES, EX_VERB, animate, "verb words", "maximum verb words");
	
	WorkThroughScope(Compass, word_in_compass_list, MAX_COMPASS_NAMES, EX_NONE, 0, "compass names", "maximum compass names");

	ErasePreviousSuggestions();
	ResetRunningChecks();



	cursor_position = ApplyEditPoint(a_buffer);
	if (cursor_position == 0)
	{
		ClearPromptWindow();	
		PrintPromptInWindow();
	}

	! set up - request a character event

	glk_request_char_event((+key-window+).ref_number);

	! begin outer loop - reading in the line
	while(~~terminated)
	{
		! inner loop - wait for something to happen
		while(true)
		{
			! if we're here from a keypress event that occurred during processing. 
			! We "fake" keypress input

			if (interrupt_keypress ~= 0)
			{
				! write in a keypress event
				gg_event-->0 = evtype_CharInput;
				gg_event-->2 = interrupt_keypress;
				interrupt_keypress = 0;
				character_press_engaged = true;

			}
			else
			{
				! Otherwise, stop and wait for an event
				CorrectlyPositionCursor();
				glk_select(gg_event);
			}

			! Event 1 - The Timer has pinged. 
			! Let's go off and do some more analysis

			if (gg_event-->0 == evtype_Timer)
			{
				! Do some analysis
				if (current_analysis_stage ~= PERFORMED)
					SuggestionAnalysis(a_buffer);

				! if we're done, cancel the timer
				if (current_analysis_stage == PERFORMED)
					glk_request_timer_events(0);
			}
			
			! Event 2 - Window resize
			else if (gg_event-->0 == evtype_Arrange)
			{
				DrawStatusLine();
			}
			
			else

			! Event 3 - A Key was Pressed
			if (gg_event-->0 == evtype_CharInput)
			{
				key = gg_event-->2; ! get the character pressed
!				awaiting_keypress = false;
			

         	! Different keys require different things
				switch(key)
				{
					! a newline
					13, 250, keycode_Return :

						CompleteSuggestionAnalysis (a_buffer);
						rv = WriteInSuggestion(a_buffer, cursor_position, (a_buffer-->0 == 1));
						if (rv > -1) cursor_position = rv - 1;
						! -1 because we don't want to put the cursor *after* the last character
						
!						glk_set_window((+main-window+).ref_number);	
!						print "Written in suggestion makes line ", rv, " characters long.^";

						terminated = true;

					! escape key
					keycode_Escape:
						if (cursor_position > 0)
						{
							InsertCharacterAt(' ', a_buffer, cursor_position);
							!a_buffer->(WORDSIZE + type_position) = ' ';
							ResetRunningChecks();
							BlankSuggestion();
							cursor_position++;
						}

					! a space
					32:
						
						CompleteSuggestionAnalysis (a_buffer);
						rv =  WriteInSuggestion(a_buffer, cursor_position, true);
						if (rv > -1)
						{
							cursor_position = rv;
						} 
						else if (cursor_position > 0) 
						{
							InsertCharacterAt(' ', a_buffer, cursor_position);
							cursor_position ++;
						}
					

	! TODO: moving the cursor drastically affects the suggestion system
	! eventually... 
	! we need to ensure that the word the player's looking at == the word we're suggesting for

					! right arrow
					keycode_Right:
						if (cursor_position < a_buffer-->0)
							cursor_position++;
					! left arrow
					keycode_Left:
						if (cursor_position > 0)
							cursor_position--;
					! end	
					keycode_End:
						cursor_position = a_buffer-->0;
					! home
					keycode_Home:
						cursor_position = 0;

					! Tab
					253, keycode_Tab, 9:
						! forces auto-complete 
						! (so like space, but will write in suggestion
						! even if the current word itself is recognised as in the dictionary)

						CompleteSuggestionAnalysis (a_buffer);
						rv =  WriteInSuggestion(a_buffer, cursor_position, true);
						if (rv > -1) cursor_position = rv;

					! redundant keys are silent
				
					keycode_Func1, keycode_Func2,keycode_Func3,keycode_Func4,
					keycode_Func5,keycode_Func6,keycode_Func7,keycode_Func8,
					keycode_Func9,keycode_Func10,keycode_Func11,keycode_Func12:

					! up arrow - I intend to use this for command recall, later
					252, keycode_Up, keycode_PageUp: 	

						rv = RecallPreviousCommandLine(a_buffer);
						if (rv > -1)
						{
							cursor_position = rv;
							ResetRunningChecks(false);
							BlankSuggestion();
	
							ClearPromptWindow();
							PrintPromptInWindow();
						}

					! down arrow - currently, these clear the text line (as backspace can be slow)
					251, keycode_Down, keycode_PageDown:

						cursor_position = RecallLaterCommandLine(a_buffer);
						ResetRunningChecks(false);
						BlankSuggestion();
	
						ClearPromptWindow();
						PrintPromptInWindow();

					! a backspace
					127, 8, 254, 249, keycode_Delete: 
						if (cursor_position > 0) 
						{
							RemoveCharacterAt(a_buffer, cursor_position);
							cursor_position--;
							ResetRunningChecks(true);
							BlankSuggestion();
						}

					! a character
					default:
						! write in the letter
						InsertCharacterAt(key, a_buffer, cursor_position);
!						a_buffer->(WORDSIZE + type_position) = key;
						cursor_position++;
						
				}

				if (~~character_press_engaged)
				{
					glk_request_char_event((+key-window+).ref_number);
				}
				character_press_engaged = false;
				break;
				
			}

		}

	! We've broken from the loop, which means the text line has changed

		!a_buffer-->0 = input_string_length;

		if (~~terminated)
		{
			! Cheap analysis pass
			BasicAnalysis(a_buffer, cursor_position);

			! Print what we've got
			PrintInputLine(a_buffer, cursor_position);

			if (a_buffer-->0 > 0 && a_buffer--> cursor_position ~= ' ')
			{
				current_analysis_stage = PENDING;

				SuggestionAnalysis(a_buffer);

				! Set up for analysis
				glk_request_timer_events(TIME_SKIP);

			}
		}
		
	}	! end of main line loop

	! cancel timer and character events
	glk_cancel_char_event((+key-window+).ref_number);
	glk_request_timer_events(0);

	current_analysis_stage = PERFORMED;

StoreCommandLine(a_buffer);

	! tidy up the input line and return
 	VM_Tokenise(a_buffer, a_table);
 
  	! Close any quote window we've got going.
    	if (gg_quotewin) 
	{
		glk_window_close(gg_quotewin, 0);
        	gg_quotewin = 0;
    	}
    	
	glk_set_window( (+ main-window +).ref_number);

];

[ InsertCharacterAt char1 in_buffer pos 
	i
	;
	(in_buffer-->0)++;
	for ( i = in_buffer-->0  : i > pos : i-- )
		in_buffer->(i + WORDSIZE) =in_buffer->(i - 1 + WORDSIZE);	
	in_buffer->(pos + WORDSIZE) = char1;
];

[ RemoveCharacterAt in_buffer pos
	i;
	if (pos == 0) rfalse;
	for ( i = pos : i <= in_buffer-->0 : i++)
		in_buffer->(i - 1 + WORDSIZE) = in_buffer->(i + WORDSIZE);
	(in_buffer-->0)--;
];

[ CompleteSuggestionAnalysis a_buffer;
	while (current_analysis_stage == PROCESSING) SuggestionAnalysis(a_buffer, true);
	glk_request_timer_events(0);
];



-) after "Keyboard Input" in "Glulx.i6t".



Chapter 3 - Command Line Recall

Section - Store the Command Line after the player hits Return

Include (-

Constant COMMAND_RECALL_DEPTH = 10;
Constant COMMAND_LINE_AVERAGE_LENGTH = 16;
Constant COMMAND_STORAGE = COMMAND_LINE_AVERAGE_LENGTH * COMMAND_RECALL_DEPTH;

Array command_lines -> COMMAND_STORAGE + 10;
Array command_line_pointers --> COMMAND_RECALL_DEPTH + 2;
Global current_command_line  = 0;
! 0 = player's typing. 1+ =  going backwards in time

[ StoreCommandLine input_buffer
	start_point
	i os ol
	;
	! store characters in command_lines array.
	! store start point and length in command_line pointers (via snippety method 1,000 * length + start point)
	
	if (input_buffer-->0 == 0) rfalse;

!	PrintCommandLineStorage("Before writing in new line.");

	! start point = character after end of last line 
	start_point = GetCommandLineStart(1) + GetCommandLineLength(1);

	if (start_point + input_buffer-->0 > COMMAND_STORAGE)
		! We're out of storage so we start again from the beginning
		start_point = 0;
		
	! find any commands in the stack which live in the part of the storage buffer we're using, and erase their pointers

	! overlap between new and old command <=> either starts in the middle of the other
	for (i = COMMAND_RECALL_DEPTH : i >= 1 : i-- )
	{
		os = GetCommandLineStart(i) ; ol = GetCommandLineLength(i);
		if (ol ~= 0 && (WordInsideWord(os, start_point, input_buffer-->0) || WordInsideWord(start_point, os, ol)))
			command_line_pointers-->i = 0;
	}

	WriteBufferToCommandLine(input_buffer, start_point);

	! shift all the pointers one along - note this means we don't need to edit the command line buffer. So nyah.
	for (i = COMMAND_RECALL_DEPTH: i > 1 : i-- )
	{
		command_line_pointers --> i = command_line_pointers --> (i - 1);
	} 

	command_line_pointers --> 1 = ConstructCommandLinePoint(start_point, input_buffer-->0);

!	PrintCommandLineStorage("After writing in new line.");


	
];

[ WordInsideWord teststart interval_start interval_length;
	return (teststart >= interval_start && teststart < interval_start + interval_length);
];

-) after "Parser.i6t".

Section - Debugging Routines (not for release)

Include (-

[ PrintCommandLineStorage title_text
	i j
	;

	glk_set_window((+main-window+).ref_number);
	print (string) title_text, "^";

	for (i = 1: i <= COMMAND_RECALL_DEPTH : i ++)
	{
		print "Command number ", i, ": starts at ", GetCommandLineStart(i), " / length ", GetCommandLineLength(i), " ... ";
		print ">  ";
		for (j = 0 : j < GetCommandLineLength(i) : j++)
			print (char) command_lines-> (GetCommandLineStart(i) + j);
		print "^";
	}

];

-) after "Parser.i6t".

Section - Recall of previous command lines

Include (-


[ RecallPreviousCommandLine input_buffer
	j
	;
! writes the current command line into the input buffer array
! moves the current command line back in history

	if (command_line_pointers-->(current_command_line + 1) == 0 || current_command_line > COMMAND_RECALL_DEPTH)  return -1;	! no such command line
	current_command_line++;
	ExtractCommandLine(	current_command_line, input_buffer);
	return input_buffer-->0;

];

[ RecallLaterCommandLine input_buffer
	;
	if (current_command_line == 0) rfalse;	! do nothing
	current_command_line--;
	if (current_command_line == 0)
	{
		! wipe the input_buffer
		input_buffer-->0 = 0;
	} else
	{
		ExtractCommandLine(current_command_line, input_buffer);
	}
	return input_buffer-->0;
];

[ ExtractCommandLine n input_buffer;

	WriteCharactersToBuffer(command_lines, GetCommandLineStart(n), GetCommandLineLength(n), input_buffer);

];

-) after "Parser.i6t".

Section - Reading and Writing Command Lines

Include (-

[ WriteBufferToCommandLine input_buffer storage_start_point
	i
	;
	for (i = 0 : i < input_buffer-->0 : i++)
		command_lines->(i + storage_start_point) = input_buffer->(i + WORDSIZE);
	
];

[ WriteCharactersToBuffer
	from_ar from_start from_length to_ar
	i
	;
!	glk_set_window((+main-window+).ref_number);

!	print "Writing out characters: from ", from_start, " , length = ", from_length, ".^";

	for (i = 0: i < from_length: i++)
	{
		to_ar->(WORDSIZE + i) = from_ar->(from_start + i);
!		print (char) to_ar->(WORDSIZE+i);
	}
!	print "^";
	to_ar--> 0 = from_length;
];



-).

Section - The Command Line pointer structure

Include (-


[ ConstructCommandLinePoint start_point length;
	return (length * 1000) + start_point;
];

[ GetCommandLineStart n;
	return (command_line_pointers-->n) % 1000;

];

[ GetCommandLineLength n;
	return (command_line_pointers-->n) / 1000;
];


-).

Section - Setting up Command Line System

When play begins:
	initialise command line system;

To initialise command line system:
(- InitialiseCommandLineSystem();
-).

Include (-

[ InitialiseCommandLineSystem
	i
	;
	for (i = 0 : i <= COMMAND_RECALL_DEPTH : i++) command_line_pointers-->i = 0;
];


[ InitialiseCommandRecall ;
	current_command_line = 0;
];

-).


Chapter 4 - Initiating Command Line Recall for Disambiguation

Section 1 - Record the Edit Point

Include (-

Global edit_character = -1;

[ CreateEditPoint chn;
!	glk_set_window((+main-window+).ref_number);
!!	print "Storing edit point = ", chn, "^";
	edit_character = chn;
];

[ WipeEditPoint;
	edit_character = -1;
];

[ ApplyEditPoint input_buffer chn;
	chn = edit_character;
	WipeEditPoint();
	if (chn > -1)
	{
!		glk_set_window((+main-window+).ref_number);
!		print "Applying edit point = ", chn, "^";
		RecallPreviousCommandLine(input_buffer);

		InsertCharacterAt(' ', buffer, chn-1);

		BasicAnalysis(input_buffer, chn);

		PrintInputLine(input_buffer, chn);

		return chn;
	}

	return 0;
];

-) before "Parser.i6t".

Book 2 - I6 Functions 

Chapter 1 - Utilities

Section 1 - Turn a byte array into a buffer with length component

Include (-

[ CopyBufferWritingLength from_ar to_ar length max_length
	i
	;	
	
	for (i = 0: i < length && i < max_length: i++)
	{
		to_ar -> (i + WORDSIZE) = from_ar -> i;
	}
	to_ar --> 0 = i;
	
];

-).

Chapter 2 - Dictionary

Section 3 - Dictionary Access

When play begins:
		set up dictionary access.

To set up dictionary access:
	(- SetUpDictionaryAccess(); -).


Include (-

Global dictlen;
Global entrylen;
Global dictstart;

[ SetUpDictionaryAccess;
    dictlen = #dictionary_table-->0;    ! for use in later tokenisation
    entrylen = DICT_WORD_SIZE + 7;
    dictstart = #dictionary_table + WORDSIZE;
];


[ IndexFromWord wordnum; 				! word to dict position
	return (wordnum - dictstart) / entrylen;
];
[ WordFromIndex i;						! dict position to word
	return entrylen * i  + dictstart;
];

-) before "Parser.i6t".


Section 4 - Word Type

Include (-

[ WordType j;

	if ((j-> #dict_par1) & 1) return EX_VERB;
	if ((j-> #dict_par1) & 8) 
		{
!  			glk_set_window((+main-window+).ref_number);
!	 			print "Word ", (address) j, " is declared to be a prep.^";
  			return EX_PREPOSITION;
		}
	if ((j-> #dict_par1) & 128) return EX_NOUN; 	!??
];



-)

Section 5 - Compare two dictionary/string words, compare typed word and string/dictionary word (considering all characters)

Include (-

Array wc1 -> DICT_WORD_SIZE + WORDSIZE + 2;
Array wc2 -> DICT_WORD_SIZE + WORDSIZE + 2;


[ WordCompare w1 w2 max_compare_length u;

	if (max_compare_length == 0) max_compare_length = DICT_WORD_SIZE;

! for text and dicts

	VM_PrintToBuffer(wc1, max_compare_length, w1); ! print word
	VM_PrintToBuffer(wc2, max_compare_length, w2); ! print word
	

	!print (string) w1, "/", (address) w2, "/", wc1-->0, "/", wc2-->0, "/^";
	
	if (wc1-->0 ~= wc2-->0) rfalse;
	
	for (u = WORDSIZE : u < (wc1-->0) + WORDSIZE: u++) 
	{
	!	print (char) wc1->u, ":", (char) wc2->u, "... ";	
		if (glk_char_to_lower(wc1->u)  ~= glk_char_to_lower(wc2->u)) rfalse;
	}


	rtrue;
];

-).

Include (-

[ CompareTextAndPlayersInput text_word wordnum print_buffer 
	i players_word_length players_word
	;

	players_word_length = WordLength(wordnum);	
	players_word = WordAddressInBuffer(wordnum, print_buffer);
	VM_PrintToBuffer(test_bed, players_word_length + 1, text_word);

	!glk_set_window((+main-window+).ref_number);
	!print "Typed length = ", players_word_length, "^";
	
	if (test_bed-->0 ~= players_word_length) 
	{
		!print "NOT LONG ENOUGH.^";
		rfalse;
	}
		
	for (i = 0 : i < players_word_length : i++)
	{
		!print (char) players_word->i, " / ", (char) test_bed->(i + WORDSIZE);
		if (players_word->i ~= test_bed->(i + WORDSIZE)) 
			rfalse;
	}
	
	rtrue;
	
];

-).

Section 6 - Word in Scope used to create quick lookup lists

Include (- 

!Constant MAX_WORD_IN_SCOPE = 256;
!Constant MAX_VERB_NAMES = 300;
!Constant MAX_COMPASS_NAMES = 35;

Array word_in_scope_list --> MAX_WORD_IN_SCOPE + 2;
Array word_for_verb_list  --> MAX_VERB_NAMES + 2;
Array word_in_compass_list --> MAX_COMPASS_NAMES + 2;

[ WorkThroughScope
	parent_of_scope
	scope_list_name
	scope_list_size
	word_type_include
	property_include
	
	error_text_type
	error_text_use_option

	j 
	;
	scope_list_name --> 0 = 0;
	
	for (j = dictstart : j < dictstart + dictlen * entrylen  :  j = j + entrylen)
	{
		if (WordInScope(j, parent_of_scope) || (word_type_include ~= EX_NONE && WordType(j) == word_type_include) || 
			( property_include > 0 && WordInScope(j, location, property_include) ) )
		{
			(scope_list_name-->0)++;
			if (scope_list_name-->0 < scope_list_size)
				scope_list_name-->(scope_list_name-->0) = j;
		}
	}

	if (scope_list_name-->0 >= scope_list_size ) 
	{

		glk_set_window((+main-window+).ref_number);
		print "*** Interactive Parsing Error: Out of scoped words for ", (string) error_text_type, ". Please increase the limit (which is currently ", scope_list_size, ") using the command:^^Use ", (string) error_text_use_option, " of at least ", scope_list_name-->0 + 2, ".^^";

		scope_list_name-->0 = 0;
	}

!		#ifdef DEBUG;
!			glk_set_window((+main-window+).ref_number);	
!			print "Scope list size:", scope_list_name-->0 ," for ", (the) parent_of_scope, "^";
!		#endif;

];


[ WordInScope w r p;
    ! approximate scope rules to help choose the preferable object
    ! doesn't prevent player from checking if a word is recognised
    ! if p is specified, we require this too

    while (r) {
        if (WordInProperty(w, r, name))
		{
			if (p == 0 || (p > 0 && r has p)) rtrue;
		}

        #Ifdef pname;
        if (r provides pname && WordInProperty(w, r, pname))
		{
			if (p == 0 || (p > 0 && r has p)) rtrue;
		}
        #Endif;

        #Ifdef scenic;
        if (r provides scenic && WordInProperty(w, r, scenic))
		{
			if (p == 0 || (p > 0 && r has p)) rtrue;
		}
        #Endif;
        
        ! find the next object
        if (child(r) && (r hasnt container || r has transparent or open or supporter
        or visited))
            r = child(r);               ! ?? if (r==Darkness) r=player;
        else {
            while (r && sibling(r) == 0)
                r = parent(r);
            if (r)
                (r = sibling(r));
        }
    }
    ! could also check articles etc at this point when nouns are expected - only using for Compass, though, so not needed
   ! for (r=1: r<=LanguageDescriptors-->0: r=r+4) if (w == LanguageDescriptors-->r or LanguageDescriptors-->(r+3)) rtrue;

    rfalse;
];

[ CheckCompassWords check_word i;
	for (i = 1: i <= word_in_compass_list-->0 : i++) if (check_word == word_in_compass_list-->i)
	{
!			glk_set_window((+main-window+).ref_number);	
!			print "Compass word found: ", (address) check_word, "^";		
			rtrue;
	}

!	glk_set_window((+main-window+).ref_number);	
!	print "Compass word NOT FOUND: ", (address) check_word, "^";		

	rfalse;

];

-)




Chapter - Metrics Core Algorithm

Section - Find the Best Match

Include (-

[ BestMatch 
	input_buffer
	dict_word_index
	best_score best_word_index
	;
	best_word_index = -1;
	
	for (dict_word_index  = 0  : dict_word_index < dictlen : dict_word_index ++)
	{
		score = CompareWithIndexedDictionaryWord(input_buffer, dict_word_index);
		if (score > best_score)
		{
			best_score = score;
			best_word_index = dict_word_index;
		}
	}
	
	if (best_word_index > -1)
	{
		print "The best match is '", (address) WordFromIndex(best_word_index), "'.^";
	}
	else
	{
		print "No match found.";
	}
];

-).

Section - Compare Input Buffer against Dictionary Word and return a score

Include (-

Constant MATCH_RANGE = 1;

Constant BASIC_UNIT_SCORE = 10;
Constant FIRST_LETTER_BOOST = 2;
Constant PRIORITY_BOOST = 1;

Constant WORD_LENGTH_MAX_BOOST = 10;

Constant BASE_LINE_MATCH_SCORE = 30;
Constant PRIORITISE_THRESHOLD = 40;



[ CompareWithIndexedDictionaryWord
	input_buffer dict_word_index
	dict_mult 
	sc i j
	;
	
	dict_mult = dictionary_word_pointer --> dict_word_index;
	if (dictionary_word_multiples-->(dict_mult) == 1) return -2;

	! initialise the score
	sc = FIRST_LETTER_BOOST * BASIC_UNIT_SCORE * (dictionary_word_first_letter->dict_word_index == input_buffer->WORDSIZE);
	
	for (i = 0 : i < input_buffer-->0 : i++)
	{
		for (j = -MATCH_RANGE: j <= MATCH_RANGE : j++)
		{
			if (i + j >=0 && i + j < DictionaryIndexedWordLength(dict_word_index))
			{
				if (dictionary_word_multiples-->(dict_mult + i + j) % PrimeFromCharacter(input_buffer->(i + WORDSIZE)) == 0)
				{
					! this character features in this dictionary word multiple
					sc = sc + BASIC_UNIT_SCORE;
				}
			}
		}
	}
	
	
	! boost for words we want to prioritise
	if (sc > PRIORITISE_THRESHOLD)
	{	
		for (i = 0 : i < wds_boosted: i++) 
			if (WordCompare(boost_wds-->i, WordFromIndex(dict_word_index))) 
				sc = sc + PRIORITY_BOOST * BASIC_UNIT_SCORE ;
	
	}	

	! boost for length of word correct
		sc = sc + WORD_LENGTH_MAX_BOOST - Abs(input_buffer-->0 - DictionaryIndexedWordLength(dict_word_index));
	
		
	#ifdef DEBUG_ADVANCE_PARSING;
		if (sc > 4)
		{
			glk_set_window((+main-window+).ref_number);	
			print "Word ", (address) WordFromIndex(dict_word_index), " scored ", sc, ".^";
		}
	#endif;
	
	return sc;
];

[ CompareWithDictionaryWord
	input_buffer
	dict_word;
	
	return CompareWithIndexedDictionaryWord(input_buffer, IndexFromWord(dict_word));
  
  ];
  
  [ MaxPossibleScore length;
	! based on length of typed buffer
	! each typed character can score in 3 multiples
	! except the first and last character, which lose 1 group each 
! Note the "-2" is specific to a MATCH_RANGE of 1. So sue me.

	return  BASIC_UNIT_SCORE * (length * (2* MATCH_RANGE + 1) - 2 + FIRST_LETTER_BOOST + PRIORITY_BOOST) + WORD_LENGTH_MAX_BOOST;
	
  ];
        
    [ Abs x; if (x > 0) return x; return -x; ];
        
-).
    

Chapter 2 - Suggesting Words

Section 1 - Prioritised words

Include (-

Constant MAX_BOOST_WDS = 30;
Global wds_boosted = 0;
Array boost_wds --> MAX_BOOST_WDS;

-) before "Parser.i6t".

Table of Useful Words
word name 
"look"
"drop"
"close"
"attack"


When play begins:
	repeat through Table of Useful Words:
		prioritise word name  entry;

To prioritise (w - text):
	(- BoostWord({w}); -).

Include (-



[ BoostWord w;
	if (wds_boosted < MAX_BOOST_WDS)
	{
		boost_wds-->wds_boosted = w;
		wds_boosted++;
	}
	else
		print "[***ERROR: Tried to boost more than available number of words. Please up the limit.***]^";
];

-).


Chapter - Initialising the Dictionary Metrics

Section - Flow Control
	
The last when play begins rule:
	compute the dictionary;

To compute the dictionary:
(-
	CreateDictionaryMultiples();
-).
	
Section - Primes and Character correspondence	

Include (- 

!Constant TEST_CONVERTER;

Array prime_list --> 2 3 5 7 11 13 17 19 23 29 31 37 41 43 47 53 59 61 67 71 73 79 83 89 97 101 103; ! numbered 0 to 25

[ PrimeFromCharacter ch ;
	if (ch == '.' or ',') return 0;
	if (ch >=65 && ch <= 90) ch = ch + 32;
	ch = ch - 97;
	if (ch < 0 || ch > 25) 
		return 103;
	return prime_list-->ch;
];
-) before "Parser.i6t".

Section - Long words are stored as text	

Include (-

Constant MAX_LONG_WORDS = 100;
Global nine_plus_index_point = 0;
Global longworderror_found = 0;
Array nine_plus_words --> MAX_LONG_WORDS * 2;
! stored as word number // longer word as text string

[ StoreLongerVersionOf n
	txt
	;
	! n is the dictionary number/address of the word
	


	txt = LocateTextEquivalentOf(n);
	if (txt ~= -1)
	{
		nine_plus_words-->nine_plus_index_point = n;
		nine_plus_words-->(nine_plus_index_point+1) = txt;
		nine_plus_index_point = nine_plus_index_point + 2;
		
	}
	else
	{
		#ifdef DEBUG;
			#ifdef LONG_WORD_CHECK_REPORT;
				print "(Dictionary word ", (address) n, " is 9 letters long - does it need a text equivalent in the Longer Words table?)^";
			#endif;
		#endif;
	}
];


[ RetrieveLongerVersionOf n
	i
	;

	if (n >= dictstart)
	{

		if (DictionaryWordLength(n) < DICT_WORD_SIZE) 
			return n;
		
		for (i = 0 : i < nine_plus_index_point : i = i + 2)
		{
			if (nine_plus_words-->i == n)
				return nine_plus_words-->(i + 1);
		}
	
	}
	return n;
];


-) before "Parser.i6t".

Include (-

Constant long_words_table = (+Table of Longer Words+);

[ LocateTextEquivalentOf n
	max i 
	;
	max=TableRows(long_words_table);
	for ( i=1:i<=max:i++ ) {
		if (WordCompare(TableLookUpEntry(long_words_table, 1, i) , n)) 
			return TableLookUpEntry(long_words_table, 1, i);
	} 
	return -1;
];

-).

Table of Longer Words
word
"twenty-one"
"twenty-two"
"twenty-three"
"twenty-four"
"twenty-five"
"twenty-six"
"twenty-seven"
"twenty-eight"
"twenty-nine"
"transcript"
"superbrief"
"everything"
"inputchange"



	

Section - Build the Dictionary metrics

Include
(-

!Constant MAX_WORDS = 1000;
!Constant AV_WORD_LENGTH = 6;
Constant MAX_MULTIPLES = MAX_WORDS * AV_WORD_LENGTH;


! holds mapping from word -> position in multiples array
Array dictionary_word_pointer --> MAX_WORDS;
Array dictionary_word_first_letter -> MAX_WORDS;



! holds multiples, number of which is determined by length of word
Array dictionary_word_multiples --> MAX_MULTIPLES;

Array test_bed -> 50;


[ CreateDictionaryMultiples 
	i j word_count mult_pos avlen
	;

	#ifdef DEBUG;
!		print "Converting with space for ", MAX_WORDS, " words of average length ", AV_WORD_LENGTH, " and ", MAX_MULTIPLES, " multiples.^";
	#endif;
	
	if (dictlen > MAX_WORDS)
	{
		"***Interactive Parsing Error***: Dictionary storage is too small. Please increase dictionary storage to at least ", dictlen + 4, " using the command:^^Use maximum dictionary size of at least ", dictlen, ".^^";
	}

	mult_pos = 0;
	InitialiseMultiples();

	! loop through dictionary words by index
	for (word_count = 0 : word_count < dictlen : word_count++)
	{
		! store the start of this word's data
		dictionary_word_pointer --> word_count = mult_pos;
		
		! get the dictionary word we're looking at
		VM_PrintToBuffer(test_bed, DICT_WORD_SIZE, WordFromIndex(word_count));

		dictionary_word_first_letter -> word_count = test_bed->WORDSIZE;
		
		#ifdef DEBUG;
			! average word length stat
			avlen = avlen + ( (100 * test_bed-->0) - avlen)  / (word_count + 1);
		#endif;

		if (test_bed-->0 == DICT_WORD_SIZE) 
			StoreLongerVersionOf(WordFromIndex(word_count));
		
		! loop through the characters of the word. Each stores at WORDSIZE + i
		for (i = 0 : i < test_bed --> 0 : i++)
		{
			if (PrimeFromCharacter(test_bed->(i + WORDSIZE)) == 0)
			{
				! this word had a comma in it
!				print "Dodgy word found: ", (address) WordFromIndex(word_count), ".^";
				for (j = 0 : j < test_bed-->0  : j ++) dictionary_word_multiples-->(j  + mult_pos) = 1;
				test_bed-->0 = 1;
				break;
			}
		
			! loop through the neighbourhood of the character
			! to "add" this character into adjacents "sums"
			for (j = -MATCH_RANGE : j <= MATCH_RANGE : j++)
			{
				if (j + i >= 0  && j + i < test_bed-->0)
				{
					dictionary_word_multiples-->(mult_pos + j + i) = 	dictionary_word_multiples-->(mult_pos + j + i) * PrimeFromCharacter(test_bed->(WORDSIZE + i));
				}
			}
		}

		#ifdef TEST_CONVERTER;

			print "Converted ", (address) WordFromIndex(word_count), " into ";
			for (i = mult_pos : i < mult_pos + test_bed-->0 : i++)
				print dictionary_word_multiples-->i, " / ";
			print "^";
			!if (VM_KeyChar() == 'q') rfalse;
		
		#endif;
		
		! move the position in multiples along because we've created new entries
		mult_pos = mult_pos + (test_bed-->0);

		if (mult_pos + 20 > MAX_MULTIPLES)
		{
			"***Interactive Parsing Error***: Dictionary prime storage is too small. Please increase your word length allowance using the command:^^Use average word length of at least ", (mult_pos / word_count) + 2, ".^^";
		}

	}

	! store last pointer, so we can calculate word lengths for the final word
	dictionary_word_pointer --> dictlen = mult_pos;
	
	#ifdef DEBUG;
!		print "Finished with ", mult_pos, " metrics over ", dictlen, " words of average length ", avlen, "/100.^";
	#endif;
	
];

[ 	InitialiseMultiples j;
	for (j = 0 : j < MAX_MULTIPLES : j++) dictionary_word_multiples-->j = 1;
];


-) after "Parser.i6t".

Section - Accessing the Multiples

[ we get the word length of any dictionary word for free. ]

Include (-

[ DictionaryWordLength wordnum ;
	return (dictionary_word_pointer-->(IndexFromWord(wordnum) + 1)) - (dictionary_word_pointer-->IndexFromWord(wordnum));
];

[ DictionaryIndexedWordLength indexnum ;
	return (dictionary_word_pointer-->(indexnum + 1)) - (dictionary_word_pointer-->indexnum);
];

-).


Chapter 4 - Parser Data

Section 6 - Byte arrays of input

Include (-

[ WordUnderCursor cur_pos
	i;
!	glk_set_window((+main-window+).ref_number);
!	print "Word Under Cursor: ", cur_pos, ".^";
	for (i = 1: i < WordCount() : i++)
	{
!		print "(word ", i + 1, " starts at " , CharacterNumber(i+1), "...^";
		if (CharacterNumber(i + 1) - 1 > cur_pos)
		{
!			print "Word Under Cursor = ", i, "^";
			 return i;
		}
	}	
!	print "Word Under Cursor (F) = ", WordCount(), "^";
	return WordCount();
];



[ WordAddressInBuffer wordnum this_buffer; 
	return this_buffer + CharacterAddress(wordnum); 
];


[ CharacterAddress wordnum;
	! in the parsed buffer
	#ifdef TARGET_ZCODE;
		return parse->(wordnum * 4 + 1);
	#ifnot;
		return parse-->(wordnum*3);
	#endif;
];

[ CharacterNumber wordnum;
	! in actual text string of input
	return CharacterAddress(wordnum) - WORDSIZE + 1;
];

[ DictionaryValue wordnum;
	#ifdef TARGET_ZCODE;
		return parse-->(wordnum * 2 - 1);
	#ifnot;
		return parse-->(wordnum * 3 - 2);
	#endif;

];

-).



Book 2 - Input Window Functionality

Chapter 1 - Producing the Input Window

Section 1 - Main Printing Loop

Include (-

Constant NORMAL = style_Normal;
Constant ERROR = style_User2;
Constant LONGWORD_ERROR = stylehint_Proportional;
Constant VALID = style_User1;
Constant TIP = style_Input;
Constant MISPLACED = style_Note;
Constant RETURN_STYLE = style_Emphasized;
Constant CURSOR_STYLE = style_Alert;

Array word_colours -> 50;	! store the chosen colours

	[ PrintInputLine a_buffer  cur_pos;
		wn = 1;
		PrintPromptInWindow();
		PrintTypedCommand(a_buffer, a_buffer-->0, cur_pos);
		
		!PrintCursor(cur_pos);
		
		#ifdef DEBUG;
			!PrintStats(print_buffer, length);
		#endif;

		
	];


-)

Section 2 - Debugging (not for release)

[
 Some debug info. Mostly redundant now.
]

Include (- 

[ PrintStats print_buffer length i;

	if (length > 0)
	{

		glk_set_window ( (+main-window+).ref_number);

		print "^^Stats:^";
		print "WordCount() = ", WordCount(), "^";
		
		if (WordLength(WordCount()) > 1) 
		{
			i = WordAddressInBuffer(WordCount(), print_buffer);
			print "WordAddress() = ", (char) i->0, (char) i->1, "...^";
		}
		
		print "Current word length = ", WordLength(WordCount()), "^";
		print "Buffer length typed = ", length, "^";
		
		print "Place in buffer =  ", CharacterAddress(WordCount()), "/", CharacterNumber(WordCount()), "^";
	}

];

-).

Section 3 - Formatted Print Routines

[ A set of routines for printing in the appropriate styles and places. ]

Include (-

[ PrintCharacter char_val col_val;
	glk_set_style(col_val); print (char) char_val;
];

[ PrintCursor x;
	glk_set_window( (+ key-window +).ref_number);
	glk_window_move_cursor( (+ key-window +).ref_number, x + 1, 0);
	PrintCharacter('_', NORMAL);
	print "  ";
];

[ PrintPromptInWindow;
	glk_set_window( (+ key-window +).ref_number);
	glk_window_move_cursor( (+ key-window +).ref_number, 0, 0);
	PrintCharacter(62, CURSOR_STYLE);
	glk_window_move_cursor( (+ key-window +).ref_number, 0, 2);
	print " ";

];


[ PrintTypedCommand
	print_buffer length cursor_character
	i wordnum
	;

	!if (length > 0)
	!{
		glk_set_window( (+ key-window +).ref_number);
		glk_window_move_cursor( (+ key-window +).ref_number, 1, 0);
	
		for (wordnum = 0 , i = WORDSIZE : i < WORDSIZE + length : i++)
		{
			if (	
					i == WORDSIZE 
				||	(print_buffer->(i-1) == 32 or '.' or ',' or '"' && ~~(print_buffer->i == 32 or '.' or ',' or '"'))
				|| 	(print_buffer->i == ',' or '.')
			 )
				wordnum ++;
 
			if (i == cursor_character + WORDSIZE)
			{
				if (print_buffer->i == ' ') PrintCharacter('_', CURSOR_STYLE);
				else PrintCharacter(print_buffer -> i, CURSOR_STYLE);
			}
			else
				PrintCharacter(print_buffer -> i, word_colours -> wordnum);

		}

		print "   ";
		
		if (cursor_character >= length)
			PrintCursor(cursor_character);
	!}
];

[ PrintPressReturn val i;
	glk_set_window( (+ key-window +).ref_number);
!	glk_window_get_size((+ key-window +).ref_number, i, j);
	
	glk_window_move_cursor( (+ key-window +).ref_number, 55, 0);
	
	glk_set_style(RETURN_STYLE);
	if (val)
		print "Press Return";
	else
		print "                   ";

];
 

[ PrintSuggestion word_to_print
	x
	i
	;
	glk_set_window( (+ key-window +).ref_number);
	glk_window_move_cursor( (+ key-window +).ref_number, 0, 1);
	for (i = 0: i<x: i++) print " ";

	PrintCharacter('(', TIP);
	
	Glulx_PrintAnything( RetrieveLongerVersionOf(word_to_print) );
	
	PrintCharacter(')', TIP);

	for (i = 0 : i < 30: i++) print " ";
	
];

[ BlankSuggestion i;
	glk_set_window( (+ key-window +).ref_number);
	glk_window_move_cursor( (+ key-window +).ref_number, 0, 1);
	for (i = 0 : i < 40: i++) print " ";

];

[ ClearPromptWindow;
	glk_window_clear ( (+key-window+).ref_number);
];

[ CorrectlyPositionCursor;
	! this is unnecessary, but without it Quixe collapses because it tries to position the input cursor off-screen
	glk_set_window( (+ key-window +).ref_number);
	glk_window_move_cursor( (+ key-window +).ref_number, cursor_position + 1, 0);	
];

-).

Section 4 - Defining Colours and Fonts

[ Set up the Glulx styles for suggestions, valid input and errors. ]

Before constructing the key-window:
	establish colours for input text.
	
To establish colours for input text:
	(- KeyUp(); -).

Include (-

	[ KeyUp col col2 i writecol ;
	
   for (i = 0: i < style_NUMSTYLES : i++)
	glk_stylehint_set(wintype_textgrid, i, stylehint_ReverseColor, false);

		glk_stylehint_set(wintype_Textgrid, style_User1, stylehint_TextColor, ColVal( (+g-green+) ));
		glk_stylehint_set(wintype_Textgrid, style_User2, stylehint_TextColor, ColVal( (+g-red+) ));
		
		glk_stylehint_set(wintype_Textgrid, stylehint_Proportional, stylehint_TextColor, ColVal( (+g-red+) ));
		glk_stylehint_set(wintype_Textgrid, stylehint_Proportional, stylehint_Weight, 0);	
		
		glk_stylehint_set(wintype_Textgrid, style_Normal, stylehint_TextColor, ColVal( (+g-black+) ));
		glk_stylehint_set(wintype_Textgrid, style_Input, stylehint_TextColor, ColVal( (+g-black+) ));		
		glk_stylehint_set(wintype_Textgrid, style_Input, stylehint_Weight, 0);		
		glk_stylehint_set(wintype_Textgrid, style_Input, stylehint_TextColor, ColVal( (+g-blue+) ));	
		
#ifdef DEBUG;	
		glk_stylehint_set(wintype_Textgrid, style_Note, stylehint_TextColor, ColVal( (+ g-red +) ));
#ifnot;
		glk_stylehint_set(wintype_Textgrid, style_Note, stylehint_TextColor, ColVal( (+ g-indigo +) ));
#endif;

		glk_stylehint_set(wintype_Textgrid, style_Emphasized, stylehint_TextColor, ColVal((+ g-blue +)) );

		glk_stylehint_set(wintype_Textgrid, CURSOR_STYLE, stylehint_Weight, 2);	
		glk_stylehint_set(wintype_Textgrid, CURSOR_STYLE, stylehint_TextColor, ColVal((+g-blue +)) );	
		glk_stylehint_set(wintype_Textgrid, CURSOR_STYLE, stylehint_Oblique, 0 );	
		
	];

-).



Book 3 - Analyse the input line


Chapter 1 - Core of the Analysis system - Tokenise, suggest and colourise

Include (-

Global suggested_wordnum = 0;
Global previous_checks_wordnum = 0;
Global cursor_word = 0;
Constant MAX_PREVIOUS_CHECKS = 120;
Array previous_checks_failed --> MAX_PREVIOUS_CHECKS+1;
Array previous_checks_passed --> MAX_PREVIOUS_CHECKS+1;
Global previous_suggestion_best_score = 0;

[ ErasePreviousSuggestions i;
	previous_checks_wordnum = 0;
	current_analysis_stage = PENDING;
	prompted_word = 0;
	for (i = 0: i < 20: i++) word_colours->i = NORMAL;
];

[ ResetRunningChecks minor_only;
			! set up storage of advance parsing by the suggestion system
	if (~~minor_only)
	{
			previous_checks_passed--> 0 = 0;
			previous_checks_failed--> 0 = 0;
			previous_checks_wordnum = 0;
	}
	current_analysis_stage = PERFORMED;
	previous_suggestion_best_score = BASE_LINE_MATCH_SCORE;
	PrintPressReturn(false);
];


[ BasicAnalysis
 print_buffer cur_pos i;

	! clear last turn's suggestion
	prompted_word = 0;

   if (print_buffer-->0 > 0)
	{

		! don't tokenise if there's no input as results are unpredictable
		
		VM_Tokenise(print_buffer, parse); wn = 1;

		cursor_word = WordUnderCursor(cur_pos);

		
		if (WordCount() == 0) rfalse;

		for (i = 1: i <= WordCount() : i++)
		{
			word_colours -> i = GetBaseColourOfNextWord(i, print_buffer);
		}
		
		ColourByAdvanceParse();
		
		!glk_set_window((+main-window+).ref_number);
		!print "Word Count = ", WordCount(), "^";

		! this sets "previous checks wordnum" to the cursor word
		if (cursor_word ~= previous_checks_wordnum)
		{
			ResetRunningChecks(false);
			BlankSuggestion();
		}


		
		if (word_colours -> WordCount() == LONGWORD_ERROR) 
			PrintPressReturn(false);
		else
			PrintPressReturn(command_in_full && word_understood_to == WordCount());	
		
		
			! unless the buffer ends in a space, go easy on the last word
			ColourLastWord(print_buffer, cursor_word);	
	}

];

[ SuggestionAnalysis print_buffer run_to_halt;

!		glk_set_window((+main-window+).ref_number);
!		print "Word_colour of word 2 = ", word_colours->cursor_word, "...^";

		if (word_colours->cursor_word ~= VALID || SuggestFromAbbreviation(DictionaryValue(cursor_word), WordLength(cursor_word)))
		{

			if (CreateSuggestionForWord(print_buffer, WordAddressInBuffer(cursor_word, print_buffer), WordLength(cursor_word) , cursor_word, run_to_halt))
			{				
				suggested_wordnum = cursor_word;
				PrintSuggestion(prompted_word, CharacterNumber(cursor_word));
			}	
			else BlankSuggestion();
		}
		else BlankSuggestion();
];

[ SuggestFromAbbreviation wd len;
	return (len == 1 && wd ~= ',//') ;
];

-)

Chapter 2 - Simple Dictionary Check

Include (-

[ GetBaseColourOfNextWord wordnum print_buffer
	i j 
	;

	wn = wordnum;
	i = NextWordStopped();
	if (i == 0) return ERROR;
	
	j = RetrieveLongerVersionOf(i);
	if (j == i) return VALID;

!	glk_set_window((+main-window+).ref_number);
!	print "Checking full-length word for ", (address) i, " which is ", (string) j, " ... ";

	if (CompareTextAndPlayersInput(j, wordnum, print_buffer)) 
	{
!		print " okay!^";
		return VALID;
	}
	
!	print " no good...^";
	return LONGWORD_ERROR;
	
];

[ ColourLastWord print_buffer word_num;

	if (word_colours->word_num ~= VALID && ~~LastWordFinished(print_buffer, word_num))
		word_colours->word_num = NORMAL;

];

[ LastWordFinished print_buffer wordnum i;
	if (wordnum == WordCount())
		i = (print_buffer-->0);
	else
		i = CharacterNumber(wordnum + 1);
	return (print_buffer->(i + WORDSIZE - 1) == ' ' or '.' or ',' or '"');

];

-);

Book 4 - Suggestions for an unfinished word

Chapter 1 - Main Suggestion System

Section 1 - Hub

[ We use different algorithms for verbs and for nouns/preps. Verbs don't require use to run the parser at all! ]

Include (-

Array analysed_word_buffer -> DICT_WORD_SIZE + 1;

[ CreateSuggestionForWord
	! input_buffer	: whole text input
	! word_buffer	: 0 indexed array holding characters typed so far
	! length		: number of characters (so use < length in loops)
	! wordnum	: the number of the word in the current line; we can use parse if it's helpful		

	input_buffer word_buffer length wordnum run_to_halt

	! current word's valid, but in the wrong context
	alternate_suggestion_flag
	;

!	glk_set_window((+main-window+).ref_number);
!	print "Suggesting for word num = ", wordnum, "^";

	! We allow the previous best score to be just as good again, otherwise the player can
	! lose a good suggestion by typing an unhelpful letter

	! but don't do this if we're mid-search
	if (current_analysis_stage == PENDING)
	{
		if (previous_suggestion_best_score > BASE_LINE_MATCH_SCORE)
			previous_suggestion_best_score--;
	}
	
	if (previous_checks_wordnum == 0)
		previous_checks_wordnum = wordnum;

	! Flag that we consider matching *the same* number of words to be okay under the circumstances
	! allows "Thesaurus" to win over "the"...
	alternate_suggestion_flag = (WordCount() == word_understood_to);
	
	CopyBufferWritingLength(word_buffer, analysed_word_buffer, length, DICT_WORD_SIZE);

	! we always suggest verbs at word 1, even though you could talk to people. Them's the breaks.

!	print "Verb wordnum = ", verb_wordnum, ".^";

	if ( next_token_type == EX_VERB || wordnum == verb_wordnum)
	{
!			print "Suggesting verb-type.^";
			SuggestVerb(analysed_word_buffer, run_to_halt);	
	} else
	{
			if (wordnum > word_understood_to + 1)	! eg. word 3 when word 2 failed and we knew word 1
			{
				!glk_set_window((+main-window+).ref_number);
				!print "Word ", word_understood_to + 1, " failed already so word ", wordnum, " isn't worth suggesting for.";
				rfalse;
			}	
			SuggestNonVerb(analysed_word_buffer, CharacterNumber(wordnum), input_buffer, alternate_suggestion_flag, run_to_halt);
	}

	! repair the parse table after tests
	VM_Tokenise(input_buffer, parse); 

	return (prompted_word > 0);

];

-).

Section 2 - Writing In Suggestions

[ 
 We come here from the main input loop if the player presses space. If no suggestion is up, this should simply return 1 to move the input along the line
] 

Include (-

[ WriteInSuggestion
	input_buffer cur_pos force_complete
	i j
	;

	! repair buffer, in case timed input has caused problems
	VM_Tokenise(input_buffer, parse);

	if (suggested_wordnum ~= cursor_word) 
	! we've changed to a different word
		return -1;

	! TODO: Cope with writing in a suggestion somewhere other than the last word of the line

	!glk_set_window((+main-window+).ref_number);

	if (prompted_word == 0 ) 
	{
!		print "No suggestions.^";
		return -1;
	}

	if (DictionaryValue(suggested_wordnum) ~= 0 && ~~force_complete) 
	{
		!print "DV of sw = ", DictionaryValue(suggested_wordnum), "..^";
		if ( WordLength(suggested_wordnum) > 1 )
		{
			return -1;
		}
	}

	VM_PrintToBuffer(test_bed , DICT_WORD_SIZE * 2, RetrieveLongerVersionOf(prompted_word));

!glk_set_window((+main-window+).ref_number);
!print "wordnum:", suggested_wordnum, "/", CharacterNumber(suggested_wordnum), " of " , WordCount(), "... ";



!TODO: we want to write in the word over the suggested_wordnum, and then add the rest of the line on the end
	if (suggested_wordnum < WordCount())
	{
		! copy the old next word, starting at the space in front of it, to the end of the new word
		for (i = CharacterNumber(suggested_wordnum + 1) - 2 , j = (test_bed-->0) + WORDSIZE: i < input_buffer-->0 : i++, j++)
		{
			! i is the position in the original buffer
			test_bed->j = input_buffer->(i + WORDSIZE);
			(test_bed-->0)++;
		}
	}

	! now, starting from the first letter of the word to replace, write in the test_bed array
	for (i = WORDSIZE, j = CharacterNumber(suggested_wordnum) - 1: 
			i < test_bed-->0 + WORDSIZE : j++, i++)
	{
		
		input_buffer->(j + WORDSIZE) = test_bed->i;
!		print (char) input_buffer->(j+WORDSIZE);

	}
	
	word_colours->suggested_wordnum = VALID;

	if (input_buffer->(j - 1 + WORDSIZE) ~= ' ')
	{
		input_buffer->(j + WORDSIZE) = ' ';
		j++;
	}
	
	BlankSuggestion();

	input_buffer-->0 = j;

!	print "^Constructed new string has length = ", j, "^";


	return j;


];

-)


Section 2 - Single letters link to particular verbs directly

[ 
	To make typing a single letter fast, we hard-code what letter suggests what verb. This could be altered by the authored if you liked. Note the value column is ignored by the game, it's just there for human reference.
]

Table of Single-Letter Verb Associations
ascii value 	letter		text
97			"a"			"ask"
98			"b"			"buy"
99			"c"			"cut"
100			"d"			"down"
101			"e"			"east"
102			"f"			"feel"
103			"g"			"get"
104			"h"			"hello"
105			"i"			"inventory"
106			"j"			"jump"
107			"k"			"kick"
108			"l"			"look"
109			"m"			"move"
110			"n"			"north"
111			"o"			"open"
112			"p"			"put"
113			"q"			"quit"
114			"r"			"read"
115			"s"			"south"
116			"t"			"take"
117			"u"			"up"
118			"v"			"version"
119			"w"			"west"
120			"x"			"examine"
121			"y"			"yes"
122			"z"			"wait"

The initial verb letter is a number that varies.
The verb suggestion is a text that varies.

This is the suggest verb from single letter rule:
	if initial verb letter is an  ascii value listed in the Table of Single-Letter Verb Associations:
		now the verb suggestion is  the text corresponding to an ascii value of the initial verb letter in the Table of Single-Letter Verb Associations;

To decide which number is (a - a text) as a number:
	(- ({a}) -).

Section 2 - Score verbs and suggest the best match


Include (-

Array recorded_search_values --> 4;

[ SuggestVerb word_array run_to_halt
	i best_yet this_score ar j
	first_pass skipping_out
	k
	top_score start_word_list
	;
	!	 word_arrays runs WORDSIZE -> WORDSIZE + word_array-->0 - 1

	best_yet = 0; 
	
	switch(word_array-->0)
	{
		1:
			! 65-90 = A to Z
			! 97 - 122  =  a to z
			i = word_array->WORDSIZE;
			if (i >=65 && i <= 90) i = i + 32;
			(+ initial verb letter +) = i;
			(+ suggest verb from single letter rule +)();
			best_yet = (+ verb suggestion +);
			previous_suggestion_best_score = BASE_LINE_MATCH_SCORE + 1;
			current_analysis_stage = PERFORMED;

!glk_set_window((+main-window+).ref_number);
!print "Suggesting a verb...", (string) (+ verb suggestion +);

		!2:
			
		default:
			
			
			skipping_out = false;

			if (current_analysis_stage == PENDING)
			{
				best_yet = 0; 
				top_score = previous_suggestion_best_score;
				start_word_list = 1;
				current_analysis_stage = PROCESSING;

			!	print "Setting up a new run-through...^^";
			
			}
			else
			{
				! we're picking up a search in progress
				
				top_score = recorded_search_values-->0; !PRERECORDED TOP SCORE;
				best_yet = recorded_search_values -->1; ! PRERECORDED BEST YET;
				start_word_list = recorded_search_values -->3; !PRERECORDED DICTIONARY POSITION;

		!		print "Picking up the previous run-through with top_score = ", top_score, " best_yet = ", (address) best_yet, " start_pass_number = ", start_pass_number, " and start_dict_position = ", start_dict_position, " word_understood_to = ", word_understood_to , "...^^";
			
			}			

			for (j = start_word_list : j <=  word_for_verb_list-->0 && ~~skipping_out  :  j ++)
			{
			     
				if (~~run_to_halt) k++;
					
				this_score = CompareWithDictionaryWord(word_array, word_for_verb_list-->j);

				if (this_score > top_score)
				{
					top_score = this_score;
					best_yet = word_for_verb_list-->j;
				}
				else if (this_score == top_score && top_score > 0)
				{
					! we've found a tie. TODO: Do something with this information?
					if (word_array-->0 == 1)
						best_yet =-1;
						! if one letter only, we use this info to wipe the suggestion
				}
				
				
				if (k > MAX_TESTS)
				{
					skipping_out = CheckForExitCondition(k); k = 0;
				}

			}

			! record data

			! *** if we're exiting mid-search, we return here, and miss out the next few steps
			if (skipping_out) 
			{
				recorded_search_values --> 3 = j; !RECORD J (DICT POSITION)
				recorded_search_values --> 1 = best_yet; !RECORD BEST YET
				recorded_search_values --> 0 = top_score; !RECORD TOP SCORE	
			
		!		print "Skipping out with top_score = ", top_score, " best_yet = ", (address) best_yet, " start_pass_number = ", pass_number, " and start_dict_position = ", j, " word_understood_to = ", word_understood_to , "...^^";
				
				rfalse;
			}

	}

	if (best_yet > 0)
	{
		prompted_word = best_yet;
		previous_suggestion_best_score = top_score;
	}
	
	if (current_analysis_stage == PROCESSING)
	{
		current_analysis_stage = PERFORMED;	
	}	

];


-).

Chapter 3 - Suggesting Non Verbs

Include (- 



[ SuggestNonVerb word_array       word_start_point    input_buffer 

						alternate_suggestion_flag run_to_halt
						
		! run_to_halt indicates that we cannot leave this loop; we're here till we get an  answer

	i best_yet this_score ar j k
	start_pass_number
	start_dict_position
	skipping_out
	pass_number top_score 
	loop_start loop_end loop_incr loop_word
	max_word_score
	;
! word_arrays runs 0-> word_length

! in this version, when we hit a tie we do nothing and stick with the result we have
! then (or rather, before) we use WordInScope to push sensible word choices 
! through the system first, in the hope of preventing parser checks on stupider words.

	
!	glk_set_window((+main-window+).ref_number);	
!	print "(Analyse)^";

	max_word_score =  MaxPossibleScore(word_array-->0);

	skipping_out = false;

	if (current_analysis_stage == PENDING)
	{
		best_yet = 0; 
		top_score = previous_suggestion_best_score;
		
		start_pass_number = 0;
		start_dict_position = dictstart;

		current_analysis_stage = PROCESSING;

!		print "Setting up a new run-through...^^";
	
	}
	else
	{
		! we're picking up a search in progress
		
		top_score = recorded_search_values-->0; !PRERECORDED TOP SCORE;
		best_yet = recorded_search_values -->1; ! PRERECORDED BEST YET;
		
		start_pass_number = recorded_search_values --> 2; !PRERECORDED PASS NUMBER;
		start_dict_position = recorded_search_values -->3; !PRERECORDED DICTIONARY POSITION;

!		print "Picking up the previous run-through with top_score = ", top_score, " best_yet = ", (address) best_yet, " start_pass_number = ", start_pass_number, " and start_dict_position = ", start_dict_position, " word_understood_to = ", word_understood_to , "...^^";
	
	}
	

!glk_set_window((+main-window+).ref_number);	
!for (i = 0: i< word_length: i++) print (char) word_array->i;
!print "Current score to beat: ", top_score, "^";

	
for (pass_number = start_pass_number: pass_number < 2 && skipping_out == false: pass_number++)
{

	if (pass_number == 0)
	{
		loop_start = 1;
		loop_end = word_in_scope_list-->0 + 1;
		loop_incr  = 1;
	} else {

!			glk_set_window((+main-window+).ref_number);	
!			print "Current: ", (address) best_yet, " with score ", top_score, " against max ", 1 + word_length * MAX_LET_DIST  + FIRST_LETTER_BOOST, ".^";
		
		if (top_score == max_word_score)
		{
			!glk_set_window((+main-window+).ref_number);	
			!print "Found a maximum score in the word in scope part.^";
			break;
		}		

		loop_start = start_dict_position;
		loop_end = dictstart + dictlen * entrylen;
		loop_incr  = entrylen;
	}

!	for (j = start_dict_position : j < dictstart + dictlen * entrylen && skipping_out == false :  j = j + entrylen)
	for (j = loop_start : j < loop_end && skipping_out == false :  j = j + loop_incr)
	{
		

		if (PreviousParseResult(j) ~= -1)
		{

	!		print "^Pass No. = ", pass_number, " ", (address) j, " tested ";
			if (~~run_to_halt) k++;

			if (pass_number == 0)
			{
				loop_word = word_in_scope_list-->j;
				this_score = 1 + CompareWithDictionaryWord(word_array, loop_word);
				
				!CheckWordDist(word_array, word_length, loop_word, 	top_score ) + 1; ! plus one, as we know it's in the list
			} else {
				loop_word = j;
				this_score = CompareWithDictionaryWord(word_array, loop_word);

	!			slight boost for actual nouns
				this_score = this_score + (WordType(j) == EX_NOUN && ~~CheckCompassWords(loop_word));
			}

	!		print " and gets a score ", this_score;

			if (this_score > top_score) 
			{
	
				!print "Score for ", (address) j, " = ", this_score, " vs ", top_score, ".^";
			}
	
			if (					!!this_score > 2 * word_length + 1 + 2 * (1 - pass_number) &&
					this_score > top_score 
						 && WordImprovesParsing(input_buffer, loop_word, word_start_point, word_array-->0,  alternate_suggestion_flag))
			{
	!			glk_set_window((+main-window+).ref_number);			
	!			print "Scoring up for ", (address) j, ".^";
	
				top_score  = this_score;
				best_yet = loop_word;
			}

		
			if (k > MAX_TESTS)
			{
				skipping_out = CheckForExitCondition(k); k = 0;
			}


		}
	}
}



	! *** if we're exiting mid-search, we return here, and miss out the next few steps
	if (skipping_out) 
	{
		recorded_search_values --> 2 = pass_number - 1; !RECORD PASS NUMBER
													! -1, because when we drop out of the inner loop, we get a +1 on the outer loop!!
		recorded_search_values --> 3 = j; !RECORD J (DICT POSITION)
		recorded_search_values --> 1 = best_yet; !RECORD BEST YET
		recorded_search_values --> 0 = top_score; !RECORD TOP SCORE	
	
!		print "Skipping out with top_score = ", top_score, " best_yet = ", (address) best_yet, " start_pass_number = ", pass_number, " and start_dict_position = ", j, " word_understood_to = ", word_understood_to , "...^^";
		
		rfalse;
	}

!	print "Completed!^^";
	
	if (best_yet > 0)
	{
		prompted_word = best_yet;
		previous_suggestion_best_score = top_score;
	}
	
	if (current_analysis_stage == PROCESSING)
	{
		current_analysis_stage = PERFORMED;	
	}	


];

-)

Section - Early exit conditions for loops

Include (-

[ CheckForExitCondition k;

	
!	glk_set_window((+main-window+).ref_number);			
!	print "(Keycheck).^";

	k = CheckForCharacter(); ! second true indicates "short timer" mode
	if (k ~= 0)
	{

!		glk_set_window((+main-window+).ref_number);			
!		print "Keypress interrupted handling : ", (char) k, ".^";
			
!	 	store up the k and pass it back to the next grab character call... 
		interrupt_keypress = k; 

		rtrue;
	}

	rfalse;
];

[ CheckForCharacter
	done key
	;

	glk_request_timer_events(1);

	done = false;
	while(~~done)
	{
		CorrectlyPositionCursor();
		glk_select(gg_event);
		switch(gg_event-->0)
		{
			evtype_Timer:
				key = 0;
				done = true;
				
			evtype_CharInput:
				key = gg_event-->2;
				done = true;
				
				glk_request_char_event((+key-window+).ref_number);
		
		}
	}

	glk_request_timer_events(0);
	return key;
];

-).


Chapter 4 - Run the Parser over what we've got So far

Section 1 - Colour based on parse results

Include (-

[ ColourByAdvanceParse
	i
	;

	command_in_full = false;
	

#ifdef DEBUG_ADVANCE_PARSING;
	glk_set_window((+main-window+).ref_number);
	print "++++++^";
#endif;

		word_understood_to = PerformAdvanceParse(true);

#ifdef DEBUG_ADVANCE_PARSING;
	glk_set_window((+main-window+).ref_number);	

!	print "Scored ", word_understood_to, ".^";
!	print "-------^";
#endif;

	if (word_understood_to < WordCount())
	{
		for (i = word_understood_to + 1 :  i<= WordCount() : i++)
		{
			if (word_colours->i == VALID) 
				! we knew the word, but it's not where the parser wants it to be
				word_colours->i = MISPLACED;
				
		}
	}
	for (i = 1 : i <= word_understood_to : i++)
	{
		if (word_colours->i == ERROR )
			! we didn't know the word, but the parser accepted it => it's a <any text> input, so we accept (!!)
			word_colours->i = VALID;
	}
	
];

-)

Section 2 - Does a word replacement help the parser?

[ 
	Here's the clever bit. Stitch a suggestion into the input, run the parser, and see if it matches more words than the line did without that word. If it does, this word is worth suggesting.

	We store results of this, because it's the slowest part of the whole deal.

	Would be good to optimise this section more; for example, the game will do the same Scope calculations over and over again.
]


Include (-

[ WordImprovesParsing  input_buffer   new_word  	word_start_point word_length
	alternate_suggestion_flag
	result
	;
	! a cheeky lookahead
	! if we replace the new_word for the wordnum, does the parser improve on the word_understood_to count?
	
!				glk_set_window((+main-window+).ref_number);			
!				print "Scoring up for ", (address) new_word, ".^";
!				print "Previous score for word_understood_to is ", word_understood_to, ".^";



	switch(PreviousParseResult(new_word))
	{
		1: 	rtrue;
		-1: 	rfalse;
		0:
			
			BuildSecondBuffer(input_buffer, word_start_point, word_length, new_word);
			
!			glk_set_window((+main-window+).ref_number);
!			print "Considering NEW ", (address) new_word, "...^";			
			result = AdvanceParseFromSecondBuffer();
			if (result > word_understood_to || (result == word_understood_to && alternate_suggestion_flag))
			{
				if (previous_checks_passed-->0 < MAX_PREVIOUS_CHECKS)
				{
					
					(previous_checks_passed-->0)++;
					previous_checks_passed-->(previous_checks_passed-->0) = new_word;		

				}
				rtrue;
				
			} else {
		
				if (previous_checks_failed-->0 < MAX_PREVIOUS_CHECKS)
				{
					(previous_checks_failed-->0)++;
					previous_checks_failed-->(previous_checks_failed-->0) = new_word;		
				}
				rfalse;
				
			}
			
	}

]; 

-).



Section 3 - Some functions for shifting buffers around

Include (-

[ AdvanceParseFromSecondBuffer result;
	! Store the buffer; copy buffer2 into place of buffer for use by the parser 
	VM_CopyBuffer(buffer3, buffer);
	VM_CopyBuffer(buffer, buffer2);
	
	! use buffer
	VM_Tokenise(buffer, parse);
	result = PerformAdvanceParse(false);
	
!	glk_set_window((+main-window+).ref_number);
!	print "Achieved a result of ", result, ".^";
	
	! repair the buffer before we destroy anything the player's typed
	VM_CopyBuffer(buffer, buffer3);
	
	return result;
];

[ BuildSecondBuffer input_buffer old_word_start old_word_length new_word  
	i j
	;
	
!	glk_set_window((+main-window+).ref_number);
!	print "Building advance parser buffer over start ", old_word_start, ", length ", old_word_length, ", and inserting new word ", (address) new_word , " to give : ";
	
	! TODO: cope with placing a suggestion anywhere except the last word

	! word transformed to byte array
	VM_PrintToBuffer(test_bed, DICT_WORD_SIZE, new_word);
	
	! build new buffer2
	for ( i = 0 : i <  input_buffer-->0 - old_word_length + test_bed-->0 : i++)
	{
		if ( i < old_word_start - 1)
		{
			! copy the first part of the buffer straight
			buffer2->(i + WORDSIZE) = input_buffer->(i + WORDSIZE);
		} 
	! eg. examine broze cross (sub in ABOUT)
	! ows = 9, tb0 = 5 (14)
	! when i = 13 start writing in (from the space)
	! start writing in from position 13 + WORDSIZE = 13 - 5 + 5 + WORDSIZE)
		else if (i >= old_word_start + test_bed-->0 - 1) {
			! copy the second part of the buffer straight
			buffer2->(i + WORDSIZE) = input_buffer->(i - test_bed-->0 + old_word_length + WORDSIZE);
		}
		else
		{
			buffer2->(i + WORDSIZE) = test_bed->(j + WORDSIZE);
			j++;
		}
!		print (char) buffer2->(i+WORDSIZE);
	}

	buffer2-->0 = input_buffer-->0 + test_bed-->0 - old_word_length;

	
!	print " (new length = ", buffer2-->0, ".^";


];

-).

Section 4 - System for using previous results

Include (-

[ PreviousParseResult new_word 
	i ;
	!  returns 1 => success, -1 => fail, and 0 => no known data
	


	!glk_set_window((+main-window+).ref_number);

	for (i = 1 : i <= previous_checks_passed-->0 || i <= previous_checks_failed-->0 : i++)
	{
		if (i <= previous_checks_passed-->0 && previous_checks_passed-->i == new_word)
		{
			!print "Found ", (address) new_word, " in previous PASS! Declaring it OK.^";
			return 1;
		} else
		if (i <= previous_checks_failed-->0 && previous_checks_failed-->i == new_word)
		{
			!print "Found ", (address) new_word, " in previous FAIL! Declaring it BUNK.^";
			return -1;
		}
	}
	
	return 0;
];

-).

Section 3 - The Advance Parsing Routine, for use by anyone - returns length of match made (and sets context vars)

Include (-

Constant RETURN_TO_INPUT_LINE = 3;
Constant PERFORMING = 2;
Constant ERROR_GIVEN = 1;
Constant INACTIVE = 0;

Constant EX_NONE = -1;
Constant EX_NOUN = 0;
Constant EX_VERB = 1;
Constant EX_PREPOSITION = 2;
Constant EX_ENDOFLINE = 3;

Global pre_command = 0;

Global word_understood_to = 0;
Global command_in_full = false;

Global next_token_type = 0;

! for storing prepositions in, when I get that far...
Global next_expected_word = 0;


! Do a parse. Call with true to store results; false simply to return length of match made
[ PerformAdvanceParse setting_flags
	i rv j k;

	i = word_understood_to;
	k = command_in_full;
	
	#ifdef DEBUG;
		!glk_set_window ( (+main-window+).ref_number);
	#endif;
	
	pre_command = PERFORMING;
	next_expected_word = 0;
	word_understood_to = -1;
	j = next_token_type;
	
	Parser__parse();

	! put back global vars

	rv = word_understood_to;

	if (~~setting_flags)
	{
		next_token_type = j;
		word_understood_to = i;
		command_in_full = k;
	}
	pre_command = INACTIVE;

	! print "Returning  ", rv, ".^";
	! return matched number
	return rv;
	
];



-) before "Language.i6t".




Book 5 - Parser with added tracking information

[ 

	Here's where we start rewriting the internals. If you're adapting IP to work with other extensions, this is where you need to look.

	There are no structural or flow changes here. All we do is record how far we got on each pass through, and additional information like what we were hoping to find next, for use in making suggestions.
]

Chapter 1 - Parser


Section 0 - Silence the advance parser's clarification messages

Include (-

[ PrintInferredCommand from singleton_noun;
! ------------IP CHANGE HERE-----------------

if (pre_command == INACTIVE)
{

! ------------IP CHANGE DONE-----------------

	singleton_noun = FALSE;
	if ((from ~= 0) && (from == pcount-1) &&
		(pattern-->from > 1) && (pattern-->from < REPARSE_CODE))
			singleton_noun = TRUE;

	if (singleton_noun) {
		BeginActivity(CLARIFYING_PARSERS_CHOICE_ACT, pattern-->from);
		if (ForActivity(CLARIFYING_PARSERS_CHOICE_ACT, pattern-->from) == 0) {
			print "("; PrintCommand(from); print ")^";
		}
		EndActivity(CLARIFYING_PARSERS_CHOICE_ACT, pattern-->from);
	} else {
		print "("; PrintCommand(from); print ")^";
	}
	
! ------------IP CHANGE HERE-----------------
}
! ------------IP CHANGE DONE-----------------
];

[ PrintCommand from i k spacing_flag;

! ------------IP CHANGE HERE-----------------
if (pre_command == INACTIVE)
{
! ------------IP CHANGE DONE-----------------

    if (from == 0) {
        i = verb_word;
        if (LanguageVerb(i) == 0)
            if (PrintVerb(i) == 0) print (address) i;
        from++; spacing_flag = true;
    }
    for (k=from : k<pcount : k++) {
        i = pattern-->k;
        if (i == PATTERN_NULL) continue;
        if (spacing_flag) print (char) ' ';
        if (i == 0) { print (string) THOSET__TX; jump TokenPrinted; }
        if (i == 1) { print (string) THAT__TX;   jump TokenPrinted; }
        if (i >= REPARSE_CODE)
            print (address) VM_NumberToDictionaryAddress(i-REPARSE_CODE);
        else
            if (i ofclass K3_direction)
                print (LanguageDirection) i; ! the direction name as adverb
            else
                print (the) i;
      .TokenPrinted;
        spacing_flag = true;
    }
    
! ------------IP CHANGE HERE-----------------
}
! ------------IP CHANGE DONE-----------------

];


-) instead of "Print Command" in "Parser.i6t".

Section 1 - Intro

Include (-



    if (held_back_mode == 1) {
        held_back_mode = 0;
        VM_Tokenise(buffer, parse);
        jump ReParse;
    }

  .ReType;

! ------------IP CHANGE HERE-----------------
if (pre_command == ERROR_GIVEN) return;
! ------------IP CHANGE DONE-----------------

	cobj_flag = 0;
	actors_location = ScopeCeiling(player);

! ------------IP CHANGE HERE-----------------
if (pre_command == INACTIVE)
{
! ------------IP CHANGE DONE-----------------

		BeginActivity(READING_A_COMMAND_ACT); if (ForActivity(READING_A_COMMAND_ACT)==false) {
		Keyboard(buffer,parse);
		players_command = 100 + WordCount();
		num_words = WordCount();
    } if (EndActivity(READING_A_COMMAND_ACT)) jump ReType;

! ------------IP CHANGE HERE-----------------
}
! ------------IP CHANGE DONE-----------------


  .ReParse;

! ------------IP CHANGE HERE-----------------
	if (pre_command == RETURN_TO_INPUT_LINE)
	{
		pre_command = INACTIVE;
		jump ReType;
	}
! ------------IP CHANGE DONE-----------------


    parser_inflection = name;

    ! Initially assume the command is aimed at the player, and the verb
    ! is the first word

    num_words = WordCount();
    wn = 1;

    #Ifdef LanguageToInformese;
    LanguageToInformese();
    ! Re-tokenise:
    VM_Tokenise(buffer,parse);
    #Endif; ! LanguageToInformese

    num_words = WordCount();

    k=0;
    #Ifdef DEBUG;
    if (parser_trace >= 2) {
        print "[ ";
        for (i=0 : i<num_words : i++) {

            #Ifdef TARGET_ZCODE;
            j = parse-->(i*2 + 1);
            #Ifnot; ! TARGET_GLULX
            j = parse-->(i*3 + 1);
            #Endif; ! TARGET_
            k = WordAddress(i+1);
            l = WordLength(i+1);
            print "~"; for (m=0 : m<l : m++) print (char) k->m; print "~ ";

            if (j == 0) print "?";
            else {
                #Ifdef TARGET_ZCODE;
                if (UnsignedCompare(j, HDR_DICTIONARY-->0) >= 0 &&
                    UnsignedCompare(j, HDR_HIGHMEMORY-->0) < 0)
                     print (address) j;
                else print j;
                #Ifnot; ! TARGET_GLULX
                if (j->0 == $60) print (address) j;
                else print j;
                #Endif; ! TARGET_
            }
            if (i ~= num_words-1) print " / ";
        }
        print " ]^";
    }
    #Endif; ! DEBUG
    verb_wordnum = 1;
    actor = player;
    actors_location = ScopeCeiling(player);
    usual_grammar_after = 0;

  .AlmostReParse;

    scope_token = 0;
    action_to_be = NULL;

    ! Begin from what we currently think is the verb word

  .BeginCommand;

    wn = verb_wordnum;
    verb_word = NextWordStopped();

    ! If there's no input here, we must have something like "person,".

    if (verb_word == -1) {
        best_etype = STUCK_PE;
        jump GiveError;
    }

    ! Now try for "again" or "g", which are special cases: don't allow "again" if nothing
    ! has previously been typed; simply copy the previous text across

! ------------IP CHANGE HERE-----------------
if (pre_command == INACTIVE)
{
! ------------IP CHANGE DONE-----------------

    if (verb_word == AGAIN2__WD or AGAIN3__WD) verb_word = AGAIN1__WD;
    if (verb_word == AGAIN1__WD) {
        if (actor ~= player) {
            L__M(##Miscellany, 20);
            jump ReType;
        }
        #Ifdef TARGET_ZCODE;
        if (buffer3->1 == 0) {
            L__M(##Miscellany, 21);
            jump ReType;
        }
        #Ifnot; ! TARGET_GLULX
        if (buffer3-->0 == 0) {
            L__M(##Miscellany, 21);
            jump ReType;
        }
        #Endif; ! TARGET_
        for (i=0 : i<INPUT_BUFFER_LEN : i++) buffer->i = buffer3->i;
        VM_Tokenise(buffer,parse);
		num_words = WordCount();
    	players_command = 100 + WordCount();
		jump ReParse;
    }

    ! Save the present input in case of an "again" next time

    if (verb_word ~= AGAIN1__WD)
        for (i=0 : i<INPUT_BUFFER_LEN : i++) buffer3->i = buffer->i;

! ------------IP CHANGE HERE-----------------
}
! ------------IP CHANGE DONE-----------------

    if (usual_grammar_after == 0) {
        j = verb_wordnum;
        i = RunRoutines(actor, grammar); 
        #Ifdef DEBUG;
        if (parser_trace >= 2 && actor.grammar ~= 0 or NULL)
            print " [Grammar property returned ", i, "]^";
        #Endif; ! DEBUG

        if ((i ~= 0 or 1) && (VM_InvalidDictionaryAddress(i))) {
            usual_grammar_after = verb_wordnum; i=-i;
        }

        if (i == 1) {
            parser_results-->ACTION_PRES = action;
            parser_results-->NO_INPS_PRES = 0;
            parser_results-->INP1_PRES = noun;
            parser_results-->INP2_PRES = second;
            if (noun) parser_results-->NO_INPS_PRES = 1;
            if (second) parser_results-->NO_INPS_PRES = 2;
            rtrue;
        }
        if (i ~= 0) { verb_word = i; wn--; verb_wordnum--; }
        else { wn = verb_wordnum; verb_word = NextWord(); }
    }
    else usual_grammar_after = 0;
    
    -) instead of "Parser Letter A" in "Parser.i6t".
    
Section 2 - Verbs
    
Include (-
	! Only check for a comma (a "someone, do something" command) if we are
	! not already in the middle of one.  (This simplification stops us from
	! worrying about "robot, wizard, you are an idiot", telling the robot to
	! tell the wizard that she is an idiot.)
	
	if (actor == player) {
		for (j=2 : j<=num_words : j++) {
			i=NextWord();
			if (i == comma_word) jump Conversation;
		}
	}
	jump NotConversation;
	
	! NextWord nudges the word number wn on by one each time, so we've now
	! advanced past a comma.  (A comma is a word all on its own in the table.)
	
	.Conversation;
	
	j = wn - 1; ! Now j = word number of the comma itself

! ------------IP CHANGE HERE-----------------
	MatchUpTo(j, EX_VERB, "Verb not found, was it conversation?");
! ------------IP CHANGE DONE-----------------

	if (j == 1) {
		L__M(##Miscellany, 22);

! ------------IP CHANGE HERE-----------------
		if (pre_command == PERFORMING)
			pre_command = ERROR_GIVEN;
		MatchUpTo(0, EX_VERB, "Not conversation!");
! ------------IP CHANGE DONE-----------------

		jump ReType;
	}

	! Use NounDomain (in the context of "animate creature") to see if the
	! words make sense as the name of someone held or nearby
	
	wn = 1; lookahead = HELD_TOKEN;
	scope_reason = TALKING_REASON;
	l = NounDomain(player,actors_location,6);
	scope_reason = PARSING_REASON;
	if (l == REPARSE_CODE) jump ReParse;
	if (l == 0) {
		if (verb_word && ((verb_word->#dict_par1) & 1)) jump NotConversation;
		L__M(##Miscellany, 23);
		
! ------------IP CHANGE HERE-----------------
		if (pre_command == PERFORMING)
			pre_command = ERROR_GIVEN;
! ------------IP CHANGE DONE-----------------

		! No MatchUpTo as we've used Noun Domain	
				
		jump ReType;
	}
	
	.Conversation2;
	
	! The object addressed must at least be "talkable" if not actually "animate"
	! (the distinction allows, for instance, a microphone to be spoken to,
	! without the parser thinking that the microphone is human).
	
	if (l hasnt animate && l hasnt talkable) {
		L__M(##Miscellany, 24, l);
		
! ------------IP CHANGE HERE-----------------
		if (pre_command == PERFORMING)
			pre_command = ERROR_GIVEN;
! ------------IP CHANGE DONE-----------------

		jump ReType;
	}
	
	! Check that there aren't any mystery words between the end of the person's
	! name and the comma (eg, throw out "dwarf sdfgsdgs, go north").
	
	if (wn ~= j) {
		if (verb_word && ((verb_word->#dict_par1) & 1)) jump NotConversation;
		L__M(##Miscellany, 25);

! ------------IP CHANGE HERE-----------------
		if (pre_command == PERFORMING)
			pre_command = ERROR_GIVEN;
! ------------IP CHANGE DONE-----------------

		jump ReType;
	}
	
	! The player has now successfully named someone.  Adjust "him", "her", "it":
	
	PronounNotice(l);
	
	! Set the global variable "actor", adjust the number of the first word,
	! and begin parsing again from there.
	
	verb_wordnum = j + 1;
	
	! Stop things like "me, again":
	
	if (l == player) {
		wn = verb_wordnum;
		if (NextWordStopped() == AGAIN1__WD or AGAIN2__WD or AGAIN3__WD) {
			L__M(##Miscellany, 20);

! ------------IP CHANGE HERE-----------------
			if (pre_command == PERFORMING)
				pre_command = ERROR_GIVEN;
! ------------IP CHANGE DONE-----------------

			jump ReType;
		}
	}
	
	actor = l;
	actors_location = ScopeCeiling(l);
	#Ifdef DEBUG;
	if (parser_trace >= 1)
		print "[Actor is ", (the) actor, " in ", (name) actors_location, "]^";
	#Endif; ! DEBUG
	jump BeginCommand;

    -) instead of "Parser Letter C" in "Parser.i6t".

Section - Letter F

Include (-

advance_warning = -1;

! ------------IP CHANGE HERE-----------------
if (pre_command == INACTIVE)
{
! ------------IP CHANGE DONE-----------------

         indef_mode = false;
        for (i=0,m=false,pcount=0 : line_token-->pcount ~= ENDIT_TOKEN : pcount++) {
            scope_token = 0;

            if (line_ttype-->pcount ~= PREPOSITION_TT) i++;

            if (line_ttype-->pcount == ELEMENTARY_TT) {
                if (line_tdata-->pcount == MULTI_TOKEN) m = true;
                if (line_tdata-->pcount == MULTIEXCEPT_TOKEN or MULTIINSIDE_TOKEN  && i == 1) {
                    ! First non-preposition is "multiexcept" or
                    ! "multiinside", so look ahead.

                    #Ifdef DEBUG;
                    if (parser_trace >= 2) print " [Trying look-ahead]^";
                    #Endif; ! DEBUG

                    ! We need this to be followed by 1 or more prepositions.

                    pcount++;
                    if (line_ttype-->pcount == PREPOSITION_TT) {
                        ! skip ahead to a preposition word in the input
                        do {
                            l = NextWord();
                        } until ((wn > num_words) ||
                                 (l && (l->#dict_par1) & 8 ~= 0));
                        
                        if (wn > num_words) {
                            #Ifdef DEBUG;
                            if (parser_trace >= 2)
                                print " [Look-ahead aborted: prepositions missing]^";
                            #Endif;
                            jump LineFailed;
                        }
                        
                        do {
                            if (PrepositionChain(l, pcount) ~= -1) {
                                ! advance past the chain
                                if ((line_token-->pcount)->0 & $20 ~= 0) {
                                    pcount++;
                                    while ((line_token-->pcount ~= ENDIT_TOKEN) &&
                                           ((line_token-->pcount)->0 & $10 ~= 0))
                                        pcount++;
                                } else {
                                    pcount++;
                                }
                            } else {
                                ! try to find another preposition word
                                do {
                                    l = NextWord();
                                } until ((wn >= num_words) ||
                                         (l && (l->#dict_par1) & 8 ~= 0));
                                
                                if (l && (l->#dict_par1) & 8) continue;
                                
                                ! lookahead failed
                                #Ifdef DEBUG;
                                if (parser_trace >= 2)
                                    print " [Look-ahead aborted: prepositions don't match]^";
                                #endif;
                                jump LineFailed;
                            }
                            l = NextWord();
                        } until (line_ttype-->pcount ~= PREPOSITION_TT);
                        
                        ! put back the non-preposition we just read
                        wn--;

                        if ((line_ttype-->pcount == ELEMENTARY_TT) &&
                        	(line_tdata-->pcount == NOUN_TOKEN)) {
                            l = Descriptors();  ! skip past THE etc
                            if (l~=0) etype=l;  ! don't allow multiple objects
                        	k = parser_results-->INP1_PRES; @push k; @push parameters;
                        	parameters = 1; parser_results-->INP1_PRES = 0;
                            l = NounDomain(actors_location, actor, NOUN_TOKEN);
                            @pull parameters; @pull k; parser_results-->INP1_PRES = k;
                            #Ifdef DEBUG;
                            if (parser_trace >= 2) {
                                print " [Advanced to ~noun~ token: ";
                                if (l == REPARSE_CODE) print "re-parse request]^";
                                else {
                                	if (l == 1) print "but multiple found]^";
                                	if (l == 0) print "error ", etype, "]^";
                                	if (l >= 2) print (the) l, "]^";
                                }
                            }
                            #Endif; ! DEBUG
                            if (l == REPARSE_CODE) jump ReParse;
                            if (l >= 2) advance_warning = l;
                        }
                    }
                    break;
                }
            }
        }

! ------------IP CHANGE HERE-----------------
}
! ------------IP CHANGE DONE-----------------

        ! Slightly different line-parsing rules will apply to "take multi", to
        ! prevent "take all" behaving correctly but misleadingly when there's
        ! nothing to take.

        take_all_rule = 0;
        if (m && params_wanted == 1 && action_to_be == ##Take)
            take_all_rule = 1;

        ! And now start again, properly, forearmed or not as the case may be.
        ! As a precaution, we clear all the variables again (they may have been
        ! disturbed by the call to NounDomain, which may have called outside
        ! code, which may have done anything!).

        inferfrom = 0;
        parameters = 0;
        nsns = 0; special_word = 0;
        multiple_object-->0 = 0;
        etype = STUCK_PE;
        wn = verb_wordnum+1;

-) instead of "Parser Letter F" in "Parser.i6t".
    
Section 3 - Tokens

Include (-
        for (pcount=1 : : pcount++) {
            pattern-->pcount = PATTERN_NULL; scope_token = 0;

            token = line_token-->(pcount-1);
            lookahead = line_token-->pcount;

            #Ifdef DEBUG;
            if (parser_trace >= 2)
                print " [line ", line, " token ", pcount, " word ", wn, " : ", (DebugToken) token,
                  "]^";
            #Endif; ! DEBUG

            if (token ~= ENDIT_TOKEN) {

! ------------IP CHANGE HERE-----------------
		 MatchUpTo(wn-1, EX_NOUN, "Parse Token going round the loop."); ! we've gotten this far, right?
! ------------IP CHANGE DONE-----------------

                scope_reason = PARSING_REASON;
                AnalyseToken(token);

                l = ParseToken(found_ttype, found_tdata, pcount-1, token);
                while ((l >= GPR_NOUN) && (l < -1))  l = ParseToken(ELEMENTARY_TT, l + 256);

                scope_reason = PARSING_REASON;

                if (l == GPR_PREPOSITION) {
                    if (found_ttype~=PREPOSITION_TT && (found_ttype~=ELEMENTARY_TT ||
                        found_tdata~=TOPIC_TOKEN)) params_wanted--;

                    l = true;
                }
                else
                    if (l < 0) l = false;
                    else
                        if (l ~= GPR_REPARSE) {
                            if (l == GPR_NUMBER) {
                                if (nsns == 0) special_number1 = parsed_number;
                                else special_number2 = parsed_number;
                                nsns++; l = 1;
                            }
                            if (l == GPR_MULTIPLE) l = 0;
                            parser_results-->(parameters+INP1_PRES) = l;
                            parameters++;
                            pattern-->pcount = l;
                            l = true;
                        }

                #Ifdef DEBUG;
                if (parser_trace >= 3) {
                    print "  [token resulted in ";
                    if (l == REPARSE_CODE) print "re-parse request]^";
                    if (l == 0) print "failure with error type ", etype, "]^";
                    if (l == 1) print "success]^";
                }
                #Endif; ! DEBUG

                if (l == REPARSE_CODE) jump ReParse;
                if (l == false) break;
            }
            else {

                ! If the player has entered enough already but there's still
                ! text to wade through: store the pattern away so as to be able to produce
                ! a decent error message if this turns out to be the best we ever manage,
                ! and in the mean time give up on this line

                ! However, if the superfluous text begins with a comma or "then" then
                ! take that to be the start of another instruction

                if (wn <= num_words) {
                    l = NextWord();
                    if (l == THEN1__WD or THEN2__WD or THEN3__WD or comma_word) {
                        held_back_mode = 1; hb_wn = wn-1;
                    }
                    else {
			

			MatchUpTo(wn-2, EX_ENDOFLINE, "Grammar line's run out but text hasn't"); 
			! why is it -2? Because we've just done a NextWord on the line above ( +1) and we're on a word that didn't match ( + 1). So we matched 2.
			
                        for (m=0 : m<32 : m++) pattern2-->m = pattern-->m;
                        pcount2 = pcount;
                        etype = UPTO_PE;
                        break;
                    }
                }

                ! Now, we may need to revise the multiple object because of the single one
                ! we now know (but didn't when the list was drawn up).

                if (parameters >= 1 && parser_results-->INP1_PRES == 0) {
                    l = ReviseMulti(parser_results-->INP2_PRES);
                    if (l ~= 0) { etype = l; parser_results-->ACTION_PRES = action_to_be; break; }
                }
                if (parameters >= 2 && parser_results-->INP2_PRES == 0) {
                    l = ReviseMulti(parser_results-->INP1_PRES);
                    if (l ~= 0) { etype = l; break; }
                }

                ! To trap the case of "take all" inferring only "yourself" when absolutely
                ! nothing else is in the vicinity...

                if (take_all_rule == 2 && parser_results-->INP1_PRES == actor) {
                    best_etype = NOTHING_PE;
                    jump GiveError;
                }

                #Ifdef DEBUG;
                if (parser_trace >= 1) print "[Line successfully parsed]^";
                #Endif; ! DEBUG

                ! The line has successfully matched the text.  Declare the input error-free...

                oops_from = 0;

                ! ...explain any inferences made (using the pattern)...
		
                if (inferfrom ~= 0) {
                	PrintInferredCommand(inferfrom);
                    ClearParagraphing();
                }

                ! ...copy the action number, and the number of parameters...

                parser_results-->ACTION_PRES = action_to_be;
                parser_results-->NO_INPS_PRES = parameters;

                ! ...reverse first and second parameters if need be...

                if (action_reversed && parameters == 2) {
                    i = parser_results-->INP1_PRES;
                    parser_results-->INP1_PRES = parser_results-->INP2_PRES;
                    parser_results-->INP2_PRES = i;
                    if (nsns == 2) {
                        i = special_number1; special_number1 = special_number2;
                        special_number2 = i;
                    }
                }

                ! ...and to reset "it"-style objects to the first of these parameters, if
                ! there is one (and it really is an object)...

                if (parameters > 0 && parser_results-->INP1_PRES >= 2)
                    PronounNotice(parser_results-->INP1_PRES);

                ! ...and return from the parser altogether, having successfully matched
                ! a line.

                if (held_back_mode == 1) {
                    wn=hb_wn;
                    jump LookForMore;
                }

! ------------IP CHANGE HERE-----------------
                MatchUpTo(wn-1, EX_ENDOFLINE, "Parser matched"); ! wn as next word has taken us past the end of input
! ------------IP CHANGE DONE-----------------
                
                rtrue;

            } ! end of if(token ~= ENDIT_TOKEN) else
        } ! end of for(pcount++)

        .LineFailed;
        ! The line has failed to match.
        ! We continue the outer "for" loop, trying the next line in the grammar.

        if (etype > best_etype) best_etype = etype;
        if (etype ~= ASKSCOPE_PE && etype > nextbest_etype) nextbest_etype = etype;

        ! ...unless the line was something like "take all" which failed because
        ! nothing matched the "all", in which case we stop and give an error now.

        if (take_all_rule == 2 && etype==NOTHING_PE) break;

    } ! end of for(line++)

    ! The grammar is exhausted: every line has failed to match.

    -) instead of "Parser Letter G" in "Parser.i6t".

Section 4 - Errors

Include (-

    ! If the player was the actor (eg, in "take dfghh") the error must be printed,
    ! and fresh input called for.  In three cases the oops word must be jiggled.


    if ((etype ofclass Routine) || (etype ofclass String)) {
        if (ParserError(etype) ~= 0) jump ReType;
    } else {
		if (verb_wordnum == 0 && etype == CANTSEE_PE) etype = VERB_PE;
		players_command = 100 + WordCount(); ! The snippet variable ``player's command''
        BeginActivity(PRINTING_A_PARSER_ERROR_ACT);
        if (ForActivity(PRINTING_A_PARSER_ERROR_ACT)) jump SkipParserError;
    }
    pronoun_word = pronoun__word; pronoun_obj = pronoun__obj;

    if (etype == STUCK_PE) {    L__M(##Miscellany, 27); oops_from = 1; }

    if (etype == UPTO_PE) {     L__M(##Miscellany, 28);
        for (m=0 : m<32 : m++) pattern-->m = pattern2-->m;
        pcount = pcount2; PrintCommand(0); L__M(##Miscellany, 56);
    }
    if (etype == NUMBER_PE)     L__M(##Miscellany, 29);
    if (etype == CANTSEE_PE) {  L__M(##Miscellany, 30); oops_from=saved_oops; }
    if (etype == TOOLIT_PE)     L__M(##Miscellany, 31);
    if (etype == NOTHELD_PE) {  L__M(##Miscellany, 32); oops_from=saved_oops; }
    if (etype == MULTI_PE)      L__M(##Miscellany, 33);
    if (etype == MMULTI_PE)     L__M(##Miscellany, 34);
    if (etype == VAGUE_PE)      L__M(##Miscellany, 35);
    if (etype == EXCEPT_PE)     L__M(##Miscellany, 36);
    if (etype == ANIMA_PE)    L__M(##Miscellany, 37);
    if (etype == VERB_PE)      
	{

! ------------IP CHANGE HERE-----------------
		MatchUpTo(0, EX_VERB, "Verb Error");
! ------------IP CHANGE DONE-----------------

		L__M(##Miscellany, 38);
	}
    if (etype == SCENERY_PE)    L__M(##Miscellany, 39);
    if (etype == ITGONE_PE) {
        if (pronoun_obj == NULL)
                                L__M(##Miscellany, 35);
        else                    L__M(##Miscellany, 40);
    }
    if (etype == JUNKAFTER_PE)  L__M(##Miscellany, 41);
    if (etype == TOOFEW_PE)     L__M(##Miscellany, 42, multi_had);
    if (etype == NOTHING_PE) {
        if (parser_results-->ACTION_PRES == ##Remove &&
        	parser_results-->INP2_PRES ofclass Object) {
            noun = parser_results-->INP2_PRES; ! ensure valid for messages
            if (noun has animate) L__M(##Take, 6, noun);
            else if (noun hasnt container or supporter) L__M(##Insert, 2, noun);
            else if (noun has container && noun hasnt open) L__M(##Take, 9, noun);
            else if (children(noun)==0) L__M(##Search, 6, noun);
            else parser_results-->ACTION_PRES = 0;
            }
        if (parser_results-->ACTION_PRES ~= ##Remove) {
            if (multi_wanted==100)  L__M(##Miscellany, 43);
            else                    L__M(##Miscellany, 44);
        }
    }
    if (etype == ASKSCOPE_PE) {
        scope_stage = 3;
        if (indirect(scope_error) == -1) {
            best_etype = nextbest_etype;
            if (~~((etype ofclass Routine) || (etype ofclass String)))
            	EndActivity(PRINTING_A_PARSER_ERROR_ACT);
            jump GiveError;
        }
    }
    if (etype == NOTINCONTEXT_PE) L__M(##Miscellany, 73);

    .SkipParserError;
    if ((etype ofclass Routine) || (etype ofclass String)) jump ReType;
    say__p = 1;
    EndActivity(PRINTING_A_PARSER_ERROR_ACT);

-) instead of "Parser Letter I" in "Parser.i6t".

Include (-
    ! And go (almost) right back to square one...

! ------------IP CHANGE HERE-----------------
	if (pre_command == PERFORMING)
		pre_command = ERROR_GIVEN;
! ------------IP CHANGE DONE-----------------

    jump ReType;

    ! ...being careful not to go all the way back, to avoid infinite repetition
    ! of a deferred command causing an error.
-) instead of "Parser Letter J" in "Parser.i6t".

Section - Letter K


Include (-
    ! At this point, the return value is all prepared, and we are only looking
    ! to see if there is a "then" followed by subsequent instruction(s).

  .LookForMore;

    if (wn > num_words) 
	{

! ------------IP CHANGE HERE-----------------
		MatchUpTo(num_words, EX_ENDOFLINE, "We've run out of text to read");
! ------------IP CHANGE DONE-----------------

	 	rtrue;
	}

    i = NextWord();
    if (i == THEN1__WD or THEN2__WD or THEN3__WD or comma_word) {
        if (wn > num_words) {
           held_back_mode = false;
           return;
        }
        i = WordAddress(verb_wordnum);
        j = WordAddress(wn);
        for (: i<j : i++) i->0 = ' ';
        i = NextWord();
        if (i == AGAIN1__WD or AGAIN2__WD or AGAIN3__WD) {
            ! Delete the words "then again" from the again buffer,
            ! in which we have just realised that it must occur:
            ! prevents an infinite loop on "i. again"

            i = WordAddress(wn-2)-buffer;
            if (wn > num_words) j = INPUT_BUFFER_LEN-1;
            else j = WordAddress(wn)-buffer;
            for (: i<j : i++) buffer3->i = ' ';
        }
        VM_Tokenise(buffer,parse);
        held_back_mode = true;
        return;
    }

    best_etype = UPTO_PE;
    jump GiveError;

-) instead of "Parser Letter K" in "Parser.i6t".

Chapter 2 - Parse Token


Section - Parse Token A

Include (-

    token_filter = 0;
    parser_inflection = name;

    switch (given_ttype) {
      ELEMENTARY_TT:
        switch (given_tdata) {
          SPECIAL_TOKEN:
            l = TryNumber(wn);
            special_word = NextWord();
            #Ifdef DEBUG;
            if (l ~= -1000)
                if (parser_trace >= 3) print "  [Read special as the number ", l, "]^";
            #Endif; ! DEBUG
            if (l == -1000) {
                #Ifdef DEBUG;
                if (parser_trace >= 3) print "  [Read special word at word number ", wn, "]^";
                #Endif; ! DEBUG
                l = special_word;
            }
            parsed_number = l;
            return GPR_NUMBER;

          NUMBER_TOKEN:
            l=TryNumber(wn++);
            if (l == -1000) {
                etype = NUMBER_PE;
                return GPR_FAIL;
            }
            #Ifdef DEBUG;
            if (parser_trace>=3) print "  [Read number as ", l, "]^";
            #Endif; ! DEBUG
            parsed_number = l;
            return GPR_NUMBER;

          CREATURE_TOKEN:
            if (action_to_be == ##Answer or ##Ask or ##AskFor or ##Tell)
                scope_reason = TALKING_REASON;

          TOPIC_TOKEN:
            consult_from = wn;
            if ((line_ttype-->(token_n+1) ~= PREPOSITION_TT) &&
               (line_token-->(token_n+1) ~= ENDIT_TOKEN))
                RunTimeError(13);
            do o = NextWordStopped();
            until (o == -1 || PrepositionChain(o, token_n+1) ~= -1);
            wn--;
            consult_words = wn-consult_from;
            if (consult_words == 0) return GPR_FAIL;
            if (action_to_be == ##Ask or ##Answer or ##Tell) {
                o = wn; wn = consult_from; parsed_number = NextWord();
                wn = o; return 1;
            }
            if (o==-1 && (line_ttype-->(token_n+1) == PREPOSITION_TT))
                return GPR_FAIL;    ! don't infer if required preposition is absent
            return GPR_PREPOSITION;
        }

      PREPOSITION_TT:
        ! Is it an unnecessary alternative preposition, when a previous choice
        ! has already been matched?
        if ((token->0) & $10) return GPR_PREPOSITION;

        ! If we've run out of the player's input, but still have parameters to
        ! specify, we go into "infer" mode, remembering where we are and the
        ! preposition we are inferring...

        if (wn > num_words) {
            if (inferfrom==0 && parameters<params_wanted) {
                inferfrom = pcount; inferword = token;
                pattern-->pcount = REPARSE_CODE + VM_DictionaryAddressToNumber(given_tdata);
            }

            ! If we are not inferring, then the line is wrong...

            if (inferfrom == 0) 
            {
            	! this is where we end up when typing "PUT BOOK". How do we
            	! know we're not going to infer?
            	return -1;
            }

            ! If not, then the line is right but we mark in the preposition...

            pattern-->pcount = REPARSE_CODE + VM_DictionaryAddressToNumber(given_tdata);
            return GPR_PREPOSITION;
        }

        o = NextWord();

        pattern-->pcount = REPARSE_CODE + VM_DictionaryAddressToNumber(o);

        ! Whereas, if the player has typed something here, see if it is the
        ! required preposition... if it's wrong, the line must be wrong,
        ! but if it's right, the token is passed (jump to finish this token).

        if (o == given_tdata)
	{


! ------------IP CHANGE HERE-----------------
!glk_set_window((+main-window+).ref_number);
!print "Matched a solo preposition : word num = ", wn-1, ".^";
		MatchUpTo(wn - 1, EX_NOUN, "Matched solo prep.^");
! ------------IP CHANGE DONE-----------------


		return GPR_PREPOSITION;
	}
        if (PrepositionChain(o, token_n) ~= -1)
	{

! ------------IP CHANGE HERE-----------------
!glk_set_window((+main-window+).ref_number);
!print "Matched a alternate preposition : word num = ", wn-1, ".^";
		MatchUpTo(wn - 1, EX_NOUN, "Matched chained prep.^");
! ------------IP CHANGE DONE-----------------

		return GPR_PREPOSITION;
	}
        return -1;

      GPR_TT:
        l = indirect(given_tdata);
        #Ifdef DEBUG;
        if (parser_trace >= 3) print "  [Outside parsing routine returned ", l, "]^";
        #Endif; ! DEBUG
        return l;

      SCOPE_TT:
        scope_token = given_tdata;
        scope_stage = 1;
        #Ifdef DEBUG;
        if (parser_trace >= 3) print "  [Scope routine called at stage 1]^";
        #Endif; ! DEBUG
        l = indirect(scope_token);
        #Ifdef DEBUG;
        if (parser_trace >= 3) print "  [Scope routine returned multiple-flag of ", l, "]^";
        #Endif; ! DEBUG
        if (l == 1) given_tdata = MULTI_TOKEN; else given_tdata = NOUN_TOKEN;

      ATTR_FILTER_TT:
        token_filter = 1 + given_tdata;
        given_tdata = NOUN_TOKEN;

      ROUTINE_FILTER_TT:
        token_filter = given_tdata;
        given_tdata = NOUN_TOKEN;

    } ! end of switch(given_ttype)

    token = given_tdata;

-) instead of "Parse Token Letter A" in "Parser.i6t".

Section - Parse Token F

[ NOTE, it would appear there's actually no changes in this section at all. ]

Include (-

    ! Happy or unhappy endings:

  .PassToken;

    if (many_flag) {
        single_object = GPR_MULTIPLE;
        multi_context = token;
    }
    else {
        if (indef_mode == 1 && indef_type & PLURAL_BIT ~= 0) {
            if (indef_wanted < INDEF_ALL_WANTED && indef_wanted > 1) {
                multi_had = 1; multi_wanted = indef_wanted;
                etype = TOOFEW_PE;
                jump FailToken;
            }
        }
    }
    return single_object;

  .FailToken;

    ! If we were only guessing about it being a plural, try again but only
    ! allowing singulars (so that words like "six" are not swallowed up as
    ! Descriptors)

    if (allow_plurals && indef_guess_p == 1) {
        #Ifdef DEBUG;
        if (parser_trace >= 4) print "   [Retrying singulars after failure ", etype, "]^";
        #Endif;
        prev_indef_wanted = indef_wanted;
        allow_plurals = false;
        wn = desc_wn;
        
        jump TryAgain;
    }

    if ((indef_wanted > 0 || prev_indef_wanted > 0) && (~~multiflag)) etype = MULTI_PE;

! ------------IP CHANGE HERE-----------------
!	 - NOTE, it would appear there's actually no changes in this section at all.

	! MatchUpTo(wn - 2, EX_NOUN, "Parser token failed (using wn-2. Is this arbitrary?)");
	! why -2? Assumes we've failed on the first word (I think this is true, otherwise we get an "UPTO" error instead.
! ------------IP CHANGE DONE-----------------

    return GPR_FAIL;

]; ! end of ParseToken__


-) instead of "Parse Token Letter F" in "Parser.i6t"

Section 2 - Descriptors

Include (-
[ Descriptors  o x flag cto type n;
    ResetDescriptors();
    if (wn > num_words) return 0;

    for (flag=true : flag :) {
        o = NextWordStopped(); flag = false;

       for (x=1 : x<=LanguageDescriptors-->0 : x=x+4)
            if (o == LanguageDescriptors-->x) {
                flag = true;
                type = LanguageDescriptors-->(x+2);
                if (type ~= DEFART_PK) indef_mode = true;
                indef_possambig = true;
                indef_cases = indef_cases & (LanguageDescriptors-->(x+1));

                if (type == POSSESS_PK) {
                    cto = LanguageDescriptors-->(x+3);
                    switch (cto) {
                      0: indef_type = indef_type | MY_BIT;
                      1: indef_type = indef_type | THAT_BIT;
                      default:
                        indef_owner = PronounValue(cto);
                        if (indef_owner == NULL) indef_owner = InformParser;
                    }
                }

                if (type == light)  indef_type = indef_type | LIT_BIT;
                if (type == -light) indef_type = indef_type | UNLIT_BIT;
            }

        if (o == OTHER1__WD or OTHER2__WD or OTHER3__WD) {
            indef_mode = 1; flag = 1;
            indef_type = indef_type | OTHER_BIT;
        }
        if (o == ALL1__WD or ALL2__WD or ALL3__WD or ALL4__WD or ALL5__WD) {
            indef_mode = 1; flag = 1; indef_wanted = INDEF_ALL_WANTED;
            if (take_all_rule == 1) take_all_rule = 2;
            indef_type = indef_type | PLURAL_BIT;
        }
        if (allow_plurals) {
        	if (NextWordStopped() ~= -1) { wn--; n = TryNumber(wn-1); } else { n=0; wn--; }
            if (n == 1) { indef_mode = 1; flag = 1; }
            if (n > 1) {
                indef_guess_p = 1;
                indef_mode = 1; flag = 1; indef_wanted = n;
                indef_nspec_at = wn-1;
                indef_type = indef_type | PLURAL_BIT;
            }
        }
        if (flag == 1 && NextWordStopped() ~= OF1__WD or OF2__WD or OF3__WD or OF4__WD)
            wn--;  ! Skip 'of' after these
    }
    wn--;

! ------------IP CHANGE HERE-----------------
	MatchUpTo(wn-1, EX_NOUN, "Descriptors");
! ------------IP CHANGE DONE-----------------


    return 0;
];

[ SafeSkipDescriptors;
	@push indef_mode; @push indef_type; @push indef_wanted;
	@push indef_guess_p; @push indef_possambig; @push indef_owner;
	@push indef_cases; @push indef_nspec_at;
	
	Descriptors();
	
	@pull indef_nspec_at; @pull indef_cases;
	@pull indef_owner; @pull indef_possambig; @pull indef_guess_p;
	@pull indef_wanted; @pull indef_type; @pull indef_mode;
];
-) instead of "Parsing Descriptors" in "Parser.i6t".

Section 1 - NounDomain


Include (-

[ MatchUpTo wordnum type debugprint;
	if (type == EX_ENDOFLINE && inferfrom == 0) 
		command_in_full = true;
	if (word_understood_to  < wordnum || type == EX_VERB)
	{
		#ifdef DEBUG_ADVANCE_PARSING;
			glk_set_window( (+main-window+).ref_number );
			print "Establishing ", wordnum, " words and token type ", type, ".^";
			print (string) debugprint, "^";
		#endif;
		
		word_understood_to = wordnum;
		next_token_type = type;
	}
];

[ NounDomain domain1 domain2 context
	first_word i j k l answer_words marker;

    #Ifdef DEBUG;
    if (parser_trace >= 4) {
        print "   [NounDomain called at word ", wn, "^";
        print "   ";
        if (indef_mode) {
            print "seeking indefinite object: ";
            if (indef_type & OTHER_BIT)  print "other ";
            if (indef_type & MY_BIT)     print "my ";
            if (indef_type & THAT_BIT)   print "that ";
            if (indef_type & PLURAL_BIT) print "plural ";
            if (indef_type & LIT_BIT)    print "lit ";
            if (indef_type & UNLIT_BIT)  print "unlit ";
            if (indef_owner ~= 0) print "owner:", (name) indef_owner;
            new_line;
            print "   number wanted: ";
            if (indef_wanted == INDEF_ALL_WANTED) print "all"; else print indef_wanted;
            new_line;
            print "   most likely GNAs of names: ", indef_cases, "^";
        }
        else print "seeking definite object^";
    }
    #Endif; ! DEBUG

    match_length = 0; number_matched = 0; match_from = wn;

    SearchScope(domain1, domain2, context);

    #Ifdef DEBUG;
    if (parser_trace >= 4) print "   [ND made ", number_matched, " matches]^";
    #Endif; ! DEBUG

    wn = match_from+match_length;

    ! If nothing worked at all, leave with the word marker skipped past the
    ! first unmatched word...

    if (number_matched == 0) { wn++; rfalse; }

! ------------IP CHANGE HERE-----------------
if (number_matched > 1 && pre_command == PERFORMING)
{
		!glk_set_window((+main-window+).ref_number);
		!print "Multilmatch : wn = ", wn, " but we record wn-1 = ", wn-1, ".^";

		MatchUpTo(wn-1, EX_PREPOSITION, "Multiple match in NounDomain. We return the first and move on.");
		return match_list-->0;
}
! ------------IP CHANGE DONE-----------------

    ! Suppose that there really were some words being parsed (i.e., we did
    ! not just infer).  If so, and if there was only one match, it must be
    ! right and we return it...

    if (match_from <= num_words) {
        if (number_matched == 1) {
            i=match_list-->0;
            return i;
        }

        ! ...now suppose that there was more typing to come, i.e. suppose that
        ! the user entered something beyond this noun.  If nothing ought to follow,
        ! then there must be a mistake, (unless what does follow is just a full
        ! stop, and or comma)

        if (wn <= num_words) {
            i = NextWord(); wn--;
            if (i ~=  AND1__WD or AND2__WD or AND3__WD or comma_word
                   or THEN1__WD or THEN2__WD or THEN3__WD
                   or BUT1__WD or BUT2__WD or BUT3__WD) {
                if (lookahead == ENDIT_TOKEN) 
			{

! ------------IP CHANGE HERE-----------------

					!glk_set_window((+main-window+).ref_number);
					!print "Splurge text on end of line : wn = ", wn, " but we record wn-2 = ", wn-2, ".^";

				MatchUpTo(wn-1, EX_ENDOFLINE, "End of text input (Noun domain)");
! ------------IP CHANGE DONE-----------------

				rfalse;
			}
            }
        }
    }

    ! Now look for a good choice, if there's more than one choice...

    number_of_classes = 0;

    if (number_matched == 1) i = match_list-->0;
    if (number_matched > 1) {
		i = true;
	    if (number_matched > 1)
	    	for (j=0 : j<number_matched-1 : j++)
				if (Identical(match_list-->j, match_list-->(j+1)) == false)
					i = false;
		if (i) dont_infer = true;
        i = Adjudicate(context);
        if (i == -1) rfalse;
        if (i == 1) rtrue;       !  Adjudicate has made a multiple
                             !  object, and we pass it on
    }

    ! If i is non-zero here, one of two things is happening: either
    ! (a) an inference has been successfully made that object i is
    !     the intended one from the user's specification, or
    ! (b) the user finished typing some time ago, but we've decided
    !     on i because it's the only possible choice.
    ! In either case we have to keep the pattern up to date,
    ! note that an inference has been made and return.
    ! (Except, we don't note which of a pile of identical objects.)

! ------------IP CHANGE HERE-----------------

#ifdef DEBUG_ADVANCE_PARSING;
	glk_set_window((+main-window+).ref_number);
	print "Noun Domain: matched ", (the) i, " with wn = ", wn-1, ". Inferfrom == ", inferfrom, " or ", pcount, "?";
#endif;

	   MatchUpTo(wn-1, EX_NOUN, "NounDomain");	! really? or preposition?

! ------------IP CHANGE DONE-----------------

    if (i ~= 0) {
    	if (dont_infer) return i;
        if (inferfrom == 0) inferfrom=pcount;
        pattern-->pcount = i;

! ------------IP CHANGE HERE-----------------
	next_expected_word = i;
! ------------IP CHANGE DONE-----------------

        return i;
    }


! ------------IP CHANGE HERE-----------------
		if (pre_command == PERFORMING) rfalse;
! ------------IP CHANGE DONE-----------------


    ! If we get here, there was no obvious choice of object to make.  If in
    ! fact we've already gone past the end of the player's typing (which
    ! means the match list must contain every object in scope, regardless
    ! of its name), then it's foolish to give an enormous list to choose
    ! from - instead we go and ask a more suitable question...
    
    if (match_from > num_words) 
	{

! ------------IP CHANGE HERE-----------------
		MatchUpTo(num_words, EX_NOUN, "ND: This one's never reached.");
! ------------IP CHANGE DONE-----------------

		jump Incomplete;
	}

    ! Now we print up the question, using the equivalence classes as worked
    ! out by Adjudicate() so as not to repeat ourselves on plural objects...

	BeginActivity(ASKING_WHICH_DO_YOU_MEAN_ACT);
	if (ForActivity(ASKING_WHICH_DO_YOU_MEAN_ACT)) jump SkipWhichQuestion;
	j = 1; marker = 0;
	for (i=1 : i<=number_of_classes : i++) {
		while (((match_classes-->marker) ~= i) && ((match_classes-->marker) ~= -i))
			marker++;
		if (match_list-->marker hasnt animate) j = 0;
	}
	if (j) L__M(##Miscellany, 45); else L__M(##Miscellany, 46);

    j = number_of_classes; marker = 0;
    for (i=1 : i<=number_of_classes : i++) {
        while (((match_classes-->marker) ~= i) && ((match_classes-->marker) ~= -i)) marker++;
        k = match_list-->marker;

        if (match_classes-->marker > 0) print (the) k; else print (a) k;

        if (i < j-1)  print (string) COMMA__TX;
        if (i == j-1) {
			#Ifdef SERIAL_COMMA;
			if (j ~= 2) print ",";
        	#Endif; ! SERIAL_COMMA
        	print (string) OR__TX;
        }
    }
    L__M(##Miscellany, 57);

	.SkipWhichQuestion; EndActivity(ASKING_WHICH_DO_YOU_MEAN_ACT);

    ! ...and get an answer:

  .WhichOne;

! ------------IP CHANGE HERE-----------------
!	Under IP, we don't do questions in this way. Instead, we record where in the input line the player's text is going to
!	go, and then we give them an input line to edit

	if ((+current text input window+) == (+key-window+))
	{
		CreateEditPoint(CharacterNumber(match_from) - 1);
		pre_command = RETURN_TO_INPUT_LINE;
		return REPARSE_CODE;
	}

! ------------IP CHANGE DONE-----------------


    #Ifdef TARGET_ZCODE;
    for (i=2 : i<INPUT_BUFFER_LEN : i++) buffer2->i = ' ';
    #Endif; ! TARGET_ZCODE
    answer_words=Keyboard(buffer2, parse2);

    ! Conveniently, parse2-->1 is the first word in both ZCODE and GLULX.
    first_word = (parse2-->1);

    ! Take care of "all", because that does something too clever here to do
    ! later on:

    if (first_word == ALL1__WD or ALL2__WD or ALL3__WD or ALL4__WD or ALL5__WD) {
        if (context == MULTI_TOKEN or MULTIHELD_TOKEN or MULTIEXCEPT_TOKEN or MULTIINSIDE_TOKEN) {
            l = multiple_object-->0;
            for (i=0 : i<number_matched && l+i<MATCH_LIST_WORDS : i++) {
                k = match_list-->i;
                multiple_object-->(i+1+l) = k;
            }
            multiple_object-->0 = i+l;
            rtrue;
        }
        L__M(##Miscellany, 47);
        jump WhichOne;
    }

	! Look for a comma, and interpret this as a fresh conversation command
	! if so:

	for (i=1 : i<=answer_words : i++)
		if (WordFrom(i, parse2) == comma_word) {
            VM_CopyBuffer(buffer, buffer2);
            jump RECONSTRUCT_INPUT;		
		}

    ! If the first word of the reply can be interpreted as a verb, then
    ! assume that the player has ignored the question and given a new
    ! command altogether.
    ! (This is one time when it's convenient that the directions are
    ! not themselves verbs - thus, "north" as a reply to "Which, the north
    ! or south door" is not treated as a fresh command but as an answer.)

    #Ifdef LanguageIsVerb;
    if (first_word == 0) {
        j = wn; first_word = LanguageIsVerb(buffer2, parse2, 1); wn = j;
    }
    #Endif; ! LanguageIsVerb
    if (first_word ~= 0) {
        j = first_word->#dict_par1;
        if ((0 ~= j&1) && ~~LanguageVerbMayBeName(first_word)) {
            VM_CopyBuffer(buffer, buffer2);
            jump RECONSTRUCT_INPUT;
        }
    }

    ! Now we insert the answer into the original typed command, as
    ! words additionally describing the same object
    ! (eg, > take red button
    !      Which one, ...
    !      > music
    ! becomes "take music red button".  The parser will thus have three
    ! words to work from next time, not two.)

    #Ifdef TARGET_ZCODE;
    k = WordAddress(match_from) - buffer; l=buffer2->1+1;
    for (j=buffer + buffer->0 - 1 : j>=buffer+k+l : j-- ) j->0 = 0->(j-l);
    for (i=0 : i<l : i++) buffer->(k+i) = buffer2->(2+i);
    buffer->(k+l-1) = ' ';
    buffer->1 = buffer->1 + l;
    if (buffer->1 >= (buffer->0 - 1)) buffer->1 = buffer->0;
    #Ifnot; ! TARGET_GLULX
    k = WordAddress(match_from) - buffer;
    l = (buffer2-->0) + 1;
    for (j=buffer+INPUT_BUFFER_LEN-1 : j>=buffer+k+l : j-- ) j->0 = j->(-l);
    for (i=0 : i<l : i++) buffer->(k+i) = buffer2->(WORDSIZE+i);
    buffer->(k+l-1) = ' ';
    buffer-->0 = buffer-->0 + l;
    if (buffer-->0 > (INPUT_BUFFER_LEN-WORDSIZE)) buffer-->0 = (INPUT_BUFFER_LEN-WORDSIZE);
    #Endif; ! TARGET_

    ! Having reconstructed the input, we warn the parser accordingly
    ! and get out.

	.RECONSTRUCT_INPUT;

	num_words = WordCount();
    wn = 1;
    #Ifdef LanguageToInformese;
    LanguageToInformese();
    ! Re-tokenise:
    VM_Tokenise(buffer,parse);
    #Endif; ! LanguageToInformese
	num_words = WordCount();
    players_command = 100 + WordCount();
    actors_location = ScopeCeiling(player);
	FollowRulebook(Activity_after_rulebooks-->READING_A_COMMAND_ACT, true);

    return REPARSE_CODE;

    ! Now we come to the question asked when the input has run out
    ! and can't easily be guessed (eg, the player typed "take" and there
    ! were plenty of things which might have been meant).

  .Incomplete;

    if (context == CREATURE_TOKEN) L__M(##Miscellany, 48);
    else                           L__M(##Miscellany, 49);

! ------------IP CHANGE HERE-----------------
!	Under IP, we don't do questions in this way. Instead, we record where in the input line the player's text is going to
!	go, and then we give them an input line to edit

	if ((+current text input window+) == (+key-window+))
	{
		! we had a sneaky line break.
		print "^";
		CreateEditPoint((buffer-->0) + 1);
		pre_command = RETURN_TO_INPUT_LINE;
		return REPARSE_CODE;
	}



! ------------IP CHANGE DONE-----------------



    #Ifdef TARGET_ZCODE;
    for (i=2 : i<INPUT_BUFFER_LEN : i++) buffer2->i=' ';
    #Endif; ! TARGET_ZCODE
    answer_words = Keyboard(buffer2, parse2);

    first_word=(parse2-->1);
    #Ifdef LanguageIsVerb;
    if (first_word==0) {
        j = wn; first_word=LanguageIsVerb(buffer2, parse2, 1); wn = j;
    }
    #Endif; ! LanguageIsVerb

    ! Once again, if the reply looks like a command, give it to the
    ! parser to get on with and forget about the question...

    if (first_word ~= 0) {
        j = first_word->#dict_par1;
        if (0 ~= j&1) {
            VM_CopyBuffer(buffer, buffer2);
            return REPARSE_CODE;
        }
    }

    ! ...but if we have a genuine answer, then:
    !
    ! (1) we must glue in text suitable for anything that's been inferred.

    if (inferfrom ~= 0) {
        for (j=inferfrom : j<pcount : j++) {
            if (pattern-->j == PATTERN_NULL) continue;
            #Ifdef TARGET_ZCODE;
            i = 2+buffer->1; (buffer->1)++; buffer->(i++) = ' ';
            #Ifnot; ! TARGET_GLULX
            i = WORDSIZE + buffer-->0;
            (buffer-->0)++; buffer->(i++) = ' ';
            #Endif; ! TARGET_

            #Ifdef DEBUG;
            if (parser_trace >= 5)
            	print "[Gluing in inference with pattern code ", pattern-->j, "]^";
            #Endif; ! DEBUG

            ! Conveniently, parse2-->1 is the first word in both ZCODE and GLULX.

            parse2-->1 = 0;

            ! An inferred object.  Best we can do is glue in a pronoun.
            ! (This is imperfect, but it's very seldom needed anyway.)

            if (pattern-->j >= 2 && pattern-->j < REPARSE_CODE) {
                PronounNotice(pattern-->j);
                for (k=1 : k<=LanguagePronouns-->0 : k=k+3)
                    if (pattern-->j == LanguagePronouns-->(k+2)) {
                        parse2-->1 = LanguagePronouns-->k;
                        #Ifdef DEBUG;
                        if (parser_trace >= 5)
                        	print "[Using pronoun '", (address) parse2-->1, "']^";
                        #Endif; ! DEBUG
                        break;
                    }
            }
            else {
                ! An inferred preposition.
                parse2-->1 = VM_NumberToDictionaryAddress(pattern-->j - REPARSE_CODE);
                #Ifdef DEBUG;
                if (parser_trace >= 5)
                	print "[Using preposition '", (address) parse2-->1, "']^";
                #Endif; ! DEBUG
            }

            ! parse2-->1 now holds the dictionary address of the word to glue in.

            if (parse2-->1 ~= 0) {
                k = buffer + i;
                #Ifdef TARGET_ZCODE;
                @output_stream 3 k;
                 print (address) parse2-->1;
                @output_stream -3;
                k = k-->0;
                for (l=i : l<i+k : l++) buffer->l = buffer->(l+2);
                i = i + k; buffer->1 = i-2;
                #Ifnot; ! TARGET_GLULX
                k = Glulx_PrintAnyToArray(buffer+i, INPUT_BUFFER_LEN-i, parse2-->1);
                i = i + k; buffer-->0 = i - WORDSIZE;
                #Endif; ! TARGET_
            }
        }
    }

    ! (2) we must glue the newly-typed text onto the end.

    #Ifdef TARGET_ZCODE;
    i = 2+buffer->1; (buffer->1)++; buffer->(i++) = ' ';
    for (j=0 : j<buffer2->1 : i++,j++) {
        buffer->i = buffer2->(j+2);
        (buffer->1)++;
        if (buffer->1 == INPUT_BUFFER_LEN) break;
    }
    #Ifnot; ! TARGET_GLULX
    i = WORDSIZE + buffer-->0;
    (buffer-->0)++; buffer->(i++) = ' ';
    for (j=0 : j<buffer2-->0 : i++,j++) {
        buffer->i = buffer2->(j+WORDSIZE);
        (buffer-->0)++;
        if (buffer-->0 == INPUT_BUFFER_LEN) break;
    }
    #Endif; ! TARGET_

    ! (3) we fill up the buffer with spaces, which is unnecessary, but may
    !     help incorrectly-written interpreters to cope.

    #Ifdef TARGET_ZCODE;
    for (: i<INPUT_BUFFER_LEN : i++) buffer->i = ' ';
    #Endif; ! TARGET_ZCODE

    return REPARSE_CODE;

]; ! end of NounDomain

-) instead of "Noun Domain" in "Parser.i6t".


Section - Error Reporting

Include (-

[ L__M act n x1 x2 rv flag;

! ------------IP CHANGE HERE-----------------
#ifndef SHOW_PARSER_ERRORS;
if (pre_command == INACTIVE)
{
#endif;

! ------------IP CHANGE DONE-----------------

    @push sw__var;
    sw__var = act;
    if (n == 0) n = 1;
    @push action;
    lm_act = act;
    lm_n = n;
    lm_o = x1;
    lm_o2 = x2;
    switch (act) {
    	##Miscellany: rv = (+ whether or not intervened in miscellaneous message +);
    	##ListMiscellany: rv = (+ whether or not intervened in miscellaneous list message +);
    	default: rv = (+ whether or not intervened in action message +);
    }
    action = sw__var;
    if (rv == false) rv = RunRoutines(LibraryMessages, before);
    @pull action;
    if (rv == false) LanguageLM(n, x1, x2);
    @pull sw__var;
    
! ------------IP CHANGE HERE-----------------
#ifndef SHOW_PARSER_ERRORS;
}
#endif;
! ------------IP CHANGE DONE-----------------

];

-) instead of "Printing Mechanism" in "Language.i6t".



Interactive Parsing ends here.

---- DOCUMENTATION ----

Chapter: Overview

Section: What does this extension do?

Interactive Parsing removes the traditional IF command prompt, in which the players types a command, hits return, and then gets feedback, in favour of a more modern, real-time command prompt, in which the player's command in constantly processed and interpreted while they are typing. 

The system colour-codes the words typed by the player to reflect if the game is understanding them. It also suggests corrections for words, if the player has mistyped, and these corrections are automatically written into the input line.


Section: Why would I want to do this?

The text-game interface is notoriously difficult for beginners to "get into". Part of the reason for this is poor feedback on misunderstood commands, coupled with the negative play experience of having a command not be understood. (The player, after all, knows English better than the computer; so it should be the computer's problem, and not the player's, to understand.)

Interactive Parsing attempts to remove the frustration involved with finding and entering a successful command, by ensuring that players are discouraged to type commands that don't work, and pointed in the direction of commands that do.

The design of the system follows that of search engines and mobile phone keyboards, with "opt-out" spell-correction rather than "opt-in", and predictive suggestions.

Chapter: Getting Started

Section: Setting Up

To begin using Interactive Parsing, you will first need to download a copy of Erik Temple's extension, "Text Input-Output Control" from the following page:

	http://inform7.com/extensions/Erik%20Temple/Text%20Window%20Input-Output%20Control/index.html

and also "Flexible Windows":

	http://inform7.com/extensions/Jon%20Ingold/Flexible%20Windows/index.html

You can then simply include the Interactive Parsing extension at the top of your game-file. The system should automatically begin suggesting and correcting based on your game's dictionary.

Section: Changing Input Mode

You can toggle the input mode using the "inputchange" command. This flips the game between input modes. This command is available in the released game as well, but can be disabled by including the line:

	Understand the command "inputchange" as something new.

Section: Disabling Interactive Parsing

You can disable the extension easily by including the line:

	Use interactive parsing override.

at the top of your game file - this is provided on an option because interactive parsing tends to run slowly in the I7 IDE, and it does not interact with the Skein and Transcript functions. So during development you may want to leave the features of Interactive Parser turned off, and include it only at the end of a project.

You may well want to include the use option in a "(not for release)" section in your source code.


Section: Glulx only

Interactive Parsing only works for Glulx. While it might be possible to do a similar process for the Z-Machine, the lack of window control means the player would be entering text into the status line. This is unattractive, and Glulx is, these days, a fast, viable interpreter with web-based options with considerably more memory to spare.

Section: Dictionary Size Constants

The system requires a few constants to store information. These are set to sensible defaults, but if any are exceeded by a large game, the system should print a warning message on starting up with instructions on how to fix it.

The most important, and most likely to be needed, is:

	Use maximum dictionary size of at least 1000.
	
This tells the game how big the dictionary is.

Less importantly, there is a constant to determine letter-by-letter storage:

	Use average word length of at least 6.
	
It's unlikely you'll need to extend this (6 is already much large than the default dictionary average.)

The game also stores, turn by turn, a list of words that are in scope, words that are verbs, and words that refer to visible items. The limits for the number of these can also be increased.

Note that errors displayed for these will only occur if and when the limit is exceeded, so you will need to test the game fully to be sure they have not been reached!

	Use maximum words in scope of at least 256.
	Use maximum verb words of at least 300.
	Use maximum compass names of at least 35.


Section: Overheads

The system performs parsing and dictionary searches throughout the player's typing session, so it will inevitably slow down the player's ability to type into the game at times. However, the system has been heavily optimised,  and in test cases runs with no more perceptible slowdown than a mobile-phone typing interface.

The system may become more expensive in larger games, and the author would be interested to know if and when it becomes impractical. (Though note, testing in the IDE is not representative of testing in the released game.)

The system also uses a lot of storage, but since Glulx has an enormous brain, this shouldn't cause too much of a problem.

Section: Interaction with other extensions

Note this extension replaces large amounts of the parser, so it may not work with other extensions which are designed to alter parsing behaviour. However, it should be easy to fix any conflicts. Refer to the extension authors, or the "Parser Rewrites" section below.

Section: Credits

Interactive Parsing is built out of two other, fine extensions - Text Input-Output Control by Erik Temple, which handles the separate input window (and is a required file to run this extensions) - and Mistype by Cedric Knight, from which several tips, tricks, algorithms and general inspiration have been drawn.

This extension also relies on Basic Screen Effects by Emily Short, and Flexible Windows, by myself and Erik Temple.

Section: Special Keys

The following keys have particular behaviour in the interface. You may wish to document these for the user.

	Space - accept a suggestion if the typed word is not in the dictionary
	Tab - accept a suggestion regardless of what the player typed
	Up / Page Up - go back through command history
	Down / Home - go forward through command history
	Right / Left - move the cursor across the input line
	Escape - accept typed version word ignoring suggestions

Chapter: Fine Tuning

Section: Long Words

By default, the Inform library truncates all dictionary words to 9 characters long. This can cause the suggestion system to accept, suggest and write into the transcript words which are cut-off, such as "ROADRUNNE" or "MISCHEVIO". To correct this, we need to tell the library what these words look like, in full. This is done using a table, which is already defined in the extension to cover long library words (such as "SUPERBRIEF" and "TWENTY-ONE"). It has one column, "word", in which we put the (text string) of the word in full. Don't forget, this is a "continuation" of a table, not a new one.

	Table of Longer Words (continued)
	word
	"mischievous"
	"roadrunner"

Note if the game contains two long words which share the first nine-letters, this won't work, and can't be worked around. Apologies, but there's just no data in the compiled game-file to detect this.

To help you find words that need a longer definition, the use option "long word check report" is provided. Compiling with this option enabled will cause the game to list on start-up all the long words in the dictionary which don't have an alternative in table. Some will be internal names (such as "main-window" and "key-window", which are the names of the Glulx window objects); and some will be valid 9-letter words 9such as "southeast" and "southwest"). But any that appear cut-off here and can be entered by the player should be given a table entry.

Release versions will never print this text, which is for debugging only.


Section: Boosting Words

Sometimes, the system will find two or more words that are equally good matches. We can force some suggestions to take priority. (Note, this shouldn't be used much, as there's no support for any contextual data. I've mainly implemented it to ensure "DROP" wins over "DRAG". But here's how it works, in case you need it.)

The game contains a table called the "Table of Useful Words". By default it looks as follows:

	Table of Useful Words
	word name
	"look"
	"drop"
	"close"
	"attack"

The defaults exist to promote LOOK over LOCK, DROP over DRAG, CLOSE over CLEAN and CLIMB, ATTACK over ATTACH.

By default, when two equal-length words match the player's input (for example, CL matches CLEAN and CLIMB, and LO matches LOOK and LOCK), the system will pick the first one alphabetically. To change this, add a word to the table above. This word will then score a one-point bonus ever tme it's matched.



Section: Single-Letter Verb Associations

To improve speed, the game has a fixed table mapping single keystrokes to verbs (since these are always context-independent). This table is called the Table of Single-Letter Verb Associations, and it looks as follows:

	Table of Single-Letter Verb Associations
	ascii value 	letter		text
	97			"a"			"attack"
	98			"b"			"buy"
	99			"c"			"cut"
	100			"d"			"down"
	101			"e"			"east"
	102			"f"			"feel"
	103			"g"			"get"
	104			"h"			"hello"
	105			"i"			"inventory"
	106			"j"			"jump"
	107			"k"			"kick"
	108			"l"			"look"
	109			"m"			"move"
	110			"n"			"north"
	111			"o"			"open"
	112			"p"			"put"
	113			"q"			"quit"
	114			"r"			"read"
	115			"s"			"south"
	116			"t"			"take"
	117			"u"			"up"
	118			"v"			"version"
	119			"w"			"west"
	120			"x"			"examine"
	121			"y"			"yes"
	122			"z"			"wait"

If your game features different verbs, or you disagree with any of the key-mappings provided, you can change this at the start of the game using a When play begins rule:

	When play begins: 
		now the text corresponding to a letter of "a" in the Table of Single-Letter Verb Associations is "admonish".

Chapter: How it Works

Section: Continuous Tokenisation and Colour-Coding

At its heart, Interactive Parsing works by reanalysing the input buffer after every keystroke and tokenising what it finds. (Tokenising means, looking up in the game dictionary). Tokenisation is fast, and returns information on whether the typed words are recognised or not. This information is turned into colour-coding and relayed back to the player as colour. This is the simplest level of analysis.

We also run the full game parser on what the player has typed, and record how many words of the input are successfully matched. If the whole line is understood, the "Press Return" text is displayed on the input line. Otherwise, the number of words understood is stored to be used as a benchmark for suggested word alternatives.

Section: Near-Matches, Mistypes and Suggestions

When the player has typed a word which is not understood, the game attempts to deduce if this is a mistype, or the beginning of, an expected dictionary word. If one can be found which is close to what the player has typed in, it will be suggested as an alternative by the correction/prediction system.

The algorithm for comparing typed input against dictionary words uses a pre-analysis system for additional speed, based on prime numbers. A quick explanation follows, because I think it's quite clever.

The algorithm aims to score how close a typed word (say, "XAEMI") is to a dictionary word ("EXAMINE"). The first version of this algorithm looped through the typed letters, then for each of these through the dictionary letters, and if a matching letter was found, the word was scored based on the distance between the typed and dictionary positions. (This is the algorithm used by the Mistype extension.)

However, this meant two full loops as well as printing every dictionary word to a text buffer before every comparison. 

The second version of this algorithm uses a preprocess of the dictionary. While the game is starting up, it loops through each word in the dictionary and converts each letter into a prime number (A = 2, B = 3, C = 5, up to Z = 101). It then multiplies the prime-values of the word in blocks of three and stores these in a large look-up table. 

So for example, 

	EXAMINE

becomes

	11, 89, 2, 41, 23, 43, 11

giving the set of multiples:

	979, 1958, 7298, 1886, 40549, 10879, 473

When the game then comes to check this against what the player types, all it needs to do is loop through the typed letters and see which of their prime-values divide into which of these multiples. This saves printing the word to the buffer, and only requires use to loop over the local neighbourhood of each typed letter.

Section: Pre-parsing

When a new close word has been found, the game creates a copy of the input buffer as if the player had typed in their input with this new suggestion. The full game parser is then run on this input, and we record how many words it matches in the player's input.

If more words are matched than were with what the player actually typed, this suggestion is considered valid and it will be offered to the player, unless one can be found which is closer to what the player typed.

For speed, the system checks sensible words first: words associated with visible objects and prepositions. At the start of the input line, it will only check verbs and compass directions.

Results of pre-parsing are cached so the parser does not need to be run again over the same suggested input (if, say, the player types in one additional letter).

However, pre-parsing is still the slowest part of the process; and when the game cannot find any matches for what the player has typed it gets very slow, as the game must try a very large number of dictionary words. To resolve this problem, we use a threading system.


Section: Threaded Input and Background Word-checking

The extension makes use of Glulx's timer capability to provide background processing on the player's input. 

When any new letter is typed, an suggestion/predictive analysis is begun, but while it executes it checks (every hundred cycles or so) to see if a key has been pressed. If it has, analysis exits, the keypress is dealt with, and the new data is used to either continue or restart the analysis process.

This isn't as smooth as I'd like - Glulx cannot check to see if a key has been pressed without imposing at least a 1 millisecond time delay, so it cannot check for keypresses in a fluid way, but has to do so at set intervals.

Section: Further Optimisation

The next biggest saving would probably be to start caching the Scope Lists produced by the parser, as these are recalculated for every new word tried in a certain position on the input line. However, this would require a fair bit more parser hacking.

Chapter: Changelog and Known Issues

Section: Changelog

Version 3:
	* Added functionality to correctly detect, suggest and write in words of more than 9 letters, using the Table of Longer Words.
	* Added support for talking to animate characters and providing them with instructions. The system now correctly suggests and parses this kind of input, although note it will not suggest the comma after the name of the animate thing. (It would be good if it did, maybe, but the player has either typed the comma or not, so the game doesn't have much information to go on.)

Version 2:
	* Added command line recall (up/down arrow keys)
	* Added command line editing (left/right arrow keys)
	* Added handling for disambiguating input, by recalling the previous command line and placing the cursor at the appropriate edit point (!)

Section: Known Issues

Interactive Parsing fails on mobile devices running Quixe.

This extension is incompatible with any other that alters any parsing routines (including Disambiguation Control). However, the extension attempts to clearly mark what parser changes have been made, so it should be possible to upgrade other extensions to achieve compatibility.

Section: Parser Rewrites 

All parser rewrites are in Book 5 and are flagged by the comments:

	! ------------IP CHANGE HERE-----------------

	! ------------IP CHANGE DONE-----------------

At last count, there are 36 changes, most consisting of a single additional line.




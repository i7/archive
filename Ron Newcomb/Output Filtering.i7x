Version 2 of Output Filtering by Ron Newcomb begins here.

"Specify rules to modify any and all game output.  Recommended usage is solving capitalization, punctuation, and whitespace issues.  Includes Eric Eve's Text Capture."

"Special thanks to JDC, Aaron Reed, and Jon Ingold."

Part 1 -include Eric's extension

Include Text Capture by Eric Eve. 
Use maximum capture buffer length of at least 5000.
Output filtering is a truth state that varies.  Output filtering is usually true. 

[

Part 2 - Define Four Phrases (in place of Part 1 - Define Four Phrases in Text Capture by Eric Eve)

To start capturing text: (-
	if ( 1 == (+ output filtering +) ) { (+ flush output rule +)(); }
	StartCapture(); 
-).

To stop capturing text: (- 
	EndCapture();
	if ( 1 == (+ output filtering +) ) { (+ flush output rule +)(); }
-).

To say the/-- captured text:
  (- PrintCapture(); -).

To decide whether text capturing is active: (- (capture_active > 0) -). 

]

Part 3 - Extension Output Filtering

Chapter - Extension Output Filtering

Section - Basics

Use banner text filtering translates as (- Constant BANNER_FILTERING; -).
Use no blank lines translates as (- Constant DISABLE_BLANK_LINE_REGEX; -). 
Use output filter debugging translates as (- Constant DEBUG_OUTPUT_FILTERING; -).

The game's response is indexed text that varies.  [ ANALOGOUS TO "THE PLAYER'S COMMAND" ]
To decide whether (ts - a truth state) is on: if ts is  true, decide yes; otherwise decide no.
To decide whether (ts - a truth state) is off: if ts is false, decide yes; otherwise decide no.

To start output filtering:
	if output filtering is false begin;  
		now output filtering is true; [must be true when calling rule]
		follow the Capture Game Output rule;
	end if.

To stop output filtering:
	if output filtering is true begin;  
		follow the Format Game Output rule;  [ flush current saved contents ]
		now output filtering is false; [must be true when calling rule]
	end if.


Section - Rules that use the basics

The last before printing the banner text (this is the Start Banner Text Filtering rule):
	if not using banner text filtering option, follow the Format Game Output rule.
The first after printing the banner text (this is the Finish Banner Text Filtering rule): 
	if using the banner text filtering option, follow the Format Game Output rule;
	follow the Capture Game Output rule;  [always turn it on after banner text regardless, so the initial room description will be properly capitallized]

The first after reading a command (this is the Capture Game Output rule): 
	if output filtering is true, start capturing text.

The last before reading a command (this is the Format Game Output rule):  
	if output filtering is true begin;
		stop capturing text; 
		change the game's response to "[run paragraph on][captured text]";
		follow the output processing rulebook;
		say the filtered game's response;
	end if.  [and leave it off for the command line and parsing; the Capture rule will turn it on again]

First when play begins (this is the Initializing Output Filtering rule): 
	follow the Capture Game Output rule.


Section - a debugging verb to turn output filtering on/off - not for release

Understand "output filtering" as toggling output filtering. Toggling output filtering is an action out of world applying to nothing.
Carry out toggling output filtering:
	if output filtering is true, stop output filtering;
	otherwise start output filtering;
	say "output filtering is now [bold type][output filtering][roman type].";


Section - Autocapitalize the sentence after a room heading even though the heading doesn't end in a period

This is the flush output rule: 
	say run paragraph on;
	follow the Format Game Output rule;
	say run paragraph on;
	follow the Capture Game Output rule.

The flush output rule is listed after the room description heading rule in the carry out looking rules.
The flush output rule is listed before the room description body text rule in the carry out looking rules.


Chapter - The Output Processing Rulebook's default rules

The output processing rules are a rulebook.

An output processing rule (this is the Autocapitalization rule): 
	replace the regular expression "(<\.\?\!>)(<\s'{\<}>+)(\l)" in the game's response with "\1\2\u3";
	replace the regular expression "^(<\s'{\<}>*)(\l)" in the game's response with "\1\u2". [for the very first letter of the captured text] 
	[NOTE: in the above, \1 is a lower-case L in the regex and the number One in the replacement! I7's font shows them identically.  ]

 [ to type ¶ on Mac keyboard, hold Option, type 7 ]
 [ to type ¶ on Win keyboard, hold ALT, type 0182, release ALT ]

An output processing rule (this is the Paragraph Break rule): 
	if not using no blank lines option, replace the regular expression "\[BLANK LINE]" in the game's response with "\n\n\[BLANK LINE]";
	replace the regular expression "\n{3,}" in the game's response with "\n\n";  [ single-function search should be faster, and ensure it's "3 or more" not "2 or more"!! ]
	replace the regular expression "\n{2,}$" in the game's response with "\n";  [ the command prompt tends to print its own line break before itself, so we enforce only one break beforehand ]
	if not using no blank lines option, replace the regular expression "\[BLANK LINE]" in the game's response with "\n". 


Chapter - I6 helper routines for Output Filtering

To say bold type: (- bold_on(); -).

To say italic type: (- italic_on(); -).

To say roman type: (- roman_on(); -).

To say blank line: say "[bracket]BLANK LINE[close bracket]".

To say the/-- filtered (itext - indexed text): (- SayGameResponse(({itext})); -).

Include (-

[ bold_on;
  if (capture_active > 0)  print "{";
  else style bold;
]; 

[ italic_on;
  if (capture_active > 0)  print "<";
  else style underline;
]; 

[ roman_on;
  if (capture_active > 0)  print "}";
  else style roman;
]; 


[ SayGameResponse indt ch i dsize;
	if ((indt==0) || (BlkType(indt) ~= INDEXED_TEXT_TY)) return;
	dsize = BlkValueExtent(indt);
	for (i=0:i<dsize:i++) {
		ch = BlkValueRead(indt, i);
		switch (ch) 
		{
		0: return;
		255: return;
		'{': style bold; continue;
		'<': style underline; continue;
		'}': style roman; continue;
	#ifdef TARGET_ZCODE;
		10: continue;
	#endif;
		}
		#ifdef DEBUG_OUTPUT_FILTERING;
			switch (ch) {     ! then print ZSCII values instead
			32: print "    ";
			10: print "^";
			default: print  ch, " ";
			}
		#ifnot;
			#ifdef IT_Storage_Glulx_Unicode;
				glk_put_char_uni(ch);
			#ifnot; ! IT_Storage_Glulx_Unicode
				print  (char) ch;
			#endif;
		#endif;
	}
];

-).


Output Filtering ends here.


---- DOCUMENTATION ----


Section : Basic usage


This extension allows us to specify rules that can modify any and all game output.  Its recommended usage is solving capitalization, punctuation, and whitespace issues.  It is general enough to be used for other purposes -- such as renaming people or objects throughout the game -- but this can cause a noticeable speed hit.

By default, this extension ensures only two things.  First, no more than two line breaks may occur in succession (but see below about "[blank line]"), and second, every sentence begins with a capital letter.  New rules can be added to the output processing rulebook, and would typically use regular expressions on "the game's response":

	*: An output processing rule (this is the pilcrow rule): 
		replace the regular expression "&para;(&para;|\s)*" in the game's response with "\n\n". [ starting with literal should be faster ; consecutive paragraph breaks act as one ]
	
	The pilcrow rule is listed before the Paragraph Break rule in the output processing rules.


The above example rule uses the &para;¶ pilcrow symbol (type Option 7 on Mac keyboards, or ALT 0182 on Windows keyboards) as a paragraph break, and furthermore ensures that multiple paragraph breaks in a row, even if interspersed with whitespace, act as a single paragraph break.  (This is how a paragraph break differs from a line break -- a paragraph break is smarter.  It's elastic.)

A pair of phrases toggle output filtering, and if statements test its state:
	*: start output filtering;
	stop output filtering;
	if output filtering is on begin;
	if output filtering is true begin;

And finally, to cause the filter to output what it has eaten so far, 
	*: follow the flush output rule;

Section : Altering the existing rules

The Autocapitalization and Paragraph Break features may be turned off by de-listing them.
	*: The Paragraph Break rule is not listed in the output processing rules.
	The Autocapitalization rule is not listed in the output processing rules.

Occasionally we may specifically want an extra blank line.  The say phrase "[blank line]" inserts a blank line, first executing a paragraph break if necessary, for times when we really want extra whitespace:
	*: say "[blank line]";

However, if the blank line say phrase is not used in a particular work, it may be turned off for additional code efficiency:
	*: Use no blank lines.

Banner text is not normally filtered, but it can be with the use option:
	*: Use banner text filtering.

The command prompt is one of the few things not filtered by this extension.  Though it's recommended to use existing methods of changing it, it can be set to "", and other code, such as residing in a Before Reading a Command rule, can manually print a filterable command prompt.

If we decide we'd like to save the game's response for later (by copying it to another variable of indexed text), we can use the "say the filtered" phrase instead of the normal say phrase. 
	*: now the abeyance is the game's response;
	say the filtered abeyance;

Section : Debugging the extension

A debugging verb exists for the author:
	>  OUTPUT FILTERING
	(O/o)utput filtering is now (TRUE/FALSE).

When starting filtering, the debugging verb's output will be captured and processed the same as any other output.  For example, the letter O would be capitalized.

Debugging filter problems sometimes requires looking at the actual ZSCII codes being printed out. This can be accomplished with a use option.  Note that bold and italic text is still processed, and spaces and newlines are actually printed in lieu of their ZSCII code, for greater readability of the debugging output.
	*: Use output filter debugging.

Section : Important technical notes

Very lengthy passages may exceed the size of the buffer set aside for this extension.  It can be increased by raising the number in:
	*: Use maximum capture buffer length of at least 5000.

No changes are needed to existing code in order to use bold and italic type, but there are two known issues.  First, this extension uses the  { open brace, the  } close brace, and the  < less-than symbol to temporarily represent the textual styles.  If a work wishes to print these, then modifying the appropriate Inform 6 part of this extension would be necessary.  Second, due to a limitation of regular expressions in Inform, altering the number of blank lines cannot be done with the Z-machine.

Example: * Navel Gazing - Tests extension, highlights limitations.

	*: "navel gazing"

	Include Output Filtering by Ron Newcomb. [Use no blank lines.] [Use output filter debugging. ]  [Use banner text filtering.] 

	When play begins, change the command prompt to "[bold type][if output filtering is on]on[otherwise]off[end if][roman type]>".

	Before printing the banner text, say "once upon a time...[line break][line break]".    
  
	room heading is a room. "you notice the room heading was capitalized.  and the first sentence was capitalized in spite of the room heading not ending in a period, exclamation mark, or question mark.     " 

	A horse is a supporter in room heading. "[line break][line break]here appears to be two spurious leading line breaks (removed), a horse with no name...[blank line]...and exactly one extra blank line.  you can also see [bold type]bold[roman type] and [italic type]italic[roman type] text here."
 
	Has-whispered is a truth state that varies.  Has-whispered is false. 
	Understand "whisper" as a mistake ("the horse whispers his name back to you.  he also mentions that all variables of yours will now be set long before any text is printed.  This means say phrases with side effects, such as the [learn Argo]'learn Argo' code, essentially occur at the beginning of the enclosing phrase.").
	To say learn Argo: now has-whispered is true.

	An output processing rule (this is the Known Name rule): 
		if has-whispered is true, replace the regular expression "\b(a|the)\s+horse" in the game's response with "Argo", case insensitively.

	Understand "breaks" as a mistake ("and then (break)[line break]something (2 breaks)[line break][line break][bold type]really[roman type] happened! (3 breaks)[line break][line break][line break]").

	Understand "speak" as a mistake ("'capitalize me when I'm talking to you!'[line break][line break]'all my [italic type]friends[roman type] use [italic type]screenplay[roman type] style, and [italic type]they[roman type] don't capitalize!'[line break][line break]'we don't care what your friends do or don't use.  you will capitalize after double-quotation marks!'").

	Test me with " l/ breaks / speak / whisper / output filtering / l / breaks / speak / whisper ". 


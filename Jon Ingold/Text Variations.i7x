Version 4 of Text Variations by Jon Ingold begins here.

"Provides the ability to vary say statements inline, either randomly or sequentially. Works under Zcode and Glulx. Note, nested variating brackets are not allowed."

Part 1 - I6 routines 

[for capturing text to the output buffer; also printing and computing a (very simple) hash]

Include (-

Array buffer_printed_text --> 256;
Array buffer_ptrs --> 16;
Global buffer_counter = 0;
Global tip_buffer = 0;

    Constant    BP_MEMORYFREF_ROCK  661;
    Constant    BP_MEMORY_MAXNEST   16;
    Array       bp_memory_buf -->   BP_MEMORY_MAXNEST;
    Array       bp_memory_str -->   BP_MEMORY_MAXNEST;
    Global      bp_memory_nest = 0;

!Some code from Roger Firth, to create a biplatform output stream '3'

[ Stream_To_Array buf;
#ifdef  TARGET_ZCODE;
        @output_stream 3 buf;
#ifnot; ! TARGET_GLULX;
                if (bp_memory_nest == BP_MEMORY_MAXNEST) rfalse;
                bp_memory_buf-->bp_memory_nest = buf;
                bp_memory_str-->bp_memory_nest = glk_stream_get_current();
                glk_stream_set_current(glk_stream_open_memory(buf+WORDSIZE, 256, filemode_Write, BP_MEMORYFREF_ROCK+bp_memory_nest));
                bp_memory_nest++;

#endif; ! TARGET_
        rtrue; ];

[      _Unstream;
#ifdef  TARGET_ZCODE;
        @output_stream -3;
#ifnot; ! TARGET_GLULX;
                if (bp_memory_nest == 0) rfalse;
                bp_memory_nest--;
                glk_stream_close(glk_stream_get_current(), gg_arguments);
                glk_stream_set_current(bp_memory_str-->bp_memory_nest);
                (bp_memory_buf-->bp_memory_nest)-->0 = gg_arguments-->1;
                bp_memory_buf-->bp_memory_nest = bp_memory_str-->bp_memory_nest = GLK_NULL;
#endif;
];

[ __bc; return buffer_counter; ];

[ init_random_list;
  buffer_counter = 0;
  tip_buffer = 0;
  buffer_ptrs-->buffer_counter = 0;
];

[ start_random_entry  sofar ptr;
  sofar = buffer_ptrs-->buffer_counter;
  ptr = buffer_printed_text + sofar;
  Stream_To_Array(ptr);
];

[ complete_random_entry  sofar ptr len;
  sofar = buffer_ptrs-->buffer_counter;
  ptr = buffer_printed_text + sofar;
  _Unstream();
  len = WORDSIZE + ptr-->0;
  buffer_counter++;
  buffer_ptrs-->buffer_counter = sofar+len;
];

[ print_line n sofar ptr len ix;
  sofar = buffer_ptrs-->(n-1);
  ptr = buffer_printed_text + sofar;
  len = WORDSIZE + ptr-->0;
  for (ix=WORDSIZE : ix<len : ix++) 
  { if (ptr->ix == 10 or 13) print "^"; else print (char) ptr->ix;  }
];

[ hash_buffer n ix sofar ptr len tot;
 for (n=0:n<buffer_counter:n++)
 { sofar = buffer_ptrs-->0;
  ptr = buffer_printed_text + sofar;
  len = WORDSIZE + ptr-->0;
  for (ix=WORDSIZE : ix<len : ix++) tot = tot + (ix*((ptr->ix)-90));
} 
 return tot + tip_buffer;
];

[ Tipbuffer n; tip_buffer = n; ];

-)

part 2 - controlling the I6 process

To say one of:
	(- init_random_list(); start_random_entry(); -).
	
To say or:
	(- complete_random_entry(); start_random_entry(); -).

To complete line: (- complete_random_entry(); -).

To print line using (n - a number): 
(-  if (__bc() == 0) return; 
    print_line({n}); 
-).

Part  3 - Say options
	
To say purely at random:
	complete line;
	print line using a random number between 1 and the upper buffer limit.

To say cycling: finalise print line, cycling.
To say stopping: finalise print line, stopping.
To say at random: finalise print line, at random.
To say sticky random: finalise print line, sticky random.
To say once only: complete line; finalise print line, once only.

Part 4 - calculating and locating hashes

To say tip buffer (n - a number):
(- Tipbuffer({n}); 
-)

To decide which number is the hash of the buffer: (- (hash_buffer()) -).
To decide which number is the upper buffer limit: (- (__bc()) -).
To decide which number is the current trow: (- (ct_1) -)

To decide which number is the row with hash (k - a number):
	if there is no hash of k in the Table of Hash Numbers, decide on 0;
	choose row with a hash of k in the Table of Hash Numbers;
	decide on the current trow;

Part 5 - Doing the printing

To finalise print line, cycling, stopping, once only, sticky random or at random:
	complete line;
	let k be the hash of the buffer;
	if k is zero, stop;	[ ie. There was no text stored up. ]
	let k be the row with hash k;
	if k is not zero begin;
		choose row k in the Table of Hash Numbers;
	otherwise;
		if the number of blank rows in the Table of Hash Numbers is 0 begin;
			say "(TV Error - increase size of Table of Hash Numbers)";
			sort Table of Hash Numbers in index order;
			choose row 5 in the Table of Hash Numbers;
			blank out the whole row;
		end if;
		choose a blank row in the Table of Hash Numbers;
		change hash entry to the hash of the buffer;
		change index entry to 0;
	end if;
	if once only begin;
		if the index entry is not 0, stop;
		change the index entry to 1;
		print line using index entry;
		stop;
	end if;
	if upper buffer limit is 0, say "error - empty buffer";
	if upper buffer limit is at most 1 begin;
		print line using 1;
		stop;
	end if;
	if sticky random begin;
		if the index entry is 0, change the index entry to a random number from 1 to the upper buffer limit;
		print line using index entry;
		stop;
	end if;
	if at random begin;
		let choice be a random number from 1 to the upper buffer limit;		
		while choice is the index entry repeatedly let choice be a random number from 1 to the upper buffer limit;		
		change index entry to choice;
		print line using index entry;
		stop;
	end if;
	if stopping begin;
		change index entry to index entry + 1;
		if index entry > upper buffer limit then change index entry to upper buffer limit;
		print line using index entry;
		stop;		
	end if;
	if cycling begin;
		change index entry to index entry + 1;
		if index entry > upper buffer limit then change index entry to 1;
		print line using index entry;
		stop;
	end if;

Table of Hash Numbers
hash		index
a number	a number
with 99 blank rows.

Part 6 - recovering index values

To decide which number is the index of the buffer:
	complete line;
	decide on the index of the last buffer.

To decide which number is the index of the last buffer:
	let k be the hash of the buffer;
	if k is not zero and there is a hash of k in the Table of Hash Numbers, decide on the index corresponding to a hash of k in the Table of Hash Numbers;
	decide on 0.

Text Variations2 by Jon Ingold ends here.

---- DOCUMENTATION ----

Firstly, credit where credit is due: the underlying I6 code here was posted to rec.arts.int-fiction by Andrew Plotkin. The Glulx variants use code from Roger Firth's JustEnoughGlulx.h. These parts are the magic stuff; what's on top is purely whistles and bells.

Text Variations allows varying output to be placed directly into a say line. Explanation is easiest by example:

	say "You flip the coin. [one of]Heads[or]Tails[purely at random]."
	say "[one of]The phone rings[or]The phone rings a second time[or]The phone rings again[stopping]."
	say "You turn the light switch [one of]off[or]on[cycling]. Nothing happens."
	say "The newspaper headline is: [one of]War Casualties[or]Terrorists[or]Banks[sticky random] [one of]Continue To Expand[or]Lose Out[sticky random]."
	say "The light changes randomly again; now it's [one of]green[or]amber[or]red[at random]."

Note the last two examples are not random: "sticky random" will make a random choice on first printing and stick to it, and "at random" will each time choose any entry except the last one printed.

You should be aware that the history of a say statement is kept track of based on the text within it, so an "off[or]on" somewhere will conflict with an "off[or]on" somewhere else. This has disadvantages (the light switch example above would be no good as part of a kind description, for instance). There are some advantages too:

	say "'Sorry, mate, this is the train from [one of]Edgware[or]Paddington[or]Baker Street[at random] to [one of]Edgware[or]Paddington[or]Baker Street[at random].'"

...will never say "the train from Edgware to Edgware".

However, should you need to distinguish between identical say phrases, use the [tip buffer <n>] substitution. This causes the number n to be added into the "score" of the text substitution; so by putting different tip numbers into different say phrases they will be considered to be different.

Finally: you can get at information of what's been printed using two phrases. The most useful is

	the index of the last buffer

which will return the index score of whatever the last substitution was. This will be a number corresponding to which choice was printed last, from 1 to n, except if the choice was "purely at random", in which case it will always return zero. So for example:

	say "A [one of]black cab[or]bus[at random] pulls up at the kerb.";
	if the index of the last buffer is 1, move the taxi to the location; otherwise move the bus to the location.

If you need to dig up the result of a old substitution (say to read off the state of a light bulb, though this is a terrible way to solve that kind of problem), you can achieve this by reprinting the options phrase exactly (including tip buffers as required) but leaving off the last bracket; and then referring to "the index of the buffer". Note this will not cause any text to be printed. So for example:
	
	say "You reach for the shelf";
	say "[one of]off[or]on"; 
	if the index of the buffer is 1, say " but it's too dark to see!" instead;
	say ", plainly lit by the bulb in the centre of the room.".

Note, you shouldn't use "the index of the last buffer" here, as it won't finish off the substitution line correctly.

Finally, the Glulx code provides two useful functions in I6: Stream_To_Array(array_name) and _Unstream. These perform equivalent functions to I6's @output_stream 3 array_name and @output_stream -3.

Example: * Radio Daze - A radio that scrolls through dialogue.

	"Radio Daze"

	Include Text Variations by Jon Ingold.

	The Living Room is a room. "A long couch, set up so you can see your wireless set. Not that you need to see it, of course."

	The long couch is an enterable scenery supporter in the living room. Instead of entering the long couch when the radio was switched off, say "Better turn the radio on before you get comfortable." Report entering the couch: say "You settle yourself down to listen." instead. Instead of listening when the radio is switched on, stop the action.

	The radio is a device in the living room. The radio is switched off. "[if switched on]The radio burbles on[otherwise]The radio is off[end if]." Check switching off the radio when the player is on the long couch: say "You can't reach the radio from here."

	Every turn when the radio is switched on:
		say "[one of]Two characters in the radio play have begun an argument[or]The argument continues[or]The play continues[stopping]: [one of]'Did not!'[or]'Did too!'[or]'Did I?'[or]'You did!'[or]'I couldn't have, Martha!'[or]'But you did, Tom!'[cycling]"

	Test me with "sit on couch/turn on radio/sit on couch/listen/listen/listen/listen/listen/g".


Example: ** Hamlet as IF - Making a kind with a varying strings as part of its properties, but that remembers different states for different instances of that kind.

	"Hamlet as IF"

	Include Text Variations by Jon Ingold.

	Colour is a kind of value. The colours are red, green, blue, purple, black, white, yellow.

Each button will produce a randomly selected method of assassination. The "sticky random" ending will ensure that these don't change every time the room description is printed. However, each button will be different because of the inclusion of the "tip buffer" inside the varying block. The number to tip the buffer (called "offset") is unique (hopefully) to each button.

	A button is a kind of thing. "The [colour] button would unleash [one of]a swarm of killer bees[or]a grizzly bear[or]the deadly Mintenka virus[or]jets of flame[or]a murder of scorpions[tip buffer offset][sticky random]." A button has a colour. Understand the colour property as referring to a button. 

However, when pushing a button, we want the game to scroll through options regardless of which button we choose. Here we don't use a tip buffer call.

	Instead of pushing a button, say "[one of]That would do it. One push - and he would be dead.[or]But would it be right? Would that be honest?[or]But what if you're wrong? What if it's not the right thing to do?[or]You can't bring yourself to do it.[stopping]". A button has a number called offset.

We must set up tip buffers at the start. They can be random, or simply numbered 1 to 7. The advantage of randomness is, if you introduce another button, you do not need to extend this loop at all. Furthermore, should any buttons end up with the same offset, that will merely cause two buttons to have the same description, which will not manifest as a bug.

	When play begins:
		repeat with item running through buttons begin;
			change the offset of the item to a random number from 1 to 100;
		end repeat.

	The Retribution Room is a room. In the Retribution Room is a red button, a green button, a blue button, a purple button, a black button, a white button and a yellow button.





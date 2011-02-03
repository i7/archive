Version 2 of Numerical Inflection by Aaron Reed begins here.

"A short extension to Plurality by Emily Short that extendes the [numerical is-are] concept to work for inflecting verbs that appear after a list to the correct form. Technical wizardry courtesy of Erik Temple."

[Release 2 fixes some bugs caught by Erik Temple.]

Include Plurality by Emily Short.

To say numerical s: (- if (say__n == 1) print "s"; else print ""; -) 

To say -s: say numerical s.

To say numerical es: (- if (say__n == 1) print "es"; else print ""; -) 

To say -es: say numerical es.

To say numerical ies: (- if (say__n == 1) print "ies"; else print "y"; -) 

To say -ies: say numerical ies.

To say -is-are: say numerical is-are.


Include (- 
[ WriteListR o depth from_start partition_classes partition_class_sizes cl memb index k2 l m no_classes q groups_to_do current_lt; 
	if (o == nothing) { 
		say__n = 0; ! Here we set the plurality variable... 
		return; ! An empty list: no output 
	} 
	if (from_start) { 
		o = c_iterator(o, depth, 0, COALESCE_ITF); ! Coalesce list and choose new start 
	 } 
	o = c_iterator(o, depth, 0, SEEK_ITF); ! Find first entry in list from o 
	if (o == nothing) {
		say__n = 0;
		return;
	} 
	! Count index = length of list 
	for (memb=o, index=0: memb: memb=c_iterator(memb, depth, lt_value, ADVANCE_ITF)) index++; 
	if (c_style & ISARE_BIT ~= 0) { 
		if (index == 1 && o hasnt pluralname) print (string) IS3__TX; 
		else print (string) ARE3__TX; 
		if (c_style & NEWLINE_BIT ~= 0) print ":^"; 
		else print (char) ' '; 
		c_style = c_style - ISARE_BIT; 
	} 
	partition_classes = RequisitionStack(index/WORDSIZE + 2); 
	partition_class_sizes = RequisitionStack(index/WORDSIZE + 2); 
	if ((partition_classes == 0) || (partition_class_sizes == 0)) return RunTimeProblem(RTP_LISTWRITERMEMORY); 
	 no_classes = PartitionList(o, index, depth, partition_classes, partition_class_sizes); 
	 groups_to_do = NumberOfGroupsInList(o, no_classes, depth, partition_classes, 
partition_class_sizes); 
	for (cl=1, memb=o, index=0, current_lt=0: groups_to_do>0: cl++) { 
		! Set memb to first object of partition class cl 
		while (partition_classes->index ~= cl) { 
			index++;
			memb=c_iterator(memb, depth, lt_value, ADVANCE_ITF); 
			if (memb==0) {
				print "*** Error in list-writer ***^"; break;
			} 
		} 
	 	#Ifdef DBLW; 
			 ! DebugPartition(partition_class_sizes, partition_classes, o, depth); 
			 print "^[Class ", cl, " of ", no_classes, ": first object ", memb, " (", memb.list_together, "); groups_to_do ", groups_to_do, ", current_lt=", current_lt, " listing_size=", listing_size, "]^"; 
		#Endif; 
		if ((memb.list_together == lt_value) || (~~(memb.list_together ofclass Routine or String))) current_lt = 0; 
		else { 
			if (memb.list_together == current_lt) continue; 
			! Otherwise this class begins a new group 
		 	@push listing_size; 
		 	q = memb; listing_size = 1; l = index; m = cl; 
			while (m < no_classes && q.list_together == memb.list_together) { 
				m++; 
				while (partition_classes->l ~= m) { 
					l++; q = c_iterator(q, depth, lt_value, ADVANCE_ITF); 
				} 
				if (q.list_together == memb.list_together) listing_size++; 
			} 
			if (listing_size > 1) { 
				! The new group contains more than one partition class 
				WriteMultiClassGroup(cl, memb, depth, partition_class_sizes); 
				current_lt = memb.list_together; 
				jump GroupComplete; 
			} 
			current_lt = 0; 
			@pull listing_size; 
		} 
		WriteSingleClassGroup(cl, memb, depth, partition_class_sizes->cl); 
		.GroupComplete; 
		groups_to_do--; 
		if (c_style & ENGLISH_BIT ~= 0) { 
			if (groups_to_do == 1) { 
				if (cl <= 1) print (string) LISTAND2__TX; 
				else print (string) LISTAND__TX; 
			} 
			if (groups_to_do > 1) print (string) COMMA__TX; 
		} 
	} 
	FreeStack(partition_class_sizes); 
	FreeStack(partition_classes); 
	say__n = index + 1; ! Here we set the plurality variable... 
]; ! end of WriteListR 
-) instead of "Write List Recursively" in "ListWriter.i6t". 

Include (- 
Global MarkedObjectArray = 0; 
Global MarkedObjectLength = 0; 
[ WriteListOfMarkedObjects style 
	obj common_parent first mixed_parentage length; 
	objectloop (obj ofclass Object && obj has workflag2) { 
		length++; 
		if (first == nothing) { first = obj; common_parent = parent(obj); } 
		else {
			if (parent(obj) ~= common_parent) mixed_parentage = true;
		} 
	} 
	if (mixed_parentage) common_parent = nothing; 
	if (length == 0) { 
		print (string) NOTHING__TX; 
		say__n = 1; ! Here we set the plurality variable to 1, because we have   printed the text "nothing" 
	} 
	else { 
		@push MarkedObjectArray; @push MarkedObjectLength; 
		MarkedObjectArray = RequisitionStack(length); 
		MarkedObjectLength = length; 
		if (MarkedObjectArray == 0) return RunTimeProblem(RTP_LISTWRITERMEMORY); 
		if (common_parent) { 
			ObjectTreeCoalesce(child(common_parent)); 
			length = 0; 
			objectloop (obj in common_parent) ! object tree order 
				if (obj has workflag2) MarkedObjectArray-->length++ = obj; 
		} else { 
			length = 0; 
			objectloop (obj ofclass Object) ! object number order 
				if (obj has workflag2) MarkedObjectArray-->length++ = obj; 
		} 
		WriteListFrom(first, style, 0, false, MarkedListIterator); 
		FreeStack(MarkedObjectArray); 
		@pull MarkedObjectLength; @pull MarkedObjectArray; 
	} 
	return; 
]; 
-) instead of "WriteListOfMarkedObjects" in "ListWriter.i6t". 

Include (- 
[ WriteListFrom first style depth noactivity iter a ol; 
	@push c_iterator; @push c_style; @push c_depth; @push c_margin; 
	if (iter) c_iterator = iter; else c_iterator = ObjectTreeIterator; 
	c_style = style; c_depth = depth; 
	c_margin = 0;
	if (style & EXTRAINDENT_BIT) c_margin = 1; 
	objectloop (a ofclass Object) { 
		give a list_filter_permits; 
		if ((list_filter_routine) && (list_filter_routine(a) == false)) 
			give a ~list_filter_permits; 
	} 
	first = c_iterator(first, depth, 0, START_ITF); 
	if (first == nothing) { 
		print (string) NOTHING__TX; 
		say__n = 1; ! Here we set the plurality variable to 1, because we have   printed the text "nothing" 
		if (style & NEWLINE_BIT ~= 0) new_line; 
	} else { 
		if ((noactivity) || (iter)) { 
			WriteListR(first, c_depth, true); 
			say__p = 1; 
		} else { 
			objectloop (ol provides list_together) ol.list_together = 0; 
			CarryOutActivity(LISTING_CONTENTS_ACT, parent(first));
		} 
	} 
	@pull c_margin; @pull c_depth; @pull c_style; @pull c_iterator; 
]; 
-) instead of "WriteListFrom" in "ListWriter.i6t". 

Include (- 
[ LIST_OF_TY_Say list format no_items v i bk;
	 if ((list==0) || (BlkType(list) ~= LIST_OF_TY)) return; 
	 no_items = BlkValueRead(list, LIST_LENGTH_F); 
	 bk = BlkValueRead(list, LIST_ITEM_KOV_F); 
	 ! print "kov=", bk, ":"; 
	 if (format == 1) print "{"; 
	 for (i=0:i<no_items:i++) { 
		v = BlkValueRead(list, i+LIST_ITEM_BASE); 
		switch (format) { 
			2: print (the) v; 
			3: print (a) v; 
			default: 
				if (bk == LIST_OF_TY) LIST_OF_TY_Say(v, 1); 
				else if ((bk == TEXT_TY or INDEXED_TEXT_TY) && (format == 1)) { 
					print "~"; PrintKindValuePair(bk, v); print "~"; 
				} 
				else PrintKindValuePair(bk, v); 
		} 
		if (i<no_items-2) print ", "; 
		if (i==no_items-2) { 
			if (format == 1) print ", "; else { 
				#ifdef SERIAL_COMMA; print ","; #endif; 
				print (string) LISTAND2__TX; 
			} 
		} 
	 } 
	 if (format == 1) print "}"; 
	 say__n = no_items; ! Here we set the plurality variable... 
]; 
-) instead of "Printing" in "Lists.i6t". 

[The I6 extracts are fairly long, but my only changes to the library code   
are the addition of the final lines of each routine: 
        say__n = index + 1; 
                and 
        say__n = no_items; 
These set the plurality variable so that we can make use of it in our   
tokens (we could also use it to get the length of the last list printed,   
if we wanted to write a little decision phrase to do that.) ]

Numerical Inflection ends here.

---- DOCUMENTATION ----

A short extension to Plurality by Emily Short that extendes the numerical is-are concept to work for inflecting verbs that appear after a list. Technical wizardry courtesy of Erik Temple.

Just as Plurality allows you to write something like:

	say "You can see [the number of things on the pedestal] thing[s] resting on the pedestal."

...and also:

	say "[The list of things on the pedestal] [numerical is-are] resting on the pedestal."

You can now also inflect verbs based on the number of items in a list, as follows:

	say "[The list of things on the pedestal] rest[numerical s] on the pedestal."

Which might produce:

	"The golden toothbrush rests on the pedestal."
	"The golden toothbrush and the silver comb rest on the pedestal."

The same alternate forms are provided as with Plurality:

	say "[The list of portable unheld things] fl[numerical ies] into the air as gravity is disengaged!"
	say "[The list of mentally challenging things] tax[numerical es] your imagination."

To make these forms a little less awkward, abbreviations are also provided, even for the existing form in Plurality:

	say "[The list of portable unheld things] fl[-ies] into the air as gravity is disengaged!"
	say "[The list of mentally challenging things] tax[-es] your imagination."
	say "[The list of things on the pedestal] [-is-are] resting on the marble pedestal."

Example: * Desert

	*: "Desert"

	Include Numerical Inflection by Aaron Reed.

	The Desert is a room. A plant is a kind of thing. A cactus and a patch of sagebrush are plants in Desert. A cow skull is in Desert. A thing is usually undescribed. The player holds a candy bar wrapper.

	Definition: a thing is other if it is not the player and it is not a plant. 

	After looking: say "[A list of plants in location] grow[-s] from the sandy soil; also nearby [a list of other things in location] tr[-ies] mightily to engage your interest."

	Test me with "look / get sagebrush / look / drop candy wrapper / look".
	

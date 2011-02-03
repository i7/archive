Unknown Word Error by Neil Cerutti begins here.

"Provides Infocom-style parser messages such as 'I don't know the word 'kludge'.'"

Include (-
[ FindUnknownWordToken wordnum 
 w twn numwds;
#ifdef TARGET_GLULX;
 numwds = parse-->0;
#ifnot;
 numwds = parse->1;
#endif; ! TARGET_GLULX;
 ! Throw out invalid word numbers
 if (wordnum <= 0 || wordnum > numwds) rfalse;
 twn=wn; ! save the value of wn so it can be restored
 wn=wordnum;
 while (1)
 { w=NextWordStopped();
   if (w == -1) { wn=twn; rfalse; }
   if (w == 0 && TryNumber(wn-1) == -1000) 
   { wordnum=wn-1;
     wn=twn;
     return wordnum; 
   }
 }
];
-)

Include (-
[ PrintToken wordnum 
 k l m numwds;
#ifdef TARGET_GLULX;
 numwds = parse-->0;
#ifnot;
 numwds = parse->1;
#endif; ! TARGET_GLULX;
 if (wordnum <= 0 || wordnum > numwds) return;
 k=WordAddress(wordnum); 
 l=WordLength(wordnum); 
 for (m=0: m < l: m++) 
   print (char) k->m; 
];
-)

Include (-
[ DontKnowError 
 wordnum;
 wordnum=FindUnknownWordToken(2);
 if (wordnum ~= 0)
 { print "I don't know the word ~"; 
   PrintToken(wordnum);
   "~."; 
 } 
 else rfalse; 
];
-)

To say dunno:
	(-
return DontKnowError();
-)

Rule for printing a parser error when the parser error is can't see any such thing (this is the don't know that word rule):
	say dunno instead. 

Unknown Word Error ends here.

---- DOCUMENTATION ----

This is a wrapper of Neil Cerutti's Dunno extension for Inform 6:  

	Dunno - A Libary Extension by Neil Cerutti (cerutti@together.net)
	Version 1.0 - 25 Jun 1999
		Initial release
	Version 1.1 - 2 Apr 2001
		Modified by Andrew Plotkin for Glulx compatibility.

If, for some reason, you always wanted the Infocom-style error messages that say:

	I don't know the word "kludge".

instead of the generic message:

	You can't see any such thing.

which is the default in Inform 7.

To get this behavior, simply include this extension in your story.

Example: * Ignorance is Bliss - A brief test of this extension.
	
	*: "Ignorance is Bliss"

	Include Unknown Word Error by Neil Cerutti.

	The Conference Chamber is a room. In the Conference Chamber is a table. On the table is a treaty.

	Test me with "examine non-proliferation treaty".


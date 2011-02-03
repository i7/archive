Version 5 of String Buffers by Jesse McGrew begins here.

"Gives objects the ability to store messages which can be manipulated with more flexibility than regular text values."

Chapter 1 - Main part (I7)

Section 1 - 'Use' definitions

Use tiny string buffer translates as (- Constant STRING_BUFFER_SIZE = 50; -).
Use small string buffer translates as (- Constant STRING_BUFFER_SIZE = 150; -).
Use medium string buffer translates as (- Constant STRING_BUFFER_SIZE = 500; -).
Use large string buffer translates as (- Constant STRING_BUFFER_SIZE = 2000; -).
Use huge string buffer translates as (- Constant STRING_BUFFER_SIZE = 5000; -).
Use ridiculously huge string buffer translates as (- Constant STRING_BUFFER_SIZE = 10000; -).
Use Bill O'Reilly's ego string buffer translates as (- Constant STRING_BUFFER_SIZE = 15000; -).

Use tiny temporary string buffer translates as (- Constant STRING_TEMP_BUFFER_SIZE = 50; -).
Use small temporary string buffer translates as (- Constant STRING_TEMP_BUFFER_SIZE = 150; -).
Use medium temporary string buffer translates as (- Constant STRING_TEMP_BUFFER_SIZE = 500; -).
Use maximum temporary string buffer translates as (- Constant STRING_TEMP_BUFFER_SIZE = STRING_BUFFER_SIZE; -).

Section 2 - Buffered things

A buffered thing is a kind of thing. [X is buffered means that X is a buffered thing. X is always buffered means that X is a kind of buffered thing.]

Definition: a thing is unbuffered if it is not a buffered thing.

A buffered thing has text called initial message. The initial message of a buffered thing is usually "".

A buffered thing has a number called buffer shares. The buffer shares of a buffered thing is usually 1.
[X has Y buffer shares means that the buffer shares of X is Y.
X has Y buffer share means that the buffer shares of X is Y.
X gets Y buffer shares means that the buffer shares of X is Y.
X gets Y buffer share means that the buffer shares of X is Y.]

Section 2a - Buffered things - unindexed

A buffered thing has a number called buffer offset. A buffered thing has a number called buffer allocation.

Section 2b - Buffered things (continued)

To decide which number is the maximum message length of (x - a buffered thing):
	decide on the buffer allocation of x.

Allocating string buffer space is an activity.

When play begins: carry out the allocating string buffer space activity;

Rule for allocating string buffer space (this is the standard string buffer space allocation rule):
	repeat with board running through buffered things begin;
		if the buffer allocation of board is not 0, change the buffer shares of board to 0;
	end repeat;
	let RS be the total buffer shares of all buffered things; [remaining shares]
	if RS is not 0 begin;
		let RB be the total string buffer space; [remaining bytes]
		let the next offset be 0;
		repeat with board running through buffered things begin;
			if the buffer allocation of board is 0 or the buffer allocation of board is greater than RB begin;
				let CS be the buffer shares of board; [current shares]
				let X be (RB * CS) / RS;
				[say "*** allocating [X] bytes to [the board] ([CS] shares)[line break]";]
				change the buffer allocation of board to X;
			otherwise;
				let X be the buffer allocation of board;
			end if;
			change the buffer offset of board to the next offset;
			increase the next offset by X;
			decrease RS by CS;
			decrease RB by X;
		end repeat;
	end if.

After allocating string buffer space (this is the standard initial message assignment rule):
	repeat with x running through buffered things begin;
		if the initial message of x is not "", change the message of x to the initial message of x;
	end repeat.

Definition: a buffered thing is blank if the message length of it is 0.
Definition: a buffered thing is nonblank if it is not blank.

Section 3 - Labeled things

A labeled thing is a kind of buffered thing. A labeled thing can be hiding its label or showing its label. A labeled thing is usually showing its label.

[Initial label means initial message.]

Include (- with parse_name LabeledThingParseName, -) when defining a labeled thing.

Before printing the name of a nonblank labeled thing (called Todd) which is showing its label (this is the standard name labeling rule), say "[the message of Todd] ".

Before printing the plural name of a nonblank labeled thing (called Todd) which is showing its label (this is the standard plural name labeling rule), say "[the message of Todd] ".

Section 4 - Parsing quoted text

To decide which topic is quoted text: (- QTWrapper -).

After reading a command:
	if the player's command includes quoted text
	begin;
		internally save quoted text;
		replace the matched text with "__qt__";
	end if;

Understand "__qt__" as "[quoted text]".

Section 4a - Parser error handling - unindexed

The QT overflow is a number variable. After reading a command: change the QT overflow to 0. [It will be set to 1 by QuotedText if the quoted text is too long or isn't terminated.]

Rule for printing a parser error when parser error is didn't understand and QT overflow is 1 (this is the standard quoted text parser error rule): say "I didn't understand that sentence. If you are entering a quoted message, remember to keep it short and include a final quotation mark."

Section 5 - Testing - Not for release

Showing the buffer of is an action out of world, applying to one thing. Understand "showbuf [any things]" as showing the buffer of.

To say bufferedness of (obj - thing):
	if obj is a labeled thing begin;
		say "labeled";
	otherwise if obj is a buffered thing;
		say "buffered";
	otherwise;
		say "unbuffered";
	end if.

Carry out showing the buffer of:
	[BUGFIX: >SHOWBUF ALL causes the noun to be 0]
	if the noun is not a thing begin; say "You can't do that."; stop the action; end if;
	say "[the noun] ([bufferedness of the noun][if the noun is a blank buffered thing], blank[end if])[line break]";
	if the noun is a buffered thing begin;
		say "  buffer allocation: [buffer allocation of the noun][line break]";
		say "  initial message: '[the initial message of the noun]'[line break]";
		say "  message: '[the message of the noun]'[line break]";
		say "  message length: [the message length of the noun][line break]";
		if the noun is a labeled thing begin;
			say "  showing its label: [if the noun is showing its label]yes[otherwise]no[end if][line break]";
		end if;
	end if;

Showing buffer stats is an action out of world, applying to nothing. Understand "showbuf" as showing buffer stats.

Carry out showing buffer stats:
	say "Total buffer space: [total string buffer space] byte[s][line break]";
	repeat with x running through buffered things begin;
		say "  [x]: [buffer allocation of x] allocated, [message length of x] used[line break]";
	end repeat.

Chapter 2 - Hook Phrases (I7/I6)

The start of quoted text and the end of quoted text are numbers that vary.

To decide which number is length of the quoted text:
	[BUGFIX: we need to use a temporary variable for the "decide on" to generate correct code]
	let X be the end of quoted text minus the start of quoted text;
	decide on X;

To decide which number is message length of (x - a buffered thing):
	(- (BufferedMsgLength({x})) -)

To say message of (x - a buffered thing):
	(- PrintBufferedMsg({x}, ""); -)

To say message of (x - a buffered thing) or (alternate - text):
	(- PrintBufferedMsg({x}, {alternate}); -)

To decide which number is total string buffer space:
	(- (STRING_BUFFER_SIZE) -)

To treat (S - snippet) as quoted text:
	(- SnippetToQuotedTextTemp({S}); -)

To copy the quoted text to (x - a buffered thing):
	(- QuotedTextTempToBuffer({x}); -)

To erase the message of (x - a buffered thing):
	(- EraseBufferedMsg({x}); -)

To change the message of (x - a buffered thing) to (message - text):
	(- SetBufferedMsg({x}, {message}); -)

[XXX]
To append (message - text) to the message of (x - a buffered thing):
	(- CatBufferedMsg({x}, {message}); -)

[XXX]
To append (n - number) to the message of (x - a buffered thing):
	(- NCatBufferedMsg({x}, {n}); -)

[XXX]
To append char (c - number) to the message of (x - a buffered thing):
	(- ChCatBufferedMsg({x}, {c}); -)

To change the message of (x - a buffered thing) to upper case:
	(- UCaseBuffer({x}); -)

To change the message of (x - a buffered thing) to lower case:
	(- LCaseBuffer({x}); -)

To change the message of (x - a buffered thing) to title case:
	(- TCaseBuffer({x}); -)

To change the message of (x - a buffered thing) to sentence case:
	(- SCaseBuffer({x}); -)

To copy the message of (x - a buffered thing) to (y - a buffered thing):
	(- CopyBufferedMsg({x}, {y}); -)

To decide whether (x - a buffered thing) has the same message as (y - a buffered thing):
	(- (SameMsg({x},{y})) -)

To decide whether the message of (x - a buffered thing) is (message - text):
	(- (CheckBufferedMsg({x}, {message})) -)

To capitalize words in the message of (x - a buffered thing) using (t - a table-name):
	(- CapMsgWords({x},{t}); -)

Chapter 2a - Hook phrases - unindexed

To say the message of (x - a buffered thing): say message of x.
To say the message of (x - a buffered thing) or (alternate - text): say message of x or alternate.
To internally save quoted text:
	(- QuotedTextToTemp(); -)


Chapter 3 - Inform 6 code - unindexed

Include (-

Default STRING_BUFFER_SIZE 150;
Default STRING_TEMP_BUFFER_SIZE 150;

Array string_buffer -> STRING_BUFFER_SIZE;
Array string_temp_buffer -> (STRING_TEMP_BUFFER_SIZE+WORDSIZE);

! mostly the same as the DM4 version, but reports overflow errors and accepts single quotes as well as double
[ QuotedText   start_wn qchar x;
!print "[top wn=", wn, "]^";
   start_wn = wn;
   (+start of quoted text+) = WordAddress(start_wn);
   ! 39 is apostrophe
   if ((+start of quoted text+)->0 ~= '"' or 39) return GPR_FAIL;
   qchar=(+start of quoted text+)->0;
   (+start of quoted text+)++;
   do {
!print "[wn=", wn, ", parse->1=", parse->1, "]";
      ! wn>=16 is a kludge to prevent reading off the end of the parse buffer with long text containing spaces
      if (wn>=16 || (x=NextWordStopped()) == -1) { (+QT overflow+)=1; return GPR_FAIL; }
!print "[x=", x, "]";
      (+end of quoted text+) = WordAddress(wn-1) + WordLength(wn-1) - 1;
   } until ((+end of quoted text+) >= (+start of quoted text+) && (+end of quoted text+)->0 == qchar);
   (+end of quoted text+)--;
!print "[returning]^";
   return GPR_PREPOSITION;
];

[ QTWrapper range_from range_words wnc rv;
  wn = range_from; wnc = wn;
  rv = QuotedText();
  if (rv==GPR_FAIL) { wn = wnc; return rv; }
  if ((range_words==0)||(wn-range_from==range_words)) return rv;
  return GPR_FAIL;
];

[ QuotedTextToTemp i len;
  if ((+start of quoted text+)<0) "[*** Programming error: no quoted text to save (it was converted from a topic). ***]";
!print "[copying from ", (+start of quoted text+), " to ", (+end of quoted text+), "]^";
  for ( i=(+start of quoted text+), len=0:i<=(+end of quoted text+):i++,len++ )
    string_temp_buffer->(len+WORDSIZE) = i->0;
  string_temp_buffer-->0 = len;
!print "[copied ", len, " bytes to temp]^";
];

[ SnippetToQuotedTextTemp snippet w1 w2 p i;
  ! BUGFIX: as of 3M43, "the player's command" isn't correctly updated
  ! after replacing a snippet, so we'll try to detect that
!  if (snippet==I7_command) snippet = 100 + parse->1;
  w1=snippet/100; w2=w1+snippet%100-1;
  w1=WordAddress(w1);
  w2=WordAddress(w2) + WordLength(w2);
  for ( i=0,p=w1:p<w2:p++,i++ )
    string_temp_buffer->(i+WORDSIZE) = p->0;
  string_temp_buffer-->0 = w2-w1;
  (+start of quoted text+)=-1;
  (+end of quoted text+)=string_temp_buffer-->0 - 1;
  if ((+end of quoted text+)<(+start of quoted text+))
    (+end of quoted text+)=(+start of quoted text+);
!print "[copied ", string_temp_buffer-->0, " bytes to temp (topic)]^";
];

[ QuotedTextTempToBuffer obj  buf maxlen i;
  buf=string_buffer + obj.(+buffer offset+);
  maxlen=obj.(+buffer allocation+);
!print "[copying ", string_temp_buffer-->0, " bytes to offset ", obj.(+buffer offset+), ", maxlen ", maxlen, "]^";
  for ( i=0:i<string_temp_buffer-->0 && i<maxlen:i++ )
    buf->i = string_temp_buffer->(i+WORDSIZE);
  for ( :i<maxlen:i++ ) buf->i=0;
];

[ PrintWriteBuf buf maxlen  i f;
   !print "[", buf, "]";
   for ( i=0:i<maxlen:i++ )
      if (buf->i ~= ' ' or 0) { f=1; break; }
   if (f==0) rfalse;
   for ( i=0:i<maxlen:i++ ) {
      f=buf->i;
      if (f~=0) print (char) f;
   }
   rtrue;
];

[ BufferedMsgLength obj  i count o maxlen;
   o=obj.(+buffer offset+);
   maxlen=obj.(+buffer allocation+);
   for ( i=0,count=0:i<maxlen:i++ )
      if (string_buffer->(o+i)~=0) count++;
   return count;
];

[ PrintBufferedMsg obj alt  o maxlen;
   o=obj.(+buffer offset+);
   maxlen=obj.(+buffer allocation+);
   if (PrintWriteBuf(string_buffer +o, maxlen)==0)
      print (string) alt;
];

[ EraseBufferedMsg obj  o maxlen i;
   o=obj.(+buffer offset+);
   maxlen=obj.(+buffer allocation+);
   for ( i=o:i<o+maxlen:i++ )
      string_buffer->i=0;
];

[ LabeledThingParseName  i j k point len flag;
   if (parser_action==##TheSame) {
!      print "[##TheSame]^";
      if (SameMsg(parser_one, parser_two)) return -1;
      return -2;
   }
   for ( ::i++ ) {
      j=NextWordStopped(); flag=0;
!      print "[NextWordStopped returned ", j, "]^";
      if (j==-1) return i;
!      if (j~=0) print "[that is, ", (address) j, "]^";
      if (WordInName(j, self)) {
!         print "['", (address)j, "' is in the board's name]^";
         flag=1;
         if (j->#dict_par1 & 4) {
            !print "[got plural]^";
            parser_action=##PluralFound;
         }
      }
      else if (j=='blank' && BufferedMsgLength(self)==0) flag=1;
      if (flag==0 && BufferedMsgLength(self)~=0) {
         !wn--;
         !if (wn > WordCount()) { wn++; rfalse; }   ! really need this?
         point=WordAddress(wn-1); len=WordLength(wn-1);
!         print "[wn-1=", wn-1, ", point=", point, ", len=", len, "]^";
         if (self.(+buffer allocation+) < len)
            len=self.(+buffer allocation+);
         if (len==0) return i;
         if (len>0) {
            k = string_buffer + self.(+buffer offset+);
            !print "[comparing message: len=", len, ", k=", k, "...]^";
            for ( j=0:j<len:j++ ) {
               if (k->j ~= point->j) {
                  !print "k->j == ", k, "->", j, "==", k->j, "^";
!                  print "[message differs at character ", j, ": ", k->j, " != ", point->j, "]^";
                  return i;
               }
!               print "[j=", j, "]";
            }
         }
!         print "[matched]^";
         flag=1;
      }
      if (flag==0) return i;
   }
];

[ WordInName word obj  p i;
   p=obj.&name;
   for ( i=0:i<obj.#name/WORDSIZE:i++ )
      if (p-->i==word) rtrue;
   rfalse;
];

[ SameMsg obj1 obj2  i offset1 offset2 maxlen;
   offset1=obj1.(+buffer offset+);
   offset2=obj2.(+buffer offset+);
   maxlen=obj1.(+buffer allocation+);
   if (obj2.(+buffer allocation+) < maxlen)
      maxlen=obj2.(+buffer allocation+);
   for ( i=0:i<maxlen:i++ )
      if (string_buffer->(offset1+i)~= string_buffer->(offset2+i))
         rfalse;
   rtrue;
];

[ CopyBufferedMsg obj1 obj2  i p1 p2 maxlen zerolen;
   p1=string_buffer + obj1.(+buffer offset+);
   p2=string_buffer + obj2.(+buffer offset+);
   maxlen=obj1.(+buffer allocation+);
   zerolen=obj2.(+buffer allocation+);
   if (zerolen < maxlen)
      maxlen=zerolen;
   for ( i=0:i<maxlen:i++ )
      p2->i=p1->i;
   for ( i=maxlen:i<zerolen:i++ )
      p2->i=0;
];

[ CheckTempSize  i;
   if (string_temp_buffer-->0 > STRING_TEMP_BUFFER_SIZE) {
      print "[*** Programming error: the temporary string buffer is too small. At least ";
      print string_temp_buffer-->0;
      print " characters are required. ***]^";
      KeyCharPrimitive();
   }
];

[ SetBufferedMsg board str  p maxlen copylen i;
   @push say__p;
   PrintToBuffer(string_temp_buffer, STRING_TEMP_BUFFER_SIZE, str);
   @pull say__p;
   CheckTempSize();
   maxlen=board.(+buffer allocation+);
   p=string_buffer + board.(+buffer offset+);
   if (string_temp_buffer-->0 < maxlen)
      copylen=string_temp_buffer-->0;
   else
      copylen=maxlen;
   for ( i=0:i<copylen:i++ )
      p->i=string_temp_buffer->(i+WORDSIZE);
   for ( i=copylen:i<maxlen:i++ )
      p->i=0;
];

[ CheckBufferedMsg board str  maxlen p i;
   @push say__p;
   PrintToBuffer(string_temp_buffer, STRING_TEMP_BUFFER_SIZE, str);
   @pull say__p;
   CheckTempSize();
   maxlen=board.(+buffer allocation+);
   p=string_buffer + board.(+buffer offset+);
   if (maxlen<string_temp_buffer-->0) rfalse;
   for ( i=0:i<string_temp_buffer-->0:i++ )
      if (string_temp_buffer-->(i+WORDSIZE) ~= p->i) rfalse;
   rtrue;
];
-).

Include (-
[ UCaseBuffer board  maxlen p i;
   maxlen=board.(+buffer allocation+);
   p=string_buffer + board.(+buffer offset+);
   for ( i=0:i<maxlen:i++ )
      p->i=UpperCase(p->i);
];

[ LCaseBuffer board  maxlen p i;
   maxlen=board.(+buffer allocation+);
   p=string_buffer + board.(+buffer offset+);
   for ( i=0:i<maxlen:i++ )
      p->i=LowerCase(p->i);
];

[ TCaseBuffer board  maxlen p i cap;
   cap=1;
   maxlen=board.(+buffer allocation+);
   p=string_buffer + board.(+buffer offset+);
   for ( i=0:i<maxlen:i++ ) {
      if (cap) p->i=UpperCase(p->i); else p->i=LowerCase(p->i);
      if (p->i==' ' or '.' or '?' or '!' or '-') cap=1; else cap=0;
   }
];

[ SCaseBuffer board  maxlen p i cap;
   cap=1;
   maxlen=board.(+buffer allocation+);
   p=string_buffer + board.(+buffer offset+);
   for ( i=0:i<maxlen:i++ ) {
      if (cap) p->i=UpperCase(p->i); else p->i=LowerCase(p->i);
      if (p->i=='.' or '?' or '!') cap=1; else if (p->i~=' ') cap=0;
   }
];

![ DumpDict dict dictend  i;
!  while (dict < dictend) {
!    i=dict-->0;
!    print "[", i, ":]";
!    dict=dict+WORDSIZE;
!    while ( i-- ) print (char) (dict++)->0;
!    print "^";
!  }
!];

[ CapMsgWords board table  p;
   ! first, let's print all the capitalized words into a temporary buffer
   p=CMWFillTempBuf(table);
!print "[CMWFillTempBuf returned ", p, "]^";
   if (p==0) rfalse;
!DumpDict(p, string_temp_buffer + STRING_TEMP_BUFFER_SIZE + WORDSIZE);
   ! now go through the board's message capitalizing words
   return CMWApply(
      string_buffer + board.(+buffer offset+), board.(+buffer allocation+),
      p, string_temp_buffer + STRING_TEMP_BUFFER_SIZE + WORDSIZE);
];

[ CMWFillTempBuf table  rows p i j;
   rows=TableRows(table);
   p=string_temp_buffer + STRING_TEMP_BUFFER_SIZE + WORDSIZE;
!print "[top, looping ", rows, " times]^"; @read_char 1 i;
   for ( i=1:i<=TableRows(table):i++ ) {
      ! put it at the beginning of the buffer
      j=TableLookUpEntry(table, 1, i);
      @push say__p;
      PrintToBuffer(string_temp_buffer, STRING_TEMP_BUFFER_SIZE, j);
      @pull say__p;
      CheckTempSize();
      ! now copy it to its place at the end
!print "[length=", string_temp_buffer-->0, "]^"; @read_char 1 j;
      p=p-string_temp_buffer-->0;
      if (p<string_temp_buffer) { print "[*** Programming error: the temporary string buffer is too small to capitalize this many words. ***]^"; rfalse; }
      for ( j=string_temp_buffer-->0 - 1:j>=0:j-- )
         p->j=string_temp_buffer->(j+WORDSIZE);
      ! prefix it with its length
      p=p-WORDSIZE;
      if (p<string_temp_buffer) { print "[*** Programming error: the temporary string buffer is too small to capitalize this many words. ***]^"; rfalse; }
      p-->0=string_temp_buffer-->0;
   }
   return p;
];

! this is probably the least efficient possible way to do it...
[ CMWApply msg msglen dict dictend  od wl i j brk;
   od=dict;
   brk=1;
!print "[msglen=", msglen, ", msg->0=", msg->0, "]^";
   for ( i=0:i<msglen && msg->i~=0:i=i+wl ) {
!print "[i=", i, "]";
      if (brk) {
!print "[checking at ", i, "]^";
         for (dict=od:dict<dictend:dict=dict+wl) {
            ! get the word length and advance past it
            wl=dict-->0; dict=dict+WORDSIZE;
            if (strncasecmp(msg+i, dict, wl)==0) {
!print "[match at i=", i, ", dict=", dict, "]^";
               ! copy this word in
               for ( j=i:j<i+wl:j++ )
                  msg->j=dict->(j-i);
               jump advancemsg;
            }
         }
      }
      ! not found
      wl=1;
      .advancemsg;
      ! 39 is apostrophe
      brk=(msg->(i+wl-1)==' ' or '.' or ',' or '-' or ':' or ';' or '?' or '!' or 39 or '(' or ')');
!print "[ch=", msg->(i+wl), " ''", (char) msg->(i+wl), "', brk=", brk, "]";
   }
   rtrue;
];

[ strncasecmp s1 s2 len  i c1 c2;
   for ( i=0:i<len:i++ ) {
      c1=s1->i;
      c2=s2->i;
!print "'", (char) c1, "'<=>'", (char) c2, "'^";

      if (c1==0) { if (c2==0) return 0; else return 1; }
      else if (c2==0) return -1;

      c1=UpperCase(c1)-UpperCase(c2);
      if (c1~=0) return c1;
   }
   return 0;
];

-)

String Buffers ends here.

---- DOCUMENTATION ----

This extension allows objects to have short messages attached, which can be changed dynamically or copied from user input. The messages can be printed, copied between objects, recapitalized, cleared, and compared.

BUFFERED THINGS

The "buffered thing" kind is a type of object that can hold a message. We can create an object to hold some text like so:

	The name tag is a buffered thing. The initial message is "John Doe".

We can check whether the object currently holds text by asking if it is "blank" or "nonblank", and we can find out how much by checking its "message length". It can only hold a limited about of text, the "maximum message length" of the object. To increase this amount, we can increase the object's "buffer shares" property from the default of 1, which will give the object more space at the expense of every other buffered object. If there is only one buffered object, or if we need more space for all of them, we can request a bigger buffer:

	Use huge string buffer.

The possible sizes are tiny (50 characters), small (150), medium (500), large (2000), huge (5000), ridiculously huge (10,000), and Bill O'Reilly's ego (15,000). The default is small.

We can also change the size of the temporary string buffer, which is used internally for a few things: capturing the player's quoted text, comparing and setting objects' messages with the phrase below, and capitalizing from a table of words. The possible sizes are tiny/small/medium (same values as above) and maximum (whatever the string buffer size is set to), with a default of small. We probably won't need to change this unless a runtime error messsage tells us the temporary buffer is too small.

If for some reason we want to change the way the total buffer space is divided up among objects, or the way objects' messages are initialized, we can write rules for the "allocating string buffer space" activity.

LABELED THINGS

If we want to use the message as part of the object's name, we can make it a "labeled thing", which is a kind of buffered thing. A labeled thing normally prints its message (without quotes) in front of its name; this is called "showing its label", and the opposite is "hiding its label". The player can refer to a labeled thing by its message, as well as any other parts of its name.

PHRASES FOR MESSAGES

Once we have a message in an object, we can display it (the second form lets us show an alternate message in case the object is blank):

	say the message of the name tag;
	say the message of the name tag or "Anonymous";

We can clear or change it:

	erase the message of the name tag;
	change the message of the name tag to "John";

We can even change the message to some text containing substitutions, and the substitutions will be applied immediately.

We can capitalize the message:

	change the message of the name tag to upper case;

We can also change it to lower case, title case (Every Word Is Capitalized), and sentence case (Words after. Certain punctuation? Are capitalized!).

We can compare and copy messages (note that comparisons are case sensitive):

	if the message of the name tag is "John", ...
	if the name tag has the same message as the road sign, ...
	copy the message of the name tag to the road sign;

Finally, if we'd like to capitalize some words specially, we can make a table and use another phrase:

	capitalize words in the newspaper using Table of Capitalized Words;

	Table of Capitalized Words
	word
	"ACLU"
	"GmbH"
	"Nebraska"
	"iPod"

UNDERSTANDING QUOTED TEXT

The messages in our object don't have to come from our own source code; the player can enter new messages too. (When we let the player change the message of a labeled thing, we can let him distinguish objects that would otherwise be identical, as in Graham Nelson's "Balances".)

To set this up, we have to add a verb using the "[quoted text]" token:

	Writing on is an action with past participle written, applying to one thing. Understand "write [quoted text] on [something]" as writing on. Check writing on: say "You can't write on that." instead.

In the rules for writing on something, we use the phrase "copy the quoted text to" to store the player's text in a buffered object.

	Instead of writing on the name tag:
		if the length of the quoted text is greater than 0
		begin;
			copy the quoted text to the name tag;
			say "Hello there, [message of the name tag].";
			rule succeeds;
		end if;
		say "How will anyone know who you are if it's blank?"

UNDERSTANDING TOPICS AS QUOTED TEXT

If we also want to let the player type a message without quotes, we can make a verb that accepts a topic and redirect it to the quoted text version.

	Writing the topic on is an action applying to one topic and one thing. Understand "write [text] on [something]" as writing the topic on.

	Check writing the topic on:
		treat the topic understood as quoted text;
		if the length of the quoted text is 0, say "You must specify something to write." instead;
		try writing on the second noun instead.

We can use this technique to treat any snippet expression, like "the player's command" or "the matched text", as quoted text in order to copy it into a buffered object. (See the "Boring!" example below for one possible use.)

DEBUGGING VERBS

"showbuf" - Shows general statistics about the string buffer usage of the whole game: the total buffer size, the name of every buffered object, and the amount of buffer space allocated to and used by each one.

"showbuf [any thing]" - Shows statistics about the buffer usage of a particular object.

Example: ** Notebook - An example of an object containing several messages.
	
	"Notebook"
	
	Include String Buffers by Jesse McGrew. Use medium string buffer.

	Solitary Confinement is a room. "You can't even remember what you did to get locked up in here. After all these years, the outside world barely even exists any more. You're alone with these four walls, your thoughts, and your notebook."
	
	The player carries a notebook. Understand "note" or "book" as the notebook.
	
	A page is a kind of buffered thing. A page has a number called page number. The page number of a page is usually 0. The description of a page is "Page [page number of the item described]: '[message of the item described]'".
	
	Definition: a page is filled if it is not blank.
	
	Ten pages are part of the notebook.
	
	The description of the notebook is "[if all pages which are part of the notebook are blank]It's a fresh notebook, ready for your use.[end if][if all pages which are part of the notebook are filled]Every page is full of your notes.[end if][if a filled page is part of the notebook and a blank page is part of the notebook]There's still room to write some more.[end if]"
	
	Writing on is an action with past participle written, applying to one thing. Understand "write [quoted text] in/on [something]" as writing on. Check writing on: say "Vandalism won't help you here." instead.
	
	Quoteless writing is an action applying to one topic. Understand "write [text]" as quoteless writing. Check quoteless writing: say "To write something, enclose it in quotation marks." instead.
	
	Instead of writing on the notebook:
		repeat with x running through blank pages which are part of the notebook
		begin;
			copy the quoted text to x;
			change the message of x to sentence case;
			if the page number of x is 0, change the page number of x to the number of nonblank pages which are part of the notebook;
			say "Noted.";
			rule succeeds;
		end repeat;
		say "All the pages are full."
	
	After examining the notebook:
		repeat with x running through nonblank pages which are part of the notebook
		begin;
			try examining x;
		end repeat.
	
	Test me with "write 'monday. ant crawled under the door. i ate it.' / write 'tues. worm crawled under the door.' / write 'he wanted the ant back. i ate him.' / write 'weds. couldn't sleep. bird kept knocking on door.' / read notebook"

Example: ** Boring! - Traveling down a hallway when the parser has no patience for performing the same command twice in a row.

	"Boring!"
	
	Include String Buffers by Jesse McGrew.
	
	Previous command and current command are buffered things.
	
	After reading a command:

Since we do a literal text comparison, we must translate the command into a standard form to prevent players from simply rephrasing a rejected command. For simplicity's sake, we'll only handle motion here, and only for the cardinal directions.

		if the player's command includes "n", replace the matched text with "north";
		if the player's command includes "s", replace the matched text with "south";
		if the player's command includes "e", replace the matched text with "east";
		if the player's command includes "w", replace the matched text with "west";
		if the player's command includes "go", cut the matched text;

Now that the command has been massaged into the form we want, we can start using it as quoted text.

		treat the player's command as quoted text;
		copy the quoted text to the current command;
		if the current command has the same message as the previous command
		begin;
			say "Boring! We just did that. Let's do something else.";
			reject the player's command;
		end if;
		copy the message of the current command to the previous command.

	Southern End is a room. "This hallway continues to the north." Middle is north of Southern End. "This hallway continues to the north and south, with a little nook to the east." Nook is east of Middle. "This is just a pit stop on your hallway travels, little bigger than a cranny. The hallway is off to the west." Northern End is north of Middle. "This hallway continues to the south."
	
	Test me with "north / north / east / west / north".

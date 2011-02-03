Version 12/091223 of Default Messages by David Fisher begins here.

"Enables the standard messages printed by the Inform library
to be replaced with custom messages."

Part 1 - Definitions

Section 1.1 - Library Message values

Library message id is a kind of value.
The library message ids are defined by the table of library messages.

The library-message-id is a library message id that varies.

Library message debug is a thing. Library message debug can be dbg_on or dbg_off.

Section 1.2 - Defaults

Library message debug is dbg_off.

Table of custom library messages
Message Id			Message Text
library message id		text

Section 1.3 - Altering messages

When play begins:
   init library messages;
   add the custom library messages.

To add the custom library messages:
   repeat through the table of custom library messages begin;
      set message id entry to the message text entry;
   end repeat.

To set (id_ - library message id) to (msg_ - text):
   update the row with id of id_ to msg_.

[ perform a binary search to quickly find the message id
  (table is guaranteed to be sorted) ]

To update the row with id of (id_ - library message id) to (msg_ - text):
   let n1 be 1;
   let n2 be the number of rows in the table of library messages;
   while n1 <= n2 begin;
      let mid_ be n1 plus n2;
	  change mid_ to mid_ divided by 2;
	  choose row mid_ in the table of library messages;
	  if the message id entry is id_ begin;
                 change the message text entry to msg_;
                 change n1 to n2 + 1;   [ to force the loop to stop ]
	  end if;
	  if the message id entry < id_, change n1 to mid_ plus 1;
      if the message id entry > id_, change n2 to mid_ minus 1;
   end while.

Part 2 - Messages

Table of library messages
Message Id						Message Text
LibMsg <you have died>					"~"
LibMsg <you have won>					"~"
LibMsg <player self description>			"~"
LibMsg <unimportant object>				"~"
LibMsg <empty line>					"~"
LibMsg <confirm Quit>					"~"
LibMsg <yes or no prompt>				"~"
LibMsg <restrict answer>				"~"
LibMsg <page prompt>					"~"
LibMsg <menu prompt>					"~"
LibMsg <comment recorded>				"~"
LibMsg <comment not recorded>				"~"
LibMsg <undo succeeded>					"~"
LibMsg <undo failed>					"~"
LibMsg <undo not provided>				"~"
LibMsg <cannot undo nothing>				"~"
LibMsg <cannot undo twice in a row>			"~"
LibMsg <undo forbidden>					"~"
LibMsg <oops failed>					"~"
LibMsg <oops too many arguments>			"~"
LibMsg <oops no arguments>				"~"
LibMsg <cannot do again>				"~"
LibMsg <again usage>					"~"
LibMsg <command not understood>			"~"
LibMsg <command partly understood>			"~"
LibMsg <command badly ended>				"~"
LibMsg <command incomplete>				"~"
LibMsg <command cut short>				"~"
LibMsg <number not understood>			"~"
LibMsg <cannot begin at comma>			"~"
LibMsg <extra words before comma>			"~"
LibMsg <unknown object>					"~"
LibMsg <object not held>				"~"
LibMsg <unknown verb>					"~"
LibMsg <verb cannot have inanimate object>	"~"
LibMsg <noun needed>					"~"
LibMsg <noun not needed>				"~"
LibMsg <object needed>					"~"
LibMsg <object not needed>				"~"
LibMsg <second object needed>				"~"
LibMsg <second object not needed>			"~"
LibMsg <second noun needed>				"~"
LibMsg <second noun not needed>			"~"
LibMsg <something more substantial needed>	"~"
LibMsg <verb cannot have multiple objects>	"~"
LibMsg <too many multiple objects>			"~"
LibMsg <not that many available>			"~"
LibMsg <no objects available>				"~"
LibMsg <zero multiple objects>			"~"
LibMsg <first N objects>				"~"
LibMsg <excepted object not included anyway>	"~"
LibMsg <report implicit take>				"~"
LibMsg <report npc implicit take>			"~"
LibMsg <use holdall to avoid exceeding carrying capacity>	"~"
LibMsg <cannot put if this exceeds carrying capacity>		"~"
LibMsg <who disambiguation>				"~"
LibMsg <which disambiguation>				"~"
LibMsg <whom disambiguation>				"~"
LibMsg <what disambiguation>				"~"
LibMsg <single object disambiguation>		"~"
LibMsg <pronoun not set>				"~"
LibMsg <pronoun absent>					"~"
LibMsg <Pronouns initial text>			"~"
LibMsg <Pronouns -means- text>			"~"
LibMsg <Pronouns -unset- text>			"~"
LibMsg <no pronouns known>				"~"
LibMsg <person ignores command>			"~"
LibMsg <cannot talk to absent person>		"~"
LibMsg <cannot talk to inanimate object>		"~"
LibMsg <npc unable to do that>			"~"
LibMsg <confirm Restart>				"~"
LibMsg <Restart failed>					"~"
LibMsg <Restore failed>					"~"
LibMsg <Restore succeeded>				"~"
LibMsg <Save failed>					"~"
LibMsg <Save succeeded>					"~"
LibMsg <Verify succeeded>				"~"
LibMsg <Verify failed>					"~"
LibMsg <transcript already on>			"~"
LibMsg <transcript already off>			"~"
LibMsg <start of transcript>				"~"
LibMsg <end of transcript>				"~"
LibMsg <transcript failed>				"~"
LibMsg <end transcript failed>			"~"
LibMsg <Score command>					"~"
LibMsg <score changed>					"~"
LibMsg <score notification turned on>		"~"
LibMsg <score notification turned off>		"~"
LibMsg <no scoring>					"~"
LibMsg <score rank>					"~"
LibMsg <report npc taking inventory>		"~"
LibMsg <Inventory initial text>			"~"
LibMsg <Inventory no possessions>			"~"
LibMsg <entering darkness>				"~"
LibMsg <dark description>				"~"
LibMsg <examine while dark>				"~"
LibMsg <search while dark>				"~"
LibMsg <look under while dark>			"~"
LibMsg <dark room name>					"~"
LibMsg <report player taking>				"~"
LibMsg <report npc taking>				"~"
LibMsg <cannot take yourself>				"~"
LibMsg <cannot take other people>			"~"
LibMsg <cannot take something you are within>	"~"
LibMsg <cannot take something already taken>	"~"
LibMsg <cannot take possessions of others>	"~"
LibMsg <cannot take component parts>		"~"
LibMsg <cannot take hidden parts>			"~"
LibMsg <cannot reach within closed containers>	"~"
LibMsg <cannot take scenery>				"~"
LibMsg <cannot take something fixed>		"~"
LibMsg <cannot reach within other places>		"~"
LibMsg <cannot exceed carrying capacity>		"~"
LibMsg <report player removing>			"~"
LibMsg <report npc removing>				"~"
LibMsg <cannot remove from closed containers>	"~"
LibMsg <cannot remove something not within>	"~"
LibMsg <report player dropping>			"~"
LibMsg <report npc dropping>				"~"
LibMsg <cannot drop something already dropped>	"~"
LibMsg <cannot drop not holding>			"~"
LibMsg <cannot drop if this exceeds carrying capacity>	"~"
LibMsg <cannot drop clothes being worn>		"~"
LibMsg <report player inserting>			"~"
LibMsg <report npc inserting>				"~"
LibMsg <cannot insert something not held>		"~"
LibMsg <cannot insert into something not a container>		"~"
LibMsg <cannot insert into closed containers>	"~"
LibMsg <need to take off before inserting>	"~"
LibMsg <cannot insert something into itself>	"~"
LibMsg <cannot insert if this exceeds carrying capacity>	"~"
LibMsg <cannot insert clothes being worn>		"~"
LibMsg <report player putting on>			"~"
LibMsg <report npc putting on>			"~"
LibMsg <cannot put something not held>		"~"
LibMsg <cannot put something on it-self>		"~"
LibMsg <cannot put onto something not a supporter>	"~"
LibMsg <cannot put onto something being carried>	"~"
LibMsg <cannot put clothes being worn>		"~"
LibMsg <report player giving>				"~"
LibMsg <report npc giving to player>		"~"
LibMsg <report npc giving to npc>			"~"
LibMsg <cannot give what you have not got>	"~"
LibMsg <cannot give to yourself>			"~"
LibMsg <block giving>					"~"
LibMsg <unable to receive things>			"~"
LibMsg <cannot show what you have not got>	"~"
LibMsg <block showing>					"~"
LibMsg <report player entering>			"~"
LibMsg <report npc entering>				"~"
LibMsg <cannot enter something already entered>	"~"
LibMsg <cannot enter something not enterable>	"~"
LibMsg <cannot enter closed containers>		"~"
LibMsg <cannot enter something carried>		"~"
LibMsg <implicitly pass outwards through other barriers>	"~"
LibMsg <implicitly pass inwards through other barriers>	"~"
LibMsg <report player exiting>			"~"
LibMsg <report npc exiting>				"~"
LibMsg <cannot exit when not within anything>	"~"
LibMsg <cannot exit closed containers>		"~"
LibMsg <cannot get off things>			"~"
LibMsg <cannot exit thing not within>		"~"
LibMsg <cannot go that way>				"~"
LibMsg <cannot travel in something not a vehicle>	"~"
LibMsg <cannot go through concealed doors>	"~"
LibMsg <cannot go up through closed doors>	"~"
LibMsg <cannot go down through closed doors>	"~"
LibMsg <cannot go through closed doors>		"~"
LibMsg <nothing through door>				"~"
LibMsg <block vaguely going>				"~"
LibMsg <say npc goes>					"~"
LibMsg <say npc arrives>				"~"
LibMsg <say npc arrives from unknown direction>	"~"
LibMsg <say npc arrives at>				"~"
LibMsg <say npc goes through>				"~"
LibMsg <say npc arrives from>				"~"
LibMsg <say npc vehicle>				"~"
LibMsg <say npc pushing in front with player>	"~"
LibMsg <say npc pushing in front>			"~"
LibMsg <say npc pushing away>				"~"
LibMsg <say npc pushing in>				"~"
LibMsg <say npc taking player along>		"~"
LibMsg <brief look mode>				"~"
LibMsg <superbrief look mode>				"~"
LibMsg <verbose look mode>				"~"
LibMsg <report npc looking>				"~"
LibMsg <top line what on>				"~"
LibMsg <top line what in>				"~"
LibMsg <top line what as>				"~"
LibMsg <say things within>				"~"
LibMsg <say things also within>			"~"
LibMsg <say things on>					"~"
LibMsg <report npc examining>				"~"
LibMsg <examine undescribed things>			"~"
LibMsg <examine direction>				"~"
LibMsg <examine devices>				"~"
LibMsg <examine in darkness>				"~"
LibMsg <report npc searching>				"~"
LibMsg <cannot search unless container or supporter>	"~"
LibMsg <cannot search closed opaque containers>		"~"
LibMsg <nothing found within container>		"~"
LibMsg <nothing found on top of>			"~"
LibMsg <search in darkness>				"~"
LibMsg <report npc looking under>			"~"
LibMsg <look under>					"~"
LibMsg <look under in darkness>			"~"
LibMsg <report player opening>			"~"
LibMsg <report npc opening>				"~"
LibMsg <report unseen npc opening>			"~"
LibMsg <cannot open unless openable>		"~"
LibMsg <cannot open something locked>		"~"
LibMsg <cannot open something already open>	"~"
LibMsg <reveal any newly visible exterior initial text>	"~"
LibMsg <no newly visible exterior>			"~"
LibMsg <report player closing>			"~"
LibMsg <report npc closing>				"~"
LibMsg <report unseen npc closing>			"~"
LibMsg <cannot close unless openable>		"~"
LibMsg <cannot close something already closed>	"~"
LibMsg <report player locking>			"~"
LibMsg <report npc locking>				"~"
LibMsg <cannot lock without a lock>			"~"
LibMsg <cannot lock something already locked>	"~"
LibMsg <cannot lock something open>			"~"
LibMsg <cannot lock without the correct key>	"~"
LibMsg <report player unlocking>			"~"
LibMsg <report npc unlocking>				"~"
LibMsg <cannot unlock without a lock>		"~"
LibMsg <cannot unlock something already unlocked>	"~"
LibMsg <cannot unlock without the correct key>		"~"
LibMsg <report player switching on>			"~"
LibMsg <report npc switching on>			"~"
LibMsg <cannot switch on unless switchable>	"~"
LibMsg <cannot switch on something already on>	"~"
LibMsg <report player switching off>		"~"
LibMsg <report npc switching off>			"~"
LibMsg <cannot switch off unless switchable>	"~"
LibMsg <cannot switch off something already off>	"~"
LibMsg <report player wearing>			"~"
LibMsg <report npc wearing>				"~"
LibMsg <cannot wear something not clothing>	"~"
LibMsg <cannot wear not holding>			"~"
LibMsg <cannot wear something already worn>	"~"
LibMsg <report player taking off>			"~"
LibMsg <report npc taking off>			"~"
LibMsg <cannot take off something not worn>	"~"
LibMsg <report player eating>				"~"
LibMsg <report npc eating>				"~"
LibMsg <cannot eat unless edible>			"~"
LibMsg <block drinking>					"~"
LibMsg <block tasting>					"~"
LibMsg <block smelling>					"~"
LibMsg <block listening>				"~"
LibMsg <report player touching things>		"~"
LibMsg <report npc touching things>			"~"
LibMsg <report player touching self>		"~"
LibMsg <report npc touching self>			"~"
LibMsg <report player touching other people>	"~"
LibMsg <report npc touching other people>		"~"
LibMsg <block saying yes>				"~"
LibMsg <block saying no>				"~"
LibMsg <block saying sorry>				"~"
LibMsg <block swearing obscenely>			"~"
LibMsg <block swearing mildly>			"~"
LibMsg <block climbing>					"~"
LibMsg <block jumping>					"~"
LibMsg <block swinging>					"~"
LibMsg <block waving hands>				"~"
LibMsg <block attacking>				"~"
LibMsg <block burning>					"~"
LibMsg <block cutting>					"~"
LibMsg <block rubbing>					"~"
LibMsg <block setting to>				"~"
LibMsg <block tying>					"~"
LibMsg <report player waving things>		"~"
LibMsg <report npc waving things>			"~"
LibMsg <cannot wave something not held>		"~"
LibMsg <squeezing people>				"~"
LibMsg <report player squeezing>			"~"
LibMsg <report npc squeezing>				"~"
LibMsg <block throwing at>				"~"
LibMsg <throw at inanimate object>			"~"
LibMsg <report player pushing>			"~"
LibMsg <report npc pushing>				"~"
LibMsg <report player pulling>			"~"
LibMsg <report npc pulling>				"~"
LibMsg <report player turning>			"~"
LibMsg <report npc turning>				"~"
LibMsg <block pushing in directions>		"~"
LibMsg <not pushed in a direction>			"~"
LibMsg <pushed in illegal direction>		"~"
LibMsg <cannot push something fixed in place>	"~"
LibMsg <cannot pull something fixed in place>	"~"
LibMsg <cannot turn something fixed in place>	"~"
LibMsg <cannot push scenery>				"~"
LibMsg <cannot pull scenery>				"~"
LibMsg <cannot turn scenery>				"~"
LibMsg <cannot push people>				"~"
LibMsg <cannot pull people>				"~"
LibMsg <cannot turn people>				"~"
LibMsg <block answering>				"~"
LibMsg <block asking>					"~"
LibMsg <block buying>					"~"
LibMsg <block kissing>					"~"
LibMsg <block singing>					"~"
LibMsg <block telling>					"~"
LibMsg <telling yourself>				"~"
LibMsg <block thinking>					"~"
LibMsg <block player consulting>			"~"
LibMsg <block npc consulting>				"~"
LibMsg <block sleeping>					"~"
LibMsg <block waking up>				"~"
LibMsg <block waking other>				"~"
LibMsg <report player waiting>			"~"
LibMsg <report npc waiting>				"~"

Part 3 - Implementation

[ perform a binary search to quickly find the message id in the
  table of library messages (assumes the table has been sorted) ]

This is the print library message rule:
   let n1 be 1;
   let n2 be the number of rows in the table of library messages;
   change libmsg_printed to 0;
   while n1 <= n2 begin;
      let mid be n1 plus n2;
	  change mid to mid divided by 2;
	  choose row mid in the table of library messages;
	  if the message id entry is library-message-id begin;
	     if the message text entry is not "~" begin;
                    if library message debug is dbg_on,
                       say "{[library-message-id] - custom}[line break]";
	        say the message text entry;
	        change libmsg_printed to 1;
                 otherwise;
                    if library message debug is dbg_on,
                       say "{[library-message-id]}[line break]";
	     end if;
	     change n1 to n2 + 1;	[ to force the loop to stop ]
	  end if;
	  if the message id entry < library-message-id, change n1 to mid plus 1;
      if the message id entry > library-message-id, change n2 to mid minus 1;
   end while.

libmsg_printed is a number that varies.
The main object is an object that varies.
The secondary object is an object that varies.

To decide whether noun is living:
   (- noun has animate -).

To decide whether noun is doing the action:
   (- noun == actor -).

To decide whether noun is not doing the action:
   (- noun ~= actor -).

To decide whether player is doing the action:
   (- actor == player -).

To decide whether player is not doing the action:
   (- actor ~= player -).

[ Some conventient abbreviations to prevent spurious line breaks
  from occurring in some messages ]

To say dot: say "/unicode 46/".
To say ExMark: say "/unicode 33/".
To say QMark: say "/unicode 63/".

[ These two are equivalent to [bracket] and [close bracket], but have been
  retained for compatibility with old versions of Custom Library Messages ]
To say LeftSqBr: say "/unicode 91/".
To say RightSqBr: say "/unicode 93/".

To say /n: say line break.
To say /p: say paragraph break.
To say /r: say run paragraph on.

Part 4 - Inform 6 interface - unindexed

To init library messages:
(- InitLibraryMessages(); -)

[
  The following I6 code (in InitLibraryMessages) does not compile under
  Glulx (it says "Illegal backpatch marker in forward-declared symbol").

  It was originally added in version 3 to prevent infinite
  recursion when pushing an object between rooms; the Standard Rules
  file says:

     Include (- with before [; PushDir: AllowPushDir(); rtrue; ]
     ... -) when defining a thing

  - which caused problems when defining the I7_LibraryMessages
  object, and so the code below removed all "befores" other than
  LibraryMessagesBefore.

  To make a long story short ... the original PushDir problem seems
  to have gone away, but I am still suspicious, so I'll leave it in
  when compiling to Z code.
]

Include (-
  Constant LibraryMessages = (+I7_LibraryMessages+);

[ InitLibraryMessages n;

#Ifndef TARGET_GLULX;
  if ((+I7_LibraryMessages+).&before)
  {
      ! get rid of any other "before" routines
      for (n = 0 : n < (+I7_LibraryMessages+).#before / WORDSIZE : n++)
      {
          if ((+I7_LibraryMessages+).&before --> n ~= LibraryMessagesBefore)
              (+I7_LibraryMessages+).&before --> n = nothing;
      }
  }
#Endif; ! TARGET_GLULX
];
-) after "Definitions.i6t"

I7_LibraryMessages is a thing.
Include (-
  with before LibraryMessagesBefore,
-) when defining I7_LibraryMessages.

Include (-
[ LibraryMessagesBefore id isImplicitAction;
  id = -1;
  (+main object+) = lm_o;
  (+secondary object+) = lm_o2;
-)

[ Note that there is no "Prompt:" section, since Inform 7 handles
  the prompt specially; see "Changing the command prompt" in the I7 manual ]

[*** Miscellany ***]

Include (-
Miscellany:
    switch (lm_n) {
       1: id = (+LibMsg <first N objects>+);
       2: id = (+LibMsg <zero multiple objects>+);
       3: id = (+LibMsg <you have died>+);
       4: id = (+LibMsg <you have won>+);
     ! 5 is "Would you like to restart ...", handled specially by Inform 7
       6: id = (+LibMsg <undo not provided>+);
       7: id = (+LibMsg <undo failed>+);
       8: id = (+LibMsg <restrict answer>+);
       9: id = (+LibMsg <entering darkness>+);
       10: id = (+LibMsg <empty line>+);
       11: id = (+LibMsg <cannot undo nothing>+);
       12: id = (+LibMsg <cannot undo twice in a row>+);
       13: id = (+LibMsg <undo succeeded>+);
       14: id = (+LibMsg <oops failed>+);
       15: id = (+LibMsg <oops no arguments>+);
       16: id = (+LibMsg <oops too many arguments>+);
       17: id = (+LibMsg <dark description>+);
       18: id = (+LibMsg <player self description>+);
     ! 19 was LibMsg <player description>
	 ! - use "The description of the player is ..." instead
       20: id = (+LibMsg <again usage>+);
       21: id = (+LibMsg <cannot do again>+);
       22: id = (+LibMsg <cannot begin at comma>+);
       23: id = (+LibMsg <cannot talk to absent person>+);
       24: id = (+LibMsg <cannot talk to inanimate object>+);
       25: id = (+LibMsg <extra words before comma>+);
       26: id = (+LibMsg <report implicit take>+);
       27: id = (+LibMsg <command not understood>+);
       28: id = (+LibMsg <command partly understood>+);
       29: id = (+LibMsg <number not understood>+);
       30: id = (+LibMsg <unknown object>+);
-)

Include (-
       31: id = (+LibMsg <command incomplete>+);
       32: id = (+LibMsg <object not held>+);
       33: id = (+LibMsg <verb cannot have multiple objects>+);
       34: id = (+LibMsg <too many multiple objects>+);
       35: id = (+LibMsg <pronoun not set>+);
       36: id = (+LibMsg <excepted object not included anyway>+);
       37: id = (+LibMsg <verb cannot have inanimate object>+);
       38: id = (+LibMsg <unknown verb>+);
       39: id = (+LibMsg <unimportant object>+);
       40: (+main object+) = pronoun_obj;
	       id = (+LibMsg <pronoun absent>+);
       41: id = (+LibMsg <command badly ended>+);
       42: id = (+LibMsg <not that many available>+);
       43: id = (+LibMsg <zero multiple objects>+); ! same as Miscellany #2 (?)
       44: id = (+LibMsg <no objects available>+);
       45: id = (+LibMsg <who disambiguation>+);
       46: id = (+LibMsg <which disambiguation>+);
       47: id = (+LibMsg <single object disambiguation>+);
       48: (+main object+) = actor;
	       id = (+LibMsg <whom disambiguation>+);
       49: (+main object+) = actor;
	       id = (+LibMsg <what disambiguation>+);
       50: id = (+LibMsg <score changed>+);
       51: id = (+LibMsg <command cut short>+);
       52: id = (+LibMsg <menu prompt>+);
       53: id = (+LibMsg <page prompt>+);
       54: id = (+LibMsg <comment recorded>+);
       55: id = (+LibMsg <comment not recorded>+);
     ! 56 = ".^"
     ! 57 = "?^"
       58: id = (+LibMsg <npc unable to do that>+);
       59: id = (+LibMsg <noun needed>+);
       60: id = (+LibMsg <noun not needed>+);
       61: id = (+LibMsg <object needed>+);
       62: id = (+LibMsg <object not needed>+);
       63: id = (+LibMsg <second object needed>+);
       64: id = (+LibMsg <second object not needed>+);
       65: id = (+LibMsg <second noun needed>+);
       66: id = (+LibMsg <second noun not needed>+);
       67: id = (+LibMsg <something more substantial needed>+);
       68: id = (+LibMsg <report npc implicit take>+);
       69: id = (+LibMsg <report implicit take>+);
       70: id = (+LibMsg <undo forbidden>+);
       71: id = (+LibMsg <dark room name>+);
       72: id = (+LibMsg <person ignores command>+);
    }
    jump end_part;
-)

[ The ListMiscellany rules ("providing light", etc) can be handled OK by Inform 7 ]

[*** Quit, Restart ***]

Include (-
Quit:
    switch (lm_n) {
       1: id = (+LibMsg <yes or no prompt>+);
       2: id = (+LibMsg <confirm Quit>+);
    }
    jump end_part;

Restart:
    switch (lm_n) {
       1: id = (+LibMsg <confirm Restart>+);
       2: id = (+LibMsg <Restart failed>+);
    }
    jump end_part;
-)

[*** File Operations ***]

Include (-

Restore:
    switch (lm_n) {
       1: id = (+LibMsg <Restore failed>+);
       2: id = (+LibMsg <Restore succeeded>+);
    }
    jump end_part;

Save:
    switch (lm_n) {
       1: id = (+LibMsg <Save failed>+);
       2: id = (+LibMsg <Save succeeded>+);
    }
    jump end_part;

Verify:
    switch (lm_n) {
       1: id = (+LibMsg <Verify succeeded>+);
       2: id = (+LibMsg <Verify failed>+);
    }
    jump end_part;
-)

[*** Transcripts ***]

Include (-
ScriptOn:
    switch (lm_n) {
       1: id = (+LibMsg <transcript already on>+);
       2: id = (+LibMsg <start of transcript>+);
       3: id = (+LibMsg <transcript failed>+);
    }
    jump end_part;

ScriptOff:
    switch (lm_n) {
       1: id = (+LibMsg <transcript already off>+);
       2: id = (+LibMsg <end of transcript>+);
       3: id = (+LibMsg <end transcript failed>+);
    }
    jump end_part;
-)

[*** Scoring ***]

Include (-
NotifyOn:
     id = (+LibMsg <score notification turned on>+);
    jump end_part;
 
NotifyOff:
     id = (+LibMsg <score notification turned off>+);
    jump end_part;
 
Score:
    switch (lm_n) {
       1: id = (+LibMsg <Score command>+);
       2: id = (+LibMsg <no scoring>+);
       3: id = (+LibMsg <score rank>+);
    }
    jump end_part;
 -)

[*** Listing ***]

Include (-
Pronouns:
    switch (lm_n) {
       1: id = (+LibMsg <Pronouns initial text>+);
       2: id = (+LibMsg <Pronouns -means- text>+);
       3: id = (+LibMsg <Pronouns -unset- text>+);
       4: id = (+LibMsg <no pronouns known>+);
    }
    jump end_part;

Inv:
    switch (lm_n) {
       1: id = (+LibMsg <Inventory no possessions>+);
       2: id = (+LibMsg <Inventory initial text>+);
     ! 3 is ":^" (used for list style NEWLINE_BIT)
     ! 4 is ".^" (used for list style ENGLISH_BIT)
       5: id = (+LibMsg <report npc taking inventory>+);
    }
    jump end_part;
-)

[*** Take, Remove ***]

Include (-
Take:
    switch (lm_n) {
       1: id = (+LibMsg <report player taking>+);
       2: id = (+LibMsg <cannot take yourself>+);
       3: id = (+LibMsg <cannot take other people>+);
       4: id = (+LibMsg <cannot take something you are within>+);
       5: id = (+LibMsg <cannot take something already taken>+);
       6: id = (+LibMsg <cannot take possessions of others>+);
       7: id = (+LibMsg <cannot take component parts>+);
       8: id = (+LibMsg <cannot take hidden parts>+);
       9: id = (+LibMsg <cannot reach within closed containers>+);
       10: id = (+LibMsg <cannot take scenery>+);
       11: id = (+LibMsg <cannot take something fixed>+);
       12: id = (+LibMsg <cannot exceed carrying capacity>+);
       13: id = (+LibMsg <use holdall to avoid exceeding carrying capacity>+);
           isImplicitAction = 1;
       14: id = (+LibMsg <cannot reach within other places>+);
     ! 15 doesn't seem to be produced anywhere ("You cannot carry ...")
       16: id = (+LibMsg <report npc taking>+);
    }
    jump end_part;

Remove:
    switch (lm_n)
    {  1: id = (+LibMsg <cannot remove from closed containers>+);
       2: id = (+LibMsg <cannot remove something not within>+);
       3: id = (+LibMsg <report player removing>+); ! TODO - not printed any more? ("Taken" instead)
    }
    jump end_part;
-)

[*** Drop, Insert, Put ***]

Include (-
Drop:
    switch (lm_n) {
       1: id = (+LibMsg <cannot drop something already dropped>+);
       2: id = (+LibMsg <cannot drop not holding>+);
       3: id = (+LibMsg <cannot drop clothes being worn>+);
           isImplicitAction = 1;
       4: id = (+LibMsg <report player dropping>+);
       5,6: id = (+LibMsg <cannot drop if this exceeds carrying capacity>+);   ! 5 = supporter, 6 = container
       7: id = (+LibMsg <report npc dropping>+);
    }
    jump end_part;

Insert:
    switch (lm_n) {
       1: id = (+LibMsg <cannot insert something not held>+);
       2: id = (+LibMsg <cannot insert into something not a container>+);
       3: id = (+LibMsg <cannot insert into closed containers>+);
       4: id = (+LibMsg <need to take off before inserting>+);   ! (unused ?)
       5: id = (+LibMsg <cannot insert something into itself>+);
       6: id = (+LibMsg <cannot insert clothes being worn>+);
           isImplicitAction = 1;
       7: id = (+LibMsg <cannot insert if this exceeds carrying capacity>+);
       8,9: id = (+LibMsg <report player inserting>+);  ! 8 is for multiple objects
       10: id = (+LibMsg <report npc inserting>+);
    }
    jump end_part;

PutOn:
    switch (lm_n) {
       1: id = (+LibMsg <cannot put something not held>+);
       2: id = (+LibMsg <cannot put something on it-self>+);
       3: id = (+LibMsg <cannot put onto something not a supporter>+);
       4: id = (+LibMsg <cannot put onto something being carried>+);
       5: id = (+LibMsg <cannot put clothes being worn>+);
           isImplicitAction = 1;
       6: id = (+LibMsg <cannot put if this exceeds carrying capacity>+);
      7,8: id = (+LibMsg <report player putting on>+);  ! 7 is for multiple objects
       9: id = (+LibMsg <report npc putting on>+);
    }
    jump end_part;
-)

[*** Give, Show ***]

Include (-
Give:
    switch (lm_n) {
       1: id = (+LibMsg <cannot give what you have not got>+);
       2: id = (+LibMsg <cannot give to yourself>+);
       3: id = (+LibMsg <block giving>+);
       4: id = (+LibMsg <unable to receive things>+);
       5: id = (+LibMsg <report player giving>+);
       6: id = (+LibMsg <report npc giving to player>+);  
       7: id = (+LibMsg <report npc giving to npc>+);
   }
    jump end_part;

Show:
    switch (lm_n) {
       1: id = (+LibMsg <cannot show what you have not got>+);
       2: id = (+LibMsg <block showing>+);
    }
    jump end_part;
-)

[*** Enter, Exit, GetOff ***]

Include (-
Enter:
    switch (lm_n) {
       1: id = (+LibMsg <cannot enter something already entered>+);
       2: id = (+LibMsg <cannot enter something not enterable>+);
       3: id = (+LibMsg <cannot enter closed containers>+);
       4: id = (+LibMsg <cannot enter something carried>+);
       5: id = (+LibMsg <report player entering>+);
       6: id = (+LibMsg <implicitly pass outwards through other barriers>+);
          isImplicitAction = 1;
       7: id = (+LibMsg <implicitly pass inwards through other barriers>+);
           isImplicitAction = 1;
       8,9: id = (+LibMsg <report npc entering>+);  ! 8 = container, 9 = supporter
    }
    jump end_part;

Exit:
    switch (lm_n) {
       1: id = (+LibMsg <cannot exit when not within anything>+);
       2: id = (+LibMsg <cannot exit closed containers>+);
       3: id = (+LibMsg <report player exiting>+);
       4: id = (+LibMsg <cannot exit thing not within>+);
       5,6: id = (+LibMsg <report npc exiting>+);
    }
    jump end_part;

GetOff:
    id = (+LibMsg <cannot get off things>+);
    jump end_part;
-)

[*** Go ***]

Include (-
Go:
    switch (lm_n) {
       1: id = (+LibMsg <cannot travel in something not a vehicle>+);
       2: id = (+LibMsg <cannot go that way>+);
          (+main object+) = noun;   ! the direction
       3: id = (+LibMsg <cannot go up through closed doors>+);
       4: id = (+LibMsg <cannot go down through closed doors>+);
       5: id = (+LibMsg <cannot go through closed doors>+);
       6: id = (+LibMsg <nothing through door>+);
       7: id = (+LibMsg <block vaguely going>+);
       8: id = (+LibMsg <say npc goes>+);
         (+main object+) = (+ up +);
       9: id = (+LibMsg <say npc goes>+);
         (+main object+) = (+ down +);
       10: id = (+LibMsg <say npc goes>+);
       11: id = (+LibMsg <say npc arrives>+);
         (+main object+) = (+ up +);
       12:  id = (+LibMsg <say npc arrives>+);
         (+main object+) = (+ down +);
       13:  id = (+LibMsg <say npc arrives>+);
       14: id = (+LibMsg <say npc arrives from unknown direction>+);
       15: id = (+LibMsg <say npc arrives at>+);
         (+secondary object+) = (+ up +);
       16: id = (+LibMsg <say npc arrives at>+);
         (+secondary object+) = (+ down +);
       17: id = (+LibMsg <say npc arrives at>+);
          ! secondary object already defined
       18: id = (+LibMsg <say npc goes through>+);
       19: id = (+LibMsg <say npc arrives from>+);
       20,21: id = (+LibMsg <say npc vehicle>+);
       22: id = (+LibMsg <say npc pushing in front with player>+);
       23: id = (+LibMsg <say npc pushing in front>+);
       24: id = (+LibMsg <say npc pushing away>+);
       25: id = (+LibMsg <say npc pushing in>+);
       26: id = (+LibMsg <say npc taking player along>+);
    }
    jump end_part;
-)

[*** Verbosity Level ***]

Include (-
LMode1:
    id = (+LibMsg <brief look mode>+);
    jump end_part;

LMode2:
    id = (+LibMsg <verbose look mode>+);
    jump end_part;

LMode3:
    id = (+LibMsg <superbrief look mode>+);
    jump end_part;
-)

[*** Look ***]

Include (-
Look:
    switch (lm_n) {
       1: id = (+LibMsg <top line what on>+);
       2: id = (+LibMsg <top line what in>+);
       3: id = (+LibMsg <top line what as>+);
       4: id = (+LibMsg <say things on>+);
       5: id = (+LibMsg <say things also within>+);
       6: id = (+LibMsg <say things within>+);
       8: if (lm_o has supporter) id = (+LibMsg <top line what on>+);
          else id = (+LibMsg <top line what in>+);
       9: id = (+LibMsg <report npc looking>+);
    }
    jump end_part;
-)

[*** Examine, Search, LookUnder ***]

Include (-
Examine:
    switch (lm_n) {
       1: id = (+LibMsg <examine while dark>+);
       2: id = (+LibMsg <examine undescribed things>+);
       3: id = (+LibMsg <examine devices>+);
       4: id = (+LibMsg <report npc examining>+);
       5: id = (+LibMsg <examine direction>+);
    }
    jump end_part;

Search:
    switch (lm_n) {
       1: id = (+LibMsg <search while dark>+);
       2: id = (+LibMsg <nothing found on top of>+);
     ! 3 prints what is on a supporter; use I6 default behaviour
       4: id = (+LibMsg <cannot search unless container or supporter>+);
       5: id = (+LibMsg <cannot search closed opaque containers>+);
       6: id = (+LibMsg <nothing found within container>+);
     ! 7 prints the contents of a container; use I6 default behaviour
       8: id = (+LibMsg <report npc searching>+);
    }
    jump end_part;

LookUnder:
   switch (lm_n) {
       1: id = (+LibMsg <look under while dark>+);
       2: id = (+LibMsg <look under>+);
       3: id = (+LibMsg <report npc looking under>+);
    }
    jump end_part;
-)

[*** Open, Close, Lock, Unlock ***]

Include (-
Open:
    switch (lm_n) {
       1: id = (+LibMsg <cannot open unless openable>+);
       2: id = (+LibMsg <cannot open something locked>+);
       3: id = (+LibMsg <cannot open something already open>+);
       4: id = -2; ! reveal any newly visible exterior
       5: id = (+LibMsg <report player opening>+);
       6: id = (+LibMsg <report npc opening>+);
       7: id = (+LibMsg <report unseen npc opening>+);
    }
    jump end_part;

Close:
    switch (lm_n) {
       1: id = (+LibMsg <cannot close unless openable>+);
       2: id = (+LibMsg <cannot close something already closed>+);
       3: id = (+LibMsg <report player closing>+);
       4: id = (+LibMsg <report npc closing>+);
       5: id = (+LibMsg <report unseen npc closing>+);
    }
    jump end_part;

Lock:
    switch (lm_n) {
       1: id = (+LibMsg <cannot lock without a lock>+);
       2: id = (+LibMsg <cannot lock something already locked>+);
       3: id = (+LibMsg <cannot lock something open>+);
       4: id = (+LibMsg <cannot lock without the correct key>+);
       5: id = (+LibMsg <report player locking>+);
       6: id = (+LibMsg <report npc locking>+);
    }
    jump end_part;

Unlock:
    switch (lm_n) {
       1: id = (+LibMsg <cannot unlock without a lock>+);
       2: id = (+LibMsg <cannot unlock something already unlocked>+);
       3: id = (+LibMsg <cannot unlock without the correct key>+);
       4: id = (+LibMsg <report player unlocking>+);
       5: id = (+LibMsg <report npc unlocking>+);
    }
    jump end_part;
-)

[*** Switch On / Off ***]

Include (-
SwitchOn:
    switch (lm_n) {
       1: id = (+LibMsg <cannot switch on unless switchable>+);
       2: id = (+LibMsg <cannot switch on something already on>+);
       3: id = (+LibMsg <report player switching on>+);
       4: id = (+LibMsg <report npc switching on>+);
    }
    jump end_part;

SwitchOff:
    switch (lm_n) {
       1: id = (+LibMsg <cannot switch off unless switchable>+);
       2: id = (+LibMsg <cannot switch off something already off>+);
       3: id = (+LibMsg <report player switching off>+);
       4: id = (+LibMsg <report npc switching off>+);
    }
    jump end_part;
-)

[*** Wear, Disrobe ***]

Include (-
Wear:
    switch (lm_n) {
       1: id = (+LibMsg <cannot wear something not clothing>+);
       2: id = (+LibMsg <cannot wear not holding>+);
       3: id = (+LibMsg <cannot wear something already worn>+);
       4: id = (+LibMsg <report player wearing>+);
       5: id = (+LibMsg <report npc wearing>+);
    }
    jump end_part;

Disrobe:
    switch (lm_n) {
       1: id = (+LibMsg <cannot take off something not worn>+);
       2: id = (+LibMsg <report player taking off>+);
       3: id = (+LibMsg <report npc taking off>+);
    }
    jump end_part;
-)

[*** Eating, Drinking, Senses ***]

Include (-
Eat:
    switch (lm_n) {
       1: id = (+LibMsg <cannot eat unless edible>+);
       2: id = (+LibMsg <report player eating>+);
       3: id = (+LibMsg <report npc eating>+);
    }
    jump end_part;
Drink:
    id = (+LibMsg <block drinking>+);
    jump end_part;
Taste:
    id = (+LibMsg <block tasting>+);
    jump end_part;
Smell:
    id = (+LibMsg <block smelling>+);
    jump end_part;
Listen:
    id = (+LibMsg <block listening>+);
    jump end_part;
Touch:
    switch (lm_n) {
       1: id = (+LibMsg <report player touching other people>+);
       2: id = (+LibMsg <report player touching things>+);
       3: id = (+LibMsg <report player touching self>+);
       4: id = (+LibMsg <report npc touching self>+);
	 ! 5 is for touching the player, 6 is for another NPC
       5,6: id = (+LibMsg <report npc touching other people>+);
    }
    jump end_part;
-)

[*** Rhetorical Commands ***]

Include (-
Yes:
    id = (+LibMsg <block saying yes>+);
    jump end_part;
No:
    id = (+LibMsg <block saying no>+);
    jump end_part;
Sorry:
    id = (+LibMsg <block saying sorry>+);
    jump end_part;
Strong:
    id = (+LibMsg <block swearing obscenely>+);
    jump end_part;
Mild:
    id = (+LibMsg <block swearing mildly>+);
    jump end_part;
-)

[*** Body Movement  ***]

Include (-
Climb:
    id = (+LibMsg <block climbing>+);
    jump end_part;
Jump:
    id = (+LibMsg <block jumping>+);
    jump end_part;
Swing:
    id = (+LibMsg <block swinging>+);
    jump end_part;
WaveHands:
    id = (+LibMsg <block waving hands>+);
    jump end_part;
-)

[*** Physical Interaction ***]

Include (-
Attack:
    id = (+LibMsg <block attacking>+);
    jump end_part;
Burn:
    id = (+LibMsg <block burning>+);
    jump end_part;
Cut:
    id = (+LibMsg <block cutting>+);
    jump end_part;
Rub:
    id = (+LibMsg <block rubbing>+);
    jump end_part;
SetTo:
    id = (+LibMsg <block setting to>+);
    jump end_part;
Tie:
    id = (+LibMsg <block tying>+);
    jump end_part;

Wave:
    switch (lm_n) {
       1: id = (+LibMsg <cannot wave something not held>+);
       2: id = (+LibMsg <report player waving things>+);
       3: id = (+LibMsg <report npc waving things>+);
    }
    jump end_part;

Squeeze:
    switch (lm_n) {
       1: id = (+LibMsg <squeezing people>+);
       2: id = (+LibMsg <report player squeezing>+);
       3: id = (+LibMsg <report npc squeezing>+);
    }
    jump end_part;

ThrowAt:
    switch (lm_n) {
       1: id = (+LibMsg <throw at inanimate object>+);
       2: id = (+LibMsg <block throwing at>+);
    }
    jump end_part;
-)

[*** Push, Pull, Turn ***]

Include (-
Push:
    switch (lm_n) {
       1: id = (+LibMsg <cannot push something fixed in place>+);
       2: id = (+LibMsg <cannot push scenery>+);
       3: id = (+LibMsg <report player pushing>+);
       4: id = (+LibMsg <cannot push people>+);
     ! 5 does not apply to Push
       6:  id = (+LibMsg <report npc pushing>+);
    }
    jump end_part;

PushDir:
    switch (lm_n) {
       1: id = (+LibMsg <block pushing in directions>+);
       2: id = (+LibMsg <not pushed in a direction>+);
       3: id = (+LibMsg <pushed in illegal direction>+);
    }
    jump end_part;

Pull:
    switch (lm_n) {
       1: id = (+LibMsg <cannot pull something fixed in place>+);
       2: id = (+LibMsg <cannot pull scenery>+);
       3: id = (+LibMsg <report player pulling>+);
       4: id = (+LibMsg <cannot pull people>+);
       5: id = (+LibMsg <report npc pulling>+);
    }
    jump end_part;

Turn:
    switch (lm_n) {
       1: id = (+LibMsg <cannot turn something fixed in place>+);
       2: id = (+LibMsg <cannot turn scenery>+);
       3: id = (+LibMsg <report player turning>+);
       4: id = (+LibMsg <cannot turn people>+);
     ! 5,6 do not apply to Turn
       7: id = (+LibMsg <report npc turning>+);
    }
    jump end_part;
-)

[*** Speech / Interpersonal Actions ***]

Include (-
Answer:
    id = (+LibMsg <block answering>+);
    jump end_part;
Ask:
    id = (+LibMsg <block asking>+);
    jump end_part;
Buy:
    id = (+LibMsg <block buying>+);
    jump end_part;
Kiss:
    id = (+LibMsg <block kissing>+);
    jump end_part;
Sing:
    id = (+LibMsg <block singing>+);
    jump end_part;
Tell:
    switch (lm_n) {
       1: id = (+LibMsg <telling yourself>+);
       2: id = (+LibMsg <block telling>+);
    }
    jump end_part;
-)

[*** Mental Actions ***]

Include (-
Think:
    id = (+LibMsg <block thinking>+);
    jump end_part;

Consult:
    switch (lm_n) {
       1: id = (+LibMsg <block player consulting>+);
       2: id = (+LibMsg <block npc consulting>+);
    }
    jump end_part;
-)

[*** Sleep And Waiting ***]

Include (-
Sleep:
    id = (+LibMsg <block sleeping>+);
    jump end_part;

Wait:
    switch (lm_n) {
       1: id = (+LibMsg <report player waiting>+);
       2: id = (+LibMsg <report npc waiting>+);
    }
    jump end_part;

Wake:
    id = (+LibMsg <block waking up>+);
    jump end_part;

WakeOther:
    id = (+LibMsg <block waking other>+);
    jump end_part;
-)

Include (-
default:
.end_part;
    if (id == -1) { rfalse; }

    if (id == -2)  {
        (+custom_internal_i6 reveal any newly visible exterior rule+)();
		rtrue;
    }
    else {
       (+library-message-id+) = id;
       (+print library message rule+)();

	   return (+libmsg_printed+);
    }
];
-)

Part 5 - Rule handling - unindexed

Section 5.1 - Reporting rules - unindexed

To display (id_ - a library message id) / (original_rule - a rule):
   change library-message-id to id_;
   follow the print library message rule;
   if libmsg_printed is 0, follow original_rule.

Section 5.2 - Internal rules - unindexed

[ the following rule is called from the i6 code ]

This is the custom_internal_i6 reveal any newly visible exterior rule:
   display LibMsg <reveal any newly visible exterior initial text> /
     the fake_newly_visible_exterior rule;
   if there is no newly visible exterior begin;
       display LibMsg <no newly visible exterior> /
	     the fake_newly_visible_exterior_nothing rule;
   otherwise;
       say ".";
   end if.

This is the fake_newly_visible_exterior rule:
   say "You open [the main object], revealing [run paragraph on]".
This is the fake_newly_visible_exterior_nothing rule:
   say "nothing."

[ need to test the return value of WriteListFrom(); not sure how to do this in Inform 7 ]
To decide whether there is no newly visible exterior:
   (- WriteListFrom(child(lm_o), ENGLISH_BIT+TERSE_BIT+CONCEAL_BIT) == 0 -).

Default Messages ends here.

---- DOCUMENTATION ----

Chapter: How To Use This Extension

Section: Important - Compatibility Note

The current version of this extension is not backwards compatible with previous versions due to major changes in Inform 7.

It will replaced by an extension called "English" in the core library in an upcoming release of Inform 7, after which time CLM will no longer be supported.

Section: New Messages In This Version

The following new messages have been added in this version of Custom Library Messages:

	LibMsg <cannot drop if this exceeds carrying capacity>
	LibMsg <cannot exit thing not within>
	LibMsg <comment recorded>
	LibMsg <comment not recorded>
	LibMsg <no scoring>
	LibMsg <score rank>
	LibMsg <noun needed>
	LibMsg <noun not needed>
	LibMsg <object needed>
	LibMsg <object not needed>
	LibMsg <second object needed>
	LibMsg <second object not needed>
	LibMsg <second noun needed>
	LibMsg <second noun not needed>
	LibMsg <something more substantial needed>
	LibMsg <undo forbidden>
	LibMsg <dark room name>
	LibMsg <report unseen npc closing>
	LibMsg <report unseen npc opening>
	LibMsg <report npc implicit take>
	LibMsg <npc unable to do that>
	LibMsg <say npc arrives at>
	LibMsg <say npc arrives from unknown direction>
	LibMsg <say npc arrives from>
	LibMsg <say npc arrives>
	LibMsg <say npc goes through>
	LibMsg <say npc goes>
	LibMsg <say npc pushing away>
	LibMsg <say npc pushing in front with player>
	LibMsg <say npc pushing in front>
	LibMsg <say npc pushing in>
	LibMsg <say npc taking player along>
	LibMsg <say npc vehicle>

In addition, LibMsg <report npc giving> has been split into:

	LibMsg <report npc giving to npc>
	LibMsg <report npc giving to player>

And the "report npc opening/closing" messages have been split into:

	LibMsg <report npc opening>
	LibMsg <report unseen npc opening>
	LibMsg <report npc closing>
	LibMsg <report unseen npc closing>

Section: Overview

This is a cut-down version of the "Custom Library Messages" extension, which allows the point of view of the player to be modified (for example, "I" instead of "you"). In this smaller version, the standard messages are used unless they are explicitly replaced by you.

Section: Changing Library Messages

This extension has at its heart a table of library messages.

Including something like the following somewhere in your code will
automatically change the library messages you specify:

	Table of custom library messages (continued)
	Message Id							Message Text
	LibMsg <confirm Quit>				"Really quit...?"
	...

You can also change a library message after the game has already started:

	set LibMsg <confirm Quit> to "Really quit...?"

For a complete list of messages and their default values, see the
section "Messages" at the end of this documentation.

Although only a single string is permitted for the Message Text,
it is still possible to add more lengthy conditions by defining
a special "say" rule:

	set LibMsg <confirm Quit> to "[quit msg]"

	To say quit msg:
		...
		...

Section: The Main Object

An object is automatically set whenever a message is displayed called "the main object".
It's value is usually the same as "the noun", but it may take other values, depending
on the message. For example:

	set LibMsg <cannot go that way> to "There is no way [main object] from here."

In this case, the main object is a direction like "south" or "northwest".

Section: The "Examine me" Text

The response to "examine me" is not controlled by this extension (it used to be, before version 5). To set the "x me" text, do the following:

	The description of the player is "A small green blob."

Section: Special Characters

Certain characters are special to Inform 7. A dot ("."), exclamation mark or question mark can mark the end of a sentence and cause a paragraph break; the following special values are defined to prevent this from happening:

	"." -- "[dot]"
	"!" -- "[ExMark]"
	"?" -- "[QMark]"

Literal square brackets should be replaced with "[bracket]" or "[close bracket]"
in messages like "[Previous turn undone]".

As a convenience, the following abbreviations are also defined:

	"[/p]" -- same as "[paragraph break]"
	"[/n]" -- same as "[line break]" (newline)
	"[/r]" -- same as "[run paragraph on]"

Messages ending with "." usually need a line break and most others need a paragraph break (these are not required by the Custom Library Messages extension).

Section: Debugging

The name of each library message may be displayed by saying:

	change library message debug to dbg_on.

This will have an effect like the following:

	{LibMsg <say things within>}
	You can see a rock, some jeans and Fred here.

	>get rock
	{LibMsg <report player taking> - custom}
	Grabbed.

Section: Known Bugs And Limitations

One message rule that has not been replaced is the "describe room gone into" rule,
which can sometimes print things like "X arrives from the north" and
descriptions of vehicle movement and pushing between rooms ("... taking you along").
It is difficult to separate out the text from the logic for this rule;
future versions of Inform may make this easier to do.

The rules for contents listing ("providing light", "which is open", etc)
have not been replaced either. It should be possible to modify these messages
via the appropriate rule books.

Bug reports and suggestions may be sent to "david@hsa.com.au" (with a meaningful
subject line, such as "[I7 library messages] ...") or posted to the
"rec.arts.int-fiction" newsgroup.

Section: Acknowledgements

Apart from the obvious person with the initials GN (and other letters raham elson),
thanks to the "rec.arts.int-fiction" newsgroup for suggestions and encouragement.

Thanks also to Jesse McGrew for a way to avoid having to change the standard library files.

Section: Change History

Version 1 (June 15th, 2006)

	* Initial version, based on the existing Custom Library Messages (version 4).

Version 2 (June 28th, 2006)

	* Added examples
	* Added "Special Characters" section
	* Removed need for library change "#IFNDEF LibraryMessagesProvided" in Verblib.h (thanks to Jesse McGrew).
	* Made sure extension works with I7 build 3R85.

Version 3 (July 7th, 2006)

	* Fixed bug causing stack overflow when pushing objects (in a compass direction).

Version 4 (November 14th, 2006)

	* Made sure the extension compiles for Glulx (by disabling the I6 code that fixes the bug described in Version 3, which no longer seems to happen in I7 version 4B91 anyway).

Version 5 (June 23rd, 2007)

	* Now works with I7 version 4U65.
	* Added LibMsg <examine direction>.
	* Updated Example B to work with latest version of Plurality extension by Emily Short.

Version 6 (August 9th, 2007)

	* Made sure "(in/on ...)" is printed correctly after the room name.

Version 7 (August 24th, 2007)

	* Made sure "You get off the {supporter} ..." is handled properly.

Version 8 (January 13th, 2008)

	* Some changes needed for "report exiting" due to the introduction of action variables ("the container exited from"). A bit hacky, but it seems to work ... (Thanks to Juhana Leinonen for pointing this out).

Version 9 (April 20th, 2008)

	* Changes to I7 required a major update - many changes.
	* Added new messages (see New Messages In This Version, above).
	* Removed references to I6 actions which do not exist in I7: Order, FullScore, Places, Objects, EmptyT, VagueGo, JumpOver, Swim, Blow, Dig, Fill, Set and Pray.

Version 10 (September 15th, 2008)

	* Direction names needed updating to match latest version of I7 ("d_obj" => "down", etc).

Version 11 (May 30th, 2009)

	* Removed duplicate "<cannot put if this exceeds carrying capacity>" message id.

Version 12 (Dec 23rd, 2009)

	* Changed the possible values for "library message debug" from "on/off" to "dbg_on/dbg_off", since this was causing problems for some reason. Thanks to Stephen Granade for pointing out this problem.

Chapter: Messages

Every kind of library message which may be modified by this extension is listed below,
along with the default text for the message. Many messages contain options such as
"That/Those" or "is/are", which change depending on the object in question; Emily Short's
"Plurality" extension may be helpful for these cases (see Example B).

Some messages contain text in curly brackets "{like this}"; modifying these messages
may be tricky without knowledge of Inform 6. You may wish to use the Custom Library
Messages extension if you wish to change these messages.

Section: End of game messages

	Table of custom library messages (continued)
	Message Id				Message Text
	LibMsg <you have died>			" You have died "
	LibMsg <you have won>			" You have won "

Section: Descriptions

	Table of custom library messages (continued)
	Message Id				Message Text
	LibMsg <player self description>		"yourself"
	LibMsg <unimportant object>		"That's/they're not something you need to refer to in the course of this game."

[
   LibMsg <player description> ("As good-looking as ever") has been removed
   - use "The description of the player is ..." instead.
]

Section: Prompts and Input

	Table of custom library messages (continued)
	Message Id				Message Text
	LibMsg <empty line>			"I beg your pardon?"
	LibMsg <confirm Quit>			"Are you sure you want to quit? "
	LibMsg <yes or no prompt>		"Please answer yes or no."
	LibMsg <restrict answer>		"Please give one of the answers above."
	LibMsg <page prompt>			"[bracket]Please press SPACE.[close bracket]"
	LibMsg <menu prompt>			"Type a number from 1 to N, 0 to redisplay or press ENTER."

Section: Undo

	Table of custom library messages (continued)
	Message Id				Message Text
	LibMsg <undo succeeded>		"[bracket]Previous turn undone[dot][close bracket]"
	LibMsg <undo failed>			"[apostrophe]Undo[apostrophe] failed. [bracket]Not all interpreters provide it[dot][close bracket]"
	LibMsg <undo not provided>		"[bracket]Your interpreter does not provide [apostrophe]undo[apostrophe]. Sorry[ExMark][close bracket]"
	LibMsg <cannot undo nothing>		"[bracket]You can't [apostrophe]undo[apostrophe] what hasn't been done[ExMark][close bracket]"
	LibMsg <cannot undo twice in a row>	"[bracket]Can't [apostrophe]undo[apostrophe] twice in succession. Sorry[ExMark][close bracket]"
	LibMsg <undo forbidden>			"The use of UNDO is forbidden in this game."

Section: Oops

	Table of custom library messages (continued)
	Message Id				Message Text
	LibMsg <oops failed>			"Sorry, that can't be corrected."
	LibMsg <oops too many arguments>	"[apostrophe]Oops[apostrophe] can only correct a single word."
	LibMsg <oops no arguments>		"Think nothing of it."

Section: Again

	Table of custom library messages (continued)
	Message Id				Message Text
	LibMsg <cannot do again>		"You can hardly repeat that."
	LibMsg <again usage>			"To repeat a command like [apostrophe]frog, jump[apostrophe], just say [apostrophe]again[apostrophe], not [apostrophe]frog, again[apostrophe]."

Section: Syntax Errors

	Table of custom library messages (continued)
	Message Id				Message Text
	LibMsg <command not understood>	"I didn't understand that sentence."
	LibMsg <command partly understood>	"I only understood you as far as wanting to "
	LibMsg <command badly ended>		"I didn't understand the way that finished."
	LibMsg <command incomplete>		"You seem to have said too little!"
	LibMsg <command cut short>		"(Since something dramatic has happened, your list of commands has been cut short.)"
	LibMsg <number not understood>	"I didn't understand that number."
	LibMsg <cannot begin at comma>	"You can't begin with a comma."
	LibMsg <extra words before comma>	"To talk to someone, try 'someone, hello' or some such."

Section: Illegal Commands

	Table of custom library messages (continued)
	Message Id					Message Text
	LibMsg <unknown object>			"You can't see any such thing."
	LibMsg <object not held>			"You aren't holding that!"
	LibMsg <unknown verb>				"That's not a verb I recognize."
	LibMsg <verb cannot have inanimate object>	"You can only do that to something animate."
	LibMsg <noun needed>				"You must supply a noun."
	LibMsg <noun not needed>			"You may not supply a noun."
	LibMsg <object needed>				"You must name an object."
	LibMsg <object not needed>			"You may not name an object."
	LibMsg <second object needed>			"You must name a second object."
	LibMsg <second object not needed>		"You may not name a second object."
	LibMsg <second noun needed>			"You must supply a second noun."
	LibMsg <second noun not needed>		"You may not supply a second noun."
	LibMsg <something more substantial needed>	"You must name something more substantial."

Section: Multiple Objects

	Table of custom library messages (continued)
	Message Id					Message Text
	LibMsg <verb cannot have multiple objects>	"You can't use multiple objects with that verb."
	LibMsg <too many multiple objects>		"You can only use multiple objects once on a line."
	LibMsg <not that many available>		"None of those are/Only N of those are available."
	LibMsg <no objects available>			"There are none at all available!"
	LibMsg <zero multiple objects>			"Nothing to do!"
	LibMsg <first N objects>				"(considering the first sixteen objects only)"
	LibMsg <excepted object not included anyway>	"You excepted something not included anyway!"

Section: Implicit Actions

	Table of custom library messages (continued)
	Message Id						Message Text
	LibMsg <report implicit take>				"(first taking [the main object])"
	LibMsg <implicitly pass outwards through other barriers>	"(getting off/out of [the main object])"
	LibMsg <implicitly pass inwards through other barriers>	"(entering/getting onto/into [the main object])"
	LibMsg <cannot drop clothes being worn>		"(first taking [the main object] off)"
	LibMsg <cannot insert clothes being worn>		"(first taking it/them off)"
	LibMsg <cannot put clothes being worn>			"(first taking it/them off)"

Section: Carrying Capacity

	Table of custom library messages (continued)
	Message Id						Message Text
	LibMsg <cannot exceed carrying capacity>		"You're carrying too many things already."
	LibMsg <use holdall to avoid exceeding carrying capacity>	"(putting [the main object] into {the player's holdall} to make room)"
	LibMsg <cannot insert if this exceeds carrying capacity>	"There is no more room in [the main object]."
	LibMsg <cannot put if this exceeds carrying capacity>	"There is no more room on [the main object]."

Section: Disambiguation

	Table of custom library messages (continued)
	Message Id				Message Text
	LibMsg <who disambiguation>		"Who do you mean, "
	LibMsg <which disambiguation>		"Which do you mean, "
	LibMsg <whom disambiguation>		"Whom do you want to {command}?"
	LibMsg <what disambiguation>		"What do you want to {command}?"
	LibMsg <single object disambiguation>	"Sorry, you can only have one item here. Which exactly?"

Section: Pronouns

	To say <space> at the moment:
	if lm_present, say " at the moment"

	Table of custom library messages (continued)
	Message Id				Message Text
	LibMsg <pronoun not set>		"I'm not sure what '{pronoun}' refers to."
	LibMsg <pronoun absent>		"You can't see '{pronoun}' ([the main object]) at the moment."
	LibMsg <Pronouns initial text>		"At the moment, "
	LibMsg <Pronouns -means- text>		"means"
	LibMsg <Pronouns -unset- text>		"is unset"
	LibMsg <no pronouns known>		"no pronouns are known to the game."

Section: Commanding People

	Table of custom library messages (continued)
	Message Id				Message Text
	LibMsg <person ignores command>	"[The main object] has better things to do."
	LibMsg <cannot talk to absent person>	"You seem to want to talk to someone, but I can't see whom."
	LibMsg <cannot talk to inanimate object>	"You can't talk to [the main object]."
	LibMsg <npc unable to do that>		"[The person asked]  is unable to do that."

Section: File Operations

	Table of custom library messages (continued)
	Message Id				Message Text
	LibMsg <confirm Restart>		"Are you sure you want to restart? "
	LibMsg <Restart failed>			"Failed."
	LibMsg <Restore failed>			"Restore failed."
	LibMsg <Restore succeeded>		"Ok."
	LibMsg <Save failed>			"Save failed."
	LibMsg <Save succeeded>		"Ok."
	LibMsg <Verify succeeded>		"The game file has verified as intact."
	LibMsg <Verify failed>			"The game file did not verify as intact, and may be corrupt."

Section: Transcripts

	Table of custom library messages (continued)
	Message Id				Message Text
	LibMsg <transcript already on>		"Transcripting is already on."
	LibMsg <transcript already off>		"Transcripting is already off."
	LibMsg <start of transcript>		"Start of a transcript of"
	LibMsg <end of transcript>		"End of transcript."
	LibMsg <transcript failed>		"Attempt to begin transcript failed."
	LibMsg <end transcript failed>		"Attempt to end transcript failed."

Section: Scoring

	Table of custom library messages (continued)
	Message Id				Message Text
	LibMsg <Score command>		"In that game you scored/You have so far scored [the score] out of a possible [maximum score] in [turn count] turn[s]"
	LibMsg <score changed>		"Your score has just gone up/down by N points"
	LibMsg <score notification turned on>	"Score notification on."
	LibMsg <score notification turned off>	"Score notification off."

Section: Inventory

	Table of custom library messages (continued)
	Message Id					Message Text
	LibMsg <report npc taking inventory>	"[The person asked] looks through his possessions."
	LibMsg <Inventory initial text>			"You are carrying"
	LibMsg <Inventory no possessions>		"You are carrying nothing."

Section: Darkness

	Table of custom library messages (continued)
	Message Id					Message Text
	LibMsg <entering darkness>			"It is now pitch dark in here!"
	LibMsg <dark description>			"It is pitch dark, and you can't see a thing."
	LibMsg <examine while dark>			"Darkness, noun. An absence of light to see by."
	LibMsg <search while dark>			"But it's dark."
	LibMsg <look under while dark>			"But it's dark."
	LibMsg <dark room name>				"Darkness"

Section: Take

	Table of custom library messages (continued)
	Message Id					Message Text
	LibMsg <report player taking>			"Taken."
	LibMsg <report npc taking>			"[The person asked] picks up [the main object]."
	LibMsg <cannot take yourself>			"You are always self-possessed."
	LibMsg <cannot take other people>		"I don't suppose [the main object] would care for that."
	LibMsg <cannot take something you are within>	"You[apostrophe]d have to get off/out of [the main object] first."
	LibMsg <cannot take something already taken>	"You already have that/those."
	LibMsg <cannot take possessions of others>	"That/those seem(s) to belong to [the main object]."
	LibMsg <cannot take component parts>		"That/those seem(s) to be a part of [the main object]."
	LibMsg <cannot take hidden parts>		"That/those isn't/aren't available."
	LibMsg <cannot reach within closed containers>	"[The main object] isn't open."
	LibMsg <cannot take scenery>			"That's/they're hardly portable."
	LibMsg <cannot take something fixed>		"That's/they're fixed in place."
	LibMsg <cannot reach within other places>	"You can't reach into [the main object]."

See also:

	LibMsg <cannot exceed carrying capacity>
	LibMsg <use holdall to avoid exceeding carrying capacity>

Section: Remove

	Table of custom library messages (continued)
	Message Id					Message Text
	LibMsg <report player removing>		"Removed."
	LibMsg <report npc removing>			"[The person asked] removes [the main object] from [the second noun]."
	LibMsg <cannot remove from closed containers>	"It/They is/are unfortunately closed."
	LibMsg <cannot remove something not within>	"But it/they isn't/aren't there now."

Section: Drop

	Table of custom library messages (continued)
	Message Id						Message Text
	LibMsg <report player dropping>				"Dropped."
	LibMsg <report npc dropping>				"[The person asked] puts down [the main object]."
	LibMsg <cannot drop something already dropped>	"[The main object] is/are already here."
	LibMsg <cannot drop not holding>			"You haven't got that/those."

See also:

	LibMsg <cannot drop clothes being worn>

Section: Insert

	Table of custom library messages (continued)
	Message Id						Message Text
	LibMsg <report player inserting>				"Done."
	LibMsg <report npc inserting>				"[The person asked] puts [the main object] into [the second noun]."
	LibMsg <cannot insert something not held>		"You need to be holding [the main object] before you can put it/them into something else."
	LibMsg <cannot insert into something not a container>	"That/those can't contain things."
	LibMsg <cannot insert into closed containers>		"[The main object] is/are closed."
	LibMsg <need to take off before inserting>		"You'll need to take it/them off first."
	LibMsg <cannot insert something into itself>		"You can't put something inside itself."

See also:

	LibMsg <cannot insert if this exceeds carrying capacity>
	LibMsg <cannot insert clothes being worn>

26. Put On

	To say would achieve:
	say "would [if lm_past]have achieved[otherwise]achieve"

	Table of custom library messages (continued)
	Message Id						Message Text
	LibMsg <report player putting on>			"Done./You put [the main object] on [the second noun]."
	LibMsg <report npc putting on>				"[The person asked] puts [the main object] on [the second noun]."
	LibMsg <cannot put something not held>			"You need to be holding [the main object] before you can put it/them on top of something else."
	LibMsg <cannot put something on it-self>			"You can't put something on top of itself."
	LibMsg <cannot put onto something not a supporter>	"Putting things on [the main object] would achieve nothing."
	LibMsg <cannot put onto something being carried>	"You lack the dexterity."

See also:

	LibMsg <cannot put if this exceeds carrying capacity>
	LibMsg <cannot put clothes being worn>

Section: Give

	Table of custom library messages (continued)
	Message Id					Message Text
	LibMsg <report player giving>		"You give [the main object] to [the second noun]."
	LibMsg <report npc giving>				"[The person asked] gives [the main object] to [the second noun]."
	LibMsg <cannot give what you have not got>	"You aren't holding [the main object]."
	LibMsg <cannot give to yourself>			"You juggle [the main object] for a while, but don't achieve much."
	LibMsg <block giving>				"[The main object] doesn't/don't seem interested."
	LibMsg <unable to receive things>		"[The main object] isn't/aren't able to receive things."

Section: Show

	Table of custom library messages (continued)
	Message Id					Message Text
	LibMsg <cannot show what you have not got>	"You aren't holding [the main object]."
	LibMsg <block showing>				"[The main object] is/are unimpressed."

Section: Enter

	Table of custom library messages (continued)
	Message Id						Message Text
	LibMsg <report player entering>			"You get onto/into [the main object]."
	LibMsg <report npc entering>				"[The person asked] gets onto/into [the main object]."
	LibMsg <cannot enter something already entered>	"But you're already on/in [the main object]."
	LibMsg <cannot enter something not enterable>		"That's/they're not something you can enter/stand on/sit down on/lie down on."
	LibMsg <cannot enter closed containers>			"You can't get into the closed [main object]."
	LibMsg <cannot enter something carried>		"You can only get into something free-standing."


See also:

	LibMsg <implicitly pass outwards through other barriers>
	LibMsg <implicitly pass inwards through other barriers>

Section: Exit, Get Off

	Table of custom library messages (continued)
	Message Id						Message Text
	LibMsg <report player exiting>				"You get off/out of [the main object]."
	LibMsg <report npc exiting>					"[The person asked] gets off/out of [the main object]."
	LibMsg <cannot exit when not within anything>		"But you aren't in anything at the moment."
	LibMsg <cannot exit closed containers>			"You can't get out of the closed [main object]."
	LibMsg <cannot get off things>				"But you aren't on [the main object] at the moment."

Section: Go

	Table of custom library messages (continued)
	Message Id						Message Text
	LibMsg <cannot go that way>				"You can't go that way."
	LibMsg <cannot travel in something not a vehicle>	"You'll have to get off/out of [the main object] first."
	LibMsg <cannot go through concealed doors>	"You can't go that way."
	LibMsg <cannot go up through closed doors>	"You are unable to climb [the main object]."
	LibMsg <cannot go down through closed doors>	"You are unable to descend by [the main object]."
	LibMsg <cannot go through closed doors>		"You can't, since [the main object] is/are in the way."
	LibMsg <nothing through door>				"You can't, since [the main object] leads nowhere."
	LibMsg <block vaguely going>				"You'll have to say which compass direction to go in.[run paragraph on]"
	LibMsg <say npc goes>					"[The person asked]  goes (direction)"
	LibMsg <say npc arrives>				"[The person asked]  arrives from the (direction)"
	LibMsg <say npc arrives from unknown direction>	"[The person asked]  arrives"
	LibMsg <say npc arrives at>				"[The person asked]  arrives at [the main object] from the (direction)"
	LibMsg <say npc goes through>				"[The person asked]  goes through [the main object]"
	LibMsg <say npc arrives from>				"[The person asked]  arrives from the (direction)"
	LibMsg <say npc vehicle>				"in/on [the main object]"
	LibMsg <say npc pushing in front with player>	", pushing [the main object] in front, and you along too"
	LibMsg <say npc pushing in front>			", pushing [the main object] in front"
	LibMsg <say npc pushing away>				", pushing [the main object] away"
	LibMsg <say npc pushing in>				", pushing [the main object] in"
	LibMsg <say npc taking player along>		", taking you along"

Section: Brief, Super Brief, Verbose

	Table of custom library messages (continued)
	Message Id						Message Text
	LibMsg <brief look mode>				"{Story name} is now in its normal 'brief' printing mode, which gives long descriptions of places never before visited and short descriptions otherwise."
	LibMsg <superbrief look mode>				"{Story name} is now in its 'superbrief' mode, which always gives short descriptions of locations (even if you haven't been there before)."
	LibMsg <verbose look mode>				"{Story name} is now in its 'verbose' mode, which always gives long descriptions of locations (even if you've been there before)."

Section: Look

	Table of custom library messages (continued)
	Message Id				Message Text
	LibMsg <report npc looking>	"[The person asked] looks around."
	LibMsg <top line what on>		" (on [the main object])"
	LibMsg <top line what in>		" (in [the main object])"
	LibMsg <top line what as>		" (as {inform 6 short name of the player})"
	LibMsg <say things within>		"[what's inside the object part 1] [what's inside the object part 2]"
	LibMsg <say things also within>		"[what's inside the object part 1] also [what's inside the object part 2]"
	LibMsg <say things on>			"On [the main object] [what's on the object]."

	To say what's on the object:
		list the contents of the main object, prefacing with is/are, as a sentence,
			including contents, giving brief inventory information,
			tersely, not listing concealed items.

	To say what's inside the object part 1:
		if main object is the location, say "You";
		otherwise say "On/In [the main object] you";
		say " can".

	To say what's inside the object part 2:
		say "see ";
		list the contents of the main object, as a sentence, including contents,
			listing marked items only, giving brief inventory information,
			tersely, not listing concealed items;
		if the main object is the location, say " here";
		say "."

Section: Examine

	Table of custom library messages (continued)
	Message Id					Message Text
	LibMsg <report npc examining>		"[The person asked] looks closely at [the main object]."
	LibMsg <examine undescribed things>		"You see nothing special about [the main object]."
	LibMsg <examine direction>			"You see nothing unexpected in that direction."
	LibMsg <examine devices>			"[The main object] is/are currently switched on/off."

See also:

	LibMsg <examine in darkness>

Section: Search

	Table of custom library messages (continued)
	Message Id						Message Text
	LibMsg <report npc searching>			"[The person asked] searches [the main object]."
	LibMsg <cannot search unless container or supporter>	"You find nothing of interest."
	LibMsg <cannot search closed opaque containers>	"You can't see inside, since [the main object] is/are closed."
	LibMsg <nothing found within container>			"[The main object] is/are empty."
	LibMsg <nothing found on top of>			"There is nothing on [the main object]."

See also:

	LibMsg <search in darkness>

Section: Look Under

	Table of custom library messages (continued)
	Message Id						Message Text
	LibMsg <report npc looking under>		"[The person asked] looks under [the main object]."
	LibMsg <look under>					"You find nothing of interest."

See also:

	LibMsg <look under in darkness>

Section: Open

	Table of custom library messages (continued)
	Message Id						Message Text
	LibMsg <report player opening>				"You open [the main object]."
	LibMsg <report npc opening>				"[The person asked] opens [the main object]./[The main object] opens."
	LibMsg <cannot open unless openable>			"That's/They're not something you can open."
	LibMsg <cannot open something locked>			"It/They seems to be locked."
	LibMsg <cannot open something already open>		"That's/They're already open."
	LibMsg <reveal any newly visible exterior initial text>	"You open [the main object], revealing "
	LibMsg <no newly visible exterior>			"nothing."

Section: Close

	Table of custom library messages (continued)
	Message Id						Message Text
	LibMsg <report player closing>				"You close [the main object]."
	LibMsg <report npc closing>				"[The person asked] closes [the main object]./[The main object] closes."
	LibMsg <cannot close unless openable>			"That's/they're not something you can close."
	LibMsg <cannot close something already closed>		"That's/they're already closed."

Section: Lock

	Table of custom library messages (continued)
	Message Id						Message Text
	LibMsg <report player locking>				"You lock [the main object]."
	LibMsg <report npc locking>				"[The person asked] locks [the main object]."
	LibMsg <cannot lock without a lock>			"That/They doesn't/don't seem to be something you can lock."
	LibMsg <cannot lock something already locked>		"That's/They're locked at the moment."
	LibMsg <cannot lock something open>			"First you'll have to close [the main object]."
	LibMsg <cannot lock without the correct key>		"That/They doesn't/don't seem to fit the lock."

Section: Unlock

	Table of custom library messages (continued)
	Message Id						Message Text
	LibMsg <report player unlocking>			"You unlock [the main object]."
	LibMsg <report npc unlocking>				"[The person asked] unlocks [the main object]."
	LibMsg <cannot unlock without a lock>			"That/They doesn't/don't seem to be something you can unlock."
	LibMsg <cannot unlock something already unlocked>	"That's/They're unlocked at the moment."
	LibMsg <cannot unlock without the correct key>		"That/They doesn't/don't seem to fit the lock."

Section: Switch On

	Table of custom library messages (continued)
	Message Id						Message Text
	LibMsg <report player switching on>			"You switch [the main object] on."
	LibMsg <report npc switching on>			"[The person asked] switches [the main object] on."
	LibMsg <cannot switch on unless switchable>		"That's/They're not something you can switch."
	LibMsg <cannot switch on something already on>		"That's/They're already on."

Section: Switch Off

	Table of custom library messages (continued)
	Message Id						Message Text
	LibMsg <report player switching off>			"You switch [the main object] off."
	LibMsg <report npc switching off>				"[The person asked] switches [the main object] off."
	LibMsg <cannot switch off unless switchable>		"That's/They're not something you can switch."
	LibMsg <cannot switch off something already off>		"That's/They're already off."

Section: Wear

	Table of custom library messages (continued)
	Message Id					Message Text
	LibMsg <report player wearing>		"You put on [the main object]."
	LibMsg <report npc wearing>			"[The person asked] puts on [the main object]."
	LibMsg <cannot wear something not clothing>	"You can't wear that/those!"
	LibMsg <cannot wear not holding>		"You're not holding that/those!"
	LibMsg <cannot wear something already worn>	"You're already wearing that/those!"

Section: Take Off

	Table of custom library messages (continued)
	Message Id					Message Text
	LibMsg <report player taking off>		"You take off [the main object]."
	LibMsg <report npc taking off>			"[The person asked] takes off [the main object]."
	LibMsg <cannot take off something not worn>	"You're not wearing that/those."

Section: Eating And Drinking, Senses

	Table of custom library messages (continued)
	Message Id					Message Text
	LibMsg <report player eating>			"You eat [the main object]. Not bad."
	LibMsg <report npc eating>			"[The person asked] eats [the main object]."
	LibMsg <cannot eat unless edible>		"That's/They're plainly inedible."
	LibMsg <block drinking>				"There's nothing suitable to drink here."
	LibMsg <block tasting>				"You taste nothing unexpected."
	LibMsg <block smelling>				"You smell nothing unexpected."
	LibMsg <block listening>				"You hear nothing unexpected."

Section: Touching

	Table of custom library messages (continued)
	Message Id					Message Text
	LibMsg <report player touching things>		"You feel nothing unexpected."
	LibMsg <report npc touching things>		"[The person asked] touches [the main object]."
	LibMsg <report player touching self>		"If you think that'll help."
	LibMsg <report npc touching self>		"[The person asked] touches [himself]."
	LibMsg <report player touching other people>	"Keep your hands to yourself!"
	LibMsg <report npc touching other people>	"[The person asked] touches [the main object]."

48. Rhetorical Commands

	Table of custom library messages (continued)
	Message Id					Message Text
	LibMsg <block saying yes>			"That was a rhetorical question."
	LibMsg <block saying no>			"That was a rhetorical question."
	LibMsg <block saying sorry>			"Oh, don't apologize."
	LibMsg <block swearing obscenely>		"Real adventurers do not use such language."
	LibMsg <block swearing mildly>			"Quite."

49. Body Movement

	Table of custom library messages (continued)
	Message Id					Message Text
	LibMsg <block climbing>				"I don't think much is to be achieved by that."
	LibMsg <block jumping>				"You jump on the spot, fruitlessly."
	LibMsg <block jumping over>			"You would achieve nothing by this."
	LibMsg <block swimming>			"There's not enough water to swim in."
	LibMsg <block swinging>			"There's nothing sensible to swing here."
	LibMsg <block waving hands>			"You wave, feeling foolish."

50. Physical Interaction

	Table of custom library messages (continued)
	Message Id					Message Text
	LibMsg <block attacking>			"Violence isn't the answer to this one."
	LibMsg <block burning>				"This dangerous act would achieve little."
	LibMsg <block cutting>				"Cutting that/those up would achieve little."
	LibMsg <block rubbing>				"You achieve nothing by this."
	LibMsg <block setting to>			"No, you can't set that/those to anything."
	LibMsg <block tying>				"You would achieve nothing by this."
	LibMsg <report player waving things>		"You look ridiculous waving [the main object]."
	LibMsg <report npc waving things>		"[The person asked] waves [the main object]."
	LibMsg <cannot wave something not held>	"But you aren't holding that/those."
	LibMsg <squeezing people>			"Keep your hands to yourself."
	LibMsg <report player squeezing>		"You achieve nothing by this."
	LibMsg <report npc squeezing>			"[The person asked] squeezes [the main object]."
	LibMsg <block throwing at>			"You lack the nerve when it comes to the crucial moment."
	LibMsg <throw at inanimate object>	"Futile."

51. Push, Pull, Turn

	Table of custom library messages (continued)
	Message Id					Message Text
	LibMsg <report player pushing>			"Nothing obvious happens."
	LibMsg <report npc pushing>			"[The person asked] pushes [the main object]."
	LibMsg <report player pulling>			"Nothing obvious happens."
	LibMsg <report npc pulling>			"[The person asked] pulls [the main object]."
	LibMsg <report player turning>			"Nothing obvious happens."
	LibMsg <report npc turning>			"[The person asked] turns [the main object]."
	LibMsg <block pushing in directions>		"[The main object] cannot be pushed from place to place."
	LibMsg <not pushed in a direction>		"That's not a direction."
	LibMsg <pushed in illegal direction>		"Not that way you can't."
	LibMsg <cannot push something fixed in place>	"It is fixed in place."
	LibMsg <cannot pull something fixed in place>	"It is fixed in place."
	LibMsg <cannot turn something fixed in place>	"It is fixed in place."
	LibMsg <cannot push scenery>			"You are unable to."
	LibMsg <cannot pull scenery>			"You are unable to."
	LibMsg <cannot turn scenery>			"You are unable to."
	LibMsg <cannot push people>			"That would be less than courteous."
	LibMsg <cannot pull people>			"That would be less than courteous."
	LibMsg <cannot turn people>			"That would be less than courteous."

52. Speech / Interpersonal Actions

	Table of custom library messages (continued)
	Message Id					Message Text
	LibMsg <block answering>			"There is no reply."
	LibMsg <block asking>				"There is no reply."
	LibMsg <block buying>				"Nothing is on sale."
	LibMsg <block kissing>				"Keep your mind on the game."
	LibMsg <block singing>				"Your singing is abominable."
	LibMsg <block telling>				"This provokes no reaction."
	LibMsg <telling yourself>			"You talk to yourself a while."

53. Mental Actions

	Table of custom library messages (continued)
	Message Id				Message Text
	LibMsg <block thinking>			"What a good idea."
	LibMsg <block player consulting>		"You discover nothing of interest in [the main object]."
	LibMsg <block npc consulting>		"[The person asked] looks at [the main object]."

54. Sleep And Waiting

	Table of custom library messages (continued)
	Message Id				Message Text
	LibMsg <block sleeping>			"You aren't feeling especially drowsy."
	LibMsg <block waking up>		"The dreadful truth is, this is not a dream."
	LibMsg <block waking other>		"That seems unnecessary."
	LibMsg <report player waiting>		"Time passes."
	LibMsg <report npc waiting>		"[The person asked] waits."

Example: * Messages I - Changing messages containing fixed text.

	"Messages I" by Ibid

	Include Default Messages by David Fisher.

	The Wild Frontier is a room.
	A bush is in the wild frontier.

	Table of custom library messages (continued)
	Message Id	Message Text 
	LibMsg <empty line>			"Say what?[/p]"
	LibMsg <confirm Quit>			"Quittin[apostrophe] time? "
	LibMsg <unknown object>		"Can't see that here.[/n]"
	LibMsg <examine undescribed things>	"Nothin[apostrophe] special.[/p]"

	Test me with "x tree / / x bush / quit".

Example: ** Messages II - Changing messages containing objects.

	"Messages II" by Ibid

	Include Default Messages by David Fisher.
	Include Plurality by Emily Short.

	The Saloon is a room.
	A gun is in the Saloon. Some boots are in the Saloon.

The Plurality extension includes definitions for "[is/are]" and "if ... acts plural", used below.

	Table of custom library messages (continued)
	Message Id	Message Text
	LibMsg <report player taking>	"You grab [the noun].[/p]"
	LibMsg <cannot take something already taken>	"You already have [it-them of noun].[/p]" 
	LibMsg <cannot drop something already dropped>	"[The noun] [is-are] already right here.[/p]" 


		
	Test me with "drop gun / get gun / get gun / drop boots / get boots / get boots".

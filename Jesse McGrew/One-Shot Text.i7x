Version 1 of One-Shot Text by Jesse McGrew begins here.

"Provides a way to ensure that a piece of text will only be printed once, or to have it appear differently the first time it's printed."

Include (-

#ifndef MAX_ONESHOTS;
Constant MAX_ONESHOTS = 50;
#endif;

Array oneshots_array --> MAX_ONESHOTS;

[ CheckOneShot token  i x;
  for ( i=0: i<MAX_ONESHOTS: i++ ) {
    x = oneshots_array-->i;
    if (x == token) rfalse;
    if (x == 0) { oneshots_array-->i = token; rtrue; }
  }
  "[*** Error: Too many one-shots! Increase MAX_ONESHOTS. ***]^";
];

-).

[We rely on the fact that the Inform 6 compiler doesn't combine identical strings.
Even though the parameter to CheckOneShot is always "", it will have a
different value at different call sites, because the string is recompiled each time.
There are other ways to produce unique values at each call site, but this way
saves some memory.]

To say once: (- if (CheckOneShot("")) { -).
To say but later: (- } else { -).
To say end once: (- } -).

One-Shot Text by Jesse McGrew ends here.

---- DOCUMENTATION ---- 

This extension allows us to mark parts of a text block which we only want to show the first time the text is printed, by enclosing it in "once" and "end once" tokens. For example:

	A painting is here. The description is "It depicts a farmer and his wife in front of a barn.[once] You've never noticed it here before.[end once]"

The bit about never noticing the painting before will only be printed the first time the player examines the painting. After that, it will be hidden.

If we prefer, we can use "but later" to supply alternate text to be printed on subsequent appearances:

	A table is here. "A wooden table in the corner [once]catches your attention[but later]mocks you with its tedious sameness[end once]."

Note that the one-shot only prevents the same text from being printed again at the same point in the source file, not anywhere else. If we create two paintings with identical one-shot descriptions, the player will see "You've never noticed it here before" when she examines each one for the first time. On the other hand, if we want to link them together, we can create a separate say phrase so both descriptions end up using the same "once" token:

	To say painting message: say "[once]. You've never looked at either of the paintings here before[end once]".
	
	The description of the red painting is "It depicts a Martian sunset[painting message].".
	The description of the blue painting is "It depicts an Atlantean metropolis[painting message].".

Finally, there is a limit on the number of one-shot texts we can use in a single game. By default, the limit is 50, but it can be changed. For example, to increase it to 75, we could use this line:

	Include (- Constant MAX_ONESHOTS 75; -) before the library.

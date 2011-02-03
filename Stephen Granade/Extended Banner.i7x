Version 5 of Extended Banner by Stephen Granade begins here.

"More control over what is printed in a banner, including an easily-included copyright line."

Section 1G (for Glulx only)

Include (-

[ SerialNumber i;
	for (i=0 : i<6 : i++) print (char) ROM_GAMESERIAL->i;
];

-)

Section 1Z (for Z-machine only)

Include (-

[ SerialNumber i;
	for (i=0 : i<6 : i++) print (char) HDR_GAMESERIAL->i;
];

-)

Section 2

Include (-

[ I7BuildVersion;
	print (string) NI_BUILD_COUNT, " ";
	print "(I6/v"; inversion;
	print " lib ", (string) LibRelease, ") ";
#ifdef STRICT_MODE;
	print "S";
#endif;
#ifdef INFIX;
	print "X";
#ifnot;
#ifdef DEBUG;
	print "D";
#endif;
];

-)

To decide if (s - text) is not blank: if s is "", decide no; decide yes.

[The extended story headline is necessary so that, if the author doesn't set the story headline value, "An Interactive Fiction" is printed out.]
To say extended story headline: (- if (Headline ~= 0) print (string) Headline; -).
To say story serial number: (- SerialNumber(); -).
To say I7 version number: (- I7BuildVersion(); -).

The story copyright string and story rights statement are text variables.

Last for printing the banner text rule (this is the extended banner rule):
	say "[bold type][story title][roman type][line break][extended story headline][if story author is not blank] by [story author][end if][line break]";
	if the story copyright string is not "", say "Copyright [unicode 169] [story copyright string][if story author is not blank] by [story author][end if][line break][if story rights statement is not blank][story rights statement][otherwise]All rights reserved[end if][run paragraph on][line break]";
	say "Release [if release number is not 0][release number][otherwise]1[end if] / Serial number [story serial number] / Inform 7 build [I7 version number][line break]" instead.

Extended Banner ends here.

---- DOCUMENTATION ----

Extended Banner provides all of the tools necessary to rewrite the banner that is printed when a game begins. By default it does nothing but define several new text substitutions: the extended story headline, the story serial number, and the I7 version number.

To add a copyright line to the banner, the simplest approach is to define the story copyright string.

	The story copyright string is "2006-7".

You can also change the rights you are claiming by changing the story rights string:

	The story rights statement is "Released under the Creative Commons Attribution-NonCommercial-ShareAlike 2.5 License"

If you do not define the story rights statement but do define the story copyright string, the extension by default uses the rights statement "All rights reserved".

Example: * B is B - Replace the default Inform 7 banner with one that looks exactly like the default banner.

	"B is B"

	Include Extended Banner by Stephen Granade.

	The Foyer is a room.

	Rule for printing the banner text:
		say "[bold type][story title][roman type][line break][extended story headline][if story author is not blank] by [story author][end if][line break]Release [release number] / Serial number [story serial number] / Inform 7 build [I7 version number][line break]" instead.

	Test me with "z".

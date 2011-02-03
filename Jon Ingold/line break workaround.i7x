line break workaround by Jon Ingold begins here.

To decide if a line break is needed after (text - a miscellaneous-value):
	(- (ZRegion({text})==3)  -)

line break workaround by Jon Ingold ends here.

---- DOCUMENTATION ----

This extension does nothing but work around some line-break weirdness inherent in the Inform compiler (at present, at least, in 3v01). This can cause say lines to sometimes terminate in a line break and sometimes not. For example, consider the following example (similar to the "Crusoe" example in the Documentation).

	Procedural rule: Substitute the fancy room description body text rule for the room description body text rule.

	Printing the room description of something is an activity.

	This is the fancy room description body text rule:
	        if in darkness, carry out the printing the description of a dark room activity;
	        otherwise carry out the printing the room description activity with the location;
	        make no decision.

	Rule for printing the room description of a room (called space):
		 say "[description of space]";
		
This produces some slightly odd behaviour if given the following two rooms:

	The Dome is a room. "Thirty arches of metal spun around an apex above your head."
	The Catwalk is up from the Dome. "You walk suspended beneath the dome. The floor below seems a million miles away[if Dome is visited], but you can still make out your footprints on its dusty floor[end if]."
	
Dome
Thirty arches of metal spun around an apex above your head.
>u

Catwalk
You walk suspended beneath the dome. The floor below seems a million miles away.

>

The Dome description does not have adequate line-breaking, whereas the Catwalk does. The reason for the difference is an internal one: the Dome description is a single line of text whereas the Catwalk contains substitutions (and hence is internally a routine).

This can be solved using this extension and adding the following line to the Printing a Room Description rule:

	if a line break is needed after the description of the space, say line break.

This checks to see if the description property is a text string without substitutions. (Note it doesn't check whether the property ends with a . or a ?)
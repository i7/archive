Version 2 of Extended Timers by Gavin Lambert begins here.

"Some additional ways of dealing with the standard times and timers."

Section 1 - Inform 6

Include (-
[ GetI7TimerTurns R i t;
	for (i=1: i<=(TimedEventsTable-->0): i++) {
		if (R == TimedEventsTable-->i) {
			t = TimedEventsTable-->i;
#ifdef TURN_REPORTING_ONE_BASED;
			if (t < 0) { return -t; }
			return (t - the_time + 1);
#ifnot;
			if (t < 0) { return (-t - 1); }
			return (t - the_time);
#endif;
		}
	}
	return -1;
];

[ GetI7TimerTime R i t;
	for (i=1: i<=(TimedEventsTable-->0): i++) {
		if (R == TimedEventsTable-->i) {
			t = TimedEventTimesTable-->i;
			if (t < 0) { return (the_time - t - 1); }
			return t;
		}
	}
	return -1;
];

[ GetI7TimerInterval R t;
	t = GetI7TimerTime(R);
	if (t < 0) { return -1; }
#ifdef TURN_REPORTING_ONE_BASED;
	return (t - the_time + 1);
#ifnot;
	return (t - the_time);
#endif;
];

[ PrintTimeIntervalEnglish t h m;
	if (t < 0) { print "<no time>"; return; }
	h = t / 60; m = t % 60;
	if (h > 0) {
		print (number) h, " hour"; if (h ~= 1) { print "s"; }
		if (m > 0) { print " and ", (number) m, " minute"; if (m ~= 1) { print "s"; } }
	} else {
		print (number) m, " minute"; if (m ~= 1) { print "s"; }
	}
];
-).

Section 2 - Inform 7

Use one-based turn reporting translates as (- Constant TURN_REPORTING_ONE_BASED; -).

To say (interval - time) as a duration:
	(- print (PrintTimeIntervalEnglish) {interval}; -).

To decide which number is the total number of minutes in (interval - a time):
	(- {interval} -).

To decide which number is the interval between (T1 - time) and (T2 - time):
	(- ({T2} - {T1}) -).

To decide which number is the number of turns until (R - a rule):
	(- GetI7TimerTurns({R}) -).

To decide what time is the time when (R - a rule):
	(- GetI7TimerTime({R}) -).

To decide what time is the time until (R - a rule):
	(- GetI7TimerInterval({R}) -).

To decide if scheduled (R - a rule):
	let turns be the number of turns until R;
	if turns is less than zero, no;
	yes.

To decide if (when - time) is invalid:
	(- ({when} < 0) -).

Extended Timers ends here.

---- DOCUMENTATION ----

This extension was originally developed and tested using Inform 4X60, and later updated for 5Z71.  Since it uses a lot of I6 code and fiddles with some Inform internal structures, it's possible this may not work with earlier or later versions.  (If so, drop me a line and I'll see what I can do.)

For suggestions and feedback, Gavin Lambert can be contacted via "http://www.mirality.co.nz/".

Inform provides the ability to define named rules for specific events.  The included example is an expansion of the example shown in the manual (chapter 9.11 as of this writing) that uses some of the new phrases defined in this extension.

The new phrases defined here are:

	say (a time) as a duration
	the total number of minutes in (a time)
	the interval between (a time) and (another time)
	the number of turns until (some event)
	the time when (some event)
	the time until (some event)
	if scheduled (an event)
	if (a time) is invalid

Most of these should be fairly self-explanatory (at least after looking at the example), except perhaps for the last two.  Inform only remembers events up until they occur (which is why there is no "time since (some event)" in this list), which means that an attempt to request "the number of turns until the bomb explodes" will fail if the bomb has already exploded or if the bomb hasn't started ticking yet.  The "number of turns" phrase reports failure by returning a negative number of turns; the time phrases do the same, but since this is harder to test for, the "is invalid" phrase is provided as a convenience.  This will be true if the time is negative, and hence whether the event could be found or not.  If you're using these phrases within "say", though, it's better to test for "if scheduled" beforehand to avoid running into this.

The "total number of minutes" is only really useful for intervals or durations, not absolute times.  But this can be handy if you want to do maths involving intervals longer than an hour.

The "interval between" two times assumes that the second time is after the first.  If you pass them the other way around, then you will get a negative interval.

One more caveat: due to the way that Inform's processing structure works, the prompt and status line represent the turn that the player is about to make.  This means that anything shown there will be one turn/minute less than anything shown prior to that, and the same as anything shown during processing of the player's about-to-be-entered command.

By default, during the turn (or when printing the prompt/status at the start of the turn) that the event occurs, the time is equal and the interval is zero.  If you prefer having the last turn count returned be one instead, then you can "Use one-based turn reporting", which will change this.  (I think it looks really weird when doing that, but some people might prefer it.)  Note that using this option will make the count shown in the turn the timer is started be one higher than it ought to be.  Try it with the egg timer example and see.

Also, it assumes that one turn is one minute, in order to return sensible values in cases such as having started a "turns" timer and then asking what time it finishes.  While this is standard in I7, and there is no standard way to alter this from I7, the underlying I6 code does admit to the possibility of a different clock rate.  So if you've changed that somehow then you could run into trouble.  And of course there'll be a mismatch between turns and time whenever you manually change the time to something else.

(I'm not entirely happy with "if scheduled X".  I'm open to better suggestions.)


Example: * Descriptive Egg Timing - The chicken shaped egg timer from the manual gets a makeover.

	*: Include Extended Timers by Gavin Lambert.

	The Chamber is a room. "A fairly boring waiting room."

	An egg-timer is in the Chamber. "Resting here is a plastic egg timer in the shape of a chicken, which can be pressed to set it going."
	Understand "timer" or "egg timer" as the egg-timer.
	The description is "It is [if scheduled egg-timer clucks]ticking merrily away. It looks like it has [the time until the egg-timer clucks as a duration] to go.[otherwise]silent."

	Instead of pushing the egg-timer:
	     The egg-timer clucks in four turns from now; say "It begins to mark time.  It looks like it'll be done in [the time until the egg-timer clucks as a duration]."

	At the time when the egg-timer clucks: say "'Cluck! Cluck! Cluck!' says the egg-timer."

	test me with "x timer / push timer / x timer / g / g / g / g".

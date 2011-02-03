Native Time Control by Tim Pittman begins here.

"Allows the author control of the speed at which time passes in a story without creating new rules or replacing old ones."

Section on controlling time

To change the/-- speed of time to (speed - a number): (- SetTime( the_time, {speed}); -).
To restore the/-- speed of time to normal: (- SetTime( the_time, 1); -).
To stop time: (- SetTime( the_time, 0); -).

Section on time properties

To decide what number is the speed of time: (- time_rate -).
To decide what number is the number of turns before time advances: (- (time_step) -).

Section on testing time

To decide if time is slow: (- (time_rate < -1) -).
To decide if time has stopped: (- (time_rate == 0) -).
To decide if time is fast: (- (time_rate > 1) -).
To decide if time is normal: (- (time_rate == 1 or -1) -).

To decide if time is not slow: (- (time_rate > 1) -).
To decide if time has not stopped: (- (time_rate ~= 0) -).
To decide if time is not fast: (- (time_rate < 1) -).
To decide if time is not normal: (- (time_rate ~= 1 or -1) -).

Native Time Control ends here.

---- DOCUMENTATION ---- 

This extension allows the author to control time in a fashion that is native to Inform 6 (hence the name). This extension is super small, as it does not create new rules or variables, but uses rules and variables already built into Inform 6. While looking through the documentation of the template layer of Inform 7, I found that the advance time rule is coded so that time (minutes) can pass by at different rates if a variable was set. Graham Nelson also made a comment about how he think this will be used in the future. Well here it is!

In order to change the speed of time, use:

	When play begins:
		change the speed of time to 2.

This phrase doubles the speed of time. Now, every turn, two minutes will pass. Changing the speed of time to 3 will make 3 minutes pass per turn. To restore the speed of time back to normal, change the speed of time to 1 or use:

	restore the speed of time to normal.

Also, if you have a "Timeless Void" you can use the following phrase:

	After looking while the location is the Timeless Void:
		stop time.

This phrase essentially sets the speed of time to 0. That's speeding up time; now you can put the phrase "time flies when you're having fun" to literal use! Now about the converse of that statement, "time drags when you're bored":

	After examining the clock:
		say "Time seems to slow as you watch the second hand tick...";
		change the speed of time to -2.

This statement, despite looking like it puts time in reverse, actually slows time. Built into the advance time rule is a function that takes a negative number and makes it so that the negative of that number is how many turns passes BEFORE it advances time. In other words, if you say "change the speed of time to -2", you are actually saying "wait 2 turns before advancing time by 1 minute". So when the speed of time is -2, time will advance on the 2nd turn. If the speed of time is -3, time will advance on the 3rd turn. As a result, we can use:

	the number of turns before time advances

This variable can only be read. If we are slowing down time, this will tell us how many turns are left before the clock flips to the next minute. If the number of turns before time advances is 1, then the minute will change at the end of that turn (Note: the advance time rule takes place after the action has occurred and when the number of turns reaches 0, the number immediately jumps back up to negative the speed of time.). If the number of turns is ever 0, then time is moving forward at a normal or advanced rate (read, the speed of time is positive).

Note: When the speed of time is -1, then time will move forward just like the speed of time is 1. However, the number of turns before time advances will always be 1 when the speed of time is -1, and the number of turns will always be 0 when the speed of time is 1.

Finally, this extension also creates the following tests to use in if statements:

	if time is slow...
	if time is fast...
	if time is normal...
	if time has stopped...

	if time is not slow...
	if time is not fast...
	if time is not normal...
	if time has not stopped...

The "not" statements may seem redundant, but they test for different things. The phrase "if time is slow" is not the same as "if time is not fast" because not being fast means that it could be normal or stopped as well as slow. The "not" statements test the opposite of the not "not" statements. (Try saying that five times fast). Also note that "if time is normal" is true if the speed of time is 1 or -1, because either one has the same effect on the clock.

Example: * Quick Reference Table - A quick reference table is provided here, which shows what number to use to produce what effect and what tests will work in that situation.

	Table of Speed of Time Effects
	Num	Time Advancement	Test
	...	...	...
	4	+4 min per 1 turn	time is fast
	3	+3 min per 1 turn	time is fast
	2	+2 min per 1 turn	time is fast
	1	+1 min per 1 turn	time is normal
	0	+0 min	time has stopped
	-1	+1 min per 1 turn	time is normal
	-2	+1 min per 2 turns	time is sow
	-3	+1 min per 3 turns	time is slow
	-4	+1 min per 4 turns	time is slow
	...	...	...

Example: *** Passing the Time - Sitting in a waiting room, you wait for 10 am to come, but time goes slower as you watch the time while time goes faster if you play with your kid.

This example shows what you can do with speed of time manipulation. This example is fairly complex; it uses other advance features, such as punctuation removal and topic matching to make a somewhat interesting game. The ear infection thing came about because of the unpredictable/uncontrollable nature of topic-matching conversation.

	*: "Passing the Time" by Tim Pittman

	Include Native Time Control by Tim Pittman.

	Include Punctuation Removal by Emily Short.

	When play begins:
		change the right hand status line to "[time of day]";
		restore the speed of time to normal.

	The Waiting Room is a room. "The waiting room of the doctor's office. Many sick people line the walls, all sitting in chairs waiting for check-ups and the like. Your kid, [Joey], sits next to you, waiting (im)patiently for the doc to call you. Time seems to slow down when your looking at the clock...".

	The sick people are a backdrop in the Waiting Room. The description is "Many people sit and cough and sneeze and turn green and... eww... I think he's about to puke...". Instead of doing something except examining with the sick people, say "You really don't want to get infected.".

	The clock is in the waiting room. It is fixed in place. "The clock on the wall reads [time of day in words]." The description is "The clock on the wall reads [time of day in words].". 	Understand "time" as the clock.

	After examining the clock:
		say "Time seems to slow down as you watch the clock...";
		slow down time.

	Joey is a man in the waiting room. The description is "Joey is sitting on the chair next to you, swinging his feet, waiting for the doctor. He is getting bored quickly. The visit is for the ear infection that he seems to have - the worst part of which is that he can barely hear what anyone is saying. You could try saying something to him about how he feels or about school, but chances are that he'll only hear little bits and pieces...".

	To slow down time:
		if time is normal: [which checks if the speed of time is 1]
			change the speed of time to -2;
		otherwise:
			change the speed of time to (the speed of time - 1).

	To speed up time:
		if time is normal: [which also checks if the speed of time is -1 (as they have the same effect), which is useful here]
			change the speed of time to 2;
		otherwise:
			change the speed of time to (the speed of time + 1);
		
	Instead of Kissing Joey: 
		say "You wrap your arm around your son and place a kiss on his forehead. He smiles back at you and mumbles something about feeling a tiny bit better.";
		speed up time.

	Instead of attacking Joey:
		say "You smack Joey playfully upside his head. He gawks back at you and hits you back. Soon you're in a flailing-hands fight with Joey to the scandalized looks of those around you. Joey smiles wide at you after the flailing falls out a short time later.";
		speed up time; speed up time.

	Understand "smack [someone]" or "flail at [someone]" as attacking.
	Understand "kill [someone]" or "murder [someone]" or "destroy [someone]" as a mistake ( "You would never think of it!" ).

	Instead of waking Joey:
		if time is not fast, say "He does look like he's falling asleep over there. Maybe you should talk to him or do something with him.";
		if time is fast, say "Oh he's awake all right.".

	Instead of telling someone about something, try asking the noun about it.
	Instead of answering someone that something, try asking the noun about it.

	Instead of asking Joey about something:
		remove stray punctuation;
		repeat through the Table of Conversation:
			if the topic understood includes topic entry:
				say "[response entry][paragraph break]";
				speed up time;
				rule succeeds;
		say "Joey looks at you, trying to make out what your saying through his stuffed up ears.".

	Table of Conversation
	topic (text)	response (text)
	"sick/feeling/health/feel"	"'I'm feeling fine right now', Joey says in response, 'I can't really hear anything though...'"
	"hearing/listen/hear"	"'What?' Joey replies, as if to illustrate something that you said."
	"fun/bored/smile/frown"	"'No...' Joey replies sarcastically, 'I'm having a real good time right now...'"
	"joke/laugh"	"[if time is slow]'A joke would be nice right now...' Joey quips[otherwise]'You can't tell jokes! Your jokes are horrible!' Joey laughs back.[end if]."
	"chicken/chick"	"'If your telling a joke about a chicken...' Joey smiles.'"
	"ear/infection/hurts/ears/hurt"	"'My ear hurts,' Joey says, trying to cover all bases of the question he barely heard, 'In fact, both of my ears hurt. Do you think I have a double ear 	infection?'"
	"school/homework"	"'I do like how I don't have to go to school today,' Joey replies, smiling, 'I don't have to take my math test today.'"
	"friends/friend"	"'I don't get to have my buddies over today, do I' Joey says, making a face at you."
	"test/math/teacher"	"'I don't care if I miss my math test!' Joey grins happily, 'I'll get any sickness to get out of a math test!'"
	"ebola/aids/flu/malaria"	"'If your naming off some really bad sicknesses that I would rather have than taking my math test...' Joey says, giving you a look."
	"chores/work"	"'Please don't give me any chores when we get home, I'm sick!' Joey whines."


	Instead of saying yes, say "Joey didn't seem to hear you. You nod and he grunts, whatever that means.".
	Instead of saying no, say "Joey didn't seem to hear you. You shake your head and he grunts, whatever that means.".

	This is the different time waiting rule:
		if time is normal, say "Time passes. ";
		if time is slow, say "Time creeps by... ";
		if time is fast, say "Time flies by! ";
		say "It is now [time of day].".

	The different time waiting rule is listed instead of the standard report waiting rule in the Report Waiting rules.

	At 10:00 AM:
		if time is not fast, say "The door to the doctor's offices open and a nurse finally comes out. 'Joey?' She says, looking at her clipboard. You and Joey get up and finally go into the offices. All you can think is, 'It's about time...'";
		if time is fast, say "A door opens somewhere in the office. 'Joey?' the nurse says, flipping through a clipboard. You lean over to Joey and say in his ear 'Joey, party of 2...'. He snickers at the joke as you both get up and go back to see the doctor.";
		end the game in victory.

	Test me with "x clock/x joey/look at time/wake joey/joey, how do you feel?/say what can you hear?/say how are your ears?/yes/z/x clock/look at time/say how's school?/say what math test?/say you want ebola?say what about your friends?/say no you have chores!/say but your said you feel fine!/kiss joey/smack joey/wake joey/z/z/z".

Notice that timed events still work, but only up to 30 minutes after the time the event needs to go off (as stated on page 54 of Appendix-B). Also, the Test me feature is limited to about 30 commands. Therefore, there's no point in making a test me for when time is slow and you reach the end.




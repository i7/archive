Version 1 of Useful Functions by ShadowChaser begins here.

"This is a set of useful functions for use with Inform7 scripts. The functions are - keypress, yes /no, pause and clear, percentage, rankings, and square root."

Section 1 - Inclusions

Include Menus by Emily Short. 
Include Basic Screen Effects by Emily Short. 

Section 2 - Keypress

To decide what number is the key_pressed:
	let keypress be 0;
	while keypress is 0 begin;
		let keypress be the chosen letter;
	end while;
	decide on the keypress.

To decide what number is the key_pressed_with_question (question - some text):
	say "[question][line break]";
	decide on the key_pressed.

Section 3 - Yes / No

To decide what text is the yesno_answer:
	let the answer be "MAYBE";
	let  the exitvalue be 0;
	while the exitvalue  is 0 begin;
		let keypress be the key_pressed;
		if keypress is 89 or keypress is 121 begin;
			let the answer be "YES";
			let the exitvalue be 1;
		otherwise if keypress is 78 or keypress is 110;
			let the answer be "NO";
			let the exitvalue be 1;
		end if;
	end while;
	decide on the answer.

To decide what text is the yesno_answer_with_question (question - some text):
	say "[question][line break]";
	decide on the yesno_answer.

Section 4 - Pause and Clear

To pause_clear:
	say paragraph break;
	let kp be the key_pressed_with_question "Press any key to continue ...";
	clear the screen;
	redraw status line;

To pause_clear (the_message - some text):
	let kp be the key_pressed_with_question the_message;
	clear the screen;
	redraw status line;

To say pause_clear:
	pause_clear.

To say pause_clear (the_message - some text):
	pause_clear the_message.


Section 5 - Percentage

percentage_suffix is some text that varies. The percentage_suffix is "%".
percentage_precision is a number that varies. The percentage_precision is 2.

To (dividend - a number) percentage of (divisor - a number):
	let quotient_integral be (dividend * 100)  / divisor;
	say "[quotient_integral]";
	if percentage_precision > 0 begin;
		say ".[run paragraph on]";
		let quotient_remainder be remainder after dividing dividend by divisor;
		let pp be percentage_precision;
		while pp > 0 begin;
			let quotient_digit be quotient_remainder * 10 / divisor;
			say "[quotient_digit]";
			let quotient_remainder be remainder after dividing (quotient_remainder * 10) by divisor;
			let pp be pp - 1;
		end while;
	end if;		
	say "[percentage_suffix]".
	
To say (dividend - a number) percentage of (divisor - a number):
	dividend percentage of divisor.


Section 6 - Rankings

Table of Example Equal Rankings
rank
"very poor"
"poor"
"average"
"good"
"very good"

To decide what text is the EqualRankOf (value - a number) out_of (max_value - a number)  from_table (rankTable - a table-name):
	let max_rows be the number of rows in rankTable;
	let row_number be (value * max_rows) / max_value;
	if row_number is 0, let row_number be 1;
	decide on the rank in row row_number of rankTable.
	
Table of Example Ranged Rankings
maxpercent	rank
10		"poor"
25		"fair"
75		"average"
100		"good"

To decide what text is the RangedRankOf (value - a number) out_of (max_value - a number) from_table (rankTable - a  table-name):
	let max_rows be the number of rows in rankTable;
	let row_percent be (value * 100) / max_value;
	let rank_spoken be 0;
	repeat with row_number running from 1 to the number of rows in rankTable begin;
		if row_percent <= maxpercent in row row_number of rankTable begin;
			if rank_spoken is 0 begin;
				decide on the rank in row row_number of rankTable;
				let rank_spoken be 1;
			end if;
		end if;
	end repeat.

Section 7 - Square Root

To decide what number is the square_root of (x - a number):
	if x is 0 begin;
		decide on 0;
	otherwise;
	     let guess be (x / 2) + 1;
	     let guess2 be x / guess;
	     let guess2 be guess + guess2;
	     let guess2 be guess2 / 2;
        	     while guess2 < guess begin;
                	let guess be guess2;
                	let guess2 be x / guess;
	     	let guess2 be guess + guess2;
	     	let guess2 be guess2 / 2;
	     end while;
                 decide on guess;
	end if.

		
Useful Functions ends here.

---- DOCUMENTATION ----

Section: Description

This extension contains some useful functions that can be used in inform7 stories. The functions are detailed below:-

Section: Dependencies

The following extensions are loaded by this one:-

Menus by Emily Short. 
Basic Screen Effects by Emily Short. 

Section: Usage

KEYPRESS :-

	key_pressed
	key_pressed_with_question "..."

This optionally displays a message and waits for a key press, returning the numerical key code of the key pressed.

For example, 

	if the key_pressed is 65 or the key_pressed is 127 begin;
		" 'A' pressed.";
	end if;


	while the key_pressed_with_message "Press SPACE to continue." <> 32 begin;
	end while.

YESNO :-

	yesno_answer
	yesno_answer_with_question " ...."

This optionally displays a message and waits for the player to press 'Y' or 'N'. The result of the answer is either "YES" or "NO".

PAUSE_CLEAR :-

	pause_clear.
	pause_clear " ....".

	say "[pause_clear]";
	say "[pause clear some_text]";

This optionally displays a message and waits for the player to press a key. It then clears the screen and redraws the status line.

PERCENTAGES :-

	say "x percentage of y";

This calculates the percentage value of a number divided by another number. The default precision is 2 decimal points and the default suffix is "%". These can be changed by the following statements:-

	The percentage_precision is x.
	The percentage_suffix is " ... ".


e.g, 
	say "[8 percentage of 12]";

RANKINGS:-

	Table of Strength
	rank
	"puny"
	"weak"
	"average"
	"strong"
	"muscle-bound"

	Table of Dexterity
	maxpercent	rank
	10		"completely uncoordinated"
	25		"uncoordinated"
	75		"coordinated"
	100		"marksman"


	let ranktext be EqualRankOf 5 out_of 12 from_table Table of Strength;
	say "[EqualRankOf 3 out_of 10 from_table Table of Strength]";
	say "[RangedlRankOf 3 out_of 10 from_table Table of Dexterity]";

These functions use the values given to look up a piece of text indicating the ranking of the initial value from the max value. EqualRank applies equal weightings to each "level" within the table. PercentageRank uses a percentage lookup. The first column is the MAXIMUM percentage that the value needs to be to reach the rank.

SQUARE ROOT:-

	let num be the square_root of 64;

This is a moderately inefficient function for calculating the square root of a value. Due to the fact that Inform7 has a very low integer precision, this function only returns the integer approximation (rounded down) of the square root, and stops working properly for numbers above +32767.

Example: ** The Bridge of Death - A very basic example that makes use of most of the functions in this extension.

	*: "The Bridge of Death" by Shadowchaser

	Include Useful Functions By ShadowChaser.
	Include Basic Screen Effects by Emily Short.

	Use no scoring. 

	The Bridge of Death is a Room. "You are standing in front of a rickety bridge traversing a huge gorge.".

	The rickety bridge is scenery in the Bridge of Death. The description is "It looks quite flimsy and can only take the weight of one person at a time.".

	The huge gorge is scenery in the bridge of death. The description is "This is the Gorge of Eternal Peril. It makes you shudder.";

	Approaching is an action applying to one visible thing.

	understand "approach [something]" as approaching.

	Instead of entering the rickety bridge, try approaching the rickety bridge.

	Carry out approaching:
		if the noun is not the rickety bridge begin;
			Say "That is not crossable.";
		else;
			let continue_val be 0;
			while continue_val is 0 begin;
				clear the screen;
				redraw status line;
				say paragraph break;
				let answer be yesno_answer_with_question "There is no turing back. Do you wish to continue (Y / N)?"; 
				if answer is "NO" begin;
					let continue_val be 1;
					Say "Coward!";
				else;
					if answer is "YES" begin;
						let continue_val be 1;
						ask the questions;
					end if;
				end if;
			end while;
		end if.

	The answer_number is a number that varies. The answer_number is 0.
	The question_number is a number that varies. The question_number is 0.

	To ask_the_question:
		let continue_val be 0;
		while continue_val is 0 begin;
			clear the screen;
			redraw status line;
			say paragraph break;
			say "[question_text]";
			say paragraph break;
			let keypress be the key_pressed;
			if keypress is 49 begin;
				let continue_val be 1;
				now the answer_number is 1;
			else if keypress is 50;
				let continue_val be 1;
				now the answer_number is 2;
			else if keypress is 51;
				let continue_val be 1;
				now the answer_number is 3;
			end if;
		end while;

	To say question_text:
		if the question_number is 1 begin;
			say "The old man asks his first question:[paragraph break]";
			say "What is your name?[paragraph break]";
			say "Please type the number of your answer:[paragraph break]";
			say "1. King Arthur.[line break]";
			say "2. Good King Wencelas.[line break]";
			say "3. Elvis - The King.[line break]";
		end if;
		if the question_number is 2 begin;
			say "The old man asks his second question:[paragraph break]";
			say "What is your quest?[paragraph break]";
			say "Please type the number of your answer:[paragraph break]";
			say "1. To run through this stupid example.[line break]";
			say "2. To seek the holy grail.[line break]";
			say "3. I don't do quests.[line break]";
		end if;
		if the question_number is 3 begin;
			say "The old man asks his third question:[paragraph break]";
			say "What is the air-speed velocity of an unladen swallow?[paragraph break]";
			say "Please type the number of your answer:[paragraph break]";
			say "1. What do you mean?  An African or European swallow?[line break]";
			say "2. What's an airspeed?[line break]";
			say "3. What's a swallow?.[line break]";
		end if.

	To ask the questions:
		Say "As you approach the bridge an old man appears and stops you. He stares at you with a baleful eye and says 'Who approaches the Bridge of Death must answer me these questions three, 'ere the other side he see.'[paragraph break]";
		pause_clear;
		ask_the_first_question.

	To ask_the_first_question:
		now the question_number is 1;
		ask_the_question;
		if the answer_number is 1 begin;
			award 1 point;
			Say "The old man says, 'Correct!'";
			say pause_clear;
			ask_the_second_question;
		else if the answer_number is 2;
			Say "You are lifted off your feet by an invisible force and hurled into the chasm below.";
			end_the_game;
		else;
			Say "You are lifted off your feet by an invisible force and hurled into the chasm below.";
			Say "A voice cries out 'Elvis has left the building!";
			end_the_game;
		end if;

	To ask_the_second_question:
		now the question_number is 2;
		ask_the_question;
		if the answer_number is 1 begin;
			Say "You are lifted off your feet by an invisible force and hurled into the chasm below.";
			end_the_game;
		else if the answer_number is 2;
			award 1 point;
			Say "The old man says, 'Correct!'";
			say pause_clear;
			ask_the_third_question;
		else;
			Say "You are lifted off your feet by an invisible force and hurled into the chasm below.";
			end_the_game;
		end if;

	To ask_the_third_question:
		now the question_number is 3;
		ask_the_question;
		if the answer_number is 1 begin;
			award 1 point;
			Say "The old man says, 'What?  I don't know that!' An invisible force lifts him off his feet by and hurls him into the chasm below.";
			end_the_game;
		else if the answer_number is 2;
			Say "You are lifted off your feet by an invisible force and hurled into the chasm below.";
			end_the_game;
		else;
			Say "You are lifted off your feet by an invisible force and hurled into the chasm below.";
			Say "A voice cries out 'Elvis has left the building!";
			end_the_game;
		end if;

	Table of silly taunts
	rank
	"You empty-headed food trough wiper."
	"Your mother was a hamster and your father smelt of elderberries."
	"Now go away or I shall taunt you a second time."

	Table of silly_ranged_taunts
	maxpercent 	rank
	40		"I once more time-a unclog my nose in your direction, sons of a window-dresser!"
	70		"I burst my pimples at you and call your daughter an unrequested silly thing."
	100		"I wave my private parts at your aunties, you heaving lot of second-hand electric donkey bottom biters.";

	To end_the_game:
		say paragraph break;
		say "You have answered [score percentage of 3] of the questions correctly.";
		say line break;
		say RangedRankOf score out_of 3 from_table Table of silly_ranged_taunts;
		say line break;
		say EqualRankOf score out_of 3 from_table Table of silly taunts;
		say line break;
		say "FYI the square root of 256 is [the square_root of 256].";
		if the score is 3 begin;
			end the game in victory;
		else;
			end the game in death;
		end if.

	Test me with "approach bridge".

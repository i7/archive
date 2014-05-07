Simple encryption and decryption actions by Luca G Nieddu begins here.

Part 1 - Low-level I6 stuff, utils

To decide if IsN (N - a number) InInterval1 (Nmin - a number) and (Nmax - a number): (- ({N}>{Nmin}) & ({N}<{Nmax}) -);
To decide if IsN (N - a number) InInterval2 (Nmin - a number) and (Nmax - a number): (- ({N}>={Nmin}) & ({N}<={Nmax}) -);

Include (- 

[ I6Shift a b divider; 
	a = (a-b) % divider; 
	if (a < 0) a = a + divider;
	return a;
]; 

[ I6TABLEROW33 i; 
	i--;
	return 1+i/3;
]; 

[ I6TABLECOL33 i; 
	i--;
	return 1+i%3;
]; 

[ I6TABLEI33 r c; 
	return (r-1)*3+c;
]; 

[ I6Shiftb a b divider; 
	a = (a-b) % divider; 
	if (a <= 0) a = a + divider;
	return a;
]; 
-) 

Part 2 - Tables and texts  btw some texts are part of the interface

Table of TextToNumbers [this eats a load of memory too bad ]
EText (indexed text)	ENum
" "	53
"A"	44
"B"	7
"C"	19
"D"	10
"E"	21
"F"	0
"G"	20
"H"	12
"I"	48
"J"	39
"K"	47
"L"	54
"M"	55
"N"	42
"O"	4
"P"	43
"Q"	37
"R"	60
"S"	33
"T"	11
"U"	52
"V"	27
"W"	6
"X"	2
"Y"	32
"Z"	25
"a"	45
"b"	38
"c"	5
"d"	63
"e"	50
"f"	24
"g"	56
"h"	62
"i"	35
"j"	30
"k"	15
"l"	13
"m"	17
"n"	34
"o"	61
"p"	26
"q"	9
"r"	16
"s"	18
"t"	8
"u"	29
"v"	57
"w"	14
"x"	46
"y"	40
"z"	1
"[quotation mark]"	23
"[']" 	3
"!"	28
":"	22
"."	51
"("	59
")"	31
","	41
";"	58
"-"	49
"?"	36

Table of SquareCodify [square codification base; each row is a 3x3 matrix ]
EText (indexed text) [four strings length 9 with all alphabet+10 additional symbols ]
"QBAK3WGV6"
"LN1T8CJEX"
"P4MID70ZY"
"U5R2F9HOS"

 [ *********************************************************************************************************************************** ]
The IllegalEKey message is some text that varies. The IllegalEKey message is "The given key is invalid. Used illegal characters.".
The ThereisnoEDtext message is some text that varies. The ThereisnoEDtext message is "I don't remember any encrypted message.".
The SuccessEnc message is some text that varies. The SuccessEnc message is "Result of encoding ->".
The SuccessDec message is some text that varies. The SuccessDec message is "Result of decoding ->".
The ItIsEncrypted message is some text that varies. The ItIsEncrypted message is "I can read something strange here... ".
The PlzWait message is some text that varies. The PlzWait message is "Please wait".
The PlzWait symbol is some text that varies. The PlzWait symbol is ".".
The FailSSq message is some text that varies. The FailSSq message is "#BUG#".
The SqrAgain message is some text that varies. The SqrAgain message is "Ok. Repeat with a second number and I'll start to decode.".
The SqrTip message is some text that varies. The SqrTip message is "Enter a number between 1 and".

 [ *********************************************************************************************************************************** ]
The Text to be encodecoded is some indexed text that varies. The  Text to be encodecoded is "".
The Last encodecode result is some indexed text that varies. The Last encodecode result is "".
The LastRheard is some number that varies. The LastRheard  is -1.
The LastCheard is some number that varies. The LastCheard  is -1.

Book 1 - Pure nerdy procedures

Part 1 - Shift encoding

 [ *********************************************************************************************************************************** ]
 [ *** I6 macros *** ]
To shift (A0 - an existing number variable) by (B0 - a number) dividing (C0 - a number): (- {A0} = I6Shift({A0}, {B0}, {C0}); -). [wraps a number
 from 0 to C0, moving it by an amount of B0 too... Uses a tiny I6-assembly toy]
 To unshift (A0 - an existing number variable) by (B0 - a number) dividing (C0 - a number): (- {A0} = I6Shift({A0}, -{B0}, {C0}); -). [reversal of above]
 
 [ *********************************************************************************************************************************** ]
 [ *** Shift *** ]

To decide which  indexed text is the shf-codification of (V - an indexed text) with (K - an indexed text):
	if K is "" or V is "", decide on V; [Empty key -> no encode]
	let Vi be indexed text;
	let C be a number;
	let SHF be a number;
	let Imax be a number;
	now Imax is the number of characters in V;
	let Icur be a number;
	now C is 0; now SHF is 0; now Icur is 1;
	say "[PlzWait message]";
	repeat with I running from 1 to Imax begin;
		let trouble be 0;
		[1: find the number that represent the nth character (in the string 2be coded).]
		now Vi is the character number I in V;
		if there is a ENum corresponding to a EText of Vi in the Table of TextToNumbers,
			now C is the ENum corresponding to a EText of Vi in the Table of TextToNumbers;  [to find that number.]
		else
			now trouble is 1; [Error]
		if trouble is 1, next;
		[1: done! We can reuse Vi too.]
		[2: find the number that represent the nth character (in the key string).]
		now SHF is Icur;
		[trouble! : SHF almost surely now can be over the end of K. wrap it to the end (shift base 1)]
		shift2 SHF by 0 dividing number of characters in K;
		now Vi is the character number SHF in K; [Reuse Vi.]
		if there is a ENum corresponding to a EText of Vi in the Table of TextToNumbers,
			now SHF is the ENum corresponding to a EText of Vi in the Table of TextToNumbers;  [to find that number.]
		else
			now trouble is 1; [Error]
		[2: done! We can reuse Vi too.]
		[3: do some mangling with C and SHF - for example...]
		if trouble is 1, next;
		shift C by SHF dividing number of rows in the Table of TextToNumbers;
		increment C; [avoid error! VERY important! Table indexes run from 1 not from 0!!!]
		[3: done! We can reuse Vi too.]
		[4: We have a number but we need a character to put it into V!]
		now Vi is the EText in row C of the Table of TextToNumbers;
		replace character number I in V with Vi; [Reuse Vi.]
		increment Icur; 
		say "[PlzWait symbol]";
	[4: Done - now let's go on until the text in V ends!]
	end repeat;
	say "[line break]";
	decide on V.

To decide which  indexed text is the deshf-codification of (V - an indexed text) with (K - an indexed text):
	if K is "" or V is "", decide on V; [Empty key -> no decode]
	let Vi be indexed text;
	let C be a number;
	let SHF be a number;
	let Imax be a number;
	let Jmax be a number;
	now Imax is the number of characters in V;
	now Jmax is  the number of rows in the Table of TextToNumbers;
	let Icur be a number;
	now C is 0; now SHF is 0; now Icur is 1;
	say "[PlzWait message]";
	repeat with I running from 1 to Imax begin;
		let trouble be 1;
		[1: find the number that represent the nth character (in the string 2be coded).]
		now Vi is the character number I in V;
		now C is 0; [avoid error!]
		repeat with J running from 1 to Jmax begin;
			choose row J in the Table of TextToNumbers;
			if Etext entry is Vi begin;
				now C is J minus 1; [avoid error! VERY important; set C back to normal 0-based index ]
				now trouble is 0;
				break;
			end if;
		end repeat;
		if trouble is 1, next; [Error]
		[1: done! We can reuse Vi too.]
		[2: find the number that represent the nth character (in the key string).]
		now SHF is Icur;
		[trouble! : SHF almost surely now can be over the end of K. wrap it to the end (shift base 1)]
		shift2 SHF by 0 dividing number of characters in K;
		now Vi is the character number SHF in K; [Reuse Vi.]
		if there is a ENum corresponding to a EText of Vi in the Table of TextToNumbers,
			now SHF is the ENum corresponding to a EText of Vi in the Table of TextToNumbers;  [to find that number.]
		else
			now trouble is 1; [Error]
		if trouble is 1, next;
		[2: done! We can reuse Vi too.]
		[3: do some mangling with C and SHF - for example...]
		unshift C by SHF dividing number of rows in the Table of TextToNumbers;
		[3: done! We can reuse Vi too.]
		[4: We have a number but we need a character to put it into V!]
		if there is a EText corresponding to a ENum of C in the Table of TextToNumbers,
			now Vi is the EText corresponding to a ENum of C in the Table of TextToNumbers;  [to find that number.]
		else
			now trouble is 1; [Error]
		if trouble is 1, next;
		replace character number I in V with Vi; [Reuse Vi.]
		increment Icur; 
		say "[PlzWait symbol]";
	[4: Done - now let's go on until the text in V ends!]
	end repeat;
	say "[line break]";
	decide on V.
	
To decide whether (K - an indexed text) isnovalidkey: 
	if K is "", decide yes; [Empty key -> no decode]
	let Ki be indexed text;
	let Imax be a number;
	let Jmax be a number;
	now Imax is the number of characters in K;
	now Jmax is  the number of rows in the Table of TextToNumbers;
	repeat with I running from 1 to Imax begin;
		let trouble be 1;
		now Ki is the character number I in K;
		repeat with J running from 1 to Jmax begin;
			choose row J in the Table of TextToNumbers;
			if Etext entry is Ki begin;
				now trouble is 0;
				break;
			end if;
		end repeat;
		if trouble is 1, decide yes; [Error]
	end repeat;
	decide no. [K is solely made of valid data]
 [ *********************************************************************************************************************************** ]
	
Part 2 - Table encoding

To decide which number is the row33 of (i - a number):  (- I6TABLEROW33({i}); -).
To decide which number is the col33 of (i - a number):  (- I6TABLECOL33({i}); -).
To decide which number is the index33 of (r - a number) and (c - a number):  (- I6TABLEI33({r}, {c}); -).
To shift2 (A0 - an existing number variable) by (B0 - a number) dividing (C0 - a number): (- {A0} = I6Shiftb({A0}, {B0}, {C0}); -). [in base 1 ]
 
 [ *********************************************************************************************************************************** ]
 [ *** Square - helper plain SLOW routines *** ]

To decide which  number is the SubSquare of (K - an indexed text):
	let TbEnJ be indexed text;
	let Imax be a number;
	now Imax is the number of rows in the Table of SquareCodify;
	let Jmax be a number;
	repeat with I running from 1 to Imax begin;
		choose row I in the Table of SquareCodify;
		now Jmax is the number of characters in Etext entry;
		repeat with J running from 1 to Jmax begin;
			now TbEnJ is the character number J in Etext entry;
			if TbEnJ is K ,decide on I; [I is the SubSquare]
		end repeat;
	end repeat;
	decide on 0. [invalid!!!]
	
To decide which  number is the SSqRow of (K - an indexed text):
	let TbEnJ be indexed text;
	let Imax be a number;
	now Imax is the number of rows in the Table of SquareCodify;
	let Jmax be a number;
	repeat with I running from 1 to Imax begin;
		choose row I in the Table of SquareCodify;
		now Jmax is the number of characters in Etext entry;
		repeat with J running from 1 to Jmax begin;
			now TbEnJ is the character number J in Etext entry;
			if TbEnJ is K ,decide on the row33 of J; [I is the SubSquare]
		end repeat;
	end repeat;
	decide on 0. [invalid!!!]
	
To decide which  number is the SSqCol of (K - an indexed text):
	let TbEnJ be indexed text;
	let Imax be a number;
	now Imax is the number of rows in the Table of SquareCodify;
	let Jmax be a number;
	repeat with I running from 1 to Imax begin;
		choose row I in the Table of SquareCodify;
		now Jmax is the number of characters in Etext entry;
		repeat with J running from 1 to Jmax begin;
			now TbEnJ is the character number J in Etext entry;
			if TbEnJ is K ,decide on the col33 of J; [I is the SubSquare]
		end repeat;
	end repeat;
	decide on 0. [invalid!!!]
	
To decide which indexed text is the SSqText given (SSq - a number) and (r - a number) and (c - a number):
	[you failed!!!]
	if  r < 1, 	decide on "[FailSSq message]R[r]#";
	if  c < 1, 	decide on "[FailSSq message]C[c]#";
	if  SSq < 1, 	decide on "[FailSSq message]Ssq[Ssq]#";
	if  r > 3, 	decide on "[FailSSq message]R[r]#";
	if  c > 3, 	decide on "[FailSSq message]C[c]#";
	if  SSq > 4, 	decide on "[FailSSq message]Ssq[Ssq]#";
	[you did not fail maybe]
	choose row SSq in the Table of SquareCodify;
	let J be a number;
	let TbEnJ be indexed text;
	now J is the index33 of r and c;
	now TbEnJ is the character number J in Etext entry;
	decide on TbEnJ. 

To decide which number is the help2get ValidCharN (idxchar - a number) given  (K - an indexed text):
	let trouble be 0;
	let SSq be a number;
	let Ki be indexed text;
	let cidx be a number;
	let curchar be 0;
	let cidx be 1;
	let MaxC be the number of characters in K;
	while cidx <= MaxC begin;
		now  Ki is the character number cidx in K;
		now SSq is the SubSquare of Ki;
		unless SSq is 0, increment curchar; [found a valid one and curchar++]
		if curchar is idxchar begin;
			decide on cidx; [i want exactly the idxchar's valid char]
			break;
		end if;
		increment cidx;
	end while;
	decide on 0.  [fail]

To decide which number is the help2count ValidCharN given  (K - an indexed text):
	let trouble be 0;
	let SSq be a number;
	let Ki be indexed text;
	let cidx be a number;
	let curchar be 0;
	let cidx be 1;
	let MaxC be the number of characters in K;
	while cidx <= MaxC begin;
		now  Ki is the character number cidx in K;
		now SSq is the SubSquare of Ki;
		unless SSq is 0, increment curchar; [found a valid one and curchar++]
		increment cidx;
	end while;
	decide on curchar.  [count of valid chars]
	
[ *********************************************************************************************************************************** ]
[ *** Square *** ]

[ really, REALLY slow but at least it does NOT need a large amount of statically allocated memory.
Inform7 adventures aren't speed-critical but can be memory critical. Sorry for that! ]
To decide which  indexed text is the square-codification of (V - an indexed text) with (rSHF - a number) and (cSHF - a number):
	let Vmax be a number;
	now Vmax is the help2count ValidCharN given V;
	if  Vmax is 0, decide on V; [No valid chars at all!]
	let CodeR be a number;
	let CodeC be a number;
	let CodeSSq be a number;
	let SHFhelp be a number;
	let NewChar be indexed text;
	let NewV be indexed text;
	now NewV is "";
	shift2 rSHF by 0 dividing Vmax;  [wraparound at first]
	shift2 cSHF by 0 dividing Vmax;  [wraparound at first]
	say "[PlzWait message]";
	repeat with I running from 1 to the number of characters in V begin;
		now NewChar is the character number I in V; [Normally don't do encoding of any kind... ]
		now CodeSSq is the SubSquare of NewChar;
		unless CodeSSq is 0 begin; [Encoding condition ]
			now SHFhelp is the help2get ValidCharN rSHF given  V;
			now CodeR is the SSqRow of the character number SHFhelp in V;
			now SHFhelp is the help2get ValidCharN cSHF given  V;
			now CodeC is the SSqCol of the character number SHFhelp in V;
			now NewChar is the SSqText given CodeSSq and CodeR and CodeC;
		end unless;
		now NewV is "[NewV][NewChar]";
		shift2 rSHF by -1 dividing Vmax;  [wraparound increm]
		shift2 cSHF by -1 dividing Vmax;  [wraparound increm]
		say "[PlzWait symbol]";
	end repeat;
	say "[line break]";
	decide on NewV.
	
Book 2 - Interface for procedures

Part 1 - Definitions

Ciphered stuff is a kind of things.
Ciphered  stuff has some indexed text called puzzling message. The puzzling message of a Ciphered  stuff is usually "".

Setting encodecode string is an action applying to a topic.  [don't EVER try to change "a topic"!!! inform wants only "a topic"! ]

Shift-Encoding is an action applying to a topic.  [don't EVER try to change "a topic"!!! inform wants only "a topic"! ]
Understand "shf encrypt with [text]" as Shift-Encoding.  [don't EVER try to change  "[text]"!!! inform wants only "[text]"! ]
Shift-Decoding is an action applying to a topic.  [don't EVER try to change "a topic"!!! inform wants only "a topic"! ]
Understand "shf decrypt with [text]" as Shift-Decoding.  [don't EVER try to change  "[text]"!!! inform wants only "[text]"! ]

Square-Decoding is an action applying to a number.  [don't EVER try to change "a topic"!!! inform wants only "a topic"! ]
Understand "sqr decrypt with [number]" as Square-Decoding.  [don't EVER try to change  "[text]"!!! inform wants only "[text]"! ]

[ *********************************************************************************************************************************** ]
Part 2 - Dumb interface

[ *** Common *** ]

after examining Ciphered stuff  (this is the fundamental save the coded text inside memory sample helper rule):
	let TextE be indexed text;
	now TextE is the puzzling message of the noun;
	if TextE is "" begin;
		continue the action;
	end if;
	now Text to be encodecoded is TextE;
	say "[ItIsEncrypted message][TextE].[line break]".
	
Instead of Setting encodecode string (this is the fundamental put the text to be encodecoded in memory rule):   [unused; you can use it as liked ]
	let TextToBeProcessed be indexed text;
	now TextToBeProcessed is the topic understood;
	if TextToBeProcessed is "" begin;
		say "[ThereisnoEDtext message]";
		stop the action;
	end if;
	now Text to be encodecoded is TextToBeProcessed.
	
[ *********************************************************************************************************************************** ]
[ *** Shift *** ]

Before Shift-Encoding a topic (this is the shf nonempty keys in memory rule):
	let TextKey be indexed text;
	now TextKey is the topic understood;
	if Text to be encodecoded is "" begin;
		say "[ThereisnoEDtext message]";
		stop the action;
	end if;
	if TextKey isnovalidkey begin;
		say "[IllegalEKey message]";
		now Last encodecode result is "";
		stop the action;
	end if.
	
Instead of Shift-Encoding a topic (this is the fundamental shfencode the text already in memory rule):
	let TextKey be indexed text;
	now TextKey is the topic understood;
	now Last encodecode result is the shf-codification of Text to be encodecoded with TextKey;
	say "[SuccessEnc message][Last encodecode result].[line break]".
	 
Instead of Shift-Decoding a topic (this is the fundamental shfdecode the text already in memory rule):
	follow the shf nonempty keys in memory rule;
	let TextKey be indexed text;
	now TextKey is the topic understood;
	now Last encodecode result is the deshf-codification of Text to be encodecoded with TextKey;
	say "[SuccessDec message][Last encodecode result].[line break]".
	
[ *********************************************************************************************************************************** ]
[ *** Square *** ]

Before Square-Decoding a number (this is the sqr gtzero key rule):
	let N be the number understood;
	let M be a number;
	now M is the number of characters in the Text to be encodecoded;
	if M is 0 begin;
		say "[ThereisnoEDtext message]";
		stop the action;
	end if;
	decrement M;
	unless IsN N InInterval2 1 and M begin;
		say "[SqrTip message] [M].";
		now Last encodecode result is "";
		stop the action;
	end unless;
	if  LastRheard is -1 begin;
		now LastRheard is N;
		say "[SqrAgain  message]";
		stop the action;
	end if;

Instead of Square-Decoding a number (this is the fundamental sqrdecode the text already in memory rule):
	now the LastCheard is the number understood;
	now Last encodecode result is the square-codification of Text to be encodecoded with LastRheard and LastCheard;
	now LastRheard is -1;
	now LastCheard is -1;
	say "[SuccessDec message][Last encodecode result].[line break]".
	
Simple encryption and decryption actions ends here.

---- DOCUMENTATION ---- 

This is an extension that will allow you to create "ciphered stuff"; objects that when examined reveal strange messages.
(examine will trigger a custom action on those special objects)
(note that I wrote the actions as a sample; you can also ignore them completely and use directly the cyphering routines in your adventure...)

This action (examine "ciphered stuff" objects) stores in memory the message. From now on, the player can try to decipher the message, using by default unlimited attempts.
In general, you can deal with shift and square ciphers. They have a completely different conception, just sharing the concept of using a "table" as the alphabet.

Each cipher has its own table, and you can change those in any moment! (Just be careful ... follow the basic rules listed in -> How can I customize the routines?).

Note: Every symbol not listed into the table of the used cipher is skipped by the algorithm. You can use this as a hint to help the poor player to decipher.

In poor words: Shift ciphering tends to be easier to decode on large texts (in relation to the length of the key). Square ciphering tends to be easier to decode on short texts.

Speaking of shift ciphering:
Apparently it's a very hard task; if key and message have the same lengh, the task is in general impossible. 

But if the chosen key was short enough, after some attempts a smart player should guess.
A key is short if the text to be decrypted is more than 4 times longer than the key ( that should contain less than 6 characters, and be made of a meaningful word). 

Speaking of square ciphering:
It requires as input two numbers. (No key! The key is the text itself, and of couse the table).
The difficulty rapidly grows with the square of the text length! A  text of 6 symbols may need max 36 attempts, but a text of 7 symbols may need max 49!

Each symbol of the table is listed into four sub-tables (squares) of 3x3 entries.
How the cipher works? Actually, the program finds the sub-square of each symbol. Then it finds the ROW of the subsquare of the symbol in a different position in the same text.
It moves to another position in the source text to find the s.square COLUMN of another symbol.
The final result is the symbol corresponding to subsquare of the starting symbol BUT a different row and column.

So, if you know how the symbol are arranged inside the tables AND the most frequent symbols stay into a particular subsquare, the decryption is not so hard.
I mixed a lot the table so I don't think that now the decryption is so easy.

***

Those rules can be ignored if you put your key somewhere into your game, for example in a hint or in a description.

FAQ:
- Drawbacks?
The use of some indexed text limits this to be used with glulx. Also glulx is the only framework that gracefully handles this kind of data.
Very slow and memory expensive (relatively). Should be rewritten in I6... but I don't know how does I6 understand indexed text. Fairly complicated I guess.

- Advantages?
Very easy to customize. See -> How can I customize the routines?

- How to implement decryption in my game (blocking encryption)?
How do I create an object with an encrypted message embedded?
Study my example "The room of mystery". It's very easy.

- How to get the encrypted message (aka "The puzzling message") from a  known plain text?
	1) Decide a key text (see my advices above, if it must be plainly guessed!)
	2) In the example Sockpuppet, replace my fake puzzling message with your text.
	3) Test it with "encrypt with key" + a space + the key chosen.
	4) After some time, you'll get the answer.

- How do I check if the user successfully decrypted the message?
A possible method... (Lazy enough I know!)
Insert a relatively long keyword in it, like "apparently". Then check if Last encodecode result matches the text  "apparently". See my example "The room of mystery".
Else, match the entire  Last encodecode result  against the entire answer. (to be sure...)
Warning... Whenever the player decrypts, the Last encodecode result varies! So use custom actions that will trigger just after "Shift-Decoding".

- How do I enable the player to decrypt a message without using objects?
Use the action Setting encodecode string; currently it's left unused just for you.

- How can I translate the extension?
IllegalEKey message, ThereisnoEDtext message, SuccessEnc message, SuccessDec message, ItIsEncrypted message contain all the shown messages.

- How the routines work?
They use a table and a very lame block cipher routine. The routines itself can be easily (I hope) readed, as they make just some search on the table itself and some number mangling.

Note that all characters not included inside table are NOT ciphered / deciphered.
	
- How can I customize the actions?
The actions I wrote are just a skeleton... You can surely write better ones.

- How can I customize the routines?
You can modify the tables as much as you please. For most users by the way to change the table only is more than enough for a customization!

The table of SHIFT routines must strictly have those properties:
	1) Every textual entry (first column) must translate to, or be, a single UNIQUE character.
	2) Every entry must be not empty.
	3) The numbers and the letters can be at any order and in theory as much as you like. I suggest you to leave letters in order, and to shuffle the numbers to get different effects.
	4) The numbers (second column) must be all numbers from zero to the number of entries less one, without duplicates. So be careful if you erase some rows!!!
	Else you can get nasty bugs.

About the SHIFT routines:
The routine can be easily (I hope) readed, as it makes just some search on the table itself and some number mangling.
You can also modify it for example with bit-xor, from the great library "Bitwise Operators by Bart Massey", instead of my shift/unshift routines.
If you use bitwise ops, remember that your table must have a number of entries equal to a power of two. (Like the table I used).
bit-xor is symmetric so bit-xor a value twice will produce the original number. x bit-xor x always returns 0.
	
The table of SQUARE routines must strictly have the properties 1 and 2, plus:
	5) You can NOT absolutely expand, nor reduce, the alphabet! It has a fixed amount of 36 symbols. You can of course choose a different alphabet, but with 36 symbols.
	6) You can NOT absolutely expand, nor reduce, the rows! Same applies to the length of each row; exactly nine symbols.
	7)  No numerical correspondence with symbols (like in the shift), so it's relatively easier to create a customized decryption.

About the SQUARE routines:
See -> Speaking of square ciphering for a basic explanation. Don't know if it's so easily customizable...

If you enjoy hacker-like stuff like me, you can search over Wikipedia for some other encryption methods. 
There are loads of them, and if you modify my library you should more or less easily get them to work in Inform7 also. Good luck.

Example: * Sockpuppet - How to get encrypted text from plain text

	*: "Sockpuppet" by Luca G Nieddu
	
	Include Simple encryption and decryption actions by  Luca G Nieddu.

	The White Room is a room. "You are alone in a plain white room.".
	The sockpuppet is a Ciphered stuff. The sockpuppet is in the White Room. The puzzling message of The sockpuppet is "Your plain text goes here".

Example: ** The room of mystery - Shows the use of encryption mechanics

	*: "The room of mystery" by Luca G Nieddu

	Include Simple encryption and decryption actions by  Luca G Nieddu.

	The White Room is a room. "You are alone in a plain white room.".
	
	The mysterious sheet of paper is a Ciphered stuff. The mysterious sheet of paper is in the White Room.The description is  "There is a sheet of paper.". The puzzling message of The mysterious sheet of paper is "hKPnU KP B!VCa:JKnEvpCe   )nU PAll:.qwfAup". [ You should try to say Aloha now... Muhaha! when key is hello ]
	
	The hinting sheet of paper is in the White Room.The description is  "There is a sheet of paper. For some reason there is the word [']hello['] written in it. This can be meaningful."

	Helloing is an action applying to nothing. 
	Understand "Hello" as Helloing.

	Check Helloing: 
		if Text to be encodecoded  is  "" begin; [not jet examined The mysterious sheet of paper]
			say "Hello to you! Nothing happens by the way."; 
			stop the action;
		else;
		say "Probably you should not say this to me. Try to decrypt with key hello instead."; [ examined a ciphered stuff ... give the player a hint! ]
		end if;
		stop the action.
		
	Alohaing is an action applying to nothing. 
	Understand "Aloha" as Alohaing.

	Check Alohaing: 
		unless Last encodecode result matches the text  "Aloha" begin; [you know that the word hello is in the dec]
			say "Aloha to you! Nothing happens by the way."; [the player must first successfully decipher the sheet]
			stop the action;
		end unless.
		
	After Alohaing: 
		say "Great job! You are teleported into an hawaiian beach full of cheerful girls!";
		end the game in victory. 
		
	Test me with "hello / x hinting / x mysterious / hello / shf decrypt with hello / aloha".
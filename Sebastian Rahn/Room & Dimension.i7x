Room & Dimension (for Glulx only) by Sebastian Rahn begins here.

"This extension provides the possibility to put an extra 2D layer upon rooms."

Include Glulx Text Effects  by Emily Short.
Include Basic Screen Effects by Emily Short.

[Custom Size]

Table of User Styles (continued)
style name	relative size 
special-style-2	    5 

To say default letters: say roman type. 


[Parameters]

tmp is a Number that varies.
tmp_person is a Person that varies.
tmp_location is a Room that varies.
tmp_text is a text that varies.


Part 1 - Basic functions

Section 1.1 - Choosing sectors

Tmp_Picked is a thing that varies.
Tmp_Picked_Room is a room that varies.
Tmp_Picked_Y is a text that varies.

Table 200 - Y-Axis Parameter
Number	Letters28	Letters27	Letters26	Letters25	Letters24	Letters23	Letters22	Letters21	Letters20	Letters19	Letters18	
1	"LE"	"LE"	"LE"	"LE"	"LE"	"LE"	"LE"	"LE"	"LE"	"LE"	"LE"
2	"A"	"A"	"A"	"A"	"A"	"A"	"A"	"A"	"A"	"A"	"A"
3	"B"	"B"	"B"	"B"	"B"	"B"	"B"	"B"	"B"	"B"	"B"
4	"C"	"C"	"C"	"C"	"C"	"C"	"C"	"C"	"C"	"C"	"C"	
5	"D"	"D"	"D"	"D"	"D"	"D"	"D"	"D"	"D"	"D"	"D"
6	"E"	"E"	"E"	"E"	"E"	"E"	"E"	"E"	"E"	"E"	"D"
7	"F"	"F"	"F"	"F"	"F"	"F"	"F"	"F"	"F"	"F"	"F"
8	"G"	"G"	"G"	"G"	"G"	"G"	"G"	"G"	"G"	"G"	"G"
9	"H"	"H"	"H"	"H"	"H"	"H"	"H"	"H"	"H"	"H"	"H"
10	"I"	"I"	"I"	"I"	"I"	"I"	"I"	"I"	"I"	"I"	"I"
11	"J"	"J"	"J"	"J"	"J"	"J"	"J"	"J"	"J"	"J"	"J"
12	"K"	"K"	"K"	"K"	"K"	"K"	"K"	"K"	"K"	"K"	"K"
13	"L"	"L"	"L"	"L"	"L"	"L"	"L"	"L"	"L"	"L"	"L"
14	"M"	"M"	"M"	"M"	"M"	"M"	"M"	"M"	"M"	"M"	"M"
15	"N"	"N"	"N"	"N"	"N"	"N"	"N"	"N"	"N"	"N"	"N"
16	"O"	"O"	"O"	"O"	"O"	"O"	"O"	"O"	"O"	"O"	"O"
17	"P"	"P"	"P"	"P"	"P"	"P"	"P"	"P"	"P"	"P"	"P"
18	"Q"	"Q"	"Q"	"Q"	"Q"	"Q"	"Q"	"Q"	"Q"	"Q"	"RE"
19	"R"	"R"	"R"	"R"	"R"	"R"	"R"	"R"	"R"	"RE"
20	"S"	"S"	"S"	"S"	"S"	"S"	"S"	"S"	"RE"
21	"T"	"T"	"T"	"T"	"T"	"T"	"T"	"RE"
22	"U"	"U"	"U"	"U"	"U"	"U"	"RE"
23	"V"	"V"	"V"	"V"	"V"	"RE"
24	"W"	"W"	"W"	"W"	"RE"
25	"X"	"X"	"X"	"RE"
26	"Y"	"Y"	"RE"
27	"Z"	"RE"
28	"RE"	

Table 201 - Y-Axis Parameter(2)
Number	Letters17	Letters16	Letters15	Letters14	Letters13	Letters12	Letters11	Letters10	Letters9	Letters8	Letters7	Letters6	
1	"LE"	"LE"	"LE"	"LE"	"LE"	"LE"	"LE"	"LE"	"LE"	"LE"	"LE"	"LE"
2	"A"	"A"	"A"	"A"	"A"	"A"	"A"	"A"	"A"	"A"	"A"	"A"
3	"B"	"B"	"B"	"B"	"B"	"B"	"B"	"B"	"B"	"B"	"B"	"B"
4	"C"	"C"	"C"	"C"	"C"	"C"	"C"	"C"	"C"	"C"	"C"	"C"	
5	"D"	"D"	"D"	"D"	"D"	"D"	"D"	"D"	"D"	"D"	"D"	"D"
6	"E"	"E"	"E"	"E"	"E"	"E"	"E"	"E"	"E"	"E"	"E"	"RE"
7	"F"	"F"	"F"	"F"	"F"	"F"	"F"	"F"	"F"	"F"	"RE"
8	"G"	"G"	"G"	"G"	"G"	"G"	"G"	"G"	"G"	"RE"
9	"H"	"H"	"H"	"H"	"H"	"H"	"H"	"H"	"RE"
10	"I"	"I"	"I"	"I"	"I"	"I"	"I"	"RE"
11	"J"	"J"	"J"	"J"	"J"	"J"	"RE"
12	"K"	"K"	"K"	"K"	"K"	"RE"
13	"L"	"L"	"L"	"L"	"RE"
14	"M"	"M"	"M"	"RE"
15	"N"	"N"	"RE"
16	"O"	"RE"
17	"RE"

Table 202 - Y-Axis Parameter(3)
Number	Letters5	Letters4	Letters3	Letters2	Letter
1	"LE"	"LE"	"LE"	"LE"	"LE"
2	"A"	"A"	"A"	"RE"
3	"B"	"B"	"RE"
4	"C"	"RE"
5	"RE"


To pick sector (Y - a text) and (X - a number) in (map - a room):
choose row with Sector Room of map in Table 997;
Change Table_Location to Table Entry;
choose row 1 in Table_Location;
Change Tmp_Width to Width Entry;
choose row X in Table_Location;
If Y is "LE", Change Tmp_Picked to LE Entry;
If Y is "A", Change Tmp_Picked to A1 Entry;
If Y is "B", Change Tmp_Picked to B2 Entry;
If Y is "C", Change Tmp_Picked to C3 Entry;
If Y is "D", Change Tmp_Picked to D4 Entry;
If Y is "E", Change Tmp_Picked to E5 Entry;
If Y is "F", Change Tmp_Picked to F6 Entry;
If Y is "G", Change Tmp_Picked to G7 Entry;
If Y is "H", Change Tmp_Picked to H8 Entry;
If Y is "I", Change Tmp_Picked to I9 Entry;
If Y is "J", Change Tmp_Picked to J10 Entry;
If Y is "K", Change Tmp_Picked to K11 Entry;
If Y is "L", Change Tmp_Picked to L12 Entry;
If Y is "M", Change Tmp_Picked to M13 Entry;
If Y is "N", Change Tmp_Picked to N14 Entry;
If Y is "O", Change Tmp_Picked to O15 Entry;
If tmp_Width > 17
  begin;
  If Y is "P", Change Tmp_Picked to P16 Entry;
  choose row with Sector Room of map in Table 997;
  Change Table_Location to Table 2 Entry;
  choose row X in Table_Location;
  If Y is "Q", Change Tmp_Picked to Q17 Entry;
  If Y is "R", Change Tmp_Picked to R18 Entry;
  If Y is "S", Change Tmp_Picked to S19 Entry;
  If Y is "T", Change Tmp_Picked to T20 Entry;
  If Y is "U", Change Tmp_Picked to U21 Entry;
  If Y is "V", Change Tmp_Picked to V22 Entry;
  If Y is "W", Change Tmp_Picked to W23 Entry;
  If Y is "X", Change Tmp_Picked to X24 Entry;
  If Y is "Y", Change Tmp_Picked to Y25 Entry;
  If Y is "Z", Change Tmp_Picked to Z26 Entry;
end if;
If Y is "RE", Change Tmp_Picked to RE Entry.

To pick sector (Y - a number) and (X - a number) in (map - a room):
choose row with Sector Room of map in Table 997;
Change Table_Location to Table Entry;
choose row 1 in Table_Location;
Change Tmp_Width to Width Entry;
If Tmp_Width > 5
  begin;
  If Tmp_Width > 17
    begin;
    choose row Y in Table 200;
    If Tmp_Width is 28, Change Tmp_Picked_Y to Letters28 Entry;
    If Tmp_Width is 27, Change Tmp_Picked_Y to Letters27 Entry;
    If Tmp_Width is 26, Change Tmp_Picked_Y to Letters26 Entry;
    If Tmp_Width is 25, Change Tmp_Picked_Y to Letters25 Entry;
    If Tmp_Width is 24, Change Tmp_Picked_Y to Letters24 Entry;
    If Tmp_Width is 23, Change Tmp_Picked_Y to Letters23 Entry;
    If Tmp_Width is 22, Change Tmp_Picked_Y to Letters22 Entry;
    If Tmp_Width is 21, Change Tmp_Picked_Y to Letters21 Entry;
    If Tmp_Width is 20, Change Tmp_Picked_Y to Letters20 Entry;
    If Tmp_Width is 19, Change Tmp_Picked_Y to Letters19 Entry;
    If Tmp_Width is 18, Change Tmp_Picked_Y to Letters18 Entry;
  otherwise;
    choose row Y in Table 201;
    If Tmp_Width is 17, Change Tmp_Picked_Y to Letters17 Entry;
    If Tmp_Width is 16, Change Tmp_Picked_Y to Letters16 Entry;
    If Tmp_Width is 15, Change Tmp_Picked_Y to Letters15 Entry;
    If Tmp_Width is 14, Change Tmp_Picked_Y to Letters14 Entry;
    If Tmp_Width is 13, Change Tmp_Picked_Y to Letters13 Entry;
    If Tmp_Width is 12, Change Tmp_Picked_Y to Letters12 Entry;
    If Tmp_Width is 11, Change Tmp_Picked_Y to Letters11 Entry;
    If Tmp_Width is 10, Change Tmp_Picked_Y to Letters10 Entry;
    If Tmp_Width is 9, Change Tmp_Picked_Y to Letters9 Entry;
    If Tmp_Width is 8, Change Tmp_Picked_Y to Letters8 Entry;
    If Tmp_Width is 7, Change Tmp_Picked_Y to Letters7 Entry;
    If Tmp_Width is 6, Change Tmp_Picked_Y to Letters6 Entry;
  end if;
end if;
If Tmp_Width < 6
  begin;
  choose row Y in Table 202;
  If Tmp_Width is 5, Change Tmp_Picked_Y to Letters5 Entry;
  If Tmp_Width is 4, Change Tmp_Picked_Y to Letters4 Entry;
  If Tmp_Width is 3, Change Tmp_Picked_Y to Letters3 Entry;
  If Tmp_Width is 2, Change Tmp_Picked_Y to Letters2 Entry;
  If Tmp_Width is 1, Change Tmp_Picked_Y to Letter Entry;
end if;
choose row X in Table_Location;
If Tmp_Picked_Y is "LE", Change Tmp_Picked to LE Entry;
If Tmp_Picked_Y is "A", Change Tmp_Picked to A1 Entry;
If Tmp_Picked_Y is "B", Change Tmp_Picked to B2 Entry;
If Tmp_Picked_Y is "C", Change Tmp_Picked to C3 Entry;
If Tmp_Picked_Y is "D", Change Tmp_Picked to D4 Entry;
If Tmp_Picked_Y is "E", Change Tmp_Picked to E5 Entry;
If Tmp_Picked_Y is "F", Change Tmp_Picked to F6 Entry;
If Tmp_Picked_Y is "G", Change Tmp_Picked to G7 Entry;
If Tmp_Picked_Y is "H", Change Tmp_Picked to H8 Entry;
If Tmp_Picked_Y is "I", Change Tmp_Picked to I9 Entry;
If Tmp_Picked_Y is "J", Change Tmp_Picked to J10 Entry;
If Tmp_Picked_Y is "K", Change Tmp_Picked to K11 Entry;
If Tmp_Picked_Y is "L", Change Tmp_Picked to L12 Entry;
If Tmp_Picked_Y is "M", Change Tmp_Picked to M13 Entry;
If Tmp_Picked_Y is "N", Change Tmp_Picked to N14 Entry;
If Tmp_Picked_Y is "O", Change Tmp_Picked to O15 Entry;
If tmp_Width > 17
  begin;
  If Tmp_Picked_Y is "P", Change Tmp_Picked to P16 Entry;
  choose row with Sector Room of map in Table 997;
  Change Table_Location to Table 2 Entry;
  choose row X in Table_Location;
  If Tmp_Picked_Y is "Q", Change Tmp_Picked to Q17 Entry;
  If Tmp_Picked_Y is "R", Change Tmp_Picked to R18 Entry;
  If Tmp_Picked_Y is "S", Change Tmp_Picked to S19 Entry;
  If Tmp_Picked_Y is "T", Change Tmp_Picked to T20 Entry;
  If Tmp_Picked_Y is "U", Change Tmp_Picked to U21 Entry;
  If Tmp_Picked_Y is "V", Change Tmp_Picked to V22 Entry;
  If Tmp_Picked_Y is "W", Change Tmp_Picked to W23 Entry;
  If Tmp_Picked_Y is "X", Change Tmp_Picked to X24 Entry;
  If Tmp_Picked_Y is "Y", Change Tmp_Picked to Y25 Entry;
  If Tmp_Picked_Y is "Z", Change Tmp_Picked to Z26 Entry;
end if;
If Tmp_Picked_Y is "RE", Change Tmp_Picked to RE Entry.


Section 1.2 - Changing sector 

To Change sector (Y - a text) and (X - a number) in (map - a room) to (new - a thing): 
choose row with Sector Room of map in Table 997;
Change Table_Location to Table Entry;
choose row 1 in Table_Location;
Change Tmp_Width to Width Entry;
choose row X in Table_Location;
If Y is "LE", Change LE Entry to new;
If Y is "A", Change A1 Entry to new;
If Y is "B", Change B2 Entry to new;
If Y is "C", Change C3 Entry to new;
If Y is "D", Change D4 Entry to new;
If Y is "E", Change E5 Entry to new;
If Y is "F", Change F6 Entry to new;
If Y is "G", Change G7 Entry to new;
If Y is "H", Change H8 Entry to new;
If Y is "I", Change I9 Entry to new;
If Y is "J", Change J10 Entry to new;
If Y is "K", Change K11 Entry to new;
If Y is "L", Change L12 Entry to new;
If Y is "M", Change M13 Entry to new;
If Y is "N", Change N14 Entry to new;
If Y is "O", Change O15 Entry to new;
If tmp_Width > 17
  begin;
  If Y is "P", Change P16 Entry to new;
  choose row with Sector Room of map in Table 997;
  Change Table_Location to Table 2 Entry;
  choose row X in Table_Location;
  If Y is "Q", Change Q17 Entry to new;
  If Y is "R", Change  R18 Entry to new;
  If Y is "S", Change S19 Entry to new;
  If Y is "T", Change T20 Entry to new;
  If Y is "U", Change U21 Entry to new;
  If Y is "V", Change V22 Entry to new;
  If Y is "W", Change W23 Entry to new;
  If Y is "X", Change X24 Entry to new;
  If Y is "Y", Change Y25 Entry to new;
  If Y is "Z", Change Z26 Entry to new;
end if;
If Y is "RE", Change RE Entry to new.

To Change sector (Y - a number) and (X - a number) in (map - a room) to (new - a thing):
choose row with Sector Room of map in Table 997;
Change Table_Location to Table Entry;
choose row 1 in Table_Location;
Change Tmp_Width to Width Entry;
If Tmp_Width > 5
  begin;
  If Tmp_Width > 17
    begin;
    choose row Y in Table 200;
    If Tmp_Width is 28, Change Tmp_Picked_Y to Letters28 Entry;
    If Tmp_Width is 27, Change Tmp_Picked_Y to Letters27 Entry;
    If Tmp_Width is 26, Change Tmp_Picked_Y to Letters26 Entry;
    If Tmp_Width is 25, Change Tmp_Picked_Y to Letters25 Entry;
    If Tmp_Width is 24, Change Tmp_Picked_Y to Letters24 Entry;
    If Tmp_Width is 23, Change Tmp_Picked_Y to Letters23 Entry;
    If Tmp_Width is 22, Change Tmp_Picked_Y to Letters22 Entry;
    If Tmp_Width is 21, Change Tmp_Picked_Y to Letters21 Entry;
    If Tmp_Width is 20, Change Tmp_Picked_Y to Letters20 Entry;
    If Tmp_Width is 19, Change Tmp_Picked_Y to Letters19 Entry;
    If Tmp_Width is 18, Change Tmp_Picked_Y to Letters18 Entry;
  otherwise;
    choose row Y in Table 201;
    If Tmp_Width is 17, Change Tmp_Picked_Y to Letters17 Entry;
    If Tmp_Width is 16, Change Tmp_Picked_Y to Letters16 Entry;
    If Tmp_Width is 15, Change Tmp_Picked_Y to Letters15 Entry;
    If Tmp_Width is 14, Change Tmp_Picked_Y to Letters14 Entry;
    If Tmp_Width is 13, Change Tmp_Picked_Y to Letters13 Entry;
    If Tmp_Width is 12, Change Tmp_Picked_Y to Letters12 Entry;
    If Tmp_Width is 11, Change Tmp_Picked_Y to Letters11 Entry;
    If Tmp_Width is 10, Change Tmp_Picked_Y to Letters10 Entry;
    If Tmp_Width is 9, Change Tmp_Picked_Y to Letters9 Entry;
    If Tmp_Width is 8, Change Tmp_Picked_Y to Letters8 Entry;
    If Tmp_Width is 7, Change Tmp_Picked_Y to Letters7 Entry;
    If Tmp_Width is 6, Change Tmp_Picked_Y to Letters6 Entry;
  end if;
end if;
If Tmp_Width < 6
  begin;
  choose row Y in Table 202;
  If Tmp_Width is 5, Change Tmp_Picked_Y to Letters5 Entry;
  If Tmp_Width is 4, Change Tmp_Picked_Y to Letters4 Entry;
  If Tmp_Width is 3, Change Tmp_Picked_Y to Letters3 Entry;
  If Tmp_Width is 2, Change Tmp_Picked_Y to Letters2 Entry;
  If Tmp_Width is 1, Change Tmp_Picked_Y to Letter Entry;
end if;
choose row X in Table_Location;
If Tmp_Picked_Y is "LE", Change LE Entry to new;
If Tmp_Picked_Y is "A", Change A1 Entry to new;
If Tmp_Picked_Y is "B", Change B2 Entry to new;
If Tmp_Picked_Y is "C", Change C3 Entry to new;
If Tmp_Picked_Y is "D", Change D4 Entry to new;
If Tmp_Picked_Y is "E", Change E5 Entry to new;
If Tmp_Picked_Y is "F", Change F6 Entry to new;
If Tmp_Picked_Y is "G", Change G7 Entry to new;
If Tmp_Picked_Y is "H", Change H8 Entry to new;
If Tmp_Picked_Y is "I", Change I9 Entry to new;
If Tmp_Picked_Y is "J", Change J10 Entry to new;
If Tmp_Picked_Y is "K", Change K11 Entry to new;
If Tmp_Picked_Y is "L", Change L12 Entry to new;
If Tmp_Picked_Y is "M", Change M13 Entry to new;
If Tmp_Picked_Y is "N", Change N14 Entry to new;
If Tmp_Picked_Y is "O", Change O15 Entry to new;
If tmp_Width > 17
  begin;
  If Tmp_Picked_Y is "P", Change P16 Entry to new;
  choose row with Sector Room of map in Table 997;
  Change Table_Location to Table 2 Entry;
  choose row X in Table_Location;
  If Tmp_Picked_Y is "Q", Change Q17 Entry to new;
  If Tmp_Picked_Y is "R", Change  R18 Entry to new;
  If Tmp_Picked_Y is "S", Change S19 Entry to new;
  If Tmp_Picked_Y is "T", Change T20 Entry to new;
  If Tmp_Picked_Y is "U", Change U21 Entry to new;
  If Tmp_Picked_Y is "V", Change V22 Entry to new;
  If Tmp_Picked_Y is "W", Change W23 Entry to new;
  If Tmp_Picked_Y is "X", Change X24 Entry to new;
  If Tmp_Picked_Y is "Y", Change Y25 Entry to new;
  If Tmp_Picked_Y is "Z", Change Z26 Entry to new;
end if;
If Tmp_Picked_Y is "RE", Change RE Entry to new.


Section 1.3 - Decide above/below/left/right/etc

To decide whether (Searched - a thing) is above of (Detective - a thing):
If location of Searched is location of Detective 
  begin;
  If X-Axis of Searched < X-Axis of Detective, decide yes;
end if;
decide no.

To decide whether (Searched - a thing) is below of (Detective - a thing):
If location of Searched is location of Detective 
  begin;
  If X-Axis of Searched > X-Axis of Detective, decide yes;
end if;
decide no.

To decide whether (Searched - a thing) is neighbour of (Detective - a thing):
If location of Searched is location of Detective 
  begin;
  If X-Axis of Searched is X-Axis of Detective, decide yes;
end if;
decide no.

To decide whether (Searched - a thing) is indirect neighbour of (Detective - a thing):
If location of Searched is location of Detective 
  begin;
  If X-Axis of Searched is X-Axis of Detective, decide yes;
  If (X-Axis of Searched + 1) is X-Axis of Detective, decide yes;  
  If (X-Axis of Searched - 1) is X-Axis of Detective, decide yes;
end if;
decide no.

To decide whether (Searched - a thing) is left of (Detective - a thing):
If Y-Axis of Detective is "LE", decide no;
If location of Searched is location of Detective 
  begin;
  choose row with Letters28 of Y-Axis of Detective in Table 200;
  Change tmp to Number Entry;
  choose row with Letters28 of Y-Axis of Searched in Table 200;
  If tmp > Number Entry
    begin;
    decide yes;
  otherwise;
    decide no;
  end if;
end if;
decide no.

To decide whether (Searched - a thing) is on a sector left of (Detective - a thing):
If Y-Axis of Detective is "LE", decide no;
If location of Searched is location of Detective 
  begin;
  choose row with Letters28 of Y-Axis of Detective in Table 200;
  Change tmp to Number Entry;
  choose row with Letters28 of Y-Axis of Searched in Table 200;
  If (tmp - 1) is Number Entry
    begin;
    decide yes;
  otherwise;
    decide no;
  end if;
end if;
decide no.

To decide whether (Searched - a thing) is right of (Detective - a thing):
If Y-Axis of Detective is "RE", decide no;
If location of Searched is location of Detective 
  begin;
  choose row with Letters28 of Y-Axis of Detective in Table 200;
  Change tmp to Number Entry;
  choose row with Letters28 of Y-Axis of Searched in Table 200;
  If tmp < Number Entry
    begin;
    decide yes;
  otherwise;
    decide no;
  end if;
end if;
decide no.

To decide whether (Searched - a thing) is on a sector right of (Detective - a thing):
If location of Searched is location of Detective 
  begin;
  choose row with Letters28 of Y-Axis of Detective in Table 200;
  Change tmp to Number Entry;
  choose row with Letters28 of Y-Axis of Searched in Table 200;
  If (tmp + 1) is Number Entry
    begin;
    decide yes;
  otherwise;
    decide no;
  end if;
end if;
decide no.

To decide whether (Searched - a thing) is straight of (Detective - a thing):
If location of Searched is location of Detective 
  begin;
  choose row with Letters28 of Y-Axis of Detective in Table 200;
  Change tmp to Number Entry;
  choose row with Letters28 of Y-Axis of Searched in Table 200;
  If tmp is Number Entry
    begin;
    decide yes;
  otherwise;
    decide no;
  end if;
end if;
decide no.


Section 1.4 - Looking into a direction

Looking Direction is a kind of Value. Looking Directions are Face North, Face South, Face West, Face East. 
Every person has a Looking Direction. 

When play begins: 
repeat with item running through persons begin;
Change Looking Direction of item to Face North;
end repeat.

Turning left is an action applying to nothing.
Understand "turn left" or "left" as turning left.

Carry out turning left:
Change Compass to player;
If Looking Direction of compass is Face North, Change Looking Direction of compass to Face West instead;
If Looking Direction of compass is Face West, Change Looking Direction of compass to Face South instead;
If Looking Direction of compass is Face East, Change Looking Direction of compass to Face North instead;
If Looking Direction of compass is Face South, Change Looking Direction of compass to Face East instead.

Turning Right is an action applying to nothing.
Understand "turn Right" or "Right" as turning Right .

Carry out turning Right :
Change Compass to player;
If Looking Direction of compass is Face North, Change Looking Direction of compass to Face East instead;
If Looking Direction of compass is Face West, Change Looking Direction of compass to Face North instead;
If Looking Direction of compass is Face East, Change Looking Direction of compass to Face South instead;
If Looking Direction of compass is Face South, Change Looking Direction of compass to Face West instead.


Section 1.5 - Calculate coordinates

Every thing has a number called X-Axis.
Every thing has a text called Y-Axis.

Tmp_Height is a number that varies.

To calculate coordinates:
Choose row with Sector Room of the location of Compass in Table 997;
Change Table_Location to Table Entry; 
Choose row 1 in Table_Location;
Change Tmp_Width to Width Entry;
Change Tmp to Height Entry;
Change Tmp_Height to Height Entry;
repeat with X running from 1 to Tmp 
  begin;
  If tmp_Width > 17
    begin;
    Choose row with Sector Room of the location of Compass in Table 997;
    Change Table_Location to Table Entry;
  end if; 
  choose row X in Table_Location;
  If Compass is LE Entry 
    begin;
    Change Y-Axis of Compass to "LE";
    Change X-Axis of Compass to Number Entry;
  end if;
  If Tmp_Width > 2 
    begin;
    If Compass is A1 Entry 
      begin;
      Change Y-Axis of Compass to "A";
      Change X-Axis of Compass to Number Entry;
    end if;
  end if;
  If Tmp_Width > 3 
    begin;
    If Compass is B2 Entry 
      begin;
      Change Y-Axis of Compass to "B";
      Change X-Axis of Compass to Number Entry;
    end if;
  end if;
  If Tmp_Width > 4 
    begin;
    If Compass is C3 Entry 
      begin;
      Change Y-Axis of Compass to "C";
      Change X-Axis of Compass to Number Entry;
    end if;
  end if;
  If Tmp_Width > 5 
    begin;
    If Compass is D4 Entry 
      begin;
      Change Y-Axis of Compass to "D";
      Change X-Axis of Compass to Number Entry;
    end if;
  end if;
  If Tmp_Width > 6 
    begin;
    If Compass is E5 Entry 
      begin;
      Change Y-Axis of Compass to "E";
      Change X-Axis of Compass to Number Entry;
    end if;
  end if;
  If Tmp_Width > 7 
    begin;
    If Compass is F6 Entry 
      begin;
      Change Y-Axis of Compass to "F";
      Change X-Axis of Compass to Number Entry;
    end if;
  end if;
  If Tmp_Width > 8 
    begin;
    If Compass is G7 Entry 
      begin; 
      Change Y-Axis of Compass to "G";
      Change X-Axis of Compass to Number Entry;
    end if;
  end if;
  If Tmp_Width > 9 
    begin;
    If Compass is H8 Entry 
      begin;
      Change Y-Axis of Compass to "H";
      Change X-Axis of Compass to Number Entry;
    end if;
  end if;
  If Tmp_Width > 10 
    begin;
    If Compass is I9 Entry 
      begin;
      Change Y-Axis of Compass to "I";
      Change X-Axis of Compass to Number Entry;
    end if;
  end if;
  If Tmp_Width > 11 
    begin;
    If Compass is J10 Entry 
      begin;
      Change Y-Axis of Compass to "J";
      Change X-Axis of Compass to Number Entry;
    end if;
  end if;
  If Tmp_Width > 12 
    begin;
    If Compass is K11 Entry 
      begin;
      Change Y-Axis of Compass to "K";
      Change X-Axis of Compass to Number Entry;
    end if;
  end if;
  If Tmp_Width > 13 
    begin;
    If Compass is L12 Entry 
      begin;
      Change Y-Axis of Compass to "L";
      Change X-Axis of Compass to Number Entry;
    end if;
  end if;
  If Tmp_Width > 14 
    begin;
    If Compass is M13 Entry 
      begin;
      Change Y-Axis of Compass to "M";
      Change X-Axis of Compass to Number Entry;
    end if;
  end if;
  If Tmp_Width > 15 
    begin;
    If Compass is  N14 Entry 
      begin;
      Change Y-Axis of Compass to "N";
      Change X-Axis of Compass to Number Entry;
    end if;
  end if;
  If Tmp_Width > 16 
    begin;
    If Compass is O15 Entry 
      begin;
      Change Y-Axis of Compass to "O";
      Change X-Axis of Compass to Number Entry;
    end if;
  end if;
  If Tmp_Width > 17
    begin;
    If Compass is P16 Entry 
      begin;
      Change Y-Axis of Compass to "P";
      Change X-Axis of Compass to Number Entry;
    end if;
    Choose row with Sector Room of the location of Compass in Table 997;
    Change Table_Location to Table 2 Entry;
    Choose row X in Table_Location;
  end if;
  If Tmp_Width > 18 
    begin;
    If Compass is Q17 Entry 
      begin;
      Change Y-Axis of Compass to "Q";
      Change X-Axis of Compass to Number Entry;
    end if;
  end if;
  If Tmp_Width > 19 
    begin;
    If Compass is R18 Entry 
      begin;
      Change Y-Axis of Compass to "R";
      Change X-Axis of Compass to Number Entry;
    end if;
  end if;
  If Tmp_Width > 20 
    begin;
    If Compass is S19 Entry 
      begin;
      Change Y-Axis of Compass to "S";
      Change X-Axis of Compass to Number Entry;
    end if;
  end if;
  If Tmp_Width > 21 
    begin;
    If Compass is T20 Entry 
      begin;
      Change Y-Axis of Compass to "T";
      Change X-Axis of Compass to Number Entry;
    end if;
  end if;
  If Tmp_Width > 22 
    begin;
    If Compass is U21 Entry 
      begin;
      Change Y-Axis of Compass to "U";
      Change X-Axis of Compass to Number Entry;
    end if;
  end if;
  If Tmp_Width > 23 
    begin;
    If Compass is V22 Entry 
      begin;
      Change Y-Axis of Compass to "V";
      Change X-Axis of Compass to Number Entry;
    end if;
  end if;
  If Tmp_Width > 24 
    begin;
    If Compass is W23 Entry 
      begin;
      Change Y-Axis of Compass to "W";
      Change X-Axis of Compass to Number Entry;
    end if;
  end if;
  If Tmp_Width > 25 
    begin;
    If Compass is X24 Entry 
      begin;
      Change Y-Axis of Compass to "X";
      Change X-Axis of Compass to Number Entry;
    end if;
  end if;
  If Tmp_Width > 26 
    begin;
    If Compass is Y25 Entry 
      begin;
      Change Y-Axis of Compass to "Y";
      Change X-Axis of Compass to Number Entry;
    end if;
  end if;
  If Tmp_Width > 27 
    begin;
    If Compass is Z26 Entry 
      begin;
      Change Y-Axis of Compass to "Z";
      Change X-Axis of Compass to Number Entry;
    end if;
  end if;
  If Tmp_Width > 1 
    begin;
    If Compass is RE Entry 
      begin;
      Change Y-Axis of Compass to "RE";
      Change X-Axis of Compass to Number Entry;
    end if;
  end if;
end repeat.


Section 1.6 - Spread coordinates

To spread coordinates: 
 repeat through table 997 
  begin; 
    If Sector Room Entry is not EP, Change tmp_location to Sector Room Entry; 
    repeat with x running through things in tmp_location
      begin; 
        Change Compass to x; 
        calculate coordinates; 
      end repeat; 
  end repeat.


Section 1.7 - Check surroundings of an object

Nothing Here_To_See is a thing with printed name "".

Scanning_Surroundings is a truth state that varies.

Table 995 - Surroundings
Left Space	Middle Space	Right Space
a thing	                 a thing	a thing
with 2 blank rows

To scan surroundings of (Noun - a thing):
Change Compass to Noun;
scan surroundings.
 
To scan surroundings:
Change Scanning_Surroundings to Uncommented;
Change Uncommented to true;
repeat through Table 995
	begin;
	blank out the whole row;
end repeat;
choose row 1 in the Table of Surroundings;
Change tmp_Direction to northwest;
Change Freespace to Nothing Here_To_See;
check sector;
Change Left Space Entry to Freespace;
Change tmp_Direction to north;
Change Freespace to Nothing Here_To_See;
check sector;
Change Middle Space  Entry to Freespace;
Change tmp_Direction to northeast;
Change Freespace to Nothing Here_To_See;
check sector;
Change Right Space  Entry to Freespace;
choose row 2 in the Table of Surroundings;
Change tmp_Direction to west;
Change Freespace to Nothing Here_To_See;
check sector;
Change Left Space Entry to Freespace;
Change Middle Space  Entry to Compass;
Change tmp_Direction to east;
Change Freespace to Nothing Here_To_See;
check sector;
Change Right Space  Entry to Freespace;
choose row 3 in the Table of Surroundings;
Change tmp_Direction to southwest;
Change Freespace to Nothing Here_To_See;
check sector;
Change Left Space Entry to Freespace;
Change tmp_Direction to south;
Change Freespace to Nothing Here_To_See;
check sector;
Change Middle Space  Entry to Freespace;
Change tmp_Direction to southeast;
Change Freespace to Nothing Here_To_See;
check sector;
Change Right Space  Entry to Freespace;
Change Uncommented to Scanning_Surroundings.


Section 1.8 - Decide if object is in range of another

To decide whether (First Piece - a thing) is connected with (Second Piece - a thing):
If location of First Piece is the location of Second Piece
  begin;
  scan surroundings of First Piece; 
  repeat through Table 995 
    begin;
    if Second Piece is Left Space Entry, decide yes;
    if Second Piece is Middle Space  Entry, decide yes;
    if Second Piece is Right Space  Entry, decide yes;
  end repeat;
end if;
decide no.

To decide whether (First Piece - a thing) is not connected with (Second Piece - a thing):
If location of First Piece is the location of Second Piece
  begin;
  scan surroundings of First Piece; 
  repeat through Table 995 
    begin;
    if Second Piece is Left Space Entry, decide no;
    if Second Piece is Middle Space  Entry, decide no;
    if Second Piece is Right Space  Entry, decide no;
  end repeat;
end if;
decide yes.


Section 1.9 - Deleting objects from the map

To Remove (noun - a thing) from Map:
Change Compass to noun;
calculate coordinates;
Change sector Y-Axis of Compass and X-Axis of Compass in location of Compass to None; 
Change X-Axis of noun to 0;
Change Y-Axis of noun to "".

To Completely Remove (noun - a thing) from Map:
Change Compass to noun;
calculate coordinates;
Change sector Y-Axis of Compass and X-Axis of Compass in location of Compass to None; 
Change X-Axis of noun to 0;
Change Y-Axis of noun to "";
remove noun from play.



Part 2 - Printing the map

Section 2.1 - Defining a map

Table 9999 - Template(0.28)
Number	                LE	  A1	  B2	  C3	  D4	  E5	  F6	  G7	 H8	   I9	  J10	  K11	  L12	  M13	  N14	  O15	  P16	   Height	Width
a number	a thing	a thing	a thing	a thing	a thing	a thing	a thing	a thing	a thing	a thing	a thing	a thing	a thing	a thing	a thing	a thing	a thing	  a number	28

Table 9998 - Template(1.28)
Number	Q17	 R18	  S19	  T20	  U21	  V22	  W23	  X24	 Y25	Z26	RE	Height	         Width
1	a thing	a thing	a thing	a thing	a thing	a thing	a thing	a thing	a thing	a thing	a thing	a number	28

Table_Location is a Table-name that varies. Table_Location is Table 9999.

Table 997 - Sectors  
Sector Room	            Table	              Table 2
EP	          Table 9999	 Table 9999


Section 2.2 - Print Avatar

Compass is a thing that varies.

To say Avatar:
If Compass is Wall, say Compass; 
If Compass is None, say Compass; 
If Compass is Entrance Point, say Compass;
If Compass is player 
  begin;
  If Looking Direction of compass is Face North, say "  [second custom style]^[roman type]";
  If Looking Direction of compass is Face West, say "  [second custom style]<[roman type]";
  If Looking Direction of compass is Face East, say "  [second custom style]>[roman type]";
  If Looking Direction of compass is  Face South, say "  [second custom style]v[roman type]";
end if;
If Compass is a person 
  begin;
  If Compass is not player
    begin;
    choose row with Entity of Compass in Table 991;
    Change tmp_text to Avatar Entry;
    say "  [second custom style][tmp_text][roman type]";
  end if;
end if;
If Compass is not a person
  begin;
  If Compass is not a Wall
    begin;
      If Compass is not None
      begin;
        If Compass is not an Entrance Point
          begin;
          choose row with Entity of Compass in Table 991;
          Change tmp_text to Avatar Entry;
          say "   [tmp_text]";
      end if;
    end if;
  end if;
end if.

Table 991 - Avatars
Entity	Avatar
a thing	a text


Section 2.3 - Define & Print walls

Wall is a kind of thing.
-Wall is a Wall.
The printed name of -Wall is "[second custom style]-[roman type]  ".
|Wall is a Wall.
The printed name of |Wall is "[second custom style]|[roman type]".
/Corner is a Wall.
The Printed name of /Corner is " /  ".
\Corner is a Wall.
The printed name of \Corner is " \  ".
None is a thing.
The printed name of None is "  [second custom style].[roman type]".


Section 2.4 - Printing a dark room

To say Dark Map:
Change compass to player;
scan surroundings;
Repeat through Table 995
  begin;
  Change Compass to Left Space Entry;
  If Left Space Entry is a person, say "[Avatar]"; 
  If Left Space Entry is not a person
    begin;  
    If Left Space Entry is -Wall
      begin;
      say "  ";
    end if;
    If Left Space Entry is North Entrance Point
      begin;
      say "  ";
    end if;
    If Left Space Entry is South Entrance Point
      begin;
      say "  ";
    end if;
    say "[Avatar]"; 
  end if;
  Change Compass to Middle Space Entry;
  say "[Avatar]"; 
  Change Compass to Right Space Entry;
   If Middle Space Entry is a Entrance Point, say " ";
   say "[Avatar]"; 
  say line break;
end repeat;
say paragraph break.


Section 2.5 - Printing a normal room

Map_Location is a room that varies.
Show map is a truth state that varies.

Already_Shown is a truth state that varies.

To say map:
Change compass to player;
calculate coordinates;
say "[If Tmp_Width > 2]         A   [end if][if Tmp_Width > 3]B   [end if][if Tmp_Width > 4]C   [end if][if Tmp_Width > 5]D   [end if][if Tmp_Width > 6]E   [end if][if Tmp_Width > 7]F   [end if][if Tmp_Width > 8]G   [end if]"; say "[if Tmp_Width > 9]H   [end if][if Tmp_Width > 10]I   [end if][if Tmp_Width > 11]J   [end if][if Tmp_Width > 12]K   [end if][if Tmp_Width > 13]L   [end if]"; say "[if Tmp_Width > 14]M   [end if][if Tmp_Width > 15]N  [end if][if Tmp_Width > 16]O   [end if][if Tmp_Width > 17]P   [end if][if Tmp_Width > 18]Q   [end if][if Tmp_Width > 19]R   [end if][if Tmp_Width > 20]S  [end if]"; say "[if Tmp_Width > 20]T   [end if][if Tmp_Width > 21]U   [end if][if Tmp_Width > 22]V  [end if][if Tmp_Width > 23]W   [end if][if Tmp_Width > 24]X   [end if][if Tmp_Width > 25]Y   [end if][if Tmp_Width > 26]Z   [end if]";
say conditional paragraph break;
Choose row with Sector Room of the location of Compass in Table 997;
Change Table_Location to Table Entry;
Change Map_Location to Sector Room Entry;
repeat with X running from 1 to tmp
  begin;
  Choose row X in Table_Location;
  say Number Entry;
  pick sector 1 and X in Map_Location;
  If Number Entry < 10
    begin;   
    If Tmp_Picked is player, say "  ";
    If Tmp_Picked is not a person, say "  ";
  end if;
  repeat with Y running from 1 to tmp_Width
    begin;
    pick sector Y and X in Map_Location;
    Change Compass to tmp_Picked;
    If Y is 1 
      begin;
      If Compass is None
        begin;
        say "[second custom style].[roman type]";
        Change Already_Shown to true;
      end if;
      If Compass is player
        begin;
        If Looking Direction of compass is Face North, say "[second custom style]^[roman type]";
        If Looking Direction of compass is Face West, say "[second custom style]<[roman type]";
        If Looking Direction of compass is Face East, say "[second custom style]>[roman type]";
        If Looking Direction of compass is Face South, say "[second custom style]v[roman type]"; 
        Change Already_Shown to true;     
      end if;  
    end if;
    If Y is not 1
      begin;
      If Y is not tmp_Width
        begin;
        If X is not 1
          begin;
          If X is not tmp
            begin;
            If Compass is -Wall
              begin;
              say "  [second custom style]-[roman type]";
              Change Already_Shown to true;
            end if;
          end if;
        end if;
      end if;
    end if;
    If Y is tmp_Width
      begin;
      If Compass is None
        begin;
        say "  [second custom style].[roman type]";
        Change Already_Shown to true;
      end if;
      If Compass is |Wall
        begin;
        say "  [Avatar]";
        Change Already_Shown to true;
      end if;
    end if;
    If Already_Shown is false, say "[Avatar]";
    Change Already_Shown to false;
  end repeat;
  say conditional paragraph break;
end repeat;
say line break.      


Section 2.6 - Modifying the headline

Table 800 - Normal Headline
left	                    central	              right
"[location]"		""	              "[Score]/[Turn Count]"

Table 801 - Map Headline
left	                                                                   central	              right
"[location] ([If player is in dark room]?[otherwise][Y-axis of player][X-Axis of player][end if])"		""	              "[Score]/[Turn Count]"

Rule for constructing the status line (this is the Map headline rule): 
If Show Map is true
  begin;
  fill status bar with Table 801;
otherwise;
  fill status bar with Table 800;
end if;
rule succeeds.


Section 2.7 - The print map rules

Every turn (This is the print map rule): 
If Show Map is true
  begin;
  If location of player is a Sector Room listed in Table 997
    begin;
    If player is not in a dark room, say "[Map]";
    If player is in a dark room, say "[Dark Map]";
  otherwise;
    change Show Map to false;
    say "There is no map for your location.";
  end if;
end if.



Part 3 - Moving on the map

Section 3.1 - Walking between rooms

Entrance point is a kind of thing.
Entrance point is not marked for listing.

EP room is a room.
Tmp_X is a number that varies.
Tmp_Y is a text that varies.
Tmp_Y_number is a number that varies.

North Entrance point is a kind of Entrance point. 
The printed name of North Entrance point is " _  ".
South Entrance point is a kind of Entrance point. 
The printed name of South Entrance point is " _  ".
West Entrance point is a kind of Entrance point. 
The printed name of West Entrance point is "+ ".
East Entrance point is a kind of Entrance point. 
The printed name of East Entrance point is "  +".

Table 994 - Junctures
Entrance	Exit Point	Exit Room	Position_1	Position_2	Position_3	Height_1	Height_2	Height_3	Entrance_Height
a Room	            a Room	            a Room	              a Text	               a Text	 a Text	            a Number	a Number	a Number	a Number

Dummy_EP is a Entrance Point.
tmp_Entrance is a Entrance point that varies.

To switch maps:
Change tmp_person to Compass;
Change tmp_X to X-Axis of tmp_Person;   
Change tmp_Y to Y-Axis of tmp_Person;   
choose row with entrance of Freespace in Table 994;
Change tmp_Entrance to Exit Point Entry;
move tmp_Entrance to Exit Room Entry;
Change Compass to tmp_Entrance;
scan surroundings;
Change tmp to Entrance_Height Entry; 
Change NoGo to true; 
If tmp_Entrance is a North Entrance Point                                                 [Northern Entrance]
  begin;
    choose row 3 in Table 995;
     If Middle Space  Entry is None 
     begin; 
        choose row with Exit Point of tmp_Entrance in Table 994;
        if Position_2 Entry is not ""
         begin; 
           Change NoGo to false;
           Change Y-Axis of tmp_person to Position_2 Entry;
         end if;   
     end if;
    If NoGo is true
      begin;
        choose row 3 in Table 995;
        If Left Space Entry is None    
          begin;      
            choose row with Exit Point of tmp_Entrance in Table 994;
            If Position_1 Entry is not ""
              begin; 
                Change NoGo to false;
                Change Y-Axis of tmp_person to Position_1 Entry; 
              end if;
          end if;     
      end if;
    If NoGo is true
      begin;
        choose row 3 in Table 995;
        If Right Space  Entry is None    
          begin;      
            choose row with Exit Point of tmp_Entrance in Table 994;
            If Position_3 Entry is not ""
              begin; 
                Change NoGo to false;
                Change Y-Axis of tmp_person to Position_3 Entry; 
              end if;
          end if;     
      end if;
  end if;
If tmp_Entrance is a South Entrance Point                                               [Southern Entrance]                                         
  begin;
    choose row 1 in Table 995;
     If Middle Space  Entry is None 
     begin; 
        choose row with Exit Point of tmp_Entrance in Table 994;
        if Position_2 Entry is not ""
         begin; 
           Change NoGo to false;
           Change Y-Axis of tmp_person to Position_2 Entry;
         end if;   
     end if;
    If NoGo is true
      begin;
        choose row 1 in Table 995;
        If Left Space Entry is None    
          begin;      
            choose row with Exit Point of tmp_Entrance in Table 994;
            If Position_1 Entry is not ""
              begin; 
                Change NoGo to false;
                Change Y-Axis of tmp_person to Position_1 Entry; 
              end if;
          end if;     
      end if;
    If NoGo is true
      begin;
        choose row 1 in Table 995;
        If Right Space Entry is None    
          begin;      
            choose row with Exit Point of tmp_Entrance in Table 994;
            If Position_3 Entry is not ""
              begin; 
                Change NoGo to false;
                Change Y-Axis of tmp_person to Position_3 Entry; 
              end if;
          end if;     
      end if;
  end if;
If tmp_Entrance is a West Entrance Point                                               [Western Entrance]                                         
  begin;
    choose row 2 in Table 995;
     If Right Space Entry is None 
     begin; 
        choose row with Exit Point of tmp_Entrance in Table 994;
        if Height_2 Entry is not 0
         begin; 
           Change NoGo to false;
           Change X-Axis of tmp_person to Height_2 Entry;
         end if;   
     end if;
    If NoGo is true
      begin;
        choose row 1 in Table 995;
        If Right Space Entry is None    
          begin;      
            choose row with Exit Point of tmp_Entrance in Table 994;
            If Height_1 Entry is not 0
              begin; 
                Change NoGo to false;
                Change X-Axis of tmp_person to Height_1 Entry; 
              end if;
          end if;     
      end if;
    If NoGo is true
      begin;
        choose row 3 in Table 995;
        If Right Space Entry is None    
          begin;      
            choose row with Exit Point of tmp_Entrance in Table 994;
            If Height_3 Entry is not 0
              begin; 
                Change NoGo to false;
                Change X-Axis of tmp_person to Height_3 Entry; 
              end if;
          end if;     
      end if;
  end if;
If tmp_Entrance is a East Entrance Point                                               [Eastern Entrance]                                         
  begin;
    choose row 2 in Table 995;
     If Left Space Entry is None 
     begin; 
        choose row with Exit Point of tmp_Entrance in Table 994;
        if Height_2 Entry is not 0
         begin; 
           Change NoGo to false;
           Change X-Axis of tmp_person to Height_2 Entry;
         end if;   
     end if;
    If NoGo is true
      begin;
        choose row 1 in Table 995;
        If Left Space Entry is None    
          begin;      
            choose row with Exit Point of tmp_Entrance in Table 994;
            If Height_1 Entry is not 0
              begin; 
                Change NoGo to false;
                Change X-Axis of tmp_person to Height_1 Entry; 
              end if;
          end if;     
      end if;
    If NoGo is true
      begin;
        choose row 3 in Table 995;
        If Left Space Entry is None    
          begin;      
            choose row with Exit Point of tmp_Entrance in Table 994;
            If Height_3 Entry is not 0
              begin; 
                Change NoGo to false;
                Change X-Axis of tmp_person to Height_3 Entry; 
              end if;
          end if;     
      end if;
  end if;
  If NoGo is false 
    begin;
    Change tmp_location to Exit Room Entry;                  
    If tmp_Entrance is North Entrance Point
      begin;        
      Change X-Axis of tmp_person to tmp;
    end if;
    If tmp_Entrance is South Entrance Point
      begin;  
      Change X-Axis of tmp_person to tmp;  
    end if;
Change sector tmp_Y and tmp_X in location of tmp_person to None;                                [Remove figure from old room and move it to new location]
If tmp_Entrance is North Entrance point                                                                                   [North Entry] 
  begin;                                                                                                    
  Change sector Y-Axis of tmp_person and tmp in tmp_location to tmp_person;   
end if;
If tmp_Entrance is South Entrance point                                                                                   [South Entry]
  begin;                                                                                                    
  Change sector Y-Axis of tmp_person and tmp in tmp_location to tmp_person; 
end if;
If tmp_Entrance is West Entrance point                                                                                    [West Entry]                                                   
  begin;  
  choose row with Letters28 of Y-Axis of tmp_Entrance in Table 200;
  Change tmp_Y_Number to Number Entry;
  increase tmp_Y_Number by 1;  
  Change sector tmp_Y_Number and X-Axis of tmp_person in tmp_location to tmp_person; 
end if; 
If tmp_Entrance is East Entrance point                                                                                       [East Entry]
  begin;
  If Y-Axis of tmp_Entrance is not "RE"
  begin;
    choose row with Letters28 of Y-Axis of tmp_Entrance in Table 200;
    Change tmp_Y_Number to Number Entry;
    decrease tmp_Y_Number by 1;  
    Change sector tmp_Y_Number and X-Axis of tmp_person in tmp_location to tmp_person; 
  otherwise;
    choose row with Sector Room of tmp_location in Table 997;
    choose row 1 in Table Entry;
    Change tmp_Y_Number to Width Entry;
    decrease tmp_Y_Number by 1;  
    Change sector tmp_Y_Number and X-Axis of tmp_person in tmp_location to tmp_person; 
  end if;
end if;  
move tmp_Entrance to EP room;
move tmp_person to tmp_location;
otherwise;
  move tmp_Entrance to EP room;
  say "Your path is blocked.";
end if.


Section 3.2 - Moving action
 
Tmp_Direction is a direction that varies.
NoGo is a truth state that varies.
Uncommented is a truth state that varies.

Friendly person is a kind of person.
Hostile Person is a kind of person.

Check an actor going a direction (called destination) when Show Map is true(this is the moving actor rule):
Change Compass to actor;
Change Tmp_Direction to destination;
turn around;
check sector;
If Freespace is a Wall 
  begin; 
  If Compass is player, say "[conditional paragraph break]You can't walk through walls.[line break]";
  If Compass is not player
  begin;
    If Uncommented is false, say "[conditional paragraph break][Compass] tries really hard to break through a wall but fails miserably.[line break]"; 
  end if;
  Change NoGo to true;
end if;
If Freespace is a hostile person 
  begin;
  If Compass is player, say  "[conditional paragraph break][Freespace] musters you with an hateful gaze and won't let you pass.[line break]";
  If Compass is not player
  begin;
    If Uncommented is false, say "[conditional paragraph break][Compass] can't manage to get passed [Freespace].[line break]"; 
  end if;
  Change NoGo to true;
end if;
If NoGo is true, stop the action;
If Freespace is Entrance point 
  begin;
  switch maps;
  stop the action;
end if;
move a sector;
stop the action.


Section 3.3 - Turning around

To turn around:
If Tmp_Direction is north 
  begin;
  If Looking Direction of compass is Face West, Change Looking Direction of compass to Face North;
  If Looking Direction of compass is Face East, Change Looking Direction of compass to Face North;
  If Looking Direction of compass is Face South 
    begin;
    Change tmp to a random number between 1 and 2;
    If tmp is 1, Change Looking Direction of compass to Face West;
    If tmp is 2, Change Looking Direction of compass to Face East;
  end if;
end if;
If Tmp_Direction is northeast 
  begin;
  If Looking Direction of compass is Face North, stop the action;
  If Looking Direction of compass is Face East, stop the action;
  If Looking Direction of compass is Face West, Change Looking Direction of compass to Face North;
  If Looking Direction of compass is Face South, Change Looking Direction of compass to Face East;
end if;
If Tmp_Direction is northwest 
  begin;
  If Looking Direction of compass is Face North, stop the action;
  If Looking Direction of compass is Face West, stop the action;
  If Looking Direction of compass is Face East, Change Looking Direction of compass to Face North;
  If Looking Direction of compass is Face South, Change Looking Direction of compass to Face West;
end if;
If Tmp_Direction is west 
  begin;
  If Looking Direction of compass is Face North, Change Looking Direction of compass to Face West;
  If Looking Direction of compass is Face South, Change Looking Direction of compass to Face West;
  If Looking Direction of compass is Face East 
    begin;
    Change tmp to a random number between 1 and 2;
    If tmp is 1, Change Looking Direction of compass to Face North;
    If tmp is 2, Change Looking Direction of compass to Face South;
  end if;
end if;
If Tmp_Direction is east 
  begin;
  If Looking Direction of compass is Face North, Change Looking Direction of compass to Face East;
  If Looking Direction of compass is Face South, Change Looking Direction of compass to Face East;
  If Looking Direction of compass is Face West 
    begin;
    Change tmp to a random number between 1 and 2;
    If tmp is 1, Change Looking Direction of compass to Face North;
    If tmp is 2, Change Looking Direction of compass to Face South;
  end if;
end if;
If Tmp_Direction is south 
  begin;
  If Looking Direction of compass is Face West, Change Looking Direction of compass to Face South;
  If Looking Direction of compass is Face East, Change Looking Direction of compass to Face South;
  If Looking Direction of compass is Face North 
    begin;
    Change tmp to a random number between 1 and 2;
    If tmp is 1, Change Looking Direction of compass to Face West;
    If tmp is 2, Change Looking Direction of compass to Face East;
  end if;
end if;
If Tmp_Direction is southeast 
  begin;
  If Looking Direction of compass is Face South, stop the action;
  If Looking Direction of compass is Face East, stop the action;
  If Looking Direction of compass is Face West, Change Looking Direction of compass to Face South;
  If Looking Direction of compass is Face North, Change Looking Direction of compass to Face East;
end if;
If Tmp_Direction is southwest 
  begin;
  If Looking Direction of compass is Face South, stop the action;
  If Looking Direction of compass is Face West, stop the action;
  If Looking Direction of compass is Face East, Change Looking Direction of compass to Face South;
  If Looking Direction of compass is Face North, Change Looking Direction of compass to Face West;
end if.


Section 3.4 - Checking goal sector

Freespace is a thing that varies.
Tmp_Width is a number that varies.

To check sector:
calculate coordinates;
Change NoGo to false;
If Tmp_Direction is north                                                                                     [North]
  begin; 
  Change tmp to (X-Axis of Compass - 1);
  If tmp is 0 
    begin;
    If Uncommented is false, say "No way from here. (N)";
    Change NoGo to true;
    stop the action;
  end if;
  pick sector Y-Axis of Compass and tmp in location of Compass;
  Change Freespace to tmp_Picked;
end if;
If Tmp_Direction is northwest                                                                               [Northwest]
  begin; 
  Change tmp to (X-Axis of Compass - 1);
  If tmp is 0 
    begin;
    If Uncommented is false, say "No way from here. (NW)";
    Change NoGo to true;
    stop the action;
  end if;
  If Y-Axis of Compass is "LE" 
    begin;
    If Uncommented is false, say "[conditional paragraph break]No way from here. (NW)[line break]";
    Change NoGo to true;
    stop the action;
 end if;
 If Y-Axis of Compass is not "RE"
   begin;
   choose row with Letters28 of Y-Axis of Compass in Table 200;
   Change tmp_Y_Number to Number Entry;
   decrease tmp_Y_Number by 1;
   pick sector tmp_Y_Number and tmp in location of Compass;   
 otherwise;
   Change tmp_Y_Number to tmp_Width;
   decrease tmp_Y_Number by 1;
   pick sector tmp_Y_Number and tmp in location of Compass;   
 end if;
 Change Freespace to tmp_Picked;
end if;
If Tmp_Direction is northeast                                                                                   [Northeast]
  begin; 
  Change tmp to (X-Axis of Compass - 1);
  If tmp is 0 
    begin;
    If Uncommented is false, say "No way from here. (NE)";
    Change NoGo to true;
    stop the action;
  end if;
  If Tmp_Width > 1 
    begin;
    If Y-Axis of Compass is "RE" 
      begin;
      If Uncommented is false, say "[conditional paragraph break]No way from here. (NE)[line break]";
      Change NoGo to true;
      stop the action;
    end if;
  otherwise;
    If Y-Axis of Compass is "LE" 
      begin;
      If Uncommented is false, say "[conditional paragraph break]No way from here. (NE)[line break]";
      Change NoGo to true;
      stop the action;
    end if;
  end if;
  choose row with Letters28 of Y-Axis of Compass in Table 200;
  Change tmp_Y_Number to Number Entry;
  increase tmp_Y_Number by 1;
  pick sector tmp_Y_Number and tmp in location of Compass;
  Change Freespace to tmp_Picked;
end if;
If Tmp_Direction is south                                                                                            [South]
  begin;
  Change tmp to (X-Axis of Compass + 1);;
  choose row 1 in Table_location;
  If tmp > Height Entry 
    begin;
    If Uncommented is false, say "No way from here. (S)";
    Change NoGo to true;
    stop the action;
  end if;
  pick sector Y-Axis of Compass and tmp in location of Compass;
  Change Freespace to tmp_Picked;
end if;
If Tmp_Direction is southwest                                                                                     [Southwest]
  begin;
  Change tmp to (X-Axis of Compass + 1);
  Choose row 1 in Table_Location;
  If tmp > Height Entry 
    begin;
    If Uncommented is false, say "No way from here. (SW)";
    Change NoGo to true;
    stop the action;
  end if;
  If Y-Axis of Compass is "LE" 
    begin;
    If Uncommented is false, say "[conditional paragraph break]No way from here. (SW)[line break]";
    Change NoGo to true;
    stop the action; 
  end if;
  If Y-Axis of Compass is not "RE"
    begin;
    choose row with Letters28 of Y-Axis of Compass in Table 200;
    Change tmp_Y_Number to Number Entry;
    decrease tmp_Y_Number by 1;
    pick sector tmp_Y_Number and tmp in location of Compass;   
  otherwise;
    Change tmp_Y_Number to tmp_Width;
    decrease tmp_Y_Number by 1;
    pick sector tmp_Y_Number and tmp in location of Compass;   
  end if;
  Change Freespace to tmp_Picked;
end if;
If Tmp_Direction is southeast                                                                                   [Southeast]
  begin;
  Change tmp to (X-Axis of Compass + 1);
  Choose row 1 in Table_Location;
  If tmp > Height Entry 
    begin;
    If Uncommented is false, say "No way from here. (SE)";
    Change NoGo to true;
    stop the action;
  end if;
  If Tmp_Width > 1 
    begin;
    If Y-Axis of Compass is "RE" 
      begin;
      If Uncommented is false, say "[conditional paragraph break]No way from here. (SE)[line break]";
      Change NoGo to true;
      stop the action;
    end if;
  otherwise;
    If Y-Axis of Compass is "LE" 
      begin;
      If Uncommented is false, say "[conditional paragraph break]No way from here. (SE)[line break]";
      Change NoGo to true;
      stop the action;
    end if;
  end if;
  choose row with Letters28 of Y-Axis of Compass in Table 200;
  Change tmp_Y_Number to Number Entry;
  increase tmp_Y_Number by 1;
  pick sector tmp_Y_Number and tmp in location of Compass;
  Change Freespace to tmp_Picked;
end if;
If Tmp_Direction is west                                                                                              [West]
  begin;
  Change tmp to X-Axis of Compass;
  If Y-Axis of Compass is "LE" 
    begin;
    If Uncommented is false, say "[conditional paragraph break]No way from here. (W)[line break]";
    Change NoGo to true;
    stop the action; 
  end if;
  If Y-Axis of Compass is not "RE"
    begin;
    choose row with Letters28 of Y-Axis of Compass in Table 200;
    Change tmp_Y_Number to Number Entry;
    decrease tmp_Y_Number by 1;
    pick sector tmp_Y_Number and tmp in location of Compass;   
  otherwise;
    Change tmp_Y_Number to tmp_Width;
    decrease tmp_Y_Number by 1;
    pick sector tmp_Y_Number and tmp in location of Compass;   
  end if;
  Change Freespace to tmp_Picked;
end if;
If Tmp_Direction is east                                                                                                   [East]
  begin;
  Change tmp to X-Axis of Compass;
  If Tmp_Width > 1 
    begin;
    If Y-Axis of Compass is "RE" 
      begin;
      If Uncommented is false, say "[conditional paragraph break]No way from here. (E)[line break]";
      Change NoGo to true;
      stop the action;
    end if;
  otherwise;
    If Y-Axis of Compass is "LE" 
      begin;
      If Uncommented is false, say "[conditional paragraph break]No way from here. (E)[line break]";
      Change NoGo to true;
      stop the action;
    end if;
  end if;
  choose row with Letters28 of Y-Axis of Compass in Table 200;
  Change tmp_Y_Number to Number Entry;
  increase tmp_Y_Number by 1;
  pick sector tmp_Y_Number and tmp in location of Compass;
  Change Freespace to tmp_Picked;
end if.


Section 3.5 - Moving

To move a sector:
choose row 1 in Table_Location;
Change Tmp_Width to Width Entry;
If Freespace is None                                                                                                          [None]
  begin; 
  Change sector Y-Axis of Compass and X-Axis of Compass in location of Compass to None;
end if;
If Freespace is a friendly person                                                                                           [Friendly Person]
  begin;
  Change sector Y-Axis of Compass and X-Axis of Compass in location of Compass to Freespace;
end if;
If Tmp_Direction is north                                                                                                    [North]
  begin;
  Decrease X-Axis of Compass by 1;
  choose row X-Axis of Compass in Table_Location;
  Change sector Y-Axis of Compass and X-Axis of Compass in location of Compass to Compass;
end if;
If Tmp_Direction is northwest                                                                                              [Northwest]
  begin;                                  
  Decrease X-Axis of Compass by 1;
  If Y-Axis of Compass is not "RE"
    begin;
    choose row with Letters28 of Y-Axis of Compass in Table 200;
    Change tmp_Y_Number to Number Entry;
    Decrease tmp_Y_Number by 1;
    Change sector tmp_Y_Number and X-Axis of Compass in location of Compass to Compass;
  otherwise;
    Change tmp_Y_Number to tmp_Width;
    decrease tmp_Y_Number by 1;
    Change sector tmp_Y_Number and X-Axis of Compass in location of Compass to Compass;
  end if;
end if;
If Tmp_Direction is northeast                                                                                                [Northeast]
  begin;
  Decrease X-Axis of Compass by 1;
  choose row with Letters28 of Y-Axis of Compass in Table 200;
  Change tmp_Y_Number to Number Entry;
  Increase tmp_Y_Number by 1;
  Change sector tmp_Y_Number and X-Axis of Compass in location of Compass to Compass;
end if;
If Tmp_Direction is south                                                                                                      [South]
  begin;
  Increase X-Axis of Compass by 1;
  choose row X-Axis of Compass in Table_Location;
  Change sector Y-Axis of Compass and X-Axis of Compass in location of Compass to Compass;
end if;
If Tmp_Direction is southwest                                                                                                [Southwest]
  begin;
  Increase X-Axis of Compass by 1;
  If Y-Axis of Compass is not "RE"
    begin;
    choose row with Letters28 of Y-Axis of Compass in Table 200;
    Change tmp_Y_Number to Number Entry;
    Decrease tmp_Y_Number by 1;
    Change sector tmp_Y_Number and X-Axis of Compass in location of Compass to Compass;
  otherwise;
    Change tmp_Y_Number to tmp_Width;
    decrease tmp_Y_Number by 1;
    Change sector tmp_Y_Number and X-Axis of Compass in location of Compass to Compass;
  end if;
end if;
If Tmp_Direction is southeast                                                                                                  [Southeast]
  begin;
  Increase X-Axis of Compass by 1;
  choose row with Letters28 of Y-Axis of Compass in Table 200;
  Change tmp_Y_Number to Number Entry;
  Increase tmp_Y_Number by 1;
  Change sector tmp_Y_Number and X-Axis of Compass in location of Compass to Compass;
end if;
If Tmp_Direction is west                                                                                                         [West]
  begin;
  If Y-Axis of Compass is not "RE"
    begin;
    choose row with Letters28 of Y-Axis of Compass in Table 200;
    Change tmp_Y_Number to Number Entry;
    Decrease tmp_Y_Number by 1;
    Change sector tmp_Y_Number and X-Axis of Compass in location of Compass to Compass;
  otherwise;
    Change tmp_Y_Number to tmp_Width;
    decrease tmp_Y_Number by 1;
    Change sector tmp_Y_Number and X-Axis of Compass in location of Compass to Compass;
  end if;
end if;
If Tmp_Direction is east                                                                                                           [East]
  begin;
  choose row with Letters28 of Y-Axis of Compass in Table 200;
  Change tmp_Y_Number to Number Entry;
  Increase tmp_Y_Number by 1;
  Change sector tmp_Y_Number and X-Axis of Compass in location of Compass to Compass;
end if.


Room & Dimension ends here.


---- DOCUMENTATION ---- 


This extension provides the possibility to put an extra 2D layer upon rooms. This can be handy, if visual feedback is required while moving the player or other things inside a room manually.

It requires both the Glulx Text Effects and Basic Screen Effects by Emily Short to run properly. The extension uses one Glulx custom style (special-style-2) and defines say "[default letters]" as say "[roman type]".

First, we will need to create a Table to save objects and to print the map of the room we want to visualize. For this we can use one of the templates that are provided within the extension (look the last example below), depending on how broad we want the room to be (in this version it is limited to 28 sectors maximum). The width is both visible in the name of the table, in case of the templates, and the actual Width Entry. 

The Width Entry is crucial for the program to determine the columns it has access to and must always fit the actual map width otherwise it will create a bug (this is also true for the Height Entry in the current version). 

There are two types of templates that can be identified by the bracketed number next to the table name: extended (the one with the 0. and 1. numeration) and normal (with no punctuation). Since the number of columns seems to be limited in Inform 7, the program is tricked to jump from one table to another. Therefore, the table with the (0.x) number represents the left side of the map and the one with the (1.x) the extended right side. 

It is important for both tables to have a correct Height and Width Entry.


We must then signalise that this room is actually printable. For this we use the location name and connect it with one or more table names. This happens in a continuation of the Table 997 - 'Sectors' which looks like this:

	Table 997 - Sectors (continued) 
	Sector Room	            Table	              Table 2
	My Room 	            Table 100
	My Room 2	            Table 101	Table 102


'My Room 2' uses an extended table with the table in the Table Entry representing the left side of the map and the one in the Table 2 Entry the right side.


After we decided on Height and Width and established a connection between rooms and tables we can start to fill the map with objects. Every thing has two parameters to save its current coordinates: X-Axis -> a number representing the current row position and Y-Axis -> a text representing the current column position. We don't have to declare those manually however. It is sufficient if we place the objects on the map and make sure our source code includes:

	When play begins:
	Spread coordinates.


The program will then run through all maps and give coordinates to every object it can find automatically. It should be noted however that an object on a map doesn't have to be in the room that it is corresponding to (and won't be moved there with any of the commands this extension provides except for "switch maps" which is not supposed to be used by ourselves). This might cause confusion within the program so we always have to make sure that an object on a map of a room is actually in said room.

Since we want to see those objects on the map, we will have to provide them with Avatars (we can hardly want to use its printed name or its description for that matter).
To do this we have to continue yet another table:

	Table 991 - Avatars (continued)
	Entity	Avatar
	Dummy	"D"

The program differs between the Avatar of a person and of anything else. A person's Avatar will always be printed in extra bold letters while the ones of others will not.

Whenever the truth state 'Show Map' is true, the program will print the map of the location in which the player is moving (he himself is always represented by an arrow).
 
Next to the objects that we create for our program, there are three special kinds of things that are provided with the extension. They all have in common that they've actually no coherent position on the map, since they are either not suppose to represent one entity or their presence is only temporary (in case of Entrance Points). 


1. None -> Is a thing and refers to empty space. An object on the map can move on a None field without anything happening.

2. Wall -> Is a kind. Every object, that is a Wall, will not allow anything to take its place. If an object tries anyways, a short message will appear (can be avoided by changing the truth state of 'uncommented' to true) and the action will be stopped. 

3. Entrance Points -> Again a kind. They enable the player to switch between rooms, while 'Show Map' is true. It should be noted that the coordinates of an object will currently not change if it should go into another room while 'Show Map' is false.

There are also two new kinds of persons: hostile person and friendly person. A friendly person will switch places with the player if the player walks into him while hostile ones serve as another kind of wall in a sense. If the player walks into an object which the extension doesn't know for certain (that would be anything that wasn't mentioned above) it will create an ugly bug.

The extension differs between dark rooms and normal rooms when printing the map. A normal will always show the whole map while a dark room without a light source will only show the actual surroundings of the player.   

It should be mentioned that the status line will undergo slight changes once 'Show Map' is true. It will then show the current position on the map where the player is standing. To remove this effect either ignore the Map headline rule or change Table 801 - Map Headline in section 2.6. In case the player is in a dark room a question mark is used instead of coordinates.  

The following examples should serve as a quick overview about what is possible with the extension as it will explain several important commands in a more practical way.


Example: * One Room creation - Creating a small test room and a command that will either make the corresponding map appear or disappear.

	*: Include Room & Dimension by Sebastian Rahn.


Let us begin by creating a room and giving it some shape.
	
	*:Test room is a room.
	
	Table 100 - Test Room
	Number	                LE	  A1	  B2	  C3	  RE	  Height	         Width
	1            	None	None	None	None	None	   5	          5
	2            	None	None	None	None	None	   	          
	3            	None	None	Yourself	None	None	   	          
	4            	None	None	None	None	None	   	          
	5            	None	None	None	None	None	   	          


That's pretty bland but suitable for this demonstration. Note that if you want to place a player character other than 'Yourself' on the map you'll either have to use the name of said character instead or, if you really want to use 'Player', then there is another option that will be demonstrated in the next example.

Now we create a link between the room and the corresponding map.
 	
	*:Table 997 - Sectors (continued)
	Sector Room	Table
	Test Room	Table 100
	

If we don't want to show the map all the time, we can create a command that will switch the Truth State 'Showing map' either to true or false which will either show the map or prevent it from being printed.
	
	*:Work Done is a truth state that varies.
	
	Showing map is an action applying to nothing.
	Understand "Show map" or "Map" as Showing map.
	
	Carry out Showing map:
	Change Work Done to false;
	If Show Map is false
		begin; 
		Change Show Map to true;
		Change Work Done to true;
		say "You unfold your map to look where you are.";
	end if;
	If Work Done is false
		begin;
		Change Show Map to false;
		say "You put the map back into your bag.";
	end if.
	 

We have to be careful of the EP room, where all Entrance Points are stored, as it will most likely be declared the starting room since it is probably created first. To prevent this we either make sure that the player is moved to the place we want him at the start of the game (like in this example) or create the starting location before including the extension. Also, since we're lazy, we don't give the player any coordinates on his way but let the program figure it out with the "Spread Coordinates" command.
	
	*:When play begins: 
	Move player to Test room;
	Spread Coordinates.


Example: *** The Lair of Don Capone - A small game scenario to test room connections, if a person stands next to another and if the program will recognize obstacles like walls and hostile persons.

We have to make some slight changes compared to the first example since this time, we want to print the map every turn from start to finish. Therefore, we place the starting room before the extensions and let its description print the map for the very first time.

	*:The Streets is a room. "It is a lively day on Chepston Streets as usual. The Don Capone, restaurant of the rich and morally challenged, stands before you. The place where you want to go. [If Streets is unvisited][paragraph break][map][end if]".	

	Include Room & Dimension by Sebastian Rahn.


Let's start again by creating our first room. This time thought we will need a so called Entrance Point. Since we place the entrance of the restaurant to the South at it is seen on the map below, this will be a South Entrance Point. We may not forget to put all Entrance Points in the EP Room. 
	
	*:Table 100 - The Streets
	Number	                LE	  A1	  B2	  C3	  RE	  Height	         Width
	1            	-Wall	-Wall	-Wall	-Wall	-Wall	   7	          5
	2            	Jenny	None	None	None	None	   	          
	3            	None	None	None	None	None	   
	4            	None	None	None	None	None
	5            	None	None	None	None	None	          
	6            	None	Bully2	Bully1	Bully3	None	   	          
	7            	-Wall	-Wall	Southdoor	-Wall	-Wall	   

	Table 997 - Sectors (continued)
	Sector Room	Table 
	Streets	Table 100 

	Southdoor is a South Entrance Point in EP.
	Bully1 is a hostile person in Streets. The printed name of Bully1 is "Bulky Bully". The description of Bully1 is "Gee, that's a big fellow!".	
            Understand "Bulky Bully" as Bully1.
	Bully2 is a hostile person in Streets. The printed name of Bully2 is "Slimy Bully". The description of Bully2 is "You can tell by the looks of him that you won't become friends.".	
	Understand "Slimy Bully" as Bully2.
	Bully3 is a hostile person in Streets. The printed name of Bully3 is "Bland Bully". The description of Bully3 is "Now you know what pure average looks like.".	
	Understand "Bland Bully" as Bully3.
	Jenny is a friendly person in Streets. The description of Jenny is "Flatear Jenny is an old acquaintance of yours and always helpful when it comes to this kind of situations. Maybe you should talk to her.".


Since we got other people in the room except the player, we must prepare Avatars so that the map will print out properly .
 
	
	*:Table 991 - Avatars (continued)
	Entity	Avatar
	Bully1	"B"
	Bully2	"s"
	Bully3	"b"
	Jenny	"J"

	Talking to is an action applying  to one visible thing.
	Understand "Talk to [person]" or "Talk [person]" as Talking to .

 	Carry out Talking to someone (called actor):
	If actor is not Jenny, say "That wouldn[apostrophe]t achieve anything".


We want the player to only be able to greet Jenny while she is in a neighbouring field. Therefore: 

	*:Check Talking to Jenny:
	If Jenny is not connected with player
		begin;
		say "Flatear Jenny won[apostrophe]t hear you as long as you don't come closer.";
		stop the action;
	end if.

There is also the possibility to ask "If [thing] is connected with [thing]" although this is not neccessary here.
Anyways, after the player talks to Jenny she and the bullies will be completely removed from the map, meaning that they will also be removed from the game since we no longer need them. If we want them to remain in game we can use the "remove [person] from map" command instead. This would not remove them from the room however.
 	
	*:Carry out Talking to Jenny:
	say "You have a little conversation in which both of you repeatedly turn your heads over to the musclemen that block the entrance of the restaurant. After you pass a few bills, Jenny walks over to them. Two 	minutes later your path is clear. Jenny has proven reliable as always.".  
	completely remove Jenny from map;
	completely remove Bully1 from map;
	completely remove Bully2 from map;
	completely remove Bully3 from map.


Onwards into the restaurant.

	*:The Restaurant is a room. The Restaurant is south of Streets. The description of restaurant is "This place isn[apostrophe]t as grand as you thought it would be. But this comes with the advantage that the food counter isn[apostrophe]t too far away neither.".

	Table 101 - The Restaurant
	Number	  LE	  A1	  RE	  Height	         Width
	1	/Corner	Northdoor	\Corner	    6	           3
	2	|Wall	None	|Wall
	3	|Wall	None	|Wall
	4	|Wall	-Wall	|Wall
	5	|Wall	Waiter	|Wall
	6	\Corner	-Wall	/Corner
	
	Table 997 - Sectors (continued)
	Sector Room	Table 
	Restaurant	Table 101 

	Northdoor is a North Entrance Point in EP.
	Waiter is a person in restaurant. The description of Waiter is "This man looks quiet bored.".

	Table 991 - Avatars (continued)
	Entity	Avatar
	Waiter	"W"

We set up a winning condition for the game: get food!

	*:Every turn when player is in restaurant: 
	If X-Axis of player is 3
		begin;
		say "[apostrophe]Hello Sir, may I take your order?[apostrophe] You are delighted. This evening is going to be delicious!";
		end the game in victory;
	end if.


We now have two Entrance Points: Southdoor in Streets and Northdoor in the Restaurant. If we want to connect them, we'll have to expand this Table:	

	*:Table 994 - Junctures (continued)
	Entrance	            Exit Point	                Exit Room	           Position_1  	Position_2	Position_3	Height_1	Height_2	Height_3	Entrance_Height
	Southdoor	            Northdoor	                Restaurant	               ""	               "A"	                ""	               0	                0	                0 	                2
	Northdoor	            Southdoor	                Streets	              "A"	               "B"	                "C"	               0	                0	                0 	                6

Granted that this looks rather complicated. 
Basically, we declare an Entrance Point that we enter (Entrance Entry) and the one we leave (Entrance Point). Those two are important for the program to recognize which maps should be used (the ones where each Entrance Point is located, at least on the map). The Exit Room Entry is simply the room where the moving actor is taken to. The three Position_x Entries are exclusively for South and North Entrance Points. With them we can determine in which column the actor will appear. The program will try first to move the actor to Position 2 and then work its way back to 3. If all of them are either occupied or not available (marked with "" as demonstrated in the first row of the above example) the actor will not move to the Exit Room but remains where he is. The Height_x Entries do pretty much the same for the West and East Entrance Points as Position_x for North and South but, as we can see, use numbers instead of Letters (0 equals "" in this case). The Entrance_Height Entry is only important for South and North Entrance Points as it determines the row in which the actor is placed. 

The last function that is introduced in this example is the "change sector [Y-Axis] and [X-Axis] in [room] to [thing]" to place the player on the map. Objects that are placed with this command won't be moved from room to room and the old Entry on the map will also not be removed meaning that, before we use this command to move an object, we first have to delete it from the map, move it to its destination and then use the command. We can use either the corresponding letter for the Y-Axis (like "A" for the A1 Entry. The left and right ends of the map are reffered to as "LE" and "RE") or a number while the X-Axis is always a number. If there is an object in the picked sector it will only be overwritten on the map and not removed from the room. There is also another command that works in a similar fashion called "pick sector [Y-Axis] and [X-Axis] in [room]", that will not change the chosen sector but takes its object and save it under the parameter 'Tmp_Picked'.   

	*:When play begins:
	change sector "B" and 5 in Streets to player;
	Spread Coordinates;
	Change Show Map to true.


Example: **** The Curse of Quapeck - A longer example where several possibilities of how to use the given tools are experimented with. 


This example will use some commands from the AI extension namely "[thing] follows [thing]" and "calculate minimum distance between [thing] and [thing]". The first command allows an objects to move to another object on the map. Both objects have to be in the same room for the command to work. The second will save the direct (preferably in a straight line) distance between two objects under the parameter 'Stepscounter'.

	
	*:The Tomb is a room. "You can hardly see anything since the torches you lit earlier (at least you believe it was you) are barely enough to light the centre of the Tomb. A primitive altar out of stone stands there surrounded by four pillars. You remember that there is an Entry to the south although it is hidden in the dark.".
	
	Include Room & Dimension by Sebastian Rahn.
	Include AI Moving by Sebastian Rahn.


Let us begin by placing the player on the map and spread the coordinates. While we are at it: a short introducing couldn't hurt. The map will always be shown this time.
	
	*:When play begins:
	Change Sector "I" and 10 in Tomb to player;
	spread coordinates;
	Change Show Map to true;
	say "[apostrophe]Outch! That hurts![apostrophe] is the first thing that comes to your mind as you reach for your chest followed by [apostrophe]What the hell happened?[apostrophe]. [line break]You lie face down on muddy floor, you[apostrophe]ve got trouble breathing since every bit of air you inhale is accompanied by even more pain and to top it off your short-term memory seems to take a vacation. Then it dawns you. [apostrophe]Oh my god! I must[apostrophe]ve had an heart attack! Bob even warned me that it was a bad idea climbing down here without having my medicine handy.[apostrophe] Other memories start to tinkle in slowly as you get up. Where are you? A cave? No, you are certain it is a Tomb. The Shapes in your sight become clearer forming space, objects, people. (Why is it so quiet?) As your blurry vision starts to gain more focus you are abruptly confronted with two insights. First that something really horrible just happened and, more importantly, that you are still in danger![paragraph break](Press any key to continue)[paragraph break]";
	wait for any key.
	
	Maximum score is 1.


This is the map of the starting location:
	
	*:Table 100 - The Tomb
	Number	   LE	     A1	    B2	    C3	    D4	    E5	  F6	  G7	 H8	I9	J10	K11	L12	M13	N14	O15	P16	Height	Width
	1	 /Corner	   -wall	   -wall	   -wall	   -wall	   -wall	   -wall	  -wall	 -wall	-wall	-wall	-wall	-wall	-wall	-wall	-wall	-wall	12	20
	2	  |wall	   None	   None	   None	   None	   None	  None	 None	None	None	None	None	None	None	None	None	None
	3	  |wall	   None	   None	   None	   None	   None	  None	 None	None	None	None	None	None	None	None	None	None
	4	  |wall	   None	   -Wall	   -Wall	   None	   None	  None	 None	None	None	None	None	None	None	None	None	-Wall
	5	  |wall	   None	   -Wall	   -Wall	   None	   None	  None	 None	None	Adam	None	None	None	None	None	None	-Wall
	6	  |wall	   None	   None	   None	   None	   None	  None	 None	None	-Wall	-Wall	None	None	None	None	None	None 
	7	  |wall	   None	   None	   None	   None	   None	  None	 None 	None	None	None	None	None	None	None	None	None
	8	  |wall	   None	   -Wall	   -Wall	   None	   None	  None	 None	None	None	None	None	None	None	None	None	-Wall
	9	  |wall	   None	   -Wall	   -Wall	   None	   None	  None	 None	None	None	None	None	None	None	None	None	-Wall
	10	  |wall	   None	   None	   None	   None	   None	  None	 None	None	None	None	None	None	None	None	None	None
	11	  |wall	   None	   None	   None	   None	   None	  None	 None	None	None	None	None	None	None	None	None	None
	12	 \Corner	   -wall	    -wall	   -wall	   -wall	   -wall	  -wall	-wall	-wall	-wall	Tomb_South	-wall	-wall	-wall	-wall	-wall	-wall

	Table 101 - The Tomb_2
	Number	Q17	 R18	  RE	Height	Width
	1	-wall	-wall	\Corner	12	20
	2	  None	   None	 |wall
	3	  None	   None	 |wall
	4	  -Wall	   None	 |wall
	5	  -Wall	  None	 |wall
	6	  None	  None	 |wall
	7	  None	  None	 |wall
	8	  -Wall	   None	 |wall
	9	  -Wall	   None	 |wall
	10	  None	   None	 |wall
	11	  None	   Bob	 |wall
	12	  -wall	-wall	/Corner


The goal of the first room is to try to rescue Bob, who is located at the lower right corner, by moving to a field next to him. If the player is there, Bob will panic and try to flee the room. After he has left, Adam will start to chase the player. The player, on the other hand, will die if Adam reaches a field next to him. If the player manages to escape, Adam will be placed directly in front of the Entrance Point, preventing the player to re-enter the tomb. We'll need some truth states for this.

	*:Bob running is a truth state that varies.
	Adam chasing is a truth state that varies.

	Pillars is a thing in Tomb. "These pillars have been carved by real craftsmen no doubt although craze craftsmen perhaps. You can see skulls of strange creatures, bizarre hybrids of men and beasts, which are apparently 	clashed together in a never ending struggle. They always spin around and around the pillar only to start all over again.". 
	The description of Pillars is "These pillars have been carved by real craftsmen no doubt although craze craftsmen perhaps. You can see skulls of strange creatures, bizarre hybrids of men and beasts, which are apparently 	clashed together in a never ending struggle. They always spin around and around the pillar only to start all over again.".
	Understand "Pillar" as Pillars.  
	Instead of doing anything other than examining pillars: say "You rather don[apostrophe]t touch them. They could bite.".

	Altar is a thing in Tomb. "The Altar itself is an ungodly ugly thing that seems old enough to originate from the early Bronze Age. Maybe even from the Stone Age for all you care. You feel something strongly repulsive 	about it as if all your instincts would deliberately try to keep you away. With all the fresh blood spilled on and around the altar you are not certain if you even *want* to get closer.".   
	The description of Altar is "This ungodly ugly thing seems old enough to originate from the early Bronze Age. Maybe even from the Stone Age for all you care. You feel something strongly repulsive about it as if all your i	nstincts would deliberately try to keep you away. With all the fresh blood spilled on and around the altar you are not certain if you even *want* to get closer.".   
	Instead of doing anything other than examining altar: say "You would have to get closer first.".

	Adam is a Hostile person in Tomb. "[If Adam chasing is false]Professor Adam stands next to the altar of Quapeck (from where is that name?). The evil spirits of this place have turned this once affable, well educated 	man into a monstrous corruption of his former self. He stares at you with a satisfied grin. His teeth covered in red. Your chest starts to hurt even more by the sheer look of it. It is clear that you must get away from 	that person as fast as possible.[otherwise]It is Professor Adam. Still insane and still with a knife.[end if]". 
	The description of  Adam is "[If Adam chasing is false]Professor Adam stands next to the stone altar of Quapeck (from where is that name?). The evil spirits of this place have turned this once affable, well educated 	man into a monstrous corruption of his former self. He stares at you with a satisfied grin. His teeth covered in red. Your chest starts to hurt even more by the sheer look of it. It is clear that you must get away from 	that person as fast as possible.[otherwise]It is Professor Adam. Still insane and still with a knife.[end if]".    
	Instead of doing anything other than examining Adam: say "You prefer to keep your distance from him.".

	Bob is a Friendly person in Tomb. "[If Bob running is false]Bob, your once loyal assistant, cowers in a far away corner of the Tomb muttering to himself in madness. You doubt that he will be much of assistance right 	now. [otherwise] Bob seems to have completely lost his mind. He runs screaming to the only visible Entry to the south.[end if][If Tomb is not visited][paragraph break][map][end if]".
	The description of Bob is "[If Bob running is false]Bob, your once loyal assistant, cowers in a far away corner of the Tomb muttering to himself in madness. You doubt that he will be much of assistance right now. 	[otherwise] Bob seems to have completely lost his mind. He runs screaming to the only visible Entry to the south.[end if]". 
	Instead of doing anything other than examining or talking to Bob: say "That wouldn't help him.".
	
	Talking to is an action applying to one thing.
	Understand "Talk to [person]" or "Talk [person]" or "call [person]" or "call out for [person]" as talking to.

	Carry out talking to Bob when Bob running is false:
	say "You try to call out for him to get his attention but he is not reacting. Perhaps you[apostrophe]ll have to get closer?".

	Carry out talking to Bob when Bob running is true:
	say "That wouldn[apostrophe]t help. His hysteric screaming would easily drown everything you could muster at the moment.".
	  
	Check examining nothing:
	say "There is no time for this nonsense!";
	stop the action.

	Instead of doing something with nothing:
	say "There is no time for this nonsense!".

	Check waiting:
	say "That is clearly one of the last things you want to do right now.";
	stop the action.

	Check examining yourself:
	say "You can leave the medical examination for later!";
	stop the action.
		

Let's not forget to give Adam and Bob some Avatars.

	*:Table 991 - Avatars (continued)
	Entity	Avatar
	Adam	"A"
	Bob	"B"

	
Since it can't be an interest of the player to get closer to a dangerous lunatic, we'll try to prevent him from doing so.
	
	*:Closer Look is a Truth State that varies.
	
	Check going a direction (called destination) in Tomb (this is the Lookout rule): 
	Change Closer Look to false;
	Ignore the Lookout rule.
	
	The Lookout rule is listed first in the before rules.
	
	Check going west in Tomb:
	If Y-Axis of player is "R"
		begin;
		If X-Axis of player < 8
			begin;
			If X-Axis of player > 5
				begin;
 				Change Closer Look to true; 
 			end if;
		end if;
	end if.

	Check going northwest in Tomb:
	If Y-Axis of player is "R"
 		begin;
		If X-Axis of player < 9
			begin;
			If X-Axis of player > 5
				begin;
				Change Closer Look to true; 
			end if;
		end if;
	end if;
	If X-Axis of player is 10
		begin;
		Choose row with Letters20 of Y-Axis of player in Table 200;
		If Number Entry > 4
			begin;
			If Number Entry < 18
				begin;
 				Change Closer Look to true; 
 			end if;
		end if;
	end if.
	
	Check going southwest in Tomb:
	If Y-Axis of player is "R"
		begin;
		If X-Axis of player < 8
			begin;
			If X-Axis of player > 4
				begin;
				Change Closer Look to true; 
			end if;
		end if;
	end if;
	If X-Axis of player is 3
		begin;
		Choose row with Letters20 of Y-Axis of player in Table 200;
		If Number Entry > 4
			begin;
			If Number Entry < 18
				begin;
				Change Closer Look to true; 
 			end if;
 		end if;
	end if.

	Check going east in Tomb:
	If Y-Axis of player is "A"
		begin;
		If X-Axis of player < 8
			begin;
			If X-Axis of player > 5
 	 			begin;
				Change Closer Look to true; 
			end if;
		end if;
	end if.
	
	Check going northeast in Tomb:
	If Y-Axis of player is "A"
		begin;
		If X-Axis of player < 9
			begin;
			If X-Axis of player > 5
 				begin;
 				Change Closer Look to true; 
			end if;
		end if;
	end if;
	If X-Axis of player is 10
		begin;
		Choose row with Letters20 of Y-Axis of player in Table 200;
		If Number Entry > 3
 			begin;
			If Number Entry < 17
				begin;
 				Change Closer Look to true; 
 			end if;
 		end if;
	end if.

	Check going southeast in Tomb:
	If Y-Axis of player is "A"
		begin;
		If X-Axis of player < 8
			begin;
			If X-Axis of player > 4
				begin;
				Change Closer Look to true; 
 			end if;
 		end if;
	end if;
	If X-Axis of player is 3
  		begin;
  		Choose row with Letters20 of Y-Axis of player in Table 200;
  		If Number Entry > 3
  			begin;
  			If Number Entry < 17
 				begin;
 				Change Closer Look to true; 
			end if;
		end if;
	end if.
	
	Check going south in Tomb:
	If X-Axis of player is 3
		begin;
		Choose row with Letters20 of Y-Axis of player in Table 200;
		If Number Entry > 4
			begin;
			If Number Entry < 17
				begin;
				Change Closer Look to true; 
			end if;
		end if;
	end if.
	
	Check going north in Tomb:
	If X-Axis of player is 10
		begin;
		Choose row with Letters20 of Y-Axis of player in Table 200;
		If Number Entry > 4
			begin;
			If Number Entry < 17
 				begin;
				Change Closer Look to true; 
			end if;
		end if;
	end if.


Now to the part when the player tries to go somewhere where he's not supposed to (except he 'rescued' Bob). To determine if the player wants to use the southern Entry we use a technique that will also come in handy for the next room. Basically, we mime the check run of the original 'Moving player' rule (from "Change Compass to player;" to "check sector;"), that changes the parameter 'Freespace' to the object that is present in the sector the player wants to go. Since it is a more specific rule than the 'moving player' rule the new rule will always be called first.   

	*:Check going a direction (called destination) in Tomb (this is the Tomb Script rule):
	If Closer Look is true
		begin;
		say "You try to get closer to the altar but as you step between the pillars sudden, intense agony fills your body. Adam laughs hysterically as you stumble back writhing in pain.";
		stop the action;
	end if;
	Change Compass to player;
	Change Tmp_Direction to destination;
	turn around;
	check sector;
	If Freespace is Tomb_South
		begin;
		If Bob is in Tomb
			begin;
			say "You look back to see Bob still sitting in his corner. Despite all your fear, you can[Apostrophe]t just leave him behind with this madman.";
			stop the action;
		end if;
		If Adam chasing is true
			begin;
			remove adam from map;
			Change sector "J" and 11 in Tomb to Adam;
			Change Adam chasing to false;
		end if;
	end if.
	
	
This segment handles the situation where either Bob is fleeing or Adam is chasing the player. The 'Tomb_South' must be moved to the tomb to make the "Bob follows Tomb_South;" line taking any effect. We also try out the "calculate minimum distance" command so we can leave a comment if Adam comes closer. (Disclaimer: Since some bizarre timing thing, that I couldn't figure out yet, you'll have to place the calculating distance command before the following command)  
	
	*:Every turn (this is the Bob discovered rule):
	If Bob running is true
		begin;
		move Tomb_South to Tomb;
		If Bob is connected with Tomb_South
			begin;
			Completely remove Bob from map;
			Change Bob running to false;
			say "Shortly after you[Apostrophe]ve lost Bob out of sight you can hear an unpleasant crunching noise followed by eerie silence. [Apostrophe]Poor Bob,[Apostrophe] Adam looks amused [Apostrophe]never was the cautious type. But we should attend to our own little agenda now. Isn[Apostrophe]t that right, Mr. Anderson?[Apostrophe] He comes out from behind the altar. Judging by the large knife he is holding you think it is time to depart.";
			Change Adam chasing to true;
		otherwise;
			Bob follows Tomb_South;
		end if;
		move Tomb_South to EP;
	end if;
	If Bob is in Tomb
		begin;
		If player is connected with Bob
			begin;
			say "You place your hand on Bob[Apostrophe]s shoulder who finally turns around to face you. The expression of utter despair that marks his face is truly shocking. As your eyes meet he seems to be trapped in a moment of disbelief. Then he suddenly starts to scream at the top of his lungs and pushes you away with all his strength. You stumble back in surprise and brutally collide with the pillar behind you. While you try to get back on your feet you can see his silhouette running to the southern exit, still screaming.";
			remove Bob from map;
			Change sector "L" and 11 in Tomb to Bob;
			remove player from map;
			Change sector "P" and 10 in Tomb to player;
			Change Looking Direction of player to Face South;
			Change Bob running to true;
		end if;
	end if.

	The Bob discovered rule is listed before the Print map rule in the every turn rules.
	
	Every turn (this is the Adam chasing player rule):
	If Adam is connected with player
		begin;
		say "The pain finally gets the better of you and forces you to your knees. You prepare for cold steel to cut your throat as Adam reaches you. Suddenly, Adams lowers his knife and touches your chest with the other hand muttering in a tongue you don[Apostrophe]t understand. Cognizance strikes you as you start to lose consciousness, never to awake again.";
		end the game in death;
	end if;
	If Adam chasing is true
		begin;
		calculate minimum distance between player and Adam;
		Adam follows player;
		If stepscounter is 3, say "You can feel your heart pounding faster while the distance between you and Adam diminishes.";
		If stepscounter is 2, say "Your chest starts to hurt.";
		If stepscounter is 1, say "Your torso seems to vibrate in pain. You need to get out of here!";
	end if.
	
	
Continue on to the next room.

	*:Table 102 - Tunnel
	Number	    LE	     A1	     B2    	             C3	             RE	Height	Width
	1	/Corner	  -Wall	Tunnel_North	            -Wall	          \Corner	  9	  5
	2	  |Wall	   None	   None  	            Trap	           |Wall
	3	  |Wall	   None	   None  	            None	           |Wall
	4	  |Wall	   Trap	   None  	            Trap	           |Wall
	5	Tunnel_West	   Trap	   None  	            None	           |Wall
	6	  |Wall	   None	   Trap  	                        None	           |Wall
	7	  |Wall	   None	   Trap  	                        Trap	           |Wall
	8	  |Wall	   Trap	   None  	            Trap	           |Wall
	9	 \Corner	   -Wall	    -Wall  	            -Wall	           /Corner	


There are some traps placed here to hinder the player in his escape. To make thing a little bit more interesting, it is also completely dark.

	*:Tunnel is a dark room. 
	Tunnel is south of Tomb.
	Trap is a thing. 

	Table 991 - Avatars (continued)
	Entity	Avatar
	Trap	"x"

	Check going a direction (called destination) in Tunnel (this is the Tunnel Script rule): 
	Change Compass to player;
	Change Tmp_Direction to destination;
	turn around;
	check sector;
	If Freespace is trap                                                              [Player finds a trap]
 		begin;
		say "You stumble forward in your desperate attempt to escape as you come to realize that there is actually no floor to stand on. The scream that leaves your mouth as you fall into a void of blackness will haunt 		this place for all eternity.";
		end the game in death;
	end if;
	If Freespace is Tunnel_West                                                  [Player finds the Entry -> Trapping him in the Void]
		begin;
		remove player from map;
		move player to Void;
		say "[Apostrophe]Do you allready want to leave us, Mr. Anderson?[Apostrophe][paragraph break]You find yourself...somewhere..else.";
		Change sector "D" and 5 in void to player;
		move Void_East to Void;
		remove Void_East from map;
 		move Void_East to EP;
		stop the action;
	end if.


Now for the final destination:
	
	*:Table 103 - The Void
	Number	                LE	  A1	  B2	  C3	  D4	  E5	  F6	  G7	 H8	   I9	  RE	   Height	Width
	1	               None	 None	None	None	None	 None	 None	 None	None	 None	 None	      11	             11
	2	               None	 None	None	None	None	 None	 None	 None	None	 None	 None
	3	               None	 None	None	None	None	 None	 None	 None	None	 None	 None
	4	               None	 None	None	None	None	 None	 None	 None	None	 None	 None
	5	               None	 None	None	None	None	 None	 None	 None	None	 None	 None
	6	               None	 None	None	None	None	 None	 None	 None	None	 None	 None
	7	               None	 None	None	None	None	 None	 None	 None	None	 None	 None
	8	               None	 None	None	None	None	 None	 None	 None	None	 None	 None
	9	               None	 None	None	None	None	 None	 None	 None	None	 None	 None
	10	               None	 None	None	None	None	 None	 None	 None	None	 None	 None
	11	               None	 None	None	None	None	 None	 None	 None	None	 None	 None	


We'll find out what happens if we decrease the Height and Width Entry of a map.

	*:The Void is a room. The description of void is "[if Void is visited]There is nothing to say. That is exactly why this place is so scary in the first place.[end if]".
	The Void is west of Tunnel.
	Listcounter is a number that varies.
	
	Comment counter is a number that varies.
	
	Every turn when player is in the Void (this is the Void Script rule):
	Increase Comment counter by 1;
	Change compass to player;
	calculate coordinates;
	choose row with Letters28 of Y-Axis of player in Table 200;
	Change Listcounter to Number Entry;
	choose row 1 in Table 103;
	If Height Entry > 1
		begin;
		Change Height Entry to Height Entry - 1;
		Change Width Entry to Width Entry - 1;
		If X-Axis of player is (Height Entry + 1), decrease X-Axis of player by 1;
		If Listcounter is Width Entry, Change Y-Axis of player to "RE";
		If Width Entry is 1, Change Y-Axis of player to "LE";
		let X be X-Axis of player;
 		let Y be Y-Axis of player;
 		remove player from map;                                  [This command is only necessary if we want to expand the map again in the future] 
		Change sector Y and X in Void to player;
	end if;
	If Comment counter is 1, say "This is certainly not a place you[apostrophe]ve seen before. Where are you?";
	If Comment counter is 2, say "You desperately turn from one direction into another. There must be a way out!";
	If Comment counter is 3, say "There was something you[apostrophe]ve heard earlier. It was something important. Why can[apostrophe]t you remember?";
	If Comment counter is 4, say "What was it? Some Voodoo Mumbo Jumbo.";
	If Comment counter is 5, say "Mind? Body? You can[apostrophe]t make a sense of it.";
	If Comment counter is 6, say "First, the body is struck down and torn open. That will prepare the vessel.";
	If Comment counter is 7, say "You can hear Adam laughing in a distance.";
	If Comment counter is 8, say "A very important thing from the body is stolen.";
	If Comment counter is 9, say "Your chest pain returns.";
	If Comment counter is 10, say "This is a mere preparation to ensure that the mind will be destroyed as well.";
	If Comment counter is 11, say "You lower your gaze to examine the source of your torment. It becomes clear by closer inspection that someone, probably Adam, took the freedom to cut you open, remove your ribs 	and take the heart. For some strange reasons you find this quiet amusing.";
	If Comment counter is 12
		begin;
		say "And when the mind has faded the Soul shall join our choir to bring forth and speak truly in the name of Quapeck!";
		Increase Score by 1;
		end the game saying "You[apostrophe]ve finally found your true calling.";
	end if.
	
	
This rule is a precaution in case the player wants to go to a sector that no longer exists.
	
	*:Check going a direction (called destination) in Void (this is the Second Void Script rule):
	choose row with Letters28 of Y-Axis of player in Table 200;
	Change Listcounter to Number Entry;
	Choose row 1 in Table 103;
	If Height Entry is not 1
		begin;
		If Listcounter is Width Entry, stop the action;
	end if.
	
	The Void Script rule is listed before the print map rule in the every turn rules.
	

Now we'll connect rooms and tables.
	
	*:Table 997 - Sectors (continued) 
	Sector Room	            Table	              Table 2
	The Tomb	            Table 100	Table 101
	Tunnel	                        Table 102
	The Void	            Table 103
	

And here we declare our Entrance Points. Note that we actually don't need the Void_East Entrance Point anymore but we'll keep it in case that we might want to test if the West and East Entrance Points works properly.
	
	*:Tomb_South is a South Entrance Point in EP room. 
	Tunnel_North is a North Entrance Point in EP room.
	Tunnel_West is a West Entrance Point in EP room.
	Void_East is a East Entrance Point in EP room.
	
	Table 994 - Junctures (continued)
	Entrance	            Exit Point	                Exit Room	           Position_1  	Position_2	Position_3	Height_1	Height_2	Height_3	Entrance_Height
	Tunnel_North	            Tomb_South	                The Tomb	               ""	               "J"	                ""	               0	                0	                0 	                11
	Tomb_South	            Tunnel_North	                Tunnel	              "A"	               "B"	                "C"	               0	                0	                0 	                2
	Tunnel_West	            Void_East	                The Void	               ""	                ""	                 ""	               4	                5	                6	                5
	Void_East	            Tunnel_West	                Tunnel	               ""	                ""	                 ""	               4	                5	                6	                5
	

Example: * Templates - Provides Copy & Paste templates for easy use. 

Width: 28

	*:Table 9960 - Template(0.28)
	Number	                LE	  A1	  B2	  C3	  D4	  E5	  F6	  G7	 H8	   I9	  J10	  K11	  L12	  M13	  N14	  O15	  P16	   Height	Width
	a number	None	None	None	None	None	None	None	None	None	None	None	None	None	None	None	None	None	  a number	28

	Table 9959 - Template(1.28)
	Number	Q17	 R18	  S19	  T20	  U21	  V22	  W23	  X24	 Y25	Z26	RE	Height	         Width
	1	None	None	None	None	None	None	None	None	None	None	None	a number	28

Width: 27
	
	*:Table 9997 - Template(0.27)
	Number	                LE	  A1	  B2	  C3	  D4	  E5	  F6	  G7	 H8	   I9	  J10	  K11	  L12	  M13	  N14	  O15	  P16	   Height	Width
	a number	None	None	None	None	None	None	None	None	None	None	None	None	None	None	None	None	None	  a number	27

	Table 9996 - Template(1.27)
	Number	Q17	 R18	  S19	  T20	  U21	  V22	  W23	  X24	 Y25	RE	    Height	Width
	1	None	None	None	None	None	None	None	None	None	None	   a number	27

Width: 26

	*:Table 9995 - Template(0.26)
	Number	                LE	  A1	  B2	  C3	  D4	  E5	  F6	  G7	 H8	   I9	  J10	  K11	  L12	  M13	  N14	  O15	  P16	   Height	Width
	a number	None	None	None	None	None	None	None	None	None	None	None	None	None	None	None	None	None	  a number	26

	Table 9994 - Template(1.26)
	Number	Q17	 R18	  S19	  T20	  U21	  V22	  W23	  X24	 RE	Height	          Width
	1	None	None	None	None	None	None	None	None	None	a number	26

Width: 25

	*:Table 9993 - Template(0.25)
	Number	                LE	  A1	  B2	  C3	  D4	  E5	  F6	  G7	 H8	   I9	  J10	  K11	  L12	  M13	  N14	  O15	  P16	   Height	Width
	a number	None	None	None	None	None	None	None	None	None	None	None	None	None	None	None	None	None	  a number	25

	Table 9992 - Template(1.25)
	Number	Q17	 R18	  S19	  T20	  U21	  V22	  W23	  RE	 Height	          Width
	1	None	None	None	None	None	None	None	None	a number	25

Width: 24

	*:Table 9991 - Template(0.24)
	Number	                LE	  A1	  B2	  C3	  D4	  E5	  F6	  G7	 H8	   I9	  J10	  K11	  L12	  M13	  N14	  O15	  P16	   Height	Width
	a number	None	None	None	None	None	None	None	None	None	None	None	None	None	None	None	None	None	  a number	24

	Table 9990 - Template(1.24)
	Number	Q17	 R18	  S19	  T20	  U21	  V22	  RE	  Height	          Width
	1	None	None	None	None	None	None	None	a number	24

Width: 23

	*:Table 9989 - Template(0.23)
	Number	                LE	  A1	  B2	  C3	  D4	  E5	  F6	  G7	 H8	   I9	  J10	  K11	  L12	  M13	  N14	  O15	  P16	   Height	Width
	a number	None	None	None	None	None	None	None	None	None	None	None	None	None	None	None	None	None	  a number	23

	Table 9988 - Template(1.23)
	Number	Q17	 R18	  S19	  T20	  U21	  RE	  Height	          Width
	1	None	None	None	None	None	None	a number	23

Width: 22

	*:Table 9987 - Template(0.22)
	Number	                LE	  A1	  B2	  C3	  D4	  E5	  F6	  G7	 H8	   I9	  J10	  K11	  L12	  M13	  N14	  O15	  P16	   Height	Width
	a number	None	None	None	None	None	None	None	None	None	None	None	None	None	None	None	None	None	  a number	22

	Table 9986 - Template(1.22)
	Number	Q17	 R18	  S19	  T20	  RE	  Height	          Width
	1	None	None	None	None	None	a number	22

Width: 21

	*:Table 9985 - Template(0.21)
	Number	                LE	  A1	  B2	  C3	  D4	  E5	  F6	  G7	 H8	   I9	  J10	  K11	  L12	  M13	  N14	  O15	  P16	   Height	Width
	a number	None	None	None	None	None	None	None	None	None	None	None	None	None	None	None	None	None	  a number	21

	Table 9984 - Template(1.21)
	Number	Q17	 R18	  S19	  RE	  Height	          Width
	1	None	None	None	None	a number	21

Width: 20

	*:Table 9983 - Template(0.20)
	Number	                LE	  A1	  B2	  C3	  D4	  E5	  F6	  G7	 H8	   I9	  J10	  K11	  L12	  M13	  N14	  O15	  P16	   Height	Width
	a number	None	None	None	None	None	None	None	None	None	None	None	None	None	None	None	None	None	  a number	20

	Table 9982 - Template(1.20)
	Number	Q17	 R18	RE	  Height	          Width
	1	None	None	None	a number	20

Width: 19

	*:Table 9981 - Template(0.19)
	Number	                LE	  A1	  B2	  C3	  D4	  E5	  F6	  G7	 H8	   I9	  J10	  K11	  L12	  M13	  N14	  O15	  P16	   Height	Width
	a number	None	None	None	None	None	None	None	None	None	None	None	None	None	None	None	None	None	  a number	19

	Table 9980 - Template(1.19)
	Number	Q17	RE	 Height	          Width
	1	None	None	a number	19

Width: 18

	*:Table 9979 - Template(0.18)
	Number	                LE	  A1	  B2	  C3	  D4	  E5	  F6	  G7	 H8	   I9	  J10	  K11	  L12	  M13	  N14	  O15	  P16	   Height	Width
	a number	None	None	None	None	None	None	None	None	None	None	None	None	None	None	None	None	None	  a number	18

	Table 9978 - Template(1.18)
	Number	RE	Height	          Width
	1	None	a number	18

Width: 17

	*:Table 9977 - Template(17)
	Number	                LE	  A1	  B2	  C3	  D4	  E5	  F6	  G7	 H8	   I9	  J10	  K11	  L12	  M13	  N14	  O15	  RE	   Height	Width
	a number	None	None	None	None	None	None	None	None	None	None	None	None	None	None	None	None	None	  a number	17

Width: 16

	*:Table 9976 - Template(16)
	Number	                LE	  A1	  B2	  C3	  D4	  E5	  F6	  G7	 H8	   I9	  J10	  K11	  L12	  M13	  N14	  RE	  Height	          Width
	a number	None	None	None	None	None	None	None	None	None	None	None	None	None	None	None	None	a number	16

Width: 15

	*:Table 9975 - Template(15)
	Number	                LE	  A1	  B2	  C3	  D4	  E5	  F6	  G7	 H8	   I9	  J10	  K11	  L12	  M13	  RE	  Height	          Width
	a number	None	None	None	None	None	None	None	None	None	None	None	None	None	None	None	a number	15

Width: 14

	*:Table 9974 - Template(14)
	Number	                LE	  A1	  B2	  C3	  D4	  E5	  F6	  G7	 H8	   I9	  J10	  K11	  L12	  RE	  Height	          Width
	a number	None	None	None	None	None	None	None	None	None	None	None	None	None	None	a number	14

Width: 13

	*:Table 9973 - Template(13)
	Number	                LE	  A1	  B2	  C3	  D4	  E5	  F6	  G7	 H8	   I9	  J10	  K11	  RE	  Height	          Width
	a number	None	None	None	None	None	None	None	None	None	None	None	None	None	a number	13

Width: 12

	*:Table 9972 - Template(12)
	Number	                LE	  A1	  B2	  C3	  D4	  E5	  F6	  G7	 H8	   I9	  J10	  RE	  Height	          Width
	a number	None	None	None	None	None	None	None	None	None	None	None	None	a number	12

Width: 11

	*:Table 9971 - Template(11)
	Number	                LE	  A1	  B2	  C3	  D4	  E5	  F6	  G7	 H8	   I9	  RE	  Height	          Width
	a number	None	None	None	None	None	None	None	None	None	None	None	a number	11

Width: 10

	*:Table 9970 - Template(10)
	Number	                LE	  A1	  B2	  C3	  D4	  E5	  F6	  G7	 H8	   RE	  Height	          Width
	a number	None	None	None	None	None	None	None	None	None	None	a number	10

Width: 9

	*:Table 9969 - Template(9)
	Number	                LE	  A1	  B2	  C3	  D4	  E5	  F6	  G7	 RE	 Height	         Width
	a number	None	None	None	None	None	None	None	None	None	a number	9

Width: 8

	*:Table 9968 - Template(8)
	Number	                LE	  A1	  B2	  C3	  D4	  E5	  F6	  RE	 Height	         Width
	a number	None	None	None	None	None	None	None	None	a number	8

Width: 7

	*:Table 9967 - Template(7)
	Number	                LE	  A1	  B2	  C3	  D4	  E5	  RE	  Height	         Width
	a number	None	None	None	None	None	None	None	a number	7

Width: 6

	*:Table 9966 - Template(6)
	Number	                LE	  A1	  B2	  C3	  D4	  RE	  Height	         Width
	a number	None	None	None	None	None	None	a number	6

Width: 5

	*:Table 9965 - Template(5)
	Number	                LE	  A1	  B2	  C3	  RE	  Height	         Width
	a number	None	None	None	None	None	a number	5

Width: 4

	*:Table 9964 - Template(4)
	Number	                LE	  A1	  B2	  RE	  Height	         Width
	a number	None	None	None	None	a number	4

Width: 3

	*:Table 9963 - Template(3)
	Number	                LE	  A1	  RE	  Height	         Width
	a number	None	None	None	a number	3

Width: 2

	*:Table 9962 - Template(2)
	Number	                LE	  RE	  Height	         Width
	a number	None	None	a number	2

Width: 1

	*:Table 9961 - Template(1)
	Number	                LE	  Height	         Width
	a number	None	a number	1
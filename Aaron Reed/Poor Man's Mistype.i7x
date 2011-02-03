Version 4 of Poor Man's Mistype by Aaron Reed begins here.

"Adds basic typo correction by checking the first few letters of misunderstood input against the printed names of nearby objects. Requires Smarter Parser by Aaron Reed."

[Versions:
 -- Version 4: Updated for compatibility with Version 6 of Smarter Parser; fixed a bug where upper-case letters would break matches; fixed a bug where a comma in the command could lead to mistaken matches.
 -- Version 3: Fixed a documentation error.
 -- Version 2: Removed checking for misspelled verbs, since this has caused problems for some people; simplified removal of Smarter Parser rules.
]

[Future improvements: misspellings of articles, like 'teh'?]

Include Version 6 of Smarter Parser by Aaron Reed.

The Poor Man's Mistype rule is listed before the stripping unnecessary addendum rule in the Smarter Parser rules. [This is necessary to keep the other rule from blocking attempts to run this one.]

A smarter parser rule (this is the Poor Man's Mistype rule):
	let wnum be the position of first bad word;
	if wnum > 0:
		let badword be indexed text;
		now badword is word number wnum in reborn command;
		let first3 be indexed text;
		now first3 is "[character number 1 in badword][character number 2 in badword][character number 3 in badword]";
		let candidate be indexed text;
		unless first3 is empty:
			repeat with item running through things enclosed by location:
				now candidate is printed name of item in lower case;
				if candidate matches the regular expression "\b[first3]":
					repeat with wordcounter running from 1 to the number of words in candidate:
						if word number wordcounter in candidate matches the regular expression "\b[first3]":
							replace the regular expression "\b[badword]\b" in the reborn command with "[word number wordcounter in candidate]";
							identify error as the Poor Man's Mistype rule;
							reparse the command.
					
To decide which number is the position of first bad word: (- GetFirstNonDictWord() -).

Include (-

[ GetFirstNonDictWord myword;
	wn = 1;
	myword = 0;
	while (myword ~= -1) {
		myword = NextWordStopped();
		if (myword == 0) {
			return wn-1;
		}
	}
	return -1;	
];

-).
		

Poor Man's Mistype ends here.

---- DOCUMENTATION ----


In the absence of a more complicated approach, this extension attempts to find spelling errors in misunderstood input by very simply looking for words in the "printed name" of nearby objects that start with the first three letters of the first misunderstood word in the player's input.

There are obviously a huge category of typing errors this will not catch, but at least it's better than nothing.

The extension requires version 6 or higher of Smarter Parser by Aaron Reed, which includes much more functionality for recognizing misunderstood input. If you want to disable this and use the mistype correction alone, simply add the following line to your source:

	Use empty Smarter Parser rulebook.	

Example: * Potatoe Farm

	*: "Potatoe Farm".

	Include Poor Man's Mistype by Aaron Reed.

	There is a room called On The Ol' Potato Farm. "Efforts to turn this place into a trendy retreat for artists have not been fruitful." A vegetable garden and a cemetery are fixed in place in Farm. A ripe potato, a squash daiquiri, and an exhilarating questionnaire are in Farm. A maintenance worker named Katelynn and a committed playwright are men in Farm.

	Test me with "x potatoe / x cemetary / take questionare / give potatoe to playright / hug katelyn / drink daquiri".

Note that since at least the first three letters must be correct for a match, the last command fails to be recognized -- perhaps a blessing in disguise in this case.
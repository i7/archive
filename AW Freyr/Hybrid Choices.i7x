Version 1 of Hybrid Choices by AW Freyr begins here.

"Provides a choice-based interface that can be freely switched between interactive and non-interactive modes. Basically, it does CYOA."

Part - CYOA Mode

The CYOA mode is a truth state that varies.

To decide if in CYOA mode:
	if CYOA mode is true:
		decide yes;
	decide no.
To decide if not in CYOA mode:
	if CYOA mode is true:
		decide no;
	decide yes.

To execute page turning:
	let passed pages be a list of pages;
	let finish condition be a truth state;
	[if the description of X is not "":
		say the description of X;
		say paragraph break;]
	while the finish condition is false:
		follow the page-switch rules for the current page;
		[if a page relates to the current page by the page-flipping relation:]
		if the current page flips to a page (called p1):
			add the current page to the passed pages;
			unless the current page is a one-off and the current page is previously displayed:
				if in cyoa debug mode:
					say "[bracket]Working through [current page] to [destination page]...[close bracket]";
				if the description of the current page is not "":
					say the description of the current page;
					say paragraph break;
				follow the page-output rules for the current page;
				follow the page-toggle rules for the current page;
				now the displayed boolean of the current page is true;
			else if in cyoa debug mode:
				say "[bracket]Skipping past [current page]...[close bracket]";
			now the current page is p1;
			if the current page is listed in the passed pages:
				if in cyoa debug mode:
					say "[bracket]It appears that you may have accidently created an infinite loop by following a previous page. I am now failsafing to the previous page.[close bracket]";
				now the current page is the previous page;
				break;
		else:
			now the finish condition is true;
			now the displayed boolean of the current page is true;
			if in cyoa debug mode:
				say "[bracket]Working through [current page]...[close bracket]";
			follow the page-toggle rules for the current page;
			if the current page is a dead-end:
				if the description of the current page is not "":
					say the description of the current page;
					say paragraph break;
				follow the page-output rules for the current page;
				now the current page is the previous page;
				follow the page-toggle rules for the current page.

To turn to (x - a page):
	now the previous page is the current page;
	now the current page is X;
	execute page turning;
	try looking.

To switch to CYOA at (x - a page), without looking:
	now the current page is X;
	now CYOA mode is true;
	set choice-window;
	execute page turning;
	unless without looking:
		try looking.
To switch from CYOA:
	now CYOA mode is false;
	unset choice-window;
	try looking.

Part - Pages and Choices

A page is a kind of object. The no-page is a page.
A page has a text called a description. A page has a truth state called the displayed boolean. A page has a text called a cdesc.

[A choice is a kind of value. The no-choice is a choice.
A choice has a text called a description. A choice has a truth state called chosen boolean. A choice has a truth state called displayed boolean.]

The current page is a page that varies.
The previous page is a page that varies.

Definition: a page is previously displayed if its displayed boolean is true.
[Definition: a choice is previously displayed if its displayed boolean is true.
Definition: a choice is previously chosen if its chosen boolean is true. ]

To decide whether reading (X - a page):
	if X is the current page and in CYOA mode:
		decide yes;
	decide no.

Part - Showing Choices

Table of Currently Available Choices
index	decision
(number)	(page)
with 32 blank rows.

Page-turning relates various pages to various pages.
The verb to turn to (he turns to, they turn to, he turned to, it is turned to, it is turning to) implies the page-turning relation.
The verb to be for implies the reversed page-turning relation.

To clear choices:
	blank out the whole of Table of Currently Available Choices.

Choice-displaying something is an activity on a page.

The assigned index is a number that varies.

[To say note dead-end for (X - a choice):
	if in cyoa debug mode:
		if the next page of X offers no choices or the next page of X passes to nothing:
			say "**".]

Before choice-displaying a page (called X) (this is the bookkeeping tasks whilst choice displaying rule):
	increment the assigned index;
	choose a blank row from the table of currently available choices;
	now the index entry is the assigned index;
	now the decision entry is X.

Before choice-displaying a page (this is the show choice number rule):
	say "[assigned index]) ".

Rule for choice-displaying a page (called X) (this is the print choice description rule):
	say "[cdesc of X][line break]".

Displaying available decisions of something is an activity on pages.

Rule for displaying available decisions of a page (called N):
	clear choices;
	let F be a truth state;
	if N turns to a page:
		repeat with K running through pages turned to by N:
			follow the choice-switch rules for K;
			unless the rule failed:
				carry out the choice-displaying activity with K;
		if F is true:
			say line break;
	now the assigned index is 0.
	
Section - Suppressing Choices Depending on Conditions

The choice-switch rules is a page based rulebook.

Section - Toggling Conditions After Selecting a Choice

The page-switch rules are a page based rulebook.
The page-toggle rules are a page based rulebook.

Section - Displaying Complex Output

The page-output rules are a page based rulebook.

Chapter - Understanding Choices

Choosing is an action applying to a number.
Understand "[a number]" as choosing when in CYOA mode.

Check choosing (this is the can't choose when not in CYOA mode rule):
	if not in CYOA mode:
		say "You don't have a choice to make... you are playing in interactive mode." instead.
Check choosing (this is the can't choose whilst no choices are offered rule):
	if the current page turns to no pages:
		say "This page doesn't offer any choices." instead.
Check choosing (this is the can't choose a number for a non-existant choice rule):
	if the number understood is not an index listed in the table of currently available choices:
		say "There is no choice corresponding to that number." instead.

A page has an object called a cyoa teleport. The cyoa teleport is usually nowhere. A page can be no-look.

Carry out choosing (this is the standard carry out choosing rule):
	let K be the decision corresponding to an index of number understood in the table of currently available choices;
	carry out the selecting activity with K;
	try looking;
	if the current page is an end-page:
		switch from cyoa.
[	if the cyoa teleport of the current page is a room and the current page is no-look:
		move the player to the cyoa teleport of the current page, without printing a room description;
	else if the cyoa teleport of the current page is a room:
		move the player to the cyoa teleport of the current page.]

Chapter - Selecting Activity

[Page-turning relates various choices to a page (called the next page). The verb to turn to (he turns to, they turn to, he turned to, it is turned to, he is turning to) implies the page-turning relation.]

Page-flipping relates various pages to one page (called the destination page). The verb to flip to (he flips to, they flip to, he flipped to, it is flipped to, it is flipping to) implies the page-flipping relation.

A page can be an end-page.

Selecting something is an activity on pages.

Before selecting a page (called x) (this is the print choice selection rule):
	say "[italic type][bracket][cdesc of X][close bracket][roman type][paragraph break]".

Rule for selecting a page (called x) (this is the standard change pages rule):
	now the previous page is the current page;
	now the current page is X;
	execute page turning.


Chapter - Refresh Pages

Carry out looking when in CYOA mode:
	if in cyoa debug mode:
		say "[bracket]Looking at [current page][close bracket]...";
	if the description of the current page is not "":
		say the description of the current page;
		say paragraph break;
	now the displayed boolean of the current page is true;
	refresh choices;
	rule succeeds.

Chapter - Page Options

Section - One-Off Pages

A page can be one-off.

A choice-switch rule for a one-off page (called F) (this is the don't display choices turning to one-off pages again rule):
	if F is previously displayed:
		rule fails.

Section - Dead Ends

A page can be a dead-end. 

Section - Item-Dependent

Item-dependency relates various pages to one thing (called the required item).
The verb to be item-dependent on implies the item-dependency relation.

Item-cancellation relates various pages to one thing (called the canceling item).
The verb to be item-canceled by implies the item-cancellation relation.

A choice-switch rule for a page (called Z) (this is the don't display choices without the required item rule):
	if Z is item-dependent on something:
		if the required item of Z is not enclosed by the player:
			rule fails.

A choice-switch rule for a page (called Z) (this is the don't display choices with the canceling item rule):
	if Z is item-canceled by something:
		if canceling item of Z is enclosed by the player:
			rule fails.

Section - Page-Dependent

Page-dependency relates various pages to various pages.
The verb to need means the page-dependency relation.

Page-cancellation relates various pages to various pages.
The verb to cancel means the page-cancellation relation.

A choice-switch rule for a page (called Z) (this is the don't display choices without the required pages rule):
	repeat with X running through pages which are needed by Z:
		if X is not previously displayed:
			rule fails.
	

A choice-switch rule for a page (called Z) (this is the don't display choices with a canceled page rule):
	repeat with X running through pages which cancel Z:
		if X is previously displayed:
			rule fails.

[A page has a list of pages called the required pages. The required pages are usually {}.
A page can be requirement-intensive or requirement-lax. A page is usually requirement-intensive.

A page has a list of pages called the canceling pages. The canceling pages are usually {}.
A page can be canceling-intensive or canceling-lax. A page is usually canceling-lax.]

[A choice-switch rule for a page (called Z) (this is the don't display choices without the required pages rule):
	unless the required pages of Z is {}:
		if Z is requirement-intensive:
			repeat with X running through the required pages of Z:
				if X is not previously displayed:
					rule fails;
		else if Z is requirement-lax:
			let N be a truth state;
			repeat with X running through the required pages of Z:
				if X is previously displayed:
					now N is true;
					break;
			if N is false:
				rule fails.

A choice-switch rule for a page (called Z) (this is the don't display choices with the canceling pages rule):
	unless the canceling pages of Z is {}:
		if Z is canceling-intensive:
			let N be a truth state;
			repeat with X running through the required pages of Z:
				if X is not previously displayed:
					now N is true;
					break;
			if N is false:
				rule fails;
		else if Z is canceling-lax:
			repeat with X running through the required pages of Z:
				if X is previously displayed:
					rule fails.]

Section - Activating/Deactivating

A page can be active or inactive. A page is usually active.

A choice-switch rule for a page (called Z) (this is the don't display choices to inactive pages rule):
	if Z is inactive, rule fails.

To activate (x - a page):
	now x is active.
To deactivate (x - a page):
	now x is inactive

To activate (x - a list of pages):
	repeat with Y running through X:
		now Y is active.
To deactivate (x - a list of pages):
	repeat with Y running through X:
		now Y is inactive.

To activate (x - a description of pages):
	repeat with Y running through X:
		if Y matches X:
			now Y is active.
To deactivate (x - a description of pages):
	repeat with Y running through X:
		if Y matches X:
			now Y is inactive.

[Page-activation relates various pages to various pages.
Page-deactivation relates various pages to various pages.

The verb to 

A page has a list of pages called the activated pages. The activated pages are usually {}.
A page has a list of pages called the deactivated pages. The deactivated pages are usually {}.

A page-toggle for a page (called X):
	if the activated pages of X is not {}:
		activate the activated pages of X;
	if the deactivated pages of X is not {}:
		deactivate the deactivated pages of X.]

Chapter - Item Invoking

Item-invoking disabled is a truth state that varies. Item-invoking disabled is true.

Item-invoking is an action applying to one visible thing. Understand "[a thing]" as item-invoking when in cyoa mode and item-invoking disabled is false.

Check item-invoking (this is the can't use item-invoking mode outside of CYOA rule):
	unless in cyoa mode:
		say "You can't use items like that outside of choice mode, you have to actually describe how you are going to use it." (A) instead.

Report item-invoking (this is the block item-invoking rule):
	say "[The noun] can't be used here." (A) instead.

Chapter - CYOA Teleport

To CYOA teleport to (Z - an object):
	move player to Z, without printing a room description

Part - Cyoa Debug Mode

The CYOA debug boolean is a truth state that varies.

To decide if in cyoa debug mode:
	if the CYOA debug boolean is true:
		decide yes;
	decide no.

Section - Toggling Debug Mode (not for release)

Toggling cyoa debug mode is an action out of world applying to nothing.

Understand "cyoa debug" as toggling cyoa debug mode.

Carry out toggling cyoa debug mode:
	if CYOA debug boolean is false:
		now CYOA debug boolean is true;
		say "Debug mode now on.";
	else:
		now CYOA debug boolean is false;
		say "Debug mode now off."

Part - Parser

The reading a command activity has a truth state called the command accepted.

The CYOA error message is a text variable. The CYOA error message is "That command isn't available in choice mode."
		
After reading a command when in cyoa mode:
	if the player's command matches "[a number]", now the command accepted is true.
		
Last after reading a command when in cyoa mode:
	if the command accepted is false:
		say "[CYOA error message][paragraph break]";
		reject the player's command;
	else:
		now the command accepted is true.

Chapter - Accept Testing Commands (not for release)

After reading a command when in CYOA mode (this is the accept testing commands during CYOA rule):
	if the player's command matches "cyoa debug", now the command accepted is true;
	if the player's command includes "showme", now the command accepted is true;
	if the player's command includes "rules", now the command accepted is true;
	if the player's command includes "test", now the command accepted is true;
	if the player's command includes "relations", now the command accepted is true.

Chapter - Accept System Commands

After reading a command when in cyoa mode (this is the accept system commands during CYOA rule):
	if the player's command matches "l/look/i/inv/inventory/q/quit/save/restore/restart/g/undo", now the command accepted is true.

Chapter - Accept Examining Commands

Use cyoa examining translates as (- Constant CYOA_EXAMINING; -).

After reading a command when in cyoa mode and the cyoa examining option is active (this is the accept examining rule):
	if the player's command includes "x/examine", now the command accepted is true.

Chapter - Accept Item Commands

After reading a command when in cyoa mode (this is the accept items rule):
	if the player's command matches "[a thing]", now the command accepted is true.

Part - Time

[The don't pass time during CYOA mode rule is listed before the every turn stage rule in the turn sequence rules. 
This is the don't pass time during CYOA mode rule: if in CYOA mode, rule succeeds.]

First every turn when in cyoa mode (this is the prevent every turn events rule):
	rule succeeds.
	
Part - Choice Window (for use with Flexible Windows by Jon Ingold)

The choice window size is a number that varies. The choice window size is 20.

The choice-window is a text-buffer g-window spawned by the main-window. The position is g-placebelow. The scale method of the choice-window is g-proportional. The measurement of the choice-window is 20.

When play begins (this is the set the choice-window size rule):
	now the measurement of the choice-window is the choice window size.

Window-drawing rule for the choice-window (this is the construct choices rule):
	 move focus to choice-window, clearing the window;
	 carry out the displaying available decisions activity with the current page;
	 return to main screen.

To set choice-window:
	open up choice-window.
To unset choice-window:
	shut down choice-window.
To refresh choices:
	follow the window-drawing rules for the choice-window;

Part - Windowless CYOA (for use without Flexible Windows by Jon Ingold)

To set choice-window:
	do nothing.
To unset choice-window:
	do nothing.
To refresh choices:
	 carry out the displaying available decisions activity with the current page.
	 

[Book - Testing

The only room is a room.

After looking for the first time:
	switch to cyoa at p1.

P1 is a page.

P2 is a page. The cdesc is "P2". It is for P1.

P3 is a page. The cdesc is "P3". It is for P2.

P4 is a page. It is flipped to by P3.
"Whoa. Interesting.".

P5 is a page. It is flipped to by P4.
"Damn man. That's crazy shit."

P6 is a page. The cdesc is "P6". It is for P5. It is a dead-end.
"You've encountered something and ran away."

P7 is a page. The cdesc is "P7". It is for p5.

P8 is a page. The cdesc is "P8". It is for p5. It is inactive.
"You aren't supposed to see this."]


Hybrid Choices ends here.


---- DOCUMENTATION ----


Chapter: Introduction

This extension is inspired by and heavily adapted from the Adventure Book extension by Edward Griffiths. The objective of this extension is to build a CYOA system that can switch freely between CYOA and interactive modes, has an easily modifiable parser, and generally has more memory economy. If you are familiar with Adventure Book, you will notice a number of similarities. Pages are "pages", and the relations are familiar if named differently. But, Hybrid Choices also works quite differently. Choices are no longer seperate objects, but integrated into page. Rulebooks provide a more flexible and modular approach to altering the extension's default behavior.

Section: Version History

	Version 1, July 31st, 2014
	-- Initial Release
	
Section: Contact

You can contact me at anotherwannabe93@gmail.com with any questions/problems/suggestions you have.

Section: Acknowledgements

Thanks to Hanon Ondricek, who help test and draft this document. He wrote the funny stuff.

Thanks to Edward Griffiths, who provided the model and direct inspiration for this extension.

Chapter: Basic Usage

Section: Starting up CYOA

Hybrid Choices allows an author to seamlessly switch between the the Inform parser and a flexible choice-based adventure mode.  Interactive cutscenes, conversation menus, complex interactions, even a hint system are just a few of the many things that can be implemented. You can do this by invoking this phrase:

	...switch to cyoa at (PAGE)...

...Where PAGE is where you want the player to start making choices.

If you want the player to start CYOA mode immediately on starting the game, simply drop in this code:

*:
	Instead of looking for the first time:
		switch to cyoa at YOURPAGEHERE.

Returning from CYOA mode is done via an "end-page" which will be explained later.

Section: Simple Choices

We can imagine a page as a passage in our favorite adventure books of yore. When we write a "page", this is like a passage in our story.

	The first junction is a page.
	"The tunnel goes left and right."
	
This is the simplest page possible. Presumably, it is the first page in our book.

Now we can add some choices.

	The left tunnel is a page.
	"You go left and find yourself in a long corridor."
	The cdesc is "Go left.". It is for the first junction.
	
	The right tunnel is a page.
	"You go right and find yourself in a large cave. A little stream runs through it."
	The cdesc is "Go right.". It is for the first junction.
	
Some notes here. The CDESC stands for "CHOICE DESCRIPTION", and it is what is displayed when this page is offered as a choice.

The second thing you'll notice is that the choice is "for the first junction". This indicates that his page is a choice for the first junction. This is short for "The first junction turns to this page".

Flexible CYOA handles multiple pages just fine.

	The easy choice is a page.
	"You make the easy choice."
	The cdesc is "Do the easy thing." It is for page1, page2, page3, page4...

Section: Flipping Pages

One thing we can define it pages we will visit but not stop on. This is useful if we have a very long passage.

	p1 is a page.
	"You keep going..."
	It flips to p2.
	
	p2 is a page.
	"...and going..."
	It flips to p3.
	
	p3 is a page.
	"...and going!"
	
Now, Flexible CYOA will not bother printing choices for p1 or p2, because we've told I7 to print these pages but immediately skip past them. There are a couple of caveats. First, if Flexible CYOA detects we've written an infinite loop, like this...

	p1 is a page.
	"You keep going..."
	It flips to p2.
	
	p2 is a page.
	"...and going..."
	It flips to p3.
	
	p3 is a page.
	"...and going..."
	It flips to p4.
	
	p4 is a page.
	"...and going..."
	It flips to P2.
	
...Then it will fail safe to the last page where choice were offered.

Section: Menus, One-Offs and Dead-Ends

It is often very useful to have an empty page for the purposes of being a menu of options.

	The menu is a page.
	
Now we can refer back to this menu with our other choices.

	AskAboutPizza is a page.
	"'What about pizza?' you ask.
	
	Jenny frowns. 'No, I had some for lunch yesterday.'"
	The cdesc is "Ask about pizza." It is for the menu. It is a dead-end. It is one-off.

	AskAboutWine is a page.
	"'What about wine?' you ask.
	
	Jenny frowns. 'No, I have to drive home tonight.'"
	The cdesc is "Ask about wine." It is for the menu. It is a dead-end. It is one-off.

An easy way to make something fall back to prior page is to define it as a "dead-end". This will print the page but make it immediately fall back to the last place a choice was offered, even through multiple flipped past pages! Very useful for menus.

The second adjective you see is "one-off". This ensures that, once this choice is picked, it will never be displayed again. This makes sense for conversation menus when you've exhausted a certain subject.

Section: Page Control

Flexible CYOA offers a number of ways to control which choices are displayed based on previous choices. One way we can control this is through use of the "cancel" and "need" relations. (If you need to rename these relations for other reasons, it can be safely done by opening the extension and replacing those terms with whatever you want.)

	P1 is a page.
	"There is a door. On the wall is a switch that says, 'FLIP TO DISABLE TRAP'."
	
	P2 is a page.
	"You flip the switch. Hmm... you feel imperceptibly safer."
	The cdesc is "Flip the switch." It is for P1. It is a dead end. It is one off.
	
	P3 is a page.
	"You travel through the door and are murdered by traps."
	The cdesc is "Saunter through the door." It is canceled by P2. It is for P1.
	
	P4 is a page.
	"You safely travel throug the door."
	The cdesc is "Saunter through the door." It is needed by P2. It is for P1.
	
When a page X "cancels" a page Y, it removes page Y from ever being considered as a choice if page X is visited. When a page X "needs" a page Y, page X will never be considered until page Y is visited. This works for multiple pages, but in a slightly different way. All of a page's needed pages need to be visited before it's a choice. However, only one of a page's canceled pages need to be visited to cancel that page.

The second method is by "activating/deactivating" pages. A page is either "active" or "inactive". When it is "inactive", it will not be displayed as a choice. You can do this with a phrase.

	...activate PAGE...
	...deactivate PAGE...

This will toggle the page. You can even do this in group. Say we have a game where pages are identifiable by color.

	After examining the anti-red:
		say "All that anti-red sears out your eyeballs.";
		deactivate red pages;
		activate ultra-green pages.
		
This is also useful for "page-toggle rules", which will be covered later.
 
Section: End-Page

An end-page, when read, will return the player to the normal parser interface.

	ChoicesAreDone is a page.
	"OK, you've finished doing all your choices. Go back to your typety-typety i-can-do-anything-but-disambiguate parser world and you'll find that rope has now been secured to both the tree AND the horse cart with minimal fuss."
	The cdesc is "Finish." It is an end-page.
	
The original parser will be fully active, and for all purposes it becomes a classic IF game.

Chapter: Advanced Topics

Hybrid Choices has four main rulebooks: choice-switch, page-switch, page-toggle and page-output.

Section:  Choice-Switch

The choice-switch rules dictate whether a page will be offered as a choice. This provides a much finer level of control than the methods of page control outlined above as you can pretty much dictate whatever you want.

	A choice-switch rule for the banana page:
		unless the player carries a banana:
			rule fails.
			
If the rule fails, the page is suppressed as a choice. If the rule succeeds, the choice is immediately displayed, even if another, later rule would have eliminated it as a choice.

Section: Page-Switch

This is a seldom-used rulebook that switches out one page for another when called. It is useful when you have one choice that has many possibilities depending on the game state.

	The p1 is a page.
	"You are in front of the extra-dimensional door. There is but one thing to do..."
	
	The p2 is a page.
	The cdesc is "Open the door." It is for p1.

	A page-switch rule for p2:
		let X be a random number between 1 and 6;
		if X is 1:
			now the current page is InHell;
		else if X is 2:
			now the current page is InHeaven;
		else if X is 3:
			now the current page is SomewhereInMongolia;
		else if X is 4:
			now the current page is InTheVacuumOfSpace;
		else if X is 5:
			now the current page is AtYourParents;
		else if X is 6:
			now the current page is StormingNormandyBeach.

As you can see, the page-switch rule works by changing the "current page" at the very last minute. The "current page" is whatever page is being currently processed.

Section: Page-Toggle

The page-toggle is used specifically to interact with the model world. It is the bread-and-butter method to give inventory items, adjust the game state, change truth states, etc.

	A page-toggle rule for TakeTheBanana:
		now the player carries the banana.

Section: Page-Output

Often, the description is not enough for truly complex pages. If you want something with really complicated prose, the page-output rule is where to put it.

	A page-output rule for ReallyBoringSpeech:
		say "[one of]'Read my lips, no new bad things.'[or]'I desire peace between humans and fish.'[or]'I am not a crook.'[at random]".

If there is also a description, that will also be printed.

Section: Choice-Displaying

Normally, a cdesc is the same no matter where it is displayed. The choice-displaying activity determines what is printed when a page is displayed as a choice. This is usually the cdesc, but it can be anything else you want.

	Rule for choice-displaying the blending page:
		if the current page is red-blue:
			say "Purple.";
		else if the current page is yellow-blue:
			say "Green.";
		else if the current page is yellow-red:
			say "Orange."

Chapter: Interaction Between CYOA and Model World

Hybrid Choices opens the possibility to use the model world in your CYOA projects, and vice-versa. Here's how stuff interacts.

Section: In CYOA Mode...

Since Hybrid Choice is not always in CYOA mode, it is often helpful to know which mode we are currently in.

	...if in CYOA mode...
	
This returns true if we are in CYOA mode. Similarly,

	...if not in CYOA mode...

...returns true if we are playing interactively.

Section: Time

While Hybrid Choices does allow time to pass, it suppresses the every turn rulebook. This is generally because these rules are not appropriate in CYOA mode. If you don't like this behavior, you can disable it by unlisting the rule.

*:
	The prevent every turn events rule is not listed in the every turn rulebook.

Section: Moving the Player

A typical use of a choice menu is in a travel system. In this case, Hybrid Choices uses a particular function to move the player. The normal method (i.e. "now the player is in X") is slightly problematic, as the player automatically "looks" after being moved, which makes the page description be printed twice.

	...cyoa teleport to A LOCATION...
	
This moves the player without "looking", thus solving the issue.

	A page toggle rule for GoingToSchool:
		cyoa teleport to school.

Section: CYOA Parser

Hybrid Choices allows for a pretty flexible parser. By default, it allows players to make a choice, use the various testing functions (not in final release, of course), basic commands like looking and taking inventory, and the system commands like save, quit, restore, etc. However, you might want to implement new commands in CYOA mode, for example, examining.

*:
	After reading a command when in cyoa mode (this is the accept examining in CYOA rule):
		if the player's command includes "x/examine", now the command accepted is true.

This will allow examining to happen in CYOA mode.

*:
	After reading a command when in cyoa mode (this is the accept examining in CYOA rule):
		if the player's command includes "xyzzy", now the command accepted is true.

This will allow the player to type in "XYZZY", so you can code some sort of action in response to it.

Unless you set the "command accepted" to true in your own parser rules, they will automatically be rejected in CYOA mode. By default, the error message that's printed is "That command isn't available in choice mode." but you can change it to whatever you want.

	The CYOA error message is "You did wrong, bub."

The reason a text variable is used rather than a response message is simple, sometimes failing can give an unintended clue, say, when the player has to type a password in a certain room.

	Instead of xyzzying:
		if the player is not in the colossal cave:
			say "[cyoa error message][paragraph break]";
		else:
			say "Yeah the cute IF reference works."

Section: Turn To

If, by special circumstances, you want to go to a certain page through the use of an action while in choice mode, you'll want to use the "turn to A PAGE" phrase. This phrase causes Hybrid Choices to immediately turn to that page, but respecting things like page flipping and such.

	Instead of xyzzying:
		if the player is not in the colossal cave:
			say "[cyoa error message][paragraph break]";
		else:
			turn to the victory page.
			
You do not want to use this outside of choice mode, IT WILL NOT WORK. If you want to go into choice mode from interactive mode, use the "switch to cyoa at A PAGE" instead.

Section: Items

Like Adventure Book, Hybrid Choices makes use of items. Unlike Adventure Book, however, inventory items are not special sorts of flags, they're actual things in the player's inventory and things around them. A key picked up in interactive mode can be used to open a door in choice mode.

	unlockdoor is a page.
	"You unlock the door with the bronze key."
	The cdesc is "Unlock the door." The required item is the bronze key.

The "required item" of any give page is the thing that's needed in the player's inventory to reveal it. A page can only have one required item at a time.

Similarly, the "canceling item" is an object that suppresses a page if the player is lugging it around.

	hitdoor is a page.
	"Without a key, you hit the door with futility."
	The cdesc is "Hit door." The canceling item is the bronze key.
	
Another way you can use items is through the "item-invoking" action. This action allows the player to type the name of a thing in interactive mode, for example, a key, and have that prompt a certain action. By default, item-invoking is disabled. You'll need to activate it by switching the "item-invoking disabled" truth state to false.

*:
	When play begins:
		now item-invoking disabled is false.

Now you'll need to supply the behaviors when you do item-invoking. By default, it just says "The thing can't be used here.", which isn't very exciting. There are a couple of applications for it, you can use it for inventory management, or you can use it as a way to interact with objects outside of the player's inventory.

This is a very quick example of a system which opens a menu whenever you item-invoke something.

*:
	A thing has an object called the item menu. The item menu is usually nothing.

	Check item-invoking something:
		if the item menu of the noun is not a page:
			say "[The noun] [are] not very interesting." instead.

	Carry out item-invoking something:
		turn to item menu of the noun.

	The block item-invoking rule is not listed in the report item-invoking rulebook.

Section: Note on Flexible Windows

If you include Flexible Windows by Jon Ingold, a little choice window is displayed at the bottom of the page. That is, when Flexible Windows is finally released for 6L02. I don't know if this will compile with any new version of Flexible Windows, but as soon as it does I'll try to release an update.

In any case, Hybrid Choices provides you some tools to add a choice window. You'll need to provide you own code for each of these three phrases.

	SET CHOICE-WINDOW- This opens the choice-window.
	UNSET CHOICE-WINDOW- This closes the choice-window.
	REFRESH CHOICES- This prints the choices to the choice-window.

Section: Debug mode

Finally, while testing, cyoa debug mode can be toggled on and off by typing "cyoa debug". This will print all the pages you passed.

Chapter: Reference

Section: Action Reference

	choosing -- The action that is invoked when the player enters a choice.
	item-invoking -- The action that is invoked when the player types the name of an object in choice mode.
	toggling cyoa debug mode -- An action out of world which toggles CYOA debug mode on and off.

Section: Rulebook Reference

	choice-displaying activity -- An activity on pages which prints a particular choice.
	choice-switch rules -- A page based rulebook which determines whether a choice will be displayed.
	displaying available decisions activity -- Prints a list of available decisions
	page-output rules -- A page based rulebook that prints complex text when the page is displayed
	page-switch rules -- A page based rulebook which switches the current page if necessary.
	page-toggle rules -- A page based rulebook which manipulates the model the world.
	selecting activity -- goes through the internal machinery when a choice is made. This should probably not be messed with unless with great care.

Section: Variables Reference

	assigned index -- a number that's used internally. We recommend not fiddling with this.
	current page -- the page that's currently being processed.
	CYOA debug boolean -- a truth state that records whether in debug mode.
	CYOA error message -- a text that contains the error message that's printed when the parser fails.0
	CYOA mode -- a truth state that records whether the game is in CYOA mode.
	item-invoking disabled -- when true, disallows the item-invoking action.
	previous page -- the last page that offered the player a choice.

Section: Page Properties Reference

	(If you are having memory problems, going into the extension and commenting out properties you don't need is a good way to improve performance. There are more than are strictly necessary, but I wanted to be complete.)
	active, inactive -- assignable adjective, determines whether a page will be or not be displayed.
	canceling item -- object property, the page is never displayed while this is detected in inventory.
	cdesc -- text property, the text that's displayed while this is detected in inventory.
	cyoa teleport -- object property, when used, teleports the player into the specified object.
	destination page -- not assignable, the page which this goes to when it flips to another page.
	displayed boolean -- truth state property, set as "true" if the page has ever been displayed.
	end-page -- assignable adjective, ends CYOA mode.
	one-off -- assignable adjective, marks a page which is never displayed again once chosen.
	no-look (deprecated) -- assignable adjective, suppressed double prints when they occurred. Use CYOA teleport instead.
	required item -- object property, the page is only displayed as a choice if this is detected in the inventory.
	
Section: Phrase Reference

	ACTIVATE (A PAGE) -- switches the page to active.
	ACTIVATE (DESCRIPTION OF PAGES) -- switches the description of pages to active.
	ACTIVATE (LIST OF PAGES) -- switches a list of pages to active.
	CLEAR CHOICES -- clears all choices, in preperation for a new set. Best not used.
	CYOA TELEPORT TO (OBJECT) -- moves the player to the object without printing a room description.
	DEACTIVATE (A PAGE) -- switches the page to inactive.
	DEACTIVATE (DESCRIPTION OF PAGES) -- switches the description of pages to inactive.
	DEACTIVATE (LIST OF PAGES) -- switches a list of pages to inactive.
	EXECUTE PAGE TURNING -- this phrase move to a new current page, with respect to page-flipping, dead-ends, and various rules. Best not used.
	if IN CYOA DEBUG MODE -- returns true if in CYOA debug mode.
	if IN CYOA MODE -- returns true if in CYOA mode.
	if NOT IN CYOA MODE -- returns false if in CYOA mode.
	if READING (A PAGE) -- a more readable way of ask if the current page is that page.
	REFRESH CHOICES -- reprints all the choices in the choice-window.
	SET CHOICE-WINDOW -- opens the choice window, if using Flexible Windows.
	SWITCH FROM CYOA -- switches to interactive mode from choice mode.
	SWITCH TO CYOA AT (A PAGE) -- switches from interactive mode to cyoa mode at the specified page.
	TURN TO (A PAGE) -- makes this page the new current page and executes the page turning routine.
	UNSET CHOICE-WINDOW -- closes the choice window, if using Flexible Windows.


Example: * The Only Room - A very short and entirely abstract game used for testing.

*:
	"The Only Room" by AW Freyr

	Include Hybrid Choices by AW Freyr.
		
	The only room is a room.

	After looking for the first time:
		switch to cyoa at p1.

	P1 is a page.

	P2 is a page. The cdesc is "P2". It is for P1.

	P3 is a page. The cdesc is "P3". It is for P2.

	P4 is a page. It is flipped to by P3.
	"Whoa. Interesting.".

	P5 is a page. It is flipped to by P4.
	"Damn man. That's crazy stuff."

	P6 is a page. The cdesc is "P6". It is for P5. It is a dead-end.
	"You've encountered something and ran away."

	P7 is a page. The cdesc is "P7". It is for p5.

	P8 is a page. The cdesc is "P8". It is for p5. It is inactive.
	"You aren't supposed to see this."
	
Example: ** Eating a Banana - A simple demonstration of item-invoking and how it might be implemented in a large project.

*:
	"Eating a Banana" by AW Freyr

	Include Hybrid Choices by AW Freyr.

	A thing has an object called the item menu. The item menu is usually nothing.

	Check item-invoking something:
		if the item menu of the noun is not a page:
			say "[The noun] [are] not very interesting." instead.

	Carry out item-invoking something:
		turn to item menu of the noun.

	The block item-invoking rule is not listed in the report item-invoking rulebook.

	The banana is a thing carried by the player. The item menu is b1.

	b1 is a page. It is a dead-end.
	"You eat the banana."

	A page-toggle rule for b1:
		now the banana is off-stage.

	p1 is a page.
	"You get the feeling there's no way out except eating a banana."

	The blue room is a room.

	After looking for the first time:
		now the item-invoking disabled is false;
		switch to cyoa at p1.

Example: *** Temple of Fear - A full, basic game demonstrating a lot of different features.

*:
	"Temple of Fear" by AW Freyr

	Include Hybrid Choices by AW Freyr.

	Chapter - Set Up

	The current stamina is a number that varies. The current stamina is 20.
	The initial stamina is a number that varies. The initial stamina is 20.

	The skill is a number that varies. The skill is 10.

	The luck is a number that varies. The luck is 10.


	After looking for the first time:
		now the left hand status line is "Stamina: [current stamina]/[initial stamina] Skill: [skill] Luck: [luck]";
		now the right hand status line is "";
		switch to cyoa at p1.

	The sword is a thing. It is carried by the player.
	A meal is a kind of thing. The player is carrying 4 meals.

	The bronze key is a thing.

	Chapter - Temple of Fear

	The game world is a room.

	P1 is a page.
	"You have just slain the Troll of Bigness, and are ready to make your way into the Temple of Fear. It's just over the bridge to the north."

	P2 is a page.
	"[first time]You cross the bridge and find yourself in a huge forest. [only]The door to the Temple of Fear is north. There is a path through the forest to your left."
	The cdesc is "Cross the bridge." It is for p1.

	A page-toggle rule for p2:
		now the cdesc of p2 is "Head back to the Temple of Fear."

	p3 is a page.
	It is flipped to by p2.

	p4 is for p3.
	"You check the door, but it appears to have a lock or something. Damn."
	The cdesc is "Check the door.". It is a dead-end.

	A page-switch rule for p4:
		if the player is carrying the bronze key:
			now the current page is p12.

	p5 is for p3. It is one-off.
	"You travel through the forest and eventually encounter a troll."
	The cdesc is "Go to the forest.".

	A choice-switch rule for p5:
		if the player carries the bronze key:
			rule fails.

	p6 is for p5.
	"You slay the troll and lose 4 stamina in the process as it clubs you."
	The cdesc is "Kill the troll by stabbing it.".

	A page-toggle rule for p6:
		now the current stamina is current stamina - 4.

	p7 is for p5.
	"You outwit the troll and it dies from outwitting. You lose 1 luck because yes.".
	The cdesc is "Outwit the troll.".

	A page-toggle rule for p7:
		now the luck is luck - 1.

	p8 is for p5.
	"You flash some serious skills and the troll's head explodes, killing it. You lose 1 skill because you are so tired now.".
	The cdesc is "Intimidate it with mad skillz.".

	A page-toggle rule for p8:
		now the skill is skill - 1.

	p9 is a page.
	"OK, you've murdered the troll and now enter a clearing. There's a key here."
	It is flipped to by p6, p7, p8.

	p10 is for p9.
	"You take the key. Now you can enter the Temple of Fear."
	The cdesc is "Take key." It turns to p2.

	A page-toggle rule for p10:
		now the player carries the bronze key.

	p11 is for p9.
	"There's a totally unrelated trap you stumble onto and die."
	The cdesc is "Fall for trap.".

	A page-toggle rule for p11:
		end the story.
		
	p12 is a page.
	"You unlock the door and are greeted by a terrible temple full of mysteries, traps, and devious challenges."

	A page-toggle rule for p12:
		end the story saying "DLC required: Temple of Fear. Now only $10!"
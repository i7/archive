Version 2 of Config File (for Glulx only) by Aaron Reed begins here.

"Allows for setting the value of number variables in an external config file that is loaded when play begins."

[Version History:
 - v2: Added better response to malformed numbers.
]

Section - Default Config File

The File of Config is called "config". 

Section - complex values

A value-object is a kind of thing.
A value-object has an indexed text called the nKey.

Externally assigning something is an activity on value-objects.

Section - number-objects

A number-object is a kind of value-object.
A number-object has a number called the nVal.

Section - truth-objects

A truth-object is a kind of value-object.
A truth-object has a truth state called the tVal.

Section - string-objects

A string-object is a kind of value-object.
A string-object has an indexed text called the sVal.


Section - Not Reporting on Missing Config File

[This section and the next have the effect of not interrupting a released game with a missing config file: later code will cause the story to silently continue with default values.]

blank config file message is an indexed text variable. 

Section - Reporting on Missing Config File (not for release)

blank config file message is "** Blank config file created.";

Section - Reading and Processing the File

First when play begins (this is the read the external config file rule):
	read config file.

To read config file:
	unless File of Config exists:
		write " " to File of Config;
		say blank config file message;
		stop;
	let config file be "[text of File of Config]";
	repeat with ln running from 1 to the number of lines in config file:
		let thisline be line number ln in config file;
		set key value pair for thisline;  
		if theKey is "", next;
		if setup-external-variables is true, generate external variable code;
		repeat with valObj running through value-objects:
			if nkey of valObj is theKey:
				if theType is tNumeric:
					let valNumber be numerical value of theVal;
					unless valNumber is -1:
						now nVal of valObj is valNumber;
				else if theType is tBoolean:
					let valTruth be whether or not boolean of theVal;
					now tVal of valObj is valTruth;
				else:
					let valStr be contents of theVal;
					unless valStr is "":
						now sVal of valObj is valStr;
	if setup-external-variables is true and the number of lines in config file > 0, say "[line break]** Completed generating config file code.";
	repeat with valObj running through value-objects:
		carry out the externally assigning activity with valObj.
		
Section - Setting the Key/Value Pairs

typeKind is a kind of value. The typeKinds are tNumeric, tBoolean, or tString.
theType is a typeKind variable.
theKey is an indexed text variable. 
theVal is an indexed text variable. 

To set key value pair for (thisline - an indexed text):
	if character number 1 in thisline is "!" or thisline is empty:
		now theKey is "";
	otherwise if thisline matches the regular expression "(.*)=(.*)":
		now theKey is "[text matching subexpression 1]";
		now theVal is "[text matching subexpression 2]";
		if character number 1 in theVal matches the regular expression "<tTfF>":
			now theType is tBoolean;
		otherwise if character number 1 in theVal matches the regular expression "<['][quotation mark]>":
			now theType is tString;
		otherwise:
			now theType is tNumeric;
	otherwise:
		now theKey is "".

Section - Converting Strings to Numbers
		
To decide what indexed text is contents of (str - an indexed text):
	unless str matches the regular expression "^(<['][quotation mark]>)(.*)(<['][quotation mark]>)$":
	 	say "***Error reading [str] as a string; using default value instead.***";
		decide on "";
	say "*[text matching subexpression 1]|[text matching subexpression 2]|[text matching subexpression 3]*";
	now str is "[text matching subexpression 2]";
	replace the text "\[quotation mark]" in str with "'";
	decide on str.
		
To decide if boolean of (str - an indexed text):
	if str matches the text "true", case insensitively:
		now theVal is "true";
		decide on true;
	else:
		now theVal is "false";
		decide on false.

To decide what number is numerical value of (str - an indexed text):
	let cursorPos be the number of characters in str;
	let cursorChar be an indexed text;
	let total be 0;
	let digit be 0;
	let tens be 1;
	while cursorPos > 0:
		now cursorChar is character number cursorPos in str;
		if cursorChar matches the text "9":
			now digit is 9;
		otherwise if cursorChar matches the text "8":
			now digit is 8;
		otherwise if cursorChar matches the text "7":
			now digit is 7;
		otherwise if cursorChar matches the text "6":
			now digit is 6;
		otherwise if cursorChar matches the text "5":
			now digit is 5;
		otherwise if cursorChar matches the text "4":
			now digit is 4;
		otherwise if cursorChar matches the text "3":
			now digit is 3;
		otherwise if cursorChar matches the text "2":
			now digit is 2;
		otherwise if cursorChar matches the text "1":
			now digit is 1;
		otherwise if cursorChar matches the text "0":
			now digit is 0;
		otherwise:
			say "***Error reading [str] as number; using default value instead.***";
			decide on -1;
		increase total by ( digit * tens ) ;
		now tens is 10 * tens;
		decrease cursorPos by 1;
	decide on total.


Section - Automatically generating code
	
setup-external-variables is a truth state that varies. setup-external-variables is usually true.

evc-ctr is a number variable. evc-ctr is 0.

To generate external variable code:
	if evc-ctr is 0:
		say "** Generating config file code. Paste this back into your Inform story project to initialize the config file.[paragraph break]";
		say "setup-external-variables is false.";
	increase evc-ctr by 1;
	say "[theKey] is a ";
	if theType is tNumeric:
		say "number variable. n-[theKey] is a number-object with nkey '[theKey]' and nVal [theVal]. For externally assigning n-[theKey]: now [theKey] is nVal of n-[theKey].";
	else if theType is tBoolean:
		say "truth state variable. n-[theKey] is a truth-object with nkey '[theKey]' and nVal [theVal]. For externally assigning n-[theKey]: now [theKey] is tVal of n-[theKey].";
	else:
		say "text variable. n-[theKey] is a string-object with nkey '[theKey]' and nVal '[theVal]'. For externally assigning n-[theKey]: now [theKey] is sVal of n-[theKey].";

Config File ends here.

---- DOCUMENTATION ----

Many programs allow for defining the values of certain important variables in an external file, which is loaded each time the program begins running. This allows for parameters to be changed without needing to recompile the program. The Config File extension adds this functionality to Inform.

Section: Initialization

Using the extension requires a three-part initialization process. First, include the extension and compile your project. This will create a blank config file in the project directory. Edit this file with a text editor and define a set of key value pairs separated by an equals sign that define your variables and their default values. For instance, your config file might look like this (the first line is automatically created when Inform creates the file:

	* //57BB9588-4BA9-4AD2-BC35-869673E5C13F// config
	numberOfMonkeys=32
	timesToScreech=3
	irritabilityIndex=0
	
Variables must contain no spaces, and there must in addition be no spaces between the end of the variable name and the number. Blank lines or lines starting with an exclamation point are ignored. You may add a space and any additional characters after the numeric value; this extra material will be ignored. Avoid tab characters, which seem to cause an inexplicable slowdown in some interpreters when reading the file.

Save the config file and recompile your program. A block of Inform code will be generated to create these variables, along with infrastructure that will allow their values to be read in. Simply copy and paste this code block into your project, recompile once again, and you're set. You can now reference all variables in your Inform code, and change their values in the config file at will. If the config file is absent at the time the story is executed, the default values you initially defined will be used.

Section: Releasing

Releasing your story presents a small difficulty in that various interpreters will append different extensions to the file. An interpreter may ignore a "config.glkdata" file and instead create a blank "config" file in the same directory. Since the Glulx VM is not allowed to know the exact filename of an external file, this is not directly fixable: but one solution is to release duplicate config files in the two most common formats (a file ending with ".glkdata" and another with no extension should cover most platforms) and instruct users to edit whichever one their platform makes use of.

Section: Setting up Variables by Hand

If you don't want to use the auto-generated variable setup, add the following line to your project:

	setup-external-variables is false.

Now, for each external variable, you must create a parallel thing of the "number-object" kind with two variables: an indexed text called "nKey" containing the associated variable's name, and a number called "nVal" containing its default value. Then, you must create a "For externally assigning" rule for the number-object which sets your real variable to the nVal of the number-object. For example:

	numberOfMonkeys is a number variable. n-numberOfMonkeys is a number-object with nKey "numberOfMonkeys" and nVal 27. For externally assigning n-numberOfMonkeys: now numberOfMonkeys is nVal of n-numberOfMonkeys.

Section: Future Improvements

* Extending to allow for config files containing indexed text and truth state variables.

Example: * Monkeys - A basic example.

Run once to generate the external config file. Open it in a text editor, then add the two lines:

numOfMonkeys=42

monkeyUtterances=5

Save the config file and re-run the Inform program. It will output a block of Inform statements. Copy and paste this into your source code (overwriting the existing variable declarations) and recompile a final time to complete initialization. You can now modify the values of the variables within the config file and observe the changes reflected in the game. 

	*: "Monkeys"

	Include Config File by Aaron Reed.

	numOfMonkeys is a number variable. monkeyUtterances is a number variable.

	The Jungle is a room. Some monkeys are here. "You can see [numOfMonkeys in words] monkeys here."

	Instead of attacking monkeys:
		repeat with X running from 1 to monkeyUtterances:
			say "[one of]Ooo[or]Aaa[at random]! ".













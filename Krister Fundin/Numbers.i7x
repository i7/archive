Numbers by Krister Fundin begins here.

"Provides various phrases for testing, manipulating and repeating through numbers."

Part 1 - Arithmetic

To multiply (A - an existing number variable) by (B - a number):
	(- {A} = {A} * {B}; -).

To divide (A - an existing number variable) by (B - a number):
	(- {A} = IntegerDivide({A}, {B}); -).

To decide what number is the negative of (N - a number): decide on zero minus N.

To decide which number is the absolute value of (N - a number):
	if N is negative:
		decide on the negative of N;
	otherwise:
		decide on N.

To decide what number is the sign of (N - a number):
	if N is positive:
		decide on 1;
	otherwise if N is negative:
		decide on -1;
	otherwise:
		decide on 0.

To decide what K is the difference between (A - an arithmetic value of kind K) and (B - K):
	if A is greater than B:
		decide on A minus B;
	otherwise:
		decide on B minus A.

To decide which number is (B - a number) raised to the power of (E - a number):
	let the answer be 1;
	while E > 0:
		multiply the answer by B;
		decrease E by 1;
	decide on the answer.

Part 2 - Testing

Divisibility relates a number (called A) to a number (called B) when the remainder after dividing A by B is zero.
The verb to divide (he divides, they divide, he divided, it is divisible) implies the reversed divisibility relation.

To decide whether (N - an arithmetic value of kind K) is between (A - K) and (B - K):
	if A is greater than B, decide on whether or not N is between B and A;
	if N is less than A, no;
	if N is greater than B, no;
	yes.

To decide whether (N - an arithmetic value of kind K) is not between (A - K) and (B - K):
	if A is greater than B, decide on whether or not N is not between B and A;
	if N is less than A, yes;
	if N is greater than B, yes;
	no.

Part 3 - Repeating

To repeat with (N - nonexisting K variable) running from (low - an arithmetic value of kind K) to (high - K) in steps of (step - K) begin -- end:
	(- for ({N} = {low} : {N} <= {high} : {N} = {N} + {step}) -).

To repeat with (N - nonexisting K variable) running backwards from (high - an arithmetic value of kind K) to (low - K) begin -- end:
	(- for ({N} = {high} : {N} >= {low} : --{N}) -).

To repeat with (N - nonexisting K variable) running backwards from (high - an arithmetic value of kind K) to (low - K) in steps of (step - K) begin -- end:
	(- for ({N} = {high} : {N} >= {low} : {N} = {N} - {step}) -).

To repeat (N - a number) times begin -- end:
	(-{-push-ctvs}for (ct_0 = {N} : ct_0 > 0 : --ct_0) -).

To repeat forever begin -- end:
	(- for (::) -).

Part 4 - Miscellaneous

To decide which K is a random (name of kind of arithmetic value K) between (low - K) and (high - K) excluding (ex - K):
	(- RandomExclude(R_{-printing-routine:K}, {low}, {high}, {ex}) -).

To decide which K is a random (name of kind of arithmetic value K) from (low - K) to (high - K) excluding (ex - K):
	(- RandomExclude(R_{-printing-routine:K}, {low}, {high}, {ex}) -).

Include
(-
	[ RandomExclude rule low high ex val;
		if (ex < low || ex > high)
		{
			return rule(low, high);
		}
		else
		{
			val = rule(low, high - 1);
			if (val >= ex) ++val;
			return val;
		}
	];
-).

Numbers ends here.

---- Documentation ----

This extension adds to Inform 7's built-in stock a variety of new phrases for dealing with numbers and other arithmetic values.

Section: Arithmetic

Inform 7 already provides the syntax "increase/decrease N by (some number)". We add similar phrases for the two remaining standard operations:

	multiply N by (some number)
	divide N by (some number)

Note that these two phrases can only be used on local variables.

Next, we have a couple of phrases that deal with the magnitude and sign of numbers:

	the negative of (some number)
	the absolute value of (some number)
	the sign of (some number)
	the difference between (some value) and (some other value)

The first phrase switches the sign of a number, so that 5 becomes -5 and vice versa. The second just removes the negative sign, so that both 6 and -6 become 6. The third returns -1, 1 or 0 depending on whether the number is negative, positive or zero, and the last phrase (which works with all arithmetic values and not just numbers) simply subtracts the smaller value from the larger.

Finally, we add an exponentiation operator, using the following syntax:

	(some number) raised to the power of (some other number)

Section: Testing

We can test if a number divides another evenly like so:

	if (some number) divides (some other number)
	if (some number) is divisible by (some other number)

We can also test if a number or other value falls within a certain range:

	if N is between (some value) and (some other value)
	if N is not between (some value) and (some other value)

Note that it does not matter if the smaller of the two values is put first or last.

Section: Repeating

The built-in syntax for repeating through a range of values is extended so that we can repeat backwards and/or repeat with a stride larger than one:

	repeat with N running from (low) to (high) in steps of (step)
	repeat with N running backwards from (high) to (low)
	repeat with N running backwards from (high) to (low) in steps of (step)

We also provide two other repeat phrases:

	repeat (some number) times
	repeat forever

The first phrase simply executes the following block a given number of times, while the second one keeps repeating until the loop is explicitly exited, either by returning from the current rule or phrase, or by using the "break" command.

Section: Miscellaneous

One last phrase deals with randomness:

	a random (kind of value) between (low) and (high) excluding (some value)

This phrase returns a random value from the given range, except that it will never return the one given as the final argument.

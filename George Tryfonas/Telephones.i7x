Telephones by George Tryfonas begins here.

"Telephones, standard and portable."

A telephone is a kind of thing. A telephone has a number called the calling number. A telephone has a person
called the owner. A telephone can be inuse. A telephone is usually not inuse. Understand "phone" as a telephone.

Understand "dial [a number]" as dialling it on. 
Understand "dial [a number] on/using [something]" as dialling it on.
Understand the command "call" or "phone" or "telephone" as "dial".

Connection relates one person to another (called the other party). 

The verb to reach (he reaches, they reach, it is reached) implies the connection relation.

Dialling it on is an action applying to one number and one visible thing.

The dialling it on action has an object called the line dialled.

Setting action variables for dialling (this is the set up dialling rule):
	repeat with item running through the list of telephones:
		if the calling number of the item is the number understood, now the line dialled is the item.

Check dialling it on (this is the can't dial on something that is not a telephone rule):
	if the second noun is not a telephone, say "Don't be silly." instead;

Check dialling it on (this is the can't dial the calling number rule):
	if the number understood is the calling number of the second noun, say "You get a busy signal." instead;

Check dialling it on (this is the can't dial an emergency number rule):
	if the number understood is a number listed in the Table of Misdialled Numbers, say "[the retort corresponding to a number of the number understood in the Table of Misdialled Numbers]" instead.

Check dialling it on (this is the can't dial an invalid numer rule):
	if the line dialled is nothing, say "The phone rings but there is no reply." instead.

Carry out dialling it on (this is the standard dialling rule):
	now the second noun is inuse;
	now the player reaches the owner of the line dialled.

Report dialling it on (this is the standard report dialling rule):
	say "'Hello?' says [the other party of the player] on the other side of the line.".

After deciding the scope of the player while the player reaches someone (this is the establish connection rule): 
	place the other party of the player in scope.

Instead of listening to a inuse telephone when the player reaches someone (this is the listening to a connected telephone rule): 
	say "You can hear [the other party of the player] breathing." 


Before listening to someone when the player cannot touch the noun (this is the listening to a connected party rule): 
	say "[The noun] is waiting for you to carry on the conversation." instead.

Rule for supplying a missing second noun while dialling: 
	assign a phone. 


To assign a phone: 
	if the player can touch a telephone (called the current phone): 
		say "(on [the current phone])[line break]"; 
		change the second noun to the current phone; 
	otherwise: 
		say "You don't have a phone handy."

Before dialling when the player reaches someone (this is the dialling a telephone while on the line rule): 
	say "(first ending your conversation with [the other party of the player])[command clarification break]";
	end current conversation. 


Understand "hang up" as hanging up. 


Hanging up is an action applying to nothing.

The hanging up action has an object called the phone hanged up. 

Setting action variables for hanging up (this is the set up hanging up rule):
	let the target be a random inuse telephone which can be touched by the player;
	now the phone hanged up is the target.

Check hanging up (this is the can't hang up while not on the line rule): 
	if the player does not reach someone, say "You're not on the line with anyone." instead;

Carry out hanging up (this is the standard hanging up rule):
	now the phone hanged up is not inuse;
	now the player does not reach anyone. 

Report hanging up (this is the standard report hanging up rule): 
	say "You put down [the phone hanged up], cutting the connection." 

Before going somewhere when the player reaches someone (this is the go somewhere while on the line rule):
	if the number of inuse telephones held by the player is 0: 
		say "(first hanging up on [the other party of the player])[command clarification break]"; 
		end current conversation.

After looking when the player reaches someone (this is the look while on the line rule):
	try listening to the other party of the player;
	continue the action.

To end current conversation: 
	silently try hanging up.

Table of Misdialled Numbers
number	retort
911	"In this country, making prank calls to the police is frowned upon."

Telephones end here.

---- DOCUMENTATION ----

The Telephones extension is a slight reworking of the "Four Cheeses" sample from the manual. It provides a new kind called telephone, which has two properties: an owner and a calling number.

	The office phone is a telephone. The owner of the office phone is John. The calling number of the office phone is 1234.

A new action called "dialling" is created and a new command "dial" (or "call" or "phone" or "telephone") is provided to the player. The player may optionally specifiy the telephone on which to place the call:

	> call 1234
	> dial 1234 on the office phone
	> phone 1234 using the office phone
	> telephone 1234

If the telephone is carried by the player then they may move around the map while still on the line. A telephone which is fixed in place is meant to be a landline while a portable phone is meant to be a mobile. We should provide appropriate descriptions to help the player distinguish that:

	The office phone is a telephone which is scenery. The description is "The office phone sits on your desk. A long cord connects it to the phone plug on the back wall." The player carries a telephone called the cellphone. The description is "Your trusty cellphone. It's a vintage model."

We provide a Hanging up action which is nounless. The action itself decides which phone to hang up since we only support one connection at a time.

To achieve the effect of making a connection, we bring the connected party into the player's scope. This means that we are free to choose whichever strategy is more appropriate to implement conversing with it, as if it were in the player's presence.

Finally, we provide the Table of Misdialled Numbers as a way of printing a customised message when the player dials a (well known) number which they are not meant to use.

	Table of Misdialled Numbers (continued)
	number	retort
	1471	"The number that last called you is not available."
	999	"In this country, making prank calls to the police is frowned upon."

Example: ** Chatter - Calling a somebody on the phone to make idle chit chat.

Making a connection works simply by bringing the other party into scope, so to talk to it we may choose any strategy we like: use the built in actions and rules (which won't achive much); use one of the available extensions; roll our own. Here we chose to use a simplified version of what was done in the "Four Cheeses" example.

	*: "Chatter"

	Include Telephones by George Tryfonas.

	Section 1 - The Scenery

	The Office is a room. "The office is rather spartan. A couple of filing cabinets lean on the back wall. On the desk is a telephone." The office phone is a telephone which is scenery in the Office. The description of the office phone is "The office phone sits on your desk. A long cord connects it to the phone plug on the back wall." The player carries a telephone called the cellphone. The description of the cellphone is "Your trusty cellphone. It's a vintage model." The cabinet is scenery in the office. The description of the cabinet is "All the experimental results about the company's major projects are stacked in these dusty cabinets." The desk is scenery in the Office. The description of the desk is "You bring to your mind the endless hours spent behind this desk and can't help feeling sorry for yourself."

	Understand "cabinets" or "filing cabinet/cabinets" as the cabinet. Understand "desk phone" as the office phone.

	The Common Room is east of the Office. "The Common Room is where the company's employees gather together for their tea break. There are two rows of benches in the middle of the room. A wall mounted television is now showing the Tottenham - Chelsea derby." The television is scenery in the Common Room. The description of the television is "Go Spurs!"

	Understand "tv" as the television.

	The player carries a piece of paper. The description of the paper is "On the piece of paper, in your handwriting, is written: 'John: 1234'".

	Section 2 - The People

	John is a man. The red phone is a telephone. The calling number of the red phone is 1234. The owner of the red phone is John.

	Section 3 - Carrying out Conversations

	Before telling John about something: 
		try asking the noun about it instead. 


	Before answering John that something: 
		say "Best to confine your conversation to questions and answers." instead. 


	Before asking John about something: 
		if the topic understood is a topic listed in the Table of Conversation, say "[reply entry][paragraph break]" instead; 
		otherwise say "[The noun] does not reply." instead.

	Table of Conversation
	topic	reply
	"Chelsea/Tottenham/Hotspur/Spur/Spurs/derby/football/soccer/match"	"'Chelsea will definitely win this one,' John snaps. 'At least, I certainly hope so.'"
	"work/company"	"This is a touchy subject. 'I hate that job,' says John. 'I work days for that project and nothing comes out of it.'"
	"project"	"'If you ask me,' John says, 'I think that producing dehydrated water is plain silly. But, hey! Rawlins thinks it's feasible, and that fool of a supervisor, Hamilton, is ever so eager to agree. So who am I to say no?'"
	"supervisor/Hamilton"	"'I've never seen anyone kiss up so willingly in my life.'"
	"boss/Rawlins"	"'He's a nut. Dehydrated water! Hah!'"

	Table of Misdialled Numbers (continued)
	number	retort
	1471	"The number that last called you is not available."
	999	"In this country, making prank calls to the police is frowned upon."

	Test looking with "x office phone / x cellphone / x desk / x cabinet / i / x paper".
	Test landdial with "call 1234 using the office phone / ask john about work / ask john about project / ask john about boss / hang up".
	Test celldial with "e / x tv / call 1234 on the cellphone / ask john about chelsea / w / ask john about company / ask john about project / ask john about hamilton / ask john about rawlins / hang up".
	Test me with "test looking / test landdial / test celldial".

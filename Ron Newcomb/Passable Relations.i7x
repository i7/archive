Passable Relations by Ron Newcomb begins here.

"Allows us to ask if an abstract relation holds between two objects.  Supports the standard physical relations as well as any new relations."

Volume - Extension Passable Relations

Chapter 1 - Most useful phrases

To decide whether (R - an abstract-relation) holds between (X - an object) and (Y - an object):   (- Relation_Test({X}, {R}, {Y}) -).

To decide whether (R - an abstract-relation) holds between (X - an object) and (Y - an object) or vice-versa:   (- SymRelation_Test({X}, {R}, {Y}) -).

To decide whether (R - an abstract-relation) does/-- not hold/holds between (X - an object) and (Y - an object):  (- (~~(Relation_Test({X}, {R}, {Y}))) -).

To decide whether (R - an abstract-relation) does/-- not hold/holds between (X - an object) and (Y - an object) or vice-versa:   (- (~~(SymRelation_Test({X}, {R}, {Y}))) -).

[To now/ensure (R - an abstract-relation) holds between (X - an object) and (Y - an object):   (- Relation_SetTrue({X}, {R}, {Y}); -).

To now/ensure (R - an abstract-relation) does/do/-- not/doesn't/don't hold/holds between (X - an object) and (Y - an object):  (- Relation_SetFalse({X}, {R}, {Y}); -).
]

Chapter 2 - The printing a relation activity

[ This looks like a lot of unnecessary work, but it allows client code some great hooks to control prosaic output. ]
[ Note that the printing a relation activity cannot be safely nested within itself. ]

Printing a relation is an activity.   The currently printing relation is a number that varies. 

Last for printing a relation: say the printed name of relation  the currently printing relation. [say unpunctuated word number 1 in the description of relation the  currently printing relation.]

To say (R - an abstract-relation): 
	now the currently printing relation is R as a number;
	carry out the printing a relation activity. [say the printed name of relation R .]

To decide whether relation to print is/are (R - an abstract-relation): decide on whether or not the currently printing relation is R as a number.


Chapter 3 - Definitions

A relation-kind is a kind of value.  

To decide which number is number of relations: (-NumberOfRelations()-).
To decide which relation-kind is kind of/for relation/abstract-relation (N - number): (- RelationKind({N}) -).
To decide what   text    is description of/for relation/abstract-relation (N - number): (- RelationName({N}) -).
To decide which relation-kind is kind of/for relation/abstract-relation (R - abstract-relation): (- RelationKind({R}) -).
To decide what   text    is description of/for relation/abstract-relation (R - abstract-relation): (- RelationName({R}) -).

To decide which abstract-relation is (N - number) as a/the/an/-- relation/abstract-relation: (- {N} -).
To decide which number is (R - abstract-relation) as a/the/an/-- number: (- ({R}) -).

First when play begins (this is the repair relation's metadata rule): repair relation's metadata. To repair relation's metadata: (- RepairRelationMetadata(); -).


Chapter 4 - VM differences

Section 1 - uses indexed text (for Glulx only)

To decide which indexed text is printed/-- name of/for the/an/a/-- relation/abstract-relation (N - number):
	decide on unpunctuated word number 1 in the description of relation N.
To decide which indexed text is printed/-- name of/for the/an/a/-- relation/abstract-relation (R - abstract-relation):
	decide on unpunctuated word number 1 in the description of relation R.

Section 2 - avoids indexed text (for Z-machine only)

[the printing a relation activity will simply print a number by default]
To decide which text is printed/-- name of/for the/an/a/-- relation/abstract-relation (N - number): 
	say N; decide on "".
To decide which text is printed/-- name of/for the/an/a/-- relation/abstract-relation (R - abstract-relation): 
	say R as number; decide on "".


Chapter 5 - Hide this mess from the documentation - unindexed

The relation-kinds are Relation_Implicit, Relation_reversed, Relation_OtoO, Relation_OtoV, Relation_VtoO, Relation_VtoV, Relation_Sym_OtoO, Relation_Sym_VtoV, Relation_Equiv, Relation_ByRoutine, Relation_ByHalfRoutine,  Relation_ByMapNRoutine, Relation_ByMapNERoutine, Relation_ByMapNWRoutine,Relation_ByMapSRoutine, Relation_ByMapSERoutine, Relation_ByMapSWRoutine, Relation_ByMapERoutine, Relation_ByMapWRoutine, Relation_ByMapURoutine, Relation_ByMapDRoutine, Relation_ByMapIRoutine, Relation_ByMapORoutine.  


[Chapter 6 - for debugging this extension - not for release

First when play begins:  output relation_metadata. 

To output relation_metadata:  [ will print the new Array exactly as it would have appeared in auto.inf had the information not been missing ]
	say  "Array relation_metadata -->[line break]";
	repeat with X running from 0 to the number of relations begin;
		say " [propnum of relation X] [kind of relation X] '[description of relation X]'[line break]";
	end repeat.

[support for the above]
Include (- [ RelationPropNum rel; return relation_metadata-->((rel*3)); ]; -).
To decide which number is propnum for/of relation/abstract-relation (N - number): (- RelationPropNum({N}) -).
To say (foo - Relation_reversed): say "(-1)".
]

Chapter 7 - Hard-bitten Inform 6 datacode

Include (-

Constant Relation_ByHalfRoutine = 9;  ! many I7 relations compile to an I6 function, used like:    obj1 == SupporterOf(obj2)
Constant  Relation_ByMapNRoutine = 10;  ! in lieu of Relation_ByRoutine this constant must carry addtional data
Constant  Relation_ByMapNERoutine = 11;
Constant  Relation_ByMapNWRoutine = 12;
Constant  Relation_ByMapSRoutine = 13;
Constant  Relation_ByMapSERoutine = 14;
Constant  Relation_ByMapSWRoutine = 15;
Constant  Relation_ByMapERoutine = 16;
Constant  Relation_ByMapWRoutine = 17;
Constant  Relation_ByMapURoutine = 18;
Constant  Relation_ByMapDRoutine = 19;
Constant  Relation_ByMapIRoutine = 20;
Constant  Relation_ByMapORoutine = 21;

Array relation_metadata_testfunctions -->
 (0)  ! this is index 0, the "is" relation. it has no Inform7 name that I know of
 ContainerOf ContainerOf
 SupporterOf SupporterOf 
 component_parent component_parent
 CarrierOf  CarrierOf
 HolderOf  HolderOf 
 WearerOf  WearerOf
 OwnerOf  OwnerOf
 TestVisibility  TestVisibility
 TestTouchability  TestTouchability
 TestConcealment  TestConcealment
 IndirectlyContains   IndirectlyContains 
 TestAdjacency   TestAdjacency
 TestRegionalContainment  TestRegionalContainment
 0 0    ! greater than, less than.  Can't deal with these numerical relations. Leave 'em untouched
 0 0
 0 0
 0 0
 MapConnection  MapConnection
 MapConnection  MapConnection
 MapConnection  MapConnection
 MapConnection  MapConnection
 MapConnection  MapConnection
 MapConnection  MapConnection
 MapConnection  MapConnection
 MapConnection  MapConnection
 MapConnection  MapConnection
 MapConnection  MapConnection
 MapConnection  MapConnection
 MapConnection  MapConnection
NULL;

Array relation_metadata_relationtypes -->
 (-1)   ! this is index 0, the "is" relation
 Relation_ByHalfRoutine (-1)
 Relation_ByHalfRoutine (-1)
 Relation_OtoV (-1) 
 Relation_ByHalfRoutine (-1)
 Relation_ByHalfRoutine (-1)
 Relation_ByHalfRoutine (-1)
 Relation_ByHalfRoutine (-1)
 Relation_ByRoutine (-1)
 Relation_ByRoutine (-1)
 Relation_ByRoutine (-1)
 Relation_ByRoutine (-1)
 Relation_ByRoutine (-1)
 Relation_ByRoutine (-1)
 Relation_Implicit  (-1)  ! greater than, less than.  Can't deal with these numerical relations
 Relation_Implicit  (-1)
 Relation_Implicit  (-1)
 Relation_Implicit  (-1)
 Relation_ByMapNRoutine (-1)
 Relation_ByMapNERoutine (-1)
 Relation_ByMapNWRoutine (-1)
 Relation_ByMapSRoutine (-1)
 Relation_ByMapSERoutine (-1)
 Relation_ByMapSWRoutine (-1)
 Relation_ByMapERoutine (-1)
 Relation_ByMapWRoutine (-1)
 Relation_ByMapURoutine (-1)
 Relation_ByMapDRoutine (-1)
 Relation_ByMapIRoutine (-1)
 Relation_ByMapORoutine (-1)
NULL;

[ RepairRelationMetadata x i;   ! adds to the relation_metadata array the Inform6 routines used by the most basic built-in relations
	x = 3;
	for (i = 1; i < 59; i++) {
		relation_metadata-->(x) = relation_metadata_testfunctions-->(i);
		relation_metadata-->(x+1) = relation_metadata_relationtypes-->(i); 
 		x = x + 3;
	}
];

[ NumberOfRelations; return {-value:NUMBER_CREATED(binary_predicate)} - 1; ];

[ RelationName rel; return relation_metadata-->((rel*3)+2); ];

[ RelationKind rel i;
	i = relation_metadata-->((rel*3)+1);
	if ((i == -1) && (rel ~= 0) && ((rel & 1) ==  0)) return 2;
	return i + 2;
];

[ SymRelation_Test obj1 rel_num obj2; 
	if (Relation_Test(obj1, rel_num, obj2)) rtrue;
	return Relation_Test(obj2, rel_num, obj1);
];

[ Relation_Test obj1 rel_num obj2 rel_prop rel_type x pr pr2; 
	if (obj1 == nothing || obj2 == nothing) rfalse;
	x = rel_num*3; 
	rel_type = relation_metadata-->(x+1); 
	rel_prop = relation_metadata-->(x); 
	switch(rel_type) { 
	Relation_OtoO:		return ((obj2 provides rel_prop) && (obj2.rel_prop == obj1)); 
	Relation_Sym_OtoO:	return ((obj2 provides rel_prop) && (obj2.rel_prop == obj1)); 
	Relation_OtoV:		return ((obj2 provides rel_prop) && (obj2.rel_prop == obj1)); 
	Relation_VtoO:		return ((obj1 provides rel_prop) && (obj1.rel_prop == obj2)); 
	Relation_Equiv:		return ((obj1 provides rel_prop) && (obj2 provides rel_prop) && (obj1.rel_prop == obj2.rel_prop)); 
	Relation_ByRoutine: 	return rel_prop(obj1, obj2); 
	Relation_ByHalfRoutine:	return (obj1 == rel_prop(obj2));
	Relation_ByMapNRoutine:	return (rel_prop(obj2, DirectionObject_0) == obj1);
	Relation_ByMapNERoutine:	return (rel_prop(obj2, DirectionObject_1) == obj1);
	Relation_ByMapNWRoutine:	return (rel_prop(obj2, DirectionObject_2) == obj1);
	Relation_ByMapSRoutine:	return (rel_prop(obj2, DirectionObject_3) == obj1);
	Relation_ByMapSERoutine:	return (rel_prop(obj2, DirectionObject_4) == obj1);
	Relation_ByMapSWRoutine:	return (rel_prop(obj2, DirectionObject_5) == obj1);
	Relation_ByMapERoutine:	return (rel_prop(obj2, DirectionObject_6) == obj1);
	Relation_ByMapWRoutine:	return (rel_prop(obj2, DirectionObject_7) == obj1);
	Relation_ByMapURoutine:	return (rel_prop(obj2, DirectionObject_8) == obj1);
	Relation_ByMapDRoutine:	return (rel_prop(obj2, DirectionObject_9) == obj1);
	Relation_ByMapIRoutine:	return (rel_prop(obj2, DirectionObject_10) == obj1);
	Relation_ByMapORoutine:	return (rel_prop(obj2, DirectionObject_11) == obj1);
	Relation_Implicit:		print "[Can't test relation #", rel_num, " between ", (the) obj1, " and ", (the) obj2, ".]^";
					rfalse;
	Relation_VtoV:		break;  ! implemented below
	Relation_Sym_VtoV:	break;  ! implemented below
	default:			rfalse; ! the switch should catch every kind of relation there is, but just in case, return false
	}
	! first ensure we aren't doing something like passing a Thing to a Person-to-Person relation (if so, just rfalse)
	if (~~(obj1 ofclass Object && obj2 ofclass Object)) rfalse;
	pr   = rel_prop-->VTOVS_LEFT_INDEX_PROP;
	pr2 = rel_prop-->VTOVS_RIGHT_INDEX_PROP;
	if (~~(obj1 provides pr || obj1 provides pr2)) rfalse;
	if (~~(obj2 provides pr || obj2 provides pr2)) rfalse;
	return Relation_TestVtoV(obj1, rel_prop, obj2, (rel_type == Relation_Sym_VtoV)); 
]; 

-).



[ Relation_SetTrue obj1 rel_num obj2 rel_type rel_prop x; 
	if (obj1 == nothing || obj2 == nothing) rfalse;
	x = rel_num*3; 
	rel_type = relation_metadata-->(x+1); 
	rel_prop = relation_metadata-->(x); 
	switch (rel_type) { 
	Relation_OtoO:		Relation_Now1to1(obj1, rel_prop, obj2); rtrue; 
	Relation_OtoV:		if (obj2 provides rel_prop) obj2.rel_prop = obj1; rtrue;
	Relation_VtoO:		if (obj2 provides rel_prop) obj2.rel_prop = obj1; rtrue; 
	Relation_Sym_OtoO:	Relation_NowSN1to1(obj1, rel_prop, obj2);   ! unset the old... 
					Relation_NowS1to1(obj1, rel_prop, obj2);    ! and set the new
					rtrue; 
	Relation_Equiv:		Relation_NowEquiv(obj1, rel_prop, obj2); rtrue; 
	Relation_ByRoutine: 	rfalse; ! can't set; how would this get by the Inform 7 compiler?
	Relation_ByHalfRoutine:
					switch (rel_type) {
					(+ the incorporation relation +):	MakePart(obj2, obj1); rtrue;
					(+ the wearing relation +):		WearObject(obj2, obj1); rtrue;
					default:					MoveObject(obj2, obj1); rtrue;
					}
	Relation_Implicit:		rfalse; ! can't set; how would this get by the Inform 7 compiler?
	Relation_VtoV:		break;  ! implemented below
	Relation_Sym_VtoV:	break;  ! implemented below
	Relation_ByMapNRoutine:	AssertMapConnection(obj1,  DirectionObject_0,  obj2); rtrue;
	Relation_ByMapNERoutine:	AssertMapConnection(obj1,  DirectionObject_1,  obj2); rtrue;
	Relation_ByMapNWRoutine:	AssertMapConnection(obj1,  DirectionObject_2,  obj2); rtrue;
	Relation_ByMapSRoutine:	AssertMapConnection(obj1,  DirectionObject_3,  obj2); rtrue;
	Relation_ByMapSERoutine:	AssertMapConnection(obj1,  DirectionObject_4,  obj2); rtrue;
	Relation_ByMapSWRoutine:	AssertMapConnection(obj1,  DirectionObject_5,  obj2); rtrue;
	Relation_ByMapERoutine:	AssertMapConnection(obj1,  DirectionObject_6,  obj2); rtrue;
	Relation_ByMapWRoutine:	AssertMapConnection(obj1,  DirectionObject_7,  obj2); rtrue;
	Relation_ByMapURoutine:	AssertMapConnection(obj1,  DirectionObject_8,  obj2); rtrue;
	Relation_ByMapDRoutine:	AssertMapConnection(obj1,  DirectionObject_9,  obj2); rtrue;
	Relation_ByMapIRoutine:	AssertMapConnection(obj1,  DirectionObject_10,  obj2); rtrue;
	Relation_ByMapORoutine:	AssertMapConnection(obj1,  DirectionObject_11,  obj2); rtrue;
	default:			rfalse;
	}
	if (rel_type == Relation_Sym_VtoV) Relation_NowNVtoV(obj1, rel_prop, obj2, true);  ! unset the old
	Relation_NowVtoV  (obj1, rel_prop, obj2, (rel_type == Relation_Sym_VtoV));  ! set the new
	rtrue;
]; 


[ Relation_SetFalse obj1 rel_num obj2 rel_type rel_prop x; 
	if (obj1 == nothing || obj2 == nothing) rfalse;
	x = rel_num*3; 
	rel_type = relation_metadata-->(x+1); 
	rel_prop = relation_metadata-->(x); 
	switch (rel_type) { 
	Relation_OtoO:		Relation_NowN1toV(obj1, rel_prop, obj2); rtrue; 
	Relation_OtoV:		Relation_NowN1toV(obj1, rel_prop, obj2); rtrue;
	Relation_VtoO:		if (obj2 provides rel_prop) obj2.rel_prop = nothing; rtrue; 
	Relation_Sym_OtoO:	Relation_NowSN1to1(obj1, rel_prop, obj2);   ! unset the old... 
					rtrue; 
	Relation_Equiv:		Relation_NowNEquiv(obj1, rel_prop, obj2); rtrue; 
	Relation_ByRoutine: 	rfalse; ! can't set; how would this get by the Inform 7 compiler?
	Relation_ByHalfRoutine:
					switch (rel_type) {
					(+ the incorporation relation +):	DetachPart(obj2, obj1); rtrue;
					default:					MoveObject(obj2, obj1); rtrue;
					}
	Relation_Implicit:		rfalse; ! can't set; how would this get by the Inform 7 compiler?
	Relation_VtoV:		Relation_NowNVtoV(obj1, rel_prop, obj2, false); rtrue;
	Relation_Sym_VtoV:	Relation_NowNVtoV(obj1, rel_prop, obj2, true ); rtrue;
	Relation_ByMapNRoutine:	AssertMapUnconnection(obj1,  DirectionObject_0,  obj2); rtrue;
	Relation_ByMapNERoutine:	AssertMapUnconnection(obj1,  DirectionObject_1,  obj2); rtrue;
	Relation_ByMapNWRoutine:	AssertMapUnconnection(obj1,  DirectionObject_2,  obj2); rtrue;
	Relation_ByMapSRoutine:	AssertMapUnconnection(obj1,  DirectionObject_3,  obj2); rtrue;
	Relation_ByMapSERoutine:	AssertMapUnconnection(obj1,  DirectionObject_4,  obj2); rtrue;
	Relation_ByMapSWRoutine:	AssertMapUnconnection(obj1,  DirectionObject_5,  obj2); rtrue;
	Relation_ByMapERoutine:	AssertMapUnconnection(obj1,  DirectionObject_6,  obj2); rtrue;
	Relation_ByMapWRoutine:	AssertMapUnconnection(obj1,  DirectionObject_7,  obj2); rtrue;
	Relation_ByMapURoutine:	AssertMapUnconnection(obj1,  DirectionObject_8,  obj2); rtrue;
	Relation_ByMapDRoutine:	AssertMapUnconnection(obj1,  DirectionObject_9,  obj2); rtrue;
	Relation_ByMapIRoutine:	AssertMapUnconnection(obj1,  DirectionObject_10,  obj2); rtrue;
	Relation_ByMapORoutine:	AssertMapUnconnection(obj1,  DirectionObject_11,  obj2); rtrue;
	default:			rfalse;
	}
	rfalse;
]; 






Passable Relations ends here.

---- DOCUMENTATION ----

Section: Grouping Some Relations Together

We can already pass "abstract-relations" to phrases.  This is typically used for pathfinding.
	*: let footprints be the number of steps via the acts-with relation from Jodie Foster to Kevin Bacon;

This extension provides us a "holds between" phrase that decides whether or not the abstract-relation is true for the two objects given it.  A variant, "holds between X and Y or vice-versa", will try X~Y and Y~X and return true if at least one of those was true.

The intended usage is to group and iterate through object-to-object relations involving feelings and knowledge.  The built-in physical object relations of Inform are also supported.  Relations to numbers and kinds of value are not supported.  

We accomplish our primary tasks like so:
	*: To decide whether (sponsor - a person) has a reason to help (supplicant - a person):
		let many reasons be { the love relation, the marriage relation, alliance relation, the owed-favor relation };
		repeat with a relationship running through many reasons begin;
			if a relationship holds between the sponsor and the supplicant, decide yes;
		end repeat;
		decide no.
	
	To decide what indexed text is reason for (sponsor - a person) to help (supplicant - a person):
		let many reasons be { the love relation, the marriage relation, alliance relation, the owed-favor relation };
		repeat with relationship running through many reasons begin;
			if the relationship holds between the sponsor and the supplicant, decide on the name of the relation relationship;
		end repeat;
		decide on "".
	
	To decide whether (R - an abstract-relation) is a favorite:
		let L be { the love relation, the friendship relation, alliance relation, marriage relation };
		decide on whether or not R is listed in L.


A phrase cannot decide on a relation, so we decide on the text of its name instead.  We also cannot put relations directly into tables:
	Table of Emotional Relationships
	relationship 
	an abstract-relation
	the love relation
	the alliance relation

But curiously, we can put them into lists, and then put the lists into tables:
	*: A relation group is a kind of value.  Some relation groups are defined by the table of relationships.
	
	Table of Relationships
	mood [a relation group]		articulate [a list of abstract-relations]
	puzzly				{ the incorporation relation, the containment relation }
	mushy				{ love relation, marriage relation }
	
	After looking:
		let vagueness be a random relation group;
		say "'I'm kinda in a [vagueness] mood.'";
		choose row with a mood of vagueness from the table of relationships;
		repeat with relationship running through the articulate entry begin;
			say "Are you in the mood for some [relationship]?";
		end repeat.


Another thing we cannot do is directly create a variable to hold a relation:
	let configurations be { the containment relation, friendship relation };
	let config be entry 2 of configurations;

We have to reference the relation indirectly, every time:
	*: let configurations be { the containment relation, friendship relation };
	if entry 2 of configurations holds between....

Our only way of putting a relation into a variable (other than converting it to a number with "as a number") is to pass it to a To phrase, or put a list of them in a repeat loop.


Section: The Printing a Relation Activity

Much like the printing a parser error activity, we can use this activity if we Say any relations:
	*: Rule for printing a relation when the relation to print is the friendship relation: say "friends".
	Rule for printing a relation when relation to print is containment relation: say "has".

In order to avoid using indexed text on the Z-machine (and save memory), this activity will print a number by default.  Glulx will print the name of relations correctly.


Section: Reference

Herein are the names of the standard relations.  [Calculated or conditional relations (see 13.12 "Relations which express conditions") are marked* with an asterick.  Such relations cannot be assigned to.]

Physical worldsim relations:
	containment relation, support relation, incorporation relation, carrying relation, holding relation, wearing relation, possession relation* ("to have" = carry or wear), enclosure relation*, adjacency relation, regional-containment relation

Sensory relations:
	visibility relation*, touchability relation*, concealment relation*

Doorway relations:
	leading-through relation, lock-fitting relation

Directional relations.  If changing the map connections is desired, using the standard Direction classes is highly recommended.  (Objects have better language support than relations anyway.)  See Chapter 3.1, "Map", in the Recipe Book.
	mapping-north relation,  mapping-northeast relation,  mapping-northwest relation, mapping-east relation, mapping-south relation,  mapping-southeast relation,  mapping-southwest relation,  mapping-west relation, mapping-up relation, mapping-down relation, mapping-inside relation, mapping-outside relation

Numerical relations are not supported by this extension:
	numerically-greater-than relation, numerically-less-than relation, numerically-greater-than-or-equal-to relation, numerically-less-than-or-equal-to relation


Section: Esoterica

We can ask for (but not change) three properties of a relation: "printed name", "kind", and "description".  Printed name is the one-word name, such as containment; it is this that the activity prints by default.  Description only exists for newly declared relations; it is the entire definition sentence.  The major kinds we are usually interested in are:  Relation_OtoO, Relation_OtoV, Relation_VtoO, Relation_VtoV, Relation_Sym_OtoO, Relation_Sym_VtoV, Relation_Equiv, Relation_ByRoutine and Relation_ByHalfRoutine.  The last two cannot be assigned to.  There are other types, but like Relation_Implicit, they are of little use to us.

Relations can be typecast to and from numbers with the "as a relation" and "as a number" phrases.  For example, the following will (in Glulx) list every relation in a work, no matter how obscure or esoteric:
	*: repeat with X running from 0 to the number of relations begin;
		say "[X]: '[X as a relation]' is a [the kind of relation X] relation ('[description of relation X]').";
	end repeat;




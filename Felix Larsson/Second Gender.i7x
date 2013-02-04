Version 1 of Second Gender by Felix Larsson begins here.

"Lets you give any person or thing any one or two (or none) of the genders male, female and/or neuter."

"based on original Inform 6 code by Fredrik Ramsberg"



Chapter - Changes in I6 Templates

Section - Get Secondary GNA of Object
[This code is adapted from Fredrik Ramsberg's Swedish translation of Inform 6.]

[GetSecondaryGNAofObject does just the same thing as GetGNAofObject only backwards; it tests what gender an object has in reverse order compared to GetGNAofObject.]
Include (- 
[ GetGNAOfObject obj case gender;
   if (obj hasnt animate) case = 6;

   if (obj has male) gender = male; 
   if (obj has neuter) gender = neuter; 
   if (obj has female) gender = female; 

   if (gender == 0) {
!       if (case == 0) 
!         gender = LanguageAnimateGender;
!       else 
         gender = LanguageInanimateGender;
   }

   if (gender == female) case = case + 1; 
   if (gender == neuter) case = case + 2; 
   if (obj has pluralname) case = case + 3;

   return case;

]; 

[ GetSecondaryGNAOfObject obj case gender;
   if (obj hasnt animate) case = 6;

   if (obj has female) gender = female; 
   if (obj has neuter) gender = neuter; 
   if (obj has male) gender = male; 

   if (gender == 0) {
!       if (case == 0) 
!         gender = LanguageAnimateGender;
!       else 
         gender = LanguageInanimateGender;
   }

   if (gender == female) case = case + 1; 
   if (gender == neuter) case = case + 2; 
   if (obj has pluralname) case = case + 3;

   return case;

]; 
-) instead of "Gender" in "Parser.i6t".


Section - Pronoun Handling
[This code is adapted from Fredrik Ramsberg's Swedish translation of Inform 6.]

[PronounNotice should consider GetSecondaryObject.]
Include (- 
[ SetPronoun dword value x;
    for (x=1 : x<=LanguagePronouns-->0 : x=x+3)
        if (LanguagePronouns-->x == dword) {
            LanguagePronouns-->(x+2) = value; return;
        }
    RunTimeError(14);
];

[ PronounValue dword x;
    for (x=1 : x<=LanguagePronouns-->0 : x=x+3)
        if (LanguagePronouns-->x == dword)
            return LanguagePronouns-->(x+2);
    return 0;
];

[ ResetVagueWords obj; PronounNotice(obj); ];

[ PronounNotice obj x bm;
   if (obj == player) return;

   bm = PowersOfTwo_TB-->(GetGNAOfObject(obj));
! §#§ Added one line, to allow for an object to have two genders
   bm = bm | (PowersOfTwo_TB-->(GetSecondaryGNAOfObject(obj)));

   for (x = 1 : x <= LanguagePronouns-->0: x = x+3)
       if (bm & (LanguagePronouns-->(x+1)) ~= 0)
           LanguagePronouns-->(x+2) = obj;
];

[ PronounNoticeHeldObjects x;
#IFNDEF MANUAL_PRONOUNS;
   objectloop(x in player) PronounNotice(x);
#ENDIF;
   x = 0; ! To prevent a "not used" error
   rfalse;
]; 
-) instead of "Pronoun Handling" in "Parser.i6t".


Section - Pronouns

[We see to it that "him" and "her" can be used of inanimate objects, too.]
Include (-

Array LanguagePronouns table 
! word possible GNAs connected 
! to follow: to: 
!        a     i 
!        s  p  s  p 
!        mfnmfnmfnmfn 
’it’   $$001000001000 NULL 
’her’  $$010000010000 NULL 
’him’  $$100000100000 NULL 
’them’ $$000111000111 NULL; 

-) instead of "Pronouns" in "Language.i6t".


Chapter - Changes in Standard Rules
	
Section - (in place of Section SR1/11 - People in Standard Rules by Graham Nelson)

The specification of person is "Despite the name, not necessarily a human being, but anything animate enough to envisage having a conversation with, or bartering with." 

[We don't want male and female to be exclusive options, and we want all genders to be avialable for inanimate objects as well.
(For some reason Inform protests unless we put these changes inside a section replacement.)]
A thing can be female. A thing is usually not female.
A thing can be male. A thing is usually not male.
A thing can be neuter. A thing is usually neuter. 
The male property translates into I6 as "male". 
[End of changes.]

A person has a number called carrying capacity.
The carrying capacity of a person is usually 100. 

Include (- 
    has transparent animate 
    with before NULL, 
-) when defining a person.

The yourself is an undescribed person. The yourself is proper-named. 

The description of yourself is usually "As good-looking as ever." 

The yourself object translates into I6 as "selfobj". 
Include (- 
    with saved_short_name "yourself", 
-) when defining yourself. 


Section - (in place of Section SR1/12 - Animals, men and women in Standard Rules by Graham Nelson)

The plural of man is men. The plural of woman is women. 

A man is a kind of person. 
The specification of man is "Represents a man or boy." 
A man is always male. A man is usually not neuter. 

A woman is a kind of person. 
The specification of woman is "Represents a woman or girl." 
A woman is always female. A woman is usually not neuter. 

An animal is a kind of person. 
The specification of animal is "Represents an animal, or at any rate a non-human living creature reasonably large and possible to interact with: a giant Venus fly-trap might qualify, but not a patch of lichen." 


Second Gender ends here.



---- Documentation ----


Including the present extension allows things of every kind (not merely persons) to be neuter, female and/or male.

Any combinations of any two of these genders are possible, as are single-gendered and even (in a sense) non-gendered things.

Giving a thing two genders means that the player will be able to refer to that thing with two distinct pronouns (e.g. calling a ship both "it" and "her", calling a dog both "it" and "him", calling Hermaphroditus both "him" and "her")

You can technically give a single thing all three genders, but then the player will only be able to refer to that thing with the pronouns "her" and "him" (not with "it").

N.B.! A thing without any gender property set at all will still be referable to as "it".

All things except men and women are neuter by default. Persons, too, are neuter by default (as long as they are not declared men or women).

Men are always male; women are always female. 

(A thing or person that is declared to be both male or female will be secretly neuter: it won't react to the pronoun "it", but it can still be tested for its neuter gender.)

You set genders the ordinary way:
	Hermaphroditus is a person in the Woods of Caria. Hermaphroditus is male. Hermaphroditus is female.

The above lines makes Hermaphroditus both male and female (but neither man, woman, or animal).

Compare this with the line below:
	Hermaphroditus is a female man in the Woods of Caria. 

That line makes Hermaphroditus both male and female but also makes him a man rather than a woman.

Animals are neuter by default, so we dont have to say that explicitly:
	Felix the Cat is a male animal.

The above line will make Felix the Cat both male and neuter.

The same goes for things:
	The Black Pearl is a female vehicle in the Docks of Tortuga.

That makes the Black Pearl both female and neuter.

To create a thing or a person without a gender, tell inform that it is not neuter:
	The omniscient narrator is a person. The omniscient narrator is not neuter.

As remarked above a genderless thing will still answer to the pronoun "it", however.



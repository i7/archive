Version 3/080914 of the Weather by Ish McGravin begins here.

"Simulates a changing date, day/night cycle, randomized pseudo-weather, and semi-accurate moon phase. Read the documentation carefully."

[variables!]
Year, Month, Day, DTemp, NTemp, Weather, LunD, LunG, MoonN are number variables.
WDesc, MoonP are text variables.

[defaults!]
Time of day is 12:01 AM.
Year is 1900.
Month is 2.
Day is 1.
MoonP is "The new moon is dark and leaves the land in shadow.".
MoonN is 0.

[fancy table!]
[as per documentation, these numbers are based on the population center of the United States]
[note that month 1 is December instead of month 12, and other months are one greater]

Table of Months
Name		Days	Sunrise		Sunset		Av Temp
"December"	31	8:15 AM		5:59 PM		33
"January"	31	8:22 AM		6:11 PM		29
"February"	28	7:57 AM		6:46 PM		34
"March"		31	7:19 AM		7:14 PM		44
"April"		30	6:32 AM		7:43 PM		55
"May"		31	5:57 AM		8:10 PM		64
"June"		30	5:44 AM		8:31 PM		73
"July"		31	5:56 AM		8:29 PM		78
"August"	31	6:22 AM		8:00 PM		77
"September"	30	6:49 AM		7:15 PM		67
"October"	31	7:15 AM		6:30 PM		56
"November"	30	7:47 AM		5:55 PM		45

[set up a few basics when the game starts]
When play begins:
  change DTemp to Av Temp in row Month of Table of Months + a random number from -7 to 7;
  change NTemp to DTemp - 7 + a random number from -3 to 2;
  change Weather to a random number from 1 to 10;
  if Weather is less than 4 begin;
    change WDesc to "sunny";
  otherwise if Weather is less than 6;
    change WDesc to "partly cloudy";
  otherwise if Weather is less than 9;
    change WDesc to "cloudy";
  otherwise;
    if DTemp is less than 33 begin;
      change WDesc to "snowing";
    otherwise;
      change WDesc to "raining";
    end if;
  end if;

[conditionals]
[nighttime - an often-used one]
To decide whether it is night:
  if the time of day is before Sunrise in row Month of Table of Months then decide yes;
  if the time of day is after Sunset in row Month of Table of Months then decide yes;
  decide no.

[snow is on the ground if the temperature is below 33; this could be made much more robust]
To decide whether snow is on the ground:
  if it is night begin;
    if NTemp is less than 33 then decide yes;
  otherwise if Dtemp is less than 33;
	decide yes;
  end if;
  decide no.

[the four seasons]
To decide whether it is winter: if month is less than 4 then decide yes; decide no.
To decide whether it is spring: if month is less than 4 then decide no; if month is greater than 6 then decide no; decide yes.
To decide whether it is summer: if month is less than 7 then decide no; if month is greater than 9 then decide no; decide yes;
To decide whether it is fall: if month is greater than 9 then decide yes; decide no.

[every turn recalculations]
Every turn:
    [daily recalculations]
  if time of day is 12:00 AM begin;
    change Day to Day + 1;
      [day temperature is the average monthly temp +- 7 degrees]
    change DTemp to Av Temp in row Month of Table of Months + a random number from -7 to 7;
      [night temperature is modified from day temperature]
    change NTemp to DTemp - 7 + a random number from -3 to 2;
    if Day is greater than Days in row Month of Table of Months begin;
      change Month to Month + 1;
      change Day to 1;
    end if;
    if Month is 1 begin;
      if Day is 1 then change Year to Year + 1;
    end if;
    if Month is greater than 12, change Month to 1;
      [the moon phase calculator - complex, so be careful with it!]
    change LunD to Day;
    if Month is 1 begin;
      change LunD to LunD + 334;
    otherwise;
      repeat with X running from 2 to Month - 1 begin;
        change LunD to LunD + Days in row X of Table of Months;
      end repeat;
    end if;
    change LunG to Year - 1900;
    change LunG to remainder after dividing LunG by 19;
    change LunG to 11 * LunG + 29;
    change LunG to remainder after dividing LunG by 30;
    if LunG is 24 then change LunG to LunG + 1;
    if LunG is 25 then change LunG to LunG + 1;
    change MoonN to LunG + LunD;
    change MoonN to MoonN * 6 + 5;
    change MoonN to remainder after dividing MoonN by 177;
    change MoonN to MoonN / 22;
    if MoonN is 8 then change MoonN to 0;
      [end of the moon phase calculator]
    if MoonN is 0 begin;
      change MoonP to "The new moon is dark and leaves the land in shadow.";
    otherwise if MoonN is 1;
      change MoonP to "The crescent moon casts a dim glow.";
    otherwise if MoonN is 2;
      change MoonP to "The first quarter moon smiles down on the land.";
    otherwise if MoonN is 3;
      change MoonP to "The waxing gibbous moon brightens the sky.";
    otherwise if MoonN is 4;
      change MoonP to "The full moon is almost dazzlingly bright and lights up the land.";
    otherwise if MoonN is 5;
      change MoonP to "The waning gibbous moon brightens the sky.";
    otherwise if MoonN is 6;
      change MoonP to "The last quarter moon creates eerie shadows on the land.";
    otherwise;
      change MoonP to "The crescent moon casts a dim glow.";
    end if;
  end if;
    [every hour recalculations]
  if the minutes part of the time of day is 00 begin;
      [modify the weather value by probability: -2,-1,-1,0,0,0,+1,+1,+2 ]
    change Weather to Weather + a random number between -1 and 1 + a random number between -1 and 1;
      [make sure weather value is within the range 1 to 10 inclusive]
    if Weather is greater than 10 then change Weather to 10;
    if Weather is less than 1 then change Weather to 1;
      [describe the weather]
    if Weather is less than 4 begin;
      if it is night begin;
        change WDesc to "starry";
      otherwise;
        change WDesc to "sunny";
      end if;
    otherwise if Weather is less than 6;
      change WDesc to "partly cloudy";
    otherwise if Weather is less than 9;
      change WDesc to "cloudy";
    otherwise;
      if it is night begin;
        if NTemp is less than 33 begin;
          change WDesc to "snowing";
        otherwise if DTemp is less than 33;
          change WDesc to "snowing";
        end if;
      otherwise;
        change WDesc to "raining";
      end if;
    end if;
  end if.

Weather ends here.

---- DOCUMENTATION ----

This extension is intended to model a number of natural systems with a modicum of accuracy where I could manage. The four parts are fairly interwoven and are all based on the Table of Months.

The date model moves the day number forward at midnight, resets the day to 1 and moves the month forward at the end of the month, and resets the month to 1 and moves the year forward at the end of the year.

The day/night cycle model simply determines if it is night based upon average sunrise and sunset times calculated for each month.

The weather model operates on a randomly generated weather value between 1 and 10, and on a randomly modified temperature based on the average temperature for each month. The weather value generates a description of current conditions, with 1 through 3 being "sunny", 4 and 5 being "partly cloudy", 6 through 8 being "cloudy", and 9 and 10 being precipitation. Precipitation is decided to be either "raining" or "snowing" depending on the temperature.

The moon phase model calculates the current moon phase (new, full, and the stages in between) based upon running the current game date through a complicated algorithm.

I'm ALWAYS looking for ways to improve this extension. If you find any bugs or typos, or if you have a suggestion, please contact me at McGravin (at) Gmail (dot) com.

::: Usage :::

- "Year", "Month", "Day" variables give the date. See "precautions" for a note on the month variable.

- "Name in row Month of Table of Months" will give the name of the current month.

- "Weather" variable gives the weather value between 1 and 10 as described above.

- "DTemp" and "NTemp" give the daytime temperature and nighttime temperature, respectively. Temperatures are in Fahrenheit.

- "MoonN" variable gives the moon phase as a number between 0 and 7, with 0 being new, 4 being full, and other numbers representing intermediate phases.

- "WDesc" and "MoonP" text variables give the description of the weather and moon phase, respectively.

- Several fairly self-explanatory conditionals you can use in if statements: "if it is night", "if it is winter", "if it is spring", "if it is summer", "if it is fall", and "if there is snow on the ground".

::: Defaults :::

- The default time and date are 12:01 AM, January 1, 1900.

- The default moon phase is a new moon, which should be the phase on the default date. If you use a new date, it is a good idea to run through the moon phase algorithm once with your game's start date and include the new moon phase variables MoonN and MoonP with your resultant phase.

- The default sunrise, sunset, and average temperatures are for Rolla, MO, which is the population center of the United States. It should therefore hopefully approximate the numbers for an average number of Inform users, or else for the setting of our game. For consistency, the times are also based on Daylight Savings Time for the entire year (rather than only for the months during which DST is used).

- The sunrise, sunset, and average temperatures are for the middle of each month (the 15th) rather than modified for each day.


::: Limitations :::

- The date simulator does not currently take into account the extra day in February during leap years, which is a simple improvement I intend to make in the future.

- The moon phase simulator is currently slightly inacurrate and limitted to the range of years from 1900 to 2100 inclusive. If a future version of Inform 7 ever allows for decimal numbers, a more accurate algorithm can be implemented.

- Wind and wind speed are not simulated currently.

- Moonrise and moonset are not currently simulated, so the moon is always up when it is night.

- If the default sunrise and sunset times are replaced and the new sunrise is after or the new sunset is before 12:00AM for any month or months (ie, in far northern latitudes), special consideration will have to be made in the "To decide whether it is night" definition.

- Sunrise and sunset times are approximated as a monthly average based on the middle of the month. If a simple enough algorithm can be found, times will be calculated daily.

- Twilight times are not currently included, but may be in a future version.

- "snow is on the ground" is true always if the temperature is below 33 degrees, regardless of any recent precipitation.


::: Precautions :::

- Avoid using "increase Time of Day by <x number of minutes or hours>". It is possible to accidentally skip the hourly weather changes and daily date changes. Instead use "repeat with X running from 1 to <a number of minutes> begin; follow the turn sequence rules; end repeat". This method will artificially inflate the player's turn count, but will avoid the possibility of accidentally skipping the "At 12:00 AM" check and making the game remain on the same date.

- "Month" is funky and needs to be used carefully. In most cases, you'll want the name of the month which is easily determined (see "usage"). Otherwise, keep in mind that month 1 is December and months 2 through 12 are January through November.


::: Suggestions :::

- Assuming we have a region called "the outdoors" which includes all the rooms from which we want the player to be able to see the sky and celestial objects, I recommend adding the following snippet to the game:

	The sky is a backdrop in the outdoors. The description is "It is [if it is night]dark[otherwise]bright[end if] and [WDesc]."
	The stars are a backdrop. The description is "The stars shine brightly, like jewels in the night sky."
	The sun is a backdrop. The description is "[if Weather is less than 4]You are momentarily blinded by the shining sun.[otherwise]The sun shines through the clouds.[end if]".
	The moon is a backdrop. The description is "[MoonP]".
	The clouds are a backdrop. The description is "[if Weather is less than 6]The clouds are scattered in the sky[otherwise]The clouds cover the sky[end if][if it is night]. The stars are obscured.[otherwise], and that one looks like a bunny. The sky is obscured.[end if]".

	Every turn:
		if it is night begin;
			if Weather is less than 4 begin;
				if the stars are off-stage then move the stars to the outdoors;
				if the sun is on-stage then remove the sun from play;
				if the moon is on-stage then remove the moon from play;
				if the clouds are on-stage then remove the clouds from play;
			otherwise if Weather is less than 6;
				if the stars are on-stage then remove the stars from play;
				if the sun is on-stage then remove the sun from play;
				if the moon is off-stage then move the moon to the outdoors;
				if the clouds are off-stage then move the clouds to the outdoors;
			otherwise;
				if the stars are on-stage then remove the stars from play;
				if the sun is on-stage then remove the sun from play;
				if the moon is on-stage then remove the moon from play;
				if the clouds are off-stage then move the clouds to the outdoors;
			end if;
		otherwise;
			if Weather is less than 4 begin;
				if the stars are on-stage then remove the stars from play;
				if the sun is off-stage then move the sun to the outdoors;
				if the moon is on-stage then remove the moon from play;
				if the clouds are on-stage then remove the clouds from play;
			otherwise if Weather is less than 6;
				if the stars are on-stage then remove the stars from play;
				if the sun is off-stage then move the sun to the outdoors;
				if the moon is on-stage then remove the moon from play;
				if the clouds are off-stage then move the clouds to the outdoors;
			otherwise;
				if the stars are on-stage then remove the stars from play;
				if the sun is on-stage then remove the sun from play;
				if the moon is on-stage then remove the moon from play;
				if the clouds are off-stage then move the clouds to the outdoors;
			end if;
		end if.

Example: ** The Weather Observation Station - A fairly simple implementation of several of the weather simulation utilities. The example has only two rooms, but room descriptions change depending on time of day and weather conditions. A "wait [number] minutes"  command is included to facilitate date testing.

	"Weather Station Zero"

	Include Weather by Ish McGravin.

	When play begins: change the command prompt to "[time of day] ([if it is night]nighttime[otherwise]daytime[end if] and [WDesc]) - [Name in row Month of Table of Months] [day], [year] - [if it is night][NTemp][otherwise][DTemp][end if]F > ".

	When play begins:
		now the year is 2007;
		now the day is 7;
		now the month is 4;
		now the time of day is 6:00 PM.

	Waiting for is an action applying to one number. Understand "wait [number] minutes" as waiting for. Carry out waiting for: repeat with X running from 1 to the number understood begin; follow the turn sequence rules; end repeat.

	Outdoors, indoors are regions.

	The sun is a backdrop in the outdoors. The description is "[if it is night]The sun is down, silly. It is night time![otherwise if weather is greater than 5]The sun is hidden behind a solid wall of clouds.[otherwise if weather is greater than 3]The sun occasionally peeks out from behind one of the many scattered clouds.[otherwise if DTemp is less than 61]The sun shines brightly down, warming your face.[otherwise]The sun shines brightly down, making you sweat a little.[end if]".

	Observation Point is a room. It is in the outdoors. The description is "The sky is [if weather is greater than 3]filled with clouds [otherwise]clear [end if]and [if it is night]dark[otherwise]light[end if]. [if it is night][otherwise]The sun is out. [end if][if snow is on the ground]A blanket of snow covers the ground. [end if]It takes about an hour to walk back to the weather observation station to the [bold type]west[roman type].".

	Before going west from Observation Point: repeat with X running from 1 to 59 begin; follow the turn sequence rules; end repeat; continue the action. Before going east to Observation Point: repeat with X running from 1 to 59 begin; follow the turn sequence rules; end repeat; continue the action.

	Weather Station is west of Observation Point. It is a room in the indoors. It has printed name "Inside the Weather Station". The description is "A readout shows the outside temperature as [if it is night][NTemp][otherwise][DTemp][end if]F. One of the meteorologists has noted that the weather conditions and temperature change once an hour. You can [quotation mark]wait X minutes[quotation mark] until the weather shifts. We encourage you to go outside and [quotation mark]examine the sun[quotation mark]. It takes about an hour to walk to the observation point to the [bold type]east[roman type].".
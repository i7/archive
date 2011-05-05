Version 2 of Multiple Sounds by Massimo Stella begins here.

"Provides facilities for the basic reproduction of multiple-channel audio with loops under Glulx."

Use authorial modesty.

[The idea for this extension was born from some code written by Eliak Blauk on rec.arts.int-fiction in 2008. Thanks to Sarganar for his bug report.]

Section - IF6 Code

Include (-
[ SoundReproduce sound chan loop;
if (glk_gestalt(gestalt_Sound,0) && glk_gestalt(gestalt_SoundMusic,0))  { 
	glk_schannel_play_ext(chan,sound,loop,0); 
	}
else { 
	"Your interpreter doesn't support sound reproduction."; 
	}
];

[ VolumeControl chan val;
if (glk_gestalt(gestalt_SoundVolume,0)) {
	if ((val <= 5) && (val >=0)) {
		glk_schannel_set_volume(chan, val * 16384);
		}
	else {
		"Invalid Volume Level: please insert a value between 0 and 5.";
		}
	}
else {
	"Your interpreter doesn't support volume control."; 
	}
];

[ SoundStop chan;
if (glk_gestalt(gestalt_Sound,0) && glk_gestalt(gestalt_SoundMusic,0))  { 
	glk_schannel_stop(chan);  
	}
else { 
	"Your interpreter doesn't support sound stopping."; 
	}
]; -).

Section - Declaring Commands

To play (SND - a sound name) in foreground:
(- SoundReproduce(ResourceIDsOfSounds-->{SND},gg_foregroundchan,1); -)

To play (SND - a sound name) in background:
(- SoundReproduce(ResourceIDsOfSounds-->{SND},gg_backgroundchan,1); -)

To play (SND - a sound name) in foreground with loop:
(- SoundReproduce(ResourceIDsOfSounds-->{SND},gg_foregroundchan,-1); -)

To play (SND - a sound name) in background with loop:
(- SoundReproduce(ResourceIDsOfSounds-->{SND},gg_backgroundchan,-1); -)

To play (SND - a sound name) in foreground for (loop - a number) times:
(- SoundReproduce(ResourceIDsOfSounds-->{SND},gg_foregroundchan,{loop}); -)

To play (SND - a sound name) in background for (loop - a number) times:
(- SoundReproduce(ResourceIDsOfSounds-->{SND},gg_backgroundchan,{loop}); -)

To set the foreground volume to (VOL - a number):
(- VolumeControl(gg_foregroundchan,{VOL}); -)

To set the background volume to (VOL - a number):
(- VolumeControl(gg_backgroundchan,{VOL}); -)

To stop the foreground sound:
(- SoundStop(gg_foregroundchan); -)

To stop the background sound:
(- SoundStop(gg_backgroundchan); -)

Multiple Sounds ends here.

---- DOCUMENTATION ---- 

This extention allows the reproduction of two audio layers at once under the Glulx envinronment. It implements only a few features regarding the audio files management (such as loops, double channel reproduction, volume control and sound stops) and it will become obsolete when Damusix by Eliuk Blau will eventually be released for Inform 7. 

After having declared the name of an audio file, like indicated in the IF7 main documentation:

	Sound of frogs is the file "Frogs.ogg". 

We can choose how to reproduce it, on the background channel or on the foreground one:

	play the sound of frogs in background;
	play the sound of frogs in foreground;

Sometimes a continuous loop might be useful:

	play the sound of frogs in background with loop;
	play the sound of frogs in foreground with loop;

Also the repetition of a specific audio file for N times is supported:

	play the sound of frogs in background for 5 times;
	play the sound of sea in foreground for 10 times;
	
Glulx allows to play multiple sounds at the same time, provided they are reproduced on different channels:

	play the sound of frogs in background;
	play the sound of birds in foreground;

To stop an audio file:

	stop the foreground sound;
	stop the background sound;

To modify volume from a minimum level of 0 (silence) to a maximum level of 5 (full volume):

	set the foreground volume to 2;
	set the background volume to 1;
	
Example: * Rainforest - Shows how to use multiple sounds effects to mimic a natural environment.

	*:	"Rainforest"
	
	Include Multiple Sounds by Massimo Stella.
	
	The Swamp is a room. The description is "A beautiful mirror of water is in front of your eyes while behind you there are the tallest trees you've ever seen. You can hear the sound of some frogs in the distance."
	
	Sound of frogs is the file "Frogs.ogg". 
	Sound of water is the file "Water.ogg".
	
	When play begins:
		set the background volume to 2;
		play the sound of frogs in background;
		set the foreground volume to 3;
		play the sound of water in foreground with loop.
	
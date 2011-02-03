Version 1/061104 of Helpers for GBA Frotz by S John Ross begins here.
"This extension adds ease-of-use features specific to Jonas Minnberg's port of Frotz to the GameBoy Advance."

Requesting the GBAFrotz Dictionaries is an action out of world. Understand "Dic" or "Dictionary" or "Dictionaries" as Requesting the GBAFrotz Dictionaries.
 Carry out Requesting the GBAFrotz Dictionaries:
   say "[bold type]Dictionary 0 (L+(Direct., A, B))[roman type] 'in' 'north' 'up' 'west' 'east' 'out' 'south' 'down' 'restore' 'save'[line break]";
   say "[bold type]Dictionary 1 (R+(Direct., A, B))[roman type] 'open' 'get' 'close' 'inventory' 'look' 'open' 'drop' 'read' 'examine' 'enter'[line break]";
   say "[bold type]Dictionary 2 (A+(Direct.))[roman type] 'climb' 'eat' 'attack ' 'move' 'unlock' 'push' 'jump' 'pull'[line break]";
   say "[bold type]Dictionary 3 (B+(Direct.))[roman type] 'load' 'score' 'save' 'wait' 'again' 'help' 'talk to' 'exit'";
   say "[line break][bold type](L+R)[roman type] looses the cursor, letting you 'grab' words from the game to the prompt. Press A to grab a word and finish; press B to grab a word with intent to grab more. Press L+R again to cancel. Type [bold type]GGG[roman type] or [bold type]northsouth[roman type] for a block of 'grabbable' terms.".

Requesting a GBAFrotz Grabmode Helper is an action out of world. Understand "ggg" or "northsouth" as Requesting a GBAFrotz Grabmode Helper.
 Carry out Requesting a GBAFrotz Grabmode Helper:
  say "climb up down NE SE SW NW examine the get all him her it open close lock unlock inventory read look in on under drop eat attack push pull jump wait talk to ask about answer say help hint enter exit save quit"

Helpers for GBA Frotz by S John Ross ends here.

---- DOCUMENTATION ---- 

Jonas Minnberg's port of Frotz to the GameBoy Advance struggles (with some admirable success) over the unusual hurdles of Interactive Fiction on a computer with no keyboard. This extension provides some additional assistance in the form of two added features:

1. Dictionary Summaries

The player can call up a summary of the standard key-binding dictionaries with the DIC command. The commands DICTIONARY and DICTIONARIES are equivalent. These dictionaries are explained more fully in the port’s own documentation. This feature provides an in-game alternative to keeping a hardcopy list of the many key combinations.

2. Grabmode Helper

The commands GGG and "northsouth" (nonsense commands chosen because they're some of the easiest things to enter using GBA Frotz), summon a comparably nonsensical block of useful common text-parser terms, to be "harvested" by the player using the interpreter’s grabmode.
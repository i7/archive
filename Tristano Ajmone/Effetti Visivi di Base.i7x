Effetti Visivi di Base by Tristano Ajmone begins here.
[Traduzione della Version 5 of Basic Screen Effects by Emily Short]

"Premere per un tasto qualsiasi; pulire lo schermo. Fornisce inoltre opzioni utili per cambiare il colore del testo o evidanziarlo, quando si usa la z-machine. Tali opzioni non avranno alcun effetto sotto Glulx."

"based on Basic Screen Effects by Emily Short" 

Use authorial modesty.

Section 1 - Spacing and Pausing

Include (-

[ KeyPause i; 
	i = VM_KeyChar(); 
	rfalse;
];

[ SPACEPause i;
	while (i ~= 13 or 31 or 32)
	{
		i = VM_KeyChar();	
	}
];

[ GetKey i;
	i = VM_KeyChar(); 
	return i;
];

-)

To clear the/-- screen:
	(- VM_ClearScreen(0); -)

To clear only the/-- main screen:
	(- VM_ClearScreen(2); -)

To clear only the/-- status line:
	(- VM_ClearScreen(1); -).

To wait for any key:
	(- KeyPause(); -)

To wait for the/-- SPACE key:
	(- SPACEPause(); -)

To decide what number is the chosen letter:
	(- GetKey() -)

To pause the/-- game: 
	say "[paragraph break]Per piacere premi la BARRA SPAZIATRICE per continuare.";
	wait for the SPACE key;
	clear the screen.

To center (quote - text-routine):
	(- CenterPrintComplex({quote}); -);

To center (quote - text):
	(- CenterPrintComplex({quote}); -);
 
To center (quote - text-routine) at the/-- row (depth - a number):
	(- CenterPrint({quote}, {depth}); -);

To center (quote - text) at the/-- row (depth - a number):
	(- CenterPrint({quote}, {depth}); -);
	
To stop the/-- game abruptly:
	(- quit; -)
	
To show the/-- current quotation:
	(- ClearBoxedText(); -);


Include (-

#ifndef printed_text;
Array printed_text --> 64;
#endif;

[ CenterPrint str depth i j;
	font off;
	i = VM_ScreenWidth();
			VM_PrintToBuffer(printed_text, 63, str);
	j = (i-(printed_text-->0))/2; 
	j = j-1;
	VM_MoveCursorInStatusLine(depth, j);
	print (I7_string) str; 
	font on;
];

[ CenterPrintComplex str i j;
	font off;
	print "^"; 
	i = VM_ScreenWidth();
			VM_PrintToBuffer(printed_text, 63, str);
	j = (i-(printed_text-->0))/2; 
	spaces j-1;
	print (I7_string) str; 
	font on;
];

-)

To decide what number is screen width:
	(- VM_ScreenWidth() -);

To decide what number is screen height:
	(- I7ScreenHeight() -);

Include (-

[ I7ScreenHeight i screen_height;
	i = 0->32;
		  if (screen_height == 0 or 255) screen_height = 18;
		  screen_height = screen_height - 7;
	return screen_height;
];

-)

To deepen the/-- status line to (depth - a number) rows:
	(- DeepStatus({depth}); -);

To move the/-- cursor to (depth - a number):
	(- I7VM_MoveCursorInStatusLine({depth}); -)

To right align the/-- cursor to (depth - a number):
	(- RightAlign({depth}); -)

Include (- 

[ DeepStatus depth i screen_width;
	VM_StatusLineHeight(depth);
	screen_width = VM_ScreenWidth(); style reverse;
			#ifdef TARGET_GLULX;
			  VM_ClearScreen(1);
			#ifnot;
	  for (i=1:i<depth+1:i++)
			  {
	 	@set_cursor i 1;
	 	spaces(screen_width);
	  } 
		   #endif;
];

[ I7VM_MoveCursorInStatusLine depth;
	VM_MoveCursorInStatusLine(depth, 1);
];

[ RightAlign depth screen_width o n;
	screen_width = VM_ScreenWidth(); 
	n = (+ right alignment depth +);
	o = screen_width - n;
	VM_MoveCursorInStatusLine(depth, o);
];

-)

Table of Ordinary Status
left	central	right
"[location]"	""	"[score]/[turn count]" 

Status bar table is a table-name that varies. Status bar table is the Table of Ordinary Status.

To fill status bar with (selected table - a table-name):
	let __n be the number of rows in the selected table;
	deepen status line to __n rows;
	let __index be 1;
	repeat through selected table
	begin;
		move cursor to __index; 
		say "[left entry]";
		center central entry at row __index;
		right align cursor to __index;
		say "[right entry]";
		change __index to __index + 1;
	end repeat.

Right alignment depth is a number that varies. Right alignment depth is 14.

Section 2 - Colors (for Z-machine only)

To say default letters:
	(- @set_colour 1 1; -)

To say red letters:
	(- @set_colour 3 0; -)

To say green letters:
	(- @set_colour 4 0; -)

To say yellow letters:
	(- @set_colour 5 0; -)

To say blue letters:
	(- @set_colour 6 0; -)

To say magenta letters:
	(- @set_colour 7 0; -)

To say cyan letters:
	(- @set_colour 8 0; -)

To say white letters:
	(- @set_colour 9 0; -)

To say black letters:
	(- @set_colour 2 0; -)

To turn the/-- background black:
	(- @set_colour 0 2; -);

To turn the/-- background red:
	(- @set_colour 0 3; -);

To turn the/-- background green:
	(- @set_colour 0 4; -);

To turn the/-- background yellow:
	(- @set_colour 0 5; -);

To turn the/-- background blue:
	(- @set_colour 0 6; -);

To turn the/-- background magenta:
	(- @set_colour 0 7; -);

To turn the/-- background cyan:
	(- @set_colour 0 8; -);

To turn the/-- background white:
	(- @set_colour 0 9; -);

Effetti Visivi di Base ends here.

---- DOCUMENTATION ----

Effetti Visivi di Base implementa i seguenti effetti: pausa del gioco finche' il giocatore non preme un tasto; pulizia dello schermo; cambiare il colore del font; cambiare il colore dello sfondo. I cambiamenti del colore funzionano solo con la Z-machine.

Questa estensione e' la traduzione in italiano della Version 5 of Basic Screen Effects by Emily Short, a cura di Massimo Stella. La documentazione e' stata tradotta da Tristano Ajmone.

Chapter: Pause, pulizia schermo, e posizionamento speciale del testo

Section: Pulire lo schermo

L'estensione definisce le seguenti frasi:

Per pulire interamente lo schermo da tutti contenuti, inclusa la status line,

	clear the screen.

Per pulire solamente una specifica sezione dello schermo:

	clear only the main screen.
	clear only the status line.
	
Section: Attendere la pressione di un tasto; terminare immediatamente il gioco

Per mettere il gioco in pausa fino a quando il giocatore preme un tasto qualsiasi:

	wait for any key.

Per mettere il gioco in pausa fino a quando il giocatore preme la BARRA SPAZIATRICE, ignorando qualsiasi altro tasto:

	wait for the SPACE key.

Per inviare al giocatore un messaggio che dica di premere la barra spaziatrice per continuare, attendere che la prema, e infine pulire lo schermo prima di proseguire l'azione:

	pause the game.

In casi estremi potremmo voler terminare il gioco senza consentire al giocatore la possibilita' di scegliere se ricomniciare, caricare una partita salvata o uscire:

	stop game abruptly.
	
Section: Mostrare l'attuale citazione

"Show the current quotation" mostrera' il testo che l'autore ha impostato con "display the boxed quotation...". Normalmente, le boxed quotations (citazioni incorniciate) vengono visualizzate quando viene stampato il prompt, tramite show the current quotation e' invece possibile mostrare una citazione incorniciata in altri momenti. Per ottenere uno splash-screen prima che inizi il gioco vero e proprio, potremmo utilizzare qualcosa del genere:

	When play begins:
		display the boxed quotation 
		"Che stanza e' questa? Mi sono dimenticato la bussola.
		Be', questa sara' la stanza a sud-sud-ovest del salotto.
		-- Philadelphia Story";
		show the current quotation;
		pause the game.
		
Section: Centrare il testo nello schermo

Possiamo anche mostrare una frase che sia centrata nello schermo ma senza la colorazione dello sfondo delle boxed quotation, cosi':

	center "Il Mercante di Venezia";

Con la centratura il testo viene messo in una nuova riga indipendente -- come ha senso che avvenga. Il testo centrato sara' sempre visualizzato con un font a larghezza fissa; ed effetti di stile come il grassetto e il corsivo non funzioneranno. (L'implementazione di questi stili comprometterebbe la centratura del testo poiche' il sistema per la gestione dello schermo non e' abbastanza sofisticato da gestire la centratura di caratteri che non siano a larghezza fissa.)

In caso avessimo bisogno di fare dei calcoli relativi alla gestione dello schermo, la larghezza dello schermo puo' essere verificata in qualsiasi momento:

	if the screen width is less than 75, say "La mappa non sara' visualizzata correttamente finche' non allarghi la finestra." instead.

Section: Personalizzare la status line

Possiamo anche sfruttare una variante del comando center per posizionare il testo nella status line. Per realizzare una status line stile Trinity, con la locazione centrata:

	Rule for constructing the status line:
		center "[location]" at row 1;
		rule succeeds.

Per ottenere una status line con piu' di una riga, possiamo creare una tabella che rappresenti l'apparenza complessiva della status line desiderata e poi impostarla come la nostra tabella di status line. L'esempio che segue crea una status line di due righe, cotenente informazioni di vario tipo. (Per una dimostrazione piu' pratica, che include una rosa-dei-venti su tre righe, si veda l'esempio al fondo.)
 
	Table of Fancy Status
	left	central	right 
	" [location]"	"[time of day]"	"[score]"
	" [hair color of the suspect]"	"[eye color of the suspect]"	"[cash]"

	Rule for constructing the status line:
		fill status bar with Table of Fancy Status;
		rule succeeds.
 
Una tabella per la status line deve sempre avere la colonna di sinistra, quella centrale, e quella di destra, e dobbiamo anche fornire la regola per la costruzione della status line. Altrimenti, Inform usera' il comportamento standard della status line. La posizione della colonna destra e' fissata per default a 14 spazi dal bordo (in accordo con la status line default di Inform), ma e' possibile cambiarla alterando il valore della variabile chiamata right alignment depth; quindi potremmo per esempio scrivere

	When play begins: now right alignment depth is 30.

allo scopo di spostare verso l'interno il testo della colonna destra. NB: l'impostazione del right alignment depth avra' effetto solo sul comportamento delle tabelle della status line del tipo appena descritto; non avara' alcun effetto sul modo di default con cui Inform gestisce la variabile di right hand status line.

Chapter: Effetti di colore (disponibili solo con la Z-machine)

Section: Cambiare il colore dello sfondo

Per rendere lo sfondo nero (o rosso, verde, giallo, blu, bianco, magenta o ciano):

	turn the background black. 
	turn the background red. 

... e via dicendo. Questo ha effetto solo su cio' che verra' digitato da quel punto della partita in poi. Se vogliamo convertire il colore dell'intero sfondo in un colpo solo (come di solito si vorrebbe fare) dovremmo settare il colore di sfondo e poi pulire lo schermo, quindi:

	turn the background black;
	clear the screen.

NDT: I colori disponibili sono otto: black (nero), red (rosso), green (verde), yellow (giallo), blue (blu), white (bianco), magenta (magenta), cyan (ciano).

Section: Cambiare il colore del font

Infie, il colore dei caratteri puo' essere cambiato utilizzando la stessa gamma di colori disponibile per lo sfondo. Per esempio

	say "Puoi vedere una torta [red letters]rovente[default letters] sul tavolo."

Dovremmo fare attenzione quando usiamo gli effetti di colore. Alcuni vecchi interpreti non gestiscono bene i colori, e una fetta dell'utenza gioca le avventure testuali su supporti bianco-nero o tramite lettore di schermo. La frase "say default letters" ripristina i colori dello sfondo e del font ai valori di default del sistema -- qualsiasi essi siano. Non e' una strategia sicura presumere che il giocatore stia utilizzando un certo schema di colori piuttosto che un altro -- nero su sfondo bianco, bianco su nero, e bianco su blu sono tutti schemi di colore relativamente comuni.

Infine, come accennato nel titolo della sezione, questi effetti di colore funzionano solo quando si compila per la Z-machine. Glulx ha un metodo di gestire colori e font che e' diverso e non del tutto simmetrico, e che richiede un po' piu' di allestimento; se vogliamo effetti di colore per Glulx, dovremmo rivolgerci all'estensione Glulx Text Effects, anch'essa fornita assieme a Inform.

Un ringraziamento a Eric Eve per le patches bipiattaforma contribuite a quest'estensione.

Example: * La Nota Suprema - Forzare il giocatore a digitare uno specifico comando al prompt.

Un espediente impiegato occasionalmente nelle avventure testuali e' quello di offrire al giocatore il prompt dei comandi, ma poi forzare un comando specifico -- ossia, qualsiasi cosa il giocatore digiti si stampa il comando che vogliamo forzare, e poi si prosegue la partita come se avesse digitato quel comando. Il trucco consiste nel fatto che non gli stiamo affato offrendo un prompt dei comandi; stiamo solo stampando il prompt, attendiamo che venga premuto un tasto, stampiamo la prima lettera del nostro comando forzato, attendiamo che prema un ulteriore tasto, stampiamo la seconda lettera, e cosi' via, finche' il giocatore avra' premuto abbastanza tasti da aver "digitato" il comando che vogliamo forzare.

Questo e' un effetto che si presta facilmente all'abuso, ma ecco come potremmo implementarlo utilizzando Effetti Visivi di Base:

	*: "La Nota Suprema"

	The Edge of the Stage is a room.

	When play begins:
		say "Sei in piedi tra le luci della ribalta, vedi il folto pubblico radunato e riesci a distinguere nella penombra il Gran Duca. E['] seduto nel suo cubicolo, e la sua signora, seduta nel proprio. Brancolando tra i fumi di due bottiglie di brandy e un mal-consigliato champagne, cerchi di ricordare come inizia la tua parte, . Ti sei affidato troppe volte al tuo istinto affinche' ti guidasse; ma questa volta potrebbe tradirti ... [line break]";
		fake command;
		say "Si[']: il Do maggiore. Inizia cosi[']...";
		pause the game.

	Include Basic Screen Effects by Emily Short.

	To fake command:
		say "[line break][command prompt] [bold type]";
		wait for any key;
		say "c";
		wait for any key;
		say "a";
		wait for any key;
		say "n";
		wait for any key;
		say "t";
		wait for any key;
		say "a";
		wait for any key;
		say roman type;
		say line break; 
		
Potremmo impostarlo in maniera piu' elegante, se dovessimo sfruttarlo molto, con tabelle dei caratteri da stampare o qualcosa del genere; ma questo esempio mostra chiaramente come funziona il trucco.

L'esempio e' stato incluso perche' molti autori hanno espresso interesse nei suoi confronti, ma vale la pena andarci cauti -- quanti piu' giochi utilizzeranno questa manovra, tanto meno l'espediente suscitera' sorpresa e interesse nel giocatore.

Example: ** Pillaged Village - A status bar showing unvisited rooms in a colored compass rose.

Note that attempting to compile this example for Glulx will fail, because it uses color effects available only on the Z-machine.

	*: "Pillaged Village" by Lars Thurgoodson.
	
	Include Basic Screen Effects by Emily Short.

	The story headline is "An interactive looting".

	The Viking Longship is west of the Seashore. The Seashore is west of the Burning Village. The Shrine of the Green Man is northwest of the Burning Village. The Shattered Fort is southwest of the Burning Village. The Treetop is above the Shrine.

	When play begins:
		center "[story title]";
		center "[story headline]";
		center "by [story author]";
		leave space;
		center "Press SPACE to begin.";
		wait for the SPACE key;
		clear the screen;
		leave space.

	To turn screen black:
		say white letters;
		turn the background black;
		clear the screen;
		leave space;
	
	To turn screen white:
		turn the background white;
		say black letters;
		clear the screen;
		leave space.

	To leave space:
		say paragraph break;
		say paragraph break;
		say paragraph break;
		say paragraph break. 
	
	Table of Fancy Status
	left	central	right 
	" [if in darkness]Darkness[otherwise][location][end if]"	""	"[top rose]"
	" "	""	"[middle rose]"
	" Rooms searched: [number of rooms which are visited]/[number of rooms]"	""	"[bottom rose]"
 	
	To say red reverse:
		turn the background red.
		
	To say black reverse:
		turn the background black.
	
	To say white reverse:
		turn the background white. 

	To say rose (way - a direction):
		let place be the room way from the location;
		if the place is a room, say "[if the place is unvisited][red reverse][end if][way abbreviation][default letters]"; otherwise say "[way spacing]"; 

	To say (way - a direction) abbreviation:
		choose row with a chosen way of way in the Table of Various Directions;
		say abbrev entry.
		
	To say (way - a direction) spacing:
		choose row with a chosen way of way in the Table of Various Directions;
		say spacing entry.

	Table of Various Directions
	chosen way	abbrev	spacing
	up	"U   "	"    "
	northwest	"NW"	"  "
	north	" N "	"    "
	northeast	"NE"	"  "
	east	" E"	"  "
	west	"W "	"  "
	southeast	"SE"	"  "
	south	" S "	"   "
	southwest	"SW"	"  "
	down	"D   "	"    "
		
	To say top rose:
		say "[rose up][rose northwest][rose north][rose northeast]".
	
	To say middle rose: 
		say "    [rose west] . [rose east]"; 
	
	To say bottom rose:
		say "[rose down][rose southwest][rose south][rose southeast]".
	 	
	Rule for constructing the status line:
		fill status bar with Table of Fancy Status;
		say default letters;
		rule succeeds.


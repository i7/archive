Version 2 of Exit Descriptions by Matthew Fletcher begins here.

"Appends a list of exit directions and names any previously visited rooms at the end of a room description."

The amount is a number variable.
The amount is 0.

The num is a number variable.
The num is 0.

After looking: 
    Change the amount to the number of adjacent rooms;
    repeat with destination running through adjacent rooms begin; 
        if the num is 0, say "Exits:";
        let the way be the best route from the location to the destination, using even locked doors;
        if the way is a direction, say " [way]";
        if the destination is visited, say " to [the destination]";
        Decrease the amount by 1;
        Increase the num by 1;
        if the amount is 0, say ".";
        if the amount is 1, say " and";
        if the amount is greater than 1, say ",";
    end repeat;
    Change the amount to 0;
    Change the num to 0.

Exit Descriptions ends here.

---- DOCUMENTATION ----

At the moment you just include this extension and it will add a sentence which lists the exits to the end of a room description, including the names of any previously visited rooms.

In future versions I will make it so that various settings can be changed, to display doors, not name visited rooms or to name all rooms, turning the option on and off in or out of play, etc. 

Thanks to:
  Mel Hython for his contribution.
  Sarganar for the Spanish translation.

SPANISH:

Esta extension agrega en cada turno una lista con las posibles salidas de la localidad actual. Imprime el nombre de las salidas ya visitadas.
Para usarla, solo incluye la extension al principio del codigo de tu juego.

Traducida al espanol por Sarganar
PROGRAM ContarVocales;
USES math;
VAR
	A, E, I, O, U: integer;
	mayor: integer;
	letra, letraMayor: char;
BEGIN
	A := 0;
	E := 0;
	I := 0;
	O := 0;
	U := 0;
	REPEAT
		writeln('Ingrese una nueva letra (Punto para finalizar)');
		read(letra);
		CASE ord(letra) OF
			65, 97: A := A + 1;
			69, 101: E := E + 1;
			73, 105: I := I + 1;
			79, 111: O := O + 1;
			85, 117: U := U + 1;
		END;
	UNTIL letra = '.';
	
	letraMayor := 'A';
	mayor := A;
	IF E > mayor THEN
		letraMayor := 'E';
		mayor := E;
	IF I > mayor THEN
		letraMayor := 'I';
		mayor := I;
	IF O > mayor THEN
		letraMayor := 'O';
		mayor := O;
	IF U > mayor THEN
		letraMayor := 'U';
		mayor := U;
	write('La vocal mas repetida es: ', letraMayor);
END.

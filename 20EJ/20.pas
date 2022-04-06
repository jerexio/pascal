PROGRAM CalculoTrazaMatriz;
TYPE
	Matriz = array [1..5] of array[1..5] of integer;
VAR
	M: matriz;
	N: integer; {Tamanio matriz}
	i, j, aux, sumaTraza: integer;
BEGIN
	write('Ingrese el tamanio de la matriz cuadrada: ');
	read(N);
	aux := 1;
	FOR i:=1 TO N DO
	BEGIN
		write('| ');
		FOR j:=1 TO N DO
		BEGIN
			write(chr(64+(aux)),' ');
			aux := aux + 1;
		END;
		writeln('|');
	END;
	aux := 1;
	sumaTraza := 0;
	FOR i:=1 TO N DO
	BEGIN
		FOR j:=1 TO N DO
		BEGIN
			write('Ingrese el valor de ',chr(64+aux),': ');
			read(M[i,j]);
			aux := aux + 1;
		END;
		sumaTraza := sumaTraza + M[i,i];
	END;
	writeln('La suma de la traza es: ', sumaTraza);
END.

PROGRAM ObtenerSubCadena;
(*	Leo una cadena A de N caracteres
	De A saco una subcadena B, talque:
		- Tiene K caracteres (N >= K)
		- Empieza en el carecter i, tal que 1 <= i <= N <= K
*)
VAR
	A, B: string;
	N, M, posicion: integer;
	

	PROCEDURE subCad(A: String; N: integer; VAR B: String; M: integer; posi: integer);
	VAR
		i: integer;
	BEGIN
		IF (posi+M+1 <= N+2) THEN
		BEGIN
			FOR i:=0 TO M-1 DO
			BEGIN
				B := B + A[posi+i];
			END;
		END
		ELSE
			writeln('Wepa, parece que no es posible crear una subcadena');
	END;
BEGIN
	B := '';
	writeln('Inserte un texto');
	readln(A);
	N := length(A);
	writeln('De que tamaño quiere la subcadena?');
	REPEAT
		writeln('Ingrese un valor menor o igual a ', N);
		readln(M);
	UNTIL N >= M;

	write('Ingrese un posicion inicial, ');
	REPEAT
		writeln('Mayor a 0');
		readln(posicion);
	UNTIL posicion > 0;
	
	subCad(A, N, B, M, posicion);
	writeln('Cadena original: ', A);
	writeln('Subcadena fachera: ', B);
END.

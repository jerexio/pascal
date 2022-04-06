PROGRAM BuscandoPrimos;
VAR
	numero, i: integer;
	primos: ARRAY OF integer;
	PROCEDURE obtenerPrimosEntre(num1: integer; num2: integer; VAR almacenar: ARRAY OF integer);
	VAR
		index: integer;
		esPrimo: boolean;
	BEGIN
		FOR i := num1 TO num2 DO
		BEGIN
			esPrimo := true;
			index := 1;
			WHILE(NOT (almacenar[index] = 0) AND esPrimo) DO
			BEGIN
				IF (i MOD almacenar[index] = 0) THEN
					esPrimo := NOT esPrimo;
				index := index + 1;
			END;
			IF esPrimo THEN
				almacenar[index] := i;
		END;
	END;
BEGIN
	writeln('Cuantos primos quieres saber?');
	write('Ingrese un numero mayor a 2: ');
	REPEAT
		read(numero);
	UNTIL numero > 2;
	setlength(primos, numero);
	obtenerPrimosEntre(2, numero, primos);

	i := 1;
	WHILE(NOT(primos[i] = 0)) DO
	BEGIN
		writeln(primos[i]);
		i := i + 1;
	END;
	writeln();
END.

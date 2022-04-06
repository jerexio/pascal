PROGRAM palabraMasCortaEnTexto;
uses sysutils;
TYPE
	Contenedor = array[1..100] of string;
VAR
	parrafo: string;
	palabras: Contenedor;

	PROCEDURE vaciar(VAR cont: Contenedor);
	VAR i, long: integer;
	BEGIN
		long := length(cont);
		FOR i:=0 TO long DO
		BEGIN
			cont[i] := '';
		END;
	END;

	{Corta las palabras y solo las almacena si hay correspondencia con la longitud minima}
	FUNCTION buscarPalabrasMasCortas(texto: string):Contenedor;
	VAR
		palabras: contenedor;
		i, index: integer;
		palabra: string;
		longMinima: integer; 
	BEGIN
		longMinima := 10000; (*189198: Tamaño de la palabra mas larga del mundo*)
		i := 1;
		index := 1;
		palabra := '';
		WHILE (NOT(texto[i] = '&')) DO
		BEGIN
			IF (((texto[i]=' ') OR (texto[i]=',') OR (texto[i]=';')  OR (texto[i]='.')) AND (NOT(palabra = ''))) THEN
			BEGIN
				IF (length(palabra) <= longMinima) THEN {Si encuentro una palabra mas corta}
				BEGIN
					IF (length(palabra) < longMinima) THEN {Si encuentro una palabra mas corta}
					BEGIN
						vaciar(palabras); {Vacio el array}
						index := 1;	{Reinicio el indice}
						longMinima := length(palabra);
					END;
					palabras[index] := palabra;
					index := index + 1;
				END;
				palabra := '';
			END
			ELSE
			BEGIN
				IF (NOT ((texto[i]=' ') OR (texto[i]=',') OR (texto[i]=';') OR (texto[i]='.'))) THEN
					palabra := palabra + texto[i];
			END;
			i := i + 1
		END;
		IF (NOT (palabra = '')) THEN
		BEGIN
			IF (length(palabra) <= longMinima) THEN
			BEGIN
				IF (length(palabra) < longMinima) THEN
				BEGIN
					vaciar(palabras);
					index := 1;
				END;
				palabras[index] := palabra;{ultima palabra}
			END;
		END;
		buscarPalabrasMasCortas := palabras;
	END;
VAR
	i: integer;

BEGIN
	writeln('Escriba un parrafo y finalice con & (Humilde recomendacion usar lorem ipsum)');
	readln(parrafo);
	
	palabras := buscarPalabrasMasCortas(parrafo);
	writeln();
	writeln('Palabras mas cortas');
	FOR i:=1 TO length(palabras) DO
	BEGIN
		write(palabras[i], ' ');
	END;
	writeln();
END.

PROGRAM SimbolismoDeTexto;
VAR
	texto: string;

	(*Conociendo el texto y su longitud, pongo las palabras en un arreglo*)
	PROCEDURE cortadorDeCadena(texto: string; long: integer; VAR contenedor: array of string);
	VAR
		i, index: integer;
		palabra: string;
	BEGIN
		i := 1;
		index := 1;
		palabra := '';
		WHILE (i <= long) DO
		BEGIN
			IF (texto[i] = ' ') THEN
			BEGIN
				contenedor[index] := palabra;
				index := index + 1;
				palabra := '';
			END
			ELSE
				palabra := palabra + texto[i];
			i := i + 1
		END;
		contenedor[index] := palabra;
	END;

	{mas, menos, por, dividido}
	FUNCTION identificarOperacion(texto: string): string;
	VAR
		long,i: integer;
		palabras: array of string;
		c: string;
	BEGIN
		long := length(texto);
		setlength(palabras, long);
		cortadorDeCadena(texto, long, palabras);
		long := 0;
		long := length(palabras);
		i := 1;	
		c := '';
		WHILE ((NOT(palabras[i] = '')) AND (c = '')) DO
		BEGIN
			CASE palabras[i] OF
				'menos': c := '-';
				'mas': c := '+';
				'por': c := '*';
				'dividido': c := '/';
			END;
			i := i + 1;
		END;
		identificarOperacion := c;
	END;
BEGIN
	writeln('Ingrese texto cifrado con un operacion');
	readln(texto); 
	write('El operador es: ');
	texto := identificarOperacion(texto);
	IF texto = '' THEN
		writeln('Wow, tu operador no existe o cifras muy bien las palabras, o estas usando mal el programa (...Espero que no...)')
	ELSE
		writeln(texto);
END.

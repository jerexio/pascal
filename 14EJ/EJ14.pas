PROGRAM LeerTelegrama;
VAR
   letra: char;
   letraAnterior: char := ' ';
   cantidad: integer := 0;
BEGIN
	{Contador de letras}
	REPEAT
		writeln('Escriba la proxima letra (Punto para finalizar)');
		read(letra);
		IF NOT (letra = ' ') THEN
			cantidad := cantidad + 1;
	UNTIL letra = '.';
	
	{Contador de palabras}
        REPEAT  
                writeln('Escriba la proxima letra (Punto para finalizar)');
                read(letra);
		IF ((NOT (letraAnterior=' ') AND letra=' ') OR letra='.') THEN
			cantidad := cantidad + 1;
		letraAnterior := letra;
        UNTIL letra = '.';
	
END.

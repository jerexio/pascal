{
Neuquen --Son iguales--> Neuquen -...-> Neuquen --> 1 y 2 se vuelven iguales
^     ^			  ^   ^		   ^
1     2			  1   2		  1y2

Otto --> Otto --> 1 Se vuelve mayor que 2
 ^^	  ^^
 12	  21
}
PROGRAM PalabraPalindromo;
VAR
	palabra: string;
	
	FUNCTION esPalindromo(palabra: string): boolean;
	VAR
		esPalind: boolean;
		longPalabra, puntero: integer;
	BEGIN
		esPalind := true;
		puntero := 0;
		longPalabra := length(palabra);
		LowerCase(palabra);
		WHILE ((NOT esPalind) AND ((puntero+1) < (longPalabra-puntero))) DO
		BEGIN
			IF NOT (palabra[puntero] = palabra[longPalabra-puntero]) THEN
				esPalind := NOT esPalind;
			puntero := puntero + 1;
		END;
		esPalindromo := esPalind;
	END;
BEGIN
	write('Inserte la palabra para verificar que es palindromo: ');
	read(palabra);
	writeln(palabra,' es palindromo? ',esPalindromo(palabra));
END.

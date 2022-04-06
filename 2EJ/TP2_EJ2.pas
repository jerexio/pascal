PROGRAM LecturaEImpresion;
VAR numero1, numero2, prodResultado, divResultado: integer;
	FUNCTION suma(num1, num2: integer): integer;
	BEGIN
		suma := num1 + num2;
	END;

	FUNCTION resta(num1, num2: integer): integer;
	BEGIN
		resta := num1 - num2;
	END;

	PROCEDURE producto(num1, num2: integer; VAR prodResultado: integer);
	BEGIN
		prodResultado := num1 * num2;
	END;

	PROCEDURE division(num1, num2: integer; VAR divResultado: integer);
	BEGIN
		divREsultado := num1 div num2;
	END;
BEGIN
	writeln('Hola, este es un programa para pruebas');
	write('Ingrese el primer numero: ');
	read(numero1);
	write('Ingrese el segundo numero: ');
	read(numero2);
	writeln('Ahora veamos que hace');
	writeln(numero1,' + ',numero2,' = ', suma(numero1, numero2));
	writeln(numero1,' - ',numero2,' = ', resta(numero1, numero2));
	producto(numero1, numero2, prodResultado);
	writeln(numero1,' * ',numero2,' = ',prodResultado);
	division(numero1, numero2, divResultado);
	writeln(numero1,' div ',numero2,' = ',divResultado);
END.


{Toma 2 numeros y suma, resta, multiplica o divide.}
PROGRAM OperacionDosNumeros;
VAR	numero1, numero2, resultado:real;
	opcion: char;

	{Punto a, suma y resta}
	FUNCTION sumaYResta(num1: real; num2:real; opcion: char):real;
	VAR res: real;
	BEGIN
		CASE opcion OF
			'+': res := num1 + num2;
			'-': res := num1 - num2;
		ELSE
			write('Opcion invalida (Si ve esto contacte con el tecnico)');
		END;
		sumaYResta := res;
	END;

	{Punto b, producto y division}
	PROCEDURE prodYDiv(num1, num2: real; VAR res: real; opcion: char);
	BEGIN
		CASE opcion OF
			'*': res := num1 * num2;
			'/': res := num1 / num2;
		ELSE
			writeLn('(Opcion invalida) Usted no deberia vevr esto');
		END;
	END;

BEGIN
	write('Inserte el primer numero: ');
	readln(numero1);
	write('Inserte el segundo numero: ');
	readln(numero2);
	write('Desea sumar(+), restar(-), multiplicar(*) o dividir(/)? ');
	REPEAT
		readln(opcion);
	UNTIL ((opcion = '+') OR (opcion = '-') OR (opcion = '*') OR (opcion = '/'));
	IF ((opcion = '+') OR (opcion = '-')) THEN
		resultado := sumaYResta(numero1, numero2, opcion)
	ELSE
		prodYDiv(numero1, numero2, resultado, opcion);
	writeln('El resultado de ',numero1:10:5,' ',opcion,' ',numero2:10:5,' = ', resultado:10:5);
END.

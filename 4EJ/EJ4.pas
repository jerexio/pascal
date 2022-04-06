PROGRAM ValorMayor;
VAR numero: real;
	FUNCTION mayor(num1, num2: real): boolean;
	BEGIN
		mayor := num1 > num2;
	END;
BEGIN
	writeln('SERA USTED CAPAZ DE INGRESAR UN NUMERO MAYOR A 0?');
	write('Ingrese un numero: ');
	read(numero);
	IF mayor(numero,0) THEN
		writeln('Su numero es mayor que 0')
	ELSE
		writeln('Su numero no es mayor que 0');
END.

PROGRAM EsPar;
VAR numero1, numero2: integer;
	FUNCTION esDivisible(num1, num2: integer): boolean;
	BEGIN
		esDivisible := (num1 MOD num2 = 0);
	END;
BEGIN
	{Funciona bien}
	{
	writeln('Tu numero sera par? (Tecnicamente ya lo sabes, tipo, si termina en 0,2,4,6,8,es par. Pero no es mi trabajo cuestionar el uso que le das a los programas, solo soy un cartel ');
	write('Buenop, inserta un numero y vamos viendo: ');
	read(numero1);
	write('El  numero ',numero1);
	IF (NOT esDivisible(numero1, 2)) THEN
		write(' no');
	writeln(' es par');
	}
	
	writeln('El primer numero sera divisible por el segundo?');
	write('Escriba un numero y presione ENTER: ');
	read(numero1);
	write('Ingrese el segundo numero: ');
	read(numero2);
	write('El numero ', numero1);
	IF (NOT esDivisible(numero1, numero2)) THEN
		write(' no');
	writeln(' es divisible por ', numero2);
	
END.

PROGRAM RaicesDePolinomio
VAR
	a, b, c, raiz1, raiz2: real;
	FUNCTION tieneRaicesReales(a, b, c: real): boolean;
	VAR determinante: integer;
	BEGIN
		determinante := b*b - 4*a*c;
		tieneRaicesReales := (determinante >= 0);
	END;
BEGIN
	writeln('Sabiendo que una funcion polinomica de segundo grado tiene la forma:  --> ax² + bx + c <--');
	write('Ingrese el valor de a: ');
	read(a);
	write('Ingrese el valor de b: ');
	read(b),
	write('Ingrese el valor de c: ');
	read(c);
	IF tieneRaicesReales(a,b,c) THEN
	BEGIN
		writeln('Raiz 1: ',((-b + sqrt(b*b - 4*a*c))/(2*a)));
		writeln('Raiz 2: ', ((-b - sqrt(b*b - 4*a*c))/(2*a)));
	END;
END.		

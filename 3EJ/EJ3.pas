PROGRAM Esfera;
{Se define el radio, y los resultados a mostrar, superficie y volumen}
CONST PI = 3.141592;
VAR
radio, superficie, volumen: real;
	{Notese la correspondencia r <--> Radio}
	PROCEDURE calculoVolumen(r: real; VAR volumen: real);
	BEGIN
		volumen := (4/3)*PI*(r*r*r); {--> (4/3*PI*r³)}
	END;
	PROCEDURE calculoSuperficie(r: real; VAR superficie: real);
	BEGIN
		superficie := 4*PI*(r*r); {--> (4*PI*r²)}
	END;
BEGIN
	writeln('Calculo de SUPERFICIE Y VOLUMEN de una esfera');
	write('Ingrese un radio: ');
	read(radio);
	calculoVolumen(radio, volumen);
	calculoSuperficie(radio, superficie);
	writeln('Para la esfera de radio ', radio,' su superficie es ', superficie,' y su volumen es ', volumen);
END.

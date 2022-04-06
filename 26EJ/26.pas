PROGRAM OperacionesConRegistros;
(*	Calcular suma, resta, multiplicacion y division de 2 numeros complejos
	Notese: Expresados como registros
*)
TYPE
	Complejo = RECORD
		pReal: double;
		pImg: double;
	END;
	vComplejos = ARRAY [1..4] OF Complejo;
VAR
	numero1, numero2: Complejo;
	resultados: vComplejos;

	PROCEDURE operaciones(numero1, numero2: Complejo; VAR resultado: vComplejos);
	BEGIN
		(*SUMA*)
		resultado[1].pReal := numero1.pReal + numero2.pReal;
		resultado[1].pImg := numero1.pImg + numero2.pImg;

		(*Resta*)
		resultado[2].pReal := numero1.pReal - numero2.pReal;		
		resultado[2].pImg := numero1.pImg - numero2.pImg;

		(*Producto*)
		resultado[3].pReal := (numero1.pReal * numero2.pReal) - (numero1.pImg * numero2.pImg);
		resultado[3].pImg := (numero1.pReal * numero2.pImg) + (numero1.pImg * numero2.pReal);
		

		(*Division*)
		resultado[4].pReal := ((numero1.pReal * numero2.pReal) + (numero1.pImg * numero2.pImg))/(numero2.pReal*numero2.pReal + numero2.pImg*numero2.pImg);
                resultado[4].pImg := ((numero1.pImg * numero2.pReal) - (numero1.pReal * numero2.pImg))/(numero2.pReal*numero2.pReal + numero2.pImg*numero2.pImg);

	END;

BEGIN
	numero1.pReal := 2; numero1.pImg := 3;
	numero2.pReal := 4; numero2.pImg := 1;
	operaciones(numero1, numero2, resultados);

	writeln('Suma: ', resultados[1].pReal, ' + ',resultados[1].pImg);
	writeln('Rest: ', resultados[2].pReal, ' + ',resultados[2].pImg);
	writeln('Prod: ', resultados[3].pReal, ' + ',resultados[3].pImg);
	writeln('Div: ', resultados[4].pReal, ' + ',resultados[4].pImg);
END.

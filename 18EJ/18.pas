PROGRAM SubprogramasConjuntos;
TYPE
	TipoIndiceConjuntos = 1..256;
	Conjunto = array [TipoIndiceConjuntos] of boolean;
VAR
	c1, c2, conjFinal: Conjunto;
	i, j: integer;
	aleatorio: integer;

	FUNCTION union(conj1: Conjunto; conj2: Conjunto; longC1, longC2: integer): Conjunto;
	VAR
		arreglo: Conjunto;
		i: integer;
	BEGIN
		arreglo := conj1;
		FOR i:=1 TO longC2 DO
		BEGIN
			arreglo[longC1 + i] := conj2[i];
		END;
		union := arreglo;
	END;

	FUNCTION interseccion(conj1, conj2: Conjunto; longC1, longC2: integer): Conjunto;

	VAR
		arreglo: Conjunto;
		index, i, j: integer;
	BEGIN
		index := 1;
		FOR i := 1 TO longC1 DO
		BEGIN
			FOR j := 1 TO longC2 DO
			BEGIN	
				IF conj1[i] = conj2[j] THEN
				BEGIN
					arreglo[index] := conj2[j];
					index := index + 1;
				END;
			END;
		END;
		interseccion := arreglo;
	END;

	FUNCTION diferencia(conj1, conj2: Conjunto; longC1, longC2: integer): Conjunto;
	VAR
		arreglo: Conjunto;
		index, i, j: integer;
		estaElto: boolean;
	BEGIN
		index := 1;
		FOR i := 1 TO longC1 DO
		BEGIN
			estaElto := false;{Esta el elto del conjunto 1 en el conjunto 2}
			j := 1;
			WHILE ((NOT estaElto) AND (j <= longC2)) DO
			BEGIN
				IF (conj1[i] = conj2[j]) THEN
					estaElto := NOT estaElto;
				j := j + 1;
			END;
			IF (NOT estaElto) THEN
			BEGIN
				arreglo[index] := conj1[i];
				index := index + 1;
			END;
		END;
		diferencia := arreglo;
	END;
BEGIN
	{Aqui escribe el programa para testear los subprogramas}
	c1[1] := true;	
	c1[2] := false;
{	c1[3] := false;
	c1[4] := true;
	c1[5] := false;
	c1[6] := true;
	c1[7] := false;
}
	c2[1] := false;
{	c2[2] := NOT false;
	c2[3] := NOT false;
	c2[4] := NOT true;
	c2[5] := NOT false;
	c2[6] := NOT true;
	c2[7] := NOT false;
}	
	conjFinal := diferencia(c1, c2, 2, 1);
	FOR i:=1 TO 14 DO
	BEGIN
		writeln(conjFinal[i]);
	END;
END.

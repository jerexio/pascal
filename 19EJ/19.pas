PROGRAM OperacionesConVectores;
TYPE
	Vector = array of integer;
VAR
	A, B, C: vector;
	N, i: integer;

	FUNCTION sumaVectores(A,B: Vector; N: integer): vector;
	VAR
		i: integer;
		vectorSuma: vector;
	BEGIN
		setlength(vectorSuma, N);
		FOR i:=0 TO N DO
		BEGIN
			vectorSuma[i] := A[i] + B[i];
		END;
		sumaVectores := vectorSuma;
	END;

	FUNCTION productoEscalar(A,B: vector; N: integer): integer;
	VAR
		i, sumaParcial: integer;
	BEGIN
		sumaParcial := 0;
		FOR i:=0 TO N DO
		BEGIN
			sumaParcial := sumaParcial + (A[i] * B[i]);
		END;
		productoEscalar := sumaParcial;
	END;

BEGIN
	write('Longitud de los arreglos: ');
	read(N);
	setlength(A, N);
	setlength(B, N);
	FOR i:=1 TO N DO
	BEGIN
		write('Ingrese un valor para A(',i,'): ');
		read(A[i]);
		write('Ingrese un valor para B(',i,'): ');
                read(B[i]);
	END;

	C := sumaVectores(A,B,N);
	write('Suma Vectores: [',C[1]);
	FOR i:=2 TO N DO
	BEGIN
		write(', ',C[i]);
	END;
	writeln(']');
	writeln('Producto Escalar: ',productoEscalar(A,B,N));
END.

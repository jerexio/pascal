PROGRAM OrdenarNombres;

Uses sysutils;

VAR
	nombres: array [1..10] OF string;
	nombre: string;
	index, i: integer;

    (*Quicksort*)
    PROCEDURE ordenarListaNombres(  VAR A: array of string;
                                    izq, der: integer);
    VAR
        i, j: integer;
        comparacion: longint;
        pivote, aux: string;
    BEGIN
        pivote := A[izq];
        i := izq;
        j := der;
        
        WHILE i<j DO
        BEGIN
            comparacion := compareText(A[i], pivote);
            {writeln('nombre1: ',A[i],'| indice ',i,'| nombre2: ',pivote,' comparacion: ',comparacion);
            }WHILE ((comparacion <= 0) AND
                    (i<j)) DO
            BEGIN
                i := succ(i);
                comparacion := compareText(A[i], pivote);
            END;
                
            comparacion := compareText(A[j], pivote);
            WHILE ((comparacion > 0)) DO
            BEGIN
                j := pred(j);
                comparacion := compareText(A[j], pivote);
            END;
            

            IF i<j THEN
            BEGIN
                writeln('i: ',i,' j: ',j);
                aux := A[i];
                A[i] := A[j];
                A[j] := aux;
            END;
            {writeln('___2___nombre1: ',A[i],'| indice ',i,'| nombre2: ',pivote,' comparacion: ',comparacion);
        }END;
        
        A[izq] := A[j];
        A[j] := pivote;
        IF (izq < j-1) THEN
            ordenarListaNombres(A, izq, j-1);
            
        IF (j+1 < der) THEN
            ordenarListaNombres(A, j+1, der);

    END;

BEGIN
{	index := 0;
    
    write('Ingrese un nuevo nombre (. para salir): ');
	readln(nombre);
	WHILE NOT(nombre = '.') DO
	BEGIN
    	index := index + 1;
		nombres[index] := nombre;
    	write('Ingrese un nuevo nombre (. para salir): ');
		readln(nombre);
    END;


	writeln('Lista desordenada');
	FOR i:=1 TO 10 DO
	BEGIN
		write(nombres[i],' ');
	END;
    
    ordenarListaNombres(nombres, 1, 10);
	writeln('Lista ordenada');
	FOR i:=1 TO 10 DO
	BEGIN
		write(nombres[i], ' ');
	END;
	writeln();
}
    nombres[1] := 'Juan';
	nombres[2] := 'Martina';
	nombres[3] := 'Gero';
	nombres[4] := 'Jere';
	nombres[5] := 'Xavi';
	nombres[6] := 'Nico';
	nombres[7] := 'Brik';
    nombres[8] := 'Ricky';
	nombres[9] := 'Batman';
	nombres[10] := 'Guason';
	
    ordenarListaNombres(nombres, 0, 9);

	writeln('Lista ordenada');
	FOR i:=1 TO 10 DO
	BEGIN
		writeln(nombres[i], ' ');
	END;    
 END.

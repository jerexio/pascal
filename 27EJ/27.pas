PROGRAM OrdenamientoPersonas;

uses sysutils; {Para usar el comparador de cadenas}

TYPE
	Registro = RECORD
		nombre: string;
		telefono: string;
	END;
VAR
	registroPersonas: array[1..10] OF Registro;
	i: integer;

    PROCEDURE ordenarRegistro(  VAR A: array of Registro;
                                    izq, der: integer);
    VAR
        i, j: integer;
        comparacion: longint;
        pivote, aux: Registro;
    BEGIN
        pivote := A[izq-1];
        i := izq-1;
        j := der-1;
        
        WHILE i<j DO
        BEGIN
            comparacion := compareText(A[i].nombre, pivote.nombre);
            WHILE ((comparacion <= 0) AND (i<j)) DO
            BEGIN
                i := succ(i);
                comparacion := compareText(A[i].nombre, pivote.nombre);
            END;
                
            comparacion := compareText(A[j].nombre, pivote.nombre);
            WHILE (comparacion > 0) DO
            BEGIN
                j := pred(j);
                comparacion := compareText(A[j].nombre, pivote.nombre);
            END;
            
            IF i<j THEN
            BEGIN
                aux := A[i];
                A[i] := A[j];
                A[j] := aux;
            END;
        END;

        A[izq-1] := A[j];
        A[j] := pivote;

        IF (j-1 < izq-1) THEN
            ordenarRegistro(A, izq-1, j-1);
            
        IF (j+1 < der-1) THEN
            ordenarRegistro(A, j+1, der-1);

    END;

(*
    Codigo que sigue, a pesar de que yo lo hice
    Explicacion simple:
        - Tenemos: un nombre, un vector de registros, el inicio y el fin
        - Se verifica si el nombre del registro actual esta antes o despues, del nombre
        - Y asi, hasta que se llega al elto correcto o no se encuentra

        Si registros esta sin VAR entonces se rompe, y no logra identificar el ultimo elemento
*)
	FUNCTION obtenerTelefonoDe(nombre: string; registros: array of registro; inicio, fin: integer): string;
	VAR
		medio: integer;
		comparacion: longint;
		retorno: string;
	BEGIN
		medio := ((inicio+fin) div 2);
        IF NOT((medio > fin) OR (medio < inicio)) THEN
		BEGIN
            comparacion := compareText(registros[medio].nombre, nombre);
            IF (comparacion > 0) THEN
		       	retorno := obtenerTelefonoDe(nombre, registros, inicio, medio-1)
		    ELSE
                BEGIN
		    	IF (comparacion < 0) THEN
		            retorno := obtenerTelefonoDe(nombre, registros, medio+1, fin)
		    	ELSE
		    	    retorno := registros[medio].telefono;
               END;
           END
           ELSE
               retorno := 'Numero no existe';


        obtenerTelefonoDe := retorno;
	END;

BEGIN
		registroPersonas[1].nombre := 'Jere';
		registroPersonas[1].telefono := '4321';

		registroPersonas[2].nombre := 'xavi ';
		registroPersonas[2].telefono := '4321';

		registroPersonas[3].nombre := 'Agus';
		registroPersonas[3].telefono := '123456780';

	ordenarRegistro(registroPersonas, 1, 3);	
	FOR i:=1 TO 3 DO
	BEGIN
		writeln(registroPersonas[i].nombre);
	END;

   writeln(obtenerTelefonoDe('xavi', registroPersonas, 1, 3));
END.

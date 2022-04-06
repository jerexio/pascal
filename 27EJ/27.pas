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
        pivote := A[(izq+der) div 2];
        i := izq-1;
        j := der-1;
        
        WHILE i<j DO
        BEGIN
            comparacion := compareText(A[i].nombre, pivote.nombre);
            WHILE (comparacion < 0) DO
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
            
            aux := A[i];
            A[i] := A[j];
            A[j] := aux;

            comparacion := compareText(pivote.nombre, A[(izq+der) div 2].nombre);
            IF NOT (comparacion = 0) THEN
            BEGIN
                pivote := A[(izq+der) div 2];
                i := izq-1;
                j := der-1;
            END;
        END;

        IF (j-1 > izq) THEN
            ordenarRegistro(A, izq, (izq+der) div 2);
            
        IF (i+1 < der) THEN
            ordenarRegistro(A, (izq+der) div 2, der);

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
        IF ((medio <= fin) OR (medio >= inicio)) THEN
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
    registroPersonas[1].nombre := 'Joel';
    registroPersonas[1].telefono := '4321';

    registroPersonas[2].nombre := 'xavi';
    registroPersonas[2].telefono := '4321';

    registroPersonas[3].nombre := 'Agus';
    registroPersonas[3].telefono := '123456780';

    registroPersonas[4].nombre := 'Jere';
    registroPersonas[4].telefono := '43289348293841';

    registroPersonas[5].nombre := 'simon';
    registroPersonas[5].telefono := '4321';

    registroPersonas[6].nombre := 'Nico';
    registroPersonas[6].telefono := '4321';

    registroPersonas[7].nombre := 'Brik';
    registroPersonas[7].telefono := '4321';

    registroPersonas[8].nombre := 'Ricky';
    registroPersonas[8].telefono := 'ric4321';

    registroPersonas[9].nombre := 'Batman';
    registroPersonas[9].telefono := 'Batmovil';

    registroPersonas[10].nombre := 'Guason';
    registroPersonas[10].telefono := '4321';

	ordenarRegistro(registroPersonas, 1, 10);	
	FOR i:=1 TO 10 DO
	BEGIN
		writeln(registroPersonas[i].nombre);
	END;

   writeln(obtenerTelefonoDe('Agus', registroPersonas, 1, 10));
END.

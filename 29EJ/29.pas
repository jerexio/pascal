PROGRAM CombinarArchivos;
TYPE
	TipoAlumno = RECORD
		legajo: string;
		nombre: string;
		numero: integer;
	END;
VAR
	archivo1: text;
	archivo2: FILE of byte;
	
	alumno: byte;
BEGIN
	ASSIGN(archivo1, '/home/jerexio/Escritorio/Facu/PLP/Programas Pascal/29EJ/archivo1.txt');
	ASSIGN(archivo2, '/home/jerexio/Escritorio/Facu/PLP/Programas Pascal/29EJ/archivo2.txt');
	APPEND(archivo1);
	RESET(archivo2);
	while (NOT eof(archivo2)) DO
	BEGIN
		read(archivo2, alumno);
		write(archivo1, chr(alumno));
	END;
	close(archivo1);
END.

Program Agregar_Arbol;
Const
	Corte = 0;
Type 
	Arbol = ^Nodo;
	Nodo = record
			dato: Integer;
			HI: Arbol;
			HD: Arbol;
		end;
		
Procedure Agregar (var a: Arbol; num: integer);
begin
	If (a = nil) then begin
		New(a);
		a^.dato:= num;
		a^.HI:= nil;
		a^.HD:= nil;
	end
	else 
		if (num <= a^.dato) then
			Agregar(a^.HI, num)
		else
			Agregar(a^.HD, num);
end;

Procedure RecorridoAcotado(a:arbol; valorInf, valorSup:integer; var suma: Integer);
begin
	If (a <> nil) then begin
		If (a^.dato >= valorInf) then
			If (a^.dato <= valorSup) then begin
				RecorridoAcotado(a^.HI, valorInf, valorSup, suma);
				suma:= suma + a^.dato; {Operacion a realizar en la acotacion}
				RecorridoAcotado(a^.HD, valorInf, valorSup, suma);
			end 
			else
				RecorridoAcotado(a^.HI, valorInf, valorSup, suma)
		else
			RecorridoAcotado(a^.HD, valorInf, valorSup, suma);
	end;
end;

Procedure ImprimirArbolOrdenado (a:arbol);
begin
	If(a<>nil) then begin
		ImprimirArbolOrdenado(a^.HI);
		writeln (a^.dato);
		ImprimirArbolOrdenado(a^.HD);
	end;
end;

// Programa Principal

Var
	a: Arbol;
	num, suma: Integer;
	valorInf, valorSup: Integer;
Begin
	a:= nil;
	suma:= 0;
	writeln('Ingrese un numero para insertar:');
	readln(num);
	While (num <> Corte) do begin
		Agregar(a, num);
		writeln('Ingrese un numero para insertar:');
		readln(num);
	end;
	writeln('Impresion Ordenada');
	ImprimirArbolOrdenado(a); {Imprime el Arbol en orden ascendente}
	writeln('Ingrese un valor inferior: ');
	readln(valorInf);
	writeln('Ingrese un valor superior: ');
	readln(valorSup);
	RecorridoAcotado(a, valorInf, valorSup, suma);
	writeln('La suma de los nodos acotados es: ', suma);
End.


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

Procedure ImprimirArbolOrdenado (a:arbol);
begin
	If(a<>nil) then begin
		ImprimirArbolOrdenado(a^.HI);
		writeln (a^.dato);
		ImprimirArbolOrdenado(a^.HD);
	end;
end;

Procedure ImprimirPreOrden (a:arbol);
begin
	If(a<>nil) then begin
		writeln (a^.dato);
		ImprimirArbolOrdenado(a^.HI);
		ImprimirArbolOrdenado(a^.HD);
	end;
end;

Procedure ImprimirPostOrden (a:arbol);
begin
	If(a<>nil) then begin
		ImprimirArbolOrdenado(a^.HI);
		ImprimirArbolOrdenado(a^.HD);
		writeln (a^.dato);
	end;
end;

// Programa Principal

Var
	a: Arbol;
	num: Integer;
Begin
	a:= nil;
	writeln('Ingrese un numero para insertar:');
	readln(num);
	While (num <> Corte) do begin
		Agregar(a, num);
		writeln('Ingrese un numero para insertar:');
		readln(num);
	end;
	writeln('Impresion Ordenada');
	ImprimirArbolOrdenado(a); {Imprime el Arbol en orden ascendente (InOrden)}
	writeln('Impresion Pre Ordenada');
	ImprimirPreOrden(a); {Imprime la Raiz al principio}
	writeln('Impresion Post Ordenada');
	ImprimirPostOrden(a); {Imprime la Raiz al final}
End.

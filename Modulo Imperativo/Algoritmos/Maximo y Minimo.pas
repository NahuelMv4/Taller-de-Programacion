Program Maximos_y_Minimos;
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

Function Minimo (a: Arbol): Integer;
begin
	if (a^.HI = nil) then
		Minimo:= a^.dato
	else
		Minimo:= Minimo(a^.HI);
end;

Function MinimoNodo (a: Arbol): Arbol;
begin
	if (a = nil) then
		MinimoNodo:= nil
	else
		if (a^.HI = nil) then
			MinimoNodo:= a
		else
			MinimoNodo:= MinimoNodo(a^.HI);
end;

Function Maximo (a: Arbol): Integer;
begin
	if (a^.HD = nil) then
		Maximo:= a^.dato
	else
		Maximo:= Maximo(a^.HD);
end;

Function MaximoNodo (a: Arbol): Arbol;
begin
	if (a = nil) then
		MaximoNodo:= nil
	else
		if (a^.HD = nil) then
			MaximoNodo:= a
		else
			MaximoNodo:= MaximoNodo(a^.HD);
end;

// Programa Principal

Var
	a, NodoMin, NodoMax: Arbol;
	num, min, max: Integer;
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
	ImprimirArbolOrdenado(a); {Imprime el Arbol en orden ascendente}
	if (a <> nil) then begin
		min:= Minimo(a);
		writeln('El minimo es: ', min);
	end;
	NodoMin:= MinimoNodo(a);
	writeln('El nodo minimo es: ', NodoMin^.dato);
	if (a <> nil) then begin
		max:= Maximo(a);
		writeln('El maximo es: ', max);
	end;
	NodoMax:= MaximoNodo(a);
	writeln('El nodo maximo es: ', NodoMax^.dato);
End.

Program Busqueda;
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

Function Buscar (a: Arbol; x: Integer):Boolean;
begin
	if (a = nil) then
		Buscar:= False
	else 	
		if (a^.dato = x) then
			Buscar:= True
		else
			if (x < a^.dato) then
				Buscar:= Buscar(a^.HI, x)
			else
				Buscar:= Buscar(a^.HD, x);
end;

Function BuscarNodo (a: Arbol; x:Integer):Arbol;
begin
	if (a = nil) then
		BuscarNodo:= Nil
	else 	
		if (a^.dato = x) then
			BuscarNodo:= a
		else
			if (x < a^.dato) then
				BuscarNodo:= BuscarNodo(a^.HI, x)
			else
				BuscarNodo:= BuscarNodo(a^.HD, x);	
end;

// Programa Principal

Var
	a, bus: Arbol;
	num, x: Integer;
	Exito: Boolean;
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
	writeln('Ingrese un valor a buscar');
	readln(x);
	if (a<>nil) then begin
		Exito:= Buscar(a, x);
		writeln(Exito);
	end;
	writeln('Ingrese un valor a buscar');
	readln(x);
	bus:= BuscarNodo(a, x);
	if (bus <> nil) then
		writeln('La operacion de busqueda se ha realizado con exito');
End.

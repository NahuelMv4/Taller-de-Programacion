Program Eliminar_Arbol;
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

Procedure EliminarNodo (var a: Arbol; num: integer; var Exito: boolean);
Var
	aux: arbol;
begin
	If (a = nil) then
		Exito:= false
	else begin
		If (a^.dato > num) then
			EliminarNodo (a^.HI, num, Exito)
		else
			If (a^.dato < num) then
				EliminarNodo (a^.HD, num, Exito)
			else begin
				Exito:= True;
				If (a^.HI = nil) then begin
					aux:= a;
					a:= a^.HD;
					Dispose (aux);
				end
				else
					If (a^.HD = nil) then begin
						aux:= a;
						a:= a^.HI;
						Dispose (aux);
					end
					else begin
						a^.dato:= Minimo (a^.HD);
						EliminarNodo (a^.HD, a^.dato, Exito);
					end;
			end;
	end;
end;

// Programa Principal

Var
	a: Arbol;
	num: Integer;
	Exito: Boolean;
Begin
	a:= nil;
	Exito:= False;
	writeln('Ingrese un numero para insertar:');
	readln(num);
	While (num <> Corte) do begin
		Agregar(a, num);
		writeln('Ingrese un numero para insertar:');
		readln(num);
	end;
	writeln('Impresion Ordenada');
	ImprimirArbolOrdenado(a); {Imprime el Arbol en orden ascendente}
	writeln('Ingrese un numero para eliminar: ');
	readln(num);
	if (a <> nil) then
		EliminarNodo(a, num, Exito);
	if (Exito) then
		writeln('La operacion de eliminar se ha realizado con exito')
	else
		writeln('La operacion de eliminar no se ha podido realizar');
	writeln('Impresion Ordenada');
	ImprimirArbolOrdenado(a);
End.

Program Final;
Const
	DimF = 5;
Type
	RangoV = 1..DimF;
	Rango = 1..50;
	
	Llamada = record
				Nivel: RangoV;
				Sector: Rango;
				Num: Integer;
			end;
			
	Lista = ^NodoLista;
	NodoLista = record
					Dato: Llamada;
					Sig: Lista;
				end;
				
	Vector = Array[RangoV] of Lista;

	Arbol = ^NodoArbol;
	NodoArbol = record
					HI: Arbol;
					HD: Arbol;
					Dato: Llamada;
				end;
				
Procedure CargarLlamada (Var l: Llamada);
Begin
	With l do begin
		Writeln('Ingrese el Nivel de Importancia del problema');
		Readln(Nivel);
		Writeln('Ingrese el Sector de la empresa');
		Readln(Sector);
		Writeln('Ingrese el Numero de empleados Afectados');
		Readln(Num);
	end;
End;

Procedure InicializarVector (Var v: Vector);
Var
	i: RangoV;
Begin
	For i:= 1 to DimF do 
		v[i]:= Nil;
End;

Procedure InsertarOrdenado (Var pri: Lista; l: Llamada);
Var
	ant, act, nue: Lista;
Begin
	New (nue);
	nue^.Dato:= l;
	act:= pri; 
	ant:= pri; 
	While (act <> Nil) and (act^.Dato.Sector < l.Sector) do begin 
		ant:= act; 
		act:= act^.Sig;
	end;
	If (ant = act) then 
		pri:= nue 
	Else 
		ant^.Sig:= nue; 
	nue^.Sig:= act;
End;

Procedure GenerarVector (Var v: Vector);
Var
	i: Integer;
	l: Llamada;
Begin
	For i:= 1 to 100 do begin
		CargarLlamada(l);
		InsertarOrdenado(v[l.Nivel], l);
	end;
End;

Procedure CargarArbol (Var a: Arbol; l: Llamada);
Begin
	If (a = Nil) then begin
		New(a);
		a^.Dato:= l;
		a^.HI:= Nil;
		a^.HD:= Nil;
	end
	Else 
		If (l.Num <= a^.Dato.Num) then
			CargarArbol(a^.HI, l)
		Else
			CargarArbol(a^.HD, l);
End;

Procedure GenerarArbol (v: Vector; N: RangoV; Var a: Arbol);
Begin
	While (v[N] <> Nil) do begin
		CargarArbol(a, v[N]^.Dato);
		v[N]:= v[N]^.Sig;
	end;
End;

Function Maximo (a: Arbol): Integer;
begin
	If (a^.HD = Nil) then
		Maximo:= a^.Dato.Sector
	Else
		Maximo:= Maximo(a^.HD);
end;

// Programa Principal

Var
	v: Vector;
	Nivel: RangoV;
	Sector: Rango;
	a: Arbol;
Begin
	a:= Nil;
	InicializarVector(v);
	GenerarVector(v);
	Writeln('Ingrese un Nivel de Importancia');
	Readln(Nivel);
	GenerarArbol(v, Nivel, a);
	If (a <> Nil) then begin
		Sector:= Maximo(a);
		Writeln('El Sector con mayor cantidad de empleados afectados es el Sector: ', Sector);
	end
	Else
		Writeln('No se encontro el Sector');
End.

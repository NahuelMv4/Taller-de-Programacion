Program Ordenacion_Seleccion;
Const
	DimF = 10;
Type
	Index = 0..DimF;
	Vector = array [1..DimF] of Integer;

Procedure CargarVector (var v: Vector; var DimL: Integer);
Var
	i: Index;
begin
	DimL:= 0;
	For i:= 1 to DimF do begin
		writeln('Ingrese un valor para la posicion: ' ,i);
		readln(v[i]);
		DimL:= DimL +1;
	end;
end;

Procedure OrdenarSeleccion (var v: Vector; DimL: Integer);
Var
	i, j, pos: Index;
	Item: Integer;
begin
	For i:= 1 to DimL - 1 do begin {Busco el minimo y lo guardo su posicion en Pos}
		pos:= i;
		For j:= i+1 to DimL do
			if (v[j] < v[pos]) then
				pos:= j;
		Item:= v[pos]; {Intercambio v[i] y v[pos]}
		v[pos]:= v[i];
		v[i]:= Item;
	end;
end;

Procedure ImprimirVector (v:vector; DimL:Integer);
Var
	i: Index;
begin
	For i:= 1 to DimF do 
		writeln('Para la posicion ' ,i, ' el vector vale: ' ,v[i]);
end;

// Programa Principal

Var
	v: Vector;
	DimL: Integer;
Begin
	CargarVector(v, DimL);
	OrdenarSeleccion(v, DimL);
	ImprimirVector(v, DimL);
End.

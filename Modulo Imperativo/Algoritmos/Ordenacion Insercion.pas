Program Ordenacion_Insercion;
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

Procedure OrdenarInsercion (var v: Vector; DimL: Integer);
Var
	i, j: Index;
	Act: Integer;
begin
	For i:= 2 to DimL do begin
		Act:= v[i]; {Me guardo el elemnto a insertar}
		j:= i-1;
		while (j > 0) and (v[j] > Act) do begin {Busco desde las posiciones anteriores donde deberia ir el elemento guardado}
			v[j+1]:= v[j];
			j:= j-1;
		end;
		v[j+1]:= Act;
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
	OrdenarInsercion(v, DimL);
	ImprimirVector(v, DimL);
End.

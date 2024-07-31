Program Busqueda_Dicotomica_Recursiva;
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
	i,j: Index;
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

Procedure BusquedaDicotomicaRecursiva (v: vector; pri, ult, num, pos: integer);
Var
	med: integer; 
begin
	If (pos <> 0) then begin      
		med:= (pri + ult) div 2;
		If (v[med] = num) then
			writeln('La operacion de busqueda se ha realizado con exito')
		else
			If (num < v[med]) then 
				BusquedaDicotomicaRecursiva(v, pri, med-1, num, pos-1)
            else
				BusquedaDicotomicaRecursiva(v, med+1, ult, num, pos+1);
    end
    else
      writeln('No se ha encontrado el numero');
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
	pri, ult, pos, num: Integer;
Begin
	CargarVector(v, DimL);
	writeln('-----------------Impresion del Vector-----------------');
	ImprimirVector(v, DimL);
	OrdenarInsercion(v, DimL);
	writeln('-----------------Impresion del Vector-----------------');
	ImprimirVector(v, DimL);
	ult:= DimL;
	pos:= DimL;
	pri:= 1;
	writeln('Ingrese un numero para buscar:');
	readln(num);
	BusquedaDicotomicaRecursiva(v, pri, ult, num, pos);
End.

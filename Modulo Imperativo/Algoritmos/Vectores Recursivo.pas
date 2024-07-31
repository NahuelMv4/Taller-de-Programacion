Program Vectores_Recursivo;
Const
	DimF = 10;
	Corte = 0;
Type
	Index = 0..DimF;
	Vector = array [1..DimF] of Integer;
	
Procedure CargarVector (var v: Vector; var DimL: Integer);
Var
	num: Integer;
begin
	DimL:= 0;
	writeln('Ingrese un valor a agregar:');
	readln(num);
	While (DimL < DimF) and (num <> Corte) do begin {Controlo si hay espacio}
		DimL:= DimL + 1; {Incremento la dimension logica}
		v[DimL]:= num; {Agrego el elemento}
		writeln('Ingrese un valor a agregar:');
		readln(num);
	end;
end;

Function Maximo(v:vector; dimL, max:integer):integer; // max esta inicializado en -1
Begin
  If (dimL = 0) then
     Maximo:= max
  Else begin
    If(v[dimL] > max)then
       max:= v[dimL];
    Maximo:= Maximo(v, dimL-1, max);
  End;
End;

Function Minimo(v:vector; dimL,min:integer):integer; // min esta inicializado en 9999
Begin
  If (dimL = 0) then
     Minimo:= min
  Else begin
    If(v[dimL] < min)then
       min:= v[dimL];
    Minimo:= Minimo(v, dimL-1, min);
  End;
End;

Function Promedio(v:vector; i: integer):real;
Begin
	If(i <= DimF)then
		Promedio:= v[i] / DimF + Promedio(v,i+1);
End;

Procedure ImprimirVector (v:vector; DimL:Integer);
Var
	i: Index;
begin
	For i:= 1 to DimF do 
		writeln('Para la posicion ' ,i, ' el vector vale: ' ,v[i]);
end;

Var
	v: vector;
	DimL, Max, Min: Integer;
	Prom: Real;
Begin
	Max:= -1;
	Min:= 9999;
	CargarVector(v, DimL);
	Prom:= Promedio(v, 1);
	Writeln('El Promedio es: ' , Prom);
	Writeln('El Minimo es: ' , Minimo(v, DimL, Min));
	Writeln('El Maximo es: ' , Maximo(v, DimL, Max));
	ImprimirVector(v, DimL);
End.




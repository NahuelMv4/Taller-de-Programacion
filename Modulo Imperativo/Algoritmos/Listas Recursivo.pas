Program Listas_Recursivo;
Const
	Corte = 0;

Type
	Lista = ^Nodo;
	Nodo = record
			dato: Integer;
			sig: Lista;
		end;

Procedure AgregarAdelante (var l: Lista; x: Integer);
Var
	Nue: Lista;
begin
	New(Nue); {Pido memoria dinamica}
	Nue^.dato:= x; {Guardo el elemento en nue}
	Nue^.sig:= l; {Engancho el siguiente de nue con l}
	l:= Nue; {L pasa a tomar el valor de nue}
end;

Procedure CargarLista (var l: lista);
Var
	x: Integer;
begin
	Writeln('Ingrese un numero');
	Readln(x);
	While (x <> Corte) do begin
		AgregarAdelante(l, x);
		Writeln('Ingrese un numero');
		Readln(x);
	end;
end;

Function Minimo(l:lista; min:integer):integer;  //min viene inicializado en 9999
Begin
  If(l = nil)then
     minimo := min
  Else begin
     If(l^.dato < min) then
        min := l^.dato;
     Minimo := Minimo(l^.sig,min);
  End;
End;

Function Maximo(l:lista; max:integer):integer;  //max viene inicializado en -1
Begin
  If(l = nil)then
     maximo := max
  Else begin
     If(l^.dato > max) then
        max := l^.dato;
     Maximo := Maximo(l^.sig,max);
  End;
End;

Function Buscar(l:lista; x:integer):boolean;
Begin
  If(l=nil)then
    Buscar:= false
  Else
    If(l^.dato = x)then
      Buscar:= true
    Else
      Buscar:= Buscar(l^.sig,x);
End;

Procedure ImprimirLista(l: Lista);
Begin
	If (l <> nil) then begin
		Writeln('El Valor es: ' , l^.dato);
		l:= l^.sig;
		ImprimirLista(l);
	End;
End;

Var
	l: Lista;
	Min, Max: Integer;
Begin
	Min:= 9999;
	Max:= -1;
	CargarLista(l);
	Writeln('El Minimo es: ' , Minimo(l, min));
	Writeln('El Maximo es: ' , Maximo(l, max));
	Writeln('La Busqueda salio: ' , Buscar(l, 5));
	ImprimirLista(l);
End.	

Program Lista01Ex9 ;
var
	numero:integer;
	contador:integer;
Begin
  writeln('Digite o n�mero da tabuada desejada');
  readln(numero);
  
  contador := 1;
  
  if (numero > 0) and (numero < 11) then
  	while (contador < 11) do
  		begin
  			writeln(numero * contador);
  			contador := contador + 1;
  		end
  else
  	writeln('O n�mero digitado deve ser entre 1 e 10');
  	
  readkey;
End.
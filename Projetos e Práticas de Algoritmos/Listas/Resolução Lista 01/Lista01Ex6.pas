Program Lista01Ex6 ;
var
	n1, n2: real;
	operador: char;
Begin
   writeln('Digite o N1 e o N2: ');
   readln(n1, n2);
   writeln('Digite o operador desejado (+, -, * ou /)');
   readln(operador);
   
   if operador = '+' then
   	writeln(n1 + n2)
   else begin
      if operador = '-' then
      	writeln(n1 - n2)
      else if operador = '*' then
      	writeln(n1 * n2)
      else if operador = '/' then
      	writeln(n1 / n2)
      else
      	writeln('O operador digitado n�o est� dispon�vel nesta aplica��o');
   end;
   
   readkey;
End.
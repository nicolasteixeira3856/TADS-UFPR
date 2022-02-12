Program Lista01Ex2 ;
var
cod_origem_produto: integer;
Begin
  writeln('Digite o código de produto');
  readln(cod_origem_produto);
  
  if cod_origem_produto = 1 then
    writeln('Sul')
  else begin
    if (cod_origem_produto > 1) and (cod_origem_produto < 5) then
			writeln('Norte')
		else if (cod_origem_produto > 4) and (cod_origem_produto < 10) then
			writeln('Sudeste')
		else if (cod_origem_produto > 9) and (cod_origem_produto < 14) then
			writeln('Norte')
		else
			writeln('Outra região'); 
  end;
  
  readkey;  
End.
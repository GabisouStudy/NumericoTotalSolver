function PrintVector(numero)
  [numeroLinhas,numeroColunas]=size(numero);
  
  for i=1:numeroLinhas
      for j=1:numeroColunas
          fprintf("%d\t",numero(i,j)); 
      endfor
      fprintf("\n");
  endfor
endfunction

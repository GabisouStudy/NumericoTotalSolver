function result = MultiplyFromLine(A, denomLinePos)
	[numeroLinhas,numeroColunas]=size(A);
	denomLine = A(denomLinePos,:);

	for numerLineID=denomLinePos+1:numeroLinhas
			numerLine = A(numerLineID,:);
			
			#Calculua multiplicador
			multiplier = numerLine(denomLinePos)/denomLine(denomLinePos);
			fprintf(	'Multiplier at line %d is m%d%d = %d/%d = %d\n',
						numerLineID, numerLineID, denomLinePos, numerLine(denomLinePos), denomLine(denomLinePos), multiplier);

			#Aplica multiplier na príxma linha
			numerLine -= denomLine * multiplier;
			A(numerLineID,:) = numerLine;
		endfor

	fprintf('\nMatrix A = \n');
	PrintVector(A);
	fprintf('\n');

	result = A;

endfunction
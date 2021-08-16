function result = MultiplyFromLine(A, denomLinePos)
	[numeroLinhas,numeroColunas]=size(A);
	denomLine = A(denomLinePos,:);

	for numerLinePos=denomLinePos+1:numeroLinhas
			numerLine = A(numerLinePos,:);
			
			#Calculua multiplicador
			multiplier = numerLine(denomLinePos)/denomLine(denomLinePos);
			fprintf(	'Multiplier at line %d is m%d%d = %d/%d = %d\n',
						numerLinePos, numerLinePos, denomLinePos, numerLine(denomLinePos), denomLine(denomLinePos), multiplier);
			fprintf('L%d <-- L%d - (%d)L%d\n\n', numerLinePos, numerLinePos, multiplier, denomLinePos);
			#Aplica multiplier na príxma linha
			numerLine -= denomLine * multiplier;
			A(numerLinePos,:) = numerLine;
		endfor

	fprintf('\nMatrix A = \n');
	PrintVector(A);
	fprintf('\n');

	result = A;

endfunction
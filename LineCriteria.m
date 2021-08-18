function LineCriteria(A)
	format short g
	#format rat
	[numeroLinhas,numeroColunas]=size(A);

	alphas = [];

	
	for currentLinePos=1:numeroLinhas
		fprintf('\n---------------------------------------------------------\nalpha%d = \n', currentLinePos);
		fprintf('\nNumerator:\t');
		
		numerator = 0;
		currentVariables = A(currentLinePos,:);

		for currentColumnPos=1:numeroColunas
			if(currentColumnPos != currentLinePos)
				numerator += abs(currentVariables(currentColumnPos));
				fprintf('|%d|', abs(currentVariables(currentColumnPos));

				if(currentColumnPos < numeroColunas)
					fprintf('+');
				endif
			endif
		endfor
		
		denominator = abs(currentVariables(currentLinePos));

		fprintf('\nDenominator:\t|%d|\n = \n', denominator);


		currentAlpha = numerator/denominator;
		alphas(currentLinePos) = currentAlpha;
		fprintf('alpha%d = %d/%d = %d\n', currentLinePos, numerator, denominator, numerator/denominator);

	endfor
	
	somaAlphas = sum(alphas);
	if(somaAlphas != 1)
		fprintf('\nThe Line Criteria was NOT met because the sum of the Alphas is %d != 1\n', somaAlphas);
	else
		fprintf('\nThe Line Criteria WAS met because the sum of the Alphas is %d == 1\n', somaAlphas);
	endif
endfunction
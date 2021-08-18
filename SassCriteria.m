function SassCriteria(A)
	format short g
	#format rat
	[numeroLinhas,numeroColunas]=size(A);

	betas = -inf * ones(1,numeroColunas);

	
	for currentLinePos=1:numeroLinhas
		fprintf('\n---------------------------------------------------------\nbeta%d = \n', currentLinePos);
		fprintf('\nNumerator:\t');
		
		numerator = 0;
		currentVariables = A(currentLinePos,:);

		for currentColumnPos=1:numeroColunas
			if(currentColumnPos != currentLinePos)
				currentValue = abs(currentVariables(currentColumnPos));
				if(betas(currentColumnPos) != -inf)
					currentValue = abs(currentVariables(currentColumnPos));
					fprintf('|%d * %d|', betas(currentColumnPos), currentValue);
					currentValue = abs(currentVariables(currentColumnPos) * betas(currentColumnPos));
				else
					fprintf('|%d|', currentValue);
				endif
				numerator += currentValue;

				if(currentColumnPos < numeroColunas)
					fprintf('+');
				endif
			endif
		endfor
		
		denominator = abs(currentVariables(currentLinePos));

		fprintf('\nDenominator:\t|%d|\n = \n', denominator);


		currentAlpha = numerator/denominator;
		betas(currentLinePos) = currentAlpha;
		fprintf('beta%d = %d/%d = %d\n', currentLinePos, numerator, denominator, numerator/denominator);

	endfor
	
	maxBeta = max(betas);
	if(maxBeta < 1)
		fprintf('\nThe Line Criteria WAS met because the sum of the max Beta is %d < 1\n', maxBeta);
	else
		fprintf('\nThe Line Criteria was NOT met because the max Beta is %d >= 1\n', maxBeta);
	endif
endfunction
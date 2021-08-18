function SeidelError(initials, outputs, stopValue)
	format short g

	[iterationsAmount,variablesAmount]=size(outputs);

	for currentIteration=1:iterationsAmount
		previousVariables = 0;
		if(currentIteration <= 1)
			previousVariables = initials;
		else
			previousVariables = outputs(currentIteration-1,:);
		endif

		currentVariables = outputs(currentIteration,:);

		fprintf('\n---------------------------------------------------------\n\nIteration %d:\n', currentIteration);

		fprintf('\nNumerator:\tmax(');
		for currentVarPos=1:variablesAmount
			fprintf('|%d - %d|', currentVariables(currentVarPos), previousVariables(currentVarPos));
			if(currentVarPos < variablesAmount)
			fprintf(',');
			endif
		endfor

		fprintf('\nNumerator:\tmax(');
		for currentVarPos=1:variablesAmount
			fprintf('|%d|', currentVariables(currentVarPos) - previousVariables(currentVarPos));
			if(currentVarPos < variablesAmount)
			fprintf(',');
			endif
		endfor
		
		fprintf(')\nDenominator:\tmax(');
		for currentVarPos=1:variablesAmount
			fprintf('|%d|', currentVariables(currentVarPos));
			if(currentVarPos < variablesAmount)
				fprintf(',');
			endif
		endfor

		variblesNumerator = abs(currentVariables - previousVariables);
		numerator = max(variblesNumerator);
		denominator = max(currentVariables);
		errorValue = numerator/denominator;
		fprintf(')\n = %d/%d = %d\n', numerator, denominator, errorValue);

		if(errorValue < stopValue)
			fprintf('\n=========================================================\n\nStop condition met: %d < %d\n', errorValue, stopValue);
			break;
		endif
	endfor

endfunction
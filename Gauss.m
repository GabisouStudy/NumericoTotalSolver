function Gauss(A)
	format short g
	[numeroLinhas,numeroColunas]=size(A);

	passo = 0;

	fprintf('Input Matrix A = \n');
	PrintVector(A);
	fprintf('\n');

	for currentLineID=1:numeroLinhas-1
		currentLine = A(currentLineID,:);
		fprintf('---------------------------------------------------------\nStep %d:\n', passo++);
		for nextLineID=currentLineID+1:numeroLinhas
			nextLine = A(nextLineID,:);
			
			#Calculua multiplicador
			multiplier = nextLine(currentLineID)/currentLine(currentLineID);
			fprintf(	'Multiplier at line %d is m%d%d = %d/%d = %d\n',
						nextLineID, nextLineID, currentLineID, nextLine(currentLineID), currentLine(currentLineID), multiplier);

			#Aplica multiplier na príxma linha
			nextLine -= currentLine * multiplier;
			A(nextLineID,:) = nextLine;
		endfor

		fprintf('\nMatrix A = \n');
		PrintVector(A);
		fprintf('\n');
	endfor

	fprintf('\n=========================================================\nFinal Matrix A =\n');
	PrintVector(A);
	fprintf('\n\n');
endfunction
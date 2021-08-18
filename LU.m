function LU(A)
	format short g
	#format rat
	[numeroLinhas,numeroColunas]=size(A);

	passo = 1;

	fprintf('Input Matrix A = \n');
	PrintVector(A);
	fprintf('\n');
	P = eye(numeroColunas);

	for currentLinePos=1:numeroLinhas-1
		fprintf('---------------------------------------------------------\nStep %d:\n', passo++);
		[A, P] = PivotingFromColumnP(A, currentLinePos, P);
		A = MultiplyFromLine(A, currentLinePos);
		
	endfor

	fprintf('\n=========================================================\nFinal Matrix A =\n');
	PrintVector(A);

	fprintf('\n=========================================================\nFinal Matrix P =\n');
	PrintVector(P);
	fprintf('\n\n');
endfunction
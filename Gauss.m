function Gauss(A)
	format short g
	[numeroLinhas,numeroColunas]=size(A);

	passo = 1;

	fprintf('Input Matrix A = \n');
	PrintVector(A);
	fprintf('\n');

	for currentLinePos=1:numeroLinhas-1
		fprintf('---------------------------------------------------------\nStep %d:\n', passo++);
		A = MultiplyFromLine(A, currentLinePos);
	endfor

	fprintf('\n=========================================================\nFinal Matrix A =\n');
	PrintVector(A);
	fprintf('\n\n');
endfunction
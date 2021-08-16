function GaussPivot(A)
	format short g
	[numeroLinhas,numeroColunas]=size(A);

	passo = 0;

	fprintf('Input Matrix A = \n');
	PrintVector(A);
	fprintf('\n');

	for currentLineID=1:numeroLinhas-1
		fprintf('---------------------------------------------------------\nStep %d:\n', passo++);
		A = MultiplyFromLine(A, currentLineID);
	endfor

	fprintf('\n=========================================================\nFinal Matrix A =\n');
	PrintVector(A);
	fprintf('\n\n');
endfunction
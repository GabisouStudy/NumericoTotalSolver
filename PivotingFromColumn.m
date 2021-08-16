function result = PivotingFromColumn(A, columnPos)
	[numeroLinhas,numeroColunas]=size(A);
	currentColumn = A(:,columnPos);
	#PrintVector(abs(currentColumn));
	#fprintf('\n');

	[maxInColumn, maxInColumnPos] = max(abs(currentColumn));
	if(maxInColumnPos != columnPos)
		fprintf('Pivoting the matrix in column %d is required.\n', columnPos);
		fprintf('%d is the maximum in column %d with position %d\n', maxInColumn, columnPos, maxInColumnPos);
		fprintf('\nPivoting: L%d <--> L%d\n', columnPos, maxInColumnPos);

		fprintf('\nPivoted Matrix A = \n');
		temp = A(columnPos,:);
		A(columnPos,:) = A(maxInColumnPos,:);
		A(maxInColumnPos,:) = temp;
		PrintVector(A);
		fprintf('\n');
		fprintf('.........................................................\n');
	endif

	result = A;
endfunction
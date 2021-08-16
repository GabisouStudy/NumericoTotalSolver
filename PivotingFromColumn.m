function result = PivotingFromColumn(A, columnPos)
	[numeroLinhas,numeroColunas]=size(A);
	currentColumn = A(:,columnPos);

	[maxInColumn, maxInColumnPos] = max(abs(currentColumn(columnPos:numeroLinhas)));

	realMaxInColumnPos = maxInColumnPos + columnPos - 1;

	if(realMaxInColumnPos != columnPos)
		fprintf('Pivoting the matrix in column %d is required.\n', columnPos);
		fprintf('%d is the maximum in column %d with position %d\n', maxInColumn, columnPos, realMaxInColumnPos);
		fprintf('\nPivoting: L%d <--> L%d\n', columnPos, realMaxInColumnPos);

		fprintf('\nPivoted Matrix A = \n');
		temp = A(columnPos,:);
		A(columnPos,:) = A(realMaxInColumnPos,:);
		A(realMaxInColumnPos,:) = temp;
		PrintVector(A);
		fprintf('\n');
		fprintf('.........................................................\n');
	endif

	result = A;
endfunction
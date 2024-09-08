function C = matmult(A, B)
%
% function C = matmult(A, B)
% matmult computes the product C = AB where A is a m×n matrix, and B is a 
% n×p matrix
%
% On Input: 
% -> A : m×n matrix
% -> B : n×p matrix
%
% On Output: 
% -> C : mxp matrix

% grab the dimensions of matrices A and B
[a_row, a_col] = size(A);
[b_row, b_col] = size(B);

% initialize a matrix with zeros
some_matrix = zeros(a_row, b_col);

function scalar = dot_product(vector1, vector2)
%
% function scalar = dot_product(vector1, vector2)
% dot_product is a nested function which computes the dot product between 
% two vectors
%
% On Input: 
% -> vector1 : an array
% -> vector2 : an array
%
% On Output: 
% -> scalar : a floating-point number

	initial_value = 0;
	for i = 1:length(vector1)
		initial_value = initial_value + vector1(i) * vector2(i);
	end

	scalar = initial_value;
	return
end

% check whether the dimensions of matrices A and B agree.
if a_col == b_row
    for row_i = 1:a_row
        for col_j = 1:b_col
            % fill the zero matrix with the values from the dot product
            some_matrix(row_i, col_j) = dot_product(A(row_i,:), B(:, col_j));
        end
    end
    
else
    error('Matrix dimensions must agree!')
end

C = some_matrix;
return

end


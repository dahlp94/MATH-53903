function [Q,R] = mgs(A)
% function [Q,R] = mgs(A)
%
% mgs is a modified Gram-Schmidt method that is used to compute the thin QR
% factorization. The algorithm is from the textbook (G&VL). We assume that matrix A 
% is of full rank i.e., rank(A) = n.
%
% On Input: Matrix A of dimension mxn.
%
% On Output: An orthogonal matrix Q and an upper triangular matrix R.
%

[m, n] = size(A);

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

for k = 1:n
    R(k,k) = (dot_product(A(1:m,k), A(1:m,k)))^0.5;
    if R(k,k) ~= 0
        Q(1:m, k) = A(1:m,k) / R(k,k);
        for j = k+1:n
            R(k,j) = Q(1:m, k)' * A(1:m, j);
            A(1:m, j) = A(1:m, j) - Q(1:m, k) * R(k,j);
        end
    else
        error('Division by zero!')
    end
    
end

return

end

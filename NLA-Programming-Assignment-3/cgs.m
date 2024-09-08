function [Q,R] = cgs(A)
% function [Q,R] = cgs(A)
%
% cgs is a classical Gram-Schmidt method that is used to compute the thin QR
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


R(1,1) = (dot_product(A(:,1), A(:,1)))^0.5;

if R(1,1) ~= 0
    Q(:,1) = A(:,1) / R(1,1);
else
    error('Division by zero!')
end

for k = 2:n
    R(1:k-1, k) = Q(1:m, 1:k-1)' * A(1:m, k);
    z = A(1:m, k) - Q(1:m, 1:k-1) * R(1:k-1,k);
    R(k, k) = (dot_product(z,z))^0.5;
    if R(k, k) ~= 0
        Q(1:m, k) = z / R(k,k);
    else
        error('Division by zero!')
    end
end


end
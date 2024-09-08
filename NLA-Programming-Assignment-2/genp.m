function A = genp(A)
% function A = genp(A)
%
% genp uses outer product to computer the LU factorization from the textbook.
% This algorithm overwrites a square matrix A and overwrites A to produce
% lower and upper triangular entries.
%
% On Input: a square array A.
%
% On Output: a square array A with triangular factors L and U where L and U
%            are lower and upper triangular arrays respectively.
%
    [n, ] = size(A);
    for k = 1:n-1
        if A(k, k) ~= 0
            A(k+1:n, k) = A(k+1:n, k) / A(k, k);

            for i = k+1:n
                for j = k+1:n
                    A(i, j) = A(i, j) - A(i, k)* A(k, j);
                end

            end
        else
            error('Entry in (%d,%d) position is zero.', k,k)
        end

    end

    return
end

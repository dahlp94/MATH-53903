function [A,u1] = houseqr(A)
% function [A,u1] = houseqr(A)
%
% houseqr implement the Householder QR factorization without
% explicitly forming Q. The algorithm is taken from the video lecture
% by Dr. Arnold.
%
% The 'torso' vectors will overwrite A in the strictly lower triangle
% and the 'head' scalars are stored in u1. R will be stored in the 
% upper triangle of A.
%
% On Input: random A with b = Ax + r, r orthogonal to ColSp(A).
%
% On Output: mxn matrix A and 1xn vector u1.
%

[m, n] = size(A);
p = min([m-1, n]);
u1 = zeros(1,p);

% the for loop begins here.
for k = 1:p
    subr = k:m;
    subc = k+1:n;
    x = A(subr, k);
    x1 = x(1);
    s = norm(x);
    
    % check for the sign
    if x1 < 0
        s = -s;
    end
    
    x(1) = x1 + s;
    u1(k) = x(1);
    b = 1 / (s * (s + x1));
    % most of the work is done here.
    A(subr, subc) = A(subr, subc) - x * (b * (x' * A(subr, subc)));
    A(k, k) = -s;
    
end

end
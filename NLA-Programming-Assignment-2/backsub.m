function [x] = backsub(U,y)
% function [x] = backsub(U,y)
%
% backsub uses column-oriented back substitution algorithm from the textbook.
% This algorithm overwrites y and assigns y to x.
%
% On Input: an upper triangular square array U and a column array y.
%
% On Output: a column array x which is the solution to the system Ux = y.
%
    [n, ] = size(U);
    if U(1,1) ~= 0
        for j = n:-1:2
            if U(j,j) ~= 0
                y(j) = y(j)/U(j,j);
                y(1:j-1) = y(1:j-1) - y(j)*U(1:j-1,j);
            else
                error('Entry in (%d,%d) position is zero.', j,j)
            end
        end

        y(1) = y(1)/U(1,1);
    else
        error('Entry in (1,1) position is zero.')
    end
    x = y;
    
    return
end
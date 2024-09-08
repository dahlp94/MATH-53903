function [y] = forsub(L,b)
% function [y] = forsub(L,b)
%
% forsub uses column-oriented forward substitution algorithm from the textbook.
% This algorithm overwrites b and assigns b to y.
%
% On Input: an lower triangular square array L and a column array b.
%
% On Output: a column array y which is the solution to the system Ly = b.
%
    [n, ] = size(L);
    if L(1,1) ~= 0
        b(1) = b(1) / L(1,1);
            for i = 2:n
                if L(i,i) ~= 0
                    b(i) = (b(i) - L(i,1:i-1) * b(1:i-1)) / L(i,i);
                else
                    error('Entry in (%d,%d) position is zero.', i,i)
                end
            end
    else
        error('Entry in (1,1) position is zero.')
    end
    y = b;
    
    return
end
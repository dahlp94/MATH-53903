function y = houseqtact(Qu,u1,b)
% function y = houseqtact(Qu,u1,b)
%
% houseqtact computes Q transpose times b, given the 'decapitated' 
% u1, . . . , un stored in the strictly lower triangle 
% of Qu and their 'heads' in u1. The algorithm is taken from the 
% video lecture by Dr. Arnold.
%
% On Input: overwritten A as the array Qu and u1 from houseqr, and 
% a column array b.
%
% On Output: Q transpose times b as y.
%
[m,n] = size(Qu);
p = min([m-1, n]);

for k = 1:p
    u = [u1(k); Qu(k+1:m, k)];
    b(k:m) = b(k:m) - ((2/(u'*u)) * (u' * b(k:m))) * u;
end

y = b;
return

end
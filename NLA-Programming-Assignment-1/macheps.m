function eps = macheps
%
% function eps = macheps
%
% eps is defined to be the smallest positive float that satisfies
%
%             fl(1 + eps) > 1,
%
% No input data needed.
%
% On Output: 
% -> eps : the smallest positive float
%

first_value = 1;
next_value = first_value + 1;

while next_value > 1
    % bisects the first_value and adds it to the next_value until
    % the condition is satisfied
    first_value = first_value / 2;
    next_value = first_value + 1;
end

% next_value is less than or equal to 1 and exits the condition above
% first_value is the smallest positive float
eps = first_value;

return;

end

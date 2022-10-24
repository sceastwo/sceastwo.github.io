function [dir_2] = opposite2(dir_1)
%OPPOSITE2 Summary of this function goes here
% 2D axes:
%   1 = -u 
%   2 = +u 
%   3 = -v 
%   4 = +v 
%   5 = through

    if (dir_1 == 1)
        dir_2 = 2;
    elseif (dir_1 == 2)
        dir_2 = 1;
    elseif (dir_1 == 3)
        dir_2 = 4; 
    elseif (dir_1 == 4) 
        dir_2 = 3; 
    else
        dir_2 = 5;
    end
end


function [dir_2] = opposite3(dir_1)
%OPPOSITE3 Summary of this function goes here
% direction:
%   1 = -x 
%   2 = +x 
%   3 = -y 
%   4 = +y 
%   5 = -z 
%   6 = +z 
%   7 = center

    if (dir_1 == 1)
        dir_2 = 2;
    elseif (dir_1 == 2)
        dir_2 = 1;
    elseif (dir_1 == 3)
        dir_2 = 4; 
    elseif (dir_1 == 4)
        dir_2 = 3; 
    elseif (dir_1 == 5)
        dir_2 = 6; 
    elseif (dir_1 == 6)
        dir_2 = 5;
    else
        dir_2 = 7;
    end

end


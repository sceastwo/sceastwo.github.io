function [neighbor_list] = get_neighbors(i)
%GET_NEIGHBORS Summary of this function goes here
%   1 = -x 
%   2 = +x 
%   3 = -y 
%   4 = +y 
%   5 = -z 
%   6 = +z 
%   7 = center

    neighbor_list = [];
    if (i == 1) 
        neighbor_list = [3;4;5;6;2;7];
    elseif (i == 2)
        neighbor_list = [3;4;5;6;1;7];
    elseif (i == 3) 
        neighbor_list = [1;2;5;6;4;7];
    elseif (i == 4) 
        neighbor_list = [1;2;5;6;3;7];
    elseif (i == 5) 
        neighbor_list = [1;2;3;4;6;7];
    elseif (i == 6) 
        neighbor_list = [1;2;3;4;5;7];
    end
end


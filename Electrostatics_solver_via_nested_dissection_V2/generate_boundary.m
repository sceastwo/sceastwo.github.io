function [coordinate_array] = generate_boundary(depth)
%GENERATE_BOUNDARY Summary of this function goes here
%   depth >= 2

    coordinate_array = zeros(6 * 2.^(2*depth) - 12 * 2.^depth + 8,3);

end


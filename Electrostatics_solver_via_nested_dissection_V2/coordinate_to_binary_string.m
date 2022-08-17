function [the_binary_string] = coordinate_to_binary_string(depth,x,y,z)
%COORDINATE_TO_BINARY_STRING 
% the returned array will use the "big endian" format.  
    the_binary_string = zeros(1, 3*depth);

    for i = 1:depth
        the_binary_string(3*(depth - i) + 1) = mod(x,2); 
        x = floor(x/2);
    end
    
    for i = 1:depth
        the_binary_string(3*(depth - i) + 2) = mod(y,2); 
        y = floor(y/2);
    end 
    
    for i = 1:depth
        the_binary_string(3*(depth - i) + 3) = mod(z,2); 
        z = floor(z/2);
    end 
end


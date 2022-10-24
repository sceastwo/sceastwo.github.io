function edges_matrix = generate_edges()
%GENERATE_EDGES Summary of this function goes here 
%   1 = -x 
%   2 = +x 
%   3 = -y 
%   4 = +y 
%   5 = -z 
%   6 = +z 
%   7 = center
    edges_matrix = ...
        [1,3;
         1,4;
         1,5;
         1,6;

         2,3;
         2,4;
         2,5;
         2,6;

         3,5;
         3,6;
         4,5;
         4,6;

         1,2;
         3,4;
         5,6;

         1,7;
         2,7;
         3,7;
         4,7;
         5,7;
         6,7];
end


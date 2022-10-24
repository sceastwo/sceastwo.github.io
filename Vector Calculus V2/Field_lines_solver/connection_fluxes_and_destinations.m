function [matrix_A,matrix_B,matrix_C] = connection_fluxes_and_destinations(inwards_flux_vector)
%CONNECTION_FLUXES_AND_DESTINATIONS Summary of this function goes here
%   inwards_flux_vector(1) = -x flux 
%   inwards_flux_vector(2) = +x flux 
%   inwards_flux_vector(3) = -y flux 
%   inwards_flux_vector(4) = +y flux 
%   inwards_flux_vector(5) = -z flux 
%   inwards_flux_vector(6) = +z flux 
%   inwards_flux_vector(7) = center (the divergence)
% 3D direction:
%   1 = -x 
%   2 = +x 
%   3 = -y 
%   4 = +y 
%   5 = -z 
%   6 = +z 
%   7 = center
% 2D axes:
%   1 = -u 
%   2 = +u 
%   3 = -v 
%   4 = +v 
%   5 = through
%   6 = center
%   
%   matrix_A(i,j) = the jth direction from inwards direction i
%   matrix_B(i,j) = the flow into the jth direction from inwards direction i 
%   matrix_C(i,j) = the index of inwards direction i from inwards direction matrix_A(i,j)

    matrix_A = ... 
        [3, 4, 5, 6, 2, 7; 
         3, 4, 5, 6, 1, 7; 
         1, 2, 5, 6, 4, 7; 
         1, 2, 5, 6, 3, 7;
         1, 2, 3, 4, 6, 7;
         1, 2, 3, 4, 5, 7];

    temp_inwards_flux_vector = inwards_flux_vector; 
    temp_inwards_flux_vector(7) = -sum(inwards_flux_vector(1:6));

    flow_matrix = zeros(7,7); 
    edges = generate_edges();

    for k = 1:size(edges,1)
        n_1 = edges(k,1);
        n_2 = edges(k,2);
        flow = 0;
        if (temp_inwards_flux_vector(n_1) > 0)
            if (temp_inwards_flux_vector(n_2) < 0)
                flow = min(temp_inwards_flux_vector(n_1),-temp_inwards_flux_vector(n_2));
            end
        elseif (temp_inwards_flux_vector(n_1) < 0)
            if (temp_inwards_flux_vector(n_2) > 0)
                flow = -min(-temp_inwards_flux_vector(n_1),temp_inwards_flux_vector(n_2));
            end
        end
        flow_matrix(n_1,n_2) = flow; 
        flow_matrix(n_2,n_1) = -flow;
        temp_inwards_flux_vector(n_1) = temp_inwards_flux_vector(n_1) - flow;
        temp_inwards_flux_vector(n_2) = temp_inwards_flux_vector(n_2) + flow;
    end 

    matrix_B = zeros(6,6); 
    for i = 1:6
        for j = 1:6 
            matrix_B(i,j) = flow_matrix(i,matrix_A(i,j));
        end
    end

    matrix_C = zeros(6,5); 
    for i = 1:6
        for j = 1:5 
            for k = 1:5 
                if (matrix_A(matrix_A(i,j),k) == i)
                    matrix_C(i,j) = k; 
                    break;
                end
            end
        end
    end

end







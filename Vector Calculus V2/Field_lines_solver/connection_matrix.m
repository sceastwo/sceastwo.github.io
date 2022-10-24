function [the_matrix] = connection_matrix(inwards_flux_vector)
%CONNECTION_MATRIX 
%   inwards_flux_vector(1) = -x flux 
%   inwards_flux_vector(2) = +x flux 
%   inwards_flux_vector(3) = -y flux 
%   inwards_flux_vector(4) = +y flux 
%   inwards_flux_vector(5) = -z flux 
%   inwards_flux_vector(6) = +z flux 
%   inwards_flux_vector(7) = center (the divergence)
    temp_inwards_flux_vector = inwards_flux_vector; 
    temp_inwards_flux_vector(7) = -sum(inwards_flux_vector(1:6));

    the_matrix = zeros(7,7); 
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
        the_matrix(n_1,n_2) = flow; 
        the_matrix(n_2,n_1) = -flow;
        temp_inwards_flux_vector(n_1) = temp_inwards_flux_vector(n_1) - flow;
        temp_inwards_flux_vector(n_2) = temp_inwards_flux_vector(n_2) + flow;
    end

end





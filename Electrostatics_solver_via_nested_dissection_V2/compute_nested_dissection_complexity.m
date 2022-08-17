function [num_of_flops] = compute_nested_dissection_complexity(height)
%COMPUTE_NESTED_DISSECTION_COMPLEXITY 
%   
    num_of_flops = 0;

    if (height < 2) 
        return;
    end

    % Split #1
    S_0 = 0; 
    S_Delta = 2^(2*height); 

    num_of_flops = num_of_flops + 1 * (S_Delta * (S_0 + S_Delta)^2 + (1/3) * (2*S_0 + S_Delta)^3 - (8/3) * S_0^3);

    % Split #2
    S_0 = (1/2) * 2^(2*height); 
    S_Delta = (1/2) * 2^(2*height); 

    num_of_flops = num_of_flops + 2 * (S_Delta * (S_0 + S_Delta)^2 + (1/3) * (2*S_0 + S_Delta)^3 - (8/3) * S_0^3);

    % Split #3
    S_0 = (1/2) * 2^(2*height); 
    S_Delta = (1/4) * 2^(2*height); 

    num_of_flops = num_of_flops + 4 * (S_Delta * (S_0 + S_Delta)^2 + (1/3) * (2*S_0 + S_Delta)^3 - (8/3) * S_0^3);

    multiplicity = 8;
    for i = (height-1):(-1):2 

        % Split #1
        S_0 = 3 * 2^(2*i); 
        S_Delta = 2^(2*i); 

        num_of_flops = num_of_flops + 1 * multiplicity * (S_Delta * (S_0 + S_Delta)^2 + (1/3) * (2*S_0 + S_Delta)^3 - (8/3) * S_0^3);

        % Split #2
        S_0 = 2 * 2^(2*i); 
        S_Delta = (1/2) * 2^(2*i); 

        num_of_flops = num_of_flops + 2 * multiplicity * (S_Delta * (S_0 + S_Delta)^2 + (1/3) * (2*S_0 + S_Delta)^3 - (8/3) * S_0^3);

        % Split #3
        S_0 = (5/4) * 2^(2*i); 
        S_Delta = (1/4) * 2^(2*i); 

        num_of_flops = num_of_flops + 4 * multiplicity * (S_Delta * (S_0 + S_Delta)^2 + (1/3) * (2*S_0 + S_Delta)^3 - (8/3) * S_0^3);
        

        multiplicity = 8 * multiplicity;
    end

end







function [dir_out,u_out,v_out] = next(inwards_flux_vector,dir_in,u_in,v_in)
%NEXT Summary of this function goes here
% direction:
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


    [matrix_A,matrix_B,matrix_C] = connection_fluxes_and_destinations(inwards_flux_vector);
    curr_w = inwards_flux_vector(dir_in);
    curr_u = u_in; 
    curr_v = v_in; 
    separation_flag = 0;
    forwards_2D_dir = 1;

    while forwards_2D_dir <= 5
        [curr_w, curr_u, curr_v, separation_flag] = merge(curr_w,curr_u,curr_v,forwards_2D_dir,-matrix_B(dir_in,forwards_2D_dir));
        if (separation_flag == 1)
            dir_out = matrix_A(dir_in,forwards_2D_dir);
            back_2D_dir = matrix_C(dir_in,forwards_2D_dir);
            break;
        else
            forwards_2D_dir = forwards_2D_dir + 1;
        end
    end
    if (separation_flag == 0)
        dir_out = 7; %The path ends
        u_out = 0; 
        v_out = 0; 
        return;
    end 

    existing_weight = 0.0;
    for i = 6:(-1):(back_2D_dir + 1)
        existing_weight = existing_weight - matrix_B(dir_out,i);
    end
    [curr_u, curr_v] = twist(curr_u, curr_v, dir_in, dir_out);
    [curr_w, curr_u, curr_v, separation_flag] = ...
        merge(-matrix_B(dir_out,back_2D_dir),curr_u,curr_v,opposite2(back_2D_dir),existing_weight);
    for i = (back_2D_dir-1):(-1):1
        [curr_w, curr_u, curr_v, separation_flag] = ...
            merge(curr_w,curr_u,curr_v,i,-matrix_B(dir_out,i));
    end

    u_out = curr_u; 
    v_out = curr_v;
end






function [the_field_line_x_vals, the_field_line_y_vals, the_field_line_z_vals] = trace_field_line(N_x, N_y, N_z, X_vals, Y_vals, Z_vals, F_x, F_y, F_z, start_dir, start_i, start_j, start_k, start_u, start_v)
%%TRACE_FIELD_LINE Summary of this function goes here
% returns a field line/curve randomly from a vector field. 
% X_vals is (N_x + 2) x 1
% Y_vals is (N_y + 2) x 1 
% Z_vals is (N_z + 2) x 1
% F_x is (N_x + 1) x N_y x N_z 
% F_y is N_x x (N_y + 1) x N_z 
% F_z is N_x x N_y x (N_z + 1) 
% 1 <= start_i <= N_x + 1 
% 1 <= start_j <= N_y + 1 
% 1 <= start_k <= N_z + 1 
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
%%   


    d_x = diff(X_vals,1,1);
    d_y = diff(Y_vals,1,2);
    d_z = diff(Z_vals,1,3); 
    
    curr_i = start_i;
    curr_j = start_j;
    curr_k = start_k;
    curr_dir = start_dir;
    curr_u = start_u; 
    curr_v = start_v; 

    % (i,j,k,polarity)
    the_field_line_x_vals = [];
    the_field_line_y_vals = [];
    the_field_line_z_vals = [];

    while (curr_dir ~= 7)
        point_i = 1;
        point_j = 1;
        point_k = 1;
        if (curr_dir == 1)
            if (curr_i == 1)
                break;
            end
            point_i = curr_i;
            point_j = curr_j + 1;
            point_k = curr_k + 1;
        elseif (curr_dir == 2) 
            if (curr_i == N_x+1)
                break;
            end
            point_i = curr_i + 1;
            point_j = curr_j + 1;
            point_k = curr_k + 1;
        elseif (curr_dir == 3) 
            if (curr_j == 1)
                break;
            end
            point_i = curr_i + 1;
            point_j = curr_j;
            point_k = curr_k + 1;
        elseif (curr_dir == 4) 
            if (curr_j == N_y+1)
                break;
            end
            point_i = curr_i + 1; 
            point_j = curr_j + 1; 
            point_k = curr_k + 1; 
        elseif (curr_dir == 5) 
            if (curr_k == 1)
                break;
            end
            point_i = curr_i + 1;
            point_j = curr_j + 1;
            point_k = curr_k;
        elseif (curr_dir == 6)
            if (curr_k == N_z+1)
                break;
            end
            point_i = curr_i + 1; 
            point_j = curr_j + 1; 
            point_k = curr_k + 1; 
        else
            break;
        end
        
        the_field_line_x_vals = [the_field_line_x_vals, X_vals(point_i)]; 
        the_field_line_y_vals = [the_field_line_y_vals, Y_vals(point_j)];
        the_field_line_z_vals = [the_field_line_z_vals, Z_vals(point_k)];

        input_flux_vector = [F_x(point_i-1,point_j-1,point_k-1); -F_x(point_i,point_j-1,point_k-1); 
                             F_y(point_i-1,point_j-1,point_k-1); -F_y(point_i-1,point_j,point_k-1); 
                             F_z(point_i-1,point_j-1,point_k-1); -F_z(point_i-1,point_j-1,point_k)];
        
        [next_dir, curr_u, curr_v] = next(inwards_flux_vector,curr_dir,curr_u,curr_v);
        if (curr_dir == 1)
            
        elseif (curr_dir == 2) 
            
        elseif (curr_dir == 3) 
            
        elseif (curr_dir == 4)
            
        elseif (curr_dir == 5)
            
        elseif (curr_dir == 6)
            
        else
            
        end
    end
 
end


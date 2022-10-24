function [the_field_line_x_vals, the_field_line_y_vals, the_field_line_z_vals] = field_line_plotter(N_x, N_y, N_z, X_vals, Y_vals, Z_vals, F_x, F_y, F_z, start_i, start_j, start_k)
%% field_line_plotter 
% returns a field line/curve randomly from a vector field. 
% X_vals is (N_x + 2) x 1
% Y_vals is (N_y + 2) x 1 
% Z_vals is (N_z + 2) x 1
% F_x is (N_x + 1) x N_y x N_z 
% F_y is N_x x (N_y + 1) x N_z 
% F_z is N_x x N_y x (N_z + 1) 
% 1 <= start_i <= N_x 
% 1 <= start_j <= N_y 
% 1 <= start_k <= N_z 
%%   


    d_x = diff(X_vals,1,1);
    d_y = diff(Y_vals,1,2);
    d_z = diff(Z_vals,1,3); 
    
    curr_i = start_i;
    curr_j = start_j;
    curr_k = start_k;

    % (i,j,k,polarity)
    the_field_line_x_locations = [X_vals(curr_i+1)];
    the_field_line_y_locations = [Y_vals(curr_j+1)];




end


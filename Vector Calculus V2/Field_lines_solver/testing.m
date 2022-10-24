clear;
clc;

% w_old = 1.0;
% u_old = 0.3; 
% v_old = 0.8;
% dir = 5;
% w_delta = -0.1;
% 
% [w_new,u_new,v_new,separation_flag] = merge(w_old,u_old,v_old,dir,w_delta)





inwards_flux_vector = [4.0, -4.0, 2.0, -2.0, -3.0, 3.0];
[matrix_A,matrix_B,matrix_C] = connection_fluxes_and_destinations(inwards_flux_vector)
dir_in = 1;
u_in = 0.5; 
v_in = 0.5; 

[dir_out,u_out,v_out] = next(inwards_flux_vector, dir_in, u_in, v_in)






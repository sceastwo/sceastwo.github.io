

'Input file 2'  


%%%%%%%%%%%%%%%%%% NODES 

num_of_g_nodes = 1;
num_of_nodes = 1; 


g_nodes(1) = struct('x', 0.0, 'y', 0.0, 'z', 0.0);

nodes(1) = struct('x', 1.0, 'y', 0.0, 'z', 0.0, 'F_x', 50.0, 'F_y', 50.0, 'F_z', 0.0);



%%%%%%%%%%%%%%%%%% BEAMS 

num_of_g_beams = 1;
num_of_beams = 0; 


g_beams(1) = struct('start', 1, 'end', 1, 't', 1.0, 'k_par', 1000, 'k_perp', 1000, 'break_par', 0.1, 'break_perp', 0.1);













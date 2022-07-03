

'Input file'  


%%%%%%%%%%%%%%%%%% NODES 

num_of_g_nodes = 4;
num_of_nodes = 4; 


g_nodes(1) = struct('x', 0.0, 'y', 0.0, 'z', 0.0);
g_nodes(2) = struct('x', 1.0, 'y', 0.0, 'z', 0.0);
g_nodes(3) = struct('x', 0.0, 'y', 1.0, 'z', 0.0);
g_nodes(4) = struct('x', 1.0, 'y', 1.0, 'z', 0.0);

nodes(1) = struct('x', 0.0, 'y', 0.0, 'z', 1.0, 'F_x', 0.0, 'F_y', 0.0, 'F_z' , 0.0);
nodes(2) = struct('x', 1.0, 'y', 0.0, 'z', 1.0, 'F_x', 0.0, 'F_y', 0.0, 'F_z' , 0.0);
nodes(3) = struct('x', 0.0, 'y', 1.0, 'z', 1.0, 'F_x', 0.0, 'F_y', 0.0, 'F_z' , 0.0);
nodes(4) = struct('x', 1.0, 'y', 1.0, 'z', 1.0, 'F_x', 100.0, 'F_y', 0.0, 'F_z' , 0.0);



%%%%%%%%%%%%%%%%%% BEAMS 

num_of_g_beams = 4;
num_of_beams = 4; 


g_beams(1) = struct('start', 1, 'end', 1, 't', 1.0, 'k_par', 1000, 'k_perp', 500, 'break_par', 0.1, 'break_perp', 0.1);
g_beams(2) = struct('start', 2, 'end', 2, 't', 1.0, 'k_par', 1000, 'k_perp', 500, 'break_par', 0.1, 'break_perp', 0.1);
g_beams(3) = struct('start', 3, 'end', 3, 't', 1.0, 'k_par', 1000, 'k_perp', 500, 'break_par', 0.1, 'break_perp', 0.1);
g_beams(4) = struct('start', 4, 'end', 4, 't', 1.0, 'k_par', 1000, 'k_perp', 500, 'break_par', 0.1, 'break_perp', 0.1);

beams(1) = struct('start', 1, 'end', 2, 't', 1.0, 'k_par', 1000, 'k_perp', 500, 'break_par', 0.1, 'break_perp', 0.1);
beams(2) = struct('start', 1, 'end', 3, 't', 1.0, 'k_par', 1000, 'k_perp', 500, 'break_par', 0.1, 'break_perp', 0.1);
beams(3) = struct('start', 2, 'end', 4, 't', 1.0, 'k_par', 1000, 'k_perp', 500, 'break_par', 0.1, 'break_perp', 0.1);
beams(4) = struct('start', 3, 'end', 4, 't', 1.0, 'k_par', 1000, 'k_perp', 500, 'break_par', 0.1, 'break_perp', 0.1);








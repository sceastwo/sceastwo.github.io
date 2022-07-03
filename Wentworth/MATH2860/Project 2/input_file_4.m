

'Square'  


%%%%%%%%%%%%%%%%%% NODES 

num_of_g_nodes = 1;
num_of_nodes = 3; 


g_nodes(1) = struct('name', 'origin', 'x', 0.0, 'y', 0.0, 'z', 0.0);

nodes(1) = struct('name', 'node 1', 'x', 1.0, 'y', 0.0, 'z', 0.0, 'F_x', 0.0, 'F_y', 1.0, 'F_z', 0.0, 'tau_x', 0.0, 'tau_y', 0.0, 'tau_z', 0.0);
nodes(2) = struct('name', 'node 2', 'x', 0.0, 'y', 1.0, 'z', 0.0, 'F_x', 0.0, 'F_y', 0.0, 'F_z', 0.0, 'tau_x', 0.0, 'tau_y', 0.0, 'tau_z', 0.0);
nodes(3) = struct('name', 'node 3', 'x', 1.0, 'y', 1.0, 'z', 0.0, 'F_x', 0.0, 'F_y', 0.0, 'F_z', 0.0, 'tau_x', 0.0, 'tau_y', 0.0, 'tau_z', 0.0);


%%%%%%%%%%%%%%%%%% BEAMS 

num_of_beams = 4; 

beams(1) = struct('start', 'origin', 'end', 'node 1', 't', 1.0);
beams(2) = struct('start', 'origin', 'end', 'node 2', 't', 1.0);
beams(3) = struct('start', 'node 1', 'end', 'node 3', 't', 1.0);
beams(4) = struct('start', 'node 2', 'end', 'node 3', 't', 1.0);












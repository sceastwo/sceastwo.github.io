

'Chain'  


%%%%%%%%%%%%%%%%%% NODES 

num_of_g_nodes = 1;
num_of_nodes = 15; 


g_nodes(1) = struct('name', 'origin', 'x', 0.0, 'y', 0.0, 'z', 0.0);

nodes(1) = struct('name', 'node 1', 'x', 1.0, 'y', 0.0, 'z', 0.0, 'F_x', 0.0, 'F_y', 0.0, 'F_z', 0.0, 'tau_x', 0.0, 'tau_y', 0.0, 'tau_z', 0.0);
nodes(2) = struct('name', 'node 2', 'x', 2.0, 'y', 0.0, 'z', 0.0, 'F_x', 0.0, 'F_y', 0.0, 'F_z', 0.0, 'tau_x', 0.0, 'tau_y', 0.0, 'tau_z', 0.0);
nodes(3) = struct('name', 'node 3', 'x', 3.0, 'y', 0.0, 'z', 0.0, 'F_x', 0.0, 'F_y', 0.0, 'F_z', 0.0, 'tau_x', 0.0, 'tau_y', 0.0, 'tau_z', 0.0);
nodes(4) = struct('name', 'node 4', 'x', 4.0, 'y', 0.0, 'z', 0.0, 'F_x', 0.0, 'F_y', 0.0, 'F_z', 0.0, 'tau_x', 0.0, 'tau_y', 0.0, 'tau_z', 0.0);
nodes(5) = struct('name', 'node 5', 'x', 5.0, 'y', 0.0, 'z', 0.0, 'F_x', 0.0, 'F_y', 0.0, 'F_z', 0.0, 'tau_x', 0.0, 'tau_y', 0.0, 'tau_z', 0.0);
nodes(6) = struct('name', 'node 6', 'x', 6.0, 'y', 0.0, 'z', 0.0, 'F_x', 0.0, 'F_y', 0.0, 'F_z', 0.0, 'tau_x', 0.0, 'tau_y', 0.0, 'tau_z', 0.0);
nodes(7) = struct('name', 'node 7', 'x', 7.0, 'y', 0.0, 'z', 0.0, 'F_x', 0.0, 'F_y', 0.0, 'F_z', 0.0, 'tau_x', 0.0, 'tau_y', 0.0, 'tau_z', 0.0);
nodes(8) = struct('name', 'node 8', 'x', 8.0, 'y', 0.0, 'z', 0.0, 'F_x', 0.0, 'F_y', 0.0, 'F_z', 0.0, 'tau_x', 0.0, 'tau_y', 0.0, 'tau_z', 0.0);
nodes(9) = struct('name', 'node 9', 'x', 9.0, 'y', 0.0, 'z', 0.0, 'F_x', 0.0, 'F_y', 0.0, 'F_z', 0.0, 'tau_x', 0.0, 'tau_y', 0.0, 'tau_z', 0.0);
nodes(10) = struct('name', 'node 10', 'x', 10.0, 'y', 0.0, 'z', 0.0, 'F_x', 0.0, 'F_y', 0.0, 'F_z', 0.0, 'tau_x', 0.0, 'tau_y', 0.0, 'tau_z', 0.0);
nodes(11) = struct('name', 'node 11', 'x', 11.0, 'y', 0.0, 'z', 0.0, 'F_x', 0.0, 'F_y', 0.0, 'F_z', 0.0, 'tau_x', 0.0, 'tau_y', 0.0, 'tau_z', 0.0);
nodes(12) = struct('name', 'node 12', 'x', 12.0, 'y', 0.0, 'z', 0.0, 'F_x', 0.0, 'F_y', 0.0, 'F_z', 0.0, 'tau_x', 0.0, 'tau_y', 0.0, 'tau_z', 0.0);
nodes(13) = struct('name', 'node 13', 'x', 13.0, 'y', 0.0, 'z', 0.0, 'F_x', 0.0, 'F_y', 0.0, 'F_z', 0.0, 'tau_x', 0.0, 'tau_y', 0.0, 'tau_z', 0.0);
nodes(14) = struct('name', 'node 14', 'x', 14.0, 'y', 0.0, 'z', 0.0, 'F_x', 0.0, 'F_y', 0.0, 'F_z', 0.0, 'tau_x', 0.0, 'tau_y', 0.0, 'tau_z', 0.0);
nodes(15) = struct('name', 'node 15', 'x', 15.0, 'y', 0.0, 'z', 0.0, 'F_x', 0.0, 'F_y', 0.1, 'F_z', 0.0, 'tau_x', 0.0, 'tau_y', 0.0, 'tau_z', 0.0);


%%%%%%%%%%%%%%%%%% BEAMS 

num_of_beams = 15; 

beams(1) = struct('start', 'origin', 'end', 'node 1', 't', 1.0);
beams(2) = struct('start', 'node 1', 'end', 'node 2', 't', 1.0);
beams(3) = struct('start', 'node 2', 'end', 'node 3', 't', 1.0);
beams(4) = struct('start', 'node 3', 'end', 'node 4', 't', 1.0);
beams(5) = struct('start', 'node 4', 'end', 'node 5', 't', 1.0);
beams(6) = struct('start', 'node 5', 'end', 'node 6', 't', 1.0);
beams(7) = struct('start', 'node 6', 'end', 'node 7', 't', 1.0);
beams(8) = struct('start', 'node 7', 'end', 'node 8', 't', 1.0);
beams(9) = struct('start', 'node 8', 'end', 'node 9', 't', 1.0);
beams(10) = struct('start', 'node 9', 'end', 'node 10', 't', 1.0);
beams(11) = struct('start', 'node 10', 'end', 'node 11', 't', 1.0);
beams(12) = struct('start', 'node 11', 'end', 'node 12', 't', 1.0);
beams(13) = struct('start', 'node 12', 'end', 'node 13', 't', 1.0);
beams(14) = struct('start', 'node 13', 'end', 'node 14', 't', 1.0);
beams(15) = struct('start', 'node 14', 'end', 'node 15', 't', 1.0);










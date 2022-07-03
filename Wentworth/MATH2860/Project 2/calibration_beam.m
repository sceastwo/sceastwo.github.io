

'calibration beam'


%%%%%%%%%%%%%%%%%% NODES 

num_of_g_nodes = 1;
num_of_nodes = 25; 


g_nodes(1) = struct('name', 'anchor', 'x', 0.0, 'y', 0.0, 'z', 0.0);

nodes(1) = struct('name', 'node 1', 'x', 1.0, 'y', 0.0, 'z', 0.0, 'F_x', 0.0, 'F_y', 0.0, 'F_z', 0.0, 'tau_x', 0.0, 'tau_y', 0.0, 'tau_z', 0.0);
nodes(2) = struct('name', 'node 2', 'x', 2.0, 'y', 0.0, 'z', 0.0, 'F_x', 0.0, 'F_y', 0.0, 'F_z', 0.0, 'tau_x', 0.0, 'tau_y', 0.0, 'tau_z', 0.0);
nodes(3) = struct('name', 'node 3', 'x', 3.0, 'y', 0.0, 'z', 0.0, 'F_x', 0.0, 'F_y', 0.0, 'F_z', 0.0, 'tau_x', 0.0, 'tau_y', 0.0, 'tau_z', 0.0);
nodes(4) = struct('name', 'node 4', 'x', 4.0, 'y', 0.0, 'z', 0.0, 'F_x', 0.0, 'F_y', 0.0, 'F_z', 0.0, 'tau_x', 0.0, 'tau_y', 0.0, 'tau_z', 0.0);
nodes(5) = struct('name', 'node 5', 'x', 5.0, 'y', 0.0, 'z', 0.0, 'F_x', 0.0, 'F_y', 0.0, 'F_z', 0.0, 'tau_x', 0.0, 'tau_y', 0.0, 'tau_z', 0.0);

nodes(6) = struct('name', 'node 1x', 'x', 1.0, 'y', 0.0, 'z', -1.0, 'F_x', 0.0, 'F_y', 0.0, 'F_z', 0.0, 'tau_x', 0.0, 'tau_y', 0.0, 'tau_z', 0.0);
nodes(7) = struct('name', 'node 2x', 'x', 2.0, 'y', 0.0, 'z', -2.0, 'F_x', 0.0, 'F_y', 0.0, 'F_z', 0.0, 'tau_x', 0.0, 'tau_y', 0.0, 'tau_z', 0.0);
nodes(8) = struct('name', 'node 3x', 'x', 3.0, 'y', 0.0, 'z', -3.0, 'F_x', 0.0, 'F_y', 0.0, 'F_z', 0.0, 'tau_x', 0.0, 'tau_y', 0.0, 'tau_z', 0.0);
nodes(9) = struct('name', 'node 4x', 'x', 4.0, 'y', 0.0, 'z', -4.0, 'F_x', 0.0, 'F_y', 0.0, 'F_z', 0.0, 'tau_x', 0.0, 'tau_y', 0.0, 'tau_z', 0.0);
nodes(10) = struct('name', 'node 5x', 'x', 5.0, 'y', 0.0, 'z', -5.0, 'F_x', 0.0, 'F_y', 0.0, 'F_z', 0.0, 'tau_x', 0.0, 'tau_y', 0.0, 'tau_z', 0.0);

nodes(11) = struct('name', 'node 1y', 'x', 1.0, 'y', 0.0, 'z', 1.0, 'F_x', 0.0, 'F_y', 0.0, 'F_z', 0.0, 'tau_x', 0.0, 'tau_y', 0.0, 'tau_z', 0.0);
nodes(12) = struct('name', 'node 2y', 'x', 2.0, 'y', 0.0, 'z', 2.0, 'F_x', 0.0, 'F_y', 0.0, 'F_z', 0.0, 'tau_x', 0.0, 'tau_y', 0.0, 'tau_z', 0.0);
nodes(13) = struct('name', 'node 3y', 'x', 3.0, 'y', 0.0, 'z', 3.0, 'F_x', 0.0, 'F_y', 0.0, 'F_z', 0.0, 'tau_x', 0.0, 'tau_y', 0.0, 'tau_z', 0.0);
nodes(14) = struct('name', 'node 4y', 'x', 4.0, 'y', 0.0, 'z', 4.0, 'F_x', 0.0, 'F_y', 0.0, 'F_z', 0.0, 'tau_x', 0.0, 'tau_y', 0.0, 'tau_z', 0.0);
nodes(15) = struct('name', 'node 5y', 'x', 5.0, 'y', 0.0, 'z', 5.0, 'F_x', 0.0, 'F_y', 0.0, 'F_z', 0.0, 'tau_x', 0.0, 'tau_y', 0.0, 'tau_z', 0.0);

nodes(16) = struct('name', 'node 1z', 'x', 0.0, 'y', 0.0, 'z', -1.0, 'F_x', 0.0, 'F_y', 0.0, 'F_z', 0.0, 'tau_x', 0.0, 'tau_y', 0.0, 'tau_z', 0.0);
nodes(17) = struct('name', 'node 2z', 'x', 0.0, 'y', 0.0, 'z', -2.0, 'F_x', 0.0, 'F_y', 0.0, 'F_z', 0.0, 'tau_x', 0.0, 'tau_y', 0.0, 'tau_z', 0.0);
nodes(18) = struct('name', 'node 3z', 'x', 0.0, 'y', 0.0, 'z', -3.0, 'F_x', 0.0, 'F_y', 0.0, 'F_z', 0.0, 'tau_x', 0.0, 'tau_y', 0.0, 'tau_z', 0.0);
nodes(19) = struct('name', 'node 4z', 'x', 0.0, 'y', 0.0, 'z', -4.0, 'F_x', 0.0, 'F_y', 0.0, 'F_z', 0.0, 'tau_x', 0.0, 'tau_y', 0.0, 'tau_z', 0.0);
nodes(20) = struct('name', 'node 5z', 'x', 0.0, 'y', 0.0, 'z', -5.0, 'F_x', 0.0, 'F_y', 0.0, 'F_z', 0.0, 'tau_x', 0.0, 'tau_y', 0.0, 'tau_z', 0.0);

nodes(21) = struct('name', 'node 1w', 'x', 0.0, 'y', 0.0, 'z', 1.0, 'F_x', 0.0, 'F_y', 0.0, 'F_z', 0.0, 'tau_x', 0.0, 'tau_y', 0.0, 'tau_z', 0.0);
nodes(22) = struct('name', 'node 2w', 'x', 0.0, 'y', 0.0, 'z', 2.0, 'F_x', 0.0, 'F_y', 0.0, 'F_z', 0.0, 'tau_x', 0.0, 'tau_y', 0.0, 'tau_z', 0.0);
nodes(23) = struct('name', 'node 3w', 'x', 0.0, 'y', 0.0, 'z', 3.0, 'F_x', 0.0, 'F_y', 0.0, 'F_z', 0.0, 'tau_x', 0.0, 'tau_y', 0.0, 'tau_z', 0.0);
nodes(24) = struct('name', 'node 4w', 'x', 0.0, 'y', 0.0, 'z', 4.0, 'F_x', 0.0, 'F_y', 0.0, 'F_z', 0.0, 'tau_x', 0.0, 'tau_y', 0.0, 'tau_z', 0.0);
nodes(25) = struct('name', 'node 5w', 'x', 0.0, 'y', 0.0, 'z', 5.0, 'F_x', 0.0, 'F_y', 0.0, 'F_z', 0.0, 'tau_x', 0.0, 'tau_y', 0.0, 'tau_z', 0.0);

%%%%%%%%%%%%%%%%%% BEAMS 

num_of_beams = 25; 

beams(1) = struct('start', 'anchor', 'end', 'node 1', 't', 1.0);
beams(2) = struct('start', 'node 1', 'end', 'node 2', 't', 1.0);
beams(3) = struct('start', 'node 2', 'end', 'node 3', 't', 1.0);
beams(4) = struct('start', 'node 3', 'end', 'node 4', 't', 1.0);
beams(5) = struct('start', 'node 4', 'end', 'node 5', 't', 1.0);

beams(6) = struct('start', 'anchor', 'end', 'node 1x', 't', 1.0);
beams(7) = struct('start', 'node 1x', 'end', 'node 2x', 't', 1.0);
beams(8) = struct('start', 'node 2x', 'end', 'node 3x', 't', 1.0);
beams(9) = struct('start', 'node 3x', 'end', 'node 4x', 't', 1.0);
beams(10) = struct('start', 'node 4x', 'end', 'node 5x', 't', 1.0);

beams(11) = struct('start', 'anchor', 'end', 'node 1y', 't', 1.0);
beams(12) = struct('start', 'node 1y', 'end', 'node 2y', 't', 1.0);
beams(13) = struct('start', 'node 2y', 'end', 'node 3y', 't', 1.0);
beams(14) = struct('start', 'node 3y', 'end', 'node 4y', 't', 1.0);
beams(15) = struct('start', 'node 4y', 'end', 'node 5y', 't', 1.0);

beams(16) = struct('start', 'anchor', 'end', 'node 1z', 't', 1.0);
beams(17) = struct('start', 'node 1z', 'end', 'node 2z', 't', 1.0);
beams(18) = struct('start', 'node 2z', 'end', 'node 3z', 't', 1.0);
beams(19) = struct('start', 'node 3z', 'end', 'node 4z', 't', 1.0);
beams(20) = struct('start', 'node 4z', 'end', 'node 5z', 't', 1.0);

beams(21) = struct('start', 'anchor', 'end', 'node 1w', 't', 1.0);
beams(22) = struct('start', 'node 1w', 'end', 'node 2w', 't', 1.0);
beams(23) = struct('start', 'node 2w', 'end', 'node 3w', 't', 1.0);
beams(24) = struct('start', 'node 3w', 'end', 'node 4w', 't', 1.0);
beams(25) = struct('start', 'node 4w', 'end', 'node 5w', 't', 1.0);









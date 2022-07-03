

'Bridge'  


%%%%%%%%%%%%%%%%%% NODES 

num_of_g_nodes = 4;
num_of_nodes = 30; 


g_nodes(1) = struct('name', 'node 0,0', 'x', 0.0, 'y', 0.0, 'z', 0.0);
g_nodes(2) = struct('name', 'node 0,1', 'x', 0.0, 'y', 1.0, 'z', 0.0);
g_nodes(3) = struct('name', 'node 16,0', 'x', 16.0, 'y', 0.0, 'z', 0.0);
g_nodes(4) = struct('name', 'node 16,1', 'x', 16.0, 'y', 1.0, 'z', 0.0);

nodes(1) = struct('name', 'node 1,0', 'x', 1.0, 'y', 0.0, 'z', 0.0, 'F_x', 0.0, 'F_y', 0.0, 'F_z', 0.0, 'tau_x', 0.0, 'tau_y', 0.0, 'tau_z', 0.0);
nodes(2) = struct('name', 'node 1,1', 'x', 1.0, 'y', 1.0, 'z', 0.0, 'F_x', 0.0, 'F_y', 0.0, 'F_z', 0.0, 'tau_x', 0.0, 'tau_y', 0.0, 'tau_z', 0.0);
nodes(3) = struct('name', 'node 2,0', 'x', 2.0, 'y', 0.0, 'z', 0.0, 'F_x', 0.0, 'F_y', 0.0, 'F_z', 0.0, 'tau_x', 0.0, 'tau_y', 0.0, 'tau_z', 0.0);
nodes(4) = struct('name', 'node 2,1', 'x', 2.0, 'y', 1.0, 'z', 0.0, 'F_x', 0.0, 'F_y', 0.0, 'F_z', 0.0, 'tau_x', 0.0, 'tau_y', 0.0, 'tau_z', 0.0);
nodes(5) = struct('name', 'node 3,0', 'x', 3.0, 'y', 0.0, 'z', 0.0, 'F_x', 0.0, 'F_y', 0.0, 'F_z', 0.0, 'tau_x', 0.0, 'tau_y', 0.0, 'tau_z', 0.0);
nodes(6) = struct('name', 'node 3,1', 'x', 3.0, 'y', 1.0, 'z', 0.0, 'F_x', 0.0, 'F_y', 0.0, 'F_z', 0.0, 'tau_x', 0.0, 'tau_y', 0.0, 'tau_z', 0.0);
nodes(7) = struct('name', 'node 4,0', 'x', 4.0, 'y', 0.0, 'z', 0.0, 'F_x', 0.0, 'F_y', 0.0, 'F_z', 0.0, 'tau_x', 0.0, 'tau_y', 0.0, 'tau_z', 0.0);
nodes(8) = struct('name', 'node 4,1', 'x', 4.0, 'y', 1.0, 'z', 0.0, 'F_x', 0.0, 'F_y', 0.0, 'F_z', 0.0, 'tau_x', 0.0, 'tau_y', 0.0, 'tau_z', 0.0);
nodes(9) = struct('name', 'node 5,0', 'x', 5.0, 'y', 0.0, 'z', 0.0, 'F_x', 0.0, 'F_y', 0.0, 'F_z', 0.0, 'tau_x', 0.0, 'tau_y', 0.0, 'tau_z', 0.0);
nodes(10) = struct('name', 'node 5,1', 'x', 5.0, 'y', 1.0, 'z', 0.0, 'F_x', 0.0, 'F_y', 0.0, 'F_z', 0.0, 'tau_x', 0.0, 'tau_y', 0.0, 'tau_z', 0.0);
nodes(11) = struct('name', 'node 6,0', 'x', 6.0, 'y', 0.0, 'z', 0.0, 'F_x', 0.0, 'F_y', 0.0, 'F_z', 0.0, 'tau_x', 0.0, 'tau_y', 0.0, 'tau_z', 0.0);
nodes(12) = struct('name', 'node 6,1', 'x', 6.0, 'y', 1.0, 'z', 0.0, 'F_x', 0.0, 'F_y', 0.0, 'F_z', 0.0, 'tau_x', 0.0, 'tau_y', 0.0, 'tau_z', 0.0);
nodes(13) = struct('name', 'node 7,0', 'x', 7.0, 'y', 0.0, 'z', 0.0, 'F_x', 0.0, 'F_y', 0.0, 'F_z', 0.0, 'tau_x', 0.0, 'tau_y', 0.0, 'tau_z', 0.0);
nodes(14) = struct('name', 'node 7,1', 'x', 7.0, 'y', 1.0, 'z', 0.0, 'F_x', 0.0, 'F_y', 0.0, 'F_z', 0.0, 'tau_x', 0.0, 'tau_y', 0.0, 'tau_z', 0.0);
nodes(15) = struct('name', 'node 8,0', 'x', 8.0, 'y', 0.0, 'z', 0.0, 'F_x', 0.0, 'F_y', 0.0, 'F_z', 0.0, 'tau_x', 0.0, 'tau_y', 0.0, 'tau_z', 0.0);
nodes(16) = struct('name', 'node 8,1', 'x', 8.0, 'y', 1.0, 'z', 0.0, 'F_x', 0.0, 'F_y', 0.0, 'F_z', 0.0, 'tau_x', 0.0, 'tau_y', 0.0, 'tau_z', 0.0);
nodes(17) = struct('name', 'node 9,0', 'x', 9.0, 'y', 0.0, 'z', 0.0, 'F_x', 0.0, 'F_y', 0.0, 'F_z', 0.0, 'tau_x', 0.0, 'tau_y', 0.0, 'tau_z', 0.0);
nodes(18) = struct('name', 'node 9,1', 'x', 9.0, 'y', 1.0, 'z', 0.0, 'F_x', 0.0, 'F_y', 0.0, 'F_z', 0.0, 'tau_x', 0.0, 'tau_y', 0.0, 'tau_z', 0.0);
nodes(19) = struct('name', 'node 10,0', 'x', 10.0, 'y', 0.0, 'z', 0.0, 'F_x', 0.0, 'F_y', 0.0, 'F_z', 0.0, 'tau_x', 0.0, 'tau_y', 0.0, 'tau_z', 0.0);
nodes(20) = struct('name', 'node 10,1', 'x', 10.0, 'y', 1.0, 'z', 0.0, 'F_x', 0.0, 'F_y', 0.0, 'F_z', 0.0, 'tau_x', 0.0, 'tau_y', 0.0, 'tau_z', 0.0);
nodes(21) = struct('name', 'node 11,0', 'x', 11.0, 'y', 0.0, 'z', 0.0, 'F_x', 0.0, 'F_y', 0.0, 'F_z', 0.0, 'tau_x', 0.0, 'tau_y', 0.0, 'tau_z', 0.0);
nodes(22) = struct('name', 'node 11,1', 'x', 11.0, 'y', 1.0, 'z', 0.0, 'F_x', 0.0, 'F_y', 0.0, 'F_z', 0.0, 'tau_x', 0.0, 'tau_y', 0.0, 'tau_z', 0.0);
nodes(23) = struct('name', 'node 12,0', 'x', 12.0, 'y', 0.0, 'z', 0.0, 'F_x', 0.0, 'F_y', 0.0, 'F_z', 0.0, 'tau_x', 0.0, 'tau_y', 0.0, 'tau_z', 0.0);
nodes(24) = struct('name', 'node 12,1', 'x', 12.0, 'y', 1.0, 'z', 0.0, 'F_x', 0.0, 'F_y', 0.0, 'F_z', 0.0, 'tau_x', 0.0, 'tau_y', 0.0, 'tau_z', 0.0);
nodes(25) = struct('name', 'node 13,0', 'x', 13.0, 'y', 0.0, 'z', 0.0, 'F_x', 0.0, 'F_y', 0.0, 'F_z', 0.0, 'tau_x', 0.0, 'tau_y', 0.0, 'tau_z', 0.0);
nodes(26) = struct('name', 'node 13,1', 'x', 13.0, 'y', 1.0, 'z', 0.0, 'F_x', 0.0, 'F_y', 0.0, 'F_z', 0.0, 'tau_x', 0.0, 'tau_y', 0.0, 'tau_z', 0.0);
nodes(27) = struct('name', 'node 14,0', 'x', 14.0, 'y', 0.0, 'z', 0.0, 'F_x', 0.0, 'F_y', 0.0, 'F_z', 0.0, 'tau_x', 0.0, 'tau_y', 0.0, 'tau_z', 0.0);
nodes(28) = struct('name', 'node 14,1', 'x', 14.0, 'y', 1.0, 'z', 0.0, 'F_x', 0.0, 'F_y', 0.0, 'F_z', 0.0, 'tau_x', 0.0, 'tau_y', 0.0, 'tau_z', 0.0);
nodes(29) = struct('name', 'node 15,0', 'x', 15.0, 'y', 0.0, 'z', 0.0, 'F_x', 0.0, 'F_y', 0.0, 'F_z', 0.0, 'tau_x', 0.0, 'tau_y', 0.0, 'tau_z', 0.0);
nodes(30) = struct('name', 'node 15,1', 'x', 15.0, 'y', 1.0, 'z', 0.0, 'F_x', 0.0, 'F_y', 0.0, 'F_z', 0.0, 'tau_x', 0.0, 'tau_y', 0.0, 'tau_z', 0.0);

%%%%%%%%%%%%%%%%%% BEAMS 

num_of_beams = 49; 

beams(1) = struct('start', 'node 0,0', 'end', 'node 0,1', 't', 1.0);
beams(2) = struct('start', 'node 0,0', 'end', 'node 1,0', 't', 1.0);
beams(3) = struct('start', 'node 0,1', 'end', 'node 1,1', 't', 1.0);
beams(4) = struct('start', 'node 1,0', 'end', 'node 1,1', 't', 1.0);
beams(5) = struct('start', 'node 1,0', 'end', 'node 2,0', 't', 1.0);
beams(6) = struct('start', 'node 1,1', 'end', 'node 2,1', 't', 1.0);
beams(7) = struct('start', 'node 2,0', 'end', 'node 2,1', 't', 1.0);
beams(8) = struct('start', 'node 2,0', 'end', 'node 3,0', 't', 1.0);
beams(9) = struct('start', 'node 2,1', 'end', 'node 3,1', 't', 1.0);
beams(10) = struct('start', 'node 3,0', 'end', 'node 3,1', 't', 1.0);
beams(11) = struct('start', 'node 3,0', 'end', 'node 4,0', 't', 1.0);
beams(12) = struct('start', 'node 3,1', 'end', 'node 4,1', 't', 1.0);
beams(13) = struct('start', 'node 4,0', 'end', 'node 4,1', 't', 1.0);
beams(14) = struct('start', 'node 4,0', 'end', 'node 5,0', 't', 1.0);
beams(15) = struct('start', 'node 4,1', 'end', 'node 5,1', 't', 1.0);
beams(16) = struct('start', 'node 5,0', 'end', 'node 5,1', 't', 1.0);
beams(17) = struct('start', 'node 5,0', 'end', 'node 6,0', 't', 1.0);
beams(18) = struct('start', 'node 5,1', 'end', 'node 6,1', 't', 1.0);
beams(19) = struct('start', 'node 6,0', 'end', 'node 6,1', 't', 1.0);
beams(20) = struct('start', 'node 6,0', 'end', 'node 7,0', 't', 1.0);
beams(21) = struct('start', 'node 6,1', 'end', 'node 7,1', 't', 1.0);
beams(22) = struct('start', 'node 7,0', 'end', 'node 7,1', 't', 1.0);
beams(23) = struct('start', 'node 7,0', 'end', 'node 8,0', 't', 1.0);
beams(24) = struct('start', 'node 7,1', 'end', 'node 8,1', 't', 1.0);
beams(25) = struct('start', 'node 8,0', 'end', 'node 8,1', 't', 1.0);
beams(26) = struct('start', 'node 8,0', 'end', 'node 9,0', 't', 1.0);
beams(27) = struct('start', 'node 8,1', 'end', 'node 9,1', 't', 1.0);
beams(28) = struct('start', 'node 9,0', 'end', 'node 9,1', 't', 1.0);
beams(29) = struct('start', 'node 9,0', 'end', 'node 10,0', 't', 1.0);
beams(30) = struct('start', 'node 9,1', 'end', 'node 10,1', 't', 1.0);
beams(31) = struct('start', 'node 10,0', 'end', 'node 10,1', 't', 1.0);  
beams(32) = struct('start', 'node 10,0', 'end', 'node 11,0', 't', 1.0);
beams(33) = struct('start', 'node 10,1', 'end', 'node 11,1', 't', 1.0);
beams(34) = struct('start', 'node 11,0', 'end', 'node 11,1', 't', 1.0);
beams(35) = struct('start', 'node 11,0', 'end', 'node 12,0', 't', 1.0);
beams(36) = struct('start', 'node 11,1', 'end', 'node 12,1', 't', 1.0);
beams(37) = struct('start', 'node 12,0', 'end', 'node 12,1', 't', 1.0);
beams(38) = struct('start', 'node 12,0', 'end', 'node 13,0', 't', 1.0);
beams(39) = struct('start', 'node 12,1', 'end', 'node 13,1', 't', 1.0);
beams(40) = struct('start', 'node 13,0', 'end', 'node 13,1', 't', 1.0);
beams(41) = struct('start', 'node 13,0', 'end', 'node 14,0', 't', 1.0);
beams(42) = struct('start', 'node 13,1', 'end', 'node 14,1', 't', 1.0);
beams(43) = struct('start', 'node 14,0', 'end', 'node 14,1', 't', 1.0);
beams(44) = struct('start', 'node 14,0', 'end', 'node 15,0', 't', 1.0);
beams(45) = struct('start', 'node 14,1', 'end', 'node 15,1', 't', 1.0);
beams(46) = struct('start', 'node 15,0', 'end', 'node 15,1', 't', 1.0);
beams(47) = struct('start', 'node 15,0', 'end', 'node 16,0', 't', 1.0);
beams(48) = struct('start', 'node 15,1', 'end', 'node 16,1', 't', 1.0);
beams(49) = struct('start', 'node 16,0', 'end', 'node 16,1', 't', 1.0);




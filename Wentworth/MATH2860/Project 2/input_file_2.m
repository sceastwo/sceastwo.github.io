

'Bridge truss'  


%Bridge truss


%%%%%%%%%%%%%%%%%% NODES 

num_of_g_nodes = 4;
num_of_nodes = 12; 

g_nodes(1) = struct('name', 'ground_0_left', 'x', 0.0, 'y', 1.0, 'z', 0.0);
g_nodes(2) = struct('name', 'ground_0_right', 'x', 0.0, 'y', 0.0, 'z', 0.0);

g_nodes(3) = struct('name', 'ground_1_left', 'x', 0.0, 'y', 1.0, 'z', 1.0);
g_nodes(4) = struct('name', 'ground_1_right', 'x', 0.0, 'y', 0.0, 'z', 1.0);

nodes(1) = struct('name', 'pair_1_left', 'x', 0.5, 'y', 1.0, 'z', 1.0, 'F_x', 0.0, 'F_y', 0.0, 'F_z', 0.0, 'tau_x', 0.0, 'tau_y', 0.0, 'tau_z', 0.0);
nodes(2) = struct('name', 'pair_1_right', 'x', 0.5, 'y', 0.0, 'z', 1.0, 'F_x', 0.0, 'F_y', 0.0, 'F_z', 0.0, 'tau_x', 0.0, 'tau_y', 0.0, 'tau_z', 0.0);

nodes(3) = struct('name', 'pair_2_left', 'x', 1.0, 'y', 1.0, 'z', 0.0, 'F_x', 0.0, 'F_y', 0.0, 'F_z', 0.0, 'tau_x', 0.0, 'tau_y', 0.0, 'tau_z', 0.0);
nodes(4) = struct('name', 'pair_2_right', 'x', 1.0, 'y', 0.0, 'z', 0.0, 'F_x', 0.0, 'F_y', 0.0, 'F_z', 0.0, 'tau_x', 0.0, 'tau_y', 0.0, 'tau_z', 0.0);

nodes(5) = struct('name', 'pair_3_left', 'x', 1.5, 'y', 1.0, 'z', 1.0, 'F_x', 0.0, 'F_y', 0.0, 'F_z', 0.0, 'tau_x', 0.0, 'tau_y', 0.0, 'tau_z', 0.0);
nodes(6) = struct('name', 'pair_3_right', 'x', 1.5, 'y', 0.0, 'z', 1.0, 'F_x', 0.0, 'F_y', 0.0, 'F_z', 0.0, 'tau_x', 0.0, 'tau_y', 0.0, 'tau_z', 0.0);

nodes(7) = struct('name', 'pair_4_left', 'x', 2.0, 'y', 1.0, 'z', 0.0, 'F_x', 0.0, 'F_y', 0.0, 'F_z', 0.0, 'tau_x', 0.0, 'tau_y', 0.0, 'tau_z', 0.0);
nodes(8) = struct('name', 'pair_4_right', 'x', 2.0, 'y', 0.0, 'z', 0.0, 'F_x', 0.0, 'F_y', 0.0, 'F_z', 0.0, 'tau_x', 0.0, 'tau_y', 0.0, 'tau_z', 0.0);

nodes(9) = struct('name', 'pair_5_left', 'x', 2.5, 'y', 1.0, 'z', 1.0, 'F_x', 0.0, 'F_y', 0.0, 'F_z', 0.0, 'tau_x', 0.0, 'tau_y', 0.0, 'tau_z', 0.0);
nodes(10) = struct('name', 'pair_5_right', 'x', 2.5, 'y', 0.0, 'z', 1.0, 'F_x', 0.0, 'F_y', 0.0, 'F_z', 0.0, 'tau_x', 0.0, 'tau_y', 0.0, 'tau_z', 0.0);

nodes(11) = struct('name', 'pair_6_left', 'x', 3.0, 'y', 1.0, 'z', 0.0, 'F_x', 0.0, 'F_y', 0.0, 'F_z', -0.2, 'tau_x', 0.0, 'tau_y', 0.0, 'tau_z', 0.0);
nodes(12) = struct('name', 'pair_6_right', 'x', 3.0, 'y', 0.0, 'z', 0.0, 'F_x', 0.0, 'F_y', 0.0, 'F_z', -0.4, 'tau_x', 0.0, 'tau_y', 0.0, 'tau_z', 0.0);



%%%%%%%%%%%%%%%%%% BEAMS 

num_of_beams = 41; 


beams(1) = struct('start', 'ground_1_left', 'end', 'pair_1_left', 't', 1.0);
beams(2) = struct('start', 'ground_1_right', 'end', 'pair_1_left', 't', 1.0);
beams(3) = struct('start', 'ground_1_right', 'end', 'pair_1_right', 't', 1.0);
beams(4) = struct('start', 'pair_1_left', 'end', 'pair_1_right', 't', 1.0);

beams(5) = struct('start', 'ground_0_left', 'end', 'pair_2_left', 't', 1.0);
beams(6) = struct('start', 'ground_0_right', 'end', 'pair_2_left', 't', 1.0);
beams(7) = struct('start', 'ground_0_right', 'end', 'pair_2_right', 't', 1.0);
beams(8) = struct('start', 'pair_1_left', 'end', 'pair_2_left', 't', 1.0);
beams(9) = struct('start', 'pair_1_right', 'end', 'pair_2_left', 't', 1.0);
beams(10) = struct('start', 'pair_1_right', 'end', 'pair_2_right', 't', 1.0);
beams(11) = struct('start', 'pair_2_left', 'end', 'pair_2_right', 't', 1.0);

beams(12) = struct('start', 'pair_1_left', 'end', 'pair_3_left', 't', 1.0);
beams(13) = struct('start', 'pair_1_right', 'end', 'pair_3_left', 't', 1.0);
beams(14) = struct('start', 'pair_1_right', 'end', 'pair_3_right', 't', 1.0);
beams(15) = struct('start', 'pair_2_left', 'end', 'pair_3_left', 't', 1.0);
beams(16) = struct('start', 'pair_2_right', 'end', 'pair_3_left', 't', 1.0);
beams(17) = struct('start', 'pair_2_right', 'end', 'pair_3_right', 't', 1.0);
beams(18) = struct('start', 'pair_3_left', 'end', 'pair_3_right', 't', 1.0);

beams(19) = struct('start', 'pair_2_left', 'end', 'pair_4_left', 't', 1.0);
beams(20) = struct('start', 'pair_2_right', 'end', 'pair_4_left', 't', 1.0);
beams(21) = struct('start', 'pair_2_right', 'end', 'pair_4_right', 't', 1.0);
beams(22) = struct('start', 'pair_3_left', 'end', 'pair_4_left', 't', 1.0);
beams(23) = struct('start', 'pair_3_right', 'end', 'pair_4_left', 't', 1.0);
beams(24) = struct('start', 'pair_3_right', 'end', 'pair_4_right', 't', 1.0);
beams(25) = struct('start', 'pair_4_left', 'end', 'pair_4_right', 't', 1.0);

beams(26) = struct('start', 'pair_3_left', 'end', 'pair_5_left', 't', 1.0);
beams(27) = struct('start', 'pair_3_right', 'end', 'pair_5_left', 't', 1.0);
beams(28) = struct('start', 'pair_3_right', 'end', 'pair_5_right', 't', 1.0);
beams(29) = struct('start', 'pair_4_left', 'end', 'pair_5_left', 't', 1.0);
beams(30) = struct('start', 'pair_4_right', 'end', 'pair_5_left', 't', 1.0);
beams(31) = struct('start', 'pair_4_right', 'end', 'pair_5_right', 't', 1.0);
beams(32) = struct('start', 'pair_5_left', 'end', 'pair_5_right', 't', 1.0);

beams(33) = struct('start', 'pair_4_left', 'end', 'pair_6_left', 't', 1.0);
beams(34) = struct('start', 'pair_4_right', 'end', 'pair_6_left', 't', 1.0);
beams(35) = struct('start', 'pair_4_right', 'end', 'pair_6_right', 't', 1.0);
beams(36) = struct('start', 'pair_5_left', 'end', 'pair_6_left', 't', 1.0);
beams(37) = struct('start', 'pair_5_right', 'end', 'pair_6_left', 't', 1.0);
beams(38) = struct('start', 'pair_5_right', 'end', 'pair_6_right', 't', 1.0);
beams(39) = struct('start', 'pair_6_left', 'end', 'pair_6_right', 't', 1.0);

beams(40) = struct('start', 'ground_0_left', 'end', 'pair_1_left', 't', 1.0);
beams(41) = struct('start', 'ground_0_right', 'end', 'pair_1_right', 't', 1.0);




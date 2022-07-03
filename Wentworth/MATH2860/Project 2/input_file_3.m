

'Tower'  


%%%%%%%%%%%%%%%%%% NODES 

num_of_g_nodes = 4;
num_of_nodes = 20; 

g_nodes(1) = struct('name', 'base_00', 'x', 0.0, 'y', 0.0, 'z', 0.0);
g_nodes(2) = struct('name', 'base_10', 'x', 1.0, 'y', 0.0, 'z', 0.0);
g_nodes(3) = struct('name', 'base_01', 'x', 0.0, 'y', 1.0, 'z', 0.0);
g_nodes(4) = struct('name', 'base_11', 'x', 1.0, 'y', 1.0, 'z', 0.0);

% Tier 1
nodes(1) = struct('name', 'tier_1_00', 'x', 0.0, 'y', 0.0, 'z', 1.0, 'F_x', 0.0, 'F_y', 0.0, 'F_z', 0.0);
nodes(2) = struct('name', 'tier_1_10', 'x', 1.0, 'y', 0.0, 'z', 1.0, 'F_x', 0.0, 'F_y', 0.0, 'F_z', 0.0);
nodes(3) = struct('name', 'tier_1_01', 'x', 0.0, 'y', 1.0, 'z', 1.0, 'F_x', 0.0, 'F_y', 0.0, 'F_z', 0.0);
nodes(4) = struct('name', 'tier_1_11', 'x', 1.0, 'y', 1.0, 'z', 1.0, 'F_x', 0.0, 'F_y', 0.0, 'F_z', 0.0);
% Tier 2
nodes(5) = struct('name', 'tier_2_00', 'x', 0.0, 'y', 0.0, 'z', 2.0, 'F_x', 0.0, 'F_y', 0.0, 'F_z', 0.0);
nodes(6) = struct('name', 'tier_2_10', 'x', 1.0, 'y', 0.0, 'z', 2.0, 'F_x', 0.0, 'F_y', 0.0, 'F_z', 0.0);
nodes(7) = struct('name', 'tier_2_01', 'x', 0.0, 'y', 1.0, 'z', 2.0, 'F_x', 0.0, 'F_y', 0.0, 'F_z', 0.0);
nodes(8) = struct('name', 'tier_2_11', 'x', 1.0, 'y', 1.0, 'z', 2.0, 'F_x', 0.0, 'F_y', 0.0, 'F_z', 0.0);
% Tier 3
nodes(9) = struct('name', 'tier_3_00', 'x', 0.0, 'y', 0.0, 'z', 3.0, 'F_x', 0.0, 'F_y', 0.0, 'F_z', 0.0);
nodes(10) = struct('name', 'tier_3_10', 'x', 1.0, 'y', 0.0, 'z', 3.0, 'F_x', 0.0, 'F_y', 0.0, 'F_z', 0.0);
nodes(11) = struct('name', 'tier_3_01', 'x', 0.0, 'y', 1.0, 'z', 3.0, 'F_x', 0.0, 'F_y', 0.0, 'F_z', 0.0);
nodes(12) = struct('name', 'tier_3_11', 'x', 1.0, 'y', 1.0, 'z', 3.0, 'F_x', 0.0, 'F_y', 0.0, 'F_z', 0.0);
% Tier 4
nodes(13) = struct('name', 'tier_4_00', 'x', 0.0, 'y', 0.0, 'z', 4.0, 'F_x', 0.0, 'F_y', 0.0, 'F_z', 0.0);
nodes(14) = struct('name', 'tier_4_10', 'x', 1.0, 'y', 0.0, 'z', 4.0, 'F_x', 0.0, 'F_y', 0.0, 'F_z', 0.0);
nodes(15) = struct('name', 'tier_4_01', 'x', 0.0, 'y', 1.0, 'z', 4.0, 'F_x', 0.0, 'F_y', 0.0, 'F_z', 0.0);
nodes(16) = struct('name', 'tier_4_11', 'x', 1.0, 'y', 1.0, 'z', 4.0, 'F_x', 0.0, 'F_y', 0.0, 'F_z', 0.0);
% Tier 5
nodes(17) = struct('name', 'tier_5_00', 'x', 0.0, 'y', 0.0, 'z', 5.0, 'F_x', 0.0, 'F_y', 0.0, 'F_z', 0.0);
nodes(18) = struct('name', 'tier_5_10', 'x', 1.0, 'y', 0.0, 'z', 5.0, 'F_x', 0.0, 'F_y', 0.0, 'F_z', 0.0);
nodes(19) = struct('name', 'tier_5_01', 'x', 0.0, 'y', 1.0, 'z', 5.0, 'F_x', 0.0, 'F_y', 0.0, 'F_z', 0.0);
nodes(20) = struct('name', 'tier_5_11', 'x', 1.0, 'y', 1.0, 'z', 5.0, 'F_x', 400.0, 'F_y', 0.0, 'F_z', 0.0);




%%%%%%%%%%%%%%%%%% BEAMS 

num_of_g_beams = 4;
num_of_beams = 40; 

k_par = 1000.00;
k_perp = 500.00;
ka_par = 1000.00;
ka_perp = 500.00;
break_par = 0.3;
break_perp = 0.3;

% Tier 1
beams(1) = struct('start', 'base_00', 'end', 'tier_1_00', 't', 1.0, 'k_par', k_par, 'k_perp', k_perp, 'ka_par', ka_par, 'ka_perp', ka_perp, 'break_par', break_par, 'break_perp', break_perp);
beams(2) = struct('start', 'base_10', 'end', 'tier_1_10', 't', 1.0, 'k_par', k_par, 'k_perp', k_perp, 'ka_par', ka_par, 'ka_perp', ka_perp, 'break_par', break_par, 'break_perp', break_perp);
beams(3) = struct('start', 'base_01', 'end', 'tier_1_01', 't', 1.0, 'k_par', k_par, 'k_perp', k_perp, 'ka_par', ka_par, 'ka_perp', ka_perp, 'break_par', break_par, 'break_perp', break_perp);
beams(4) = struct('start', 'base_11', 'end', 'tier_1_11', 't', 1.0, 'k_par', k_par, 'k_perp', k_perp, 'ka_par', ka_par, 'ka_perp', ka_perp, 'break_par', break_par, 'break_perp', break_perp);
beams(5) = struct('start', 'tier_1_00', 'end', 'tier_1_10', 't', 1.0, 'k_par', k_par, 'k_perp', k_perp, 'ka_par', ka_par, 'ka_perp', ka_perp, 'break_par', break_par, 'break_perp', break_perp);
beams(6) = struct('start', 'tier_1_00', 'end', 'tier_1_01', 't', 1.0, 'k_par', k_par, 'k_perp', k_perp, 'ka_par', ka_par, 'ka_perp', ka_perp, 'break_par', break_par, 'break_perp', break_perp);
beams(7) = struct('start', 'tier_1_10', 'end', 'tier_1_11', 't', 1.0, 'k_par', k_par, 'k_perp', k_perp, 'ka_par', ka_par, 'ka_perp', ka_perp, 'break_par', break_par, 'break_perp', break_perp);
beams(8) = struct('start', 'tier_1_01', 'end', 'tier_1_11', 't', 1.0, 'k_par', k_par, 'k_perp', k_perp, 'ka_par', ka_par, 'ka_perp', ka_perp, 'break_par', break_par, 'break_perp', break_perp);
% Tier 2
beams(9) = struct('start', 'tier_1_00', 'end', 'tier_2_00', 't', 1.0, 'k_par', k_par, 'k_perp', k_perp, 'ka_par', ka_par, 'ka_perp', ka_perp, 'break_par', break_par, 'break_perp', break_perp);
beams(10) = struct('start', 'tier_1_10', 'end', 'tier_2_10', 't', 1.0, 'k_par', k_par, 'k_perp', k_perp, 'ka_par', ka_par, 'ka_perp', ka_perp, 'break_par', break_par, 'break_perp', break_perp);
beams(11) = struct('start', 'tier_1_01', 'end', 'tier_2_01', 't', 1.0, 'k_par', k_par, 'k_perp', k_perp, 'ka_par', ka_par, 'ka_perp', ka_perp, 'break_par', break_par, 'break_perp', break_perp);
beams(12) = struct('start', 'tier_1_11', 'end', 'tier_2_11', 't', 1.0, 'k_par', k_par, 'k_perp', k_perp, 'ka_par', ka_par, 'ka_perp', ka_perp, 'break_par', break_par, 'break_perp', break_perp);
beams(13) = struct('start', 'tier_2_00', 'end', 'tier_2_10', 't', 1.0, 'k_par', k_par, 'k_perp', k_perp, 'ka_par', ka_par, 'ka_perp', ka_perp, 'break_par', break_par, 'break_perp', break_perp);
beams(14) = struct('start', 'tier_2_00', 'end', 'tier_2_01', 't', 1.0, 'k_par', k_par, 'k_perp', k_perp, 'ka_par', ka_par, 'ka_perp', ka_perp, 'break_par', break_par, 'break_perp', break_perp);
beams(15) = struct('start', 'tier_2_10', 'end', 'tier_2_11', 't', 1.0, 'k_par', k_par, 'k_perp', k_perp, 'ka_par', ka_par, 'ka_perp', ka_perp, 'break_par', break_par, 'break_perp', break_perp);
beams(16) = struct('start', 'tier_2_01', 'end', 'tier_2_11', 't', 1.0, 'k_par', k_par, 'k_perp', k_perp, 'ka_par', ka_par, 'ka_perp', ka_perp, 'break_par', break_par, 'break_perp', break_perp);
% Tier 3
beams(17) = struct('start', 'tier_2_00', 'end', 'tier_3_00', 't', 1.0, 'k_par', k_par, 'k_perp', k_perp, 'ka_par', ka_par, 'ka_perp', ka_perp, 'break_par', break_par, 'break_perp', break_perp);
beams(18) = struct('start', 'tier_2_10', 'end', 'tier_3_10', 't', 1.0, 'k_par', k_par, 'k_perp', k_perp, 'ka_par', ka_par, 'ka_perp', ka_perp, 'break_par', break_par, 'break_perp', break_perp);
beams(19) = struct('start', 'tier_2_01', 'end', 'tier_3_01', 't', 1.0, 'k_par', k_par, 'k_perp', k_perp, 'ka_par', ka_par, 'ka_perp', ka_perp, 'break_par', break_par, 'break_perp', break_perp);
beams(20) = struct('start', 'tier_2_11', 'end', 'tier_3_11', 't', 1.0, 'k_par', k_par, 'k_perp', k_perp, 'ka_par', ka_par, 'ka_perp', ka_perp, 'break_par', break_par, 'break_perp', break_perp);
beams(21) = struct('start', 'tier_3_00', 'end', 'tier_3_10', 't', 1.0, 'k_par', k_par, 'k_perp', k_perp, 'ka_par', ka_par, 'ka_perp', ka_perp, 'break_par', break_par, 'break_perp', break_perp);
beams(22) = struct('start', 'tier_3_00', 'end', 'tier_3_01', 't', 1.0, 'k_par', k_par, 'k_perp', k_perp, 'ka_par', ka_par, 'ka_perp', ka_perp, 'break_par', break_par, 'break_perp', break_perp);
beams(23) = struct('start', 'tier_3_10', 'end', 'tier_3_11', 't', 1.0, 'k_par', k_par, 'k_perp', k_perp, 'ka_par', ka_par, 'ka_perp', ka_perp, 'break_par', break_par, 'break_perp', break_perp);
beams(24) = struct('start', 'tier_3_01', 'end', 'tier_3_11', 't', 1.0, 'k_par', k_par, 'k_perp', k_perp, 'ka_par', ka_par, 'ka_perp', ka_perp, 'break_par', break_par, 'break_perp', break_perp);
% Tier 4
beams(25) = struct('start', 'tier_3_00', 'end', 'tier_4_00', 't', 1.0, 'k_par', k_par, 'k_perp', k_perp, 'ka_par', ka_par, 'ka_perp', ka_perp, 'break_par', break_par, 'break_perp', break_perp);
beams(26) = struct('start', 'tier_3_10', 'end', 'tier_4_10', 't', 1.0, 'k_par', k_par, 'k_perp', k_perp, 'ka_par', ka_par, 'ka_perp', ka_perp, 'break_par', break_par, 'break_perp', break_perp);
beams(27) = struct('start', 'tier_3_01', 'end', 'tier_4_01', 't', 1.0, 'k_par', k_par, 'k_perp', k_perp, 'ka_par', ka_par, 'ka_perp', ka_perp, 'break_par', break_par, 'break_perp', break_perp);
beams(28) = struct('start', 'tier_3_11', 'end', 'tier_4_11', 't', 1.0, 'k_par', k_par, 'k_perp', k_perp, 'ka_par', ka_par, 'ka_perp', ka_perp, 'break_par', break_par, 'break_perp', break_perp);
beams(29) = struct('start', 'tier_4_00', 'end', 'tier_4_10', 't', 1.0, 'k_par', k_par, 'k_perp', k_perp, 'ka_par', ka_par, 'ka_perp', ka_perp, 'break_par', break_par, 'break_perp', break_perp);
beams(30) = struct('start', 'tier_4_00', 'end', 'tier_4_01', 't', 1.0, 'k_par', k_par, 'k_perp', k_perp, 'ka_par', ka_par, 'ka_perp', ka_perp, 'break_par', break_par, 'break_perp', break_perp);
beams(31) = struct('start', 'tier_4_10', 'end', 'tier_4_11', 't', 1.0, 'k_par', k_par, 'k_perp', k_perp, 'ka_par', ka_par, 'ka_perp', ka_perp, 'break_par', break_par, 'break_perp', break_perp);
beams(32) = struct('start', 'tier_4_01', 'end', 'tier_4_11', 't', 1.0, 'k_par', k_par, 'k_perp', k_perp, 'ka_par', ka_par, 'ka_perp', ka_perp, 'break_par', break_par, 'break_perp', break_perp);
% Tier 5
beams(33) = struct('start', 'tier_4_00', 'end', 'tier_5_00', 't', 1.0, 'k_par', k_par, 'k_perp', k_perp, 'ka_par', ka_par, 'ka_perp', ka_perp, 'break_par', break_par, 'break_perp', break_perp);
beams(34) = struct('start', 'tier_4_10', 'end', 'tier_5_10', 't', 1.0, 'k_par', k_par, 'k_perp', k_perp, 'ka_par', ka_par, 'ka_perp', ka_perp, 'break_par', break_par, 'break_perp', break_perp);
beams(35) = struct('start', 'tier_4_01', 'end', 'tier_5_01', 't', 1.0, 'k_par', k_par, 'k_perp', k_perp, 'ka_par', ka_par, 'ka_perp', ka_perp, 'break_par', break_par, 'break_perp', break_perp);
beams(36) = struct('start', 'tier_4_11', 'end', 'tier_5_11', 't', 1.0, 'k_par', k_par, 'k_perp', k_perp, 'ka_par', ka_par, 'ka_perp', ka_perp, 'break_par', break_par, 'break_perp', break_perp);
beams(37) = struct('start', 'tier_5_00', 'end', 'tier_5_10', 't', 1.0, 'k_par', k_par, 'k_perp', k_perp, 'ka_par', ka_par, 'ka_perp', ka_perp, 'break_par', break_par, 'break_perp', break_perp);
beams(38) = struct('start', 'tier_5_00', 'end', 'tier_5_01', 't', 1.0, 'k_par', k_par, 'k_perp', k_perp, 'ka_par', ka_par, 'ka_perp', ka_perp, 'break_par', break_par, 'break_perp', break_perp);
beams(39) = struct('start', 'tier_5_10', 'end', 'tier_5_11', 't', 1.0, 'k_par', k_par, 'k_perp', k_perp, 'ka_par', ka_par, 'ka_perp', ka_perp, 'break_par', break_par, 'break_perp', break_perp);
beams(40) = struct('start', 'tier_5_01', 'end', 'tier_5_11', 't', 1.0, 'k_par', k_par, 'k_perp', k_perp, 'ka_par', ka_par, 'ka_perp', ka_perp, 'break_par', break_par, 'break_perp', break_perp);






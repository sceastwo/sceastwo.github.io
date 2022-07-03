

'Input file'  


%%%%%%%%%%%%%%%%%% NODES 

num_of_g_nodes = 4;
num_of_nodes = 20; 

g_nodes(1) = struct('x', 0.0, 'y', 0.0, 'z', 0.0);
g_nodes(2) = struct('x', 1.0, 'y', 0.0, 'z', 0.0);
g_nodes(3) = struct('x', 0.0, 'y', 1.0, 'z', 0.0);
g_nodes(4) = struct('x', 1.0, 'y', 1.0, 'z', 0.0);

% Tier 1
nodes(1) = struct('x', 0.0, 'y', 0.0, 'z', 1.0, 'F_x', 0.0, 'F_y', 0.0, 'F_z', 0.0);
nodes(2) = struct('x', 1.0, 'y', 0.0, 'z', 1.0, 'F_x', 0.0, 'F_y', 0.0, 'F_z', 0.0);
nodes(3) = struct('x', 0.0, 'y', 1.0, 'z', 1.0, 'F_x', 0.0, 'F_y', 0.0, 'F_z', 0.0);
nodes(4) = struct('x', 1.0, 'y', 1.0, 'z', 1.0, 'F_x', 0.0, 'F_y', 0.0, 'F_z', 0.0);
% Tier 2
nodes(5) = struct('x', 0.0, 'y', 0.0, 'z', 2.0, 'F_x', 0.0, 'F_y', 0.0, 'F_z', 0.0);
nodes(6) = struct('x', 1.0, 'y', 0.0, 'z', 2.0, 'F_x', 0.0, 'F_y', 0.0, 'F_z', 0.0);
nodes(7) = struct('x', 0.0, 'y', 1.0, 'z', 2.0, 'F_x', 0.0, 'F_y', 0.0, 'F_z', 0.0);
nodes(8) = struct('x', 1.0, 'y', 1.0, 'z', 2.0, 'F_x', 0.0, 'F_y', 0.0, 'F_z', 0.0);
% Tier 3
nodes(9) = struct('x', 0.0, 'y', 0.0, 'z', 3.0, 'F_x', 0.0, 'F_y', 0.0, 'F_z', 0.0);
nodes(10) = struct('x', 1.0, 'y', 0.0, 'z', 3.0, 'F_x', 0.0, 'F_y', 0.0, 'F_z', 0.0);
nodes(11) = struct('x', 0.0, 'y', 1.0, 'z', 3.0, 'F_x', 0.0, 'F_y', 0.0, 'F_z', 0.0);
nodes(12) = struct('x', 1.0, 'y', 1.0, 'z', 3.0, 'F_x', 0.0, 'F_y', 0.0, 'F_z', 0.0);
% Tier 4
nodes(13) = struct('x', 0.0, 'y', 0.0, 'z', 4.0, 'F_x', 0.0, 'F_y', 0.0, 'F_z', 0.0);
nodes(14) = struct('x', 1.0, 'y', 0.0, 'z', 4.0, 'F_x', 0.0, 'F_y', 0.0, 'F_z', 0.0);
nodes(15) = struct('x', 0.0, 'y', 1.0, 'z', 4.0, 'F_x', 0.0, 'F_y', 0.0, 'F_z', 0.0);
nodes(16) = struct('x', 1.0, 'y', 1.0, 'z', 4.0, 'F_x', 0.0, 'F_y', 0.0, 'F_z', 0.0);
% Tier 5
nodes(17) = struct('x', 0.0, 'y', 0.0, 'z', 5.0, 'F_x', 0.0, 'F_y', -100.0, 'F_z', 0.0);
nodes(18) = struct('x', 1.0, 'y', 0.0, 'z', 5.0, 'F_x', 0.0, 'F_y', 0.0, 'F_z', 0.0);
nodes(19) = struct('x', 0.0, 'y', 1.0, 'z', 5.0, 'F_x', 0.0, 'F_y', 0.0, 'F_z', 0.0);
nodes(20) = struct('x', 1.0, 'y', 1.0, 'z', 5.0, 'F_x', 100.0, 'F_y', 0.0, 'F_z', -200.0);




%%%%%%%%%%%%%%%%%% BEAMS 

num_of_g_beams = 4;
num_of_beams = 36; 

k_par = 1000.00;
k_perp = 500.00;
break_par = 0.101;
break_perp = 0.101;

% Tier 1
g_beams(1) = struct('start', 1, 'end', 1, 't', 1.0, 'k_par', k_par, 'k_perp', k_perp, 'break_par', break_par, 'break_perp', break_perp);
g_beams(2) = struct('start', 2, 'end', 2, 't', 1.0, 'k_par', k_par, 'k_perp', k_perp, 'break_par', break_par, 'break_perp', break_perp);
g_beams(3) = struct('start', 3, 'end', 3, 't', 1.0, 'k_par', k_par, 'k_perp', k_perp, 'break_par', break_par, 'break_perp', break_perp);
g_beams(4) = struct('start', 4, 'end', 4, 't', 1.0, 'k_par', k_par, 'k_perp', k_perp, 'break_par', break_par, 'break_perp', break_perp);

beams(1) = struct('start', 1, 'end', 2, 't', 1.0, 'k_par', k_par, 'k_perp', k_perp, 'break_par', break_par, 'break_perp', break_perp);
beams(2) = struct('start', 1, 'end', 3, 't', 1.0, 'k_par', k_par, 'k_perp', k_perp, 'break_par', break_par, 'break_perp', break_perp);
beams(3) = struct('start', 2, 'end', 4, 't', 1.0, 'k_par', k_par, 'k_perp', k_perp, 'break_par', break_par, 'break_perp', break_perp);
beams(4) = struct('start', 3, 'end', 4, 't', 1.0, 'k_par', k_par, 'k_perp', k_perp, 'break_par', break_par, 'break_perp', break_perp);
% Tier 2
beams(5) = struct('start', 1, 'end', 5, 't', 1.0, 'k_par', k_par, 'k_perp', k_perp, 'break_par', break_par, 'break_perp', break_perp);
beams(6) = struct('start', 2, 'end', 6, 't', 1.0, 'k_par', k_par, 'k_perp', k_perp, 'break_par', break_par, 'break_perp', break_perp);
beams(7) = struct('start', 3, 'end', 7, 't', 1.0, 'k_par', k_par, 'k_perp', k_perp, 'break_par', break_par, 'break_perp', break_perp);
beams(8) = struct('start', 4, 'end', 8, 't', 1.0, 'k_par', k_par, 'k_perp', k_perp, 'break_par', break_par, 'break_perp', break_perp);
beams(9) = struct('start', 5, 'end', 6, 't', 1.0, 'k_par', k_par, 'k_perp', k_perp, 'break_par', break_par, 'break_perp', break_perp);
beams(10) = struct('start', 5, 'end', 7, 't', 1.0, 'k_par', k_par, 'k_perp', k_perp, 'break_par', break_par, 'break_perp', break_perp);
beams(11) = struct('start', 6, 'end', 8, 't', 1.0, 'k_par', k_par, 'k_perp', k_perp, 'break_par', break_par, 'break_perp', break_perp);
beams(12) = struct('start', 7, 'end', 8, 't', 1.0, 'k_par', k_par, 'k_perp', k_perp, 'break_par', break_par, 'break_perp', break_perp);
% Tier 3
beams(13) = struct('start', 5, 'end', 9, 't', 1.0, 'k_par', k_par, 'k_perp', k_perp, 'break_par', break_par, 'break_perp', break_perp);
beams(14) = struct('start', 6, 'end', 10, 't', 1.0, 'k_par', k_par, 'k_perp', k_perp, 'break_par', break_par, 'break_perp', break_perp);
beams(15) = struct('start', 7, 'end', 11, 't', 1.0, 'k_par', k_par, 'k_perp', k_perp, 'break_par', break_par, 'break_perp', break_perp);
beams(16) = struct('start', 8, 'end', 12, 't', 1.0, 'k_par', k_par, 'k_perp', k_perp, 'break_par', break_par, 'break_perp', break_perp);
beams(17) = struct('start', 9, 'end', 10, 't', 1.0, 'k_par', k_par, 'k_perp', k_perp, 'break_par', break_par, 'break_perp', break_perp);
beams(18) = struct('start', 9, 'end', 11, 't', 1.0, 'k_par', k_par, 'k_perp', k_perp, 'break_par', break_par, 'break_perp', break_perp);
beams(19) = struct('start', 10, 'end', 12, 't', 1.0, 'k_par', k_par, 'k_perp', k_perp, 'break_par', break_par, 'break_perp', break_perp);
beams(20) = struct('start', 11, 'end', 12, 't', 1.0, 'k_par', k_par, 'k_perp', k_perp, 'break_par', break_par, 'break_perp', break_perp);
% Tier 4
beams(21) = struct('start', 9, 'end', 13, 't', 1.0, 'k_par', k_par, 'k_perp', k_perp, 'break_par', break_par, 'break_perp', break_perp);
beams(22) = struct('start', 10, 'end', 14, 't', 1.0, 'k_par', k_par, 'k_perp', k_perp, 'break_par', break_par, 'break_perp', break_perp);
beams(23) = struct('start', 11, 'end', 15, 't', 1.0, 'k_par', k_par, 'k_perp', k_perp, 'break_par', break_par, 'break_perp', break_perp);
beams(24) = struct('start', 12, 'end', 16, 't', 1.0, 'k_par', k_par, 'k_perp', k_perp, 'break_par', break_par, 'break_perp', break_perp);
beams(25) = struct('start', 13, 'end', 14, 't', 1.0, 'k_par', k_par, 'k_perp', k_perp, 'break_par', break_par, 'break_perp', break_perp);
beams(26) = struct('start', 13, 'end', 15, 't', 1.0, 'k_par', k_par, 'k_perp', k_perp, 'break_par', break_par, 'break_perp', break_perp);
beams(27) = struct('start', 14, 'end', 16, 't', 1.0, 'k_par', k_par, 'k_perp', k_perp, 'break_par', break_par, 'break_perp', break_perp);
beams(28) = struct('start', 15, 'end', 16, 't', 1.0, 'k_par', k_par, 'k_perp', k_perp, 'break_par', break_par, 'break_perp', break_perp);
% Tier 5
beams(29) = struct('start', 13, 'end', 17, 't', 1.0, 'k_par', k_par, 'k_perp', k_perp, 'break_par', break_par, 'break_perp', break_perp);
beams(30) = struct('start', 14, 'end', 18, 't', 1.0, 'k_par', k_par, 'k_perp', k_perp, 'break_par', break_par, 'break_perp', break_perp);
beams(31) = struct('start', 15, 'end', 19, 't', 1.0, 'k_par', k_par, 'k_perp', k_perp, 'break_par', break_par, 'break_perp', break_perp);
beams(32) = struct('start', 16, 'end', 20, 't', 1.0, 'k_par', k_par, 'k_perp', k_perp, 'break_par', break_par, 'break_perp', break_perp);
beams(33) = struct('start', 17, 'end', 18, 't', 1.0, 'k_par', k_par, 'k_perp', k_perp, 'break_par', break_par, 'break_perp', break_perp);
beams(34) = struct('start', 17, 'end', 19, 't', 1.0, 'k_par', k_par, 'k_perp', k_perp, 'break_par', break_par, 'break_perp', break_perp);
beams(35) = struct('start', 18, 'end', 20, 't', 1.0, 'k_par', k_par, 'k_perp', k_perp, 'break_par', break_par, 'break_perp', break_perp);
beams(36) = struct('start', 19, 'end', 20, 't', 1.0, 'k_par', k_par, 'k_perp', k_perp, 'break_par', break_par, 'break_perp', break_perp);






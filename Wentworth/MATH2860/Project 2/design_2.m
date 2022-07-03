

'ARM 2'


%%%%%%%%%%%%%%%%%% NODES 

g_nodes = [struct('name', 'anchor 1', 'x', 0.0, 'y', -0.5, 'z', -0.5);
           struct('name', 'anchor 2', 'x', 0.0, 'y', +0.5, 'z', -0.5);
           struct('name', 'anchor 3', 'x', 0.0, 'y', -0.5, 'z', +0.5);
           struct('name', 'anchor 4', 'x', 0.0, 'y', +0.5, 'z', +0.5)];


nodes = [struct('name', 'loaded point', 'x', 8.0, 'y', 0.0, 'z', 0.0, 'F_x', 0.0, 'F_y', 0.0, 'F_z', -0.1, 'tau_x', 0.0, 'tau_y', 0.0, 'tau_z', 0.0);
         struct('name', 'lattice 1, x=1', 'x', 1.0, 'y', -0.5, 'z', -0.5, 'F_x', 0.0, 'F_y', 0.0, 'F_z', 0.0, 'tau_x', 0.0, 'tau_y', 0.0, 'tau_z', 0.0);
         struct('name', 'lattice 2, x=1', 'x', 1.0, 'y', +0.5, 'z', -0.5, 'F_x', 0.0, 'F_y', 0.0, 'F_z', 0.0, 'tau_x', 0.0, 'tau_y', 0.0, 'tau_z', 0.0);
         struct('name', 'lattice 3, x=1', 'x', 1.0, 'y', -0.5, 'z', +0.5, 'F_x', 0.0, 'F_y', 0.0, 'F_z', 0.0, 'tau_x', 0.0, 'tau_y', 0.0, 'tau_z', 0.0);
         struct('name', 'lattice 4, x=1', 'x', 1.0, 'y', +0.5, 'z', +0.5, 'F_x', 0.0, 'F_y', 0.0, 'F_z', 0.0, 'tau_x', 0.0, 'tau_y', 0.0, 'tau_z', 0.0);
         struct('name', 'lattice 1, x=2', 'x', 2.0, 'y', -0.5, 'z', -0.5, 'F_x', 0.0, 'F_y', 0.0, 'F_z', 0.0, 'tau_x', 0.0, 'tau_y', 0.0, 'tau_z', 0.0);
         struct('name', 'lattice 2, x=2', 'x', 2.0, 'y', +0.5, 'z', -0.5, 'F_x', 0.0, 'F_y', 0.0, 'F_z', 0.0, 'tau_x', 0.0, 'tau_y', 0.0, 'tau_z', 0.0);
         struct('name', 'lattice 3, x=2', 'x', 2.0, 'y', -0.5, 'z', +0.5, 'F_x', 0.0, 'F_y', 0.0, 'F_z', 0.0, 'tau_x', 0.0, 'tau_y', 0.0, 'tau_z', 0.0);
         struct('name', 'lattice 4, x=2', 'x', 2.0, 'y', +0.5, 'z', +0.5, 'F_x', 0.0, 'F_y', 0.0, 'F_z', 0.0, 'tau_x', 0.0, 'tau_y', 0.0, 'tau_z', 0.0);
         struct('name', 'lattice 1, x=3', 'x', 3.0, 'y', -0.5, 'z', -0.5, 'F_x', 0.0, 'F_y', 0.0, 'F_z', 0.0, 'tau_x', 0.0, 'tau_y', 0.0, 'tau_z', 0.0);
         struct('name', 'lattice 2, x=3', 'x', 3.0, 'y', +0.5, 'z', -0.5, 'F_x', 0.0, 'F_y', 0.0, 'F_z', 0.0, 'tau_x', 0.0, 'tau_y', 0.0, 'tau_z', 0.0);
         struct('name', 'lattice 3, x=3', 'x', 3.0, 'y', -0.5, 'z', +0.5, 'F_x', 0.0, 'F_y', 0.0, 'F_z', 0.0, 'tau_x', 0.0, 'tau_y', 0.0, 'tau_z', 0.0);
         struct('name', 'lattice 4, x=3', 'x', 3.0, 'y', +0.5, 'z', +0.5, 'F_x', 0.0, 'F_y', 0.0, 'F_z', 0.0, 'tau_x', 0.0, 'tau_y', 0.0, 'tau_z', 0.0);
         struct('name', 'lattice 1, x=4', 'x', 4.0, 'y', -0.5, 'z', -0.5, 'F_x', 0.0, 'F_y', 0.0, 'F_z', 0.0, 'tau_x', 0.0, 'tau_y', 0.0, 'tau_z', 0.0);
         struct('name', 'lattice 2, x=4', 'x', 4.0, 'y', +0.5, 'z', -0.5, 'F_x', 0.0, 'F_y', 0.0, 'F_z', 0.0, 'tau_x', 0.0, 'tau_y', 0.0, 'tau_z', 0.0);
         struct('name', 'lattice 3, x=4', 'x', 4.0, 'y', -0.5, 'z', +0.5, 'F_x', 0.0, 'F_y', 0.0, 'F_z', 0.0, 'tau_x', 0.0, 'tau_y', 0.0, 'tau_z', 0.0);
         struct('name', 'lattice 4, x=4', 'x', 4.0, 'y', +0.5, 'z', +0.5, 'F_x', 0.0, 'F_y', 0.0, 'F_z', 0.0, 'tau_x', 0.0, 'tau_y', 0.0, 'tau_z', 0.0);
         struct('name', 'lattice 1, x=5', 'x', 5.0, 'y', -0.5, 'z', -0.5, 'F_x', 0.0, 'F_y', 0.0, 'F_z', 0.0, 'tau_x', 0.0, 'tau_y', 0.0, 'tau_z', 0.0);
         struct('name', 'lattice 2, x=5', 'x', 5.0, 'y', +0.5, 'z', -0.5, 'F_x', 0.0, 'F_y', 0.0, 'F_z', 0.0, 'tau_x', 0.0, 'tau_y', 0.0, 'tau_z', 0.0);
         struct('name', 'lattice 3, x=5', 'x', 5.0, 'y', -0.5, 'z', +0.5, 'F_x', 0.0, 'F_y', 0.0, 'F_z', 0.0, 'tau_x', 0.0, 'tau_y', 0.0, 'tau_z', 0.0);
         struct('name', 'lattice 4, x=5', 'x', 5.0, 'y', +0.5, 'z', +0.5, 'F_x', 0.0, 'F_y', 0.0, 'F_z', 0.0, 'tau_x', 0.0, 'tau_y', 0.0, 'tau_z', 0.0);
         struct('name', 'lattice 1, x=6', 'x', 6.0, 'y', -0.5, 'z', -0.5, 'F_x', 0.0, 'F_y', 0.0, 'F_z', 0.0, 'tau_x', 0.0, 'tau_y', 0.0, 'tau_z', 0.0);
         struct('name', 'lattice 2, x=6', 'x', 6.0, 'y', +0.5, 'z', -0.5, 'F_x', 0.0, 'F_y', 0.0, 'F_z', 0.0, 'tau_x', 0.0, 'tau_y', 0.0, 'tau_z', 0.0);
         struct('name', 'lattice 3, x=6', 'x', 6.0, 'y', -0.5, 'z', +0.5, 'F_x', 0.0, 'F_y', 0.0, 'F_z', 0.0, 'tau_x', 0.0, 'tau_y', 0.0, 'tau_z', 0.0);
         struct('name', 'lattice 4, x=6', 'x', 6.0, 'y', +0.5, 'z', +0.5, 'F_x', 0.0, 'F_y', 0.0, 'F_z', 0.0, 'tau_x', 0.0, 'tau_y', 0.0, 'tau_z', 0.0);
         struct('name', 'lattice 1, x=7', 'x', 7.0, 'y', -0.5, 'z', -0.5, 'F_x', 0.0, 'F_y', 0.0, 'F_z', 0.0, 'tau_x', 0.0, 'tau_y', 0.0, 'tau_z', 0.0);
         struct('name', 'lattice 2, x=7', 'x', 7.0, 'y', +0.5, 'z', -0.5, 'F_x', 0.0, 'F_y', 0.0, 'F_z', 0.0, 'tau_x', 0.0, 'tau_y', 0.0, 'tau_z', 0.0);
         struct('name', 'lattice 3, x=7', 'x', 7.0, 'y', -0.5, 'z', +0.5, 'F_x', 0.0, 'F_y', 0.0, 'F_z', 0.0, 'tau_x', 0.0, 'tau_y', 0.0, 'tau_z', 0.0);
         struct('name', 'lattice 4, x=7', 'x', 7.0, 'y', +0.5, 'z', +0.5, 'F_x', 0.0, 'F_y', 0.0, 'F_z', 0.0, 'tau_x', 0.0, 'tau_y', 0.0, 'tau_z', 0.0);
         struct('name', 'lattice 1, x=8', 'x', 8.0, 'y', -0.5, 'z', -0.5, 'F_x', 0.0, 'F_y', 0.0, 'F_z', 0.0, 'tau_x', 0.0, 'tau_y', 0.0, 'tau_z', 0.0);
         struct('name', 'lattice 2, x=8', 'x', 8.0, 'y', +0.5, 'z', -0.5, 'F_x', 0.0, 'F_y', 0.0, 'F_z', 0.0, 'tau_x', 0.0, 'tau_y', 0.0, 'tau_z', 0.0);
         struct('name', 'lattice 3, x=8', 'x', 8.0, 'y', -0.5, 'z', +0.5, 'F_x', 0.0, 'F_y', 0.0, 'F_z', 0.0, 'tau_x', 0.0, 'tau_y', 0.0, 'tau_z', 0.0);
         struct('name', 'lattice 4, x=8', 'x', 8.0, 'y', +0.5, 'z', +0.5, 'F_x', 0.0, 'F_y', 0.0, 'F_z', 0.0, 'tau_x', 0.0, 'tau_y', 0.0, 'tau_z', 0.0)];



%%%%%%%%%%%%%%%%%% BEAMS 

% Stright beams
beams = [struct('start', 'anchor 1', 'end', 'lattice 1, x=1', 't', 4.0);
         struct('start', 'anchor 2', 'end', 'lattice 2, x=1', 't', 4.0);
         struct('start', 'anchor 3', 'end', 'lattice 3, x=1', 't', 4.0);
         struct('start', 'anchor 4', 'end', 'lattice 4, x=1', 't', 4.0);
         struct('start', 'lattice 1, x=1', 'end', 'lattice 1, x=2', 't', 3.0);
         struct('start', 'lattice 2, x=1', 'end', 'lattice 2, x=2', 't', 3.0);
         struct('start', 'lattice 3, x=1', 'end', 'lattice 3, x=2', 't', 3.0);
         struct('start', 'lattice 4, x=1', 'end', 'lattice 4, x=2', 't', 3.0);
         struct('start', 'lattice 1, x=2', 'end', 'lattice 1, x=3', 't', 2.0);
         struct('start', 'lattice 2, x=2', 'end', 'lattice 2, x=3', 't', 2.0);
         struct('start', 'lattice 3, x=2', 'end', 'lattice 3, x=3', 't', 2.0);
         struct('start', 'lattice 4, x=2', 'end', 'lattice 4, x=3', 't', 2.0);
         struct('start', 'lattice 1, x=3', 'end', 'lattice 1, x=4', 't', 1.0);
         struct('start', 'lattice 2, x=3', 'end', 'lattice 2, x=4', 't', 1.0);
         struct('start', 'lattice 3, x=3', 'end', 'lattice 3, x=4', 't', 1.0);
         struct('start', 'lattice 4, x=3', 'end', 'lattice 4, x=4', 't', 1.0);
         struct('start', 'lattice 1, x=4', 'end', 'lattice 1, x=5', 't', 1.0);
         struct('start', 'lattice 2, x=4', 'end', 'lattice 2, x=5', 't', 1.0);
         struct('start', 'lattice 3, x=4', 'end', 'lattice 3, x=5', 't', 1.0);
         struct('start', 'lattice 4, x=4', 'end', 'lattice 4, x=5', 't', 1.0);
         struct('start', 'lattice 1, x=5', 'end', 'lattice 1, x=6', 't', 1.0);
         struct('start', 'lattice 2, x=5', 'end', 'lattice 2, x=6', 't', 1.0);
         struct('start', 'lattice 3, x=5', 'end', 'lattice 3, x=6', 't', 1.0);
         struct('start', 'lattice 4, x=5', 'end', 'lattice 4, x=6', 't', 1.0);
         struct('start', 'lattice 1, x=6', 'end', 'lattice 1, x=7', 't', 1.0);
         struct('start', 'lattice 2, x=6', 'end', 'lattice 2, x=7', 't', 1.0);
         struct('start', 'lattice 3, x=6', 'end', 'lattice 3, x=7', 't', 1.0);
         struct('start', 'lattice 4, x=6', 'end', 'lattice 4, x=7', 't', 1.0);
         struct('start', 'lattice 1, x=7', 'end', 'lattice 1, x=8', 't', 1.0);
         struct('start', 'lattice 2, x=7', 'end', 'lattice 2, x=8', 't', 1.0);
         struct('start', 'lattice 3, x=7', 'end', 'lattice 3, x=8', 't', 1.0);
         struct('start', 'lattice 4, x=7', 'end', 'lattice 4, x=8', 't', 1.0);
         struct('start', 'lattice 1, x=8', 'end', 'loaded point', 't', 0.5);
         struct('start', 'lattice 2, x=8', 'end', 'loaded point', 't', 0.5);
         struct('start', 'lattice 3, x=8', 'end', 'loaded point', 't', 0.5);
         struct('start', 'lattice 4, x=8', 'end', 'loaded point', 't', 0.5);
% Cross beams
         struct('start', 'anchor 1', 'end', 'lattice 3, x=1', 't', 5.0);
         struct('start', 'anchor 2', 'end', 'lattice 4, x=1', 't', 5.0);
         struct('start', 'anchor 3', 'end', 'lattice 1, x=1', 't', 5.0);
         struct('start', 'anchor 4', 'end', 'lattice 2, x=1', 't', 5.0);
         struct('start', 'lattice 1, x=1', 'end', 'lattice 3, x=2', 't', 3.0);
         struct('start', 'lattice 2, x=1', 'end', 'lattice 4, x=2', 't', 3.0);
         struct('start', 'lattice 3, x=1', 'end', 'lattice 1, x=2', 't', 3.0);
         struct('start', 'lattice 4, x=1', 'end', 'lattice 2, x=2', 't', 3.0);
         struct('start', 'lattice 1, x=2', 'end', 'lattice 3, x=3', 't', 2.0);
         struct('start', 'lattice 2, x=2', 'end', 'lattice 4, x=3', 't', 2.0);
         struct('start', 'lattice 3, x=2', 'end', 'lattice 1, x=3', 't', 2.0);
         struct('start', 'lattice 4, x=2', 'end', 'lattice 2, x=3', 't', 2.0);
         struct('start', 'lattice 1, x=3', 'end', 'lattice 3, x=4', 't', 2.0);
         struct('start', 'lattice 2, x=3', 'end', 'lattice 4, x=4', 't', 2.0);
         struct('start', 'lattice 3, x=3', 'end', 'lattice 1, x=4', 't', 2.0);
         struct('start', 'lattice 4, x=3', 'end', 'lattice 2, x=4', 't', 2.0);
         struct('start', 'lattice 1, x=4', 'end', 'lattice 3, x=5', 't', 2.0);
         struct('start', 'lattice 2, x=4', 'end', 'lattice 4, x=5', 't', 2.0);
         struct('start', 'lattice 3, x=4', 'end', 'lattice 1, x=5', 't', 2.0);
         struct('start', 'lattice 4, x=4', 'end', 'lattice 2, x=5', 't', 2.0);
         struct('start', 'lattice 1, x=5', 'end', 'lattice 3, x=6', 't', 2.0);
         struct('start', 'lattice 2, x=5', 'end', 'lattice 4, x=6', 't', 2.0);
         struct('start', 'lattice 3, x=5', 'end', 'lattice 1, x=6', 't', 2.0);
         struct('start', 'lattice 4, x=5', 'end', 'lattice 2, x=6', 't', 2.0);
         struct('start', 'lattice 1, x=6', 'end', 'lattice 3, x=7', 't', 1.0);
         struct('start', 'lattice 2, x=6', 'end', 'lattice 4, x=7', 't', 1.0);
         struct('start', 'lattice 3, x=6', 'end', 'lattice 1, x=7', 't', 1.0);
         struct('start', 'lattice 4, x=6', 'end', 'lattice 2, x=7', 't', 1.0);
         struct('start', 'lattice 1, x=7', 'end', 'lattice 3, x=8', 't', 0.5);
         struct('start', 'lattice 2, x=7', 'end', 'lattice 4, x=8', 't', 0.5);
         struct('start', 'lattice 3, x=7', 'end', 'lattice 1, x=8', 't', 0.5);
         struct('start', 'lattice 4, x=7', 'end', 'lattice 2, x=8', 't', 0.5);
% Vertical beams
         struct('start', 'lattice 1, x=1', 'end', 'lattice 2, x=1', 't', 1.0);
         struct('start', 'lattice 1, x=1', 'end', 'lattice 3, x=1', 't', 1.0);
         struct('start', 'lattice 2, x=1', 'end', 'lattice 4, x=1', 't', 1.0);
         struct('start', 'lattice 3, x=1', 'end', 'lattice 4, x=1', 't', 1.0)];







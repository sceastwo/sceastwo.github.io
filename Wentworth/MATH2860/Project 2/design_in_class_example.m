

'Basic design'


%%%%%%%%%%%%%%%%%% NODES 

% Do not introduce any other fixed nodes.
g_nodes = [struct('name', 'anchor 1', 'x', 0.0, 'y', -0.5, 'z', -0.5);
           struct('name', 'anchor 2', 'x', 0.0, 'y', +0.5, 'z', -0.5);
           struct('name', 'anchor 3', 'x', 0.0, 'y', -0.5, 'z', +0.5);
           struct('name', 'anchor 4', 'x', 0.0, 'y', +0.5, 'z', +0.5)];

% This is the node that must be supported. 
nodes = [struct('name', 'loaded point', 'x', 8.0, 'y', 0.0, 'z', 0.0, 'F_x', 0.0, 'F_y', 0.0, 'F_z', -0.1, 'tau_x', 0.0, 'tau_y', 0.0, 'tau_z', 0.0);
%%%% INSERT NEW NODES HERE. %%%%%%
%%%% The forces on all new nodes must be 0. %%%%%%
      struct('name', 'layer 1 1', 'x', 1.0, 'y', -0.5, 'z', -0.5, 'F_x', 0.0, 'F_y', 0.0, 'F_z', 0.0, 'tau_x', 0.0, 'tau_y', 0.0, 'tau_z', 0.0);
      struct('name', 'layer 1 2', 'x', 1.0, 'y', 0.5, 'z', -0.5, 'F_x', 0.0, 'F_y', 0.0, 'F_z', 0.0, 'tau_x', 0.0, 'tau_y', 0.0, 'tau_z', 0.0);
      struct('name', 'layer 1 3', 'x', 1.0, 'y', 0.0, 'z', 0.5, 'F_x', 0.0, 'F_y', 0.0, 'F_z', 0.0, 'tau_x', 0.0, 'tau_y', 0.0, 'tau_z', 0.0);
      struct('name', 'layer 2 1', 'x', 2.0, 'y', -0.5, 'z', -0.5, 'F_x', 0.0, 'F_y', 0.0, 'F_z', 0.0, 'tau_x', 0.0, 'tau_y', 0.0, 'tau_z', 0.0);
      struct('name', 'layer 2 2', 'x', 2.0, 'y', 0.5, 'z', -0.5, 'F_x', 0.0, 'F_y', 0.0, 'F_z', 0.0, 'tau_x', 0.0, 'tau_y', 0.0, 'tau_z', 0.0);
      struct('name', 'layer 2 3', 'x', 2.0, 'y', 0.0, 'z', 0.5, 'F_x', 0.0, 'F_y', 0.0, 'F_z', 0.0, 'tau_x', 0.0, 'tau_y', 0.0, 'tau_z', 0.0);
      struct('name', 'layer 3 1', 'x', 3.0, 'y', -0.5, 'z', -0.5, 'F_x', 0.0, 'F_y', 0.0, 'F_z', 0.0, 'tau_x', 0.0, 'tau_y', 0.0, 'tau_z', 0.0);
      struct('name', 'layer 3 2', 'x', 3.0, 'y', 0.5, 'z', -0.5, 'F_x', 0.0, 'F_y', 0.0, 'F_z', 0.0, 'tau_x', 0.0, 'tau_y', 0.0, 'tau_z', 0.0);
      struct('name', 'layer 3 3', 'x', 3.0, 'y', 0.0, 'z', 0.5, 'F_x', 0.0, 'F_y', 0.0, 'F_z', 0.0, 'tau_x', 0.0, 'tau_y', 0.0, 'tau_z', 0.0);
      struct('name', 'layer 4 1', 'x', 4.0, 'y', -0.5, 'z', -0.5, 'F_x', 0.0, 'F_y', 0.0, 'F_z', 0.0, 'tau_x', 0.0, 'tau_y', 0.0, 'tau_z', 0.0);
      struct('name', 'layer 4 2', 'x', 4.0, 'y', 0.5, 'z', -0.5, 'F_x', 0.0, 'F_y', 0.0, 'F_z', 0.0, 'tau_x', 0.0, 'tau_y', 0.0, 'tau_z', 0.0);
      struct('name', 'layer 4 3', 'x', 4.0, 'y', 0.0, 'z', 0.5, 'F_x', 0.0, 'F_y', 0.0, 'F_z', 0.0, 'tau_x', 0.0, 'tau_y', 0.0, 'tau_z', 0.0);
      struct('name', 'layer 5 1', 'x', 5.0, 'y', -0.5, 'z', -0.5, 'F_x', 0.0, 'F_y', 0.0, 'F_z', 0.0, 'tau_x', 0.0, 'tau_y', 0.0, 'tau_z', 0.0);
      struct('name', 'layer 5 2', 'x', 5.0, 'y', 0.5, 'z', -0.5, 'F_x', 0.0, 'F_y', 0.0, 'F_z', 0.0, 'tau_x', 0.0, 'tau_y', 0.0, 'tau_z', 0.0);
      struct('name', 'layer 5 3', 'x', 5.0, 'y', 0.0, 'z', 0.5, 'F_x', 0.0, 'F_y', 0.0, 'F_z', 0.0, 'tau_x', 0.0, 'tau_y', 0.0, 'tau_z', 0.0);
      struct('name', 'layer 6 1', 'x', 6.0, 'y', -0.5, 'z', -0.5, 'F_x', 0.0, 'F_y', 0.0, 'F_z', 0.0, 'tau_x', 0.0, 'tau_y', 0.0, 'tau_z', 0.0);
      struct('name', 'layer 6 2', 'x', 6.0, 'y', 0.5, 'z', -0.5, 'F_x', 0.0, 'F_y', 0.0, 'F_z', 0.0, 'tau_x', 0.0, 'tau_y', 0.0, 'tau_z', 0.0);
      struct('name', 'layer 6 3', 'x', 6.0, 'y', 0.0, 'z', 0.5, 'F_x', 0.0, 'F_y', 0.0, 'F_z', 0.0, 'tau_x', 0.0, 'tau_y', 0.0, 'tau_z', 0.0);
      struct('name', 'layer 7 1', 'x', 7.0, 'y', -0.5, 'z', -0.5, 'F_x', 0.0, 'F_y', 0.0, 'F_z', 0.0, 'tau_x', 0.0, 'tau_y', 0.0, 'tau_z', 0.0);
      struct('name', 'layer 7 2', 'x', 7.0, 'y', 0.5, 'z', -0.5, 'F_x', 0.0, 'F_y', 0.0, 'F_z', 0.0, 'tau_x', 0.0, 'tau_y', 0.0, 'tau_z', 0.0);
      struct('name', 'layer 7 3', 'x', 7.0, 'y', 0.0, 'z', 0.5, 'F_x', 0.0, 'F_y', 0.0, 'F_z', 0.0, 'tau_x', 0.0, 'tau_y', 0.0, 'tau_z', 0.0)];


%%%%%%%%%%%%%%%%%% BEAMS 

% Freely alter the beams below, and introduce new beams.
beams = [struct('start', 'anchor 1', 'end', 'layer 1 1', 't', 32.0);
         struct('start', 'anchor 2', 'end', 'layer 1 2', 't', 32.0);
         struct('start', 'anchor 3', 'end', 'layer 1 3', 't', 32.0);
         struct('start', 'anchor 4', 'end', 'layer 1 3', 't', 32.0);
         %%%%%%%%%%%%%%%%%%%%%%%%
         struct('start', 'anchor 1', 'end', 'layer 1 2', 't', 32.0);
         struct('start', 'anchor 2', 'end', 'layer 1 3', 't', 32.0);
         struct('start', 'anchor 3', 'end', 'layer 1 1', 't', 32.0);
         struct('start', 'anchor 4', 'end', 'layer 1 1', 't', 32.0);
         %%%%%%%%%%%%%%%%%%%%%%%%
         struct('start', 'layer 1 1', 'end', 'layer 1 2', 't', 0.5);
         struct('start', 'layer 1 2', 'end', 'layer 1 3', 't', 0.5);
         struct('start', 'layer 1 3', 'end', 'layer 1 1', 't', 0.5);
         %%%%%%%%%%%%%%%%%%%%%%%%
         struct('start', 'layer 1 1', 'end', 'layer 2 1', 't', 16.0);
         struct('start', 'layer 1 2', 'end', 'layer 2 2', 't', 16.0);
         struct('start', 'layer 1 3', 'end', 'layer 2 3', 't', 16.0);
         %%%%%%%%%%%%%%%%%%%%%%%%
         struct('start', 'layer 1 1', 'end', 'layer 2 2', 't', 16.0);
         struct('start', 'layer 1 2', 'end', 'layer 2 3', 't', 16.0);
         struct('start', 'layer 1 3', 'end', 'layer 2 1', 't', 16.0);
         %%%%%%%%%%%%%%%%%%%%%%%%
         struct('start', 'layer 2 1', 'end', 'layer 2 2', 't', 0.5);
         struct('start', 'layer 2 2', 'end', 'layer 2 3', 't', 0.5);
         struct('start', 'layer 2 3', 'end', 'layer 2 1', 't', 0.5);
         %%%%%%%%%%%%%%%%%%%%%%%%
         struct('start', 'layer 2 1', 'end', 'layer 3 1', 't', 8.0);
         struct('start', 'layer 2 2', 'end', 'layer 3 2', 't', 8.0);
         struct('start', 'layer 2 3', 'end', 'layer 3 3', 't', 8.0);
         %%%%%%%%%%%%%%%%%%%%%%%%
         struct('start', 'layer 2 1', 'end', 'layer 3 2', 't', 8.0);
         struct('start', 'layer 2 2', 'end', 'layer 3 3', 't', 8.0);
         struct('start', 'layer 2 3', 'end', 'layer 3 1', 't', 8.0);
         %%%%%%%%%%%%%%%%%%%%%%%%
         struct('start', 'layer 3 1', 'end', 'layer 3 2', 't', 0.25);
         struct('start', 'layer 3 2', 'end', 'layer 3 3', 't', 0.25);
         struct('start', 'layer 3 3', 'end', 'layer 3 1', 't', 0.25);
         %%%%%%%%%%%%%%%%%%%%%%%%
         struct('start', 'layer 3 1', 'end', 'layer 4 1', 't', 4.0);
         struct('start', 'layer 3 2', 'end', 'layer 4 2', 't', 4.0);
         struct('start', 'layer 3 3', 'end', 'layer 4 3', 't', 4.0);
         %%%%%%%%%%%%%%%%%%%%%%%%
         struct('start', 'layer 3 1', 'end', 'layer 4 2', 't', 4.0);
         struct('start', 'layer 3 2', 'end', 'layer 4 3', 't', 4.0);
         struct('start', 'layer 3 3', 'end', 'layer 4 1', 't', 4.0);
         %%%%%%%%%%%%%%%%%%%%%%%%
         struct('start', 'layer 4 1', 'end', 'layer 4 2', 't', 0.25);
         struct('start', 'layer 4 2', 'end', 'layer 4 3', 't', 0.25);
         struct('start', 'layer 4 3', 'end', 'layer 4 1', 't', 0.25);
         %%%%%%%%%%%%%%%%%%%%%%%%
         struct('start', 'layer 4 1', 'end', 'layer 5 1', 't', 2.0);
         struct('start', 'layer 4 2', 'end', 'layer 5 2', 't', 2.0);
         struct('start', 'layer 4 3', 'end', 'layer 5 3', 't', 2.0);
         %%%%%%%%%%%%%%%%%%%%%%%%
         struct('start', 'layer 4 1', 'end', 'layer 5 2', 't', 2.0);
         struct('start', 'layer 4 2', 'end', 'layer 5 3', 't', 2.0);
         struct('start', 'layer 4 3', 'end', 'layer 5 1', 't', 2.0);
         %%%%%%%%%%%%%%%%%%%%%%%%
         struct('start', 'layer 5 1', 'end', 'layer 5 2', 't', 0.125);
         struct('start', 'layer 5 2', 'end', 'layer 5 3', 't', 0.125);
         struct('start', 'layer 5 3', 'end', 'layer 5 1', 't', 0.125);
         %%%%%%%%%%%%%%%%%%%%%%%%
         struct('start', 'layer 5 1', 'end', 'layer 6 1', 't', 1.0);
         struct('start', 'layer 5 2', 'end', 'layer 6 2', 't', 1.0);
         struct('start', 'layer 5 3', 'end', 'layer 6 3', 't', 1.0);
         %%%%%%%%%%%%%%%%%%%%%%%%
         struct('start', 'layer 5 1', 'end', 'layer 6 2', 't', 1.0);
         struct('start', 'layer 5 2', 'end', 'layer 6 3', 't', 1.0);
         struct('start', 'layer 5 3', 'end', 'layer 6 1', 't', 1.0);
         %%%%%%%%%%%%%%%%%%%%%%%%
         struct('start', 'layer 6 1', 'end', 'layer 6 2', 't', 0.125);
         struct('start', 'layer 6 2', 'end', 'layer 6 3', 't', 0.125);
         struct('start', 'layer 6 3', 'end', 'layer 6 1', 't', 0.125);
         %%%%%%%%%%%%%%%%%%%%%%%%
         struct('start', 'layer 6 1', 'end', 'layer 7 1', 't', 0.5);
         struct('start', 'layer 6 2', 'end', 'layer 7 2', 't', 0.5);
         struct('start', 'layer 6 3', 'end', 'layer 7 3', 't', 0.5);
         %%%%%%%%%%%%%%%%%%%%%%%%
         struct('start', 'layer 6 1', 'end', 'layer 7 2', 't', 0.5);
         struct('start', 'layer 6 2', 'end', 'layer 7 3', 't', 0.5);
         struct('start', 'layer 6 3', 'end', 'layer 7 1', 't', 0.5);
         %%%%%%%%%%%%%%%%%%%%%%%%
         struct('start', 'layer 7 1', 'end', 'layer 7 2', 't', 0.125);
         struct('start', 'layer 7 2', 'end', 'layer 7 3', 't', 0.125);
         struct('start', 'layer 7 3', 'end', 'layer 7 1', 't', 0.125);
         %%%%%%%%%%%%%%%%%%%%%%%%
         struct('start', 'layer 7 1', 'end', 'loaded point', 't', 0.25);
         struct('start', 'layer 7 2', 'end', 'loaded point', 't', 0.25);
         struct('start', 'layer 7 3', 'end', 'loaded point', 't', 0.25)];
     
     
     
     
     
     
     
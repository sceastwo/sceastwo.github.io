

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
%       struct('name', '???', 'x', ???, 'y', ???, 'z', ???, 'F_x', 0.0, 'F_y', 0.0, 'F_z', 0.0, 'tau_x', 0.0, 'tau_y', 0.0, 'tau_z', 0.0);
%       struct('name', '???', 'x', ???, 'y', ???, 'z', ???, 'F_x', 0.0, 'F_y', 0.0, 'F_z', 0.0, 'tau_x', 0.0, 'tau_y', 0.0, 'tau_z', 0.0);
%       struct('name', '???', 'x', ???, 'y', ???, 'z', ???, 'F_x', 0.0, 'F_y', 0.0, 'F_z', 0.0, 'tau_x', 0.0, 'tau_y', 0.0, 'tau_z', 0.0);
%       ... 
%       struct('name', '???', 'x', ???, 'y', ???, 'z', ???, 'F_x', 0.0, 'F_y', 0.0, 'F_z', 0.0, 'tau_x', 0.0, 'tau_y', 0.0, 'tau_z', 0.0)];


%%%%%%%%%%%%%%%%%% BEAMS 

% Freely alter the beams below, and introduce new beams.
% beams = [struct('start', '???', 'end', '???', 't', ???);
%          struct('start', '???', 'end', '???', 't', ???);
%          struct('start', '???', 'end', '???', 't', ???);
%          struct('start', '???', 'end', '???', 't', ???);
%          struct('start', '???', 'end', '???', 't', ???);
%          struct('start', '???', 'end', '???', 't', ???);
%          ...
%          struct('start', '???', 'end', '???', 't', ???)];





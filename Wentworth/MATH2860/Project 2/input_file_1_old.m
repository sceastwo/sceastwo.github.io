

'Input file 2'  


%%%%%%%%%%%%%%%%%% NODES 

num_of_g_nodes = 1;
num_of_nodes = 1; 



% num_of_g_nodes x 3 array of anchored node coordinates.
g_node_coordinates = [ ...
    0.0, 0.0, 0.0];

% num_of_nodes x 3 array of node coordinates.
node_coordinates = [ ...
    1.0, 0.0, 0.0];




%%%%%%%%%%%%%%%%%% BEAMS 

num_of_g_beams = 1;
num_of_beams = 0; 



% num_of_g_beams x 2 array of node indices. First index is an 
% anchored node, the second index is a non-anchored node.
g_beam_end_nodes = [ ... 
    1, 1];

% num_of_beams x 2 array of node indices. 0 = origin node.
beam_end_nodes = [ ...
    ]; 



% num_of_g_beams x 1 array of beam thicknesses.
g_beam_thicknesses = [ ... 
    1.0];

% num_of_beams x 1 array of beam thicknesses.
beam_thicknesses = [ ... 
    ]; 



% num_of_g_beams x 2 array of stiffness constants. The first column is the
% parallel stiffness, the second column is the shear stiffnesses. 
g_beam_stiffnesses = [ ...
    1000, 500]; 

% num_of_beams x 2 array of stiffness constants. The first column is the
% parallel stiffness, the second column is the shear stiffnesses. 
beam_stiffnesses = [ ...
    ]; 
    

% num_of_g_beams x 2 array of breaking rations. The first column is the
% parallel breaking ratio, the second column is the shear breaking ratio. 
g_beam_breaking_limits = [ ...
    0.1, 0.1]; 

% num_of_beams x 2 array of breaking rations. The first column is the
% parallel breaking ratio, the second column is the shear breaking ratio.
beam_breaking_limts = [ ...
    ]; 


%%%%%%%%%%%%%%%%%% FORCES 

% num_of_nodes x 3 array of forces
forces = [
    1.0, 1.0, 0.0];










'Input file'  


%%%%%%%%%%%%%%%%%% NODES 

num_of_g_nodes = 4;
num_of_nodes = 4; 



% num_of_g_nodes x 3 array of anchored node coordinates.
g_node_coordinates = [ ...
    0.0, 0.0, 0.0;
    1.0, 0.0, 0.0; 
    0.0, 1.0, 0.0;
    1.0, 1.0, 0.0];

% num_of_nodes x 3 array of node coordinates.
node_coordinates = [ ...
    0.0, 0.0, 1.0;
    1.0, 0.0, 1.0;
    0.0, 1.0, 1.0;
    1.0, 1.0, 1.0];




%%%%%%%%%%%%%%%%%% BEAMS 

num_of_g_beams = 4;
num_of_beams = 4; 



% num_of_g_beams x 2 array of node indices. First index is an 
% anchored node, the second index is a non-anchored node.
g_beam_end_nodes = [ ... 
    1, 1; 
    2, 2; 
    3, 3; 
    4, 4];

% num_of_beams x 2 array of node indices. 0 = origin node.
beam_end_nodes = [ ...
    1, 2; 
    1, 3; 
    2, 4; 
    3, 4]; 



% num_of_g_beams x 1 array of beam thicknesses.
g_beam_thicknesses = [ ... 
    1.0; 
    1.0; 
    1.0; 
    1.0];

% num_of_beams x 1 array of beam thicknesses.
beam_thicknesses = [ ... 
    1.0; 
    1.0; 
    1.0; 
    1.0]; 



% num_of_g_beams x 2 array of stiffness constants. The first column is the
% parallel stiffness, the second column is the shear stiffnesses. 
g_beam_stiffnesses = [ ...
    1000, 500; 
    1000, 500; 
    1000, 500; 
    1000, 500]; 

% num_of_beams x 2 array of stiffness constants. The first column is the
% parallel stiffness, the second column is the shear stiffnesses. 
beam_stiffnesses = [ ...
    1000, 500; 
    1000, 500; 
    1000, 500; 
    1000, 500]; 
    


% num_of_g_beams x 2 array of breaking rations. The first column is the
% parallel breaking ratio, the second column is the shear breaking ratio. 
g_beam_breaking_limits = [ ...
    0.1, 0.1;
    0.1, 0.1;
    0.1, 0.1;
    0.1, 0.1]; 

% num_of_beams x 2 array of breaking rations. The first column is the
% parallel breaking ratio, the second column is the shear breaking ratio.
beam_breaking_limits = [ ...
    0.1, 0.1;
    0.1, 0.1;
    0.1, 0.1;
    0.1, 0.1]; 



%%%%%%%%%%%%%%%%%% FORCES 

% num_of_nodes x 3 array of forces
forces = [
    0.0, 0.0, 0.0; 
    0.0, 0.0, 0.0; 
    0.0, 0.0, 0.0; 
    100.0, 0.0, 0.0];






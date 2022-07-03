

'Input file'  


%%%%%%%%%%%%%%%%%% NODES 

num_of_g_nodes = 4;
num_of_nodes = 20; 



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
    1.0, 1.0, 1.0;
    0.0, 0.0, 2.0;
    1.0, 0.0, 2.0;
    0.0, 1.0, 2.0;
    1.0, 1.0, 2.0;
    0.0, 0.0, 3.0;
    1.0, 0.0, 3.0;
    0.0, 1.0, 3.0;
    1.0, 1.0, 3.0;
    0.0, 0.0, 4.0;
    1.0, 0.0, 4.0;
    0.0, 1.0, 4.0;
    1.0, 1.0, 4.0;
    0.0, 0.0, 5.0;
    1.0, 0.0, 5.0;
    0.0, 1.0, 5.0;
    1.0, 1.0, 5.0;];




%%%%%%%%%%%%%%%%%% BEAMS 

num_of_g_beams = 4;
num_of_beams = 36; 



% num_of_g_beams x 2 array of node indices. First index is an 
% anchored node, the second index is a non-anchored node.
g_beam_end_nodes = [ ... 
    1, 1; % Tier 1
    2, 2; % Tier 1
    3, 3; % Tier 1
    4, 4]; % Tier 1

% num_of_beams x 2 array of node indices. 0 = origin node.
beam_end_nodes = [ ...
    1, 2; % Tier 1
    1, 3; % Tier 1
    2, 4; % Tier 1
    3, 4; % Tier 1
    1, 5; % Tier 2
    2, 6; % Tier 2
    3, 7; % Tier 2
    4, 8; % Tier 2
    5, 6; % Tier 2
    5, 7; % Tier 2
    6, 8; % Tier 2
    7, 8; % Tier 2
    5, 9; % Tier 3
    6, 10; % Tier 3
    7, 11; % Tier 3
    8, 12; % Tier 3
    9, 10; % Tier 3
    9, 11; % Tier 3
    10, 12; % Tier 3
    11, 12; % Tier 3
    9, 13; % Tier 4
    10, 14; % Tier 4
    11, 15; % Tier 4
    12, 16; % Tier 4
    13, 14; % Tier 4
    13, 15; % Tier 4
    14, 16; % Tier 4
    15, 16; % Tier 4
    13, 17; % Tier 5
    14, 18; % Tier 5
    15, 19; % Tier 5
    16, 20; % Tier 5
    17, 18; % Tier 5
    17, 19; % Tier 5
    18, 20; % Tier 5
    19, 20; % Tier 5
    ]; 



% num_of_g_beams x 1 array of beam thicknesses.
g_beam_thicknesses = [ ... 
    1.0; % Tier 1
    1.0; % Tier 1
    1.0; % Tier 1
    1.0]; % Tier 1

% num_of_beams x 1 array of beam thicknesses.
beam_thicknesses = [ ... 
    1.0; % Tier 1
    1.0; % Tier 1
    1.0; % Tier 1
    1.0; % Tier 1
    1.0; % Tier 2
    1.0; % Tier 2
    1.0; % Tier 2
    1.0; % Tier 2
    1.0; % Tier 2
    1.0; % Tier 2
    1.0; % Tier 2
    1.0; % Tier 2
    1.0; % Tier 3
    1.0; % Tier 3
    1.0; % Tier 3
    1.0; % Tier 3
    1.0; % Tier 3
    1.0; % Tier 3
    1.0; % Tier 3
    1.0; % Tier 3
    1.0; % Tier 4
    1.0; % Tier 4
    1.0; % Tier 4
    1.0; % Tier 4
    1.0; % Tier 4
    1.0; % Tier 4
    1.0; % Tier 4
    1.0; % Tier 4
    1.0; % Tier 5
    1.0; % Tier 5
    1.0; % Tier 5
    1.0; % Tier 5
    1.0; % Tier 5
    1.0; % Tier 5
    1.0; % Tier 5
    1.0; % Tier 5
    ]; 



% num_of_g_beams x 2 array of stiffness constants. The first column is the
% parallel stiffness, the second column is the shear stiffnesses. 
g_beam_stiffnesses = [ ...
    1000, 500; % Tier 1
    1000, 500; % Tier 1
    1000, 500; % Tier 1
    1000, 500]; % Tier 1

% num_of_beams x 2 array of stiffness constants. The first column is the
% parallel stiffness, the second column is the shear stiffnesses. 
beam_stiffnesses = [ ...
    1000, 500; % Tier 1
    1000, 500; % Tier 1
    1000, 500; % Tier 1
    1000, 500; % Tier 1
    1000, 500; % Tier 2
    1000, 500; % Tier 2
    1000, 500; % Tier 2
    1000, 500; % Tier 2
    1000, 500; % Tier 2
    1000, 500; % Tier 2
    1000, 500; % Tier 2
    1000, 500; % Tier 2
    1000, 500; % Tier 3
    1000, 500; % Tier 3
    1000, 500; % Tier 3
    1000, 500; % Tier 3
    1000, 500; % Tier 3
    1000, 500; % Tier 3
    1000, 500; % Tier 3
    1000, 500; % Tier 3
    1000, 500; % Tier 4
    1000, 500; % Tier 4
    1000, 500; % Tier 4
    1000, 500; % Tier 4
    1000, 500; % Tier 4
    1000, 500; % Tier 4
    1000, 500; % Tier 4
    1000, 500; % Tier 4
    1000, 500; % Tier 5
    1000, 500; % Tier 5
    1000, 500; % Tier 5
    1000, 500; % Tier 5
    1000, 500; % Tier 5
    1000, 500; % Tier 5
    1000, 500; % Tier 5
    1000, 500; % Tier 5
    ]; 
    


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






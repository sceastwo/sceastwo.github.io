clear;
clc;
format long;

% contains the definitions of:

% NODE DATA: 
% num_of_g_nodes
% num_of_nodes
% g_node_coordinates
% node_coordinates
%
% BEAM DATA: 
% num_of_g_beams
% num_of_beams
% g_beam_end_nodes
% beam_end_nodes
% g_beam_thicknesses
% beam_thicknesses
% g_beam_stiffnesses
% beam_stiffnesses
% g_beam_breaking_limits
% beam_breaking_limits
% 
% FORCES: 
% forces

input_file_3

%%%%%%%%%%%%%%%%%% COMPILATION AND SIMULATION

g_node_coordinates = g_node_coordinates';
node_coordinates = node_coordinates';

g_beam_end_nodes = g_beam_end_nodes';
beam_end_nodes = beam_end_nodes';
g_beam_thicknesses = g_beam_thicknesses';
beam_thicknesses = beam_thicknesses';
g_beam_stiffnesses = g_beam_stiffnesses';
beam_stiffnesses = beam_stiffnesses';
g_beam_breaking_limits = g_beam_breaking_limits';
beam_breaking_limits = beam_breaking_limits';

forces = forces';

%Beam properties setup.
g_b_disp = zeros(3, num_of_g_beams); % Undeformed displacement along the grounded beams.
b_disp = zeros(3, num_of_beams); % Undeformed displacement along the beams.
g_b_L = zeros(1, num_of_g_beams); % Length of the grounded beams.
b_L = zeros(1, num_of_beams); % Length of the beams.
g_b_u = zeros(3, num_of_g_beams); % unit vector direction of the grounded beams.
b_u = zeros(3, num_of_beams); % unit vector direction of the beams.
for i = 1:num_of_g_beams
    n1 = g_beam_end_nodes(1,i);
    n2 = g_beam_end_nodes(2,i);
    g_b_disp(:,i) = node_coordinates(:,n2) - g_node_coordinates(:,n1);
    g_b_L(1,i) = norm(g_b_disp(:,i));
    g_b_u(:,i) = g_b_disp(:,i) / g_b_L(1,i);
end
for i = 1:num_of_beams
    n1 = beam_end_nodes(1,i);
    n2 = beam_end_nodes(2,i);
    b_disp(:,i) = node_coordinates(:,n2) - node_coordinates(:,n1);
    b_L(1,i) = norm(b_disp(:,i));
    b_u(:,i) = b_disp(:,i) / b_L(1,i);
end



%%%%%%%%%%%%%%%%%%% forces_vector setup
%Populate the forces into a (3*num_of_nodes) x 1 vector.
forces_vector = zeros(3*num_of_nodes, 1);
for i = 1:num_of_nodes
    for j = 1:3
        forces_vector(3*(i-1) + j) = forces(j,i);
    end
end



%%%%%%%%%%%%%%%%%%% stiffness_matrix setup
stiffness_matrix = zeros(3*num_of_nodes, 3*num_of_nodes);

for i = 1:num_of_g_beams
    n1 = g_beam_end_nodes(1,i);
    n2 = g_beam_end_nodes(2,i);
    
    proj = g_b_u(:,i)*g_b_u(:,i)';
    perp = eye(3) - proj;
    
    new_stiffness_block = (g_beam_thicknesses(1,i) / g_b_L(1,i)) * (g_beam_stiffnesses(1,i) * proj + g_beam_stiffnesses(2,i) * perp);
    
    i_n2_range = (3*n2 - 2):(3*n2); % The index range for n2
    stiffness_matrix(i_n2_range, i_n2_range) = stiffness_matrix(i_n2_range, i_n2_range) + new_stiffness_block;
end

for i = 1:num_of_beams
    n1 = beam_end_nodes(1,i);
    n2 = beam_end_nodes(2,i);
    
    proj = b_u(:,i)*b_u(:,i)';
    perp = eye(3) - proj;
    
    new_stiffness_block = (beam_thicknesses(1,i) / b_L(1,i)) * (beam_stiffnesses(1,i) * proj + beam_stiffnesses(2,i) * perp);
    
    i_n1_range = (3*n1 - 2):(3*n1); % The index range for n1
    i_n2_range = (3*n2 - 2):(3*n2); % The index range for n2
    stiffness_matrix(i_n1_range, i_n1_range) = stiffness_matrix(i_n1_range, i_n1_range) + new_stiffness_block;
    stiffness_matrix(i_n2_range, i_n2_range) = stiffness_matrix(i_n2_range, i_n2_range) + new_stiffness_block;
    stiffness_matrix(i_n1_range, i_n2_range) = stiffness_matrix(i_n1_range, i_n2_range) - new_stiffness_block;
    stiffness_matrix(i_n2_range, i_n1_range) = stiffness_matrix(i_n2_range, i_n1_range) - new_stiffness_block;
end
%%%%%%%%%%%%%%%%%%% END stiffness_matrix setup


%%%%%%%%%%%%%%%%%%% node_displacements calculations
node_displacements_vector = stiffness_matrix\forces_vector;
%Populate the displacements into a num_of_nodes x 3 matrix.
node_displacements = zeros(3, num_of_nodes);
for i = 1:num_of_nodes
    for j = 1:3 
        node_displacements(j,i) = node_displacements_vector(3*(i-1) + j);
    end
end

new_node_coordinates = node_coordinates + node_displacements;
%%%%%%%%%%%%%%%%%%% END node_displacements calculations



%%%%%%%%%%%%%%%%%%% deformation ratio calculations
g_beam_par_deformations = zeros(1, num_of_g_beams);
beam_par_deformations = zeros(1, num_of_beams);
g_beam_perp_deformations = zeros(1, num_of_g_beams);
beam_perp_deformations = zeros(1, num_of_beams);

for i = 1:num_of_g_beams
    n1 = g_beam_end_nodes(1,i);
    n2 = g_beam_end_nodes(2,i);
    
    disp_change = node_displacements(:,n2);
    
    disp_change_par = dot(g_b_u(:,i), disp_change);
    disp_change_perp = sqrt(norm(disp_change)^2 - disp_change_par^2);
    
    g_beam_par_deformations(1,i) = disp_change_par / g_b_L(1,i);
    g_beam_perp_deformations(1,i) = disp_change_perp / g_b_L(1,i);
end
for i = 1:num_of_beams
    n1 = beam_end_nodes(1,i);
    n2 = beam_end_nodes(2,i);
    
    disp_change = node_displacements(:,n2) - node_displacements(:,n1);
    
    disp_change_par = dot(b_u(:,i), disp_change);
    disp_change_perp = sqrt(norm(disp_change)^2 - disp_change_par^2);
    
    beam_par_deformations(1,i) = disp_change_par / b_L(1,i);
    beam_perp_deformations(1,i) = disp_change_perp / b_L(1,i);
end
%%%%%%%%%%%%%%%%%%% END deformation ratio calculations

forces_vector
stiffness_matrix
node_displacements_vector





%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%% Undeformed plot 

subplot(1,3,1);

scatter3(g_node_coordinates(1,:), g_node_coordinates(2,:), g_node_coordinates(3,:), ...
    'o', 'MarkerEdgeColor', [0 0 0])
hold on;

scatter3(node_coordinates(1,:), node_coordinates(2,:), node_coordinates(3,:), ...
    'o', 'MarkerEdgeColor', [0.5 0 0])
hold on;

for i = 1:num_of_g_beams
    n1 = g_beam_end_nodes(1,i);
    n2 = g_beam_end_nodes(2,i);
    line([g_node_coordinates(1,n1), node_coordinates(1,n2)], ...
         [g_node_coordinates(2,n1), node_coordinates(2,n2)], ...
         [g_node_coordinates(3,n1), node_coordinates(3,n2)], ...
         'Color', [0 0.5 0], ...
         'LineWidth', 2);  
end
for i = 1:num_of_beams
    n1 = beam_end_nodes(1,i);
    n2 = beam_end_nodes(2,i);
    line([node_coordinates(1,n1), node_coordinates(1,n2)], ...
         [node_coordinates(2,n1), node_coordinates(2,n2)], ...
         [node_coordinates(3,n1), node_coordinates(3,n2)], ...
         'Color', [0 0 0.5], ...
         'LineWidth', 2); 
end

daspect([1 1 1]);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%% prallel stress map 

subplot(1,3,2);

scatter3(g_node_coordinates(1,:), g_node_coordinates(2,:), g_node_coordinates(3,:), ...
    'o', 'MarkerEdgeColor', [0 0 0])
hold on;

scatter3(new_node_coordinates(1,:), new_node_coordinates(2,:), new_node_coordinates(3,:), ...
    'o', 'MarkerEdgeColor', [0.5 0 0])
hold on;

for i = 1:num_of_g_beams
    n1 = g_beam_end_nodes(1,i);
    n2 = g_beam_end_nodes(2,i);
    
    par_breaking_fraction = g_beam_par_deformations(1,i) / g_beam_breaking_limits(1,i);
    
    line([g_node_coordinates(1,n1), new_node_coordinates(1,n2)], ...
         [g_node_coordinates(2,n1), new_node_coordinates(2,n2)], ...
         [g_node_coordinates(3,n1), new_node_coordinates(3,n2)], ...
         'Color', [par_breaking_fraction 0 0], ...
         'LineWidth', 2);  
end
for i = 1:num_of_beams
    n1 = beam_end_nodes(1,i);
    n2 = beam_end_nodes(2,i);
    
    par_breaking_fraction = beam_par_deformations(1,i) / beam_breaking_limits(1,i);
    
    line([new_node_coordinates(1,n1), new_node_coordinates(1,n2)], ...
         [new_node_coordinates(2,n1), new_node_coordinates(2,n2)], ...
         [new_node_coordinates(3,n1), new_node_coordinates(3,n2)], ...
         'Color', [par_breaking_fraction 0 0], ...
         'LineWidth', 2); 
end

daspect([1 1 1]);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%% shear stress map 

subplot(1,3,3);

scatter3(g_node_coordinates(1,:), g_node_coordinates(2,:), g_node_coordinates(3,:), ...
    'o', 'MarkerEdgeColor', [0 0 0])
hold on;

scatter3(new_node_coordinates(1,:), new_node_coordinates(2,:), new_node_coordinates(3,:), ...
    'o', 'MarkerEdgeColor', [0.5 0 0])
hold on;

for i = 1:num_of_g_beams
    n1 = g_beam_end_nodes(1,i);
    n2 = g_beam_end_nodes(2,i);
    
    perp_breaking_fraction = g_beam_perp_deformations(1,i) / g_beam_breaking_limits(2,i);
    
    line([g_node_coordinates(1,n1), new_node_coordinates(1,n2)], ...
         [g_node_coordinates(2,n1), new_node_coordinates(2,n2)], ...
         [g_node_coordinates(3,n1), new_node_coordinates(3,n2)], ...
         'Color', [perp_breaking_fraction 0 0], ...
         'LineWidth', 2);  
end
for i = 1:num_of_beams
    n1 = beam_end_nodes(1,i);
    n2 = beam_end_nodes(2,i);
    
    perp_breaking_fraction = beam_perp_deformations(1,i) / beam_breaking_limits(2,i);
    
    line([new_node_coordinates(1,n1), new_node_coordinates(1,n2)], ...
         [new_node_coordinates(2,n1), new_node_coordinates(2,n2)], ...
         [new_node_coordinates(3,n1), new_node_coordinates(3,n2)], ...
         'Color', [perp_breaking_fraction 0 0], ...
         'LineWidth', 2); 
end

daspect([1 1 1]);



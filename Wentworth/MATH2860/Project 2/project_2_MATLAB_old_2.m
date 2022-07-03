clear;
clc;
format long;


%Input data contains:
% num_of_g_nodes
% num_of_nodes
% g_nodes
%      x 
%      y 
%      z 
% nodes
%      x 
%      y 
%      z 
%      F_x 
%      F_y 
%      F_z 
%
% num_of_g_beams 
% num_of_beams
% g_beams
%      start
%      end 
%      t 
%      k_par
%      k_perp 
%      break_par
%      break_perp
% beams
%      start
%      end 
%      t 
%      k_par
%      k_perp 
%      break_par
%      break_perp

input_file_3

%%%%%%%%%%%%%%%%%% COMPILATION AND SIMULATION

%Beam properties setup.
if (num_of_g_beams > 0)
    g_beams_ex(num_of_g_beams).disp = [0.0; 0.0; 0.0]; % Undeformed displacement along the grounded beams.
    g_beams_ex(num_of_g_beams).L = 0.0; % Length of the grounded beams.
    g_beams_ex(num_of_g_beams).u = [1.0; 0.0; 0.0]; % unit vector direction of the grounded beams.
    g_beams_ex(num_of_g_beams).par_deform = 0.0; % Relative parallel deformation (to be computed later).
    g_beams_ex(num_of_g_beams).perp_deform = 0.0; % Relative parallel deformation (to be computed later).
end
for i = 1:num_of_g_beams
    n1 = g_beams(i).start;
    n2 = g_beams(i).end;
    g_beams_ex(i).disp = [nodes(n2).x; nodes(n2).y; nodes(n2).z] - [g_nodes(n1).x; g_nodes(n1).y; g_nodes(n1).z];
    g_beams_ex(i).L = norm(g_beams_ex(i).disp);
    g_beams_ex(i).u = g_beams_ex(i).disp / g_beams_ex(i).L;
end

if (num_of_beams > 0)
    beams_ex(num_of_beams).disp = [0.0; 0.0; 0.0]; % Undeformed displacement along the beams.
    beams_ex(num_of_beams).L = 0.0; % Length of the beams.
    beams_ex(num_of_beams).u = [1.0; 0.0; 0.0]; % unit vector direction of the beams.
    beams_ex(num_of_g_beams).par_deform = 0.0; % Relative parallel deformation (to be computed later).
    beams_ex(num_of_g_beams).perp_deform = 0.0; % Relative parallel deformation (to be computed later).
end
for i = 1:num_of_beams
    n1 = beams(i).start;
    n2 = beams(i).end;
    beams_ex(i).disp = [nodes(n2).x; nodes(n2).y; nodes(n2).z] - [nodes(n1).x; nodes(n1).y; nodes(n1).z];
    beams_ex(i).L = norm(beams_ex(i).disp);
    beams_ex(i).u = beams_ex(i).disp / beams_ex(i).L;
end



%%%%%%%%%%%%%%%%%%% forces_vector setup
%Populate the forces into a (3*num_of_nodes) x 1 vector.
forces_vector = zeros(3*num_of_nodes, 1);
for i = 1:num_of_nodes
    forces_vector(3*(i-1) + 1) = nodes(i).F_x;
    forces_vector(3*(i-1) + 2) = nodes(i).F_y;
    forces_vector(3*(i-1) + 3) = nodes(i).F_z;
end



%%%%%%%%%%%%%%%%%%% stiffness_matrix setup
stiffness_matrix = zeros(3*num_of_nodes, 3*num_of_nodes);

for i = 1:num_of_g_beams
    n1 = g_beams(i).start;
    n2 = g_beams(i).end;
    
    proj = g_beams_ex(i).u * g_beams_ex(i).u';
    perp = eye(3) - proj;
    
    new_stiffness_block = (g_beams(i).t / g_beams_ex(i).L) * (g_beams(i).k_par * proj + g_beams(i).k_perp * perp);
    
    i_n2_range = (3*n2 - 2):(3*n2); % The index range for n2
    stiffness_matrix(i_n2_range, i_n2_range) = stiffness_matrix(i_n2_range, i_n2_range) + new_stiffness_block;
end

for i = 1:num_of_beams
    n1 = beams(i).start;
    n2 = beams(i).end;
    
    proj = beams_ex(i).u * beams_ex(i).u';
    perp = eye(3) - proj;
    
    new_stiffness_block = (beams(i).t / beams_ex(i).L) * (beams(i).k_par * proj + beams(i).k_perp * perp);
    
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
if (num_of_nodes > 0)
    nodes_ex(num_of_nodes).displacement = [0; 0; 0];
    nodes_ex(num_of_nodes).old_position = [0; 0; 0];
    nodes_ex(num_of_nodes).new_position = [0; 0; 0];
end
for i = 1:num_of_nodes
    nodes_ex(i).displacement = node_displacements_vector((3*i - 2):(3*i));
    nodes_ex(i).old_position = [nodes(i).x; nodes(i).y; nodes(i).z];
    nodes_ex(i).new_position = nodes_ex(i).old_position + nodes_ex(i).displacement;
end
%%%%%%%%%%%%%%%%%%% END node_displacements calculations



%%%%%%%%%%%%%%%%%%% deformation ratio calculations
for i = 1:num_of_g_beams
    n1 = g_beams(i).start;
    n2 = g_beams(i).end;
    
    disp_change = nodes_ex(n2).displacement;
    
    disp_change_par = dot(g_beams_ex(i).u, disp_change);
    disp_change_perp = sqrt(norm(disp_change)^2 - disp_change_par^2);
    
    g_beams_ex(i).par_deform = disp_change_par / g_beams_ex(i).L;
    g_beams_ex(i).perp_deform = disp_change_perp / g_beams_ex(i).L;
end
for i = 1:num_of_beams
    n1 = beams(i).start;
    n2 = beams(i).end;
    
    disp_change = nodes_ex(n2).displacement - nodes_ex(n1).displacement;
    
    disp_change_par = dot(beams_ex(i).u, disp_change);
    disp_change_perp = sqrt(norm(disp_change)^2 - disp_change_par^2);
    
    beams_ex(i).par_deform = disp_change_par / beams_ex(i).L;
    beams_ex(i).perp_deform = disp_change_perp / beams_ex(i).L;
end
%%%%%%%%%%%%%%%%%%% END deformation ratio calculations

forces_vector
stiffness_matrix
node_displacements_vector



%%%%%%%%%%%%%%%%%%%%%%%%%%% Plotting data
g_node_x_coordinates = zeros(num_of_g_nodes, 1);
g_node_y_coordinates = zeros(num_of_g_nodes, 1);
g_node_z_coordinates = zeros(num_of_g_nodes, 1);
for i = 1:num_of_g_nodes
    g_node_x_coordinates(i) = g_nodes(i).x;
    g_node_y_coordinates(i) = g_nodes(i).y;
    g_node_z_coordinates(i) = g_nodes(i).z;
end

node_old_x_coordinates = zeros(num_of_nodes, 1);
node_old_y_coordinates = zeros(num_of_nodes, 1);
node_old_z_coordinates = zeros(num_of_nodes, 1);
node_new_x_coordinates = zeros(num_of_nodes, 1);
node_new_y_coordinates = zeros(num_of_nodes, 1);
node_new_z_coordinates = zeros(num_of_nodes, 1);
for i = 1:num_of_nodes
    node_old_x_coordinates(i) = nodes(i).x;
    node_old_y_coordinates(i) = nodes(i).y;
    node_old_z_coordinates(i) = nodes(i).z;
    node_new_x_coordinates(i) = nodes_ex(i).new_position(1);
    node_new_y_coordinates(i) = nodes_ex(i).new_position(2);
    node_new_z_coordinates(i) = nodes_ex(i).new_position(3);
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%% Undeformed plot 

subplot(1,3,1);

scatter3(g_node_x_coordinates, g_node_y_coordinates, g_node_z_coordinates, ...
    'o', 'MarkerEdgeColor', [0 0 0])
hold on;

scatter3(node_old_x_coordinates, node_old_y_coordinates, node_old_z_coordinates, ...
    'o', 'MarkerEdgeColor', [0.5 0 0])
hold on;

for i = 1:num_of_g_beams
    n1 = g_beams(i).start;
    n2 = g_beams(i).end;
    line([g_nodes(n1).x, nodes(n2).x], ...
         [g_nodes(n1).y, nodes(n2).y], ...
         [g_nodes(n1).z, nodes(n2).z], ...
         'Color', [0 0.5 0], ...
         'LineWidth', 2);  
end
for i = 1:num_of_beams
    n1 = beams(i).start;
    n2 = beams(i).end;
    line([nodes(n1).x, nodes(n2).x], ...
         [nodes(n1).y, nodes(n2).y], ...
         [nodes(n1).z, nodes(n2).z], ...
         'Color', [0 0 0.5], ...
         'LineWidth', 2); 
end

daspect([1 1 1]);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%% parallel strain map 

subplot(1,3,2);

scatter3(g_node_x_coordinates, g_node_y_coordinates, g_node_z_coordinates, ...
    'o', 'MarkerEdgeColor', [0 0 0])
hold on;

scatter3(node_new_x_coordinates, node_new_y_coordinates, node_new_z_coordinates, ...
    'o', 'MarkerEdgeColor', [0.5 0 0])
hold on;

for i = 1:num_of_g_beams
    n1 = g_beams(i).start;
    n2 = g_beams(i).end;
    
    par_breaking_fraction = g_beams_ex(i).par_deform / g_beams(i).break_par;
    if (par_breaking_fraction >= 0)
        if (par_breaking_fraction <= 1.0)
            the_color = [par_breaking_fraction, 0.0, 0.0];
            the_dashes = '-';
        else
            the_color = [1.0, 0.5, 0.0];
            the_dashes = '--';
        end
    else
        if (par_breaking_fraction >= -1.0)
            the_color = [0.0, 0.0, abs(par_breaking_fraction)];
            the_dashes = '-';
        else
            the_color = [0.0, 0.5, 1.0];
            the_dashes = '--';
        end
    end
        
    line([g_nodes(n1).x, nodes_ex(n2).new_position(1)], ...
         [g_nodes(n1).y, nodes_ex(n2).new_position(2)], ...
         [g_nodes(n1).z, nodes_ex(n2).new_position(3)], ...
         'Color', the_color, ...
         'LineStyle', the_dashes, ...
         'LineWidth', 2);  
end
for i = 1:num_of_beams
    n1 = beams(i).start;
    n2 = beams(i).end;
    
    par_breaking_fraction = beams_ex(i).par_deform / beams(i).break_par;
    if (par_breaking_fraction >= 0)
        if (par_breaking_fraction <= 1.0)
            the_color = [par_breaking_fraction, 0.0, 0.0];
            the_dashes = '-';
        else
            the_color = [1.0, 0.5, 0.0];
            the_dashes = '--';
        end
    else
        if (par_breaking_fraction >= -1.0)
            the_color = [0.0, 0.0, abs(par_breaking_fraction)];
            the_dashes = '-';
        else
            the_color = [0.0, 0.5, 1.0];
            the_dashes = '--';
        end
    end
    
    line([nodes_ex(n1).new_position(1), nodes_ex(n2).new_position(1)], ...
         [nodes_ex(n1).new_position(2), nodes_ex(n2).new_position(2)], ...
         [nodes_ex(n1).new_position(3), nodes_ex(n2).new_position(3)], ...
         'Color', the_color, ...
         'LineStyle', the_dashes, ...
         'LineWidth', 2); 
end

daspect([1 1 1]);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%% shear strain map 

subplot(1,3,3);

scatter3(g_node_x_coordinates, g_node_y_coordinates, g_node_z_coordinates, ...
    'o', 'MarkerEdgeColor', [0 0 0])
hold on;

scatter3(node_new_x_coordinates, node_new_y_coordinates, node_new_z_coordinates, ...
    'o', 'MarkerEdgeColor', [0.5 0 0])
hold on;

for i = 1:num_of_g_beams
    n1 = g_beams(i).start;
    n2 = g_beams(i).end;
    
    perp_breaking_fraction = g_beams_ex(i).perp_deform / g_beams(i).break_perp;
    if (perp_breaking_fraction <= 1.0)
        the_color = [perp_breaking_fraction, 0.0, 0.0];
        the_dashes = '-';
    else
        the_color = [1.0, 0.5, 0.0];
        the_dashes = '--';
    end
    
    line([g_nodes(n1).x, nodes_ex(n2).new_position(1)], ...
         [g_nodes(n1).y, nodes_ex(n2).new_position(2)], ...
         [g_nodes(n1).z, nodes_ex(n2).new_position(3)], ...
         'Color', the_color, ...
         'LineStyle', the_dashes, ...
         'LineWidth', 2);  
end
for i = 1:num_of_beams
    n1 = beams(i).start;
    n2 = beams(i).end;
    
    perp_breaking_fraction = beams_ex(i).perp_deform / beams(i).break_perp;
    if (perp_breaking_fraction <= 1.0)
        the_color = [perp_breaking_fraction, 0.0, 0.0];
        the_dashes = '-';
    else
        the_color = [1.0, 0.5, 0.0];
        the_dashes = '--';
    end
    
    line([nodes_ex(n1).new_position(1), nodes_ex(n2).new_position(1)], ...
         [nodes_ex(n1).new_position(2), nodes_ex(n2).new_position(2)], ...
         [nodes_ex(n1).new_position(3), nodes_ex(n2).new_position(3)], ...
         'Color', the_color, ...
         'LineStyle', the_dashes, ...
         'LineWidth', 2); 
end

daspect([1 1 1]);



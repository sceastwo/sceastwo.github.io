clear;
clc;
format long;


%Input data contains:
% g_nodes
%      name 
%      x 
%      y 
%      z 
% nodes
%      name 
%      x 
%      y 
%      z 
%      F_x 
%      F_y 
%      F_z 
%      tau_x
%      tau_y 
%      tau_z
% beams
%      start
%      end 
%      t 


% n1 refers to the beginning of each beam.
% n2 refers to the ending of each beam.

% old refers to before the deformation.
% new refers to after the deformation.

input_file_5

%%%%%%%%%%%%%%%%%% COMPILATION AND SIMULATION

k_par = 1;
k_perp = 0.5;
ka_par = 3; 
ka_perp = 3; 
gamma = 0;
break_par = 0.125;
break_perp = 0.125;
break_twist = 0.125;
break_bend = 0.125;


num_of_g_nodes = max(size(g_nodes));
num_of_nodes = max(size(nodes));
num_of_beams = max(size(beams));

% Input error detection:
for i = 1:num_of_g_nodes
    for j = 1:(i-1)
        if (strcmp(g_nodes(j).name, g_nodes(i).name))
            error('Error: repeated g_node name "%s"', g_nodes(i).name);
        end
    end
end
for i = 1:num_of_nodes
    for j = 1:num_of_g_nodes
        if (strcmp(g_nodes(j).name, nodes(i).name))
            error('Error: repeated g_node/node name "%s"', nodes(i).name);
        end
    end
    for j = 1:(i-1)
        if (strcmp(nodes(j).name, nodes(i).name))
            error('Error: repeated node name "%s"', nodes(i).name);
        end
    end
end

%Declarations:

if (num_of_g_nodes > 0)
    g_nodes_ex(num_of_g_nodes).point = scatter3([0], [0], [0], 'o', 'MarkerEdgeColor', [0 0 0]);
end
if (num_of_nodes > 0)
    nodes_ex(num_of_nodes).displacement = [0; 0; 0]; % displacement 
    nodes_ex(num_of_nodes).torsion = [0; 0; 0]; % torsion 
    nodes_ex(num_of_nodes).old_position = [0; 0; 0]; % old position
    nodes_ex(num_of_nodes).new_position = [0; 0; 0]; % new position
    
    nodes_ex(num_of_nodes).point = scatter3([0], [0], [0], 'o', 'MarkerEdgeColor', [0.5 0 0]);
end
if (num_of_beams > 0)
    beams_ex(num_of_beams).n1_float_flag = 0; % Is the starting node a floating node?
    beams_ex(num_of_beams).n1_index = 1; % What is the index of the starting node?
    beams_ex(num_of_beams).n1_displacement = [0; 0; 0]; % What is the displacement of the starting node?
    beams_ex(num_of_beams).n1_torsion = [0; 0; 0]; % What is the torsion of the starting node?
    beams_ex(num_of_beams).n1_old_pos = [0; 0; 0]; % What is the initial position of the starting node?
    beams_ex(num_of_beams).n1_new_pos = [0; 0; 0]; % What is the final position of the starting node?
    
    beams_ex(num_of_beams).n2_float_flag = 0; % Is the ending node a floating node?
    beams_ex(num_of_beams).n2_index = 1; % What is the index of the ending node?
    beams_ex(num_of_beams).n2_displacement = [0; 0; 0]; % What is the displacement of the ending node?
    beams_ex(num_of_beams).n2_torsion = [0; 0; 0]; % What is the torsion of the ending node?
    beams_ex(num_of_beams).n2_old_pos = [0; 0; 0]; % What is the initial position of the ending node?
    beams_ex(num_of_beams).n2_new_pos = [0; 0; 0]; % What is the final position of the ending node?
    
    beams_ex(num_of_beams).disp = [0.0; 0.0; 0.0]; % Undeformed displacement along the beams.
    beams_ex(num_of_beams).L = 0.0; % Length of the beams.
    beams_ex(num_of_beams).u = [1.0; 0.0; 0.0]; % unit vector direction of the beams.
    beams_ex(num_of_beams).proj = eye(3); % Projection.
    beams_ex(num_of_beams).perp = eye(3); % Perpendicular component.
    beams_ex(num_of_beams).rot = eye(3); % Rotation.
    beams_ex(num_of_beams).par_deform = 0.0; % Relative parallel deformation.
    beams_ex(num_of_beams).perp_deform = 0.0; % Relative shear deformation.
    beams_ex(num_of_beams).twist_deform = 0.0; % Twist deformation.
    beams_ex(num_of_beams).bend_deform = 0.0; % Bend deformation.
    
    beams_ex(num_of_beams).plot_line = line([0 0], [0 0], [0 0]);
end


%Beam properties setup.
for i = 1:num_of_beams
    found_flag = 0;
    for j = 1:num_of_g_nodes
        if (strcmp(g_nodes(j).name, beams(i).start))
            found_flag = 1;
            beams_ex(i).n1_float_flag = 0;
            beams_ex(i).n1_index = j;
            beams_ex(i).n1_old_pos = [g_nodes(j).x; g_nodes(j).y; g_nodes(j).z];
            break
        end
    end
    if (~found_flag)
        for j = 1:num_of_nodes
            if (strcmp(nodes(j).name, beams(i).start))
                found_flag = 1;
                beams_ex(i).n1_float_flag = 1;
                beams_ex(i).n1_index = j;
                beams_ex(i).n1_old_pos = [nodes(j).x; nodes(j).y; nodes(j).z];
                break
            end
        end
    end
    if (~found_flag)
        error('Error: start node not found for beam %i', i);
    end
    
    found_flag = 0;
    for j = 1:num_of_g_nodes
        if (strcmp(g_nodes(j).name, beams(i).end))
            found_flag = 1;
            beams_ex(i).n2_float_flag = 0;
            beams_ex(i).n2_index = j;
            beams_ex(i).n2_old_pos = [g_nodes(j).x; g_nodes(j).y; g_nodes(j).z];
            break
        end
    end
    if (~found_flag)
        for j = 1:num_of_nodes
            if (strcmp(nodes(j).name, beams(i).end))
                found_flag = 1;
                beams_ex(i).n2_float_flag = 1;
                beams_ex(i).n2_index = j;
                beams_ex(i).n2_old_pos = [nodes(j).x; nodes(j).y; nodes(j).z];
                break
            end
        end
    end
    if (~found_flag)
        error('Error: end node not found for beam %i', i);
    end
    
    beams_ex(i).disp = beams_ex(i).n2_old_pos - beams_ex(i).n1_old_pos;
    beams_ex(i).L = norm(beams_ex(i).disp);
    beams_ex(i).u = beams_ex(i).disp / beams_ex(i).L;
    beams_ex(i).proj = (beams_ex(i).u) * (beams_ex(i).u)';
    beams_ex(i).perp = eye(3) - beams_ex(i).proj;
    beams_ex(i).rot = ...
        [                0, -beams_ex(i).u(3),  beams_ex(i).u(2); ...
          beams_ex(i).u(3),                 0, -beams_ex(i).u(1); ... 
         -beams_ex(i).u(2),  beams_ex(i).u(1),                 0];
end
%%%%%%%%%%%%%%% END Beam properties setup.


%%%%%%%%%%%%%%%%% DEBUG %%%%%%%%%%%
% for i = 1:num_of_beams
%     sprintf('beam %i', i)
%     
%     beams_ex(i).n1_float_flag
%     beams_ex(i).n1_index
%     beams_ex(i).n1_old_pos
%     
%     beams_ex(i).n2_float_flag
%     beams_ex(i).n2_index
%     beams_ex(i).n2_old_pos
% end



%%%%%%%%%%%%%%%%%%% forces_vector setup
%Populate the forces and torques into a (6*num_of_nodes) x 1 vector.
forces_vector = zeros(6*num_of_nodes, 1);
for i = 1:num_of_nodes
    forces_vector(6*(i-1) + 1) = -nodes(i).F_x;
    forces_vector(6*(i-1) + 2) = -nodes(i).F_y;
    forces_vector(6*(i-1) + 3) = -nodes(i).F_z;
    forces_vector(6*(i-1) + 4) = -nodes(i).tau_x;
    forces_vector(6*(i-1) + 5) = -nodes(i).tau_y;
    forces_vector(6*(i-1) + 6) = -nodes(i).tau_z;
end
%%%%%%%%%%%%%%%%%%% END forces_vector setup


%%%%%%%%%%%%%%%%%%% stiffness_matrix setup
stiffness_matrix = zeros(6*num_of_nodes, 6*num_of_nodes);

for i = 1:num_of_beams
    
    u = beams_ex(i).u;
    L = beams_ex(i).L;
    t = beams(i).t;
    proj = beams_ex(i).proj;
    perp = beams_ex(i).perp;
    rot = beams_ex(i).rot;
    
    Q_stiff = (t/L)*(k_par*proj + k_perp*perp); 
    W_stiff = (t/L)*(ka_par*proj + ka_perp*perp);
    
    j_q1 = (6*beams_ex(i).n1_index - 5):(6*beams_ex(i).n1_index - 3); 
    j_w1 = (6*beams_ex(i).n1_index - 2):(6*beams_ex(i).n1_index);
    j_q2 = (6*beams_ex(i).n2_index - 5):(6*beams_ex(i).n2_index - 3);
    j_w2 = (6*beams_ex(i).n2_index - 2):(6*beams_ex(i).n2_index);
    
    i_F1 = j_q1;
    i_t1 = j_w1;
    i_F2 = j_q2;
    i_t2 = j_w2;
    
    block_F1_q1 = -Q_stiff; 
    block_F1_w1 = (t*k_perp/2)*rot; 
    block_F1_q2 = Q_stiff; 
    block_F1_w2 = (t*k_perp/2)*rot; 
    
    block_t1_q1 = -(t*k_perp/L)*rot;
    block_t1_w1 = -(t*k_perp/2)*perp - W_stiff;
    block_t1_q2 = (t*k_perp/L)*rot;
    block_t1_w2 = -(t*k_perp/2)*perp + W_stiff;
    
    block_F2_q1 = Q_stiff;
    block_F2_w1 = -(t*k_perp/2)*rot; 
    block_F2_q2 = -Q_stiff; 
    block_F2_w2 = -(t*k_perp/2)*rot;
    
    block_t2_q1 = -(t*k_perp/L)*rot;  
    block_t2_w1 = -(t*k_perp/2)*perp + W_stiff;
    block_t2_q2 = (t*k_perp/L)*rot; 
    block_t2_w2 = -(t*k_perp/2)*perp - W_stiff;
    
%     fprintf('\n\n\nbeam %i\n', i);
%     
%     fprintf('block_F1_q1');
%     block_F1_q1
%     fprintf('block_F1_w1');
%     block_F1_w1
%     fprintf('block_F1_q2');
%     block_F1_q2
%     fprintf('block_F1_w2');
%     block_F1_w2
%     
%     fprintf('block_t1_q1');
%     block_t1_q1
%     fprintf('block_t1_w1');
%     block_t1_w1
%     fprintf('block_t1_q2');
%     block_t1_q2
%     fprintf('block_t1_w2');
%     block_t1_w2
%     
%     fprintf('block_F2_q1');
%     block_F2_q1
%     fprintf('block_F2_w1');
%     block_F2_w1
%     fprintf('block_F2_q2');
%     block_F2_q2
%     fprintf('block_F2_w2');
%     block_F2_w2
%     
%     fprintf('block_t2_q1');
%     block_t2_q1
%     fprintf('block_t2_w1');
%     block_t2_w1
%     fprintf('block_t2_q2');
%     block_t2_q2
%     fprintf('block_t2_w2');
%     block_t2_w2
    
    if (beams_ex(i).n1_float_flag)
        if (beams_ex(i).n2_float_flag)
            
            stiffness_matrix(i_F1, j_q1) = stiffness_matrix(i_F1, j_q1) + block_F1_q1;
            stiffness_matrix(i_F1, j_w1) = stiffness_matrix(i_F1, j_w1) + block_F1_w1;
            stiffness_matrix(i_F1, j_q2) = stiffness_matrix(i_F1, j_q2) + block_F1_q2;
            stiffness_matrix(i_F1, j_w2) = stiffness_matrix(i_F1, j_w2) + block_F1_w2;
            
            stiffness_matrix(i_t1, j_q1) = stiffness_matrix(i_t1, j_q1) + block_t1_q1;
            stiffness_matrix(i_t1, j_w1) = stiffness_matrix(i_t1, j_w1) + block_t1_w1;
            stiffness_matrix(i_t1, j_q2) = stiffness_matrix(i_t1, j_q2) + block_t1_q2;
            stiffness_matrix(i_t1, j_w2) = stiffness_matrix(i_t1, j_w2) + block_t1_w2;
            
            stiffness_matrix(i_F2, j_q1) = stiffness_matrix(i_F2, j_q1) + block_F2_q1;
            stiffness_matrix(i_F2, j_w1) = stiffness_matrix(i_F2, j_w1) + block_F2_w1;
            stiffness_matrix(i_F2, j_q2) = stiffness_matrix(i_F2, j_q2) + block_F2_q2;
            stiffness_matrix(i_F2, j_w2) = stiffness_matrix(i_F2, j_w2) + block_F2_w2;
            
            stiffness_matrix(i_t2, j_q1) = stiffness_matrix(i_t2, j_q1) + block_t2_q1;
            stiffness_matrix(i_t2, j_w1) = stiffness_matrix(i_t2, j_w1) + block_t2_w1;
            stiffness_matrix(i_t2, j_q2) = stiffness_matrix(i_t2, j_q2) + block_t2_q2;
            stiffness_matrix(i_t2, j_w2) = stiffness_matrix(i_t2, j_w2) + block_t2_w2;
            
        else
            
            stiffness_matrix(i_F1, j_q1) = stiffness_matrix(i_F1, j_q1) + block_F1_q1;
            stiffness_matrix(i_F1, j_w1) = stiffness_matrix(i_F1, j_w1) + block_F1_w1;
            
            stiffness_matrix(i_t1, j_q1) = stiffness_matrix(i_t1, j_q1) + block_t1_q1;
            stiffness_matrix(i_t1, j_w1) = stiffness_matrix(i_t1, j_w1) + block_t1_w1;
            
        end
    else
        if (beams_ex(i).n2_float_flag)
            
            stiffness_matrix(i_F2, j_q2) = stiffness_matrix(i_F2, j_q2) + block_F2_q2;
            stiffness_matrix(i_F2, j_w2) = stiffness_matrix(i_F2, j_w2) + block_F2_w2;
            
            stiffness_matrix(i_t2, j_q2) = stiffness_matrix(i_t2, j_q2) + block_t2_q2;
            stiffness_matrix(i_t2, j_w2) = stiffness_matrix(i_t2, j_w2) + block_t2_w2;
            
        end
    end
end
%%%%%%%%%%%%%%%%%%% END stiffness_matrix setup



%%%%%%%%%%%%%%%%% DEBUG %%%%%%%%%%%
% node_displacements_vector = zeros(6*num_of_nodes, 1);
% 
% hold on;
% for j = 1:num_of_g_nodes
%     g_nodes_ex(j).point = scatter3([g_nodes(j).x], [g_nodes(j).y], [g_nodes(j).z], 'o', 'MarkerEdgeColor', [0 0 0]);    
%     hold on;
% end
% for j = 1:num_of_nodes
%     nodes_ex(j).point = scatter3([nodes(j).x], [nodes(j).y], [nodes(j).z], 'o', 'MarkerEdgeColor', [0.5 0 0]);    
%     hold on;
% end
% for j = 1:num_of_beams
%     beams_ex(j).plot_line = line([beams_ex(j).n1_old_pos(1) beams_ex(j).n2_old_pos(1)], ...
%                                  [beams_ex(j).n1_old_pos(2) beams_ex(j).n2_old_pos(2)], ...
%                                  [beams_ex(j).n1_old_pos(3) beams_ex(j).n2_old_pos(3)], ...
%                                  'Color', [0 0 0.5], ...
%                                  'LineWidth', 2);    
%     hold on;
% end
% daspect([1 1 1]);
% hold off;
% while (1)
%     node_displacements_vector = node_displacements_vector + 0.1 * (stiffness_matrix * node_displacements_vector - forces_vector);
%     
%     for j = 1:num_of_nodes
%         nodes_ex(j).displacement = node_displacements_vector((6*j - 5):(6*j - 3));
%         nodes_ex(j).torsion = node_displacements_vector((6*j - 2):(6*j));
%         nodes_ex(j).old_position = [nodes(j).x; nodes(j).y; nodes(j).z];
%         nodes_ex(j).new_position = nodes_ex(j).old_position + nodes_ex(j).displacement; 
%     end
%     for j = 1:num_of_beams  % Update the end coordinate of each beam.
%         if (beams_ex(j).n1_float_flag)
%             beams_ex(j).n1_displacement = nodes_ex(beams_ex(j).n1_index).displacement;
%             beams_ex(j).n1_torsion = nodes_ex(beams_ex(j).n1_index).torsion;
%             beams_ex(j).n1_new_pos = nodes_ex(beams_ex(j).n1_index).new_position;
%         else
%             beams_ex(j).n1_displacement = [0; 0; 0];
%             beams_ex(j).n1_torsion = [0; 0; 0];
%             beams_ex(j).n1_new_pos = beams_ex(j).n1_old_pos;
%         end
%         if (beams_ex(j).n2_float_flag)
%             beams_ex(j).n2_displacement = nodes_ex(beams_ex(j).n2_index).displacement;
%             beams_ex(j).n2_torsion = nodes_ex(beams_ex(j).n2_index).torsion;
%             beams_ex(j).n2_new_pos = nodes_ex(beams_ex(j).n2_index).new_position;
%         else
%             beams_ex(j).n2_displacement = [0; 0; 0];
%             beams_ex(j).n2_torsion = [0; 0; 0];
%             beams_ex(j).n2_new_pos = beams_ex(j).n2_old_pos;
%         end
%     end
%     
%     for j = 1:num_of_nodes
%         nodes_ex(j).point.XData = [nodes_ex(j).new_position(1)];
%         nodes_ex(j).point.YData = [nodes_ex(j).new_position(2)];
%         nodes_ex(j).point.ZData = [nodes_ex(j).new_position(3)];
%     end
%     for j = 1:num_of_beams
%         beams_ex(j).plot_line.XData = [beams_ex(j).n1_new_pos(1), beams_ex(j).n2_new_pos(1)];
%         beams_ex(j).plot_line.YData = [beams_ex(j).n1_new_pos(2), beams_ex(j).n2_new_pos(2)];
%         beams_ex(j).plot_line.ZData = [beams_ex(j).n1_new_pos(3), beams_ex(j).n2_new_pos(3)];
%     end
%     
%     drawnow limitrate;
% end
% return;


%%%%%%%%%%%%%%%%%%% node_displacements calculations

node_displacements_vector = stiffness_matrix\forces_vector;

for i = 1:num_of_nodes
    nodes_ex(i).displacement = node_displacements_vector((6*i - 5):(6*i - 3));
    nodes_ex(i).torsion = node_displacements_vector((6*i - 2):(6*i));
    nodes_ex(i).old_position = [nodes(i).x; nodes(i).y; nodes(i).z];
    nodes_ex(i).new_position = nodes_ex(i).old_position + nodes_ex(i).displacement; 
    
    fprintf('Node: %s\n displacement = (%f, %f, %f)\n torsion = (%f, %f, %f)\n old position = (%f, %f, %f)\n new position = (%f, %f, %f)\n\n', ...
        nodes(i).name, ...
        nodes_ex(i).displacement(1), nodes_ex(i).displacement(2), nodes_ex(i).displacement(3), ...
        nodes_ex(i).torsion(1), nodes_ex(i).torsion(2), nodes_ex(i).torsion(3), ...
        nodes_ex(i).old_position(1), nodes_ex(i).old_position(2), nodes_ex(i).old_position(3), ...
        nodes_ex(i).new_position(1), nodes_ex(i).new_position(2), nodes_ex(i).new_position(3));
end
for i = 1:num_of_beams  % Update the end coordinate of each beam.
    if (beams_ex(i).n1_float_flag)
        beams_ex(i).n1_displacement = nodes_ex(beams_ex(i).n1_index).displacement;
        beams_ex(i).n1_torsion = nodes_ex(beams_ex(i).n1_index).torsion;
        beams_ex(i).n1_new_pos = nodes_ex(beams_ex(i).n1_index).new_position;
    else
        beams_ex(i).n1_displacement = [0; 0; 0];
        beams_ex(i).n1_torsion = [0; 0; 0];
        beams_ex(i).n1_new_pos = beams_ex(i).n1_old_pos;
    end
    if (beams_ex(i).n2_float_flag)
        beams_ex(i).n2_displacement = nodes_ex(beams_ex(i).n2_index).displacement;
        beams_ex(i).n2_torsion = nodes_ex(beams_ex(i).n2_index).torsion;
        beams_ex(i).n2_new_pos = nodes_ex(beams_ex(i).n2_index).new_position;
    else
        beams_ex(i).n2_displacement = [0; 0; 0];
        beams_ex(i).n2_torsion = [0; 0; 0];
        beams_ex(i).n2_new_pos = beams_ex(i).n2_old_pos;
    end
end
%%%%%%%%%%%%%%%%%%% END node_displacements calculations



%%%%%%%%%%%%%%%%%%% deformation ratio calculations
for i = 1:num_of_beams
    
    distortion = (beams_ex(i).n2_displacement - beams_ex(i).n1_displacement) + beams_ex(i).L * beams_ex(i).rot * (beams_ex(i).n1_torsion + beams_ex(i).n2_torsion)/2;
    
    disp_change_par = dot(beams_ex(i).u, distortion);
    disp_change_perp = sqrt(norm(distortion)^2 - disp_change_par^2);
    
    beams_ex(i).par_deform = disp_change_par / beams_ex(i).L;
    beams_ex(i).perp_deform = disp_change_perp / beams_ex(i).L;
    
    torsion_distortion = beams_ex(i).n2_torsion - beams_ex(i).n1_torsion;
    
    beams_ex(i).twist_deform = abs(dot(beams_ex(i).u, torsion_distortion));
    beams_ex(i).bend_deform = sqrt(norm(torsion_distortion)^2 - dot(beams_ex(i).u, torsion_distortion)^2);
end
%%%%%%%%%%%%%%%%%%% END deformation ratio calculations



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

subplot(3,2,1);

scatter3(g_node_x_coordinates, g_node_y_coordinates, g_node_z_coordinates, ...
    'o', 'MarkerFaceColor', [0 0 0], 'MarkerEdgeColor', [0 0 0])
hold on;

scatter3(node_old_x_coordinates, node_old_y_coordinates, node_old_z_coordinates, ...
    'o', 'MarkerFaceColor', [0.5 0.5 0.5], 'MarkerEdgeColor', [0.5 0.5 0.5])
hold on;

for i = 1:num_of_beams
    line([beams_ex(i).n1_old_pos(1), beams_ex(i).n2_old_pos(1)], ...
         [beams_ex(i).n1_old_pos(2), beams_ex(i).n2_old_pos(2)], ...
         [beams_ex(i).n1_old_pos(3), beams_ex(i).n2_old_pos(3)], ...
         'Color', [0 0 0.5], ...
         'LineWidth', 2); 
end

for i = 1:num_of_nodes
    %Render the forces:
    curr_force = -forces_vector((6*i - 5):(6*i - 3));
    force_magnitude = norm(curr_force);
    line([nodes(i).x, nodes(i).x + 0.5 * curr_force(1) / force_magnitude], ... 
         [nodes(i).y, nodes(i).y + 0.5 * curr_force(2) / force_magnitude], ... 
         [nodes(i).z, nodes(i).z + 0.5 * curr_force(3) / force_magnitude], ... 
         'Color', [0.0 1.0 0.0], ...
         'LineWidth', 1);
end

title('Undeformed lattice.');

daspect([1 1 1]);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%% parallel strain map 

subplot(3,2,3);

scatter3(g_node_x_coordinates, g_node_y_coordinates, g_node_z_coordinates, ...
    'o', 'MarkerFaceColor', [0 0 0], 'MarkerEdgeColor', [0 0 0])
hold on;

scatter3(node_new_x_coordinates, node_new_y_coordinates, node_new_z_coordinates, ...
    'o', 'MarkerFaceColor', [0.5 0.5 0.5], 'MarkerEdgeColor', [0.5 0.5 0.5])
hold on;

num_of_broken_beams_parallel = 0;

for i = 1:num_of_beams
    
    par_breaking_fraction = beams_ex(i).par_deform / break_par;
    
    if (par_breaking_fraction >= 0)
        if (par_breaking_fraction <= 1.0)
            the_color = [par_breaking_fraction, 0.0, 0.0];
        else
            the_color = [1.0, 0.5, 0.0];
            num_of_broken_beams_parallel = num_of_broken_beams_parallel + 1;
        end
    else
        if (par_breaking_fraction >= -1.0)
            the_color = [0.0, 0.0, abs(par_breaking_fraction)];
        else
            the_color = [0.0, 0.5, 1.0]; 
            num_of_broken_beams_parallel = num_of_broken_beams_parallel + 1;
        end
    end
    
    line([beams_ex(i).n1_new_pos(1), beams_ex(i).n2_new_pos(1)], ...
         [beams_ex(i).n1_new_pos(2), beams_ex(i).n2_new_pos(2)], ...
         [beams_ex(i).n1_new_pos(3), beams_ex(i).n2_new_pos(3)], ...
         'Color', the_color, ...
         'LineWidth', 2); 
end

for i = 1:num_of_nodes
    %Render the torsions:
    line([nodes_ex(i).new_position(1), nodes_ex(i).new_position(1) + 2*nodes_ex(i).torsion(1)], ... 
         [nodes_ex(i).new_position(2), nodes_ex(i).new_position(2) + 2*nodes_ex(i).torsion(2)], ... 
         [nodes_ex(i).new_position(3), nodes_ex(i).new_position(3) + 2*nodes_ex(i).torsion(3)], ... 
         'Color', [0.8 0.8 0.0], ...
         'LineWidth', 1);
end

title('Parallel strain.');

daspect([1 1 1]);

fprintf('The number of parallel failures is: %i\n', num_of_broken_beams_parallel);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%% shear strain map 

subplot(3,2,4);

scatter3(g_node_x_coordinates, g_node_y_coordinates, g_node_z_coordinates, ...
    'o', 'MarkerFaceColor', [0 0 0], 'MarkerEdgeColor', [0 0 0])
hold on;

scatter3(node_new_x_coordinates, node_new_y_coordinates, node_new_z_coordinates, ...
    'o', 'MarkerFaceColor', [0.5 0.5 0.5], 'MarkerEdgeColor', [0.5 0.5 0.5])
hold on;

num_of_broken_beams_shear = 0;

for i = 1:num_of_beams
    
    perp_breaking_fraction = beams_ex(i).perp_deform / break_perp;
    
    if (perp_breaking_fraction <= 1.0)
        the_color = [perp_breaking_fraction, 0.0, 0.0];
    else
        the_color = [1.0, 0.5, 0.0];
        num_of_broken_beams_shear = num_of_broken_beams_shear + 1;
    end
    
    line([beams_ex(i).n1_new_pos(1), beams_ex(i).n2_new_pos(1)], ...
         [beams_ex(i).n1_new_pos(2), beams_ex(i).n2_new_pos(2)], ...
         [beams_ex(i).n1_new_pos(3), beams_ex(i).n2_new_pos(3)], ...
         'Color', the_color, ...
         'LineWidth', 2); 
end

for i = 1:num_of_nodes
    %Render the torsions:
    line([nodes_ex(i).new_position(1), nodes_ex(i).new_position(1) + 2*nodes_ex(i).torsion(1)], ... 
         [nodes_ex(i).new_position(2), nodes_ex(i).new_position(2) + 2*nodes_ex(i).torsion(2)], ... 
         [nodes_ex(i).new_position(3), nodes_ex(i).new_position(3) + 2*nodes_ex(i).torsion(3)], ... 
         'Color', [0.8 0.8 0.0], ...
         'LineWidth', 1);
end

title('Shear strain.');

daspect([1 1 1]);

fprintf('The number of shear failures is: %i\n', num_of_broken_beams_shear);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%% twist strain map 

subplot(3,2,5);

scatter3(g_node_x_coordinates, g_node_y_coordinates, g_node_z_coordinates, ...
    'o', 'MarkerFaceColor', [0 0 0], 'MarkerEdgeColor', [0 0 0])
hold on;

scatter3(node_new_x_coordinates, node_new_y_coordinates, node_new_z_coordinates, ...
    'o', 'MarkerFaceColor', [0.5 0.5 0.5], 'MarkerEdgeColor', [0.5 0.5 0.5])
hold on;

num_of_broken_beams_twist = 0;

for i = 1:num_of_beams
    
    twist_breaking_fraction = beams_ex(i).twist_deform / break_twist;
    
    if (twist_breaking_fraction <= 1.0)
        the_color = [twist_breaking_fraction, 0.0, 0.0];
    else
        the_color = [1.0, 0.5, 0.0];
        num_of_broken_beams_twist = num_of_broken_beams_twist + 1;
    end
    
    line([beams_ex(i).n1_new_pos(1), beams_ex(i).n2_new_pos(1)], ...
         [beams_ex(i).n1_new_pos(2), beams_ex(i).n2_new_pos(2)], ...
         [beams_ex(i).n1_new_pos(3), beams_ex(i).n2_new_pos(3)], ...
         'Color', the_color, ...
         'LineWidth', 2); 
end

for i = 1:num_of_nodes
    %Render the torsions:
    line([nodes_ex(i).new_position(1), nodes_ex(i).new_position(1) + 2*nodes_ex(i).torsion(1)], ... 
         [nodes_ex(i).new_position(2), nodes_ex(i).new_position(2) + 2*nodes_ex(i).torsion(2)], ... 
         [nodes_ex(i).new_position(3), nodes_ex(i).new_position(3) + 2*nodes_ex(i).torsion(3)], ... 
         'Color', [0.8 0.8 0.0], ...
         'LineWidth', 1);
end

title('Twist strain.');

daspect([1 1 1]);

fprintf('The number of twist failures is: %i\n', num_of_broken_beams_twist);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%% bend strain map 

subplot(3,2,6);

scatter3(g_node_x_coordinates, g_node_y_coordinates, g_node_z_coordinates, ...
    'o', 'MarkerFaceColor', [0 0 0], 'MarkerEdgeColor', [0 0 0])
hold on;

scatter3(node_new_x_coordinates, node_new_y_coordinates, node_new_z_coordinates, ...
    'o', 'MarkerFaceColor', [0.5 0.5 0.5], 'MarkerEdgeColor', [0.5 0.5 0.5])
hold on;

num_of_broken_beams_bend = 0;

for i = 1:num_of_beams
    
    bend_breaking_fraction = beams_ex(i).bend_deform / break_bend;
    
    if (bend_breaking_fraction <= 1.0)
        the_color = [bend_breaking_fraction, 0.0, 0.0];
    else
        the_color = [1.0, 0.5, 0.0];
        num_of_broken_beams_bend = num_of_broken_beams_bend + 1;
    end
    
    line([beams_ex(i).n1_new_pos(1), beams_ex(i).n2_new_pos(1)], ...
         [beams_ex(i).n1_new_pos(2), beams_ex(i).n2_new_pos(2)], ...
         [beams_ex(i).n1_new_pos(3), beams_ex(i).n2_new_pos(3)], ...
         'Color', the_color, ...
         'LineWidth', 2); 
end

for i = 1:num_of_nodes
    %Render the torsions:
    line([nodes_ex(i).new_position(1), nodes_ex(i).new_position(1) + 2*nodes_ex(i).torsion(1)], ... 
         [nodes_ex(i).new_position(2), nodes_ex(i).new_position(2) + 2*nodes_ex(i).torsion(2)], ... 
         [nodes_ex(i).new_position(3), nodes_ex(i).new_position(3) + 2*nodes_ex(i).torsion(3)], ... 
         'Color', [0.8 0.8 0.0], ...
         'LineWidth', 1);
end

title('Bend strain.');

daspect([1 1 1]);

fprintf('The number of bend failures is: %i\n', num_of_broken_beams_bend);


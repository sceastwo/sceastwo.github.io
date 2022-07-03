clear;
clc;
format long;


num_of_nodes = 5; %Does not count the ground node.
%The ground node has the index 0. The other indices are: 
%1, 2, ..., num_of_nodes



%%%% RESISTORS %%%%%%%%%%%

num_of_resistors = 7;

%num_of_resistors x 2 matrix where row i are the terminal nodes of resistor
%i.
resistor_end_nodes = ...
    [1, 0; ...
     2, 1; ... 
     3, 0; ...
     4, 0; ... 
     4, 3; ...
     5, 3; ...
     5, 4];
 
%num_of_resistors x 1 matrix where row i is the resistance of resistor
%i.    
resistor_values = ...
    [6.0; 
    12.0;
     1.0;
     1.0;
     1.0;
     1.0;
     1.0];


%Error check:
if (size(resistor_end_nodes, 1) ~= num_of_resistors || size(resistor_end_nodes, 2) ~= 2)
    fprintf('Error: resistor_end_nodes size mismatch'); 
    return;
end
if (size(resistor_values, 1) ~= num_of_resistors || size(resistor_values, 2) ~= 1)
    fprintf('Error: resistor_values size mismatch'); 
    return;
end
for i = 1:num_of_resistors
    if ((resistor_end_nodes(i,1) < 0) || (resistor_end_nodes(i,1) > num_of_nodes) ... 
       || (resistor_end_nodes(i,2) < 0) || (resistor_end_nodes(i,2) > num_of_nodes))
        fprintf('Error: resistor_end_nodes invalid node indices detected');
        return;
    end
end


%%%% CURRENT SOURCES %%%%%%%%%%%

num_of_current_sources = 2;

%num_of_current_sources x 2 matrix where row i are the terminal nodes of
%current source i. The first column is the start node, the second column is
%the destination node.
current_source_end_nodes = ...
    [0, 2; ...
     0, 5];
 
%num_of_current_sources x 1 matrix where row i is the current in current source 
%i.    
current_source_values = ...
    [20.0; ...
      7.0];

%Error check:
if (size(current_source_end_nodes, 1) ~= num_of_current_sources || size(current_source_end_nodes, 2) ~= 2)
    fprintf('Error: current_source_end_nodes size mismatch');
    return; 
end
if (size(current_source_values, 1) ~= num_of_current_sources || size(current_source_values, 2) ~= 1)
    fprintf('Error: current_source_values size mismatch'); 
    return;
end
for i = 1:num_of_current_sources
    if ((current_source_end_nodes(i,1) < 0) || (current_source_end_nodes(i,1) > num_of_nodes) ... 
       || (current_source_end_nodes(i,2) < 0) || (current_source_end_nodes(i,2) > num_of_nodes))
        fprintf('Error: current_source_end_nodes invalid node indices detected');
        return;
    end
end



%%%%%%%% COMPILE THE DATA


%num_of_nodes x 1 matrix where row i is the total outwards current flux at
%node i.
current_flux_vals = zeros(num_of_nodes, 1);

%num_of_nodes x num_of_nodes matrix where cell (i, j) is the current flux out of
%node i as a result of the voltage at node j.
conductivity_matrix = zeros(num_of_nodes, num_of_nodes);

% Process the resistors:
for i = 1:num_of_resistors
    n_1 = resistor_end_nodes(i,1);
    n_2 = resistor_end_nodes(i,2);
    if ((1 <= n_1) && (n_1 <= num_of_nodes))
        conductivity_matrix(n_1, n_1) = conductivity_matrix(n_1, n_1) + 1 / resistor_values(i);
        if ((1 <= n_2) && (n_2 <= num_of_nodes))
            conductivity_matrix(n_2, n_2) = conductivity_matrix(n_2, n_2) + 1 / resistor_values(i);
            conductivity_matrix(n_1, n_2) = conductivity_matrix(n_1, n_2) - 1 / resistor_values(i);
            conductivity_matrix(n_2, n_1) = conductivity_matrix(n_2, n_1) - 1 / resistor_values(i);
        end
    else
        if ((1 <= n_2) && (n_2 <= num_of_nodes))
            conductivity_matrix(n_2, n_2) = conductivity_matrix(n_2, n_2) + 1 / resistor_values(i);
        end
    end
end

% Process the current sources:
for i = 1:num_of_current_sources
    n_1 = current_source_end_nodes(i,1);
    n_2 = current_source_end_nodes(i,2);
    if ((1 <= n_1) && (n_1 <= num_of_nodes))
        current_flux_vals(n_1) = current_flux_vals(n_1) - current_source_values(i);
    end
    if ((1 <= n_2) && (n_2 <= num_of_nodes))
        current_flux_vals(n_2) = current_flux_vals(n_2) + current_source_values(i);
    end
end

%num_of_nodes x 1 matrix where row i is the voltage at node i.
node_voltages = conductivity_matrix\current_flux_vals






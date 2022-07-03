clear;
clc;
format long;


num_of_nodes = ???; 
%Does not count the ground node.
%The ground node has the index 0. The other indices are: 
%1, 2, ..., num_of_nodes


%%%% CURRENT SOURCES %%%%%%%%%%%

num_of_current_sources = ???;

%num_of_current_sources x 2 matrix where row i are the terminal nodes of
%current source i. The first column is the start node, the second column is
%the destination node.
current_source_end_nodes = ???;
 
%num_of_current_sources x 1 matrix where row i is the current in current source 
%i.    
current_source_values = ???;


%%%% RESISTORS %%%%%%%%%%%

num_of_resistors = ???;

%num_of_resistors x 2 matrix where row i are the terminal nodes of resistor
%i.
resistor_end_nodes = ???;
 
%num_of_resistors x 1 matrix where row i is the resistance of resistor
%i.    
resistor_values = ???;


%%%%%%%% COMPILE THE DATA


%num_of_nodes x 1 matrix where row i is the total outwards current flux at
%node i.
Phi = zeros(num_of_nodes, 1);

%num_of_nodes x num_of_nodes matrix where cell (i, j) is the current flux out of
%node i as a result of the voltage at node j.
A = zeros(num_of_nodes, num_of_nodes);

% Process the current sources:
for i = 1:num_of_current_sources
    n_1 = current_source_end_nodes(i,1);
    n_2 = current_source_end_nodes(i,2);
    if ((1 <= n_1) && (n_1 <= num_of_nodes))
        % The start node is not the ground:
        Phi(n_1) = ???;
    end
    if ((1 <= n_2) && (n_2 <= num_of_nodes))
        % The end node is not the ground:
        Phi(n_2) = ???;
    end
end

% Process the resistors:
for i = 1:num_of_resistors
    n_1 = resistor_end_nodes(i,1);
    n_2 = resistor_end_nodes(i,2);
    if ((1 <= n_1) && (n_1 <= num_of_nodes))
        % The first terminal node is not the ground:
        if ((1 <= n_2) && (n_2 <= num_of_nodes))
            % The second terminal node is not the ground:
            A(n_1, n_1) = ???;
            A(n_2, n_2) = ???;
            A(n_1, n_2) = ???;
            A(n_2, n_1) = ???;
        else
            % The second terminal node is the ground:
            A(n_1, n_1) = ???;
        end
    else
        % The first terminal node is the ground:
        if ((1 <= n_2) && (n_2 <= num_of_nodes))
            % The second terminal node is not the ground:
            A(n_2, n_2) = ???;
        end
    end
end

Phi
A
%num_of_nodes x 1 matrix where row i is the voltage at node i.
V = A\Phi






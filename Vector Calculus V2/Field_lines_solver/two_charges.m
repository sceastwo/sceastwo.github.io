
clear;
clc;

d_x = 0.25;
d_y = 0.25; 
d_z = 0.25;
d_V = d_x * d_y * d_z;

X_vals = -10.0:d_x:10.0;
Y_vals = -10.0:d_y:10.0;
Z_vals = -10.0:d_z:10.0;

N_x = size(X_vals,2); 
N_y = size(Y_vals,2); 
N_z = size(Z_vals,2); 

% index(i,j,k) = N_y*N_z*(k-1) + N_y*(j-1) + i 

rho = zeros(N_x,N_y,N_z); 
% (-2,0,0) : (8/d_x + 1, 10/d_y + 1, 10/d_z + 1)
% (2,0,0) : (12/d_x + 1, 10/d_y + 1, 10/d_z + 1) 
rho(8/d_x + 1, 10/d_y + 1, 10/d_z + 1) = 1; 
rho(12/d_x + 1, 10/d_y + 1, 10/d_z + 1) = -1; 
%rho(10/d_x + 1, 10/d_y + 1, 10/d_z + 1) = 1; 

rho_vec = reshape(rho,[N_x*N_y*N_z,1]);

%rho(i,j,k) = (2*V(i,j,k) - V(i-1,j,k) - V(i+1,j,k)) * (d_y * d_z / d_x) ...
%           + (2*V(i,j,k) - V(i,j-1,k) - V(i,j+1,k)) * (d_z * d_x / d_y) ...
%           + (2*V(i,j,k) - V(i,j,k-1) - V(i,j,k+1)) * (d_x * d_y / d_z))

num_of_entries = N_x*N_y*N_z + 2*(N_x-1)*N_y*N_z + 2*N_x*(N_y-1)*N_z + 2*N_x*N_y*(N_z-1);
i_M = zeros(num_of_entries,1); 
j_M = zeros(num_of_entries,1);
vals_M = zeros(num_of_entries,1);
entry_index = 0;

for k = 1:N_z
    for j = 1:N_y 
        for i = 1:N_x
            row_index = N_x*N_y*(k-1) + N_x*(j-1) + i;
 
            entry_index = entry_index+1;
            i_M(entry_index) = row_index; 
            j_M(entry_index) = row_index; 
            vals_M(entry_index) = 2 * (d_y * d_z / d_x + d_z * d_x / d_y + d_x * d_y / d_z);

            if (i > 1)
                entry_index = entry_index+1;
                i_M(entry_index) = row_index; 
                j_M(entry_index) = row_index-1;
                vals_M(entry_index) = -(d_y * d_z / d_x);
            end
            if (i < N_x)
                entry_index = entry_index+1;
                i_M(entry_index) = row_index;
                j_M(entry_index) = row_index+1;
                vals_M(entry_index) = -(d_y * d_z / d_x);
            end
            if (j > 1) 
                entry_index = entry_index+1;
                i_M(entry_index) = row_index;
                j_M(entry_index) = row_index-N_x;
                vals_M(entry_index) = -(d_z * d_x / d_y);
            end
            if (j < N_y) 
                entry_index = entry_index+1;
                i_M(entry_index) = row_index;
                j_M(entry_index) = row_index+N_x;
                vals_M(entry_index) = -(d_z * d_x / d_y);
            end
            if (k > 1) 
                entry_index = entry_index+1;
                i_M(entry_index) = row_index;
                j_M(entry_index) = row_index-N_x*N_y;
                vals_M(entry_index) = -(d_x * d_y / d_z);
            end
            if (k < N_z)
                entry_index = entry_index+1;
                i_M(entry_index) = row_index;
                j_M(entry_index) = row_index+N_x*N_y;
                vals_M(entry_index) = -(d_x * d_y / d_z);
            end
        end
    end
end 

i_M = i_M(1:entry_index); 
j_M = j_M(1:entry_index); 
vals_M = vals_M(1:entry_index);

M = sparse(i_M,j_M,vals_M,N_x*N_y*N_z,N_x*N_y*N_z);

'checkpoint'

V_vec = pcg(M,rho_vec,1e-6,100);

V = reshape(V_vec,[N_x,N_y,N_z]);

V_ext = zeros(N_x+2,N_y+2,N_z+2);
V_ext(2:(N_x+1),2:(N_y+1),2:(N_z+1)) = V; 

D_x = -diff(V_ext(:,2:(N_y+1),2:(N_z+1)),1,1) * (d_y * d_z / d_x);
D_y = -diff(V_ext(2:(N_x+1),:,2:(N_z+1)),1,2) * (d_z * d_x / d_y);
D_z = -diff(V_ext(2:(N_x+1),2:(N_y+1),:),1,3) * (d_x * d_y / d_z);



[Y, X, Z] = meshgrid(Y_vals, X_vals, Z_vals);

D_x_2 = 0.5 * (D_x(1:N_x,:,:) + D_x(2:(N_x+1),:,:));
D_y_2 = 0.5 * (D_y(:,1:N_y,:) + D_y(:,2:(N_y+1),:));
D_z_2 = 0.5 * (D_z(:,:,1:N_z) + D_z(:,:,2:(N_z+1)));

quiver3(X,Y,Z,D_x_2,D_y_2,D_z_2);




function y = line_weight_gen(x)
    y = abs(50*x) + 0.001;
end

function the_color = color_gen(x)
    %the_color = zeros(1,3); 
    %the_color(1) = 20 * x - floor(20 * x);
    %the_color(2) = 10 * x - floor(10 * x);
    %the_color(3) = 5 * x - floor(5 * x);
    if (x > 0) 
        the_color = [1 0 0]; 
    elseif (x < 0)
        the_color = [0 0 1];
    else 
        the_color = [0 0 0];
    end
end



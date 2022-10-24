
clear;
clc;

d_x = 1.0; 
d_y = 1.0; 
d_z = 1.0; 
d_V = d_x * d_y * d_z;

X_vals = -10.0:d_x:10.0;
Y_vals = -10.0:d_y:10.0;
Z_vals = -10.0:d_z:10.0;

N_x = size(X_vals,2); 
N_y = size(Y_vals,2); 
N_z = size(Z_vals,2); 



D_x =  4 * ones(N_x+1,N_y  ,N_z  );
D_y =  3 * ones(N_x  ,N_y+1,N_z  );
D_z = -2 * ones(N_x  ,N_y  ,N_z+1);



[Y, X, Z] = meshgrid(Y_vals, X_vals, Z_vals);

D_x_2 = 0.5 * (D_x(1:N_x,:,:) + D_x(2:(N_x+1),:,:));
D_y_2 = 0.5 * (D_y(:,1:N_y,:) + D_y(:,2:(N_y+1),:));
D_z_2 = 0.5 * (D_z(:,:,1:N_z) + D_z(:,:,2:(N_z+1)));

quiver3(X,Y,Z,D_x_2,D_y_2,D_z_2);





clear;
clc;

d_x = 0.5;
d_y = 0.5; 
d_z = 0.5;
d_V = d_x * d_y * d_z;

X_vals = -10.0:d_x:10.0;
Y_vals = -10.0:d_y:10.0;
Z_vals = -10.0:d_z:10.0;

N_x = size(X_vals,2); 
N_y = size(Y_vals,2); 
N_z = size(Z_vals,2); 

V = zeros(N_x+2,N_y+2,N_z+2);

rho = zeros(N_x,N_y,N_z); 
% (-2,0,0) : (8/d_x + 1, 10/d_y + 1, 10/d_z + 1)
% (2,0,0) : (12/d_x + 1, 10/d_y + 1, 10/d_z + 1) 
rho(8/d_x + 1, 10/d_y + 1, 10/d_z + 1) = 1; 
rho(12/d_x + 1, 10/d_y + 1, 10/d_z + 1) = -1; 
%rho(10/d_x + 1, 10/d_y + 1, 10/d_z + 1) = 1; 

%rho = ((2*V(2:(N_x+1),2:(N_y+1),2:(N_z+1)) - V(1:N_x    ,2:(N_y+1),2:(N_z+1)) - V(3:(N_x+2),2:(N_y+1),2:(N_z+1))) * (d_y * d_z / d_x) ...
%     + (2*V(2:(N_x+1),2:(N_y+1),2:(N_z+1)) - V(2:(N_x+1),1:N_y    ,2:(N_z+1)) - V(2:(N_x+1),3:(N_y+2),2:(N_z+1))) * (d_z * d_x / d_y) ...
%     + (2*V(2:(N_x+1),2:(N_y+1),2:(N_z+1)) - V(2:(N_x+1),2:(N_y+1),1:N_z    ) - V(2:(N_x+1),2:(N_y+1),3:(N_z+2))) * (d_x * d_y / d_z))

tolerance = 0.1;
error = 1.0;
iter = 1;
while ((error > 1e-6) && (iter < 2000))
    error = max(abs(((2*V(2:(N_x+1),2:(N_y+1),2:(N_z+1)) - V(1:N_x    ,2:(N_y+1),2:(N_z+1)) - V(3:(N_x+2),2:(N_y+1),2:(N_z+1))) * (d_y * d_z / d_x) ... 
                   + (2*V(2:(N_x+1),2:(N_y+1),2:(N_z+1)) - V(2:(N_x+1),1:N_y    ,2:(N_z+1)) - V(2:(N_x+1),3:(N_y+2),2:(N_z+1))) * (d_z * d_x / d_y) ... 
                   + (2*V(2:(N_x+1),2:(N_y+1),2:(N_z+1)) - V(2:(N_x+1),2:(N_y+1),1:N_z    ) - V(2:(N_x+1),2:(N_y+1),3:(N_z+2))) * (d_x * d_y / d_z) - rho)),[],'all')
    new_V = (1/(2*(d_y * d_z / d_x + d_z * d_x / d_y + d_x * d_y / d_z))) * (rho ...
        + (V(1:N_x    ,2:(N_y+1),2:(N_z+1)) + V(3:(N_x+2),2:(N_y+1),2:(N_z+1))) * (d_y * d_z / d_x) ...
        + (V(2:(N_x+1),1:N_y    ,2:(N_z+1)) + V(2:(N_x+1),3:(N_y+2),2:(N_z+1))) * (d_z * d_x / d_y) ...
        + (V(2:(N_x+1),2:(N_y+1),    1:N_z) + V(2:(N_x+1),2:(N_y+1),3:(N_z+2))) * (d_x * d_y / d_z));
    V(2:(N_x+1),2:(N_y+1),2:(N_z+1)) = 0.0 * V(2:(N_x+1),2:(N_y+1),2:(N_z+1)) + 1.0 * new_V;

    iter = iter + 1;
end 

D_x = -diff(V(:,2:(N_y+1),2:(N_z+1)),1,1) * (d_y * d_z / d_x);
D_y = -diff(V(2:(N_x+1),:,2:(N_z+1)),1,2) * (d_z * d_x / d_y);
D_z = -diff(V(2:(N_x+1),2:(N_y+1),:),1,3) * (d_x * d_y / d_z);

% line(0,0,0);
% hold on;
% for i = 1:N_x
%     for j = 1:N_y 
%         for k = 1:N_z
%             if (i == 1)
%                 weight = D_x(i,j,k);
%                 line([X_vals(i)-d_x, X_vals(i)], [Y_vals(j), Y_vals(j)], [Z_vals(k), Z_vals(k)],'LineWidth',line_weight_gen(weight),'Color',color_gen(weight));
%             end
%             weight = D_x(i+1,j,k);
%             line([X_vals(i), X_vals(i)+d_x], [Y_vals(j), Y_vals(j)], [Z_vals(k), Z_vals(k)],'LineWidth',line_weight_gen(weight),'Color',color_gen(weight));
% 
%             if (j == 1)
%                 weight = D_y(i,j,k);
%                 line([X_vals(i), X_vals(i)], [Y_vals(j)-d_y, Y_vals(j)], [Z_vals(k), Z_vals(k)],'LineWidth',line_weight_gen(weight),'Color',color_gen(weight));
%             end
%             weight = D_y(i,j+1,k);
%             line([X_vals(i), X_vals(i)], [Y_vals(j), Y_vals(j)+d_y], [Z_vals(k), Z_vals(k)],'LineWidth',line_weight_gen(weight),'Color',color_gen(weight));
% 
%             if (k == 1)
%                 weight = D_z(i,j,k);
%                 line([X_vals(i), X_vals(i)], [Y_vals(j), Y_vals(j)], [Z_vals(k)-d_z, Z_vals(k)],'LineWidth',line_weight_gen(weight),'Color',color_gen(weight));
%             end
%             weight = D_z(i,j,k+1);
%             line([X_vals(i), X_vals(i)], [Y_vals(j), Y_vals(j)], [Z_vals(k), Z_vals(k)+d_z],'LineWidth',line_weight_gen(weight),'Color',color_gen(weight));
%         end
%     end
% end

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



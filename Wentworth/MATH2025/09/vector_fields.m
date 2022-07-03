clear;
clc;
format;


% Example 1:
% [x, y] = meshgrid(-2.0:0.2:2.0, -2.0:0.2:2.0);
% 
% F_x = zeros(size(x)) + 3;
% F_y = zeros(size(x)) + 4;


% Example 2: 
% [x, y] = meshgrid(-2.0:0.2:2.0, -2.0:0.2:2.0);
% 
% F_x = zeros(size(x)) + 1;
% F_y = x - 1;


% Example 3: 
% [x, y] = meshgrid(-2.0:0.2:2.0, -2.0:0.2:2.0);
% 
% F_x = x;
% F_y = y;


% Example 4:
% [x, y] = meshgrid(-2.0:0.2:2.0, -2.0:0.2:2.0);
% 
% F_x = y;
% F_y = x;


% Example 5:
% [x, y] = meshgrid(-2.0:0.2:2.0, -2.0:0.2:2.0);
% 
% F_x = -y;
% F_y = x;


% Example 6:
% [x, y] = meshgrid(-2.0:0.2:2.0, -2.0:0.2:2.0);
% 
% F_x = x - y;
% F_y = y + x;


% Example 7:
% [x, y] = meshgrid(-2.0:0.2:2.0, -2.0:0.2:2.0);
% 
% F_x = x./sqrt(x.^2 + y.^2);
% F_y = y./sqrt(x.^2 + y.^2);
% 
% 
% 
% quiver(x, y, F_x, F_y)
% 
% daspect([1 1 1])



% Example 8:
% [x, y, z] = meshgrid(-2.0:0.4:2.0, -2.0:0.4:2.0, -2.0:0.4:2.0);
% 
% F_x = -x;
% F_y = -y;
% F_z = z./sqrt(x.^2 + y.^2 + 1);
% 
% quiver3(x, y, z, F_x, F_y, F_z)
% 
% daspect([1 1 1])



% Example 9: 
F_x = @(x, y) x;
F_y = @(x, y) y;

[x, y] = meshgrid(-2.0:0.2:2.0, -2.0:0.2:2.0);

quiver(x, y, F_x(x,y), F_y(x,y))
hold on;

daspect([1 1 1])

t = 0.0:0.1:(1.5*pi);
x_C = size(1,size(t,2));
y_C = size(1,size(t,2));
for i = 1:size(t,2)
    if (t(i) < 0.5*pi)
        x_C(i) = -cos(t(i));
        y_C(i) = -2.0 + sin(t(i));
    elseif (t(i) < pi)
        x_C(i) = -cos(t(i));
        y_C(i) = -sin(t(i));
    else
        x_C(i) = 2.0 + cos(t(i));
        y_C(i) = -sin(t(i));
    end
end

for i = 1:(size(t,2)-1)
    dxC_dt = (x_C(i+1) - x_C(i))/(t(i+1) - t(i)); 
    dyC_dt = (y_C(i+1) - y_C(i))/(t(i+1) - t(i)); 
    T_x = dxC_dt/norm([dxC_dt; dyC_dt]);  
    T_y = dyC_dt/norm([dxC_dt; dyC_dt]);  
    dphi = dot([T_x; T_y], [F_x(x_C(i), y_C(i)); F_y(x_C(i), y_C(i))]);
    if (dphi == 0)
        the_color = [0, 0, 0];
    elseif (dphi > 0)
        the_color = (2/pi)*atan(4*dphi) * [1, 0, 0];
    else
        the_color = (2/pi)*atan(-4*dphi) * [0, 0, 1];
    end
    line([x_C(i), x_C(i+1)], [y_C(i), y_C(i+1)], 'LineWidth', 3, 'Color', the_color);
end






clear;
clc;
format;



%Example 0:

f = @ (x, y) x + 2*y;

g = @ (x, y) 18*x.^2 + 9*y.^2;

c = 2;

t = 0:0.01:(2*pi+0.01);
x_curve = (1/3)*cos(t);
y_curve = (sqrt(2)/3)*sin(t);

[x, y] = meshgrid(-1.0:0.1:1.0, -1.0:0.1:1.0);
contourf(x,y,f(x,y),30);
hold on;
plot(x_curve, y_curve, 'LineWidth', 2, 'Color', [1 1 1]);
scatter([-1/9], [-4/9], 'filled', 'MarkerEdgeColor', 'none', 'MarkerFaceColor', [0.5 0 0.5]);
scatter([1/9], [4/9], 'filled', 'MarkerEdgeColor', 'none', 'MarkerFaceColor', [1.0 0 1.0]);
daspect([1 1 1]);




%Example 1:

% f = @ (x, y) (x.^2).*y;
% 
% g = @ (x, y) x.^2 + 2*y.^2;
% 
% c = 6;
% 
% t = 0:0.01:(2*pi+0.01);
% x_curve = sqrt(6)*cos(t);
% y_curve = sqrt(3)*sin(t);
% 
% [x, y] = meshgrid(-3.0:0.1:3.0, -2.0:0.1:2.0);
% contourf(x,y,f(x,y),30);
% hold on;
% plot(x_curve, y_curve, 'LineWidth', 2, 'Color', [1 1 1]);
% scatter([2 -2], [-1 -1], 'filled', 'MarkerEdgeColor', 'none', 'MarkerFaceColor', [0.5 0 0.5]);
% scatter([2 -2], [1 1], 'filled', 'MarkerEdgeColor', 'none', 'MarkerFaceColor', [1.0 0 1.0]);
% daspect([1 1 1]);





%Example 2:

% f = @ (x, y) x.*y;
% 
% g = @ (x, y) x.^2 + 2*y.^2;
% 
% c = 4;
% 
% t = 0:0.01:(2*pi+0.01);
% x_curve = 2*cos(t);
% y_curve = sqrt(2)*sin(t);
% 
% [x, y] = meshgrid(-3.0:0.1:3.0, -2.0:0.1:2.0);
% contourf(x,y,f(x,y),30);
% hold on;
% plot(x_curve, y_curve, 'LineWidth', 2, 'Color', [1 1 1]);
% scatter([sqrt(2) -sqrt(2)], [-1 1], 'filled', 'MarkerEdgeColor', 'none', 'MarkerFaceColor', [0.5 0 0.5]);
% scatter([sqrt(2) -sqrt(2)], [1 -1], 'filled', 'MarkerEdgeColor', 'none', 'MarkerFaceColor', [1.0 0 1.0]);
% daspect([1 1 1]);



%Example 3:

% f = @ (x, y) x.^2 + y.^2;
% 
% g = @ (x, y) (x-1).^2 + 4*y.^2;
% 
% c = 4;
% 
% t = 0:0.01:(2*pi+0.01);
% x_curve = 1 + 2*cos(t);
% y_curve = sin(t);
% 
% [x, y] = meshgrid(-2.0:0.1:4.0, -2.0:0.1:2.0);
% contourf(x,y,f(x,y),30);
% hold on;
% plot(x_curve, y_curve, 'LineWidth', 2, 'Color', [1 1 1]);
% scatter([-1/3 -1/3], [sqrt(5)/3 -sqrt(5)/3], 'filled', 'MarkerEdgeColor', 'none', 'MarkerFaceColor', [0.5 0 0.5]);
% scatter([3], [0], 'filled', 'MarkerEdgeColor', 'none', 'MarkerFaceColor', [1.0 0 1.0]);
% daspect([1 1 1]);









clear;
clc;
format;

x0 = 2.0;
y0 = 3.0;
z0 = 6.0;

delta_x = 1.0;
delta_y = 1.0;
delta_zx = 0.5*delta_x;
delta_zy = 1.0*delta_y;

[x, y] = meshgrid((x0 - delta_x):0.05:(x0 + delta_x), (y0 - delta_y):0.05:(y0 + delta_y));

z = z0 + 0.5 * (x - x0) + 1.0 * (y - y0) - 0.5 * (x - x0).^2 - 0.5 * (y - y0).^2;
z_plane = 6 + 0.5 * (x - x0) + 1.0 * (y - y0);

surf(x, y, z, 'EdgeColor', 'none');
hold on;
surf(x, y, z_plane, 'FaceColor', 'none', 'FaceAlpha',0.5);
scatter3(x0, y0, z0, 'MarkerEdgeColor', [0.5 0 0.5], 'MarkerFaceColor', [0.5 0 0.5]);
line([x0 - delta_x, x0 + delta_x], [y0, y0], [z0 - delta_zx, z0 + delta_zx], 'Color', [0 0 0], 'LineWidth', 2);
line([x0, x0], [y0 - delta_y, y0 + delta_y], [z0 - delta_zy, z0 + delta_zy], 'Color', [0 0 0], 'LineWidth', 2);



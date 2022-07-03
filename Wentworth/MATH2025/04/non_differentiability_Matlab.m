clear;
clc;
format;

[x, y] = meshgrid((-2.0):0.05:2.0, (-2.0):0.05:2.0); 

z = zeros(size(x));

z_plane = z;

for i = 1:size(x,1)
    for j = 1:size(x,2)
        z(i,j) = min(abs(x(i,j)), abs(y(i,j)));
    end 
end

surf(x,y,z,'FaceAlpha',0.5);
hold on;
surf(x,y,z_plane,'FaceColor',[1 0 0],'EdgeColor','none');
scatter3(0, 0, 0, 'MarkerEdgeColor', [1 0.5 1], 'MarkerFaceColor', [1 0.5 1]);
line([-2.0, 2.0], [0.0, 0.0], [0.0, 0.0], 'Color', [0.9 0.9 0.9], 'LineWidth', 2);
line([0.0, 0.0], [-2.0, 2.0], [0.0, 0.0], 'Color', [0.9 0.9 0.9], 'LineWidth', 2);

daspect([1 1 1]);


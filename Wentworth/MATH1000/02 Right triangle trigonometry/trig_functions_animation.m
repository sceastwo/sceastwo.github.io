clear
clc
format

tracers_on = 1;

theta_vals = 0:0.01:2*pi;
N = size(theta_vals,2);

cos_vals = cos(theta_vals);
sin_vals = sin(theta_vals);

tan_vals = tan(theta_vals);
sec_vals = sec(theta_vals);

cot_vals = cot(theta_vals);
csc_vals = csc(theta_vals);

%%%%%%%%%%%%%%%%%%%%%%%
subplot(2,2,1);

%x-axis
line([-3.0, 3.0], [0.0, 0.0], 'Color', [0 0 0], 'LineWidth', 1);
%y-axis
line([0.0, 0.0], [-3.0, 3.0], 'Color', [0 0 0], 'LineWidth', 1);

unit_circle_data = [cos(0:0.01:2*pi); sin(0:0.01:2*pi)];
unit_circle = line(unit_circle_data(1,:), unit_circle_data(2,:), ...
                   'Color', [1 0 0], 'LineWidth', 1);

tangent_data = [ones(1,size(-2:0.01:2,2)); -2:0.01:2];
tangent = line(tangent_data(1,:), tangent_data(2,:), ...
               'Color', [0 1 0], 'LineWidth', 1);

cotangent_data = [-2:0.01:2; ones(1,size(-2:0.01:2,2))];
cotangent = line(cotangent_data(1,:), cotangent_data(2,:), ...
                 'Color', [0 0 1], 'LineWidth', 1);           

positive_ray = line([0.0, 3.0], [0.0, 0.0], ...
                    'Color', [0.5 0.5 0.0], 'LineWidth', 1);

negative_ray = line([0.0, -3.0], [0.0, 0.0], ...
                    'Color', [0.5 0.5 1.0], 'LineWidth', 1, 'LineStyle', '--');
 
intersection_point_1 = line(1.0, 0.0, ...
                            'Color', [0.5 0 0], 'Marker', 'o', 'MarkerSize', 5);

intersection_point_2 = line(1.0, 0.0, ...
                            'Color', [0 0.5 0], 'Marker', 'o', 'MarkerSize', 5);

intersection_point_3 = line(10.0, 1.0, ...
                            'Color', [0 0 0.5], 'Marker', 'o', 'MarkerSize', 5);                        
                        
xlabel('x');
xlim([-2, 2]);
ylabel('y');
ylim([-2, 2]);
daspect([1 1 1]);

%%%%%%%%%%%%%%%%%%%%%%%
subplot(2,2,2);

%x-axis
line([0, 2*pi], [0, 0], 'Color', [0 0 0], 'LineWidth', 1);

line(theta_vals, cos_vals, 'Color', [0.5 0 0], 'LineWidth', 1);
line(theta_vals, sin_vals, 'Color', [1 0.5 0.5], 'LineWidth', 1);

if (tracers_on)
    cos_tracker = line(0.0, 1.0, ...
                       'Color', [0.5 0 0], 'Marker', 'o', 'MarkerSize', 5);

    sin_tracker = line(0.0, 0.0, ...
                       'Color', [1 0.5 0.5], 'Marker', 'o', 'MarkerSize', 5);
end
               
xlabel('theta');
xlim([0, 2*pi]);
ylim([-2.0, 2.0]);
daspect([1 1 1]);

%%%%%%%%%%%%%%%%%%%%%%%
subplot(2,2,3);

%x-axis
line([0, 2*pi], [0, 0], 'Color', [0 0 0], 'LineWidth', 1);

line(theta_vals, tan_vals, 'Color', [0 0.5 0], 'LineWidth', 1);
line(theta_vals, sec_vals, 'Color', [0.5 1 0.5], 'LineWidth', 1);
line([pi/2, pi/2], [-4.0, 4.0], 'Color', [0 0 0], 'LineWidth', 1);
line([3*pi/2, 3*pi/2], [-4.0, 4.0], 'Color', [0 0 0], 'LineWidth', 1);

if (tracers_on)
    tan_tracker = line(0.0, 0.0, ...
                       'Color', [0 0.5 0], 'Marker', 'o', 'MarkerSize', 5);

    sec_tracker = line(0.0, 1.0, ...
                       'Color', [0.5 1 0.5], 'Marker', 'o', 'MarkerSize', 5);
end
               
xlabel('theta');
xlim([0, 2*pi]);
ylim([-4.0, 4.0]);
daspect([1 2 1]);

%%%%%%%%%%%%%%%%%%%%%%%
subplot(2,2,4);

%x-axis
line([0, 2*pi], [0, 0], 'Color', [0 0 0], 'LineWidth', 1);

line(theta_vals, cot_vals, 'Color', [0 0 0.5], 'LineWidth', 1);
line(theta_vals, csc_vals, 'Color', [0.5 0.5 1], 'LineWidth', 1);
line([pi, pi], [-4.0, 4.0], 'Color', [0 0 0], 'LineWidth', 1);

if (tracers_on)
    cot_tracker = line(0.0, 10.0, ...
                       'Color', [0 0 0.5], 'Marker', 'o', 'MarkerSize', 5);

    csc_tracker = line(0.0, 10.0, ...
                       'Color', [0.5 0.5 1], 'Marker', 'o', 'MarkerSize', 5);
end
               
xlabel('theta');
xlim([0, 2*pi]);
ylim([-4.0, 4.0]);
daspect([1 2 1]);

%%%%%%%%%%%%%%%%%%%%%%%

drawnow;

theta = 0.0;
while (isvalid(unit_circle))
    positive_ray.XData = [0.0, 3.0*cos(theta)];
    positive_ray.YData = [0.0, 3.0*sin(theta)];
    
    negative_ray.XData = [0.0, -3.0*cos(theta)];
    negative_ray.YData = [0.0, -3.0*sin(theta)];
    
    intersection_point_1.XData = cos(theta);
    intersection_point_1.YData = sin(theta);
    
    intersection_point_2.XData = 1.0;
    intersection_point_2.YData = tan(theta);
    
    intersection_point_3.XData = cot(theta);
    intersection_point_3.YData = 1.0;
    
    if (tracers_on)
        cos_tracker.XData = theta;
        cos_tracker.YData = cos(theta);

        sin_tracker.XData = theta;
        sin_tracker.YData = sin(theta);

        tan_tracker.XData = theta;
        tan_tracker.YData = tan(theta);

        sec_tracker.XData = theta;
        sec_tracker.YData = sec(theta);

        cot_tracker.XData = theta;
        cot_tracker.YData = cot(theta);

        csc_tracker.XData = theta;
        csc_tracker.YData = csc(theta);
    end
    
    theta = theta + 0.008;
    if (theta > 2*pi)
        theta = 0.0;
    end
    
    drawnow;
end




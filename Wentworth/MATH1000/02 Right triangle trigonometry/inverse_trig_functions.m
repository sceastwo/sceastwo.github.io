clear
clc
format

choice_flag = 1;

if (choice_flag == 0)

    line([-1.00, 1.00], [0.00, 0.00], 'Color', [0 0 0], 'LineWidth', 1);
    line([0.00, 0.00], [-pi/2, pi], 'Color', [0 0 0], 'LineWidth', 1);

    cos_vals = -1.00:0.01:1.00;
    arc_cos_vals = acos(cos_vals);
    line(cos_vals, arc_cos_vals, 'Color', [0.5 0 0], 'LineWidth', 1);

    sin_vals = -1.00:0.01:1.00;
    arc_sin_vals = asin(sin_vals);
    line(sin_vals, arc_sin_vals, 'Color', [1 0.5 0.5], 'LineWidth', 1);

    xlim([-1, 1]);
    ylim([-pi/2, pi]);
    daspect([1 1 1]);

else

    line([-10.00, 10.00], [0.00, 0.00], 'Color', [0 0 0], 'LineWidth', 1);
    line([0.00, 0.00], [-pi/2, pi/2], 'Color', [0 0 0], 'LineWidth', 1);

    tan_vals = -10.00:0.01:10.00;
    arc_tan_vals = atan(tan_vals);
    line(tan_vals, arc_tan_vals, 'Color', [0 0.5 0], 'LineWidth', 1);
    xlim([-5.0, 5.0]);
    ylim([-pi/2, pi/2]);
    daspect([1 1 1]);

end


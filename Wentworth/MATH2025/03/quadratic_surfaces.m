clear;
clc;
format;

surface_type = 'hyperbolic_cylinder';

x_0 = 0.0;
y_0 = 0.0; 
z_0 = 0.0;
r_x = 1.0;
r_y = 1.0;
r_z = 1.0;

if (strcmp(surface_type, 'ellipsoid'))
    %%%%%%% Ellipsoid %%%%%%%%%
    [theta, phi] = meshgrid(0:0.1:(pi+0.1), (-pi):0.1:(pi+0.1));
    x = x_0 + r_x .* sin(theta) .* cos(phi);
    y = y_0 + r_y .* sin(theta) .* sin(phi);
    z = z_0 + r_z .* cos(theta);
    surf(x,y,z);
    daspect([1 1 1]);
elseif (strcmp(surface_type, '1_sheet_hyperboloid'))
    %%%%%%% 1 sheet hyperboloid %%%%%%%%%
    [h, phi] = meshgrid(-2.0:0.1:2.0, (-pi):0.1:(pi+0.1));
    x = x_0 + r_x .* cosh(h) .* cos(phi);
    y = y_0 + r_y .* cosh(h) .* sin(phi);
    z = z_0 + r_z .* sinh(h);
    surf(x,y,z);
    daspect([1 1 1]);
elseif (strcmp(surface_type, '2_sheet_hyperboloid'))
    %%%%%%% 2 sheet hyperboloid %%%%%%%%%
    [h, phi] = meshgrid(0.0:0.1:2.0, (-pi):0.1:(pi+0.1));
    x = x_0 + r_x .* sinh(h) .* cos(phi);
    y = y_0 + r_y .* sinh(h) .* sin(phi);
    z = z_0 + r_z .* cosh(h);
    surf(x,y,z);
    hold on;
    z = z_0 - r_z .* cosh(h);
    surf(x,y,z);
    daspect([1 1 1]);
elseif (strcmp(surface_type, 'cones'))
    %%%%%%% cones %%%%%%%%%
    [R, phi] = meshgrid(0.0:0.1:5.0, (-pi):0.1:(pi+0.1));
    x = x_0 + r_x .* R .* cos(phi);
    y = y_0 + r_y .* R .* sin(phi);
    z = z_0 + r_z .* R;
    surf(x,y,z);
    hold on;
    z = z_0 - r_z .* R;
    surf(x,y,z);
    daspect([1 1 1]);
elseif (strcmp(surface_type, 'elliptic_paraboloid'))
    [R, phi] = meshgrid(0.0:0.1:3.0, (-pi):0.1:(pi+0.1));
    x = x_0 + r_x .* R .* cos(phi);
    y = y_0 + r_y .* R .* sin(phi);
    z = z_0 + r_z .* R .^ 2;
    surf(x,y,z);
    daspect([1 1 1]);
elseif (strcmp(surface_type, 'hyperbolic_paraboloid'))
    [R, phi] = meshgrid(0.0:0.1:1.0, (-pi):0.1:(pi+0.1));
    x = x_0 + r_x .* R .* cos(phi);
    y = y_0 + r_y .* R .* sin(phi);
    z = z_0 + r_z .* R .^ 2 .* (cos(phi) .^ 2 - sin(phi) .^ 2);
    surf(x,y,z);
    daspect([1 1 1]);
elseif (strcmp(surface_type, 'elliptic_cylinder'))
    %%%%%%% Elliptic cylinder %%%%%%%%%    
    [h, phi] = meshgrid(-1.5:0.1:1.5, (-pi):0.1:(pi+0.1));
    x = x_0 + r_x .* cos(phi);
    y = y_0 + r_y .* sin(phi);
    z = z_0 + r_z .* h;
    surf(x,y,z);
    daspect([1 1 1]);    
elseif (strcmp(surface_type, 'hyperbolic_cylinder'))
    %%%%%%% Hyperbolic cylinder %%%%%%%%%    
    [h, phi] = meshgrid(-2.0:0.1:2.0, -2.0:0.1:2.0);
    x = x_0 + r_x .* cosh(phi);
    y = y_0 + r_y .* sinh(phi);
    z = z_0 + r_z .* h;
    surf(x,y,z);
    hold on;
    x = x_0 - r_x .* cosh(phi);
    surf(x,y,z);
    daspect([1 1 1]);        
end






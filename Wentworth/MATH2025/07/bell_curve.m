
x = -4.0:0.1:4.0;

y = (1/sqrt(2 * pi)) * exp(-0.5 * x .^ 2);

plot(x,y,'LineWidth',1.0);
xlabel('x');
ylabel('probability density');



x = 0:pi/100:2*pi;
y = sin(x);
plot(x,y)

% To add plots to an existing figure, use hold.
hold on

y2 = cos(x);
plot(x,y2,':')
legend('sin','cos')
close all;
clear all;
clc

% first create a set of (x,y) points over the domain of the function using meshgrid.
close all
[X,Y] = meshgrid(-2:.2:2);
Z = X .* exp(-X.^2 - Y.^2);
% Then, create a surface plot.
surf(X,Y,Z)
xlabel('x');
ylabel('y');
zlabel('z');
title('3d');

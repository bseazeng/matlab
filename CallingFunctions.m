close all;
clear all;
clc

A = [1 3 5];
max(A)%5%
B = [10 6 4];
max(A,B)
% ans =
% 
%     10     6     5

% When there are multiple output arguments, enclose them in square brackets:
[maxA,location] = max(A)
% maxA =
% 
%      5
% 
% 
% location =
% 
%      3
whos

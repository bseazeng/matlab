close all;
clear all;
clc

A = magic(4)
% A =
% 
%     16     2     3    13
%      5    11    10     8
%      9     7     6    12
%      4    14    15     1
A(4,2) %14%
test = A(4,4) %1%
A(8)%14%

A(4,5) = 17
% A =
% 
%     16     2     3    13     0
%      5    11    10     8     0
%      9     7     6    12     0
%      4    14    15     1    17

A(1:3,2)
% ans =
% 
%      2
%     11
%      7

A(3,:)
% ans =
% 
%      9     7     6    12     0

B = 0:10:100
% B =
% 
%      0    10    20    30    40    50    60    70    80    90   100
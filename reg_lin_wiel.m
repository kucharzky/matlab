%       Reg lin         %
%    wielowymiarowa     %
clear;clc;close;


load('TO_2019_2020_lab07_RLW.mat')

X = [x1, x2, x3];

X = [ones(size(X, 1), 1), X];

a = inv(X' * X) * X' * y


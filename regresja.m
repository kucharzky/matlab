%       Regresja        %
%       Liniowa         %
clear;clc;close;
X = [0,1,2,3,4,5,6,7,8];
Y = [0,2,5,9,12,14,16,22,26];
x = linspace(0,10,20);
[a,b] = reglin(X,Y)
y1 = polyval([a, b], x);

plot(X,Y,"ro")
hold on
plot(x,y1,"b")
grid on

function [a,b] = reglin(X,Y)
    mx = mean(X);
    my = mean(Y);
    a = 0;
    b = 0;
    licz = 0;
    mian = 0;
    for i = 1 : length(X)
        licz = licz + (X(i)-mx)*(Y(i)-my);
        mian = mian + (X(i)-mx)^2;
        a = licz/mian;
    end
    b = my - a*mx;
end    
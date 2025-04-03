clear;clc;close;

%load('TO_2019_2020_lab07_RLW.mat')

X = [0,1,2,3,4,5,6,7,8];
Y = [0,2,5,9,19,14,16,22,26];
x = linspace(0,10,20);
a = pseudoodwr(X,Y)
y1 = polyval(a', x);

plot(X,Y,"ro")
hold on
plot(x,y1,"b")
grid on

function a = pseudoodwr(X,Y)
    x_2 = 0;
    
    X_temp = [X', ones(size(X', 1), 1)];

    for i = 1:length(X)
        x_2 = x_2 + X(i)^2;
    end
    Xt_x = [x_2, sum(X); sum(X), length(X)]

    a = inv(Xt_x) * X_temp' * Y';
end  
clc; clear all; close;

x = [1:5]; 
y = 20*rand(1,5)-1/2;



X = linspace(min(x)-10, max(x)+10, 1000);
d=x(2)-x(1);

Y = zeros(size(X));
for i = 1:length(X)
    Y(i) = sum(y.*(sinc(x-X(i)))./d);
end

plot(x, y, 'o', X, Y, '-');
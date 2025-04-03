clc; clear; close all;


x = [1:3];
y = rand(1,3)-1/2;


X = linspace(min(x)-3, max(x)+3, 20000); 
d=x(2)-x(1);

Y = zeros(size(X));
for i = 1:length(x)
    Y = Y + y(i)*funkcja( (X-x(i))/d );
end

plot(x, y, 'o', X, Y, '-'); grid on;

function z = funkcja(X)
    z = zeros(size(X));
    for i = 1:length(X)
        if X(i)>=0 && X(i)<1
            z(i)=1;
        else
            z(i)=0;
        end
    end
end
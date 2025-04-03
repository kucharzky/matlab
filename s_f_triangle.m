clc; clear; close all;


x = [1:5];
y = rand(1,5)-1/2;


X = linspace(-1, 7, 20000); 
d=x(2)-x(1);

Y = zeros(size(X));
for i = 1:length(x)
    Y = Y + y(i)*triangle( (X-x(i))/d );
end

plot(x, y, 'o', X, Y, '-'); grid on;

function z = triangle(X)
    z = zeros(size(X));
    for i = 1:length(X)
        if X(i)<=1 & X(i)>=-1
            z(i)=1-abs(X(i));
        else
            z(i)=0;
        end
    end
end
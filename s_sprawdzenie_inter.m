clc; clear; close all;


x = [1:3];
y = rand(1,3)-1/2;
X = linspace(min(x)-10, max(x)+10, 10000);
d=x(2)-x(1);

Y1 = zeros(size(X));
Y2 = zeros(size(X));
Y3 = zeros(size(X));

for i = 1:length(X)
    Y1(i) = sum(y.*(sinc(x-X(i)))./d);
end
subplot(2,2,1)
plot(x, y, 'o', X, Y1, '-'); grid on;

for i = 1:length(x)
    Y2 = Y2 + y(i)*triangle( (X-x(i))/d );
end
subplot(2,1,2)
plot(x, y, 'o', X, Y2, '-'); grid on;

for i = 1:length(x)
    Y3 = Y3 + y(i)*funkcja( (X-x(i))/d );
end
subplot(2,2,2)
plot(x, y, 'o', X, Y3, '-'); grid on;

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
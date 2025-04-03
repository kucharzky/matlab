clc; clear; close all;


x = [1 2 3];
y = rand(1,3);


X = linspace(-1, 5, 20000); 
d=x(2)-x(1);

Y = zeros(size(X));
for i = 1:length(x)
    Y = Y + y(i)*f( (X-x(i))/d );
end

plot(x, y, 'o', X, Y, '-'); grid on;
legend('Punkty oryginalne', ...
    'Funkcja wyznaczona za pomocą szeregu Whittakera');

function z = f(X)
    z = zeros(size(X));
    for i = 1:length(X)
        if X(i)<=1 & X(i)>=-1
            z(i)=1-abs(X(i));
        else
            z(i)=0;
        end
    end
end

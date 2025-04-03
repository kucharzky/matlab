
clc;clear;close;

x_k = linspace(0,100,100);
x_i = linspace(0,100,100);
y_k = f(x_k);

whittaker(x_k,y_k,x_i);

function whittaker = whittaker(x_k,y_k,x_i)
    n_w = length(x_k);
    n_i = length(x_i);
    f_x = 0;
    d = x_k(2)-x_k(1);
    for i=1:n_i
        f_x = 0;
        for j=1:n_w
            sum = sinc((x_i(i)-x_k(j))/d);
            f_x = f_x + sum*y_k(j);
        end
        y_i(i) = f_x;
    end
    plot(x_i,y_i, 'b');
    hold on
    plot(x_k,y_k,'r--')
    grid on
end    

function f = f(x)
    f = x.^3 + 2*x.^2 + 15*x +21;
end


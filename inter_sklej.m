
clear;clc;close;

x_k = linspace (-4,8,100);
x_i = linspace (0,2*pi,1000);
y_k = f(x_k);
sklejane(x_k,y_k,x_i);

function sklejane = sklejane(x_k,y_k,x_i)
    n_w = length(x_k);
    n_i = length(x_i);
    f_x = 0;
    d = x_k(2)-x_k(1);
    for i=1:n_i
        f_x = 0;
        for j=1:n_w
            sum = tri((x_i(i)-x_k(j))/d);
            f_x = f_x + sum*y_k(j);
        end
        y_i(i) = f_x;
    end
    plot(x_i,y_i, 'b');
    hold on
    plot(x_k,y_k,'r--')
    grid on
end    




function tri = tri(x)
    n = length(x);
    for i = 1:n
        if x(i) >= -1 && x(i) <= 1
            tri(i) = 1 - abs(x(i));
        else
            tri(i) = 0;
        end
    end   
end 

function f = f(x, N)
    f = 2*x;
end

clc;clear;close;
N = 13;
X = rand(1,N);
Y = f(X, N);

lagrange(X,Y);

function p = lagrange(X,Y)
    n = length(X);
    y = 0;
    for i=1:n
        m = 1; %licznik
        l = 1; %mianownik
        for j=1:n
            if (j~=i)
                l = l.*(X-X(j));
                m = m*(X(i)-X(j));
            end
        end
        y = y + (l./m).*Y(i);
    end
    plot(X,y, 'b');
    hold on
    plot(X,Y,'r--')
    grid on
end

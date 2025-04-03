
clc;clear;close;
N=15;
X = rand(1,N);
Y = (rand(1,N)-1/2)*2;

lagrange(X,Y);

function p = lagrange(X,Y)
    n = length(X);
    L = zeros(n,n);
    V = 1;
    for i=1:n
        for j=1:n
            if (j~=i)
                V = conv(V,poly(X(j)))/(X(i)-X(j));
            end
        end
        L(i,:) = V * Y(i);
    end
    P = sum(L);
    disp(P);

    x = linspace(-1,1,100);
    y = polyval(P,x);

    plot(x,y,'b--',X,Y,'r*');
    xlabel('Oś X'); % Podpis osi X
    ylabel('Oś Y'); % Podpis osi Y
    legend('Wielomian Lagrangea','Punkty danych'); % Legenda
    ylim([-10 10])
end

function f = f(x, N)
    f = 50*(rand(1,N)-1/2);
end


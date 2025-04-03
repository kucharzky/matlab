clc; clear; close;
N = 13;
X = 10*rand(1,N);
Y = 0.5*(rand(1,N)-1/2);
n = length(X);
L = zeros(n,n);

for i = 1:n
    V = 1;
    for j = 1:n
        if i ~= j
            V = conv(V,poly(X(j)))/(X(i)-X(j));
        end
    end
    L(i,:) = V * Y(i);
end

P = sum(L);
disp(P);

x = linspace(-1,10,10000);
y = polyval(P,x);

plot(x,y,'b--',X,Y,'r*');
xlabel('Oś X'); % Podpis osi X
ylabel('Oś Y'); % Podpis osi Y
legend('Wielomian Lagrangea','Punkty danych'); % Legenda
ylim([-10 10])

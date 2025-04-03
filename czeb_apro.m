clear;clc;close;

a = -10;
b = 10;

% stopień
n = 300;

% Oblicz węzły Czebyszewa
x = cos((2*(0:n)+1)*pi/(2*(n+1)));

% Przetransformuj węzły do zakresu [a,b]
x = (b-a)/2*x + (a+b)/2;

% Oblicz wartości funkcji w węzłach
y = f(x);

% Oblicz współczynniki wielomianu Czebyszewa
c = zeros(1,n+1);
for k = 0:n
    c(k+1) = (2/(n+1))*sum(y.*cos(k*pi*(0:n)/n));
end

% Oblicz wartości aproksymowanej funkcji w punktach x
y_aprox = zeros(1,length(x));
for i = 1:length(x)
    y_aprox(i) = sum(c.*cos((0:n)*acos((2*x(i)-a-b)/(b-a))));
end

% Wykres aproksymowanej funkcji i jej aproksymacji
xx = linspace(a,b,1000);
yy = f(xx);
yy_aprox = zeros(1,length(xx));
for i = 1:length(xx)
    yy_aprox(i) = sum(c.*cos((0:n)*acos((2*xx(i)-a-b)/(b-a))));
end
plot(xx,yy,'b',xx,yy_aprox,'r--')
legend('Funkcja','Aproksymacja')
grid on
ylim=([-3,3]);



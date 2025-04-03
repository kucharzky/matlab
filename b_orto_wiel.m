close; clc; clear;

% Dane wejściowe
x = linspace(-10, 10, 10000); % Przykładowe dane wejściowe

% Aproksymacja bazą wielomianową (do wyboru można użyć różnych stopni wielomianów)
n = 35; % Stopień wielomianu aproksymującego
p = polyfit(x, f(x), n); % Wielomian aproksymujący
f_przyb = polyval(p, x); % Wynik aproksymacji

% Wykres
figure;
plot(x, f(x), 'b', x, f_przyb, 'r--');
legend('Funkcja rzeczywista', 'Aproksymacja wielomianowa');
xlabel('x');
ylabel('f(x)');
title('Aproksymacja wielomianowa');
grid on

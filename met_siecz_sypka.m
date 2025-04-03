%metoda falsi
close; clear; clc;

% Funkcja anonimowa reprezentująca funkcję, której miejsca zerowe chcemy znaleźć

% Początkowe przybliżenia miejsc zerowych
xa = 0;
xb = 3;


% Parametry metody siecznych
max_i = 100000;% Maksymalna liczba iteracji
tolerancja = 1e-6; % Tolerancja błędu

% Inicjalizacja zmiennych
x1 = 0;
i = 0;

while (i < max_i)
    x1 = xa - (fun(xa) * (xb - xa)) / (fun(xb) - fun(xa));
    if (abs(x1 - xa) < tolerancja)
        break;
    end
    if (fun(xa)*fun(x1) <0)
        xb = x1;
    else
        xa = x1;
    end

    Y(i+1) = xb;

    i = i + 1;
end

fprintf('Metoda siecznych I: Miejsce zerowe: %.6f', x1);
function [a] = fun(a)
a = cos(a);
end
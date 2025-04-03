close; clear; clc;


% Funkcja anonimowa reprezentująca funkcję, której miejsca zerowe chcemy znaleźć.
f = @(x) x^2 + x - 4;


% Początkowe przybliżenia miejsc zerowych
x0 = 0;
x1 = 5;

% Parametry metody siecznych
max_i = 100; % Maksymalna liczba iteracji
tolerance = 1e-6; % Tolerancja błędu

% Inicjalizacja zmiennych
x2 = 0;
i = 0;

% Metoda siecznych II
while (i < max_i)
    x2 = x1 - (f(x1) * (x1 - x0)) / (f(x1) - f(x0));
    if (abs(f(x2)) < tolerance)
        break;
    end
    x0 = x1;
    x1 = x2;
    i = i + 1;
end

fprintf('Metoda siecznych II: Miejsce zerowe: %f\n', x2);
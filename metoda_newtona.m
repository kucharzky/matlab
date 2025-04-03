close; clear; clc;


% Definicja funkcji i jej pochodnej
f = @(x) x^2 + x - 4;
df = @(x) 2*x + 1;

x0 = 2; % Przybliżenie początkowe
tolerancja = 1e-6; % Tolerancja
max_i = 100; % Maksymalna liczba iteracji

% Wywołanie funkcji Newtona-Raphsona
newton(f, df, x0, tolerancja, max_i);




function x0 = newton(f, df, x0, tol, max_i)

% Funkcja do znajdowania miejsca zerowego funkcji za pomocą metody Newtona-Raphsona

% Parametry:
% - f: funkcja, której miejsce zerowe chcemy znaleźć
% - df: pochodna funkcji func
% - x0: przybliżenie początkowe
% - tol: tolerancja (np. 1e-6)
% - max_i: maksymalna liczba iteracji

for iter = 1:max_i
    
    f_x0 = f(x0);
    df_x0 = df(x0);
    
    if abs(f_x0) < tol
        break; % Znaleziono rozwiązanie z dostateczną precyzją
    end
    
    x1 = x0 - f_x0 / df_x0;
    
    if abs(x1 - x0) < tol
        break; % Algorytm zbiega do rozwiązania
    end
    
    x0 = x1; % Aktualizuj przybliżenie
end

if iter == max_i
    warning('Metoda Newtona-Raphsona nie zbiega do rozwiązania.');
end

fprintf('Rozwiązanie: %.6f\nLiczba iteracji: %d\n', x0, iter);
end

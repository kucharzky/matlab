
close; clear; clc;

roots([1 1 -4])

% Funkcja anonimowa reprezentująca funkcję, której miejsca zerowe chcemy znaleźć.
f = @(x) x^2 + x - 4;

% Początkowe przybliżenia miejsc zerowych
xa = -3;
xb = 0;

% Parametry metody siecznych
max_i = 100; % Maksymalna liczba iteracji
tol = 1e-6; % Tolerancja błędu


 if f(xa) * f(xb) < 0
        x1 = 0.0;
        xc = 0.5 * (xa + xb);
        while (max_i > 0 && abs(f(x1)) > tol)
            x1 = xc + (xc - xa) * f(xc) * sign(f(xa) - f(xb)) / sqrt((f(xc)^2.0) - (f(xa) * f(xb)));
            if f(xa) * f(x1) < 0
                xb = x1;
            else
                xa = x1;
            end

            xc = 0.5 * (xa + xb);
            max_i = max_i - 1;
        end
  else
         error('f(xa) oraz f(xb) muszą mieć przeciwne znaki');
  end

fprintf('Metoda siecznych Riddersa: Miejsce zerowe: %f\n', x1);

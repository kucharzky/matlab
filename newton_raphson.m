% Przykładowe użycie:
% Zdefiniowanie funkcji i jej macierzy Jacobiego
F = @(x, y) [x^2 + y^2 - 1; x^2 - y]; % Przykładowa funkcja

J = calculateJacobian(F, 'x', 'y');

% Parametry początkowe
x_init = [0.5; 0.5];
tol = 1e-6;
max_iter = 100;

% Wywołanie funkcji
x_approx = newtonRaphsonMultiVar(F, J, x_init, tol, max_iter);

% Rysowanie wykresu
[x, y] = meshgrid(linspace(-1.5, 1.5, 400), linspace(-1.5, 1.5, 400));
Z1 = x.^2 + y.^2 - 1;
Z2 = x.^2 - y;

figure;
contour(x, y, Z1, [0, 0], 'b');
hold on;
contour(x, y, Z2, [0, 0], 'r');
plot(x_approx(1), x_approx(2), 'ko', 'MarkerFaceColor', 'k');
hold off;

title('Pierwiastek znaleziony metodą Newtona-Raphsona');
xlabel('x');
ylabel('y');
grid on;
axis equal;

disp('Przybliżony pierwiastek:');
disp(x_approx);


function J = calculateJacobian(func, x, y)
    syms xsym ysym;
    F_sym = func(xsym, ysym); % Reprezentacja symboliczna funkcji
    J_sym = jacobian(F_sym, [xsym, ysym]); % Obliczanie Jacobiego symbolicznie
    J = matlabFunction(J_sym, 'Vars', [xsym ysym]); % Konwersja na uchwyt do funkcji
end

function x_next = newtonRaphsonMultiVar(F, J, x_init, tol, max_iter)
    % F - uchwyt do funkcji wielowymiarowej
    % J - uchwyt do macierzy Jacobiego
    % x_init - początkowe przybliżenie pierwiastka
    % tol - tolerancja błędu
    % max_iter - maksymalna liczba iteracji

    x_next = x_init;
    for i = 1:max_iter
        F_val = F(x_next(1), x_next(2));
        J_val = J(x_next(1), x_next(2));

        % Sprawdzenie, czy macierz Jacobiego jest odwracalna
        if det(J_val) == 0
            error('Macierz Jacobiego jest osobliwa');
        end

        % Aktualizacja przybliżenia
        x_next = x_next - J_val \ F_val; % Operator "\" rozwiązuje układ równań liniowych

        % Sprawdzenie warunku zbieżności
        if norm(F_val) < tol
            break;
        end
    end
end


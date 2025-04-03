% Przykładowe użycie:
f = @(x, y) exp(x + y);
a = 0; % rozwijamy wokół punktu (0, 0) dla x
b = 0; % rozwijamy wokół punktu (0, 0) dla y
x_range = -1:0.1:2; % zakres x
y_range = -1:0.1:2; % zakres y
n = 3; % stopień rozwinięcia

% Rysowanie wykresu
taylorPlot2D(f, a, b, x_range, y_range, n);

function taylorPlot2D(func, a, b, x_range, y_range, n)
    % func - uchwyt do funkcji dwóch zmiennych
    % a, b - punkty, wokół których rozwijamy szereg
    % x_range, y_range - zakresy wartości x i y do wykresu
    % n - stopień rozwinięcia

    syms x y;
    taylor_series = 0;

    % Obliczanie szeregu Taylora
    for i = 0:n
        for j = 0:n
            if i + j <= n
                partial_derivative = func;
                for k = 1:i
                    partial_derivative = diff(partial_derivative, x);
                end
                for k = 1:j
                    partial_derivative = diff(partial_derivative, y);
                end
                partial_derivative = subs(partial_derivative, {x, y}, {a, b});
                taylor_series = taylor_series + partial_derivative / (factorial(i) * factorial(j)) * (x - a)^i * (y - b)^j;
            end
        end
    end

    % Funkcja do wektoryzacji symbolicznej funkcji
    vec_taylor = matlabFunction(taylor_series);
    
    % Generowanie siatki punktów
    [X, Y] = meshgrid(x_range, y_range);

    % Obliczanie wartości funkcji i szeregu Taylora
    Z_func = arrayfun(func, X, Y);
    Z_taylor = arrayfun(vec_taylor, X, Y);

    % Rysowanie wykresów
    figure;
    surf(X, Y, Z_func, 'FaceAlpha', 0.5);
    hold on;
    surf(X, Y, Z_taylor, 'FaceAlpha', 0.5);
    hold off;

    % Oznaczenia i siatka
    grid on;
    legend('e^{x+y}', 'Szereg Taylora');
    title(['Porównanie e^{x+y} i jego rozwinięcia Taylora do ' num2str(n) '-tego stopnia']);
    xlabel('x');
    ylabel('y');
    zlabel('z');
end



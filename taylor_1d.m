% Przykładowe użycie:
f = @(x) exp(x);
a = 0;
x_range = -1:0.1:2; % przykładowa wartość x
n = 5; % stopień rozwinięcia

taylor_approx = szereg_taylora(f, a, x_range, n);
disp(taylor_approx);


function szereg = szereg_taylora(func,a,x_range,n)
    % func - uchwyt do funkcji
    % a - punkt, wokół którego rozwijamy szereg
    % x - wartość, dla której chcemy obliczyć przybliżenie
    % n - stopień rozwinięcia
    syms t;
    szereg = 0;
    for i = 0:n
        derivative = subs(diff(func(t), t, i), t, a);
        szereg = szereg + ((derivative/factorial(i)) * (t - a)^i);
    end

    vec_taylor = matlabFunction(szereg);
    
    y_func = arrayfun(func, x_range);
    y_taylor = arrayfun(vec_taylor, x_range);

    % Rysowanie wykresów
    plot(x_range, y_func, 'b', 'LineWidth', 2);
    hold on;
    plot(x_range, y_taylor, 'r--', 'LineWidth', 2);
    grid on;
    legend('e^x', 'Szereg Taylora');
    title(['Porównanie e^x i jego rozwinięcia Taylora do ' num2str(n) '-tego stopnia']);
    xlabel('x');
    ylabel('y');
    hold off;




end
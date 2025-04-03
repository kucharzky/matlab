clear;close;clc;

disp('Podaj wpółczyniki licznika [s^n ..... s^0]')
licznik = input('licznik ');
disp('Podaj wpółczyniki mianownika [s^n ..... s^0]')
mianownik = input('mianownik ');

% Parametry układu dynamicznego
%licznik = [1 -1];  % Współczynniki licznika
%mianownik = [1 2 3];  % Współczynniki mianownika

% Wartości częstotliwości w skali logarytmicznej
omega = logspace(-1, 2, 1000);  % Zakres częstotliwości w skali logarytmicznej

% Inicjalizacja macierzy przechowujących odpowiedzi częstotliwościowe
A = zeros(size(omega));
fi = zeros(size(omega));

% Obliczanie odpowiedzi częstotliwościowej
for i = 1:length(omega)
    w = omega(i);
    s = 1i * w;
    f(i) = omega(i)/(2*pi);

    % Obliczanie amplitudy i fazy odpowiedzi
    H = polyvall(licznik, s) / polyvall(mianownik, s);
    A(i) = abs(H);
    fi(i) = angle(H);
end


% Rysowanie charakterystyki amplitudowej
figure;
subplot(2,1,1)
semilogx(f, 20 * log10(A));
xlabel('Częstotliwość (rad/s)');
ylabel('Amplituda (dB)');
title('Charakterystyka amplitudowa');
grid on;

% Rysowanie charakterystyki fazowej
subplot(2,1,2)
semilogx(f, r2d(fi));
xlabel('Częstotliwość (rad/s)');
ylabel('Faza (stopnie)');
title('Charakterystyka fazowa');
grid on;

function y = polyvall(p, x)
    n = length(p);
    y = p(1);
    for i = 2:n
        y = y.*x + p(i);
    end
end

function deg = r2d(rad)
        deg = rad*(180/pi);
end    
    

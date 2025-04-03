% Wyczyszczenie środowiska roboczego
clear; clc; close; 

% Definicja transmitancji G(s) = suma(licznik * s^n) / suma(mianownik * s^n), gdzie n
% jest wyrazem daną liczbą w wektorze
licznik = [1 1]; % Współczynniki wielomianu licznika
mianownik = [1 2 2]; % Współczynniki wielomianu mianownika

% Definicja zakresu zmiennej s
s_re = linspace(-5,5,100); % Zakres części rzeczywistej s
s_im = linspace(-5,5,100); % Zakres części urojonej s
[S_re, S_im] = meshgrid(s_re, s_im); % Utworzenie siatki punktów s
S = S_re + 1i*S_im; % Utworzenie zmiennej zespolonej s

% Obliczenie transmitancji G(s) dla każdego punktu s
G = polyvall(licznik, S) ./ polyvall(mianownik, S); % Użycie funkcji polyval do obliczenia wartości wielomianu

% Obliczenie modułu i kąta transmitancji
modul = abs(G); % Moduł transmitancji to pierwiastek kwadratowy z sumy kwadratów części rzeczywistej i urojonej
kat = r2d(angle(G)); % Kąt transmitancji to arcus tangens ilorazu części urojonej i rzeczywistej

% Obliczenia dla okręgu jednostkowego
m_zerowe = roots(mianownik);
r = abs(m_zerowe);
theta = linspace(0, 2*pi, 100);

% Oblicz współrzędne punktów na okręgu
x = r(1)*cos(theta);
y = r(1)*sin(theta);
z = zeros(length(theta));

% Rysowanie wykresu 3D dla modułu transmitancji
figure(1);
subplot(1,2,1); mesh(S_re, S_im, modul); % Użycie funkcji mesh do narysowania wykresu powierzchniowego
title('Moduł transmitancji na płaszczyźnie zespolonej');
hold on
plot3(x, y, z,'r');
grid on;
xlabel('Re(s)');
ylabel('Im(s)');
zlabel('|G(s)|');
colorbar; %%%

subplot(1,2,2);
contour(S_re, S_im, modul, 80);
title('Wykres gęstości modułu transmitancji');
hold on
plot(x, y,'r');
xlabel('Re(s)');
ylabel('Im(s)');
grid on;

% Rysowanie wykresu 3D dla kąta transmitancji
figure(2);
subplot(1,2,1);
mesh(S_re, S_im, kat); % Użycie funkcji mesh do narysowania wykresu powierzchniowego
hold on
plot3(x, y, z,'r');
grid on;
xlabel('Re(s)');
ylabel('Im(s)');
zlabel('\angle G(s)');
title('Kąt transmitancji na płaszczyźnie zespolonej');
colorbar; %%%

subplot(1,2,2);
contour(S_re, S_im, kat, 80);
title('Wykres gęstości kąta transmitancji');
hold on
plot(x, y,'r');
xlabel('Re(s)');
ylabel('Im(s)');
grid on;

% Wywołanie funkcji do rysowania charakterystyki częstotliwościowej
plotDelays(licznik, mianownik);

function plotDelays(num, den)
    % num - wektor współczynników wielomianu licznika
    % den - wektor współczynników wielomianu mianownika

    % Tworzenie transmitancji
    G = tf(num, den); %Symbolic %Control

    % Obliczanie częstotliwości i odpowiedzi częstotliwościowej
    [H, f] = freqresp(G);
    H = squeeze(H);
    f = f/(2*pi); % Konwersja na Hz

    % Obliczanie opóźnienia fazowego
    phaseDelay = -diff(unwrap(angle(H)))./diff(f);

    % Gain
    gain = abs(H);

    % Rysowanie wykresów
    figure;
    yyaxis left
    semilogx(f(1:end-1), phaseDelay);
    hold on
    yyaxis right
    semilogx(f, 20*log10(gain));
    legend('Delay','Gain');
    grid on;
    title('Charakterystyka częstotliwościowa');
end

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
    
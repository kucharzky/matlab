clear; clc; close; 

% Definicja transmitancji G(s) = (s^2 + 2s + 3) / (s^3 + 4s^2 + 5s + 6)
licznik = 1; % Współczynniki wielomianu licznika
mianownik = [1 2 2 1]; % Współczynniki wielomianu mianownika


% Definicja zakresu zmiennej s
s_re = -5:0.01:5; % Zakres części rzeczywistej s
s_im = -5:0.01:5; % Zakres części urojonej s
[S_re, S_im] = meshgrid(s_re, s_im); % Utworzenie siatki punktów s
S = S_re + 1i*S_im; % Utworzenie zmiennej zespolonej s

% Obliczenie transmitancji G(s) dla każdego punktu s
G = polyval(licznik, S) ./ polyval(mianownik, S); % Użycie funkcji polyval do obliczenia wartości wielomianu

% Obliczenie modułu i kąta transmitancji
modul = abs(G); % Moduł transmitancji to pierwiastek kwadratowy z sumy kwadratów części rzeczywistej i urojonej
kat = rad2deg(angle(G)); % Kąt transmitancji to arcus tangens ilorazu części urojonej i rzeczywistej

zera = roots(mianownik);
R = abs(zera);
theta = linspace(0, 2*pi, 100);

% Oblicz współrzędne punktów na okręgu
x = R(1)*cos(theta);
y = R(1)*sin(theta);
z = zeros(length(theta));
%z = 10*ones(length(theta));


% Rysowanie wykresu 3D dla modułu transmitancji
figure(1); % Utworzenie nowego okna rysunkowego 
subplot(1,2,1); mesh(S_re, S_im, modul); % Użycie funkcji mesh do narysowania wykresu powierzchniowego
title('Moduł transmitancji na płaszczyźnie zespolonej');
hold on
plot3(x, y, z,'r');
grid on;
xlabel('Re(s)'); % Oznaczenie osi rzeczywistej
ylabel('Im(s)'); % Oznaczenie osi urojonej
zlabel('|G(s)|'); % Oznaczenie osi modułu
colorbar; % Dodanie paska kolorów

subplot(1,2,2); contour(S_re, S_im, modul, 80);title('Wykres gęstości modułu transmitancji');
hold on
plot(x, y,'r');
xlabel('Re(s)'); % Oznaczenie osi rzeczywistej
ylabel('Im(s)'); % Oznaczenie osi urojonej
grid on;

% Rysowanie wykresu 3D dla kąta transmitancji
figure(2);
subplot(1,2,1);mesh(S_re, S_im, kat); % Użycie funkcji mesh do narysowania wykresu powierzchniowego
hold on
plot3(x, y, z,'r');
grid on;
xlabel('Re(s)'); % Oznaczenie osi rzeczywistej
ylabel('Im(s)'); % Oznaczenie osi urojonej
zlabel('\angle G(s)'); % Oznaczenie osi kąta
title('Kąt transmitancji na płaszczyźnie zespolonej');
colorbar; % Dodanie paska kolorów

subplot(1,2,2); contour(S_re, S_im, kat, 80);title('Wykres gęstości kąta transmitancji');
hold on
plot(x, y,'r');
xlabel('Re(s)'); % Oznaczenie osi rzeczywistej
ylabel('Im(s)'); % Oznaczenie osi urojonej
grid on;

plotDelays(licznik,mianownik);

function plotDelays(num, den)
    % num - wektor współczynników wielomianu licznika
    % den - wektor współczynników wielomianu mianownika

    % Tworzenie transmitancji
    G = tf(num, den);

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
    
    title('XXXXXXXX');
 
end








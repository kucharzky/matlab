%{
=====================================================================================================
 Wizualizacja transmitancji 𝐻(𝑠) systemów analogowych wraz z ich charakterystyką częstotliwościową.
                         Kamil Russ, Maciej Kucharski - 22.01.2024
=====================================================================================================
%}
% Wyczyszczenie środowiska roboczego
clear; clc; close all; 
%==================================================================%
% Definicja transmitancji operatorowej o podanych współczynnikach
    licznik = [1];
    mianownik = [1 2 2 1];
    a = 2; % Zakres podawania wartości dla siatki punktów [-a, a]
%[z, p, k] = cheb1ap(5,6);
%[licznik, mianownik] = zp2tf(z,p,k);
%==================================================================%
% Definicja zakresu zmiennej s
    s_re = linspace(-a,a,300); % Zakres części rzeczywistej s
    s_im = linspace(-a,a,300); % Zakres części urojonej s
    [S_re, S_im] = meshgrid(s_re, s_im); % Utworzenie siatki punktów s
    S = S_re + 1i*S_im; % Utworzenie zmiennej zespolonej s
%==================================================================%
% Obliczenie transmitancji H(s) dla każdego punktu s
    H = polyval(licznik, S) ./ polyval(mianownik, S);
%==================================================================%
% Obliczenie modułu i kąta transmitancji
    modul = abs(H); 
    kat = r2d(angle(H)); % Kąt transmitancji to arcus tangens ilorazu części urojonej i rzeczywistej
%==================================================================%
% Obliczenia dla okręgu jednostkowego
    m_zerowe = roots(mianownik);
    r = abs(m_zerowe);
    r = unique(r);
    theta = linspace(0, 2*pi, 1000);
%==================================================================%
% Rysowanie wykresu 3D dla modułu transmitancji
    figure(1);
    subplot(1,2,1); mesh(S_im, S_re, 20*log10(modul)); % Użycie funkcji mesh do narysowania wykresu powierzchniowego
    title('Moduł transmitancji na płaszczyźnie zespolonej');
    grid on;
    xlabel('Im(s)');
    ylabel('Re(s)');
    zlabel('|H(s)| [dB]');
    colorbar;

    w = s_im;
    s = w*1i;
    H_1 = polyval(licznik,s) ./ polyval(mianownik,s);
    gain = abs(H_1);

    hold on
    plot3(S_im, zeros(length(S_re)),20*log10(gain), "-r",'LineWidth',5);
    set(gca,'view',[-210 30])
%==================================================================%
% Rysowanie wykresu dla gęstości modułu transmitancji
    subplot(1,2,2);
    contour(S_re, S_im, modul, 80);
    title('Wykres gęstości modułu transmitancji');
    hold on

    for k = 1:length(r)
        x = r(k)*cos(theta);
        y = r(k)*sin(theta);
        plot(x, y,'r');
        hold on
    end

    xlabel('Re(s)');
    ylabel('Im(s)');
    axis equal;
    grid on;
%==================================================================%
% Rysowanie wykresu 3D dla kąta transmitancji
    figure(2);
    subplot(1,2,1);
    mesh(S_im, S_re, kat); % Użycie funkcji mesh do narysowania wykresu powierzchniowego
    grid on;
    xlabel('Im(s)');
    ylabel('Re(s)');
    zlabel('\angle H(s)');
    title('Kąt transmitancji na płaszczyźnie zespolonej');
    colorbar;
%==================================================================%
% Rysowanie wykresu dla gęstości kąta transmitancji
    subplot(1,2,2);
    contour(S_re, S_im, kat, 80);
    title('Wykres gęstości kąta transmitancji');
    hold on

    for k = 1:length(r)
        x = r(k)*cos(theta);
        y = r(k)*sin(theta);
        plot(x, y,'r');
        hold on
    end

    xlabel('Re(s)');
    ylabel('Im(s)');
    axis equal;
    grid on;
%==================================================================%
% Zdefiniowanie funkcji zamieniającej radiany na stopnie
function deg = r2d(rad)
        deg = rad*(180/pi);
end


    
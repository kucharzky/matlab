%%%%%%%%%%%%%%%%%%%%%%%%%
%                       %
%       414786          %
%      Odchylenie       %
%     Standardowe       %
%                       %
%%%%%%%%%%%%%%%%%%%%%%%%%
clear;clc;close;

% Wczytaj dane
dane = randn(100, 1); % przykładowe dane

% Oblicz średnią
m = mean(dane);

% Oblicz różnicę między każdym punktem danych a średnią
roznica = dane - m;

% Podnieś te różnice do kwadratu
roznica_kwadrat = roznica.^2;

% Oblicz średnią kwadratów różnic
sr_roznicy_kwadrat = mean(roznica_kwadrat);

% Pierwiastek kwadratowy z wyniku to odchylenie standardowe (estymator obciążony)
s0 = sqrt(sr_roznicy_kwadrat);
disp(['Obciążone odchylenie standardowe: ', num2str(s0)])

disp(['Obciążone odchylenie standardowe z funkcji std: ', num2str(std(dane,1))])

% Dla estymatora nieobciążonego, użyjamy (n-1) zamiast n w mianowniku
s1 = sqrt(sum(roznica_kwadrat) / (length(dane) - 1));

disp(['Nieobciążone odchylenie standardowe: ', num2str(s1)])


disp(['Nieobciążone odchylenie standardowe z funkcji std: ', num2str(std(dane))])
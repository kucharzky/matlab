%    Standaryzacja      %
%     zm. losowej       %
clear;clc;close;

dane = randn(100, 1);

mi = mean(dane);

sigma = std(dane);

std_dane = (dane - mi) / sigma;

figure;
subplot(2,1,1);
hist(dane, 30);
title('Oryginalne dane');

subplot(2,1,2);
hist(std_dane, 30);
title('Standaryzowane dane');


%%%%%%%%% DOWÓD %%%%%%%%%%%%%%%%%

srednia_obl = mean(std_dane);
odchylenie_obl = std(std_dane);

disp(['Średnia: ', num2str(srednia_obl)]);
disp(['Odchylenie standardowe: ', num2str(odchylenie_obl)]);


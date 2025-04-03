
liczba_rzutow = 10000; 
liczba_rzutow_kostka = 6; 

wyniki_rzutow = randi(6, liczba_rzutow_kostka, liczba_rzutow);

suma_rzutow = sum(wyniki_rzutow);

figure;
histogram(suma_rzutow, 'norm', 'pdf');
xlim([6 36])
hold on;

mi = mean(suma_rzutow);
sigma = std(suma_rzutow);

x = min(suma_rzutow):0.1:max(suma_rzutow);

gauss = exp(-0.5 * ((x - mi) / sigma).^2) / (sigma * sqrt(2 * pi));

plot(x, gauss,'r');

legend('Hist sumy rzutów', 'CTG');
hold off;

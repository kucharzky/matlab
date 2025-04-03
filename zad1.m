clear;clc;close;
x = randn(1000,1);
mi = [5,5,-2];
sigma = [3,1/3,2];

std_x1 = x*sigma(1) + mi(1);
std_x2 = x*sigma(2) + mi(2);
std_x3 = x*sigma(3) + mi(3);

figure(1);
subplot(2,2,1);
hist(x, 30);
xlim([-10 10])
title('ORGINALNE');

subplot(2,2,2);
hist(std_x1, 30);
xlim([-10 10])
title('STD1');

subplot(2,2,3);
hist(std_x2, 30);
xlim([-10 10])
title('STD2');


subplot(2,2,4);
hist(std_x3, 30);
xlim([-10 10])
title('STD3');

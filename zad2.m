clear;clc;close
x = randn(1000,1);
n = length(x);
mi = mean(x);
sigma = std(x);
std_x = x*sigma + mi;
temp = 0;
for i = 1:n
    temp = temp + x(i);
end
suma = temp/n

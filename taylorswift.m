clc; clear; close;

taylor(0,3)

function tay = taylor(x0,N)

x = linspace(x0 - 4,x0 + 4, 1000);
y=0;

for i=0:N
    if i == 0
        y = f(x)/factorial(i).*(x-x0).^i;
    else
        y = y + dnf(x0, N, 0.0001)/factorial(i).*(x - x0).^i;
    end    
end

subplot(2,1,1)
plot(x,f(x),'r');
hold on
grid on
plot(x,y,'b')
subplot(2,1,2)
plot(x,y-f(x));
grid on


end


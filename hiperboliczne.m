clear;clc;close;

x = -10:0.1:10;

y_s = sinh(x);
y_c = cosh(x);

y_s_o = sinh_own(x);
y_c_o = cosh_own(x);

subplot(1,2,1)
plot(x,y_s,"r")
hold on
plot(x,y_s_o,"b--")
grid on
legend('Sinh(x)','Sinh-own(x)')
ylim([-10,10]);
subplot(1,2,2)
plot(x,y_c,"r")
hold on
plot(x,y_c_o,"b--")
legend('Cosh(x)','Cosh-own(x)')
grid on
ylim([-10,10]);

Err_sinh(1,1)=max(abs(y_s(:)-y_s_o(:)))
Err_cosh(1,1)=max(abs(y_c(:)-y_c_o(:)))
function sinh_own = sinh_own(x)
    sinh_own = (exp(x)-exp(-x))/2;
end

function cosh_own = cosh_own(x)
    cosh_own = (exp(x)+exp(-x))/2;
end


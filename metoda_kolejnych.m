
close; clear; clc;

f = @(x) x^2 + x - 4;
x0 = 2;
tolerancja = 1e-6;
max_i = 1000;
k = 0.25;

met_kol(f,x0,tolerancja,max_i,k)

function X = met_kol(f,x0,tol,max_i,k)
    x = x0;
    for i = 1:max_i
        lamda_x = x - k*f(x);
        if abs(lamda_x - x) < tol
            break
        end
        x = lamda_x;
    end
  X = x;
end  
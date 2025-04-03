clear;clc;close;
x1=0;
x2=2;
S=5;
P=2;

p = rand(P,1)*(x2-x1)+x1;
p = sort([p; x1-rand(1,1);x2+rand(2,1)]);
wl = poly(p);
pwl = polyder(wl);

X= linspace(min(p)-0.2,max(p)+0.3,300);
figure, hold on, grid on
plot(p,zeros(size(p)),'bs')
plot(X,polyval(wl,X),'r')
plot(X,polyval(pwl,X))

Ra(1)= polyval(wl,x1);
Ra(2)= polyval(pwl,x2);

Rb(1)= polyval(wl,x2);
Rb(2)= polyval(pwl,x2);
i=3;

[dump, n_tmp] = deconv(wl,pwl);
while (length(n_tmp)>1)
    if i == 4
        tmp = n_tmp;
        [dump, n_tmp] = deconv(pwl,n_tmp);
    elseif i > 4
    h_tmp = n_tmp;
    [dump, n_tmp] = deconv(tmp, n_tmp);
    tmp = h_tmp;
    end

    Ra(i) = (-1)*polyval(n_tmp,x1);
    Rb(i) = (-1)*polyval(n_tmp,x2);
    i = i+1;

    n_tmp = rm_zero(n_tmp);


end   
Ra
Rb
Za = LPZ(Ra)
Zb = LPZ(Rb)
K = abs(Za-Zb) 


function X = rm_zero(X)
    N=length(X);
for n=1:N
    if X(1)==0 
       X=X(2:end);
    else
        break;
    end
end
end

function X = LPZ(R)
X = sum((-(sign(R(2:end)).*sign(R(1:end-1)))+1)/2);
end

function X = sprawdzenie(n)

end



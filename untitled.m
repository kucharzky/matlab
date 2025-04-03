clear;clc;
x1=0;
x2=4;
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



[dump, r]=deconv(wl,pwl)
iter=0;
for i=1:1:length(r)
    if (r(i)~=0)
        iter=iter +1;
    end
end
resz=(r((end-iter+1):end)).*(-1)

% f1=-reszta(a/pa)
% f2=-reszta(f1/pa)
% f3=-reszta(f2/pa)
% f4=-reszta(f3/pa)
% f5=-reszta(f4/pa)

[dump, r2]=deconv(pwl,resz)
iter=0;
for i=1:1:length(r2)
    if (r(i)~=0)
        iter=iter +1;
    end
end
resz2=r2((end-iter+1):end).*(-1)


[dump, r3]=deconv(resz,resz2)
iter=0;
for i=1:1:length(r3)
    if (r(i)~=0)
        iter=iter +1;
    end
end
resz3=r3((end-iter+1):end).*(-1)


[dump, r4]=deconv(resz2,resz3)
iter=0;
for i=1:1:length(r4)
    if (r(i)~=0)
        iter=iter +1;
    end
end
resz4=r4((end-iter+1):end).*(-1)


[dump, r5]=deconv(resz3,resz4)
iter=0;
for i=1:1:length(r5)
    if (r(i)~=0)
        iter=iter +1;
    end
end
resz5=r5((end-iter+1):end).*(-1)
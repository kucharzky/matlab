function [ F ] = dystrybuanta(N)
N = 10000;
t = linspace(-2,2,N);
d = funkcja(t)
D=d/trapz(t,d)
trapz(t,D)
figure, plot(t,d)
F = cumsum(D)/(N/(max(t)-min(t)));
figure, plot(t,F)

x = rand(N,1);
for q = 1:N
    ii = find(F <= x(q));
    if ii(end)~=N
      y(q) = interp1([F(ii(end)) F(ii(end)+1)],[t(ii(end)) t(ii(end)+1)], x(q));
    else
      y(q) = 1;
    end
end
figure, hist(y,100)
return
%%
function [d] = funkcja(x)
m=length(x);
for i= 1:m
if x(i) >= -2 & x(i) <= -1 | x(i) >= 1 & x(i) <= 2
    d(i) =1/4;
end
if x(i) >= -1 & x(i) <= 1
    d(i) =1;
end
end
function n=przejscia(x)
% n=przejscia(x)
%
% W ciągu x zlicza "przejścia przez zero" usuwając uprzednio wartości zerowe
%
% PK, 2/12/2023
abs(x)>0
x=x(abs(x)>0); 
x=x./abs(x);
dx=x(2:end)-x(1:end-1);
n=length(find(abs(dx)>0));

% EOF
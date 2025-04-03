function a=usun_zera(a)
% a=usun_zera(a)
%
% Usuwa wstępne wartości zerowe z wektora wejściowego "a";
%
% PK, 2/12/2023

N=length(a);
for n=1:N
    if a(1)==0, a=a(2:end); end
end

% EOF
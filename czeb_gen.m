clear; clc; close;


czybyszew(4)

function c = czybyszew(n)
    T = zeros(n+1);
    T(1,1) = 1;
    T(2,2) = 1;
    for k = 2:n
        T(k+1,1:n+1) = 2*[0, T(k,1:n)] - [T(k-1,1:n),0];
    end
    c = T(n+1, :);
    c = c(:,end:-1:1);
end
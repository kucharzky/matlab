function [ a ] = reg_nlin( x, y )

n = length( x );
X = [];
yt = y.';

for i = 1:n
    X(i, 1) = 1;
    X(i, 2) = x(i)^2;
end

a = inv(X.'*X)*(X.')*yt;

end


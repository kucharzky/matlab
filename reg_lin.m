function [ a ] = reg_lin( x, y )

n = length( x );
mx = 0;
my = 0;
a = [0, 0];

for i = 1:n
    mx = mx + x(i);
    my = my + y(i);
end

mx = mx/n;
my = my/n;

l = 0;
m = 0;

for i = 1:n
    l = l + (x(i)-mx)*(y(i)-my);
    m = m + (x(i)-mx)^2;
end

a(1,1) = l/m;

a(1,2) = my - a(1,1)*mx;

end


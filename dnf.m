function deriv = dnf(x, n, h)
    if n == 1
        deriv = (f(x + h) - f(x)) /h;
    else
        deriv = (dnf(x + h, n - 1, h) - dnf(x, n - 1, h)) /h;
    end
end

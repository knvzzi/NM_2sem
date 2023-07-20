f = @(x) x.^3 + 7.*x - 7;
F = @(x) x^2;

x = linspace(-10,10);

%plot(x, f(x));
eps = 0.01;
a=-1;
b=1;

while abs(b-a)>eps
    x = (a+b)/2;
    if F(x) < 0
        a = x;
    else
        b = x;
    end
end
function simpson_three(f,x0,x3)
h = (x3-x0)/2;
pt1 = (3*h/8)*(f(x0)+3*f(x0+h)+3*f(x0+2*h)+f(x3));
syms x
deriv = diff(f,x,5);
if (-1*deriv(x0))>(-1*deriv(x3))
    pt2 = 3*h^5 / 80 * deriv(x0);
else
    pt2 = 3*h^5 / 80 * deriv(x3);
end
sprintf('%.10f + %.10f',pt1,pt2)
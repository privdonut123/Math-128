function simpson_int(f,x0,x2)
h = (x2-x0)/2;
pt1 = (h/3)*(f(x0)+4*f(x0+h)+f(x2));
syms x
deriv = diff(f,x,4);
if (-1*deriv(x0))>(-1*deriv(x2))
    pt2 = h^5 / 90 *deriv(x0);
else
    pt2 = h^5 / 90 *deriv(x2);
end
sprintf('%.10f',pt1,pt2)
function total_lag(p,f,x_0)
syms x
f_x = symfun(f,x);
f_p = f_x(p);
poly = double(lagrangepoly(p,f_p));
p_x = symfun(lagpoly(poly),x);
disp(p_x)
xx = linspace(0,5,5000);
plot(xx,f_x(xx),'b',xx,p_x(xx),'r')
xlim([-2.5 2.5])
fprintf('f(1) = %.4f\n',f_x(x_0))
fprintf('p(1) = %.4f\n',p_x(x_0))
fprintf('absolute error = %.4f\n',p_x(x_0)-f_x(x_0))
end
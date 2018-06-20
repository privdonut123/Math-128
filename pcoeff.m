function [p, q] = pcoeff( t_fun, n, k )
% t: solution times t(1) < t(2) < ... < t(n) < t( n+1 )
% n+1: new time step
% k: number of previous steps t(n-k+1)..t(n)
n = n+1;
k = k+1;
syms t
p_i = lagpoly_arr(t_fun,n,k);
p_int = zeros(1,length(p_i));
for i = 1:length(p_int)
    p_int(i) = integral(matlabFunction(p_i(i)),t_fun(n-1),t_fun(n));
end
p = fliplr(p_int);

p_x = lagpoly_arr(t_fun,n+1,k);
p_in = zeros(1,length(p_x));
for i = 1:length(p_in)
    p_in(i) = integral(matlabFunction(p_x(i)),t_fun(n-1),t_fun(n));
end
q = fliplr(p_in);
end
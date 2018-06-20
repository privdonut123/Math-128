function [t,u,u_1] = eler_mod(a, b, ya, f, n, L)
% a,b: interval endpoints with a < b
% n: number of steps with h = (b-a)/n
% ya: vector y(a) of initial conditions
% f: function handle f(t, y, r) to integrate
% r: parameters to f
% u: output approximation to the final solution vector y(b)
digits(10)
tic
digits(8)
t = linspace(a,b,n);
h = zeros(length(n),1);
h = (b-a)/n;
u_j = zeros(n,1);
u_j(1) = ya;
for i = 1:n-1
    u_j(i+1) = u_j(i) + h*f(t(i),u_j(i),L);
end
u = vpa(u_j);
u_1 = vpa(u_j(length(n-1)));
toc

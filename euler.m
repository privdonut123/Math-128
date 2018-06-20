function u = eler(a, b, ya, f, n)
% a,b: interval endpoints with a < b
% n: number of steps with h = (b-a)/n
% ya: vector y(a) of initial conditions
% f: function handle f(t, y, r) to integrate
% r: parameters to f
% u: output approximation to the final solution vector y(b)
h = (b-a)/n;
u_j = zeros(n,1);
u_j(1) = ya;
for i = 1:n-1
    u_j(i+1) = u_j(i) + h*f(u_j(i),t+i*h)
end
u = u_j;

function yb = rich(a,b,p,f,n,ya)
% a,b: interval endpoints with a < b
% ya: vector y(a) of initial conditions
% f: function handle f(t, y, r) to integrate (y is a vector)
% r: parameters for f
% p: order of accuracy of the method
% n: number of steps with h = (b-a)/n
% yb: output approximation to the final solution vector y(b)
tic
h = (b-a)/n;
syms t
syms u
k = zeros(p);
k = sym(k);
k(:,1) = f;
%k(:,3) = sum(k(2,:));
for i = 2:p
    for j = 2:i
        k(i,j) = f(t+(j-1)/i,u+(h/i)*sum(k(i,:)));
    end
end
u_q = zeros(p,1);
u_q = sym(u_q);
for i = 1:p
    u_q(i) = u + (h/i)*sum(k(i,:));
end
lgcoef = interpolationCoeffs(h,p);
for i = 1:p
    u_q(i) = lgcoef(i)*u_q(i);
end
u_n_1 = symfun(sum(u_q),[t,u]);
fin_u = zeros(n,1);
fin_u(1) = ya;
for i = 1:n-1
    fin_u(i+1) = u_n_1(a+(i-1)*h,fin_u(i));
end
yb = fin_u(n);
toc
end
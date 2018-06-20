function t = eler1()
a = 0;
b = 17.06521656015796
n = 1024000
tic
ya = [0  -3.155430234888826  -0.020015851063791                   0]
digits(8)
% a,b: interval endpoints with a < b
% n: number of steps with h = (b-a)/n
% ya: vector y(a) of initial conditions
% f: function handle f(t, y, r) to integrate
% r: parameters to f
% u: output approximation to the final solution vector y(b)
h = (b-a)/n;
u_j = zeros(n,4);
u_j(1,:) = ya;
u_j(1,:);
speed(u_j(1,:));
for i = 1:n-1
    u_j(i+1,:) = u_j(i,:) + h*speed(u_j(i,:));
end
u = vpa(u_j);
x_p = linspace(0,4*pi,length(u(:,1)));
plot(x_p,u(:,1),'k',x_p,u(:,2),'r',x_p,u(:,3),'bo',x_p,u(:,4),'m');
legend('x','y','u','v');
title('n = 16000');
u(n,1)
A = [abs(u(n,1) - cos(x_p(n))),abs(u(n,2) - sin(x_p(n))),abs(u(n,3) + sin(x_p(n))),abs(u(n,4) - cos(x_p(n)))];
E_n = max(A)
t = toc;
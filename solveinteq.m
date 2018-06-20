function [t,u] = solveinteq( a, b, kernel, rhs, p, n )
% a, b: endpoints of interval
% kernel: function handle for kernel K = kernel( t, s ) of integral equation
% rhs: function handle for right-hand side f = rhs( t, p ) of integral equation
% p: parameters for rhs
% n: number of quadrature points and weights
% t: evaluation points in [a,b]
% u: solution values at evaluation points
U = zeros(n,n+1);
[w0,t0] = gaussint(n);
w_int = (b-a)*w0(n,:)/2;
t_int = ((b-a)*t0(n,:) + (b+a))/2;
for i = 1:n
    U(i,i) = 1;
    U(i,n+1) = rhs(t_int(i),p);
end
for i = 1:n
    for j = 1:n
        U(i,j) = U(i,j) + kernel(t_int(i),t_int(j))*w_int(j);
    end
end
U = rref(U);
u = U(:,n+1);
t = t_int;
%end
        
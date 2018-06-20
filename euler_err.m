function [y_val,euler,error,euler_app] = euler_err(a, b, ya, f, n, L, y_fun)
digits(15)
%h = (b-a)/n;
y_val = vpa(y_fun(b,L));
euler = zeros(length(L),length(n));
euler_app = zeros(length(L),length(n));
for i = 1:length(L)
    for j = 1:length(n)
        [t,u,u_1] = eler_mod(a,b,ya,f,n(j),L(i));
        euler(i,j) = u(length(u));
        euler_app(i,j) = u(length(n-1));
    end
end
euler = vpa(euler);
euler_app = vpa(euler_app);
error = zeros(length(L),length(n));
for i = 1:length(L)
    for j = 1:length(n)
    error(i,j) = abs(euler(i,j) - y_val(i));
    end
end
error = vpa(error);
end
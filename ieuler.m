function [im_eu,err] = ieuler(a, b, ya, f, n, L, y_fun)
digits(10)
[y_val,euler,error,euler_app] = euler_err(a, b, ya, f, n, L, y_fun);
euler
euler_app
error
im_eu = zeros(length(L),length(n));
h = zeros(length(n),1);
for q = 1:length(n)
    h(q) = (b-a)/(n(q));
end
for i = 1:length(L)
    for j = 1:length(n)
        vpa(h(j)*f(ya,euler_app(i,j),L(i)));
        im_eu(i,j) = euler_app(i,j) + h(j)*f(ya,euler(i,j),L(i));
    end
end
im_eu = vpa(im_eu);
err = zeros(length(L),length(n));
for i = 1:length(L)
    for j = 1:length(n)
    err(i,j) = abs(im_eu(i,j) - y_val(i));
    end
end
err = vpa(err);
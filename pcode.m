function [ t, u ] = pcode(a, b, ua, f, k, N)
digits(9)
h = (b-a)/N-1;
h1 = (b-a)*(h/(b-a))^(k/2);
t = [a];
idx
while h1 < h
    t = [t,t(0)+h1];
    h1 = h1(1+1/k);
end
while t(end) < b
    t = [t,t(end)+h];
end
[p,q] = pcoeff(t,N,k);
sum = ua(k);
ua = fliplr(ua);
for i = 1:k
    pa = p(i);
    u = ua(i);
    sum = sum + p(i)*f(t(i),ua(i));
end
vpa(sum)
end
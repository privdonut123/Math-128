function p = pleg(t,n)
digits(10)
% t: evaluation point
% n: degree of polynomial
n = n+2;
leg_p = zeros(n,1);
leg_p(1) = 1;
leg_p(2) = t;
for i = 3:n
    c = ((i-2)^2)/((4*(i-2)^2)-1);
    leg_p(i) = t*leg_p(i-1) - c*leg_p(i-2);
end
n = n-1;
p = vpa(leg_p(n));
end
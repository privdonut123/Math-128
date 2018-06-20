function p = pleg1(t,n)
digits(10)
% t: evaluation point
% n: degree of polynomial
n = n+2;
leg_p = zeros(n-1,length(t));
leg_p(1,:) = 1;
leg_p(2,:) = t;
for j = 1:length(t)
    for i = 3:n
        c = ((i-2)^2)/((4*(i-2)^2)-1);
        leg_p(i,j) = t(j)*leg_p(i-1,j) - c*leg_p(i-2,j);
    end
end
n = n-1;
p = leg_p(n);
end
function R_f = Romberg(f,a,b,n)%f=symbolic function, a=lowerbound, b = upperbound, n = array of number of bins
digits(7)
R = zeros(length(n));
for i = 1:length(n)
    h = (b-a)/n(i);
    syms q;
    f_sum = symsum(f(a+h*q),q,1,n(i)-1);
    R(i,1) = (h/2)*(f(a)+2*f_sum+f(b));
end
for j = 2:length(n)
    for k = j:length(n)
        R(k,j) = R(k,j-1)+(1/(4^(j-1)-1))*(R(k,j-1) - R(k-1,j-1));
    end
end
R_f = vpa(R);
end
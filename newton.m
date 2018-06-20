function divdiff = newton(x,func)
divdiff = zeros(length(x));
divdiff(1:length(x),1) = func;
for i = 1:length(x)
    for j = 1:i
        divdiff(i+1,j+1) = (divdiff(i+1,j) - divdiff(i,j)) / (x(i+1) - x(i-j+1))
    end
end
end
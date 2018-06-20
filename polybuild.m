function poly = polybuild(s)
syms x
poly = symfun(0,x);
for i = 1:length(s)
    poly = poly + s(i)*x^(i-1);
end

function p_x = lagpoly(P)
syms x
p_x = 0;
for i = 1:length(P)
    p_x = p_x + P(i)*x^(length(P)-i);
end
end
function err_solveinteq( a, b, kernel, rhs, p, n )
tic
digits(4)
p_space = linspace(1,p,p);
n_space = linspace(2,n,n-1);
err_mat = zeros(length(n_space),length(p_space));
for i = 1:length(n_space)
    i
    for j = 1:length(p_space)
        tic
        [t,u] = solveinteq(a, b, kernel, rhs, p_space(j), n_space(i));
        err_mat(i,j) = max(abs(diag(cos(p_space(j)*pi*t)- u)));
        toc
    end
end
vpa(err_mat)
toc
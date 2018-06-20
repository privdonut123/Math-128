function p = lagpoly_arr(t_fun,n,k)
syms t
l = n-k+1;
t_fun = t_fun(l:n-1);
t_arr = zeros(1,length(t_fun));
t_arr = sym(t_arr);
for j = 1:length(t_fun)
  t_temp = t_fun;
  t_temp(j) = [];
  n = 1;
  d = 1;
  for i = 1:length(t_temp)
      n = n.*(t - t_temp(i));
      d = d.*(t_fun(j) - t_temp(i));
  end
  t_arr(j) = n/d;
end
p = t_arr;
end
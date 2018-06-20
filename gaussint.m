function gaussint(n)
% n: Number of Gauss weights and points
a = -1;
b = 1;
zer = [-1,1];
for i = 1:n
        for j = 1:length(zer)-1
        zer(j);
        zer(j+1); 
        q = bisection(zer(j),zer(j+1),40,10^-3,i);
        zer = [zer,q];
        zer = sort(zer);
        end
end
zer
end
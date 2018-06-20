function r = bisection(a,b,p,t,n)
r = NaN;
for i = 1:p
    if i ~= p
        av = (b + a)/2;
        pleg(av,n);
        if pleg(av,n) == 0 || abs(abs(pleg(av,n)) - abs(pleg(a,n))) <= t
            r = av;
            break
        else
            if pleg(av,n)*pleg(a,n)>0
                a = av;
            else
                b = av;
            end
        end
    else
        break
    end
end
end
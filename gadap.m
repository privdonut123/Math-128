function [int, abt, cnt] = gadap(a, b, f, tol)
i = 1;
int = 0;
[integ, cnt] = PS07_4a(a, b, f);
abt = [a, b, integ];
while i <= size(abt, 1)
    a_i = abt(i, 1);
    b_i = abt(i, 2);
    t_i = abt(i, 3);
    if abs(b_i - a_i) < eps
        break;
    end
    l = [a_i, mean([a_i, b_i])];
    r = [mean([a_i, b_i]), b_i];
    [integ1, cnt1] = PS07_4a(l(1), l(2), f);
    [integ2, cnt2] = PS07_4a(r(1), r(2), f);
    if abs(t_i - (integ1+integ2)) > tol*max([abs(t_i), abs(integ1) + abs(integ2)])
        abt = [abt; [l, integ1]; [r, integ2]];
    else
        int = int + t_i;
    end
    i = i + 1;
    cnt = cnt + cnt1 + cnt2;
end
end
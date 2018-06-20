function arr = speed(u)
arr = sym('A%d%d',[1 4]);
arr(1) = u(3);
arr(2) = u(4);
arr(3) = -u(1)/ (u(1)^2 + u(2)^2);
arr(4) = -u(2)/ (u(1)^2 + u(2)^2);
function yy=LagrangeInterpolation(x,y,xx)
% LAGRANGEINTERPOLATION interpolation using Lagrange polynomials
% yy=LagrangeInterpolation(x,y,xx); uses the points (x,y) for the
% Lagrange Form of the interpolating polynomial P and iterpolates
% the values yy=P(xx)
n=length(x); 
nn=length(xx);
for i=1:nn
yy(i)=0;
for k=1:n
yy(i)=yy(i)+y(k)*prod((xx(i)-x([1:k-1,k+1:n])))/prod((x(k)-x([1:k-1,k+1:n])));
end
end
function [z  ] = offset(h, l,alpha,zeta )
%Inside offset contour
%INPUT
%h  offst amount
%OUTPUT
%z  node points coordinat
dalpha=alpha(n)-alpha(n+1);
r=l(n)-h*(1.0-cos(dalpha))/sin(dalpha);
r=l(n);
%rearrange z
ind=[5 1 2 3 4];
z=z(ind);
x=real(z);
y=imag(z);
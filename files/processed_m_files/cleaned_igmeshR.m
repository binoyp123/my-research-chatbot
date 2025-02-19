function [xv, yv, xc, yc, dfc,mNew] = igmeshR(c,x,y,n,m)
%==========================================================================
%Refined mesh: vortex points near the end point are refined
%Given an airfoil, identify n+1 points (including the end points)
%that divide the airfoil at an equal n interval
%INPUT VARIABLES
% x,y   data points on the airfoil
% c     chord length (nondimentionalized by d=stroke length)
% n     # of data points to define the airfoil shape (n > m)
% m     # of vortex points (# of collocation points = m-1)
%OUTPUT VAIABLES
% xv, yv    coordinates of the vortex points
% xc, yc    coordinates of the collocation points
% dfc       slope at the collocation points
% mNew      use m+4 for the number of refined vortex points
%==========================================================================
a=0.5*c;  %half chord length
%Splines for the curve and its slope
f=spline(x,y);
df=fnder(f,1);
%Calculate the curve length as the function of x
ds=quad(@(z)sqrt(1+ppval(df,z).^2),x(i),x(i+1));
%Spline for (curve length) - x relation
g=spline(s,x);
dS=s(n)/(m-1);    %Curve length = s(n+1)
%Identify X & Y coordinates that equally divide the curve
%add 4 more points, 2 each near the end; at 1/4 and 1/2 distances
xv=zeros(1,m+4);
yv=ppval(f,xv);
%Mid poits of (X,Y) to be used for collocation
xc=zeros(1,m+3);
yc=ppval(f,xc);
%Slope at the Collocation Points
dfc=ppval(df,xc);
%PLOTS=================================================================
g=figure();
xx=linspace(-a,a, 101);
%Plot Vortex and Collocation points
%axis([-1.1*a,1.1*a,-0.1*h,1.1*h])
%Compare equal arc and equal abscissa mesh points
%Update the numer of vortex points
mNew=m+4;
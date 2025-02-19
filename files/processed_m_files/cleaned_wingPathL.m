function [  ] = wingPathL(t,e,c,a,beta,gMax,p,rtOff, U, V,W,phiT,phiB,l,AZ,EL)
%Wing path For left wing cambered
%INPUT Variables (all nondimentional)
% t         time
% e         stroke difference
% c         chord length
% a         rotation distance offset
% beta      stroke angle
% gMax      maximum rotation
% p         rotation velocity parameter
% rtOff     rotation timing offset
% U, V,W      ambient velocity
% phiT,phiB top and bottom stroke angles
% l         wing span
% AZ,EL     3dplot view
%==========================================================================
%LOCAL Variables
sump=phiT-phiB;
%Rolling Motion
phi=0.5*sump*(cos(pi*(t+tau))+e);
%Rotational Motion
theta=gMax*f;
%Edge positions of the tip code for the composite motion
x0L=-0.5*c;
x0T=+0.5*c;
x0C=0.0;
y0L=l;
y0T=l;
y0C=l;
%Change the sign of y-components
YL=-YL;
YT=-YT;
YC=-YC;
%Edge positions of the base code for the composite motion
x0L=-0.5*c;
x0T=+0.5*c;
x0C=0.0;
y0L=0;
y0T=0;
y0C=0;
%Change the sign of y-components
YLB=-YLB;
YTB=-YTB;
YCB=-YCB;
%Add effect of the ambient air velocity
f=figure();
function [  ] = tbwingPathTail(td,nhp,w,iwing,t,rt,e,c,a,b,beta,delta,gMax,p,rtOff,tau, U, V,W,phiT,phiB,l,AZ,EL)
%Wing path For left wing
%INPUT Variables (all nondimentional)
% td        1 (top-down), 2(down-up)
% nhp       # of half-period for sinusoidal & tail
% w         1 (right), 2 (left) wing
% iwing     wing numbering (2 or 4)
% t         time
% rt        period ratio
% e         stroke difference
% c         chord length
% a         rotation distance offset
% b         wing offset
% beta      stroke angle
% delta     body angle
% gMax      maximum rotation
% p         rotation velocity parameter
% rtOff     rotation timing offset
% tau       phase shift
% U, V,W      ambient velocity
% phiT,phiB top and bottom stroke angles
% l         wing span
% AZ,EL     3dplot view
%==========================================================================
%LOCAL Variables
sump=phiT-phiB;
%Rolling Motion
phi=0.5*sump*cosTailG(td,nhp,t,rt,tau, e);
%Rotational Motion
theta=gMax*gam;
%Effective flap plane angle considering the body angle
beta=beta-delta;
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
gid=figure();
%close;
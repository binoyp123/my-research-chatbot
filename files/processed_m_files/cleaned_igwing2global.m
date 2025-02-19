function [NC,ZV,ZC,ZVt,ZCt,ZWt] = igwing2global(istep,t,a,alp,l,h,xv,yv,xc,yc,dfc,ZW)
%Get global position of the wing colllocation and vortex points
%given coordinates in the wing-fixed coordinate system
%INPUT Variables (all nondimentional)
% t         time
% e         stroke difference
% a         rotation distance offset
% alp       alpha
% U, V      ambient velocity
% xv, yv    coordinates of the vortex points in the wing-fixed system
% xc, yc    coordinates of the collocation points in the wing fixed system
% dfc       slope at the collocation points in the wing-fixed system
% ZW        wake vortex in the global system
% l, h      location of the origin of the translating system
%OUTPUT
% ZV,ZC     complex coordinates of the wing vortex and collocation points in the global system
% ZVt,ZCt   complex coordinates of the wing in the translational system
% NC        complex unit normal at collocation points in the global system
% ZWt        wake vortex in the translating system
%= =========================================================================
%LOCAL Variables
%{
%Displacement of the translating system: x0,z0
%(including the contribiition of the speed of air)
x0=-U*t+0.5*( cos(pi*(t+tau))+e )*cos(beta);
z0=-V*t+0.5*( cos(pi*(t+tau))+e )*sin(beta);
x0=-U*t+0.5*cosTailG_2(t+tau, e)*cos(beta);
z0=-V*t+0.5*cosTailG_2(t+tau, e)*sin(beta);
x0=-U*t+0.5*cosUpTailG_2(t+tau, e)*cos(beta);
z0=-V*t+0.5*cosUpTailG_2(t+tau, e)*sin(beta);
x0=-U*t+0.5*cosTailG(t+tau, e)*cos(beta);
z0=-V*t+0.5*cosTailG(t+tau, e)*sin(beta);
x0=-U*t+0.5*cosUpTailG(t+tau, e)*cos(beta);
z0=-V*t+0.5*cosUpTailG(t+tau, e)*sin(beta);
%x0=-U*t+0.5*(cos(pi*(t+tau))+e)*cos(beta);
%z0=-V*t+0.5*(cos(pi*(t+tau))+e)*sin(beta);
%}
zt=complex(l,h);
ZWt=ZW; %for istep=1, ZW is assigned to the initial zero value
ZWt=ZW-zt;
%Global positions for the collocation and vortex points on the wing
%Add translational and rotational motion contributions
zv=complex(xv,yv);
zc=complex(xc,yc);
expmia=exp(-1i*alp);
ZVt=(a+zv)*expmia;      %Position in the translating system
ZCt=(a+zc)*expmia;      %Position in the translating system
ZV=ZVt+zt;
ZC=ZCt+zt;
inorm=1;
%Angle of the slope at the collocation points in the global system
angt=atan(dfc)-alp;
%slope of the unit normal to collocation points
angn=angt+0.5*pi;
nx=cos(angn);
ny=sin(angn);
NC=complex(nx,ny);
%Unit normal vector of the airfoil in the wing-fixed system
denom=sqrt(1+dfc.^2);
nx=-dfc./denom;
ny= 1.0./denom;
nc=complex(nx,ny);
%Unit normal vector of the airfoil in the global system
NC=nc*expmia;
f=figure();
%End points for the unit normal vector at collocation points
sf=0.025; %scale factor for the  plot
xaif=real(ZC);
yaif=imag(ZC);
xtip=xaif+sf*real(NC);
ytip=yaif+sf*imag(NC);
%Plot unit normal vectors at collocation points
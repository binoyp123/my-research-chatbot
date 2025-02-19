function [Xc,Xb,Xt,XC,NC_T] = tblrmassL2GT(iwing,beta,delta,phi,theta,a,U,t,b,xc,xb,xt,xC,nC )
%Conversion of vectors from wing-fixed to glogal or translating system
%INPUT
%iwing          1(right wing), 2(left)
%beta, phi,theta,a,U    wing motion parameters
%delta          body angle
%b              wing offset from the body centroid
%xc(j,n,i)
%xb(j,n,i)      coordinates of the nodes for border elements on the wing(wing-fixed)
%xt(j,n,i)      coordinates of the nodes for total elements on the wing(wing=fixed)
%xC(j,i)        coordinates of the total collocation points on the wing(wing=fixed)
%nC(j,i)        unit normal at the total collocation points on the wing(wing-fixed)
%OUTPUT:
%Xc(j,n,i)
%Xb(j,n,i)      coordinates of the nodes for border elements on the wing(space=fixed)
%Xt(j,n,i)      coordinates of the nodes for total elements on the wing(space=fixed)
%XC(j,i)        coordinates of the total collocation points on the wing(space=fixed)
%NC_T(j,i)      unit normal at the total collocation points on the wing(translating system & space-fixed)
%Xt_T(j,n,i)    coordinates of the nodes for total elements on the wing(translating system)
%XC_T(j,i)      coordinates of the total collocation points on the wing(translating system)
s=size(xt);
sb=size(xb);
sc=size(xc);
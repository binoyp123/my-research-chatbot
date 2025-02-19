function [limpa,aimpa,limpw,aimpw] = tbsimpulseWT(istep,U,t,Xt,Xw,GAM,GAMAw,beta,phi,theta,a)
%Calculate linear and angular impulses due to the bound and wake vortices
%in the body-translating system
%INPUT
% U(j)
% t
% Xt(j,n,i,w)   coordinates of the nodes for total elements on the wing
% Xw(j,n,i,w)   wake vortex location
% GAM(w,i)      bound vortices
% GAMAw(w,i)    wake vortices
% beta(w)
% phi(w)
% theta(w)
% a(w)
%OUTPUT
% limpa(j,w)
% aimpa
% limpw
% aimpw
tmp=zeros(3,nwing);
limpa=tmp;
aimpa=tmp;
limpw=tmp;
aimpw=tmp;
%From Global to Translating Inertia
s=size(Xt);
Xt_T=zeros(s(1),s(2),s(3),s(4));
s=size(Xw);
Xw_T=zeros(s(1),s(2),s(3),s(4));
%Bound vortex--------------------------------------------------------------
%Linear inpulse
%n1(j,nXt), n2(j,nXt)=unit normal for 2 triangulr iXt_th element
%Angular impulse
%Wake vortex---------------------------------------------------------------
%Linear impulse
%Angulr impulse
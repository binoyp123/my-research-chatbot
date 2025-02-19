function [n,limp] = slimpulse_tr(X,gama,beta,phi,theta,a)
%Calculate the linear impulses due to the triangular bound or wake vortex elements in wing-translating system
%INPUT
% X(j,3,i)
% gama(i)
%OUTPUT
% n(j,i)
% limp(j)
%Initialization
s=size(X);
x1=zeros(3,s(3));
x2=zeros(3,s(3));
n =zeros(3,s(3));
%Linear impulse
%cross product of x1 and x2
%add contributions from all elements
%Transform from local to translating system
%[ limp] = L2T( limp,beta,phi,theta,a );
%unit normal
nx1x2=sqrt(x1x2(1,:).^2+x1x2(2,:).^2+x1x2(3,:).^2);
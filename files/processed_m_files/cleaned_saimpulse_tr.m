function [ aimp] =saimpulse_tr(X,n,gama,beta,phi,theta,a)
%Moment of inertia for the triangular element in the wing-translating (inertia) system
%INPUT
% X(j,3,i)
% n(j,i)
% gama(i)
% h(i)
% lR(i)
% lL(i)
% S(i)
% xi(j,i);
% eta(j,i)
% xH(j,i)
A=[a 0 0];
%Cross of Int and n
%Transform from local to translating system
%[ aimp] = L2T( aimp,beta,phi,theta,a );
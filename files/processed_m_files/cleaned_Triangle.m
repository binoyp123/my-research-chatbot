function [ h,lR,lL,S,xi,eta,xH ] = Triangle( X )
%Geometry of a triangle element
%INPUT
% X(j,n,i) j=1:3, n=1:3, i=1,nelm
%OUTPUT
% h(i)
% lR(i)
% lL(i)
% S(i)
% xi(j,i);
% eta(j,i)
% xH(j,i)
s=size(X);
x21=zeros(3,s(3)); x23=zeros(3,s(3));
nx21=sqrt(x21(1,:).^2+x21(2,:).^2+x21(3,:).^2);
nx23=sqrt(x23(1,:).^2+x23(2,:).^2+x23(3,:).^2);
l=nx21;
xi=zeros(3,s(3));
lL=x23(1,:).*xi(1,:)+x23(2,:).*xi(2,:)+x23(3,:).*xi(3,:);
lR=l-lL;
xj2=zeros(3,s(3)); xj3=zeros(3,s(3)); x2H=zeros(3,s(3)); xH=zeros(3,s(3)); xH3=zeros(3,s(3));
h=sqrt(xH3(1,:).^2+xH3(2,:).^2+xH3(3,:).^2);
eta=zeros(3,s(3));
S=0.5*l.*h;
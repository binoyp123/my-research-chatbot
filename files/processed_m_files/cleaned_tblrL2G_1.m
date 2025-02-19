function [ X] = tblrL2G_1(iwing, x,n,beta,delta,phi,theta,a,U,t,b )
%Coordinate transformation from the wing-fixed to global system
%INPUT
%iwing  1 (right wing), 2 (left)
% x(j,node,i)    unit normal vector  in the wing-fixed system
%    j=1:3
%    node=1:4
%    i=1,...,any number
% beta  flap plane angle
%delta  body angle
% phi   flapping angle
% theta  rotation angle (pitch)
% a rotation offset
% U(j)      wing velocity
% t         time
% b         wing offet from the body center
%OUTPUT
% X(j,node,i)    global
% xt(j,node,i)   translating
xb=zeros(3,4,n);
xt=zeros(3,4,n);
X =zeros(3,4,n);
%Local to flap plane inertia system Xb(j)
cth=cos(theta);
sth=sin(theta);
cph=cos(phi);
sph=sin(phi);
%LHS to RHS
%From Flap plane inertia to translating iertia
%Effective flap plane angle
beta=beta-delta;
cb=cos(beta);
sb=sin(beta);
%From Translating Inertia to the Global
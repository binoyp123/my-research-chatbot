function [ X] = tblrL2T_2(iwing, x,beta,delta,phi,theta)
%Coordinate transformation of the free vector from the wing-fixed to translationg system
%Examples of free vectors: velocity, unit normal to the element
%INPUT
% iwing 1(right wing), 2(left)
% x(j,i)  any vector  in the wing-fixed system
% beta  flap plane angle
% delta     body angle
% phi   flapping angle
% theta rotation angle (pitch)
%OUTPUT
%X(j,i)
%Rotation offset is zero
a=0.0;
%Local to flap plane inertia system xb(j)
cth=cos(theta);
sth=sin(theta);
cph=cos(phi);
sph=sin(phi);
%LHS to RHS
%Flap plane inertia to translation iertia
%Effective stroke angle
beta=beta-delta;
cb=cos(beta);
sb=sin(beta);
%
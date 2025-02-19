function [ Xct,Xcr ] = CRnodes( Lt,Lr,C,delta,n )
%Coodinates of the nodes for the rectangular mesh in the center region
%INPUT
%Lt     length of the tapered edge for the center region
%Lr     length of the horizontal edge for the center region
%C
%delta  half-base opening angle
%n(I)   number of border strip elements: I=1:5
%OUTPUT
%Xct    nodes in the tapered region
%Xcr    nodes in the rectangular region
%Angle and length of radial lines
e=Lt*cos(delta);
z=(-0.5+(i-1)/n(3))*C;
%Tapered region
theta=ang(ir);
dlt=lt(ir)/n(1);
r=(ic-1)*dlt;
%Rctangular region
y0=Lt*cos(delta);
dy=Lr/n(2);
x =lt(ir)*cos(ang(ir));
y=y0+(ic-1)*dy;
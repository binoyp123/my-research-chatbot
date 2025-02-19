function [ VBT] = tbvelBbyT(cVBT, GAM,nXt )
%Velocity coefficients at shed element nodes due to bound vortices
%INPUT
% cVBT
% GAM(nwing,nXt)   circulation for the total vortices on the wing
% nXt    total # of elements on the wing
%OUTPUT
%VBT(j,n,ibelem,nwing)
%cVBT(j,n,ibelem,itelem,nwing)
% itelem    index of all elements on the wing
% ibelem    index of border elements
% n         4three nodes for each border element
% j         1-3 (x,y,z)
%Calculate velocity at shed element nodes (4 for each element)
s=size(cVBT);
r=[s(1),s(2),s(3),nwing];
VBT=zeros(r);
dVBT=zeros(r);
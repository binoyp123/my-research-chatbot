function [cVBT  ] = tbvelBbyTMatrix( nXb,nXt,Xb,Xt )
%Velocity coefficients at border element nodes (no offset) due to bound vortices
%INPUT
% nXb               #of border elements
% nXt               #of all elements on the wing
%Xb(j,n,i,nwing)          Border element coordinates j for node n of element i
%Xt(j,n,i,nwing)          coordinates of the nodes for total elements on the wing
%OUTPUT (into global)
%cVBT
%cVBT(j,n,ibelm,itelm)
% itelm     index of whole elements on the wing
% ibelm     index of border elements
% n         4 nodes for each shed element
% j         1-3 (x,y,z)
cVBT=zeros(3,4,nXb,nXt,nwing);
r=[1,4,nXb];
U=zeros(r); V=zeros(r); W=zeros(r);
U=U+dU; V=V+dV; W=W+dW;
U=U+dU; V=V+dV; W=W+dW;
U=U+dU; V=V+dV; W=W+dW;
U=U+dU; V=V+dV; W=W+dW;
%Velocity coefficients
%cVBT
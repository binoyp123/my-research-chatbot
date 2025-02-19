function [VN] = tbcrossMatrix(XC,NC,nxT,Xt,nxS)
%Set up a sub-matrix for target wing due to bound vortices on the source
%wing
%INPUT
% target====
% XC(j,i)    coordinates of the total collocation points on the target wing
% NC(j,i)    unit normal at the total collocation points on the target wing
% nxT        # of total elements on the target wing
% source====
% Xt(j,n,i)  coordinates of the nodes for total elements on the source wing
% nxS        # of total elements on the source wing
%OUTPUT
% VN(nxT, nxS)  sub-matrix for the nonpenetration condition
%Set up a coefficient matrix for the nonpenetration condition on the airfoil surface
%Use collocation point vector XC(j,i) and the unit normal vector NC(j,i) for the all collocation points
%Pre allocate the space for VN
VN=zeros(nxT,nxS);
s=size(XC);
r=[1,s(2)]; %Raw vector of length s(2)=nXt
U=zeros(r); V=zeros(r); W=zeros(r);
U=U+dU; V=V+dV; W=W+dW;
U=U+dU; V=V+dV; W=W+dW;
U=U+dU; V=V+dV; W=W+dW;
U=U+dU; V=V+dV; W=W+dW;
%Normal velocity
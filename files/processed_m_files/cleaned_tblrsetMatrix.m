function [VN ] = tblrsetMatrix(iwing,Xt,nXt,XC,NC)
%Set up a self-coefficient matrix for the nonpenetration condition on the
%airfoil surface: coefficient matrix of normal vel by itself
%INPUT
%iwing      1 (right wing), 2(left wing)
%Xt(j,n,i)  coordinates of the nodes for total elements on the wing
%nXt        # of total elements on the wing [i=1:nXt]
%XC(j,i)    coordinates of all collocation points
%NC(j,i)    unit normal to all elements at the collocation points
%OUTPUT
% VN        matrix for the nonpenetration condition (nXt, nXt)
%The left wing geometry is obtained by reversing the sign of y-coordinate of the right wing
%Pre allocate the space for VN
VN=zeros(nXt,nXt);
s=size(XC);
r=[1,s(2)]; %Raw vector of length s(2)=nXt
U=zeros(r); V=zeros(r); W=zeros(r);
U=U+dU; V=V+dV; W=W+dW;
U=U+dU; V=V+dV; W=W+dW;
U=U+dU; V=V+dV; W=W+dW;
U=U+dU; V=V+dV; W=W+dW;
%Normal velocity
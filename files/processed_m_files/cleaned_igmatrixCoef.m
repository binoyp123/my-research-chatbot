function [ ] = igmatrixCoef( xv,yv,xc,yc,dfc,m)
%Set up a system of equations for bound vortices and solve.
%For step 1, forward elimination is used to set up the upper triangle matrix,
%which remains constant for the entire steps of iteration.
%At each step, the unknown bound vortices are obtained by backward substitution.
%INPUT
% xv,yv     vortex points on the airfoil
% xc,yc     collocation points
% dfc        slope for the airfoil
% m         # of vortex points
%OUTPUT
% MVN        matrix for the nonpenetration condition (m.m)
%LOCAL
% nc        unit normal for the airfoil
%Set up a coefficient matrix for the nonpenetration condition on the airfoil surface
%construct complex numbers for the vortex and collocation points
%Unit normal vector of the airfoil
denom=sqrt(1+dfc.^2);
nx=-dfc./denom;
ny= 1.0./denom;
nc=complex(nx,ny);
zeta =complex(xc, yc);
zeta0=complex(xv, yv);
gf=1.0/(zeta(i)-zeta0(j));
%for i=m
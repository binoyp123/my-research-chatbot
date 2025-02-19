function [VNW] = ignVelocityw2(m,ZC, NC, ZF, GAMAw, iGAMAw)
%Normal velocity contribution on the airfoil by the wake vortex
%INPUT
% m                         # of vortex points
% ZC    (1,m-1)         collocation points
% NC        (1,m-1)         unit normal complex number
% ZF        (1,iGAMAw)    location of the wake vortices (1:iGAMAw)
% GAMAw     (1,iGAMAw)      wake vortex
% iGAMAw                    # of wake vortices
%OUTPUT
% VNW       (1,m-1)         normal velocity components at the collocation point due to the wake vortices
VNW=zeros(1,m-1);
r=abs(ZC(i)-ZF(j));
GF=complex(0.0,0.0);
GF=1.0/(ZC(i)-ZF(j));
GF=GF*(r/delta)^2;
eps=eps*1000;
r=abs(ZC(i)-ZF(j));
GF=complex(0.0,0.0);
GF=1.0/(ZC(i)-ZF(j));
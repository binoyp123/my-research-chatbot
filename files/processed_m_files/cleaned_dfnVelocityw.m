function [VNW] = dfnVelocityw(m,ZC, NC, nwing,ZF, GAMAw, iGAMAw)
%Normal velocity contribution on the airfoil by the wake vortex
%INPUT
% m                         # of vortex points
% ZC        (1,m-1)         collocation points
% NC        (1,m-1)         unit normal complex number
% nwing     # of wings
% ZF        (nwing,iGAMAw)  location of the wake vortices (1:iGAMAw) sama sa ZW
% GAMAw     (nwing,iGAMAw)  wake vortex
% iGAMAw    (nwing)         # of wake vortices
%OUTPUT
% VNW       (1,m-1)         normal velocity components at the collocation point due to the wake vortices
VNW=zeros(1,m-1);
eps=eps*1000;
r=abs(ZC(i)-ZF(iwing,j));
GF=complex(0.0,0.0);
GF=1.0/(ZC(i)-ZF(iwing,j));
r=abs(ZC(i)-ZF(iwing,j));
GF=complex(0.0,0.0);
GF=1.0/(ZC(i)-ZF(iwing,j));
GF=GF*(r/DELta)^2;
%{
GF=1.0/(ZC(i)-ZF(iwing,j));
%}
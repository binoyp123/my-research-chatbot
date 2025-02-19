function [Limpb, Aimpb, Limpw,Aimpw ] = dfimpulses(ZVT,ZWT,GAM,m,GAMAw,iGAMAw)
%Calculate the linear and angular impulses on the airfoil in the body-fixed system
%INPUT
% ZVT       vortex points on theairfoil in the translating system
% ZWT       wake vortex location in the translating system
% GAM      bound vortices
% m         % of bound vortices
% GAMAw     wake vortices
% iGAMAw    # of wake vortices
%Bound vortex (free vortices excluded)
%Initialize the impulses before adding up
tmp=zeros(2,1);
Limpb=complex(tmp,tmp);
Aimpb=complex(tmp,tmp);
Limpw=complex(tmp,tmp);
Aimpw=complex(tmp,tmp);
%Wake vortex
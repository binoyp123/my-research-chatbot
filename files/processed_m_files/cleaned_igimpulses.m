function [] = igimpulses(istep,ZVt,ZWt,a,GAMA,m,GAMAw,iGAMAw)
%Calculate the linear and angular impulses on the airfoile
%INPUT
% istep     time step
% ZVt     vortex points on theairfoil in the translating system
% ZWt        wake vortex location in the translating system
% a         rotation axis offset
% alp       chord angle
% GAMA      bound vortices
% m         % of bound vortices
% GAMAw     wake vortices
% iGAMAw    # of wake vortices
%Bound vortex (free vortices excluded)
%Initialize the impulses before adding up
%Wake vortex
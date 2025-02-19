function [VEL]=igvelocity(ZF,iGAMAf,GAMA,m,ZV,GAMAw,iGAMAw)
%{
%}
%INPUT
% ZF        sites of vortes to be convected & shed (global suystem)
%iGAMAf     # of vortices to be shed or convected
% GAMA      bound vortex
% m         # of bound vortices
% ZV     location of bound vortices (global)
% GAMAw     wake vortex
% iGAMAw    #of wake vortices
%OUTPUT
% VEL       velocity (not the conjugate) of vortex sites to be convected or shed
%Air velocity
%VEL(i)=VEL(i)+complex(U-dl, V-dh);
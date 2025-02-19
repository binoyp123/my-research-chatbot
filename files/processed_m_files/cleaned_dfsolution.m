function [ GAMA ] = dfsolution(m,MVN,VN,VNW,sGAMAw)
%Solution
%INPUT
% istep         time step
% m             # of bound vortices for each wing
% VN(2,m-1)     normal velocity at the collocation points (m-1 components) by the bound vortex
% VNW(2,m-1)    normal velocity at the collocation points (m-1 components) by the wake vortex
% sGAMAw(2)     sum of the wake vortices
%OUTPUT
% GAMA  bound vortices
%RHS of the equation
%FORWARD WING
%for the non-peneteration condition: (m-1) components
%for the vortex conservation condition: 1 component
%REAR WING
%for the non-peneteration condition: (m-1) components
%for the vortex conservation condition: 1 component
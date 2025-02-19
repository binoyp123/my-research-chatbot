function [ GAMA ] = igsolution(m,VN,VNW,istep,sGAMAw)
%Solution
%INPUT
% istep     time step
% m         # of bound vortices
% VN        normal velocity at the collocation points (m-1 components) by the bound vortex
% VNW       normal velocity at the collocation points (m-1 components) by the wake vortex
% sGAMAw    sum of the wake vortices
%OUTPUT
% GAMA  bound vortices
%Originally (m-1) components
GAMA=VN-VNW;
%Add m-th component
%FOR NONVARIABLE WING GEOMETRY, MATRIX INVERSION IS DONE ONLY ONCE
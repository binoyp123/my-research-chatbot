function [ GAMA ] = tbsolution(nxt_f,nxt_r,MVN,Vnc_f,Vncw_f,Vnc_r,Vncw_r)
%Solution
%INPUT
% nxt_f           # of bound vortices for front wing
% nxt_r           # of bound vortices for rear wing
% MVN             matrix
% Vnc_f(2,nxt_f)  normal velocity at the collocation points by the bound vortex
% Vncw_f(2,nxt_f) normal velocity at the collocation points by the wake vortex
% Vnc_r(2,nxt_f)  normal velocity at the collocation points by the bound vortex
% Vncw_r(2,nxt)   normal velocity at the collocation points by the wake vortex
%OUTPUT
% GAMA  bound vortices
%RHS of the equation
%Front wing
%RIGHT WING
%for the non-peneteration condition: (nxt_f) components
%LEFT WING
%for the non-peneteration condition: (nxt_f) components
%Rear wing
%RIGHT WING
%for the non-peneteration condition: (nxt_r) components
%LEFT WING
%for the non-peneteration condition: (nxt_r) components
GAMA=GAMA';
GAMA=GAMA\MVN;
%GAMA=GAMA';
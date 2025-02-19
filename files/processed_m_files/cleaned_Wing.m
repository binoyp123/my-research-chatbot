function [Xb_f,nXb_f,Nb_f,Xc_f,nXc_f,Nc_f,l_f,c_f,h_f,...
%OUTPUT (all dimensional)
% FORWARD WING:
% Xb_f(j,n,i)   Border element coordinates
% nXb_f         # of border elements
% Nb_f(j,i)     Unit normal to the border elements
% Xc_f(j,n,i)   Center element coordinates
% nXc_f         # of center elements
% Nc_f(j,i)     Unit normal to the center elements
% l_f           span
% c_f           chord
% h_f           border height
% REAR WING: with subscriot _r%
% Xb_r(j,n,i)   Border element coordinates
% nXb_r         # of border elements
% Nb_r(j,i)     Unit normal to the border elements
% Xc_r(j,n,i)   Center element coordinates
% nXc_r         # of center elements
% Nc_r(j,i)     Unit normal to the center elements
% l_r          span
% c_r           chord
% h_r           border height
%Front wing
hfactor_f=0.1;
wfactor_f=3;
h_f=c_f*hfactor_f;
%Rear wing
hfactor_r=0.1;
wfactor_r=3;
h_r=c_r*hfactor_r;
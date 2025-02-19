function [ VBT_f,VBT_r ] = tbassemblevelBbyT( nxb_f,VBTs_f,VBTs_12,VBTs_13,VBTs_14,VBTs_21,VBTs_23,VBTs_24,...
%Get total velocity of the border elements on front wing w and rear winng w due to total bound vortices on 4 wings
%INPUT
% nxb_f
% nxb_r
% VBTs_f(j,n,i,w)   vel on front wing w due to total elem on wing w
% VBTs_r(j,n,i,w)   vel on rear wing w due to total elem on wing w
% VBTs_ij(j,n,i)    vel on wing 1 due to total elem on wing 2
%OUTPUT
% VBT_f(i,n,j,w)    velocity on front wing w due to all four wing vound vortices
% VBT_r(i,n,j,w)    velocity on rear wing w due to all four wing vound vortices
VBT_f=zeros(3,4,nxb_f,nwing);
VBT_r=zeros(3,4,nxb_r,nwing);
%{
%}
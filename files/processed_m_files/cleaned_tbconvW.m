function [ Xw ] = tbconvW( dt,VWT, VWW,Xw)
%Convect  wake elements
%{
%}
Xw=Xw+dt*(VWT+VWW);
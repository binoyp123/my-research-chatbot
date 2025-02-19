function [ Xs ] = tbshedB( dt,VBT, VBW,Xb,nXb)
%Shed border elements for nwing wings
%{
%}
Xs=zeros(3,4,nXb,nwing);
Xs=Xb+dt*(VBT+VBW);
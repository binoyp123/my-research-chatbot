function [ Xc,nXc] = CElem(n, Zt,Zr )
%Meshing for the center eegion
%INPUT
%n      # of elements in each border edge
%Zt     node points for the tapered region
%Zr     node points the center region
%OUTPUT
%Xc     total center rectangular elements
%nXc    # of total center recangular elements
%Nc    Unit normal to the element
%Coodinates of the nodes for the center region
%RECTANGULAR MESH POONTS BY ROWS (x-direction) & COLUMNS (y-direction)
%For each element, the node start at left bottom and rotate clock-wise
% 2   3      ir,ic+1  ir+1,ic+1
%   5    =
% 1   4      ir,ic    ir+1,ic
%x=horizontal, y=vertical directions
%Tapered region
%Rectangular region
%RECTANGULAR (&POLYGON) MESH
%Tapered region============================================================
%Triangular apex mesh with 4 nodes
i=1;
ic=1;
i=i+1;
%Four sided meshes
%i=2;
i=i+1;
nXctR=i-1;
%Rectangular region========================================================
i=1;
i=i+1;
nXcrR=i-1;
%Total center rectangular elements
nXc=nXctR+nXcrR;
Xc=zeros(2,4,nXc);
Nc=zeros(3,nXc);
%{
%Introduce the camber (size(Xc)=(3,4,nXc))
%Unit normal to the element [size(uNc)=(3,nXc]
%}
%Centroid (size(Xc)=(2,5,nXc))
%Total center rectangular elements
nXc=nXcrR;
Xc=zeros(2,4,nXc);
Nc=zeros(3,nXc);
%{
%Introduce the camber (size(Xc)=(3,4,nXc))
%Unit normal to the element [size(uNc)=(3,nXc]
%}
%Centroid (size(Xc)=(2,5,nXc))
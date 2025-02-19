function [Xb,nXb ] = BElem(Z12,Z23,Z34,Z45,Z51,z12,z23,z34,z45,z51)
%Border element node coordinates
%INPUT
%Zij    outer contour edge ij subnodes
%zij    inner contour ij subnodes
%OUTPUT
%Xb     Border element coordinates
ii=1;
%For edge 12
s=size(Z12);
ii=ii+1;
%For edge 23
s=size(Z23);
ii=ii+1;
%For edge 34
s=size(Z34);
ii=ii+1;
%For edge 45
s=size(Z45);
ii=ii+1;
%For edge 51
s=size(Z51);
ii=ii+1;
s=size(Xb);
nXb=s(3);
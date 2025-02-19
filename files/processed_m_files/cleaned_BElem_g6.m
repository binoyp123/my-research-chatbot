function [Xb,nXb ] = BElem_g6(Z12,Z23,Z34,Z45,Z56,Z61,z12,z23,z34,z45,z56,z61)
%Border element node coordinates
%INPUT
%Zij    outer contour edge ij subnodes
%zij    inner contour ij subnodes
%OUTPUT
%Xb     Border element coordinates
%nXb    # of border elements
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
%For edge 56
s=size(Z56);
ii=ii+1;
%For edge 61
s=size(Z61);
ii=ii+1;
s=size(Xb);
nXb=s(3);
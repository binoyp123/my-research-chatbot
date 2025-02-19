function [Zt,Zr,z12,z23,z34,z45,z51 ] = centerSN(n,z)
%Center contour sub nodes
%{
%}
%INPUT
%z   corner node coordinates; complex valued
%n  # of border elements on each edge
%w  width of border elements
%OUTPUT
%Zt,Zr  element node matrix
%zij    sub nodes for edge ij
%Sub nods along the edges
%For edge 1-2
zif=z(2)-z(1);
%For edge 1-5
zif=z(5)-z(1);
%For edge 2-3
zif=z(3)-z(2);
%For edge 5-4
zif=z(4)-z(5);
%For edge 2-5
zif=z(5)-z(2);
%For edge 3-4
zif=z(4)-z(3);
%Element node grid
%Tapered (sort of) region
Zj=z15(j)-z12(j);
%Rectangular (sort of) region
Zj=z54(j)-z23(j);
%Fliplr some zij
z45=fliplr(z54);
z51=fliplr(z15);
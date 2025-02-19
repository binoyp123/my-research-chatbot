function [Z12,Z23,Z34,Z45,Z51 ] = borderSN(h,alpha,zeta,z12,z23,z34,z45,z51 )
%Borde edge sub nodes
%INPUT
%h
%alpha  slope of the outside contour edges
%zeta   outer contour nodes
%zij    subnodes along offst contour ij
%For border strip 12
s=size(z12);
%For border strip 23
s=size(z23);
%For border strip 34
s=size(z34);
%For border strip 45
s=size(z45);
%For border strip 51
s=size(z51);
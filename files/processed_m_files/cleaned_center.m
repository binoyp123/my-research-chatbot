function [ n,w] = center( z,h )
%Center region geometry
%INPUT
%z  corner nodes
%h  border height
%OUTPUT
%n(k)   # of border elements in each edge
%w(k)   width of middle border elements
%wi(k)  width of first border element
%wf(k)  width of last border element
%Edge length
%Comparison of facing edge pair length
%L(1)&L(5), L(2)&L(4), L(3),L(6)
%to identify longer edge in each pair
%Use the longer edge in each pair to determine the number of border
%elements
%Elongate h by a factor wfactor
wh=wfactor*h;
%border strip pair 1: L(1) & L(5)
Lt=LL(1)+eps;
nt=floor(Lt/wh);    %# of rectangles in the strip
nt=1;
%border strip pair 2: L(2) & L(4)
Lr=LL(2)+eps;
nr=floor(Lr/wh);
nr=1;
%border strip pair 3: L(3) & L(6)
C=LL(3)+eps; %add the small number eps  to avoid truncation
nc=floor(C/wh);
nc=1;
%assigh border element number for each edge
%Determine the border edge element width
%Determine the first & last corner element length
%{
%delta corner angle parameter
%}
function [ n,w] = center_g6( z,h )
%Center region geometry
%INPUT
%z(1,nside+1)   corner nodes
%h  border      height
%OUTPUT
%n(1,nside+1)   # of border elements in each edge
%w(1,nside+1)   width of middle border elements
%Edge length
%Comparison of facing edge pair length
%L(1)&L(5), L(2)&L(4), L(3)&L(6)&L(7)
%to identify longer edge in each pair
%Use the longer edge in each pair to determine the number of border
%elements
%Elongate h by a factor wfactor
wh=wfactor*h;
%border strip pair 1: L(1) & L(5)
Lr1=LL(1)+eps;
nr1=floor(Lr1/wh);    %# of rectangles in the strip
nr1=1;
%border strip pair 2: L(2) & L(4)
Lr2=LL(2)+eps;
nr2=floor(Lr2/wh);
nr2=1;
%border strip pair 3: L(3) & L(6)
C=LL(3)+eps; %add the small number eps  to avoid truncation
nc=floor(C/wh);
nc=1;
%assigh border element number for each edge
%Determine the border edge element width
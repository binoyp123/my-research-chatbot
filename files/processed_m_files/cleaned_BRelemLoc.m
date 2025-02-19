function [ xeE] = BRelemLoc(m,wi,w,wf,h)
%Node coordinates of local rectangular edge elements over a border strip
%For each element, the node start at left bottom and rotate clock-wise
% 2   3
%   5
% 1   4
%x=horizontal, y=vertical directions
%INPUT
%m         # of middle elements
%wi,w,wf    size of intial, middle and final elements (in y-direction)
%h          height of the all elements (in x-direction)
%OUTPUT
%xeE(j,n,i) j coordinates of the n-th node of i-th edge square elements
%           j=1:2; n=1:5 (5=center poiint); i=1:(m+2)
%Element width array
%y-coordinates array of the center points
%coordinates of 5 nodes of elements
xeE=zeros(2,5,(m+2));
%{
%}
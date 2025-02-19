function [ XL,YL,ZL,XT,YT,ZT,XC,YC,ZC ] = wingMotion(a, x0L,x0T,x0C,y0L,y0T,y0C,z0L,z0T,z0C,theta,phi,beta )
%INPUT
% a         rotation offset from the y-axis
% x0L,y0L,z0L   leading edge point on the wing-coordinate
% x0C,y0C,z0C   center point on the wing-coordinate
% x0T,y0T,z0T   trailing edge point on the wing-coordinate
% theta     pitching
% phi       roll
% beta      stroke plane angle
sb=sin(beta);
cb=cos(beta);
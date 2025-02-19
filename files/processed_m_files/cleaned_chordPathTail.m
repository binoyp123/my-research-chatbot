function [  ] = chordPathTail(t,e,c,a,beta,gMax,p,rtOff, U, V)
%INPUT Variables (all nondimentional)
% t         time
% e         stroke difference
% c         chord length
% a         rotation distance offset
% beta      stroke angle
% gMax      maximum rotation
% p         rotation velocity parameter
% rtOff     rotation timing offset
% U, V      ambient velocity
%==========================================================================
%LOCAL Variables
%Translational Motion
x0=-U*t+0.5*y*cos(beta);
z0=-V*t+0.5*y*sin(beta);
%Rotational Motion
gam=gMax*y;
%Edge positions for the composite motion
xle=x0+(a-0.5*c)*sin(beta-gam);
zle=z0-(a-0.5*c)*cos(beta-gam);
xte=x0+(a+0.5*c)*sin(beta-gam);
zte=z0-(a+0.5*c)*cos(beta-gam);
f=figure();
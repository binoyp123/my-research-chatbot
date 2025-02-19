function [ z ] = Camber2( x,y,c,l)
%Calculate z values of the wing, given (x,y)
%INPUT (can be all dimensional or all nondimensional)
% x(j),y(j) x, y coordinates of the node j
% l,c       span, chord lengths
% icamber   camber option
% acamber   camber amplitude
z=zeros(size(x));
z=acamber*(-(x/(0.5*c)).^2+1);
z=acamber*(-(y/l).^2+1);
z=acamber*(-(x/(0.5*c)).^2+1).*(-(y/l).^2+1);%This option is not used
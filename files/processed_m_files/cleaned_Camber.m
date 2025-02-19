function [ z ] = Camber( x,y)
%Calculate z values of the wing, given (x,y)
%INPUT ALL LENGTHS DIMENSIONAL
% x(j),y(j) x, y coordinates of the node j
% l_,c_       span, chord lengths
% icamber   camber option
% acamber   camber amplitude
z=zeros(size(x));
z=acamber*(-(x/(0.5*c_)).^2+1);
z=acamber*(-(y/l_).^2+1);
z=acamber*(-(x/(0.5*c_)).^2+1).*(-(y/l_).^2+1);%This option is not used
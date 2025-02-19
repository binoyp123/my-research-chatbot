function [ y ] = DcosUpTailB(t)
%Basic cos function (0<=t<=4) with a tail (4<=t<=8)
y=pi*sin(pi*t);
y=0;
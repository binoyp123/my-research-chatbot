function [ n,w,wi,wf,Lt,Lr,C ] = BStripElongated( lt,lr,c,delta,h )
%Width of the rectangular elements in the border strips
%# of rectangular elements on them is fixed to be determined by the # for the tip border
%
%INPUT
%lt     length of the tapered section
%lr     length of the rectangular section
%c      chord length of the lectangular section
%delta  half taper angle (radian)
%h      height of the border strip
%OUTPUT
%n(I)   # of rectangles in the strips
%w(I)   width of the multiple middle rectangular elements
%wi(I)  width of the first rec element
%wf(I)  width of the last rec element, where I=1:5
%Lt
%Lr
%C
altha=0.5*(pi-delta);
Lt=lt-h*(cot(delta)+cot(altha));
Lr=lr-h*(cot(altha)+1);
C=c-2.0*h;
%border strip 3
tmp=C/h+eps; %add the smallest number eps (machine epsilon) to avoid truncation
r=rem(C,h);
%border strip 1
%border strip 2
%border strip 4
%border strip 5
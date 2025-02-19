function [ n,w,wi,wf,Lt,Lr,C ] = BStrip( lt,lr,c,delta,h )
%Width of the rectangular elements in the border strips # of rectangular elements on them
%INPUT
%lt     length of the tapered section
%lr     length of the rectangular section
%c      chord length of the lectangular section
%delta  half taper angle (radian)
%h      height of the border strip
%OUTPUT
%n(I)   # of rectangles in the strip
%w(I)   width of the multiple middle rectangular elements
%wi(I)  width of the first rec element
%wf(I)  width of the last rec element, where I=1:5
%Lt
%Lr
%C
alpha=0.5*(pi-delta);
%Reduced outline length for the center region
Lt   =lt-h*(cot(delta)+cot(alpha));
Lr   =lr-h*(cot(alpha)+1);
C    =c-2.0*h;
%epsilon=1.0E-03; %a small number but gigger than the machine epsilon
%Elongate h by a factor wfactor
wh=wfactor*h;
%border strip 1
%tmp=Lt/wh+epsilon
Lt=Lt+eps;
%border strip 2
Lr=Lr+eps;
%border strip 3
C=C+eps; %add the small number eps  to avoid truncation
%border strip 4
%border strip 5
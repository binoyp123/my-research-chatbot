function [GAMAw,nXw,Xw]=tbaddWake(nXb,GAMAb,Xs,GAMAw,Xw)
%{
%}
%Add the wake vortex vector
%Add the newly shed vortices to the wake vortices
GAMAw=[GAMAw,GAMAb]; %increment in each step
s=size(GAMAw);
nXw=s(2);
%Add the location of the newly shed vorties to existing wake vortex locations
%Xw=Xw;
s=size(Xw);
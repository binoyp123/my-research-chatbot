function [  ] = g6( example )
%function [Xb,nXb,Nb,Xc,nXc,Nc  ] = g6Mesh(  )
%General 6-sided polygonal mesh with border strip
%{
%}
%The center region consists of two (semi) rectangular regions.
%The mesh consists of all four sided elements
nside=6;
mplot=1;  %mesh plot
nplot=0;  %node plot
%Ratio of border edge element width over height (h)
wfactor =4;
%Ratio of h over the chord length c
hfactor = 0.1;
%Open an Output File:
fid=fopen('output.txt','w');
%Example number
%    example=6;
%Coordinate shift default (Bring the origin to the wing base center)
dxi=0.0;
deta=0.0;
%Specify the outer contour for nside edges
alpha=[95,100,10, -70, -90];
alpha=pi*alpha/180.0;
l=[1,1,0.3,1,1];
%Give data for 5 lines
alpha=[90,90,0, -90,-90];
alpha=pi*alpha/180.0;
l=[1,1,1,1,1];
dxi=-0.5;
deta=0.0;
%Give data for 4 lines
alpha=[95,100,-5, -90 -100];
alpha=pi*alpha/180.0;
l=[1,1,0.5,0.5,0.75];
%Give data for 4 lines
alpha=[170,100,-5, -90 -100];
alpha=pi*alpha/180.0;
l=[0.5,1,1,0.5,0.25];
%Give data for 4 lines
alpha=[135,100,-5,-80, -90];
alpha=pi*alpha/180.0;
l=[1,0.25,1,0.25,0.5];
%Give data for 4 lines
alpha=[120,100,-20,-60,-90];
alpha=pi*alpha/180.0;
l=[0.5,0.75,0.5,0.5,0.25];
%Give data for 5 lines
alpha=[95,90,-10,-95,-100];
alpha=pi*alpha/180.0;
l=[1.0,1,0.6,0.9,0.9];
dxi=0.0;
deta=0.2;
%Determine the length and slope of the 6th line using the closed contour condition
lexp=l.*exp(1i*alpha);
rlexp=sum(real(lexp));
ilexp=sum(imag(lexp));
%Determine the coordinates of the nodes
lexp=l.*exp(1i*alpha);
tmp=zeros(1,nside+1);
zeta=complex(tmp,tmp);
xi=real(zeta);
eta=imag(zeta);
%Determine the representative chord length and span length
%c=max(abs(zeta(2)-zeta(5)),abs(zeta(3)-zeta(4))); %This choice should be modified depending on l and alpha.
c   =max(xi)-min(xi);
span=max(eta);
%height of the offset border relative to the chord length
h=hfactor*c;
%Internal offset contour
%Center region geometry
%Center contour sub nodes (used to determine center elements)
%Border contour sub nodes
%Border elements
%Shift
%Center elements
%Shift
a=alpha*180.0/pi;
%add the j=3 component to Xb, Xc
s=size(Xb);
s=size(Xc);
%Unit normal to the element
Nb=zeros(3,nXb);
Nc=zeros(3,nXc);
%put span, c and h into the global
l_=span;
c_=c;
h_=h;
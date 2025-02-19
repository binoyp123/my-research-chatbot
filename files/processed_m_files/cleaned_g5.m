function [  ] = g5(  )
%function [Xb,nXb,Nb,Xc,nXc,Nc  ] = g5Mesh(  )
%General 5-sided polygonal mesh with border strip
%The center region consists of the tapered region near the wing base and
%a (semi) rectangular region near the tip.
%The mesh consists of all four sided elements
cplot=0;
nplot=0;
mplot=1;
%Ration of border edge element width over height (h)
wfactor =3;
%Ratio of h over the chord length c
hfactor = 0.05;
%Open an Output File:
fid=fopen(['output.txt'],'w');
%Example number
example=6;
%Specify the outer contour for 4 edged
itaper=1;
alpha=[135,90,0, -90, -135];
alpha=pi*alpha/180.0;
l=[1,1,-2*cos(alpha(1)),1,1];
%consistency check: should be zero
itaper=1;
%Give data for 4 lines
alpha=[135,100,5, -45];
alpha=pi*alpha/180.0;
l=[1,0.8,0.5,1];
itaper=1;
%Give data for 4 lines
alpha=[95,100,-5, -45];
alpha=pi*alpha/180.0;
l=[1,0.5,0.5,0.75];
itaper=1;
%Give data for 4 lines
alpha=[170,100,-15, -90];
alpha=pi*alpha/180.0;
l=[0.5,1,1,0.5];
itaper=0;
%Give data for 4 lines
alpha=[180,100,-5,0, -180];
alpha=pi*alpha/180.0;
l=[0.5,1,1,0,0.5];
itaper=1;
%Give data for 4 lines
alpha=[150,100,-20,-60];
alpha=pi*alpha/180.0;
l=[1,0.75,1.5,0.75];
%Determine the length and slope of the 5th line using the closed contour condition
lexp=l.*exp(1i*alpha);
rlexp=sum(real(lexp));
ilexp=sum(imag(lexp));
%Determine the length and slope of the 4th line using the closed contour condition
lexp=l.*exp(1i*alpha);
rlexp=real(lexp(1)+lexp(2)+lexp(3)+lexp(5));
ilexp=imag(lexp(1)+lexp(2)+lexp(3)+lexp(5));
%Determine the coordinates of the nodes
lexp=l.*exp(1i*alpha);
tmp=zeros(1,6);
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
%Center elements
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
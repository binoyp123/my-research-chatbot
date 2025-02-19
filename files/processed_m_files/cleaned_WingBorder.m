function [ Xb,nXb,Nb,Lt,Lr,C,n,wi_1 ] = WingBorder( lt,lr,delta)
%Mesh for tapered/nontapered rectangular wings
%INPUT
%lt     length of the tapered section
%lr     length of the rectangular section
%delta  half taper angle (radian)
%OUTPUT
%Xb(j,n,i)  entire shed rectangular edge elements
%nXb        # of border rectangukar shed elements
%Nb(j,i)   unit normal vector for the rectangular element
%Lt
%Lr
%C
%n(I)       # of rectangles in the border strip
%wi_1
%%%%%%%%%%BORDER STRIPS%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
N=5; %# of border strips
h_=hfactor*c_;  %height of the border strip
c=c_;           %dimensional chord length
h=h_;           %dimensional border height
%Global position of the origin of the border strip systems
sdel=sin(delta);
cdel=cos(delta);
%Width of the rectangular elements in the border strips & # of rectangular elements on them
sumn=sum(n);
nXb=sumn;  %No corner elements
Xb=zeros(2,5,nXb);
Nb=zeros(3,nXb);
inf=0;
%I=1;
%Xb(:,5,  (inf+1))=0.25*(Xb(:,1,(inf+1))+Xb(:,2,(inf+1))+Xb(:,3,(inf+1))+Xb(:,4,(inf+1)));
inf=inf+(  n(I));
ini=inf-(  n(I))+2;
%Xb(:,5,inf)=0.25*(Xb(:,1,inf)+Xb(:,2,inf)+Xb(:,3,inf)+Xb(:,4,inf));
%Introduce the camber [size(Xb)=(3,4,nXb)]
%Unit normal to the element [size(uNb)=(3,nXb]
%Centroid [size(Xb)=(3,5,nXb)]
wi_1=wi(1);
function [ ] = s5(  )
%function [ Xb,nXb,Nb,Xc,nXc,Nc ] = s5Mesh(  )
%Symmetrical tapered mesh
%GLOBAL VARIABLES
%global mplot  fid  folder
%How to specify the file path:
folder = '_fig/';
%Open an Output File:
fid=fopen([folder 'output.txt'],'w');
%Airfoil Mesh plot: mplot mesh plot 0 (no), 1(yes), 2(Compare equal arc and equal abscissa mesh points)
mplot = 1; mplot_sub=0;
%RECTANGULR ELEMENTS COUNT
%nXb     # of shed edge elements
%nXc     # of center elements
%==========WING GEOMETRY
%lt_ 	tapered section wing span (cm)
%lr_    square section wing span (cm)
%bang_  base angle (deg)
%c_     chord length of the rectangular section
%       = 2*lt_sin(bang): cannot be specified independeltly
itaper = 1; %assume a tapered wing by default
lt_=0.5;
lr_=2.0;
bang_=90;   %90 Produces a rectangular wing
itaper = 0;
bang=pi*bang_/180.0;
%Chord length
c_=2.0*lt_*sin(bang);
%Span length
l_=    lt_*cos(bang)+lr_;
%Height of border strip
hfactor=0.1;   %ratio of h_ over c_
%use 0.1 for high aspect ration wing (chord < span)
%use 0.05 or smaller for low aspect ration wing (chord > span)
%Width of the border ectangular elements
wfactor = 3; % ratio of w (element width) over h (height)
%Fixed # of border elements: ielong 0 (no) 1 (yes)
%Use he same nunber of divisions as that for the tip border strip
ielong=0;
%Center Elements
%{
%If ielong=0 then use the number of the border strip, n(I), to create rectangular grid
%Tapered section
nCelmti=n(3);  %# of major division in x-direction
nCelmtj=n(1);  %# of major division in y-direction
%Rectangular section
nCelmri=n(3);  %# of square elements in x-direction
nCelmrj=n(2);  %# of square elements in y-direction
%If ielong=1 then use n(3) to create rectangular grid
%Tapered section
nCelmti=n(3);  %# of major division in x-direction
nCelmtj=n(3);  %# of major division in y-direction
%Rectangular section
nCelmri=n(3);  %# of square elements in x-direction
nCelmrj=n(3);  %# of square elements in y-direction
%}
%Camber direction: 0(no camber), 1(x-direction), 2(y-direction), 3(both directions)
icamber = 0;
acamber=0.2;    %Camber amplitude
%Elemnts in the border strips
%Xb(j,n,i)    Borger elements
%nXb          # of border elements
%Nb(j,i)      Unit normal
%Elements in the center region
%Xc(j,n,i)    Center elements
%nXc          # of center elements
%Nc(j,i)      Unit normal
%Plot mesh
f2=figure();
%title(['lt= ',num2str(lt_),'   lr= ',num2str(lr_), '   bang= ',num2str(bang_),'   hfactor= ', num2str(hfactor), '   wfactor= ', num2str(wfactor)]);
f3=figure();
%title(['lt= ',num2str(lt_),'   lr= ',num2str(lr_), '   bang= ',num2str(bang_),'   hfactor= ', num2str(hfactor), '   wfactor= ', num2str(wfactor)]);
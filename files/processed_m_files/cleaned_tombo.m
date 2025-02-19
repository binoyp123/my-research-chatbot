function [  ] = tombo()
%{
td = 1(TOPDOWN), 2(DOWNUP)
nhp= 4, 8 (# of half-periods for sinusoidal+tail)
w = 1(right), 2(left) wing
%}
%{
%}
%{
%}
%{
%}
%GLOBAL VARIABLES
%==========================================================================
%Time specification: 1(multiple times) 2(time marching)
stime = 2;
%Time increment and # of time steps
dt = 0.1; %For higher values of p, use smaller value of dt
nstep = 4;
%DEBUGGING PARAMETERS======================================================
%How to specify the file path:
folder = '_fig/';
%Linear equation solver: 0 (forward elim/backward sub), 1(backslash)
solver = 0;
%System of equations debug (print VN,Vnc,GAMA): 0(no print), 1(print)
idebg = 1;
%Chord path plot: 0(no plot), 1(chord path plot)
iplot = 1;
%Airfoil Mesh plot: mesh plot 0 (no), 1(yes)
mplot = 1;
%Airfoil normal velocity plot: vplot 0(no), 1(yes)
vplot = 1;
%Plot gamma
gplot = 1;
%Wake Vortex plot: 0(n0), 1(yes)
wplot = 1;
%Open an Output File:
fid=fopen([folder 'output.txt'],'w');
%===========BODY GEOMETRY==================================================
%# of wings
twing=4;
nwing=twing/2;
%Body angle (degree)
delta_=0;
%Wing location (cm): _f (fore wing), _r (rear wing)
b_f= -1.5; b_r=1.5; %Make sure b_f<=0, b_r>=0
%===========WING GEOMETRY:=================================================WING-FIXED DESCRIPTION OF THE WING
%right & left wings have the same geometry
%{
%}
%Front and Rear wings have different geometry
% FRONT WING: with subscriot _r
% xb_f(j,n,i)   Border element coordinates
% nxb_f         # of border elements
% nb_f(j,i)     Unit normal to the border elements
% xc_f(j,n,i)   Center element coordinates
% nxc_f         # of center elements
% nc_f(j,i)     Unit normal to the center elements
% l_f           span
% c_f           chord
% h_f           border height
% REAR WING: with subscriot _r
% xb_r(j,n,i)   Border element coordinates
% nxb_r         # of border elements
% nb_r(j,i)     Unit normal to the border elements
% xc_r(j,n,i)   Center element coordinates
% nxc_r         # of center elements
% nc_r(j,i)     Unit normal to the center elements
% l_r           span
% c_r           chord
% h_r           border height
%Wing clearance check
%======WING MOTION PARAMETERS: different between
%front-right(1), front-left(2), rear-right(3), rear-left(4),wings==========
% stroke angles (degrees)
% a_ rotation axis offset (cm)
% beta = stroke plane angle (degrees) wrt the body axis
% f_ = flapping frequency (1/sec)
% gMax = max rotation (degrees) amplitude: actual rotation is 2*gMax
%{
p = rotation speed parameter (nondimentional): p>=4
%}
%{
rtOff=rotation timing offset (nondim):
%}
%{
tau = phase shift for the time (nondim): 0 <= tau < 2
%}
%Motion path parameter: mpath
%{
%}
%==========FLUID PARAMETERS
%Air density
rho_=0.001225; %g/cm^3
%Ambient velocity (cm/sec, assume constant)
%Can be interpreted as the flight velocity when the wind is calm
%Distance between source and observation points to be judged as zero
RCUT=1.0e-10;
%PRINT INPUT DATA==========================================================
%==========================================================================
%Nondimentionalize the input variables
%Non-dimensionaized by d_(1) [stroke plane length of the r-front wing]
% c,h,a,d
%Non-dimensinalized by its own motion
% e (p, rtOff, tau: given non-dimentionally as inputs)
%{
%}
%Cut off distance off the extension of a vortex line
%Velocity evaluation points within this distance from the vortex line
%and/or its extension is set to zero. See mVORTEX.m for its application
LCUT=0.1*h(1);
%Comparison of flapping, pitching and air speeds
air=sqrt(U_(1)^2+U_(2)^2+U_(3)^2);
%Flapping/Air Seed Ratio
fk=2*f_.*d_/air;
%Pitch/Flapping Speed Ratio
r=0.5*((0.5*c+a)./d).*(p/t_).*(gMax./f_);
%Pitch/Air Speed Ratio
k=fk.*r;
%Pitch/Flapping Speed Ratio
r=0.5*((0.5*c+a)./d).*(p/t_).*(gMax./f_);
%{
%}
%Front right wing
%Rear right wing
%{                                                                            %WING-FIXED DESCRIPTION OF THE WING CONTINUES
%INITIALIZATION
%Initialize the wake vortex magnitude array
%Start with the size at istep=1 (will be incremented by nxb_m each step)
GAMw_f=zeros(nwing,nxb_f); GAMw_r=zeros(nwing,nxb_r);
%Initialize the total wake vortex number
nxw_f = 0; nxw_r = 0;
%Initialize the wake vortex location array (after convection)
%Start with the size at istep=1 (will be incremented by nxb_m each step)
Xw_f = zeros(3,4,nxb_f,nwing); Xw_r = zeros(3,4,nxb_r,nwing);
%Initialize the shed vortex location array
Xs_f = zeros(3,4,nxb_f,nwing); Xs_r = zeros(3,4,nxb_r,nwing);
%Initialize the linear and angular impuse array
tmp=zeros(3,nstep,nwing);
limpa_f=tmp;    limpa_r=tmp;
aimpa_f=tmp;    aimpa_r=tmp;
limpw_f=tmp;    limpw_r=tmp;
aimpw_f=tmp;    aimpw_r=tmp;
%Normal velocity on the wing due to the wing motion & wake vortices
Vnc_f =zeros(nwing,nxt_f); Vnc_r =zeros(nwing,nxt_r);
Vncw_f=zeros(nwing,nxt_r); Vncw_r=zeros(nwing,nxt_f);
%sub-matrix for the non-penetration condition (self-terms)
MVNs_f=zeros(nxt_f,nxt_f,nwing);   MVNs_r=zeros(nxt_r,nxt_r,nwing);
%Initialize velocity value matrices
VBW_f=zeros(3,4,nxb_f,nwing); VBW_r=zeros(3,4,nxb_r,nwing);
%{
NC_m=NC_T_m inside tblrmassL2DT.m
%}
Xc_f=zeros(3,4,nxc_f,2);    Xc_r=zeros(3,4,nxc_r,2);
Xb_f=zeros(3,4,nxb_f,2);    Xb_r=zeros(3,4,nxb_r,2);
Xt_f=zeros(3,4,nxt_f,2);    Xt_r=zeros(3,4,nxt_r,2);
XC_f=zeros(3,  nxt_f,2);    XC_r=zeros(3,  nxt_r,2);
NC_f=zeros(3,  nxt_f,2);    NC_r=zeros(3,  nxt_r,2);
%END INITIALIZATION
%Time variable to be considered
%Plot Chord Path (and time history of flapping & rotation)
tmax=dt*50;
t=0:dt:tmax;
%Use only mPath=0 and 3
mPath=3;
u=U(1); v=U(2); w=U(3);
%FRONT RIGHT wing
AZ=-120; %horizontal rotation (from y-axis)
EL=30;   %vertical elevation (from horizontal)
%FRONT LEFT wing
AZ=-60;
EL=30;
%REAR RIGHT wing
AZ=-120; %horizontal rotation (from y-axis)
EL=30;   %vertical elevation (from horizontal)
%REAR LEFT wing
AZ=-60;
EL=30;
%{
AZ=-120; %horizontal rotation (from y-axis)
EL=30;   %vertical elevation (from horizontal)
AZ=-60;
EL=30;
%}
td=1;    %TOPDOWN
%td=2;    %DOWNUP
nhp=8;   %8 half periods=2 periods sinusoital+2 periods tail
%nhp=4;   %4 half periods=1 period  sinusoital+  period  tail
%FRONT RIGHT wing
AZ=-120; %horizontal rotation (from y-axis)
EL=30;   %vertical elevation (from horizontal)
%FRONT LEFT wing
AZ=-60;
EL=30;
%REAR RIGHT wing
AZ=-120; %horizontal rotation (from y-axis)
EL=30;   %vertical elevation (from horizontal)
%REAR LEFT wing
AZ=-60;
EL=30;
%{
GAMw_1          = [0              ];   no wake vortex
C=convected
GAMw_1=[( )]                               No wake vortex
GAMAf_1=[GAMAb_1]                           Vortex to be conv/shed
Xf_1   =[Xb_1 ]                             Border elements
Xw_1   =[Xs_1 ]                             Convect Xb_1
GAMw_2=[GAMAb_1]                           Wake vortex
GAMAf_2=[GAMAb_1, GAMAb_2]                  Vortex to be conv/shed
Xf_2   =[Xw_1  , Xb_2 ]                     Wake and Border elements
Xw_2   =[XwC_1 , Xs_2 ]                     Convect Xf_2
GAMw_3=[GAMAb_1, GAMAb_2]                  Wake vortex
GAMAf_3=[GAMAb_1, GAMAb_2, GAMAb_3]         Vortex to be conv/shed
Xf_3   =[Xw_2  , Xb_3 ]=[XwC_1 ,Xs_2 ,Xb_3] Wake and Border elements
Xw_3   =[XwC_2 , Xs_3 ]=[XwCC_1,XsC_2,Xs_3] Convect Xf_3
%}
%{
MVN=| MVNs_11, MVNs_12, MVNs_13, MVNs_14 |
%}
%FRONT WING: MVNs_f(:,:,1)=MVNs_11, MVNs_f(:,:,2)=MVNs_22
%REAR WING: MVNs_r(:,:,1)=MVNs_33, MVNs_r(:,:,2)=MVNs_44
%Start time marching
t=(istep-1)*dt; %Use (istep-1) to start with time=0
%Get wing motion parameters
%FROM WING-FIXED TO SPACE-FIXED
%{
NC_m=NC_T_m inside dplrmassL2DT.m
%}
%FRONT WING
%REAR WING
%Velocity of the wing
%FRONT WING
%xC_f=xC_f(j,i)  coord of the total collocation points on the w-f sys
%XC_f(j,i)       coord of the total collocation points in the s-f sys
%REAR WING
%xC_r=xC_r(j,i)  coord of the total collocation points on the w-f sys
%XC_r(j,i)       coord of the total collocation points in the s-f sys
%nxw=nxb*(istep-1)
%Normal vel on each airfoil by front & rear, right & left wake vortices
%For each wing, there are 4 wake vortex contributions
%Produces zero Vncw_m for step 1
%FRONT WING
%REAR WING
%Calculation of the time-dependent sub-matrices MVNs_ij (i~=j)
%target wing=1, source wing=2
%target wing=1, source wing=3
%target wing=1, source wing=4
%target wing=1, source wing=2
%target wing=1, source wing=3
%target wing=1, source wing=4
%target wing=1, source wing=2
%target wing=1, source wing=3
%target wing=1, source wing=4
%target wing=1, source wing=2
%target wing=1, source wing=3
%target wing=1, source wing=4
%Assemble the total matrix using MVNs_f(:,:,2),MVNs_r(:,:,2),MVNs_ij(:,:)
%Solve the system of equations
%Split GAMA into 4 parts
%FRONT WING
%REAR WING
%Plot GAMA at the collocation points of the elements
%using the unit normal direction: positive up and negative down
%FRONT WING
%REAR WING
%Plot locations, Xb & Xw, of border & wake vortices (space-fixed sys)
%FRONT WING
%REAR WING
%Calculate impiulses in the body-translating system
%Include all of the bound vortices and wake vortices.
%For istep=1, there are no wake vortices.
%FRONT WING
%REAR WING
%Extract GAMAb (border & shed ) from GAM
%FRONT WING
%REAR WING
%VELOCITY OF THE BORDER AND WAKE VORTICES TO BE SHED OR CONVECTED======
%{
%}
%FRONT WING
%REAR WING
%Border element veocity due to the total wing elements: self-influence
%VBTs_m(j,n,ixb,w);  vel on wing w due to total elem on wing w
%FRONT WING
%REAR WING
%Border element veocity due to the total wing elements: cross-influence
%target wing=1, source wing=2
%target wing=1, source wing=3
%target wing=1, source wing=4
%target wing=2, source wing=1
%target wing=2, source wing=3
%target wing=2, source wing=4
%target wing=3, source wing=1
%target wing=3, source wing=2
%target wing=3, source wing=4
%target wing=4, source wing=1
%target wing=4, source wing=2
%target wing=4, source wing=3
%Assemble the total border element velocity due to two wings using
%VBTs_f(j,n,i,w),VBTs_r(j,n,i,w), VBTs_ij(j,n,i)
%VBT_f(j,n,ixb_f,w);  vel on front wing w due to total elem on 4 wings
%VBT_r(j,n,ixb_r,w);  vel on rear wing w due to total elem on 4 wings
%Velocity involving the wake
%Velocity of the border element due to the wake vortices(istep >1)
%VBW_f(j,n,ixb,w):  vel on front wing w due to 4 wake elements
%VBW_r(j,n,ixb,w):  vel on rear  wing w due to 4 wake elements
%VBW_m=0, by initialization, for istep=1
%FRONT WING
%REAR WING
%Velocity of the wake elements due to the total wing vortices(istep >1)
%VWT_f(j,n,ixw,w):  vel on front wake w due to total wing elements from 4 wings
%VWT_r(j,n,ixw,w):  vel on rear  wake w due to total wing elements from 4 wings
%FRONT WINGs
%REAR WINGs
%Velocity of the wake elements due to the wake elements(istep >1)
%VWW_f(j,n,ixw,w):  vel on front wake w due to 4 wake elements
%VWW_r(j,n,ixw,w):  vel on rear  wake w due to 4 wake elements
%FRONT WINGs
%REAR WINGs
%END VELOCITY CALCULATION==============================================
%Shed the border vortex elements
%FRONT WINGs
%REAR WINGs
%Convect wake vortices
%FRONT WINGs
%REAR WINGs
%nxw=nxb*(istep)
%Add shed vortices to wake vortex
%FRONT WINGs
GAMw_f=GAMAb_f;
nxw_f=nxb_f;
Xw_f=Xs_f;
%REAR WINGs
GAMw_r=GAMAb_r;
nxw_r=nxb_r;
Xw_r=Xs_r;
%FRONT WINGs
%REAR WINGs
%Calculate the force and moment on the airfoil
%do nothing
%close opened files
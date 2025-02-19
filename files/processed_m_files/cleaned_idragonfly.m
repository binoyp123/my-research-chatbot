function [  ] = idragonfly( )
%Two wings flapping independeltly
%Thin 2D airfoil by the discrete vortex method is used
%Motion path consists of the flapping and rotation, which is specified
%   based on the dragonfly morphology and flight data.
%Formulate in the space-fiee coordinate system based on igVortex.m
%Version 1, October, 23, 2014 by Mitch Denda
%   impulses forces and moment is calculated in the body-translating system
%Version 2, November 23, 2015
%   Automatic determination of time increment based on m and p
%   Adopt vortex core model
%   Velocity of the body-translating systen is set to (-U,-V)
%       (setting this zero gives a different outcome; reconsider this
%       possibility)
%Version 2.1, April 5, 2016
%   Added the function to calculate the avarage forces and moment
%Version 2.2 June 24, 2016
%   The average forces are passed to the main and printed in the main
%==========================================================================
%GLOBAL VARIABLES
%Impulses wrt body-translating system
%Impulses wrt forward wing translating system
%Impulses wrt rear wing translating system
%File manupulation=========================================================
%How to specify the file path:
folder = 'fig/';
%Open an Output File:
fid=fopen([folder 'output.txt'],'w');
%How to specify the file path:
folder = 'fig/';
%DEBUGGING PARAMETERS======================================================
%Airfoil Mesh plot: mplot mesh plot 0 (no), 1(yes), 2(Compare equal arc and equal abscissa mesh points)
mplot = 0; %Keep this in the production phase
%Airfoil normal velocity plot: vplot 0(no), 1(yes)
vplot = 0; %Keep this in the production phase
%Wake Vortex plot: 0(n0), 1(yes)
wplot = 1;  %Keep this for the production run
%Velocity plot by avoiding source and observation points coincidence:
%zaoid: 0 (no, faster), 1(yes, slower)
zavoid = 0;
%zavoid = 1 %Use If the vllocity plot shows blowup, somewhere
%Velocity field plot: 0 (no), 1 (yes)
vfplot=0; %Use this in the production phase to save memory and sturage
%vfplot = 1: % Use only for selective cases to be shown to the audience
%Around which wing to plot the velocity field: 1 (forewing), 2(rear wing)
vplotFR=1;  %The original meshing is done in the local wing-fixed system for the forward wing
%vplotFR=2;  %The original meshing is done in the local wing-fixed system for the rear wing
%Velocity contour plots in space-fixed system
%Used as the 4th argument of 'contourf' to control the range of velocity
%space-fixed velocity plot: svInc (increment), svMax (max velocity)
svInc=0.025;
svMax=2.50;
svCont=0.0:svInc:svMax;
%wing-fixed  velocity plot: wvInc (increment), wvMax (max velocity)
wvInc=0.1;
wvMax=7.0;
wvCont=0:wvInc:wvMax;
%Use of svCont and wvCont: ivCont = 0 (no), 1 (yes)
%   The velocity range varies widely depending on the input parakmeters
%   It is recommended to respecify this when input parameters are changed
ivCont = 0;
%Frequency of velocity plots: vpFreq
vpFreq=1;
%END DEBUGGING PARAMETERS==================================================
%INPUT VARIABLES===========================================================
%==========BODY GEOMETRY
nwing=2; %# of wings
%Body angle (degree)
delta_=0;
%Wing location (cm): (1) fore wing, (2) rear wing
% b_(1)>=0 and b_(2)<=0 will place fore-wing
% back and hind-wing front. Tis trick can be
% used to give a reference quantities to the
% wing in the back, which still remain as the
% wing 1 that now rests in the back.
%b_(1)= -0.0; b_(2)=0.0; %Use this for clap and fling
%==========WING GEOMETRY
% l_ = wing span (cm) for the actual wings in 3D
% Reduce the wing span by half to be used for 2D modeling
l_=0.5*l0_;
% c_ = chord length (cm)
%    calculated whie specifying the airfoil shape
%# of data points that define the airfoil shape
n=101;
%Read airfoil shape data and determine the chord length
%Here, use a formula to spefify the airfoil shape
%Camber options are not ellaborated yet
%OR give arrays x_ and y_ from NASA airfoil data base
%# of vortex points on the airfoil
m=5;
%==========WING MOTION PARAMETERS
% stroke angles (degrees)
% a_ rotation axis offset (cm)
% beta = stroke plane angle (degrees) wrt the body axis
% f_ = flapping frequency (1/sec)
% gMax = max rotation (degrees) amplitude: actual rotation is 2*gMax
%gMax_(1)   = 15;    gMax_(2)   = 60;
% p = rotation speed parameter (nondimentional): p(i)=p_(i)/(0.5*T_(i))
% (Note p(1)=p_(1)/t_ref, but p(2) ~=(not equal)p_(2)/t_ref, wherere t_ref is the rference time)
%   p>=4
% rtOff = rotation timing offset (nondimentional): rtOff(i)=rtOff_(i)/(0.5*T_(i))
% (Note rtOff(1)=rtOff_(1)/t_ref, but rtOff(2)~=rtOff_(2)/t_ref, wherere t_ref is the rference time)
%   rtOff<0(advanced), rtOff=0 (symmetric), rtOff>0(delayed)
%   -0.5<rtOff<0.5
% tau = phase shift for the time: tau(i)=tau_(i)/(0.5*T_(i))
% (Note tau(1)=tau_(1)/t_ref, but tau(2)~=tau_(2)/t_ref, wherere t_ref is the rference time)
%   0(start from TOP and down), 0<tau<1(in between, start with DOWN STROKE),
%   1(BOTTOM and up), 1<tau<2(in between, start with UP STROKE), 2(TOP):
%   0 <= tau < 2
%Motion path parameter: mpath 0(no tail), 1 (DUTail; 2eriods), 2(UDTail; 2 periods),
%3(DUDUTail; 4 periods), 4(UDUDTail; 4 periods)
%==========FLUID PARAMETERS
%Air density
rho_=0.001225; %g/cm^3
%ambient velocity (cm/sec, assume constant)
%Can be interpreted as the flight velocity when the wind is calm
U_= 100.0;
V_= 0.0;
%Time increment and # of time steps option 0(manually specify),%1(automatic, recommended)
%itinc=0; %manually specify the time increment
itinc=1;  %Specify nperiod (# of periods) below
%Distance between the source and the observation point to be judged as zero
eps=0.5E-06;
%Vortex core model (Modified Biot-Savart equation): 0(no), 1(yes)
ibios=1;
%==========================================================================
%PRINT INPUT DATA==========================================================
%fprintf(fid,'nstep = %4d dt = %6.3f\n',nstep,dt);
%==========================================================================
%Nondimentionalize the input variables
%period ratio: rt(i)=T_(1)/T_(i)
%Threshold radius for modified Biot-Savart equation
DELTA=0.5*c/(m-1);  %distance between the collocation point and the vortex point on the wing
%not to be confused with the body angle delta
q=1.0;   %multiplier 0 < q <= 1
DELTA=q*DELTA;
DELta=min(DELTA);   %select smaller value of DELTA
%Time increment
dt = 0.1;       %0.025 (for m=21)
nstep = 21;     %81    (for m=21)
nperiod=1; %# of period to calculate (default=1)
%select smaller of dtC=c(i)/(m-1), and the smaller of dtP=0.1*(4/p(i)
%and further smaller of dtC and dtP.
dt= min(min(c/(m-1), 0.1*(4./p))); %4/p = duration of pitch
nstep=nperiod*ceil(2/dt);  % One period=2(nondimensional)
%Comparison of flapping, pitching and air speeds
air=sqrt(U_^2+V_^2);
%Flapping/Air Seed Ratio
fk=2*f_.*d_/sqrt(U_^2+V_^2);
%Pitch/Flapping Speed Ratio
r=0.25*(c_./d_).*(p/t_).*(gMax./f_);
%Pitch/Air Speed Ratio
k=fk.*r;
%Pitch/Flapping Speed Ratio
r=0.25*(c_./d_).*(p/t_).*(gMax./f_);
%Generate the vortex and collocation points on the airfoil
m=mNew;
%INITIALIZATION
%Initialize the wake vortex magnitude array
% GAMAw(i,1:2) step 1, GAMAw(i,3:4) step 2, GAMAw(i,5:6) step 3, ...
% Leading edge: odd components, Trailing edge: even components
GAMAw=zeros(nwing,2*nstep);
%Initialize the free vortex magnitude array
%This is the vortex to be shed or convected
%GAMAf=zeros(2,2*nstep);
%Initialize the total wake vortex sum
sGAMAw = zeros(1,nwing);
%Initialize the total wake vortex number
iGAMAw = zeros(1,nwing);
%Initializing the # of vortices to be convected or shed
iGAMAf = zeros(1,nwing);
%Initialize the free+wake vortex location array (before convection)
% ZF(i,1:2) step 1, ZF(i,3:4) step 2, ZF(i,5:6) step 3, ...
% Leading edge: odd components, Trailing edge: even components
temp = zeros(nwing,2);
ZF = complex(temp,temp);
%Initialize the wake vortex location array (after convection)
% ZW(i,1:2) step 1, ZW(i,3:4) step 2, ZW(i,5:6) step 3, ...
% Leading edge: odd components, Trailing edge: even components
ZW = complex(temp,temp);
%This is further transformed into a new body-fixed coordinate system
%Initialize the linear and angular impuse array
tmp=zeros(nwing,nstep);
Limpulseb=complex(tmp,tmp) ; Aimpulseb=tmp ; Limpulsew=complex(tmp,tmp) ; Aimpulsew=tmp;
LimpulsebF=complex(tmp,tmp); AimpulsebF=tmp; LimpulsewF=complex(tmp,tmp); AimpulsewF=tmp;
LimpulsebR=complex(tmp,tmp); AimpulsebR=tmp; LimpulsewR=complex(tmp,tmp); AimpulsewR=tmp;
%Initialize the translational velocity of F/R wings
LDOT=zeros(nwing,nstep); HDOT=zeros(nwing,nstep);
%Normal velocity on the wing due to the wing motion & wake vortices
VN =zeros(nwing,m-1);
VNW=zeros(nwing,m-1);
%sub-matrix for the non-penetration condition matrix
MVNs=zeros(m,m,nwing);
%time marching=============================================================
%Vortex convection Time history sample (for each wing; index i is omitted)
%For examplem use GAMA_1(1), ZV_1(1) instead of GAMA_1(i,1), ZV_1(i,1)
%
%step 1: iGAMAw_1=0, iGAMAf_1=2
%GAMAw_1 = [0         , 0          ]; no wake vortex
%GAMAf_1 = [GAMA_1(1) , GAMA_1(m)  ]; vortex to be convected or shed
%ZF_1  = [ZV_1(1), ZV_1(m) ] = [ZF(1), ZF(2)]; leading and trailing edges
%ZW_1  = [ ZW_1(1)  ,  ZW_1(2)   ]; Convect ZF_1
%step 2: iGAMAw_2=2, iGAMAf_2=4
%GAMAw_2=GAMAf_1=[GAMA_1(1) , GAMA_1(m) ]; wake vortex
%GAMAf_2=[GAMA_1(1) , GAMA_1(m), GAMA_2(1) , GAMA_2(m) ]; vortex to be convected or shed
%ZF_2  = [ZW_1(1)  , ZW_1(2) , ZV_1(1), ZV_1(m) ]
%      = [ ZF_2(1)  ,  ZF_2(2) ,  ZF_2(3)  ,  ZF_2(4)  ]
%ZW_2  = [ ZW_2(1)  ,  ZW_2(2) ,  ZW_2(3)  ,  ZW_2(4)  ]; Convect ZF_2 in the current coord system
%step 3: iGAMAw_3=4, iGAMAf_3=6
%GAMAw_3=GAMAf_2=[GAMA_1(1) , GAMA_1(m), GAMA_2(1) , GAMA_2(m) ]; wake vortex
%GAMAf_3=[GAMA_1(1) , GAMA_1(m), GAMA_2(1) , GAMA_2(m), GAMA_3(1) , GAMA_3(m) ]; vortex to be convected or shed
%ZF_3  = [ZW_2(1)  , ZW_2(2) , ZW_2(3)  , ZW_2(4) , ZV_1(1), ZV_1(m) ]
%      = [ ZF_3(1)  ,  ZF_3(2) ,  ZF_3(3)  ,  ZF_3(4) ,  ZF_3(5)  ,  ZF_3(6)  ]
%ZW_3  = [ ZW_3(1)  ,  ZW_3(2) ,  ZW_3(3)  ,  ZW_3(4) ,  ZW_3(5)  ,  ZW_3(6)  ]; Convect ZF_3 in the current coord system
%Setup the matrix MVN for the nonpenetration condition
%MVN=| MVNs_11, MVNs_12 |, where MVNs_ij are  (m x m) submatrices.
%    | MVNs_21, MVNs_22 |
%MVNs_11 and MVNs_22 are time independent; calculated once at the start and stored
%MVNs_12 and MVNs_21 are time dependent; calculated at each time
%%%CALCULATION OF MVNs_11 and MVNs_22
%Use the wing-fixed coordinate system to calcuate the sub-matrix coefficients.
%The sub-matrix coefficients obtained using the global system are identical to
%these and remain constant throughout the time steps.
%Generate a cartesian mesh in the forward wing-fixed system for velocity plot
%Generate a cartesian mesh in the rear wing-fixed system for velocity plot
%Start time marching
t=(istep-1)*dt; %Use (istep-1) to start with time=0
%Get airfoil motion parameters=====================================
%Wing votex(V)/collocation(C) points & wake(W) vortex points=======
% ZV(i,:), ZC(i,:), ZW(i,:)    (global system)
% ZVb(i,:),ZCb(i,:),ZWb(i,:)   (body translating system)
% ZW in istep=1 is assigned zero (or null) by initialization
% ZW=ZF for istep >=2 (see the last command of the time marching loop)
%Unit normal of the wing at the collocation points (global): NC(i,:)
%Body translating system : This is the default system for the calculation of force and moment
%wing translational systems for force moment calculation
% ZVF(i,:),ZCF(i,:),ZWF(i,;)   (forward wing translating system)
% ZVR(i,:),ZCR(i,:),ZWR(i,:)   (rear    wing translating system)
% ZCF(1,:) is needed for the forward wing velocity calculation at the collocation points
% ZCR(2,:) is needed for the rear    wing velocity calculation at the collocation points
%Forward wing translating system
%Rear wing translating system
%Forward wing translating system
%Rear wing translating system
%Normal Velocity on the airfoil due to its motion==================
%for iwing=1
%for iwing=2
%%%%%%%%%%iGAMAw=2*(istep-1)%%%%%%%%%%
%Normal velocity on the airfoil due to the wake vortex=============
%Calculation of time dependent sub-matrices MVN_12 and MVN_21======
%Assemble MVNs(:,:,2), MVNs_12(:,:),MVNs_21(:,:) to a total matrix=
%Solve the system of equations=====================================
%Split GAMA into two parts
%Plot locations, ZW, of the wake vortices for the current step
%in the space-fixed system
%Calculate the linear and angular impiulses on the airfoil=========
%Include all of the bound vortices and wake vortices.
%For istep=1, there is no wake vortices.
%Use the body-translating system
%Use the fore wing-translating system
%Use the rear wing-translating system
%Plot velocity field
%%%%%%%%%%iGAMAf=2*istep%%%%%%%%%%
%Calculate the velocity at the free and wake vortices to be shed or convected
%Convect GAMAf from ZF to ZW
%Increment the number of wake vortices
%Add the new wake vortices from the current step
%%%%%%%%%%iGAMAw=2*istep%%%%%%%%%%
%All the convected vortices become wake vortices
%Set these wake vortex to be the free vortices in the next step
%,where two more free vortices (leading and trailing edge vortices)
%will be added before convection
ZF=ZW;
%Calculate the dimensional force and moment on the airfoil
%They are give per unit depth. When two wings have the same span length,
%mutiply th original wing span length l0_ (before reducing by 1/2 to get l_=0.5*l0_) and further by factor of two (for left and
%right wings)
%Print and plot the magnitudes of the dimensional wake vortex
%close opened files
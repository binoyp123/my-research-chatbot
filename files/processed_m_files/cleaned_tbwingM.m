function [ phi, theta,dph,dth ] = tbwingM(mpath, t,rt,tau,e,gMax,p,rtOff, phiT,phiB )
%Calculate airfoil translational and rotational parameters
%INPUT (all nondimentional)
% t         time
% rt        ration of T_(1)/T_(i)
% tau       phase shift
% e         stroke difference
% gMax      Max rotation angle
% p         Rotation parameter
% rtOff     Rotatio timing offset
% phiT,phiB top anf bottom flap angles
%OUTPUT
% phi       rolling angle
% theta     rotation angle
% dph,dth   d(phi)/dt and d(theta)/dt
%Rolling Motion
sump=phiT-phiB;
phi= 0.5*sump*      (cos(pi*(t*rt+tau))+e);
dph=-0.5*sump*pi*rt* sin(pi*(t*rt+tau))   ;
%Rotational Motion
theta=gMax*gam;
dth=gMax*dgam;
%Rolling Motion
sump=phiT-phiB;
phi= 0.5*sump* cosTailG(1,4,t,rt,tau, e);
dph= 0.5*sump*DcosTailG(1,4,t,rt,tau);
%Rotational Motion
theta =gMax*gam;
dth=gMax*dgam;
%Rolling Motion
sump=phiT-phiB;
phi= 0.5*sump* cosTailG(2,4,t,rt,tau, e);
dph= 0.5*sump*DcosTailG(2,4,t,rt,tau);
%Rotational Motion
theta =gMax*gam;
dth=gMax*dgam;
%Rolling Motion
sump=phiT-phiB;
phi= 0.5*sump* cosTailG(1,8,t,rt,tau, e);
dph= 0.5*sump*DcosTailG(1,8,t,rt,tau);
%Rotational Motion
theta =gMax*gam;
dth=gMax*dgam;
%Rolling Motion
sump=phiT-phiB;
phi= 0.5*sump* cosTailG(2,8,t,rt,tau, e);
dph= 0.5*sump*DcosTailG(2,8,t,rt,tau);
%Rotational Motion
theta =gMax*gam;
dth=gMax*dgam;
%Rolling Motion
sump=phiT-phiB;
%nhp=4; This is the only option
phi= 0.5*sump* cTG(4,t,rt,tau,e);
dph= 0.5*sump*DcTG(4,t,rt,tau);
%Rotational Motion
theta =gMax*gam;
dth=gMax*dgam;
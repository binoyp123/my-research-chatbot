function [alp,l,h,dalp,dl,dh] = dfairfoilM(mpath,t,rt,tau,d,e,b,beta,delta,gMax,p,rtOff,U,V)
%Calculate airfoil translational and rotational parameters
%INPUT (all nondimentional)
% t         time
% rt        period ratio: rt(i)=T_(1)/T_(i)
% tau       phase shift
% d         stroke length
% e         stroke difference
% b         wing separation
% beta      stroke plane angle
% delta     body angle
% gMax      Max rotation angle
% p         Rotation parameter
% rtOff     Rotatio timing offset
% U         x air velocity
% V         y air velocity
%OUTPUT
% alp       pitch angle
% dl,dh     lunge(x) and heap(y) velocity
% dalp      pitch angle rate
gbeta=beta-delta;  %global stroke plane angle
%Translational Motion
l =-U*t+b*cos(delta)+0.5*(     d*cos(pi*(t*rt+tau))+e )*cos(gbeta);
h =-V*t-b*sin(delta)+0.5*(     d*cos(pi*(t*rt+tau))+e )*sin(gbeta);
dl=-U               -0.5*pi*rt*d*sin(pi*(t*rt+tau))    *cos(gbeta);
dh=-V               -0.5*pi*rt*d*sin(pi*(t*rt+tau))    *sin(gbeta);
%Rotational Motion
gam=gMax*gam;
alp=0.5*pi-gbeta+gam;
dalp=gMax*dgam;
%{
%Translational Motion
dl=-U+0.5*DcosTailG_2(t+tau)*cos(beta);
dh=-V+0.5*DcosTailG_2(t+tau)*sin(beta);
l=-U*t+0.5*cosTailG_2(t+tau, e)*cos(beta);
h=-V*t+0.5*cosTailG_2(t+tau, e)*sin(beta);
%Rotational Motion
gam=gMax*gam;
alp=0.5*pi-beta+gam;
dalp=gMax*dgam;
%Translational Motion
dl=-U+0.5*DcosUpTailG_2(t+tau)*cos(beta);
dh=-V+0.5*DcosUpTailG_2(t+tau)*sin(beta);
l=-U*t+0.5*cosUpTailG_2(t+tau, e)*cos(beta);
h=-V*t+0.5*cosUpTailG_2(t+tau, e)*sin(beta);
%Rotational Motion
gam=gMax*gam;
alp=0.5*pi-beta+gam;
dalp=gMax*dgam;
%Translational Motion
dl=-U+0.5*DcosTailG(t+tau)*cos(beta);
dh=-V+0.5*DcosTailG(t+tau)*sin(beta);
l=-U*t+0.5*cosTailG(t+tau, e)*cos(beta);
h=-V*t+0.5*cosTailG(t+tau, e)*sin(beta);
%Rotational Motion
gam=gMax*gam;
alp=0.5*pi-beta+gam;
dalp=gMax*dgam;
%Translational Motion
dl=-U+0.5*DcosUpTailG(t+tau)*cos(beta);
dh=-V+0.5*DcosUpTailG(t+tau)*sin(beta);
l=-U*t+0.5*cosUpTailG(t+tau, e)*cos(beta);
h=-V*t+0.5*cosUpTailG(t+tau, e)*sin(beta);
%Rotational Motion
gam=gMax*gam;
alp=0.5*pi-beta+gam;
dalp=gMax*dgam;
%}
%None
function [ ] = igforceMoment(rho_,v_,d_,nstep,dt ,U,V )
%Calculate the force and moment on the airfoil
%INPUT
% nstep     # of step
% dt        time increment
%Initialize force and moment array
tmp=zeros(1,nstep);
forceb =complex(tmp,tmp);
forcew =complex(tmp,tmp);
force  =complex(tmp,tmp);
momentb=tmp;
momentw=tmp;
moment =tmp;
%Reference values of force and moment
f_=rho_*(v_^2)*d_;
m_=f_*d_;
%U0 =complex(LDOT(IT), HDOT(IT)); %Translational velocity of the moving system (no ambient air velocity)
U0 =complex(LDOT(IT)-U, HDOT(IT)-V); %Translational velocity of the moving system 4/6/16
%{
impulseLb0=complex(0,0);
impulseLw0=complex(0,0);
impulseAb0=0.0;
impulseAw0=0.0;
% forceb(1) = (impulseLb(1)-impulseLb0)/dt;
% forcew(1) = (impulseLw(1)-impulseLw0)/dt;
%momentb(1) = (impulseAb(1)-impulseAb0)/dt;
%momentw(1) = (impulseAw(1)-impulseAw0)/dt;
%}
%Total Force and Moment (these are on the fluid)
%The dimensional force & moment on the wing are obtained by reversing the sign
%and multiplying thr reference quantities
ITa=linspace(1,nstep,nstep);
fm=figure();
fm=figure();
fm=figure();
%Calculate the average forces and moment
Fx=real(force);
Fy=imag(force);
Mz=moment;
Fx_avr=sum(Fx)/nstep;
Fy_avr=sum(Fy)/nstep;
Mz_avr=sum(Mz)/nstep;
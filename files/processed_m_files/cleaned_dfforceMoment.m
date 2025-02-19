function [  ] = dfforceMoment(rho_,v_,d_1,nstep,dt ,U,V )
%Calculate the force and moment on the airfoil
%INPUT
% rho_  density of air
% v_    reference velocity
% d_1=d_(1)
% nstep     # of step
% dt        time increment
%OUTPUT (6/24/16)
%Fx_avr,Fy_avr, Mz_avr
%Initialize force and moment array
nwing=2;
tmp=zeros(nwing,nstep);
forceb =complex(tmp,tmp);
forcew =complex(tmp,tmp);
force  =complex(tmp,tmp);
momentb=tmp;
momentw=tmp;
moment =tmp;
temp=zeros(1,nstep);
Tforce=complex(temp,temp);
Tmoment=temp;
%Reference values of force and moment
f_=rho_*(v_^2)*d_1;
m_=f_*d_1;
U0 =complex(-U, -V); %velocity of the body translational system due to ambient velocity
%U0 =complex(0.0, 0.0); %velocity of the body translational system due to its own motion
%Total Force and Moment (these are on the fluid)
%The dimensional force & moment on the wing are obtained by reversing the sign
%and multiplying thr reference quantities
ITa=linspace(1,nstep,nstep);
fm=figure();
%close;
%close;
%Calculate the average forces and moment
Fx=real(Tforce);
Fy=imag(Tforce);
Mz=Tmoment;
Fx_avr=sum(Fx)/nstep;
Fy_avr=sum(Fy)/nstep;
Mz_avr=sum(Mz)/nstep;
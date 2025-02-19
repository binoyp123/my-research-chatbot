function [  ] = dfplotMVortexw(v_,d_1, GAMAw,nstep )
%Print and plot the magnitudes of the wake vortex
%INPUT
% d_1=d_(1)
% GAMAw     wake vortex
% nstep     # of time steps
%Reference value for the circulation
nwing=2;
gama_=v_*d_1;
iodd=1:2:2*nstep-1;
ieven=2:2:2*nstep;
%Dimensional values of the circulation
it=1:nstep;
f=figure();
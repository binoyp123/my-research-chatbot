function [] = dfplotVortexw(istep,nwing,iGAMAw,ZV,ZW)
%Plot wake vortices in the space-fixed system
%INPUT
% iGAMAw(2)                # of wake vortices after shedding the free vortices
% ZV(2,m)                 vortex points on the airfoil
% ZW(2,2*nstep)       complex valued location in the space-fixed system
%Airfoil
XV  =real(ZV);
YV  =imag(ZV);
%Wake
XW  =real(ZW);
YW  =imag(ZW);
%Plot and save to a  file
fig=figure();
%No wake vortex in istep=1.
iodd=1:2:iGAMAw(1)-1;
ieven=2:2:iGAMAw(1);
fig=figure();
%Plot front wing wake vortices from the leading/trailing edges black/red circles
%     rear  wing wake vortices from the leading/trailing edges black/red x
%print(gcf,'-dbmp',['fig/wake/' 'wake_' num2str(t) '.bmp']);
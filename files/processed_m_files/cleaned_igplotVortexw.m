function [] = igplotVortexw(iGAMAw,ZV,ZW,istep)
%Plot wake vortices in the space-fixed system
%INPUT
% iGAMAw                # of wake vortices after shedding the free vortices
% ZV                    vortex points on the airfoil
% ZW   (1,2*istep)       complex valued location in the space-fixed system
%Airfoil
XPLTF  =real(ZV);
YPLTF  =imag(ZV);
%Wake
XPLTW  =real(ZW);
YPLTW  =imag(ZW);
%Plot and save to a  file
%fig=figure();%deleted 3/26/2018 with Alex
%No wake vortex in istep=1.
iodd=1:2:iGAMAw-1;
ieven=2:2:iGAMAw;
XPLTWo=XPLTW(iodd);
YPLTWo=YPLTW(iodd);
XPLTWe=XPLTW(ieven);
YPLTWe=YPLTW(ieven);
%Plot wake vortices from the leading edge black, and from the trailing edge red circles.
%axis([-2,2,-2,2]);%fixes the size of the frame for all plots
%print(gcf,'-dbmp',['fig/wake/' 'wake_' num2str(t) '.bmp']);
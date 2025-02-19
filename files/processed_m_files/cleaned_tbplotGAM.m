function [  ] = tbplotGAM(m,iwing,t,GAMA, XC,NC )
%Plot GAMA at the collocation points of elements using the normal direction
%INPUT
% m         1 (front), 2(rear) wing
% iwing     1(right wing), 2(left)
% GAMA(i)
% XC(j,i)   coordinate j  of the collocation point
% NC(j,i)   unit normal componen j at the collocation
%End points for the  vector
sf=1.0; %scale factor for the velocity plot
xaif=XC(1,:);
yaif=XC(2,:);
zaif=XC(3,:);
xtip=xaif+sf*GAMA.*NC(1,:);
ytip=yaif+sf*GAMA.*NC(2,:);
ztip=zaif+sf*GAMA.*NC(3,:);
%Plot GAMA along the normal velocity vectors at collocation points
f=figure();
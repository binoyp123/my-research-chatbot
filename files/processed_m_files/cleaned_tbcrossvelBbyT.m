function [VBT]=tbcrossvelBbyT(Xb,nXb,Xt,GAMA,nXt)
%Velocity  at border element nodes of wing i due to total vortices (nXt) on
%the wing j. The velocity is evaluated at the nodes; no offset
%INPUT
% Xb(j,n,iXb)    coordinate j of observation node n of the wake element (destination)
% nXb            #of border vortices (destination)
% Xt(j,n,iXt)    coordinate j of source node n for the total element iXt on the wing)
% GAMA(iXt)      entire bound vortex (source)
% nXt            # of total elements on the wing (source)
%OUTPUT
%VBT(j,n,iXb)
VBT=zeros(3,4,nXb);
GAMt=reshape(GAMA,1,1,nXt);
x=Xb(1,n,i);
y=Xb(2,n,i);
z=Xb(3,n,i);
u=0.0; v=0.0; w=0.0;
u=u+u1; v=v+v1; w=w+w1;
u=u+u2; v=v+v2; w=w+w2;
u=u+u3; v=v+v3; w=w+w3;
u=u+u4; v=v+v4; w=w+w4;
function [ VWT ] = tbvelWbyT(istep,Xw,nXw,  Xt2_f,GAMA2_f,nXt_f,Xt2_r,GAMA2_r,nXt_r)
%Velocity  at wake element nodes  due to total vortices (nXt) on 4 wings
% The velocity is evaluated at the nodes; no offset
%INPUT
% istep
% target========
% Xw(j,n,iXw)       coordinate j of observation node n of the wake element (destination)
% nXw               #of wake vortices (destination)
% source========
% Xt2_f(j,n,iXt,w)  coordinate j of source node n for the total element iXt on the front wing
% GAMA2_f(w,iXt)    entire bound vortex from the front wings
% nXt_f             # of total elements on the front wing
% Xt2_r(j,n,iXt,w)  coordinate j of source node n for the total element iXt on the rear wing
% GAMA2_r(w,iXt)    entire bound vortex from the rear wings
% nXt_r             # of total elements on the rear wing
%OUTPUT
%VWT(j,n,iXw)
VWT=zeros(3,4,nXw); % output value for istep=1
%Forward wing
%Contribution from right wing
GAMA=GAMA2_f(1,:);
GAMt=reshape(GAMA,1,1,nXt_f);
Xt=Xt2_f(:,:,:,1);
x=Xw(1,n,i);
y=Xw(2,n,i);
z=Xw(3,n,i);
u=0.0; v=0.0; w=0.0;
u=u+u1; v=v+v1; w=w+w1;
u=u+u2; v=v+v2; w=w+w2;
u=u+u3; v=v+v3; w=w+w3;
u=u+u4; v=v+v4; w=w+w4;
%Contribution from left wing
GAMA=GAMA2_f(2,:);
GAMt=reshape(GAMA,1,1,nXt_f);
Xt=Xt2_f(:,:,:,2);
x=Xw(1,n,i);
y=Xw(2,n,i);
z=Xw(3,n,i);
u=0.0; v=0.0; w=0.0;
u=u+u1; v=v+v1; w=w+w1;
u=u+u2; v=v+v2; w=w+w2;
u=u+u3; v=v+v3; w=w+w3;
u=u+u4; v=v+v4; w=w+w4;
%Rear wing
%Contribution from right wing
GAMA=GAMA2_r(1,:);
GAMt=reshape(GAMA,1,1,nXt_r);
Xt=Xt2_r(:,:,:,1);
x=Xw(1,n,i);
y=Xw(2,n,i);
z=Xw(3,n,i);
u=0.0; v=0.0; w=0.0;
u=u+u1; v=v+v1; w=w+w1;
u=u+u2; v=v+v2; w=w+w2;
u=u+u3; v=v+v3; w=w+w3;
u=u+u4; v=v+v4; w=w+w4;
%Contribution from left wing
GAMA=GAMA2_r(2,:);
GAMt=reshape(GAMA,1,1,nXt_r);
Xt=Xt2_r(:,:,:,2);
x=Xw(1,n,i);
y=Xw(2,n,i);
z=Xw(3,n,i);
u=0.0; v=0.0; w=0.0;
u=u+u1; v=v+v1; w=w+w1;
u=u+u2; v=v+v2; w=w+w2;
u=u+u3; v=v+v3; w=w+w3;
u=u+u4; v=v+v4; w=w+w4;
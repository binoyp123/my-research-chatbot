function [ VBW ] = tbvelBbyW(istep,Xb,nXb, Xw2_f,GAMAw2_f,nXw_f, Xw2_r,GAMAw2_r,nXw_r )
%Velocity at border element nodes of each wing due to wake vortices from 4 wings
%INPUT
% istep
% target==========
% Xb(j,n,iXb)       coordinate j of node point n for the border element i
% nXb               #of border elements
% sources=========
% Xw2_f(j,n,iXw,w)  coordinates of the front wake element
% GAMAw2_f(w,iXw)   front wake vortex
% nXw_f             #of front wake vortices
% Xw2_r(j,n,iXw,w)  coordinates of the rear wake element
% GAMAw2_r(w,iXw)   rear wake vortex
% nXw_r             #of rear wake vortices
%OUTPUT
%VBW(j,n,iXb)
VBW=zeros(3,4,nXb); % output value for istep=1
%Front wings
%Contribution from wake of right wing
GAMAw=GAMAw2_f(1,:);
GAMw=reshape(GAMAw,1,1,nXw_f); %Gamw(1,1,nXw) and Xw(3,4,nXw) share the same shape
Xw=Xw2_f(:,:,:,1);
x=Xb(1,n,i);
y=Xb(2,n,i);
z=Xb(3,n,i);
u=0.0; v=0.0; w=0.0;
u=u+u1; v=v+v1; w=w+w1;
u=u+u2; v=v+v2; w=w+w2;
u=u+u3; v=v+v3; w=w+w3;
u=u+u4; v=v+v4; w=w+w4;
%Contribution from wake of left wing
GAMAw=GAMAw2_f(2,:);
GAMw=reshape(GAMAw,1,1,nXw_f); %Gamw(1,1,nXw) and Xw(3,4,nXw) share the same shape
Xw=Xw2_f(:,:,:,2);
x=Xb(1,n,i);
y=Xb(2,n,i);
z=Xb(3,n,i);
u=0.0; v=0.0; w=0.0;
u=u+u1; v=v+v1; w=w+w1;
u=u+u2; v=v+v2; w=w+w2;
u=u+u3; v=v+v3; w=w+w3;
u=u+u4; v=v+v4; w=w+w4;
%Rear wings
%Contribution from wake of right wing
GAMAw=GAMAw2_r(1,:);
GAMw=reshape(GAMAw,1,1,nXw_r); %Gamw(1,1,nXw) and Xw(3,4,nXw) share the same shape
Xw=Xw2_r(:,:,:,1);
x=Xb(1,n,i);
y=Xb(2,n,i);
z=Xb(3,n,i);
u=0.0; v=0.0; w=0.0;
u=u+u1; v=v+v1; w=w+w1;
u=u+u2; v=v+v2; w=w+w2;
u=u+u3; v=v+v3; w=w+w3;
u=u+u4; v=v+v4; w=w+w4;
%Contribution from wake of left wing
GAMAw=GAMAw2_r(2,:);
GAMw=reshape(GAMAw,1,1,nXw_r); %Gamw(1,1,nXw) and Xw(3,4,nXw) share the same shape
Xw=Xw2_r(:,:,:,2);
x=Xb(1,n,i);
y=Xb(2,n,i);
z=Xb(3,n,i);
u=0.0; v=0.0; w=0.0;
u=u+u1; v=v+v1; w=w+w1;
u=u+u2; v=v+v2; w=w+w2;
u=u+u3; v=v+v3; w=w+w3;
u=u+u4; v=v+v4; w=w+w4;
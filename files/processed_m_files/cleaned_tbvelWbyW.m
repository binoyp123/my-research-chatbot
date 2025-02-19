function [ VWW ] = tbvelWbyW(istep,XwT,nXw, Xw2_f,GAMAw2_f,nXw_f,Xw2_r,GAMAw2_r,nXw_r )
%Velocity  at wake element nodes (NO offset) due to wake vortices of 4 wings
%INPUT
% istep
% target=======
% XwT(j,n,iXw)      corrdinates of the target wake elements
% nXw               #of wake vortices
% sources=======
% Xw2_f(j,n,iXw,w)  coordinates of the front wake element
% GAMAw2_f(w,iXw)   front wake vortex
% nXw_f             # of front wake elements
% Xw2_r(j,n,iXw,w)  coordinates of the rear wake element
% GAMAw2_t(w,iXw)   rear wake vortex
% nXw_t             # of rear wake elements
%OUTPUT
%VWW(j,n,iXw)
VWW=zeros(3,4,nXw); % output value for istep=1
%Front wings
%Contribution from right wing wake
GAMAw=GAMAw2_f(1,:);
GAMw=reshape(GAMAw,1,1,nXw_f);
Xw=Xw2_f(:,:,:,1);
x=XwT(1,n,i);
y=XwT(2,n,i);
z=XwT(3,n,i);
u=0.0; v=0.0; w=0.0;
u=u+u1; v=v+v1; w=w+w1;
u=u+u2; v=v+v2; w=w+w2;
u=u+u3; v=v+v3; w=w+w3;
u=u+u4; v=v+v4; w=w+w4;
%Contribution from left wing wake
GAMAw=GAMAw2_f(2,:);
GAMw=reshape(GAMAw,1,1,nXw_f);
Xw=Xw2_f(:,:,:,2);
x=XwT(1,n,i);
y=XwT(2,n,i);
z=XwT(3,n,i);
u=0.0; v=0.0; w=0.0;
u=u+u1; v=v+v1; w=w+w1;
u=u+u2; v=v+v2; w=w+w2;
u=u+u3; v=v+v3; w=w+w3;
u=u+u4; v=v+v4; w=w+w4;
%Rear wings
%Contribution from right wing wake
GAMAw=GAMAw2_r(1,:);
GAMw=reshape(GAMAw,1,1,nXw_r);
Xw=Xw2_r(:,:,:,1);
x=XwT(1,n,i);
y=XwT(2,n,i);
z=XwT(3,n,i);
u=0.0; v=0.0; w=0.0;
u=u+u1; v=v+v1; w=w+w1;
u=u+u2; v=v+v2; w=w+w2;
u=u+u3; v=v+v3; w=w+w3;
u=u+u4; v=v+v4; w=w+w4;
%Contribution from left wing wake
GAMAw=GAMAw2_r(2,:);
GAMw=reshape(GAMAw,1,1,nXw_r);
Xw=Xw2_r(:,:,:,2);
x=XwT(1,n,i);
y=XwT(2,n,i);
z=XwT(3,n,i);
u=0.0; v=0.0; w=0.0;
u=u+u1; v=v+v1; w=w+w1;
u=u+u2; v=v+v2; w=w+w2;
u=u+u3; v=v+v3; w=w+w3;
u=u+u4; v=v+v4; w=w+w4;
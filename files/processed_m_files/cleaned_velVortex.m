function [ v ] = velVortex( GAM, z,z0)
%Calculate the velocity at z due to vortex GAM at z0
%INPUT
% GAM   vortex
% z     destination
% z0    source
%OUTPUT
% v     velocity complex(vx,vy)
r=abs(z-z0);
eps=eps*1000; %Loosen the zero threshold radius
v=complex(0.0,0.0);
v=-1i*GAM/(z-z0)/(2.0*pi);
v=complex(0.0,0.0);
v=-1i*GAM/(z-z0)/(2.0*pi);
v=v*(r/delta)^2;
%Convert the complex velocity v=v_x-i*v_y to true velocity v=v_x+i*v_y
v=conj(v);
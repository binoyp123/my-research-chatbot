function [ y ] = cTB(nhp,t,rt,tau)
%cos tail function 0<=t<=nhp
%cos (nhp/4; half-period), -1 (nhp/4),cos (nhp/4), +1 (nhp/4)
%INPUT
% t(i)  vector
%OUTPUT
% y(i)  vector
st=size(t);
time=t(i)*rt+tau;
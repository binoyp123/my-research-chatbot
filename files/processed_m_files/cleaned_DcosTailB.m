function [ y ] = DcosTailB(td,nhp,t,rt,tau)
%Basic cos function (0<=t<=4) with a tail (4<=t<=8)
%INPUT
% t(i)  vector
%OUTPUT
% y(i)  vector
st=size(t);
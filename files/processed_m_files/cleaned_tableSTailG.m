function [ y] = tableSTailG(td,nhp,t,rt,tau, p,rtOff)
%Table function for an arbitrary time
tB=rem(t,nhp/rt);
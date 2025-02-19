function [ y ] = tableUpSTailB_2(t, p,rtOff )
%Basic Table function for gamma fot two periods 0<= t <= 4
f0=1.0./(1.0+exp(-2.0*p*(t-(0.0+rtOff))));
f1=2.0./(1.0+exp(-2.0*p*(t-(1.0+rtOff))));
f2=1.0./(1.0+exp(-2.0*p*(t-(2.0+rtOff))));
f4=1.0./(1.0+exp(-2.0*p*(t-(4.0+rtOff))));
y=-f0+f1-f2-f4;
y=-y;
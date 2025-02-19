%Sinusoidal Animation
%       Let?s plot a sinusoid with the frequency changing before our eyes.  Copy the following code into an m-file (sinmovie.m).
% Script file (sinmovie.m) to plot an animation of a sin function with increasing
% frequency.
%
% Author?
% Date?
t=linspace(0,2*pi,1000);
count=1;
y=sin(freqrps*t);
S1=sprintf('y(t)=sin(%.2f t)',freqrps);
freqcps=freqrps/(2*pi);
S2=sprintf('frequency=%.2f rads/sec (%.2f cyc/sec)',freqrps,freqcps);
count=count+1;
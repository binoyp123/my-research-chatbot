t=linspace(0,2*pi,1000);
count=1;
h = figure(1);
y=sin(freqrps*t);
S1=sprintf('y(t)=sin(%.2f t)',freqrps);
freqcps=freqrps/(2*pi);
S2=sprintf('frequency=%.2f rads/sec (%.2f cyc/sec)',freqrps,freqcps);
count=count+1;
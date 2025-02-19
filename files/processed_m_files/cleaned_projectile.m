% Script file (projectile.m) to plot an animation of a projectile trajectory
%
% Author?
% Date?
% Get the constants we need
angd=input('What angle do you want (degrees):');
v0=input('What is the initial velocity (ft/sec):');
numpts=input('How many points to evaluate (I suggest 50):');
% Run our trajecrtory function
% display results as animation
% play as smooth movie 3 times at 10 frames per second
% note that it goes through the frames 2x initially to get ready for
% full speed play.  So it will actually play 2x slower and 3x at full speed.
numtimes=3;
fps=10;
%       Execute the command by typing >> projectile and enjoy?
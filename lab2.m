%% Ruite Guo- ECE 203 - Lab 2 Warm-up
%  ECE 203
%  Lab 2: Introduction Complex Exponentials - Multipath


%% 3. Pre-Lab
%% 3.1
% (a)
z1=10*exp(-j*((2*pi)/3))
z2=-5+5*j
zvect(10*exp(-j*((2*pi)/3)))

%% (b)
zcat([j,-1,-2j,1])
%% (c)
z1+z2
%% (d)
z1*z2
%% (3)
z2/z1
%% (f)
conj(z1)
conj(z2)
%% (g)
1/z1
1/z2

%% 3.3
N = 200;
sig(k) = exp(j*2*pi*(sqrt(((1:N)/50)*((1:N)/50) + 2.25)))
plot(((1:N)/50),real(sig),'mo-')
%% 4 Warmup: Complex Exponentials
%% 4.1 M-file to Generate a Sinusoid
%  function [x,t] = dummy(a,b,n)
%  % Plot polynomial of degree n on the interval [a,b].
%  t = linspace(a,b,50); % Plot 50 points
%  x = t.^n;
%  fprintf('Degree = %g\n',n)
%  fprintf('Interval is [%g, %g]\n',a,b)

a = -1;
b = 1.1
n = 3;
[x,t] = dummy(a,b,n);
plot(t,x); grid on
title([ 'Polynomial of degree ' num2str(n) ])
xlabel('Time (s)')
ylabel('Amplitude')

function [xx,tt] = goodcos(ff,0.025)
tt = 0:1/(20*ff):0.025
one_cos = 95*cos(2*pi*ff*tt)
%===========================================================
%  INSTRUCTOR VERIFICATION - Instructor has check-off sheet
%===========================================================
%% 4.2 Sinusoidal Synthesis with an M-file: Different Frequencies
%% 4.2.1 Write the Function M-file
%  function [xx,tt] = syn_sin(fk,Xk,fs,dur,tstart)
%  %SYN_SIN   Function to synthesize a sum of cosine waves
%  %  usage:
%  %    [xx,tt] = syn_sin(fk,Xk,fs,dur,tstart)
%  %      fk = vector of frequencies
%  %              (these could be negative or positive)
%  %      Xk = vector of complex amplitudes: Amp*e^(j*phase)
%  %      fs = the number of samples per second for the time axis
%  %     dur = total time duration of the signal
%  %  tstart = starting time (default is zero, if you omit this input)
%  %      xx = vector of sinusoidal values
%  %      tt = vector of times, for the time axis
%  %
%  %    Note: fk and Xk must be the same length.
%  %             Xk(1) corresponds to frequency fk(1),
%  %             Xk(2) corresponds to frequency fk(2), etc.
% 
%  Your code here.
function [ xx,tt ] = synsin( fk,xk,fs,dur,tstart )
%   Detailed explanation goes here
if length(fk)~=length(xk)
    error
end
if nargin<5,tstart=0;
end
tt=tstart:(1/fs):dur;
xx=real(xk(1)*exp(1j*2*pi*fk(1)*tt));
plot(xx,tt)
for k=2:length(fk);
    xx=xk(k)*exp(1j*2*pi*fk(k)*tt)+xx;
end
plot(tt,xx),grid on
    

end

%% 4.2.2 Default Inputs
% The modifications described at this point in the lab handout
% should appear in your code of the preceding section, if you
% are able to figure out how to do it.
%% 4.2.3 Testing
[xx0,tt0] = syn_sin([0,100,250],[10,14*exp(-1j*pi/3),8j],10000,0.1,0);
%  Period = 0.0427-0.0227=0.02

%===========================================================
%  INSTRUCTOR VERIFICATION - Instructor has check-off sheet
%===========================================================
5
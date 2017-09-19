%% Ruite Guo
% ECE203
% Lab01: Introduction to Matlab

%% 3. Lab Exercise: Manipulating Sinusoids with Matlab
%% (a) 
    f=4000;
    T=1/f
    tt= (-1/4000):10^-5:(1/4000);
%% (b)
    T=1/4000
    A1=19
    A2=1.2*A1
    tm1=(37.2/5)*T;
    tm2=-(41.3/11)*T;
    
    X1 = A1*cos(2* pi*(4000)*(tt- tm1));
    subplot(3,1,1)
    plot(tt,X1)
    title('X1')
    
    X2 =A2*cos(2*pi*(4000)*(tt- tm2));
    subplot(3,1,2)
    plot(tt,X2)
    title('X2')
%% (c)
    X3 = X1 +X2; 
    subplot(3,1,3)
    plot(tt,X3)
    title('X3 Jia Zhuang')
%% 3.1 Theoretical Calculations
%% (a)
%From the top plot, x1: "time-location of a positive peak":
    %timeshift1=-0.0001378;
    %A1 = 19
    %phase1 = 2*pi*4000*timeshift1 =-3.4633
%From the middle plot, x2: "time-location of a positive peak":
    %timeshift2=-0.00018888
    %A2 = 22.8
    %phase2 = 2*pi*4000*timeshift2=-4.7471
    
%% (b)
%From the bottom plot, x3: "time-location of a positive peak":
   
    %timeshift3= -0.00017
    %A3 = 34.19 
    %phase3=2*pi*4000*timeshift3
%% (c)
% With phasor notation,
phase1=-3.4633
phase2=-4.7471
X1 = A1*exp(j*phase1);
X2 = A2*exp(j*phase2);
% adding yields
abs(X1+x2)
angle(X1+x2)
%% 3.2
x1=real(A1*exp(j*2*pi*f*tt))

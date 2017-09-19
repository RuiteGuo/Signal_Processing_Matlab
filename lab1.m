%% Ruite Guo - ECE 203 - Lab 1
%  ECE 203

%



%% 3 Lab Exercise: Manipulating Sound with MATLAB
%% 3(a)
% PUT YOUR CODE HERE
    f=4000;
    T=1/f
    tt= (-1/4000):10^-5:(1/4000);
%% 3(b)
% PUT YOUR CODE HERE
T=1/4000
    A1=19;
    A2=1.2*A1;
    tm1=(37.2/5)*T;
    tm2=-(41.3/5)*T;
    
    X1 = A1*cos(2* pi*(4000)*(tt- tm1));
    subplot(3,1,1)
    plot(tt,X1)
    title('X1')
    
    X2 =A2*cos(2*pi*(4000)*(tt- tm2));
    subplot(3,1,2)
    plot(tt,X2)
    title('X2')
%% 3(c)
% PUT YOUR CODE HERE
X3 = X1 +X2; 
    subplot(3,1,3)
    plot(tt,X3)
    title('X3 Jia Zhuang')
%% 3.3(d)
%  PUT YOUR CODE HERE
  print('-depsc2','-r600','Lab01print.eps') % Here's a freebie
%% 3.1 Theoretical Calculations
%% 3.1(a)
% Since we can't write on the plots, we'll include the information
% as comments here.
%
% From the top plot, x1: "time-location of a positive peak":
    %timeshift1=-0.00014
    %A1 = 19
    %phase1 = 2*pi*4000*timeshift1 =-3.518583772
%
% From the middle plot, x2: "time-location of a positive peak":
    %timeshift2=-6*10^-5
    %A2 = 22.8
    %phase2 = 2*pi*4000*timeshift2=-1.507964474
%
%% 3.1(b)
% From the plot, x3: "time-location of a positive peak":
   
    %timeshift3= -0.0001
    %A3 = 24.71
    %phase3=2*pi*4000*timeshift3=-2.513274123
%% 3.1(c)
%  With phasor notation,
%  PUT YOUR CODE HERE
A1=19;
A2=19*1.2;
phase1=-3.518583772;
phase2=-1.507964474;
X11 = A1*exp(j*phase1);
X22 = A2*exp(j*phase2);
% adding yields
X33=X11+X22;
%  PUT YOUR CODE HERE
abs(X33)
angle(X33)
%  which agrees closely with Section 3.1(b).  [I HOPE SO!]
%% 3.2
% PUT YOUR CODE HERE
x1=real(A1*exp(j*2*pi*f*tt))
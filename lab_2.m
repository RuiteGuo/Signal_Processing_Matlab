%% ECE 203 Author: Ruite Guo


%% (5)
% (a) 
tstart=-0.5;
T=0.5
dur=6.5
if nargin<5, tstart=0,end
tt = ((-1/2):1/f:dur);
xx = real(2*exp(j*pi*tt)+2*exp(j*pi*(tt-1.25))+(1-j)*exp(j*pi*tt));
plot(tt,xx)

%% (6)
% (a)
d=sqrt(xv^2 + dt^2);
td= d/(3*10^8);
% (b)
dr=sqrt(dxr^2+(dt-dyr)^2)+ sqrt(dyr^2+(dxr-xv)^2);
td2=dr/(3*10^8);
%% (c)
dt=1500;dxr=100;dyr=900;
d= sqrt(1500^2)=1500;
t1=1500/(3*10^8) =5*10^-6;
d2=sqrt(600^2+100^2)-sqrt(100^2+900^2)= -297.22
t2=-297.22/3*10^8=-0.99*10^-6;
rvt=cos(2*pi*f*(t-5*10^-6))-cos(2*pi*f*(t+0.99*10^-6))

f=150*10^6;
dur=(1/f)*3;
T= 0:1/(10^6*f):dur;
rvt=cos(2*pi*f*(t-5*10^-6))-cos(2*pi*f*(t+0.99*10^-6));
plot(t,rvt)


%% (d)
rvt=cos(wt-1500*pi)-cos(wt+297*pi);
rvt=exp(-1500*pi*j) - exp(297*pi*j);
% (e)
function xx=dis(xv)
f=150000000;
c=300000000;
dt=1500;
dyr=900;
dxr=100;
t1(xv)= sqrt(xv^2+dt^2);
  if xv>100
    t2(xv)=[ sqrt((dt-dyr)^2+dxr^2)+sqrt((dxr-xv)^2+dyr^2)]/c; 
  else
    t2(xv)=[ sqrt((dt-dyr)^2+dxr^2)-sqrt((dxr-xv)^2+dyr^2)]/c;
  end
t=0:1/(f*1000000):0.00000002;
r=cos( 2*pi*f*t-2*pi*t1(xv))- cos ( 2*pi*f*t-2*pi*t2(xv));
plot(t,r)
end

% (f)
tpeak=-theta/w

% (g)


%% Ruite Guo
%% ECE203 - Lab 6
%% 2.4
load labdat.mat
bb = 1/3*ones(1,3);
nn = 1:length(x1);   %--- use first=1 and last=length(xx)
y1 = conv(bb,x1);
subplot(2,1,1);
stem(nn,x1(nn))
subplot(2,1,2);
stem(nn,y1(nn),'filled')
xlabel('Time Index (n)')
%--Make black dots

%% 3.1
% (a)
xx = 256*(rem(0:100,50)<10);
bb=[1,-0.9];
yy31=firfilt(bb,xx);
first=1;
last=76;
nn31 = first:last;
figure(1);
subplot(2,1,1);
stem(nn31,xx(nn31))
subplot(2,1,2);
stem(nn31,yy31(nn31));

%(b)
%w[n] and x[n] have different length because 
%length(yy) = length(xx)+length(bb)-1.

%% 3.1.1 (a),(b)
xx = 256*(rem(0:100,50)<10);
bb=[1,-0.9];
nn31 = 1:76;
first=1;
last=length(yy3)+1;
nn311 =first:last;
bb1=[];
for i=1:23
    bb1(i)=0.9^(i-1);
end
yy4=firfilt(bb1, yy3);
subplot(2,1,1);
stem(nn31,xx(nn31))
subplot(2,1,2);
stem(nn311,yy4(nn311));

%% 3.1.1(c)
% make a plot of error
xx=256*(rem(0:100,50)<10);
bb=[1,-0.9];
first=1;
last=50;
nn=first:last;
subplot(2,1,1);
stem(nn,xx(nn))
xlabel('Time Index(n)')
ylabel('xx Input')
title('the error between xx and yy')
 
ww=firfilt(bb,xx);
r=0.9;
l=1:23;
yy=firfilt((r.^l),ww);
subplot(2,1,2);
stem(nn,yy(nn),'filled');
xlabel('Time Index(n)')
ylabel('yy Output')
%% 3.1.2
%(a)
xx=256*(rem(0:100,50)<10);
bb=[1,-0.9];
first=1;
last=50;
nn=first:last;
subplot(3,1,1);
stem(nn,xx(nn))
xlabel('Time Index(n)')
ylabel('xx input')

% (b)
ww=firfilt(bb,xx);
r=0.9;
l=1:23;
nn=first:last;
yy=firfilt((r.^l),ww);
subplot(3,1,2);
stem(nn,yy(nn),'filled');
xlabel('Time Index(n)')
ylabel('yy Output')
zz(nn+1)= xx(nn)-yy(nn); 
subplot(3,1,3);
plot(nn,zz(nn));
title('the worst-case error')
max(abs(zz(nn)))

%% 3.1.3
load labdat.mat
bb=[1,zeros(1,1601),0.9];
first=0;
last=length(x2);
nn=first:last;
yy=firfilt(bb,x2);
subplot(2,1,1);
stem(x2);
subplot(2,1,2);
stem(nn,yy(nn+1));
xlabel('Time Index(n)')
ylabel('speech echo')


%% 3.2.1 (a)
xx = 256*(rem(0:100,50)<10);
bb32 = [1,-0.9];
yyy2=firfilt(bb32,xx);
first3 =1;
last3 = length(xx);
nn3 = first3:last3;
subplot(2,1,1);
stem(nn3,xx(nn3))
subplot(2,1,2);
stem(nn3,yyy2(nn3))

bb322 = [];
for i = 1:22;
   bb322(i)=0.9^(i-1);
end
yyy3 = firfilt(bb322,yyy2);
first3 =1;
last3 =length(xx);
nn3 =first3:last3;
subplot(2,1,1);
stem(nn3,yyy2(nn3))
subplot(2,1,2);
stem(nn3,yyy3(nn3));

% (b) calculation by hand
% w[n]=(x[n]-0.9*x[n-1])
% w[1]=1; w[2]=-0.9;
% y[n]=h2[n]*w[n]=sum (0.9^l*w[n-1])
% so, y[1]=0.9^0*w[1-0]+0+... = 1
% y[2]=0, y[3]=0..., y[22] = 0
% y[23] = -0.9^22*0.9*w[23-22]
%       = -0.9^23 = -0.088629
%% 3.2.2
load echart.mat;
bb32 = [1,-0.9];
echart1=conv2(echart,bb32);
echart70=conv2(echart,bb32);
ech90=conv2(echart1,bb32');
figure(10);
imshow(ech90);
ech100=conv2(ech90,bb322);
echfinal=conv2(ech100,bb322');
figure(11);
imshow(echfinal);

%% 3.2.3 (a)
for i = 1:23
    bb311(i) = 0.9^(i-1);
end
ech311=conv2(ech90,bb311);
echfinal311=conv2(ech311,bb311');
figure(12);
imshow(echfinal311);
for i = 1:34;
   bb322(i)=0.9^(i-1);
end
ech322=conv2(ech90,bb322);
echfinal322=conv2(ech322,bb322');
figure(13);
imshow(echfinal322);
    
%% 3.2.3 (b)
max1=max(abs(ech90(1:100)-ones(1,100)))*255;
max2=max(abs(ech311(1:100)-ones(1,100)))*255;
max3=max(abs(ech322(1:100)-ones(1,100)))*255;

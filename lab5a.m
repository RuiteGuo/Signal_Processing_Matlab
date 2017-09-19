%% Ruite Guo
%% Ece 203

%% 4.1
% f0hat=150/600 = 0.25.
% N=1.25*600=750;
% f0hat*N=187.5, which is not an integer.
% if it is not an integer, the e is not going to be 1 and product
% th term exp(j*phi) * (1-exp(-j*2*pi*(k/N-fhat0)*N)) / 
% (1-exp(-j*2*pi*(k/N-fhat0).
% It is sepctrum leakage.
%% 4.2 (a)
% fs=44100;
% 1048576 samples in length.
% (1/44100)*1048576=23.777 sec

%% (b)
load rap.mat
xx=fft(x);
fs=44100;
N = length(xx);
fHz = (-N/2:N/2-1)/N*fs;
semilogy(fHz, fftshift(abs(xx)))
xlabel('frequency in Hz');
ylabel('magnitude of DFT coefficients');
soundsc(x,fs)

%% (c)
load rap.mat
xx=fft(x);
for k =1:length(fHz)
    if (fHz(k)>=(22050-500) || fHz(k)<= -22050+500)
        xx(k) = xx(k)*3;
    
    end
end

semilogy(fHz,fftshift(abs(xx)))
a=real(ifft(xx));
soundsc(a,fs)

%% (d)
xx=fft(x);
fs=44100;
N = length(xx);
fHz = (-N/2:N/2-1)/N*fs;
for k =1:length(fHz)
    if (fHz(k)>=(22050-500) || fHz(k)<= -22050+500)
        xx(k) = xx(k)*3;
    
    end
end

semilogy(fHz,fftshift(abs(xx)))
x=real(ifft(xx));
x = wavread('freak');
soundsc(x,44100);
%% 4.3 (a)
load fmrisig.mat
yy=fft(s);
Na = length(yy);
fs2 = 4;
fHz2 = (-Na/2:Na/2-1)/Na*fs2;
semilogy(fHz2,fftshift(abs(yy)))

%% (b)
% The dominant sinusoidal component is the highest point expect the DC
% component. In this case, the point is (0.1967, 801.8).
%% (c) 
% the frequency of the domiant sinusoid is 0.1967.

%% (d)
% From the graph given, mean=960;
% A=985-960 = 25;
% phase = pi/2;

tt = (1:0.1:Na);
yy = 960 + 25*cos(2*pi*(0.1957/4)*tt + pi/2);

plot(tt,yy,'r',(1:Na),s,'b')

%% (e)
% the threhold is the frequency=500Hz.it is
%the sample of the activated pixel.we computed the DFT of each
%pixel and locate the maximum point. Find the index of the Maximum
%point and then compute the frequency. compare it to the threhold,
%if they are close enough, we consider this pixel is activated.
%% (f)
% Noise will make it less accurate.Slowly varing drift in the brain will
% affect the data and the accurary of the mapping noise will affect the
% accurary of the map.
%% (g)
load fmri.mat
M = zeros(64,64);
for m = 1:64
    for n = 1:64
        z=x(:,m,n);
        z=z-mean(z);
        Z=abs(fft(z));
        if (Z(7)>500)
            M(m,n) = 1;
        end
    end
end
imagesc(M)

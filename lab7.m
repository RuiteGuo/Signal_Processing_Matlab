%% Ruite Guo
%% ECE 203 LAB 7


%% 3.1
load shortwave.mat;
N = length(X);
x = raw(:,1) + 1i*raw(:,2);
X = fftshift(fft(x));
f_lo = 6000000;
Fs = 196078;
freq = linspace((f_lo-fs/2),(f_lo+fs/2),N);
plot(freq,20*log10(abs(X)))

%% 3.2
% 3.1: 2*fmax = 2*6005000 = 12010000Hz
% 3.2: 60 * 12010000 = 720600000
%      The possible reason can be there are too many samples.
% 3.3: a. cutoff frequency = Fs/2 = 196078/2 = 98039Hz 
%      b. fmax = 6e6 + cutoff frequency = 6098039 
%         fmin = 6e6 + cutoff frequency = 5901961
%      c. 5902000Hz
% 3.4: 1/4*exp(1*j*24000000*pi*t +pi/2)+e(-1*j*24000000*pi*t+pi/2) 
%      If phi equals pi/2, one term of cosine will be 0. 
% 3.5: The second multiplication will result sine function then x1 
% and x2 will result a complex number formation.

%% 4.1 & 4.2
load shortwave.mat
f_LO = 6000e3;
x = raw(:,1) + 1i*raw(:,2);
X = fftshift(fft(x));
N = length(X);
freqs = linspace(f_LO - Fs/2,f_LO + Fs/2,N);
minInd = 2075800; % N* 5999e3-(flo-fs/2)/fs;
maxInd = 2118500; % N* 6001e3-(flo-fs/2)/fs;
[maxVal, ind0] = max(abs(X(minInd:maxInd)));
f_i = freqs(minInd+ind0)

%% 4.3.1
a_raw = x.*exp(-1i*2*pi*[1:N]'*(f_i - f_LO)/Fs);
X = fftshift(fft(a_raw));
C = linspace(-N/2,N/2,N);
plot(C,20*log10(abs(X)))

%% 4.3.2
a = real(a_raw);
soundsc(a,Fs)

% The song can be heart, but there are a lot of noise and high-pich sound.
%% 4.4
% Using DFT

load shortwave.mat;
AA = fft(a);
N1 = length(AA);
T = N1/Fs;
f = (-N/2:N/2-1)/N*Fs;
AA1 = zeros(1,N1);
for k = 1:N1
    if ((f(k)>=(-3000+98039)) || (f(k)<=(3000-98039)))
        AA1(k) = AA(k);
    end
end
AA2 = ifft(AA1);
soundsc(AA2,Fs)
semilogy(f,fftshift(abs(AA)))


%Q4.2: It can filter out the noise and the song can be heard more clearly.
% the high-pitch noise is filtered out as well.

%% 4.5
load shortwave.mat;
f_lo = 6000e3;
xx = raw(: ,1) + 1j*raw(: , 2);
X = fftshift(fft(xx));
N = length(X);
fch = 5980e3 % one of the others stations.
minInd =round(N*((5999e3-(fch-Fs/2))/Fs));
maxInd =round(N*((6001e3-(fch-Fs/2))/Fs));
[maxVal,ind0] = max(abs(X(minInd:maxInd)));
freqs = linspace(f_lo - Fs/2,f_lo + Fs/2,N);
f_i = freqs(minInd + ind0)
a_raw = xx.*exp(-1i*2*pi*[1:N]'*(f_i - f_lo)/Fs);
bb = real(a_raw);
soundsc(bb,Fs)

% Q4.7: 60,000 developers.
% 4.9: The Song name is Idilio.
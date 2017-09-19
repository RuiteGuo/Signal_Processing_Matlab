%% Ruite Guo
%% ece 203 lab 8


%% 3.1 
load cameraman.mat
figure(1)
imagesc(x)
colormap(gray)
axis('square')
figure(2)
spec_x = fft2(x);
imagesc(fftshift(log10(abs(spec_x))));
colormap(gray)
axis('square')

%% 3.2
hh = [1/4, 1/4
      1/4, 1/4];
ylp = conv2(x,hh,'same');
imagesc(abs(ylp))
diff1 = abs(ylp-x);
%% 3.3
xx = fft2(x);
bb = fft2(hh,256,256);
cc = xx.*bb;
dd = ifft2(cc);
diff2 = abs(dd-x);

%% 4.1
load nimes_france.mat;
load blur.mat;
load blurinv.mat;
figure(1);
imagesc(abs(x));
colormap(gray)

% (a)
b = conv2(x,h,'same');
figure(2);
imagesc(abs(b))
colormap(gray)

% (b)
tic;
tstart = tic;
invb = conv2(b,invh,'same');
telapsed = toc(tstart);
figure(3)
imagesc(abs(invb))
colormap(gray)

% (c)
bdft = fft2(b);
hdft = fft2(h,512,512);
result = bdft./hdft;
tic;
tstart1 = tic;
r = ifft2(result,512,512);
telapsed1 = toc(tstart1);
figure(4);
imagesc(abs(r))
colormap(gray)
% (d)
xre = abs(r);
N = 512;
shift = exp(-1i*2*pi*21/N*(0:N-1)')*exp(-1i*2*pi*21/N*(0:N-1));
xre1 = real(ifft2(fft2(xre).*shift));
figure(5);
imagesc(xre);
colormap(gray)
figure(6);
imagesc(xre1);
colormap(gray)

%(e)
yy = conv2(x,h,'same') + randn(size(x));
figure(7);
imagesc(abs(yy));
colormap(gray)
ydft = fft2(yy);
result1 = ydft.*conj(hdft)./abs(hdft).^2;
tic;
tstart2 = tic;
r1 = ifft2(result1,512,512);
telapsed2 = toc(tstart2);
figure(8);
imagesc(abs(r1));
colormap(gray)
result2 = ydft.*conj(hdft)./(abs(hdft).^2 + 0.001);
r2 = ifft2(result2,512,512);
figure(9);
imagesc(abs(r2));
colormap(gray)

%% 4.2
%(a)
load cam_wm.mat;
figure(1)
imagesc(abs(y));
colormap(gray)
w = bitget(y,1);
figure(2)
imagesc(w);

% (b)
load nimes_france.mat
figure(3)
imagesc(abs(x));
colormap(gray)
ww = bitget(x,1);
figure(4)
imagesc(ww);
%% 4.3
N=8;
for m=1:N
    for n=1:N
e=zeros(N,N);
e(m,n)=1;
b = idct2(e);
subplot(8,8,m+(n-1)*N)
imagesc(b)
colormap(gray)
set(gca,'Xtick',[])
set(gca,'Ytick',[])
axis('square')
    end
end

% it used the matrix create in previous step to calculate the DCT to get
% the sinusoid wave. The highest frequency is at the right-lower corner. 8
% pixels can be generate using this wave.

%% b
load cameraman.mat
[M,N] = size(x);
Mblocks = M/8;
Nblocks = N/8;

for m = 1 : Mblocks
    for n=1 : Nblocks
Mrange = (m-1)*8+1:(m-1)*8+8;
Nrange = (n-1)*8+1:(n-1)*8+8;
block = x(Mrange,Nrange);
DCTblock = dct2(block);
y(Mrange,Nrange) = DCTblock;

    end
end
imagesc(y);

%% (c)
Q = [16 11 10 16 24 40 51 61;
12 12 14 19 26 58 60 55;
14 13 16 24 40 57 69 56;
14 17 22 29 51 87 80 62;
18 22 37 56 68 109 103 77;
24 35 55 64 81 104 113 92;
49 64 78 87 103 121 120 101;
72 92 95 98 112 100 103 99];
figure(3);
imagesc(yy);
figure(4);
imagesc(y);
a=find(yy);
compression_ration=a(1,1)/(M*N)
%(d)
for m = 1:Mblocks
    for n=1:Nblocks
Mrange = (m-1)*8+1:(m-1)*8+8;
Nrange = (n-1)*8+1:(n-1)*8+8;
block = x(Mrange,Nrange);
DCTblock = dct2(block);
y(Mrange,Nrange) = DCTblock;
quantized_DCTblock = round(DCTblock./Q);
undo=quantized_DCTblock.*Q;
inverse=idct2(undo);
yyy(Mrange,Nrange)=inverse;
    end
end
figure(5);
imagesc(yyy);
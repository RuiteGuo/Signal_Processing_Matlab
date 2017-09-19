%% Ruite guo- ECE 203 - Lab 4
%  ECE 203
 

%
%% (a)
fs=11025;
Ts=1/11025;
%% (b)
bpm=120;
beats_per_second = bpm/60;
seconds_per_beat = 1/beats_per_second;
seconds_per_pulse = seconds_per_beat / 4;
% also, freq =440*2.^((keynum-49)/12); 
%% (c)

%function xx = key2note(X,keynum, dur)
% KEY2NOTE Produce a sinusoidal waveform corresponding to a
% given piano key number
%
% usage: xx = key2note (X, keynum, dur)
%
% xx = the output sinusoidal waveform
% X = complex amplitude for the sinusoid, X = A*exp(j*phi).
% keynum = the piano keyboard number of the desired note
% dur = the duration (in seconds) of the output note
%
%fs = 11025; %-- or use 8000 Hz
%tt = 0:(1/fs):dur;
%freq =440*2.^((keynum-49)/12);  %<=============== fill in this line
%xx = real (X*exp(1j*2*pi*freq*tt));
%end 

%--- play_scale.m
%---
scale.keys = [ 40 42 44 45 47 49 51 52 ];
%--- NOTES: C D E F G A B C
% key #40 is middle-C
%
scale.durations = 0.25 * ones(1,length(scale.keys));
fs = 11025; %-- or 8000 Hz
xx = zeros(1, sum(scale.durations)*fs+length(scale.keys) );
n1 = 1;
for kk = 1:length(scale.keys)
keynum = scale.keys(kk);
tone = key2note(2,keynum,scale.durations);
n2 = n1 + length(tone) - 1;
xx(n1:n2) = xx(n1:n2) + tone; %<=== Insert the note
n1 = n2 + 1;
end
soundsc( xx, fs )
specgram(xx,512,fs)
%% (d)
bpm=120;
beats_per_second = bpm/60;
seconds_per_beat = 1/beats_per_second;
seconds_per_pulse = seconds_per_beat / 4;
fs=11025;
samples_per_pulse=11025*seconds_per_pulse;
number_of_melody=length(theVoices);
xx=zeros(1,round(sum(theVoices(1).durations)*fs+sum(theVoices(1).durations)*fs+sum(theVoices(3).durations)*fs));
for lom=1:3;
    for lov=1:length(theVoices(lom).noteNumbers)
        keynum=theVoices(lom).noteNumbers(lov);
        n1=theVoices(lom).startPulses(lov)*samples_per_pulse;
        
        tone=key2note(2,keynum,theVoices(lom).durations(lov)*seconds_per_pulse);
        n2=n1+length(tone)-1;
        xx(n1:n2)=xx(n1:n2)+tone;
    end
end
soundsc(xx,fs)
xx = xx./max(abs(xx)); % Ensures that the max value of our song does not exceed +/-1. So there's no clipping while using audiowrite.
audiowrite('Jia_Zhuang.wav',xx,fs); % Writes your vector into filename.wav
specgram(xx,512,fs);
title ('spectrogram of Fugue #2 for Well-tempered clavieer-Bach')
axis([0,50,0,5000])
xlabel('time')
ylabel('Frequency')




        
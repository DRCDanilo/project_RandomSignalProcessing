function bool = isVoicedDanilo()
close ALL;
clear;
%Get audio file
[fileName,pathFile] = uigetfile;
fileIn = fullfile(pathFile,fileName);
[audioIn,faudioIn] = audioread(fileIn);

signal = audioIn;




[Cx,p] = UnbiasedCrossCorr(signal,length(signal));

fe = 10000;  
N = length(signal);
 
t = linspace(0, N/fe, N); 

subplot(2,1,1);
plot(t,signal)
title('Input Signal');
xlabel('Time');
ylabel('Amplitude');

%Plotting Noise Biased and Unbiased AutoCorrelation

subplot(2,1,2);
%stem(signal,"LineWidth",0.85);
hold on;
stem(p, Cx,'*',"LineWidth",0.75);
title('Autocorrelation');
xlabel('Lag');
ylabel('Autocorrelation');
legend('Unbiased Estimator');





[pks,locs] = findpeaks(signal);
pks
%Just positive peaks
positivePeaks = pks(pks>0)
%Amplitude of the first peak
amplitude1Peak = positivePeaks(1)
%Threshold for the max. amplitude value
threshold = 0.8;

%Get the position of the second peak.
%Get the position in pks array of the positive peaks greater 
%or equal to the amplitude trheshold defined
positionPositivePeaks = find(pks >= amplitude1Peak*threshold)

%Get the time of the 1st and 2nd peaks
time1Peak = positionPositivePeaks(1)/faudioIn
time2Peak = positionPositivePeaks(2)/faudioIn
%PseudoPeriod of the signal
pseudoPeriod = time2Peak - time1Peak
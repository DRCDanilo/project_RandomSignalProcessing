close ALL;
clear;

% Samples
N = 200;
% Maximum lag to compute
pmax = 200;  

%Variance to generate Noise signal
variance = 0.5;

%Variable to generate AR1 process/signal
a = 0.8;
sigma2 = 2;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%First Session

%Generate White Noise signal
% wnoise = wNoise(variance,N);
% 
% %Estimate Biased and Unbiased Autocorrelation of White Noise signal
% Rxx_biased = BiasedCrossCorr(wnoise, pmax);
% Rxx_unbiased = UnbiasedCrossCorr(wnoise, pmax);
% 
% V = var(wnoise)
% 
% 
% 
% %Plotting Noise signal
% subplot(1,2,1);
% stem(wnoise);
% title('White Noise');
% xlabel('Time');
% ylabel('Amplitude');
% %figure;
% 
% 
% %Plotting Noise Biased and Unbiased AutoCorrelation
% lags = 0:pmax;
% subplot(1,2,2);
% stem(lags, Rxx_biased);
% hold on;
% stem(lags, Rxx_unbiased);
% title('Autocorrelation of White Noise');
% xlabel('Lag');
% ylabel('Autocorrelation');
% legend('Biased', 'Unbiased');
% figure;
% 
% 
% %Generate AR1 process/signal
% x_ar = arProcess(a,sigma2,N);
% 
% 
% %%Estimate Biased and Unbiased Autocorrelation of AR1
% Rxx_biased = BiasedCrossCorr(x_ar, pmax);
% Rxx_unbiased = UnbiasedCrossCorr(x_ar, pmax);
% 
% 
% %Plotting AR1 
% subplot(1,2,1);
% stem(x_ar);
% title('AR1 Signal');
% xlabel('Time');
% ylabel('Amplitude');
% %figure;
% 
% 
% %Plotting AR1 Biased and Unbiased AutoCorrelation
% lags = 0:pmax;
% subplot(1,2,2);
% stem(lags, Rxx_biased);
% hold on;
% stem(lags, Rxx_unbiased);
% title('Autocorrelation of AR');
% xlabel('Lag');
% ylabel('Autocorrelation');
% legend('Biased', 'Unbiased');
% figure;
% 
% 
% %Generate Sin signal
% sinSignal = genSin(3.5,100,N);
% 
% 
% %Plotting Sin signal
% subplot(1,2,1);
% stem(sinSignal);
% title('Sin Signal');
% xlabel('Time');
% ylabel('Amplitude');
% %figure;
% 
% %Estimate Biased and Unbiased Autocorrelation of Sin
% Rxx_biased = BiasedCrossCorr(sinSignal, pmax);
% Rxx_unbiased = UnbiasedCrossCorr(sinSignal, pmax);
% 
% %Plotting Sin Biased and Unbiased AutoCorrelation
% lags = 0:pmax;
% subplot(1,2,2);
% stem(lags, Rxx_biased);
% hold on;
% stem(lags, Rxx_unbiased);
% title('Autocorrelation of Sin Signal');
% xlabel('Lag');
% ylabel('Autocorrelation');
% legend('Biased', 'Unbiased');
% figure;




% %Load files
% [fileName,pathFile] = uigetfile;
% fileIn = fullfile(pathFile,fileName);
% [audioIn,faudioIn] = audioread(fileIn);
% %x1 = size(audioIn);
% %x1 = zeros(2,size(audioIn));
% plot(audioIn)
% title('Audio Signal Loaded');
% xlabel('Time');
% ylabel('Amplitude');
% %c = max(audioIn,0)

% P = [ 0 0 0 0 0 1 0 0 8 ]
%d = [ 0 4 0 0 0 3 0 0 -5 ]
% %max(d)
% [M,I] = max(d,[],"all")


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Second Session

%Generate Sin signal
sinSignal = genSin(2,100,N);


Rxx_biased = BiasedCrossCorr(sinSignal, pmax);

psdEstimator(Rxx_biased);


% Rxx_biased2 = BiasedCrossCorr(sinSignal2, pmax);





% [numRows, numCols] = size(Rxx_biased);
% disp(['Rxx_biased is a ', num2str(numRows), 'x', num2str(numCols), ' matrix.']);



% psdEstimator(Rxx_biased);
%{
Nfft = 2*length(sinSignal);
PSD = fft(Rxx_biased,Nfft-1);
plot(abs(PSD),"LineWidth",3)
title('Magnitude of fft Spectrum');
xlabel('f [Hz]');
ylabel('| fft(x) |');
hold on;
Nfft = 2*length(sinSignal2);
PSD = fft(Rxx_biased2,Nfft-1);
plot(abs(PSD),"LineWidth",3)
figure;
%}




% sinT =  sinSignal2;
% Rxx_biased = BiasedCrossCorr(sinT, pmax);
% Nfft = 2*length(sinT);
% PSD = fft(Rxx_biased,Nfft-1);
% plot(abs(PSD),"LineWidth",3)
% title('Magnitude of fft Spectrum');
% xlabel('f [Hz]');
% ylabel('| fft(x) |');
% hold on;
% 
% %final part
% e = UnbiasedCrossCorr(sinT, pmax);
% finalS = 2*real((PSD)) - e(1);
% plot(abs(finalS),"LineWidth",3)
% hold on;

%theorethical magnitude a^2/4
% valT = ((abs(sinT)).^2)/4;
% plot(valT)


% Function that uses different sections of the signal to compute the 
% results and takes the average to increase precision 
% function [PSD,nu] = psdEstimatorAverage(X, Nfft, k) 
%     NSection = N/k; 
%     PSDSections = zeros((k, Nfft)); 
%     nuSections = zeros((k, Nfft)); 
%     for i = 0:k - 1 
%         start = i*Nsection; 
%         ending = (i+1)*NSection; 
%         section = X[start:ending]; 
%         NfftSection = 2*NSection; 
%         psdEstimator(section, NfftSection, i); 
%     end 
%     PSD = mean(PSDSections); 
%     nu = mean(nuSections); 
% end 



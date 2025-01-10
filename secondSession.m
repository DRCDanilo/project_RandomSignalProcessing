close ALL;
clear;

% Samples
N = 400;
% Maximum lag to compute
pmax = 200;
% Sampling frequency (Hz)
Fs = 10000;          

%Generate Sin signal
sinSignal = genSin(1,500,N);

%Get audio file
[fileName,pathFile] = uigetfile;
fileIn = fullfile(pathFile,fileName);
[audioIn,faudioIn] = audioread(fileIn);

signal = audioIn;

[PSD, nu] = psdEstimator(signal,2*length(signal),50);

%Plotting Sin signal
subplot(2,1,1);
plot(signal);
title('Sin Signal');
xlabel('Time');
ylabel('Amplitude');

%Plotting the PSD estimator
subplot(2,1,2);
plot(nu*Fs,PSD); % Multiply nu by Fs to get frequency in Hz
hold on;
xlabel('Frequency (Hz)');
ylabel('Power Spectral Density');
title('Power Spectral Density of Sin Signal');
grid on

% % Plot the PSD
% plot(nu*Fs, PSD); % Multiply nu by Fs to get frequency in Hz
% xlabel('Frequency (Hz)');
% ylabel('Power Spectral Density');
% title('Power Spectral Density Estimate');
% grid on;

% [PSD2, nu2] = psdEstimator(X, 2048); % Using Nfft = 2048
% figure;
% plot(nu2*Fs, PSD2); % Multiply nu by Fs to get frequency in Hz
% xlabel('Frequency (Hz)');
% ylabel('Power Spectral Density');
% title('Power Spectral Density Estimate with Nfft=2048');
% grid on;




% %Sampling Frequency
% Fs = 1000;
% 
% %Variance to generate Noise signal
% variance = 0.5;
% 
% %Generate White Noise
% wnoise = wNoise(variance,N);
% %Compute the PSD estimator
% [PSD, nu] = psdEstimator(wnoise);
% 
% %Plotting White Noise signal
% subplot(1,2,1);
% stem(wnoise);
% title('White Noise Signal');
% xlabel('Lag');
% ylabel('Amplitude');
% %figure;
% 
% %Plotting the PSD estimator
% subplot(1,2,2);
% plot(nu*Fs,PSD); % Multiply nu by Fs to get frequency in Hz
% hold on;
% xlabel('Frequency (Hz)');
% ylabel('Power Spectral Density');
% title('Power Spectral Density of White Noise Signal');
% grid on


















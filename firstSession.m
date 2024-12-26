close ALL;
clear;

% Samples
N = 200;
% Maximum lag to compute
pmax = 150;  

%Variance to generate Noise signal
variance = 0.5;

%Generate White Noise signal
wnoise = wNoise(variance,N);

%Estimate Biased and Unbiased Autocorrelation of White Noise signal
Rxx_biased = BiasedCrossCorr(wnoise, pmax);

V = var(wnoise)



%Plotting Noise signal
subplot(1,2,1);
stem(wnoise);
title('White Noise');
xlabel('Time');
ylabel('Amplitude');
%figure;


%Plotting Noise Biased AutoCorrelation
lags = 0:pmax;
subplot(1,2,2);
stem(lags, Rxx_biased);
hold on;
%stem(lags, Rxx_unbiased);
title('Autocorrelation of White Noise');
xlabel('Lag');
ylabel('Autocorrelation');
legend('Biased Estimator', 'Unbiased');
%figure;
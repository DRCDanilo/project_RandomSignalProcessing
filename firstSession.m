close ALL;
clear;

% Samples
N = 200;
% Maximum lag to compute
pmax = 150;  

%Generate Sin signal with random phase
sinSignal = genSin(3.5,100,N);

%Biased Estimator of the Autocorrelation Sin signal
[Rxx_biased,p] = BiasedCrossCorr(sinSignal, pmax);

%Plotting Sin signal
subplot(1,2,1);
stem(sinSignal);
title('Sin Wave Signal with Random Phase');
xlabel('Time');
ylabel('Amplitude');
%figure;

%Plotting Biased Estimator Autocorrelation Sin
subplot(1,2,2);
stem(p, Rxx_biased);
hold on;
%stem(lags, Rxx_unbiased);
title('Autocorrelation of Sin Signal');
xlabel('Lag');
ylabel('Autocorrelation');
legend('Biased Estimator', 'Unbiased');
%figure;

% Generate white noise
N = 1000;
x = randn(N, 1); % Gaussian white noise

% Estimate autocorrelation
maxLag = 100;  % Maximum lag to compute
Rxx_biased = estim_biased_autocorr(x, maxLag);
Rxx_unbiased = estim_unbiased_autocorr(x, maxLag);


% Plotting
lags = 0:maxLag;
figure;
stem(lags, Rxx_biased);
hold on;
stem(lags, Rxx_unbiased);
title('Autocorrelation of White Noise');
xlabel('Lag');
ylabel('Autocorrelation');
legend('Biased', 'Unbiased');
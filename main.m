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

%%%%%%%%%%
%Second Part
% Part 1: AR(1) Signal

% % AR(1) parameters
% a = 0.9; % AR coefficient (|a| < 1 for stability)
% N = 1000; % Number of samples
% variance_input = 1; % Variance of the input white noise
% 
% % Generate AR(1) process
% input_noise = sqrt(variance_input) * randn(N, 1); % Input white noise
% x_ar = filter([1], [1, -a], input_noise);
% 
% 
% % Estimate autocorrelation
% maxLag = 100;
% Rxx_biased_ar = biased_autocorr(x_ar, maxLag);
% Rxx_unbiased_ar = unbiased_autocorr(x_ar, maxLag);
% 
% % Theoretical autocorrelation of AR(1)
% Rxx_theoretical_ar = variance_input * a.^(0:maxLag) / (1 - a^2);
% 
% 
% % Plotting
% lags = 0:maxLag;
% figure;
% stem(lags, Rxx_biased_ar);
% hold on;
% stem(lags, Rxx_unbiased_ar);
% plot(lags, Rxx_theoretical_ar, 'LineWidth', 2);  % Theoretical autocorrelation
% title('Autocorrelation of AR(1) Process');
% xlabel('Lag');
% ylabel('Autocorrelation');
% legend('Biased', 'Unbiased', 'Theoretical');
% 
% 
% 
% % Part 2: Sine Wave with Random Phase
% 
% % Sine wave parameters
% f0 = 0.1; % Normalized frequency (0 < f0 < 0.5)
% amplitude = 1;
% N = 1000;
% 
% % Generate sine wave with random phase
% phase = 2 * pi * rand(); % Random phase between 0 and 2*pi
% n = 0:N-1;
% x_sine = amplitude * sin(2 * pi * f0 * n + phase);
% 
% 
% % Estimate autocorrelation
% maxLag = 100;
% Rxx_biased_sine = biased_autocorr(x_sine, maxLag);
% Rxx_unbiased_sine = unbiased_autocorr(x_sine, maxLag);
% 
% % Theoretical autocorrelation of a sine wave (amplitude A, frequency f0)
% Rxx_theoretical_sine = (amplitude^2/2) * cos(2 * pi * f0 * (0:maxLag));
% 
% 
% 
% % Plotting
% lags = 0:maxLag;
% figure;
% stem(lags, Rxx_biased_sine);
% hold on;
% stem(lags, Rxx_unbiased_sine);
% plot(lags, Rxx_theoretical_sine, 'LineWidth', 2); % Theoretical autocorrelation
% title('Autocorrelation of Sine Wave');
% xlabel('Lag');
% ylabel('Autocorrelation');
% legend('Biased', 'Unbiased', 'Theoretical');
% 
% 
% 
% % Include the biased_autocorr and unbiased_autocorr functions from previous responses here.
% function [Rxx_biased] = biased_autocorr(x, maxLag)
% % ... (same code as before)
% end
% 
% function [Rxx_unbiased] = unbiased_autocorr(x, maxLag)
% % ... (same code as before)
% end
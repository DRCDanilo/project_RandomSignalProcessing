close ALL;
clear;

% Samples
N = 200;
% Maximum lag to compute
pmax = 200;  

% Generate Noise signal
variance = 0.5;
wnoise = sqrt(variance) * randn(1,N);

%Estimate Biased and Unbiased Autocorrelation of Noise
Rxx_biased = BiasedCrossCorr(wnoise, pmax);
Rxx_unbiased = UnbiasedCrossCorr(wnoise, pmax);

V = var(wnoise)

%Trying to display 3 graphs in only 1 window
% g1 = tiledlayout(3,1);
% ax1 = nexttile;
% plot(ax1,x1,y1)
% ax2 = nexttile;
% stem(ax2,x2,y2)
% ax2 = nexttile;
% stem(ax2,x2,y2)



%Plotting Noise signal
stem(wnoise);
title('White Noise');
xlabel('Time');
ylabel('Amplitude');
figure;

%Plotting Noise Biased and Unbiased AutoCorrelation
lags = 0:pmax;
stem(lags, Rxx_biased);
hold on;
stem(lags, Rxx_unbiased);
title('Autocorrelation of White Noise');
xlabel('Lag');
ylabel('Autocorrelation');
legend('Biased', 'Unbiased');
figure;



%Variable to generate AR1 process/signal
a = 0.8;
sigma2 = 2;

%Generate AR1 process/signal
input_noise = sqrt(sigma2) * randn(N,1);
x_ar = filter([1], [1, -a], input_noise);

%%Estimate Biased and Unbiased Autocorrelation of AR1
Rxx_biased = BiasedCrossCorr(x_ar, pmax);
Rxx_unbiased = UnbiasedCrossCorr(x_ar, pmax);


%Plotting AR1 
stem(x_ar);
title('AR1 Signal');
xlabel('Time');
ylabel('Amplitude');
figure;


%Plotting AR1 Biased and Unbiased AutoCorrelation
lags = 0:pmax;
stem(lags, Rxx_biased);
hold on;
stem(lags, Rxx_unbiased);
title('Autocorrelation of AR');
xlabel('Lag');
ylabel('Autocorrelation');
legend('Biased', 'Unbiased');
figure;


%SIN signal
fe = 8000; %4kHz freq d'echantillonage 
fa = 100; %Hz 
Dobs = 0.1; %s  
%sa = sin(fa * t) 
%t = linspace(0, Dobs, Dobs * fe); 
t = linspace(0, N/fe, N); 
sinSignal = sin(2 * pi * fa * t + 2 * pi* randn()); 

%Plotting Sin signal
stem(t,sinSignal);
title('Sin Signal');
xlabel('Time');
ylabel('Amplitude');
figure;

%Estimate Biased and Unbiased Autocorrelation of Sin
Rxx_biased = BiasedCrossCorr(sinSignal, pmax);
Rxx_unbiased = UnbiasedCrossCorr(sinSignal, pmax);

%Plotting Sin Biased and Unbiased AutoCorrelation
lags = 0:pmax;
stem(lags, Rxx_biased);
hold on;
stem(lags, Rxx_unbiased);
title('Autocorrelation of Sin Signal');
xlabel('Lag');
ylabel('Autocorrelation');
legend('Biased', 'Unbiased');








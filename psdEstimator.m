function [PSD,nu] = psdEstimator(X):


Nfft = 2*length(X);
PSD = fft(X,Nfft-1);
plot(abs(PSD))
title('Magnitude of fft Spectrum');
xlabel('f [Hz]');
ylabel('|fft(x)|');
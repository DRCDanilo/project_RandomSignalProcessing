close ALL;
clear;
%Get audio file
[fileName,pathFile] = uigetfile;
fileIn = fullfile(pathFile,fileName);
[audioIn,faudioIn] = audioread(fileIn);
% Samples
N = 200;
% Maximum lag to compute
pmax = 200; 
signal = audioIn;
%Calculation of estimated AutoCorrelation
[Cx,p] = BiasedCrossCorr(signal,pmax);

%Calculation of a coefficients
[a,v] = YuleWalkerSolver(Cx);
b = [a'];
u = 1;
%Calculation of the estimated signal using a coeficients
Xestim = filter(b, u, signal);
fe = 10000;  
N = length(signal);
t = linspace(0, N/fe, N); 

plot(t,signal,"LineWidth",1.3)
hold on;
plot(t,Xestim,"LineWidth",0.85)
title_text = sprintf('Input Signal: %s', fileName);
title(title_text, 'Interpreter', 'none');
xlabel('Time');
ylabel('Amplitude');
legend('Original Signal', 'Estimated Signal');










% %Plotting Sin signal
% %subplot(2,1,1);
% stem(signal,"LineWidth",0.85);
% hold on;
% title('Sin Wave Signal with Random Phase');
% xlabel('Time');
% ylabel('Amplitude');
% %figure;
% 
% %Plotting Biased Estimator Autocorrelation Sin
% %subplot(2,1,1);
% stem(Xestim,'*',"LineWidth",0.75);
% hold on;
% %stem(lags, Rxx_unbiased);
% title('Test of YuleWalkerSolver Function');
% xlabel('Lag');
% ylabel('Amplitude');
% legend('Original Signal', 'Estimated Signal');








% %Variables to generate AR1 process/signal
% aAR = 1;
% sigma2 = 0.5;
% 
% %Generate AR Process
% x_ar = arProcess(aAR,sigma2,N);


%b = [1, -a'];

%new_x = filter(u, b, e);

%Generate Sin signal
%sinSignal = genSin(3.5,100,N);

% %Generate Sin signal
% sinSignal = genSin(3.5,50,N);
% signal = sinSignal;








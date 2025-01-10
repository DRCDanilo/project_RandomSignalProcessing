close ALL;
clear;
%Get audio file
[fileName,pathFile] = uigetfile;
fileIn = fullfile(pathFile,fileName);
[audioIn,faudioIn] = audioread(fileIn);

signal = audioIn;
pmax = 200; 


% % Samples
% N = 800;
% % Maximum lag to compute
 
% 
% %Variance to generate Noise signal
% variance = 0.5;
% %Variable to generate AR1 process/signal
% a = 1;
% sigma2 = 0.6;
% 
% 
% %Generate AR Process
% x_ar = arProcess(a,sigma2,N);
% %Generate Sin signal
% sinSignal = genSin(3.5,100,N);
% 
signal = sinSignal;

%Calculation of estimated AutoCorrelation
[Cx,p] = BiasedCrossCorr(signal,pmax);

[a,v] = YuleWalkerSolver(Cx)


b = [1, -a'];
u = 1;

e = filter(b, u, signal);

new_x = filter(u, b, e);

plot(signal); hold on; plot(e); plot(new_x,'*'); hold off;
legend("Input", "Error","New Signal");
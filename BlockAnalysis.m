function [pitch,sigma2,Aopt] = BlockAnalysis(X,M,Fe)
% Samples
N = 256;
% Maximum lag to compute
pmax = 200;

%Determine if the signal is voiced
%voiced = isVoiced(X);

%Estimate the Autocorrelation
if(voiced)
    %Code if it is voiced
    Rxx_unbiased = UnbiasedCrossCorr(X, pmax);
    AutoCorr = Rxx_unbiased;
else
    %Code if it is not voiced
    Rxx_biased = BiasedCrossCorr(X, pmax);
    AutoCorr = Rxx_biased;
end

%Pitch value


%Aopt - Filter Coeficients
[Aopt,sigma2] = YuleWalkerSolver(AutoCorr);





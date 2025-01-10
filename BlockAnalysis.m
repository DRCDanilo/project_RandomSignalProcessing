function [pitch,sigma2,Aopt] = BlockAnalysis(X,M,Fe)
% Samples
N = 256;
% Maximum lag to compute
pmax = 200;

[Cx,p] = BiasedCrossCorr(X,pmax);

pitch = PitchDetector(Cx,10000,100,400);

% %Estimate the Autocorrelation
% if(voiced)
%     %Code if it is voiced
%     Rxx_unbiased = UnbiasedCrossCorr(X, pmax);
%     AutoCorr = Rxx_unbiased;
% else
%     %Code if it is not voiced
%     Rxx_biased = BiasedCrossCorr(X, pmax);
%     AutoCorr = Rxx_biased;
% end




%Aopt - Filter Coeficients
[Aopt,sigma2] = YuleWalkerSolver(AutoCorr);


%Pitch value
PitchDetector(Cx,10000,50,800)

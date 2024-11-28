%Biased Autocorrelation Estimator

function [Rxx_biased] = BiasedCrossCorr(X, pmax)
    N = length(X);
    Rxx_biased = zeros(1, pmax+1);
    for k = 0:pmax
        Rxx_biased(k+1) = (1/N) * sum(X(1:N-k) .* X(k+1:N));
    end
end
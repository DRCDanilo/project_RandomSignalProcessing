%Unbiased Autocorrelation Estimator

function [Rxx_unbiased] = UnbiasedCrossCorr(X, pmax)
    N = length(X);
    Rxx_unbiased = zeros(1, pmax+1);
    for k = 0:pmax
        Rxx_unbiased(k+1) = (1/(N-k)) * sum(X(1:N-k) .* X(k+1:N));
    end
end
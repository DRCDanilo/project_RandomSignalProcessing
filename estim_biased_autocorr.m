%Biased Autocorrelation Estimator

function [Rxx_biased] = estim_biased_autocorr(x, maxLag)
    N = length(x);
    Rxx_biased = zeros(1, maxLag+1);
    for k = 0:maxLag
        Rxx_biased(k+1) = (1/N) * sum(x(1:N-k) .* x(k+1:N));
    end
end
%Unbiased Autocorrelation Estimator

function [Rxx_unbiased] = estim_unbiased_autocorr(x, maxLag)
    N = length(x);
    Rxx_unbiased = zeros(1, maxLag+1);
    for k = 0:maxLag
        Rxx_unbiased(k+1) = (1/(N-k)) * sum(x(1:N-k) .* x(k+1:N));
    end
end
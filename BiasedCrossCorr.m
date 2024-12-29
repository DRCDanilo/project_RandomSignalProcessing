%Biased Estimator of the Autocorrelation 

function [Cx,p] = BiasedCrossCorr(X, pmax)
    N = length(X);
    Cx = zeros(1, pmax+1);
    p = (0 : pmax)';
    for k = 0:pmax
        shift = p(k+1);
        Cx(k+1) = (1/N) * sum(X(1:N-k) .* X(k+1:N));
    end
end
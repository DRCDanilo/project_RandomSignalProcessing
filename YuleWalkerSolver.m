%Function to solve Yule-Wlaker equations
function [a,v] = YuleWalkerSolver(Cx)

%Definition of the order.
%SIN COMENTAR
K = length(Cx) - 1;

%Px vector. Autocorrelation vector
px = Cx(2:K)';

%Covariance Matrix
CovMatrix = toeplitz(Cx(1:K-1));

%Aopt coef
a = CovMatrix \ px;
%Predictor error variance
v = Cx(1) - px' * inv(CovMatrix) * px;

end
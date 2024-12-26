%Function to solve 
function [aoutput,v3] = YuleWalkerSolver(Cx)


k = length(Cx) - 1;


%Px vector
px = Cx(2:k+1)';

%Toep Matrix
a3 = toeplitz(Cx(1:k));

%Aopt coef
aoutput = a3 \ px;

v3 = Cx(1) - aoutput'*px


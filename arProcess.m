%Function to generate an AR process
function [x_ar] = arProcess(a,sigma2,N)

input_noise = sqrt(sigma2) * randn(N,1);
x_ar = filter([1], [1, -a], input_noise);

end

%Function to generate White Noise
function [wnoise] = wNoise(var2,N)

wnoise = sqrt(var2) * randn(1,N);

end


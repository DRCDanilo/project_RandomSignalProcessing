function [PSD,nu] = psdEstimator(X,Nfft,K)
% Check if Nfft is provided. If not, set the default value.
if nargin < 2
    Nfft = 2 * length(X);
end
if nargin < 3
    K = 1; % Default K (no averaging)
end

% Ensure X is a column vector
X = X(:);

% Ensure Nfft and K are positive integers
Nfft = max(1, round(Nfft));
K = max(1, round(K));
N = length(X);
block_size = floor(N / K); % Size of each block

if block_size < 1
    error('Signal too short for the specified number of blocks (K). Reduce K or provide a longer signal.');
end
PSD_sum = zeros(Nfft/2+1, 1); % Initialize sum of PSDs
for k = 1:K
    % Extract the k-th block
    start_index = (k-1)*block_size + 1;
    end_index = min(k*block_size, N); %Handle edge case where N is not perfectly divisible by K
    X_block = X(start_index:end_index);

    % Compute the DFT of the block
    X_fft_block = fft(X_block, Nfft);

    % Compute the PSD of the block and add to the sum
    PSD_block = (1/(length(X_block))) * abs(X_fft_block(1:Nfft/2+1)).^2;

    if isreal(X)
        PSD_block(2:end-1) = 2*PSD_block(2:end-1);
    end
    PSD_sum = PSD_sum + PSD_block;
end
% Average the PSDs
PSD = PSD_sum / K;

%Generate the normalized frequency vector.
nu = (0:Nfft/2)/Nfft;



end

% 
% Nfft = 2 * length(X);
% PSD = fft(X,Nfft-1);
% plot(abs(PSD))
% title('Magnitude of fft Spectrum');
% xlabel('f [Hz]');
% ylabel('|fft(x)|');
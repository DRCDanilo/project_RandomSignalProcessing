function bool = isVoiced(Cx)
%close ALL;
%clear;
%Get audio file
% [fileName,pathFile] = uigetfile;
% fileIn = fullfile(pathFile,fileName);
% [audioIn,faudioIn] = audioread(fileIn);
% 
% signal = audioIn;

[Cx,p] = UnbiasedCrossCorr(signal,length(signal));

% Threshold for peak cross-correlation. This value might need
% adjustment depending on the specific application and data.
threshold = 0.1; 

% Find the maximum value of the Autocorrelation (excluding the 0-lag)
% We exclude the 0-lag because it's always the maximum (autocorrelation at zero lag)
%and doesn't tell us about periodicity.
if length(Cx) > 1
    [max_corr, max_index] = max(Cx(2:end)); % Find max excluding first element
    max_index = max_index + 1; % Adjust index to be relative to the original Cx
else
    max_corr = Cx(1); % If only one element, consider it
end


% Check if the maximum cross-correlation is above the threshold.
% Additionally, check if the maximum correlation occurs at a reasonable lag
%(not too close to zero). This helps to avoid false positives due to
% high-frequency noise. A typical minimum lag is 2 or 3 samples.
min_lag = 2; % Minimum lag to consider

if max_corr >= threshold && max_index >= min_lag && max_corr > 0.1 
%added condition to avoid very small correlations to be considered voiced
    bool = true;
else
    bool = false;
end

%fileName

% fe = 10000;  
% N = length(signal);
%  
% t = linspace(0, N/fe, N); 
% 
% subplot(2,1,1);
% plot(t,signal)
% %title('Input Signal: %s', fileName);
% title_text = sprintf('Input Signal: %s', fileName);
% title(title_text, 'Interpreter', 'none');
% xlabel('Time');
% ylabel('Amplitude');
% 
% %Plotting Noise Biased and Unbiased AutoCorrelation
% 
% subplot(2,1,2);
% %stem(signal,"LineWidth",0.85);
% hold on;
% stem(p, Cx,'*',"LineWidth",0.75);
% title('Autocorrelation');
% xlabel('Lag');
% ylabel('Autocorrelation');
% legend('Unbiased Estimator');

end
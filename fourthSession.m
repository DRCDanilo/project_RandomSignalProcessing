% Example usage (assuming 'signal' is your audio signal)
Fe = 10000; % Example sampling rate
N=200;
sinSignal = genSin(2,250,N);
%Get audio file
[fileName,pathFile] = uigetfile;
fileIn = fullfile(pathFile,fileName);
[audioIn,faudioIn] = audioread(fileIn);


Cx = audioIn;
%[Cx,p] = BiasedCrossCorr(signal,N);

PitchDetector(Cx,10000,50,800)


%nu(find(PSD >= max(PSD)))*10000
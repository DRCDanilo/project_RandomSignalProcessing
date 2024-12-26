function bool = isVoiced()

[fileName,pathFile] = uigetfile;
fileIn = fullfile(pathFile,fileName);
[audioIn,faudioIn] = audioread(fileIn);


signal = audioIn;


maxValue = max(signal)

threshold = 0.775;

[pks,locs] = findpeaks(signal);
pks
pks(pks>0)
w = findpeaks(pks(pks>0))

posPeaks = find(pks >= maxValue*threshold)
pks(posPeaks(1))
pks(posPeaks(2))
pks(posPeaks(3))
timePeaks = posPeaks./faudioIn
timePeaks(1)
timePeaks(2)
timePeaks(3)

t1 = timePeaks(2) - timePeaks(1)
t2 = timePeaks(3) - timePeaks(2)
t3 = timePeaks(4) - timePeaks(3)
t4 = timePeaks(5) - timePeaks(4)
t5 = timePeaks(6) - timePeaks(5)
faudioIn

fe = 10000; %4kHz freq d'echantillonage 
N = length(signal)
 
t = linspace(0, N/fe, N); 




% [pks,locs] = findpeaks(signal)
% 
% posPeaks = locs(locs>0)
% 
% %F of sampling
% myFs = faudioIn;
% 
% %Sampling interval
% Ts = 1/myFs;
% 
plot(t,signal)
% 
% oneMax = Ts * posPeaks(1)
% 
% secondMax = Ts * posPeaks(2)
% 
% period = secondMax - oneMax





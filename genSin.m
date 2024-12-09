%Function to generate a Sin signal
function [sinSignal] = genSin(A,freq,N)

fe = 8000; %4kHz freq d'echantillonage 
 
 
t = linspace(0, N/fe, N); 

sinSignal = A * sin(2 * pi * freq * t + 2 * pi* randn());

%Function to generate a Sin signal with a random phase
function [sinSignal] = genSin(A,freq,N)

fe = 8000;
 
t = linspace(0, N/fe, N); 

sinSignal = A * sin(2 * pi * freq * t + 2 * pi* randn());

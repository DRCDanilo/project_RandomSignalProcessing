function pitch = PitchDetector(Cx, Fe, Fmin, Fmax)

% Default values
if nargin < 2 || isempty(Fe)
    Fe = 10000; 
end
if nargin < 3 || isempty(Fmin)
    Fmin = 100; 
end
if nargin < 4 || isempty(Fmax)
    Fmax = 400; 
end

if ( isVoiced(Cx) == 1)
    pmin = floor(Fe/Fmax);
    pmax = floor(Fe/Fmin);
    Cxint = Cx(pmin:pmax);
    [~,maxIndex] = max(Cxint);
    pitch = 1/(maxIndex + pmin);
else
    pitch = -1;
end
%Function to solve 
function [a,v] = YuleWalkerSolver(Cx)

% 
% k = length(Cx) - 1;
% 
% 
% %Px vector
% px = Cx';
% 
% %Inv Toep Matrix
% aoutput = toeplitz(Cx)\px;
% 
% v = Cx(1,1) - px .* aoutput


if ~exist('k') 

    k = length(Cx)-1; 

end 

  

Cx = Cx(1:k) 

p_x = Cx(1:end)  

  
%p_x = Cx.' // no estoy seguro de esta línea, tal vez hay que borrarla 

  
gamma = toeplitz(Cx(1:end-1)) 


a = gamma \ p_x 

p_xH = px' 

v = Cx(0) - p_xH * a 



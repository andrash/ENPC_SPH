%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                               SPH LAB
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Authors :  R. Carmigniani, A. Ghaitanellis, A. Leroy, T. Fonty and D. Violeau
%Version : SPHLAB.0
%Date : Started on 28/09/2018
%Contact : remi.carmigniani@enpc.fr
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% PressureContrib : Pressure contribution to the momentum equation
%  dF = -G_i(p_j)/rho_i
% PressureContrib(m,rho_i,rho_j,P_i,P_j,dwdr,er) returns 
% dF of dim size(er)
function dF = PressureContrib(m,rho_i,rho_j,P_i,P_j,dwdr,er)
dF = zeros(size(er));
% COMPLETE HERE
dF(:,1) = -(m*(P_i/rho_i^2+P_j./(rho_j.^2)).*dwdr).*er(:,1);
dF(:,2) = -(m*(P_i/rho_i^2+P_j./(rho_j.^2)).*dwdr).*er(:,2);
% END
% Hint : you should use .* , ./ and .^ to complete the calculation
% Comment the line dF once you are done

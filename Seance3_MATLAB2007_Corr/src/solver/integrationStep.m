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
% Integration : time integration using simplectic method
%
function partnp1 = integrationStep(partn,dt)
global INFO POS VEL RHO FORCES;
global d;
global FLUID BOUND;
global  xOrigin yOrigin vecPer rhoMin rhoMax;
nPart = size(partn,1);
infoTab = partn(:,INFO);
newVelTab = partn(infoTab==FLUID,VEL);
newPosTab = partn(infoTab==FLUID,POS);
newRhoTab = partn(infoTab==FLUID,RHO);
forceTab =partn(infoTab==FLUID,FORCES(1:d));
dRhoTab = partn(infoTab==FLUID,FORCES(end));
%% UPDATE TIME 
newVelTab = newVelTab +forceTab*dt;
newPosTab = newPosTab + newVelTab*dt;
newRhoTab = newRhoTab+dRhoTab*dt;
%% PERIODICITY
%UPDATE PERIODICITY
newPosTab(newPosTab(:,1)>xOrigin+vecPer(1),1)  = newPosTab(newPosTab(:,1)>xOrigin+vecPer(1),1) -vecPer(1);
newPosTab(newPosTab(:,1)<xOrigin,1)  = newPosTab(newPosTab(:,1)<xOrigin,1)+vecPer(1);
%UPDATE PERIODICITY
newPosTab(newPosTab(:,2)>yOrigin+vecPer(2),2)  = newPosTab(newPosTab(:,2)>yOrigin+vecPer(2),2) -vecPer(2);
newPosTab(newPosTab(:,2)<yOrigin,2)  = newPosTab(newPosTab(:,2)<yOrigin,2)+vecPer(2);
%% CHECK ERROR DENSiTY
if not(isempty(newRhoTab(newRhoTab<=rhoMin)))
    text = sprintf('WARNING : DENSITY DROPPED WEIRDLY');
    newRhoTab(newRhoTab<=rhoMin) = rhoMin;
    disp(text);
end
if not(isempty(newRhoTab(newRhoTab>=rhoMax)))
    text = sprintf('WARNING : DENSITY INCREASED WEIRDLY');
    newRhoTab(newRhoTab<=rhoMax) = rhoMax;
    disp(text);
end
%% WRITE
partnp1 = partn;
partnp1(infoTab==FLUID,VEL)=newVelTab;
partnp1(infoTab==FLUID,POS)=newPosTab;
partnp1(infoTab==FLUID,RHO)=newRhoTab;

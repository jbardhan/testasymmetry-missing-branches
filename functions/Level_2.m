% Calculate the free energies for each ion using bornPicardNoStern.m.  This
% script takes each ion and calculates the energy of solvation for a single
% atom of central charge q.  These Energies are then put into an array 'E'
% which is then fed into 'ObjectiveFunction.m' which takes the square of
% the difference between these calculated energies and the experimental MD
% data for each situation.
addpath('..')
addpath('../..')
addpath('../../Asymmetric/born')
addpath('../../pointbem')
loadconstants

rscale = 0.92;

epsIn  =  1;
epsOut = 80;
conv_factor = 332.112;
Params = struct('alpha',0.5, 'beta', -60.0,'EfieldOffset',-0.5);

i = 1; 
k = 1;
n = 10;

sodiumRminOver2 = 1.41075; % new Roux toppar 1.36375;  % standard charmm
sodiumPlus = -93.4 ; % i = 1
sodiumMinus = -175.7; % i = 2

chlorideRminOver2 = 2.27;
chloridePlus = -57.0; % i = 3
chlorideMinus = -95.3 ; % i = 4

potassiumRminOver2 =1.76375; % new Roux toppar
potassiumPlus  = -73.4; % i = 5
potassiumMinus = -128.3895; % i = 6

rubidiumRminOver2 = 1.90;
rubidiumPlus = -66.78 ; % i = 7
rubidiumMinus = -114.1 ; % i = 8

magnesiumRminOver2 = 1.185; % new Roux toppar
magnesiumPlus = -108.6 ; % i = 9
magnesiumMinus = -218.5 ; % i = 10

cesiumRminOver2 = 2.1;
cesiumPlus = -60.42 ; % i = 11
cesiumMinus = -101.9 ; % i = 12

calciumRminOver2  = 1.367;
calciumPlus = -88.91 ; % i = 13
calciumMinus = -163.4 ; % i = 14

bariumRminOver2 = 1.89;
bariumPlus = -67.03 ; % i = 15
bariumMinus = -115.1 ; % i = 16

zincRminOver2 = 1.09;
zincPlus = -99.05 ; % i = 17
zincMinus = -191.2 ; % i = 18

cadmiumRminOver2 = 1.357;
cadmiumPlus = -89.08; % i = 19
cadmiumMinus = -164.3 ; % i = 20

for i = 1:20

if i == 1 % Na plus
   
    E(i) = bornPicardNoStern(sodiumRminOver2*rscale,sodiumPlus,epsIn,epsOut,k,Params,conv_factor,n);
   
elseif i == 2 % Na minus
  
    E(i) = bornPicardNoStern(sodiumRminOver2*rscale,sodiumMinus,epsIn,epsOut,k,Params,conv_factor,n);
    
elseif i == 3 % Cl plus
  
    E(i) = bornPicardNoStern(chlorideRminOver2*rscale,chloridePlus,epsIn,epsOut,k,Params,conv_factor,n);
    
elseif i == 4 % Cl minus
  
    E(i) = bornPicardNoStern(chlorideRminOver2*rscale,chlorideMinus,epsIn,epsOut,k,Params,conv_factor,n);
   
elseif i == 5 % K plus
   
    E(i) = bornPicardNoStern(potassiumRminOver2*rscale,potassiumPlus,epsIn,epsOut,k,Params,conv_factor,n);
   
elseif i == 6 % K minus
  
    E(i) = bornPicardNoStern(potassiumRminOver2*rscale,potassiumMinus,epsIn,epsOut,k,Params,conv_factor,n);
    
elseif i == 7 % Rb plus
   
    E(i) = bornPicardNoStern(rubidiumRminOver2*rscale,rubidiumPlus,epsIn,epsOut,k,Params,conv_factor,n);
   
elseif i == 8 % Rb minus
  
    E(i) = bornPicardNoStern(rubidiumRminOver2*rscale,rubidiumMinus,epsIn,epsOut,k,Params,conv_factor,n);
    
elseif i == 9 % Mg plus
   
    E(i) = bornPicardNoStern(magnesiumRminOver2*rscale,magnesiumPlus,epsIn,epsOut,k,Params,conv_factor,n);
   
elseif i == 10 % Mg minus
  
    E(i) = bornPicardNoStern(magnesiumRminOver2*rscale,magnesiumMinus,epsIn,epsOut,k,Params,conv_factor,n);
    
elseif i == 11 % Cs plus
   
    E(i) = bornPicardNoStern(cesiumRminOver2*rscale,cesiumPlus,epsIn,epsOut,k,Params,conv_factor,n);
   
elseif i == 12 % Cs minus
  
    E(i) = bornPicardNoStern(cesiumRminOver2*rscale,cesiumMinus,epsIn,epsOut,k,Params,conv_factor,n);
    
elseif i == 13 % Ca plus
   
    E(i) = bornPicardNoStern(calciumRminOver2*rscale,calciumPlus,epsIn,epsOut,k,Params,conv_factor,n);
   
elseif i == 14 % Ca minus
  
    E(i) = bornPicardNoStern(calciumRminOver2*rscale,calciumMinus,epsIn,epsOut,k,Params,conv_factor,n);
    
elseif i == 15 % Ba plus
   
    E(i) = bornPicardNoStern(bariumRminOver2*rscale,bariumPlus,epsIn,epsOut,k,Params,conv_factor,n);
   
elseif i == 16 % Ba minus
  
    E(i) = bornPicardNoStern(bariumRminOver2*rscale,bariumMinus,epsIn,epsOut,k,Params,conv_factor,n);
    
elseif i == 17 % Zn plus
   
    E(i) = bornPicardNoStern(zincRminOver2*rscale,zincPlus,epsIn,epsOut,k,Params,conv_factor,n);
   
elseif i == 18 % Zn minus
  
    E(i) = bornPicardNoStern(zincRminOver2*rscale,zincMinus,epsIn,epsOut,k,Params,conv_factor,n);
    
elseif i == 19 % Cd plus
   
    E(i) = bornPicardNoStern(cadmiumRminOver2*rscale,cadmiumPlus,epsIn,epsOut,k,Params,conv_factor,n);
   
elseif i == 20 % Cd minus
  
    E(i) = bornPicardNoStern(cadmiumRminOver2*rscale,cadmiumMinus,epsIn,epsOut,k,Params,conv_factor,n);
    
end
end


D = ObjectiveFunction(i,Params,E)
    
    
    
    
    
% Path information
addpath('/Users/jbardhan/repos/pointbem');
addpath('/Users/jbardhan/repos/panelbem');
addpath('/Users/jbardhan/repos/testasymmetry');
addpath('/Users/jbardhan/repos/testasymmetry/functions');
addpath('/Users/jbardhan/repos/testasymmetry/mobley');
addpath('/Users/jbardhan/repos/testasymmetry/born/');

% a bunch of useful variables and constants. also defining the global
% variable "ProblemSet" which we'll use to hold the BEM systems.
loadConstants
global UsefulConstants ProblemSet
epsIn  =  1;
epsOut = 75.8823;
conv_factor = 332.112;
staticpotential = 10.7;
kappa = 0.0;  % for now, this should be zero, meaning non-ionic solutions!
UsefulConstants = struct('epsIn',epsIn,'epsOut',epsOut,'kappa', ...
			 kappa,'conv_factor',conv_factor,...
			 'staticpotential',staticpotential);

% here we define the actual params for the NLBC test
%asymParams = struct('alpha',0.5, 'beta', -60.0,'EfieldOffset',-0.5);
asymParams = struct('alpha',0.1972, 'beta', -142.0712,'EfieldOffset',-2.6557);

analogs = {'1_methyl_imidazole','2_methylpropane', ...
	   '3_methyl_1h_indole','acetic_acid','ethanamide', ...
	   'ethanol','methane','methanethiol','methanol', ...
	   'methyl_ethyl_sulfide','n_butane','n_butylamine', ...
	   'p_cresol','propane','propanoic_acid','toluene'};

for i=1:length(analogs)
  chdir(analogs{i});
  pqrData = loadPqr('test.pqr');
  pqrAll{i} = pqrData;
  srfFile{i} = sprintf('%s/test_2.srf',analogs{i});
  loadTestReferenceAndChargeDistribution
  chargeDist{i} = chargeDistribution;
  referenceData{i} = referenceE;
  chdir('..');

  addProblem(analogs{i},pqrAll{i},srfFile{i},chargeDist{i},referenceData{i});

end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[calculatedE,referenceE] = CalculateEnergiesFromBEM(asymParams); 


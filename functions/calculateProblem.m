function [calculatedE, referenceE] = calculateProblem(problem,params)

% this function is intended to be called by
% CalculateEnergiesFromBEM.  you are supposed to pass in a problem
% (one element from ProblemSet) and an NLBC param structure.
numTestsInProblem = problem.numTestsInProblem;
calculatedE = zeros(numTestsInProblem,1);

% run a BEM calculation for each test charge distribution.  note,
% importantly, i have a subtle but nice innovation here.  runTest
% will initialize the BEM matrices if it needs to, but not
% otherwise!  this will save a ton of time
for i=1:numTestsInProblem
  calculatedE(i) = runTest(params, problem, problem.chargeDistribution(:,i));
end

% here's where the information about the reference result (whether
% experiment, MD, or other, e.g. MSA) comes in.  the info is
% encapsulated "inside" the problem structure, which improves modularity.
referenceE = problem.reference;

% double check the reference results and calculated results are the
% same length.  this should be impossible to fail because of the
% check in addProblem.
if length(calculatedE) ~= length(referenceE)
  fprintf('Error in calculate problem %s!\n',problem.name);
  fprintf('length(calculatedE)=%d\nlength(referenceE)=%d\n',length(calculatedE),length(referenceE));
  keyboard
end

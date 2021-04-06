function addProblemCosmoNpHB(name,chargeDistribution,reference,...
                         soluteAtomAreas,soluteAtomTypes,soluteHbondData,...
                         solute_VdWV,solute_VdWA,...
                         solventAtomAreas,solventAtomTypes,solventHbondData,...
                         solvent_VdWV,solvent_VdWA,...
                         atom_vols,temperature,newHB)      
          
          

          
          
          
global ProblemSetNp

% then define a variable numTests that says, how many tests (charge
% distributions) do we have.  

true = 1;  %  just to keep the boolean nature of "uninitialized"
           %  clear in this function
numTests = size(chargeDistribution,2);

% when we first say "global ProblemSet" at the uppermost level of
% Matlab, it defines it as a zero-length vector of floats, which
% means I can't say "ProblemSet(1) = struct( ... ).  Try this for
% yourself if it's not clear what the issue is.

newIndex = length(ProblemSetNp)+1;
newproblem = struct('index',newIndex,...
		    'name',name,...
		    'reference', reference,...
		    'uninitializedNp',true,...
		    'numTestsInProblem',numTests,...
            'chargeDistribution',chargeDistribution,...
		    'soluteAtomAreas',soluteAtomAreas,...
            'soluteAtomTypes',soluteAtomTypes,...
            'soluteHbondData',soluteHbondData,...
            'solute_VdWV',solute_VdWV,...
            'solute_VdWA',solute_VdWA,...
            'solventAtomAreas',solventAtomAreas,...
            'solventAtomTypes',solventAtomTypes,...
            'solventHbondData',solventHbondData,...
            'solvent_VdWV',solvent_VdWV,...
            'solvent_VdWA',solvent_VdWA,...
            'atom_vols',atom_vols,...
            'temperature',temperature,...
            'newHB',newHB);
        
      


if newIndex == 1
  ProblemSetNp = newproblem;
else
  ProblemSetNp(newIndex) = newproblem;
end

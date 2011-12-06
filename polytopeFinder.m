

fmincon(@distance, [1; 9; 1],...
	eye(3), zeros(3,1),...  % A, b : linear inequality
	[],[],...  % A, b : linear equality
	[], [],...  % bounds...
	@nonLinPolytopeConstraints9 ... %function equality nonlinear
)

fmincon(@distance, [1; 9; 1],...
	eye(3), zeros(3,1),...  % A, b : linear inequality
	[],[],...  % A, b : linear equality
	[], [],...  % bounds...
	@nonLinPolytopeConstraints11 ... %function equality nonlinear
)

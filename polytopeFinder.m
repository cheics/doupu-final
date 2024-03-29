
%% Nominal Values
tol=0.1;
nom_H=1;
nom_C=0.8;
nom_L=12;

[ll_c, ul_c]=deal(nom_C-nom_C*tol, nom_C+nom_C*tol);
[ll_L, ul_L]=deal(nom_L-nom_L*tol, nom_L+nom_L*tol);
[ll_H, ul_H]=deal(nom_H-nom_H*tol, nom_H+nom_H*tol);
	
%% Approximation of constraints	
p1=fmincon(@pDist, [1; 9; 1],...
	-eye(3), zeros(3,1), ...
	[],[],...  % A, b : linear equality
	[], [],...  % bounds...
	@nonLinPolytopeConstraints9, 'sqp' ... %function equality nonlinear
);

p2=fmincon(@pDist, [1; 9; 1],...
	-eye(3), zeros(3,1), ...
	[],[],...  % A, b : linear equality
	[], [],...  % bounds...
	@nonLinPolytopeConstraints11, 'sqp' ... %function equality nonlinear
);

%% approximation Constraints

[gradP1]= gradFinder2(p1, 9);
[gradP2]= gradFinder2(p2, 11);

cnst1=horzcat(gradP1',gradP1'*p1)*-1;
cnst2=horzcat(gradP2',gradP2'*p2);

% [a,b,c,d]=planeApprox(p1, gradP1);
% cnst1=[a,b,c,d]*-1;
% [a,b,c,d]=planeApprox(p1, gradP2);
% cnst2=[a,b,c,d];

% tolerance cube constraints
% cnst3=[1,0,0,ll_c]*-1;
% cnst4=[1,0,0,ul_c];
% 
% cnst5=[0,1,0,ll_L]*-1;
% cnst6=[0,1,0,ul_L];
% 
% cnst7=[0,0,1,ll_H]*-1;
% cnst8=[0,0,1,ul_H];

% constraintsTol=vertcat(cnst3,cnst4,cnst5,cnst6,cnst7,cnst8);
constraintsNeg=horzcat(-eye(3), zeros(3,1));

%constraints=vertcat(constraintsTol, constraintsNeg, cnst1, cnst2);
constraints=vertcat(constraintsNeg, cnst1, cnst2);
%constraints=vertcat(cnst1, cnst2);

%% Design centering

A=constraints(:, 1:3);
C=constraints(:, 4);

A_pos=max(0, A);
A_neg=max(0, -A);

noms=[nom_C; nom_L; nom_H];


%% enlarge matrix for additional xr constraints
constraints=horzcat(-1*A_neg, A_pos); 
constraints=horzcat(constraints,zeros(size(A_pos,1),3));


xmin=[ll_c; ll_L; ll_H]
xmax=[ul_c; ul_L; ul_H]
x_r=(xmin+noms)./2;

%% merge C back in

constraints=horzcat(constraints,C);
%% add addtional constraints

xmin_xr_const=vertcat(...
	[0,0,0,  0,0,0, -1,0,0,   xmin(1)],...
	[0,0,0,  0,0,0, 0,-1,0,   xmin(2)],...
	[0,0,0,  0,0,0, 0,0,-1,   xmin(3)]...
);

xl_xr_const=vertcat(...
	[-1,0,0,  0,0,0, 1,0,0,   0],...
	[0,-1,0,  0,0,0, 0,1,0,   0],...
	[0,0,-1,  0,0,0, 0,0,1,   0]...
);

xu_xl_const=vertcat(...
	[-1,0,0,  1,0,0, 0,0,0,   -1*(xmax(1)-xmin(1))],...
	[0,-1,0,  0,1,0, 0,0,0,   -1*(xmax(2)-xmin(2))],...
	[0,0,-1,  0,0,1, 0,0,0,   -1*(xmax(3)-xmin(3))]...
);

xr_xmax_const=vertcat(...
	[0,0,0,  0,0,0, 1,0,0,   xmin(1)],...
	[0,0,0,  0,0,0, 0,1,0,   xmin(2)],...
	[0,0,0,  0,0,0, 0,0,1,   xmin(3)]...
);

allConstraints=vertcat(constraints,xmin_xr_const,xl_xr_const,xu_xl_const,xr_xmax_const);
 const=allConstraints(1:size(allConstraints,2)-1);
 C=allConstraints(size(allConstraints,2));
 
% xl, xu, xr
startingGuess=vertcat(noms-0.001, noms+0.001, x_r);
designCentre=fmincon(@yieldKum, startingGuess,...
	const, C...
);

reshape(designCentre, 3, 3)







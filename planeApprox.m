function [ a,b,c,d ] = planeApprox(pp, grad)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here

	nn=cross(...
		[grad(1); 0 ; 1],...
		[0; grad(2); 1]...
	);
	a=nn(1);
	b=nn(1);
	c=nn(1);
	d=-a*pp(1) -b*pp(2) -c*pp(3);

end


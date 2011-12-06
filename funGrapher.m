function [l, c, outSurfZ ] = funGrapher( tolerance , q)
	%UNTITLED8 Summary of this function goes here
	%   Detailed explanation goes here
	stepSize=10;
	outSurfZ=zeros(stepSize+1);
	tol=tolerance*1.2;
	nom_H=1;
	nom_C=0.8;
	nom_L=12;

	[ll_L, ul_L]=deal(nom_L-nom_L*tol, nom_L+nom_L*tol);
	[ll_c, ul_c]=deal(nom_C-nom_C*tol, nom_C+nom_C*tol);


	l=ll_L:((ul_L-ll_L)/stepSize):ul_L;
	c=ll_c:((ul_c-ll_c)/stepSize):ul_c;


	for i=1:size(l,2 )
		for j=1:size(c,2 )
			outSurfZ(i, j)=(q./(l(i)*c(j))).^(2/3);
		end
	end
end



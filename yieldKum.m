function [ outVal ] = yieldKum( xIn )
%UNTITLED8 Summary of this function goes here
%   Detailed explanation goes here
	xl=xIn(1:3);
	xu=xIn(4:6);
	xr=xIn(7:9);
	
	tol=0.1;
	nom_H=1;
	nom_C=0.8;
	nom_L=12;

	[ll_c, ul_c]=deal(nom_C-nom_C*tol, nom_C+nom_C*tol);
	[ll_L, ul_L]=deal(nom_L-nom_L*tol, nom_L+nom_L*tol);
	[ll_H, ul_H]=deal(nom_H-nom_H*tol, nom_H+nom_H*tol);
	
	xmin=[ll_c; ll_L; ll_H];
	xmax=[ul_c; ul_L; ul_H];
	t=xmax-xmin;
	
	prob_c1=betacdf((xu(1)-xr(1))./t(1) ,1, 2);
	prob_c2=betacdf((xl(1)-xr(1))./t(1) ,1, 2);

	
	prob_h1=betacdf((xu(2)-xr(2))./t(2) ,2.5, 4);
	prob_h2=betacdf((xl(2)-xr(2))./t(2) ,2.5, 4);
	
% 	prob_c1
% 	prob_c2
	prob_c=prob_c1-prob_c2;
	
% 	prob_h1
% 	prob_h2
	prob_h=prob_h1-prob_h2;

	outVal=-1*prob_c*prob_h;
	

end



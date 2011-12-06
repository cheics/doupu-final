function [ optVal ] = worstCase( inVect )
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here
	xl=inVect(1:3);
	xu=inVect(4:6);

	G=diag((xu-xl).^-1);
	optVal=det(inv(G));
end


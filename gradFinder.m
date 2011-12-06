function [ grad ] = gradFinder( point, q )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
%C,L,H
	c=point(1);
	l=point(2);
	h=point(3);
	
	gc=q.^(2/3) * l.^(-3/2) * c.^(-5/2) *(-3/2);
	gl=q.^(2/3) * c.^(-3/2) * l.^(-5/2) *(-3/2);
	grad=[gc;gl];
	
end



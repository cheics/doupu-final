function [ grad ] = gradFinder2( point, q )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
%C,L,H
	c=point(1);
	l=point(2);
	h=point(3);
	
	gc=l*h.^(3/2)
	gl=c*h.^(3/2)
	gh=(3/2)*c*l*h.^(1/2)
	grad=[gc;gl;gh];
	
end



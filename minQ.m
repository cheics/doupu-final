function [ val  ] = minQ( x )
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here
	c=x(1);
	l=x(2);
	h=x(3);
	
	val=c*l*h.^(3/2);

end



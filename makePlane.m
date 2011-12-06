function [ xx,yy,z ] = makePlane( point, normal, xRange, yRange )
	%UNTITLED4 Summary of this function goes here
	%   Detailed explanation goes here


	%# a plane is a*x+b*y+c*z+d=0
	%# [a,b,c] is the normal. Thus, we have to calculate
	%# d and we're set
	d = -point*normal'; %'# dot product for less typing

	%# create x,y
	[xx,yy]=ndgrid(xRange(1):xRange(2), yRange(1):yRange(2));

	%# calculate corresponding z
	z = (-normal(1)*xx - normal(2)*yy - d)/normal(3);
	surf(xx,yy,z)
	pause
end


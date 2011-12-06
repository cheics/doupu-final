function [ dist ] = distance( designVar )
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
	designCentre=[1; 0.8; 12];
	dist=sum((designVar-designCentre).^2).^0.5;

end


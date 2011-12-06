function [ dist ] = pDist( designVar )
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here

% C, L, H
	designCentre=[0.8; 12; 1;];
	dist=sum((designVar-designCentre).^2).^0.5;
end


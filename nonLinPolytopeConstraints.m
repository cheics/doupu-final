function [ g,geq ] = nonLinPolytopeConstraints( x, b)
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here
b=9;
geq1=(x(1)*x(2))*x(3).^(3/2)-b;
geq=[geq1];

g=[];
end


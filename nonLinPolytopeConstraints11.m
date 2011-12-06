function [ g,geq ] = nonLinPolytopeConstraints11( x )
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here
b=11;
geq1=(x(1)*x(2))*x(3).^(3/2)-b;
geq=[geq1];

g=[];
end


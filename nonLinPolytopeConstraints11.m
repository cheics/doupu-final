function [ g,geq ] = nonLinPolytopeConstraints11( x )
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here
% C, L, H

c=x(1);
l=x(2);
h=x(3);
b=11;
geq1=(c*l)*(h.^(3/2))-11;
geq=[geq1];

g=[];
end




function [ I ] = TwoGaussLeg(f,a,b)
%TwoGaussLeg: Use two point gauss legendre formula to approximate
%integration.
% Inputs:
% f=function
% a=lower bound
% b=upper bound
% 
% Outputs:
% I=integration approximation

x=((b+a)+(b-a))/2;
dx=(b-a)/2;

G=@(x)



end


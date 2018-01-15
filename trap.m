function [ I ] = trap( f,a,b,n )
%trap: Uses trap rule to approximate integral
%   Inputs: 
% f=function
% a=lower bound
% b=upper bound
% n=segments
% 
% Outputs:
% I=integral approximation

if nargin<3
    error('you messed up, more inputs')
end
if nargin<4
    n=1000
end

x=a;
h=(b-a)/n;
s=f(a);
for i=1:n-1
    x=x+h;
    s=s+2*f(x);
end
s=s+f(b);
I=(b-a)*s/(2*n);
    



end


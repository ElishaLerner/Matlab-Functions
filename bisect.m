function [ root,fx,ea,iter ] = bisect( func, xl, xu, es, maxit, varargin )
%bisect: Attempts to derive the root of a function using the bisect method.
% 
% inputs:
%func=the function being evaluated
%xl=the x component of the lower limit/bracket
%xu=the x component of the upper limit/bracket
%es=the relative error at which the program calls it "close enough,"
%defaults to .0001%
%maxit=the maximum number of iterations
%
%Outputs:
%root=the approximated root of the function
%fx=the function evaluated at the approximate root
%ea=the approximate relative error
%iter=how many iterations were performed

if nargin<3
    error ('at least 3 inputs are needed: no es bueno')
elseif nargin<4 || isempty(es)
    es=.0001;
end
if nargin < 5 || isempty(maxit)
    maxit = 50;
end

test = func(xl,varargin{:})*func(xu,varargin{:});

if test>0 
        error ('You didnt even try to bracket it did you?')
    elseif test==0
        error ('congrats I think you found a root, check your inputs')
end


iter= 0; 
xr= xl; 
ea= 100;

while iter < maxit && ea >= es
    xrold=xr;
    xr=(xl + xu) / 2;
    iter=iter + 1;
    
    if xr~=0
        ea=abs((xr-xrold)/xr);
    end
    
    % Bisection method, old guess becomes new bracket
    if func(xl,varargin{:})*func(xr,varargin{:}) < 0
        xu = xr;
    elseif func(xu,varargin{:})*func(xr,varargin{:}) < 0
        xl = xr;
    else
        ea = 0;
    end
    ea=ea*100;
    
end

% Set output variables
root = double(xr);
fx = double(func(xr, varargin{:}));
ea = double(ea);
iter = double(iter);
end


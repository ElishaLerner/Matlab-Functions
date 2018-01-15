function [ root,fx,ea,iter ] = falsePosition( func, xl , xu , es , varargin)
%falsePosition: Attempts to find the root of a function using the false
%position method. 
%
%inputs:
%func=the function being evaluated
%xl=the x component of the lower limit/bracket
%xu=the x component of the upper limit/bracket
%es=the relative error at which the program calls it "close enough,"
%defaults to .0001%
%
%Outputs:
%root=the approximated root of the function
%fx=the function evaluated at the approximate root
%ea=the approximate relative error
%iter=how many iterations were performed
%
%Note:Default number of iterations is 200
% 


if nargin<3
    error ('at least 3 inputs are needed: no es bueno')
elseif nargin<4 || isempty(es)
    es=.0001;
else
end

test = func(xl,varargin{:})*func(xu,varargin{:});

if test>0 
        error ('You didnt even try to bracket it did you?')
    elseif test==0
        error ('congrats I think you found a root, check your inputs')
end

iter = 0 ;
ea = 100;
Maxit = 200;
xr=xl;
while iter < Maxit && ea >= es
    xrold=xr;
    xr = xu - ((func(xu,varargin{:})*(xl-xu))/(func(xl,varargin{:})-func(xu,varargin{:})));
    iter=iter+1;
    
    if xr~=0
        ea=(abs((xr-xrold)/xr));
    end
 if func(xl,varargin{:})*func(xr,varargin{:}) < 0
        xu = xr;
    elseif func(xu,varargin{:})*func(xr,varargin{:}) < 0
        xl = xr;
    else
        ea = 0;
 end
 
end
root=double(xr);
fx=double(func(xr, varargin{:}));
ea=double(ea);
iter=double(iter);

end

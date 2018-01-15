function [ t,y ] = heun_lerner( dydt,tspan,y0,h,es,maxit )
%heun_lerner
% Uses the Heun method to solve a single ODS to the estimated stopping
% criterion.
% 
% 
% Inputs:
% dydt: Name of the m file that evaluates the ODE
% tspan: [ti,tf] where ti and tf= the start and end bounds of the independant
% variable
% y0: initial value of dependant variable
% h: step size
% es=stopping criterion in 
% maxit: maximum number of iterations
% 
% Outputs:
% t: vector of the independent variable
% y: vector of the solution for the depenent variable
% 

if nargin>6 
    error('too many input arguments')
end

if nargin==5
    maxit=50;
end

if nargin==4
    maxit=50;
    es=.001;
end

if nargin<4
    error('too few input args')
end

n=length(tspan);

if n~=2
    error('more than two values in tspan')
end

ti=tspan(1);
tf=tspan(2);

steps=(tf-ti)/h;

T=zeros(1,steps+1);
Y=zeros(1,steps+1);

T(1)=ti;
T(steps+1)=tf;
Y(1)=y0;

i=1;

for j=1:steps
    
    iter=1;
    ea=1000;
    
    T(j+1)=ti+h*j;
    
    slopeL=dydt(T(j),Y(j));
Y(i+1) = Y(i)+h*slopeL;

    while es<=ea && iter<maxit
        iter=iter+1;

slopeR=dydt(T(i+1),Y(i+1));

Ynew=Y(i)+h*(slopeL+slopeR)/2;

ea=(abs((Ynew-Y(i+1))/Ynew))*100
Y(i+1)=Ynew;
    end
    i=i+1;
end


t=T;
y=Y;
    
end


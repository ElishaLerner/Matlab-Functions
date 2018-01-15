function [ dydx, d2ydx2 ] = diffeq_lerner( x,y )
%diffeq_lerner: estimates first and second derivatives using 
% inputs:
% x=x values of function
% y=y values of function
% 
% outputs:
% dydx=first derivative estimate
% d2ydx2=second derivative estimate

n=length(x);

if n<5
    error('Needs at least 5 values')
end

if length(x)~=length(y)
    error('length does not match')
end

Q=diff(x);
if max(Q)-min(Q)>=10^-6
    error('Your spacing is messed up')
else 
    h=Q(1);
end

i=0;
%Forward
dydx=zeros(1,n);
d2ydx2=zeros(1,n);
for i=1:2
dydx(i)=(-3*y(i)+4*y(i+1)-y(i+2))/(2*h);
d2ydx2(i)=(-y(i+3)+4*y(i+2)-5*y(i+1)+2*y(i))/(h^2);
end

%Centered
for i=3:n-2
    dydx(i)=(-y(i+2)+8*y(i+1)-8*y(i-1)+y(i-2))/(12*h);
    d2ydx2(i)=(-y(i+2)+16*y(i+1)-30*y(i)+16*y(i-1)-y(i-2))/(12*h^2);
end

%Backwards
for i=n-2:n
    dydx(i)=(3*y(i)-4*y(i-1)+y(i-2))/(2*h);
    d2ydx2(i)=(2*y(i)-5*y(i-1)+4*y(i-2)-y(i-3))/(h^2);
end

subplot(2,2,1)
plot(x,y)
title('Function')
xlabel('x')
ylabel('y')

subplot(2,2,2)
plot(x,dydx)
title('First Derivative')
xlabel('x')
ylabel('dydx')

subplot(2,2,3)
plot(x,d2ydx2)
title('Second Derivative')
xlabel('x')
ylabel('d2ydx2')

end


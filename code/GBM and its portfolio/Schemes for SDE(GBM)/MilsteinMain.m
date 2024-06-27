%Create symbolic variable Xt
syms Xt

%Set Mu and sigma as constant
%mu=1;
sigma=0.36;

randn('state',100)

%set the remaining variables
N=1000;
K=10;
r=0.06;
T=1;
dt=T/N;
x0=10;

%Set 'a' and 'b' as functions of Xt 
a=@(Xt) r*Xt;
b=@(Xt) sigma*Xt;

%Set the random Wiener process term
dW=sqrt(dt)*randn(1,N+1);

%Compute the approximate values
xem1=MilsteinApprox(a,b,dW,N,dt,x0);

%Create empty vectors to store call and put values
call=zeros(N,1);
put=zeros(N,1);

%Create a set of x coordinates
xAxis=linspace(0,T,N);

%Iterate
for i=0:N-2

    %Find d11 and d12 using the formula
    d11=(log(xem1(i+1)/K)+(r+sigma^2/2)*(1-i*dt))/(sigma*sqrt((1-i*dt)));%cdf(d+)
    d12=(log(xem1(i+1)/K)+(r-sigma^2/2)*(1-i*dt))/(sigma*sqrt((1-i*dt)));%cdf(d-)
   
    %Calculate the call and put values using the formula
    call(i+1)=xem1(i+1)*normcdf(d11)-exp(-r*(1-i*dt))*K*normcdf(d12);
    put(i+1)=call(i+1)-xem1(i+1)+K*exp(-r*(T-xAxis(i+1)));
    
end

%Set the final call value
call(end)=max(xem1(end)-K,0);

%Plot the option prices

plot(xAxis,xem1)
%legend('Call','Put','approx')
title('One path of stock price Milstein Scheme');
xlabel('t');ylabel('X');

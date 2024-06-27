clear

%Set the initial data
N=1000;
T=1;
linspace(0,T,N);
xem3=zeros(N+1,1);
randn('state',100)
sigma=0.36;
r=0.06;
dt=T/N;
K=10;
x0=10;

%Set the random Wiener process term
dW=sqrt(dt)*randn(1,N+1);

%Set the RHS term outside the loop as it is constant
RHSTerm=(r-(sigma^2)/2)*dt;

xem3(1)=x0;

%Iterate N times
for j=2:N
    
    %Update the approximation term
    for i=1:j
        %Add the LHS term to the approximation
        xem3(j)=xem3(j)+sigma*dW(i);
    end
    
    %Arrive at the final approximation
    xem3(j)=x0*exp(xem3(j)+j*RHSTerm);
end

%Add the initial condition as the first value
%xem3=[10;xem3];

%Create empty vectors for call and put values
call=zeros(N,1);
put=zeros(N,1);
asset_no=zeros(N,1);

%Create a vector of x coordinates
xAxis=linspace(0,T,N);


%Iterate
for i=0:N-2

    %Find d11 and d12 using the formula
    d11=(log(xem3(i+1)/K)+(r+sigma^2/2)*(1-i*dt))/(sigma*sqrt((1-i*dt)));%cdf(d+)
    d12=(log(xem3(i+1)/K)+(r-sigma^2/2)*(1-i*dt))/(sigma*sqrt((1-i*dt)));%cdf(d-)
   
    %Calculate the call and put values using the formula
    call(i+1)=xem3(i+1)*normcdf(d11)-exp(-r*(1-i*dt))*K*normcdf(d12);
    put(i+1)=call(i+1)-xem3(i+1)+K*exp(-r*(T-xAxis(i+1)));
    asset_no(i+1)=xem3(i+1)*normcdf(d11);
end

%Set the final call value
call(end)=max(xem3(end)-K,0);

%Plot the call and put values
%plot(xAxis,call,'-')
%hold on
%plot(xAxis,put,'-')
%hold on
%plot(xAxis,xem(1:N))
%legend('Call','Put')
%hold off

plot(xAxis,xem3(1:N),'-')
hold on

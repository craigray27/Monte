%European-call option and put option solving by Merton's formula
weakeular=@Weakeular;
N=1000;
T=1;
dt=T/N;
r=0.06;
sigma=0.36;
x0=10;%stock price when t=0
K=10;%strike price

xem=zeros(1,1001);


xem=xem+weakeular(r,sigma,x0,T);

call=zeros(1,length(xem));
asset_no=zeros(1,length(xem));

delta=zeros(1001,1);
deltaasset=zeros(1001,1);

%Merton's formula, call option
for i=0:length(xem)-2
d11=(log(xem(i+1)/K)+(r+sigma^2/2)*(T-i*dt))/(sigma*sqrt((T-i*dt)));%cdf(d+)
d12=(log(xem(i+1)/K)+(r-sigma^2/2)*(T-i*dt))/(sigma*sqrt((T-i*dt)));%cdf(d-)
call(i+1)=xem(i+1)*normcdf(d11)-exp(-r*(T-i*dt))*K*normcdf(d12);
asset_no(i+1)=xem(i+1)*normcdf(d11);
delta(i+1)=normcdf(d11);
deltaasset(i+1)=normcdf(d11)+1/(sigma*sqrt((T-i*dt)))*normpdf(d11);
end

call(end)=max(xem(end)-K,0);
delta(end)=normcdf((log(xem(end)/K)+(r+sigma^2/2)*(T-dt))/(sigma*sqrt((T-dt))));
deltaasset(end)=delta(end)+1/(sigma*sqrt((T-dt)))*normpdf((log(xem(end)/K)+(r+sigma^2/2)*(T-dt)));
t=0:dt:T;
put=call-xem+K*exp(-r*(T-t));
plot(t,call,'-')
hold on
plot(t,put)
hold on
plot(t,asset_no)
hold off
legend('European call','European put','Asset call')
ylabel('V')
xlabel('t')



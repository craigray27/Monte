%European-call option and put option solving by Merton's formula

weakeular=@Weakeular;
N=240;
T=1;
dt=T/N;
Untitled=2.7*ones(240,1);
r=Untitled/100;
sigma=0.36;
x0=10;%stock price when t=0
K=10;%strike price

xem=zeros(1,241);


xem=xem+weakeular(r,sigma,x0,T);

call=zeros(1,length(xem));
asset_no=zeros(1,length(xem));


t=0:dt:T;
plot(t,xem/xem(1),'-')
ylabel('D(Billion)')
xlabel('t')



%GBM under EMM Q not measure P, 
%note you should do the same change in other models where B(t)=B0exp(rt)

function xem=Weakeular(r,sigma,x0,T)%r is short interest rate
randn('state',100)
%similar to set.seed() in R language

N=240;

dt=T/N; %time steps
dw=sqrt(dt)*randn(1,N);
R=1;Dt=R*dt;L=N/R;
xem=zeros(1,L);
S=x0;

for j=1:L
    winc=sum(dw(R*(j-1)+1:R*j));
    S=S+Dt*r(j)*S+sigma*S*winc;%weak-eular
    xem(j)=S;
end

xem=[x0,xem];
end





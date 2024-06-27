%GBM under EMM Q not measure P, 
%note you should do the same change in other models where B(t)=B0exp(rt)

function S=montenotGBM(rem,sigma,x0,T)%r is short interest rate

%similar to set.seed() in R language

N=1000;

dt=T/N; %time steps
dw=sqrt(dt)*randn(1,N);
R=1;Dt=R*dt;L=N/R;
S=x0;

for j=1:L
    winc=sum(dw(R*(j-1)+1:R*j));
    S=S+Dt*(rem(j)*S)+sigma*S*winc;%weak-eular
end
end
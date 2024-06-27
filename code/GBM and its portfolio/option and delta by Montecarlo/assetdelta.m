%European call monte carlo
x0=10;
r=0.06;
sigma=0.36;
T=1;
K=10;
delta=[];
dt=0.005; %time steps, you can change here to get different results

j=dt;
M=floor(1/(j^2));%relationship between dt and M
Y1=(x0-sqrt(j))*ones(M,1);
Y2=(x0+sqrt(j))*ones(M,1);
Ymonte=(x0)*ones(M,1);
i=0;
 
while i*j<1
    w1=sqrt(j)*randn(M,1);
    w2=sqrt(j)*randn(M,1);
    Y1=Y1+r*Y1*j+sigma*Y1.*w1;
    Y2=Y2+r*Y2*j+sigma*Y2.*w2;
    Ymonte=Ymonte+r*Ymonte*j+sigma*Ymonte.*w1;
    i=i+1;
end
call01=exp(-0.06)*mean((Y1.*max(Y1-K,0))./(Y1-K));
call02=exp(-0.06)*mean((Y2.*max(Y2-K,0))./(Y2-K));
callmonte=exp(-0.06)*mean((Ymonte.*max(Ymonte-K,0))./(Ymonte-K))
lenu=1.96*std(max(Ymonte-K,0))/sqrt(M)
delta0=(call02-call01)/(2*sqrt(dt))

lendelta=1.96*sqrt(var(max(Y1-K,0))+var(max(Y2-K,0)))/sqrt(M)



x0=10;
r=0.06;
sigma=0.36;
T=1;
K=10;
ExXT=x0*exp(r)*T;



Ehat=zeros(10,1);
dt=[0.005,0.01,0.02,0.05,0.1]; %time steps
err=[];
err2=[];
lengthsd=[];
lengthsdana=[];
lengthsdmill=[];

for j=dt
    M=floor(1/(j^2));
    Y=x0*ones(M,1);
    Ymill=x0*ones(M,1);
    i=0;
    
while i*j<1
    w=sqrt(j)*randn(M,1);
    w2=sqrt(j)*randn(M,1);
    Ymill=Ymill+r*Ymill*j+sigma*Ymill.*w+0.5*sigma*Ymill*sigma.*(w2.^2-j);
    Y=Y+r*Y*j+sigma*Y.*w;
    i=i+1;
    
end

Ehat1=mean(Y);
Ehat2=mean(Ymill);
err(end+1)=abs(ExXT-Ehat1);
err2(end+1)=abs(ExXT-Ehat2);
lengthsd(end+1)=log(2*1.96*std(Y)/sqrt(M));
lengthsdmill(end+1)=log(2*1.96*std(Ymill)/sqrt(M));

end
ldt=log(dt);
plot(log(dt),lengthsd);
hold on
plot(log(dt),lengthsdmill);
hold on
plot(log(dt),log(dt))

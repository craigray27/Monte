function rem=CIR(a,b,sigma,r0,T,N)

dt=T/N; %time steps
dw=sqrt(dt)*randn(1,N);
R=1;Dt=R*dt;L=N/R;
rem=zeros(1,L);
r=r0;


for j=1:L
    winc=sum(dw(R*(j-1)+1:R*j));
    r=r+a*Dt+sigma*winc;%weak-eular
    rem(j)=r;
end

rem=[r0,rem];

end
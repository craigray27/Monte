load('aonmonte.mat')
t=0:0.001:1;
Delta=zeros(1001,1);
cash=zeros(1001,1);
call2=asset_no;
x=xem;
rem=6*ones(1001,1);
portfoli=zeros(1001,1);
rem=rem/100;
Delta(1)=deltaasset(1);

cash(1)=call2(1)-Delta(1)*x(1);%change here to get

portfoli(1)=Delta(1)*x(1)+cash(1);
for i=2:1001
    if i<1001
    Delta(i)=deltaasset(i);
   
    cash(i)=(1+rem(i)*0.001)*cash(i-1)+(Delta(i-1)-Delta(i))*x(i);
    portfoli(i)=Delta(i)*x(i)+cash(i);
    else
    Delta(i)=delta(i);
    cash(i)=(1+rem(i)*0.001)*cash(i-1)+(Delta(i-1)-Delta(i))*x(i);
    portfoli(i)=Delta(i)*x(i)+cash(i);
    end
end


plot(t,portfoli)
hold on
plot(t,asset_no)
hold on
plot(t,aonmonte)
legend('portfolio','Asset Merton','Asset call Monte M=10000')

ylabel('V')
xlabel('t')


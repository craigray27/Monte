clear clc
t=0:0.001:1;
Delta=zeros(1001,1);
cash=zeros(1001,1);
portfoli=zeros(1001,1);
rem=rem/100;
Delta(1)=(call2(2)-call2(1))/(x(2)-x(1));
cash(1)=call2(1)-Delta(1)*x(1);
portfoli(1)=Delta(1)*x(1)+cash(1);
for i=2:1001
    if i<1001
        Delta(i)=0.5*((call2(i+1)-call2(i))/(x(i+1)-x(i))+(call2(i)-call2(i-1))/(x(i)-x(i-1)));
   
    cash(i)=(1+rem(i)*0.001)*cash(i-1)+(Delta(i-1)-Delta(i))*x(i);
    portfoli(i)=Delta(i)*x(i)+cash(i);
    else
    Delta(i)=(call2(i)-call2(i-1))/(x(i)-x(i-1));
    cash(i)=(1+rem(i)*0.001)*cash(i-1)+(Delta(i-1)-Delta(i))*x(i);
    portfoli(i)=Delta(i)*x(i)+cash(i);
    end
end

plot(t,portfoli)
hold on
plot(t,call2)
legend('portfolio','European call option PDE')

ylabel('V')
xlabel('t')
%From line 32 to line 39 plots the solution to PDE,delete all '%' if you wanna see
%this picture

%[x1=0:0.001:20;
%t1=0:0.001:1;
%[X,Y]=meshgrid(x1,t1);
%mesh(X,Y,V');
%ylabel('time')
%xlabel('Stock price')
%zlabel('u(t,x)')
%title('PDE method')] 

err=sum((call2-portfoli).^2)/1001;

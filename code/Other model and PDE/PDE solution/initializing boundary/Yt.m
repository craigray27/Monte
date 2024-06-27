Y=zeros(1001,1);
Y(1)=1;
load('rem1.mat')
rem=rem/100;
in=@integrade;
y=cumsum(integrade(rem));
for i=2:1001
    Y(i)=Y(1)*exp(y(i));
end
t=0:0.001:1;
plot(t,Y)
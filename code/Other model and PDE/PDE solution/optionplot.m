load('rem.mat')
load('Yt.mat')
load('Zt.mat')
load('notGBMx.mat')%here
load('P.mat')%here
load('V4.mat')%here
V=V';
option=zeros(1001,1);
call2=zeros(1001,1);
C=1.6370e-04;
t=0:0.001:1;
plotx=round(x*1000);
for i=0:1000
        option(i+1)=V(plotx(i+1),i+1)+Zt(i+1)+(1-i*0.001)*C*x(i+1)*Y(i+1);
        call2(i+1)=option(i+1)+x(i+1)-10*P(i+1);
end

plot(t,call2)
hold on
plot(t,option)
legend('call','put')

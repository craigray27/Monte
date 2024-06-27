clear clc
sde=@montenotGBM;
load('rem.mat')
load('Yt.mat')
load('Zt.mat')
load('notGBMx.mat')
rem=rem/100;
xem=x;
C=1.6370e-04;
sigma=0.36;
x0=10;
T=1;
call=zeros(1,1001);
for j=1:1001
    V=0;
    x0=xem(j);
for i=1:10000
s=sde(rem,sigma,x0,T);
V=V+max(s-10,0)*Y(end)+Zt(end);
end
call(j)=V/10000;
end
t=0:0.001:1;
plot(t,call)
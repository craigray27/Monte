clear clc
sde=@notGBM;
load('rem.mat')
rem=rem/100;
C=1.6370e-04;
sigma=0.36;
x0=10;
T=1;
V=zeros(1,100000);
for i=1:5
x=notGBM(C,rem,sigma,x0,T);

t=0:0.001:T;
plot(t,x)
hold on
end
hold off
xlabel('t')
ylabel('X')
legend('Several paths of model not GBM')


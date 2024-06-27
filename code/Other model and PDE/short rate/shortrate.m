C=@CIR;
a= 0.24044417;
b=0.4481835 ;
r0=0.41;
sigma=0.025655528;
N=6000;
T=60;
dt=T/N;
load('shortrate.mat')
rate=Untitled(10:end);
ratr=rate';
rate=flip(rate);

rem=C(a,b,sigma,r0,T,N);

t=0:dt:T;
t=t/30;
plot(t,rem)
xlabel('time')
ylabel('Recovery rate')


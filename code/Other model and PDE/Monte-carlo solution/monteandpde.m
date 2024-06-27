load('callnotgbmmonte')
load('call2')
t=0:0.001:1;
node=0.982238551749314;
callm=call;
callm=node*callm;
plot(t,call)
hold on
plot(t,call2)
legend('Monte-carlo','PDE')
title('European call option driven by not GBM model')
err=sum((callm-call2').^2)/1001;

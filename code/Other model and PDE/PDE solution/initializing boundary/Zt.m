load('Yt1.mat')
load('notGBMx1.mat')
load('rem1.mat')
Zt=zeros(1001,1);
C=1.6370e-04;
for i=2:1001
    Zt(i)=Zt(i-1)+C*x(i-1)*Y(i-1)*0.001;

end
sum(Zt)
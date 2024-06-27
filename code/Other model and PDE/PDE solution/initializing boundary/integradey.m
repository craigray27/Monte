load('Yt1.mat')
integrade=0;
for i=1:1000
    integrade=integrade+(Y(i)+Y(i+1))*0.001;
end
integrade=integrade+Y(1001)*0.001;
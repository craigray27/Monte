function y=integrade(rem)
n=length(rem);
for i=1:n
    if i<n
     y(i)=0.001*(-rem(i)-rem(i+1))/2;
    else
     y(i)=-rem(i)*0.001;
    end
end
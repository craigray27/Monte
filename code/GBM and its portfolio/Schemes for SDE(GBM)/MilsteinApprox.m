%Function to compute the Milstein scheme for a given Ito SDE
function Y = MilsteinApprox(a,b,dW,N,dt,x0)

    syms Xt;
    bdash=diff(b,Xt);

    Y=zeros(N,1);
    Y(1)=x0;
    
    for i=1:N-1
        Y(i+1)=Y(i)+a(Y(i))*dt+b(Y(i))*dW(i)+0.5*b(Y(i))*subs(bdash,Xt,Y(i))*((dW(i))^2-dt);
    end

end
dt=0.001;
h=0.01;
sigma=0.36;
K=10;
T=1;
c=0;

load('Yt.mat')
load('notGBMx.mat')
load('rem.mat')
load('Zt.mat')
load('P.mat')

rem=rem/100;
stock=x';
top=20001;
V=zeros(1001,top);
theta=zeros(top,1); 

 for i=0:top-1
     
  if i<=1000
      V(i+1,1)=K*Y(end)/Y(i+1);%x=0
      V(i+1,end)=0;%x=K
      V(end,i+1)=max(K-h*i,0);%t=T
      theta(i+1)=sigma^2*h^2*i^2/2;
    
  else
     V(end,i+1)=max(K-h*i,0);
     theta(i+1)=sigma^2*h^2*i^2/2;
  end
 end
  alpha=(rem(1:end-1)+rem(2:end))/2;
  theta=theta(2:end-1);
  d1=zeros(top-3,1);
  d2=zeros(top-2,1);
  d3=zeros(top-3,1);
  F=zeros(top-2,top-2);
  cnum=zeros(top-3,1);
  ita=zeros(top-3,1);
  for k=999:-1:0
      for j=1:top-2
          ita(j)=((rem(k+1))*j*h+(rem(k+2))*j*h)/2;
          if j>1 && j<top-2
              cnum(j)=c;
          
          d1(j-1)=-theta(j)/(2*h^2);
          d2(j)=1/dt+alpha(k+1)/2+c/(2*h)-ita(j)/(2*h)+theta(j)/h^2;
          d3(j)=-c/(2*h)+ita(j)/(2*h)-theta(j)/(2*h^2);
          %
          F(j,j-1)=theta(j)/(2*h^2);
          F(j,j)=1/dt-alpha(k+1)/2-c/(2*h)+ita(j)/(2*h)-theta(j)/h^2;
          F(j,j+1)=c/(2*h)-ita(j)/(2*h)+theta(j)/(2*h^2);
          
          elseif j==1
              cnum(j)=c+theta(j)/(2*h^2)*V(k+2,1)+theta(j)/(2*h^2)*V(k+1,1);
              
          d3(j)=-c/(2*h)+ita(j)/(2*h)-theta(j)/(2*h^2);
          d2(j)=1/dt+alpha(k+1)/2+c/(2*h)-ita(j)/(2*h)+theta(j)/h^2;
          %
          F(j,j)=1/dt-alpha(k+1)/2-c/(2*h)+ita(j)/(2*h)-theta(j)/h^2;
          F(j,j+1)=c/(2*h)-ita(j)/(2*h)+theta(j)/(2*h^2);
          else
             B=-c/(2*h)+ita(j)/(2*h)-theta(j)/(2*h^2);
             D=c/(2*h)-ita(j)/(2*h)+theta(j)/(2*h^2);
             cnum(j)=c+B*V(k+2,end)-D*V(k+1,end);
              
             d1(j-1)=-theta(j)/(2*h^2);
             d2(j)=1/dt+alpha(k+1)/2+c/(2*h)-ita(j)/(2*h)+theta(j)/h^2;
             
             %
             F(j,j-1)=theta(j)/(2*h^2);
             F(j,j)=1/dt-alpha(k+1)/2-c/(2*h)+ita(j)/(2*h)-theta(j)/h^2;        
          end
          
    
      end%end of j
      d=F*V(k+2,2:end-1)'+cnum;
      V(k+1,2:end-1)=tridisolve(d1,d2,d3,d);
  end
  

  
  %end of function
  
library(stats4)
require(sde)
library(RMySQL) 
library(matlab) 
 
con <- dbConnect(MySQL(),host="localhost",dbname="stock",user="root",password="xyqlzy3434")  
 
summary(con)  
dbGetInfo(con)  
dbListTables(con)  
R<-dbReadTable(con,"realshortrate")
X<-as.matrix(R$shortrate[11:240])
X<-rev(X)

theta_est_lr<-c(0,0,0)
n<-length(X)
y<-X[2:n]
x<-X[1:(n-1)]
fit_lr<-lm(y~x)
deltaT<-0.25
theta_est_lr[1] = fit_lr$coefficients[1]/deltaT
theta_est_lr[2] = (1.0 - fit_lr$coefficients[2])/deltaT
theta_est_lr[3] = sd(fit_lr$residuals/sqrt(x))/sqrt(deltaT)

dcCIR<-function(x,t,x0,theta){
    c<-2*theta[2]/((1-exp(-theta[2]*t))*theta[3]^2)
    u <-c*x0*exp(-theta[2]*t)
    q<-2*theta[1]/theta[3]^2
    v<-c*x
    lik<-(log(dchisq(2*sqrt(u*v), df=q,ncp=u,log=Ture))+log(c)-(u+v)*q/2*log(u/v))

}
CIR.lik<-function(theta1,theta2,theta3){
    n<-length(X)
    dt<-0.25
    -sum(dcCIR(x=X[2:n], t=dt, x0=X[1:(n-1)], theta=c(theta1,theta2,theta3)))
}    
fit_mle<-mle(CIR.lik, start=list(theta1=theta_est_lr[1], theta2=theta_est_lr[2], theta3=theta_est_lr[3]), method="BFGS")
fit_mle

theta=c(11.3615516 , 8.4088870 , 0.2533034) 
set.seed(20)
test=sde.sim(X0=11, model="CIR", theta=theta_est_lr,N=240, delta=0.25)
plot(test)

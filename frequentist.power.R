setwd("C:\\Shrabanti\\Work")
source("./power_poisson_functions.R")

### Power curve for different theta for lamR=21 and lamP=7 ###
lamR<-21
lamP<-7

p_star<-0.975

lamE<-seq(14,22,0.1)
  
n<-100

power1f<-power_theta_fn_freq(theta=0.8) 
power2f<-power_theta_fn_freq(theta=0.75)
power3f<-power_theta_fn_freq(theta=0.7)
power4f<-power_theta_fn_freq(theta=0.65)

par(mfrow=c(1,1))

### plot for lamR=21, lamP=7 ###
plot(lamE,power1f,type ="l",lty=1,col=1,lwd=2,xlab=expression(lambda[E]),ylab="power")
points(lamE,power2f,type ="l",lty=2,col=2,lwd=2)
points(lamE,power3f,type="l",lty=3,col="blue",lwd=2)
points(lamE,power4f,type="l",lty=4,col="green4",lwd=2)
abline(h=0.8,col="1",lty=2)
abline(h=0.025,col="2",lty=2)
legend(20,0.4,inset=0,legend=c(expression(paste(theta,"=0.8")),expression(paste(theta,"=0.75")),expression(paste(theta,"=0.7")),expression(paste(theta,"=0.65"))),lty=c(1,2,3,4),col=c("black","red","blue","green4"),lwd=rep(2,4),cex=1,horiz=F,bty="n")



### Power curve for different theta for lamR=7 and lamP=1 ###
lamR<-7
lamP<-1

p_star<-0.975

lamE<-seq(4,9,0.1)

n<-100

power1f<-power_theta_fn_freq(theta=0.8)
power2f<-power_theta_fn_freq(theta=0.7)
power3f<-power_theta_fn_freq(theta=0.6)
power4f<-power_theta_fn_freq(theta=0.5)

############ plot for lambda_R=7, lambdaP=1 ##############
plot(lamE,power1f,type ="l",lty=1,col=1,lwd=2,xlab=expression(lambda[E]),ylab="power")
points(lamE,power2f,type ="l",lty=2,col=2,lwd=2)
points(lamE,power3f,type="l",lty=3,col="blue",lwd=2)
points(lamE,power4f,type="l",lty=4,col="green4",lwd=2)
abline(h=0.025,col="2",lty=2)
legend(8,0.4,inset=0,legend=c(expression(paste(theta,"=0.8")),expression(paste(theta,"=0.7")),expression(paste(theta,"=0.6")),expression(paste(theta,"=0.5"))),lty=c(1,2,3,4),col=c("black","red","blue","green4"),lwd=2,cex=1,horiz=F,bty="n")


### Sample size calculation for power=0.8 ###

lamR<-21
lamP<-7

p_star<-0.975

### sample size table ###
n.table.freq<-NULL
r.alloc.list<-matrix(c(1,1,1,1,2,2,1,2,3),3,3)

for (i.r.alloc in c(1:3))
{
  r.alloc<-r.alloc.list[i.r.alloc,]
  for (theta in c(0.8,0.75))
  {
    for (lamE in c(20,19.7,19.4,19.1,18.8))
    {
      n<-samplesize_fn_freq(r.alloc=r.alloc,lamE=lamE,theta=theta)
      n.table.freq<-rbind(n.table.freq,c(r.alloc=r.alloc,lamE=lamE,theta=theta,n.freq=n))
    }
  }
}

save(n.table.freq,file="n.table.freq.RData")

### Power curves for different allocation ###
N<-300

theta=0.8
lamR<-21
lamP<-7

p_star<-0.975

lamE<-seq(14,22,.1)

### power curve for equal allocation ###
r.alloc<-c(1,1,1)
n<-N/sum(r.alloc)
power<-power_freq(r.alloc=r.alloc,n=n,lamE=lamE,theta=theta)

plot(lamE,power, sub=expression(paste("N=300", " , ", theta, "=0.8")),type="b",col=1,lwd=2,xlab=expression(lambda[E]),pch=0,lty=1)

### power curve for allocation P:R:E = 1:2:2 ###
r.alloc<-c(1,2,2)
n<-N/sum(r.alloc)
power<-power_freq(r.alloc=r.alloc,n=n,lamE=lamE,theta=theta)

points(lamE,power,type="b",col=2,lwd=2,pch=1,lty=2)

### power curve for allocation P:R:E = 1:2:3 ###

r.alloc<-c(1,2,3)
n<-N/sum(r.alloc)
power<-power_freq(r.alloc=r.alloc,n=n,lamE=lamE,theta=theta)

points(lamE,power,type="b",col="green4",lwd=2,pch=2,lty=3)

legend(20,0.4,inset=0,legend=c("(1:1:1)","(1:2:2)","(1:2:3)"),col=c("black","red","green4"),lwd=2,cex=1,horiz=F,bty="n",pch=c(0:2),lty=c(1:3))

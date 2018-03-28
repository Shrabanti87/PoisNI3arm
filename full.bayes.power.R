setwd("C:\\Shrabanti\\Work")
# source('./power_poisson_functions.R')

seedval<-123

# Fully Bayesian power #

  #### Power curve for different theta for lamR=21 and lamP=7 ###
  lamR<-21
  lamP<-7
  
  p_star<-0.975
  
  lamE<-seq(14,22,0.1)
  
  n<-100
  T<-1000
  n_star<- 1000
  
  power1b<-power_theta_fn_fbayes(theta=0.8)
  power2b<-power_theta_fn_fbayes(theta=0.75)
  power3b<-power_theta_fn_fbayes(theta=0.7)
  power4b<-power_theta_fn_fbayes(theta=0.65)
  
  ############ plot for lambda_R=21, lambdaP=7 ##############
  
  plot(lamE,power1b,type ="l",lty=1,col=1,lwd=2,xlab=expression(lambda[E]),ylab="power")
  points(lamE,power2b,type ="l",lty=2,col=2,lwd=2)
  points(lamE,power3b,type="l",lty=3,col="blue",lwd=2)
  points(lamE,power4b,type="l",lty=4,col="green4",lwd=2)
  abline(h=0.8,col="1",lty=2)
  abline(h=0.025,col="2",lty=2)
  legend(20,0.4,inset=0,legend=c(expression(paste(theta,"=0.8")),expression(paste(theta,"=0.75")),expression(paste(theta,"=0.7")),expression(paste(theta,"=0.65"))),lty=c(1,2,3,4),col=c("black","red","blue","green4"),lwd=rep(2,4),cex=1,horiz=F,bty="n")
  
### Power curve for different theta for lamR=7 and lamP=1 ###
  lamR<-7
  lamP<-1
  
  p_star<-0.975
  
  lamE<-seq(4,9,0.1)
  
  n<-100
  T<-1000 ### samples ###
  n_star<-1000 ### No. of simulations ###
  
  power1b<-power_theta_fn_fbayes(theta=0.8)
  power2b<-power_theta_fn_fbayes(theta=0.7)
  power3b<-power_theta_fn_fbayes(theta=0.6)
  power4b<-power_theta_fn_fbayes(theta=0.5)
  
  ############ plot for lambda_R=7, lambdaP=1 ##############
  plot(lamE,power1b,type ="l",lty=1,col=1,lwd=2,xlab=expression(lambda[E]),ylab="power")
  points(lamE,power2b,type ="l",lty=2,col=2,lwd=2)
  points(lamE,power3b,type="l",lty=3,col="blue",lwd=2)
  points(lamE,power4b,type="l",lty=4,col="green4",lwd=2)
  abline(h=0.8,col="1",lty=2)
  abline(h=0.025,col="2",lty=2)
  legend(8,0.4,inset=0,legend=c(expression(paste(theta,"=0.8")),expression(paste(theta,"=0.7")),expression(paste(theta,"=0.6")),expression(paste(theta,"=0.5"))),lty=c(1,2,3,4),col=c("black","red","blue","green4"),lwd=rep(2,4),cex=1,horiz=F,bty="n")
  
  #### Sample size calculation for power=0.8 ####
  
  n_star<-1000 ### No. of simulations ###
  T<-1000 ### samples ###

  p_star<-0.975

  lamR<-21
  lamP<-7

  r.alloc.list<-matrix(c(1,1,1,1,2,2,1,2,3),3,3)
load("n.table.freq.RData")
  fullbayes.table<-NULL
counter=1
  for (i.r.alloc in c(1:3))
  {
    r.alloc<-r.alloc.list[i.r.alloc,]
    for (theta in c(0.8,0.75))
    {
      for (lamE in c(20,19.7,19.4,19.1,18.8))
      {
      n<-samplesize_fn_fbayes(r.alloc=r.alloc,lamE=lamE,theta=theta,a_max=n.table.freq[counter,6])
      counter=counter+1 
      fullbayes.table<-rbind(fullbayes.table,c(r.alloc=r.alloc,lamE=lamE,theta=theta,n=n))
      }
    }
  }

### Power curves for different allocation ###

N<-300

theta=0.8
lamR<-21
lamP<-7

p_star<-0.975
n_star<-1000 ### No. of simulations ###
T<-1000 ### samples ###

lamE<-seq(14,22,.1)

### power curve for equal allocation ###
r.alloc<-c(1,1,1)
n<-N/sum(r.alloc)

power<-NULL
for (each.lamE in lamE)
{
  power<-c(power,power_fbayes(r.alloc=r.alloc,n=n,lamE=each.lamE,theta=theta))
}

plot(lamE,power, sub=expression(paste("N=300", " , ", theta, "=0.8")),type="b",col=1,lwd=2,xlab=expression(lambda[E]),pch=0,lty=1)

### power curve for allocation P:R:E = 1:2:2 ###
r.alloc<-c(1,2,2)
n<-N/sum(r.alloc)

power<-NULL
for (each.lamE in lamE)
{
  power<-c(power,power_fbayes(r.alloc=r.alloc,n=n,lamE=each.lamE,theta=theta))
}

points(lamE,power,type="b",col=2,lwd=2,pch=1,lty=2)

### power curve for allocation P:R:E = 1:2:3 ###

r.alloc<-c(1,2,3)
n<-N/sum(r.alloc)

power<-NULL
for (each.lamE in lamE)
{
  power<-c(power,power_fbayes(r.alloc=r.alloc,n=n,lamE=each.lamE,theta=theta))
}

points(lamE,power,type="b",col="green4",lwd=2,pch=2,lty=3)

legend(0.4,20,inset=0,legend=c("(1:1:1)","(1:2:2)","(1:2:3)"),col=c("black","red","green4"),lwd=2,cex=1,horiz=F,bty="n",pch=c(0:2),lty=c(1:3))


### Informative vs. non-informative power curves ###

### informative ###
lamR<-7
lamP<-1

p_star<-0.975
n_star<-1000 ### No. of simulations ###
T<-1000 ### samples ###

lamE<-seq(4,10,.1)

n=20
power.info1<-power.info_theta_fn(theta=0.8)
n=50
power.info2<-power.info_theta_fn(theta=0.8)
n=100
power.info3<-power.info_theta_fn(theta=0.8)
n=200
power.info4<-power.info_theta_fn(theta=0.8)

### non-info ###
lamR<-7
lamP<-1

p_star<-0.975
n_star<-1000 ### No. of simulations ###
T<-1000 ### samples ###

lamE<-seq(4,10,.1)

n=20
power.noninfo1<-power.noninfo_theta_fn(theta=0.8)
n=50
power.noninfo2<-power.noninfo_theta_fn(theta=0.8)
n=100
power.noninfo3<-power.noninfo_theta_fn(theta=0.8)
n=200
power.noninfo4<-power.noninfo_theta_fn(theta=0.8)


############ plot for info vs. non-info ##############
par(mfrow=c(2,2))

plot(lamE,power.info1,type ="l",lty=1,col="green4",lwd=2,xlab=expression(lambda[E]),ylab="power",sub="n=20, N=60")
points(lamE,power.noninfo1,type ="l",lty=2,col=2,lwd=2)
legend("topleft",inset=0,legend=c("info","noninfo"),lty=c(1,2),col=c("green4","red"),lwd=rep(2,2),cex=1,horiz=F,bty="n")

plot(lamE,power.info1,type ="l",lty=1,col="green4",lwd=2,xlab=expression(lambda[E]),ylab="power",sub="n=20, N=150")
points(lamE,power.noninfo1,type ="l",lty=2,col=2,lwd=2)
legend("topleft",inset=0,legend=c("info","noninfo"),lty=c(1,2),col=c("green4","red"),lwd=rep(2,2),cex=1,horiz=F,bty="n")

plot(lamE,power.info1,type ="l",lty=1,col="green4",lwd=2,xlab=expression(lambda[E]),ylab="power",sub="n=100, N=300")
points(lamE,power.noninfo1,type ="l",lty=2,col=2,lwd=2)
legend("topleft",inset=0,legend=c("info","noninfo"),lty=c(1,2),col=c("green4","red"),lwd=rep(2,2),cex=1,horiz=F,bty="n")

plot(lamE,power.info1,type ="l",lty=1,col="green4",lwd=2,xlab=expression(lambda[E]),ylab="power",sub="n=200, N=600")
points(lamE,power.noninfo1,type ="l",lty=2,col=2,lwd=2)
legend("topleft",inset=0,legend=c("info","noninfo"),lty=c(1,2),col=c("green4","red"),lwd=rep(2,2),cex=1,horiz=F,bty="n")


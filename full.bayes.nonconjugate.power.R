setwd("C:/BACKUP/Shrabanti/jrssc codes/")
source("./power_poisson_functions.R")

time<-proc.time()

library(arm)
library(rjags)
library(coda)

n_star<-1000 ### No. of simulations ###
T<-1000 ### samples ###

lamR<-7
lamP<-1
tE<-1
tR<-1
tP<-1
p_star<-0.975
lamE<-seq(4,8,0.1)

power.N300.th7<-power_theta_fn_nonconjug(N=300,theta=0.7)
power.N300.th6<-power_theta_fn_nonconjug(N=300,theta=0.6)
power.N150.th7<-power_theta_fn_nonconjug(N=150,theta=0.7)
power.N150.th6<-power_theta_fn_nonconjug(N=150,theta=0.6)

########## Power Curve Plots under Non-Conjugate Prior for N=300 ###########
par(mfrow=c(1,2))

plot(lamE,power.N300.th7,sub=expression(paste("N=300")),type="l",col="2",lwd=2,xlab=expression(lambda[E]),ylab="power",lty=1)
points(lamE,power.N300.th6,type="l",col="green4",lwd=2,lty=2)
legend(6.3,0.4,inset=0,legend=c(expression(paste(theta,"=0.7")),expression(paste(theta,"=0.6"))),col=c("red","green4"),lwd=2,lty=c(1,2),cex=1,horiz=F,bty="n")

########## Power Curve Plots under Non-Conjugate Prior for N=150 ###########
plot(lamE,power.N150.th7,sub=expression(paste("N=150")),type="l",col="2",lwd=2,xlab=expression(lambda[E]),ylab="power",lty=1)
points(lamE,power.N150.th6,type="l",col="green4",lwd=2,lty=2)
legend(6.3,0.4,inset=0,legend=c(expression(paste(theta,"=0.7")),expression(paste(theta,"=0.6"))),col=c("red","green4"),lty=c(1,2),lwd=2,cex=1,horiz=F,bty="n")


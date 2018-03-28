setwd('C:/BACKUP/Shrabanti/jrssc codes')
source('./power_poisson_functions.R')

library(arm)
library(rjags)
library(coda)

T<-1000 ### posterior samples ###
p_star<-0.975

############ 1 year ##############
### noninfo ###
prob.theta.8<-data.nc.noninfo1(0.8)
prob.theta.75<-data.nc.noninfo1(0.75)
prob.theta.7<-data.nc.noninfo1(0.7)
prob.theta.65<-data.nc.noninfo1(0.65)
prob.theta.6<-data.nc.noninfo1(0.6)
prob.theta.55<-data.nc.noninfo1(0.55)
prob.theta.5<-data.nc.noninfo1(0.5)

### info ###
prob.theta.8<-data.nc.info1(0.8)
prob.theta.75<-data.nc.info1(0.75)
prob.theta.7<-data.nc.info1(0.7)
prob.theta.65<-data.nc.info1(0.65)
prob.theta.6<-data.nc.info1(0.6)
prob.theta.55<-data.nc.info1(0.55)
prob.theta.5<-data.nc.info1(0.5)

############ 2 year ##############

### noninfo ###
prob.theta.8<-data.nc.noninfo2(0.8)
prob.theta.75<-data.nc.noninfo2(0.75)
prob.theta.7<-data.nc.noninfo2(0.7)
prob.theta.65<-data.nc.noninfo2(0.65)
prob.theta.6<-data.nc.noninfo2(0.6)
prob.theta.55<-data.nc.noninfo2(0.55)
prob.theta.5<-data.nc.noninfo2(0.5)

### info ###
prob.theta.8<-data.nc.info2(0.8)
prob.theta.75<-data.nc.info2(0.75)
prob.theta.7<-data.nc.info2(0.7)
prob.theta.65<-data.nc.info2(0.65)
prob.theta.6<-data.nc.info2(0.6)
prob.theta.55<-data.nc.info2(0.55)
prob.theta.5<-data.nc.info2(0.5)



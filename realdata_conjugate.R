setwd('C:/BACKUP/Shrabanti/jrssc codes')
source('./power_poisson_functions.R')

library(arm)
library(rjags)
library(coda)

########### realdata ####################

  T<-1000 ### posterior samples ###

  p_star<-0.975

############ 1 year ##############

### non-informative ###
prob.theta.8<-data.noninfo1(0.8)
prob.theta.75<-data.noninfo1(0.75)
prob.theta.7<-data.noninfo1(0.7)
prob.theta.65<-data.noninfo1(0.65)
prob.theta.6<-data.noninfo1(0.6)
prob.theta.55<-data.noninfo1(0.55)
prob.theta.5<-data.noninfo1(0.5)

### informative ###
prob.theta.8<-data.info1(0.8)
prob.theta.75<-data.info1(0.75)
prob.theta.7<-data.info1(0.7)
prob.theta.65<-data.info1(0.65)
prob.theta.6<-data.info1(0.6)
prob.theta.55<-data.info1(0.55)
prob.theta.5<-data.info1(0.5)

############ 2 year ##############

### non-informative ###
prob.theta.8<-data.noninfo2(0.8)
prob.theta.75<-data.noninfo2(0.75)
prob.theta.7<-data.noninfo2(0.7)
prob.theta.65<-data.noninfo2(0.65)
prob.theta.6<-data.noninfo2(0.6)
prob.theta.55<-data.noninfo2(0.55)
prob.theta.5<-data.noninfo2(0.5)

### informative ###
prob.theta.8<-data.info2(0.8)
prob.theta.75<-data.info2(0.75)
prob.theta.7<-data.info2(0.7)
prob.theta.65<-data.info2(0.65)
prob.theta.6<-data.info2(0.6)
prob.theta.55<-data.info2(0.55)
prob.theta.5<-data.info2(0.5)


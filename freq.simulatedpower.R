setwd("C:/BACKUP/Shrabanti/jrssc codes/")
source("./power_poisson_functions.R")

time<-proc.time()
set.seed(123)

n_star<- 10000
p_star<-0.975

n1<- c(79,113,176,312,700)
n2<- c(39,50,66,93,140)
n3<- c(40,57,89,158,353)
n4<- c(20,26,34,48,72)
n5<- c(33,47,72,128,287)
n6<- c(16,21,27,38,58)

n<-c(n1,n2,n3,n4,n5,n6)
r.alloc<-matrix(c(1,1,2,2,2,3),2,3)

power<-rep(0,30)
nc<-1

lamRt<-21
lamPt<-7

p_star<-0.975

lamEt<-c(20,19.7,19.4,19.1,18.8)

for(l in c(1:3))
{
  lr=r.alloc[1,l]
  le=r.alloc[2,l]
  
  for(theta in c(0.8,0.75))
  {
    for(j in 1:5)
    {
      count<- 0
      nP=n[nc]
      nR=lr*n[nc]
      nE=le*n[nc]
      
      for(i in 1:n_star)
      {
        xP=rpois(1,nP*lamPt)
        xR=rpois(1,nR*lamRt)
        xE=rpois(1,nE*lamEt[j])
        
        lamP<-xP/nP
        lamR<-xR/nR
        lamE<-xE/nE
        
        lamE_null<-lamPt + theta*(lamRt-lamPt)
        
        mu_null=lamE_null-lamPt
        
        # mu=lamE-lamP
        mv=lamRt-lamPt
        
        sigma2u_null<-lamE_null/nE + lamPt/nP
        # sigma2u<-lamE/nE + lamP/nP
        
        sigma2v<-lamRt/nR + lamPt/nP
        
        rho_null<-(lamP/nP)/(sqrt(sigma2u_null*sigma2v))
        # rho<-(lamP/nP)/(sqrt(sigma2u*sigma2v))
        
        alpha<-(-mv/sqrt(sigma2v))
        
        phi=dnorm(alpha,0,1)
        
        c<-1-pnorm(alpha,0,1)
        
        E1_null<-mu_null+sqrt(sigma2u_null)*rho_null*phi/c
        
        # E1<-mu+sqrt(sigma2u)*rho*phi/c
        
        E2<-mv+sqrt(sigma2v)*phi/c
        
        V1_null<-sigma2u_null*(1+((rho_null^2)*alpha*phi/c)-(rho_null*phi/c)^2)
        
        # V1<-sigma2u*(1+((rho^2)*alpha*phi/c)-(rho*phi/c)^2)
        
        V2<-sigma2v*(1-(phi/c)*((phi/c)-alpha))
        
        E12_null<-(sqrt(sigma2u_null*sigma2v)*rho_null*(alpha*phi+c)/c) + (sqrt(sigma2u_null)*(mv*rho_null*phi/c)) +
          (sqrt(sigma2v)*(mu_null*phi/c)) + mu_null*mv
        
        # E12<-(sqrt(sigma2u*sigma2v)*rho*(alpha*phi+c)/c) + (sqrt(sigma2u)*(mv*rho*phi/c)) +
        #   (sqrt(sigma2v)*(mu*phi/c)) + mu*mv
        
        cov_null<-E12_null-E1_null*E2
        
        # cov<-E12-E1*E2
        
        mw_th_null<-E1_null-theta*E2
        
        # mw_th_alt<-E1-theta*E2
        
        vw_null<-V1_null+(theta^2)*V2-2*theta*cov_null
        
        # vw_alt<-V1+(theta^2)*V2-2*theta*cov
        
        W_obs<- lamE - theta*lamR - (1-theta)*lamP
          
        p_value = 1 - pnorm(((W_obs-mw_th_null)/sqrt(vw_null)),0,1)
          
          if(p_value<0.025)
          {
            count=count+1
          }
        }
      
      power[nc]<- count/n_star
      nc=nc+1
    }
  }
  }

(proc.time()-time)[3]

power
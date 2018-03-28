setwd("C:/BACKUP/Shrabanti/jrssc codes/")
source("./power_poisson_functions.R")

p_star<-0.975
lamR<-21
lamP<-7

n.table.ab<-NULL
r.alloc.list<-matrix(c(1,1,1,1,2,2,1,2,3),3,3)

for (i.r.alloc in c(1:3))
{
  r.alloc<-r.alloc.list[i.r.alloc,]
  for (theta in c(0.8,0.75))
  {
    for (lamE in c(20,19.7,19.4,19.1,18.8))
    {
      n<-samplesize_fn_approxbayes(r.alloc=r.alloc,lamE=lamE,theta=theta)
      n.table.ab<-rbind(n.table.ab,c(r.alloc=r.alloc,lamE=lamE,theta=theta,n.ab=n))
    }
  }
}

n.table.ab

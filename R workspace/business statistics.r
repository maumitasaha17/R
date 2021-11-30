x1<-rnorm(20,0.5)
x2<-rpois(20,2)
x3<-rpois(20,5)
x4<-rpois(20,10)
x5<-rnorm(20,2)
df<-data.frame(x1,x2,x3,x4,x5)
df

df[df$x4==14,]

df[df$x4==12,]

df[df$x4==7,]

df[df$x3==5,]



#Normal distribution, Hypothesis testing

#creating a sequence of values between -15 to 15 with a difference of 0.1

x = seq(-15, 15, by=0.1)
y=dnorm(x, mean(x), sd(x))

#output to be present as PNG file 
#png(file="dnormExample.png")

#Plot the graph
plot(x,y)

#saving the file
#dev.off()

#creating a sequence of values between -10 to 10 with a difference of 0.1
x<-seq(-10, 10, by=0.1)
y<-pnorm(x, mean=2.5, sd=2)
#Plot the graph
plot(x,y)

#########################################################################################
#creating a sequence of probability values incrementing by 0.02
x = seq(0,1, by=0.02)
y=qnorm(x, mean(x), sd(x))
#Plot the graph
plot(x,y)
####################################################################
#creating a vector of 1000 random numbers with mean=90 and sd=5
x<- rnorm(10000, mean=90, sd=5)
#creating histogram with 50 bars
hist(x, breaks = 50)

################################################################################
#Hypothesis testing

library(readr)
grades <- read_csv("C:/Users/MAUMITA/Desktop/SkillEnable/R/Dataset/grades.csv")
View(grades)

library(readr)
cs2m <- read_csv("C:/Users/MAUMITA/Desktop/SkillEnable/R/Dataset/cs2m.csv")
View(cs2m)

install.packages("psych")
library(psych)

#One sample t test
t.test(cs2m$Age, mu=40)
t.test(cs2m$Age, mu=48)
t.test(cs2m$Age, mu=28)

###################################################################
#Paired sample t-test

t.test(x=grades$quiz1,y=grades$quiz2, alternative = "two.sided", mu=0, paired=TRUE)
#############################################################################################
#Independent Samples t-testing (assuming unequal variance)
t.test(cs2m$BP~cs2m$AnxtyLH)

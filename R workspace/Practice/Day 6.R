#BUSSINESS STATISTICS

#How to get row index based on a value of an R data frame column?
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

#####################################################################
#Assignment

library(readr)
grades <- read_csv("C:/Users/MAUMITA/Desktop/SkillEnable/R/Dataset/grades.csv")
View(grades)

library("psych")
library(Hmisc)

#Find mode of central tendency for continious values
describe(grades)

#Find skewness and kurtosis
describe(grades)

#plot histogram of gpa
hist(grades$gpa, col = "dark green")

#Stem & Leaf Diagram gpa
stem(grades$gpa)

#Box plot of gpa
boxplot(grades$gpa, col = "dark green")

#Correlation btw gpa and final. comment on strength of correlation
cor(grades$gpa,grades$final)
corr.test(grades$gpa,grades$final)

#scatter plot of gpa (x axis) and final (y axis)
plot(grades$gpa , grades$final, col = c("green", "blue"))





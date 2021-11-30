#Structure of data set, Bottom data points,Top data points
#Summary, Know data more deeper ,Histogram , stem and leaf dig, box plot, scatter plot correlation



library(readr)
cs2m <- read_csv("C:/Users/MAUMITA/Desktop/SkillEnable/R/Dataset/cs2m.csv")
View(cs2m)

#view the structure of the data set
str(cs2m)

str(cs2m$BP)
str(cs2m$Chlstrl)
str(cs2m$Age)
str(cs2m$Prgnt)
str(cs2m$AnxtyLH)
str(cs2m$DrugR)

#############################################################################
#Top 6 data points
head(cs2m)
head(cs2m,6)
#Top 2 data points
head(cs2m,2)

####################################################################
#Bottom 6 data points
tail(cs2m)
tail(cs2m,6)
#Bottom 3 data points
tail(cs2m,3)
#Bottom 8 data points
tail(cs2m,8)


############################################################
#Suppose i want to find which/how many observation has BP=170?
which(cs2m$BP==170)

#Suppose i want to find which/how many observation has BP>120?
which(cs2m$BP>120)

#Suppose i want to find which/how many observation has Age=20?
which(cs2m$Age==20)

############################################################
#Categorical data set - having the value of 0 and 1

#How many observations are there in different levels of Anxiety?
table(cs2m$AnxtyLH)
#level 0 (low level) has 16 cases and level 1(high level) has 14 cases

#####################################################################################
#SUMMARY (mean, median, min, max values)

summary(cs2m)

#Summary of only Colestrol
summary(cs2m$Chlstrl)

####################################################################################
#much deeper insites

install.packages("psych")
library(psych)
describe(cs2m)

####################################################################################

#Histogram of BP
hist(cs2m$BP)
#Add color
hist(cs2m$BP,col="red")

#Histogram of colostrol
hist(cs2m$Chlstrl)
hist(cs2m$Chlstrl,col="dark blue")

####################################################################################
#Stem & Leaf Diagram - similar to histogram. gives the frequency of the occurance of the values.

stem(cs2m$BP)

####################################################################################
#Box plot - dots are the outlayers in data set(bottom - min, first quanti value, median, third quanti range, top - max, )

boxplot(cs2m)
summary(cs2m)
boxplot(cs2m$BP)
boxplot(cs2m$BP, col = "red")
boxplot(cs2m$BP, horizontal = TRUE, col = "red")
summary(cs2m$BP)
boxplot(cs2m$Chlstrl, col = "dark blue")

#box plots
boxplot(cs2m$BP, cs2m$Chlstrl, col = "dark blue")
#2 box plots with different colors
boxplot(cs2m$BP,cs2m$Chlstrl,col=c("red", "blue")) 
        
##################################################################################################
#Scatter plot - find relationship between 2 variables
#Coorelation

plot(cs2m$BP ,cs2m$Chlstrl,col=c("red", "blue"))

plot(cs2m$BP ,cs2m$Chlstrl,col=c("red", "blue"))
#scatter plot matrix vales of the data set
plot(cs2m)
plot(cs2m, col = "red")
###############################################################################################
#CORRELATIONS AMONG ALL VARIABLES - if its has 0 then it doesnt have a corelation, positive- high, negitive- low corralation. 

cor(cs2m)

###########################################################################################################################################
#LWD Line Width

dose <- c(20,30,40,25,60)
drugA <- c(16,20,23,14,17)
drugB <- c(22,25,34,21,17)

par(pin=c(2,3)) #plot will be 2*3
par(lwd = 2, cex = 1.5)
par(cex.axis=0.75,font.axis=1.5)
plot(dose,drugA,type = "b",pch = 23,lty=2,col = "blue",bg = "green")

#Thickness of axis text cex =1.5 & 1
par(pin=c(2,3)) #plot will be 2*3
par(lwd = 2, cex = 1)
par(cex.axis=0.75,font.axis=3)
plot(dose,drugA,type = "b",pch = 23,lty=2,col = "blue",bg = "green")

#Title
title(main = "LINE DIAGRAM" , col.main="red", 
      sub="Drug A vs Dose", col.sub ="blue",
      xlab="Dode", ylab = "Drug Al",
      col.lab="green" , cex.lab=0.75)
########################################################################









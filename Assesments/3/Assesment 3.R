a=read.csv("C:/Users/MAUMITA/Downloads/test.csv")
a
b=read.csv("C:/Users/MAUMITA/Downloads/train.csv")
b
install.packages("ggplot2")
install.packages("lattice")
install.packages("caret")
install.packages("e1071")
install.packages("MASS")
install.packages("caTools")
install.packages("ROCR")

library(MASS)
library(caTools)
library(psych)
library(ROCR)

set.seed(15)
training<-subset(a, split==TRUE)
View(testing)
testing<-subset(b, split==TRUE)
View(training)

data("Titanic")
View(Titanic)
head(Titanic)
tail(Titanic)
summary(Titanic)
dim(Titanic)
dim(testing)
dim(training)
boxplot(Titanic)
boxplot(testing$Age)
hist(testing$Survived , col = "Yellow")

table(b$Sex)





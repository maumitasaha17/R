#Logistic Regression

library(readr)
cs2m <- read_csv("C:/Users/MAUMITA/Desktop/SkillEnable/R/Dataset/cs2m.csv")
View(cs2m)

######################################################################################
#Build model

model<- glm(DrugR~BP+Chlstrl+Age+AnxtyLH, data = cs2m, family = binomial)
model

#################################################################################
#Summary
summary(model)

##########################################################################################
#Classification Results

predict<- predict(model, type = "response")
head(predict,3)

cs2m$predict<- predict
cs2m$predictROUND<- round(predict, digits = 0)
table(cs2m$DrugR, predict>=0.5)
#0,1 is actual and false & true are predicted
#10 is true negative

##############################################################################################

#logistic regression qith training & testing concepts
install.packages(c("ggplot2","lattice","caret","e1071"))
install.packages("MASS")
install.packages("caTools")
install.packages("ROCR")

library(MASS)
library(caTools)
library(psych)
library(ROCR)

data("Pima.te")
#pima<-Pima.te
View(Pima.te)
head(Pima.te)
tail(Pima.te)
summary(Pima.te)
library(psych)
describe(Pima.te)
describe(Pima.te$glu)
View(Pima.te$bp)
View(Pima.te)
hist(Pima.te$bp , col = "Yellow")
boxplot(Pima.te$bp)
dim(Pima.te)
###########################################################################################
#approch 1 to split data
set.seed(15)

split<- sample.split(Pima.te,SplitRatio = 0.80)

split
training<-subset(Pima.te, split==TRUE)
View(training)
testing<-subset(Pima.te, split==TRUE)
View(testing)


#divide the data into training & testing data
#instead of using lib caTools and splitting the data
id<-sample(2,nrow(Pima.te),prob = c(0.8,0.2),replace = TRUE)
id

training<-Pima.te[id==1,]
testing<-Pima.te[id==2,]



###############################################################








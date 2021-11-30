getwd()
setwd("C:/Users/MAUMITA/Desktop/SkillEnable/R/Dataset/diabetes.csv")
diab<-read.csv("C:/Users/MAUMITA/Desktop/SkillEnable/R/Dataset/diabetes.csv")
View(diab)
library(psych)
library(ROCR)
set.seed(20)
dim(diab)
#divide the data into training & testing data
#instead of using library caTools and splittin the data sample.split()

id<-sample(2,nrow(diab),prob = c(0.7,0.3),replace= TRUE)
id
diab_train<-diab[id==1,]    #[rows,columns]     diab[2:6,]
diab_test<-diab[id==2,]
View(diab_train)
View(diab_test)

sum(is.na(diab))
summary(diab_train)
summary(diab_test)
dim(diab_train)
dim(diab_test)

#Building decision Tree
#for rpart( we need to load rpart library
#install.packages("rpart")
library(rpart)
#library(psych)
colnames(diab)

diab_model<-rpart(Outcome~.,data=diab_train)   

#tree,CART,C5.0
diab_model
#we can plot it as
plot(diab_model, margin=0.1)
text(diab_model,use.n=TRUE, pretty=TRUE,cex=0.8)


#TESTING- build the model and then test the model using logistic regression
#ROCR CURVE
library(ROCR)
diab_P<-predict(diab_model,diab_train)
diab_P
diab_Pred <-prediction(diab_P,diab_train$Outcome)
ROCRPref<-performance(diab_Pred,"tpr","fpr")
plot(ROCRPref,colorize=TRUE,print.cutoffs.at=seq(0.1,by=0.1))
#optimimum value of threshold point is is 0.3

# testing
pred_diab<-predict(diab_model, newdata= diab_test, type = "vector")>0.4
#pred_diab
table(ActualValue=diab_test$Outcome,PredictedValue=pred_diab>0.4)

library(caret)
#install.packages('e1071',dependencies = TRUE)
library(e1071)
confusionMatrix(table(pred_diab,diab_test$Outcome>0.5))



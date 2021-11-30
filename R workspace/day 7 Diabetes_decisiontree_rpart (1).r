getwd()
setwd("C:/Users/MAUMITA/Desktop/SkillEnable/R/Dataset/diabetes.csv")
diab<-read.csv("C:/Users/MAUMITA/Desktop/SkillEnable/R/Dataset/diabetes.csv")
View(diab)
# install.packages("psych")    ##using describe command-basic descriptive statistics
# install.packages("ROCR")     ## ROCR-threshold value
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
plot(diab_model,margin=0.1)
text(diab_model,use.n = TRUE, pretty = TRUE,cex=0.8)

#ROCR Curve
library(ROCR)
diab_P<-predict(diab_model,diab_train)
diab_P
diab_Pred <-prediction(diab_P,diab_train$Outcome)
ROCRPref<-performance(diab_Pred,"tpr","fpr")
plot(ROCRPref,colorize=TRUE,print.cutoffs.at=seq(0.1,by=0.1))


# testing
pred_diab<-predict(diab_model, newdata= diab_test, type = "vector")>0.4
#pred_diab
table(ActualValue=diab_test$Outcome,PredictedValue=pred_diab>0.4)
accuracy_score <-(134+55)/(134+17+44+55)
accuracy_score

install.packages("caret",dependencies = TRUE)
library(caret)
confusionMatrix(table(pred_diab,diab_test$Outcome))
install.packages('e1071',dependencies = TRUE)
library(e1071)
confusionMatrix(table(pred_diab,diab_test$Outcome>0.5))

#ROCR Curve
library(ROCR)
diab_P<-predict(diab_model,diab_train)
diab_Pred <-prediction(diab_P,diab_train$Outcome)
ROCRPref<-performance(diab_Pred,"tpr","fpr")
plot(ROCRPref,colrize=TRUE,print.cutoffs.at=seq(0.1,by=0.1))

install.packages("randomForest")
library(randomForest)
diab_model<-randomForest(Outcome~.,data=diab_train)   

#tree,CART,C5.0
diab_model

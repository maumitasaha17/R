#Logistic regression 

#install.packages("MASS")      # importing dataset Pima.te
#install.packages("caTools")   #sample.split
library(MASS)
library(caTools)

data(Pima.te)
View(Pima.te)
head(Pima.te)
cor(Pima.te)   # error

d <- Pima.te[,1:7]
head(d)
cor(d)
library(psych)

pairs.panels(d)
plot(d)
#EDA

#summary:there are no NA values
#boxplot: no outliers
#

split<- sample.split(Pima.te,SplitRatio=0.80)
split
training <- subset(Pima.te,split == TRUE)
testing <- subset(Pima.te,split == FALSE)
View(training)
View(testing)


model<-glm(type~., training, family = "binomial")
model
summary(model)
model$coefficients

res<-predict(model, testing, type="response")
(table(ActualValue = testing$type, PredictedValue=res>0.5))

model1<-glm(type~.-bp-skin-age, training,family = "binomial")
summary(model1)

res<-predict(model, training, type="response")
(table(ActualValue = training$type, PredictedValue=res>0.5))

library(ROCR)
res4<-predict(model1,training,type="response")
res4
ROCRPred <-prediction(res4,training$type)
ROCRPref<-performance(ROCRPred,"tpr","fpr")
plot(ROCRPref,colorize=TRUE,print.cutoffs.at=seq(0.1,by=0.1))


model1<-glm(type~., training, family = "binomial")
model1
summary(model)

res1<-predict(model, testing, type="response")
table(ActualValue = testing$type, PredictedValue=res1>0.5)




#############################################################################
install.packages("rattle.data")
library(rattle.data)
# Loading the wine data
data(wine)
dim(wine)

library(dplyr)

# Using sample_frac to create 70 - 30 slipt into test and train
train <- sample_frac(wine, 0.7)
sample_id <- as.numeric(rownames(train)) # rownames() returns character so as.numeric
test <- wine[-sample_id,]



###################################################################################################
train$Type <- relevel(train$Type, ref = "3")
#Once the baseline has been specified, we use multinom() function to fit the model and then use summary() function to explore the beta coefficients of the model.

# Loading the nnet package
install.packages("nnet")
require(nnet)
# Training the multinomial model
multinom.fit <- multinom(Type ~ Alcohol + Color -1, data = train)
summary(multinom.fit)
exp(coef(multinom.fit))
head(probability.table <- fitted(multinom.fit))
train$precticed <- predict(multinom.fit, newdata = train, "class")
ctable <- table(train$Type, train$precticed)
########################################################################################
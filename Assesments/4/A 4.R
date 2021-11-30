library(readr)
telco <- read_csv("C:/Users/MAUMITA/Desktop/SkillEnable/R/Assesments/4/WA_Fn-UseC_-Telco-Customer-telco.csv")
View(telco)

library(plyr)  
library(rpart.plot) 
library(caret)
library(gridExtra) 
library(tidyverse) 
library(rsample)
library(e1071) 
library(GGally)
library(data.table)
library(DT)
library(readr)
library(ggplot2)
library(dplyr)
library(tidyr)
library(corrplot)
library(rms)
library(MASS)
library(e1071)
library(ROCR)
library(gplots)
library(pROC)
library(rpart)
library(randomForest)
library(ggpubr)
str(telco)
sapply(telco, function(x) sum(is.na(x)))

Telco[is.na(telco$TotalCharges),]

sum(is.na(telco$TotalCharges))/nrow(telco)

telco_clean <- telco[complete.cases(telco), ]

telco_clean$SeniorCitizen <- as.factor(mapvalues(telco_clean$SeniorCitizen,
                                                 from=c("0","1"),
                                                 to=c("No", "Yes")))

telco_clean$MultipleLines <- as.factor(mapvalues(telco_clean$MultipleLines, 
                                                 from=c("No phone service"),
                                                 to=c("No")))
for(i in 10:15){
  telco_clean[,i] <- as.factor(mapvalues(telco_clean[,i],
                                         from= c("No internet service"), to= c("No")))
}
#install.packages("corrplot")
#library(corrplot)
telco_clean$customerID <- NULL

telco_clean %>%
  dplyr::select (TotalCharges, MonthlyCharges, tenure) %>%
  cor() %>%
  ggcorrplot.mixed(upper = "circle", tl.col = "black", number.cex = 0.7)

set.seed(56)
split_train_test <- createDataPartition(telco_clean$Telco,p=0.7,list=FALSE)
dtrain<- telco_clean[split_train_test,]
dtest<-  telco_clean[-split_train_test,]

tr_fit <- rpart(Telco ~., data = dtrain, method="class")
rpart.plot(tr_fit)

tr_prob1 <- predict(tr_fit, dtest)
tr_pred1 <- ifelse(tr_prob1[,2] > 0.5,"Yes","No")
table(Predicted = tr_pred1, Actual = dtest$Telco)

tr_prob2 <- predict(tr_fit, dtrain)
tr_pred2 <- ifelse(tr_prob2[,2] > 0.5,"Yes","No")
tr_tab1 <- table(Predicted = tr_pred2, Actual = dtrain$Telco)
tr_tab2 <- table(Predicted = tr_pred1, Actual = dtest$Telco)

# Train
confusionMatrix(
  as.factor(tr_pred2),
  as.factor(dtrain$Telco),
  positive = "Yes" 
)

# Test
confusionMatrix(
  as.factor(tr_pred1),
  as.factor(dtest$Telco),
  positive = "Yes" 
)

tr_acc <- sum(diag(tr_tab2))/sum(tr_tab2)
tr_acc


p21 <- ggplot(telco_clean, aes(x = Contract, fill = Telco)) +
  geom_bar() +
  geom_text(aes(y = ..count.. -200, 
                label = paste0(round(prop.table(..count..),4) * 100, '%')), 
            stat = 'count', 
            position = position_dodge(.1), 
            size = 3) +
  labs(title="telco rate by contract status")

p21

p22 <- ggplot(telco_clean, aes(x = InternetService, fill = Telco)) +
  geom_bar() +
  geom_text(aes(y = ..count.. -200, 
                label = paste0(round(prop.table(..count..),4) * 100, '%')), 
            stat = 'count', 
            position = position_dodge(.1), 
            size = 3) +
  labs(title="telco rate by internet service status")

p22

p23 <- ggplot(telco_clean, aes(x = tenure, fill = Telco)) +
  geom_histogram(binwidth = 1) +
  labs(x = "Months",
       title = "telco rate by tenure")
p23

p24 <- ggplot(telco_clean, aes(x = TotalCharges, fill = Telco)) +
  geom_histogram(binwidth = 100) +
  labs(x = "Dollars (binwidth=100)",
       title = "telco rate by tenure")
p24

intrain<- createDataPartition(telco$telco,p=0.7,list=FALSE)
set.seed(2017)
training<- telco[intrain,]
testing<- telco[-intrain,]
dim(training); dim(testing)
LogModel <- glm(telco ~ .,family=binomial(link="logit"),data=training)
print(summary(LogModel))



library(MASS)
exp(cbind(OR=coef(LogModel), confint(LogModel)))
tree <- ctree(telco~Contract+tenure_group+PaperlessBilling, training)
plot(tree)
pred_tree <- predict(tree, testing)
print("Confusion Matrix for Decision Tree"); table(Predicted = pred_tree, Actual = testing$telco)

p1 <- predict(tree, training)
tab1 <- table(Predicted = p1, Actual = training$telco)
tab2 <- table(Predicted = pred_tree, Actual = testing$telco)
print(paste('Decision Tree Accuracy',sum(diag(tab2))/sum(tab2)))


rfModel <- randomForest(Telco ~., data = training)
print(rfModel)
pred_rf <- predict(rfModel, testing)
caret::confusionMatrix(pred_rf, testing$Telco)
plot(rfModel)
t <- tuneRF(training[, -18], training[, 18], stepFactor = 0.5, plot = TRUE, ntreeTry = 200, trace = TRUE, improve = 0.05)

rfModel_new <- randomForest(telco ~., data = training, ntree = 200, mtry = 2, importance = TRUE, proximity = TRUE)
print(rfModel_new)
pred_rf_new <- predict(rfModel_new, testing)
caret::confusionMatrix(pred_rf_new, testing$telco)
#Random Forest Feature Importance
varImpPlot(rfModel_new, sort=T, n.var = 10, main = 'Top 10 Feature Importance')
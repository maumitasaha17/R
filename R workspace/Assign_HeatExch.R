#1. import data....which format
#2.data dictionary
3.EDA





#### Model building for Heat Exch dataset
library(readxl)
library(ggplot2)
heat <- read_excel("~/Downloads/final HeatEx_Usecase.xlsx")
#heat = read_excel("HeatEx_Usecase.xlsx")
head(heat)
colnames(heat)
#to replace spcl characters from column names
colnames(heat)=c("Date","Crude Temp In","Crude Temp Out","CDU1 rate","Crude Flow rate","Kero Temp In",
                 "Kero Temp Out","Kero Flow m3hr","Furnace inlet temp","Crude Temp Increase",
                 "Kero Temp decrease","Q MW","Hot_inCold_out","Hot_out_Cold_in","LMTD",
                 "U transfer rate","CumFlow","FoulingResistance")
str(heat)
heat_data = heat[,-1] #date-time dropped
str(heat_data)

summary(heat_data)
sum(is.na(heat_data)) #to verify absence of Null values
boxplot(heat_data$`Crude Temp In`)

#plot(heat_data,heat_data$FoulingResistance)
#plot(heat_data)
corr = as.data.frame(cor(heat_data))
#install.packages("VIF")
library(VIF)
set.seed(31)
id=sample(2,nrow(heat_data),prob=c(0.7,0.3),replace=TRUE)

training = heat_data[id==1,]
test = heat_data[id==2,]

m1 = lm(training$FoulingResistance~., data=training)
summary(m1)
#library(car)
#vif(m1)

m11 = lm(training$FoulingResistance~.-Hot_out_Cold_in -Hot_inCold_out-`Kero Temp decrease`-`Crude Temp Increase`-`Crude Flow rate`, data=training)
summary(m11)

m11 = lm(training$FoulingResistance~.-Hot_out_Cold_in -Hot_inCold_out-`Kero Temp decrease`-`Crude Temp Increase`-`Crude Flow rate`-`Kero Temp In`-`Kero Temp Out`, data=training)
summary(m11)

m12 = lm(training$FoulingResistance~.-Hot_out_Cold_in -Hot_inCold_out-`Kero Temp decrease`-`Crude Temp Increase`-`Crude Flow rate`-`Kero Temp In`-`Kero Temp Out`-`Furnace inlet temp`, data=training)
summary(m12)



m14 = lm(training$FoulingResistance~.-Hot_out_Cold_in -Hot_inCold_out-`Kero Temp decrease`-`Crude Temp Increase`-`Crude Flow rate`-`Kero Temp In`-`Kero Temp Out`-`Furnace inlet temp`-`Q MW`-`U transfer rate`, data=training)
summary(m14)

test_res = predict(m14,test,type="response")
test$pred = (test_res)

plot(m14)

plot(test$FoulingResistance,test$pred,col="blue", xlab="actual", ylab="pred") #

abline(0,1) #y=x lines

library(ModelMetrics)
err = rmse(test$pred,test$FoulingResistance) #test Rmse
test$residual = test$pred-test$FoulingResistance 
summary(test$residual)

hist(test$residual)

plot(test$residual,test$pred)
plot(test$residual,test$pred)



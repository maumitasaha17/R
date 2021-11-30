#PROBLEM STATEMENT - identify the resistance based on the following parameters
#1) what are the different formats availabe


#STEPS TO FOLLOW
#1) import data  (files - excel , csv , txt) (readbility- read.csv,rio,readex,reader,lreadxl)
#2) To know the data dictionary
#3)EDA - 
#missing data - is.na

library(readxl)
HeatEx <- read_excel("C:/Users/MAUMITA/Desktop/SkillEnable/R/Assesments/Project/final HeatEx_Usecase.xlsx")
View(HeatEx)
dim(HeatEx) #no. of rows and no. of column
summary(HeatEx)
library(psych)
describe(HeatEx)
head(HeatEx)
tail(HeatEx)
range(HeatEx$LMTD)
plot(HeatEx$LMTD)
hist(HeatEx$LMTD)
cor(HeatEx$LMTD)
boxplot(HeatEx)

#to replace spcl characters from column names
colnames(HeatEx)=c("Date","Crude Temp In","Crude Temp Out","CDU1 rate","Crude Flow rate","Kero Temp In",
                 "Kero Temp Out","Kero Flow m3hr","Furnace inlet temp","Crude Temp Increase",
                 "Kero Temp decrease","Q MW","Hot_inCold_out","Hot_out_Cold_in","LMTD",
                 "U transfer rate","CumFlow","FoulingResistance")

HeatEx = HeatEx[,-1] #date-time dropped
str(HeatEx)

summary(HeatEx)
sum(is.na(HeatEx)) #to verify absence of Null values


plot(HeatEx,HeatEx$FoulingResistance)
plot(HeatEx)
corr = as.data.frame(cor(HeatEx))


set.seed(31)
id=sample(2,nrow(HeatEx),prob=c(0.7,0.3),replace=TRUE)

training = HeatEx[id==1,]
test = HeatEx[id==2,]


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
library(readr)
bank_additional_full <- read_csv("C:/Users/MAUMITA/Desktop/SkillEnable/R/Assesments/Project/bank-additional-full.csv")
ds<-read.csv("C:/Users/MAUMITA/Desktop/SkillEnable/R/Assesments/Project/bank-additional-full.csv", sep = ';')
View(ds)


install.packages(c("readr","ggplot2","psych","corrplot","RColorBrewer","caret","e1071","ROCR",
                   "dplyr","tidyr","gmodels","ggpubr","tree","tidyverse","C50","VIM"))

library(readr)
library(ggplot2)
library(psych)
library(corrplot)
library(RColorBrewer)
library(dplyr)
library(tidyr)
library(gmodels) # Cross Tables [CrossTable()]
library(tidyverse)
library(C50)
library(VIM)



table(bank$y)
hist(bank$age)
levels(bank$y)=0:1
dim(ds)
describe(ds)
summary(ds)
str(ds)
head(ds)
tail(ds)
plot(ds$`""duration""`)
boxplot(ds$`""nr.employed""`)


sum(is.na(ds))
#IMPORT & EXPORT DATA

library(readr)
cs2m <- read_csv("C:/Users/MAUMITA/Desktop/SkillEnable/R/Dataset/cs2m.csv")
View(cs2m)

data1=read.csv("C:/Users/MAUMITA/Desktop/SkillEnable/R/Dataset/cs2m.csv")
#file path name:C:\\Users\\MAUMITA\\Desktop\\SkillEnable\\R\\Dataset 
View(data1)


getwd()
setwd("C:\\Users\\MAUMITA\\Desktop\\SkillEnable\\R\\Dataset")
#Exporting table to a CSV file
data <-data.frame(x1 = c(1,2,3,4), x2=c(5,6,7,8), x3=c(9,10,11,12))
data
write.table(data, file = "data.csv", sep="\t", row.names=FALSE)
 
list.files()   


#Exporting R data to an excel spreedsheet
install.packages("xlsx")
library(xlsx)
write.xlsx(data,"data.xlsx")

#Exporting data from R to SPSS
install.packages("foreign")
library(foreign)
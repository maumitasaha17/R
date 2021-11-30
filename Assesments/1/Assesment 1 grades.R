library(ggplot2)
library(stringr)
#Create the data frame.
mydf.data <- data.frame(
  "Name" = c("Rohini","Sagar","Neeti","Madhu","Alaka"),
  "Age" = c(24,20,33,21,26),
  "Salary" = c(8723.3,9515.2,7611.0,7329.0,5343.25),
  
  "Hobby" = c("Dance", "Painting", "Singing", "Photography","Reading"),
  stringsAsFactors = FALSE
)
#print the data frame.
print(mydf.data)

#################################################################################################################

#Change column name in the data frame.
mydf.data <- data.frame(
  "Name" = c("Rohini","Sagar","Neeti","Madhu","Alaka"),
  "Age" = c(24,20,33,21,26),
  "Salary" = c(8723.3,9515.2,7611.0,7329.0,5343.25),
  
  "Hobby" = c("Dance", "Painting", "Singing", "Photography","Reading"),
  stringsAsFactors = FALSE
)
#print the original data frame.
print("Original data frame")
print(mydf.data)

# assigning new names to the columns of the data frame
colnames(mydf.data) <- c('empname','empage','empsalary','emphobby')
#print the new data frame.
print("New data frame")
print(mydf.data)
#################################################################################################################


library(readr)
grades <- read_csv("C:/Users/MAUMITA/Desktop/SkillEnable/R/Dataset/grades.csv")
View(grades)


dim(grades)

#How many observations in particular variable
length(grades$ethnicity)
min(grades$ethnicity)
max(grades$ethnicity)
range(grades$ethnicity)
sum(grades$ethnicity)
median(grades$ethnicity)
var(grades$ethnicity)
sd(grades$ethnicity)




#################################################################################################################
#########################################################################################
#user defined function using R
#printletters() which prints alphabets from "A" TO "H"
v<-LETTERS[1:8]
for (i in v){
  print(i)
}


#printnumbers() which can print nos. from 1 to 20
x=c(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20)
for (i in x){
  print(i)
}
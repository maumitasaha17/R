#IMPORT & EXPORT , STRING ,Change the name of the column
#Using set names , Create buckets, user defined function using R
#Creating modes, LOOPS , SQLDF





getwd()
#setwd("C:\\Users\\MAUMITA\\Desktop\\SkillEnable\\R\\Dataset")
#Exporting table to a CSV file
data <-data.frame(x1 = c(1,2,3,4), x2=c(5,6,7,8), x3=c(9,10,11,12))
#data
write.table(data, file = "data.csv", sep="\t", row.names=FALSE)

list.files()

#Exporting R data to an Excel Spreadsheet

install.packages("rio")
library(rio)

export(data, "data.xlsx")
list.files()

#get current working directory getwd()
getwd()


#Exporting data from R to SPSS
install.packages("foreign")
library(foreign)

write.foreign(data, "data.txt", "data.sas", package="SPSS")

#Exporting data from R to SAS
write.foreign(data, "data.txt", "data.sas", package="SAS")

#Exporting R data to Stata
library(foreign)
write.dta(data,"data.dta")


####################################################################
library(readr)
cs2m <- read_csv("C:/Users/MAUMITA/Desktop/SkillEnable/R/Dataset/cs2m.csv")
View(cs2m)

#30 obs and 6 variables
dim(cs2m)

#How many observations in particular variable
#length of BP is 30
length(cs2m$BP)
min(cs2m$BP)
max(cs2m$BP)
range(cs2m$BP)
sum(cs2m$BP)
median(cs2m$BP)
var(cs2m$BP)
sd(cs2m$BP)


########################################################################

#STRING
#substr(x, start=n1,stop=2) extract or replace subtrings in a character vector


string = "abcdef"
substr(string,2,4)
#replacing with the number u want
substr(string,2,4)<-"2222"
string


#Strsplit - splits the string with parameters specified

strsplit("abc", "")

strsplit("a-bbnm**-c","-")


#################################################################################

#Change the name of the column

#declaring the columns of data frame

df=data.frame(
  col1 = c('A','B','C','J','E',NA,'M'),
  col2 = c(12.5,9,16.5,NA,9,20,14.5),
  col3 = c(NA,3,2,NA,1,NA,0))

#printing original data frame
print("Original data frame: ")
print(df)

print("Renaming columns names ")

#assigning new names to the columns of the data frame
colnames(df) <- c('C1','C2','C3')

#printing new data frame
print("New data frame: ")
print(df)

#########################################
#rename only the second column

#declaring the columns of data frame
df=data.frame(
  col1 = c('A','B','C','J','E',NA,'M'),
  col2 = c(12.5,9,16.5,NA,9,20,14.5),
  col3 = c(NA,3,2,NA,1,NA,0))

#printing original data frame
print("Original data frame: ")
print(df)
print("Renaming columns names ")

#assigning new names to the columns of the data frame
colnames(df)[2] <- "new_col2"

#printing new data frame
print("After changing the data frame for column 2 name: ")
print(df)

#########################################
#Using set names

#declaring the columns of data frame
df=data.frame(
  col1 = c('A','B','C','J','E',NA,'M'),
  col2 = c(12.5,9,16.5,NA,9,20,14.5),
  col3 = c(NA,3,2,NA,1,NA,0))

#printing original data frame
print("Original data frame: ")
print(df)
#print("Renaming columns names ")

#renaming all the columns names of the data frame
df <- setNames(df, c("changes_Col1","changes_Col2","changes_Col3"))

#printing new data frame
print("Renamed data frame: ")
print(df)

#########################################
#Create buckets - making groups

set.seed(2)
ID<-1:10
#Sample is the random numbers/values
Salary<-sample(20:50,10,replace=TRUE)
df<-data.frame(ID, Salary)
df

#Spliting df based on Salary and creating bucket
install.packages("Hmisc")
library(Hmisc)
df$Salary_Group<-as.numeric(cut2(df$Salary, g=5))
df

#change it to 2 groups
df$Salary_Group<-as.numeric(cut2(df$Salary, g=2))
df

#########################################################################################
#user defined function using R

#Functions
#Definine my concatenate function
my_cat<-function(x,y){
  print(paste(x,y))
}
#calling the function
my_cat("Machine","Learning")
my_cat("1","2")




#Definine my concatenate function to add 2 numbers
my_cat<-function(a,b){
  print(paste(a+b))
}
#calling the function
my_cat(2,3)
##############################################################################
#Setting default arguments 


my_cat("Machine","Learning")
my_cat("Machine")


#Default argument
my_cat <- function(x = "HELLO", y = "WORLD"){
  print(paste(x, y))
}

my_cat("Machine")
my_cat()
################################################################################

#Return single value - return the log value

#Log return function
my_log<- function(x=1){
  log_value<-log(x)
  return(log_value)
}
my_log(5)


#Return multiple value - return the log value as well as thhe square
#Log return function
my_log_square<- function(x=1){
  log_value<-log(x)
  square_value<-x^2
  return(list(log_val = log_value, square_Val = square_value))
}
my_log_square(5)

################################################################################################

#Creating modes

#create the function
getmode <- function(v){
  uniqv <- unique(v)
  uniqv[which.max(tabulate(match(v,uniqv)))]
}

#Create the vector with numbers
v<- c(2,1,2,3,1,2,3,4,1,5,5,3,2,3)

#calculate the mode using the user function
result<-getmode(v)
print(result)

#calculate the vector with character
charv<- c("o","it","the","it","it")

#calculate the mode using the user function
result<-getmode(charv)
print(result)






#######################################
#LOOPS

#Repeat loop

v<-c("Hello","loop")
cnt<-2
repeat{
  print(v)
  cnt<- cnt+1
  
  if(cnt>5){
    break
}
}


#While loop
v<-c("Hello","while loop")
cnt<-2

 while (cnt<7) {
   print(v)
   cnt=cnt+1
}



#For loop
v<-LETTERS[1:4]
for (i in v){
  print(i)
}

x=c(1,2,3,4,5,6,7)
for (i in x){
  print(i)
}


#NEXT
v<-LETTERS[1:6]
for (i in v){
  if(i=="D"){
    next
  }
  print(i)
}


###########################################################################


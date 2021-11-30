#install.packages("ggplot2")
library(ggplot2)

# Create the data frame.
emp.data <- data.frame(
  emp_id = c (1:5), 
  emp_name = c("Manish","Rohan","Mac","Ryan","Kaushik"),
  salary = c(6723.3,3515.2,2611.0,7329.0,8343.25), 
  
  start_date = as.Date(c("2020-01-01", "2011-09-23", "2018-11-15", "2016-05-11",
                         "2015-03-03")),
  stringsAsFactors = FALSE
)
# Print the data frame.   
print(emp.data)
#get the structure of the data frame
str(emp.data)
emp.data$emp_id
emp.data$salary

#summary
summary(emp.data)
result <- data.frame(emp.data$emp_name,emp.data$salary)
print(result)
#Extract the first two rows and then all columns
# Extract first two rows.
result <- emp.data[1:2,]
print(result)

# Extract 3rd and 5th row with 2nd and 4th column.
result <- emp.data[c(3,5),c(2,4)]
print(result)

emp.data$dept <- c("IT","Purchase","HR","HR","Finance")
v <- emp.data
print(v)


emp.data <- data.frame(
  emp_id = c (1:5), 
  emp_name = c("A","B","C","D","E"),
  salary = c(6323.3,5315.2,3611.0,3729.0,8343.25), 
  
  start_date = as.Date(c("2015-01-01", "2020-09-23", "2014-11-15", "2014-05-11",
                         "2015-03-25")),
  dept = c("IT","HR","IT","HR","Finance"),
  stringsAsFactors = FALSE
)

# Create the second data frame
emp.newdata <-  data.frame(
  emp_id = c (6:8), 
  emp_name = c("X","Y","Z"),
  salary = c(5578.0,5722.5,6352.8), 
  start_date = as.Date(c("2015-05-21","2015-07-30","2014-06-17")),
  dept = c("IT","Operations","HR"),
  stringsAsFactors = FALSE
)

# Bind the two data frames.
emp.finaldata <- rbind(emp.data,emp.newdata)
print(emp.finaldata)



# Assignment using equal operator.
var.1 = c(0,1,2,3,4,5)           

# Assignment using leftward operator.
var.2 <- c("learn","R","and","analytics")   

# Assignment using rightward operator.   
c(TRUE,1) -> var.3           

print(var.1)
cat ("var.1 is ", var.1 ,"\n")
cat ("var.2 is ", var.2 ,"\n")
cat ("var.3 is ", var.3 ,"\n")



#create 2 vectors of length 5 and 7 and add them
x1=c(1,2,34,4,5)
x2=c(22,1,2,3,5,6,8)
y=x1+x2
y


# define dataframe
df <- data.frame("Age" = c(25, 21, 34, 32, 28),
                 "Name" = c("Ram", "Rahim", "Alfred","Sunny", "Munmun"))

# sort the dataframe on the basis of
# age column and store it in newdf
newdf <- df[order(df$Age), ]

# print sorted dataframe
print(newdf)





df <- data.frame("Age" = c(25, 25, 32, 32, 28),
                 "Name" = c("Ram", "Rahim", "Alfred",
                            "Sunny", "Munmun"))

# sort the dataframe first on the basis of
# Age and if age is same perform sort on Name
newdf3 <- df[order(df$Age, df$Name), ]

# print sorted dataframe
print(newdf3)





install.packages("dplyr")
library(dplyr)

# create dataframe
df <- data.frame("Age" = c(25, 25, 32, 32, 28),
                 "Name" = c("Ram", "Rahim", "Alfred",
                            "Sunny", "Munmun"))

# sort the dataframe on the basis of
# age column using arrange method
arrange(df,Age)



list1 <- list(c(2,5,3),21.3,cos)

# Print the list.
print(list1)



M = matrix( c('a','a','b','c','b','a'), nrow = 2, ncol = 3, byrow = TRUE)
print(M)

M1 = matrix( c('a','a','b','c','b','a'), nrow = 2, ncol = 3)
print(M1)



a <- array(c('green','yellow'),dim = c(3,3,2))
print(a)

a <- array(c('green','yellow','red'),dim = c(3,3,2))
print(a)

a <- array(c(10,20,30,40),dim = c(3,3,2))
print(a)



# Create a vector.
apple_colors <- c('green','green','yellow','red','red','red','green')

# Create a factor object.
factor_apple <- factor(apple_colors)

# Print the factor.
print(factor_apple)










getwd()
setwd("C:\\Users\\admin\\Documents\\python_backup\\r test")
#Exporting table data to a CSV file
data <- data.frame(x1 = c(1, 2, 3, 4),x2 = c(5, 6, 7, 8),x3 = c(9, 10, 11, 12))
data
write.table(data, file = "data.csv",sep="\t", row.names=FALSE)

list.files()

#Exporting R data to an Excel Spreadsheet
install.packages("xlsx")
library(xlsx)
write.xlsx(data, "data.xlsx")

print(nlevels(factor_apple))








install.packages("rio")    
library(rio)

export(data, "data.xlsx")
list.files()




install.packages("foreign") 
library(foreign)

write.foreign(data, "data.txt", "data.sps", package="SPSS")

#Exporting data from R to SAS
write.foreign(data, "data.txt", "data.sas", package="SAS")

#Exporting R data to Stata
library(foreign)
write.dta(data, "data.dta")



cs2m=read.csv("python_backup/cs2m.csv")
#C:\\Users\\admin\Documents\\python_backup\\cs2m.csv
View(cs2m)

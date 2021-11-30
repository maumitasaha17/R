#DATAFRAME & VARIABLES

install.packages("ggplot2")
library(ggplot2)
library(stringr)


#can be used as a calculator
5+7

x<-5+7
x=34

#vector - contains same data types.  vector needs to be homogenious.
y<-c(1,5,7,9,87)
print(y)
#first element of y
y[1]
y[3]
?c

myvec1=c(1,1.2,"a","mum")
#typeof(myvec1)


#EXAMPLE 1
#Create the data frame
emp.data <- data.frame(
  emp_id = c(1:5),
  emp_name = c("Manish","Rohan","Mac","Ryan","Kaushik"),
  salary = c(6723.3,3515.2,2611.0,7329.0,8343.25),
  
  start_date = as.Date(c("2020-01-01", "2011-09-23", "2018-11-15", "2016-05-11","2015-03-03")),
  stringsAsFactors = FALSE
)
#print the data frame.
print(emp.data)

#get the structure of the data frame
str(emp.data)
emp.data$emp_id
emp.data$emp_name
emp.data$salary
emp.data$salary[2]

#Summary of Data in Data Frame
# the statistical summary and nature of the data can be obtained by applying summary() function
#print the summary
print(summary(emp.data))


#Extract Data from Data frame
#Extract specific column from a data frame using column name
#Extract Specific columns.
result <- data.frame(emp.data$emp_name,emp.data$salary)
print(result)

#Extract the first two rows and then all columns
#Extract first 2 rows..... emp.data[rows,columns]
result <- emp.data[1:2,] 
print(result)


#Extract 3rd & 5th row with 2nd and 4th columnr
result <- emp.data[c(3,5),c(2,4)]
print(result)

#Expand the Data Frame
#A data frame can be expanded by adding columns and rows
#To add columns - just add the column vector using new column name.
#Eg: Add the "dept" column
emp.data$dept <- c("IT","Purchasre","HR","HR","Finance")
v <- emp.data
print(v)

#To add rows permanently to an existing data frame , 
#we need to bring in the new rows in the same structure as the existing data frame and use the rbind() function.

#Create the first data frame.
emp.data <- data.frame(
  emp_id = c (1:5), 
  emp_name = c("A","B","C","D","E"),
  salary = c(6323.3,5315.2,3611.0,3729.0,8343.25), 
  
  start_date = as.Date(c("2015-01-01", "2020-09-23", "2014-11-15", "2014-05-11",
                         "2015-03-25")),
  dept = c("IT","HR","IT","HR","Finance"),
  stringsAsFactors = FALSE
)
#Create the second data frame
emp.newdata <-  data.frame(
  emp_id = c (6:8), 
  emp_name = c("X","Y","Z"),
  salary = c(5578.0,5722.5,6352.8), 
  start_date = as.Date(c("2015-05-21","2015-07-30","2014-06-17")),
  dept = c("IT","Operations","HR"),
  stringsAsFactors = FALSE
)

#Bind the two data frames
emp.finaldata <- rbind(emp.data,emp.newdata)
print(emp.finaldata)

#In the example below we create a data frame with new rows
# and merge it with the existing data frame to create the final data frame.


################################################################################################


#variable Assignment
#the variables can be assigned values using leftward, rightward and equal to operator . The values of the variables can be printed using print() or cat() function.
#the cat() function combines multiple items into a continous print output.

#assignment using equal operator
var.1 = c(0,1,2,3,4,5)

#Assignment using leftward operator.
var.2 <- c("learn","R","and", "analytics")

#Assignment using rightward operator.
c(TRUE,1) -> var.3

print(var.1)
cat ("var.1 is ", var.1 ,"\n")
cat ("var.2 is ", var.2 ,"\n")
cat ("var.3 is ", var.3 ,"\n")


#create 2  vectors of length 5 & 7 and add
x1 = c(1,2,34,4,5)
x2 = c(22,1,2,3,4,5,6)
y=x1+x2 
#Warning message:In x1 + x2 :longer object length is not a multiple of shorter object length
#This concept is known as data recycling.
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
# Get the structure of the data frame.
str(emp.data)

# Summary of Data in Data Frame
# The statistical summary and nature of the data can be obtained 
#by applying summary() function.
# Print the summary.
print(summary(emp.data))  

#Extract Data from Data Frame
#Extract specific column from a data frame using column name.
# Extract Specific columns.
result <- data.frame(emp.data$emp_name,emp.data$salary)
print(result)

#Extract the first two rows and then all columns
# Extract first two rows.
result <- emp.data[1:2,]
print(result)

# Extract 3rd and 5th row with 2nd and 4th column.
result <- emp.data[c(3,5),c(2,4)]
print(result)

# Expand Data Frame
# A data frame can be expanded by adding columns and rows.
# 
# Add Column
# Just add the column vector using a new column name.

# Add the "dept" coulmn.
emp.data$dept <- c("IT","Purchase","HR","HR","Finance")
v <- emp.data
print(v)
# 
# Add Row
# To add more rows permanently to an existing data frame,
# we need to bring in the new rows in the same structure as the
# existing data frame and use the rbind() function.

# Create the first data frame.
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
emp.newdata <- 	data.frame(
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

# In the example below we create a data frame with new rows 
# and merge it with the existing data frame to create the final data frame.
# 

############################################################
##Creating columns with conditions AND, OR

set.seed(1)
x1<-rpois(10,10)
y1<-rpois(10,5)
df1<-data.frame(x1,y1)
df1

df1<-transform(df1,z1=ifelse(x1>y1,x1-y1,x1+y1))
df1


df2<-transform(df1,z2=x1 && y1)
df2

df3<-transform(df2,z3=ifelse(x1==y1,x1*y1,x1/y1))
df3

df4<-transform(df3,z4=x1 || y1)
df4

df5<-transform(df4,z5=x1 || y1)
df5
search()




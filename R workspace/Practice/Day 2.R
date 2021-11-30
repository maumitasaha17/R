#SORTING & TYPES OF DATA VARIABLE

x = 13.476
floor(x)
trunc(x)

x = -13.476
floor(x)
trunc(x)

#create a linear array
arr <- c(39,38,27,16,51,44,2,1)

#use of sort function to sort array
#by default it is sorted in increasing order
sort(arr)
rank(arr)
#to sort in decreasing order
sort(arr, decreasing = TRUE)
sort(arr, decreasing = FALSE)


#METHOD 2: Order ()
#define data frame
df <- data.frame("Age" = c(25,21,34,32,28),
                 "Name" = c("Ram", "Rahim", "Alfred","Sunny", "Munmun"))

#sort the data frame on the basis of age column and store it in newdf
newdf <- df[order(df$Age), ]

#print sorted data frame
print(newdf)

#sort the data frame on the basis of name column and store it in newdf1
newdf1 <- df[order(df$Name), ]

#print sorted data frame
print(newdf1)



#define data frame
df <- data.frame("Age" = c(25,25,32,32,28),
                 "Name" = c("Ram", "Rahim", "Alfred",
                            "Sunny", "Munmun"))
# sort the data frame first on the basis of
# Age and if age is same perform sort on Name
newdf3 <- df[order(df$Age, df$Name), ]
# print sorted data frame
print(newdf3)


#METHOD 3:
#dplyr used for sorting

install.packages("dplyr")
library(dplyr)

#create data frame
df <- data.frame("Age" = c(25,25,32,32,28),
                 "Name" = c("Ram", "Rahim", "Alfred",
                           "Sunny", "Munmun"))

#sort the data frame on the basis of age column using arrange method
arrange(df,Age)




#Create a vector
apple <- c('red', 'green',"yellow")
print(apple)

#Get the class of vector
print(class(apple))

#create a list
list1 <- list (c(2,5,3), 21.3, cos)
#list1 <- list (c("munmum"), 21.3, cos)
#list1[0] => list()
#list1[[2]] => munmun
#list1[1] => munmum

#print the list
print(list1)

#Create a matrix
M = matrix(c('a','a','b','c','b','a'), nrow = 2, ncol = 3, byrow=TRUE)
print(M)

M1 = matrix(c('a','a','b','c','b','a'), nrow = 2, ncol = 3)
print(M1)


#Create an array
#while matrices are confined to two dimensions, array can be of any no. of dimensions.
#the array fn takes a dim attribute
a <- array(c('green','yellow'),dim=c(3,3,2))
print(a)

a1 <- array(c(10,20,30,40),dim=c(3,3,2))
print(a1)

#Factors are the r-objects which are created using a vector.
#It stores the vector along with the distinct values of the elements in the vector as lables.
#The labels are always character irrespective of weather it is numeric or char or boolean etc. in the input vector.
#They are very useful in statistical modelling.

#Create a vector.
apple_colors <- c('green','green','yellow', 'red','red','red','green')

#create a factor object
factor_apple <- factor(apple_colors)

#Print the factor
print(factor_apple)
print(nlevels(factor_apple))



#orinal - ordered data - ratings for marks/performace like excellent, v good, good, poor
#nominal - unordered data - lists in which you cant define ratings eg : in a bank saving, Current, FD, RD 

#file name = 

#csv is semi structured data type

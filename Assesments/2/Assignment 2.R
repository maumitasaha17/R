library(readr)
mtcars <- read_csv("C:/Users/MAUMITA/Desktop/SkillEnable/R/Dataset/mtcars.csv")
View(mtcars)

#view the structure of the data set
str(mtcars)

#Top 10 data points
head(mtcars,10)

#Bottom 10 data points
tail(mtcars,10)

#Summary
summary(mtcars)

#Histogram of bmi
hist(mtcars$mpg , col = "dark red")

#Stem & Leaf Diagram
stem(mtcars$mpg)

#Box plot
boxplot(mtcars$mpg, col = "dark red")

#Scatter plot
plot(mtcars, col = "red")
############################################################################################

library(ggplot2)
data(cars)
ggplot(cars, aes(x=speed, y=dist)) + 
  geom_point(color='#2980B9', size = 4) + 
  geom_smooth(method=lm, color='#2C3E50')

cars.lm <- lm(dist ~ speed, data = cars)
summary(cars.lm)
dim(cars)
#view the structure of the data set
str(cars)

#Top 10 data points
head(cars,10)

#Bottom 10 data points
tail(cars,10)

#Summary
summary(cars)

#Histogram
hist(cars$speed ,col = "dark red")

#Stem & Leaf Diagram
stem(cars$speed)

#Box plot
boxplot(cars, col = "dark red")

#Scatter plot
plot(cars, col = "red")

#CORRELATIONS AMONG ALL VARIABLES
cor(cars)

###################################################################################################
library(readr)
insurance <- read_csv("C:/Users/MAUMITA/Desktop/SkillEnable/R/Dataset/insurance.csv")
View(insurance)

#view the structure of the data set
str(insurance)

#Top 10 data points
head(insurance,10)

#Bottom 10 data points
tail(insurance,10)

#Summary
summary(insurance)

#Histogram of bmi
hist(insurance$bmi , col = "orange")

#Scatter plot
plot(insurance, col = "orange")

table(insurance$region)


insurance.lm <- lm(bmi ~ charges, data = insurance)
summary(insurance.lm)



###################################################################################
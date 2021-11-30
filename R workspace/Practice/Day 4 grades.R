#Assignment

library(readr)
grades <- read_csv("C:/Users/MAUMITA/Desktop/SkillEnable/R/Dataset/grades.csv")
View(grades)


#plot histogram of gpa
hist(grades$gpa, col = "dark green")

#Stem & Leaf Diagram gpa
stem(grades$gpa)

#Box plot of gpa
boxplot(grades$gpa, col = "dark green")

#Correlation btw gpa and final. comment on strength of correlation
cor(grades$gpa,grades$final)

#scatter plot of gpa (x axis) and final (y axis)
plot(grades$gpa , grades$final, col = c("green", "blue"))
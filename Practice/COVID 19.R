rm(list = ls()) #removes all variables stored previously
library(Hmisc) #import

data <- read.csv("C:/Users/MAUMITA/Desktop/SkillEnable/R/Practice/COVID19_line_list_data.csv")
View(data)
describe(data) #Hmisc command
#1085 observations of 27 variables


#Cleaning data of death column
data$death_dummy <- as.integer(data$death != 0)
#death rate
sum(data$death_dummy) / nrow(data)
#0.05806452


#age
#Claim : people who died are older
dead = subset(data, death_dummy == 1) #63 observations 
alive = subset(data, death_dummy == 0) #1022 observations

mean(dead$age, na.rm = TRUE) #68.58621
mean(alive$age, na.rm = TRUE) #48.07229


#is this statistically significant?
t.test(alive$age, dead$age, alternative = "two.sided", conf.level = 0.95)

#normally, if p-value < 0.05, we reject null hypothesis and 
#conclude that this is sgatistically significant


#gender
#Claim : gender has no effect
men = subset(data, gender == "male") #520 obs
women = subset(data, gender == "female") #382 obs

mean(men$death_dummy, na.rm = TRUE) #0.08461538
mean(women$death_dummy, na.rm = TRUE) #0.03664921


#is this statistically significant?
t.test(men$death_dummy, women$death_dummy, alternative = "two.sided", conf.level = 0.99)
#99% confidence : men have from 0.8% to 8.8% higher chance of dying
#p-value = 0.002 < 0.05,reject the null hypothesis, so this is statically significant
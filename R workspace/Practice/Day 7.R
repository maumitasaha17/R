#bussiness statistics
#FORCASTING & TIME SERIES ANALYSIS

#PROBABILITY , bayesian theory, Bayes theorem, Poisson distribution, 
#to know what the function use - ?function_name - ?rpois


#SAMPLING AND SAMPLING DISTRIBUTION

#In this part we will investigate the exponential dist. in R and compare it with cental limit theorem
#we will do a thousand simulations to investigate the distribution of averages of 40 exponentials

#first we will generate 1000 samoles and compute the sample mean of ecah
sample_means = rep(NA,1000)
for (i in 1:1000) {
  sample_means[i]=mean(rexp(40,0.2))
}

#after that we will compare the sample mean from the simulation to the theoritical mean of the dist.
#Here is how to compute the sample mean of the distrubution from the simulatuion.
mean(sample_means)

#ANd then here we will calculate the theoritical mean of the dist.
1/0.2

# From the calculation above, we can see that the sample mean from the simulation is closely similar with the theoretical mean.
# 
# Now, we will compare the sample variance from the simulation to the theoretical variance of the distribution.
# 
# Here is how to compute the variance of the distribution from the simulation.
var(sample_means)

#Calculate the theoritical variance of the dist.
((1/0.2)^2)/40

# From the calculation above, we can see that the sample variance from the simulation is closely similar with the theoretical mean.
# 
# Now, we will try to show if the distribution from our simulation is normal or not.
# 
# We can verify the normal distribution by comparing the frequency histogram and the density line like shown below :
hist(sample_means, main = " ", xlab = "Sample Means", prob = T, col = "dark red")
lines(density(sample_means), col="dark blue", lwd=2)

#Or, we could verify the normal distribution just by using qqplot like shown below :
qqnorm(sample_means, col="dark green", main = "Normal Q-Q Plot")
qqline(sample_means, col="dark orange",lwd=3)


#what does sampling do? sampling will create samples from the main population.
#Sample calculation is nearly equal to the population calculation.


y<-rnom(1000)
z<- rep(NA,1000)
mynewdata = sample(c(y,z),10)
mynewdata

#######################################################################################################
#ANOVA-analysis of variance 
#investigate relations between catagorious and continious variavles 
#2 types- one way (one catagorical group to consideration), two way(2 catagorical group into consideration)


install.packages("dplyr")
library(dplyr)
data("mtcars")
View(mtcars)
dim(mtcars)
#Variance in mean within group and between group
boxplot(mtcars$disp~factor(mtcars$gear), xlab = "gear", ylab="disp")

# Step 1: Setup Null Hypothesis and Alternate Hypothesis
# H0 = mu = mu01 = mu02(There is no difference
# between average displacement for different gear)
# H1 = Not all means are equal

# Step 2: Calculate test statistics using aov function
mtcars_aov <- aov(mtcars$disp~factor(mtcars$gear))
summary(mtcars_aov)

# Step 3: Calculate F-Critical Value
# For 0.05 Significant value, critical value = alpha = 0.05

# Step 4: Compare test statistics with F-Critical value
# and conclude test p < alpha, Reject Null Hypothesis


######################################################################################################
#2 way anova

library(dplyr)
data("mtcars")
View(mtcars)
dim(mtcars)

# Variance in mean within group and between group
boxplot(mtcars$disp~mtcars$gear, subset = (mtcars$am == 0), 
        xlab = "gear", ylab = "disp", main = "Automatic")
boxplot(mtcars$disp~mtcars$gear, subset = (mtcars$am == 1),
        xlab = "gear", ylab = "disp", main = "Manual")

# Step 1: Setup Null Hypothesis and Alternate Hypothesis
# H0 = mu0 = mu01 = mu02(There is no difference between
# average displacement for different gear)
# H1 = Not all means are equal

# Step 2: Calculate test statistics using aov function
mtcars_aov2 <- aov(mtcars$disp~factor(mtcars$gear) * 
                     factor(mtcars$am))
summary(mtcars_aov2)


# Step 3: Calculate F-Critical Value
# For 0.05 Significant value, critical value = alpha = 0.05

# Step 4: Compare test statistics with F-Critical value 
# and conclude test p < alpha, Reject Null Hypothesis









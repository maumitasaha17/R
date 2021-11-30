# Multinomial regression is an extension of binomial logistic regression. The algorithm allows us to predict a categorical dependent variable which has more than two levels. Like any other regression model, the multinomial output can be predicted using one or more independent variable. The independent variables can be of a nominal, ordinal or continuous type.
# One can use multiple logistic regression to predict the type of flower which has been divided into three categories – setosa, versicolor, and virginica. Alternatively, you can use multinomial logistic regression to predict the type of wine like red, rose and white. In this tutorial, we will be using multinomial logistic regression to predict the kind of wine. The data is available in {rattle.data} package and thus we would encourage you to copy paste the code and rerun the model in your local system
# However, before we carry out a multinomial regression using R we need to check for the following things to ensure that the final output is valid. list of things which we must check –
# 
# 1. Your dependent variable must be Nominal. This does not mean that multinomial regression cannot be used for the ordinal variable. However, for multinomial regression, we need to run ordinal logistic regression.
# 
# 2. You must convert your categorical independent variables to dummy variables.
# 
# 3. There should be no multicollinearity.
# 
# 4. There should be a linear relationship between the dependent variable and continuous independent variables. As we cannot measure this directly between nominal and continuous variables what we do is we take logit transformation of the dependent variable.
# 
# 5. Ensure that we do not have outliers and high influential points in the data.
# 
# PREDICTING WINE TYPE USING MULTINOMIAL LOGISTIC REGRESSION
# For this example, as we mentioned, we are using wine dataset from {rattle.data} package in R. Let’s first load the data.

# Loading the library
install.packages("rattle.data")
library(rattle.data)
# Loading the wine data
data(wine)
dim(wine)
#The dataset contains information about 178 uniques wines divided into three categories which are represented by 1 to 3 numbers. The dependent variable here is Type. To get an overview of the dataset let us check the structure of wine data.

# Checking the structure of wine dataset
str(wine)

# Multinomial regression dataset explore
# 
# Albeit, we are not performing exploratory data analysis. Please remember that it is an important step and you should not skip that step while doing any modeling exercise.
# 
# We now split the dataset into train and test using sample_frac() function from {dplyr} package.

# Loading the dplyr package
library(dplyr)

# Using sample_frac to create 70 - 30 slipt into test and train
train <- sample_frac(wine, 0.7)
sample_id <- as.numeric(rownames(train)) # rownames() returns character so as.numeric
test <- wine[-sample_id,]

#To build the multinomial model we have a couple of functions in R. However, in this example we use mutinom() function from {nnet} package. Remember when we build logistic models we need to set one of the levels of the dependent variable as a baseline. We achieve this by using relevel() function. In other functons or algorithms, this process is generally automated.

# Setting the basline 
train$Type <- relevel(train$Type, ref = "3")
#Once the baseline has been specified, we use multinom() function to fit the model and then use summary() function to explore the beta coefficients of the model.

# Loading the nnet package
install.packages("nnet")
require(nnet)
# Training the multinomial model
multinom.fit <- multinom(Type ~ Alcohol + Color -1, data = train)

# Checking the model
summary(multinom.fit)

multinom.fit1 <- multinom(Type ~ Alcohol + Color, data = train)
multinom.fit1

multinom.fit
#multinomial regression model output

#We used -1 in the formula to delete the intercept. We think that it does not make sense in the model and so we removed it.

#The output of summary contains the table for coefficients and a table for standard error. Each row in the coefficient table corresponds to the model equation. The first row represents the coefficients for Type 2 wine in comparison to our baseline which is Type 3 wine and the second row represents the coefficients for Type 2 wine in comparison to our baseline which is Type 3 wine.



#The output coefficients are represented in the log of odds.

#This ratio of the probability of choosing Type 2 wine over the baseline that is Type 3 wine is referred to as relative risk (often described as odds). However, the output of the model is the log of odds. To get the relative risk IE odds ratio, we need to exponentiate the coefficients.

## extracting coefficients from the model and exponentiate
exp(coef(multinom.fit))
#multinomial regression exp coeefficient

#The relative risk ratio for a one-unit increase in the variable color is .491 for being in Type 1 wine vs. Type 3 wine. Here a value of 1 represents that there is no change. However, a value greater than 1 represents an increase and value less than 1 represents a decrease.

#We can also use probabilities to understand our model.

head(probability.table <- fitted(multinom.fit))
#multinomial regression predicted values

#The table above indicates that the probability of 89th obs being Type 2 wine is 90.0%, it being Type 1 wine is 8.9%and it being Type 3 wine is 0.0%. Thus we can conclude that the 89th observation is Type 2. On a similar note – 57th observation is Type 1, 170th observations isType 3 and so on.

#We will now check the model accuracy by building classification table. So let us first build the classification table for training dataset and calculate the model accuracy.

# Predicting the values for train dataset
train$precticed <- predict(multinom.fit, newdata = train, "class")

# Building classification table
ctable <- table(train$Type, train$precticed)

# Calculating accuracy - sum of diagonal elements divided by total obs
round((sum(diag(ctable))/sum(ctable))*100,2)
#Accuracy in training dataset is 68.8%. We now repeat the above on the unseen dataset that tests dataset.

# Predicting the values for train dataset
test$precticed <- predict(multinom.fit, newdata = test, "class")

# Building classification table
ctable <- table(test$Type, test$precticed)

# Calculating accuracy - sum of diagonal elements divided by total obs
round((sum(diag(ctable))/sum(ctable))*100,2)

#The accuracy of the test dataset turns out to be 18.4% less as compared to training dataset. So we have a problem of overfitting here. Despite what accuracy we get the process of building the multinomial logistic regression remains the same.

# WHAT NEXT?
#   Next, we suggest you solve this problem by achieving better results and solving the overfitting problem. To start with trying the following checks –
# 
# 1. Look for multicollinearity.
# 
# If it exists – a. Remove variable or b. Run factor analysis
# 
# 2. Check for outliers and do the necessary treatment.

#3. Try different data transformations for independent variables.

D
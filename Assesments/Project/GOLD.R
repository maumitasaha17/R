library(readxl)
Gold <- read_excel("C:/Users/MAUMITA/Desktop/SkillEnable/R/Dataset/Gold.xlsx")
View(Gold)

install.packages("forecast")
install.packages("tseries")
install.packages("TSstudio")


library(forecast) #Time series forecast and modeling
library(tseries) # to read time series and ts plots
library(readxl) # To read excel files
library(TSstudio) # superb visualizations

GTS<-ts(Gold[,2], frequency = 12,start = c(1969,12), end=c(2018,7))
class(GTS)
View(GTS)
start(GTS)
end(GTS)
head(cycle(GTS),12)
GTS


plot(GTS)#Visualization
ts_plot(GTS,title = "Gold prices in US Dollars per ounce", Xtitle = "Year", Ytitle = "Price per ounce")

library(TSstudio)
ts_heatmap(GTS)
ts_polar(GTS)
ts_decompose(GTS, type = "both")
ts_lags(GTS)
acf(GTS, lag.max = 20)
pacf(GTS, lag.max = 20)

#Test for Stationarity
adf.test(GTS, "stationary")
acf(GTS, main="Auto Correlation Function")
pacf(GTS, main = "PACF")


D1<-diff(GTS, differences = 1)
D1
ts_plot(D1, title = "Differenced time series plot")

adf.test(D1, "stationary")
acf(D1, main="Auto Correlation Function of Differenced series")
pacf(D1, main="Partial Auto Correlation Function of Differenced series")

library(TSstudio)

h <- 24

# Split the data into training and testing sets
#(leaving the last 24 months for testing)
split_GTS <- ts_split(GTS, sample.out = h)

train <- split_GTS$train
test <- split_GTS$test

head(train, 5)
start(train); end(train) # start date and end date of training set

head(test, 5)
start(test); end(test) # start date and end date of training set
#Residuals analysis
#The check_res function visualize the traditional plot of the residuals over time,
#and the corresponding auto correlation function and the histogram (of the residuals):



library(forecast)
# Building a model on the training set
fit <- auto.arima(train, lambda = BoxCox.lambda(train))
fit
accuracy(fit)
# Checking the residuals
res<-check_res(fit)
res

#Forecast evaluation with the test_forecast
#The test_forecast function visualizes the fitted values vs the training
#partition values and the forecasted values vs the testing partitions values.
#In addition, the tooltip of the plot provides information about the model performance
#(MAPE and RMSE of the training and testing partitions):

fc <- forecast(fit, h = h)
fc
accuracy(fc)

tfc<-test_forecast(actual = GTS, forecast.obj = fc, test = test)
tfc
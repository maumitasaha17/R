#Time series

install.packages("tseries")
install.packages("MASS")
install.packages("caTools")
install.packages("psych")
library("tseries")
library(MASS)
library("caTools")
library(psych)

data("AirPassengers")
class(AirPassengers)
AirPassengers
start(AirPassengers)
end(AirPassengers)
#to see interval of time frequency function
frequency(AirPassengers)
summary(AirPassengers)

#getwd()
#no. of passengers across the time
plot(AirPassengers)
abline(reg=lm(AirPassengers~time(AirPassengers)))

cycle(AirPassengers)
plot(aggregate(AirPassengers, FUN=mean))

boxplot(AirPassengers~cycle(AirPassengers))

plot(log(AirPassengers))
abline(reg=lm(log(AirPassengers)~time(AirPassengers)))


plot(aggregate(log(AirPassengers),FUN=mean))

x=aggregate(log(AirPassengers),FUN=mean)
x

#to check all components
plot(decompose(AirPassengers))

x<-log(AirPassengers)
plot(decompose(x))
plot(diff(log(AirPassengers)))
plot(diff(diff(log(AirPassengers))))
abline(reg=lm(diff(log(AirPassengers))~time(diff(log(AirPassengers)))))

#Augmented Dickey Fuller test

adf.test(diff(AirPassengers),alternative="stationary",k=0)
adf.test(diff(log(AirPassengers)),alternative="stationary",k=0)

acf(diff(log(AirPassengers)))
pacf(diff(log(AirPassengers)))




fit<-arima(log(AirPassengers),c(1,1,1),seasonal = list(order=c(1,1,1),period=12))
pred<-predict(fit,n.ahead=10*12)
pred
ts.plot(AirPassengers,2.718^pred$pred, log="y", lty=c(1,3))
ts.plot(AirPassengers,pred$pred, log="y", lty=c(1,3))
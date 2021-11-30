getwd()
setwd("D:\\munmun\\munmun pendrive\\CCSA_X86FRE\\BA Advance v1\\Day 4")
getwd()

slr<-read.csv("slr.csv")
cs2m<- read.csv("cs2m.csv")
min(cs2m$BP)
View(cs2m)
max()

#slr<-read.csv("C:\\Users\\iimpstudent\\Desktop\\r FDP SDD\\slr.csv")
View(slr)
plot(slr)
plot(slr$Advt,slr$Sales)
cor(slr$Advt,slr$Sales)

cor(slr)
#model <- lm(Sales~Advt,data = slr)
model<-lm(slr$Sales~slr$Advt)
model

yp<-(-852.08+19.07*500)
yp

summary(model)
pred= predict(model)

pred

slr$prediction <-predict(model)
View(slr)

#pred<-predict(model)
#pred

#slr$prediction<-pred
#View(slr)
#error <- slr$prediction-slr$Sales
error<-residuals(model)
error

slr$error<-residuals(model)
slr
View(slr)
summary(error)

#ASSUMPTIONS
#1. NORMALITY OF ERROR
hist(slr$error,col="red")

#2.linearity
plot(slr$Advt,slr$error,main = "linearity",col="blue")

#3. Independence of errors
plot(slr$Observation.no,slr$error,main = "Independence of errors",col="blue")

#Constant error variance
plot(slr$prediction,slr$error,main = "Constant error variance",col="blue")

slr$err<-error
View(slr)

sqe<-slr$err^2
sqe
slr$ssqe<-sqe
View(slr)

SSE1 <- sum(error^2)
SSE1

SSE<-sum(slr$ssqe)
SSE

sal_mean<-mean(slr$Sales)
sal_mean
sal_res<-(slr$prediction-sal_mean)^2
slr$sqres<-sal_res
View(slr)
SSR<-sum(slr$sqres)
SSR

rsq <- SSR/(SSR+SSE)
rsq

hist(slr$err,col="red")




# cs2m.csv: predict cholestorol

getwd()
setwd("E:\\munmun pendrive\\CCSA_X86FRE\\BA Advance v1\\Day 4")
getwd()

cs2m<- read.csv("cs2m.csv")
View(cs2m)

cor(cs2m)

#model<- lm(Chlstrl~.,data=cs2m)

model<-lm(cs2m$Chlstrl~cs2m$BP+cs2m$Age+cs2m$Prgnt+cs2m$AnxtyLH+cs2m$DrugR)
model

summary(model)

model1<- lm(Chlstrl~.-BP -Prgnt- DrugR,data=cs2m)
model1

summary(model1)


cs2m$prediction <-predict(model)
View(cs2m)

cs2m$error<-residuals(model)
View(cs2m)





summary(model)


model1<- lm(cs2m$Chlstrl~cs2m$BP+cs2m$Age+cs2m$Prgnt+cs2m$AnxtyLH)
summary(model1)


model2<- lm(cs2m$Chlstrl~cs2m$Age+cs2m$AnxtyLH)
summary(model2)


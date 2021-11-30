install.packages("FactorMineR")
library(FactorMineR)
cor(red.wine)
wine.pca<-PCA(red.wine, quanti.sup=12)
summary(wine.pca)

plot(wine.pca$eig$eigenvalue, type = 'b', xlab = 'Principal
Component', ylab = 'Eigenvalue', main = 'Eigenvalues of Principal
Components')
summary(wine.pca, ncp = 4)

##################################################################################
library(readr)
diabetes <- read_csv("C:/Users/MAUMITA/Desktop/SkillEnable/R/Dataset/diabetes.csv")
View(diabetes)


getwd()
diab<-read.csv("~C:/Users/MAUMITA/Desktop/SkillEnable/R/Dataset/diabetes.csv")

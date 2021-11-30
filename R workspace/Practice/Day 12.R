#Clustering concepts and case study


library(readr)
movie_metadata <- read_csv("C:/Users/MAUMITA/Downloads/movie_metadata.csv")
View(movie_metadata)

cs<-read.csv("C:/Users/MAUMITA/Downloads/movie_metadata.csv")
View(cs)
library(psych)
dim(cs)
str(cs)
describe(cs)
summary(cs)
head(cs)
tail(cs)

#convert entire data into matrix format
csmatrix<-data.matrix(cs)
View(csmatrix)
dim(csmatrix)

is.na(csmatrix)
sum(is.na(csmatrix))
summary(csmatrix)
dim(csmatrix)
#Dropp the NA values
csmatrix<-na.omit(csmatrix)
dim(csmatrix)
summary(csmatrix)

#nrow(csmatrix)
#selecting sample
sample<-csmatrix[sample(nrow(csmatrix),500),]
View(sample)
dim(sample)
getwd()
library(psych)
#to observe the column location of budget & gross
describe(sample)


#selecting facebook likes(c9,c23) for cluster analysis
sample_short<-sample[,c(9,23)]
View(sample_short)
sample_matrix<-data.matrix(sample_short)


#Elbow curve
wss=NA
for (i in 2:15) wss[i]<-sum(kmeans(sample_matrix,centers=i)$withinss)
plot(1:15, wss, type = "b",xlab="Number of clusters",ylab="Within Sum of squares")

#Kmeans clustering for k=3
cl<-kmeans(sample_matrix,3,nstart=25)
cl

plot(sample_matrix, col=(cl$cluster+1),main = "K-means result with 2 clusters",pch=1,cex=1,las=1)
pointsx(cl$centers, col="red",pch=8,cex=2)


################################################################################################################################





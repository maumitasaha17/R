

library(readr)
movie_metadata <- read_csv("~/Downloads/movie_metadata.csv")
View(movie_metadata)

cs<-read.csv("~/Downloads/movie_metadata.csv")
View(cs)
library(psych)
describe(cs)
summary(cs)
head(cs)
dim(cs)

csmatrix<-data.matrix(cs)
View(csmatrix)
dim(csmatrix)

#is.na(csmatrix)
sum(is.na(csmatrix))
summary(csmatrix)
dim(csmatrix)
csmatrix<-na.omit(csmatrix)
dim(csmatrix)
summary(csmatrix)

#nrow(csmatrix)
# selecting sample
sample<- csmatrix[sample(nrow(csmatrix),500),]
View(sample)
dim(sample)

library(psych)
describe(sample)  #to observe the column location of budget and gross

#selecting facebook likes(c9,c23)for cluster analysis
sample_short<-sample[,c(9,23)]
View(sample_short)
sample_matrix<- data.matrix(sample_short)

# Elbow curve
#wss <- (nrow(sample_matrix)-1)*sum(apply(sample_matrix,2,var))
wss=NA
for (i in 2:15) wss[i]<-sum(kmeans(sample_matrix,centers=i)$withinss)
plot(1:15,wss,type="b",xlab="Number of Clusters", ylab = "within Sum of Squares")

#k means clustering for k=3
cl <- kmeans(sample_matrix,3,nstart=25)
cl
cl2 <- kmeans(sample_matrix,2,nstart=25)
cl2$withinss


plot(sample_matrix, col = (cl$cluster+1),  
     main = "K - means result with 2 clusters",pch =1,cex=1,las=1)
points(cl$centers, col ="red", pch =8, cex =2)

plot(sample_matrix, col = cl$cluster+6,  
     main = "K - means result with 2 clusters",pch =2,cex=1,las=1)
points(cl$centers, col =34, pch =20, cex =1)


#k means clustering for k=4
c2 <- kmeans(sample_matrix,4,nstart=50)
plot(sample_matrix, col = c(c2$cluster+1),  main = "K - means result with 2 clusters",pch =1,cex=1,las=1)
points(c2$centers, col =12, pch =8, cex =2)
c2

# c3 <- kmeans(sample_matrix,4,nstart=50)
# plot(sample_matrix, col = c("red","yellow","green","blue"),  main = "K - means result with 2 clusters",pch =1,cex=1,las=1)
# points(c3$centers, col =12, pch =8, cex =2)

cl$centers
dim(sample)

aggregate(data=sample,movie_facebook_likes~cl$cluster,mean)

aggregate(data=sample,gross~cl$cluster,mean)
#
apply clustering in mtcars dataset on the parameters given in session

data("mtcars")
head(mtcars)



(x1,y1)      (x2,y2)----sqrt((x1-x2)2+(y1-y2)2)

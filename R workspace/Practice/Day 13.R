#continue of Day 12

#Kmeans clustering for k=3
cl<-kmeans(sample_matrix,3,nstart=25)
cl

plot(sample_matrix, col=(cl$cluster+1),main = "K-means result with 2 clusters",pch=1,cex=1,las=1)
points(cl$centers, col="red",pch=8,cex=2)

plot(sample_matrix, col=c("red","blue","green"),
     main = "K-means result with 2 clusters",pch=1,cex=1,las=1)
points(cl$centers, col="red",pch=8,cex=2)


#Kmeans clustering for k=4
c2<- kmeans(sample_matrix,4,nstart=50)
plot(sample_matrix, col=c(c2$cluster+1),main="k-means result with 2 clusters", pc)
points(c2$centers, col=12, pch=8,cex=2)


cl$centers
dim(sample)
aggregate(data=sample, movie_facebook_likes~cl$cluster,mean)
aggregate(data=sample, gross~cl$cluster,mean)
apply

data("mtcars")
head(mtcars)


#based on hp,cyl and wt find the optimum no. of clusters/segment the car models
#hence find which set of car model does good based on mpg












###################################################################################################
#Feature engineering & dimension reduction and case study
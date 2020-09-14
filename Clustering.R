getwd()
setwd("C:/Users/LELLA HEMANTH/Desktop/major")
mydata<-read.csv("cluster.csv")
mydata = na.omit(mydata) #deletion of missing
mydata = scale(mydata) #standarize variables

wss <- (nrow(mydata)-1)*sum(apply(mydata,2,var))

for (i in 2:15) wss[i] <- sum(kmeans(mydata, 
                                     centers=i)$withinss)
plot(1:15, wss, type="b", xlab="Number of Clusters",
     ylab="Within groups sum of squares")
# check out the plot


fit <- kmeans(mydata, 3) # 3 cluster solution
# get cluster means 
aggregate(mydata,by=list(fit$cluster),FUN=mean)
# append cluster assignment
mydata <- data.frame(mydata, fit$cluster)
a<-fit$cluster
a
mydata$cluster<-NA
mydata$cluster<-a
#visualize the clustering results

library(cluster) 
clusplot(mydata, fit$cluster, color=TRUE, shade=TRUE, labels=2, lines=0)


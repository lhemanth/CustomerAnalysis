mydata<-read.csv("cluster.csv")
mydata = na.omit(mydata) #deletion of missing

wss <- (nrow(mydata)-1)*sum(apply(mydata,2,var))
for (i in 2:15) wss[i] <- sum(kmeans(mydata, 
                                     centers=i)$withinss)
plot(1:15, wss, type="b", xlab="Number of Clusters",
     ylab="Within groups sum of squares")
# check out the plot


fit <- kmeans(mydata, 3) # 5 cluster solution
# get cluster means 

mydata <- data.frame(mydata, fit$cluster)
a<-fit$cluster
a
mydata$cluster<-NA
mydata$cluster<-a
plot(mydata$cluster,mydata$MonthlyCharges)

my_table2=table(mydata$cluster)
barplot(my_table2,main = "Over All Rating",xlab="Ratings")
pie(my_table2,radius = 1,angle = 45,density = NULL)

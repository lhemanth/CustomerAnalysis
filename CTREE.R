getwd()
setwd("C:/Users/LELLA HEMANTH/Desktop/major")
data<-read.csv("customer.csv")
attach(data)
head(data)

library(party)
output <- ctree(Churn ~ +TotalCharges +gender + Contract ,data = data )
output1 <- ctree(Churn ~ + gender +TotalCharges+MonthlyCharges+PaperlessBilling
                +InternetService+tenure+MultipleLines+ Contract ,data = data )
output2 <-ctree(Churn ~ + gender +PaperlessBilling
                +InternetService+tenure+ Contract ,data = data )


print(output)

plot(output)
plot(output1)
plot(output2)
dev.off()


data1<-read.csv("test2.csv")

library(caret)
pred<-predict(output,newdata=data1)
confusionMatrix(pred,data1$Churn)

library(caret)
pred<-predict(output1,newdata=data1)
confusionMatrix(pred,data1$Churn)

library(caret)
pred<-predict(output2,newdata=data1)
confusionMatrix(pred,data1$Churn)

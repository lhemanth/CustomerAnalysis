data<-read.csv("customer.csv")
getwd()
setwd("/major")
attach(data)
plot(gender,col="16")
y<-plot(InternetService)
plot(Contract)
plot(PhoneService)

data1<-data[Contract=="Month-to-month",]
plot(data1$gender)
plot(data1$InternetService)
summary(data1$MonthlyCharges)
summary(data1$TotalCharges)
plot(data1$PhoneService)



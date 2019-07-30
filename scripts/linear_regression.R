library(ISLR); library(caret); data(Wage)

summary(Wage)

inTrain <- createDataPartition(y=Wage$wage, list=F, p=0.7)

training <- Wage[inTrain,]
testing <- Wage[-inTrain,]
dim(training); dim(testing)
library(kernlab)
library(caret)
data(spam)

print(summary(spam$type))

inTrain <- createDataPartition(y=spam$type, p=.75, list=F)
training <- spam[inTrain,]
testing <- spam[-inTrain,]

hist(training$capitalAve, main="", xlab="ave. capital run length")

trainCapAve <- training$capitalAve
trainCapAveS <- (trainCapAve - mean(trainCapAve)) / sd(trainCapAve)
print(table(c(mean(trainCapAveS), sd(trainCapAveS))))

testCapAve <- testing$capitalAve
testCapAveS <- (testCapAve - mean(trainCapAve)) / sd(trainCapAve)
print(table(c(mean(testCapAveS), sd(testCapAveS))))

preObj <- preProcess(training[,-58], method=c("center", "scale"))
trainCapAveS <- predict(preObj, training[,-58])$capitalAve
print(mean(trainCapAveS))
print(sd(trainCapAveS))

preObj <- preProcess(training[,-58], method=c("BoxCox"))
trainCapAveS <- predict(preObj, training[,-58])$capitalAve
print(mean(trainCapAveS))
print(sd(trainCapAveS))

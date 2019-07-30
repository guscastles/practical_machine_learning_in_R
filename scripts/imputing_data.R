set.seed(13343)
library(caret)
library(kernlab)
library(RANN)
data(spam)

inTrain <- createDataPartition(y=spam$type, p=.74, list=F)

training <- spam[inTrain,]

training$capAve <- training$capitalAve
selectNA <- rbinom(dim(training)[1], size=1, prob=0.05) == 1
training$capAve[selectNA] <- NA

preObj <- preProcess(training[,-58], method="knnImpute")
capAve <- predict(preObj, training[,-58])$capAve

capAveTruth <- training$capitalAve
capAveTruth <- (capAveTruth - mean(capAveTruth))/sd(capAveTruth)

print(quantile(capAve - capAveTruth))

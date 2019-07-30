set.seed(1235)
library(caret)
library(kernlab)

data(spam)

inTrain <- createDataPartition(y=spam$type, p=.6, list=F)
training <- spam[inTrain,]
testing <- spam[-inTrain,]

modelFit <- train(type ~ ., data=training, method="glm")
print(modelFit)

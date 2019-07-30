library(AppliedPredictiveModeling)
data(segmentationOriginal)
library(caret)
set.seed(125)
dataset <- subset(segmentationOriginal, select = c(VarIntenCh4, TotalIntenCh2, FiberWidthCh1, PerimStatusCh1, Class))
inTrain <- createDataPartition(y=segmentationOriginal$Case, list=F, p=.7)
training <- dataset[inTrain,]
testing <- dataset[-inTrain,]

cartModel <- train(Class ~ VarIntenCh4 + TotalIntenCh2 + FiberWidthCh1 + PerimStatusCh1, data = training, method = "rpart")
prediction <- predict(cartModel, testing)

plot(cartModel$finalModel, uniform=TRUE, main="Classification Tree")
text(cartModel$finalModel, use.n=TRUE, all=TRUE, cex=.6)

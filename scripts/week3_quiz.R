library(AppliedPredictiveModeling)
data(segmentationOriginal)
library(caret)

training_index <- createDataPartition(segmentationOriginal$Case, p = 0.75, list = FALSE)
set.seed(125)
training_set <- segmentationOriginal[training_index,]
testing_set <- segmentationOriginal[-training_index,]
CART <- train(training_set[, -3], training_set$Class, method = "rpart")

test_1 <- testing_set[1,]
test_1$FiberWidthCh1 <- 10; test_1$TotalIntench2 <- 23000; test_1$PerimStatusCh1 <- 2
test_1$TotalIntench2 = 50000; test_1$FiberWidthCh1 = 10; test_1$VarIntenCh4 = 100 
test_1$TotalIntench2 = 57000; test_1$FiberWidthCh1 = 8; test_1$VarIntenCh4 = 100 
test_1$FiberWidthCh1 = 8; test_1$VarIntenCh4 = 100; test_1$PerimStatusCh1=2 
predict(CART, test_1)

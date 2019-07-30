if (!installed.packages("AppliedPredictiveModeling")) {
        install.packages("AppliedPredictiveModeling")
}
if (!installed.packages("e1071")) {
        install.packages("e1071")
}
library(caret)
library(AppliedPredictiveModeling)
library(Hmisc)
library(tidyr)
library(dplyr)
library(e1071)

question_1 <- function() {
        data(AlzheimerDisease)
        adData = data.frame(diagnosis,predictors)
        trainIndex = createDataPartition(diagnosis, p = 0.50, list=FALSE)
        training = adData[trainIndex,]
        testing = adData[-trainIndex,]
        dim(training)
        dim(testing)
}

question_2 <- function() {
        data(concrete)
        set.seed(1000)
        inTrain = createDataPartition(mixtures$CompressiveStrength, p = 3/4)[[1]]
        training = mixtures[ inTrain,]
        testing = mixtures[-inTrain,]
        compStrengthCur <- cut2(mixtures$CompressiveStrength, g = 3)
        table(compStrengthCur)
        featurePlot(x = mixtures$CompressiveStrength, y=1:dim(mixtures)[1], color = mixtures$Age, data = mixtures, plot = "pairs")
        ageCut <- cut2(mixtures$Age, g = 5)
        qplot(CompressiveStrength, 1:dim(mixtures)[1], data = mixtures, color = ageCut)
        flyashCut <- cut2(mixtures$FlyAsh, g = 5)
        qplot(CompressiveStrength, 1:dim(mixtures)[1], data = mixtures, color = flyashCut)
        qplot(CompressiveStrength, FlyAsh, data = mixtures, color = flyashCut)
}

question_3 <- function() {
        data(concrete)
        set.seed(1000)
        inTrain = createDataPartition(mixtures$CompressiveStrength, p = 3/4)[[1]]
        training = mixtures[ inTrain,]
        testing = mixtures[-inTrain,]
        hist(training$Superplasticizer)
        log10(training$Superplasticizer)
        summary(training$Superplasticizer)
}

question_4 <- function() {
        set.seed(3433)
        data(AlzheimerDisease)
        adData = data.frame(diagnosis,predictors)
        inTrain = createDataPartition(adData$diagnosis, p = 3/4)[[1]]
        training = adData[ inTrain,]
        testing = adData[-inTrain,]
        il_columns <- data.frame(column=colnames(training)) %>% select(column) %>% filter(startsWith(as.character(column), "IL"))
        il_dataset <- training[, unlist(il_columns)]
        preProcess(il_dataset, method = "pca", thresh = .8)
}

question_5 <- function() {
        set.seed(3433)
        data(AlzheimerDisease)
        adData = data.frame(diagnosis,predictors)
        inTrain = createDataPartition(adData$diagnosis, p = 3/4)[[1]]
        training = adData[ inTrain,]
        testing = adData[-inTrain,]
        il_columns <- data.frame(column=colnames(training)) %>% select(column) %>% filter(startsWith(as.character(column), "IL"))
        il_training <- training[, unlist(il_columns)]
        il_testing <- testing[, unlist(il_columns)]
        one_model <- train(il_training, training$diagnosis, method = "glm")
        pca_model <- train(il_training,
                           training$diagnosis,
                           preProcess = c("pca"),
                           method = "glm")
}

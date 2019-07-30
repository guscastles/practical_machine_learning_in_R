
create_sets <- function(dataset) {
        inTrain <- createDataPartition(y=dataset$wage, list=F, p=0.7)
        training <- dataset[inTrain,]
        testing <- dataset[-inTrain,]
        list(training, testing)
}

create_set_with_dummies <- function(dataset) {
        dummies <- dummyVars(wage ~ jobclass, data=dataset)
        dummiesPredict <- predict(dummies, newdata=dataset)
        position <- which("jobclass" == colnames(dataset))
        cbind(dataset[-position], dummiesPredict)
}

remove_near_zero_var_variables <- function(dataset) {
        nsv <- nearZeroVar(dataset)
        dataset[-nsv]
}

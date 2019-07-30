library(ISLR)
library(caret)
library(splines)
source("covariates_functions.R")
data(Wage)

datasets <- create_sets(Wage)
training <- datasets[[1]]
testing <- datasets[[2]]

trainingWithDummies <- remove_near_zero_var_variables(create_set_with_dummies(training))

bsBasis <- bs(training$age, df=3)

lm1 <- lm(wage ~ bsBasis, data=training)
plot(training$age, training$wage, pch=19, cex=0.5)
points(training$age, predict(lm1, newdata=training), col="red", pch=19, cex=0.5)

modelFit <- train(wage ~ ., data=trainingWithDummies, method="glm")

prediction <- predict(modelFit, remove_near_zero_var_variables(create_set_with_dummies(testing))[-12])

RMSE(pred = as.numeric(prediction), obs = unlist(testing['wage']))
mad(x = as.numeric(prediction) - unlist(testing['wage']))

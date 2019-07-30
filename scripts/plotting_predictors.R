library(ISLR)
library(caret)
data(Wage)

add_sex_feature <- function(dataset) {
    dataset$sex <- 'Male'
    dataset$sex <- factor(dataset$sex, levels=c('Male', 'Female'))
    return(dataset)
}

Wage <- add_sex_feature(Wage)
print(summary(Wage))

inTrain <- createDataPartition(y=Wage$wage, p=.75, list=F)
training <- Wage[inTrain,]
testing <- Wage[-inTrain,]

#modelFit <- train(wage ~ ., data=training, method="glm")

g <- featurePlot(x=training[,c('age', 'education', 'jobclass'),],
                 y=training$wage,
                 plot='pairs')

g2 <- qplot(age, wage, data=training)


qq <- qplot(age, wage, data=training, colour=education) +
      geom_smooth(method="lm", formula=y~x)

require(Hmisc)
cutWage <- cut2(training$wage, g=3)
print(table(cutWage))


p1 <- qplot(cutWage, age, data=training, fill=cutWage, geom=c("boxplot")) 
p2 <- qplot(cutWage, age, data=training, fill=cutWage,
            geom=c("boxplot", "jitter")) 
require(gridExtra)
grid.arrange(p1, p2, ncol=2)            


t1 <- table(cutWage, training$jobclass)
pt1 <- prop.table(t1, 1)

q2 <- qplot(wage, colour=education, data=training, geom="density")

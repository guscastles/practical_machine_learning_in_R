library(kernlab)

data(spam)

plot(density(spam$your[spam$type == 'nonspam']), col='Blue', main='', xlab="Frequency of 'your'")
lines(density(spam$your[spam$type == 'spam']), col='red')

data(spam)
plot(density(spam$your[spam$type == 'nonspam']))
plot(density(spam$your[spam$type == 'nonspam']), col='Bluie')
plot(density(spam$your[spam$type == 'nonspam']), col='Blue')
plot(density(spam$your[spam$type == 'nonspam']), col='Blue', main'')
plot(density(spam$your[spam$type == 'nonspam']), col='Blue', main='')
plot(density(spam$your[spam$type == 'nonspam']), col='Blue', main='', xlab="Frequency of 'your'")
line(density(spam$your[spam$type == 'spam']), col='Red')
line(density(spam$your[spam$type == 'spam']), col='red')
line(density(spam$your[spam$type == 'spam']), col='red')
plot(density(spam$your[spam$type == 'nonspam']), col='Blue', main='', xlab="Frequency of 'your'")
plot(density(spam$your[spam$type == 'spam']), col='red')
line(density(spam$your[spam$type == 'spam']), col='red')
plot(density(spam$your[spam$type == 'spam']), col='red')
plot(density(spam$your[spam$type == 'nonspam']), col='Blue', main='', xlab="Frequency of 'your'")
lines(density(spam$your[spam$type == 'spam']), col='red')
abline(v=0.5, col='green')
prediction <- ifelse(spam$your > 0.5, "spam", "nonspam")
str(prediction)
table(predcition)
table(prediction, spam$type)
table(prediction, spam$type)/length(spam$type)
pred_table <- table(prediction, spam$type)/length(spam$type)
pred_table
accuracy <- pred_table[1, 1] + pred_table[2, 2]
accuracy
help(table)
summary(pred_table)
prediction
spam
spam$your > -0.5
spam$your > 0.5
length(spam$your)
ls()
prediction
str(prediction)
type(predict())
type(prediction)
summary(prediction)
str(prediction)

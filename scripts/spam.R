library(kernlab)

data(spam)

plot(density(spam$your[spam$type == 'nonspam']), col='Blue', main='', xlab="Frequency of 'your'")
lines(density(spam$your[spam$type == 'spam']), col='red')
abline(v=0.5, col='green')

prediction <- ifelse(spam$your > 0.5, "spam", "nonspam")
pred_table <- table(prediction, spam$type)/length(spam$type)
accuracy <- pred_table[1, 1] + pred_table[2, 2]
print(round(accuracy, 3))

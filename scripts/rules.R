library(kernlab) 
data(spam); set.seed(333)
smallSpam <- spam[sample(dim(spam)[1], size = 10),]
spamLabel <- (smallSpam$type == "spam") * 1 + 1

plot_char <- function() {
    plot(smallSpam$capitalAve, col = spamLabel)
    abline(h=2.4, col='Green')
    abline(h=2.7, col='blue') 
    abline(h=2.8, col='red') 
}

rule1 <- function(x) {
    prediction <- rep(NA, length(x))
    prediction[x < 2.4] <- "nonspam"
    prediction[x > 2.7] <- "spam"
    prediction[x >= 2.40 & x <= 2.45] <- "spam"
    prediction[x > 2.45 & x <= 2.7] <- "nonspam"
    return(prediction)
}

rule2 <- function(x) {
    prediction <- rep(NA, length(x))
    prediction[x < 2.8] <- "nonspam"
    prediction[x >= 2.8] <- "spam"
    return(prediction)
}

print(table(rule1(smallSpam$capitalAve), smallSpam$type))
print(table(rule2(smallSpam$capitalAve), smallSpam$type))

plot_char()

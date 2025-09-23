#Author: Amrinder Singh; Date: 09/23/2025; Purpose: Test decision trees in R

#install pakage
install.packages("rpart")

library(rpart)

#load dummy data
kyphosis <- kyphosis

#create a decision tree
fit <- rpart(Kyphosis ~ Age + Number + Start, method="class", data=
kyphosis)

fit


#plot result
plot(fit, main="Classification plot for Kyphosis", uniform=TRUE)
text(fit, use.n=TRUE, all=TRUE, cex=.8)
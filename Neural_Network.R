#Author: Amrinder Singh, Date: 11/11/2025, Purpose: Implement Neural Networks 

#Load Library Caret 
library(caret)

#Load simple Dataset 
dataset <- iris 

# 80% split for training data and 20% split for validation data 
validation_index <- createDataPartition(dataset$Species, p=0.80, list=FALSE) 
validation <- dataset[-validation_index,] 
dataset <- dataset[validation_index,]

control <- trainControl(method="cv", number=10)
metric <- "Accuracy"

# Train the model using LDA/Linear Determinet Analysis
set.seed(7)

fit.lda <- train(Species~., data=dataset, method="lda", metric=metric, trControl=control)

set.seed(7)

fit.rf <- train(Species~., data=dataset, method="rf", metric=metric, trControl=control)


#summarize the accuracy of LDA models
results <- resamples(list(lda=fit.lda, rf=fit.rf))
summary(results)


#Based upon the accuracy values we choose lda model to do our prediction on the validaiton dataset.
predictions <- predict(fit.lda, validation)
confusionMatrix(predictions, validation$Species)



#Result
Confusion Matrix and Statistics

            Reference
Prediction   setosa versicolor virginica
  setosa         10          0         0
  versicolor      0          9         0
  virginica       0          1        10

Overall Statistics
                                          
               Accuracy : 0.9667          
                 95% CI : (0.8278, 0.9992)
    No Information Rate : 0.3333          
    P-Value [Acc > NIR] : 2.963e-13       
                                          
                  Kappa : 0.95            
                                          
 Mcnemar's Test P-Value : NA              

Statistics by Class:

                     Class: setosa Class: versicolor Class: virginica
Sensitivity                 1.0000            0.9000           1.0000
Specificity                 1.0000            1.0000           0.9500
Pos Pred Value              1.0000            1.0000           0.9091
Neg Pred Value              1.0000            0.9524           1.0000
Prevalence                  0.3333            0.3333           0.3333
Detection Rate              0.3333            0.3000           0.3333
Detection Prevalence        0.3333            0.3000           0.3667
Balanced Accuracy           1.0000            0.9500           0.9750
> 
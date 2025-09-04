# Author: Amrinder Singh; Date: Augn28, 2025; Purpose: Test simple linear regression

# Get some dummt dataset
cars <- mtcars

# Scatter plot on training data
scatter.smooth(x=cars$mpg, y=cars$disp, main ='SpeedVSdistance')

# calculate correlation value between mpg and disp
cor(cars$mpg, cars$disp)

# split training and testing set for regression
training_data <- cars[1:16,]
test_data <- cars[17:32,]

#Build a regression model
regression_result <- lm(mpg ~ disp, data=training_data)

#Predict regression funciton on test data
prediction_result <- predict(regression_result, test_data)

#result of prediction
actual_prediction_values <- data.frame(cbind(actuals=training_data$mpg, predicteds= prediction_result))
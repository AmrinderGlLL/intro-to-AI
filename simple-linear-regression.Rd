# Author: Amrinder Singh; Date: Aug 28, 2025; Purpose: Test simple linear regression

#Get some data
cars <- mtcars

#print first 5 cols
head(cars)

#Scatter plot on training data
scatter.smooth(x=cars$mpg, y=cars$disp, main="SpeedVsDistance")

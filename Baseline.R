# Borrowed from Kaggle competition below to serve as a baseline  
# https://www.kaggle.com/tannercarbonati/detailed-data-analysis-ensemble-modeling


library(ggplot2) # Data visualization
library(stringr) # Extracting string patterns
library(glmnet) # Ridge, LASSO, and elastinet
library(xgboost)
library(randomForest)
library(Metrics) # rmse
library(dplyr)
library(caret) # One hot encoding
library(scales) # Plotting $$
library(e1071) # Skewness
library(corrplot) # Correlation plot
library(readr) # To read csv function

train <- read_csv("train.csv")
test <- read_csv("test.csv")

require(ggplot2) # for data visualization
require(stringr) #extracting string patterns
require(Matrix) # matrix transformations
require(glmnet) # ridge, lasso & elastinet
require(xgboost) # gbm
require(randomForest)
require(Metrics) # rmse
require(dplyr) # load this in last so plyr doens't overlap it
require(caret) # one hot encoding
require(scales) # plotting $$
require(e1071) # skewness
require(corrplot) # correlation plot

# load the datasets
train <- read_csv("train.csv")
test <- read_csv("test.csv")

# combine the datasets 
df.combined <- rbind(within(train, rm('Id','SalePrice')), within(test, rm('Id')))
dim(df.combined)
summary(df.combined)

# remove missing values
na.cols <- which(colSums(is.na(df.combined)) > 0)

# sort the number of missing variables
sort(colSums(sapply(df.combined[na.cols], is.na)), decreasing = TRUE)

paste('There are', length(na.cols), 'columns with missing values')

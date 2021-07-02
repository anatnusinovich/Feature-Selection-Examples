# Example of Recursive Feature Elimination 
# Sources used: https://www.machinelearningplus.com/machine-learning/feature-selection/#6recursivefeatureeliminationrfe
#https://techcommunity.microsoft.com/t5/sql-server/feature-engineering-using-r/ba-p/385286

# View data 
str(mtcars)

# Load package (this will also load lattice, ggplot2)
install.packages("caret")
library(caret)

# Using RFE to predict the mpg given the features 
rfe_controller<- rfeControl(functions = lmFuncs, 
                            method = "repeatedcv",
                            repeats = 5, 
                            verbose = FALSE)
subsets<- c(1:10)
lm_Profiler<- rfe(mtcars[,2:11], mtcars[,1], 
                  sizes = subsets, 
                  rfeControl = rfe_controller)
lm_Profiler

## This should give you the results of recursive featurs election 
## and at the end the top three variables- wt, am, drat
## the best model size (in subsets) is three 




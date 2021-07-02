# Example of LASSO
# Source: https://www.machinelearningplus.com/machine-learning/feature-selection/#3lassoregression

install.packages("glmnet", dependencies = TRUE)
library(glmnet)
trainData<- read.csv('https://raw.githubusercontent.com/selva86/datasets/master/GlaucomaM.csv')

# Setting variables 
x<- as.matrix(trainData[,-63]) # all x variables
y<- as.double(as.matrix(ifelse(trainData[,63]=='normal',0,1))) # only class

# Fitting the LASSO model (where alpha=1)
set.seed(100)
cv.lasso<- cv.glmnet(x,y,
                     family='binomial',
                     alpha=1,
                     parallel = TRUE,
                     standardize= TRUE,
                     type.measure = 'auc')

# Plot results
plot(cv.lasso)

## Interpreting the plot 
## x-axis is the log of lambda
## the numbers at the top show how many predictors were included in the model 
## two dashed lines: left line points to the lambda with the lowest mean squared error 
## the right line points to the number of variables with the highest deviance within 1 standard deviation

# To see the best lambda value 
cv.lasso$lambda.min
cat('Min Lambda:', cv.lasso$lambda.min, '\n 1Sd Lambda:', cv.lasso$lambda.1se)
df_coef<- round(as.matrix(coef(cv.lasso,s=cv.lasso$lambda.min)),2)

# To see all the variables LASSO considered important
# High positive or low negative means this variable is more important
df_coef[df_coef[,1] !=0,]

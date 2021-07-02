# Example of Stepwise Regression Code 
# Source used: https://www.statology.org/stepwise-regression-r/

# View data
head(mtcars)
summary(mtcars)

# Using the function step(intercept-only model, direction, scope)
# Example 1: Forward Selection 

## Defining the intercept-only model
intercept_only<- lm(mpg~1, data=mtcars)

## Defining a model with all the predictors 
all<- lm(mpg~ ., data = mtcars)

## Performing forward selection (argument trace=0 tells R not to display the full results of the stepwise selection, which can take a lot of space if there are a large number of predictors)
forward<- step(intercept_only, direction = 'forward', scope = formula(all), trace=0)

## View the results of forward selection 
forward$anova

## View the final model- this is the model after the feature selection 
forward$coefficients

## Interpreting the results: We fit the model four times, beginning with an intercept-only model
## The model that produced the most significant reduction in AIC is the selected model 
## Thus the procedure is stopped after fitting a four-predictor model
## For backward selection use direction='backward' in the step function

# Example 2: Both-Direction Selection 

## Defining the intercept-only model 
intercept_only_2<- lm(mpg~1, data = mtcars)

## Defining a model with all the predictors
all2<- lm(mpg~., data = mtcars)

## Performing stepwise selection in both directions (forward and backward)
both2<- step(intercept_only_2,direction = 'both',scope = formula(all), trace = 0)

## View the results 
both2$anova

## View the final model 
both2$coefficients

## Interpreting the results: After fitting the intercept-only model, we add predictors to the model sequentially
## After each predictor is added, we also remove predictors that don't add improvement to the fit of the model 
## The process is repeated until reaching the final model
## Forward selection and both-direction selection produced the same final model 
## Backward selection might produce a different model